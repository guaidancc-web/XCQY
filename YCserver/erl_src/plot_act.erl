-file("src/mod/plot/plot_act.erl", 1).

-module(plot_act).

-export([continue/1,
         continue_event/3,
         do_play/5,
         event/3,
         apply_event/3,
         exec/2,
         get_end_plot_act/0,
         handle_next/1,
         handle_timeout/3,
         handle_timer/2,
         handle_confirm/3,
         handle_prompt/3,
         init_cli/1,
         map_update/1,
         next/1,
         next_continue/2,
         skip/2,
         dec_pause/1]).

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

-file("src/mod/plot/plot_act.erl", 29).

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

-file("src/mod/plot/plot_act.erl", 30).

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

-file("src/mod/plot/plot_act.erl", 31).

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

-file("src/mod/plot/plot_act.erl", 32).

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

-file("src/mod/plot/plot_act.erl", 33).

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

-file("src/mod/plot/plot_act.erl", 34).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/mod/plot/plot_act.erl", 35).

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

-file("src/mod/plot/plot_act.erl", 36).

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

-file("src/mod/plot/plot_act.erl", 37).

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

-file("src/mod/plot/plot_act.erl", 38).

-file("inc/skill.hrl", 1).

-record(m_skill,
        {ver = 6 :: pos_integer(),
         skills = [] :: [{non_neg_integer(), non_neg_integer()}],
         is_open_skl_prac = 0 :: 0 | 1,
         selected_skl_prac = 0 :: non_neg_integer(),
         skill_prac = [] :: list(),
         skill_couple = [] :: list(),
         skill_sworn = [] :: list(),
         speed = [] :: list(),
         skill_unique = [],
         skill_clsld_done = [],
         unique_coolddown_time = 0,
         skl_unique_point = 100,
         sq_double = 0,
         is_open_sq_double = 0,
         sq_exp_statistics = []}).

-record(role_base_skill,
        {id = 0,
         lev = 0,
         type :: undefined | non_neg_integer(),
         sub_type :: undefined | non_neg_integer(),
         max_lev = 0,
         name = "",
         way = 1,
         study_lev = 1,
         cost = [],
         attr = []}).

-record(skill,
        {id = 0,
         lev = 0,
         type = 0 :: non_neg_integer(),
         sub_type = 0 :: non_neg_integer(),
         speed = 1,
         name = "",
         acc_ratio = 1000,
         acc_low = 0,
         acc_high = 1000,
         attack_type = 0 :: non_neg_integer(),
         elem_type = 0 :: non_neg_integer(),
         target_type = 1 :: non_neg_integer(),
         attack_times = 1 :: non_neg_integer(),
         target_list = [],
         self_cond = [],
         self_loss = [],
         target_cond = [],
         dmg_addt = 0 :: non_neg_integer(),
         dmg_ratio = [1000] :: non_neg_integer(),
         pre_cooldown = 0,
         cooldown = 0 :: non_neg_integer(),
         cost_mp = 0 :: non_neg_integer(),
         cost_anger = 0,
         cost_other = [] :: [{atom(), non_neg_integer()}],
         buff_self = [] :: [tuple()],
         buff_target = [] :: [tuple()],
         script_id = 0 :: non_neg_integer(),
         script_args = [] :: [integer()],
         addt_scripts = [] ::
             [{non_neg_integer(), non_neg_integer(), list()}],
         play_time = 0 :: non_neg_integer()}).

-record(chief_classes,
        {leader_id = 0,
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         looks = []}).

-record(sq_exp_statistics,
        {combat_type = 0, times = 0, gain = 0, real_gain = 0}).

-file("src/mod/plot/plot_act.erl", 39).

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

-file("src/mod/plot/plot_act.erl", 40).

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

-file("src/mod/plot/plot_act.erl", 41).

-file("inc/wing.hrl", 1).

-record(m_wing,
        {ver = 11 :: pos_integer(),
         grade = 0 :: non_neg_integer(),
         growth = 0,
         enhance_num = 0,
         wing_id = 0,
         plot_wing_id = 0,
         expiry = [],
         tmp_grade = 0 :: non_neg_integer(),
         tmp_growth = 0,
         tmp_wing_id = 0,
         star_lev = 1 :: non_neg_integer(),
         valid_plan = 1,
         plan_data = [] :: list(),
         change_times = 0,
         reset_times = 0,
         lev_break_skill = [],
         wing_ids = [],
         exp = 0,
         old_grade = 0,
         old_star = 0,
         appearance_list = [],
         speed = 1,
         wing_group_list = [],
         wing_power = 100}).

-record(wing_skill_plan,
        {index = 1,
         plan_name = [] :: list(),
         skills = [],
         tmp_skills = []}).

-record(wing_lev_break_skill,
        {ver = 1,
         skill_grade = 0,
         skill_id = 0,
         skill_lev = 0,
         skill_val = 0}).

-record(wing_skill,
        {ver = 1, key = {0, 0}, id = 0, lev = 0, is_lock = 0}).

-record(wing_lock_data,
        {grade = 0, max = 0, item_list = []}).

-record(wing_appearance,
        {id = 0,
         time = 0,
         timeout = 0,
         grade = 0,
         star_lev = 0}).

-record(wing_base_group,
        {group_id = 0,
         need_grade = 0,
         wing_ids = [],
         grades = [],
         loss_item = []}).

-record(wing_group,
        {ver = 1,
         group_id = 0,
         wing_ids = [],
         wing_times = 0,
         rewarded = 0}).

-file("src/mod/plot/plot_act.erl", 42).

-spec continue(#role{}) -> #role{}.

continue(Role = #role{m_plot =
                          #m_plot{play_list = [Id | _] = PlayL}}) ->
    warn(PlayL, Role),
    case continue_event({continue_event}, Role, Id) of
        {ok, NRole = #role{}} -> NRole;
        _ -> Role
    end;
continue(Role) -> Role.

-spec next_continue(#role{},
                    ActId :: pos_integer()) -> #role{}.

next_continue(Role = #role{m_plot =
                               #m_plot{play_list = []}},
              _ActId) ->
    Role;
next_continue(Role = #role{}, ActId) ->
    case dec_pause(ActId) of
        true ->
            Role1 = next(Role),
            Role2 = del_timeout(Role1),
            continue(Role2);
        false ->
            logger:debug("=======================",
                         [],
                         plot_act,
                         108),
            Role
    end.

-spec next(#role{}) -> #role{}.

next(Role = #role{m_plot =
                      #m_plot{play_list = [Id | _], do_list = DoL0}}) ->
    logger:debug("Id:~w, DoL0:~w",
                 [Id, DoL0],
                 plot_act,
                 115),
    case lists:keyfind(Id, #plot.id, DoL0) of
        Plot = #plot{id = Id, num = Num, act_idx = ActIdx}
            when ActIdx > 0 ->
            Tri = #plot_trigger{num = MaxNum, action = Action} =
                      plot_data:get(Id),
            Role0 = #role{m_plot =
                              MPlot = #m_plot{finished = FinL,
                                              play_list = PlayL,
                                              do_list = DoL}} =
                        plot_revise:skip_next(ActIdx, Action, Role),
            if ActIdx >= length(Action) andalso
                   MaxNum > 0 andalso Num + 1 >= MaxNum ->
                   Role1 = Role0#role{m_plot =
                                          MPlot#m_plot{scene = [],
                                                       finished =
                                                           [Id | FinL -- [Id]],
                                                       play_list =
                                                           PlayL -- [Id],
                                                       do_list =
                                                           lists:keydelete(Id,
                                                                           #plot.id,
                                                                           DoL)}},
                   Role2 = plot_revise:reset_action(Role1),
                   end_plot(Plot, Tri, Role),
                   quest:flush(Role2, push);
               ActIdx >= length(Action) ->
                   Role1 = Role0#role{m_plot =
                                          MPlot#m_plot{scene = [],
                                                       play_list =
                                                           PlayL -- [Id],
                                                       do_list =
                                                           lists:keyreplace(Id,
                                                                            #plot.id,
                                                                            DoL,
                                                                            Plot#plot{num
                                                                                          =
                                                                                          Num
                                                                                              +
                                                                                              1,
                                                                                      act_idx
                                                                                          =
                                                                                          0})}},
                   end_plot(Plot, Tri, Role),
                   plot_revise:reset_action(Role1);
               true ->
                   Role0#role{m_plot =
                                  MPlot#m_plot{do_list =
                                                   lists:keyreplace(Id,
                                                                    #plot.id,
                                                                    DoL,
                                                                    Plot#plot{act_idx
                                                                                  =
                                                                                  ActIdx
                                                                                      +
                                                                                      1})}}
            end;
        _Err ->
            logger:debug("Err:~w", [_Err], plot_act, 135),
            Role
    end;
next(Role) -> Role.

