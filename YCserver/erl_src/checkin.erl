-file("src/mod/checkin/checkin.erl", 1).

-module(checkin).

-export([init/0,
         login/1,
         reward_seven_day/2,
         reward_everyday/1,
         check_charge_day/2,
         sign/2,
         push/2,
         gm/2,
         repair_server_double/1,
         send_forget/1,
         push_day_charge/1,
         rand_reward/3,
         apply_evt/2,
         repeat_everyday/1]).

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

-file("src/mod/checkin/checkin.erl", 26).

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

-file("src/mod/checkin/checkin.erl", 27).

-file("inc/checkin.hrl", 1).

-record(checkin_everyday,
        {ver = 3,
         last_time = 0 :: non_neg_integer(),
         last_date = {0, 0, 0},
         signed = 0 :: non_neg_integer(),
         log = [],
         add_sign = 0,
         rand_reward = 0,
         rand_num = 0,
         rand_item = [],
         continue_num = 0}).

-record(m_checkin,
        {ver = 3,
         seven_day = [],
         everyday = #checkin_everyday{},
         charge_day = []}).

-record(checkin_rand_data,
        {id = 0,
         item_id = 0,
         bind = 0,
         num = 0,
         weigth = 0,
         is_cast = 0}).

-file("src/mod/checkin/checkin.erl", 28).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/checkin/checkin.erl", 29).

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

-file("src/mod/checkin/checkin.erl", 30).

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

-file("src/mod/checkin/checkin.erl", 31).

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

-file("src/mod/checkin/checkin.erl", 32).

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

-file("src/mod/checkin/checkin.erl", 33).

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

-file("src/mod/checkin/checkin.erl", 34).

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

-file("src/mod/checkin/checkin.erl", 35).

init() -> #m_checkin{}.

login(Role) ->
    L = [#trigger{label = evt_pay, a = [], m = checkin,
                  f = apply_evt}],
    {_, NRole} = role_trigger:add(L, Role),
    {ok, SignRole} = do_sign(NRole, no_push),
    login2(SignRole).

login2(Role = #role{m_checkin =
                        #m_checkin{everyday =
                                       #checkin_everyday{rand_item = []}}}) ->
    {ok, Role};
login2(Role = #role{m_checkin =
                        MCheckin = #m_checkin{everyday =
                                                  EveryDay =
                                                      #checkin_everyday{rand_item
                                                                            =
                                                                            RandItems}}}) ->
    Reward = [{IItem, IBind, INum}
              || {IItem, IBind, INum, _} <- RandItems],
    Gain = format:val_to_gain(Reward),
    case role_gain:do_notice(Gain, Role) of
        {ok, NRole} ->
            NewEveryDay = EveryDay#checkin_everyday{rand_item = []},
            NewMCheckin = MCheckin#m_checkin{everyday =
                                                 NewEveryDay},
            NewRole = NRole#role{m_checkin = NewMCheckin},
            {ok, NewRole};
        {false, _} -> {ok, Role}
    end.

apply_evt(_, _) -> ok.

sign(Role, _) -> do_sign(Role, push).

