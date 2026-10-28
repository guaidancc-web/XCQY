-file("src/mod/campaign/camp_web.erl", 1).

-module(camp_web).

-export([init/0,
         login/1,
         fire/2,
         push/0,
         push/1,
         push/2,
         reward/5,
         send/6,
         guild_push/1,
         get_can_max_reward_num/2,
         get_can_reward_num/2,
         get_acc_val/2,
         get_had_reward_num/2,
         gm_next_day/1,
         do_update_acc_each/4,
         del_acc_val/2,
         get_acc_info/2,
         get_can_reward_info/2,
         list/1,
         do_camp_cli/2]).

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

-file("src/mod/campaign/camp_web.erl", 30).

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

-file("src/mod/campaign/camp_web.erl", 31).

-file("inc/camp_web.hrl", 1).

-record(m_camp_web,
        {ver = 4 :: non_neg_integer(),
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list(),
         card_info = {0, 0, 0, []} :: tuple()}).

-record(camp_web_ico,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         title = "" :: bitstring(),
         ico = "" :: bitstring(),
         alert = "" :: bitstring(),
         gif = "" :: bitstring(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         login_open = 0 :: non_neg_integer(),
         is_show_time = 0 :: 0..1,
         menu_list = [] :: list()}).

-record(camp_web_menu,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_mod = 0 :: non_neg_integer(),
         mail_title = "" :: bitstring(),
         mail_content = "" :: bitstring(),
         title = "" :: bitstring(),
         title2 = "" :: bitstring(),
         ico = "" :: bitstring(),
         title_ico = "" :: bitstring(),
         type_ico = "" :: bitstring(),
         total_ico = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         sort_val = 0 :: non_neg_integer(),
         top_banner = "" :: bitstring(),
         rule_str = "" :: bitstring(),
         time_str = "" :: bitstring(),
         bottom_alert = "" :: bitstring(),
         reward_title = "" :: bitstring(),
         panel_type = "" :: bitstring(),
         cli_reward = "" :: bitstring(),
         button_text = "" :: bitstring(),
         is_button = 0 :: 0..1,
         notice_msg = "" :: bitstring(),
         camp_list = [] :: list(),
         is_tran = 0,
         tran_info = ""}).

-record(camp_web,
        {id = 0 :: non_neg_integer(),
         n = 1 :: pos_integer(),
         key = {0, 0} :: tuple(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         third_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_num = 1 :: non_neg_integer(),
         reward_can = 0 :: non_neg_integer(),
         value = 0 :: non_neg_integer(),
         tar_val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         status = 0 :: 0..2,
         cond_msg = "" :: bitstring(),
         loss_items = [] :: list(),
         items = [] :: list(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         str1 = "" :: bitstring(),
         str2 = "" :: bitstring(),
         str3 = "" :: bitstring(),
         str4 = "" :: bitstring(),
         extra = [],
         data :: undefined | any(),
         is_desc = 0 :: 0..1}).

-record(camp_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         total_camp :: undefined | #camp_web_ico{},
         menu :: undefined | #camp_web_menu{},
         camp :: undefined | #camp_web{},
         call_form = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         rpc_reward_num = 1 :: non_neg_integer(),
         push_cli = 0 :: 0..1,
         push_list = [] :: [tuple()],
         to_id,
         return_acc = 0}).

-file("src/mod/campaign/camp_web.erl", 32).

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

-file("src/mod/campaign/camp_web.erl", 33).

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

-file("src/mod/campaign/camp_web.erl", 34).

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

-file("src/mod/campaign/camp_web.erl", 35).

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

-file("src/mod/campaign/camp_web.erl", 36).

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

-file("src/mod/campaign/camp_web.erl", 37).

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

-file("src/mod/campaign/camp_web.erl", 38).

-file("inc/log.hrl", 1).

-file("src/mod/campaign/camp_web.erl", 39).

-file("inc/guild.hrl", 1).

-type guild_id() :: {non_neg_integer(),
                     list(),
                     non_neg_integer()}.

-record(guild_apply,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 1,
         time = 0,
         type = 0,
         looks = [],
         cup = 0 :: non_neg_integer(),
         donation = 0 :: non_neg_integer(),
         tag = 0 :: non_neg_integer(),
         msg = "" :: string()}).

-record(guild_envelop,
        {ver = 1,
         title = "" :: string(),
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list()}).

-record(guild_role,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..4,
         lev = 1 :: pos_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         fc = 1 :: pos_integer(),
         synth_fc = 1 :: pos_integer(),
         post = 0 :: 0..5,
         status = 0 :: 0 | 1,
         last_login = 1 :: pos_integer(),
         last_logout = 1 :: pos_integer(),
         enter_time = 0 :: non_neg_integer(),
         signature = "" :: list(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         cup = 0 :: non_neg_integer(),
         looks = [],
         envelope = #guild_envelop{},
         requirement = [],
         signed = 0 :: non_neg_integer(),
         last_signed = 0 :: non_neg_integer(),
         mails = [],
         active = 0,
         ability = 0,
         chat_num = 0,
         doing = 0,
         chat_num_list = [],
         doing_list = [],
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list()}).

-record(guild_leaver,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         guild_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         value = 0,
         total_value = 0 :: non_neg_integer(),
         time = 0 :: integer()}).

-record(guild_boss,
        {lev = 1 :: non_neg_integer(),
         step = 1 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         name = "",
         hp = 0 :: non_neg_integer(),
         hp_max = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         called = 0 :: integer(),
         log = [] :: list(),
         last_renamed = 0 :: non_neg_integer()}).

-record(guild_mercenary,
        {id = {0, "", 0},
         key :: undefined | tuple(),
         lev = 0 :: non_neg_integer(),
         name = "" :: string(),
         dispatched = 0 :: non_neg_integer(),
         recruited = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         gain = [],
         guard :: undefined | tuple()}).

-record(guild_totem,
        {ver = 0 :: non_neg_integer(),
         id = util:rand_list([101, 102, 103, 104, 105]) ::
             non_neg_integer(),
         changeable = 1 :: non_neg_integer(),
         last_changed = 0 :: non_neg_integer()}).

-record(guild_question_answer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         guild_name = "" :: string(),
         option = 0 :: 0..4,
         result = 0 :: 0 | 1,
         score = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         totem_id = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(guild_question,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: [#guild_question_answer{}],
         cheat_off = [],
         asked_num = 0 :: non_neg_integer(),
         cheat_nums = []}).

-record(guild_robber,
        {ver = 0 :: non_neg_integer(),
         id :: undefined | tuple(),
         today_generated = 0 :: non_neg_integer(),
         gen_hour = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         fighters = [],
         picker = []}).

-record(guild_treasure,
        {ver = 1 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         setting_chance = 0 :: non_neg_integer(),
         setting_time = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         generated = 0 :: non_neg_integer(),
         unit_num = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         can_open = 0 :: 0,
         fighters = [],
         picker = [],
         type = win}).

-record(guild_loot,
        {ver = 0, items = [], log = [], allocated = []}).

-record(guild_usurper,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_invitation,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 0,
         ctime = 0 :: integer(),
         guild_id :: undefined | tuple(),
         guild_name = "" :: string()}).

-record(guild_plant_irrigator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_plant,
        {ver = 0,
         pos = {0, 0},
         owner_rid = {0, "", 0},
         owner_name = "",
         irrigations = [],
         phase = 0,
         sowed = 0,
         matured = 0,
         fired = 0 :: 0 | 1,
         unit_id = {0, 0},
         unit_base_id = 0}).

-record(guild_union_apply,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         leader_id = {0, "", 0},
         leader_name = "" :: string(),
         ctime = 0 :: integer()}).

-record(guild_campaign,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list()}).

-record(guild_camp_web,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list()}).

-record(element_info,
        {ver = 1, build_type = 0, lev = 1, time = 0}).

