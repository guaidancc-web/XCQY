-file("src/mod/blacksmith/blacksmith.erl", 1).

-module(blacksmith).

-export([forge/4,
         enchant/4,
         break_enchant/2,
         embed/4,
         count_embed/1,
         upstone/4,
         up_hero_stone/2,
         removestone/3,
         stone_info/1,
         fuse/2,
         fuse/3,
         fuse2/3,
         reset/2,
         check_reset/2,
         transform/3,
         skill_transform/2,
         skill_transform_save/2,
         set_shoes_zero_speed/1,
         comprehend/4,
         comprehend_save/3,
         comprehend_looks/3,
         switch_back/2,
         check_in_switch/1,
         odds_refresh/1,
         is_enchant_break/1,
         decompose/2,
         stone_classes_modify/4,
         update_max_enchant_lev/1,
         hero_stone_back/2,
         forge_attr/5,
         adm_show/1,
         target_skill_transform/3,
         repaire_comprehend/1]).

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

-file("src/mod/blacksmith/blacksmith.erl", 45).

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

-file("src/mod/blacksmith/blacksmith.erl", 46).

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

-file("src/mod/blacksmith/blacksmith.erl", 47).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/blacksmith/blacksmith.erl", 48).

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

-file("src/mod/blacksmith/blacksmith.erl", 49).

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

-file("src/mod/blacksmith/blacksmith.erl", 50).

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

-file("src/mod/blacksmith/blacksmith.erl", 51).

-file("inc/blacksmith.hrl", 1).

-record(enchant_fail_reward,
        {val = 0,
         item_list = [],
         title = "",
         msg = "",
         is_break = 0}).

-file("src/mod/blacksmith/blacksmith.erl", 52).

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

-file("src/mod/blacksmith/blacksmith.erl", 53).

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

-file("src/mod/blacksmith/blacksmith.erl", 54).

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

-file("src/mod/blacksmith/blacksmith.erl", 55).

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

-file("src/mod/blacksmith/blacksmith.erl", 56).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/blacksmith/blacksmith.erl", 57).

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

-file("src/mod/blacksmith/blacksmith.erl", 58).

-file("inc/market.hrl", 1).

-record(market_price,
        {base_id = 0,
         price = 0,
         assets = 0,
         source = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0}).

-file("src/mod/blacksmith/blacksmith.erl", 59).

