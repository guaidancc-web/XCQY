-file("src/mod/attr/attr.erl", 1).

-module(attr).

-export([init/0,
         calc/1,
         calc/2,
         calc_and_push/1,
         push_10001/1,
         push_10000/1,
         push_10011/1,
         push_10007/1,
         push_10023/1,
         login/1,
         calc_reg/1,
         check_hp_mp/2,
         calc_item_score/1,
         calc_item_score/2,
         do_calc_item_score/2,
         merge_attr/1,
         merge_attr/2,
         do_math_add/2,
         do_math_ratio/2,
         round_attr/1,
         auto_point/3,
         add_point/6,
         set_point/6,
         reset_point/1,
         do_reset_point/2,
         to_list/1,
         calc_fc/1,
         get_war_fc/1,
         change_point_plan/2,
         five_flush/2,
         pre_change_point_plan/2,
         point_classes_modify/2,
         rpc_open_method/2,
         repaire_fashion/2]).

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

-file("src/mod/attr/attr.erl", 46).

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

-file("src/mod/attr/attr.erl", 47).

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

-file("src/mod/attr/attr.erl", 48).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/attr/attr.erl", 49).

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

-file("src/mod/attr/attr.erl", 50).

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

-file("src/mod/attr/attr.erl", 51).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/mod/attr/attr.erl", 52).

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

-file("src/mod/attr/attr.erl", 53).

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

-file("src/mod/attr/attr.erl", 54).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/attr/attr.erl", 55).

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

-file("src/mod/attr/attr.erl", 56).

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

-file("src/mod/attr/attr.erl", 57).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/attr/attr.erl", 58).

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

-file("src/mod/attr/attr.erl", 59).

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

-file("src/mod/attr/attr.erl", 60).

init() -> #m_attr_point{}.

init(Role = #role{classes = Classes}) ->
    InitPlan = #attr_point_plan{strength = Str,
                                constitution = Con, magic = Mag, agility = Agi,
                                endurance = End} =
                   init_point_plan(Classes, 1),
    DividePlan = InitPlan#attr_point_plan{strength =
                                              Str + 1,
                                          constitution = Con + 1,
                                          magic = Mag + 1, agility = Agi + 1,
                                          endurance = End + 1},
    Peqm = eqm:init(eqm, Role),
    Pbag = eqm:init(bag, Role),
    MAttrPoint = #m_attr_point{plan_data = [DividePlan]},
    Role#role{m_attr_point = MAttrPoint, p_eqm = Peqm,
              p_bag = Pbag}.

init_point_plan(Classes, PlanIndex) ->
    {PreStr, PreCon, PreMagic, PreAgi, PreEnd} = case
                                                     attr_data:auto_point({1,
                                                                           Classes})
                                                     of
                                                     {Ps, Pc, Pm, Pa, Pe}
                                                         when Ps + Pc + Pm + Pa
                                                                  + Pe
                                                                  =:= 5 ->
                                                         {Ps, Pc, Pm, Pa, Pe};
                                                     _ -> {1, 1, 1, 1, 1}
                                                 end,
    #attr_point_plan{index = PlanIndex, plan_name = "",
                     strength = 0, constitution = 0, magic = 0, agility = 0,
                     endurance = 0, pre_str = PreStr, pre_con = PreCon,
                     pre_magic = PreMagic, pre_agi = PreAgi,
                     pre_end = PreEnd}.

login(Role) -> {ok, calc(Role)}.

calc_and_push(Role) ->
    NewRole = calc(Role),
    push_10001(NewRole),
    NewRole.

get_war_fc(Role = #role{attr = #attr{fc = Fc}}) ->
    PetFc = pet:max_fc_pet(Role),
    Fc + PetFc.

push_10000(Role = #role{id = {Rid, Platform, ZoneId},
                        name = Name, time_reg = TimeReg, sex = Sex,
                        classes = Classes, lev = Lev, label = Label, hp = Hp,
                        mp = Mp, attr = Attr, link = #link{conn_pid = ConnPid},
                        m_wedding =
                            #m_wedding{lover_id =
                                           {LoverId,
                                            LoverPlatform,
                                            LoverZoneId},
                                       lover_name = LoverName,
                                       status = WeddingStatus},
                        m_family = #m_family{cur_id = FamilyId},
                        m_lev_break = #m_lev_break{times = BreakTimes}}) ->
    LeftPoint = calc_left_point(Role),
    logger:debug("同步数据:~w", [FamilyId], attr, 102),
    LastClassesModifyTime = var:get_var(Role,
                                        other,
                                        2046,
                                        0),
    ClassModifyTimes = var:get_var(Role, other, 2047, 0),
    sys_conn:pack_send(ConnPid,
                       10000,
                       {Rid,
                        Platform,
                        ZoneId,
                        Name,
                        TimeReg,
                        Sex,
                        Classes,
                        Lev,
                        Label,
                        Hp,
                        Mp,
                        LoverId,
                        LoverPlatform,
                        LoverZoneId,
                        LoverName,
                        WeddingStatus,
                        BreakTimes,
                        LastClassesModifyTime,
                        ClassModifyTimes,
                        Attr,
                        LeftPoint,
                        FamilyId}),
    ok.

push_10007(Role = #role{link = Link,
                        m_attr_point = Mat}) ->
    LeftPointData = calc_all_left_point(Role),
    role:link_send(Link, 10007, {Mat, LeftPointData}),
    ok.