-spec init_cli(#role{}) -> ok.

init_cli(Role = #role{m_plot =
                          #m_plot{hide_mode = _Hide, unit_list = UnitList,
                                  guide_list = GuideList, scene = Scene,
                                  quest_trace = _QuestTrace}}) ->
    L1 = [#plot_act{type =
                        plot_fun:act_to_type(plot_unit_create),
                    unit_id = Id, unit_base_id = UnitBaseId, msg = UnitName,
                    mapid = Map, x = X, y = Y, val = Dir, ext_msg = ActType,
                    looks = looks:check_looks(Looks), classes = Classes,
                    sex = Sex}
          || #plot_unit{id = Id, base_id = UnitBaseId,
                        name = UnitName, map = Map, x = X, y = Y, dir = Dir,
                        act_type = ActType, looks = Looks, classes = Classes,
                        sex = Sex}
                 <- UnitList],
    L2 = [#plot_act{type = plot_fun:act_to_type(play_guide),
                    val = Id}
          || Id <- GuideList],
    L4 = [PlotAct
          || PlotAct = #plot_act{skip_do = 1}
                 <- get_act_play_list()],
    L5 = lists:foldl(fun ({Label = camera_move_to,
                           Time,
                           X,
                           Y},
                          LL) ->
                             [#plot_act{type = plot_fun:act_to_type(Label),
                                        time = Time, x = X, y = Y}
                              | LL];
                         (_Act, LL) -> LL
                     end,
                     [],
                     Scene),
    L = L1 ++
            L2 ++
                L4 ++
                    L5 ++
                        [#plot_act{type = plot_fun:act_to_type(end_plot)}],
    role:link_send(Role, 11010, {0, "", 0, 0, L}),
    ok.

-spec skip(#role{}, 0..1) -> {ok, #role{}}.

skip(Role, SkipMod) ->
    put(plot_pause_flag, ok),
    do_skip(Role, [], SkipMod, ok).

do_skip(Role = #role{m_plot =
                         #m_plot{do_list = DoL, play_list = [PlotId | _]}},
        SkipActs, SkipMod, Flag)
    when Flag =/= force_pause ->
    case lists:keyfind(PlotId, #plot.id, DoL) of
        Plot = #plot{act_idx = ActIdx} when ActIdx > 0 ->
            case plot_data:get(PlotId) of
                Tri = #plot_trigger{can_skip = CanSkip, action = Action}
                    when CanSkip =:= 1 orelse SkipMod =:= 1 ->
                    put(plot_evt_doing, true),
                    put(plot_return_val, 1),
                    NRole = do_play({skip}, Role, Tri, Plot, false),
                    erase(plot_evt_doing),
                    NActIdx = case get(plot_act_idx) of
                                  N when N >= ActIdx -> N;
                                  _ -> 9999
                              end,
                    DoAction = lists:sublist(Action,
                                             ActIdx,
                                             NActIdx - ActIdx),
                    logger:debug("角色[~ts]跳过剧情:~w ActIdx:~w NewActIdx:~w",
                                 [Role#role.name,
                                  PlotId,
                                  ActIdx,
                                  get(plot_act_idx)],
                                 plot_act,
                                 179),
                    do_skip(NRole,
                            SkipActs ++ DoAction,
                            SkipMod,
                            get(plot_pause_flag));
                #plot_trigger{} ->
                    do_skip(Role, SkipActs, SkipMod, force_pause);
                _ -> do_skip(Role, SkipActs, SkipMod, force_pause)
            end;
        _ -> do_skip(Role, SkipActs, SkipMod, force_pause)
    end;
do_skip(Role, [], _SkipMod, _Flag) -> {ok, Role};
do_skip(Role = #role{pid = Pid,
                     m_plot = #m_plot{play_list = PlayL}},
        SkipActs, _SkipMod, _Flag) ->
    Flag = get(plot_pause_flag),
    case PlayL of
        [_ | _] when Flag =/= force_pause ->
            role:apply(async, Pid, {plot_act, handle_next, []});
        _ -> skip
    end,
    role:link_send(Role, 11005, {2, []}),
    init_cli(Role),
    {ok, reset_pos(lists:reverse(SkipActs), Role)}.

-spec map_update(#role{}) -> #role{}.

map_update(Role = #role{m_plot =
                            #m_plot{play_list = PlayL}}) ->
    do_map_update(PlayL, Role).

do_map_update([], Role) -> Role;
do_map_update([Id | T],
              Role = #role{m_plot =
                               MPlot = #m_plot{play_list = PlayL,
                                               do_list = DoL},
                           pos = #pos{map_base_id = MapBaseId}}) ->
    NRole = case lists:keyfind(Id, #plot.id, DoL) of
                Plot = #plot{act_idx = ActIdx} when ActIdx > 0 ->
                    case plot_data:get(Id) of
                        #plot_trigger{maps = []} -> Role;
                        Tri = #plot_trigger{maps = Maps} ->
                            case lists:member(MapBaseId, Maps) of
                                true -> Role;
                                false ->
                                    Role1 = Role#role{m_plot =
                                                          MPlot#m_plot{play_list
                                                                           =
                                                                           PlayL
                                                                               --
                                                                               [Id],
                                                                       do_list =
                                                                           lists:keyreplace(Id,
                                                                                            #plot.id,
                                                                                            DoL,
                                                                                            Plot#plot{act_idx
                                                                                                          =
                                                                                                          0})}},
                                    end_plot(Plot, Tri, Role1),
                                    plot_revise:reset_action(Role1)
                            end;
                        _ -> Role
                    end;
                _ -> Role
            end,
    do_map_update(T, NRole).

handle_next(Role) ->
    case get(plot_pause_list) of
        [] -> {ok, continue(Role)};
        undefined -> {ok, continue(Role)};
        _ -> ok
    end.

handle_timeout(Role = #role{m_plot =
                                #m_plot{do_list = DoL}},
               Id, ActIdx) ->
    case lists:keyfind(Id, #plot.id, DoL) of
        #plot{act_idx = ActIdx} ->
            logger:debug("[~ts]剧情暂停超时继续事件 [Id:~w ActIdx:~w, plot_pause_"
                         "list:~w]",
                         [Role#role.name, Id, ActIdx, get(plot_pause_list)],
                         plot_act,
                         247),
            NRole = next(Role),
            {ok, continue(NRole)};
        _ ->
            logger:error("角色[~ts]非法剧情暂停超时继续事件[Id:~w ActIdx:~w]",
                         [Role#role.name, Id, ActIdx],
                         plot_act,
                         251),
            ok
    end.

handle_timer(Role, ActId) ->
    logger:debug("定时器继续事件=========== [~w]",
                 [ActId],
                 plot_act,
                 257),
    {ok, next_continue(Role, ActId)}.

handle_confirm(Role, Val, ActId) ->
    logger:debug("确认对话Confirm继续事件=========== [~w] ~ts",
                 [ActId, binary_to_list(Val)],
                 plot_act,
                 262),
    put(confirm_return_val, Val),
    {ok, next_continue(Role, ActId)}.

handle_prompt(Role, Val, ActId) ->
    logger:debug("确认对话prompt继续事件=========== [~w] ~ts",
                 [ActId, binary_to_list(Val)],
                 plot_act,
                 268),
    put(prompt_return_val, Val),
    {ok, next_continue(Role, ActId)}.

apply_event(Role, Evt, Id) -> event(Evt, Role, Id).

-spec event(Evt :: tuple(), #role{},
            PlotId :: pos_integer()) -> ok |
                                        remove |
                                        {remove, #role{}} |
                                        {ok, #role{}}.

event(Evt,
      Role = #role{lev = Lev,
                   m_plot =
                       MPlot = #m_plot{do_list = DoL, play_list = PlayL},
                   pos = #pos{map_base_id = MapBaseId}},
      Id) ->
    case lists:keyfind(Id, #plot.id, DoL) of
        #plot{act_idx = ActIdx} when ActIdx > 0 -> ok;
        Plot = #plot{} ->
            case plot_data:get(Id) of
                #plot_trigger{lev = NeedLev} when Lev < NeedLev -> ok;
                #plot_trigger{maps = Maps}
                    when is_record(Evt, evt_move_map) andalso
                             Maps =/= [MapBaseId] ->
                    ok;
                Tri = #plot_trigger{res_list = ResList,
                                    condition = Cond, maps = Maps,
                                    cond_logic = Logic} ->
                    case plot:check_lev_break(Role, Tri) of
                        true ->
                            case (lists:member(MapBaseId, Maps) orelse
                                      Maps =:= [])
                                     andalso
                                     plot_cond:check(Cond, Logic, Evt, Role)
                                of
                                true ->
                                    if PlayL =/= [] ->
                                           NRole = Role#role{m_plot =
                                                                 MPlot#m_plot{play_list
                                                                                  =
                                                                                  PlayL
                                                                                      ++
                                                                                      [Id],
                                                                              do_list
                                                                                  =
                                                                                  lists:keyreplace(Id,
                                                                                                   #plot.id,
                                                                                                   DoL,
                                                                                                   Plot#plot{act_idx
                                                                                                                 =
                                                                                                                 1})}},
                                           {ok, NRole};
                                       ResList =/= [] ->
                                           NRole = Role#role{m_plot =
                                                                 MPlot#m_plot{play_list
                                                                                  =
                                                                                  PlayL
                                                                                      ++
                                                                                      [Id],
                                                                              do_list
                                                                                  =
                                                                                  lists:keyreplace(Id,
                                                                                                   #plot.id,
                                                                                                   DoL,
                                                                                                   Plot#plot{act_idx
                                                                                                                 =
                                                                                                                 1})}},
                                           role:pack_send(Role#role.pid,
                                                          11005,
                                                          {1, ResList}),
                                           {ok, NRole};
                                       true ->
                                           put(plot_evt_doing, true),
                                           NRole = do_play(Evt,
                                                           Role#role{m_plot =
                                                                         MPlot#m_plot{play_list
                                                                                          =
                                                                                          PlayL
                                                                                              ++
                                                                                              [Id]}},
                                                           Tri,
                                                           Plot,
                                                           true),
                                           erase(plot_evt_doing),
                                           {ok, NRole}
                                    end;
                                false -> ok
                            end;
                        _ -> ok
                    end;
                _ ->
                    logger:error("[~ts]不存在的剧情触发器~w",
                                 [Role#role.name, Id],
                                 plot_act,
                                 316),
                    remove
            end;
        _ ->
            logger:debug("此触发器事件可能已完成 已经不在当前进行触发器列表中~w",
                         [Id],
                         plot_act,
                         320),
            remove
    end;
event(_Evt, _Role, _Id) ->
    logger:debug("未登陆时,触发剧情, 不处理", [], plot_act, 324),
    ok.

-spec continue_event(Evt :: tuple(), #role{},
                     PlotId :: pos_integer()) -> ok | {ok, #role{}}.

continue_event(Evt,
               Role = #role{m_plot = #m_plot{do_list = DoL}}, Id) ->
    logger:debug("接收到继续执行事件===========Evt:~w, PlotId:~w",
                 [Evt, Id],
                 plot_act,
                 330),
    case lists:keyfind(Id, #plot.id, DoL) of
        Plot = #plot{act_idx = ActIdx} when ActIdx > 0 ->
            case plot_data:get(Id) of
                Tri = #plot_trigger{} ->
                    {ok, do_play(Evt, Role, Tri, Plot, true)};
                _ ->
                    logger:error("[~ts]请求继续不再存在的剧情[~w]",
                                 [Role#role.name, Id],
                                 plot_act,
                                 337),
                    ok
            end;
        _ ->
            logger:error("[~ts]请求继续的不是一个正在进行的剧情[~w]",
                         [Role#role.name, Id],
                         plot_act,
                         341),
            ok
    end.

do_play(Evt, Role,
        Tri = #plot_trigger{vars = Vars, num = MaxNum,
                            action = Action},
        Plot = #plot{id = Id, num = Num, act_idx = ActIdx0},
        CanPause) ->
    ActIdx = case ActIdx0 < 1 of
                 true -> 1;
                 _ -> ActIdx0
             end,
    DoAction = lists:sublist(Action, ActIdx, 999),
    lists:foreach(fun ({Key, Val}) ->
                          put({plot_fun_var, Key}, Val)
                  end,
                  Vars),
    put(plot_id, Id),
    put(plot_pause_list, []),
    put(plot_act_play_list, []),
    {_RetFlag,
     NewActIdx,
     NRole = #role{m_plot =
                       MPlot = #m_plot{finished = FinL, do_list = DoL,
                                       play_list = PlayL}}} =
        do(DoAction, ActIdx, Tri, Evt, Role, CanPause),
    put(plot_act_idx, NewActIdx),
    lists:foreach(fun ({Key, _Val}) ->
                          erase({plot_fun_var, Key})
                  end,
                  Vars),
    NewRole = case Num + 1 >= MaxNum andalso MaxNum > 0 of
                  true when NewActIdx =:= 0 ->
                      case CanPause of
                          true ->
                              role:apply(async,
                                         NRole#role.pid,
                                         {plot_act, handle_next, []});
                          _ -> skip
                      end,
                      Role2 = NRole#role{m_plot =
                                             MPlot#m_plot{scene = [],
                                                          finished =
                                                              [Id | FinL --
                                                                        [Id]],
                                                          play_list =
                                                              PlayL -- [Id],
                                                          do_list =
                                                              lists:keydelete(Id,
                                                                              #plot.id,
                                                                              DoL)}},
                      logger:debug("=========>动作执行完成 剧情次数满，不继续触发，~w",
                                   [{Id, _RetFlag, NewActIdx}],
                                   plot_act,
                                   374),
                      send_to_client(CanPause, true, Tri, NRole),
                      quest:flush(Role2, push);
                  _ when NewActIdx =/= 0 ->
                      logger:debug("=========>动作执行中途暂停 保存执行进度，~w",
                                   [{Id, _RetFlag, NewActIdx}],
                                   plot_act,
                                   379),
                      send_to_client(CanPause, false, Tri, NRole),
                      NewDoL = lists:keyreplace(Id,
                                                #plot.id,
                                                DoL,
                                                Plot#plot{act_idx = NewActIdx}),
                      NRole#role{m_plot = MPlot#m_plot{do_list = NewDoL}};
                  false ->
                      logger:debug("=========>动作执行完成 但还有触发次数，~w",
                                   [{Id, _RetFlag, NewActIdx}],
                                   plot_act,
                                   384),
                      case CanPause of
                          true ->
                              role:apply(async,
                                         NRole#role.pid,
                                         {plot_act, handle_next, []});
                          _ -> skip
                      end,
                      Role2 = NRole#role{m_plot =
                                             MPlot#m_plot{scene = [],
                                                          play_list =
                                                              PlayL -- [Id],
                                                          do_list =
                                                              lists:keyreplace(Id,
                                                                               #plot.id,
                                                                               DoL,
                                                                               Plot#plot{num
                                                                                             =
                                                                                             Num
                                                                                                 +
                                                                                                 1,
                                                                                         act_idx
                                                                                             =
                                                                                             0})}},
                      send_to_client(CanPause, true, Tri, NRole),
                      Role2
              end,
    NR = set_timeout(NewRole, Id, NewActIdx),
    plot_revise:reset_action(NR).