is_enchant_break(#item{extra = Extra}) ->
    case lists:keymember(10, 1, Extra) of
        true -> true;
        _ -> false
    end.

forge(Eqm, IsPerfect, UseHeroPaper, Role) ->
    case check_forge(Eqm, IsPerfect, UseHeroPaper, Role) of
        {false, Reason} -> {false, Reason};
        {true,
         NextLev,
         NeedCoin,
         NeedItem,
         NextId,
         MakeUpItem} ->
            case forge_loss(NeedCoin, NeedItem, Role) of
                {false, Reason} -> {false, Reason};
                {ok, NewRole} ->
                    forge_make(Eqm,
                               IsPerfect,
                               UseHeroPaper,
                               NextLev,
                               NextId,
                               MakeUpItem,
                               NewRole)
            end
    end.

enchant(Eqm, LuckBaseList, ProtectBaseId, Role) ->
    case check_enchant(Eqm,
                       LuckBaseList,
                       ProtectBaseId,
                       Role)
        of
        {false, Reason} -> {false, Reason};
        growth -> enchant_cast(growth, Eqm, LuckBaseList, Role);
        {true,
         BaseRatio,
         LossEnchant,
         NeedItem,
         NeedCoin,
         NewLuckBaseList,
         NeedProtect} ->
            case enchant_loss(NeedCoin,
                              NeedItem,
                              NewLuckBaseList,
                              NeedProtect,
                              Role)
                of
                {false, Reason} -> {false, Reason};
                {ok, NewRole} ->
                    case random_luck(BaseRatio, NewLuckBaseList, Role) of
                        {true, LuckVal} ->
                            enchant_cast(suc,
                                         ProtectBaseId,
                                         LuckVal,
                                         LossEnchant,
                                         Eqm,
                                         LuckBaseList,
                                         NewRole);
                        {false, LuckVal} ->
                            enchant_cast(fail,
                                         ProtectBaseId,
                                         LuckVal,
                                         LossEnchant,
                                         Eqm,
                                         LuckBaseList,
                                         NewRole)
                    end
            end
    end.

break_enchant(Eqm, Role) ->
    case check_break_enchant(Eqm, Role) of
        {false, Reason} -> {false, Reason};
        {true, NeedItem} ->
            case break_enchant_loss(NeedItem, Role) of
                {false, Reason} -> {false, Reason};
                {ok, NewRole} -> break_enchant_make(Eqm, NewRole)
            end
    end.

transform(Eqm, Side, Role) ->
    case check_transform(Eqm, Side, Role) of
        {false, Reason} -> {false, Reason};
        {true, NeedItem, SpecialAttr, NormalAttr} ->
            case transform_loss(NeedItem, Role) of
                {false, Reason} -> {false, Reason};
                {ok, NewRole} ->
                    transform_make(Eqm,
                                   Side,
                                   SpecialAttr,
                                   NormalAttr,
                                   NewRole)
            end
    end.

skill_transform(Eqm, Role) ->
    case check_skill_transform(Eqm, Role) of
        {false, Reason} -> {false, Reason};
        {true, NeedItem, SpecialAttr} ->
            case skill_transform_loss(NeedItem, Role) of
                {false, Reason} -> {false, Reason};
                {ok, NewRole} ->
                    skill_transform_make(Eqm, SpecialAttr, NewRole)
            end
    end.

target_skill_transform(Eqm, Target, Role) ->
    case check_skill_transform(Eqm, Role) of
        {false, Reason} -> {false, Reason};
        {true, _NeedItem, SpecialAttr} ->
            case check_ext_loss(Eqm, Role) of
                {false, Reason} -> {false, Reason};
                ExtLoss ->
                    case skill_transform_loss(ExtLoss, Role) of
                        {false, Reason} -> {false, Reason};
                        {ok, NewRole} ->
                            target_skill_transform_make(Eqm,
                                                        Target,
                                                        SpecialAttr,
                                                        NewRole)
                    end
            end
    end.

skill_transform_save(Eqm = #item{data = Data,
                                 attr = Attr},
                     Role = #role{p_eqm = Peqm}) ->
    {AttrSpecialSkill, AttrNormalAttrList} =
        lists:partition(fun (#attr_base{type = Type}) ->
                                Type =:= 4
                        end,
                        Attr),
    {DataSpecialSkill, DataNormalAttrList} =
        lists:partition(fun ({Type, _}) -> Type =:= 1 end,
                        Data),
    case AttrSpecialSkill of
        [#attr_base{}] ->
            case DataSpecialSkill of
                [{1, DataSpecialAttr = [#attr_base{}]}] ->
                    AttrList = DataSpecialAttr ++ AttrNormalAttrList,
                    NewEqm = eqm_attr:calc_eqm(Eqm#item{attr = AttrList,
                                                        data =
                                                            DataNormalAttrList}),
                    {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                          NewEqm,
                                                          Peqm,
                                                          Role),
                    NewRole = Role#role{p_eqm = NewPeqm},
                    log:eqm(NewRole, "装备技能转换", Eqm, NewEqm),
                    {Talents, _, _} = skill:get_effect_skill(NewRole),
                    role:link_send(NewRole, 10804, {Talents}),
                    {ok, lang:get("转换成功"), NewRole};
                _ -> {false, lang:get("没有特技需要保存")}
            end;
        _ -> {false, lang:get("装备不存在特技不能进行保存")}
    end.

switch_back(Eqm = #item{},
            Role = #role{p_eqm = Peqm}) ->
    case check_switch_back(Eqm) of
        {ok, NewEqm} ->
            NewEqm1 = eqm_attr:calc_eqm(NewEqm),
            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                  NewEqm1,
                                                  Peqm,
                                                  Role),
            NewRole = Role#role{p_eqm = NewPeqm},
            push_10620(Role, NewEqm1),
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end.

push_10620(Role, #item{id = EqmId, data = Data}) ->
    case lists:keyfind(2, 1, Data) of
        {2, {BackLev, NowLev, BackAttr}} ->
            role:link_send(Role,
                           10620,
                           {EqmId, BackLev, NowLev, BackAttr});
        _ -> role:link_send(Role, 10620, {EqmId, 0, 0, []})
    end,
    ok.

reset(Eqm = #item{lev = Lev, type = Type},
      Role = #role{classes = Classes, sex = Sex}) ->
    {CalcBaseAttr, SpecialAttr} =
        eqm_attr:get_role_init_attr(Type, Lev),
    {NewEqm, EffectAttr} = reset_lucky_odds_update(Eqm,
                                                   Classes,
                                                   Sex),
    BackUpAttr = CalcBaseAttr ++ SpecialAttr ++ EffectAttr,
    case BackUpAttr of
        [_ | _] ->
            case blacksmith_data:get_reset({Classes,
                                            Type,
                                            Lev,
                                            Sex})
                of
                #{loss_item := LossItem, loss_coin := LossCoin,
                  eqm_reset_val := EqmResetVal} ->
                    do_reset(LossItem,
                             LossCoin,
                             EqmResetVal,
                             BackUpAttr,
                             NewEqm,
                             Role);
                _ -> {false, lang:get("当前装备不能重铸")}
            end;
        _ -> {false, lang:get("当前装备不能重铸")}
    end.

do_reset(LossItem, _LossCoin, AddEqmResetVal,
         BackUpAttr, Eqm = #item{type = EqmType, data = Data},
         Role = #role{p_eqm = Peqm}) ->
    Loss = [#loss{label = item_base_id_auto_buy,
                  val = LossItem, msg = lang:get("道具不足, 无法操作"),
                  auto_scene = lang:get("重铸装备")}],
    case role_gain:do(Loss, Role) of
        {false, _} ->
            {false,
             notice:format(lang:get("你的~ts不足"),
                           [{assets_2, 90002}])};
        {ok, NewRole} ->
            NewEqm = Eqm#item{reset_attr = BackUpAttr},
            {ok, NewPeqm} = package:fresh_eqm(Eqm, NewEqm, Peqm),
            NewRole1 = NewRole#role{p_eqm = NewPeqm},
            NewRole2 = role_trigger:fire(#evt_reset_eqm{type =
                                                            EqmType},
                                         NewRole1),
            OldEqmResetVal = var:get_var(NewRole2, other, 2011, 0),
            {ReMsg, NewRole4, NewEqmResetVal} = case AddEqmResetVal
                                                         > 0
                                                    of
                                                    true ->
                                                        Reward =
                                                            blacksmith_data:get_reset_reward(),
                                                        case OldEqmResetVal +
                                                                 AddEqmResetVal
                                                                 >= 100
                                                            of
                                                            true ->
                                                                mail:send(Role,
                                                                          lang:get("重铸大师礼包"),
                                                                          lang:get("装备重铸能量已达到100，恭喜您获得重铸大师礼包，请查收"),
                                                                          Reward),
                                                                Msg1 =
                                                                    notice:format(lang:get("获得~ts，已通过邮件发放"),
                                                                                  [{item_2,
                                                                                    Reward}]),
                                                                NewRole3 =
                                                                    var:set_var(NewRole2,
                                                                                other,
                                                                                2011,
                                                                                0),
                                                                {Msg1,
                                                                 NewRole3,
                                                                 0};
                                                            _ ->
                                                                EqmResetVal1 =
                                                                    min(100,
                                                                        OldEqmResetVal
                                                                            +
                                                                            AddEqmResetVal),
                                                                NewRole3 =
                                                                    var:set_var(NewRole2,
                                                                                other,
                                                                                2011,
                                                                                EqmResetVal1),
                                                                Msg1 =
                                                                    util:flist(lang:get("重铸能量+~w"),
                                                                               [AddEqmResetVal]),
                                                                Msg2 =
                                                                    notice:format(lang:get("~ts"),
                                                                                  [{string_2,
                                                                                    5,
                                                                                    Msg1}]),
                                                                {Msg2,
                                                                 NewRole3,
                                                                 EqmResetVal1}
                                                        end;
                                                    false ->
                                                        {lang:get("重铸成功"),
                                                         NewRole2,
                                                         OldEqmResetVal}
                                                end,
            log:eqm(NewRole4, "装备重铸", Eqm, NewEqm),
            LuckyVal = case lists:keyfind(6, 1, Data) of
                           {6, LuckyVal0} -> LuckyVal0;
                           _ -> 0
                       end,
            {ok,
             NewRole4,
             ReMsg,
             BackUpAttr,
             NewEqmResetVal,
             LuckyVal}
    end.

check_reset(#item{reset_attr = []}, _Role) ->
    {false, lang:get("当前装备不存在可保存的重铸属性")};
check_reset(Eqm = #item{type = Type,
                        reset_attr = BackUpAttr, attr = Attr},
            Role = #role{p_eqm = Peqm}) ->
    OldHoleAttr = [A || A = #attr_base{type = 3} <- Attr],
    OldCampAttr = [A || A = #attr_base{type = 5} <- Attr],
    OldCampCachedAttr = [A
                         || A = #attr_base{type = 6} <- Attr],
    NewAttr = BackUpAttr ++
                  OldHoleAttr ++ OldCampAttr ++ OldCampCachedAttr,
    NewEqm = eqm_attr:calc_eqm(Eqm#item{attr = NewAttr,
                                        reset_attr = []}),
    {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                          NewEqm,
                                          Peqm,
                                          Role),
    NewRole = attr:calc_and_push(Role#role{p_eqm =
                                               NewPeqm}),
    NewRole1 = role_trigger:fire(#evt_eqm{type = Type},
                                 NewRole),
    {Talents, _, _} = skill:get_effect_skill(NewRole1),
    role:link_send(NewRole1, 10804, {Talents}),
    log:eqm(NewRole1, "选择重铸", Eqm, NewEqm),
    {ok, NewRole1, lang:get("")}.

fuse(Role, Id) -> fuse2(Role, Id, 1).

fuse2(Role = #role{p_bag = Bag}, Id, Num) ->
    case fuse_data:get(Id) of
        #{base_id := ItemBaseId, next_base_id := NextId,
          need_num := NeedNum, cost_assets := CostAssets,
          odds := Odds, bind := _Bind, mail_items := MailItems} ->
            {Loss1, Bind} = get_fuse_loss(Bag,
                                          ItemBaseId,
                                          NeedNum * Num),
            NCostAssets = [{IItemId, INum * Num}
                           || {IItemId, INum} <- CostAssets],
            Loss2 = format:val_to_loss(NCostAssets),
            Loss = Loss1 ++ Loss2,
            Items = [{NextId, Bind, Num}],
            Gain = format:val_to_gain(Items),
            role:send_buff_begin(),
            case role_gain:do(Loss, Role) of
                {ok, Role1} ->
                    case util:rand(1, 100) =< Odds of
                        true ->
                            case role_gain:auto_overlap(Gain, Role1) of
                                {ok, Role2, _SucL, _FailL} ->
                                    role:send_buff_flush(),
                                    Msg = notice:format(lang:get("恭喜，成功合成了~ts"),
                                                        [{item_2, Items}]),
                                    NewRole =
                                        role_trigger:fire(#evt_fuse{base_id =
                                                                        NextId},
                                                          Role2),
                                    case MailItems of
                                        [_ | _] ->
                                            case fuse_data:get(Id) of
                                                #{mail_title := MailTitle,
                                                  mail_content :=
                                                      MailContent} ->
                                                    NewItems = [{MBaseID,
                                                                 MBind,
                                                                 MNum * Num}
                                                                || {MBaseID,
                                                                    MBind,
                                                                    MNum}
                                                                       <- MailItems],
                                                    mail:send(NewRole,
                                                              MailTitle,
                                                              MailContent,
                                                              NewItems);
                                                _ -> ok
                                            end;
                                        _ -> ok
                                    end,
                                    {ok, Msg, NextId, NewRole};
                                {false, #gain{msg = Msg}} ->
                                    role:send_buff_clean(),
                                    {false, Msg};
                                _Err ->
                                    role:send_buff_clean(),
                                    logger:error("合成物品失败:~w",
                                                 [_Err],
                                                 blacksmith,
                                                 346),
                                    false
                            end;
                        _ ->
                            role:send_buff_clean(),
                            Msg = lang:get("合成失败"),
                            {ok, Msg, Role1}
                    end;
                {false, #loss{msg = Msg}} ->
                    role:send_buff_clean(),
                    {false, Msg}
            end;
        _ -> {false, lang:get("不能合成")}
    end.

fuse(Role = #role{p_bag = Bag, lev = RoleLev}, Id1,
     Id2) ->
    case {package:find(by_id, Id1, Bag),
          package:find(by_id, Id2, Bag)}
        of
        {{ok, I1 = #item{type = Type = 102, base_id = BaseId}},
         {ok, I2 = #item{base_id = BaseId}}} ->
            Loss = [#loss{label = item_id,
                          val = [{Id1, 1}, {Id2, 1}]}],
            {Flag, Gain} = case item_type:fuse_skill_stone(Role,
                                                           BaseId,
                                                           RoleLev)
                               of
                               {true, AddItem = #item{}, _} ->
                                   {false,
                                    [#gain{label = items, val = [AddItem]}]};
                               {true, AddItem = #item{}} ->
                                   {true,
                                    [#gain{label = items, val = [AddItem]}]};
                               _ -> {false, format:val_to_gain([{BaseId, 1}])}
                           end,
            case role_gain:do(Loss, Role) of
                {ok,
                 Role1 = #role{p_bag = #package{next_id = NextId}}} ->
                    case role_gain:do(Gain, Role1) of
                        {ok, NewRole = #role{p_bag = Bag2}} ->
                            Msg = util:flist(lang:get("恭喜，成功合成了~ts"),
                                             [item:attr(name, BaseId)]),
                            case package:find(by_id, NextId, Bag2) of
                                {ok, I3} ->
                                    log:fuse(Role,
                                             "合成护符",
                                             [I1#item{quantity = 1},
                                              I2#item{quantity = 1}],
                                             I3);
                                _R ->
                                    logger:debug("找不到物品 ~w",
                                                 [_R],
                                                 blacksmith,
                                                 380),
                                    ok
                            end,
                            NewRole2 = case Flag of
                                           true ->
                                               var:set_var(NewRole,
                                                           acc,
                                                           {1017, Type},
                                                           0);
                                           _ ->
                                               var:acc_var(NewRole,
                                                           acc,
                                                           {1017, Type})
                                       end,
                            {ok, Msg, NextId, NewRole2};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        {{ok, I1 = #item{type = 104, base_id = BaseId}},
         {ok, I2 = #item{base_id = BaseId}}} ->
            Loss = [#loss{label = item_id,
                          val = [{Id1, 1}, {Id2, 1}]}],
            Gain = case item_type:fuse_skill_stone(Role,
                                                   BaseId,
                                                   RoleLev)
                       of
                       {true, AddItem = #item{}} ->
                           [#gain{label = items, val = [AddItem]}];
                       _ -> format:val_to_gain([{BaseId, 1}])
                   end,
            case role_gain:do(Loss, Role) of
                {ok,
                 Role1 = #role{p_bag = #package{next_id = NextId}}} ->
                    case role_gain:do(Gain, Role1) of
                        {ok, NewRole = #role{p_bag = Bag2}} ->
                            Msg = util:flist(lang:get("恭喜，成功合成了~ts"),
                                             [item:attr(name, BaseId)]),
                            case package:find(by_id, NextId, Bag2) of
                                {ok, I3} ->
                                    log:fuse(Role,
                                             "合成孩子护符",
                                             [I1#item{quantity = 1},
                                              I2#item{quantity = 1}],
                                             I3);
                                _R ->
                                    logger:debug("找不到物品 ~w",
                                                 [_R],
                                                 blacksmith,
                                                 411),
                                    ok
                            end,
                            {ok, Msg, NextId, NewRole};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        {{ok, I1 = #item{type = 103, base_id = BaseId}},
         {ok, I2 = #item{base_id = BaseId}}} ->
            Loss = [#loss{label = item_id,
                          val = [{Id1, 1}, {Id2, 1}]}],
            Gain = case item_type:fuse_skill_stone(Role,
                                                   BaseId,
                                                   RoleLev)
                       of
                       {true, AddItem = #item{}} ->
                           [#gain{label = items, val = [AddItem]}];
                       _ -> format:val_to_gain([{BaseId, 1}])
                   end,
            case role_gain:do(Loss, Role) of
                {ok,
                 Role1 = #role{p_bag = #package{next_id = NextId}}} ->
                    case role_gain:do(Gain, Role1) of
                        {ok, NewRole = #role{p_bag = Bag2}} ->
                            Msg = util:flist(lang:get("恭喜，成功合成了~ts"),
                                             [item:attr(name, BaseId)]),
                            case package:find(by_id, NextId, Bag2) of
                                {ok, I3} ->
                                    log:fuse(Role,
                                             "合成孩子装备",
                                             [I1#item{quantity = 1},
                                              I2#item{quantity = 1}],
                                             I3);
                                _R ->
                                    logger:debug("找不到物品 ~w",
                                                 [_R],
                                                 blacksmith,
                                                 436),
                                    ok
                            end,
                            {ok, Msg, NextId, NewRole};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("不能合成")}
    end.

hero_stone_back(Role = #role{p_eqm = Peqm}, Eqm) ->
    case check_hero_back(Eqm) of
        {true, GainVal, NewEqm} ->
            Loss = format:val_to_loss([{20406, 1}]),
            Gain = format:val_to_gain([{21098, GainVal}]),
            case role_gain:do(Loss, Role) of
                {ok, Role1} ->
                    case role_gain:do_notice(Gain, Role1) of
                        {ok, Role2} ->
                            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                                  NewEqm,
                                                                  Peqm,
                                                                  Role2),
                            NewRole = Role2#role{p_eqm = NewPeqm},
                            Msg = case check_all_hero_back(NewPeqm) of
                                      Num when Num > 0 ->
                                          notice:format(lang:get("找回成功{face_1,3}根据当前自身装备条件，还可找回~ts次英雄宝石"),
                                                        [{string_2, 1, Num}]);
                                      _ ->
                                          lang:get("找回成功{face_1,3}根据当前自身装备条件，所有英雄宝石都已找回")
                                  end,
                            notice:npc_talk(NewRole, 20098, Msg),
                            {ok, NewRole};
                        _ -> {false, lang:get("背包已满，请先整理背包")}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        {false, Reason} -> {false, Reason}
    end.

check_all_hero_back(#package{items = EqmList}) ->
    check_all_hero_back(EqmList, 0).

check_all_hero_back([], Num) -> Num;
check_all_hero_back([Eqm | T], Num) ->
    case check_hero_back(Eqm) of
        {true, _, _} -> check_all_hero_back(T, Num + 1);
        _ -> check_all_hero_back(T, Num)
    end.

check_hero_back(Eqm = #item{attr = Attr,
                            extra = Extra}) ->
    case lists:keyfind(24, 1, Extra) of
        {_, 1, _} ->
            case lists:keyfind(112, #attr_base.name, Attr) of
                #attr_base{val = Stone} ->
                    case blacksmith_data:stone_degrade(Stone) of
                        #{subtract_exp := SubtractExp} when SubtractExp > 0 ->
                            NewExtra = lists:keydelete(24, 1, Extra),
                            NewEqm = Eqm#item{extra = NewExtra},
                            {true, round(SubtractExp / 5), NewEqm};
                        _ -> {false, lang:get("当前英雄宝石不满足返还条件")}
                    end;
                _ -> {false, lang:get("没有英雄宝石无法返还")}
            end;
        _ -> {false, lang:get("该装备不符合返还条件")}
    end.

cacl_discount(Loss, CraftLev) ->
    {WorldLev, _} = world_lev:get_world_lev(),
    case blacksmith_data:get_comprehend_discount(WorldLev)
        of
        {MaxCraft, MinCraft, MaxDiscount, MinDiscount} ->
            case CraftLev > MinCraft andalso CraftLev =< MaxCraft of
                true ->
                    [{Id, max(1, erlang:round(Num * MaxDiscount / 100))}
                     || {Id, Num} <- Loss];
                false ->
                    case CraftLev =< MinCraft of
                        true ->
                            [{Id, max(1, erlang:round(Num * MinDiscount / 100))}
                             || {Id, Num} <- Loss];
                        false -> Loss
                    end
            end;
        false -> Loss
    end.

comprehend(#role{}, #item{lev = Lev}, _CraftLev, _Lock)
    when Lev < 80 ->
    {false,
     notice:format(lang:get("~ts级以上装备才可以进行精炼"),
                   [{string_2, 5, 80}])};
comprehend(Role = #role{classes = Classes, name = Name},
           Eqm = #item{attr = Attr, type = Type, extra = Extra,
                       base_id = BaseId, data = Data},
           CraftLev, Lock) ->
    Lev = lev_break:lev(Role),
    {SpecialAttrCached, OtherAttr} = lists:partition(fun
                                                         (#attr_base{type =
                                                                         AType,
                                                                     flag =
                                                                         Flag}) ->
                                                             AType =:= 6 andalso
                                                                 Flag =:=
                                                                     CraftLev
                                                     end,
                                                     Attr),
    SpecialAttr = [CA
                   || CA = #attr_base{type = 5, flag = CFlag} <- Attr,
                      CFlag =:= CraftLev],
    case blacksmith_data:get_comprehend({Classes,
                                         Type,
                                         CraftLev})
        of
        #{lev := NeedLev} when NeedLev > Lev ->
            {false,
             notice:format(lang:get("角色等级需要达到~ts才能点化"),
                           [{string_2, 5, NeedLev}])};
        #{lockable := 0} when Lock =:= 1 ->
            {false, lang:get("该品质属性不能锁定")};
        #{} when Lock =:= 1 andalso SpecialAttr =:= [] ->
            {false, lang:get("没有可锁定的属性")};
        Cfg = #{loss := Loss, lock_loss := LockLoss,
                attr_type := AttrType, attr_val := Values,
                max_val := Max} ->
            case CraftLev > 1 andalso
                     [A
                      || A = #attr_base{type = 5, flag = Flag} <- Attr,
                         CraftLev - Flag =:= 1]
                         =:= []
                of
                true ->
                    {false,
                     notice:format(lang:get("需要先把装备精炼至~ts开启"),
                                   [{string_2,
                                     5,
                                     craft_to_name(CraftLev - 1)}])};
                _ ->
                    ExtraFlag = case CraftLev of
                                    1 -> 11;
                                    2 -> 12;
                                    3 -> 13;
                                    4 -> 14;
                                    5 -> 15;
                                    6 -> 16;
                                    7 -> 17;
                                    8 -> 18;
                                    9 -> 19;
                                    10 -> 20;
                                    _ -> false
                                end,
                    NLoss = cacl_discount(Loss, CraftLev),
                    AddLoss = case Lock of
                                  1 ->
                                      format:val_to_loss(cacl_discount(LockLoss,
                                                                       CraftLev));
                                  _ -> []
                              end,
                    Cost = case lists:keyfind(ExtraFlag, 1, Extra) of
                               {ExtraFlag, 1, ""} -> AddLoss;
                               _ ->
                                   AddLoss ++
                                       format:val_to_loss(NLoss,
                                                          #{item_base_id_auto_buy
                                                                => 1,
                                                            auto_scene =>
                                                                lang:get("神器点化")})
                           end,
                    logger:debug("精练消耗:~w", [Cost], blacksmith, 576),
                    case role_gain:do_notice(Cost, Role) of
                        {ok, Role1 = #role{p_eqm = Peqm}} ->
                            {Data1, Values1, List} =
                                comprehend_lucky_odds_get(Data,
                                                          CraftLev,
                                                          Values),
                            logger:debug("神器点化概率 ~w~n",
                                         [Values1],
                                         blacksmith,
                                         581),
                            AttrName = case SpecialAttr of
                                           [#attr_base{name = OldName} | _]
                                               when Lock =:= 1 ->
                                               OldName;
                                           _ ->
                                               {NAttrName, _} =
                                                   util:rand_list(AttrType, 2),
                                               NAttrName
                                       end,
                            Exclude = [ExV
                                       || #attr_base{name = ExN, val = ExV}
                                              <- SpecialAttr ++
                                                     SpecialAttrCached,
                                          ExN =:= AttrName],
                            Values2 = [NVal
                                       || NVal = {NVn, _} <- Values1,
                                          lists:member(NVn, Exclude) =:= false],
                            {AttrVal, _} = util:rand_list(Values2, 2),
                            Data2 = comprehend_lucky_odds_update(Data1,
                                                                 List,
                                                                 Values1,
                                                                 CraftLev,
                                                                 AttrVal,
                                                                 Max),
                            {TakeOffFlag, NewEqm} = case [A
                                                          || A = #attr_base{type
                                                                                =
                                                                                5,
                                                                            flag
                                                                                =
                                                                                CraftLev1}
                                                                 <- OtherAttr,
                                                             CraftLev =:=
                                                                 CraftLev1]
                                                        of
                                                        [#attr_base{} | _] ->
                                                            CompAttr =
                                                                #attr_base{type
                                                                               =
                                                                               6,
                                                                           calc_type
                                                                               =
                                                                               0,
                                                                           name
                                                                               =
                                                                               AttrName,
                                                                           flag
                                                                               =
                                                                               CraftLev,
                                                                           val =
                                                                               AttrVal},
                                                            NewExtra =
                                                                lists:keydelete(ExtraFlag,
                                                                                1,
                                                                                Extra),
                                                            {false,
                                                             Eqm#item{attr =
                                                                          [CompAttr
                                                                           | OtherAttr],
                                                                      extra =
                                                                          NewExtra}};
                                                        _ ->
                                                            CompAttr =
                                                                #attr_base{type
                                                                               =
                                                                               5,
                                                                           calc_type
                                                                               =
                                                                               1,
                                                                           name
                                                                               =
                                                                               AttrName,
                                                                           flag
                                                                               =
                                                                               CraftLev,
                                                                           val =
                                                                               AttrVal},
                                                            {TTakeOffFlag,
                                                             LooksExtra} =
                                                                case Cfg of
                                                                    #{looks :=
                                                                          LooksId,
                                                                      looks_active_val
                                                                          :=
                                                                          NeedVal} ->
                                                                        case
                                                                            lists:keyfind(9,
                                                                                          1,
                                                                                          Extra)
                                                                            of
                                                                            false
                                                                                when
                                                                                  AttrVal
                                                                                      >=
                                                                                      NeedVal ->
                                                                                {true,
                                                                                 [{9,
                                                                                   LooksId,
                                                                                   ""}
                                                                                  | Extra]};
                                                                            _ ->
                                                                                {false,
                                                                                 Extra}
                                                                        end;
                                                                    _ ->
                                                                        {false,
                                                                         Extra}
                                                                end,
                                                            NewExtra =
                                                                lists:keydelete(ExtraFlag,
                                                                                1,
                                                                                LooksExtra),
                                                            {TTakeOffFlag,
                                                             Eqm#item{attr =
                                                                          [CompAttr
                                                                           | OtherAttr],
                                                                      extra =
                                                                          NewExtra}}
                                                    end,
                            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                                  NewEqm#item{data
                                                                                  =
                                                                                  Data2},
                                                                  Peqm,
                                                                  Role1),
                            Role3 = case TakeOffFlag of
                                        true ->
                                            {ok, Role2} =
                                                fashion:take_off_weapon(Role1),
                                            Role2;
                                        _ -> Role1
                                    end,
                            NewRole = role_trigger:fire(#evt_comprehend_eqm{},
                                                        Role3#role{p_eqm =
                                                                       NewPeqm}),
                            case AttrVal of
                                Max ->
                                    Annstr =
                                        notice:format(lang:get("神光乍现！~ts竟将~ts的~ts属性精炼至满星！"),
                                                      [{role_2, Name},
                                                       {item_2, BaseId},
                                                       {string_2,
                                                        1,
                                                        craft_to_name(CraftLev)}]),
                                    notice:cast(all, 5, Annstr);
                                _ -> ok
                            end,
                            case {eqm_attr:get_comprehend(Role),
                                  eqm_attr:get_comprehend(NewRole)}
                                of
                                {{ok, {PreCraft, _}}, {ok, {NewCraft, _}}}
                                    when NewCraft > PreCraft ->
                                    case get_notice_craft(NewCraft,
                                                          PreCraft,
                                                          Classes)
                                        of
                                        NoticeCraft when NoticeCraft > 0 ->
                                            Notice =
                                                notice:format(lang:get("恭喜您激活~ts{face_1,18}"),
                                                              [{string_2,
                                                                1,
                                                                util:flist(lang:get("~ts徽章"),
                                                                           [craft_to_name(NoticeCraft)])}]),
                                            notice:send(Role, 3, Notice);
                                        _El1 ->
                                            logger:debug("是否公告 ~w",
                                                         [_El1],
                                                         blacksmith,
                                                         633),
                                            ok
                                    end;
                                _El2 ->
                                    logger:debug("是否公告 ~w",
                                                 [_El2],
                                                 blacksmith,
                                                 637),
                                    ok
                            end,
                            Msg = "",
                            log:eqm(NewRole, "神器精炼", Eqm, NewEqm),
                            {ok, Msg, NewRole};
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        _ -> {false, lang:get("材料不足")}
                    end
            end;
        _ -> {false, lang:get("不能点化")}
    end.

comprehend_save(Role = #role{p_eqm = Peqm,
                             classes = Classes},
                Eqm = #item{attr = Attr, type = Type, extra = Extra},
                CraftLev) ->
    case lists:partition(fun (#attr_base{type = AType,
                                         flag = Flag}) ->
                                 AType =:= 6 andalso Flag =:= CraftLev
                         end,
                         Attr)
        of
        {[], _} -> {false, lang:get("还没精炼")};
        {[CompAttr = #attr_base{val = AttrVal} | _],
         OtherAttr} ->
            {TakeOffFlag, NewExtra} = case lists:keyfind(9,
                                                         1,
                                                         Extra)
                                          of
                                          {_, LooksId, _} ->
                                              case
                                                  blacksmith_data:get_comprehend_looks(LooksId)
                                                  of
                                                  {CraftLev, NeedVal}
                                                      when NeedVal > AttrVal ->
                                                      {true,
                                                       lists:keydelete(9,
                                                                       1,
                                                                       Extra)};
                                                  _ -> {false, Extra}
                                              end;
                                          _ ->
                                              case
                                                  blacksmith_data:get_comprehend({Classes,
                                                                                  Type,
                                                                                  CraftLev})
                                                  of
                                                  #{looks := LooksId,
                                                    looks_active_val := NeedVal}
                                                      when AttrVal >= NeedVal ->
                                                      {true,
                                                       [{9, LooksId, ""}
                                                        | Extra]};
                                                  _ -> {true, Extra}
                                              end
                                      end,
            Role2 = case TakeOffFlag of
                        true ->
                            {ok, Role1} = fashion:take_off_weapon(Role),
                            Role1;
                        _ -> Role
                    end,
            OtherAttr1 = [A
                          || A = #attr_base{type = Atype1, flag = Flag1}
                                 <- OtherAttr,
                             Atype1 =/= 5 orelse Flag1 =/= CraftLev],
            CompAttr1 = CompAttr#attr_base{type = 5, calc_type = 1},
            NewEqm = Eqm#item{attr = [CompAttr1 | OtherAttr1],
                              extra = NewExtra},
            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                  NewEqm,
                                                  Peqm,
                                                  Role2),
            NewRole = role_trigger:fire(#evt_comprehend_eqm{},
                                        Role2#role{p_eqm = NewPeqm}),
            Msg = "",
            case {eqm_attr:get_comprehend(Role),
                  eqm_attr:get_comprehend(NewRole)}
                of
                {{ok, {PreCraft, _}}, {ok, {NewCraft, _}}}
                    when NewCraft > PreCraft ->
                    case get_notice_craft(NewCraft, PreCraft, Classes) of
                        NoticeCraft when NoticeCraft > 0 ->
                            Notice =
                                notice:format(lang:get("恭喜您激活~ts{face_1,18}"),
                                              [{string_2,
                                                1,
                                                util:flist(lang:get("~ts徽章"),
                                                           [craft_to_name(NoticeCraft)])}]),
                            notice:send(Role, 3, Notice);
                        _El1 ->
                            logger:debug("是否公告 ~w", [_El1], blacksmith, 695),
                            ok
                    end;
                _El2 ->
                    logger:debug("是否公告 ~w", [_El2], blacksmith, 699),
                    ok
            end,
            log:eqm(NewRole, "神器保存", Eqm, NewEqm),
            {ok, Msg, NewRole}
    end.

get_notice_craft(NewCraft, PreCraft, _)
    when NewCraft =< PreCraft ->
    0;
get_notice_craft(NewCraft, PreCraft, Classes) ->
    case eqm_data:get_comprehend_ignore({NewCraft, Classes})
        of
        1 -> NewCraft;
        _ -> get_notice_craft(NewCraft - 1, PreCraft, Classes)
    end.

comprehend_looks(Role = #role{p_eqm = Peqm},
                 Eqm = #item{attr = Attr, extra = Extra,
                             base_id = BaseId},
                 LooksId) ->
    case blacksmith_data:get_comprehend_looks(LooksId) of
        _ when BaseId =:= LooksId ->
            NewExtra = lists:keydelete(9, 1, Extra),
            NewEqm = Eqm#item{extra = NewExtra},
            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                  NewEqm,
                                                  Peqm,
                                                  Role),
            NewRole = Role#role{p_eqm = NewPeqm},
            Msg = notice:format(lang:get("成功切换为~ts外观"),
                                [{item_2, LooksId}]),
            log:eqm(NewRole, "神器外观", Eqm, NewEqm),
            {ok, Msg, NewRole};
        {CraftLev, NeedVal} ->
            case [A
                  || A = #attr_base{type = 5, flag = CraftLev1} <- Attr,
                     CraftLev =:= CraftLev1]
                of
                [#attr_base{val = AttrVal}] when AttrVal >= NeedVal ->
                    NewExtra = lists:keystore(9,
                                              1,
                                              Extra,
                                              {9, LooksId, ""}),
                    NewEqm = Eqm#item{extra = NewExtra},
                    {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                          NewEqm,
                                                          Peqm,
                                                          Role),
                    NewRole = Role#role{p_eqm = NewPeqm},
                    Msg = notice:format(lang:get("成功切换为神器~ts外观"),
                                        [{item_2, LooksId}]),
                    log:eqm(NewRole, "神器外观", Eqm, NewEqm),
                    {ok, Msg, NewRole};
                _ -> {false, lang:get("该外观还没激活")}
            end;
        _ -> {false, lang:get("不能使用的外观")}
    end.

craft_to_name(1) -> lang:get("精良");
craft_to_name(2) -> lang:get("稀有");
craft_to_name(3) -> lang:get("优秀");
craft_to_name(4) -> lang:get("卓越");
craft_to_name(5) -> lang:get("完美");
craft_to_name(6) -> lang:get("逆天");
craft_to_name(7) -> lang:get("史诗");
craft_to_name(8) -> lang:get("传说");
craft_to_name(9) -> lang:get("至尊");
craft_to_name(10) -> lang:get("起源");
craft_to_name(11) -> lang:get("远古");
craft_to_name(12) -> lang:get("神话");
craft_to_name(13) -> lang:get("不朽");
craft_to_name(_) -> "".

decompose(#item{id = ItemId, base_id = BaseId}, Role) ->
    case blacksmith_data:get_decompose(BaseId) of
        #{gain := Gain} ->
            GainList = format:val_to_gain(Gain),
            Loss = [#loss{label = item_id, val = [{ItemId, 1}]}],
            case role_gain:do(Loss, Role) of
                {ok, Role1} ->
                    case role_gain:do(GainList, Role1) of
                        {ok, Role2} ->
                            Msg = notice:format(lang:get("分解~ts，获得~ts"),
                                                [{item_2, BaseId, 1},
                                                 {item_2, Gain}]),
                            {ok, Role2, Msg};
                        {false, _} -> {false, lang:get("背包已满，请先整理背包")}
                    end;
                {false, _} -> {false, lang:get("道具不足，无法拆解")}
            end;
        _ -> {false, lang:get("无法拆解的道具")}
    end.

embed(Eqm, HoleId, Stone, Role) ->
    do_embed([hole, find_stone, check_type, loss, make],
             Eqm,
             HoleId,
             Stone,
             Role,
             []).

do_embed([], _Eqm, _HoleId, Stone, Role, _Args) ->
    #{lev := StoneLev} = stone_info(Stone),
    Num = count_embed(Role),
    FireRole = role_trigger:fire([#evt_blacksmith_embed{num
                                                            = Num},
                                  #evt_blacksmith_embed_lev{lev = StoneLev}],
                                 Role),
    NewRole = FireRole,
    {ok, NewRole};
do_embed([hole | T],
         Eqm = #item{lev = Lev, attr = Attr}, HoleId, Stone,
         Role, Args) ->
    case lists:keyfind(HoleId, #attr_base.name, Attr) of
        false ->
            if HoleId =:= 110 andalso Lev >= 30 ->
                   do_embed(T, Eqm, HoleId, Stone, Role, Args);
               HoleId =:= 111 andalso Lev >= 60 ->
                   do_embed(T, Eqm, HoleId, Stone, Role, Args);
               HoleId =:= 112 andalso Lev >= 70 ->
                   do_embed(T, Eqm, HoleId, Stone, Role, Args);
               true -> {false, lang:get("未达到该孔要求的等级, 无法镶嵌")}
            end;
        _ -> {false, lang:get("已经镶嵌的孔无法再镶嵌")}
    end;
do_embed([find_stone | T], Eqm = #item{type = Type},
         HoleId = 112, Stone, Role, Args) ->
    case stone_info(Stone) of
        false -> {false, lang:get("该道具不能镶嵌")};
        #{lev := StoneLev} ->
            List = blacksmith_data:get_hero_embed(Type),
            case lists:keyfind(Stone, 1, List) of
                false -> {false, lang:get("该装备无法镶嵌该类型的宝石")};
                {StoneType, MaxNum} ->
                    do_embed(T,
                             Eqm,
                             HoleId,
                             Stone,
                             Role,
                             [{stone, StoneType, StoneLev, MaxNum} | Args])
            end
    end;
do_embed([find_stone | T], Eqm = #item{type = Type},
         HoleId, Stone, Role, Args) ->
    case stone_info(Stone) of
        false -> {false, lang:get("该道具不能镶嵌")};
        #{type := StoneType, lev := StoneLev} ->
            List = blacksmith_data:get_embed(Type),
            case lists:keyfind(StoneType, 1, List) of
                false -> {false, lang:get("该装备无法镶嵌该类型的宝石")};
                {StoneType, MaxNum} ->
                    do_embed(T,
                             Eqm,
                             HoleId,
                             Stone,
                             Role,
                             [{stone, StoneType, StoneLev, MaxNum} | Args])
            end
    end;
do_embed([check_type | T], Eqm = #item{attr = Attr},
         HoleId = 112, Stone, Role, Args) ->
    {_, StoneType, _StoneLev, MaxNum} = lists:keyfind(stone,
                                                      1,
                                                      Args),
    OldStoneVal = [Val
                   || #attr_base{type = 3, val = Val, name = N} <- Attr,
                      N =:= 112],
    case calc_stone_type(OldStoneVal, StoneType, MaxNum) of
        {false, Reason} -> {false, Reason};
        true -> do_embed(T, Eqm, HoleId, Stone, Role, Args)
    end;
do_embed([check_type | T], Eqm = #item{attr = Attr},
         HoleId, Stone, Role, Args) ->
    {_, StoneType, _StoneLev, MaxNum} = lists:keyfind(stone,
                                                      1,
                                                      Args),
    OldStoneVal = [Val
                   || #attr_base{type = 3, val = Val, name = N} <- Attr,
                      N =/= 112],
    case calc_stone_type(OldStoneVal, StoneType, MaxNum) of
        {false, Reason} -> {false, Reason};
        true -> do_embed(T, Eqm, HoleId, Stone, Role, Args)
    end;
do_embed([loss | T], Eqm, HoleId = 112, Stone, Role,
         Args) ->
    case blacksmith_data:hero_stone_cost(Stone) of
        Cost = [_ | _] ->
            Loss = format:val_to_loss(Cost),
            case role_gain:do(Loss, Role) of
                {false, _} ->
                    {false,
                     notice:format(lang:get("你的~ts不足"),
                                   [{assets_2, 90002}])};
                {ok, NewRole} ->
                    do_embed(T, Eqm, HoleId, Stone, NewRole, Args)
            end;
        _ -> {false, lang:get("不能镶嵌")}
    end;
do_embed([loss | T], Eqm, HoleId, Stone, Role, Args) ->
    Loss = [#loss{label = item_base_id_auto_buy,
                  val = [{Stone, 1}], msg = lang:get("宝石数量不足, 无法镶嵌"),
                  auto_scene = lang:get("镶嵌宝石")}],
    case role_gain:do(Loss, Role) of
        {false, _} ->
            {false,
             notice:format(lang:get("你的~ts不足"),
                           [{assets_2, 90002}])};
        {ok, NewRole} ->
            do_embed(T, Eqm, HoleId, Stone, NewRole, Args)
    end;
do_embed([make | T], Eqm = #item{attr = Attr}, HoleId,
         Stone, Role = #role{p_eqm = Peqm}, Args) ->
    HoleAttr = #attr_base{type = 3, name = HoleId, flag = 0,
                          val = Stone},
    NewEqm = Eqm#item{attr = [HoleAttr | Attr]},
    {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                          NewEqm,
                                          Peqm,
                                          Role),
    NewRole = Role#role{p_eqm = NewPeqm},
    log:eqm(NewRole, "装备宝石", Eqm, NewEqm),
    do_embed(T, NewEqm, HoleId, Stone, NewRole, Args).

stone_info(#item{base_id = BaseId}) ->
    case blacksmith_data:get_stone(BaseId) of
        Stone = #{} -> Stone;
        false -> false
    end;
stone_info(BaseId) ->
    case blacksmith_data:get_stone(BaseId) of
        Stone = #{} -> Stone;
        false -> false
    end.

calc_stone_type(_, _StoneType, MaxNum)
    when MaxNum =< 0 ->
    {false, lang:get("该装备镶嵌该类宝石已达上限")};
calc_stone_type([], _StoneType, _MaxNum) -> true;
calc_stone_type([StoneVal | T], StoneType, MaxNum) ->
    case stone_info(StoneVal) of
        #{type := StoneType} ->
            calc_stone_type(T, StoneType, MaxNum - 1);
        _ -> calc_stone_type(T, StoneType, MaxNum)
    end.

upstone(Eqm, HoleId, BaseId, Role) ->
    do_upstone([hole, calc, loss],
               Eqm,
               HoleId,
               BaseId,
               Role,
               #{}).

do_upstone([], _Eqm, _HoleId, _BaseId, Role,
           #{msg := Msg, attr := #attr_base{val = NewStone}}) ->
    #{lev := StoneLev} = stone_info(NewStone),
    {ok,
     role_trigger:fire([#evt_blacksmith_embed_lev{lev =
                                                      StoneLev}],
                       Role),
     Msg};
do_upstone([hole | T],
           Eqm = #item{attr = AttrList, lev = EqmLev}, HoleId,
           BaseId, Role, Args) ->
    case lists:keyfind(HoleId, #attr_base.name, AttrList) of
        false -> {false, lang:get("该孔没有镶嵌宝石, 无法升级")};
        Attr = #attr_base{val = Stone} ->
            case stone_info(Stone) of
                #{lev := 10} -> {false, lang:get("当前宝石已经满级, 无法继续升级")};
                #{need_eqm_lev := NeedEqmLev}
                    when EqmLev < NeedEqmLev ->
                    {false, lang:get("需要更高等级的装备才可以继续升级宝石")};
                #{} when HoleId =:= 112 ->
                    case blacksmith_data:hero_stone_val(Stone) of
                        #{loss := Loss, exp := StoneExp} ->
                            do_upstone(T,
                                       Eqm,
                                       HoleId,
                                       BaseId,
                                       Role,
                                       Args#{attr => Attr, exp => StoneExp,
                                             loss => Loss});
                        _Err -> {false, lang:get("只能用同类宝石来升级")}
                    end;
                #{type := StoneType} ->
                    case blacksmith_data:stone_val(BaseId) of
                        {StoneType, StoneExp} ->
                            do_upstone(T,
                                       Eqm,
                                       HoleId,
                                       BaseId,
                                       Role,
                                       Args#{attr => Attr, exp => StoneExp});
                        _Err -> {false, lang:get("只能用同类宝石来升级")}
                    end;
                _Err -> {false, lang:get("只能用同类宝石来升级")}
            end
    end;
do_upstone([calc | T], Eqm, HoleId = 112, BaseId, Role,
           Args = #{attr :=
                        Attr = #attr_base{flag = Flag, val = Stone},
                    exp := OneExp}) ->
    case calc_hero_upstone(Stone, Flag, OneExp) of
        {false, Reason} -> {false, Reason};
        {NewStone, NewFlag, Msg} ->
            NewAttr = Attr#attr_base{flag = NewFlag,
                                     val = NewStone},
            do_upstone(T,
                       Eqm,
                       HoleId,
                       BaseId,
                       Role,
                       Args#{attr => NewAttr, msg => Msg})
    end;
do_upstone([calc | T], Eqm, HoleId, BaseId, Role,
           Args = #{attr :=
                        Attr = #attr_base{flag = Flag, val = Stone},
                    exp := OneExp}) ->
    case calc_upstone(Stone, Flag, OneExp) of
        {false, Reason} -> {false, Reason};
        {NewStone, NewFlag, NeedNum, Msg} ->
            NewAttr = Attr#attr_base{flag = NewFlag,
                                     val = NewStone},
            do_upstone(T,
                       Eqm,
                       HoleId,
                       BaseId,
                       Role,
                       Args#{attr => NewAttr, num => NeedNum, msg => Msg})
    end;
do_upstone([loss | T], Eqm = #item{attr = AttrList},
           HoleId = 112, BaseId, Role = #role{p_eqm = Peqm},
           Args = #{attr := Attr = #attr_base{name = Name},
                    loss := Cost}) ->
    Loss = format:val_to_loss(Cost),
    Result = case role_gain:do_notice(Loss, Role) of
                 {false, #loss{msg = Msg}} -> {false, Msg};
                 {ok, Role1} -> {ok, Role1}
             end,
    case Result of
        {false, Reason} -> {false, Reason};
        {ok, NewRole} ->
            NewAttrList = lists:keystore(Name,
                                         #attr_base.name,
                                         AttrList,
                                         Attr),
            NewEqm = Eqm#item{attr = NewAttrList},
            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                  NewEqm,
                                                  Peqm,
                                                  NewRole),
            NewRole1 = NewRole#role{p_eqm = NewPeqm},
            log:eqm(NewRole1, "英雄宝石升级", Eqm, NewEqm),
            do_upstone(T, NewEqm, HoleId, BaseId, NewRole1, Args)
    end;
do_upstone([loss | T], Eqm = #item{attr = AttrList},
           HoleId, BaseId, Role = #role{p_eqm = Peqm},
           Args = #{attr := Attr = #attr_base{name = Name},
                    num := NeedNum}) ->
    Result = case NeedNum > 0 of
                 true ->
                     Loss = [#loss{label = item_base_id_auto_buy,
                                   val = [{BaseId, NeedNum}],
                                   msg = lang:get("宝石不足, 无法升级"),
                                   auto_scene = lang:get("升级宝石")}],
                     case role_gain:do_notice(Loss, Role) of
                         {false, _} ->
                             {false,
                              notice:format(lang:get("你的~ts不足"),
                                            [{assets_2, 90002}])};
                         {ok, Role1} -> {ok, Role1}
                     end;
                 false -> {ok, Role}
             end,
    case Result of
        {false, Reason} -> {false, Reason};
        {ok, NewRole} ->
            NewAttrList = lists:keystore(Name,
                                         #attr_base.name,
                                         AttrList,
                                         Attr),
            NewEqm = Eqm#item{attr = NewAttrList},
            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                  NewEqm,
                                                  Peqm,
                                                  NewRole),
            NewRole1 = NewRole#role{p_eqm = NewPeqm},
            log:eqm(NewRole1, "宝石升级", Eqm, NewEqm),
            do_upstone(T, NewEqm, HoleId, BaseId, NewRole1, Args)
    end.

calc_upstone(Stone, Exp, OneExp) ->
    case stone_info(Stone) of
        #{lev := 10} -> {false, lang:get("宝石已经满级, 无法继续提升")};
        #{next_id := NextStone, max_exp := MaxExp} ->
            case MaxExp > Exp of
                true ->
                    NeedNum = util:ceil((MaxExp - Exp) / OneExp),
                    Msg = notice:format(lang:get("~ts升至~ts"),
                                        [{item_2, Stone}, {item_2, NextStone}]),
                    {NextStone, 0, NeedNum, Msg};
                false ->
                    Msg = notice:format(lang:get("~ts升至~ts"),
                                        [{item_2, Stone}, {item_2, NextStone}]),
                    {NextStone, 0, 0, Msg}
            end;
        _ ->
            logger:error("无法找到宝石:~w", [Stone], blacksmith, 1008),
            {false, lang:get("找不到宝石数据, 无法提升")}
    end.

calc_hero_upstone(Stone, Exp, OneExp) ->
    case stone_info(Stone) of
        #{next_id := NextStone, max_exp := MaxExp} ->
            case MaxExp > OneExp + Exp of
                true ->
                    Msg = notice:format(lang:get("~ts增加~ts经验"),
                                        [{item_2, Stone},
                                         {string_2, 5, OneExp div 5}]),
                    {Stone, Exp + OneExp, Msg};
                false ->
                    Msg = notice:format(lang:get("~ts升至~ts"),
                                        [{item_2, Stone}, {item_2, NextStone}]),
                    {NextStone, max(0, OneExp + Exp - MaxExp), Msg}
            end;
        #{} -> {false, lang:get("宝石已经满级, 无法继续提升")};
        _ ->
            logger:error("无法找到宝石:~w", [Stone], blacksmith, 1027),
            {false, lang:get("找不到宝石数据, 无法提升")}
    end.

up_hero_stone(Role, Args = #{hole := 112}) ->
    do_up_hero_stone([hole, calc, loss], Role, Args);
up_hero_stone(_Role, _) ->
    {false, lang:get("请指定英雄宝石进行升级")}.

do_up_hero_stone([], Role,
                 #{msg := Msg, attr := #attr_base{val = NewStone}}) ->
    #{lev := StoneLev} = stone_info(NewStone),
    {ok,
     role_trigger:fire([#evt_blacksmith_embed_lev{lev =
                                                      StoneLev}],
                       Role),
     Msg};
do_up_hero_stone([hole | T], Role,
                 Args = #{eqm := #item{attr = AttrList, lev = EqmLev},
                          hole := HoleId}) ->
    case lists:keyfind(HoleId, #attr_base.name, AttrList) of
        false -> {false, lang:get("该孔没有镶嵌宝石, 无法升级")};
        Attr = #attr_base{val = Stone} ->
            case stone_info(Stone) of
                #{need_eqm_lev := NeedEqmLev}
                    when EqmLev < NeedEqmLev ->
                    {false, lang:get("需要更高等级的装备才可以继续升级宝石")};
                #{next_id := _NextId} when HoleId =:= 112 ->
                    case blacksmith_data:hero_stone_val(Stone) of
                        #{loss := Loss, exp := StoneExp} ->
                            do_up_hero_stone(T,
                                             Role,
                                             Args#{attr => Attr,
                                                   exp => StoneExp,
                                                   loss => Loss});
                        _Err -> {false, lang:get("只能用同类宝石来升级")}
                    end;
                _Err -> {false, lang:get("当前宝石已经满级, 无法继续升级")}
            end
    end;
do_up_hero_stone([calc | T], Role,
                 Args = #{attr :=
                              Attr = #attr_base{flag = Flag, val = Stone},
                          exp := OneExp, num := Num, loss := Cost}) ->
    case calc_hero_upstone(Stone, Flag, OneExp * Num) of
        {false, Reason} -> {false, Reason};
        {NewStone, NewFlag, Msg} ->
            NewAttr = Attr#attr_base{flag = NewFlag,
                                     val = NewStone},
            Cost1 = [{I, N * Num} || {I, N} <- Cost],
            do_up_hero_stone(T,
                             Role,
                             Args#{attr => NewAttr, msg => Msg, loss := Cost1})
    end;
do_up_hero_stone([loss | T], Role = #role{p_eqm = Peqm},
                 Args = #{eqm := Eqm = #item{attr = AttrList},
                          attr := Attr = #attr_base{name = Name},
                          loss := Cost}) ->
    Loss = format:val_to_loss(Cost),
    Result = case role_gain:do_notice(Loss, Role) of
                 {false, #loss{msg = Msg}} -> {false, Msg};
                 {ok, Role1} -> {ok, Role1}
             end,
    case Result of
        {false, Reason} -> {false, Reason};
        {ok, NewRole} ->
            NewAttrList = lists:keystore(Name,
                                         #attr_base.name,
                                         AttrList,
                                         Attr),
            NewEqm = Eqm#item{attr = NewAttrList},
            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                  NewEqm,
                                                  Peqm,
                                                  NewRole),
            NewRole1 = NewRole#role{p_eqm = NewPeqm},
            log:eqm(NewRole1, "英雄宝石升级", Eqm, NewEqm),
            do_up_hero_stone(T, NewRole1, Args#{eqm := NewEqm})
    end.

removestone(Eqm, HoleId, Role) ->
    do_removestone([hole, gain], Eqm, HoleId, Role, #{}).

do_removestone([], _Eqm, _HoleId, Role, _Args) ->
    {ok, Role};
do_removestone([hole | T], Eqm = #item{attr = AttrList},
               HoleId = 112, Role = #role{p_eqm = Peqm}, Args) ->
    case lists:keyfind(HoleId, #attr_base.name, AttrList) of
        false -> {false, lang:get("该孔没有镶嵌宝石, 无法摘除")};
        #attr_base{val = Stone} ->
            case blacksmith_data:remove_hero_stone(Stone) of
                #{gain := Gain, loss := LossVal} ->
                    Loss = format:val_to_loss(LossVal),
                    case role_gain:do(Loss, Role) of
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        {ok, Role1} ->
                            NewAttr = lists:keydelete(HoleId,
                                                      #attr_base.name,
                                                      AttrList),
                            NewEqm = Eqm#item{attr = NewAttr},
                            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                                  NewEqm,
                                                                  Peqm,
                                                                  Role),
                            NewRole = Role1#role{p_eqm = NewPeqm},
                            NewArgs = Args#{gain => Gain},
                            do_removestone(T,
                                           NewEqm,
                                           HoleId,
                                           NewRole,
                                           NewArgs#{base_eqm => Eqm})
                    end;
                _ -> {false, lang:get("不可摘除的宝石")}
            end
    end;
do_removestone([hole | T], Eqm = #item{attr = AttrList},
               HoleId, Role = #role{p_eqm = Peqm}, Args) ->
    case lists:keyfind(HoleId, #attr_base.name, AttrList) of
        false -> {false, lang:get("该孔没有镶嵌宝石, 无法摘除")};
        #attr_base{flag = Flag, val = Stone} ->
            case blacksmith_data:remove_stone(Stone) of
                #{base_id := BaseId, val := Val, loss := LossVal} ->
                    Loss = format:val_to_loss(LossVal),
                    case role_gain:do(Loss, Role) of
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        {ok, Role1} ->
                            NewVal = Flag + Val,
                            Gain = [{BaseId, NewVal}],
                            NewAttr = lists:keydelete(HoleId,
                                                      #attr_base.name,
                                                      AttrList),
                            NewEqm = Eqm#item{attr = NewAttr},
                            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                                  NewEqm,
                                                                  Peqm,
                                                                  Role),
                            NewRole = Role1#role{p_eqm = NewPeqm},
                            NewArgs = Args#{gain => Gain},
                            do_removestone(T,
                                           NewEqm,
                                           HoleId,
                                           NewRole,
                                           NewArgs#{base_eqm => Eqm})
                    end;
                _ -> {false, lang:get("不可摘除的宝石")}
            end
    end;
do_removestone([gain | T], Eqm, HoleId, Role,
               Args = #{gain := GainVal, base_eqm := BaseEqm}) ->
    Gain = format:val_to_gain(GainVal),
    case role_gain:do_notice(Gain, Role, lang:get("拆除成功，"))
        of
        {ok, NewRole} ->
            log:eqm(NewRole, "宝石摘除", BaseEqm, Eqm),
            do_removestone(T, Eqm, HoleId, NewRole, Args);
        {false, _} -> {false, lang:get("请先整理背包, 再来进行摘除")}
    end.

stone_classes_modify(Role = #role{}, Eqm, HoleId,
                     TargetStoneId) ->
    case HoleId of
        112 ->
            do_hero_stone_classes_modify([find_stone,
                                          check_type,
                                          check_free_times,
                                          make],
                                         Eqm,
                                         HoleId,
                                         TargetStoneId,
                                         Role,
                                         []);
        _ ->
            do_stone_classes_modify([find_stone,
                                     check_type,
                                     check_free_times,
                                     check_price,
                                     make],
                                    Eqm,
                                    HoleId,
                                    TargetStoneId,
                                    Role,
                                    [])
    end.

do_stone_classes_modify([], _Eqm, _HoleId, _Stone, Role,
                        _Args) ->
    {ok, Role};
do_stone_classes_modify([find_stone | _T], _Eqm, 112,
                        _Stone, _Role, _Args) ->
    {false, lang:get("英雄宝石不能转化")};
do_stone_classes_modify([find_stone | T],
                        Eqm = #item{type = Type}, HoleId, Stone, Role, Args) ->
    case stone_info(Stone) of
        false -> {false, lang:get("不能转化为目标宝石")};
        #{type := StoneType} ->
            List = blacksmith_data:get_embed(Type),
            case lists:keyfind(StoneType, 1, List) of
                false -> {false, lang:get("转化失败,该装备无法镶嵌目标类型的宝石")};
                {StoneType, _MaxNum} ->
                    do_stone_classes_modify(T,
                                            Eqm,
                                            HoleId,
                                            Stone,
                                            Role,
                                            Args)
            end
    end;
do_stone_classes_modify([check_type | T],
                        Eqm = #item{attr = Attr}, HoleId, Stone, Role, Args) ->
    case lists:keyfind(HoleId, #attr_base.name, Attr) of
        #attr_base{val = OldStoneId} ->
            case
                blacksmith_data:get_stone_classes_modify(OldStoneId)
                of
                {OldBaseStoneId, OldStoneCount, OldStoneLev} ->
                    case blacksmith_data:get_stone_classes_modify(Stone) of
                        false -> {false, lang:get("不能转化为目标宝石")};
                        {BaseStoneId, _StoneCount, StoneLev} ->
                            case BaseStoneId =:= OldBaseStoneId of
                                false ->
                                    case StoneLev =< OldStoneLev of
                                        false -> {false, lang:get("只能转换为同级宝石")};
                                        _ ->
                                            do_stone_classes_modify(T,
                                                                    Eqm,
                                                                    HoleId,
                                                                    Stone,
                                                                    Role,
                                                                    [{stone_base_id,
                                                                      OldBaseStoneId,
                                                                      OldStoneLev,
                                                                      OldStoneCount,
                                                                      BaseStoneId}
                                                                     | Args])
                                    end;
                                true -> {false, lang:get("同类宝石不需要转换")}
                            end
                    end;
                false -> {false, lang:get("宝石转换配置错误")}
            end;
        _ -> {false, lang:get("该孔未镶嵌宝石，不能进行转化")}
    end;
do_stone_classes_modify([check_free_times | T],
                        Eqm = #item{extra = Extra}, HoleId, Stone, Role,
                        Args) ->
    case HoleId of
        110 ->
            case lists:keyfind(21, 1, Extra) of
                {_, _, _} ->
                    do_stone_classes_modify(T,
                                            Eqm,
                                            HoleId,
                                            Stone,
                                            Role,
                                            Args);
                _ -> {false, lang:get("宝石转换次数不足，无法进行转换")}
            end;
        111 ->
            case lists:keyfind(22, 1, Extra) of
                {_, _, _} ->
                    do_stone_classes_modify(T,
                                            Eqm,
                                            HoleId,
                                            Stone,
                                            Role,
                                            Args);
                _ -> {false, lang:get("宝石转换次数不足，无法进行转换")}
            end;
        _ -> {false, lang:get("宝石转换次数不足，无法进行转换")}
    end;
do_stone_classes_modify([check_price | T], Eqm, HoleId,
                        Stone, Role, Args) ->
    case lists:keyfind(stone_base_id, 1, Args) of
        {stone_base_id,
         OldBaseStoneId,
         OldStoneLev,
         OldStoneCount,
         BaseStoneId} ->
            case market_gold:query_market_price(OldBaseStoneId) of
                {ok, #market_price{price = OldStonePrice}} ->
                    case market_gold:query_market_price(BaseStoneId) of
                        {ok, #market_price{price = StonePrice}} ->
                            OldStoneTotalPrice = OldStonePrice * OldStoneCount,
                            TargetStoneLev =
                                get_target_stone_lev(OldStoneTotalPrice,
                                                     StonePrice,
                                                     OldStoneLev),
                            TargetStoneId =
                                blacksmith_data:get_target_stone_id({BaseStoneId,
                                                                     TargetStoneLev}),
                            case
                                blacksmith_data:get_stone_classes_modify(TargetStoneId)
                                of
                                {_, StoneCount, StoneLev} ->
                                    StoneTotalPrice = StonePrice * StoneCount,
                                    logger:debug("OldStoneTotalPrice, StoneTotalPrice:~w",
                                                 [{OldStoneTotalPrice,
                                                   StoneTotalPrice}],
                                                 blacksmith,
                                                 1234),
                                    NewArgs = [{stone_id, TargetStoneId}
                                               | Args],
                                    case OldStoneTotalPrice >= StoneTotalPrice
                                             andalso OldStoneLev > StoneLev
                                        of
                                        true ->
                                            LeftPrice = OldStoneTotalPrice -
                                                            StoneTotalPrice,
                                            case LeftPrice div StonePrice of
                                                ReplyCount
                                                    when ReplyCount > 0 andalso
                                                             StoneCount <
                                                                 OldStoneCount ->
                                                    MailGainStone =
                                                        [{BaseStoneId,
                                                          1,
                                                          ReplyCount}],
                                                    do_stone_classes_modify(T,
                                                                            Eqm,
                                                                            HoleId,
                                                                            Stone,
                                                                            Role,
                                                                            [{mail_gain_stone,
                                                                              MailGainStone}
                                                                             | NewArgs]);
                                                _ ->
                                                    do_stone_classes_modify(T,
                                                                            Eqm,
                                                                            HoleId,
                                                                            Stone,
                                                                            Role,
                                                                            NewArgs)
                                            end;
                                        false ->
                                            case OldStoneTotalPrice >=
                                                     StoneTotalPrice
                                                of
                                                true ->
                                                    do_stone_classes_modify(T,
                                                                            Eqm,
                                                                            HoleId,
                                                                            Stone,
                                                                            Role,
                                                                            [{sold_stone,
                                                                              OldBaseStoneId,
                                                                              OldStoneTotalPrice
                                                                                  -
                                                                                  StoneTotalPrice}
                                                                             | NewArgs]);
                                                _ ->
                                                    do_stone_classes_modify(T,
                                                                            Eqm,
                                                                            HoleId,
                                                                            Stone,
                                                                            Role,
                                                                            NewArgs)
                                            end
                                    end;
                                false -> {false, lang:get("无法转换的宝石")}
                            end;
                        _ -> {false, lang:get("宝石价格查询错误，转换失败")}
                    end;
                _ -> {false, lang:get("宝石价格查询错误，转换失败")}
            end;
        _ -> {false, lang:get("程序运行错误")}
    end;
do_stone_classes_modify([make | T],
                        Eqm = #item{attr = Attr, extra = Extra}, HoleId, Stone,
                        Role = #role{p_eqm = Peqm}, Args) ->
    {_, TargetStoneId} = lists:keyfind(stone_id, 1, Args),
    HoleAttr = #attr_base{type = 3, name = HoleId, flag = 0,
                          val = TargetStoneId},
    NewExtra = case HoleId of
                   110 -> lists:keydelete(21, 1, Extra);
                   111 -> lists:keydelete(22, 1, Extra);
                   _ -> Extra
               end,
    NewAttr = lists:keystore(HoleId,
                             #attr_base.name,
                             Attr,
                             HoleAttr),
    NewEqm = Eqm#item{attr = NewAttr, extra = NewExtra},
    {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                          NewEqm,
                                          Peqm,
                                          Role),
    NewRole = Role#role{p_eqm = NewPeqm},
    log:eqm(NewRole, "转换宝石", Eqm, NewEqm),
    case lists:keyfind(mail_gain_stone, 1, Args) of
        {mail_gain_stone, MailGainStone} ->
            Title = lang:get("宝石转换"),
            Content =
                lang:get("由于您进行的宝石转换时降级了，宝石剩余的价值按照市场价格帮您转换为目标宝石，请查收:"),
            mail:send(Role,
                      #{title => Title, content => Content,
                        items => MailGainStone}),
            NoticeMsg =
                notice:format(lang:get("由于宝石市场差价，降级后剩余价值转换的宝石已有~ts进行返还"),
                              [{string_2, 5, lang:get("邮件")}]),
            notice:send(Role, 1, NoticeMsg);
        _ -> skip
    end,
    case lists:keyfind(sold_stone, 1, Args) of
        {sold_stone, OldBaseStoneId, LeftPrice} ->
            case market_gold:query_market_price(OldBaseStoneId) of
                {ok, #market_price{price = StonePrice}} ->
                    logger:debug("~w",
                                 [{LeftPrice, StonePrice}],
                                 blacksmith,
                                 1301),
                    case LeftPrice div StonePrice of
                        SoldNum when SoldNum > 0 ->
                            market_gold:change_margin(sold,
                                                      {OldBaseStoneId, SoldNum},
                                                      Role),
                            ok;
                        _ -> skip
                    end;
                _ ->
                    logger:error("查询不到价格~w",
                                 [OldBaseStoneId],
                                 blacksmith,
                                 1309),
                    skip
            end;
        _ -> skip
    end,
    do_stone_classes_modify(T,
                            NewEqm,
                            HoleId,
                            Stone,
                            NewRole,
                            Args).

do_hero_stone_classes_modify([], _Eqm, _HoleId, _Stone,
                             Role, _Args) ->
    {ok, Role};
do_hero_stone_classes_modify([find_stone | T],
                             Eqm = #item{type = Type, attr = Attr}, HoldId,
                             Stone, Role, Args) ->
    case lists:keyfind(HoldId, #attr_base.name, Attr) of
        #attr_base{val = OldStoneId} ->
            case stone_info(Stone) of
                #{type := StoneType} ->
                    List = blacksmith_data:get_hero_embed(Type),
                    case check_hero_type(List, StoneType) of
                        false -> {false, lang:get("转换失败,该装备无法镶嵌目标类型的英雄宝石")};
                        _ ->
                            do_hero_stone_classes_modify(T,
                                                         Eqm,
                                                         HoldId,
                                                         Stone,
                                                         Role,
                                                         [{stone_id, OldStoneId}
                                                          | Args])
                    end;
                _ -> {false, lang:get("不能转换为目标英雄宝石")}
            end;
        _ -> {false, lang:get("该孔未镶嵌英雄宝石,不能进行转换")}
    end;
do_hero_stone_classes_modify([check_type | T], Eqm,
                             HoldId, Stone, Role, Args) ->
    case lists:keyfind(stone_id, 1, Args) of
        {stone_id, OldStoneId} ->
            case blacksmith_data:get_stone(OldStoneId) of
                #{lev := OldLev} ->
                    case blacksmith_data:get_stone(Stone) of
                        #{lev := NewLev} ->
                            case OldLev =:= NewLev of
                                false -> {false, lang:get("只能转换为同级英雄宝石")};
                                _ ->
                                    do_hero_stone_classes_modify(T,
                                                                 Eqm,
                                                                 HoldId,
                                                                 Stone,
                                                                 Role,
                                                                 Args)
                            end;
                        _ -> {false, lang:get("英雄宝石配置错误")}
                    end;
                _ -> {false, lang:get("英雄宝石配置错误")}
            end;
        _ -> {false, lang:get("系统数据错误")}
    end;
do_hero_stone_classes_modify([check_free_times | T],
                             Eqm = #item{extra = Extra}, HoleId, Stone, Role,
                             Args) ->
    case lists:keyfind(30, 1, Extra) of
        {_, _, _} ->
            do_hero_stone_classes_modify(T,
                                         Eqm,
                                         HoleId,
                                         Stone,
                                         Role,
                                         Args);
        _ -> {false, lang:get("英雄宝石转换次数不足,无法进行转换")}
    end;
do_hero_stone_classes_modify([make | T],
                             Eqm = #item{attr = Attr, extra = Extra}, HoleId,
                             Stone, Role = #role{p_eqm = Peqm}, Args) ->
    case lists:keyfind(HoleId, #attr_base.name, Attr) of
        OldHoleAttr = #attr_base{} ->
            NewHoleAttr = OldHoleAttr#attr_base{type = 3,
                                                name = HoleId, val = Stone},
            NewExtra = lists:keydelete(30, 1, Extra),
            NewAttr = lists:keystore(HoleId,
                                     #attr_base.name,
                                     Attr,
                                     NewHoleAttr),
            NewEqm = Eqm#item{attr = NewAttr, extra = NewExtra},
            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                  NewEqm,
                                                  Peqm,
                                                  Role),
            NewRole = Role#role{p_eqm = NewPeqm},
            log:eqm(NewRole, "转换英雄宝石", Eqm, NewEqm),
            do_hero_stone_classes_modify(T,
                                         NewEqm,
                                         HoleId,
                                         Stone,
                                         NewRole,
                                         Args);
        _ -> {false, lang:get("该孔未镶嵌英雄宝石,不能进行转换")}
    end.

check_hero_type([], _StoneType) -> false;
check_hero_type([{Stone, _} | T], StoneType) ->
    case stone_info(Stone) of
        #{type := StoneType} -> true;
        _ -> check_hero_type(T, StoneType)
    end.

check_break_enchant(Eqm = #item{lev = EqmLev,
                                enchant = Enchant, type = Type},
                    #role{}) ->
    case is_enchant_break(Eqm) of
        true -> {false, lang:get("已经突破过的装备，无需再次突破")};
        false ->
            case blacksmith_data:get_break_enchant(Type) of
                #{need_lev := NeedLev} when EqmLev < NeedLev ->
                    {false,
                     util:flist(lang:get("该装备等级不足~w, 无法突破"), [NeedLev])};
                #{need_enchant := NeedEnchant}
                    when Enchant =/= NeedEnchant ->
                    {false,
                     util:flist(lang:get("该装备强化等级不足~w, 无法突破"),
                                [NeedEnchant])};
                #{need_item := NeedItem} -> {true, NeedItem};
                _ -> {false, lang:get("该装备不能突破")}
            end
    end.

break_enchant_loss(NeedItem, Role) ->
    Loss = format:val_to_loss(NeedItem),
    case role_gain:do_notice(Loss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, NewRole} -> {ok, NewRole}
    end.

break_enchant_make(Eqm = #item{extra = Extra},
                   Role = #role{p_eqm = Peqm}) ->
    NewExtra = lists:keystore(10, 1, Extra, {10, 1, ""}),
    NewEqm = eqm_attr:calc_eqm(Eqm#item{extra = NewExtra}),
    {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                          NewEqm,
                                          Peqm,
                                          Role),
    NewRole = Role#role{p_eqm = NewPeqm},
    log:eqm(NewRole, "装备突破", Eqm, NewEqm),
    {ok, lang:get("突破成功"), NewRole}.

check_enchant(Eqm = #item{type = Type,
                          enchant = Enchant, lev = EqmLev,
                          growth_lev = GrowthLev, growth_val = GrowthVal,
                          extra = Extra},
              LuckBaseList, ProtectBaseId, #role{lev = RoleLev}) ->
    case blacksmith_data:get_growth(GrowthLev) of
        MaxGrowthVal
            when is_integer(MaxGrowthVal) andalso
                     GrowthVal >= MaxGrowthVal ->
            growth;
        _ ->
            IsEnchantBreak = is_enchant_break(Eqm),
            case blacksmith_data:get_enchant({Type, Enchant}) of
                #{need_lev := NeedLev} when EqmLev < NeedLev ->
                    {false,
                     util:flist(lang:get("该装备等级不足~w, 无法继续强化"), [NeedLev])};
                #{need_role_lev := NeedRoleLev}
                    when RoleLev < NeedRoleLev ->
                    {false,
                     util:flist(lang:get("角色等级不足~w, 无法继续强化"),
                                [NeedRoleLev])};
                #{need_break := 1} when IsEnchantBreak =:= false ->
                    {false, lang:get("该装备需要先突破才能继续强化")};
                #{base_ratio := BaseRatio, loss_enchant := LossEnchant,
                  break_loss_enchant := BreakLossEnchant,
                  max_lev_loss_enchant := MaxLevLossEnchant,
                  allow_luck := AllowLuck, need_coin := NeedCoin,
                  need_item := NeedItem, allow_protect := AllowProtect} ->
                    MaxEnchantLev = case lists:keyfind(23, 1, Extra) of
                                        {_, OldMaxEnchantLev, _} ->
                                            OldMaxEnchantLev;
                                        _ -> Enchant
                                    end,
                    NewLossEnchant = case lists:keyfind(MaxEnchantLev,
                                                        1,
                                                        MaxLevLossEnchant)
                                         of
                                         {_, MaxLossEnchant} -> MaxLossEnchant;
                                         _ ->
                                             case IsEnchantBreak of
                                                 true -> BreakLossEnchant;
                                                 _ -> LossEnchant
                                             end
                                     end,
                    case check_luck(AllowLuck, LuckBaseList, Enchant, [], 0)
                        of
                        {false, Reason} -> {false, Reason};
                        {true, NewLuckBaseList} ->
                            case ProtectBaseId =:= 0 of
                                true ->
                                    {true,
                                     BaseRatio,
                                     NewLossEnchant,
                                     NeedItem,
                                     NeedCoin,
                                     NewLuckBaseList,
                                     []};
                                false ->
                                    case lists:member(ProtectBaseId,
                                                      AllowProtect)
                                        of
                                        true ->
                                            {true,
                                             BaseRatio,
                                             NewLossEnchant,
                                             NeedItem,
                                             NeedCoin,
                                             NewLuckBaseList,
                                             [{ProtectBaseId, 1}]};
                                        false ->
                                            {false, lang:get("当前保护符不适用当前强化等级")}
                                    end
                            end
                    end;
                false -> {false, lang:get("该装备已强化至上限")}
            end
    end.

check_luck(_AllowLuck, _LuckBaseList, _Enchant,
           _NewLuckBase, Num)
    when Num > 3 ->
    {false, lang:get("最多放入3个幸运石")};
check_luck(_AllowLuck, [], _Enchant, LuckBaseList,
           _Num) ->
    {true, LuckBaseList};
check_luck(_AllowLuck, [{_, 0} | _T], _Enchant,
           _LuckBaseList, _Num) ->
    {false, lang:get("幸运石数量为0, 无法放入")};
check_luck(AllowLuck, [{20016, _N} | T], Enchant,
           LuckBaseList, Num) ->
    case Enchant =:= 8 of
        true ->
            check_luck(AllowLuck,
                       T,
                       Enchant,
                       [{20016, 1} | LuckBaseList],
                       Num + 1);
        false -> {false, lang:get("九彩幸运石只能用于+8装备")}
    end;
check_luck(AllowLuck, [{20023, _N} | T], Enchant,
           LuckBaseList, Num) ->
    case Enchant =:= 7 of
        true ->
            check_luck(AllowLuck,
                       T,
                       Enchant,
                       [{20023, 1} | LuckBaseList],
                       Num + 1);
        false -> {false, lang:get("八彩幸运石只能用于+7装备")}
    end;
check_luck(AllowLuck, [{LuckBase, N} | T], Enchant,
           LuckBaseList, Num) ->
    case lists:member(LuckBase, AllowLuck) of
        true ->
            check_luck(AllowLuck,
                       T,
                       Enchant,
                       [{LuckBase, N} | LuckBaseList],
                       Num + N);
        false ->
            logger:error("不可放入的幸运石:~w, ~w",
                         [LuckBase, AllowLuck],
                         blacksmith,
                         1513),
            {false, lang:get("不可放入该幸运石")}
    end.

enchant_loss(NeedCoin, NeedItem, LuckBaseList,
             ProtectItem, Role) ->
    CoinLoss = [#loss{label = coin, val = NeedCoin,
                      msg = lang:get("银币不足，无法强化")}],
    LuckLoss = case LuckBaseList of
                   [_ | _] ->
                       [#loss{label = item_base_id_auto_buy,
                              val = LuckBaseList, msg = lang:get("幸运石不存在"),
                              auto_scene = lang:get("强化幸运石")}];
                   _ -> []
               end,
    StoneLoss = case NeedItem of
                    [_ | _] ->
                        [#loss{label = item_base_id_auto_buy, val = NeedItem,
                               msg = lang:get("强化材料不足"),
                               auto_scene = lang:get("强化石")}];
                    _ -> []
                end,
    ProtectLoss = case ProtectItem of
                      [_ | _] ->
                          [#loss{label = item_base_id, val = ProtectItem,
                                 msg = lang:get("保护符不足")}];
                      _ -> []
                  end,
    Loss = CoinLoss ++ LuckLoss ++ StoneLoss ++ ProtectLoss,
    case role_gain:do(Loss, Role, #{}) of
        {false, #loss{label = coin}} ->
            {false,
             notice:format(lang:get("你的~ts不足"),
                           [{assets_2, 90000}])};
        {false, #loss{label = item_base_id}} ->
            {false, lang:get("保护符不足，无法强化")};
        {false, _L} ->
            {false,
             notice:format(lang:get("你的~ts不足"),
                           [{assets_2, 90002}])};
        {ok, NewRole, #{new_gl := NewGL}} ->
            notice:gl(NewGL, NewRole),
            {ok, NewRole};
        {ok, NewRole, _Opts} -> {ok, NewRole}
    end.

random_luck(Ratio, Luck,
            _Role = #role{m_guild = MGuild}) ->
    GuildRatio = case MGuild of
                     #m_guild{id = GuildId} ->
                         case guild_data:academy(guild_mgr:attr(GuildId,
                                                                #guild.academy_lev))
                             of
                             #{enchant_rate := ER} -> ER;
                             _ -> 0
                         end;
                     _ -> 0
                 end,
    AllVal = trunc(enchant_luck(Ratio, Luck)) + GuildRatio,
    case AllVal >= 1000 of
        true -> {true, 1000};
        false ->
            Seed = util:rand(1, 1000),
            {Seed >= 1 andalso Seed =< AllVal, AllVal}
    end.

enchant_luck(Ratio, []) -> Ratio;
enchant_luck(Ratio, [{BaseId, Num} | T]) ->
    LuckVal = blacksmith_data:item_to_luck(BaseId) * Num,
    enchant_luck(Ratio + LuckVal, T).

update_max_enchant_lev(Eqm = #item{extra = Extra,
                                   enchant = Enchant}) ->
    MaxEnchant = case lists:keyfind(23, 1, Extra) of
                     {_, OldEnchant, _} -> max(OldEnchant, Enchant);
                     _ -> Enchant
                 end,
    NewExtra = lists:keystore(23,
                              1,
                              Extra,
                              {23, MaxEnchant, ""}),
    Eqm#item{extra = NewExtra}.

enchant_cast(growth,
             Eqm = #item{enchant = Enchant, growth_lev = GrowthLev,
                         base_id = EqmBaseId, type = EqmType, pos = EqmPos,
                         quality = EqmQuality},
             LuckBaseList,
             Role = #role{p_eqm = Peqm, name = RoleName}) ->
    NewEnchant = max(Enchant, GrowthLev),
    Eqm1 = eqm_attr:calc_eqm(Eqm#item{enchant = NewEnchant,
                                      growth_lev = 0, growth_val = 0}),
    NewEqm = update_max_enchant_lev(Eqm1),
    {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                          NewEqm,
                                          Peqm,
                                          Role),
    Role0 = Role#role{p_eqm = NewPeqm},
    PreAllLev = enchant_all_lev(Peqm),
    AllLev = enchant_all_lev(NewPeqm),
    PreSumLev = enchant_sum_lev(Peqm, 0),
    SumLev = enchant_sum_lev(NewPeqm, 0),
    Role1 = notice_all_lev(Role0, AllLev),
    NewRole = Role1,
    case NewEnchant >= 7 of
        true ->
            Msg =
                notice:format(lang:get("雷动九天，~ts进行~ts时，竟然将~ts强化+~ts！{face_1, "
                                       "10}"),
                              [{role_2, RoleName},
                               {string_2, 1, lang:get("装备强化")},
                               {item_2, EqmBaseId},
                               {string_2, 5, NewEnchant}]),
            Channel = case NewEnchant >= 9 of
                          true -> 5;
                          false -> 6
                      end,
            notice:cast(all, Channel, Msg);
        _ -> ok
    end,
    Msg1 = util:flist(lang:get("强化+~w"), [NewEnchant]),
    Msg2 = notice:format(lang:get("成长值达到~ts，装备直接提升至~ts"),
                         [{string_2, 5, "100%"}, {string_2, 5, Msg1}]),
    log:eqm(NewRole, "祝福强化", Eqm, NewEqm),
    {suc,
     Msg2,
     role_trigger:fire([#evt_blacksmith_enchant{base_id =
                                                    EqmBaseId,
                                                is_succ = 1,
                                                luck_list = LuckBaseList,
                                                all_lev = AllLev,
                                                pre_all_lev = PreAllLev,
                                                sum_lev = SumLev,
                                                pre_sum_lev = PreSumLev},
                        #evt_enchant{type = EqmType, base_id = EqmBaseId,
                                     pre_lev = Enchant, lev = NewEnchant,
                                     pos = EqmPos, quality = EqmQuality}],
                       NewRole)}.

enchant_cast(suc, ProtectBaseId, RandVal, _LossEnchant,
             Eqm = #item{enchant = Enchant, base_id = EqmBaseId,
                         type = EqmType, pos = EqmPos, quality = EqmQuality},
             LuckBaseList,
             Role = #role{p_eqm = Peqm, name = RoleName}) ->
    NewEnchant = Enchant + 1,
    Eqm1 = Eqm#item{enchant = NewEnchant},
    {NewGrowthLev, NewGrowthVal} = luck_suc(Eqm1),
    Eqm2 = eqm_attr:calc_eqm(Eqm1#item{growth_lev =
                                           NewGrowthLev,
                                       growth_val = NewGrowthVal}),
    NewEqm = update_max_enchant_lev(Eqm2),
    {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                          NewEqm,
                                          Peqm,
                                          Role),
    Role0 = Role#role{p_eqm = NewPeqm},
    PreAllLev = enchant_all_lev(Peqm),
    AllLev = enchant_all_lev(NewPeqm),
    PreSumLev = enchant_sum_lev(Peqm, 0),
    SumLev = enchant_sum_lev(NewPeqm, 0),
    Role1 = notice_all_lev(Role0, AllLev),
    NewRole = Role1,
    case NewEnchant >= 7 of
        true ->
            Msg =
                notice:format(lang:get("雷动九天，~ts进行~ts时，竟然将~ts强化+~ts！{face_1, "
                                       "10}"),
                              [{role_2, RoleName},
                               {string_2, 1, lang:get("装备强化")},
                               {item_2, EqmBaseId},
                               {string_2, 5, NewEnchant}]),
            Channel = case NewEnchant >= 9 of
                          true -> 5;
                          false -> 6
                      end,
            notice:cast(all, Channel, Msg);
        _ -> ok
    end,
    log:eqm(NewRole,
            "强化成功",
            Eqm,
            NewEqm,
            {enchant, RandVal, ProtectBaseId}),
    {suc,
     lang:get(""),
     role_trigger:fire([#evt_blacksmith_enchant{base_id =
                                                    EqmBaseId,
                                                is_succ = 1,
                                                luck_list = LuckBaseList,
                                                is_protect = ProtectBaseId,
                                                all_lev = AllLev,
                                                pre_all_lev = PreAllLev,
                                                sum_lev = SumLev,
                                                pre_sum_lev = PreSumLev},
                        #evt_enchant{type = EqmType, base_id = EqmBaseId,
                                     pre_lev = Enchant, lev = NewEnchant,
                                     pos = EqmPos, quality = EqmQuality}],
                       NewRole)};
enchant_cast(fail, ProtectBaseId, RandVal, LossEnchant,
             Eqm = #item{enchant = Enchant, base_id = EqmBaseId},
             LuckBaseList,
             Role = #role{p_eqm = Peqm, name = RoleName}) ->
    {NewGrowthLev, NewGrowthVal, AddVal} = luck_fail(Eqm),
    Eqm1 = Eqm#item{growth_lev = NewGrowthLev,
                    growth_val = NewGrowthVal},
    LossEnchant1 = case ProtectBaseId =/= 0 of
                       true -> Enchant;
                       false -> LossEnchant
                   end,
    NewEqm = case LossEnchant1 =:= Enchant of
                 true -> Eqm1;
                 false ->
                     eqm_attr:calc_eqm(Eqm1#item{enchant = LossEnchant1})
             end,
    case Enchant >= 7 andalso Enchant > LossEnchant1 of
        true ->
            Msg =
                notice:format(lang:get("闷雷滚动，~ts将~ts强化至+~ts时，一不留神掉到了+~ts，正躲在角落画圈圈{fac"
                                       "e_1, 21}"),
                              [{role_2, RoleName},
                               {item_2, EqmBaseId},
                               {string_2, 5, Enchant + 1},
                               {string_2, 5, LossEnchant1}]),
            Channel = case Enchant >= 8 of
                          true -> 5;
                          false -> 6
                      end,
            notice:cast(all, Channel, Msg);
        _ ->
            case ProtectBaseId =/= 0 of
                true ->
                    Msg =
                        notice:format(lang:get("闷雷滚动，~ts将~ts强化至+~ts时失败，幸好使用了保护符，强化等级得以维持{face"
                                               "_1, 21}"),
                                      [{role_2, RoleName},
                                       {item_2, EqmBaseId},
                                       {string_2, 5, Enchant + 1}]),
                    Channel = case Enchant >= 8 of
                                  true -> 5;
                                  false -> 6
                              end,
                    notice:cast(all, Channel, Msg);
                _ -> skip
            end
    end,
    {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                          NewEqm,
                                          Peqm,
                                          Role),
    Role0 = Role#role{p_eqm = NewPeqm},
    NewRole = Role0,
    Msg2 = case AddVal > 0 of
               true ->
                   Msg1 = util:flist(lang:get("成长值+~w"), [AddVal]),
                   notice:format(lang:get("强化~ts"), [{string_2, 5, Msg1}]);
               _ -> lang:get("强化失败")
           end,
    IsEnchantBreak = is_enchant_break(Eqm),
    IsEnchantBreak1 = case IsEnchantBreak of
                          true -> 1;
                          _ -> 0
                      end,
    case Enchant =:= LossEnchant1 andalso
             ProtectBaseId =:= 0
        of
        true -> skip;
        _ ->
            case blacksmith_data:enchant_fail_reward({Enchant,
                                                      IsEnchantBreak1})
                of
                #enchant_fail_reward{item_list = ItemList,
                                     title = Title, msg = MailMsg} ->
                    mail:send(Role, Title, MailMsg, ItemList);
                _ -> ignore
            end
    end,
    log:eqm(NewRole,
            "强化失败",
            Eqm,
            NewEqm,
            {enchant, RandVal, ProtectBaseId}),
    PreAllLev = enchant_all_lev(Peqm),
    AllLev = enchant_all_lev(NewPeqm),
    PreSumLev = enchant_sum_lev(Peqm, 0),
    SumLev = enchant_sum_lev(NewPeqm, 0),
    {fail,
     Msg2,
     role_trigger:fire(#evt_blacksmith_enchant{base_id =
                                                   EqmBaseId,
                                               is_succ = 0,
                                               luck_list = LuckBaseList,
                                               is_protect = ProtectBaseId,
                                               all_lev = AllLev,
                                               pre_all_lev = PreAllLev,
                                               sum_lev = SumLev,
                                               pre_sum_lev = PreSumLev},
                       NewRole)}.

notice_all_lev(Role = #role{classes = Classes},
               AllLev) ->
    case blacksmith_data:get_halo_id({AllLev, Classes}) of
        HaloId when is_integer(HaloId) ->
            OldList = var:get_var(Role, other, 2069, []),
            case lists:member(AllLev, OldList) of
                false ->
                    NewList = [AllLev | OldList],
                    Role1 = var:set_var(Role, other, 2069, NewList),
                    notice:show(Role1, 1, HaloId),
                    Role1;
                _ -> Role
            end;
        _ -> Role
    end;
notice_all_lev(Role, _) -> Role.

luck_fail(Eqm = #item{enchant = Enchant,
                      growth_lev = 0}) ->
    case blacksmith_data:get_growth(Enchant + 1) of
        MaxGrowthVal when is_integer(MaxGrowthVal) ->
            IsEnchantBreak = is_enchant_break(Eqm),
            IsEnchantBreak1 = case IsEnchantBreak of
                                  true -> 1;
                                  _ -> 0
                              end,
            AddVal = blacksmith_data:growth_add({Enchant,
                                                 Enchant + 1,
                                                 IsEnchantBreak1}),
            {Enchant + 1, AddVal, AddVal};
        _ -> {0, 0, 0}
    end;
luck_fail(Eqm = #item{enchant = Enchant,
                      growth_lev = GrowthLev, growth_val = GrowthVal}) ->
    case blacksmith_data:get_growth(GrowthLev) of
        MaxGrowthVal when is_integer(MaxGrowthVal) ->
            IsEnchantBreak = is_enchant_break(Eqm),
            IsEnchantBreak1 = case IsEnchantBreak of
                                  true -> 1;
                                  _ -> 0
                              end,
            AddVal = blacksmith_data:growth_add({Enchant,
                                                 GrowthLev,
                                                 IsEnchantBreak1}),
            NewGrowthVal = min(MaxGrowthVal, GrowthVal + AddVal),
            {GrowthLev, NewGrowthVal, NewGrowthVal - GrowthVal};
        _ -> {GrowthLev, GrowthVal, 0}
    end.

luck_suc(#item{enchant = Enchant,
               growth_lev = GrowthLev, growth_val = GrowthVal}) ->
    case Enchant >= GrowthLev of
        true -> {0, 0};
        false -> {GrowthLev, GrowthVal}
    end.

check_skill_transform(#item{attr = Attr, lev = Lev},
                      _Role) ->
    {SpecialAttr, _} = lists:partition(fun (#attr_base{type
                                                           = Type}) ->
                                               Type =:= 4
                                       end,
                                       Attr),
    logger:debug("SpecialAttr:~w",
                 [SpecialAttr],
                 blacksmith,
                 1783),
    case SpecialAttr of
        [#attr_base{}] ->
            case blacksmith_data:get_skill_transform(Lev) of
                NeedItem = [_ | _] -> {true, NeedItem, SpecialAttr};
                _ -> {false, lang:get("该装备不能转换特效")}
            end;
        _ -> {false, lang:get("没有找到特效属性，无法转换")}
    end.

skill_transform_loss(NeedItem, Role) ->
    Loss = format:val_to_loss(NeedItem),
    case role_gain:do_notice(Loss, Role) of
        {false, #loss{label = coin, msg = Msg}} -> {false, Msg};
        {false, _L} -> {false, lang:get("材料不足，无法转换")};
        {ok, NewRole} -> {ok, NewRole}
    end.

target_skill_transform_make(Eqm = #item{id = Id,
                                        type = Type, lev = Lev, data = Data},
                            Target = {AttrName, AttrVal}, SpecialAttr,
                            Role = #role{p_eqm = Peqm, classes = Classes}) ->
    case SpecialAttr of
        [#attr_base{}] ->
            List = eqm_data:get_effect_attr({Type, Lev}),
            Fun = fun ({C, E, _R}, Rtn)
                          when C =:= Classes orelse C =:= 0 ->
                          case Rtn of
                              true -> Rtn;
                              _ -> lists:member(Target, E)
                          end;
                      (_, Rtn) -> Rtn
                  end,
            Flag = lists:foldl(Fun, false, List),
            case Flag of
                true ->
                    NewAttr = #attr_base{type = 4, name = AttrName,
                                         calc_type = 0, val = AttrVal},
                    NewSpecialAttr = {1, [NewAttr]},
                    NData = lists:keystore(1, 1, Data, NewSpecialAttr),
                    NewEqm = Eqm#item{data = NData},
                    {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                          NewEqm,
                                                          Peqm,
                                                          Role),
                    NewRole = Role#role{p_eqm = NewPeqm},
                    log:eqm(NewRole, "装备技能洗练", Eqm, NewEqm),
                    role:link_send(Role, 10615, {Id, [NewAttr]}),
                    {ok, lang:get("洗练成功"), NewRole};
                _ -> {false, lang:get("该装备不存在此特技")}
            end;
        _ -> {false, lang:get("没有找到转换属性")}
    end.

skill_transform_make(Eqm = #item{id = Id, type = Type,
                                 lev = Lev, data = Data},
                     SpecialAttr,
                     Role = #role{p_eqm = Peqm, classes = Classes}) ->
    case SpecialAttr of
        [Attr = #attr_base{}] ->
            {DataSpecialSkill, ExceptSpecialSkill} =
                lists:partition(fun ({DataType, _}) -> DataType =:= 1
                                end,
                                Data),
            Attr1 = case DataSpecialSkill of
                        [{1, [SpecialSkillTmp = #attr_base{}]}] ->
                            SpecialSkillTmp;
                        [] -> Attr;
                        _ -> Attr
                    end,
            case get_transform_skill(Attr1, Type, Lev, Classes) of
                {false, Reason} -> {false, Reason};
                {true, NewAttr} ->
                    NewSpecialAttr = {1, [NewAttr]},
                    NewEqm = Eqm#item{data =
                                          [NewSpecialAttr
                                           | ExceptSpecialSkill]},
                    {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                          NewEqm,
                                                          Peqm,
                                                          Role),
                    NewRole = Role#role{p_eqm = NewPeqm},
                    log:eqm(NewRole, "装备技能洗练", Eqm, NewEqm),
                    role:link_send(Role, 10615, {Id, [NewAttr]}),
                    {ok, lang:get("洗练成功"), NewRole}
            end;
        _ -> {false, lang:get("没有找到转换属性")}
    end.

get_transform_skill(#attr_base{name = Name,
                               val = OldSkillId},
                    Type, Lev, Classes) ->
    List = eqm_data:get_effect_attr({Type, Lev}),
    List1 = [{E -- [{Name, OldSkillId}], R}
             || {C, E, R} <- List, C =:= Classes orelse C =:= 0],
    List2 = [{E, R} || {E, R} <- List1, E =/= []],
    case List2 of
        [_ | _] ->
            case util:rand_list(List2, 2) of
                {AttrList = [_ | _], _} ->
                    {AttrName, AttrVal} = util:rand_list(AttrList),
                    Attr = #attr_base{type = 4, name = AttrName,
                                      calc_type = 0, val = AttrVal},
                    {true, Attr};
                _ ->
                    logger:error("无法获得[~w][~w][~w][~w]的特效属性",
                                 [Type, Classes, Lev, OldSkillId],
                                 blacksmith,
                                 1892),
                    {false, lang:get("无法获得转换技能")}
            end;
        _ ->
            logger:error("无法获得[~w][~w][~w][~w]的特效属性",
                         [Type, Classes, Lev, OldSkillId],
                         blacksmith,
                         1896),
            {false, lang:get("无法获得转换技能")}
    end.

check_transform(#item{attr = Attr, lev = Lev}, Side,
                _Role) ->
    {SpecialAttr, NormalAttr} = lists:partition(fun
                                                    (#attr_base{type = Type}) ->
                                                        Type =:= 2
                                                end,
                                                Attr),
    SpecialAttr1 = [{Flag rem 10, Name, A}
                    || A = #attr_base{type = 2, name = Name, flag = Flag}
                           <- SpecialAttr],
    case lists:keyfind(Side, 1, SpecialAttr1) of
        {Side, _, _} ->
            case blacksmith_data:get_transform(Lev) of
                NeedItem = [_ | _] ->
                    {true, NeedItem, SpecialAttr1, NormalAttr};
                _ -> {false, lang:get("该装备不能转换属性")}
            end;
        _ -> {false, lang:get("没有找到对应的转换属性")}
    end.

transform_loss(NeedItem, Role) ->
    Loss = format:val_to_loss(NeedItem,
                              #{item_base_id_auto_buy => 1,
                                auto_scene => lang:get("属性转换")}),
    case role_gain:do_notice(Loss, Role) of
        {false,
         #loss{label = item_base_id_auto_buy, msg = Msg}} ->
            {false, Msg};
        {false, #loss{label = coin, msg = Msg}} -> {false, Msg};
        {false, _L} -> {false, lang:get("材料不足，无法转换")};
        {ok, NewRole} -> {ok, NewRole}
    end.

transform_make(Eqm = #item{data = Data}, Side,
               SpecialAttr, NormalAttr, Role = #role{p_eqm = Peqm}) ->
    AllName = [101, 102, 103, 104, 105],
    NowName = [Name || {_, Name, _} <- SpecialAttr],
    NowName1 = case lists:keyfind(4, 1, Data) of
                   {_, OldTransName} -> [OldTransName | NowName];
                   _ -> NowName
               end,
    LastName = AllName -- NowName1,
    GetName = util:rand_list(LastName),
    case lists:keytake(Side, 1, SpecialAttr) of
        {value, {_, _, Attr}, Rest} ->
            Rest1 = [Rattr || {_, _, Rattr} <- Rest],
            NewSpecialAttr = [Attr#attr_base{name = GetName}
                              | Rest1],
            AttrList = NewSpecialAttr ++ NormalAttr,
            TransData = {4, Attr#attr_base.name},
            NewData = lists:keystore(4, 1, Data, TransData),
            NewEqm = eqm_attr:calc_eqm(Eqm#item{attr = AttrList,
                                                data = NewData}),
            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                  NewEqm,
                                                  Peqm,
                                                  Role),
            NewRole = Role#role{p_eqm = NewPeqm},
            log:eqm(NewRole, "装备转换", Eqm, NewEqm),
            {ok, lang:get("转换成功"), NewRole};
        _ -> {false, lang:get("没有找到转换属性")}
    end.

check_forge(#item{base_id = BaseId, attr = Attr},
            IsPerfect, UseHeroPaper,
            Role = #role{lev = Lev, sex = Sex, classes = Classes,
                         m_lev_break = #m_lev_break{times = Times},
                         p_bag = Pbag}) ->
    {WorldLev, _} = world_lev:get_world_lev(Role),
    case blacksmith_data:get_forge({BaseId, Sex, Classes})
        of
        #{need_lev := NeedLev} when Lev < NeedLev ->
            {false,
             util:flist(lang:get("人物达到~w级, 才能继续锻造装备"), [NeedLev])};
        #{need_break_times := NeedBreakTimes}
            when Times < NeedBreakTimes ->
            {false,
             util:flist(lang:get("等级突破~w次, 才能继续锻造装备"),
                        [NeedBreakTimes])};
        #{need_coin := NeedCoin, low_lev_cost := NeedItem,
          perfect_item := PerfectItem, next_lev := NextLev,
          next_id := NextId, make_up := MakeUpItem}
            when NextLev < WorldLev ->
            AllNeedItem = case IsPerfect of
                              1 -> NeedItem ++ PerfectItem;
                              0 -> NeedItem
                          end,
            case UseHeroPaper of
                1 ->
                    case check_use_hero_paper(Attr, Pbag) of
                        {true, HeroPaper} ->
                            {true,
                             NextLev,
                             NeedCoin,
                             AllNeedItem ++ HeroPaper,
                             NextId,
                             MakeUpItem};
                        {false, Reason} -> {false, Reason}
                    end;
                _ ->
                    {true,
                     NextLev,
                     NeedCoin,
                     AllNeedItem,
                     NextId,
                     MakeUpItem}
            end;
        #{need_coin := NeedCoin, need_item := NeedItem,
          perfect_item := PerfectItem, next_lev := NextLev,
          next_id := NextId, make_up := MakeUpItem} ->
            AllNeedItem = case IsPerfect of
                              1 -> NeedItem ++ PerfectItem;
                              0 -> NeedItem
                          end,
            case UseHeroPaper of
                1 ->
                    case check_use_hero_paper(Attr, Pbag) of
                        {true, HeroPaper} ->
                            {true,
                             NextLev,
                             NeedCoin,
                             AllNeedItem ++ HeroPaper,
                             NextId,
                             MakeUpItem};
                        {false, Reason} -> {false, Reason}
                    end;
                _ ->
                    {true,
                     NextLev,
                     NeedCoin,
                     AllNeedItem,
                     NextId,
                     MakeUpItem}
            end;
        _ -> {false, lang:get("不满足条件, 无法锻造")}
    end.

check_use_hero_paper(Attr, _Pbag) ->
    case lists:keyfind(112, #attr_base.name, Attr) of
        #attr_base{val = Stone} ->
            case blacksmith_data:get_stone(Stone) of
                #{lev := StoneLev} when StoneLev >= 6 ->
                    {true, [{20406, 1}]};
                _ -> {false, lang:get("英雄宝石不足6级，无需使用英雄卷轴")}
            end;
        _ -> {false, lang:get("英雄宝石不足6级，无需使用英雄卷轴")}
    end.

forge_loss(NeedCoin, NeedItem, Role) ->
    CoinLoss = [#loss{label = coin, val = NeedCoin,
                      msg =
                          notice:format(lang:get("你的~ts不足, 无法锻造"),
                                        [{assets_2, 90000}])}],
    ItemLoss = [#loss{label = item_base_id_auto_buy,
                      val = NeedItem, msg = lang:get("材料不足, 无法锻造"),
                      auto_scene = lang:get("装备锻造")}],
    Loss = CoinLoss ++ ItemLoss,
    case role_gain:do_notice(Loss, Role) of
        {false,
         #loss{label = item_base_id_auto_buy, msg = Msg}} ->
            {false, Msg};
        {false, #loss{label = coin, msg = Msg}} -> {false, Msg};
        {false, _L} ->
            {false,
             notice:format(lang:get("你的~ts不足，无法锻造"),
                           [{assets_2, 90002}])};
        {ok, NewRole} -> {ok, NewRole}
    end.

forge_make(Eqm = #item{type = Type, enchant = Enchant,
                       extra = Extra},
           IsPerfect, UseHeroPaper, NextLev, NextId, MakeUpItem,
           Role = #role{p_eqm = Peqm, classes = Classes}) ->
    {CalcBaseAttr, SpecialAttr} =
        eqm_attr:get_role_init_attr(Type, NextLev),
    EffectAttr = eqm_attr:get_role_effect_attr(Type,
                                               Classes,
                                               NextLev),
    BackUpAttr = CalcBaseAttr ++ SpecialAttr ++ EffectAttr,
    case BackUpAttr of
        [_ | _] ->
            IsEnchantBreak = is_enchant_break(Eqm),
            MaxEnchantLev = case lists:keyfind(23, 1, Extra) of
                                {_, OldMaxEnchantLev, _} -> OldMaxEnchantLev;
                                _ -> Enchant
                            end,
            NewEnchant = case Enchant >= 7 andalso IsPerfect =:= 0
                             of
                             true ->
                                 case MaxEnchantLev >= 13 of
                                     true -> max(11, Enchant - 1);
                                     _ ->
                                         case IsEnchantBreak of
                                             true -> max(10, Enchant - 1);
                                             _ -> Enchant - 1
                                         end
                                 end;
                             false -> Enchant
                         end,
            case item:make(NextId, 1, 1) of
                false -> {false, lang:get("该装备无法锻造")};
                {ok, [NewItem]} ->
                    NewEqm = forge_attr(Eqm,
                                        NewItem#item{attr = BackUpAttr,
                                                     enchant = NewEnchant},
                                        MakeUpItem,
                                        UseHeroPaper,
                                        Role),
                    {ok, NewPeqm, _} = package:replace_item(Eqm,
                                                            NewEqm,
                                                            Peqm,
                                                            Role),
                    NewRole = attr:calc_and_push(Role#role{p_eqm =
                                                               NewPeqm}),
                    {Talents, _, _} = skill:get_effect_skill(NewRole),
                    role:link_send(NewRole, 10804, {Talents}),
                    log:eqm(NewRole, "装备锻造", Eqm, NewEqm),
                    {ok, NewRole}
            end;
        _ -> {false, lang:get("当前装备无法锻造")}
    end.

forge_attr(#item{id = Id, base_id = BaseId, pos = Pos,
                 craft = Craft, attr = Attr, growth_lev = GrowthLev,
                 growth_val = GrowthVal, extra = Extra, lev = BackLev,
                 data = Data},
           NewEqm = #item{attr = NewAttr, lev = Lev}, MakeUpItem,
           UseHeroPaper,
           Role = #role{m_skill = #m_skill{skills = SkillList}}) ->
    Flag = case lists:keyfind(100, #attr_base.name, Attr) of
               #attr_base{val = SkillId} ->
                   lists:keymember(SkillId, 1, SkillList);
               _ -> false
           end,
    case Flag of
        true ->
            case MakeUpItem of
                [_ | _] ->
                    Content =
                        notice:format(lang:get("由于您升级的装备~ts中带有装备技能，系统补偿如下"),
                                      [{item_2, BaseId}]),
                    Title = lang:get("升级装备补偿"),
                    mail:send(Role,
                              #{title => Title, content => Content,
                                items => MakeUpItem}),
                    ok;
                _ -> ok
            end;
        false -> skip
    end,
    Data1 = case Lev >= 80 of
                true ->
                    Fun = fun (#attr_base{type = Type}) ->
                                  Type =:= 0 orelse
                                      Type =:= 2 orelse
                                          Type =:= 4 orelse Type =:= 10
                          end,
                    {BackAttr, _} = lists:partition(Fun, Attr),
                    BackData = {2, {BackLev, BackLev, BackAttr}},
                    lists:keystore(2, 1, Data, BackData);
                false -> Data
            end,
    NewData = lists:keydelete(6, 1, Data1),
    OldHoleAttr = case UseHeroPaper of
                      1 -> [A || A = #attr_base{type = 3} <- Attr];
                      _ ->
                          [forge_hero_stone(A)
                           || A = #attr_base{type = 3} <- Attr]
                  end,
    OldCampAttr = [A || A = #attr_base{type = 5} <- Attr],
    OldCampCachedAttr = [A
                         || A = #attr_base{type = 6} <- Attr],
    NewEqm1 = NewEqm#item{id = Id, pos = Pos, craft = Craft,
                          attr =
                              OldHoleAttr ++
                                  OldCampAttr ++ OldCampCachedAttr ++ NewAttr,
                          growth_lev = GrowthLev, growth_val = GrowthVal,
                          extra = Extra, data = NewData},
    eqm_attr:calc_eqm(NewEqm1).

forge_hero_stone(A = #attr_base{name = 112, val = Stone,
                                flag = Exp}) ->
    case blacksmith_data:stone_degrade(Stone) of
        #{subtract_exp := SubtractExp}
            when Exp >= SubtractExp ->
            Msg = notice:format(lang:get("由于装备提升，~ts损失了一小部分经验"),
                                [{item_2, Stone}]),
            notice:send(conn_pid, 3, Msg),
            A#attr_base{flag = Exp - SubtractExp};
        #{subtract_exp := SubtractExp, pre_id := PreId} ->
            Msg =
                notice:format(lang:get("由于装备提升，~ts损失了一小部分经验，等级变为~ts"),
                              [{item_2, Stone}, {item_2, PreId}]),
            notice:send(conn_pid, 3, Msg),
            case stone_info(PreId) of
                #{max_exp := MaxExp} ->
                    A#attr_base{flag = max(0, MaxExp + Exp - SubtractExp),
                                val = PreId};
                _ -> A#attr_base{flag = 0, val = PreId}
            end;
        #{pre_id := PreId} ->
            Msg =
                notice:format(lang:get("由于装备提升，~ts损失了一小部分经验，等级变为~ts"),
                              [{item_2, Stone}, {item_2, PreId}]),
            notice:send(conn_pid, 3, Msg),
            A#attr_base{flag = 0, val = PreId};
        _ -> A
    end;
forge_hero_stone(A) -> A.

count_embed(#role{p_eqm = #package{items = Items}}) ->
    count_embed(Items, 0).

count_embed([], Count) -> Count;
count_embed([#item{attr = Attr} | Rest], Count) ->
    Embed = [A
             || A = #attr_base{type = AttrType} <- Attr,
                AttrType =:= 3],
    count_embed(Rest, Count + length(Embed)).

get_fuse_loss(Bag, BaseId, Need) ->
    case package:find_bind_unbind(BaseId, Bag) of
        {_BindItems, UnBindItems, _BindNum, UnBindNum}
            when UnBindNum >= Need ->
            {do_get_fuse_loss(UnBindItems, Need, []), 0};
        _ -> {format:val_to_loss([{BaseId, Need}]), 1}
    end.

do_get_fuse_loss([], _, Loss) ->
    [#loss{label = item_id, val = Loss}];
do_get_fuse_loss(_, Need, Loss) when Need < 1 ->
    [#loss{label = item_id, val = Loss}];
do_get_fuse_loss([#item{id = Id, quantity = Num} | T],
                 Need, Loss) ->
    case Num > Need of
        true -> do_get_fuse_loss(T, 0, [{Id, Need} | Loss]);
        _ -> do_get_fuse_loss(T, Need - Num, [{Id, Num} | Loss])
    end.

set_shoes_zero_speed(Role = #role{p_eqm =
                                      Peqm = #package{items = Eqm}}) ->
    case lists:keyfind(14, #item.type, Eqm) of
        Shoes = #item{type = 14, attr = Attr} ->
            NewAttr = case lists_ext:multikeyfind([{0,
                                                    #attr_base.type},
                                                   {3, #attr_base.name}],
                                                  Attr)
                          of
                          #attr_base{val = Val} ->
                              ZeroSpeedAttr = #attr_base{type = 11, name = 3,
                                                         val = -Val,
                                                         calc_type = 1},
                              lists:keystore(11,
                                             #attr_base.type,
                                             Attr,
                                             ZeroSpeedAttr);
                          _ -> Attr
                      end,
            NewShoes = eqm_attr:calc_eqm(Shoes#item{attr =
                                                        NewAttr}),
            {ok, NewPeqm, _} = package:fresh_item(Shoes,
                                                  NewShoes,
                                                  Peqm,
                                                  Role),
            NewRole = Role#role{p_eqm = NewPeqm},
            Role1 = eqm:calc_all_enchant(NewRole, 0),
            Role2 = attr:calc_and_push(Role1),
            {ok, Role2};
        _ -> {false, lang:get("您还没有鞋子装备，不能使用")}
    end.

check_switch_back(Eqm = #item{lev = Lev, data = Data,
                              attr = Attr}) ->
    case lists:keyfind(2, 1, Data) of
        {2, {BackLev, NowLev, BackAttr}} ->
            NewNowLev = case NowLev =:= BackLev of
                            true -> Lev;
                            false -> BackLev
                        end,
            Fun = fun (#attr_base{type = Type}) ->
                          Type =:= 0 orelse
                              Type =:= 2 orelse Type =:= 4 orelse Type =:= 10
                  end,
            {NewBackAttr, NormalAttr} = lists:partition(Fun, Attr),
            NewAttr = NormalAttr ++ BackAttr,
            NewData = lists:keyreplace(2,
                                       1,
                                       Data,
                                       {2, {BackLev, NewNowLev, NewBackAttr}}),
            NewEqm = Eqm#item{data = NewData, attr = NewAttr},
            {ok, NewEqm};
        _ -> {false, lang:get("没有发现可切换属性")}
    end.

check_in_switch(#item{data = Data}) ->
    case lists:keyfind(2, 1, Data) of
        {2, {BackLev, NowLev, _BackAttr}}
            when NowLev =/= BackLev ->
            true;
        _ -> false
    end.

comprehend_lucky_odds_get(Data, Lev, Values) ->
    case lists:keytake(3, 1, Data) of
        {value, {3, List}, Data1} ->
            case lists:keytake(Lev, 1, List) of
                {value, {Lev, Values1}, List1} ->
                    {Data1, Values1, List1};
                _ -> {Data1, Values, List}
            end;
        _ -> {Data, Values, []}
    end.

comprehend_lucky_odds_update(Data, List, Values, Lev,
                             AttrVal, Max) ->
    case AttrVal of
        Max -> [{3, List} | Data];
        _ ->
            Values1 = odds_refresh(Values),
            [{3, [{Lev, Values1} | List]} | Data]
    end.

odds_refresh(List) ->
    List1 = lists:keysort(1, List),
    odds_refresh2(List1, []).

odds_refresh2([{Value, Odds} | List], Acc)
    when length(List) >= 2 andalso Odds > 0 ->
    odds_refresh3(List, [{Value, max(0, Odds - 10)} | Acc]);
odds_refresh2([{Value, Odds} | List], Acc)
    when Odds =< 0 ->
    odds_refresh2(List, [{Value, Odds} | Acc]);
odds_refresh2(List, Acc) -> List ++ Acc.

odds_refresh3([{Value1, Odd1}, {Value2, Odd2}],
              List1) ->
    [{Value1,
      erlang:round(10 * Odd1 / (Odd1 + Odd2)) + Odd1},
     {Value2, erlang:round(10 * Odd2 / (Odd1 + Odd2)) + Odd2}
     | List1];
odds_refresh3([{Value1, Odd1} | List1], List2) ->
    odds_refresh3(List1, [{Value1, Odd1} | List2]).

enchant_all_lev(#package{items = Eqm}) ->
    case eqm_attr:get_all_enchant(Eqm, 1000, 0) of
        false -> 0;
        {ok, _, _, Lev} -> Lev
    end.

enchant_sum_lev(#package{items = Eqm}, Lev) ->
    enchant_sum_lev(Eqm, Lev);
enchant_sum_lev([], Lev) -> Lev;
enchant_sum_lev([#item{type = Type, enchant = Enchant}
                 | T],
                Lev)
    when Enchant > 0 ->
    case lists:member(Type,
                      [1, 4, 2, 3, 5, 21, 22, 6, 7, 9, 10, 11, 12, 14])
        of
        false -> enchant_sum_lev(T, Lev);
        true -> enchant_sum_lev(T, Lev + Enchant)
    end;
enchant_sum_lev([_ | T], Lev) ->
    enchant_sum_lev(T, Lev).

get_target_stone_lev(_, _, 1) -> 1;
get_target_stone_lev(OldStonePrice, TargetStonePrice,
                     Lev) ->
    logger:debug("OldStoneTotalPrice, StoneTotalPrice:~w",
                 [{OldStonePrice, TargetStonePrice, Lev}],
                 blacksmith,
                 2308),
    Count = round(math:pow(2, Lev)) - 1,
    StonePrice = TargetStonePrice * Count,
    case StonePrice =< OldStonePrice of
        true -> Lev;
        false ->
            get_target_stone_lev(OldStonePrice,
                                 TargetStonePrice,
                                 Lev - 1)
    end.

reset_lucky_odds_update(Eqm = #item{lev = EqmLev,
                                    type = Type, data = OldData},
                        Classes, Sex) ->
    case blacksmith_data:get_reset({Classes,
                                    Type,
                                    EqmLev,
                                    Sex})
        of
        #{lucky_val := CfgLuckVal} ->
            LuckyVal = case lists:keyfind(6, 1, OldData) of
                           {6, OldVal} -> OldVal;
                           _ -> 0
                       end,
            case LuckyVal + 10 >= CfgLuckVal of
                true ->
                    logger:debug("幸运值：~w,配置幸运:~w",
                                 [LuckyVal, CfgLuckVal],
                                 blacksmith,
                                 2329),
                    NewData = lists:keystore(6, 1, OldData, {6, 0}),
                    EffectAttr = get_reset_effect_attr(Type,
                                                       Classes,
                                                       EqmLev,
                                                       true),
                    EffectSkill = get_reset_effect_skill(Type,
                                                         Classes,
                                                         EqmLev),
                    {Eqm#item{data = NewData}, EffectAttr ++ EffectSkill};
                _ ->
                    logger:debug("幸运值：~w,配置幸运:~w",
                                 [LuckyVal, CfgLuckVal],
                                 blacksmith,
                                 2335),
                    EffectAttr = get_reset_effect_attr(Type,
                                                       Classes,
                                                       EqmLev,
                                                       false),
                    EffectSkill = get_reset_effect_skill(Type,
                                                         Classes,
                                                         EqmLev),
                    NewData = case EffectAttr of
                                  [_ | _] ->
                                      lists:keystore(6, 1, OldData, {6, 0});
                                  _ ->
                                      lists:keystore(6,
                                                     1,
                                                     OldData,
                                                     {6, LuckyVal + 10})
                              end,
                    {Eqm#item{data = NewData}, EffectAttr ++ EffectSkill}
            end;
        _ -> {Eqm, []}
    end.

get_reset_effect_attr(Type, Classes, Lev,
                      IsGetEffect) ->
    List = eqm_data:get_effect_attr({Type, Lev}),
    List1 = [{E, R}
             || {C, E, R} <- List, C =:= Classes orelse C =:= 0],
    List2 = case IsGetEffect of
                true ->
                    [{EffList, R} || {EffList, R} <- List1, EffList =/= []];
                _ -> List1
            end,
    case List2 of
        [_ | _] ->
            case util:rand_list(List2, 2) of
                {[], _} -> [];
                {AttrList, _} ->
                    {AttrName, AttrVal} = util:rand_list(AttrList),
                    Attr = #attr_base{type = 4, name = AttrName,
                                      calc_type = 0, val = AttrVal},
                    [Attr]
            end;
        _ ->
            logger:error("无法获得[~w][~w][~w]的特效属性",
                         [Type, Classes, Lev],
                         blacksmith,
                         2370),
            []
    end.

get_reset_effect_skill(Type, Classes, Lev) ->
    List = eqm_data:get_effect_skill({Type, Lev}),
    List1 = [{E, R}
             || {C, E, R} <- List, C =:= Classes orelse C =:= 0],
    case List1 of
        [_ | _] ->
            case util:rand_list(List1, 2) of
                {[], _} -> [];
                {AttrList, _} ->
                    {AttrName, AttrVal} = util:rand_list(AttrList),
                    Attr = #attr_base{type = 10, name = AttrName,
                                      calc_type = 0, val = AttrVal},
                    [Attr]
            end;
        _ -> []
    end.

adm_show(_Role = #role{p_eqm =
                           #package{items = Items}}) ->
    adm_show(Items, []).

adm_show([], List) -> {ok, List};
adm_show([Item = #item{base_id = BaseId,
                       enchant = Enchant, attr = Attr}
          | T],
         List) ->
    Name = item:attr(name, BaseId),
    Fc = util:ceil(attr:calc_item_score(Item) / 500),
    {SkillId, SkillName} = case lists:keyfind(4,
                                              #attr_base.type,
                                              Attr)
                               of
                               #attr_base{val = TSkillId, name = TSkillName} ->
                                   {TSkillId, TSkillName};
                               _ -> {0, ""}
                           end,
    Attr2 = [A || A = #attr_base{type = 3} <- Attr],
    {Stone1, StoneName1} = case lists:keyfind(110,
                                              #attr_base.name,
                                              Attr2)
                               of
                               #attr_base{val = TStoneId1} ->
                                   {TStoneId1, item:attr(name, TStoneId1)};
                               _ -> {0, ""}
                           end,
    {Stone2, StoneName2} = case lists:keyfind(111,
                                              #attr_base.name,
                                              Attr2)
                               of
                               #attr_base{val = TStoneId2} ->
                                   {TStoneId2, item:attr(name, TStoneId2)};
                               _ -> {0, ""}
                           end,
    {Stone3, StoneName3} = case lists:keyfind(112,
                                              #attr_base.name,
                                              Attr2)
                               of
                               #attr_base{val = TStoneId3} ->
                                   {TStoneId3, item:attr(name, TStoneId3)};
                               _ -> {0, ""}
                           end,
    CraftLev = case lists:keyfind(5, #attr_base.type, Attr)
                   of
                   #attr_base{flag = TCraftLev} -> TCraftLev;
                   _ -> 0
               end,
    Add = [{item_id, BaseId},
           {name, Name},
           {fc, Fc},
           {enchant, Enchant},
           {skill_id, SkillId},
           {skill_name, SkillName},
           {stone1, Stone1},
           {stone_name1, StoneName1},
           {stone2, Stone2},
           {stone_name2, StoneName2},
           {stone3, Stone3},
           {stone_name3, StoneName3},
           {craft_lev, CraftLev}],
    adm_show(T, [Add | List]).

check_ext_loss(#item{type = Type, lev = Lev},
               #role{classes = Classes}) ->
    WeaponL = [1, 2, 3, 4, 5, 21, 22],
    Index = case Type of
                6 -> 2;
                7 -> 3;
                9 -> 4;
                10 -> 5;
                11 -> 6;
                12 -> 7;
                14 -> 8;
                _ ->
                    case lists:member(Type, WeaponL) of
                        true -> 1;
                        _ -> 0
                    end
            end,
    case Index of
        0 -> {false, lang:get("没有找到该装备类型的配置")};
        _ ->
            case blacksmith_data:get_target_skill_trans({Lev,
                                                         Classes})
                of
                false ->
                    case blacksmith_data:get_target_skill_trans({Lev, 0}) of
                        false ->
                            logger:info("~w,~w没有找到指定洗练的消耗数据",
                                        [Lev, Classes],
                                        blacksmith,
                                        2457),
                            {false, lang:get("该等级不能指定洗练特技")};
                        Tuple ->
                            case catch element(Index, Tuple) of
                                L when is_list(L) -> L;
                                _ -> {false, lang:get("该等级不能指定洗练特技")}
                            end
                    end;
                Tuple ->
                    case catch element(Index, Tuple) of
                        L when is_list(L) -> L;
                        _ -> {false, lang:get("该等级不能指定洗练特技")}
                    end
            end
    end.

repaire_comprehend(RoleId = {_, _, _}) ->
    case role_misc:is_local_role(RoleId) of
        true ->
            role:apply(async,
                       RoleId,
                       {blacksmith, repaire_comprehend, []});
        _ -> {error, lang:get("角色平台出错")}
    end;
repaire_comprehend(Role = #role{classes = Classes,
                                p_eqm = #package{items = Items}}) ->
    NItems = do_repaire(Classes, Items, []),
    NRole = case do_push(Role, Items, NItems) of
                false -> Role;
                _NR -> _NR
            end,
    {ok, NRole}.

do_repaire(_, [], NewItems) -> lists:reverse(NewItems);
do_repaire(Classes,
           [Eqm = #item{attr = Attrs, type = 6} | T], NewItems) ->
    NAttrs = [begin
                  case blacksmith_data:get_comprehend({Classes,
                                                       6,
                                                       CraftLev})
                      of
                      #{attr_type := AttrTypes} ->
                          case lists:keyfind(AName, 1, AttrTypes) of
                              {AName, _} -> AB;
                              _ when AName =:= 103 -> AB#attr_base{name = 101};
                              _ when AName =:= 105 -> AB#attr_base{name = 104};
                              _ -> AB
                          end;
                      _ -> AB
                  end
              end
              || AB = #attr_base{name = AName, flag = CraftLev}
                     <- Attrs],
    NEqm = Eqm#item{attr = NAttrs},
    do_repaire(Classes, T, [NEqm | NewItems]);
do_repaire(Classes, [Eqm | T], NewItems) ->
    do_repaire(Classes, T, [Eqm | NewItems]).

do_push(Role = #role{p_eqm = Peqm}, [Eqm | T1],
        [NewEqm | T2]) ->
    {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                          NewEqm,
                                          Peqm,
                                          Role),
    do_push(Role#role{p_eqm = NewPeqm}, T1, T2);
do_push(Role, [], []) -> Role;
do_push(_, [], _) -> false;
do_push(_, _, []) -> false.

