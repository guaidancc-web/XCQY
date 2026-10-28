-file("src/mod/skill/skill_life.erl", 1).

-module(skill_life).

-export([init/0,
         calc/2,
         cal_id_score/2,
         login/1,
         upgrade/2,
         upgrade/3,
         produce/2,
         produce/3,
         push/1,
         apply_evt/2,
         get_enhance_hp_lev/1,
         check_skill_level/2,
         upgrade_exp_skill/3,
         get_look_skill_lev/1,
         adm_show/1]).

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

-file("src/mod/skill/skill_life.erl", 26).

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

-file("src/mod/skill/skill_life.erl", 27).

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

-file("src/mod/skill/skill_life.erl", 28).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/skill/skill_life.erl", 29).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/skill/skill_life.erl", 30).

-file("inc/skill_life.hrl", 1).

-record(m_skill_life, {ver = 2, skills = []}).

-record(skill_life, {id = 0, lev = 0, exp = 0}).

-file("src/mod/skill/skill_life.erl", 31).

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

-file("src/mod/skill/skill_life.erl", 32).

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

-file("src/mod/skill/skill_life.erl", 33).

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

-file("src/mod/skill/skill_life.erl", 34).

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

-file("src/mod/skill/skill_life.erl", 35).

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

-file("src/mod/skill/skill_life.erl", 36).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/skill/skill_life.erl", 37).

init() ->
    Skills = [#skill_life{id = Id}
              || Id
                     <- [10000, 10001, 10005, 10006, 10007, 10008, 10009]],
    #m_skill_life{skills = Skills}.