reward_seven_day(Role = #role{m_checkin =
                                  Checkin = #m_checkin{seven_day = SevenDay},
                              classes = Classes, sex = Sex},
                 Day) ->
    case lists:keyfind(Day, 2, SevenDay) of
        {_Date, _Day, 1} -> {false, lang:get("该奖励已经领取")};
        {Date, Day, 0} ->
            case checkin_data:get_seven_day(Day) of
                L when is_list(L) ->
                    L1 = [{Id, B, Num}
                          || {Id, Num, C, S, B} <- L,
                             (C =:= 0 orelse C =:= Classes) andalso
                                 (S =:= 2 orelse S =:= Sex)],
                    Gain = format:val_to_gain(L1),
                    Role1 = Role#role{m_checkin =
                                          Checkin#m_checkin{seven_day =
                                                                lists:keyreplace(Day,
                                                                                 2,
                                                                                 SevenDay,
                                                                                 {Date,
                                                                                  Day,
                                                                                  1})}},
                    case role_gain:do_notice(Gain, Role1) of
                        {ok, NewRole} ->
                            notice:gain_item(Role, Gain),
                            push(NewRole, 14100),
                            {ok, NewRole};
                        {false, #gain{msg = Msg}} -> {false, Msg};
                        _Err ->
                            logger:error("未知奖励错误 ~w", [_Err], checkin, 121),
                            {false, lang:get("领取失败")}
                    end;
                _ -> {false, lang:get("现在不能领取")}
            end;
        _ -> {false, lang:get("你确定那天有登录?")}
    end.

check_charge_day(Role = #role{m_checkin =
                                  Checkin = #m_checkin{seven_day = SevenDay,
                                                       charge_day = ChargeDay}},
                 Id) ->
    DayCharge = var:get_var(Role, day, 87, 0),
    case lists:keyfind(Id, 2, ChargeDay) of
        {_Day, Id} -> {false, lang:get("该奖励已经领取")};
        false ->
            Today = erlang:date(),
            case checkin_data:get_charge_day(Id) of
                {Day, ChargeVal, Reward} when ChargeVal =< DayCharge ->
                    case lists:keyfind(Day, 2, SevenDay) of
                        {RewardDate, _, _} ->
                            case RewardDate =:= Today of
                                true ->
                                    NewReward = [{Assets, 0, Val}
                                                 || {Assets, Val} <- Reward],
                                    Gain = format:val_to_gain(NewReward),
                                    Role1 = Role#role{m_checkin =
                                                          Checkin#m_checkin{charge_day
                                                                                =
                                                                                lists:keystore(Id,
                                                                                               2,
                                                                                               ChargeDay,
                                                                                               {Day,
                                                                                                Id})}},
                                    case role_gain:do_notice(Gain, Role1) of
                                        {ok, NewRole} ->
                                            notice:gain_item(Role, Gain),
                                            push(NewRole, 14104),
                                            {ok, NewRole};
                                        {false, #gain{msg = Msg}} ->
                                            {false, Msg};
                                        _Err ->
                                            logger:error("未知奖励错误 ~w",
                                                         [_Err],
                                                         checkin,
                                                         160),
                                            {false, lang:get("领取失败")}
                                    end;
                                false -> {false, lang:get("奖励已经过期，无法领取")}
                            end;
                        _ -> {false, lang:get("登录天数不足，请明日再来")}
                    end;
                {_, _, _} -> {false, lang:get("您未达成充值条件，不能进行领取")};
                _ -> {false, lang:get("配置没有找到")}
            end
    end.

rand_reward(Role = #role{m_checkin =
                             MCheckin = #m_checkin{everyday =
                                                       EveryDay =
                                                           #checkin_everyday{signed
                                                                                 =
                                                                                 Signed,
                                                                             rand_reward
                                                                                 =
                                                                                 RandReward,
                                                                             rand_num
                                                                                 =
                                                                                 RandNum,
                                                                             rand_item
                                                                                 =
                                                                                 RandItems,
                                                                             last_date
                                                                                 =
                                                                                 {Y,
                                                                                  M,
                                                                                  _}}}},
            _Type = 1, TNum) ->
    Today = erlang:date(),
    case Today of
        {Y, M, _} when RandReward > 0 ->
            MaxNum = 17,
            Num = case TNum of
                      1 -> 1;
                      _ -> 4
                  end,
            List = case RandNum + Num > MaxNum of
                       true ->
                           [RandNum + Num - MaxNum,
                            RandNum + Num - MaxNum + 1,
                            RandNum + Num - MaxNum + 2];
                       false when RandNum + Num == MaxNum -> [MaxNum, 1, 2];
                       false when RandNum + Num + 1 == MaxNum ->
                           [RandNum + Num, MaxNum, 1];
                       _ ->
                           [RandNum + Num, RandNum + Num + 1, RandNum + Num + 2]
                   end,
            RandData = [checkin_data:get_rand(I) || I <- List],
            case util:rand_list(RandData, #checkin_rand_data.weigth)
                of
                #checkin_rand_data{id = Id, item_id = ItemId,
                                   bind = Bind, num = NNum, is_cast = IsCast} ->
                    NewRandItems = [{ItemId, Bind, NNum, IsCast}
                                    | RandItems],
                    Next = case Id of
                               MaxNum -> 0;
                               _ -> Id
                           end,
                    NewEveryDay = EveryDay#checkin_everyday{rand_reward =
                                                                RandReward - 1,
                                                            rand_num = Next,
                                                            rand_item =
                                                                NewRandItems},
                    NewMCheckin = MCheckin#m_checkin{everyday =
                                                         NewEveryDay},
                    NewRole = Role#role{m_checkin = NewMCheckin},
                    {ok, Id, NewRole};
                _Err -> {false, lang:get("没有找到配置")}
            end;
        {Y, M, _} -> rand_calc(Signed, 1, #{});
        _ -> rand_calc(0, 1, #{})
    end;
rand_reward(#role{m_checkin =
                      #m_checkin{everyday =
                                     #checkin_everyday{rand_item = []}}},
            _Type = 2, _TNum) ->
    {false, lang:get("没有奖励领取")};
rand_reward(Role = #role{m_checkin =
                             MCheckin = #m_checkin{everyday =
                                                       EveryDay =
                                                           #checkin_everyday{rand_item
                                                                                 =
                                                                                 RandItems =
                                                                                     [{CItemId,
                                                                                       CBind,
                                                                                       CNum,
                                                                                       IsCast}
                                                                                      | _]}}},
            _Type = 2, _TNum) ->
    Reward = [{IItem, IBind, INum}
              || {IItem, IBind, INum, _} <- RandItems],
    Gain = format:val_to_gain(Reward),
    case IsCast of
        1 ->
            notice:cast(all,
                        4,
                        notice:format(lang:get("~ts在签到抽奖中，抽到~ts"),
                                      [{role_2, Role},
                                       {item_2, [{CItemId, CBind, CNum}]}]));
        _ -> ignore
    end,
    case role_gain:do_notice(Gain, Role, lang:get("签到抽奖"))
        of
        {ok, NRole} ->
            NewEveryDay = EveryDay#checkin_everyday{rand_item = []},
            NewMCheckin = MCheckin#m_checkin{everyday =
                                                 NewEveryDay},
            NewRole = NRole#role{m_checkin = NewMCheckin},
            push(NewRole, {14102, 0}),
            {ok, NewRole};
        {false, _} ->
            Title = lang:get("签到抽奖"),
            Content = lang:get("恭喜你进行签到抽奖获得了以下奖励："),
            mail:send(Role, Title, Content, Reward),
            NewEveryDay = EveryDay#checkin_everyday{rand_item = []},
            NewMCheckin = MCheckin#m_checkin{everyday =
                                                 NewEveryDay},
            NewRole = Role#role{m_checkin = NewMCheckin},
            push(NewRole, {14102, 0}),
            {ok, NewRole}
    end;