-record(guild,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         ver = 21 :: non_neg_integer(),
         name = "" :: list(),
         assets = 5000000,
         max_assets = 5000000,
         upkeep = 0,
         pid :: undefined | pid(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         leader_sex = 0 :: 0 | 1,
         leader_classes = 0 :: 0..6,
         leader_lev = 0 :: non_neg_integer(),
         members = [] :: [#guild_role{}],
         mem_num = 0 :: non_neg_integer(),
         fresh_num = 0 :: non_neg_integer(),
         max_mem_num = 90,
         max_fresh_num = 100,
         board = "" :: list(),
         health = 100,
         join_type = 2,
         join_condition = [],
         apply_list = [],
         event_list = [],
         lev = 1 :: pos_integer(),
         lev_time = 0 :: non_neg_integer(),
         academy_lev = 0 :: non_neg_integer(),
         academy_time = 0 :: non_neg_integer(),
         store_lev = 0 :: non_neg_integer(),
         store_time = 0 :: non_neg_integer(),
         exchequer_lev = 0 :: non_neg_integer(),
         exchequer_time = 0 :: non_neg_integer(),
         lev_ref :: undefined | reference(),
         welfare_time = 0,
         welfare_list = [],
         store_tick_time = 0,
         store_list = [],
         create_time = 0,
         flag = 0,
         map_pid = 0,
         map_id = 0,
         boss = #guild_boss{},
         mercenarys = [] :: [#guild_mercenary{}],
         totem = #guild_totem{} :: #guild_totem{},
         question = #guild_question{},
         robber_num = 0 :: non_neg_integer(),
         robber_total_num = 0 :: non_neg_integer(),
         usurpers = [],
         activity = 0,
         plants = [],
         announcement = "" :: string(),
         union_applys = [] :: list(),
         union_applied = [] :: list(),
         today_used_medal = 0 :: integer(),
         last_medal_used = 0 :: integer(),
         today_upgraded_build = 0 :: integer(),
         last_build_upgraded = 0 :: integer(),
         today_destory_build = 0 :: integer(),
         last_build_destory = 0 :: integer(),
         treasure = #guild_treasure{},
         loot = #guild_loot{},
         week_assets = 0 :: integer(),
         formalizing_lev = 35 :: integer(),
         name_used = "" :: string(),
         create_id = {0, "", 0},
         create_name = "",
         guild_camp = #guild_campaign{},
         guild_camp_web = #guild_camp_web{},
         max_chat_num = 0,
         max_doing = 0,
         max_fc = 0,
         max_synth_fc = 0,
         element_info = [],
         uplev_element_times = 0,
         last_uplev_element = 0,
         upgrade_element_time = 0,
         mail_list = [],
         limit_mode = 0,
         is_lock_board = 0,
         board_id = {0, "", 0},
         announce_id = {0, "", 0}}).

-record(guild_element_attr,
        {ver = 1,
         effect_obj = 1,
         attr = [],
         attr_snd = [],
         add_skill_list = [],
         high_attr = [],
         end_time = 0}).

-record(m_guild,
        {ver = 3 :: pos_integer(),
         id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         pid :: undefined | pid(),
         enter_time = 0,
         guild_lev = 1,
         post = 0 :: non_neg_integer(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         signature = "" :: list(),
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list(),
         build_speed_num = 0 :: non_neg_integer()}).

-record(guild_emblem,
        {ver = 0, id = 0, type = 0, lev = 0}).

-record(m_guild_emblem,
        {ver = 0 :: non_neg_integer(),
         remain_point = 0 :: non_neg_integer(),
         total_point = 0 :: non_neg_integer(),
         emblems = []}).

-file("src/mod/campaign/camp_web.erl", 40).

init() -> #m_camp_web{}.

login(Role) ->
    Role1 = end_reward(Role),
    {ok, Role2} =
        camp_web_mgr:set_pay_single_limit_start_time(Role1),
    overdue(Role2).

overdue(Role = #role{m_camp_web =
                         MCampWeb = #m_camp_web{overdue_time = OverdueTime,
                                                acc = AccL,
                                                can_reward = CanRewardL,
                                                rewarded = RewardedL}}) ->
    case date:is_today(OverdueTime) of
        true -> {ok, Role};
        false ->
            CampL = camp_web_mgr:list_flat(),
            Now = date:unixtime(),
            NewAccL = do_overdue(AccL, acc, Role, CampL, Now, []),
            NewCanRewardL = do_overdue(CanRewardL,
                                       can_reward,
                                       Role,
                                       CampL,
                                       Now,
                                       []),
            NewRewardedL = do_overdue(RewardedL,
                                      rewarded,
                                      Role,
                                      CampL,
                                      Now,
                                      []),
            NRole = Role#role{m_camp_web =
                                  MCampWeb#m_camp_web{overdue_time = Now,
                                                      acc = NewAccL,
                                                      can_reward =
                                                          NewCanRewardL,
                                                      rewarded = NewRewardedL}},
            {ok, NRole}
    end.

do_overdue([], _Label, _Role, _CampL, _Now, L) ->
    lists:reverse(L);
do_overdue([{Key, Time, Info} | T], Label, Role, CampL,
           Now, L)
    when Now - Time > 8640000 ->
    case lists:keyfind(Key, 1, CampL) of
        false -> do_overdue(T, Label, Role, CampL, Now, L);
        _ ->
            do_overdue(T,
                       Label,
                       Role,
                       CampL,
                       Now,
                       [{Key, Time, Info} | L])
    end;
do_overdue([D | T], Label, Role, CampL, Now, L) ->
    do_overdue(T, Label, Role, CampL, Now, [D | L]).