-spec exec(#role{}, Acts :: [tuple()]) -> {ok, #role{}}.

exec(Role, Acts) ->
    put(plot_act_play_list, []),
    {_RetFlag, _ActIdx, NRole} = do(Acts,
                                    1,
                                    #plot_trigger{},
                                    {evt_gm},
                                    Role,
                                    false),
    case [PlotAct
          || PlotAct = #plot_act{skip_do = 1}
                 <- get_act_play_list()]
        of
        L = [_ | _] ->
            role:link_send(Role, 11010, {0, "", 0, 0, L});
        _ -> skip
    end,
    {ok, NRole}.

-spec do([tuple()] | tuple(), Idx :: pos_integer(),
         #plot_trigger{}, Evt :: tuple(), #role{},
         Flag :: boolean()) -> {Label :: atom(),
                                NewIdx :: non_neg_integer(),
                                #role{}}.

do([], _Idx, _Tri, _Evt, Role, _CanPause) ->
    {finish, 0, Role};
do([Act | T], Idx, Tri, Evt, Role, CanPause) ->
    logger:debug("角色[~ts]剧情[~w]开始播放第~w步 ===> [~w]",
                 [Role#role.name, Tri#plot_trigger.id, Idx, Act],
                 plot_act,
                 417),
    put(plot_act_idx, Idx),
    case catch do_act(plot_fun:act_args(Act),
                      Tri,
                      Evt,
                      Role)
        of
        ok -> do(T, Idx + 1, Tri, Evt, Role, CanPause);
        pause ->
            put(plot_pause_flag, pause),
            case CanPause of
                true -> {pause, Idx, Role};
                false ->
                    NewRole = plot_revise:skip_next(1, [Act], Role),
                    do(T, Idx + 1, Tri, Evt, NewRole, CanPause)
            end;
        break ->
            put(plot_pause_flag, break),
            {finish, 0, Role};
        force_pause ->
            put(plot_pause_flag, force_pause),
            {force_pause, Idx, Role};
        {ok, NRole} ->
            do(T, Idx + 1, Tri, Evt, NRole, CanPause);
        {pause, NRole} ->
            put(plot_pause_flag, pause),
            case CanPause of
                true -> {pause, Idx, NRole};
                false ->
                    NewRole = plot_revise:skip_next(1, [Act], NRole),
                    do(T, Idx + 1, Tri, Evt, NewRole, CanPause)
            end;
        {break, NRole} ->
            put(plot_pause_flag, break),
            {finish, 0, NRole};
        {force_pause, NRole} ->
            put(plot_pause_flag, force_pause),
            {force_pause, Idx, NRole};
        _Err ->
            logger:error("角色[~ts]执行剧情动作处理时出错:~w",
                         [Role#role.name, _Err],
                         plot_act,
                         455),
            NewRole = plot_revise:skip_next(1, [Act], Role),
            do(T, Idx + 1, Tri, Evt, NewRole, CanPause)
    end;
do(Act, Idx, Tri, Evt, Role, CanPause) ->
    do([Act], Idx, Tri, Evt, Role, CanPause).

do_act({trigger_open, TriId}, _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{do_list = DoL,
                                        combat_list = ComList}}) ->
    case {lists:keyfind(TriId, #plot.id, DoL),
          lists:keyfind(TriId, #plot.id, ComList)}
        of
        {false, false} ->
            logger:debug("[~ts][~w]开启触发器================ ~w",
                         [Role#role.name, get(plot_id), TriId],
                         plot_act,
                         472),
            case plot_data:get(TriId) of
                #plot_trigger{type = 2} ->
                    {ok,
                     Role#role{m_plot =
                                   MPlot#m_plot{combat_list =
                                                    [#plot{id = TriId}
                                                     | ComList]}}};
                Tri = #plot_trigger{} ->
                    NRole = plot:set_trigger(Tri, Role),
                    {ok,
                     NRole#role{m_plot =
                                    MPlot#m_plot{do_list =
                                                     [#plot{id = TriId}
                                                      | DoL]}}};
                _ ->
                    logger:error("[~ts][~w]开启不存在的剧情:~w",
                                 [Role#role.name, get(plot_id), TriId],
                                 plot_act,
                                 480),
                    ok
            end;
        _ -> ok
    end;
do_act({trigger_del, 0}, Tri = #plot_trigger{id = Id},
       Evt, Role) ->
    do_act({trigger_del, Id}, Tri, Evt, Role);
do_act({trigger_del, Id},
       _Tri = #plot_trigger{id = SelfId}, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{play_list = PlayL, finished = FinL,
                                        do_list = DoL, combat_list = ComL}}) ->
    case lists:keyfind(Id, #plot.id, DoL) of
        #plot{} when Id =:= SelfId ->
            logger:debug("自我删除触发器================ ~w",
                         [Id],
                         plot_act,
                         493),
            break;
        #plot{} ->
            logger:debug("删除触发器================ ~w",
                         [Id],
                         plot_act,
                         496),
            {ok,
             Role#role{m_plot =
                           MPlot#m_plot{finished = [Id | FinL -- [Id]],
                                        play_list = PlayL -- [Id],
                                        do_list =
                                            lists:keydelete(Id,
                                                            #plot.id,
                                                            DoL)}}};
        _ ->
            case lists:keyfind(Id, #plot.id, ComL) of
                #plot{} ->
                    {ok,
                     Role#role{m_plot =
                                   MPlot#m_plot{finished = [Id | FinL -- [Id]],
                                                combat_list =
                                                    lists:keydelete(Id,
                                                                    #plot.id,
                                                                    ComL)}}};
                _ -> ok
            end
    end;