rand_reward(_, _, _) -> {false, lang:get("参数错误")}.

repeat_everyday(Role = #role{m_checkin =
                                 Checkin = #m_checkin{everyday =
                                                          EveryDay =
                                                              #checkin_everyday{last_date
                                                                                    =
                                                                                    LastDate,
                                                                                log
                                                                                    =
                                                                                    Log,
                                                                                rand_reward
                                                                                    =
                                                                                    RandReward}}}) ->
    case erlang:date() of
        LastDate = {_, _, _} ->
            TodayChargeFlag = var:get_var(Role, day, 601, 0),
            case var:get_var(Role, day, 87, 0) of
                0 ->
                    {false,
                     lang:get("当天充值<color='#ffff00'>任意金额</color>签到可<color='#"
                              "ffff00'>额外获得</color>一次签到奖励")};
                Gold when TodayChargeFlag == 0 ->
                    case lists:keyfind(LastDate, 1, Log) of
                        {_, NewSigned} ->
                            LimitGold =
                                checkin_data:get_everyday_gold(NewSigned),
                            case checkin_data:get_everyday(NewSigned) of
                                _ when LimitGold == 0 ->
                                    {false, lang:get("今天不能再次领取")};
                                _
                                    when Gold < LimitGold andalso
                                             LimitGold == 1 ->
                                    {false,
                                     lang:get("当天充值<color='#ffff00'>任意金额</color>签到可<color='#"
                                              "ffff00'>额外获得</color>一次签到奖励")};
                                _ when Gold < LimitGold ->
                                    {false,
                                     notice:format(lang:get("当天充值~ts签到可<color='#ffff00'>额外获得</color>一次签到奖励"),
                                                   [{item_2,
                                                     [{90002, LimitGold}]}])};
                                L0 when is_list(L0) ->
                                    {NL1, RandFlag} = case [II
                                                            || II = {0, _}
                                                                   <- L0]
                                                          of
                                                          [] -> {[], false};
                                                          L1 -> {L1, true}
                                                      end,
                                    NewRandReard = case RandFlag of
                                                       true -> RandReward + 1;
                                                       _ -> RandReward
                                                   end,
                                    L = [{I, 0, N} || {I, N} <- L0 -- NL1],
                                    Gain = format:val_to_gain(L),
                                    NewEveryDay =
                                        EveryDay#checkin_everyday{last_time =
                                                                      date:unixtime(),
                                                                  rand_reward =
                                                                      NewRandReard},
                                    Role1 = Role#role{m_checkin =
                                                          Checkin#m_checkin{everyday
                                                                                =
                                                                                NewEveryDay}},
                                    case role_gain:do_notice(Gain, Role1) of
                                        {ok, NewRole} ->
                                            notice:gain_item(Role, Gain),
                                            rand_notice(Role,
                                                        #{flag => RandFlag,
                                                          repeat => true}),
                                            NewRole1 = var:set_var(NewRole,
                                                                   day,
                                                                   601,
                                                                   1),
                                            push(NewRole1, {14102, 0}),
                                            push(NewRole1, 14100),
                                            {ok, NewRole1};
                                        {false, #gain{msg = Msg}} ->
                                            {false, Msg};
                                        _Err ->
                                            logger:error("未知奖励错误 ~w",
                                                         [_Err],
                                                         checkin,
                                                         296),
                                            {false, lang:get("领取失败")}
                                    end;
                                _ -> {false, lang:get("现在不能领取")}
                            end;
                        _ -> {false, lang:get("没有找到今天数据")}
                    end;
                _ -> {false, lang:get("今天已领取")}
            end;
        _ -> {false, lang:get("今天还没有签到")}
    end.

reward_everyday(Role = #role{m_checkin =
                                 Checkin = #m_checkin{everyday =
                                                          EveryDay =
                                                              #checkin_everyday{last_date
                                                                                    =
                                                                                    LastDate =
                                                                                        {Y,
                                                                                         M,
                                                                                         D},
                                                                                signed
                                                                                    =
                                                                                    Signed,
                                                                                log
                                                                                    =
                                                                                    Log,
                                                                                add_sign
                                                                                    =
                                                                                    AddSign,
                                                                                rand_reward
                                                                                    =
                                                                                    RandReward}}}) ->
    PrivilegeSign = privilege:get_val(Role, 102),
    case erlang:date() of
        LastDate = {_, _, _}
            when PrivilegeSign > AddSign andalso D > Signed ->
            NewSigned = Signed + 1,
            NAddSign = AddSign + 1,
            case checkin_data:get_everyday(NewSigned) of
                L0 when is_list(L0) ->
                    {NL1, RandFlag} = case [II || II = {0, _} <- L0] of
                                          [] -> {[], false};
                                          L1 -> {L1, true}
                                      end,
                    NewRandReard = case RandFlag of
                                       true -> RandReward + 1;
                                       _ -> RandReward
                                   end,
                    L = [{I, 0, N} || {I, N} <- L0 -- NL1],
                    Gain = format:val_to_gain(L),
                    NewEveryDay = EveryDay#checkin_everyday{last_time =
                                                                date:unixtime(),
                                                            signed = NewSigned,
                                                            add_sign = NAddSign,
                                                            rand_reward =
                                                                NewRandReard},
                    Role1 = Role#role{m_checkin =
                                          Checkin#m_checkin{everyday =
                                                                NewEveryDay}},
                    case role_gain:do_notice(Gain, Role1, lang:get("补签成功"))
                        of
                        {ok, NewRole} ->
                            notice:gain_item(Role, Gain),
                            rand_notice(Role, #{flag => RandFlag}),
                            push(NewRole, {14102, 0}),
                            push(NewRole, 14100),
                            {ok, NewRole};
                        {false, #gain{msg = Msg}} -> {false, Msg};
                        _Err ->
                            logger:error("未知奖励错误 ~w", [_Err], checkin, 351),
                            {false, lang:get("领取失败")}
                    end;
                _ -> {false, lang:get("现在不能领取")}
            end;
        LastDate when PrivilegeSign =< AddSign ->
            {false, lang:get("你是全勤，不用补签了")};
        LastDate -> {false, lang:get("你今日已经签到过了")};
        Today = {TY, TM, _D} ->
            NEveryDay = #checkin_everyday{signed = NewSigned,
                                          add_sign = NAddSign,
                                          rand_reward = TRandReward,
                                          continue_num = ContinueNum} =
                            case {TY, TM} of
                                {Y, M} ->
                                    EveryDay#checkin_everyday{signed =
                                                                  Signed + 1};
                                _ ->
                                    EveryDay#checkin_everyday{signed = 1,
                                                              add_sign = 0,
                                                              rand_reward = 0,
                                                              rand_num = 0,
                                                              rand_item = [],
                                                              continue_num = 0}
                            end,
            case checkin_data:get_everyday(NewSigned) of
                L when is_list(L) ->
                    {NL1, RandFlag} = case [II || II = {0, _} <- L] of
                                          [] -> {[], false};
                                          L1 -> {L1, true}
                                      end,
                    NRandReard = case RandFlag of
                                     true -> TRandReward + 1;
                                     _ -> TRandReward
                                 end,
                    ItemList = L -- NL1,
                    Gain = format:val_to_gain(ItemList),
                    LastSec = case LastDate < {1970, 1, 1} of
                                  true -> 0;
                                  _ ->
                                      date:datetime_to_seconds({LastDate,
                                                                {0, 0, 0}})
                              end,
                    NewContinueNum = case date:datetime_to_seconds({Today,
                                                                    {0, 0, 0}})
                                              - LastSec
                                              =< 86400
                                         of
                                         true -> ContinueNum + 1;
                                         _ -> 1
                                     end,
                    case role_gain:do_notice(Gain, Role, lang:get("签到成功"))
                        of
                        {ok, NRole} ->
                            notice:gain_item(Role, Gain),
                            NNRole = NRole,
                            rand_notice(Role, #{flag => RandFlag}),
                            NewRandReard = NRandReard,
                            NewEveryDay = NEveryDay#checkin_everyday{last_date =
                                                                         Today,
                                                                     last_time =
                                                                         date:unixtime(),
                                                                     signed =
                                                                         NewSigned,
                                                                     log =
                                                                         lists:keystore(Today,
                                                                                        1,
                                                                                        Log,
                                                                                        {Today,
                                                                                         NewSigned}),
                                                                     add_sign =
                                                                         NAddSign,
                                                                     rand_reward
                                                                         =
                                                                         NewRandReard,
                                                                     continue_num
                                                                         =
                                                                         NewContinueNum},
                            NewRole = NNRole#role{m_checkin =
                                                      Checkin#m_checkin{everyday
                                                                            =
                                                                            NewEveryDay}},
                            push(NewRole, {14102, 0}),
                            push(NewRole, 14100),
                            {ok,
                             role_trigger:fire(#evt_everyday{val = NewSigned},
                                               NewRole)};
                        {false, #gain{msg = Msg}} -> {false, Msg};
                        _Err ->
                            logger:error("未知奖励错误 ~w", [_Err], checkin, 433),
                            {false, lang:get("领取失败")}
                    end;
                _ -> {false, lang:get("现在不能领取")}
            end
    end.

push(#role{m_checkin = #m_checkin{seven_day = L},
           link = #link{conn_pid = ConnPid}},
     Cmd = 14100) ->
    sys_conn:pack_send(ConnPid, Cmd, {L});
push(Role = #role{m_checkin =
                      #m_checkin{everyday =
                                     EveryDay = #checkin_everyday{last_time =
                                                                      LastTime,
                                                                  continue_num =
                                                                      ContinueNum,
                                                                  last_date =
                                                                      {Y, M, _},
                                                                  log = Log,
                                                                  add_sign =
                                                                      AddSign}},
                  link = #link{conn_pid = ConnPid}},
     {Cmd = 14102, Flag}) ->
    Date = {TY, TM, _} = erlang:date(),
    #checkin_everyday{signed = NewSigned,
                      rand_reward = RandReward, rand_num = RandNum} =
        case Date of
            {Y, M, _} -> EveryDay;
            _ ->
                EveryDay#checkin_everyday{signed = 0, rand_reward = 0,
                                          rand_num = 0}
        end,
    Log1 = [D
            || D = {{LY, LM, _}, _} <- Log,
               LY =:= TY andalso LM =:= TM],
    PrivilegeSign = privilege:get_val(Role, 102),
    TodayFlag = var:get_var(Role, day, 601, 0),
    Data = {NewSigned,
            LastTime,
            Log1,
            Flag,
            max(PrivilegeSign - AddSign, 0),
            RandReward,
            RandNum,
            ContinueNum,
            TodayFlag},
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(Role = #role{m_checkin =
                      #m_checkin{charge_day = ChargeDay}},
     Cmd = 14104) ->
    role:link_send(Role, Cmd, {ChargeDay}).