push_10023(Role = #role{link = Link}) ->
    LeftPoint = calc_left_point(Role),
    role:link_send(Link, 10023, {LeftPoint}),
    ok.

push_10001(#role{attr = Attr, hp = Hp, mp = Mp,
                 link = #link{conn_pid = ConnPid}}) ->
    sys_conn:pack_send(ConnPid, 10001, {Hp, Mp, Attr}),
    ok.

push_10025(#role{attr = Attr, hp = Hp, mp = Mp,
                 link = #link{conn_pid = ConnPid}}) ->
    sys_conn:pack_send(ConnPid, 10025, {Hp, Mp, Attr}),
    ok.

push_10011(Role = #role{hp = Hp, mp = Mp,
                        hp_max = HpMax, mp_max = MpMax}) ->
    role:link_send(Role, 10011, {Hp, Mp, HpMax, MpMax}),
    ok.

calc_reg(Role = #role{lev = 0}) ->
    InitCalc = #attr_calc{attr = #attr{},
                          attr_no_ratio = #attr{speed = 0},
                          ratio = #attr{speed = 0},
                          attr_no_fc = #attr{speed = 0},
                          ratio_no_fc = #attr{speed = 0}},
    Role1 = init(Role#role{lev = 1}),
    AttrCalc1 = attr_type:calc(base, InitCalc, Role1),
    NewAttr = #attr{speed = Speed, hp_max = NewHpMax,
                    mp_max = NewMpMax} =
                  merge_attr(Role, AttrCalc1),
    {ok,
     Role1#role{hp = NewHpMax, mp = NewMpMax,
                hp_max = NewHpMax, mp_max = NewMpMax, speed = Speed,
                attr = NewAttr}};
calc_reg(Role = #role{attr = #attr{}}) -> {ok, Role};
calc_reg(Role) ->
    Attr = #attr{},
    {ok, Role#role{attr = Attr}}.

calc(Role = #role{hp = Hp}) when Hp < 0 ->
    calc(Role#role{hp = 1});
calc(Role = #role{mp = Mp}) when Mp < 0 ->
    calc(Role#role{mp = 1});
calc(Role = #role{hp_max = HpMax}) when HpMax =< 0 ->
    calc(Role#role{hp_max = 1});
calc(Role = #role{mp_max = MpMax}) when MpMax =< 0 ->
    calc(Role#role{mp_max = 1});
calc(Role = #role{classes = _Classes, hp = Hp, mp = Mp,
                  hp_max = 1, mp_max = 1}) ->
    InitCalc = #attr_calc{attr = #attr{},
                          attr_no_ratio = #attr{speed = 0},
                          ratio = #attr{speed = 0},
                          attr_no_fc = #attr{speed = 0},
                          ratio_no_fc = #attr{speed = 0}},
    AttrCalc1 = attr_type:calc(base, InitCalc, Role),
    AttrCalc2 = attr_type:calc([eqm,
                                attr_point,
                                skill,
                                wing,
                                honor,
                                skill_life,
                                escort,
                                camp_cake,
                                buff,
                                achievement,
                                fashion,
                                mount,
                                handbook,
                                skill_prac,
                                guard_astroid,
                                guild_element,
                                fc_update,
                                talisman,
                                king_badge],
                               AttrCalc1,
                               Role),
    NewAttrCalc = AttrCalc2,
    NewAttr = merge_attr(Role, NewAttrCalc),
    Role1 = #role{attr =
                      #attr{speed = Speed, hp_max = NewHpMax,
                            mp_max = NewMpMax}} =
                camp_halloween_mgr:calc(Role#role{attr = NewAttr}),
    NewHp = check_hp_mp(Hp, NewHpMax),
    NewMp = check_hp_mp(Mp, NewMpMax),
    NRole1 = team:calc(Role1#role{hp = NewHp, mp = NewMp,
                                  hp_max = NewHpMax, mp_max = NewMpMax,
                                  speed = Speed, attr = NewAttr}),
    NRole2 = parade:calc(NRole1),
    NRole3 = wedding:calc(NRole2),
    NewRole = NRole3,
    NewRole;
calc(Role) -> calc(Role, push).

calc(Role = #role{classes = _Classes, hp = Hp, mp = Mp,
                  hp_max = HpMax, mp_max = MpMax,
                  attr = #attr{fc = OldFc}},
     PushFlag) ->
    HpPer = Hp / HpMax,
    MpPer = Mp / MpMax,
    InitCalc = #attr_calc{attr = #attr{},
                          attr_no_ratio = #attr{speed = 0},
                          ratio = #attr{speed = 0},
                          attr_no_fc = #attr{speed = 0},
                          ratio_no_fc = #attr{speed = 0}},
    AttrCalc1 = attr_type:calc(base, InitCalc, Role),
    AttrCalc2 = attr_type:calc([eqm,
                                attr_point,
                                skill,
                                wing,
                                honor,
                                skill_life,
                                escort,
                                camp_cake,
                                buff,
                                achievement,
                                fashion,
                                mount,
                                handbook,
                                skill_prac,
                                guard_astroid,
                                guild_element,
                                fc_update,
                                talisman,
                                king_badge],
                               AttrCalc1,
                               Role),
    NewAttrCalc = AttrCalc2,
    NewAttr = merge_attr(Role, NewAttrCalc),
    Role1 = #role{attr =
                      #attr{fc = NewFc, speed = Speed, hp_max = NewHpMax,
                            mp_max = NewMpMax}} =
                camp_halloween_mgr:calc(Role#role{attr = NewAttr}),
    NewHp = check_hp_mp(erlang:round(HpPer * NewHpMax),
                        NewHpMax),
    NewMp = check_hp_mp(erlang:round(MpPer * NewMpMax),
                        NewMpMax),
    NRole1 = team:calc(Role1#role{hp = NewHp, mp = NewMp,
                                  hp_max = NewHpMax, mp_max = NewMpMax,
                                  speed = Speed, attr = NewAttr}),
    NRole2 = parade:calc(NRole1),
    NRole3 = wedding:calc(NRole2),
    NRole = NRole3,
    LRole = case NewFc =/= OldFc andalso PushFlag =:= push
                of
                true ->
                    Evts = [#evt_fc{val = NewFc - OldFc, now_val = NewFc}],
                    role_trigger:fire(Evts, NRole);
                _ -> NRole
            end,
    LRole.

-spec check_hp_mp(pos_integer(),
                  pos_integer()) -> pos_integer().

check_hp_mp(Val, _ValMax) when Val =< 0 -> 1;
check_hp_mp(ValMax, ValMax) -> ValMax;
check_hp_mp(Val, ValMax) ->
    case Val > ValMax of
        true -> ValMax;
        false -> Val
    end.

-spec do_math_add(#attr{}, #attr{}) -> #attr{}.

do_math_add(#attr{speed = Speed, hp_max = HpMax,
                  mp_max = MpMax, atk_speed = AtkSpeed, phy_dmg = PhyDmg,
                  magic_dmg = MagicDmg, phy_def = PhyDef,
                  magic_def = MagicDef, crit = Crit, tenacity = Tena,
                  accuracy = Acc, evasion = Eva, holy_dmg = HolyDmg,
                  crit_dmg = CritDmg, crit_dmg_def = CritDmgDef,
                  dmg_ratio = DmgRatio, phy_dmg_ratio = PhyDmgRatio,
                  magic_dmg_ratio = MagicDmgRatio, def_ratio = DefRatio,
                  enhance_control = EnhanceControl,
                  anti_control = AntiControl, escape = Escape,
                  anti_escape = AntiEscape, capture = Capture,
                  phy_def_ratio = PhyDefRatio,
                  magic_def_ratio = MagicDefRatio, phy_accuracy = PhyAcc,
                  magic_accuracy = MagicAcc, phy_evasion = PhyEva,
                  magic_evasion = MagicEva, phy_crit = PhyCrit,
                  magic_crit = MagicCrit, phy_tenacity = PhyTena,
                  magic_tenacity = MagicTena, heal_val = HealVal,
                  heal_ratio = HealRatio, strength = Strength,
                  constitution = Constitution, magic = Magic,
                  agility = Agility, endurance = Endurance,
                  exp_ratio = ExpRatio},
            #attr{speed = Speed1, hp_max = HpMax1, mp_max = MpMax1,
                  atk_speed = AtkSpeed1, phy_dmg = PhyDmg1,
                  magic_dmg = MagicDmg1, phy_def = PhyDef1,
                  magic_def = MagicDef1, crit = Crit1, tenacity = Tena1,
                  accuracy = Acc1, evasion = Eva1, holy_dmg = HolyDmg1,
                  crit_dmg = CritDmg1, crit_dmg_def = CritDmgDef1,
                  dmg_ratio = DmgRatio1, phy_dmg_ratio = PhyDmgRatio1,
                  magic_dmg_ratio = MagicDmgRatio1, def_ratio = DefRatio1,
                  enhance_control = EnhanceControl1,
                  anti_control = AntiControl1, escape = Escape1,
                  anti_escape = AntiEscape1, capture = Capture1,
                  phy_def_ratio = PhyDefRatio1,
                  magic_def_ratio = MagicDefRatio1,
                  phy_accuracy = PhyAcc1, magic_accuracy = MagicAcc1,
                  phy_evasion = PhyEva1, magic_evasion = MagicEva1,
                  phy_crit = PhyCrit1, magic_crit = MagicCrit1,
                  phy_tenacity = PhyTena1, magic_tenacity = MagicTena1,
                  heal_val = HealVal1, heal_ratio = HealRatio1,
                  strength = Strength1, constitution = Constitution1,
                  magic = Magic1, agility = Agility1,
                  endurance = Endurance1, exp_ratio = ExpRatio1}) ->
    #attr{speed = Speed + Speed1, hp_max = HpMax + HpMax1,
          mp_max = MpMax + MpMax1,
          atk_speed = AtkSpeed + AtkSpeed1,
          phy_dmg = PhyDmg + PhyDmg1,
          magic_dmg = MagicDmg + MagicDmg1,
          phy_def = PhyDef + PhyDef1,
          magic_def = MagicDef + MagicDef1, crit = Crit + Crit1,
          tenacity = Tena + Tena1, accuracy = Acc + Acc1,
          evasion = Eva + Eva1, holy_dmg = HolyDmg + HolyDmg1,
          crit_dmg = CritDmg + CritDmg1,
          crit_dmg_def = CritDmgDef + CritDmgDef1,
          dmg_ratio = DmgRatio + DmgRatio1,
          phy_dmg_ratio = PhyDmgRatio + PhyDmgRatio1,
          magic_dmg_ratio = MagicDmgRatio + MagicDmgRatio1,
          def_ratio = DefRatio + DefRatio1,
          enhance_control = EnhanceControl + EnhanceControl1,
          anti_control = AntiControl + AntiControl1,
          escape = Escape + Escape1,
          anti_escape = AntiEscape + AntiEscape1,
          capture = Capture + Capture1,
          phy_def_ratio = PhyDefRatio + PhyDefRatio1,
          magic_def_ratio = MagicDefRatio + MagicDefRatio1,
          phy_accuracy = PhyAcc + PhyAcc1,
          magic_accuracy = MagicAcc + MagicAcc1,
          phy_evasion = PhyEva + PhyEva1,
          magic_evasion = MagicEva + MagicEva1,
          phy_crit = PhyCrit + PhyCrit1,
          magic_crit = MagicCrit + MagicCrit1,
          phy_tenacity = PhyTena + PhyTena1,
          magic_tenacity = MagicTena + MagicTena1,
          heal_val = HealVal + HealVal1,
          heal_ratio = HealRatio + HealRatio1,
          strength = Strength + Strength1,
          constitution = Constitution + Constitution1,
          magic = Magic + Magic1, agility = Agility + Agility1,
          endurance = Endurance + Endurance1,
          exp_ratio = ExpRatio + ExpRatio1}.

-spec do_math_ratio(#attr{}, #attr{}) -> #attr{}.

do_math_ratio(#attr{speed = Speed, hp_max = HpMax,
                    mp_max = MpMax, atk_speed = AtkSpeed, phy_dmg = PhyDmg,
                    magic_dmg = MagicDmg, phy_def = PhyDef,
                    magic_def = MagicDef, crit = Crit, tenacity = Tena,
                    accuracy = Acc, evasion = Eva, holy_dmg = HolyDmg,
                    crit_dmg = CritDmg, crit_dmg_def = CritDmgDef,
                    dmg_ratio = DmgRatio, phy_dmg_ratio = PhyDmgRatio,
                    magic_dmg_ratio = MagicDmgRatio, def_ratio = DefRatio,
                    enhance_control = EnhanceControl,
                    anti_control = AntiControl, escape = Escape,
                    anti_escape = AntiEscape, capture = Capture,
                    phy_def_ratio = PhyDefRatio,
                    magic_def_ratio = MagicDefRatio, phy_accuracy = PhyAcc,
                    magic_accuracy = MagicAcc, phy_evasion = PhyEva,
                    magic_evasion = MagicEva, phy_crit = PhyCrit,
                    magic_crit = MagicCrit, phy_tenacity = PhyTena,
                    magic_tenacity = MagicTena, heal_val = HealVal,
                    heal_ratio = HealRatio, strength = Strength,
                    constitution = Constitution, magic = Magic,
                    agility = Agility, endurance = Endurance,
                    exp_ratio = ExpRatio},
              #attr{speed = RatioSpeed, hp_max = RatioHpMax,
                    mp_max = RatioMpMax, atk_speed = RatioAtkSpeed,
                    phy_dmg = RatioPhyDmg, magic_dmg = RatioMagicDmg,
                    phy_def = RatioPhyDef, magic_def = RatioMagicDef,
                    crit = RatioCrit, tenacity = RatioTena,
                    accuracy = RatioAcc, evasion = RatioEva,
                    holy_dmg = RatioHolyDmg, crit_dmg = RatioCritDmg,
                    crit_dmg_def = RatioCritDmgDef,
                    dmg_ratio = RatioDmgRatio,
                    phy_dmg_ratio = RatioPhyDmgRatio,
                    magic_dmg_ratio = RatioMagicDmgRatio,
                    def_ratio = RatioDefRatio,
                    enhance_control = RatioEnhanceControl,
                    anti_control = RatioAntiControl, escape = RatioEscape,
                    anti_escape = RatioAntiEscape, capture = RatioCapture,
                    phy_def_ratio = RatioPhyDefRatio,
                    magic_def_ratio = RatioMagicDefRatio,
                    phy_accuracy = RatioPhyAcc,
                    magic_accuracy = RatioMagicAcc,
                    phy_evasion = RatioPhyEva,
                    magic_evasion = RatioMagicEva, phy_crit = RatioPhyCrit,
                    magic_crit = RatioMagicCrit,
                    phy_tenacity = RatioPhyTena,
                    magic_tenacity = RatioMagicTena,
                    heal_val = RatioHealVal, heal_ratio = RatioHealRatio,
                    strength = RatioStrength,
                    constitution = RatioConstitution, magic = RatioMagic,
                    agility = RatioAgility, endurance = RatioEndurance,
                    exp_ratio = RatioExpRatio}) ->
    #attr{speed = round(Speed * (RatioSpeed + 1000) / 1000),
          hp_max = round(HpMax * (RatioHpMax + 1000) / 1000),
          mp_max = round(MpMax * (RatioMpMax + 1000) / 1000),
          atk_speed =
              round(AtkSpeed * (RatioAtkSpeed + 1000) / 1000),
          phy_dmg = round(PhyDmg * (RatioPhyDmg + 1000) / 1000),
          magic_dmg =
              round(MagicDmg * (RatioMagicDmg + 1000) / 1000),
          phy_def = round(PhyDef * (RatioPhyDef + 1000) / 1000),
          magic_def =
              round(MagicDef * (RatioMagicDef + 1000) / 1000),
          crit = round(Crit * (RatioCrit + 1000) / 1000),
          tenacity = round(Tena * (RatioTena + 1000) / 1000),
          accuracy = round(Acc * (RatioAcc + 1000) / 1000),
          evasion = round(Eva * (RatioEva + 1000) / 1000),
          holy_dmg =
              round(HolyDmg * (RatioHolyDmg + 1000) / 1000),
          crit_dmg =
              round(CritDmg * (RatioCritDmg + 1000) / 1000),
          crit_dmg_def =
              round(CritDmgDef * (RatioCritDmgDef + 1000) / 1000),
          dmg_ratio =
              round(DmgRatio * (RatioDmgRatio + 1000) / 1000),
          phy_dmg_ratio =
              round(PhyDmgRatio * (RatioPhyDmgRatio + 1000) / 1000),
          magic_dmg_ratio =
              round(MagicDmgRatio * (RatioMagicDmgRatio + 1000) /
                        1000),
          def_ratio =
              round(DefRatio * (RatioDefRatio + 1000) / 1000),
          enhance_control =
              round(EnhanceControl * (RatioEnhanceControl + 1000) /
                        1000),
          anti_control =
              round(AntiControl * (RatioAntiControl + 1000) / 1000),
          escape = round(Escape * (RatioEscape + 1000) / 1000),
          anti_escape =
              round(AntiEscape * (RatioAntiEscape + 1000) / 1000),
          capture = round(Capture * (RatioCapture + 1000) / 1000),
          phy_def_ratio =
              round(PhyDefRatio * (RatioPhyDefRatio + 1000) / 1000),
          magic_def_ratio =
              round(MagicDefRatio * (RatioMagicDefRatio + 1000) /
                        1000),
          phy_accuracy =
              round(PhyAcc * (RatioPhyAcc + 1000) / 1000),
          magic_accuracy =
              round(MagicAcc * (RatioMagicAcc + 1000) / 1000),
          phy_evasion =
              round(PhyEva * (RatioPhyEva + 1000) / 1000),
          magic_evasion =
              round(MagicEva * (RatioMagicEva + 1000) / 1000),
          phy_crit =
              round(PhyCrit * (RatioPhyCrit + 1000) / 1000),
          magic_crit =
              round(MagicCrit * (RatioMagicCrit + 1000) / 1000),
          phy_tenacity =
              round(PhyTena * (RatioPhyTena + 1000) / 1000),
          magic_tenacity =
              round(MagicTena * (RatioMagicTena + 1000) / 1000),
          heal_val =
              round(HealVal * (RatioHealVal + 1000) / 1000),
          heal_ratio =
              round(HealRatio * (RatioHealRatio + 1000) / 1000),
          strength =
              round(Strength * (RatioStrength + 1000) / 1000),
          constitution =
              round(Constitution * (RatioConstitution + 1000) / 1000),
          magic = round(Magic * (RatioMagic + 1000) / 1000),
          agility = round(Agility * (RatioAgility + 1000) / 1000),
          endurance =
              round(Endurance * (RatioEndurance + 1000) / 1000),
          exp_ratio =
              round(ExpRatio * (RatioExpRatio + 1000) / 1000)}.

merge_attr(#attr_calc{attr = Attr,
                      attr_no_ratio = AttrNoRatio, ratio = AttrRatio,
                      attr_no_fc = AttrNoFc, ratio_no_fc = AttrRatioNoFc}) ->
    AllAttr1 = do_math_ratio(Attr,
                             do_math_add(AttrRatio, AttrRatioNoFc)),
    AllAttr2 = do_math_add(AllAttr1, AttrNoRatio),
    AllAttr3 = do_math_add(AllAttr2, AttrNoFc),
    NewAttr = round_attr(AllAttr3),
    NewAttr.

merge_attr(Role, InitCalc) ->
    #attr_calc{attr = Attr, attr_no_ratio = AttrNoRatio,
               ratio = AttrRatio, attr_no_fc = AttrNoFc,
               ratio_no_fc = AttrRatioNoFc} =
        calc_point(Role, InitCalc),
    AllAttr1 = do_math_ratio(Attr,
                             do_math_add(AttrRatio, AttrRatioNoFc)),
    AllAttr2 = do_math_add(AllAttr1, AttrNoRatio),
    AllAttr3 = do_math_add(AllAttr2, AttrNoFc),
    NewAttr = round_attr(AllAttr3),
    Fc = lists:sum([SubScore
                    || {_, SubScore} <- calc_fc(Role)]),
    NewAttr#attr{fc = Fc}.

calc_point(#role{classes = Classes, lev = Lev},
           InitCalc = #attr_calc{attr = Attr,
                                 attr_no_ratio = AttrNoRatio,
                                 attr_no_fc = AttrNoFc}) ->
    #attr{strength = Str1, constitution = Con1,
          magic = Mag1, agility = Agi1, endurance = End1} =
        Attr,
    #attr{strength = Str2, constitution = Con2,
          magic = Mag2, agility = Agi2, endurance = End2} =
        AttrNoRatio,
    #attr{strength = Str3, constitution = Con3,
          magic = Mag3, agility = Agi3, endurance = End3} =
        AttrNoFc,
    Lstr = attr_data:get_point_attr({101, Classes, Lev}),
    Lcon = attr_data:get_point_attr({102, Classes, Lev}),
    Lmag = attr_data:get_point_attr({103, Classes, Lev}),
    Lagi = attr_data:get_point_attr({104, Classes, Lev}),
    Lend = attr_data:get_point_attr({105, Classes, Lev}),
    V1 = attr_type:to_attr(base,
                           calc_point_attr(Lstr,
                                           Lcon,
                                           Lmag,
                                           Lagi,
                                           Lend,
                                           Str1,
                                           Con1,
                                           Mag1,
                                           Agi1,
                                           End1)),
    V2 = attr_type:to_attr(fixed,
                           calc_point_attr(Lstr,
                                           Lcon,
                                           Lmag,
                                           Lagi,
                                           Lend,
                                           Str2,
                                           Con2,
                                           Mag2,
                                           Agi2,
                                           End2)),
    V3 = attr_type:to_attr(no_fc,
                           calc_point_attr(Lstr,
                                           Lcon,
                                           Lmag,
                                           Lagi,
                                           Lend,
                                           Str3,
                                           Con3,
                                           Mag3,
                                           Agi3,
                                           End3)),
    case attr_type:do_attr(V1 ++ V2 ++ V3, InitCalc) of
        {false, Reason} ->
            logger:error("角色点属性换算出错[~w,~w,~w]:[~w]",
                         [V1, V2, V3, Reason],
                         attr,
                         539),
            InitCalc;
        {ok, NewAc} -> NewAc
    end.