end_reward(Role = #role{id = RoleId,
                        m_camp_web =
                            MCampWeb = #m_camp_web{end_reward = Rewards}}) ->
    List = do_end_reward(RoleId, Rewards, []),
    Role#role{m_camp_web =
                  MCampWeb#m_camp_web{end_reward = Rewards -- List}}.

do_end_reward(_, [], List) -> List;
do_end_reward(RoleId,
              [A = {CampId, Id, _, Title, Content, Items} | L],
              List) ->
    case camp_web_mgr:lookup(CampId, Id) of
        {ok, _, #camp_web_menu{end_time = ET}} ->
            Now = date:unixtime(),
            case Now < ET of
                true -> do_end_reward(RoleId, L, List);
                _ ->
                    mail:send(RoleId, Title, Content, Items),
                    do_end_reward(RoleId, L, [A | List])
            end;
        _ ->
            mail:send(RoleId, Title, Content, Items),
            do_end_reward(RoleId, L, [A | List])
    end;
do_end_reward(RoleId, [A | L], List) ->
    do_end_reward(RoleId, L, [A | List]).

-spec push() -> ok.

push() ->
    role_group:apply(world, {camp_web, push, []}),
    ok.

-spec push(#role{}) -> ok.

push(Role) ->
    sys_conn:pack_send(14050, {0, list(Role)}),
    ok.

-spec push(all | #role{}, non_neg_integer()) -> ok.

push(all, Id) ->
    role_group:apply(world, {camp_web, push, [Id]}),
    ok;
push(Role, Id) ->
    case list(Role, Id) of
        L = [_ | _] -> sys_conn:pack_send(14050, {1, L});
        _ -> skip
    end,
    ok.

-spec list(#role{}) -> [#camp_web_ico{}].

list(Role) ->
    Now = date:unixtime(),
    L = camp_web_mgr:list_all(),
    total_camp_cli(L, Role, #camp_handle{time = Now}, []).

list(Role, Id) ->
    case camp_web_mgr:lookup(Id) of
        Total = #camp_web_ico{} ->
            Now = date:unixtime(),
            total_camp_cli([Total],
                           Role,
                           #camp_handle{time = Now},
                           []);
        _ -> []
    end.

total_camp_cli([], _Role, _Handle, L) -> L;
total_camp_cli([Total = #camp_web_ico{menu_list =
                                          MenuList,
                                      start_time = StartT, end_time = EndT}
                | T],
               Role, Handle = #camp_handle{time = Now}, L)
    when Now >= StartT andalso Now < EndT ->
    case menu_cli(MenuList,
                  Role,
                  Handle#camp_handle{total_camp = Total},
                  [])
        of
        [] -> total_camp_cli(T, Role, Handle, L);
        NewMenuList ->
            total_camp_cli(T,
                           Role,
                           Handle,
                           [Total#camp_web_ico{menu_list = NewMenuList} | L])
    end;
total_camp_cli([_ | T], Role, Handle, L) ->
    total_camp_cli(T, Role, Handle, L).

menu_cli([], _Role, _Handle, L) -> L;
menu_cli([Menu = #camp_web_menu{camp_list = CampL,
                                start_time = StartT, end_time = EndT}
          | T],
         Role, Handle = #camp_handle{time = Now}, L)
    when EndT > Now andalso Now >= StartT ->
    case check_real_time(Role,
                         Handle#camp_handle{menu = Menu})
        of
        {true, NewMenu} ->
            NewCampL = camp_cli(CampL,
                                Role,
                                Handle#camp_handle{menu = NewMenu},
                                []),
            menu_cli(T,
                     Role,
                     Handle,
                     [NewMenu#camp_web_menu{camp_list = NewCampL} | L]);
        _ -> menu_cli(T, Role, Handle, L)
    end;
menu_cli([_ | T], Role, Handle, L) ->
    menu_cli(T, Role, Handle, L).

camp_cli([], _Role, _Handle, L) -> L;
camp_cli([Camp | T], Role, Handle, L) ->
    case do_camp_cli(Role, Handle#camp_handle{camp = Camp})
        of
        false -> camp_cli(T, Role, Handle, L);
        NewCamp = #camp_web{} ->
            camp_cli(T, Role, Handle, [NewCamp | L])
    end.

do_camp_cli(Role,
            Handle = #camp_handle{camp =
                                      Camp = #camp_web{items = Items0,
                                                       val1 = Val1,
                                                       sec_type = SecType}}) ->
    RewardCan = get_can_max_reward_num(Role, Handle),
    Status = case RewardCan =< 0 of
                 true -> 2;
                 _ ->
                     case camp_web_cond:check(Role, Handle) of
                         true -> 1;
                         {ok, _Role, _Handle} -> 1;
                         _ -> 0
                     end
             end,
    Value = get_acc_val(Role, Handle),
    Items = case SecType of
                10007 when Value > 0 ->
                    [{90002, 0, util:ceil(Value * Val1 / 1000)}];
                _ -> campaign:parse_items(Items0, Role, [])
            end,
    NewCamp = Camp#camp_web{items = Items, status = Status,
                            reward_can = RewardCan, value = Value},
    get_prog_val(Role, Handle#camp_handle{camp = NewCamp}).

check_real_time(_Role, #camp_handle{menu = Menu}) ->
    {true, Menu}.

-spec reward(#role{}, non_neg_integer(),
             non_neg_integer(), non_neg_integer(),
             pos_integer()) -> {ok, #role{}} | {false, bitstring()}.

reward(Role, TotalId, MenuId, N, Num) ->
    Now = date:unixtime(),
    case camp_web_mgr:lookup(TotalId, MenuId, N) of
        {ok,
         Total = #camp_web_ico{start_time = StartT1,
                               end_time = EndT1},
         Menu = #camp_web_menu{start_time = StartT2,
                               end_time = EndT2, reward_mod = 1,
                               sec_type = SecType, camp_list = CampList},
         Camp}
            when Now >= StartT1 andalso
                     Now >= StartT2 andalso
                         Now =< EndT1 andalso Now =< EndT2 ->
            RpcRewardNum = case SecType of
                               50003 when Num > 0 -> Num;
                               50002 when Num > 0 -> Num;
                               50004 when Num > 0 -> Num;
                               _ -> 1
                           end,
            case do_handle([condition, check_reward, rpc_reward],
                           Role,
                           #camp_handle{rpc_reward_num = RpcRewardNum,
                                        total_camp = Total, menu = Menu,
                                        camp = Camp, time = Now})
                of
                {ok, NRole, Handle} ->
                    case do_camp_cli(NRole, Handle) of
                        false -> skip;
                        _CliCamp when SecType == 10006 ->
                            ShowCliCampList = [{TotalId,
                                                MenuId,
                                                do_camp_cli(NRole,
                                                            Handle#camp_handle{camp
                                                                                   =
                                                                                   C})}
                                               || C <- CampList],
                            sys_conn:pack_send(14052, {ShowCliCampList});
                        CliCamp when SecType == 50004 andalso N =/= 1 ->
                            [FirstCamp | _] = lists:keysort(#camp_web.n,
                                                            CampList),
                            AddCliCamp = case do_camp_cli(NRole,
                                                          Handle#camp_handle{camp
                                                                                 =
                                                                                 FirstCamp})
                                             of
                                             false -> [];
                                             FristCliCamp ->
                                                 [{TotalId,
                                                   MenuId,
                                                   FristCliCamp}]
                                         end,
                            sys_conn:pack_send(14052,
                                               {[{TotalId, MenuId, CliCamp}] ++
                                                    AddCliCamp});
                        CliCamp ->
                            sys_conn:pack_send(14052,
                                               {[{TotalId, MenuId, CliCamp}]})
                    end,
                    {ok, NRole};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("活动不存在")}
    end.

-spec send(#role{}, non_neg_integer(),
           non_neg_integer(), non_neg_integer(), pos_integer(),
           {integer(), string(), integer()}) -> {ok, #role{}} |
                                                {false, bitstring()}.

send(Role, TotalId, MenuId, N, Num, OtherId) ->
    Now = date:unixtime(),
    case camp_web_mgr:lookup(TotalId, MenuId, N) of
        {ok,
         Total = #camp_web_ico{start_time = StartT1,
                               end_time = EndT1},
         Menu = #camp_web_menu{start_time = StartT2,
                               end_time = EndT2, reward_mod = 1},
         Camp}
            when Now >= StartT1 andalso
                     Now >= StartT2 andalso
                         Now =< EndT1 andalso Now =< EndT2 ->
            RpcRewardNum = case Num > 0 of
                               true -> Num;
                               _ -> 1
                           end,
            case do_handle([condition, check_reward, rpc_send],
                           Role,
                           #camp_handle{rpc_reward_num = RpcRewardNum,
                                        total_camp = Total, menu = Menu,
                                        camp = Camp, time = Now,
                                        to_id = OtherId})
                of
                {ok, NRole, Handle} ->
                    case do_camp_cli(NRole, Handle) of
                        false -> skip;
                        CliCamp ->
                            sys_conn:pack_send(14052,
                                               {[{TotalId, MenuId, CliCamp}]})
                    end,
                    {ok, NRole};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("活动不存在")}
    end.

-spec fire(tuple(), #role{}) -> #role{}.

fire(Evt = #evt_cli_loaded{}, Role) ->
    do_event(Evt, Role);
fire(Evt = #evt_online_time{}, Role) ->
    do_event(Evt, Role);
fire(Evt = #evt_levup{}, Role) -> do_event(Evt, Role);
fire(Evt = #evt_friend{}, Role) -> do_event(Evt, Role);
fire(Evt = #evt_eqm{}, Role) -> do_event(Evt, Role);
fire(Evt = #evt_pet{}, Role) -> do_event(Evt, Role);
fire(Evt = #evt_arena_win{}, Role) ->
    do_event(Evt, Role);
fire(Evt = #evt_pay{}, Role) -> do_event(Evt, Role);
fire(Evt = #evt_activity{}, Role) ->
    do_event(Evt, Role);
fire(Evt = #evt_consume{}, Role) -> do_event(Evt, Role);
fire(Evt = #evt_blacksmith_enchant{}, Role) ->
    do_event(Evt, Role);
fire(Evt = #evt_enchant{}, Role) -> do_event(Evt, Role);
fire(_Evt, Role) -> Role.

check_evt(#evt_cli_loaded{},
          #camp_web_menu{sec_type = 40001}) ->
    true;
check_evt(#evt_online_time{},
          #camp_web_menu{sec_type = 40002}) ->
    true;
check_evt(#evt_online_time{},
          #camp_web_menu{sec_type = 40003}) ->
    true;
check_evt(#evt_levup{},
          #camp_web_menu{sec_type = 30001}) ->
    true;
check_evt(#evt_friend{},
          #camp_web_menu{sec_type = 30002}) ->
    true;
check_evt(#evt_eqm{},
          #camp_web_menu{sec_type = 30003}) ->
    true;
check_evt(#evt_pet{},
          #camp_web_menu{sec_type = 30004}) ->
    true;
check_evt(#evt_activity{},
          #camp_web_menu{sec_type = 30006}) ->
    true;
check_evt(#evt_arena_win{},
          #camp_web_menu{sec_type = 30005}) ->
    true;
check_evt(#evt_pay{},
          #camp_web_menu{sec_type = 10002}) ->
    true;
check_evt(#evt_pay{},
          #camp_web_menu{sec_type = 10001}) ->
    true;
check_evt(#evt_pay{},
          #camp_web_menu{sec_type = 10004}) ->
    true;
check_evt(#evt_consume{},
          #camp_web_menu{sec_type = 20001}) ->
    true;
check_evt(#evt_consume{},
          #camp_web_menu{sec_type = 20002}) ->
    true;
check_evt(#evt_pay{},
          #camp_web_menu{sec_type = 50004}) ->
    true;
check_evt(#evt_pay{},
          #camp_web_menu{sec_type = 10005}) ->
    true;
check_evt(#evt_pay{},
          #camp_web_menu{sec_type = 10006}) ->
    true;
check_evt(#evt_enchant{},
          #camp_web_menu{sec_type = 40007}) ->
    true;
check_evt(#evt_blacksmith_enchant{},
          #camp_web_menu{sec_type = 40007}) ->
    true;
check_evt(#evt_pay{source = 0},
          #camp_web_menu{sec_type = 10007}) ->
    true;
check_evt(_Evt, _Camp) -> false.

update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 40001}}) ->
    do_update_acc_day(Role, Handle, 1, zero);
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 40003},
                                 evt = #evt_online_time{add_val = AddVal}}) ->
    do_update_acc(Role, Handle, AddVal);
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 10002},
                                 evt = #evt_pay{gold = Gold}}) ->
    do_update_acc(Role,
                  Handle#camp_handle{return_acc = 1},
                  Gold);
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 50004, val3 = Val4},
                                 evt = #evt_pay{gold = Gold}}) ->
    do_update_acc(Role,
                  Handle#camp_handle{return_acc = 1},
                  util:ceil(Gold * Val4));
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 20001},
                                 evt = #evt_consume{gold = Gold}}) ->
    do_update_acc(Role,
                  Handle#camp_handle{return_acc = 1},
                  Gold);
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 20002},
                                 evt = #evt_consume{gold = Gold}}) ->
    do_update_acc(Role,
                  Handle#camp_handle{return_acc = 1},
                  Gold);
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 30006},
                                 evt = #evt_activity{val = Val}}) ->
    do_update_acc(Role,
                  Handle#camp_handle{return_acc = 1},
                  Val);
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 30005},
                                 evt = #evt_arena_win{cup = Val}}) ->
    do_set_acc(Role,
               Handle#camp_handle{return_acc = 1},
               Val);
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 10005},
                                 evt = #evt_pay{gold = Gold}}) ->
    do_set_acc(Role,
               Handle#camp_handle{return_acc = 1},
               Gold);
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 10007},
                                 evt = #evt_pay{gold = Gold}}) ->
    case camp_web:get_acc_val(Role, Handle) > 0 of
        true -> {ok, Role, Handle};
        _ ->
            do_set_acc(Role,
                       Handle#camp_handle{return_acc = 1},
                       Gold)
    end;
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 10006},
                                 evt = #evt_pay{gold = Gold}}) ->
    do_update_acc(Role,
                  Handle#camp_handle{return_acc = 1},
                  Gold);
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 40007, third_type = 1,
                                               val1 = 0, tar_val = TarVal},
                                 evt =
                                     #evt_blacksmith_enchant{is_succ = 1,
                                                             all_lev = AllLev,
                                                             pre_all_lev =
                                                                 PreAllLev}}) ->
    Old = camp_web:get_acc_val(Role, Handle),
    case PreAllLev >= TarVal of
        true ->
            do_set_acc(Role,
                       Handle#camp_handle{return_acc = 1},
                       Old);
        _ ->
            do_set_acc(Role,
                       Handle#camp_handle{return_acc = 1},
                       AllLev)
    end;
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 40007, third_type = 1,
                                               tar_val = _TarVal},
                                 evt =
                                     #evt_blacksmith_enchant{is_succ = 1,
                                                             all_lev = AllLev,
                                                             pre_all_lev =
                                                                 _PreAllLev}}) ->
    do_set_acc(Role,
               Handle#camp_handle{return_acc = 1},
               AllLev);
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 40007, third_type = 2,
                                               val1 = 0, tar_val = TarVal},
                                 evt =
                                     #evt_blacksmith_enchant{is_succ = 1,
                                                             sum_lev = Lev,
                                                             pre_sum_lev =
                                                                 PreLev}}) ->
    Old = camp_web:get_acc_val(Role, Handle),
    case PreLev >= TarVal of
        true ->
            do_set_acc(Role,
                       Handle#camp_handle{return_acc = 1},
                       Old);
        _ ->
            do_set_acc(Role,
                       Handle#camp_handle{return_acc = 1},
                       Lev)
    end;
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 40007, third_type = 2,
                                               tar_val = _TarVal},
                                 evt =
                                     #evt_blacksmith_enchant{is_succ = 1,
                                                             sum_lev = AllLev,
                                                             pre_sum_lev =
                                                                 _PreAllLev}}) ->
    do_set_acc(Role,
               Handle#camp_handle{return_acc = 1},
               AllLev);
update_acc(Role,
           Handle = #camp_handle{camp =
                                     #camp_web{sec_type = 40007, third_type = 3,
                                               tar_val = _TarVal},
                                 evt = #evt_enchant{lev = Lev}}) ->
    do_set_acc(Role,
               Handle#camp_handle{return_acc = 1},
               Lev);
update_acc(Role, Handle) -> {ok, Role, Handle}.

do_update_acc(Role = #role{m_camp_web =
                               CampWeb = #m_camp_web{acc = AccL}},
              Handle = #camp_handle{camp =
                                        #camp_web{sec_type = SecType,
                                                  settlement = Settle,
                                                  key = TKey = {CampId, _}},
                                    time = Now},
              AddVal) ->
    Key = case SecType of
              50004 -> {CampId, 0};
              _ -> TKey
          end,
    NewAccL = case lists:keyfind(Key, 1, AccL) of
                  false -> [{Key, Now, AddVal} | AccL];
                  {Key, Time, Val} when Settle =:= 1 ->
                      case date:is_today(Time) of
                          true ->
                              lists:keyreplace(Key,
                                               1,
                                               AccL,
                                               {Key, Time, Val + AddVal});
                          false ->
                              lists:keyreplace(Key, 1, AccL, {Key, Now, AddVal})
                      end;
                  {Key, Time, Val} when Settle =:= 3 ->
                      case date:is_today_five_reset(Time) of
                          true ->
                              lists:keyreplace(Key,
                                               1,
                                               AccL,
                                               {Key, Time, Val + AddVal});
                          false ->
                              lists:keyreplace(Key, 1, AccL, {Key, Now, AddVal})
                      end;
                  {Key, Time, Val} ->
                      lists:keyreplace(Key,
                                       1,
                                       AccL,
                                       {Key, Time, Val + AddVal})
              end,
    {ok,
     Role#role{m_camp_web =
                   CampWeb#m_camp_web{acc = NewAccL}},
     Handle#camp_handle{push_cli = 1}}.

do_set_acc(Role = #role{m_camp_web =
                            CampWeb = #m_camp_web{acc = AccL}},
           Handle = #camp_handle{camp =
                                     #camp_web{settlement = Settle, key = Key},
                                 time = Now},
           AddVal) ->
    NewAccL = case lists:keyfind(Key, 1, AccL) of
                  false -> [{Key, Now, AddVal} | AccL];
                  {Key, Time, Val} when Settle =:= 1 ->
                      case date:is_today(Time) of
                          true when AddVal >= Val ->
                              lists:keyreplace(Key,
                                               1,
                                               AccL,
                                               {Key, Now, AddVal});
                          true -> AccL;
                          false ->
                              lists:keyreplace(Key, 1, AccL, {Key, Now, Val})
                      end;
                  {Key, Time, Val} when Settle =:= 3 ->
                      case date:is_today_five_reset(Time) of
                          true when AddVal >= Val ->
                              lists:keyreplace(Key,
                                               1,
                                               AccL,
                                               {Key, Now, AddVal});
                          true -> AccL;
                          false ->
                              lists:keyreplace(Key, 1, AccL, {Key, Now, AddVal})
                      end;
                  {Key, Time, Val} when AddVal >= Val ->
                      lists:keyreplace(Key, 1, AccL, {Key, Time, AddVal});
                  {_Key, _Time, _Val} -> AccL
              end,
    {ok,
     Role#role{m_camp_web =
                   CampWeb#m_camp_web{acc = NewAccL}},
     Handle#camp_handle{push_cli = 1}}.

do_force_set_acc(Role = #role{m_camp_web =
                                  CampWeb = #m_camp_web{acc = AccL}},
                 Handle = #camp_handle{camp =
                                           #camp_web{settlement = Settle,
                                                     key = Key},
                                       time = Now},
                 AddVal) ->
    NewAccL = case lists:keyfind(Key, 1, AccL) of
                  false -> [{Key, Now, AddVal} | AccL];
                  {Key, Time, Val} when Settle =:= 1 ->
                      case date:is_today(Time) of
                          true ->
                              lists:keyreplace(Key,
                                               1,
                                               AccL,
                                               {Key, Now, AddVal});
                          false ->
                              lists:keyreplace(Key, 1, AccL, {Key, Now, Val})
                      end;
                  {Key, Time, _Val} when Settle =:= 3 ->
                      case date:is_today_five_reset(Time) of
                          true ->
                              lists:keyreplace(Key,
                                               1,
                                               AccL,
                                               {Key, Now, AddVal});
                          false ->
                              lists:keyreplace(Key, 1, AccL, {Key, Now, AddVal})
                      end;
                  {Key, Time, _Val} ->
                      lists:keyreplace(Key, 1, AccL, {Key, Time, AddVal})
              end,
    {ok,
     Role#role{m_camp_web =
                   CampWeb#m_camp_web{acc = NewAccL}},
     Handle#camp_handle{push_cli = 1}}.

do_update_acc_each(Role = #role{m_camp_web =
                                    CampWeb = #m_camp_web{acc = AccL}},
                   Handle = #camp_handle{camp =
                                             #camp_web{settlement = Settle,
                                                       key = Key},
                                         time = Now},
                   AddVal, EachVal) ->
    {AddReward, NewAccL} = case lists:keyfind(Key, 1, AccL)
                               of
                               false when EachVal =:= 1 -> {AddVal, AccL};
                               false ->
                                   {AddVal div EachVal,
                                    [{Key, Now, AddVal rem EachVal} | AccL]};
                               {Key, Time, Val} when Settle =:= 1 ->
                                   case date:is_today(Time) of
                                       true ->
                                           {(Val + AddVal) div EachVal,
                                            lists:keyreplace(Key,
                                                             1,
                                                             AccL,
                                                             {Key,
                                                              Time,
                                                              (Val + AddVal) rem
                                                                  EachVal})};
                                       false ->
                                           {AddVal div EachVal,
                                            lists:keyreplace(Key,
                                                             1,
                                                             AccL,
                                                             {Key,
                                                              Now,
                                                              AddVal rem
                                                                  EachVal})}
                                   end;
                               {Key, Time, Val} when Settle =:= 3 ->
                                   case date:is_today_five_reset(Time) of
                                       true ->
                                           {(Val + AddVal) div EachVal,
                                            lists:keyreplace(Key,
                                                             1,
                                                             AccL,
                                                             {Key,
                                                              Time,
                                                              (Val + AddVal) rem
                                                                  EachVal})};
                                       false ->
                                           {AddVal div EachVal,
                                            lists:keyreplace(Key,
                                                             1,
                                                             AccL,
                                                             {Key,
                                                              Now,
                                                              AddVal rem
                                                                  EachVal})}
                                   end;
                               {Key, Time, Val} ->
                                   {(Val + AddVal) div EachVal,
                                    lists:keyreplace(Key,
                                                     1,
                                                     AccL,
                                                     {Key,
                                                      Time,
                                                      (Val + AddVal) rem
                                                          EachVal})}
                           end,
    {ok,
     Role#role{m_camp_web =
                   CampWeb#m_camp_web{acc = NewAccL}},
     Handle#camp_handle{add_can_reward =
                            min(AddReward,
                                get_can_max_reward_num(Role, Handle)),
                        push_cli = 1}}.

do_update_acc_day(Role = #role{m_camp_web =
                                   CampWeb = #m_camp_web{acc = AccL}},
                  Handle = #camp_handle{camp = #camp_web{key = Key},
                                        time = Now},
                  AddVal, Label) ->
    NewAccL = case lists:keyfind(Key, 1, AccL) of
                  false -> [{Key, Now, AddVal} | AccL];
                  {Key, Time, Val} when Label == zero ->
                      case date:is_today(Time) of
                          true -> AccL;
                          false ->
                              lists:keyreplace(Key,
                                               1,
                                               AccL,
                                               {Key, Now, AddVal + Val})
                      end;
                  {Key, Time, Val} ->
                      case date:is_today_five_reset(Time) of
                          true -> AccL;
                          false ->
                              lists:keyreplace(Key,
                                               1,
                                               AccL,
                                               {Key, Now, AddVal + Val})
                      end
              end,
    {ok,
     Role#role{m_camp_web =
                   CampWeb#m_camp_web{acc = NewAccL}},
     Handle#camp_handle{push_cli = 1}}.

gm_next_day(Role = #role{m_camp_web =
                             CampWeb = #m_camp_web{acc = AccL}}) ->
    AccL1 = [{Key, Time - 86400, Val}
             || {Key, Time, Val} <- AccL],
    {ok,
     Role#role{m_camp_web =
                   CampWeb#m_camp_web{acc = AccL1}}}.

do_event(Evt, Role) ->
    Now = date:unixtime(),
    TotalCamp = camp_web_mgr:list_all(Now),
    {NRole, Handle} = do_total_camp(TotalCamp,
                                    Role,
                                    #camp_handle{time = Now, evt = Evt,
                                                 call_form = evt}),
    case Handle of
        #camp_handle{push_list = PushList = [_ | _]} ->
            sys_conn:pack_send(14052, {PushList});
        _ -> skip
    end,
    NRole.

do_total_camp([], Role, Handle) -> {Role, Handle};
do_total_camp([TotalCamp = #camp_web_ico{menu_list =
                                             MenuList}
               | T],
              Role, Handle) ->
    {NRole, NewHandle} = do_menu_camp(MenuList,
                                      Role,
                                      Handle#camp_handle{total_camp =
                                                             TotalCamp}),
    do_total_camp(T, NRole, NewHandle).

do_menu_camp([], Role, Handle) -> {Role, Handle};
do_menu_camp([#camp_web_menu{reward_mod = 3} | T], Role,
             Handle) ->
    do_menu_camp(T, Role, Handle);
do_menu_camp([Menu = #camp_web_menu{camp_list = List,
                                    sec_type = 10005}
              | T],
             Role, Handle = #camp_handle{evt = Evt}) ->
    {LastList, PreList} = lists:partition(fun
                                              (#camp_web{val2 = Val2}) ->
                                                  Val2 == 2
                                          end,
                                          List),
    NList = [{Camp,
              get_acc_info(Role,
                           Handle#camp_handle{camp = Camp, add_can_reward = 0,
                                              push_cli = 0})}
             || Camp <- PreList],
    TodayList = [1
                 || {_, {_, Time, Acc}} <- NList,
                    Acc > 0 andalso date:is_today(Time)],
    TodayLength = length(TodayList),
    NList2 = case [Camp
                   || {Camp, {_, _, Acc}} <- NList, Acc == 0]
                 of
                 _ when TodayLength >= 1 -> [];
                 [] -> [];
                 PreList2 = [_] ->
                     PreList3 = [Camp || Camp <- PreList2],
                     PreList3 ++ LastList;
                 PreList2 ->
                     PreList3 = [Camp || Camp <- PreList2],
                     [I | _] = lists:keysort(#camp_web.n, PreList3),
                     [I]
             end,
    case check_evt(Evt, Menu) of
        true ->
            case check_real_time(Role,
                                 Handle#camp_handle{menu = Menu})
                of
                {true, NewMenu} ->
                    {NRole, NewHandle} = do_camp(NList2,
                                                 [calc_acc,
                                                  condition,
                                                  check_reward,
                                                  evt_reward],
                                                 Role,
                                                 Handle#camp_handle{menu =
                                                                        NewMenu}),
                    do_menu_camp(T, NRole, NewHandle);
                _ -> do_menu_camp(T, Role, Handle)
            end;
        _ -> do_menu_camp(T, Role, Handle)
    end;
do_menu_camp([Menu = #camp_web_menu{camp_list = List,
                                    sec_type = 50004}
              | T],
             Role, Handle = #camp_handle{evt = Evt}) ->
    case check_evt(Evt, Menu) of
        true when List == [] -> do_menu_camp(T, Role, Handle);
        true ->
            [I | _] = List,
            case check_real_time(Role,
                                 Handle#camp_handle{menu = Menu})
                of
                {true, NewMenu} ->
                    {NRole, NewHandle} = do_camp([I],
                                                 [calc_acc,
                                                  condition,
                                                  check_reward,
                                                  evt_reward],
                                                 Role,
                                                 Handle#camp_handle{menu =
                                                                        NewMenu}),
                    do_menu_camp(T, NRole, NewHandle);
                _ -> do_menu_camp(T, Role, Handle)
            end;
        _ -> do_menu_camp(T, Role, Handle)
    end;
do_menu_camp([Menu = #camp_web_menu{camp_list = List}
              | T],
             Role, Handle = #camp_handle{evt = Evt}) ->
    case check_evt(Evt, Menu) of
        true ->
            case check_real_time(Role,
                                 Handle#camp_handle{menu = Menu})
                of
                {true, NewMenu} ->
                    {NRole, NewHandle} = do_camp(List,
                                                 [calc_acc,
                                                  condition,
                                                  check_reward,
                                                  evt_reward],
                                                 Role,
                                                 Handle#camp_handle{menu =
                                                                        NewMenu}),
                    do_menu_camp(T, NRole, NewHandle);
                _ -> do_menu_camp(T, Role, Handle)
            end;
        _ -> do_menu_camp(T, Role, Handle)
    end.

do_camp([], _, Role, Handle) -> {Role, Handle};
do_camp([Camp | T], CheckList, Role, Handle) ->
    case do_handle(CheckList,
                   Role,
                   Handle#camp_handle{camp = Camp, add_can_reward = 0,
                                      push_cli = 0})
        of
        {ok,
         NRole,
         NewHandle = #camp_handle{push_cli = 1,
                                  push_list = PushList,
                                  total_camp = #camp_web_ico{id = TotalId},
                                  menu =
                                      #camp_web_menu{id = MenuId,
                                                     reward_mod = RewardMod},
                                  camp =
                                      #camp_web{is_desc = 0, tar_val = TarVal}}}
            when RewardMod =/= 2 orelse TarVal > 0 ->
            NewPushList = case do_camp_cli(NRole, NewHandle) of
                              false -> PushList;
                              CliCamp -> [{TotalId, MenuId, CliCamp} | PushList]
                          end,
            do_camp(T,
                    CheckList,
                    NRole,
                    NewHandle#camp_handle{push_list = NewPushList});
        {ok, NRole, NewHandle} ->
            do_camp(T, CheckList, NRole, NewHandle);
        {false, _Reason} -> do_camp(T, CheckList, Role, Handle)
    end.

guild_push(_Err) -> ok.

do_handle([], Role, Handle) -> {ok, Role, Handle};
do_handle([Label | T], Role,
          Handle = #camp_handle{call_form = CallForm,
                                camp = Camp}) ->
    case catch do_handle(Label, Role, Handle) of
        {ok, NRole, NewHandle} ->
            do_handle(T, NRole, NewHandle);
        {false, _Reason} when CallForm =:= evt ->
            {ok, Role, Handle};
        {false, Reason} -> {false, Reason};
        {false, _Reason, NewHandle} when CallForm =:= evt ->
            {ok, Role, NewHandle};
        {false, Reason, _NewHandle} -> {false, Reason};
        {break, NRole, NewHandle} -> {ok, NRole, NewHandle};
        {NRole = #role{}, NewHandle = #camp_handle{}} ->
            do_handle(T, NRole, NewHandle);
        _Err ->
            logger:error("处理活动[~w,~w]出错:~w",
                         [Label, Camp, _Err],
                         camp_web,
                         612),
            {false, lang:get("活动处理出错")}
    end;
do_handle(calc_acc, Role, Handle) ->
    update_acc(Role, Handle);
do_handle(condition, Role, Handle) ->
    case camp_web_cond:check(Role, Handle) of
        true -> {ok, Role, Handle};
        false -> {false, lang:get("条件未达成")};
        Ret -> Ret
    end;
do_handle(check_reward, Role, Handle) ->
    case get_can_max_reward_num(Role, Handle) > 0 of
        true -> {ok, Role, Handle};
        _ ->
            {false,
             lang:get("奖励已领取"),
             Handle#camp_handle{push_cli = 0}}
    end;
do_handle(evt_reward, Role,
          Handle = #camp_handle{camp =
                                    #camp_web{sec_type = 10006}}) ->
    acc_can_reward_num(Role, Handle);
do_handle(evt_reward, TRole = #role{id = RoleId},
          Handle = #camp_handle{menu =
                                    #camp_web_menu{id = MenuId,
                                                   notice_msg = NoticeMsg,
                                                   reward_mod = 2,
                                                   mail_title = Title,
                                                   mail_content = Content},
                                camp =
                                    #camp_web{n = N, sec_type = SecType,
                                              val1 = Val1, items = Items0,
                                              tar_val = TarVal},
                                add_can_reward = AddCanReward, evt = Evt}) ->
    {TItems, Role} = case SecType of
                         10007 ->
                             case Evt of
                                 #evt_pay{gold = Gold, sn = Sn} ->
                                     {[{90002,
                                        0,
                                        util:ceil(Gold * Val1 / 1000)}],
                                      var:set_var(TRole, other, 2041, Sn)};
                                 _ -> {[], TRole}
                             end;
                         _ -> {Items0, TRole}
                     end,
    Acc = camp_web:get_acc_val(Role, Handle),
    RewardNum = case SecType of
                    20002 -> max(1, Acc div TarVal);
                    _ -> max(1, AddCanReward)
                end,
    Items = campaign:parse_items(TItems, Role, []),
    NewItems = [{BaseId, Bind, Val * RewardNum}
                || {BaseId, Bind, Val} <- Items],
    fun_call:exec(mail,
                  send,
                  [RoleId, Title, Content, NewItems]),
    case NoticeMsg of
        "" -> skip;
        _ ->
            catch notice:cast(all,
                              5,
                              notice:replace_msg([{"#role#", [{role_2, Role}]},
                                                  {"#item#",
                                                   [{item_2, NewItems}]}],
                                                 NoticeMsg))
    end,
    log:mod(Role,
            misc,
            util:fbin("[~w]达成后台活动~w,~w:~ts",
                      [get(rpc_code), MenuId, N, Title])),
    NRole1 = case SecType of
                 20002 ->
                     {ok, NRole, _} = do_force_set_acc(Role,
                                                       Handle,
                                                       Acc rem TarVal),
                     NRole;
                 _ -> Role
             end,
    acc_rewarded_num(NRole1, Handle, RewardNum);
do_handle(evt_reward, Role,
          Handle = #camp_handle{menu =
                                    #camp_web_menu{reward_mod = 4}}) ->
    acc_can_reward_num1(Role, Handle);
do_handle(evt_reward, Role, Handle) ->
    acc_can_reward_num(Role, Handle);
do_handle(rpc_reward, Role,
          Handle = #camp_handle{menu =
                                    #camp_web_menu{notice_msg = NoticeMsg},
                                rpc_reward_num = RpcRewardNum, time = Now,
                                camp =
                                    #camp_web{sec_type = SecType, val1 = Val1,
                                              val2 = Val2,
                                              loss_items = LossItems0,
                                              items = Items0,
                                              key = Key = {CampId, _}}}) ->
    RewardNum = max(RpcRewardNum,
                    get_can_reward_num(Role, Handle)),
    AddNum = case SecType of
                 10001 -> 1;
                 10006 -> 1;
                 _ -> RewardNum
             end,
    TItems = campaign:parse_items(Items0, Role, []),
    LossItems = case SecType of
                    50004 -> [];
                    _ ->
                        [{BaseId, Num * AddNum} || {BaseId, Num} <- LossItems0]
                end,
    Items = case SecType of
                10007 ->
                    Gold = camp_web:get_acc_val(Role, Handle),
                    [{90002, util:ceil(Gold * Val1 / 1000)}];
                _ -> TItems
            end,
    NewItems = [{BaseId, Bind, Num * AddNum}
                || {BaseId, Bind, Num} <- Items],
    LossL = format:val_to_loss(LossItems),
    GainL = format:val_to_gain(NewItems),
    GL = LossL ++ GainL,
    case role_gain:do_notice(GL, Role, lang:get("活动奖励")) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {false, #gain{msg = Msg}} -> {false, Msg};
        {ok,
         Role1 = #role{m_camp_web =
                           MCampWeb = #m_camp_web{can_reward = CanRewardL,
                                                  acc = Acc}}}
            when SecType == 50004 ->
            TypeKey = {CampId, 0},
            CostScore = Val2 * RpcRewardNum,
            case lists:keyfind(TypeKey, 1, Acc) of
                {_, Time, Score} when Score >= CostScore ->
                    NewAcc = lists:keyreplace(TypeKey,
                                              1,
                                              Acc,
                                              {TypeKey,
                                               Time,
                                               Score - CostScore}),
                    NewCanRewardL = case RewardNum of
                                        1 ->
                                            lists:keystore(Key,
                                                           1,
                                                           CanRewardL,
                                                           {Key,
                                                            Now,
                                                            RewardNum - 1});
                                        _ -> lists:keydelete(Key, 1, CanRewardL)
                                    end,
                    Role2 = Role1#role{m_camp_web =
                                           MCampWeb#m_camp_web{can_reward =
                                                                   NewCanRewardL,
                                                               acc = NewAcc}},
                    case NoticeMsg of
                        "" -> skip;
                        _ ->
                            catch notice:cast(all,
                                              5,
                                              notice:replace_msg([{"#role#",
                                                                   [{role_2,
                                                                     Role}]},
                                                                  {"#item#",
                                                                   [{item_2,
                                                                     NewItems}]}],
                                                                 NoticeMsg))
                    end,
                    log:camp_web(Role, Role2, LossItems, NewItems, Handle),
                    acc_rewarded_num(Role2, Handle, RewardNum);
                _ -> {false, lang:get("积分不足")}
            end;
        {ok,
         Role1 = #role{m_camp_web =
                           MCampWeb = #m_camp_web{can_reward = CanRewardL}}} ->
            NewCanRewardL = lists:keystore(Key,
                                           1,
                                           CanRewardL,
                                           {Key, Now, RewardNum - AddNum}),
            Role2 = Role1#role{m_camp_web =
                                   MCampWeb#m_camp_web{can_reward =
                                                           NewCanRewardL}},
            case NoticeMsg of
                "" -> skip;
                _ ->
                    catch notice:cast(all,
                                      5,
                                      notice:replace_msg([{"#role#",
                                                           [{role_2, Role}]},
                                                          {"#item#",
                                                           [{item_2,
                                                             NewItems}]}],
                                                         NoticeMsg))
            end,
            log:camp_web(Role, Role2, LossItems, NewItems, Handle),
            acc_rewarded_num(Role2, Handle, AddNum)
    end;