gm(Role = #role{m_checkin =
                    Checkin = #m_checkin{everyday =
                                             EveryDay = #checkin_everyday{log =
                                                                              Log}}},
   clear_everyday) ->
    Day = erlang:date(),
    NewRole = Role#role{m_checkin =
                            Checkin#m_checkin{everyday =
                                                  EveryDay#checkin_everyday{log
                                                                                =
                                                                                lists:keystore(Day,
                                                                                               1,
                                                                                               Log,
                                                                                               {Day,
                                                                                                0}),
                                                                            last_time
                                                                                =
                                                                                0,
                                                                            last_date
                                                                                =
                                                                                {0,
                                                                                 0,
                                                                                 0},
                                                                            rand_reward
                                                                                =
                                                                                0,
                                                                            rand_num
                                                                                =
                                                                                0,
                                                                            continue_num
                                                                                =
                                                                                0,
                                                                            rand_item
                                                                                =
                                                                                []}}},
    push(NewRole, {14102, 0}),
    {ok, NewRole};
gm(Role = #role{m_checkin =
                    Checkin = #m_checkin{everyday =
                                             EveryDay =
                                                 #checkin_everyday{rand_reward =
                                                                       RandReward}}},
   add_rand) ->
    NewRole = Role#role{m_checkin =
                            Checkin#m_checkin{everyday =
                                                  EveryDay#checkin_everyday{rand_reward
                                                                                =
                                                                                RandReward
                                                                                    +
                                                                                    1}}},
    push(NewRole, {14102, 0}),
    {ok, NewRole};