calc_point_attr(Lstr, Lcon, Lmag, Lagi, Lend, Str, Con,
                Mag, Agi, End) ->
    L1 = do_calc_point(Lstr, Str),
    L2 = do_calc_point(Lcon, Con),
    L3 = do_calc_point(Lmag, Mag),
    L4 = do_calc_point(Lagi, Agi),
    L5 = do_calc_point(Lend, End),
    L1 ++ L2 ++ L3 ++ L4 ++ L5.

do_calc_point(_L, 0) -> [];
do_calc_point(L, Val) ->
    [{Name, round(V * Val / 100)} || {Name, V} <- L].

calc_item_score(#item{attr = Attr}) ->
    AllAttr = [A
               || A = #attr_base{type = Type} <- Attr,
                  Type =/= 3 andalso Type =/= 6 andalso Type =/= 11],
    do_calc_item_score(AllAttr, 0);
calc_item_score(_) -> 0.

do_calc_item_score([], Score) -> round(Score / 500);
do_calc_item_score([#attr_base{name = Name, val = Val,
                               type = Type}
                    | T],
                   Score) ->
    S = attr_data:get_score(Name),
    S2 = case Name of
             100 ->
                 case Type of
                     4 ->
                         case skill_data:get_effect({Val, 1}) of
                             #{score := EqmScore} -> EqmScore;
                             _ ->
                                 case skill_talent_data:get(Val) of
                                     #{score := EqmScore} -> EqmScore;
                                     _ -> 0
                                 end
                         end;
                     10 ->
                         case skill_data:get_wing({Val, 1}) of
                             #{score := EqmScore} -> EqmScore;
                             _ -> 0
                         end;
                     _ -> 0
                 end;
             151 -> 10000;
             150 -> 10000;
             _ -> 0
         end,
    do_calc_item_score(T, S * Val + Score + S2).

