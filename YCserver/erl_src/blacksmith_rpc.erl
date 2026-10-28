-file("src/mod/blacksmith/blacksmith_rpc.erl", 1).

-module(blacksmith_rpc).

-export([handle/3]).

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

-file("src/mod/blacksmith/blacksmith_rpc.erl", 14).

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

-file("src/mod/blacksmith/blacksmith_rpc.erl", 15).

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

-file("src/mod/blacksmith/blacksmith_rpc.erl", 16).

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

-file("src/mod/blacksmith/blacksmith_rpc.erl", 17).

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

-file("src/mod/blacksmith/blacksmith_rpc.erl", 18).

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

-file("src/mod/blacksmith/blacksmith_rpc.erl", 19).

-file("inc/blacksmith.hrl", 1).

-record(enchant_fail_reward,
        {val = 0,
         item_list = [],
         title = "",
         msg = "",
         is_break = 0}).

-file("src/mod/blacksmith/blacksmith_rpc.erl", 20).

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

-file("src/mod/blacksmith/blacksmith_rpc.erl", 21).

handle(10600, {Id, IsPerfect, UseHeroPaper},
       Role = #role{p_eqm = Peqm, lev = Lev})
    when Lev >= 20 andalso
             (IsPerfect =:= 0 orelse IsPerfect =:= 1) andalso
                 (UseHeroPaper =:= 0 orelse UseHeroPaper =:= 1) ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法锻造"), Id}};
        {ok, #item{enchant = Enchant}}
            when Enchant < 7 andalso IsPerfect =:= 1 ->
            {reply, {0, lang:get("装备强化等级加7之后才需要完美锻造"), Id}};
        {ok, Eqm = #item{type = Type}} ->
            case lists:member(Type,
                              [1, 4, 2, 3, 5, 21, 22, 6, 7, 9, 10, 11, 12, 14])
                of
                false -> {reply, {0, lang:get("该装备不能锻造"), Id}};
                true ->
                    case blacksmith:check_in_switch(Eqm) of
                        false ->
                            role:send_buff_begin(),
                            case blacksmith:forge(Eqm,
                                                  IsPerfect,
                                                  UseHeroPaper,
                                                  Role)
                                of
                                {false, Reason} ->
                                    role:send_buff_clean(),
                                    {reply, {0, Reason, Id}};
                                {ok, NewRole} ->
                                    Role1 = eqm:calc_all_enchant(NewRole, 0),
                                    Role2 = attr:calc_and_push(Role1),
                                    Role3 = role_trigger:fire(#evt_eqm{type =
                                                                           Type},
                                                              Role2),
                                    LookRole = looks:calc(Role3),
                                    looks:update_looks(Role, LookRole),
                                    EndRole = LookRole,
                                    role:send_buff_flush(),
                                    {reply, {1, lang:get("锻造成功"), Id}, EndRole}
                            end;
                        true -> {reply, {0, lang:get("请先切回高级装备再来锻造"), Id}}
                    end
            end
    end;
handle(10600, {Id, _}, _Role) ->
    {reply,
     {0, util:flist(lang:get("等级不足~w级，无法锻造"), [20]), Id}};
handle(10602, {Id, LuckBaseId, ProtectBaseId},
       Role = #role{p_eqm = Peqm, lev = Lev})
    when Lev >= 45 ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法强化")}};
        {ok, Eqm = #item{type = Type}} ->
            case lists:member(Type,
                              [1, 4, 2, 3, 5, 21, 22, 6, 7, 9, 10, 11, 12, 14])
                of
                false -> {reply, {0, lang:get("该装备不能强化")}};
                true ->
                    role:send_buff_begin(),
                    case blacksmith:enchant(Eqm,
                                            LuckBaseId,
                                            ProtectBaseId,
                                            Role)
                        of
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {2, Reason}};
                        {suc, Msg, NewRole} ->
                            Role1 = eqm:calc_all_enchant(NewRole, 0),
                            Role2 = attr:calc_and_push(Role1),
                            Role3 = role_trigger:fire(#evt_eqm{type = Type},
                                                      Role2),
                            LookRole = looks:calc(Role3),
                            looks:update_looks(Role, LookRole),
                            EndRole = LookRole,
                            role:send_buff_flush(),
                            {reply, {1, Msg}, EndRole};
                        {fail, Msg, NewRole} ->
                            Role1 = eqm:calc_all_enchant(NewRole, 0),
                            Role2 = attr:calc_and_push(Role1),
                            Role3 = role_trigger:fire(#evt_eqm{type = Type},
                                                      Role2),
                            LookRole = looks:calc(Role3),
                            looks:update_looks(Role, LookRole),
                            EndRole = LookRole,
                            role:send_buff_flush(),
                            {reply, {0, Msg}, EndRole}
                    end
            end
    end;
handle(10602, _Data, _Role) ->
    {reply,
     {0, util:flist(lang:get("当前等级不足~w级，无法强化"), [45])}};
handle(10603, {Id},
       Role = #role{p_eqm = Peqm, lev = Lev})
    when Lev >= 40 ->
    case package:find(by_id, Id, Peqm) of
        false ->
            {reply, {0, lang:get("装备不存在，无法重铸"), Id, [], 0, 0}};
        {ok, #item{lev = EqmLev}} when EqmLev < 40 ->
            {reply, {0, lang:get("40级以上的装备才可以重铸"), Id, [], 0, 0}};
        {ok, Eqm = #item{type = Type}} ->
            case blacksmith:check_in_switch(Eqm) of
                false ->
                    case lists:member(Type,
                                      [1,
                                       4,
                                       2,
                                       3,
                                       5,
                                       21,
                                       22,
                                       6,
                                       7,
                                       9,
                                       10,
                                       11,
                                       12,
                                       14])
                        of
                        false ->
                            {reply, {0, lang:get("该装备不能重铸"), Id, [], 0, 0}};
                        true ->
                            role:send_buff_begin(),
                            case blacksmith:reset(Eqm, Role) of
                                {false, Reason} ->
                                    role:send_buff_clean(),
                                    {reply, {0, Reason, Id, [], 0, 0}};
                                {ok,
                                 NewRole,
                                 Msg,
                                 ResetAttr,
                                 EqmResetVal,
                                 LuckyVal} ->
                                    role:send_buff_flush(),
                                    {reply,
                                     {1,
                                      Msg,
                                      Id,
                                      ResetAttr,
                                      EqmResetVal,
                                      LuckyVal},
                                     NewRole}
                            end
                    end;
                true ->
                    {reply, {0, lang:get("请先切回高等级装备才能重铸"), Id, [], 0, 0}}
            end
    end;
handle(10603, _Data, _Role) ->
    {reply, {0, lang:get("当前等级不足40级，无法重铸"), 0, [], 0, 0}};
handle(10604, {Id, HoleId, Stone},
       Role = #role{p_eqm = Peqm, lev = Lev})
    when (HoleId >= 110 andalso HoleId =< 112) andalso
             Lev >= 40 ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法镶嵌")}};
        {ok, Eqm = #item{type = Type}} ->
            case lists:member(Type,
                              [1, 4, 2, 3, 5, 21, 22, 6, 7, 9, 10, 11, 12, 14])
                of
                false -> {reply, {0, lang:get("该装备不能镶嵌")}};
                true ->
                    role:send_buff_begin(),
                    case blacksmith:embed(Eqm, HoleId, Stone, Role) of
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason}};
                        {ok, NewRole} ->
                            Role1 = attr:calc_and_push(NewRole),
                            Role2 = role_trigger:fire(#evt_eqm{type = Type},
                                                      Role1),
                            EndRole = Role2,
                            role:send_buff_flush(),
                            {reply, {1, lang:get("镶嵌成功")}, EndRole}
                    end
            end
    end;
handle(10604, _Data, _Role) ->
    {reply,
     {0, util:flist(lang:get("当前等级不足~w级，无法镶嵌宝石"), [40])}};
handle(10605, {Id, HoleId, BaseId},
       Role = #role{p_eqm = Peqm})
    when HoleId >= 110 andalso HoleId =< 112 ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法升级宝石")}};
        {ok, Eqm = #item{type = Type}} ->
            case lists:member(Type,
                              [1, 4, 2, 3, 5, 21, 22, 6, 7, 9, 10, 11, 12, 14])
                of
                false -> {reply, {0, lang:get("该装备不能升级宝石")}};
                true ->
                    role:send_buff_begin(),
                    case blacksmith:upstone(Eqm, HoleId, BaseId, Role) of
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason}};
                        {ok, NewRole, Msg} ->
                            Role1 = attr:calc_and_push(NewRole),
                            Role2 = role_trigger:fire(#evt_eqm{type = Type},
                                                      Role1),
                            EndRole = Role2,
                            role:send_buff_flush(),
                            {reply, {1, Msg}, EndRole}
                    end
            end
    end;
handle(10606, {Id, HoleId}, Role = #role{p_eqm = Peqm})
    when HoleId >= 110 andalso HoleId =< 112 ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法摘除宝石")}};
        {ok, Eqm = #item{type = Type}} ->
            case lists:member(Type,
                              [1, 4, 2, 3, 5, 21, 22, 6, 7, 9, 10, 11, 12, 14])
                of
                false -> {reply, {0, lang:get("该装备不能摘除宝石")}};
                true ->
                    role:send_buff_begin(),
                    case blacksmith:removestone(Eqm, HoleId, Role) of
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason}};
                        {ok, NewRole} ->
                            Role1 = attr:calc_and_push(NewRole),
                            Role2 = role_trigger:fire(#evt_eqm{type = Type},
                                                      Role1),
                            EndRole = Role2,
                            role:send_buff_flush(),
                            {reply, {1, lang:get("宝石摘除成功")}, EndRole}
                    end
            end
    end;
handle(10607, {BaseId, Num}, Role) ->
    logger:debug("==================",
                 [],
                 blacksmith_rpc,
                 212),
    case blacksmith:fuse2(Role, BaseId, Num) of
        {ok, Msg, NextId, NewRole} ->
            logger:debug("==================",
                         [],
                         blacksmith_rpc,
                         215),
            {reply, {1, Msg, NextId}, NewRole};
        {ok, Msg, NewRole} ->
            logger:debug("==================",
                         [],
                         blacksmith_rpc,
                         219),
            {reply, {1, Msg, 0}, NewRole};
        {false, Why} ->
            logger:debug("==================",
                         [],
                         blacksmith_rpc,
                         222),
            {reply, {0, Why, 0}};
        _Else ->
            logger:debug("合成异常返回 ~w", [_Else], blacksmith_rpc, 225),
            {reply, {0, lang:get("无法合成"), 0}}
    end;
handle(10608, {Id}, Role = #role{p_eqm = Peqm}) ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法选择"), Id}};
        {ok, #item{reset_attr = []}} ->
            {reply, {0, lang:get("该装备不存在可保存的属性"), Id}};
        {ok, Eqm = #item{}} ->
            case blacksmith:check_in_switch(Eqm) of
                false ->
                    role:send_buff_begin(),
                    case blacksmith:check_reset(Eqm, Role) of
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason, Id}};
                        {ok, NewRole, Msg} ->
                            role:send_buff_flush(),
                            {reply, {1, Msg, Id}, NewRole}
                    end;
                true -> {reply, {0, lang:get("请先切回高级装备才能选择重铸"), Id}}
            end
    end;
handle(10609, {Id}, #role{p_eqm = Peqm}) ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {Id, []}};
        {ok, #item{reset_attr = ResetAttr, data = Data}} ->
            LuckyVal = case lists:keyfind(6, 1, Data) of
                           {6, LuckyVal0} -> LuckyVal0;
                           _ -> 0
                       end,
            {reply, {Id, ResetAttr, LuckyVal}}
    end;
handle(10610, {Id1, Id2}, Role) ->
    case blacksmith:fuse(Role, Id1, Id2) of
        {ok, Msg, NextId, NewRole} ->
            {reply, {1, Msg, NextId}, NewRole};
        {false, Why} -> {reply, {0, Why, 0}};
        _Else ->
            logger:debug("合成异常返回 ~w", [_Else], blacksmith_rpc, 271),
            {reply, {0, lang:get("无法合成"), 0}}
    end;
handle(10611, {Id, Side},
       Role = #role{p_eqm = Peqm, lev = Lev})
    when Lev >= 40 andalso (Side =:= 1 orelse Side =:= 2) ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法转换"), Id}};
        {ok, Eqm = #item{type = Type}} ->
            case blacksmith:check_in_switch(Eqm) of
                false ->
                    role:send_buff_begin(),
                    case blacksmith:transform(Eqm, Side, Role) of
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason, Id}};
                        {ok, Msg, NewRole} ->
                            NewRole1 = attr:calc_and_push(NewRole),
                            NewRole2 = role_trigger:fire(#evt_eqm{type = Type},
                                                         NewRole1),
                            role:send_buff_flush(),
                            {reply, {1, Msg, Id}, NewRole2}
                    end;
                true -> {reply, {0, lang:get("请先切回高级装备才能转换"), Id}}
            end
    end;
handle(10611, _Data, _Role) ->
    {reply, {0, util:flist(lang:get("当前等级不足~w级，无法转换"), 0)}};
handle(10612, {}, Role) ->
    EqmResetVal = var:get_var(Role, other, 2011, 0),
    {reply, {EqmResetVal}};
handle(10613, {}, Role) ->
    EqmResetVal = var:get_var(Role, other, 2011, 0),
    case EqmResetVal >= 100 of
        true ->
            Reward = blacksmith_data:get_reset_reward(),
            case format:val_to_gain(Reward) of
                Gain = [_ | _] ->
                    case role_gain:do_notice(Gain, Role) of
                        {ok, NewRole} ->
                            NewRole1 = var:set_var(NewRole, other, 2011, 0),
                            {reply, {1, lang:get("领取成功"), 0}, NewRole1};
                        {false, #gain{msg = Msg}} ->
                            {reply, {0, Msg, EqmResetVal}};
                        _ -> {reply, {0, lang:get("无法获取重铸礼包数据"), EqmResetVal}}
                    end;
                _ -> {reply, {0, lang:get("无法获取重铸礼包数据"), EqmResetVal}}
            end;
        false ->
            Msg = util:flist(lang:get("当前重铸能量不足~w，无法领取重铸礼包"),
                             [100]),
            {reply, {0, Msg, EqmResetVal}}
    end;
handle(10614, {Id},
       Role = #role{p_eqm = Peqm, lev = Lev})
    when Lev >= 40 ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法转换"), Id}};
        {ok, Eqm = #item{}} ->
            case blacksmith:check_in_switch(Eqm) of
                false ->
                    role:send_buff_begin(),
                    case blacksmith:skill_transform(Eqm, Role) of
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason, Id}};
                        {ok, Msg, NewRole} ->
                            role:send_buff_flush(),
                            {reply, {1, Msg, Id}, NewRole}
                    end;
                true -> {reply, {0, lang:get("请先切回高级装备才能洗炼"), Id}}
            end
    end;
handle(10614, _Data, _Role) ->
    {reply,
     {0, util:flist(lang:get("当前等级不足~w级，无法转换"), [40])}};
handle(10615, {Id}, #role{p_eqm = Peqm}) ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {Id, []}};
        {ok, #item{data = Data}} ->
            case lists:keyfind(1, 1, Data) of
                {1, SpecicalSkillData} ->
                    {reply, {Id, SpecicalSkillData}};
                _ -> {reply, {Id, []}}
            end
    end;
handle(10616, {Id},
       Role = #role{p_eqm = Peqm, lev = Lev})
    when Lev >= 40 ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法转换"), Id}};
        {ok, Eqm = #item{type = Type}} ->
            case blacksmith:check_in_switch(Eqm) of
                false ->
                    role:send_buff_begin(),
                    case blacksmith:skill_transform_save(Eqm, Role) of
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason, Id}};
                        {ok, Msg, NewRole} ->
                            NewRole1 = attr:calc_and_push(NewRole),
                            NewRole2 = role_trigger:fire(#evt_eqm{type = Type},
                                                         NewRole1),
                            role:send_buff_flush(),
                            {reply, {1, Msg, Id}, NewRole2}
                    end;
                true -> {reply, {0, lang:get("请先切回高级装备才能保存"), Id}}
            end
    end;
handle(10616, _Data, _Role) ->
    {reply,
     {0, util:flist(lang:get("当前等级不足~w级，无法进行保存"), [40])}};
handle(10617, {Id, Craft, Lock},
       Role = #role{p_eqm = Peqm}) ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法点化"), Id}};
        {ok, Eqm = #item{}} ->
            role:send_buff_begin(),
            case blacksmith:comprehend(Role, Eqm, Craft, Lock) of
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason, Id, Lock}};
                {ok, Msg, Role1} ->
                    Role2 = attr:calc_and_push(Role1),
                    Role3 = looks:calc(Role2),
                    NewRole = Role3,
                    looks:update_looks(Role, NewRole),
                    role:send_buff_flush(),
                    {reply, {1, Msg, Id, Lock}, NewRole}
            end
    end;
handle(10618, {Id, Craft},
       Role = #role{p_eqm = Peqm}) ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法点化"), Id}};
        {ok, Eqm = #item{}} ->
            role:send_buff_begin(),
            case blacksmith:comprehend_save(Role, Eqm, Craft) of
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason, Id}};
                {ok, Msg, Role1} ->
                    Role2 = attr:calc_and_push(Role1),
                    Role3 = looks:calc(Role2),
                    NewRole = Role3,
                    looks:update_looks(Role, NewRole),
                    role:send_buff_flush(),
                    {reply, {1, Msg, Id}, NewRole}
            end
    end;
handle(10619, {Id, LooksId},
       Role = #role{p_eqm = Peqm}) ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法点化"), Id}};
        {ok, Eqm = #item{}} ->
            role:send_buff_begin(),
            case blacksmith:comprehend_looks(Role, Eqm, LooksId) of
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason, Id}};
                {ok, Msg, Role1} ->
                    Role2 = attr:calc_and_push(Role1),
                    {ok, TRole2} = fashion:take_off_weapon(Role2),
                    NewRole = looks:calc(TRole2),
                    looks:update_looks(Role, NewRole),
                    role:send_buff_flush(),
                    {reply, {1, Msg, Id}, NewRole}
            end
    end;
handle(10620, {Id}, #role{p_eqm = Peqm}) ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {Id, 0, []}};
        {ok, #item{data = Data}} ->
            case lists:keyfind(2, 1, Data) of
                {2, {BackLev, NowLev, BackAttr}} ->
                    {reply, {Id, BackLev, NowLev, BackAttr}};
                _Err -> {reply, {Id, 0, 0, []}}
            end
    end;
handle(10621, {Id}, Role = #role{p_eqm = Peqm}) ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在"), Id}};
        {ok, Eqm} ->
            case blacksmith:switch_back(Eqm, Role) of
                {false, Reason} -> {reply, {0, Reason, Id}};
                {ok, NewRole} ->
                    NewRole1 = attr:calc_and_push(NewRole),
                    {reply, {1, lang:get("切换成功"), Id}, NewRole1}
            end
    end;
handle(10622, {Id}, Role = #role{p_eqm = Peqm}) ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在"), Id}};
        {ok, Eqm} ->
            case blacksmith:break_enchant(Eqm, Role) of
                {false, Reason} -> {reply, {0, Reason, Id}};
                {ok, Msg, NewRole} ->
                    NewRole1 = attr:calc_and_push(NewRole),
                    {reply, {1, Msg, Id}, NewRole1}
            end
    end;
handle(10623, {Id}, Role = #role{p_bag = Pbag}) ->
    case package:find(by_id, Id, Pbag) of
        false -> {reply, {0, lang:get("道具不存在"), Id}};
        {ok, Item} ->
            role:send_buff_begin(),
            case blacksmith:decompose(Item, Role) of
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason, Id}};
                {ok, NewRole, Msg} ->
                    role:send_buff_flush(),
                    {reply, {1, Msg, Id}, NewRole}
            end
    end;
handle(10624, {Id, HoleId, Num},
       Role = #role{p_eqm = Peqm})
    when HoleId =:= 112 ->
    logger:debug("数量 ~w", [Num], blacksmith_rpc, 517),
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法升级宝石")}};
        {ok, Eqm = #item{type = Type}} ->
            case lists:member(Type,
                              [1, 4, 2, 3, 5, 21, 22, 6, 7, 9, 10, 11, 12, 14])
                of
                false -> {reply, {0, lang:get("该装备不能升级宝石")}};
                true ->
                    role:send_buff_begin(),
                    case blacksmith:up_hero_stone(Role,
                                                  #{eqm => Eqm, hole => HoleId,
                                                    num => Num})
                        of
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason}};
                        {ok, NewRole, Msg} ->
                            Role1 = attr:calc_and_push(NewRole),
                            Role2 = role_trigger:fire(#evt_eqm{type = Type},
                                                      Role1),
                            EndRole = Role2,
                            role:send_buff_flush(),
                            {reply, {1, Msg}, EndRole}
                    end
            end
    end;
handle(10625, {EqmId, HoleId, TargetStoneId},
       Role = #role{p_eqm = Peqm}) ->
    case var:get_var(Role, other, 2046, 0) of
        0 ->
            Msg = notice:format(lang:get("你没有进行过~ts，无法进行宝石转换"),
                                [{string_2, 5, lang:get("转职")}]),
            {reply, {0, Msg}};
        ClassesModifyTime ->
            Now = date:unixtime(),
            case Now - ClassesModifyTime > 604800 of
                true ->
                    Msg = notice:format(lang:get("你距离上次转职~ts，无法进行宝石转换"),
                                        [{string_2, 5, lang:get("超过7天")}]),
                    {reply, {0, Msg}};
                false ->
                    case package:find(by_id, EqmId, Peqm) of
                        false -> {reply, {0, lang:get("装备不存在，无法转换宝石")}};
                        {ok, Eqm = #item{type = Type}} ->
                            case lists:member(Type,
                                              [1,
                                               4,
                                               2,
                                               3,
                                               5,
                                               21,
                                               22,
                                               6,
                                               7,
                                               9,
                                               10,
                                               11,
                                               12,
                                               14])
                                of
                                false -> {reply, {0, lang:get("该装备不能进行宝石转化")}};
                                true ->
                                    role:send_buff_begin(),
                                    case blacksmith:stone_classes_modify(Role,
                                                                         Eqm,
                                                                         HoleId,
                                                                         TargetStoneId)
                                        of
                                        {false, Reason} ->
                                            role:send_buff_clean(),
                                            logger:debug("宝石转换失败:~ts",
                                                         [Reason],
                                                         blacksmith_rpc,
                                                         562),
                                            {reply, {0, Reason}};
                                        {ok, NewRole} ->
                                            Role1 = attr:calc_and_push(NewRole),
                                            Role2 =
                                                role_trigger:fire(#evt_eqm{type
                                                                               =
                                                                               Type},
                                                                  Role1),
                                            EndRole = Role2,
                                            role:send_buff_flush(),
                                            {reply,
                                             {1, lang:get("转换成功")},
                                             EndRole}
                                    end
                            end
                    end
            end
    end;
handle(10626, {EqmId}, Role = #role{p_eqm = Peqm}) ->
    case package:find(by_id, EqmId, Peqm) of
        false -> {reply, {0, lang:get("没有找到装备")}};
        {ok, Eqm = #item{}} ->
            role:send_buff_begin(),
            case blacksmith:hero_stone_back(Role, Eqm) of
                {ok, NewRole} ->
                    role:send_buff_flush(),
                    {reply, {1, ""}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end
    end;
handle(10627, {}, Role) ->
    TalismanList = talisman:get_convertible_talisman(Role),
    {reply, {TalismanList}};
handle(10628, {Id, BaseId, TargetBaseId}, Role) ->
    case talisman:talisman_convert(Id,
                                   BaseId,
                                   TargetBaseId,
                                   Role)
        of
        {0, Reason} -> {reply, {0, Reason}};
        {1, NewRole} -> {reply, {1, lang:get("转换成功")}, NewRole}
    end;
handle(10629, {Id, AttrName, AttrVal},
       Role = #role{p_eqm = Peqm, lev = Lev})
    when Lev >= 40 ->
    case package:find(by_id, Id, Peqm) of
        false -> {reply, {0, lang:get("装备不存在，无法转换"), Id}};
        {ok, Eqm = #item{}} ->
            case blacksmith:check_in_switch(Eqm) of
                false ->
                    role:send_buff_begin(),
                    case blacksmith:target_skill_transform(Eqm,
                                                           {AttrName, AttrVal},
                                                           Role)
                        of
                        {false, Reason} ->
                            logger:debug("~ts", [Reason], blacksmith_rpc, 616),
                            role:send_buff_clean(),
                            {reply, {0, Reason, Id}};
                        {ok, Msg, NewRole} ->
                            role:send_buff_flush(),
                            {reply, {1, Msg, Id}, NewRole}
                    end;
                true -> {reply, {0, lang:get("请先切回高级装备才能洗炼"), Id}}
            end
    end;
handle(10629, _Data, _Role) ->
    {reply,
     {0, util:flist(lang:get("当前等级不足~w级，无法转换"), [40])}};
handle(_Cmd, _Data, _Role) ->
    logger:error("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [blacksmith_rpc, _Cmd, _Data],
                 blacksmith_rpc,
                 634),
    {error, unknow_command}.