gm(Role = #role{m_checkin =
                    Checkin = #m_checkin{everyday =
                                             EveryDay = #checkin_everyday{}}},
   before) ->
    LastTime = date:unixtime() - 86400,
    {Day, _} = date:seconds_to_datetime(LastTime),
    NewRole = Role#role{m_checkin =
                            Checkin#m_checkin{everyday =
                                                  EveryDay#checkin_everyday{last_date
                                                                                =
                                                                                Day,
                                                                            last_time
                                                                                =
                                                                                LastTime}}},
    push(NewRole, {14102, 0}),
    {ok, NewRole};
gm(Role = #role{m_checkin = Checkin}, gen_seven) ->
    {Y, M, _} = erlang:date(),
    NewRole = Role#role{m_checkin =
                            Checkin#m_checkin{seven_day =
                                                  [{{Y, M, D}, D, 0}
                                                   || D <- lists:seq(1, 8)]}},
    push(NewRole, 14100),
    {ok, NewRole};
gm(Role = #role{m_checkin =
                    Checkin = #m_checkin{seven_day = SevenDay}},
   add_seven_day) ->
    {Y, M, D} = erlang:date(),
    NewSevenDay = case length(SevenDay) of
                      Done when Done >= 8 -> SevenDay;
                      Done ->
                          Produce = [{{Y, M, PDay}, PDay, 0}
                                     || PDay <- lists:seq(1, Done)],
                          case lists:keyfind({Y, M, D}, 1, Produce) of
                              {_, OldD, 0} ->
                                  NProduce = [{{Y, M, Done + 1}, OldD, 0}
                                              | Produce],
                                  lists:keystore({Y, M, D},
                                                 1,
                                                 NProduce,
                                                 {{Y, M, D}, Done + 1, 0});
                              _ -> [{{Y, M, D}, Done + 1, 0} | Produce]
                          end
                  end,
    NewRole = Role#role{m_checkin =
                            Checkin#m_checkin{seven_day = NewSevenDay}},
    push(NewRole, {14102, 0}),
    push(NewRole, 14100),
    {ok, NewRole};