calc_item_score(Item, TypeList)
    when is_list(TypeList) ->
    lists:sum([calc_item_score(Item, Type)
               || Type <- TypeList]);
calc_item_score(#item{attr = Attr}, Type) ->
    AllAttr = [A
               || A = #attr_base{type = Type1} <- Attr,
                  Type1 =:= Type],
    do_calc_item_score(AllAttr, 0).

set_point(Role = #role{m_attr_point =
                           Mat = #m_attr_point{valid_plan = ValidPlan,
                                               plan_data = PlanData}},
          Str, Con, Mag, Agi, End)
    when Str + Con + Mag + Agi + End =:= 5 ->
    case lists:keyfind(ValidPlan,
                       #attr_point_plan.index,
                       PlanData)
        of
        PL = #attr_point_plan{} ->
            NewPL = PL#attr_point_plan{pre_str = Str, pre_con = Con,
                                       pre_magic = Mag, pre_agi = Agi,
                                       pre_end = End},
            NewPlanData = lists:keystore(ValidPlan,
                                         #attr_point_plan.index,
                                         PlanData,
                                         NewPL),
            NewRole = Role#role{m_attr_point =
                                    Mat#m_attr_point{plan_data = NewPlanData}},
            push_10007(NewRole),
            {ok, NewRole};
        false -> {false, lang:get("请先使用该方案")}
    end;
set_point(_, _, _, _, _, _) ->
    {false, lang:get("5项属性分配满5点才可保存设置")}.

auto_point(Role, Lev, NewLev) when NewLev =< Lev ->
    Role;
