-file("src/mod/honor/honor.erl", 1).

-module(honor).

-export([init/0,
         push/2,
         calc/2,
         login/1,
         honor_check/1,
         use/4,
         cancel/2,
         add_and_use/3,
         add/3,
         replace/2,
         del/3,
         broadcast/2,
         has_honor/2,
         type_list/2,
         replace/4,
         get_looks/1,
         update_honor/2,
         reset/1,
         exchange_pre_honor/2,
         use_pre/2,
         add_pre_honor/3,
         add_and_use_pre_honor/3,
         get_pre_honor_reward/2,
         repair_gods_duel/1,
         calc_collect_val/1,
         check_repeat/2]).

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

-file("src/mod/honor/honor.erl", 50).

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

-file("src/mod/honor/honor.erl", 51).

-file("inc/honor.hrl", 1).

-record(m_honor,
        {ver = 3,
         use_id = 0,
         last_id = 0,
         r_list = [] :: list(),
         pre_id = 0,
         r_pre_list = [] :: list(),
         pre_reward_list = [] :: list()}).

-record(honor,
        {id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(pre_honor,
        {pre_id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_info,
        {key :: undefined | atom(),
         list = [] :: list(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         mode_type = 0 :: non_neg_integer(),
         show_type = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         is_cast = 0,
         sex = 2 :: non_neg_integer(),
         attr_list = [] :: list(),
         is_can_pre = 0 :: non_neg_integer(),
         collect_val = 0 :: non_neg_integer(),
         color = 12 :: non_neg_integer()}).

-record(pre_honor_base,
        {pre_id = 0 :: non_neg_integer(),
         pre_name = "" :: list(),
         is_cast = 0,
         items = [] :: list(),
         loss_items = [] :: list()}).

-file("src/mod/honor/honor.erl", 52).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/honor/honor.erl", 53).

-file("inc/looks.hrl", 1).

-file("src/mod/honor/honor.erl", 54).

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

-file("src/mod/honor/honor.erl", 55).

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

-file("src/mod/honor/honor.erl", 56).

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

-file("src/mod/honor/honor.erl", 57).

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

-file("src/mod/honor/honor.erl", 58).

-file("inc/wedding.hrl", 1).

-record(m_wedding,
        {ver = 1,
         lover_id = {0, "", 0},
         lover_name = "",
         status = 0,
         honor_ids = [],
         reward = [],
         mail = []}).

-record(lover,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         lover_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         lover_name = "" :: bitstring(),
         type = 1 :: 1..2,
         status = 1 :: 0..2,
         ring_lev = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         order_index = 0 :: non_neg_integer(),
         order_time = 0 :: non_neg_integer(),
         atmosp = 0 :: non_neg_integer(),
         index = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lover_sex = 2 :: 0..2,
         lover_classes = 0,
         lover_lev = 0,
         lover_fc = 0,
         lover_pet_fc = 0,
         lover_face = 0}).

-record(guest,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid = 0 :: 0 | pid(),
         act_list = [],
         unit_list = [],
         classes = 0,
         sex = 0,
         lev = 0,
         face = 0}).

-record(wedding_atmosp_data,
        {type = 0 :: non_neg_integer(),
         min_val = 0 :: non_neg_integer(),
         max_val = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         scene_reward = [] :: list(),
         scene_msg = "" :: string(),
         male_reward = [] :: list(),
         famale_reward = [] :: list(),
         title = "" :: string(),
         content = "" :: string()}).

-record(wedding_act_data,
        {id = 0,
         type = 0,
         target = 1,
         free_num = 0,
         max_num = 0,
         cost = [],
         msg = "",
         log_msg = "",
         atmosp = 0,
         gain = [],
         main_gain = [],
         effect_type = 0,
         effect_id = 1,
         effect_num = 1,
         cd = 0}).

-record(wedding_rank, {type = 0, list = []}).

-record(wedding_rank_rc,
        {id = {{0, "", 0}, {0, "", 0}},
         male_id = {0, "", 0},
         male_name = "",
         rank = 1,
         time = 0 :: non_neg_integer(),
         male_sex = 0 :: 0..2,
         male_classes = 0 :: 0..4,
         male_lev = 0 :: non_neg_integer(),
         female_id = {0, "", 0},
         female_name = "",
         female_sex = 0 :: 0..2,
         female_classes = 0 :: 0..4,
         female_lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(wedding_rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys =
             [#wedding_rank_rc.val3,
              #wedding_rank_rc.val2,
              #wedding_rank_rc.val1]
             :: [pos_integer()],
         min_val = 1 :: pos_integer()}).

-record(wedding_unit_data,
        {id = 0, target = 0, rand = [], limit = 0}).

-record(wedding_rank_honor_data,
        {type = 0,
         rank = 0,
         male_honor = 0,
         female_honor = 0,
         reward = [],
         title = "",
         content = ""}).

-record(wedding_rank_honor_type_data,
        {type = 0, day = day}).

-file("src/mod/honor/honor.erl", 59).

-file("inc/teacher.hrl", 1).

-record(m_teacher,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         status = 0,
         daily = [],
         daily_reward = 0,
         daily_time = 0,
         target = [],
         target_reward = [],
         target_rewarded = [],
         target_over = [],
         evaluation = [],
         study_lev = 0,
         mtime = 0,
         daily_goals = [],
         goals_times = 0}).

-record(teacher,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         msg = "",
         teacher_score = 0,
         teacher_score_offline = 0,
         login_time = 0,
         fc = 0,
         students = []}).

-record(student,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         status = 0,
         in_time = 0,
         out_time = 0,
         login_time = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         daily = [],
         daily_time = 0,
         daily_reward = 0,
         quest_student_reward = 0,
         quest_teacher_reward = 0,
         encourage_time = 0,
         target = [],
         teacher_score = 0,
         fc = 0,
         target_reward = [],
         target_rewarded = []}).

-record(teacher_daily,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_daily_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         reward = [],
         exp = 0}).

-record(teacher_target,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_target_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         student_reward = [],
         teacher_reward = [],
         student_exp = 0,
         teacher_exp = 0}).

-record(teacher_sign,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         online = 0,
         login_time = 0,
         logout_time = 0,
         online_time = 0,
         is_sign = 0,
         msg = ""}).

-record(teacher_quit_desc_data,
        {min = 0, max = 0, radio = 0, title = "", msg = ""}).

-record(teacher_student_sign_info,
        {id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         msg = ""}).

-file("src/mod/honor/honor.erl", 60).

-file("inc/sworn.hrl", 1).

-record(m_sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         time = 0 :: list()}).

-record(sworn_role,
        {ver = 0 :: pos_integer(),
         role_id = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         status = 0 :: non_neg_integer()}).