gm(Role = #role{m_checkin = Checkin},
   clean_charge_day) ->
    NewRole = Role#role{m_checkin =
                            Checkin#m_checkin{charge_day = []}},
    push(NewRole, 14104),
    {ok, NewRole}.

do_sign(Role = #role{m_checkin =
                         Checkin = #m_checkin{seven_day = SevenDay,
                                              everyday =
                                                  EveryDay =
                                                      #checkin_everyday{log =
                                                                            Log}}},
        IsPush) ->
    Date = {Y, M, _} = erlang:date(),
    NewSevenDay = case length(SevenDay) of
                      Done when Done >= 8 -> SevenDay;
                      Done ->
                          case lists:keyfind(Date, 1, SevenDay) of
                              {_, _, _} -> SevenDay;
                              _ ->
                                  lists:keystore(Date,
                                                 1,
                                                 SevenDay,
                                                 {Date, Done + 1, 0})
                          end
                  end,
    RepairSevenDay = repair_server_double(NewSevenDay),
    Log1 = [D
            || D = {{LY, LM, _}, _} <- Log,
               LY =:= Y andalso LM =:= M],
    NewLog = case lists:keyfind(Date, 1, Log1) of
                 {_, _} -> Log1;
                 _ -> lists:keystore(Date, 1, Log1, {Date, 0})
             end,
    NewRole = Role#role{m_checkin =
                            Checkin#m_checkin{seven_day = RepairSevenDay,
                                              everyday =
                                                  EveryDay#checkin_everyday{log
                                                                                =
                                                                                NewLog}}},
    case IsPush of
        push -> push(NewRole, {14102, 0});
        _ -> ok
    end,
    {ok, NewRole}.