auto_point(Role = #role{m_attr_point =
                            Mat = #m_attr_point{valid_plan = ValidPlan,
                                                plan_data = PlanData}},
           Lev, NewLev) ->
    case lists:keyfind(ValidPlan,
                       #attr_point_plan.index,
                       PlanData)
        of
        PL = #attr_point_plan{strength = Str,
                              constitution = Con, magic = Mag, agility = Agi,
                              endurance = End, pre_str = PreStr,
                              pre_con = PreCon, pre_magic = PreMagic,
                              pre_agi = PreAgi, pre_end = PreEnd} ->
            {Vstr, Vcon, Vmag, Vagi, Vend} = do_get_auto_point(Lev,
                                                               NewLev,
                                                               {PreStr,
                                                                PreCon,
                                                                PreMagic,
                                                                PreAgi,
                                                                PreEnd}),
            NewPL = PL#attr_point_plan{strength = Str + Vstr,
                                       constitution = Con + Vcon,
                                       magic = Mag + Vmag, agility = Agi + Vagi,
                                       endurance = End + Vend},
            NewPlanData = lists:keystore(ValidPlan,
                                         #attr_point_plan.index,
                                         PlanData,
                                         NewPL),
            NewMat = Mat#m_attr_point{plan_data = NewPlanData},
            NewRole = Role#role{m_attr_point = NewMat},
            LevMsg = util:flist(lang:get("恭喜你升到了~w级了！"), [NewLev]),
            BaseVal = NewLev - Lev,
            Msg = case NewLev >= 30 of
                      true ->
                          notice:format(lang:get("~ts\n你的各项属性分别增加了:\n~ts\n~ts\n~ts\n~ts\n~ts\n系"
                                                 "统默认各属性+1，你还有~ts点未分配点数"),
                                        [{string_2, 5, LevMsg},
                                         {string_2,
                                          1,
                                          notice:to_attr_msg(101,
                                                             Vstr + BaseVal)},
                                         {string_2,
                                          1,
                                          notice:to_attr_msg(102,
                                                             Vcon + BaseVal)},
                                         {string_2,
                                          1,
                                          notice:to_attr_msg(103,
                                                             Vmag + BaseVal)},
                                         {string_2,
                                          1,
                                          notice:to_attr_msg(104,
                                                             Vagi + BaseVal)},
                                         {string_2,
                                          1,
                                          notice:to_attr_msg(105,
                                                             Vend + BaseVal)},
                                         {string_1, BaseVal * 5}]);
                      false ->
                          notice:format(lang:get("~ts\n你的各项属性分别增加了:\n~ts\n~ts\n~ts\n~ts\n~ts\n系"
                                                 "统默认各属性+1，其余为自动设置加点"),
                                        [{string_2, 5, LevMsg},
                                         {string_2,
                                          1,
                                          notice:to_attr_msg(101,
                                                             Vstr + BaseVal)},
                                         {string_2,
                                          1,
                                          notice:to_attr_msg(102,
                                                             Vcon + BaseVal)},
                                         {string_2,
                                          1,
                                          notice:to_attr_msg(103,
                                                             Vmag + BaseVal)},
                                         {string_2,
                                          1,
                                          notice:to_attr_msg(104,
                                                             Vagi + BaseVal)},
                                         {string_2,
                                          1,
                                          notice:to_attr_msg(105,
                                                             Vend + BaseVal)}])
                  end,
            notice:send(NewRole, 7, Msg),
            push_10023(NewRole),
            push_10007(NewRole),
            NewRole;
        false ->
            logger:error("玩家加点方案错误", [], attr, 654),
            Role
    end.

do_get_auto_point(Lev, NewLev,
                  {PreStr, PreCon, PreMagic, PreAgi, PreEnd}) ->
    do_get_auto_point(Lev,
                      NewLev,
                      0,
                      0,
                      0,
                      0,
                      0,
                      {PreStr, PreCon, PreMagic, PreAgi, PreEnd}).

do_get_auto_point(Lev, NewLev, Str, Con, Mag, Agi, End,
                  _)
    when Lev >= NewLev ->
    {Str, Con, Mag, Agi, End};
do_get_auto_point(Lev, NewLev, Str, Con, Mag, Agi, End,
                  {PreStr, PreCon, PreMagic, PreAgi, PreEnd})
    when Lev >= 30 ->
    do_get_auto_point(NewLev,
                      NewLev,
                      Str,
                      Con,
                      Mag,
                      Agi,
                      End,
                      {PreStr, PreCon, PreMagic, PreAgi, PreEnd});
do_get_auto_point(Lev, NewLev, Str, Con, Mag, Agi, End,
                  {PreStr, PreCon, PreMagic, PreAgi, PreEnd}) ->
    case PreStr + PreCon + PreMagic + PreAgi + PreEnd =:= 5
        of
        true ->
            do_get_auto_point(Lev + 1,
                              NewLev,
                              Str + PreStr,
                              Con + PreCon,
                              Mag + PreMagic,
                              Agi + PreAgi,
                              End + PreEnd,
                              {PreStr, PreCon, PreMagic, PreAgi, PreEnd});
        _ ->
            logger:debug("方案设置取消或者不等于5[~w:~w:~w:~w:~w]",
                         [PreStr, PreCon, PreMagic, PreAgi, PreEnd],
                         attr,
                         675),
            do_get_auto_point(Lev + 1,
                              NewLev,
                              Str,
                              Con,
                              Mag,
                              Agi,
                              End,
                              {PreStr, PreCon, PreMagic, PreAgi, PreEnd})
    end.

add_point(0, 0, 0, 0, 0, _Role) -> ok;
add_point(Str1, Con1, Mag1, Agi1, End1,
          Role = #role{classes = Classes,
                       m_attr_point =
                           Mat = #m_attr_point{valid_plan = ValidPlan,
                                               plan_data = PlanData}}) ->
    LeftPoint = calc_left_point(Role),
    case LeftPoint < Str1 + Con1 + Mag1 + Agi1 + End1 of
        true -> {false, lang:get("剩余点数不足")};
        false ->
            NewPL = #attr_point_plan{plan_name = PlanName} = case
                                                                 lists:keyfind(ValidPlan,
                                                                               #attr_point_plan.index,
                                                                               PlanData)
                                                                 of
                                                                 PL =
                                                                     #attr_point_plan{strength
                                                                                          =
                                                                                          Str,
                                                                                      constitution
                                                                                          =
                                                                                          Con,
                                                                                      magic
                                                                                          =
                                                                                          Mag,
                                                                                      agility
                                                                                          =
                                                                                          Agi,
                                                                                      endurance
                                                                                          =
                                                                                          End} ->
                                                                     PL#attr_point_plan{strength
                                                                                            =
                                                                                            Str
                                                                                                +
                                                                                                Str1,
                                                                                        constitution
                                                                                            =
                                                                                            Con
                                                                                                +
                                                                                                Con1,
                                                                                        magic
                                                                                            =
                                                                                            Mag
                                                                                                +
                                                                                                Mag1,
                                                                                        agility
                                                                                            =
                                                                                            Agi
                                                                                                +
                                                                                                Agi1,
                                                                                        endurance
                                                                                            =
                                                                                            End
                                                                                                +
                                                                                                End1};
                                                                 false ->
                                                                     init_point_plan(Classes,
                                                                                     ValidPlan)
                                                             end,
            NewPlanData = lists:keystore(ValidPlan,
                                         #attr_point_plan.index,
                                         PlanData,
                                         NewPL),
            NewRole = Role#role{m_attr_point =
                                    Mat#m_attr_point{plan_data = NewPlanData}},
            PointMsg = point_msg([{101, Str1},
                                  {102, Con1},
                                  {103, Mag1},
                                  {104, Agi1},
                                  {105, End1}],
                                 ""),
            RealPlanName = point_plan_name(ValidPlan, PlanName),
            Msg = util:flist(lang:get("角色加点成功，~ts分配~ts"),
                             [RealPlanName, PointMsg]),
            notice:send(NewRole, 3, Msg),
            push_10007(NewRole),
            push_10023(NewRole),
            {ok, NewRole}
    end;
add_point(_, _, _, _, _, _Role) -> ok.

point_plan_name(Index, []) ->
    case Index of
        1 -> lang:get("方案一");
        2 -> lang:get("方案二");
        3 -> lang:get("方案三");
        _ -> lang:get("未知方案")
    end;
point_plan_name(_Index, Name) -> Name.

point_msg([], Msg) -> Msg;
point_msg([{_, 0} | T], Msg) -> point_msg(T, Msg);
point_msg([{AttrName, Val} | T], Msg) ->
    ValMsg = format:to_point_msg(AttrName, Val),
    NewMsg = case Msg of
                 "" -> util:flist("~ts", [ValMsg]);
                 _ -> util:flist("~ts，~ts", [Msg, ValMsg])
             end,
    point_msg(T, NewMsg).