do_act({trigger_close, Id}, Tri, Evt, Role) ->
    do_act({trigger_del, Id}, Tri, Evt, Role);
do_act({trigger_run, Id}, #plot_trigger{id = Id}, _Evt,
       _Role) ->
    ok;
do_act({trigger_run, Id}, _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{do_list = DoL, play_list = PlayL}}) ->
    case lists:member(Id, PlayL) of
        true -> ok;
        _ ->
            case lists:keyfind(Id, #plot.id, DoL) of
                false ->
                    case plot_data:get(Id) of
                        #plot_trigger{type = 1} ->
                            {ok,
                             Role#role{m_plot =
                                           MPlot#m_plot{play_list =
                                                            PlayL ++ [Id],
                                                        do_list =
                                                            [#plot{id = Id,
                                                                   act_idx = 1}
                                                             | DoL]}}};
                        _ -> ok
                    end;
                Plot ->
                    {ok,
                     Role#role{m_plot =
                                   MPlot#m_plot{play_list = PlayL ++ [Id],
                                                do_list =
                                                    lists:keyreplace(Id,
                                                                     #plot.id,
                                                                     DoL,
                                                                     Plot#plot{act_idx
                                                                                   =
                                                                                   1})}}}
            end
    end;
do_act({set_val, Name, Val}, _Tri, _Evt, _Role) ->
    put({plot_global_var, Name}, Val),
    ok;
do_act({set_fun_val, Name, Val}, _Tri, _Evt, _Role) ->
    put({plot_fun_var, Name}, Val),
    ok;
do_act({modify_val, Name, Flag, Or}, _Tri, _Evt,
       _Role) ->
    plot_fun:modify_var({plot_global_var, Name}, Flag, Or),
    ok;
do_act({modify_fun_val, Name, Flag, Or}, _Tri, _Evt,
       _Role) ->
    plot_fun:modify_var({plot_fun_var, Name}, Flag, Or),
    ok;
do_act({Label = wait, Time},
       _Tri = #plot_trigger{id = Id}, _Evt, Role) ->
    logger:debug("[~w]设系统等待一定时间后再继续执行 -- [~w]",
                 [Id, Time],
                 plot_act,
                 554),
    ActId = get_inc_id(),
    inc_pause({ActId, srv, Label, Id}),
    Timer = #timer{id = plot_act_wait, timeout = Time,
                   times = 1, m = plot_act, f = handle_timer, a = [ActId]},
    NRole = role_timer:add(Timer, Role),
    {pause, NRole};
do_act({pause}, _Tri, _Evt, _Role) -> pause;
do_act({break}, _Tri, _Evt, _Role) -> break;
do_act({Label = open_sys, List}, _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{fun_icons = Icons}})
    when is_list(List) ->
    NewList = [{Type, Num}
               || {Type, Num} <- List,
                  lists:member(Type, Icons) =:= false],
    case NewList of
        [_ | _] ->
            add_act_play(#plot_act{label = Label, gain = NewList,
                                   need_next = 1, timeout = 600000}),
            Types = [Type || {Type, _} <- NewList],
            NRole = Role#role{m_plot =
                                  MPlot#m_plot{fun_icons = Types ++ Icons}},
            Evts = [#evt_ico{id = Type} || {Type, _} <- NewList],
            {ok, role_trigger:fire(Evts, NRole)};
        _ -> ok
    end;
do_act({Label = open_sys, List, Msg}, _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{fun_icons = Icons}})
    when is_list(List) ->
    NewList = [{Type, Num}
               || {Type, Num} <- List,
                  lists:member(Type, Icons) =:= false],
    case NewList of
        [_ | _] ->
            add_act_play(#plot_act{label = Label, gain = NewList,
                                   need_next = 1, timeout = 600000, msg = Msg}),
            Types = [Type || {Type, _} <- NewList],
            NRole = Role#role{m_plot =
                                  MPlot#m_plot{fun_icons = Types ++ Icons}},
            Evts = [#evt_ico{id = Type} || {Type, _} <- NewList],
            {ok, role_trigger:fire(Evts, NRole)};
        _ -> ok
    end;
do_act({Label = open_sys, Type}, _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{fun_icons = Icons}}) ->
    case lists:member(Type, Icons) of
        false ->
            add_act_play(#plot_act{label = Label, val = Type,
                                   need_next = 1, timeout = 600000}),
            NRole = Role#role{m_plot =
                                  MPlot#m_plot{fun_icons = [Type | Icons]}},
            {ok, role_trigger:fire(#evt_ico{id = Type}, NRole)};
        _ -> ok
    end;
do_act({Label = open_sys, Type, Num}, _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{fun_icons = Icons}})
    when is_integer(Type) ->
    case lists:member(Type, Icons) of
        false ->
            add_act_play(#plot_act{label = Label, val = Type,
                                   time = Num, need_next = 1,
                                   timeout = 600000}),
            NRole = Role#role{m_plot =
                                  MPlot#m_plot{fun_icons = [Type | Icons]}},
            {ok, role_trigger:fire(#evt_ico{id = Type}, NRole)};
        _ -> ok
    end;
do_act({open_map, MapId}, _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{map_list = MapList}})
    when is_integer(MapId) ->
    case lists:member(MapId, MapList) of
        false ->
            NRole = Role#role{m_plot =
                                  MPlot#m_plot{map_list = [MapId | MapList]}},
            plot:push(map, {}, NRole),
            {ok, NRole};
        _ -> ok
    end;
do_act({close_map, MapId}, _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{map_list = MapList}}) ->
    NRole = Role#role{m_plot =
                          MPlot#m_plot{map_list =
                                           lists:delete(MapId, MapList)}},
    plot:push(map, {}, NRole),
    {ok, NRole};
do_act({Label = camera_reset, Time}, _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{scene = Scene}}) ->
    add_act_play(#plot_act{label = Label, time = Time,
                           need_next = 1, timeout = Time + 5000}),
    {pause,
     Role#role{m_plot =
                   MPlot#m_plot{scene =
                                    lists:keydelete(camera_move_to,
                                                    1,
                                                    Scene)}}};
do_act(Act = {Label = camera_move_to, Time, X, Y}, _Tri,
       _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{scene = Scene}}) ->
    add_act_play(#plot_act{label = Label, time = Time,
                           x = X, y = Y, need_next = 1, timeout = Time + 5000}),
    {pause,
     Role#role{m_plot =
                   MPlot#m_plot{scene =
                                    [Act | lists:keydelete(Label, 1, Scene)]}}};