do_handle(rpc_send,
          Role = #role{id = RoleId, name = RoleName},
          Handle = #camp_handle{rpc_reward_num = RpcRewardNum,
                                menu = #camp_web_menu{notice_msg = NoticeMsg},
                                camp =
                                    #camp_web{val3 = Gold, items = Items0,
                                              key = Key},
                                to_id = OtherId}) ->
    RewardNum = max(RpcRewardNum,
                    get_can_reward_num(Role, Handle)),
    Items = campaign:parse_items(Items0, Role, []),
    LossItems = [{90002, Gold * RewardNum}],
    NewItems = [{BaseId, Bind, Num * RewardNum}
                || {BaseId, Bind, Num} <- Items],
    LossL = format:val_to_loss(LossItems),
    GL = LossL,
    case role_misc:is_local_role(OtherId) of
        true ->
            case friend:is_friend(RoleId, OtherId) of
                true ->
                    case role_gain:do_notice(GL, Role, lang:get("赠送活动")) of
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        {false, #gain{msg = Msg}} -> {false, Msg};
                        {ok,
                         Role1 = #role{m_camp_web =
                                           MCampWeb = #m_camp_web{can_reward =
                                                                      CanRewardL}}} ->
                            Role2 = Role1#role{m_camp_web =
                                                   MCampWeb#m_camp_web{can_reward
                                                                           =
                                                                           lists:keydelete(Key,
                                                                                           1,
                                                                                           CanRewardL)}},
                            case NoticeMsg of
                                "" -> skip;
                                _ ->
                                    catch notice:cast(all,
                                                      5,
                                                      notice:replace_msg([{"#role#",
                                                                           [{role_2,
                                                                             Role}]},
                                                                          {"#item#",
                                                                           [{item_2,
                                                                             NewItems}]}],
                                                                         NoticeMsg))
                            end,
                            mail:send(OtherId,
                                      lang:get("好友赠送"),
                                      util:flist(lang:get("收到好友~ts的赠送物品"),
                                                 [RoleName]),
                                      NewItems),
                            log:camp_web(Role,
                                         Role2,
                                         LossItems,
                                         NewItems,
                                         Handle),
                            acc_rewarded_num(Role2, Handle, RewardNum)
                    end;
                _ -> {false, lang:get("对方不是您的好友")}
            end;
        _ -> {false, lang:get("只能赠送给本服的好友")}
    end.