reset_point(Role = #role{lev = Lev,
                         m_attr_point =
                             #m_attr_point{first_free = FirstFree,
                                           valid_plan = ValidPlan,
                                           plan_data = PlanData}}) ->
    Result = case Lev < 40 andalso FirstFree =:= 0 of
                 true -> {free, Role};
                 false ->
                     case lists:keyfind(ValidPlan,
                                        #attr_point_plan.index,
                                        PlanData)
                         of
                         #attr_point_plan{strength = Strength,
                                          constitution = Constitution,
                                          magic = Magic, agility = Agility,
                                          endurance = Endurance} ->
                             Gold = util:floor((max(0, Strength) +
                                                    max(0, Constitution)
                                                    + max(0, Magic)
                                                    + max(0, Agility)
                                                    + max(0, Endurance))
                                                   * 2.5),
                             logger:debug("洗点价格计算:~w", [Gold], attr, 739),
                             Loss = [#loss{label = gold, val = Gold,
                                           msg = lang:get("钻石不足, 无法洗点")}],
                             case role_gain:do_notice(Loss, Role) of
                                 {false, #loss{msg = Msg}} -> {false, Msg};
                                 {ok, Role1} -> {pay, Role1}
                             end;
                         false -> {false, lang:get("没有分配过点数, 无需洗点")}
                     end
             end,
    case Result of
        {false, Reason} -> {false, Reason};
        {Flag, NewRole} -> do_reset_point(NewRole, Flag)
    end.

do_reset_point(Role = #role{lev = Lev,
                            m_attr_point =
                                Mat = #m_attr_point{ext_point = ExtPoint,
                                                    valid_plan = ValidPlan,
                                                    plan_data = PlanData}},
               Flag) ->
    logger:debug("重置加点方案:~w", [ValidPlan], attr, 755),
    LeftPoint = calc_left_point(Role),
    AllExtPoint = all_ext_point(ExtPoint),
    case LeftPoint =:= Lev * 5 + AllExtPoint of
        true -> {false, lang:get("没有分配过点数, 无需洗点")};
        false ->
            case lists:keyfind(ValidPlan,
                               #attr_point_plan.index,
                               PlanData)
                of
                PL = #attr_point_plan{} ->
                    NewPl = PL#attr_point_plan{strength = 0,
                                               constitution = 0, magic = 0,
                                               agility = 0, endurance = 0},
                    NewPlanData = lists:keystore(ValidPlan,
                                                 #attr_point_plan.index,
                                                 PlanData,
                                                 NewPl),
                    NewMat = Mat#m_attr_point{first_free = 1,
                                              plan_data = NewPlanData},
                    NewRole1 = Role#role{m_attr_point = NewMat},
                    NewRole2 = calc_and_push(NewRole1),
                    push_10007(NewRole2),
                    push_10023(NewRole2),
                    {ok, NewRole2, Flag};
                false ->
                    logger:error("角色无加点方案", [], attr, 772),
                    {false, lang:get("请选择您的加点方案")}
            end
    end.

all_ext_point(ExtPoint) -> all_ext_point(ExtPoint, 0).

all_ext_point([], Point) -> Point;
all_ext_point([{_, P} | T], Point) ->
    all_ext_point(T, P + Point).

change_point_plan(#role{m_attr_point =
                            #m_attr_point{valid_plan = ValidPlan}},
                  ValidPlan) ->
    ok;
change_point_plan(Role = #role{lev = Lev,
                               m_attr_point =
                                   #m_attr_point{change_plan_times = CTimes}},
                  Plan) ->
    case check_can_change_plan(Lev, Plan, Role) of
        {false, Reason} -> {false, Reason};
        true ->
            CostCoin = attr_data:change_point_price(CTimes + 1),
            case CostCoin =:= 0 of
                false ->
                    Loss = [#loss{label = coin, val = CostCoin}],
                    case role_gain:do_notice(Loss, Role) of
                        {ok, LossRole} -> do_set_valid_plan(LossRole, Plan);
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        _ -> {false, lang:get("银币不足，不能进行切换")}
                    end;
                true -> do_set_valid_plan(Role, Plan)
            end
    end.

pre_change_point_plan(#role{m_attr_point =
                                #m_attr_point{valid_plan = ValidPlan}},
                      ValidPlan) ->
    ok;
pre_change_point_plan(Role = #role{lev = Lev}, Plan) ->
    case check_can_change_plan(Lev, Plan, Role) of
        {false, Reason} -> {false, Reason};
        true ->
            case do_set_valid_plan(Role, Plan) of
                {ok, PlanRole} ->
                    logger:debug("============~w", [Plan], attr, 818),
                    NewRole = calc(PlanRole, not_push),
                    push_10025(NewRole),
                    NewRole;
                _ -> ok
            end
    end.

point_classes_modify(Role = #role{lev = Lev,
                                  m_attr_point =
                                      #m_attr_point{valid_plan = VP}},
                     _TargetClasses) ->
    Fun = fun (Plan, Rtn) ->
                  case check_can_change_plan(Lev, Plan, Role) of
                      true -> [Plan | Rtn];
                      _ -> Rtn
                  end
          end,
    AllPlan = lists:foldl(Fun, [], [1, 2, 3]),
    logger:debug("专职重置加点方案:~w", [AllPlan], attr, 837),
    ResetPointRole = #role{m_attr_point = MAttrPoint} =
                         reset_all_plan_point(Role, AllPlan),
    NewRole = ResetPointRole#role{m_attr_point =
                                      MAttrPoint#m_attr_point{valid_plan = VP}},
    push_10007(ResetPointRole),
    push_10023(ResetPointRole),
    NewRole.

reset_all_plan_point(Role, []) -> Role;
reset_all_plan_point(Role = #role{m_attr_point =
                                      MAttrPoint},
                     [Plan | Rest]) ->
    case do_classes_reset_point(Role#role{m_attr_point =
                                              MAttrPoint#m_attr_point{valid_plan
                                                                          =
                                                                          Plan}},
                                class_modify)
        of
        {ok, NewRole, _} -> reset_all_plan_point(NewRole, Rest);
        _ -> reset_all_plan_point(Role, Rest)
    end.

do_classes_reset_point(Role = #role{lev = Lev,
                                    m_attr_point =
                                        Mat = #m_attr_point{ext_point =
                                                                ExtPoint,
                                                            valid_plan =
                                                                ValidPlan,
                                                            plan_data =
                                                                PlanData}},
                       Flag) ->
    LeftPoint = calc_left_point(Role),
    AllExtPoint = all_ext_point(ExtPoint),
    case LeftPoint =:= Lev * 5 + AllExtPoint of
        true -> {false, lang:get("没有分配过点数, 无需洗点")};
        false ->
            case lists:keyfind(ValidPlan,
                               #attr_point_plan.index,
                               PlanData)
                of
                PL = #attr_point_plan{} ->
                    NewPl = PL#attr_point_plan{strength = 0,
                                               constitution = 0, magic = 0,
                                               agility = 0, endurance = 0},
                    NewPlanData = lists:keystore(ValidPlan,
                                                 #attr_point_plan.index,
                                                 PlanData,
                                                 NewPl),
                    NewMat = Mat#m_attr_point{first_free = 1,
                                              plan_data = NewPlanData},
                    NewRole = Role#role{m_attr_point = NewMat},
                    {ok, NewRole, Flag};
                false ->
                    logger:error("角色无加点方案", [], attr, 867),
                    {false, lang:get("请选择您的加点方案")}
            end
    end.