do_act({Label = camera_follow, BattleId, UnitId}, _Tri,
       _Evt, _Role) ->
    add_act_play(#plot_act{label = Label,
                           battle_id = battle_id(BattleId, _Role),
                           unit_id = UnitId, need_next = 1, timeout = 30000}),
    pause;
do_act({Label = camera_zoom, Time, Ratio}, _Tri, _Evt,
       _Role) ->
    add_act_play(#plot_act{label = Label, time = Time,
                           val = Ratio, need_next = 1, timeout = Time + 5000}),
    pause;
do_act({Label = camera_shake, Mode, Time}, _Tri, _Evt,
       _Role) ->
    add_act_play(#plot_act{label = Label, time = Time,
                           mode = Mode, need_next = 1, timeout = Time + 5000}),
    pause;
do_act({Label = camera_filter, Filter, Time}, _Tri,
       _Evt, _Role) ->
    add_act_play(#plot_act{label = Label, time = Time,
                           mode = Filter, need_next = 1,
                           timeout = Time + 5000}),
    pause;
do_act({Label = press_screen, Mod}, _Tri, _Evt,
       _Role) ->
    add_act_play(#plot_act{label = Label, mode = Mod,
                           need_next = 1, timeout = 5000}),
    pause;
do_act({Label = animation_play, Id}, _Tri, _Evt,
       _Role) ->
    add_act_play(#plot_act{label = Label, val = Id,
                           need_next = 1, timeout = 100000}),
    pause;
do_act({Label = animation_play_on_role, ResId}, _Tri,
       _Evt, _Role) ->
    add_act_play(#plot_act{label = Label, res_id = ResId,
                           need_next = 1, timeout = 30000}),
    pause;
do_act({Label = animation_play_on_unit,
        BattleId,
        UnitId,
        ResId},
       _Tri, _Evt, _Role) ->
    add_act_play(#plot_act{label = Label,
                           battle_id = battle_id(BattleId, _Role),
                           unit_id = UnitId, res_id = ResId, need_next = 1,
                           timeout = 30000}),
    pause;
do_act({Label = animation_play_point, ResId, X, Y},
       _Tri, _Evt, _Role) ->
    add_act_play(#plot_act{label = Label, x = X, y = Y,
                           res_id = ResId, need_next = 1, timeout = 30000}),
    pause;
do_act({Label = play_plot, Id}, _Tri, _Evt, _Role) ->
    add_act_play(#plot_act{label = Label, val = Id,
                           need_next = 1, timeout = 200000}),
    pause;
do_act({Label = play_talk, Id}, _Tri, _Evt, _Role) ->
    add_act_play(#plot_act{label = Label, val = Id}),
    ok;
do_act({Label = prelude, Color, Time, Mode, Msg}, _Tri,
       _Evt, _Role)
    when is_binary(Msg) andalso is_binary(Color) ->
    add_act_play(#plot_act{label = Label, color = Color,
                           time = Time, mode = Mode, msg = Msg, need_next = 1,
                           timeout = 15000}),
    pause;
do_act({Label = open_panel, Type}, _Tri, _Evt, _Role) ->
    add_act_play(#plot_act{label = Label, val = Type,
                           skip_do = 1}),
    ok;
do_act({Label = close_panel, Type}, _Tri, _Evt,
       _Role) ->
    add_act_play(#plot_act{label = Label, val = Type,
                           skip_do = 1}),
    ok;
do_act({Label = wait_client, Time}, _Tri, _Evt,
       _Role) ->
    add_act_play(#plot_act{label = Label, val = Time}),
    ok;
do_act({Label = play_guide, Id}, _Tri, _Evt,
       Role = #role{s_event = 1}) ->
    Conds = plot_data:get_guide(Id),
    case plot_cond:check(Conds, {check_play_guide}, Role) of
        true ->
            add_act_play(#plot_act{label = Label, val = Id});
        _ -> ok
    end,
    ok;
do_act({Label = play_guide, Id}, _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{guide_list = GuideList}}) ->
    Conds = plot_data:get_guide(Id),
    case plot_cond:check(Conds, {check_play_guide}, Role) of
        true ->
            Fun = fun (Id1) ->
                          add_act_play(#plot_act{label = close_guide, val = Id1,
                                                 skip_do = 1})
                  end,
            lists:foreach(Fun, GuideList),
            add_act_play(#plot_act{label = Label, val = Id}),
            NewRole = Role#role{m_plot =
                                    MPlot#m_plot{guide_list = [Id]}},
            {ok,
             role_trigger:fire([#evt_close_guide{id = Id2}
                                || Id2 <- GuideList],
                               NewRole)};
        _False ->
            logger:error("不满足播放指引条件：[Id:~w][Reason:~w]",
                         [Id, _False],
                         plot_act,
                         740),
            ok
    end;
do_act({Label = close_guide, Id}, _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{guide_list = GuideList}}) ->
    add_act_play(#plot_act{label = Label, val = Id,
                           skip_do = 1}),
    {ok,
     role_trigger:fire(#evt_close_guide{id = Id},
                       Role#role{m_plot =
                                     MPlot#m_plot{guide_list =
                                                      lists:delete(Id,
                                                                   GuideList)}})};
do_act({Label = hide, Mode}, _Tri, _Evt,
       Role = #role{m_plot = MPlot}) ->
    add_act_play(#plot_act{label = Label, mode = Mode}),
    {ok,
     Role#role{m_plot = MPlot#m_plot{hide_mode = Mode}}};
do_act({Label = unlock_panel, Mode}, _Tri, _Evt,
       _Role) ->
    add_act_play(#plot_act{label = Label, mode = Mode}),
    ok;
do_act({Label = act_role, Act, Times}, _Tri, _Evt,
       _Role)
    when is_binary(Act) ->
    add_act_play(#plot_act{label = Label, msg = Act,
                           ext_val = Times, need_next = 1, timeout = 15000}),
    pause;
do_act({Label = act_unit, BattleId, UnitId, Act, Times},
       _Tri, _Evt, _Role)
    when is_binary(Act) ->
    add_act_play(#plot_act{label = Label,
                           battle_id = battle_id(BattleId, _Role),
                           unit_id = UnitId, msg = Act, ext_val = Times,
                           need_next = 1, timeout = 15000}),
    pause;
do_act({Label = unit_dir, BattleId, UnitId, Type}, _Tri,
       _Evt, _Role) ->
    add_act_play(#plot_act{label = Label,
                           battle_id = battle_id(BattleId, _Role),
                           unit_id = UnitId, val = Type}),
    ok;
do_act({Label = play_effect, Id, Times}, _Tri, _Evt,
       _Role) ->
    add_act_play(#plot_act{label = Label, val = Id,
                           ext_val = Times, need_next = 1, timeout = 30000}),
    pause;
do_act({Label = sound_play, ResId, Times}, _Tri, _Evt,
       _Role) ->
    add_act_play(#plot_act{label = Label, time = Times,
                           res_id = ResId, need_next = 1,
                           timeout = Times + 15000}),
    ok;
do_act({Label = res_cache, ResId}, _Tri, _Evt, _Role)
    when is_binary(ResId) ->
    add_act_play(#plot_act{label = Label, res_id = ResId,
                           skip_do = 1}),
    ok;
do_act({Label = mod_cache, ModCache}, _Tri, _Evt, _Role)
    when is_binary(ModCache) ->
    add_act_play(#plot_act{label = Label, res_id = ModCache,
                           skip_do = 1}),
    ok;
do_act({Label = unit_talk, Mod, UnitName, ResId, Msg},
       _Tri, _Evt, _Role)
    when is_binary(ResId) andalso
             is_binary(UnitName) andalso is_binary(Msg) ->
    add_act_play(#plot_act{label = Label, mode = Mod,
                           msg = Msg, ext_msg = UnitName, res_id = ResId,
                           need_next = 1, timeout = 30000}),
    pause;
do_act({Label = unit_talk_bubble, UnitId, Msg}, Tri,
       Evt, Role)
    when is_binary(Msg) ->
    do_act({Label, 0, UnitId, Msg}, Tri, Evt, Role);
do_act({Label = unit_talk_bubble,
        BattleId,
        UnitId,
        Msg},
       _Tri, _Evt, _Role)
    when is_binary(Msg) ->
    add_act_play(#plot_act{label = Label,
                           battle_id = battle_id(BattleId, _Role),
                           unit_id = UnitId, msg = Msg, need_next = 1,
                           timeout = 5000}),
    pause;
do_act({Label = unit_talk_face, UnitId, Msg}, Tri, Evt,
       Role)
    when is_binary(Msg) ->
    do_act({Label, 0, UnitId, Msg}, Tri, Evt, Role);
do_act({Label = unit_talk_face, BattleId, UnitId, Msg},
       _Tri, _Evt, _Role)
    when is_binary(Msg) ->
    add_act_play(#plot_act{label = Label,
                           battle_id = battle_id(BattleId, _Role),
                           unit_id = UnitId, msg = Msg}),
    pause;