repair_server_double(SevenDay) ->
    case length([true
                 || {_, Day, _} <- SevenDay, Day =:= 7])
             >= 2
        of
        true ->
            case lists_ext:multikeyfind([{7, 2}, {0, 3}], SevenDay)
                of
                {{Y, M, D}, _, _} ->
                    lists_ext:multikeystore([{7, 2}, {0, 3}],
                                            SevenDay,
                                            {{Y, M, D + 1}, 8, 0});
                _ -> SevenDay
            end;
        false -> SevenDay
    end.

send_forget(Role = #role{m_checkin =
                             #m_checkin{seven_day = SevenDay}}) ->
    Done = length(SevenDay),
    DayCharge = var:get_var(Role, day, 87, 0),
    IdList = checkin_data:get_day_charge(Done),
    Fun = fun (Id,
               RtnRole = #role{m_checkin =
                                   Checkin = #m_checkin{charge_day =
                                                            ChargeDay}}) ->
                  case lists:keyfind(Id, 2, ChargeDay) of
                      {_, Id} -> RtnRole;
                      _ ->
                          case checkin_data:get_charge_day(Id) of
                              {Day, ChargeVal, Reward}
                                  when ChargeVal =< DayCharge ->
                                  Title = lang:get("充值奖励"),
                                  Content =
                                      lang:get("由于您昨日未领取已充值的福利奖励，现通过邮件发放给您，请查收:"),
                                  UnbindReward = [{Assets, 0, Val}
                                                  || {Assets, Val} <- Reward],
                                  mail:send(RtnRole,
                                            #{title => Title,
                                              content => Content,
                                              items => UnbindReward}),
                                  NewRole = RtnRole#role{m_checkin =
                                                             Checkin#m_checkin{charge_day
                                                                                   =
                                                                                   lists:keystore(Id,
                                                                                                  2,
                                                                                                  ChargeDay,
                                                                                                  {Day,
                                                                                                   Id})}},
                                  NewRole;
                              {_, _, _} -> RtnRole;
                              _ -> RtnRole
                          end
                  end
          end,
    lists:foldl(Fun, Role, IdList).

push_day_charge(Role) ->
    DayCharge = var:get_var(Role, day, 87, 0),
    logger:debug("===推送每日充值======:~w",
                 [DayCharge],
                 checkin,
                 618),
    camp_new_acc_charge:push(Role),
    role:link_send(Role, 14106, {DayCharge}).

rand_notice(Role, #{flag := true, repeat := true}) ->
    notice:send(Role, 3, lang:get("恭喜你！额外获得一次抽奖机会！"));
rand_notice(Role, #{flag := true}) ->
    notice:send(Role, 3, lang:get("获得一次抽奖机会！"));
rand_notice(_Role, _) -> ok.

rand_calc(Signed, Num, Args) ->
    NewSigned = Signed + 1,
    case checkin_data:get_everyday(Signed) of
        [{0, _} | _] ->
            {false,
             notice:format(lang:get("再签到~ts次即可抽奖{face_1,3}"),
                           [{string_2, 5, Num}])};
        [_ | _] -> rand_calc(NewSigned, Num + 1, Args);
        _ -> {false, lang:get("下个月继续努力签到{face_1,3}")}
    end.