do_set_valid_plan(Role = #role{classes = Classes,
                               m_attr_point =
                                   Mat = #m_attr_point{plan_data = PlanData,
                                                       change_plan_times =
                                                           CTimes}},
                  Plan) ->
    case lists:keyfind(Plan,
                       #attr_point_plan.index,
                       PlanData)
        of
        #attr_point_plan{} ->
            NewRole = Role#role{m_attr_point =
                                    Mat#m_attr_point{valid_plan = Plan,
                                                     change_plan_times =
                                                         CTimes + 1}},
            {ok, NewRole};
        false ->
            InitPlan = init_point_plan(Classes, Plan),
            NewPlanData = [InitPlan | PlanData],
            logger:debug("==========~w", [Plan], attr, 881),
            NewMat = Mat#m_attr_point{valid_plan = Plan,
                                      plan_data = NewPlanData,
                                      change_plan_times = CTimes + 1},
            NewRole = Role#role{m_attr_point = NewMat},
            {ok, NewRole}
    end.

calc_fc(Role = #role{lev = Lev,
                     p_eqm = #package{items = Items},
                     m_attr_point =
                         #m_attr_point{valid_plan = ValidPlan,
                                       plan_data = PlanData}}) ->
    TotalPoint = case lists:keyfind(ValidPlan,
                                    #attr_point_plan.index,
                                    PlanData)
                     of
                     #attr_point_plan{strength = Str, constitution = Con,
                                      magic = Mag, agility = Agi,
                                      endurance = End} ->
                         Str + Con + Mag + Agi + End + Lev * 5;
                     false -> Lev * 5
                 end,
    EqmScore = lists:sum([calc_item_score(Item)
                          || Item <- Items]),
    PointScore = round(TotalPoint * 1.6),
    SkillScore = round(skill:get_total_skill_lev(Role) *
                           6.99999999999999955591e-1),
    SkillHpScore = round(skill_life:get_enhance_hp_lev(Role)
                             * 3),
    SkillPracScore = round(skill_prac:calc_all_lev(Role) *
                               10),
    StoneScore = round(eqm:calc_all_stone_lev(Role) * 6),
    WingScore = wing:calc_wing_score(Role),
    MountScore = mount_attr:calc_mount_score(Role),
    HandBookScore = handbook:get_fc(Role),
    GuardScore = guard_astroid:calc_fc(Role),
    FashionScore = fashion_attr:calc_fc(Role),
    FashionLevScore = fashion_attr:calc_collect_fc(Role),
    TalismanScore = talisman:calc_fc(Role),
    [{1, round(EqmScore * 2)},
     {2, round(PointScore * 2)},
     {3, round(SkillScore * 2)},
     {4, round(SkillHpScore * 2)},
     {5, round(SkillPracScore * 2)},
     {6, round(StoneScore * 2)},
     {7, WingScore},
     {8, MountScore},
     {9, HandBookScore},
     {10, GuardScore},
     {11, FashionScore},
     {12, FashionLevScore},
     {13, TalismanScore}].

round_attr(#attr{speed = Speed, hp_max = HpMax,
                 mp_max = MpMax, atk_speed = AtkSpeed, phy_dmg = PhyDmg,
                 magic_dmg = MagicDmg, phy_def = PhyDef,
                 magic_def = MagicDef, crit = Crit, tenacity = Tena,
                 accuracy = Acc, evasion = Eva, holy_dmg = HolyDmg,
                 crit_dmg = CritDmg, crit_dmg_def = CritDmgDef,
                 dmg_ratio = DmgRatio, phy_dmg_ratio = PhyDmgRatio,
                 magic_dmg_ratio = MagicDmgRatio, def_ratio = DefRatio,
                 enhance_control = EnhanceControl,
                 anti_control = AntiControl, escape = Escape,
                 anti_escape = AntiEscape, capture = Capture,
                 phy_def_ratio = PhyDefRatio,
                 magic_def_ratio = MagicDefRatio, phy_accuracy = PhyAcc,
                 magic_accuracy = MagicAcc, phy_crit = PhyCrit,
                 magic_crit = MagicCrit, phy_evasion = PhyEva,
                 magic_evasion = MagicEva, phy_tenacity = PhyTena,
                 magic_tenacity = MagicTena, heal_val = HealVal,
                 heal_ratio = HealRatio, strength = Str,
                 constitution = Con, magic = Mag, agility = Agi,
                 endurance = End, exp_ratio = ExpRatio}) ->
    #attr{speed = round(Speed), hp_max = round(HpMax),
          mp_max = round(MpMax), atk_speed = round(AtkSpeed),
          phy_dmg = round(PhyDmg), magic_dmg = round(MagicDmg),
          phy_def = round(PhyDef), magic_def = round(MagicDef),
          crit = round(Crit), tenacity = round(Tena),
          accuracy = round(Acc), evasion = round(Eva),
          holy_dmg = round(HolyDmg), crit_dmg = round(CritDmg),
          crit_dmg_def = round(CritDmgDef),
          dmg_ratio = round(DmgRatio),
          phy_dmg_ratio = round(PhyDmgRatio),
          magic_dmg_ratio = round(MagicDmgRatio),
          def_ratio = round(DefRatio),
          enhance_control = round(EnhanceControl),
          anti_control = round(AntiControl),
          escape = round(Escape), anti_escape = round(AntiEscape),
          capture = round(Capture),
          phy_def_ratio = round(PhyDefRatio),
          magic_def_ratio = round(MagicDefRatio),
          phy_accuracy = round(PhyAcc),
          magic_accuracy = round(MagicAcc),
          phy_crit = round(PhyCrit),
          magic_crit = round(MagicCrit),
          phy_evasion = round(PhyEva),
          magic_evasion = round(MagicEva),
          phy_tenacity = round(PhyTena),
          magic_tenacity = round(MagicTena),
          heal_val = round(HealVal),
          heal_ratio = round(HealRatio), strength = round(Str),
          constitution = round(Con), magic = round(Mag),
          agility = round(Agi), endurance = round(End),
          exp_ratio = round(ExpRatio)}.

to_list(#attr{speed = Speed, hp_max = HpMax,
              mp_max = MpMax, atk_speed = AtkSpeed, phy_dmg = PhyDmg,
              magic_dmg = MagicDmg, phy_def = PhyDef,
              magic_def = MagicDef, crit = Crit, tenacity = Tena,
              accuracy = Acc, evasion = Eva, holy_dmg = HolyDmg,
              crit_dmg = CritDmg, crit_dmg_def = CritDmgDef,
              dmg_ratio = DmgRatio, phy_dmg_ratio = PhyDmgRatio,
              magic_dmg_ratio = MagicDmgRatio, def_ratio = DefRatio,
              enhance_control = EnhanceControl,
              anti_control = AntiControl, phy_accuracy = PhyAcc,
              magic_accuracy = MagicAcc, phy_crit = PhyCrit,
              magic_crit = MagicCrit, phy_evasion = PhyEva,
              magic_evasion = MagicEva, phy_tenacity = PhyTena,
              magic_tenacity = MagicTena, heal_val = HealVal,
              heal_ratio = HealRatio, strength = Str,
              constitution = Con, magic = Mag, agility = Agi,
              endurance = End}) ->
    [{1, HpMax},
     {2, MpMax},
     {3, AtkSpeed},
     {4, PhyDmg},
     {5, MagicDmg},
     {6, PhyDef},
     {7, MagicDef},
     {8, Crit},
     {9, Tena},
     {10, Acc},
     {11, Eva},
     {12, Speed},
     {21, HolyDmg},
     {22, CritDmg},
     {47, CritDmgDef},
     {23, DmgRatio},
     {45, PhyDmgRatio},
     {46, MagicDmgRatio},
     {24, DefRatio},
     {25, EnhanceControl},
     {26, AntiControl},
     {39, PhyAcc},
     {40, MagicAcc},
     {35, PhyCrit},
     {36, MagicCrit},
     {41, PhyEva},
     {42, MagicEva},
     {37, PhyTena},
     {38, MagicTena},
     {43, HealVal},
     {33, HealRatio},
     {101, Str},
     {102, Con},
     {103, Mag},
     {104, Agi},
     {105, End}].