-record(sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         time = 0 :: non_neg_integer(),
         sworn_val = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         head = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         members = [] :: list(),
         votes = [] :: list(),
         trends = [] :: list(),
         lists = [] :: list()}).

-record(sworn_member,
        {ver = 0 :: pos_integer(),
         pos = 0 :: non_neg_integer(),
         role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         name_defined = "" :: string(),
         lev = 0 :: pos_integer(),
         classes = 0 :: pos_integer(),
         sex = 0 :: pos_integer(),
         times = 0 :: pos_integer(),
         free = 0 :: pos_integer()}).

-record(sworn_trend,
        {type = 0 :: non_neg_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         r_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         r_name = "" :: string(),
         r_lev = 0 :: non_neg_integer(),
         r_sex = 0 :: non_neg_integer(),
         r_classes = 0 :: non_neg_integer(),
         rename = "" :: string(),
         timeout = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         reason_id = 0 :: non_neg_integer(),
         reason_msg = "" :: string(),
         votes = [] :: list(),
         agree = 0 :: non_neg_integer(),
         lists = [] :: list()}).

-record(sworn_evt,
        {role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         finish = 0 :: non_neg_integer(),
         skill = 0 :: non_neg_integer(),
         invite = 0 :: non_neg_integer(),
         prefix = 0 :: non_neg_integer(),
         personal = 0 :: non_neg_integer()}).

-file("src/mod/honor/honor.erl", 61).

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

-file("src/mod/honor/honor.erl", 62).

-file("inc/fashion.hrl", 1).

-record(m_fashion,
        {ver = 5,
         head = [],
         clothes = [],
         belt = [],
         ring = [],
         head_dyeing = [],
         clothes_dyeing = [],
         head_ornament = [],
         collect_lev = 0,
         collect_val = 0,
         classes_eqm = 0,
         eqm = []}).

-record(fashion_dress_data,
        {base_id = 0,
         name = "",
         type,
         quality = 0,
         classes = 0,
         sex = 2,
         lev,
         set_id = 0,
         texture_id = 0,
         is_origin = 0,
         loss = [],
         attrs = [],
         score = 0,
         can_use = 0,
         model_id = 0}).

-record(fashion_wear_data,
        {id = 0,
         base_id = 0,
         expire_type = 0,
         expire_time = 0}).

-record(fashion_dress,
        {base_id = 0,
         expire_type = 0,
         expire_time = 0,
         is_wear = 0}).

-record(fashion_dyeing, {dyeing_id = 0, is_use = 0}).

-record(fashion_time_data,
        {id = 0, expire_type = 0, expire_time = 0}).

-file("src/mod/honor/honor.erl", 63).

-file("inc/gods_duel.hrl", 1).

-record(gods_duel_team,
        {ver = 1 :: pos_integer(),
         id = {0, "", 0},
         name = "",
         lev = 0,
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         applys = [],
         invite_info = [],
         declaration = "",
         win_times = 0,
         loss_times = 0,
         qualification = 0,
         team_group_256 = 0,
         team_group_64 = 0,
         team_group_8 = 0,
         team_group_4 = 0,
         team_seq = 0,
         team_index = 0}).

-record(gods_duel_team_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         position = 0,
         fight_capacity = 0,
         join_time = 0}).

-record(m_gods_duel,
        {ver = 2, team_id = {0, "", 0}, gods_score = 0}).

-record(gods_duel_season_data,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_season_info,
        {ver = 1,
         id = 0,
         status = 0,
         teams = [],
         group_order = 0,
         season_time_info = []}).

-record(invite_info,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         break_times = 0,
         classes = 0,
         sex = 0,
         total_fc = 0,
         online = 0}).

-record(gods_duel_join_team,
        {id = {0, "", 0},
         team_pid = undefined,
         team_data = undefined,
         fighters = [],
         is_ready = false}).

-record(gods_duel_match,
        {id = {0, 0},
         teams = [],
         combat_pid = undefined :: pid(),
         calc_args = [],
         combat_ref = undefined,
         is_over = 0,
         map_id = 0,
         map_pid = undefined,
         roles = []}).

-record(gods_duel_match_profile,
        {id = 0,
         ver = 1,
         season_id = 0,
         match_type = 0,
         match_round = 0,
         match_id = 0,
         group_id = 0,
         combat_type = 0,
         atk_name,
         dfd_name,
         combat_pid = undefined :: pid(),
         is_over = 0,
         platform = "",
         zone_id = 0,
         time = 0,
         fc_diff = 0,
         round = 0}).

-record(gods_duel_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(gods_duel_vote,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(gods_duel_vote_choice,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         match_zone = 0,
         is_right = 0 :: 0..2}).

-record(gods_duel_poll,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         voted_cnt = 0 :: non_neg_integer()}).

-record(gods_duel_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 1 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         gods_duel_score = 0 :: non_neg_integer()}).

-record(gods_challenge_info,
        {id, combat_pid, is_over = 0}).

-record(gods_duel_team_rank,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_team_rank_data,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         win_times = 0,
         qualification = 0,
         rank = 0}).

-record(gods_duel_team_rank_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 2,
         lev = 0,
         break_times = 0,
         position = 2,
         fight_capacity = 0,
         looks = []}).

-record(gods_challenge_team,
        {season_id = 0,
         team_name = "",
         member_num = 0,
         members = []}).

-record(gods_challenge_team_mate,
        {id = {0, "", 0}, name = ""}).

-file("src/mod/honor/honor.erl", 64).

init() -> #m_honor{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role) ->
    Role1 = honor_mgr:login(Role),
    Role2 = reset_classes_sex(Role1),
    Role3 = case repair_gods_duel(Role2) of
                {ok, Role4} -> Role4;
                _ -> Role2
            end,
    NewRole = broadcast(Role3, not_push),
    {ok, add_check_timer(NewRole)}.

reset_classes_sex(Role = #role{m_honor =
                                   #m_honor{r_list = All}}) ->
    do_reset_classes_sex(All, Role, []).

do_reset_classes_sex([],
                     Role = #role{sex = Sex, classes = Classes,
                                  m_honor =
                                      MHonor = #m_honor{use_id = UseId,
                                                        last_id = LastId}},
                     L) ->
    NewUseId = honor_data:to_classes_sex({UseId,
                                          Classes,
                                          Sex}),
    NewLastId = honor_data:to_classes_sex({LastId,
                                           Classes,
                                           Sex}),
    Role#role{m_honor =
                  MHonor#m_honor{use_id = NewUseId, last_id = NewLastId,
                                 r_list = L}};