do_act({Label = unit_talk_head, UnitId, ResId, Msg},
       Tri, Evt, Role)
    when is_binary(ResId) andalso is_binary(Msg) ->
    do_act({Label, 0, UnitId, ResId, Msg}, Tri, Evt, Role);
do_act({Label = unit_talk_head,
        BattleId,
        UnitId,
        ResId,
        Msg},
       _Tri, _Evt, _Role)
    when is_binary(ResId) andalso is_binary(Msg) ->
    add_act_play(#plot_act{label = Label,
                           battle_id = battle_id(BattleId, _Role),
                           unit_id = UnitId, res_id = ResId, msg = Msg,
                           need_next = 1, timeout = 30000}),
    pause;
do_act({Label = role_talk, Mod, Name, ResId, Msg}, _Tri,
       _Evt, _Role)
    when is_binary(ResId) andalso is_binary(Msg) ->
    add_act_play(#plot_act{label = Label, mode = Mod,
                           msg = Msg, ext_msg = Name, res_id = ResId,
                           need_next = 1, timeout = 30000}),
    pause;
do_act({Label = role_talk_bubble, Msg}, _Tri, _Evt,
       _Role)
    when is_binary(Msg) ->
    add_act_play(#plot_act{label = Label, msg = Msg,
                           need_next = 1, timeout = 5000}),
    pause;
do_act({Label = role_talk_face, Msg}, _Tri, _Evt, _Role)
    when is_binary(Msg) ->
    add_act_play(#plot_act{label = Label, msg = Msg}),
    pause;
do_act({Label = role_talk_head, ResId, Msg}, _Tri, _Evt,
       _Role)
    when is_binary(ResId) andalso is_binary(Msg) ->
    add_act_play(#plot_act{label = Label, res_id = ResId,
                           msg = Msg, need_next = 1, timeout = 30000}),
    pause;
do_act({Label = unit_select,
        Type,
        UnitName,
        ResId,
        Msg,
        Opts},
       _Tri, _Evt, _Role)
    when is_binary(ResId) andalso is_binary(Msg) ->
    add_act_play(#plot_act{label = Label, mode = Type,
                           ext_info = Opts, msg = Msg, ext_msg = UnitName,
                           res_id = ResId, need_next = 1}),
    pause;
do_act({Label = select, Type, Name, ResId, Msg, Opts},
       _Tri, _Evt, _Role)
    when is_binary(ResId) andalso is_binary(Msg) ->
    add_act_play(#plot_act{label = Label, mode = Type,
                           msg = Msg, ext_info = Opts, ext_msg = Name,
                           res_id = ResId, need_next = 1}),
    pause;
do_act({world_channel, Style, Msg}, _Tri, _Evt,
       _Role) ->
    notice:cast(all, Style, Msg),
    ok;
do_act({map_channel, Style, Msg}, _Tri, _Evt,
       _Role = #role{pos = #pos{map = MapId}}) ->
    notice:cast({map, MapId}, Style, Msg),
    ok;
do_act({kill_npc, _NpcBaseId}, _Tri, _Evt,
       _Role = #role{m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    force_pause;
do_act({Label = kill_npc, NpcBaseId},
       #plot_trigger{id = Id}, _Evt, Role) ->
    Flag = get(test_skip_plot),
    case unit_convert:to(unit, NpcBaseId) of
        {ok, Unit = #unit{}} when Flag =/= true ->
            logger:debug("击杀NPC事件:~w", [NpcBaseId], plot_act, 875),
            put(plot_pause_list, []),
            ActId = get_inc_id(),
            inc_pause({ActId, srv, Label, Id}),
            put(plot_kill_npc_act_id, ActId),
            Role1 = case Role of
                        #role{s_action = 4} -> Role#role{s_action = 0};
                        _ -> Role
                    end,
            combat_mgr:start_combat(2, Role1, Unit),
            force_pause;
        _ -> ok
    end;
do_act({Label = plot_unit_create,
        Id,
        UnitBaseId,
        UnitName,
        {point, Map, X, Y},
        Dir,
        ActType,
        Mod},
       Tri, Evt, Role) ->
    do_act({Label,
            Id,
            UnitBaseId,
            UnitName,
            {point, Map, X, Y},
            Dir,
            ActType,
            Mod,
            []},
           Tri,
           Evt,
           Role);
do_act({Label = plot_unit_create,
        Id,
        UnitBaseId,
        UnitName,
        {point, Map, X, Y},
        Dir,
        ActType,
        Mod,
        Looks},
       _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{unit_list = UnitList}}) ->
    Unit = #plot_unit{id = Id, base_id = UnitBaseId,
                      name = UnitName, map = Map, x = X, y = Y, dir = Dir,
                      act_type = ActType, looks = Looks},
    add_act_play(#plot_act{label = Label, unit_id = Id,
                           unit_base_id = UnitBaseId, msg = UnitName,
                           mapid = Map, x = X, y = Y, val = Dir,
                           ext_msg = ActType, mode = Mod, need_next = 0,
                           looks = Looks, timeout = 3000}),
    {ok,
     Role#role{m_plot =
                   MPlot#m_plot{unit_list =
                                    lists:keystore(Id,
                                                   #plot_unit.id,
                                                   UnitList,
                                                   Unit)}}};
do_act({Label = plot_unit_move, Id, Time, X, Y}, _Tri,
       _Evt, _Role) ->
    add_act_play(#plot_act{label = Label, unit_id = Id,
                           time = Time, x = X, y = Y, need_next = 1,
                           timeout = Time + 10000}),
    pause;
do_act({Label = plot_unit_move_role, Id, Time, X1, Y1},
       _Tri, _Evt, _Role = #role{pos = #pos{x = X, y = Y}}) ->
    add_act_play(#plot_act{label = Label, unit_id = Id,
                           time = Time, x = X + X1, y = Y + Y1, need_next = 1,
                           timeout = Time + 10000}),
    pause;
do_act({Label = plot_unit_del, Id}, _Tri, _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{unit_list = UnitList}}) ->
    add_act_play(#plot_act{label = Label, unit_id = Id}),
    {ok,
     Role#role{m_plot =
                   MPlot#m_plot{unit_list =
                                    lists:keydelete(Id,
                                                    #plot_unit.id,
                                                    UnitList)}}};
do_act({Label = plot_unit_set_looks, Id, Looks}, _Tri,
       _Evt,
       Role = #role{m_plot =
                        MPlot = #m_plot{unit_list = UnitList}})
    when is_list(Looks) ->
    add_act_play(#plot_act{label = Label, unit_id = Id,
                           looks = Looks}),
    case lists:keyfind(Id, #plot_unit.id, UnitList) of
        Unit = #plot_unit{} ->
            {ok,
             Role#role{m_plot =
                           MPlot#m_plot{unit_list =
                                            lists:keyreplace(Id,
                                                             #plot_unit.id,
                                                             UnitList,
                                                             Unit#plot_unit{looks
                                                                                =
                                                                                Looks})}}};
        _ -> {ok, Role}
    end;