calc_left_point(#role{lev = Lev,
                      m_attr_point =
                          #m_attr_point{valid_plan = ValidPlan,
                                        plan_data = PlanData,
                                        ext_point = ExtPoint}}) ->
    UsePoint = case lists:keyfind(ValidPlan,
                                  #attr_point_plan.index,
                                  PlanData)
                   of
                   #attr_point_plan{strength = Str, constitution = Con,
                                    magic = Mag, agility = Agi,
                                    endurance = End} ->
                       Str + Con + Mag + Agi + End;
                   false -> 0
               end,
    AllExtPoint = all_ext_point(ExtPoint),
    Lev * 5 + AllExtPoint - UsePoint.

calc_left_point(Lev, ExtPoint,
                #attr_point_plan{strength = Str, constitution = Con,
                                 magic = Mag, agility = Agi,
                                 endurance = End}) ->
    AllExtPoint = all_ext_point(ExtPoint),
    UsePoint = Str + Con + Mag + Agi + End,
    Lev * 5 + AllExtPoint - UsePoint.

five_flush(Role = #role{m_attr_point = Mat}, _) ->
    NewRole = Role#role{m_attr_point =
                            Mat#m_attr_point{change_plan_times = 0}},
    push_10007(NewRole),
    {ok, NewRole}.

check_can_change_plan(Lev, Plan, Role) ->
    case Plan of
        1 -> true;
        2 ->
            case Lev >= 50 of
                true -> true;
                false -> {false, lang:get("需要达到50级才能使用该方案")}
            end;
        3 ->
            case Lev < 50 of
                true -> {false, lang:get("需要达到90级才能使用该方案")};
                false ->
                    case Lev < 90 of
                        true ->
                            case var:get_var(Role, other, 2119, 0) of
                                0 ->
                                    Data =
                                        notice:format(lang:get("~ts将自动开启加点方案三，是否消耗~ts,提前开启"),
                                                      [{string_2, 5, "90级"},
                                                       {assets_1,
                                                        90003,
                                                        50000}]),
                                    role:pack_send(Role, 10037, {Data}),
                                    {false, lang:get("")};
                                1 -> true
                            end;
                        _ -> true
                    end
            end;
        _ -> {false, lang:get("该方案系统未开放，敬请期待")}
    end.

calc_all_left_point(Role = #role{lev = Lev,
                                 m_attr_point =
                                     #m_attr_point{ext_point = ExtPoint,
                                                   plan_data = PlanData}}) ->
    PlanCount = case Lev of
                    _L when _L < 50 -> 1;
                    _L when _L < 90 ->
                        case var:get_var(Role, other, 2119, 0) of
                            0 -> 2;
                            _ -> 3
                        end;
                    _L -> 3
                end,
    calc_all_left_point(Lev, ExtPoint, PlanData, PlanCount).

calc_all_left_point(Lev, ExtPoint, PlanData,
                    PlanCount) ->
    calc_all_left_point(Lev,
                        ExtPoint,
                        PlanData,
                        PlanCount,
                        1,
                        []).

calc_all_left_point(_Lev, _ExtPoint, _PlanData,
                    PlanCount, PlanIndex, PointData)
    when PlanIndex > PlanCount ->
    PointData;
calc_all_left_point(Lev, ExtPoint, PlanData, PlanCount,
                    PlanIndex, PointData) ->
    case lists:keyfind(PlanIndex,
                       #attr_point_plan.index,
                       PlanData)
        of
        AL = #attr_point_plan{} ->
            Point = calc_left_point(Lev, ExtPoint, AL),
            calc_all_left_point(Lev,
                                ExtPoint,
                                PlanData,
                                PlanCount,
                                PlanIndex + 1,
                                [{PlanIndex, Point} | PointData]);
        false ->
            AllExtPoint = all_ext_point(ExtPoint),
            calc_all_left_point(Lev,
                                ExtPoint,
                                PlanData,
                                PlanCount,
                                PlanIndex + 1,
                                [{PlanIndex, Lev * 5 + AllExtPoint}
                                 | PointData])
    end.

rpc_open_method(Role, Answer) ->
    case Answer of
        1 ->
            case var:get_var(Role, other, 2119, 0) of
                1 -> {false, lang:get("已经开启过了，不用重复开启")};
                _ ->
                    Loss = format:val_to_loss([{90003, 50000}]),
                    role:send_buff_begin(),
                    case role_gain:do_notice(Loss, Role) of
                        {false, #loss{msg = Msg}} ->
                            role:send_buff_clean(),
                            {false, Msg};
                        {ok, Role2} ->
                            Role3 = var:set_var(Role2, other, 2119, 1),
                            push_10007(Role3),
                            role:send_buff_flush(),
                            {ok, lang:get("开启方案三成功"), Role3}
                    end
            end;
        _ -> ok
    end.

repaire_fashion(Role = #role{id = Rid, name = Name,
                             m_attr_point =
                                 MAttrPoint = #m_attr_point{ext_point =
                                                                ExtPoint,
                                                            plan_data =
                                                                PlanData}},
                {deduction, Num}) ->
    LeftPointData = calc_all_left_point(Role),
    Fun = fun ({PlanId, LeftPoint}, {OPlanData, MsgList}) ->
                  case LeftPoint =:= 0 of
                      true ->
                          case lists:keyfind(PlanId,
                                             #attr_point_plan.index,
                                             PlanData)
                              of
                              APP = #attr_point_plan{strength = Str,
                                                     constitution = Con,
                                                     magic = Mag, agility = Agi,
                                                     endurance = End} ->
                                  {KL, VL} = lists:last(lists:keysort(2,
                                                                      [{strength,
                                                                        Str},
                                                                       {constitution,
                                                                        Con},
                                                                       {magic,
                                                                        Mag},
                                                                       {agility,
                                                                        Agi},
                                                                       {endurance,
                                                                        End}])),
                                  NewApp = case KL of
                                               strength ->
                                                   APP#attr_point_plan{strength
                                                                           =
                                                                           VL -
                                                                               Num};
                                               constitution ->
                                                   APP#attr_point_plan{constitution
                                                                           =
                                                                           VL -
                                                                               Num};
                                               magic ->
                                                   APP#attr_point_plan{magic =
                                                                           VL -
                                                                               Num};
                                               agility ->
                                                   APP#attr_point_plan{agility =
                                                                           VL -
                                                                               Num};
                                               endurance ->
                                                   APP#attr_point_plan{endurance
                                                                           =
                                                                           VL -
                                                                               Num}
                                           end,
                                  Msg =
                                      util:flist(lang:get("角色id:~w,角色名:~ts,加点方案~w扣除~w点数:~w"),
                                                 [Rid, Name, PlanId, KL, Num]),
                                  logger:info(Msg, [], attr, 1226),
                                  {lists:keyreplace(PlanId,
                                                    #attr_point_plan.index,
                                                    OPlanData,
                                                    NewApp),
                                   [Msg | MsgList]};
                              _ -> {OPlanData, MsgList}
                          end;
                      _ ->
                          Msg =
                              util:flist(lang:get("角色id:~w,角色名:~ts,加点方案~w扣除尚未加点数:~w"),
                                         [Rid, Name, PlanId, Num]),
                          logger:info(Msg, [], attr, 1233),
                          {OPlanData, [Msg | MsgList]}
                  end;
              (_, Temp) -> Temp
          end,
    {NPlanData, NMsgList} = lists:foldl(Fun,
                                        {PlanData, []},
                                        LeftPointData),
    ItemPoint = case lists:keyfind(2, 1, ExtPoint) of
                    {_, TItemPoint} -> TItemPoint;
                    _ -> 0
                end,
    NewExtPoint = lists:keystore(2,
                                 1,
                                 ExtPoint,
                                 {2, ItemPoint - Num}),
    NewMattrPoint = MAttrPoint#m_attr_point{ext_point =
                                                NewExtPoint,
                                            plan_data = NPlanData},
    NewRole = Role#role{m_attr_point = NewMattrPoint},
    push_10007(NewRole),
    {ok, NMsgList, NewRole};
repaire_fashion(_Role, _Msg) ->
    logger:error("无法识别的参数:~w", [_Msg], attr, 1250),
    {ok,
     util:flist(lang:get("未执行fashion:repaire_fashion,~w"),
                [_Msg]),
     _Role}.