do_reset_classes_sex([Honor = #honor{id = Id} | T],
                     Role = #role{sex = Sex, classes = Classes}, L) ->
    NewId = honor_data:to_classes_sex({Id, Classes, Sex}),
    do_reset_classes_sex(T,
                         Role,
                         [Honor#honor{id = NewId} | L]).

reset(Role = #role{m_honor = MHonor}) ->
    {Flag, NewMHonor} = update_honor(Role, MHonor),
    case Flag of
        update ->
            Role1 = Role#role{m_honor = NewMHonor},
            Role2 = broadcast(Role1, push),
            push(Role2, push),
            Role2;
        _ -> Role
    end.

-spec honor_check(#role{}) -> ok | {ok, #role{}}.

honor_check(Role = #role{m_honor =
                             MHonor = #m_honor{r_list = RList}}) ->
    Now = date:unixtime(),
    Fun = fun (#honor{end_time = EndTime}) ->
                  EndTime =:= 0 orelse EndTime > Now
          end,
    {NewRList, DelHonor} = lists:partition(Fun, RList),
    NewMHonor = MHonor#m_honor{r_list = NewRList},
    {_Flag, NewMHonor1} = update_honor(Role, NewMHonor),
    NRole = Role#role{m_honor = NewMHonor1},
    push_info(del, NRole, DelHonor),
    NewRole = broadcast(NRole, push),
    {ok, add_check_timer(NewRole)}.

-spec push(#role{}, Push :: push | not_push) -> any().

push(Role = #role{m_honor =
                      #m_honor{use_id = UseId, r_list = Honors,
                               pre_id = PreID, r_pre_list = PreList,
                               pre_reward_list = PreRewardList}},
     push) ->
    role:link_send(Role,
                   12700,
                   {UseId, Honors, PreID, PreList, PreRewardList}),
    ok;
push(_Role, _Push) -> skip.

push_use(Role = #role{m_honor =
                          #m_honor{use_id = UseId}},
         push) ->
    role:link_send(Role, 12706, {UseId}),
    ok;
push_use(_Role, _Push) -> skip.

push_info(add, Role, #honor{id = Id}) ->
    push_info(add, Role, Id);
push_info(add, Role, Ids) when is_list(Ids) ->
    lists:foreach(fun (Id) -> push_info(add, Role, Id) end,
                  Ids),
    ok;
push_info(add, Role, Id) ->
    role:link_send(Role, 12703, {Id}),
    ok;
push_info(del, Role, #honor{id = Id}) ->
    push_info(del, Role, Id);
push_info(del, Role, Ids) when is_list(Ids) ->
    lists:foreach(fun (Id) -> push_info(del, Role, Id) end,
                  Ids),
    ok;
push_info(del, Role, Id) ->
    role:link_send(Role, 12704, {Id}),
    ok;
push_info(update, Role, H = #honor{}) ->
    push_info(update, Role, [H]);
push_info(update, Role, List) when is_list(List) ->
    role:link_send(Role, 12705, {List}),
    ok;
push_info(add_pre, Role, #pre_honor{pre_id = PreID}) ->
    push_info(add_pre, Role, PreID);
push_info(add_pre, Role, Ids) when is_list(Ids) ->
    lists:foreach(fun (PreID) ->
                          push_info(add_pre, Role, PreID)
                  end,
                  Ids),
    ok;
push_info(add_pre, Role, PreID) ->
    push_info(add_pre, Role, 1, PreID);
push_info(_, _, _) -> ok.

push_info(add_pre, Role, Code, PreID) ->
    role:link_send(Role, 12707, {Code, PreID}),
    ok.

-spec calc(Ac :: #attr_calc{},
           Role :: #role{}) -> NewAc :: #attr_calc{}.

calc(Ac, #role{m_honor = #m_honor{r_list = All}}) ->
    do_calc(Ac, All).

do_calc(Ac, []) -> Ac;
do_calc(Ac, [#honor{id = Id} | T]) ->
    case honor_data:get(Id) of
        #honor_base{attr_list = AttrL = [_ | _]} ->
            NewAttrL = attr_type:to_attr(fixed, AttrL),
            case attr_type:do_attr(NewAttrL, Ac) of
                {false, Reason} ->
                    logger:error("honor属性计算出错[~w]:[~w]",
                                 [Id, Reason],
                                 honor,
                                 189),
                    do_calc(Ac, T);
                {ok, NewAc} -> do_calc(NewAc, T)
            end;
        _ -> do_calc(Ac, T)
    end.

-spec replace(#role{},
              #honor{} | pos_integer()) -> #role{}.

replace(Role, HonorId) when is_integer(HonorId) ->
    replace(Role, #honor{id = HonorId});
replace(Role = #role{m_honor =
                         MHonor = #m_honor{r_list = RList}},
        Honor = #honor{id = Id}) ->
    NewRList = lists:keystore(Id, #honor.id, RList, Honor),
    NewMHonor = MHonor#m_honor{r_list = NewRList},
    NewRole = Role#role{m_honor = NewMHonor},
    NewRole.

update_honor(Role,
             Mhonor = #m_honor{use_id = UseId, last_id = LastId,
                               r_list = RList}) ->
    Result1 = case lists:keymember(UseId, #honor.id, RList)
                  of
                  true ->
                      case check_event(Role, UseId) of
                          true -> true;
                          false ->
                              {false, lists:keydelete(UseId, #honor.id, RList)}
                      end;
                  false -> {false, RList}
              end,
    case Result1 of
        true -> {false, Mhonor};
        {false, NewRList} ->
            case lists:keymember(LastId, #honor.id, NewRList) of
                true ->
                    case check_event(Role, LastId) of
                        true ->
                            Mhonor1 = Mhonor#m_honor{use_id = LastId,
                                                     last_id = 0,
                                                     r_list = NewRList},
                            {update, Mhonor1};
                        false ->
                            NewRList1 = lists:keydelete(LastId,
                                                        #honor.id,
                                                        NewRList),
                            Mhonor1 = Mhonor#m_honor{use_id = 0, last_id = 0,
                                                     r_list = NewRList1},
                            {update, Mhonor1}
                    end;
                false ->
                    Mhonor1 = Mhonor#m_honor{use_id = 0, last_id = 0,
                                             r_list = NewRList},
                    {update, Mhonor1}
            end
    end.

-spec add(pid() | #role{} | tuple(),
          pos_integer() | tuple(),
          Push :: push | not_push) -> ok | {ok, #role{}}.

add(Pid, HonorInfo, Push) when is_pid(Pid) ->
    role:apply(async, Pid, {honor, add, [HonorInfo, Push]}),
    ok;
add({RoleId, Platform, Zone}, HonorInfo, Push) ->
    case role_query:pid(by_id, RoleId, Platform, Zone) of
        {ok, RolePid} when is_pid(RolePid) ->
            role:apply(async,
                       RolePid,
                       {honor, add, [HonorInfo, Push]});
        _ -> skip
    end,
    ok;
add(Role, HonorId, Push) when is_integer(HonorId) ->
    add(Role, #honor{id = HonorId}, Push);
add(Role, {HonorId, Time}, Push) ->
    add(Role, #honor{id = HonorId, end_time = Time}, Push);
add(Role = #role{classes = Classes, sex = Sex,
                 m_honor = MHonor = #m_honor{r_list = RList},
                 m_fashion = Mfashion = #m_fashion{collect_val = Cval}},
    Honor = #honor{id = Id, end_time = EndT1}, Push) ->
    Result = case honor_data:get(Id) of
                 #honor_base{type = 3, is_cast = IsCast,
                             collect_val = CollectVal} ->
                     case lists:keyfind(Id, #honor.id, RList) of
                         false ->
                             TypeHonor = type_honor(RList, 3, type),
                             RList2 = RList -- TypeHonor,
                             {true, RList2, IsCast, CollectVal};
                         _ -> false
                     end;
                 #honor_base{type = 4, is_cast = IsCast,
                             collect_val = CollectVal} ->
                     TypeHonor = type_honor(RList, 4, type),
                     RList2 = RList -- TypeHonor,
                     {true, RList2, IsCast, CollectVal};
                 #honor_base{type = 6, is_cast = IsCast,
                             collect_val = CollectVal} ->
                     TypeHonor = type_honor(RList, 6, type),
                     RList2 = RList -- TypeHonor,
                     {true, RList2, IsCast, CollectVal};
                 #honor_base{type = 7, is_cast = IsCast,
                             collect_val = CollectVal} ->
                     TypeHonor = type_honor(RList, 7, type),
                     RList2 = RList -- TypeHonor,
                     {true, RList2, IsCast, CollectVal};
                 #honor_base{type = 10, is_cast = IsCast,
                             collect_val = CollectVal} ->
                     TypeHonor = type_honor(RList, 10, type),
                     RList2 = RList -- TypeHonor,
                     {true, RList2, IsCast, CollectVal};
                 #honor_base{type = 11, is_cast = IsCast,
                             collect_val = CollectVal} ->
                     TypeHonor = type_honor(RList, 11, type),
                     RList2 = RList -- TypeHonor,
                     {true, RList2, IsCast, CollectVal};
                 #honor_base{type = 12, is_cast = IsCast,
                             collect_val = CollectVal} ->
                     TypeHonor = type_honor(RList, 12, type),
                     RList2 = RList -- TypeHonor,
                     {true, RList2, IsCast, CollectVal};
                 #honor_base{type = 13, is_cast = IsCast,
                             collect_val = CollectVal} ->
                     TypeHonor = type_honor(RList, 13, type),
                     RList2 = RList -- TypeHonor,
                     {true, RList2, IsCast, CollectVal};
                 #honor_base{is_cast = IsCast,
                             collect_val = CollectVal} ->
                     RList1 = lists:keydelete(Id, #honor.id, RList),
                     {true, RList1, IsCast, CollectVal};
                 _ -> false
             end,
    case Result of
        false -> ok;
        {true, RList3, IsCast1, CollectVal1} ->
            EndT = case lists:keyfind(Id, #honor.id, RList) of
                       #honor{end_time = EndT2}
                           when EndT2 =:= 0 orelse
                                    EndT1 > 0 andalso EndT2 > EndT1 ->
                           EndT2;
                       _ -> EndT1
                   end,
            Honor1 = Honor#honor{id =
                                     honor_data:to_classes_sex({Id,
                                                                Classes,
                                                                Sex}),
                                 end_time = EndT},
            NewRList = [Honor1 | RList3],
            NewMHonor = MHonor#m_honor{r_list = NewRList},
            NewMfashion = Mfashion#m_fashion{collect_val =
                                                 Cval + CollectVal1},
            case CollectVal1 > 0 of
                true ->
                    Msg = notice:format(lang:get("增加~ts点颜值"),
                                        [{string_2, 1, CollectVal1}]),
                    notice:send(Role, 3, Msg);
                _ -> ok
            end,
            {_Flag, NewMHonor1} = update_honor(Role, NewMHonor),
            Role1 = role_trigger:fire(#evt_honor{id = Id},
                                      Role#role{m_honor = NewMHonor1}),
            Role2 = calc_attr(Role1, Push),
            Role3 = Role2#role{m_fashion = NewMfashion},
            case IsCast1 of
                1 -> push_info(add, Role3, Honor1);
                0 -> skip
            end,
            push(Role3, Push),
            {ok, broadcast(Role3, Push)};
        _ ->
            logger:error("放发不存在的称号：~w", [Id], honor, 339),
            ok
    end.

-spec add_and_use(pid() | #role{} | tuple(),
                  pos_integer() | tuple(),
                  Push :: push | not_push) -> ok | {ok, #role{}}.

add_and_use(Pid, HonorInfo, Push) when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {honor, add_and_use, [HonorInfo, Push]});
add_and_use({RoleId, Platform, Zone}, HonorInfo,
            Push) ->
    case role_query:pid(by_id, RoleId, Platform, Zone) of
        {ok, RolePid} when is_pid(RolePid) ->
            role:apply(async,
                       RolePid,
                       {honor, add_and_use, [HonorInfo, Push]});
        _ -> skip
    end,
    ok;
add_and_use(Role, [], _Push) -> {ok, Role};
add_and_use(Role, [HonorId | T], Push) ->
    case add_and_use(Role, HonorId, Push) of
        {ok, NRole} -> add_and_use(NRole, T, Push);
        _ -> add_and_use(Role, T, Push)
    end;
add_and_use(Role, HonorId, Push)
    when is_integer(HonorId) ->
    add_and_use(Role, #honor{id = HonorId}, Push);
add_and_use(Role, {HonorId, Time}, Push) ->
    add_and_use(Role,
                #honor{id = HonorId, end_time = Time},
                Push);
add_and_use(Role = #role{name = _Name},
            Honor = #honor{id = Id}, Push) ->
    logger:debug("=============~ts", [_Name], honor, 366),
    case add(Role, Honor, not_push) of
        {ok, NRole} ->
            case use(replace, NRole, Id, Push) of
                {ok, NewRole} ->
                    NR = calc_attr(NewRole, Push),
                    {ok, NR};
                skip ->
                    NR = calc_attr(NRole, Push),
                    push(NR, Push),
                    {ok, broadcast(NR, Push)};
                {error, _Reason} ->
                    NR = calc_attr(NRole, Push),
                    push(NR, Push),
                    {ok, broadcast(NR, Push)}
            end;
        _ -> ok
    end.

-spec del(#role{} | tuple(), Id :: pos_integer(),
          Push :: push | not_push) -> ok | {ok, #role{}}.

del({RoleId, Platform, Zone}, HonorId, Push) ->
    case role_query:pid(by_id, RoleId, Platform, Zone) of
        {ok, RolePid} when is_pid(RolePid) ->
            role:apply(async,
                       RolePid,
                       {honor, del, [HonorId, Push]});
        _ -> skip
    end,
    ok;
del(Role, [], _Push) -> {ok, Role};
del(Role, [HonorId | T], Push) ->
    case del(Role, HonorId, Push) of
        {ok, NRole} -> del(NRole, T, Push);
        _ -> del(Role, T, Push)
    end;
del(Role = #role{m_honor =
                     MHonor = #m_honor{r_list = RList}},
    HonorId, Push) ->
    case lists:keyfind(HonorId, #honor.id, RList) of
        false -> {ok, Role};
        #honor{} ->
            NewRlist = lists:keydelete(HonorId, #honor.id, RList),
            NewMHonor = MHonor#m_honor{r_list = NewRlist},
            {Flag, NewMHonor1} = update_honor(Role, NewMHonor),
            Role1 = Role#role{m_honor = NewMHonor1},
            Role2 = calc_attr(Role1, Push),
            push_info(del, Role2, HonorId),
            case Flag of
                update ->
                    push_use(Role2, Push),
                    {ok, broadcast(Role2, Push)};
                _ -> {ok, Role2}
            end
    end.

exchange_pre_honor(Role = #role{m_honor =
                                    #m_honor{r_pre_list = PreList}},
                   PreID) ->
    case lists:keyfind(PreID, #pre_honor.pre_id, PreList) of
        #pre_honor{} -> {false, lang:get("已经拥有该称号前缀，无需再次兑换")};
        _ ->
            case honor_data:get_pre(PreID) of
                #pre_honor_base{loss_items = LossItem} ->
                    case LossItem of
                        [_ | _] ->
                            Loss = format:val_to_loss(LossItem),
                            role:send_buff_begin(),
                            case role_gain:do(Loss, Role) of
                                {ok, Role1} ->
                                    case honor:add_pre_honor(Role1, PreID, push)
                                        of
                                        {ok, NewRole} ->
                                            role:send_buff_flush(),
                                            {ok, NewRole};
                                        {false, Reason} ->
                                            role:send_buff_clean(),
                                            {false, Reason};
                                        _ ->
                                            role:send_buff_clean(),
                                            {false, lang:get("称号前缀卡兑换失败")}
                                    end;
                                {false, #loss{msg = Msg}} ->
                                    role:send_buff_clean(),
                                    {false, Msg};
                                _ ->
                                    role:send_buff_clean(),
                                    {false, lang:get("称号前缀卡兑换失败")}
                            end;
                        _ -> {false, lang:get("该称号前缀不能兑换")}
                    end;
                _ -> {false, lang:get("该称号前缀不能兑换")}
            end
    end.

use_pre(Role, PreID) ->
    case PreID =:= 0 of
        true -> cancel_pre_honor(Role);
        _ -> use_pre_honor(Role, PreID, push)
    end.

-spec replace(#role{}, [Old :: non_neg_integer()],
              [New :: any()], Push :: push | not_push) -> #role{}.

replace(Role, OldHonorId, NewHonor, Push) ->
    Role1 = case del(Role, OldHonorId -- NewHonor, Push) of
                {ok, Role0} -> Role0;
                _ -> Role
            end,
    case add_and_use(Role1, NewHonor, Push) of
        {ok, NRole} -> NRole;
        _ -> Role1
    end.

use(Mod,
    Role = #role{m_honor = #m_honor{pre_id = OPreID}}, Id,
    Push) ->
    case check_replace(Role) of
        {false, Reason} -> {error, Reason};
        true ->
            case do_use(Mod, Role, Id) of
                skip -> skip;
                {error, Reason} -> {error, Reason};
                {ok,
                 NewRole = #role{m_honor = #m_honor{pre_id = NPreID}}} ->
                    case Push of
                        push ->
                            case OPreID =/= NPreID andalso NPreID =:= 0 of
                                true ->
                                    HonorPreName = case
                                                       honor_data:get_pre(OPreID)
                                                       of
                                                       #pre_honor_base{pre_name
                                                                           =
                                                                           PreName} ->
                                                           PreName;
                                                       _ -> lang:get("称号")
                                                   end,
                                    Msg = notice:format("本称号需单独使用，~ts前缀自动隐藏",
                                                        [{string_2,
                                                          5,
                                                          HonorPreName}]),
                                    notice:send(NewRole, 1, Msg);
                                _ -> skip
                            end;
                        _ -> skip
                    end,
                    push(NewRole, Push),
                    {ok, broadcast(NewRole, Push)}
            end
    end.

cancel(Role = #role{m_honor =
                        MHonor = #m_honor{use_id = Id}},
       Id) ->
    case check_cancel(Role) of
        true ->
            NewMHonor = MHonor#m_honor{use_id = 0, last_id = 0,
                                       pre_id = 0},
            NewRole = Role#role{m_honor = NewMHonor},
            push_use(NewRole, push),
            {ok, broadcast(NewRole, push)};
        {false, Reason} -> {false, Reason}
    end;
cancel(_, _) -> {false, lang:get("该称号没有在使用中")}.

use_pre_honor(Role, PreId, Push) ->
    case do_use_pre_honor(Role, PreId) of
        {false, Reason} -> {false, Reason};
        {ok, NewRole} ->
            push(NewRole, Push),
            {ok, broadcast(NewRole, Push)}
    end.

cancel_pre_honor(#role{m_honor =
                           #m_honor{pre_id = 0}}) ->
    {false, lang:get("尚未使用称号前缀，无需取消称号前缀")};
cancel_pre_honor(#role{m_honor =
                           #m_honor{use_id = 0}}) ->
    {false, lang:get("尚未使用称号，不能取消称号前缀")};
cancel_pre_honor(Role = #role{m_honor = MHonor}) ->
    case check_cancel(Role) of
        true ->
            NewMHonor = MHonor#m_honor{pre_id = 0},
            NewRole = Role#role{m_honor = NewMHonor},
            push(NewRole, push),
            {ok, broadcast(NewRole, push)};
        {false, Reason} -> {false, Reason}
    end.

-spec broadcast(#role{},
                Push :: push | not_push) -> #role{}.

broadcast(Role = #role{s_looks = Looks,
                       m_honor = #m_honor{use_id = UseId, pre_id = PreID}},
          Push) ->
    Fun = fun ({Type, _Mode, _Val, _Bstr}) -> Type =:= 52
          end,
    Fun2 = fun ({Type, _Mode, _Val, _Bstr}) -> Type =:= 76
           end,
    {HonorLook, BaseLook1} = lists:partition(Fun, Looks),
    {PreHonorLook, BaseLook} = lists:partition(Fun2,
                                               BaseLook1),
    friend_zone:update(Role, honor, UseId),
    friend_zone:update(Role, pre_honor, PreID),
    NewHonorLook = case check_look(Role, UseId, HonorLook)
                       of
                       {true, AddLooks} -> AddLooks;
                       false -> HonorLook
                   end,
    NewPreHonorLook = case check_pre_look(Role,
                                          PreID,
                                          PreHonorLook)
                          of
                          {true, AddPreLooks} -> AddPreLooks;
                          false -> PreHonorLook
                      end,
    NewLooks = BaseLook ++ NewHonorLook ++ NewPreHonorLook,
    case NewLooks =:= Looks of
        true -> Role;
        _ ->
            NewRole = Role#role{s_looks = NewLooks},
            case Push of
                push -> map:role_update(NewRole);
                _ -> skip
            end,
            NewRole
    end;
broadcast(Role, _Push) -> Role.

get_looks(#role{s_event = 27}) -> [];
get_looks(Role = #role{m_honor =
                           #m_honor{use_id = UseId, pre_id = PreHonorID}}) ->
    HonorLooks = case check_look(Role, UseId, []) of
                     {true, AddLooks} -> AddLooks;
                     false -> []
                 end,
    PreLooks = case check_pre_look(Role, PreHonorID, []) of
                   {true, AddPreLooks} -> AddPreLooks;
                   false -> []
               end,
    PreLooks ++ HonorLooks.

-spec has_honor(#role{}, pos_integer()) -> true | false.

has_honor(#role{m_honor = #m_honor{r_list = All}},
          HonorId) ->
    case lists:keyfind(HonorId, #honor.id, All) of
        #honor{} -> true;
        _ -> false
    end.

-spec type_list(#role{},
                Type :: non_neg_integer()) -> [HonorId ::
                                                   pos_integer()].

type_list(#role{m_honor = #m_honor{r_list = RList}},
          Type) ->
    do_type_list(RList, Type, []).

do_type_list([], _Type, L) -> L;
do_type_list([#honor{id = Id} | T], Type, L) ->
    case honor_data:get(Id) of
        #honor_base{type = Type} ->
            do_type_list(T, Type, [Id | L]);
        _ -> do_type_list(T, Type, L)
    end.

calc_attr(Role, push) -> attr:calc_and_push(Role);
calc_attr(Role, _Push) -> attr:calc(Role).

check_look(_Role, 0, _HonorLook) -> {true, []};
check_look(Role, UseId, HonorLook) ->
    L = [{Id, ShowType}
         || {_, ShowType, Id, ""} <- HonorLook],
    case do_check_same(UseId, L) of
        true -> false;
        {false, L3} -> do_check_look(Role, L3, [])
    end.

do_check_look(_Role, [], L) -> {true, L};
do_check_look(Role = #role{m_wedding =
                               #m_wedding{lover_name = LoverName},
                           m_teacher = #m_teacher{name = TeacherName},
                           m_sworn =
                               #m_sworn{name = SwornName,
                                        name_defined = SwornNameDefined}},
              [{Id, ShowType} | T], L) ->
    NewL = case honor_data:get(Id) of
               HB = #honor_base{} -> [get_honor_color(HB) | L];
               _ -> L
           end,
    case honor_data:get(Id) of
        #honor_base{type = 6} ->
            do_check_look(Role,
                          T,
                          [{52, ShowType, Id, LoverName} | NewL]);
        #honor_base{type = 7} ->
            do_check_look(Role,
                          T,
                          [{52, ShowType, Id, TeacherName} | NewL]);
        #honor_base{type = 10} ->
            SwornNameHonor = util:flist("~ts之~ts",
                                        [SwornName, SwornNameDefined]),
            role:apply(async,
                       self(),
                       {friend_zone, update, [sworn, SwornNameHonor]}),
            do_check_look(Role,
                          T,
                          [{52, ShowType, Id, SwornNameHonor} | NewL]);
        _ ->
            do_check_look(Role, T, [{52, ShowType, Id, ""} | NewL])
    end.

get_honor_color(#honor_base{color = Color}) ->
    {55, 0, Color, []}.

do_check_same(UseId, L2) ->
    NewL1 = do_get_look(UseId),
    case length(NewL1) =:= length(L2) andalso
             NewL1 -- L2 =:= []
        of
        true -> true;
        false -> {false, NewL1}
    end.

do_get_look(UseId) ->
    case honor_data:get(UseId) of
        #honor_base{show_type = ShowType} ->
            [{UseId, ShowType}];
        _ -> []
    end.

check_pre_look(#role{m_honor = #m_honor{use_id = 0}}, _,
               PreHonorLook) ->
    case PreHonorLook of
        [] -> false;
        _ -> {true, []}
    end;
check_pre_look(_, 0, PreHonorLook) ->
    case PreHonorLook of
        [] -> false;
        _ -> {true, []}
    end;
check_pre_look(#role{m_honor =
                         #m_honor{use_id = UseID}},
               PreHonorID, PreHonorLook) ->
    case honor_data:get(UseID) of
        #honor_base{show_type = ShowType, is_can_pre = 1} ->
            case lists:keyfind(PreHonorID, 3, PreHonorLook) of
                {76, ShowType, PreHonorID, _} -> false;
                _ ->
                    {true,
                     lists:keystore(PreHonorID,
                                    3,
                                    PreHonorLook,
                                    {76, ShowType, PreHonorID, ""})}
            end;
        _ ->
            case PreHonorLook of
                [] -> false;
                _ -> {true, []}
            end
    end.

do_use_pre_honor(#role{m_honor =
                           #m_honor{pre_id = PreId}},
                 PreId) ->
    {false, lang:get("称号前缀正在使用中")};
do_use_pre_honor(#role{m_honor = #m_honor{use_id = 0}},
                 _PreId) ->
    {false, lang:get("当前尚未使用称号，无法使用称号前缀")};
do_use_pre_honor(Role = #role{m_honor =
                                  MHonor = #m_honor{use_id = UseID,
                                                    r_pre_list = PreList}},
                 PreId) ->
    case lists:keyfind(PreId, #pre_honor.pre_id, PreList) of
        #pre_honor{} ->
            case honor_data:get(UseID) of
                #honor_base{is_can_pre = 1} ->
                    NewRole = Role#role{m_honor =
                                            MHonor#m_honor{pre_id = PreId}},
                    {ok, NewRole};
                _ -> {false, lang:get("当期称号不能使用前缀")}
            end;
        _ -> {false, lang:get("暂未获得该前缀")}
    end.

do_use(_, #role{m_honor = #m_honor{use_id = UseId}},
       UseId) ->
    {error, lang:get("称号正在使用中")};
do_use(Mod,
       Role = #role{sex = Sex, classes = Classes,
                    m_honor =
                        MHonor = #m_honor{use_id = OldUseId, last_id = LastId,
                                          r_list = RList, pre_id = PreID}},
       UseId) ->
    case lists:keymember(UseId, #honor.id, RList) of
        true ->
            case honor_data:get(UseId) of
                #honor_base{sex = NeedSex}
                    when Sex =/= NeedSex andalso NeedSex =/= 2 ->
                    {error, lang:get("性别不匹配，不能使用")};
                #honor_base{classes = NeedClasses}
                    when Classes =/= NeedClasses andalso
                             NeedClasses =/= 0 ->
                    {error, lang:get("职业不匹配，不能使用")};
                #honor_base{type = Type, is_can_pre = CanPre} ->
                    EventFlag = lists:member(Type, [5]),
                    Result = case lists:keymember(OldUseId,
                                                  #honor.id,
                                                  RList)
                                 of
                                 _ when EventFlag =:= true -> {true, replace};
                                 true when Mod =:= replace -> {true, replace};
                                 true -> false;
                                 false -> {true, false}
                             end,
                    case Result of
                        {true, Flag} ->
                            NewLastId = case Flag =:= false of
                                            true -> LastId;
                                            false ->
                                                case is_event_honor(OldUseId) of
                                                    true -> LastId;
                                                    false -> OldUseId
                                                end
                                        end,
                            NewPreID = case CanPre of
                                           1 -> PreID;
                                           _ -> 0
                                       end,
                            NewMHonor = MHonor#m_honor{use_id = UseId,
                                                       last_id = NewLastId,
                                                       pre_id = NewPreID},
                            NewRole = Role#role{m_honor = NewMHonor},
                            {ok, NewRole};
                        false -> skip
                    end;
                _ -> {error, lang:get("称号基础数据不存在")}
            end;
        _ -> {error, lang:get("您并没有此称号哦")}
    end.

is_event_honor(Id) ->
    case honor_data:get(Id) of
        #honor_base{type = HonorType} ->
            lists:member(HonorType, [5]);
        _ -> false
    end.

type_honor(Honors, Type, Label) ->
    do_type_honor(Honors, Type, [], Label).

do_type_honor([], _Type, L, _Label) -> L;
do_type_honor([Honor = #honor{id = Id} | T], Type, L,
              Label) ->
    case honor_data:get(Id) of
        #honor_base{type = Type} when Label =:= type ->
            do_type_honor(T, Type, [Honor | L], Label);
        #honor_base{mode_type = Type}
            when Label =:= mode_type ->
            do_type_honor(T, Type, [Honor | L], Label);
        _ -> do_type_honor(T, Type, L, Label)
    end.

add_check_timer(Role = #role{m_honor =
                                 #m_honor{r_list = All}}) ->
    Now = date:unixtime(),
    NextT = get_next_time(All, Now, 0),
    Timer = #timer{id = honor_check, timeout = NextT * 1000,
                   times = 1, m = honor, f = honor_check, a = []},
    role_timer:set(Timer, Role).

get_next_time([], _Now, 0) -> 864000;
get_next_time([], Now, Time) -> Time - Now;
get_next_time([#honor{end_time = EndT} | T], Now, Time)
    when EndT > Now andalso EndT < Time ->
    get_next_time(T, Now, EndT);
get_next_time([_ | T], Now, Time) ->
    get_next_time(T, Now, Time).

check_event(#role{s_event = Event}, HonorId) ->
    case honor_data:get(HonorId) of
        #honor_base{type = 5} when Event =:= 11 -> true;
        #honor_base{type = 8} -> true;
        #honor_base{type = 1} -> true;
        #honor_base{type = 2} -> true;
        #honor_base{type = 3} -> true;
        #honor_base{type = 4} -> true;
        #honor_base{type = 6} -> true;
        #honor_base{type = 7} -> true;
        #honor_base{type = 9} -> true;
        #honor_base{type = 10} -> true;
        #honor_base{type = 12} -> true;
        #honor_base{type = 11} -> true;
        #honor_base{type = 13} -> true;
        _ -> false
    end.

check_replace(#role{s_event = Event,
                    m_honor = #m_honor{use_id = UseId}}) ->
    case honor_data:get(UseId) of
        #honor_base{type = 5} when Event =:= 11 ->
            {false, lang:get("勇士战场中不可替换称号")};
        _ -> true
    end.

check_cancel(#role{s_event = Event,
                   m_honor = #m_honor{use_id = UseId}}) ->
    case honor_data:get(UseId) of
        #honor_base{type = 5} when Event =:= 11 ->
            {false, lang:get("勇士战场中不可取消")};
        _ -> true
    end.

check_repeat(#role{m_honor = #m_honor{r_list = RList}},
             HonorId) ->
    case lists:keyfind(HonorId, #honor.id, RList) of
        #honor{} -> true;
        _ -> false
    end.

-spec add_pre_honor(pid() | #role{} | tuple(),
                    pos_integer() | tuple(),
                    Push :: push | not_push) -> ok | {ok, #role{}}.

add_pre_honor(Pid, PreInfo, Push) when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {honor, add_pre_honor, [PreInfo, Push]}),
    ok;
add_pre_honor({RoleId, Platform, Zone}, PreInfo,
              Push) ->
    case role_query:pid(by_id, RoleId, Platform, Zone) of
        {ok, RolePid} when is_pid(RolePid) ->
            role:apply(async,
                       RolePid,
                       {honor, add_pre_honor, [PreInfo, Push]});
        _ -> skip
    end,
    ok;
add_pre_honor(Role, PreId, Push)
    when is_integer(PreId) ->
    add_pre_honor(Role, #pre_honor{pre_id = PreId}, Push);
add_pre_honor(Role, {PreId, Time}, Push) ->
    add_pre_honor(Role,
                  #pre_honor{pre_id = PreId, end_time = Time},
                  Push);
add_pre_honor(Role = #role{m_honor =
                               MHonor = #m_honor{r_pre_list = RList}},
              PreHonor = #pre_honor{pre_id = PreID}, Push) ->
    case honor_data:get_pre(PreID) of
        #pre_honor_base{is_cast = IsCast, items = Items} ->
            case lists:keyfind(PreID, #pre_honor.pre_id, RList) of
                #pre_honor{pre_id = PreID} ->
                    Gain = format:val_to_gain(Items),
                    case role_gain:do_notice(Gain, Role) of
                        {ok, Role1} ->
                            push_info(add_pre, Role1, 0, PreID),
                            {ok, Role1};
                        {false, #gain{msg = Msg}} -> {false, Msg};
                        _ERR ->
                            logger:error("获得称号前缀失败：~w", [PreID], honor, 908),
                            {false, lang:get("获得称号前缀失败")}
                    end;
                _ ->
                    PreHonor1 = PreHonor#pre_honor{pre_id = PreID,
                                                   end_time = 0},
                    NewRList = [PreHonor1 | RList],
                    NewMHonor = MHonor#m_honor{r_pre_list = NewRList},
                    Role1 = role_trigger:fire(#evt_pre_honor{pre_id =
                                                                 PreID},
                                              Role#role{m_honor = NewMHonor}),
                    case IsCast of
                        1 -> push_info(add_pre, Role1, PreHonor1);
                        0 -> skip
                    end,
                    push(Role1, Push),
                    {ok, broadcast(Role1, Push)}
            end;
        _ ->
            logger:error("放发不存在的称号前缀：~w", [PreID], honor, 926),
            ok
    end.

-spec add_and_use_pre_honor(pid() | #role{} | tuple(),
                            pos_integer() | tuple(),
                            Push :: push | not_push) -> ok | {ok, #role{}}.

add_and_use_pre_honor(Pid, HonorInfo, Push)
    when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {honor, add_and_use_pre_honor, [HonorInfo, Push]});
add_and_use_pre_honor({RoleId, Platform, Zone},
                      HonorInfo, Push) ->
    case role_query:pid(by_id, RoleId, Platform, Zone) of
        {ok, RolePid} when is_pid(RolePid) ->
            role:apply(async,
                       RolePid,
                       {honor, add_and_use_pre_honor, [HonorInfo, Push]});
        _ -> skip
    end,
    ok;
add_and_use_pre_honor(Role, [], _Push) -> {ok, Role};
add_and_use_pre_honor(Role, [PreHonorId | T], Push) ->
    case add_and_use_pre_honor(Role, PreHonorId, Push) of
        {ok, NRole} -> add_and_use_pre_honor(NRole, T, Push);
        _ -> add_and_use_pre_honor(Role, T, Push)
    end;
add_and_use_pre_honor(Role, PreHonorId, Push)
    when is_integer(PreHonorId) ->
    add_and_use_pre_honor(Role,
                          #pre_honor{pre_id = PreHonorId},
                          Push);
add_and_use_pre_honor(Role, {PreHonorId, Time}, Push) ->
    add_and_use_pre_honor(Role,
                          #pre_honor{pre_id = PreHonorId, end_time = Time},
                          Push);
add_and_use_pre_honor(Role,
                      PreHonor = #pre_honor{pre_id = PreHonorId}, Push) ->
    case add_pre_honor(Role, PreHonor, not_push) of
        {ok, Role1} ->
            case use_pre_honor(Role1, PreHonorId, Push) of
                {ok, NewRole} -> {ok, NewRole};
                {false, _Reason} ->
                    push(Role1, Push),
                    {ok, broadcast(Role1, Push)}
            end;
        _ -> ok
    end.

get_pre_honor_reward(Role = #role{m_honor =
                                      MHonor = #m_honor{r_pre_list = PreList,
                                                        pre_reward_list =
                                                            PreRewardList},
                                  sex = Sex},
                     RewardID) ->
    case honor_data:get_pre_reward(RewardID, Sex) of
        {RewardID, NeedNum, RewardName, RewardItems} ->
            case length(PreList) >= NeedNum of
                true ->
                    case lists:member(RewardID, PreRewardList) of
                        true -> {false, lang:get("该奖励已经领取")};
                        _ ->
                            GainItems = [{ItemID, Bind, Num}
                                         || {ItemID, Bind, Num, _}
                                                <- RewardItems],
                            Gain = format:val_to_gain(GainItems),
                            role:send_buff_begin(),
                            Title = notice:format(lang:get("开启~ts"),
                                                  [{string_2, 5, RewardName}]),
                            Role2 = case role_gain:do_notice(Gain, Role, Title)
                                        of
                                        {ok, Role1} ->
                                            role:send_buff_flush(),
                                            Role1;
                                        _ ->
                                            Content =
                                                notice:format(lang:get("由于您的背包已满，~ts的奖励通过邮件发放给您，请查收"),
                                                              [{string_2,
                                                                5,
                                                                RewardName}]),
                                            mail:send(Role,
                                                      lang:get("前缀收集奖励"),
                                                      Content,
                                                      GainItems),
                                            role:send_buff_clean(),
                                            Role
                                    end,
                            NewPreRewardList = [RewardID | PreRewardList],
                            NewRole = Role2#role{m_honor =
                                                     MHonor#m_honor{pre_reward_list
                                                                        =
                                                                        NewPreRewardList}},
                            push(NewRole, push),
                            {ok, NewRole}
                    end;
                _ -> {false, lang:get("条件不满足")}
            end;
        _ -> {false, lang:get("找不到奖励数据")}
    end.

repair_gods_duel(Role = #role{m_gods_duel = MGodsDuel,
                              m_honor = MHonor}) ->
    case MGodsDuel of
        #m_gods_duel{gods_score = 50} ->
            #m_honor{r_list = RList} = MHonor,
            case lists:keyfind(30320, #honor.id, RList) of
                #honor{id = 30320} -> ok;
                _ ->
                    Honor = #honor{id = 30320, end_time = 0},
                    NewRList = [Honor | RList],
                    NewMHonor = MHonor#m_honor{r_list = NewRList},
                    NewRole = Role#role{m_honor = NewMHonor},
                    {ok, NewRole}
            end;
        _ -> ok
    end.

calc_collect_val(#role{m_honor =
                           #m_honor{r_list = HonorList}}) ->
    CollectL = case catch honor_data:list_by_type() of
                   List when is_list(List) ->
                       [I || I = {_Id, _Type, Val} <- List, Val > 0];
                   _ -> []
               end,
    Fun = fun (#honor{id = Id, end_time = 0}, Rtn) ->
                  case lists:keyfind(Id, 1, CollectL) of
                      {Id, Type, _} ->
                          CalcL = [{HonorId, HVal}
                                   || {HonorId, HType, HVal} <- CollectL,
                                      HType =:= Type],
                          do_calc_collect_val(CalcL, Id, Rtn);
                      _ -> Rtn
                  end;
              (_, Rtn) -> Rtn
          end,
    lists:foldl(Fun, 0, HonorList).

do_calc_collect_val([{Id, Val} | _], Id, Rtn) ->
    Val + Rtn;
do_calc_collect_val([{Id1, Val} | T], Id2, Rtn)
    when Id1 =/= Id2 ->
    do_calc_collect_val(T, Id2, Rtn + Val);
do_calc_collect_val([], _Id, Rtn) -> Rtn.