do_act({quest, QuestId}, _Tri, _Evt,
       Role = #role{m_quest =
                        Mquest = #m_quest{acceptable = Acceptable,
                                          quest = Quests, finished = FinL}}) ->
    case lists:member(QuestId, FinL) of
        false ->
            case lists:keyfind(QuestId, #quest.id, Quests) of
                false ->
                    case quest:force_accept(QuestId,
                                            Role#role{m_quest =
                                                          Mquest#m_quest{acceptable
                                                                             =
                                                                             [QuestId
                                                                              | lists:delete(QuestId,
                                                                                             Acceptable)]}})
                        of
                        {ok, NRole} when is_record(NRole, role) ->
                            logger:debug("获得一个任务========== ~w",
                                         [QuestId],
                                         plot_act,
                                         940),
                            {ok, NRole};
                        {error, Reason} ->
                            logger:error("[~ts][~w]接受任务[~w]出错[~ts]",
                                         [Role#role.name,
                                          get(plot_id),
                                          QuestId,
                                          Reason],
                                         plot_act,
                                         943),
                            ok
                    end;
                _ ->
                    logger:debug("[~ts]接受任务出错, 任务已在进行中[~w]",
                                 [Role#role.name, QuestId],
                                 plot_act,
                                 947),
                    ok
            end;
        _ ->
            logger:error("[~ts][~w]接受任务出错, 任务已完成了[~w]",
                         [Role#role.name, get(plot_id), QuestId],
                         plot_act,
                         951),
            ok
    end;
do_act({quest_finish, QuestId}, _Tri, _Evt, Role) ->
    case quest:finish(QuestId, Role) of
        {ok, NRole} when is_record(NRole, role) ->
            logger:debug("完成一个任务========== ~w",
                         [QuestId],
                         plot_act,
                         959),
            {ok, NRole};
        {error, _Reason} ->
            logger:debug("[~ts][~w]完成任务出错[~ts]",
                         [Role#role.name, get(plot_id), _Reason],
                         plot_act,
                         962),
            ok
    end;
do_act({quest_commit, QuestId}, _Tri, _Evt, Role) ->
    case quest:force_commit(QuestId, Role) of
        {ok, NRole} ->
            logger:debug("提交任务:~w", [QuestId], plot_act, 970),
            {ok, NRole};
        {error, _Reason} ->
            logger:debug("[~ts]提交任务[~w]出错[~ts]",
                         [Role#role.name, QuestId, _Reason],
                         plot_act,
                         973),
            ok
    end;
do_act({goto, {point, MapId, X, Y}}, _Tri, _Evt,
       _Role = #role{pos = #pos{map = MapId, x = X, y = Y}}) ->
    ok;
do_act({goto, {point, MapId, X, Y}}, _Tri, _Evt,
       Role = #role{status = 0, s_event = 0,
                    m_combat = #m_combat{pid = CombatPid}})
    when not is_pid(CombatPid) ->
    case map:role_enter({MapId, X, Y}, Role) of
        {ok, NRole} when is_record(NRole, role) -> {ok, NRole};
        _Err ->
            logger:error("[~ts]进入地图失败：~w",
                         [Role#role.name, _Err],
                         plot_act,
                         990),
            ok
    end;
do_act({goto, {point, _MapId, _X, _Y}}, _Tri, _Evt,
       _Role = #role{status = _Status, s_event = _Event}) ->
    logger:error("[~ts]非法跳地图 status: ~w s_event: ~w",
                 [_Role#role.name, _Status, _Event],
                 plot_act,
                 994),
    ok;
do_act({_Label = way_finding_point, {point, Map, X, Y}},
       _Tri, _Evt,
       _Role = #role{pos = #pos{map = Map, x = X, y = Y}}) ->
    ok;
do_act({Label = way_finding_point, {point, Map, X, Y}},
       _Tri, _Evt,
       #role{m_plot = #m_plot{map_list = MapL},
             pos = #pos{map = Map1}}) ->
    Flag = lists:member(Map, MapL),
    case map_data:get(Map) of
        {ok, #map_data{startup = 0}} when Map =/= Map1 ->
            logger:error("非法寻路，不是当前地图也不是开机启动: ~w=>~w",
                         [Map1, Map],
                         plot_act,
                         1004),
            ok;
        _ when Map =/= Map1 andalso Flag =/= true ->
            logger:error("非法寻路，目标地图没有开启地图使用权: ~w=>~w",
                         [Map1, Map],
                         plot_act,
                         1007),
            ok;
        _ ->
            case map_data:get(Map1) of
                {ok, #map_data{startup = 0}} when Map =/= Map1 ->
                    logger:error("非法寻路, 当前处到活动地图中: ~w=>~w",
                                 [Map1, Map],
                                 plot_act,
                                 1012),
                    ok;
                {ok, #map_data{is_single = 1}} when Map =/= Map1 ->
                    logger:error("非法寻路, 当前处到剧情地图中: ~w=>~w",
                                 [Map1, Map],
                                 plot_act,
                                 1015),
                    ok;
                _ ->
                    add_act_play(#plot_act{label = Label, mapid = Map,
                                           x = X, y = Y, need_next = 1}),
                    pause
            end
    end;
do_act({Label = way_finding, BattleId, UnitId}, _Tri,
       _Evt, _Role) ->
    add_act_play(#plot_act{label = Label,
                           battle_id = battle_id(BattleId, _Role),
                           unit_id = UnitId, need_next = 1}),
    pause;
do_act({Label = world_map, MapId, DestMapId}, _Tri,
       _Evt, _Role) ->
    add_act_play(#plot_act{label = Label, mapid = MapId,
                           val = DestMapId, need_next = 1}),
    pause;
do_act({Label = transmit, Mode, Speed, X, Y}, _Tri,
       _Evt, _Role) ->
    add_act_play(#plot_act{label = Label, time = Speed,
                           mode = Mode, x = X, y = Y, need_next = 1}),
    pause;
do_act({transmit_role, Mode, Speed, X, Y}, _Tri, _Evt,
       #role{pos = #pos{x = X1, y = Y1}}) ->
    add_act_play(#plot_act{label = transmit, time = Speed,
                           mode = Mode, x = X + X1, y = Y + Y1, need_next = 1}),
    pause;
do_act({Label = role_dir, Dir}, _Tri, _Evt,
       Role = #role{pos = Pos}) ->
    add_act_play(#plot_act{label = Label, val = Dir}),
    {ok, Role#role{pos = Pos#pos{dir = Dir}}};
do_act({battle_evt}, #plot_trigger{id = Id}, _Evt,
       #role{id = RoleId, name = Name, pid = Pid,
             s_event_pid = BattlePid}) ->
    battle_mgr:evt(BattlePid,
                   #evt_battle_plot{plot_id = Id, role_id = RoleId,
                                    role_name = Name, role_pid = Pid}),
    ok;
do_act({add_buff, BuffId}, _Tri, _Evt, Role) ->
    {ok, CalcRole} = buff:add_and_calc(Role, BuffId),
    LooksRole = looks:calc(CalcRole),
    looks:update_looks(Role, LooksRole),
    {ok, LooksRole};
do_act({del_buff, BuffId}, _Tri, _Evt, Role) ->
    buff:del(Role, [BuffId]);
do_act({wing, Fly, WingId}, _Tri, _Evt, Role) ->
    case Fly of
        0 ->
            case role_fly:plot_landing(Role) of
                keep -> ok;
                {remove, NRole} -> {ok, NRole}
            end;
        1 ->
            case role_fly:plot_take_off(Role, WingId) of
                false -> ok;
                Rtn = {ok, _NRole} -> Rtn
            end;
        Timeout ->
            case role_fly:plot_take_off(Role, WingId) of
                {ok,
                 FlyRole = #role{m_wing =
                                     MWing = #m_wing{expiry = Expiry}}} ->
                    Now = date:unixtime(),
                    NewExpiry = lists:keystore(WingId,
                                               1,
                                               Expiry,
                                               {WingId, Now + Timeout}),
                    NRole = FlyRole#role{m_wing =
                                             MWing#m_wing{plot_wing_id = WingId,
                                                          expiry = NewExpiry}},
                    Timer = #timer{id = plot_act_wing,
                                   timeout = Timeout * 1000, m = role_fly,
                                   f = plot_landing, a = []},
                    NewRole = role_timer:set(Timer, NRole),
                    {ok, NewRole};
                false -> ok
            end
    end;
do_act({get_item, Items}, _Tri, _Evt, Role)
    when is_list(Items) ->
    case role_gain:do([#gain{label = item_base_id,
                             val = Items}],
                      Role)
        of
        {ok, NRole} -> {ok, NRole};
        _ -> ok
    end;
do_act({Label = get_use_item, Type, BaseId}, _Tri, _Evt,
       _Role) ->
    add_act_play(#plot_act{label = Label, val = BaseId,
                           mode = Type, need_next = 1, timeout = 60000}),
    pause;
do_act({Label = get_use_items, ItemL}, _Tri, _Evt,
       _Role) ->
    add_act_play(#plot_act{label = Label,
                           ext_info = [{BaseId, ""} || BaseId <- ItemL],
                           need_next = 1, timeout = 60000}),
    pause;
do_act({_Label = evt_plot, Type},
       _Tri = #plot_trigger{id = Id}, _Evt, Role) ->
    {ok,
     role_trigger:fire(#evt_plot{type = Type, id = Id},
                       Role)};
do_act({pet_war}, _Tri, _Evt, Role) ->
    case pet:war(Role, 1) of
        {ok, NRole, _} -> {ok, NRole};
        _ -> ok
    end;
do_act({Label = first_pet, PetBaseId}, _Tri, _Evt,
       _Role) ->
    add_act_play(#plot_act{label = Label, val = PetBaseId,
                           skip_do = 1}),
    ok;
do_act({Label = quest_trace, Val}, _Tri, _Evt,
       Role = #role{m_plot = MPlot}) ->
    add_act_play(#plot_act{label = Label, val = Val,
                           skip_do = 1}),
    {ok,
     Role#role{m_plot = MPlot#m_plot{quest_trace = Val}}};
do_act({ifelse, Conds, Acts1, Acts2}, Tri, Evt, Role) ->
    case plot_cond:check(Conds, Evt, Role) of
        true -> do_act({action, Acts1}, Tri, Evt, Role);
        false -> do_act({action, Acts2}, Tri, Evt, Role)
    end;
do_act({action, Acts = [_ | _]}, Tri, Evt, Role) ->
    put(plot_pause_flag, ok),
    {_, _, NRole} = do(Acts, 1, Tri, Evt, Role, false),
    {get(plot_pause_flag), NRole};
do_act({null}, _Tri, _Evt, _Role) -> ok;
do_act({Label = use_item, BaseId}, _Tri, _Evt, _Role) ->
    add_act_play(#plot_act{label = Label, val = BaseId,
                           skip_do = 1}),
    ok;
do_act({Label = inter_monologue,
        UnitBaseId,
        Id,
        Name,
        Content,
        Time},
       _Tri, _Evt, _Role) ->
    add_act_play(#plot_act{label = Label,
                           unit_base_id = UnitBaseId, val = Id, msg = Name,
                           ext_msg = Content, time = Time}),
    ok;
do_act(_Act, _Tri, _Evt, _Role) ->
    logger:error("角色[~ts]事件[~w]触器器[~w][~w]调用动作[~w]不存在",
                 [_Role#role.name,
                  element(1, _Evt),
                  _Tri#plot_trigger.id,
                  get(plot_act_idx),
                  _Act],
                 plot_act,
                 1175),
    ok.

inc_pause({ActId, Who, Label, Id}) ->
    put(plot_pause_list,
        [{ActId, Who, Label, Id, get(plot_act_idx)}
         | get(plot_pause_list)]);
inc_pause([]) -> ok;
inc_pause(List = [{_ActId, _Who, _Label, _Id} | _]) ->
    Acc = case get(plot_pause_list) of
              PauseList when is_list(PauseList) -> PauseList;
              _ -> []
          end,
    ActIdx = get(plot_act_idx),
    inc_pause(List, ActIdx, Acc).

inc_pause([], _ActIdx, Acc) ->
    put(plot_pause_list, Acc);
inc_pause([{ActId, Who, Label, Id} | Rest], ActIdx,
          Acc) ->
    inc_pause(Rest,
              ActIdx,
              [{ActId, Who, Label, Id, ActIdx} | Acc]).

dec_pause(Id) when is_integer(Id) ->
    L = get(plot_pause_list),
    logger:debug("剧情暂停情况：Id:~w  L:~w",
                 [Id, L],
                 plot_act,
                 1205),
    NewL = lists:keydelete(Id, 1, L),
    put(plot_pause_list, NewL),
    NewL =:= [] andalso L =/= [];
dec_pause(_Id) -> false.

add_act_play(PlotAct = #plot_act{label = Label}) ->
    put(plot_act_end_flag, 1),
    put(plot_act_play_list,
        [PlotAct#plot_act{id = get_inc_id(),
                          type = plot_fun:act_to_type(Label)}
         | get(plot_act_play_list)]);
add_act_play(Acts = [#plot_act{} | _]) ->
    Acc = get(plot_act_play_list),
    add_act_play(Acts, Acc).

add_act_play([], Acc) -> put(plot_act_play_list, Acc);
add_act_play([PlotAct = #plot_act{label = Label}
              | Rest],
             Acc) ->
    Type = plot_fun:act_to_type(Label),
    add_act_play(Rest,
                 [PlotAct#plot_act{type = Type} | Acc]).

get_act_play_list() ->
    case get(plot_act_play_list) of
        L = [_ | _] -> lists:reverse(L);
        _ -> []
    end.

send_to_client(true, IsEnd,
               #plot_trigger{id = Id, name = PlotName,
                             can_skip = CanSkip, hide_layer = HideLayer},
               Role = #role{name = _Name}) ->
    case IsEnd of
        true ->
            case case get(plot_act_end_flag) of
                     1 -> 1;
                     _ -> 0
                 end
                of
                1 ->
                    logger:debug("[~ts]发送剧情[Id:~w][~ts]结束动作",
                                 [_Name, Id, PlotName],
                                 plot_act,
                                 1248),
                    add_act_play(#plot_act{label = end_plot}),
                    put(plot_act_end_flag, 0);
                0 -> ok
            end;
        false -> ok
    end,
    send_to_client(Id, PlotName, CanSkip, HideLayer, Role);
send_to_client(_CanPause, _Finish, _Tri, _Role) -> skip.

send_to_client(Id, Name, CanSkip, HideLayer, Role) ->
    case get_act_play_list() of
        [] -> skip;
        L ->
            PauseList = [{ActId, cli, Label, Id}
                         || #plot_act{id = ActId, label = Label, need_next = 1}
                                <- L],
            inc_pause(PauseList),
            logger:debug("[~ts]本次剧情[~w:~ts]暂停等待返回：CanSkip: ~w "
                         "L:~w",
                         [Role#role.name, Id, Name, CanSkip, L],
                         plot_act,
                         1268),
            role:link_send(Role,
                           11010,
                           {Id, Name, CanSkip, HideLayer, L})
    end.

get_inc_id() ->
    Id = case get(plot_act_id) of
             undefined -> 2;
             Int -> Int
         end,
    put(plot_act_id, Id + 1),
    Id.

set_timeout(Role, _Id, 0) -> Role;
set_timeout(Role, Id, ActIdx = close) ->
    T = case [OutT
              || #plot_act{timeout = OutT, need_next = 1}
                     <- get_act_play_list()]
            of
            [] -> 0;
            TL -> lists:max(TL)
        end,
    case T > 0 of
        true ->
            logger:debug("[~ts]本次剧情[~w]播放超时时间设置：~w",
                         [Role#role.name, Id, T],
                         plot_act,
                         1291),
            Timer = #timer{id = plot_act_time_out, times = 1,
                           timeout = T, f = fun handle_timeout/3,
                           a = [Id, ActIdx]},
            role_timer:set(Timer, Role);
        false -> del_timeout(Role)
    end;
set_timeout(Role, _Id, _ActIdx) -> Role.

del_timeout(Role) ->
    role_timer:del(plot_act_time_out, Role).

end_plot(#plot{act_idx = ActIdx},
         #plot_trigger{id = Id, name = Name, can_skip = CanSkip,
                       hide_layer = HideLayer},
         Role) ->
    role:link_send(Role,
                   11010,
                   {Id,
                    Name,
                    CanSkip,
                    HideLayer,
                    [#plot_act{id = ActIdx,
                               type = plot_fun:act_to_type(end_plot)}]}),
    ok;
end_plot(ActIdx,
         #plot_trigger{id = Id, name = Name, can_skip = CanSkip,
                       hide_layer = HideLayer},
         Role)
    when is_integer(ActIdx) ->
    role:link_send(Role,
                   11010,
                   {Id,
                    Name,
                    CanSkip,
                    HideLayer,
                    [#plot_act{id = ActIdx,
                               type = plot_fun:act_to_type(end_plot)}]}),
    ok.

reset_pos([[{goto, {point, MapId, X, Y}} | _] | _],
          Role) ->
    reset_pos({MapId, X, Y}, Role);
reset_pos([{goto, {point, MapId, X, Y}} | _], Role) ->
    reset_pos({MapId, X, Y}, Role);
reset_pos([{way_finding_point, {point, MapId, X, Y}}
           | _T],
          Role) ->
    reset_pos({MapId, X, Y}, Role);
reset_pos([{way_finding, 0, UnitId} | T],
          Role = #role{m_plot = #m_plot{unit_list = UnitList}}) ->
    case lists:keyfind(UnitId, #plot_unit.id, UnitList) of
        #plot_unit{map = MapId, x = X, y = Y} ->
            reset_pos({MapId, X, Y}, Role);
        _ -> reset_pos(T, Role)
    end;
reset_pos([{way_finding, BattleId, UnitId} | T],
          Role) ->
    case unit_mgr:info({battle_id(BattleId, Role), UnitId})
        of
        {ok, #unit{pos = #pos{map = MapId, x = X, y = Y}}} ->
            reset_pos({MapId, X, Y}, Role);
        _ -> reset_pos(T, Role)
    end;
reset_pos([{transmit, _Mode, _Speed, X, Y} | _T],
          Role) ->
    reset_pos({X, Y}, Role);
reset_pos([{transmit_role, _Mode, _Speed, X, Y} | _T],
          Role = #role{pos = #pos{x = X1, y = Y1}}) ->
    reset_pos({X + X1, Y + Y1}, Role);
reset_pos([_I | T], Role) -> reset_pos(T, Role);
reset_pos({MapId, X, Y},
          Role = #role{pos = #pos{map = MapId}}) ->
    reset_pos({X, Y}, Role);
reset_pos({X, Y},
          Role = #role{pos = #pos{x = X, y = Y}}) ->
    Role;
reset_pos({X, Y}, Role) ->
    map:role_transmit(4, 1, X, Y, Role);
reset_pos({MapId, X, Y},
          Role = #role{status = 0, s_event = 0,
                       m_combat = #m_combat{pid = CombatPid}})
    when not is_pid(CombatPid) ->
    case map:role_enter({MapId, X, Y}, Role) of
        {ok, NRole} when is_record(NRole, role) -> NRole;
        _ -> Role
    end;
reset_pos(_, Role) -> Role.

battle_id(BattleId, _Role) -> BattleId.

get_end_plot_act() ->
    #plot_act{type = plot_fun:act_to_type(end_plot)}.

warn(Ids = [_, _ | _], _Role) ->
    Msg = util:flist(lang:get("要悲剧了！同时播放剧情：~w"), [Ids]),
    logger:info("~ts", [Msg], plot_act, 1369),
    ok;
warn(_Ids, _Role) -> ok.