acc_rewarded_num(Role = #role{m_camp_web =
                                  MCampWeb = #m_camp_web{rewarded = Rewarded}},
                 Handle = #camp_handle{camp = #camp_web{key = Key},
                                       time = Now},
                 N) ->
    NewRewarded = lists:keystore(Key,
                                 1,
                                 Rewarded,
                                 {Key,
                                  Now,
                                  get_had_reward_num(Role, Handle) + N}),
    NRole = Role#role{m_camp_web =
                          MCampWeb#m_camp_web{rewarded = NewRewarded}},
    {NRole, Handle}.

acc_can_reward_num(Role = #role{m_camp_web =
                                    MCampWeb = #m_camp_web{can_reward =
                                                               CanRewardL}},
                   Handle = #camp_handle{menu =
                                             #camp_web_menu{camp_list =
                                                                CampList},
                                         time = Now,
                                         camp =
                                             #camp_web{key = Key, val1 = PreAcc,
                                                       val2 = TotalMax,
                                                       sec_type = 10006}}) ->
    TotalHadReward =
        lists:sum([camp_web:get_had_reward_num(Role,
                                               Handle#camp_handle{camp = Camp})
                   || Camp <- CampList]),
    Acc = get_acc_val(Role, Handle),
    TotalCanRewad = Acc div PreAcc,
    case TotalHadReward >= TotalMax of
        true -> {ok, Role, Handle#camp_handle{push_cli = 1}};
        _ when TotalHadReward >= TotalCanRewad ->
            {ok, Role, Handle#camp_handle{push_cli = 1}};
        _ ->
            OldCanReward = get_can_reward_num(Role, Handle),
            case TotalCanRewad > OldCanReward of
                false -> {ok, Role, Handle#camp_handle{push_cli = 1}};
                _ ->
                    NewCanRewardNum = min(OldCanReward + 1,
                                          get_can_max_reward_num(Role, Handle)),
                    NewCanRewardL = lists:keystore(Key,
                                                   1,
                                                   CanRewardL,
                                                   {Key, Now, NewCanRewardNum}),
                    NRole = Role#role{m_camp_web =
                                          MCampWeb#m_camp_web{can_reward =
                                                                  NewCanRewardL}},
                    {ok, NRole, Handle#camp_handle{push_cli = 1}}
            end
    end;
acc_can_reward_num(Role = #role{m_camp_web =
                                    MCampWeb = #m_camp_web{can_reward =
                                                               CanRewardL}},
                   Handle = #camp_handle{time = Now,
                                         camp =
                                             #camp_web{key = Key,
                                                       sec_type = 10001}}) ->
    OldCanReward = get_can_reward_num(Role, Handle),
    NewCanRewardNum = min(OldCanReward + 1,
                          get_can_max_reward_num(Role, Handle)),
    NewCanRewardL = lists:keystore(Key,
                                   1,
                                   CanRewardL,
                                   {Key, Now, NewCanRewardNum}),
    NRole = Role#role{m_camp_web =
                          MCampWeb#m_camp_web{can_reward = NewCanRewardL}},
    {ok, NRole, Handle#camp_handle{push_cli = 1}};
acc_can_reward_num(Role = #role{m_camp_web =
                                    MCampWeb = #m_camp_web{can_reward =
                                                               CanRewardL,
                                                           acc = AccList}},
                   Handle = #camp_handle{time = Now,
                                         camp =
                                             #camp_web{key = Key,
                                                       sec_type = 20002,
                                                       tar_val = TarVal}}) ->
    Acc = camp_web:get_acc_val(Role, Handle),
    NewCanRewardNum = min(Acc div TarVal,
                          get_can_max_reward_num(Role, Handle)),
    NewCanRewardL = lists:keystore(Key,
                                   1,
                                   CanRewardL,
                                   {Key, Now, NewCanRewardNum}),
    Acc = camp_web:get_acc_val(Role, Handle),
    NewAccList = lists:keystore(Key,
                                1,
                                AccList,
                                {Key, Now, Acc rem TarVal}),
    NRole = Role#role{m_camp_web =
                          MCampWeb#m_camp_web{can_reward = NewCanRewardL,
                                              acc = NewAccList}},
    {ok, NRole, Handle#camp_handle{push_cli = 1}};
acc_can_reward_num(Role = #role{m_camp_web =
                                    MCampWeb = #m_camp_web{can_reward =
                                                               CanRewardL}},
                   Handle = #camp_handle{add_can_reward = AddCanReward,
                                         time = Now,
                                         camp = #camp_web{key = Key}}) ->
    OldCanReward = get_can_reward_num(Role, Handle),
    NewCanRewardNum = case AddCanReward of
                          0 -> 1;
                          _ ->
                              min(OldCanReward + AddCanReward,
                                  get_can_max_reward_num(Role, Handle))
                      end,
    NewCanRewardL = lists:keystore(Key,
                                   1,
                                   CanRewardL,
                                   {Key, Now, NewCanRewardNum}),
    NRole = Role#role{m_camp_web =
                          MCampWeb#m_camp_web{can_reward = NewCanRewardL}},
    {ok, NRole, Handle#camp_handle{push_cli = 1}}.

acc_can_reward_num1(Role = #role{m_camp_web =
                                     MCampWeb = #m_camp_web{end_reward =
                                                                RewardL}},
                    Handle = #camp_handle{total_camp =
                                              #camp_web_ico{id = CampId},
                                          menu =
                                              #camp_web_menu{id = ID,
                                                             mail_title = Title,
                                                             mail_content =
                                                                 Content},
                                          camp =
                                              #camp_web{tar_val = Val,
                                                        items = Items}}) ->
    NewRewardL = case lists:keyfind(ID, 2, RewardL) of
                     false ->
                         [{CampId, ID, Val, Title, Content, Items} | RewardL];
                     {_, Val1, _, _, _, _} when Val >= Val1 ->
                         lists:keyreplace(ID,
                                          2,
                                          RewardL,
                                          {CampId,
                                           ID,
                                           Val,
                                           Title,
                                           Content,
                                           Items});
                     _ -> RewardL
                 end,
    NRole = Role#role{m_camp_web =
                          MCampWeb#m_camp_web{end_reward = NewRewardL}},
    {ok, NRole, Handle#camp_handle{push_cli = 1}}.

get_acc_val(#role{m_guild = MGuild},
            #camp_handle{camp =
                             #camp_web{sec_type = 30011, settlement = Settle,
                                       key = TKey}}) ->
    Key = TKey,
    case MGuild of
        #m_guild{id = GId} ->
            case guild_mgr:attr(GId, #guild.guild_camp_web) of
                #guild_camp_web{acc = AccL} ->
                    case lists:keyfind(Key, 1, AccL) of
                        {Key, Time, Val} when Settle =:= 1 ->
                            case date:is_today(Time) of
                                true -> Val;
                                false -> 0
                            end;
                        {Key, Time, Val} when Settle =:= 3 ->
                            case date:is_today_five_reset(Time) of
                                true -> Val;
                                false -> 0
                            end;
                        {Key, _Time, Val} -> Val;
                        _ -> 0
                    end;
                _ -> 0
            end;
        _ -> 0
    end;
get_acc_val(#role{m_camp_web = #m_camp_web{acc = AccL}},
            #camp_handle{camp =
                             #camp_web{sec_type = SecType, settlement = Settle,
                                       key = TKey = {CampId, _}}}) ->
    Key = case SecType of
              50004 -> {CampId, 0};
              _ -> TKey
          end,
    case lists:keyfind(Key, 1, AccL) of
        {Key, Time, Val} when Settle =:= 1 ->
            case date:is_today(Time) of
                true -> Val;
                false -> 0
            end;
        {Key, Time, Val} when Settle =:= 3 ->
            case date:is_today_five_reset(Time) of
                true -> Val;
                false -> 0
            end;
        {Key, _Time, Val} -> Val;
        _ -> 0
    end.