get_enhance_hp_lev(#role{m_skill_life =
                             #m_skill_life{skills = Skills}}) ->
    case lists:keyfind(10008, #skill_life.id, Skills) of
        #skill_life{lev = Lev} -> Lev;
        _ -> 0
    end.

login(Role = #role{m_skill_life =
                       M = #m_skill_life{skills = Skills}}) ->
    L = [#trigger{label = evt_levup, a = [], m = skill_life,
                  f = apply_evt}],
    NewSkills = update_skills([10000,
                               10001,
                               10005,
                               10006,
                               10007,
                               10008,
                               10009],
                              Skills),
    Role1 = Role#role{m_skill_life =
                          M#m_skill_life{skills = NewSkills}},
    Role2 = update_tie_skills(Role1, no_push),
    {_, NRole} = role_trigger:add(L, Role2),
    {ok, NRole}.

apply_evt(#evt_levup{}, Role) ->
    Role1 = update_tie_skills(Role, push),
    {ok, Role1}.

update_tie_skills(Role = #role{lev = Lev,
                               m_skill_life =
                                   M = #m_skill_life{skills = Skills}},
                  IsPush) ->
    L1 = [{Id, min(Lev, Slv)}
          || {Id, Slv, LimitLv}
                 <- [{10007, 30, 30}, {10000, 15, 20}, {10001, 15, 20}],
             Lev >= LimitLv],
    case L1 of
        [_ | _] ->
            NewSkills = do_update_tie_skills(L1, Skills),
            Role1 = Role#role{m_skill_life =
                                  M#m_skill_life{skills = NewSkills}},
            case IsPush of
                push -> push(Role1);
                _ -> ok
            end,
            Role1;
        [] -> Role
    end.

push(#role{m_skill_life =
               #m_skill_life{skills = Skills},
           link = #link{conn_pid = ConnPid}}) ->
    sys_conn:pack_send(ConnPid, 10808, {Skills}).

calc(Ac,
     #role{m_skill_life = #m_skill_life{skills = All}}) ->
    do_calc(Ac, All).

do_calc(Ac, []) -> Ac;
do_calc(Ac, [#skill_life{id = Id, lev = Lev} | T]) ->
    case skill_life_data:get({Id, Lev}) of
        #{attr := AttrL = [_ | _]} ->
            NewAttrL = attr_type:to_attr(fixed, AttrL),
            case attr_type:do_attr(NewAttrL, Ac) of
                {false, Reason} ->
                    logger:error("生活技能属性计算出错[~w]:[~w]",
                                 [Id, Reason],
                                 skill_life,
                                 114),
                    do_calc(Ac, T);
                {ok, NewAc} -> do_calc(NewAc, T)
            end;
        _ -> do_calc(Ac, T)
    end.

cal_id_score(Id,
             #role{m_skill_life = #m_skill_life{skills = All}}) ->
    case lists:keyfind(Id, #skill_life.id, All) of
        #skill_life{lev = Lev} ->
            case skill_life_data:get({Id, Lev}) of
                #{attr := AttrL = [_ | _]} ->
                    Attr = attr_type:to_attr(fixed, AttrL),
                    attr:do_calc_item_score(Attr, 0);
                _ -> 0
            end;
        _ -> 0
    end.

upgrade(Role = #role{m_skill_life =
                         M = #m_skill_life{skills = Skills},
                     lev = RoleLev,
                     m_lev_break = #m_lev_break{times = Times}},
        Id) ->
    logger:debug("upgrade skill life:~w",
                 [Id],
                 skill_life,
                 141),
    case lists:keyfind(Id, #skill_life.id, Skills) of
        S = #skill_life{lev = Lev} ->
            case skill_life_data:get({Id, Lev + 1}) of
                #{open_lev := OpenLev, lev_break_times := NeedTimes,
                  name := Name}
                    when OpenLev > RoleLev andalso Times =:= NeedTimes ->
                    {false,
                     util:flist(lang:get("需要角色等级提升到~w级，才能升级 ~ts"),
                                [OpenLev, Name])};
                #{open_lev := OpenLev, lev_break_times := NeedTimes,
                  name := Name}
                    when OpenLev > RoleLev + 6 * Times andalso
                             Times > NeedTimes ->
                    {false,
                     util:flist(lang:get("需要角色等级提升到~w级，才能升级 ~ts"),
                                [OpenLev, Name])};
                #{lev_break_times := NeedTimes, name := Name}
                    when NeedTimes > Times ->
                    {false,
                     util:flist(lang:get("需要角色等级突破~w次，才能升级 ~ts"),
                                [NeedTimes, Name])};
                #{levup_cost := Cost, name := Name} ->
                    Loss = format:val_to_loss(Cost),
                    case role_gain:do(Loss, Role) of
                        {ok, Role1} ->
                            Role2 = Role1#role{m_skill_life =
                                                   M#m_skill_life{skills =
                                                                      lists:keyreplace(Id,
                                                                                       #skill_life.id,
                                                                                       Skills,
                                                                                       S#skill_life{lev
                                                                                                        =
                                                                                                        Lev
                                                                                                            +
                                                                                                            1})}},
                            CalcRole = attr:calc_and_push(Role2),
                            NewRole = role_trigger:fire(#evt_skill_life_levup{id
                                                                                  =
                                                                                  Id,
                                                                              lev
                                                                                  =
                                                                                  Lev
                                                                                      +
                                                                                      1},
                                                        CalcRole),
                            push(NewRole),
                            Msg = notice:format(lang:get("~ts 成功升级到~ts级"),
                                                [{string_2, 5, Name},
                                                 {string_2, 1, Lev + 1}]),
                            {ok, Msg, NewRole};
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        _ -> {false, lang:get("资源不足")}
                    end;
                _ -> {false, lang:get("技能已经提升至最高等级")}
            end;
        _ -> {false, lang:get("找不到技能")}
    end.

upgrade(Role = #role{m_skill_life =
                         M = #m_skill_life{skills = Skills}},
        Id, Num) ->
    logger:debug("技能id ~w", [Id], skill_life, 179),
    case lists:keyfind(Id, #skill_life.id, Skills) of
        S = #skill_life{lev = Lev} ->
            case acc_lev(#{id => Id, lev => Lev, num => Num,
                           cost => [], role => Role})
                of
                #{lev := NewLev, cost := Cost, name := Name,
                  role := Role1}
                    when NewLev > Lev ->
                    Role2 = Role1#role{m_skill_life =
                                           M#m_skill_life{skills =
                                                              lists:keyreplace(Id,
                                                                               #skill_life.id,
                                                                               Skills,
                                                                               S#skill_life{lev
                                                                                                =
                                                                                                NewLev})}},
                    CalcRole = attr:calc_and_push(Role2),
                    NewRole = role_trigger:fire(#evt_skill_life_levup{id =
                                                                          Id,
                                                                      lev =
                                                                          NewLev},
                                                CalcRole),
                    push(NewRole),
                    Msg = notice:format(lang:get("~ts 成功升级到~ts级"),
                                        [{string_2, 5, Name},
                                         {string_2, 1, NewLev}]),
                    notice:gl(format:val_to_loss(Cost), 3, NewRole),
                    {ok, Msg, NewRole};
                {false, Why} -> {false, Why};
                _R -> {false, lang:get("技能已经提升至最高等级")}
            end;
        _ -> {false, lang:get("找不到技能")}
    end.