get_acc_info(#role{m_camp_web =
                       #m_camp_web{acc = AccL}},
             #camp_handle{camp =
                              #camp_web{sec_type = SecType, settlement = Settle,
                                        key = TKey = {CampId, _}}}) ->
    Key = case SecType of
              50004 -> {CampId, 0};
              _ -> TKey
          end,
    case lists:keyfind(Key, 1, AccL) of
        Info = {Key, Time, _Val} when Settle =:= 1 ->
            case date:is_today(Time) of
                true -> Info;
                false -> {Key, 0, 0}
            end;
        Info = {Key, Time, _Val} when Settle =:= 3 ->
            case date:is_today_five_reset(Time) of
                true -> Info;
                false -> {Key, 0, 0}
            end;
        Info = {Key, _Time, _Val} -> Info;
        _ -> {Key, 0, 0}
    end.

del_acc_val(Role = #role{m_camp_web =
                             MCampWeb = #m_camp_web{acc = AccL}},
            #camp_handle{camp = #camp_web{key = Key}}) ->
    NewAccL = lists:keydelete(Key, 1, AccL),
    Role#role{m_camp_web =
                  MCampWeb#m_camp_web{acc = NewAccL}}.

get_can_reward_num(#role{m_guild = MGuild},
                   #camp_handle{camp =
                                    #camp_web{key = Key, sec_type = 30011,
                                              settlement = Settle}}) ->
    case MGuild of
        #m_guild{id = GId} ->
            case guild_mgr:attr(GId, #guild.guild_camp_web) of
                #guild_camp_web{can_reward = CanReward} ->
                    case lists:keyfind(Key, 1, CanReward) of
                        {Key, Time, N} when Settle =:= 1 ->
                            case date:is_today(Time) of
                                true -> N;
                                false -> 0
                            end;
                        {Key, Time, N} when Settle =:= 3 ->
                            case date:is_today_five_reset(Time) of
                                true -> N;
                                false -> 0
                            end;
                        {Key, _Time, N} -> N;
                        _Err -> 0
                    end;
                _ -> 0
            end;
        _ -> 0
    end;
get_can_reward_num(#role{m_camp_web =
                             #m_camp_web{can_reward = CanReward}},
                   #camp_handle{camp =
                                    #camp_web{key = Key,
                                              settlement = Settle}}) ->
    case lists:keyfind(Key, 1, CanReward) of
        {Key, Time, N} when Settle =:= 1 ->
            case date:is_today(Time) of
                true -> N;
                false -> 0
            end;
        {Key, Time, N} when Settle =:= 3 ->
            case date:is_today_five_reset(Time) of
                true -> N;
                false -> 0
            end;
        {Key, _Time, N} -> N;
        _Err -> 0
    end.

get_can_reward_info(#role{m_camp_web =
                              #m_camp_web{can_reward = AccL}},
                    #camp_handle{camp =
                                     #camp_web{sec_type = SecType,
                                               settlement = Settle,
                                               key = TKey = {CampId, _}}}) ->
    Key = case SecType of
              50004 -> {CampId, 0};
              _ -> TKey
          end,
    case lists:keyfind(Key, 1, AccL) of
        Info = {Key, Time, _Val} when Settle =:= 1 ->
            case date:is_today(Time) of
                true -> Info;
                false -> {Key, 0, 0}
            end;
        Info = {Key, Time, _Val} when Settle =:= 3 ->
            case date:is_today_five_reset(Time) of
                true -> Info;
                false -> {Key, 0, 0}
            end;
        Info = {Key, _Time, _Val} -> Info;
        _ -> {Key, 0, 0}
    end.

get_had_reward_num(#role{m_camp_web =
                             #m_camp_web{rewarded = Rewarded}},
                   #camp_handle{camp =
                                    #camp_web{settlement = Settle,
                                              key = Key}}) ->
    case lists:keyfind(Key, 1, Rewarded) of
        {Key, Time, Val} when Settle =:= 1 ->
            case date:is_today(Time) of
                true -> Val;
                false -> 0
            end;
        {Key, Time, Val} when Settle =:= 3 ->
            case date:is_today(Time) of
                true -> Val;
                false -> 0
            end;
        {Key, _Time, Val} -> Val;
        _ -> 0
    end.

get_can_max_reward_num(_Role,
                       #camp_handle{camp = #camp_web{reward_num = 0}}) ->
    0;
get_can_max_reward_num(Role,
                       Handle = #camp_handle{camp =
                                                 #camp_web{reward_num =
                                                               Max}}) ->
    max(0, Max - get_had_reward_num(Role, Handle)).

get_prog_val(_Role, #camp_handle{camp = Camp}) -> Camp.