upgrade_exp_skill(Role = #role{m_skill_life =
                                   #m_skill_life{skills = Skills}},
                  Id, Num) ->
    case lists:keyfind(Id, #skill_life.id, Skills) of
        #skill_life{lev = Lev} ->
            case skill_life_data:get({Id, Lev + 1}) of
                false -> {false, lang:get("技能已经达到满级")};
                _ -> do_upgrade_exp_skill(Role, Id, Num)
            end;
        _ -> {false, lang:get("未查询到此技能不能升级")}
    end.

get_look_skill_lev(#role{m_skill_life =
                             #m_skill_life{skills = Skills}}) ->
    case lists:keyfind(10009, #skill_life.id, Skills) of
        #skill_life{lev = Lev} -> Lev;
        _ -> 0
    end.

produce(Role = #role{m_skill_life =
                         #m_skill_life{skills = Skills},
                     classes = Classes},
        Id = 10007) ->
    case lists:keyfind(Id, #skill_life.id, Skills) of
        #skill_life{lev = Lev} ->
            case skill_life_data:get({Id, Lev}) of
                #{product := Product0, producing_cost := Cost} ->
                    Product = [P
                               || P = {_, _, _, Pclasses} <- Product0,
                                  Pclasses =:= 0 orelse Pclasses =:= Classes],
                    {BaseId, Val, _, _} = util:rand_list(Product, 3),
                    do_produce(Role,
                               #{base_id => BaseId, val => Val, lev => Lev,
                                 cost => Cost, id => Id});
                _R ->
                    logger:debug("生活技能没有配置 ~w",
                                 [{Id, _R}],
                                 skill_life,
                                 235),
                    {false, lang:get("没有生产资料")}
            end;
        _ -> {false, lang:get("找不到技能")}
    end;
produce(Role = #role{m_skill_life =
                         #m_skill_life{skills = Skills}},
        Id) ->
    case lists:keyfind(Id, #skill_life.id, Skills) of
        #skill_life{lev = Lev} ->
            case skill_life_data:get({Id, Lev}) of
                #{product := Product, producing_cost := Cost} ->
                    {BaseId, Val, _} = util:rand_list(Product, 3),
                    do_produce(Role,
                               #{base_id => BaseId, val => Val, lev => Lev,
                                 cost => Cost, id => Id});
                _R ->
                    logger:debug("生活技能没有配置 ~w",
                                 [{Id, _R}],
                                 skill_life,
                                 249),
                    {false, lang:get("没有生产资料")}
            end;
        _ -> {false, lang:get("找不到技能")}
    end.

produce(Role = #role{m_skill_life =
                         #m_skill_life{skills = Skills}},
        Id, BaseId)
    when Id =:= 10005 orelse Id =:= 10006 ->
    case lists:keyfind(Id, #skill_life.id, Skills) of
        #skill_life{lev = Lev} ->
            case skill_life_data:get({Id, Lev}) of
                #{product := Product, producing_cost := Cost} ->
                    case lists:keyfind(BaseId, 1, Product) of
                        {BaseId, Val, _} ->
                            case get_specific_cost(BaseId, Product, Cost) of
                                [] ->
                                    logger:error("消耗对应不上 ~w",
                                                 [{Id, BaseId}],
                                                 skill_life,
                                                 265),
                                    {false, lang:get("没有消耗材料")};
                                SpecCost ->
                                    do_produce(Role,
                                               #{base_id => BaseId, val => Val,
                                                 lev => Lev, cost => SpecCost,
                                                 id => Id})
                            end;
                        _ ->
                            logger:debug("生活技能没有配置 ~w", [Id], skill_life, 271),
                            {false, lang:get("没有生产资料")}
                    end;
                _R ->
                    logger:debug("生活技能没有配置 ~w",
                                 [{Id, _R}],
                                 skill_life,
                                 275),
                    {false, lang:get("没有生产资料")}
            end;
        _ -> {false, lang:get("找不到技能")}
    end;
produce(_Role, _Id, _BaseId) ->
    {false, lang:get("不是裁缝或打造技能")}.

check_skill_level(#role{m_skill_life =
                            #m_skill_life{skills = Skills}},
                  Lev) ->
    case lists:keyfind(10009, #skill_life.id, Skills) of
        #skill_life{lev = SkillLev} when SkillLev >= Lev ->
            true;
        _ -> false
    end.

acc_lev(Args = #{num := Num}) when Num < 1 -> Args;
acc_lev(Args = #{id := Id, lev := Lev, num := Num,
                 role :=
                     Role = #role{lev = RoleLev,
                                  m_lev_break = #m_lev_break{times = Times}},
                 cost := AccCost}) ->
    case skill_life_data:get({Id, Lev + 1}) of
        #{open_lev := OpenLev, lev_break_times := NeedTimes,
          name := Name}
            when Num =:= 10 andalso
                     OpenLev > RoleLev andalso Times =:= NeedTimes ->
            {false,
             util:flist(lang:get("需要角色等级提升到~w级，才能升级 ~ts"),
                        [OpenLev, Name])};
        #{open_lev := OpenLev, lev_break_times := NeedTimes,
          name := Name}
            when Num =:= 10 andalso
                     OpenLev > RoleLev + 6 * Times andalso
                         Times > NeedTimes ->
            {false,
             util:flist(lang:get("需要角色等级提升到~w级，才能升级 ~ts"),
                        [OpenLev, Name])};
        #{lev_break_times := NeedTimes, name := Name}
            when Num =:= 10 andalso NeedTimes > Times ->
            {false,
             util:flist(lang:get("需要角色等级突破~w次，才能升级 ~ts"),
                        [NeedTimes, Name])};
        #{name := Name, levup_cost := Cost, open_lev := OpenLev,
          lev_break_times := NeedTimes}
            when RoleLev >= OpenLev andalso Times >= NeedTimes ->
            Loss = format:val_to_loss(Cost),
            case role_gain:do(Loss, Role) of
                {ok, Role1} ->
                    NewCost = acc_cost(Cost, AccCost),
                    acc_lev(Args#{lev := Lev + 1, cost := NewCost,
                                  name => Name, num := Num - 1, role := Role1});
                {false, #loss{msg = Msg}} when Num =:= 10 ->
                    {false, Msg};
                _R -> Args
            end;
        _R -> Args
    end.

acc_cost([], Cost) -> Cost;
acc_cost([{Type, Add} | T], Cost) ->
    NewCost = case lists:keyfind(Type, 1, Cost) of
                  {Type, OldVal} ->
                      lists:keyreplace(Type, 1, Cost, {Type, OldVal + Add});
                  _ -> [{Type, Add} | Cost]
              end,
    acc_cost(T, NewCost).

do_produce(#role{p_bag = #package{free_cell = []}},
           #{id := Id})
    when Id =:= 10000 orelse Id =:= 10001 ->
    {false, lang:get("背包已满，请先整理背包")};
do_produce(Role = #role{pid = Pid,
                        m_family =
                            #m_family{family_effect = EffectInfo,
                                      cur_id = FamilyId}},
           #{base_id := BaseId, val := Val, lev := Lev,
             cost := Cost, id := Id}) ->
    BuffReduce = case
                     buff:is_special_effect_exists_two_param(Role, 33)
                     of
                     {true, ReduceValue, Id} -> ReduceValue;
                     _ -> 0
                 end,
    NewCost = [{Assets,
                round(AVal * (1000 - BuffReduce) / 1000)}
               || {Assets, AVal} <- Cost],
    Loss = format:val_to_loss(NewCost),
    Step = case skill_life_data:get_step({Lev, BaseId}) of
               false -> 0;
               Steps ->
                   {S, _} = util:rand_list(Steps, 2),
                   S
           end,
    BuffRate = case
                   buff:is_special_effect_exists_two_param(Role, 12)
                   of
                   {true, ValueAdd, Id} -> ValueAdd;
                   _ -> 0
               end,
    logger:debug("存在运势buff,~w%概率获得双倍道具",
                 [BuffRate div 10],
                 skill_life,
                 357),
    FamilyRate = case lists:keyfind(4, 1, EffectInfo) of
                     {_, RateVal} when Id =:= 10000 orelse Id =:= 10001 ->
                         RateVal;
                     _ -> 0
                 end,
    FamilyEnvRate = family_logic:get_env_effect(produce,
                                                FamilyId),
    PrayBuffResult = case util:rand(0, 1000) <
                              BuffRate + FamilyRate + FamilyEnvRate
                         of
                         true ->
                             NoticeMsg = notice:format("恭喜你获得了双份的~ts",
                                                       [{item_2, BaseId, Val}]),
                             {true, Val * 2, NoticeMsg};
                         _ -> {false, Val}
                     end,
    Gain = case PrayBuffResult of
               {true, Val1, _BuffMsg} ->
                   [#gain{label = item_base_id,
                          val =
                              [#{base_id => BaseId, quantity => Val1, bind => 0,
                                 step => Step}]}];
               {false, Val2} ->
                   [#gain{label = item_base_id,
                          val =
                              [#{base_id => BaseId, quantity => Val2, bind => 0,
                                 step => Step}]}]
           end,
    case role_gain:auto_overlap(Loss ++ Gain, Role) of
        {ok, NewRole, _, _} ->
            Msg = notice:format(lang:get("成功制造了~ts"),
                                [{item_2, BaseId}]),
            notice:send(Role, 3, Msg),
            notice:gain_item(Pid, 1, Gain),
            Val5 = case PrayBuffResult of
                       {true, Val3, BuffMsg1} ->
                           notice:send(Role, 3, BuffMsg1),
                           Val3;
                       {false, Val4} -> Val4
                   end,
            {ok,
             "",
             BaseId,
             role_trigger:fire(#evt_skill_life_produce{base_id =
                                                           BaseId,
                                                       num = Val5, id = Id},
                               NewRole)};
        {false, #loss{msg = Msg}} -> {false, Msg};
        {false, #gain{msg = Msg}} -> {false, Msg}
    end.

do_update_tie_skills([], Skills) -> Skills;
do_update_tie_skills([{Id, Slv} | T], Skills) ->
    case lists:keyfind(Id, #skill_life.id, Skills) of
        S = #skill_life{lev = Lev} when Lev < Slv ->
            Skills1 = lists:keyreplace(Id,
                                       #skill_life.id,
                                       Skills,
                                       S#skill_life{lev = Slv}),
            do_update_tie_skills(T, Skills1);
        _ -> do_update_tie_skills(T, Skills)
    end.

get_specific_cost(_, [], _) -> [];
get_specific_cost(_, _, []) -> [];
get_specific_cost(BaseId, [{BaseId, _, _} | _],
                  [H | _]) ->
    [H];
get_specific_cost(BaseId, [_ | T], [_ | Cost]) ->
    get_specific_cost(BaseId, T, Cost).

update_skills([], Skills) -> Skills;
update_skills([Id | T], Skills) ->
    case lists:keyfind(Id, #skill_life.id, Skills) of
        #skill_life{} -> update_skills(T, Skills);
        _ ->
            update_skills(T,
                          lists:keystore(Id,
                                         #skill_life.id,
                                         Skills,
                                         #skill_life{id = Id}))
    end.

calc_upgrade_loss(10009, Lev, Num) ->
    case skill_life_data:get({10009, Lev}) of
        #{levup_cost := Loss} ->
            NumLoss = [{Assets, Val * Num}
                       || {Assets, Val} <- Loss],
            format:val_to_loss(NumLoss);
        false -> ok
    end;
calc_upgrade_loss(_, _Lev, _Num) ->
    logger:error("计算技能消耗匹配错误", [], skill_life, 444),
    ok.

add_skill_life_exp(Role = #role{m_skill_life =
                                    MSkillLife = #m_skill_life{skills =
                                                                   Skills}},
                   Id, Num) ->
    case lists:keyfind(Id, #skill_life.id, Skills) of
        S = #skill_life{exp = Exp} ->
            AddExp = 120 * Num,
            UpSkill = #skill_life{lev = Lev} = skill_lev_up(Role,
                                                            Id,
                                                            S#skill_life{exp =
                                                                             Exp
                                                                                 +
                                                                                 AddExp}),
            UpgradeSkills = lists:keystore(Id,
                                           #skill_life.id,
                                           Skills,
                                           UpSkill),
            UpSkillRole = Role#role{m_skill_life =
                                        MSkillLife#m_skill_life{skills =
                                                                    UpgradeSkills}},
            NewRole = role_trigger:fire(#evt_skill_life_levup{id =
                                                                  Id,
                                                              lev = Lev},
                                        UpSkillRole),
            {true, NewRole, UpSkill};
        false -> {false, lang:get("没有查询到此生活技能")}
    end.

skill_lev_up(Role, 10009,
             S = #skill_life{lev = Lev, exp = Exp}) ->
    case skill_life_data:get({10009, Lev}) of
        #{exp_max := NeedExp} ->
            case Exp >= NeedExp andalso NeedExp =/= 0 of
                true ->
                    NewLevel = Lev + 1,
                    NewSkill = S#skill_life{lev = NewLevel,
                                            exp = Exp - NeedExp},
                    skill_lev_up(Role, 10009, NewSkill);
                false -> S
            end;
        _ -> S
    end;
skill_lev_up(_R, _, S) -> S.

do_upgrade_exp_skill(Role, Id, Num) ->
    do_upgrade_exp_skill(Role, Id, Num, reply).

do_upgrade_exp_skill(Role, _Id, 0, Reply) ->
    {ok, Reply, Role};
do_upgrade_exp_skill(Role = #role{m_skill_life =
                                      #m_skill_life{skills = Skills}},
                     Id, Num, Reply)
    when Num > 0 ->
    case lists:keyfind(Id, #skill_life.id, Skills) of
        #skill_life{lev = Lev} ->
            case calc_upgrade_loss(Id, Lev + 1, 1) of
                UpLoss = [_ | _] ->
                    case role_gain:do_notice(UpLoss, Role) of
                        {ok, LossRole} ->
                            case add_skill_life_exp(LossRole, Id, 1) of
                                {true,
                                 AddExpRole,
                                 #skill_life{exp = NowExp, lev = Lev}} ->
                                    Msg = notice:format(lang:get("幻化经验增加~ts点"),
                                                        [{string_2, 1, 120}]),
                                    notice:send(Role, 3, Msg),
                                    ReplyData = {[{10009, Lev, NowExp}]},
                                    do_upgrade_exp_skill(AddExpRole,
                                                         Id,
                                                         Num - 1,
                                                         ReplyData);
                                {true,
                                 AddExpRole,
                                 #skill_life{exp = NowExp, lev = NowLev}} ->
                                    Msg =
                                        notice:format(lang:get("恭喜！~ts成功提升到~ts级"),
                                                      [{string_2,
                                                        5,
                                                        lang:get("幻化之术")},
                                                       {string_2, 1, NowLev}]),
                                    notice:send(Role, 3, Msg),
                                    ReplyData = {[{10009, NowLev, NowExp}]},
                                    {ok, ReplyData, AddExpRole};
                                {false, Reason} -> {false, Reason}
                            end;
                        {false, #loss{msg = Msg}} when Reply =:= reply ->
                            {false, Msg};
                        {false, _} -> {ok, Reply, Role}
                    end;
                ok -> {ok, Reply, Role}
            end;
        false -> {false, lang:get("未查询到此技能不能升级")}
    end.

adm_show(_Role = #role{m_skill_life =
                           #m_skill_life{skills = Skills}}) ->
    List = adm_show(skill, Skills, []),
    {ok, List}.

adm_show(skill, [], List) -> List;
adm_show(Label = skill,
         [#skill_life{id = SkillId, lev = Lev} | T], List) ->
    SName = case skill_life_data:get({SkillId, Lev}) of
                #{name := Name} -> Name;
                _ -> ""
            end,
    Add = [{skill_id, SkillId}, {lev, Lev}, {name, SName}],
    adm_show(Label, T, [Add | List]);
adm_show(Label, [_ | T], List) ->
    adm_show(Label, T, List).

