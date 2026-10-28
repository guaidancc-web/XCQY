-file("src/mod/market/market_silver.erl", 1).

-module(market_silver).

-behaviour(gen_server).

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

-file("src/mod/market/market_silver.erl", 25).

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

-file("src/mod/market/market_silver.erl", 26).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/market/market_silver.erl", 27).

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

-file("src/mod/market/market_silver.erl", 28).

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

-file("src/mod/market/market_silver.erl", 29).

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

-file("src/mod/market/market_silver.erl", 30).

-file("inc/log.hrl", 1).

-file("src/mod/market/market_silver.erl", 31).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/market/market_silver.erl", 32).

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

-file("src/mod/market/market_silver.erl", 33).

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

-file("src/mod/market/market_silver.erl", 34).

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

-file("src/mod/market/market_silver.erl", 35).

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

-file("src/mod/market/market_silver.erl", 36).

-file("inc/market_silver.hrl", 1).

-record(m_market_silver,
        {ver = 1,
         refresh_time = 0,
         is_first_on_sale = 1,
         refresh = []}).

-record(market_silver_shop,
        {ver = 2,
         rid,
         max_cell_id = 0,
         free_ids = [],
         cells = [],
         name = "",
         pid,
         last_logout = 0}).

-record(market_silver_shop_cell,
        {ver = 2,
         cell_id = 0,
         item_base_id = 0,
         num = 0,
         item_attrs = [],
         price = 0,
         expiry = 0,
         sold_num = 0,
         status = 0,
         system_price = 0,
         percent = 100,
         sale_time = 0}).

-record(market_silver_price,
        {ver = 3,
         item_base_id = 0,
         price = 0,
         sellers = [],
         deal_price = [],
         recover_num = 0,
         day_recover = 0,
         day_auto = 0,
         ext = []}).

-record(market_silver_refresh,
        {id = 0,
         item_base_id = 0,
         num = 0,
         item_attrs = [],
         price = 0,
         cell_id = 0,
         seller_id,
         status = 0}).

-record(market_silver_item_data,
        {base_id = 0,
         type = 0,
         step = 0,
         classes = 0,
         min_lev = 0,
         max_lev = 0,
         is_system = 1,
         is_quest_need = 0,
         def_price = 0,
         min_price = 0,
         max_price = 0,
         gain_label = coin,
         world_lev = 0,
         pre_base_id = 0,
         pre_pcnt = 1000,
         group = 0,
         group_id = 0,
         update_time,
         chain_type = 0,
         fix_price = 0}).

-record(market_silver_draw_item,
        {cell_id = 0,
         base_id = 0,
         num = 0,
         rest = 0,
         price = 0,
         pcnt = 0,
         attrs = []}).

-file("src/mod/market/market_silver.erl", 37).

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

-file("src/mod/market/market_silver.erl", 38).

-export([start_link/0,
         init/0,
         login/1,
         logout/1,
         level_up/1,
         reload/0,
         on_sale/3,
         on_sale_again/4,
         get_refresh_goods/3,
         buy/3,
         take_off/2,
         draw/2,
         one_click/2,
         get_goods_price/1,
         open_cell/1,
         refresh/2,
         get_pages/3,
         get_pages/4,
         get_silver_shop/1,
         exchange_gold/2,
         exchange_gold/3,
         push_shop/1,
         push_ico_mark/1,
         check_cell_draw_status/1,
         recover_timeout/1,
         set_cell_timer/1,
         callback_recover_timeout/2,
         query_market_price/1,
         auto_buy_market_price/1,
         auto_buy_seller/2,
         auto_buy_seller/3,
         recover_exp_bottle_water/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state,
        {reset_timer,
         recover_timer,
         platform = "",
         zone_id = 0}).

start_link() ->
    gen_server:start_link({local, market_silver},
                          market_silver,
                          [],
                          [{debug, [trace]}]).

init() -> #m_market_silver{}.

init_shop(#role{id = Rid, pid = Pid, name = Name}) ->
    gen_server:cast(market_silver,
                    {init_shop, {Rid, Pid, Name}}).

server_init_shop({Rid, Pid, Name}) ->
    Shop = #market_silver_shop{rid = Rid, name = Name,
                               pid = Pid, max_cell_id = 9,
                               free_ids = lists:seq(1, 9), cells = []},
    save(market_silver_shop_tab, Shop).

revise_shop_cells(#role{id = Rid}) ->
    gen_server:cast(market_silver,
                    {revise_shop_cells, Rid}).

server_revise_shop_cells(Rid) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{max_cell_id = MaxCellid}]
            when MaxCellid < 9 ->
            NewShop = server_revise_shop_cells(Shop, 9, 9),
            save(market_silver_shop_tab, NewShop),
            ok;
        _ -> ok
    end.

server_revise_shop_cells(Shop =
                             #market_silver_shop{max_cell_id = Count},
                         Count, MaxId) ->
    Shop#market_silver_shop{max_cell_id = MaxId};
server_revise_shop_cells(Shop =
                             #market_silver_shop{free_ids = FreeIds},
                         Count, MaxId) ->
    server_revise_shop_cells(Shop#market_silver_shop{free_ids
                                                         = [Count | FreeIds]},
                             Count - 1,
                             MaxId).

-spec login(#role{}) -> ok | {ok, #role{}}.

login(Role = #role{id = Rid, lev = Lev})
    when Lev >= 20 ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{max_cell_id = MaxCellid}]
            when MaxCellid < 9 ->
            revise_shop_cells(Role),
            case recover_timeout(Role, Shop) of
                false ->
                    Role2 = set_cell_timer2(Role, Shop),
                    set_cell_timer(Role2, Shop);
                ok -> Role
            end;
        [Shop] ->
            case recover_timeout(Role, Shop) of
                false ->
                    Role2 = set_cell_timer2(Role, Shop),
                    set_cell_timer(Role2, Shop);
                ok -> Role
            end;
        _ ->
            init_shop(Role),
            Role
    end,
    case refresh(1, Role) of
        {ok, NRole, _Rtn} -> {ok, NRole};
        false -> ok
    end;
login(_Role) -> ok.

logout(#role{id = Rid}) ->
    gen_server:cast(market_silver, {logout, Rid}),
    ok.

server_logout(Rid) ->
    Now = date:unixtime(),
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop] ->
            NewShop = Shop#market_silver_shop{last_logout = Now,
                                              pid = undefined},
            save(market_silver_shop_tab, NewShop);
        _ -> ok
    end.

level_up(Role = #role{lev = Lev, id = Rid})
    when Lev >= 20 ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [#market_silver_shop{max_cell_id = MaxCellid}]
            when MaxCellid < 9 ->
            revise_shop_cells(Role),
            Role;
        [_] -> Role;
        _ ->
            init_shop(Role),
            case Lev =:= 20 of
                true ->
                    case refresh(1, Role) of
                        {ok, NRole, _Rtn} -> NRole;
                        false -> Role
                    end;
                false -> Role
            end
    end;
level_up(Role) -> Role.

-spec save(Tab :: atom(), Data :: term()) -> boolean().

save(Tab, Data) ->
    case catch ets:insert(Tab, Data) of
        true ->
            case catch dets:insert(Tab, Data) of
                ok -> true;
                _ -> false
            end;
        _ -> false
    end.

-spec delete(Tab :: atom(), Key :: term()) -> boolean().

delete(Tab, Key) ->
    case catch ets:delete(Tab, Key) of
        true ->
            case catch dets:delete(Tab, Key) of
                ok -> true;
                _ -> false
            end;
        _ -> false
    end.

reload() ->
    gen_server:cast(market_silver, reload),
    ok.

on_sale(From, {ItemId, Num, Percent, CellId}, Role) ->
    case Num =< 5 of
        true ->
            case check_unbind(From, ItemId, Num, Role) of
                {ok, Label, Item} ->
                    on_sale(Item, Num, Percent, CellId, Label, Role);
                False -> False
            end;
        false -> {false, lang:get("同个摊位最多只能上架5个物品哟！")}
    end.

on_sale(Item = #item{base_id = ItemBaseId}, Num,
        Percent, CellId, Label, Role) ->
    case check_on_sale_cell(CellId, Role) of
        true ->
            case do_check_on_sale_price(ItemBaseId, Percent, Role)
                of
                {true, PrePrice} ->
                    do_on_sale(Item,
                               Num,
                               Label,
                               PrePrice,
                               Percent,
                               CellId,
                               Role);
                False -> False
            end;
        False -> False
    end.

check_unbind(From, ItemId, Num,
             #role{p_bag = PBag, p_store = PStore}) ->
    {Label, Unbind} = case From of
                          1 -> {item_id, check_unbind(PBag, ItemId, Num)};
                          2 ->
                              {item_id_store,
                               check_unbind(PStore, ItemId, Num)};
                          _ -> {false, false}
                      end,
    case Unbind of
        Item = #item{} -> {ok, Label, Item};
        False -> False
    end.

check_unbind(Package, ItemId, Num) ->
    case package:find(by_id, ItemId, Package) of
        {ok, Item = #item{bind = 0, quantity = Q}}
            when Q >= Num ->
            Item;
        {ok, #item{bind = 0}} -> {false, lang:get("上架物品数量不足")};
        {ok, #item{bind = 1}} ->
            {false,
             notice:format(lang:get("只能上架~ts的物品哟"),
                           [{string_2, 5, lang:get("非绑定")}])};
        _False -> {false, lang:get("未找到相应物品")}
    end.

do_on_sale(Item = #item{id = ItemId,
                        base_id = ItemBaseId, step = Step},
           Num, Label, PrePrice, Percent, CellId, Role) ->
    Loss = [#loss{label = Label, val = [{ItemId, Num}]}],
    case role_gain:do(Loss, Role) of
        {ok, LossRole = #role{id = RoleId}} ->
            Attrs = [{1, Step}],
            case case catch gen_server:call(market_silver,
                                            {on_sale,
                                             RoleId,
                                             {ItemBaseId,
                                              Num,
                                              PrePrice,
                                              Percent,
                                              CellId,
                                              Attrs}},
                                            10000)
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                ok ->
                    TimerRole = case set_cell_timer(LossRole) of
                                    {ok, SetTimerRole} -> SetTimerRole;
                                    _False -> LossRole
                                end,
                    TimerRole2 = case set_cell_timer2(TimerRole) of
                                     {ok, SetTimerRole2} -> SetTimerRole2;
                                     _False2 -> TimerRole
                                 end,
                    on_sale_reply(Item, Num, PrePrice, CellId, TimerRole2);
                _False -> false
            end;
        _ -> false
    end.

on_sale_reply(Item = #item{base_id = _BaseId}, Num,
              PrePrice, CellId,
              Role = #role{m_market_silver = MSilver}) ->
    push_shop(Role),
    FirstRole = Role#role{m_market_silver =
                              MSilver#m_market_silver{is_first_on_sale = 0}},
    NewRole =
        role_trigger:fire(#evt_market_silver_first_on_sale{},
                          FirstRole),
    LogText = log_on_sale_text(Item, Num, PrePrice, CellId),
    log:market(log_market_silver,
               Role,
               NewRole,
               "上架",
               LogText),
    {ok, NewRole}.

check_on_sale_cell(CellId, #role{id = RoleId}) ->
    case catch ets:lookup(market_silver_shop_tab, RoleId) of
        [#market_silver_shop{free_ids = []}] ->
            {false, lang:get("没有空的摊位")};
        [#market_silver_shop{free_ids = FreeIds}] ->
            case lists:member(CellId, FreeIds) of
                true -> true;
                false -> {false, lang:get("摊位已使用")}
            end;
        _ -> false
    end.

do_check_on_sale_price(ItemBaseId, Percent,
                       #role{lev = Lev}) ->
    case market_silver_data:get(ItemBaseId) of
        #market_silver_item_data{gain_label = gold}
            when Lev < 40 ->
            ItemName = item:attr(name, ItemBaseId),
            {false,
             notice:format(lang:get("~ts需要达到40级才能上架"),
                           [{string_2, 5, ItemName}])};
        #market_silver_item_data{min_price = MinPrice,
                                 max_price = MaxPrice} ->
            case catch ets:lookup(market_silver_price_tab,
                                  ItemBaseId)
                of
                [#market_silver_price{price = BasePrice}] ->
                    Hund = 100,
                    MinPcntBool = Hund * 5.0e-1 =< Percent,
                    MaxPcntBool = Percent =< Hund * 1.3,
                    case MinPcntBool andalso MaxPcntBool of
                        true ->
                            BasePrice1 = case MaxPrice =:= MinPrice of
                                             true -> MinPrice;
                                             false -> BasePrice
                                         end,
                            Price = util:floor(BasePrice1 * Percent / Hund),
                            MaxPriceBool = Price =< MaxPrice,
                            MinPriceBool = Price >= MinPrice,
                            case MaxPriceBool andalso MinPriceBool of
                                true -> {true, Price};
                                _False ->
                                    Args = [{item_2, ItemBaseId}, Percent],
                                    Msg = if MaxPriceBool =:= false ->
                                                 notice:format(lang:get("~ts不能再贵了，无法按~w%上架{face_1, 31}"),
                                                               Args);
                                             true ->
                                                 notice:format(lang:get("~ts不能再便宜了，无法按~w%上架{face_1, 21}"),
                                                               Args)
                                          end,
                                    {false, Msg}
                            end;
                        false ->
                            Args = [{item_2, ItemBaseId}, Percent],
                            Msg = if MinPcntBool =:= false ->
                                         notice:format(lang:get("~ts不能再便宜了，无法按~w%上架{face_1, 21}"),
                                                       Args);
                                     true ->
                                         notice:format(lang:get("~ts不能再贵了，无法按~w%上架{face_1, 31}"),
                                                       Args)
                                  end,
                            {false, Msg}
                    end;
                _False ->
                    logger:error("未找到物品[~w]价格",
                                 [ItemBaseId],
                                 market_silver,
                                 466),
                    false
            end;
        _False ->
            logger:error("没有该银币市场配置数据[ItemBaseId:~w]",
                         [ItemBaseId],
                         market_silver,
                         470),
            Msg = lang:get("这件商品不再出售，请点击下架吧{face_1,3}"),
            {false, Msg}
    end.

on_sale_again(CellId, Percent, Num, Role) ->
    case check_on_sale_again(CellId, Percent, Role) of
        {true,
         Cell = #market_silver_shop_cell{num = OldNum,
                                         sold_num = SoldNum, price = Price,
                                         item_base_id = ItemBaseId},
         PrePrice} ->
            if Num =:= OldNum ->
                   do_on_sale_again(CellId,
                                    SoldNum,
                                    Price,
                                    Num,
                                    PrePrice,
                                    Cell,
                                    Percent,
                                    Role,
                                    ItemBaseId);
               Num < OldNum ->
                   case role_gain:auto_overlap([#gain{label = item_base_id,
                                                      val =
                                                          [{ItemBaseId,
                                                            0,
                                                            OldNum - Num}]}],
                                               Role)
                       of
                       {ok, GainRole, _SucL, _FailL} ->
                           do_on_sale_again(CellId,
                                            SoldNum,
                                            Price,
                                            Num,
                                            PrePrice,
                                            Cell,
                                            Percent,
                                            GainRole,
                                            ItemBaseId);
                       {false, _} -> {false, lang:get("背包已满，无法重新上架")};
                       _Err -> false
                   end;
               true ->
                   Text = notice:format(lang:get("当前摊位上的物品数量不足~ts个"),
                                        [{string_2, 5, Num}]),
                   {false, Text}
            end;
        {false, Msg} -> {false, Msg};
        false -> false
    end.

do_on_sale_again(CellId, 0, _Price, Num, PrePrice, Cell,
                 Percent, Role = #role{id = Rid}, _ItemBaseId) ->
    ServerRtn = case case catch
                              gen_server:call(market_silver,
                                              {on_sale,
                                               Rid,
                                               {CellId,
                                                PrePrice,
                                                Num,
                                                Percent}},
                                              10000)
                         of
                         {'EXIT', {timeout, _}} -> {error, timeout};
                         {'EXIT', {noproc, _}} -> {error, noproc};
                         {'EXIT', {normal, _}} -> {error, exit};
                         {'EXIT', _Call_Err} -> {error, _Call_Err};
                         _Call_Return -> _Call_Return
                     end
                    of
                    ok ->
                        case set_cell_timer2(Role) of
                            {ok, SetTimerRole} -> set_cell_timer(SetTimerRole);
                            _False -> set_cell_timer(Role)
                        end;
                    _False -> false
                end,
    case ServerRtn of
        {ok, NRole} ->
            NewRole =
                role_trigger:fire(#evt_market_silver_first_on_sale{},
                                  NRole),
            push_shop(NewRole),
            notice:send(NewRole, 1, lang:get("重新上架成功")),
            LogText = log_on_sale_again_text(Cell, Num, PrePrice),
            log:market(log_market_silver,
                       Role,
                       NewRole,
                       "重新上架",
                       LogText),
            {ok, NewRole};
        _Unknow -> false
    end;
do_on_sale_again(CellId, SoldNum, Price, Num, PrePrice,
                 Cell, Percent, Role = #role{id = Rid}, ItemBaseId) ->
    TotalPrice = SoldNum * Price,
    ExtraCoin = util:ceil(TotalPrice * 5.0e-2),
    DiffCoin = TotalPrice - ExtraCoin,
    Gains = [#gain{label = coin, val = DiffCoin}],
    case role_gain:do(Gains, Role) of
        {ok, NRole} ->
            ServerRtn = case case catch
                                      gen_server:call(market_silver,
                                                      {on_sale,
                                                       Rid,
                                                       {CellId,
                                                        PrePrice,
                                                        Num,
                                                        Percent}},
                                                      10000)
                                 of
                                 {'EXIT', {timeout, _}} -> {error, timeout};
                                 {'EXIT', {noproc, _}} -> {error, noproc};
                                 {'EXIT', {normal, _}} -> {error, exit};
                                 {'EXIT', _Call_Err} -> {error, _Call_Err};
                                 _Call_Return -> _Call_Return
                             end
                            of
                            ok -> {ok, NRole};
                            {ok, _} ->
                                Timer = #timer{id = market_silver_cell_timer,
                                               timeout = 24 * 3600,
                                               m = market_silver,
                                               f = recover_timeout, a = []},
                                TimerRole = role_timer:set(Timer, NRole),
                                TimerRole2 = case set_cell_timer2(TimerRole) of
                                                 {ok, SetTimerRole} ->
                                                     SetTimerRole;
                                                 _False -> TimerRole
                                             end,
                                {ok, TimerRole2};
                            _False -> false
                        end,
            case ServerRtn of
                {ok, NewRole} ->
                    Text = notice:format(lang:get("重新上架成功，获得~ts，扣除手续费~ts"),
                                         [{assets_1, 90000, DiffCoin},
                                          {assets_1, 90000, ExtraCoin}]),
                    notice:send(NewRole, 1, Text),
                    push_shop(NewRole),
                    LogDrawText = log_draw_text(Cell,
                                                ExtraCoin,
                                                TotalPrice),
                    log:market(log_market_silver,
                               Role,
                               NewRole,
                               "提现",
                               LogDrawText),
                    log:new_market(log_market_silver,
                                   NewRole,
                                   "提现",
                                   TotalPrice,
                                   SoldNum,
                                   ItemBaseId,
                                   PrePrice,
                                   Num,
                                   ExtraCoin,
                                   coin,
                                   ""),
                    LogAgainText = log_on_sale_again_text(Cell,
                                                          Num,
                                                          PrePrice),
                    log:market(log_market_silver,
                               Role,
                               NewRole,
                               "重新上架",
                               LogAgainText),
                    {ok, NewRole};
                _ -> false
            end;
        _ -> false
    end.

check_on_sale_again(CellId, Percent,
                    Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [#market_silver_shop{cells = []}] ->
            {false, lang:get("物品无需重新上架")};
        [#market_silver_shop{cells = Cells}] ->
            case lists:keyfind(CellId,
                               #market_silver_shop_cell.cell_id,
                               Cells)
                of
                #market_silver_shop_cell{status = 2} ->
                    {false, lang:get("此物品现已不允许在市场上出售，无法重新上架")};
                #market_silver_shop_cell{status = 1} ->
                    {false, lang:get("物品已售出，无需再次上架")};
                Cell = #market_silver_shop_cell{status = Status,
                                                item_base_id = ItemBaseId}
                    when Status =:= 0 orelse
                             Status =:= 5 orelse Status =:= 6 ->
                    case do_check_on_sale_price(ItemBaseId, Percent, Role)
                        of
                        {true, PrePrice} -> {true, Cell, PrePrice};
                        Rtn -> Rtn
                    end;
                _Err -> {false, lang:get("未找到可上架的物品")}
            end;
        _ ->
            logger:error("未找到物品信息", [], market_silver, 594),
            false
    end.

get_refresh_goods(Type, RefreshId,
                  #role{m_market_silver =
                            #m_market_silver{refresh = Refresh}}) ->
    case lists:keyfind(Type, 1, Refresh) of
        {Type, List} ->
            case lists:keyfind(RefreshId,
                               #market_silver_refresh.id,
                               List)
                of
                RefreshGoods = #market_silver_refresh{} -> RefreshGoods;
                _Err -> false
            end;
        _Err -> false
    end.

buy(Type, RefreshId, Role = #role{lev = Lev})
    when Lev >= 30 ->
    case buy(Type, RefreshId, 1, Role) of
        {reply, Reply, NRole = #role{}} ->
            Evt = #evt_market_silver_buy{num = 1},
            FireRole = role_trigger:fire(Evt, NRole),
            NewRole = FireRole,
            {reply, Reply, NewRole};
        Rtn -> Rtn
    end;
buy(_Type, _RefreshId, _Role) ->
    {false, lang:get("30级以上才能购买道具，努力升级吧{face_1, 18}")}.

buy(Type, RefreshId, PurchsNum,
    Role = #role{id = Rid}) ->
    case get_refresh_goods(Type, RefreshId, Role) of
        #market_silver_refresh{seller_id = Rid} ->
            {false, lang:get("这是您自己出售的物品")};
        #market_silver_refresh{status = 1, num = Num} ->
            {reply,
             {0, Type, RefreshId, 1, Num},
             lang:get("此物品已被您购买完啦")};
        #market_silver_refresh{status = 2, num = Num} ->
            {reply,
             {0, Type, RefreshId, 2, Num},
             lang:get("来晚了一步，物品已被他人购买啦")};
        #market_silver_refresh{status = 3, num = Num} ->
            {reply,
             {0, Type, RefreshId, 2, Num},
             lang:get("来晚了一步，该道具已售罄")};
        RefreshGoods = #market_silver_refresh{cell_id = 0,
                                              num = Num}
            when Num >= PurchsNum ->
            buy_system(RefreshGoods, Type, PurchsNum, Role);
        RefreshGoods = #market_silver_refresh{status = 0,
                                              cell_id = CellId,
                                              seller_id = SellerId}
            when CellId > 0 ->
            case buy_seller(CellId, SellerId, PurchsNum, Role) of
                {ok, RestNum, NRole} ->
                    Status = case RestNum > 0 of
                                 true -> 0;
                                 false -> 1
                             end,
                    NewRefreshGoods =
                        RefreshGoods#market_silver_refresh{status = Status},
                    NewRole = replace_refresh_goods(NRole,
                                                    Type,
                                                    NewRefreshGoods),
                    {reply, {1, Type, RefreshId, Status, RestNum}, NewRole};
                {false, 2} ->
                    NewRefreshGoods =
                        RefreshGoods#market_silver_refresh{status = 2},
                    NewRole = replace_refresh_goods(Role,
                                                    Type,
                                                    NewRefreshGoods),
                    {reply,
                     {0, Type, RefreshId, 2, 0},
                     lang:get("来晚了一步，该道具已售罄"),
                     NewRole};
                {false, 3} ->
                    NewRefreshGoods =
                        RefreshGoods#market_silver_refresh{status = 3},
                    NewRole = replace_refresh_goods(Role,
                                                    Type,
                                                    NewRefreshGoods),
                    {reply,
                     {0, Type, RefreshId, 2, 0},
                     lang:get("来晚了一步，该道具已售罄"),
                     NewRole};
                {false, Int} when is_integer(Int) ->
                    {reply,
                     {0, Type, RefreshId, 4, 0},
                     lang:get("来晚了一步，该道具已售罄")};
                {false, Msg} ->
                    {reply, {0, Type, RefreshId, 4, 0}, Msg};
                false ->
                    {reply,
                     {0, Type, RefreshId, 4, 0},
                     lang:get("来晚了一步，该道具已售罄")}
            end;
        _False -> {false, lang:get("来晚了一步，该道具已售罄")}
    end.

replace_refresh_goods(Role = #role{m_market_silver =
                                       MMarketSilver = #m_market_silver{refresh
                                                                            =
                                                                            Refresh}},
                      Type, RefreshGoods = #market_silver_refresh{id = Id}) ->
    case lists:keytake(Type, 1, Refresh) of
        {value, {Type, List}, RestRefresh} ->
            NewList = lists:keystore(Id,
                                     #market_silver_refresh.id,
                                     List,
                                     RefreshGoods),
            NewRefresh = [{Type, NewList} | RestRefresh],
            NewMSilver = MMarketSilver#m_market_silver{refresh =
                                                           NewRefresh},
            Role#role{m_market_silver = NewMSilver};
        false -> Role
    end.

buy_system(RefreshGoods = #market_silver_refresh{id =
                                                     RefreshId,
                                                 item_base_id = ItemBaseId,
                                                 num = Num, price = Price,
                                                 item_attrs = Attrs},
           Type, PurchsNum, Role) ->
    {Step, GainLabel, LossMsg} = case
                                     market_silver_data:get(ItemBaseId)
                                     of
                                     #market_silver_item_data{gain_label = gold,
                                                              step = StepCfg} ->
                                         {StepCfg, gold, lang:get("钻石不足，无法购买")};
                                     #market_silver_item_data{gain_label =
                                                                  gold_bind,
                                                              step = StepCfg} ->
                                         {StepCfg,
                                          gold_bind,
                                          lang:get("金币不足，无法购买")};
                                     #market_silver_item_data{gain_label = coin,
                                                              step = StepCfg} ->
                                         {StepCfg, coin, lang:get("银币不足，无法购买")};
                                     _False -> {0, coin, lang:get("银币不足，无法购买")}
                                 end,
    Discount = case
                   buff:is_special_effect_exists_one_param(Role, 9)
                   of
                   {true, ValueAdd} -> ValueAdd;
                   _ -> 0
               end,
    Price1 = util:ceil(Price * (1000 - Discount) / 1000),
    logger:debug("购买银币市场价格因每日运势优化，优惠前价格:~w,优惠后:~w",
                 [Price, Price1],
                 market_silver,
                 709),
    TotalPrice = util:ceil(Price1 * PurchsNum),
    Loss = [#loss{label = GainLabel, val = TotalPrice,
                  msg = LossMsg}],
    case role_gain:do(Loss, Role) of
        {ok, LossRole} ->
            Items = case lists:keyfind(1, 1, Attrs) of
                        {_, AttrStep} ->
                            [#{base_id => ItemBaseId, bind => 1,
                               quantity => PurchsNum, step => AttrStep}];
                        _ ->
                            [#{base_id => ItemBaseId, bind => 1,
                               quantity => PurchsNum, step => Step}]
                    end,
            Gain = [#gain{label = item_base_id, val = Items}],
            logger:debug("=========:~w",
                         [Gain],
                         market_silver,
                         722),
            case role_gain:auto_overlap(Gain, LossRole) of
                {ok, NRole, SucL, _FailL} ->
                    RestNum = Num - PurchsNum,
                    Text = format:gain_text(Loss ++ SucL, NRole),
                    notice:send(NRole, 3, Text),
                    Status = case RestNum > 0 of
                                 true -> 0;
                                 false -> 1
                             end,
                    NewRefreshGoods = RefreshGoods#market_silver_refresh{num
                                                                             =
                                                                             RestNum,
                                                                         status
                                                                             =
                                                                             Status},
                    NewRole = replace_refresh_goods(NRole,
                                                    Type,
                                                    NewRefreshGoods),
                    record_recover_timeout(ItemBaseId, PurchsNum),
                    LogText = log_purchs_text(default, Loss, Items),
                    log:market(log_market_silver,
                               Role,
                               NewRole,
                               "购买系统物品",
                               LogText),
                    log:new_market(log_market_silver,
                                   NewRole,
                                   "购买系统物品",
                                   TotalPrice,
                                   PurchsNum,
                                   ItemBaseId,
                                   Price1,
                                   RestNum,
                                   0,
                                   GainLabel,
                                   ""),
                    {reply, {1, Type, RefreshId, Status, RestNum}, NewRole};
                {false, _} ->
                    {reply,
                     {0, Type, RefreshId, 4, 0},
                     lang:get("背包已满，请先整理背包")};
                _ -> false
            end;
        {false, #loss{msg = Msg}} -> {false, Msg};
        _ -> {false, lang:get("银币不足")}
    end.

buy_seller(#market_silver_shop_cell{cell_id = CellId,
                                    item_base_id = ItemBaseId,
                                    item_attrs = Attrs, system_price = SysPrice,
                                    price = OldPrice},
           #market_silver_shop{rid = SellerId, name = SellerName},
           PurchsNum, Role) ->
    {GainLabel, LossMsg} = case
                               market_silver_data:get(ItemBaseId)
                               of
                               #market_silver_item_data{gain_label = gold} ->
                                   {gold, lang:get("钻石不足，无法购买")};
                               #market_silver_item_data{gain_label =
                                                            gold_bind} ->
                                   {gold_bind, lang:get("金币不足，无法购买")};
                               _NotFound -> {coin, lang:get("银币不足，无法购买")}
                           end,
    Price = case SysPrice =:= 0 of
                true -> calc_system_price(OldPrice);
                false -> SysPrice
            end,
    Discount = case
                   buff:is_special_effect_exists_one_param(Role, 9)
                   of
                   {true, ValueAdd} -> ValueAdd;
                   _ -> 0
               end,
    Price1 = util:ceil(Price * (1000 - Discount) / 1000),
    logger:debug("购买银币市场价格因每日运势优化，优惠前价格:~w,优惠后:~w",
                 [Price, Price1],
                 market_silver,
                 781),
    TotalPrice = util:ceil(Price1 * PurchsNum),
    Loss = [#loss{label = GainLabel, val = TotalPrice,
                  msg = LossMsg}],
    case role_gain:do(Loss, Role) of
        {ok, LossRole = #role{id = Rid}} ->
            Items = case lists:keyfind(1, 1, Attrs) of
                        {_, Step} ->
                            [#{base_id => ItemBaseId, bind => 1,
                               quantity => PurchsNum, step => Step}];
                        _False ->
                            [#{base_id => ItemBaseId, bind => 1,
                               quantity => PurchsNum}]
                    end,
            Gain = [#gain{label = item_base_id, val = Items}],
            case role_gain:auto_overlap(Gain, LossRole) of
                {ok, NRole, SucL, _FailL} ->
                    case case catch gen_server:call(market_silver,
                                                    {buy,
                                                     Rid,
                                                     {CellId,
                                                      SellerId,
                                                      PurchsNum}},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        {ok, RestNum} ->
                            Text = format:gain_text(Loss ++ SucL, NRole),
                            notice:send(NRole, 3, Text),
                            LogText = log_purchs_text({SellerId,
                                                       SellerName,
                                                       CellId},
                                                      Loss,
                                                      Items),
                            log:market(log_market_silver,
                                       Role,
                                       NRole,
                                       "购买玩家物品",
                                       LogText),
                            log:new_market(log_market_silver,
                                           NRole,
                                           "购买玩家物品",
                                           TotalPrice,
                                           PurchsNum,
                                           ItemBaseId,
                                           Price1,
                                           RestNum,
                                           0,
                                           GainLabel,
                                           ""),
                            {ok, RestNum, NRole};
                        Rtn = {false, _Msg} -> Rtn;
                        false -> false
                    end;
                {false, #gain{msg = Msg}} -> {false, Msg};
                _ -> false
            end;
        {false, #loss{msg = Msg}} -> {false, Msg};
        _False -> false
    end;
buy_seller(CellId, SellerId, PurchsNum,
           Role = #role{m_market_silver =
                            #m_market_silver{refresh_time = RefreshTime}}) ->
    case catch ets:lookup(market_silver_shop_tab, SellerId)
        of
        [Shop = #market_silver_shop{cells = Cells}] ->
            Now = date:unixtime(),
            case lists:keyfind(CellId,
                               #market_silver_shop_cell.cell_id,
                               Cells)
                of
                #market_silver_shop_cell{status = 1} -> {false, 2};
                #market_silver_shop_cell{status = 0, expiry = Timeout}
                    when Now >= Timeout ->
                    {false, 3};
                Cell = #market_silver_shop_cell{status = Status,
                                                num = Num, expiry = Timeout}
                    when RefreshTime - 120 + 24 * 3600 >= Timeout andalso
                             RefreshTime - 120 < Timeout andalso
                                 (Status =:= 0 orelse Status =:= 5) andalso
                                     Num >= PurchsNum ->
                    buy_seller(Cell, Shop, PurchsNum, Role);
                #market_silver_shop_cell{} -> {false, 3};
                _False -> false
            end;
        _False -> false
    end.

auto_buy_market_price(BaseId) ->
    case market_silver_data:get(BaseId) of
        Data = #market_silver_item_data{gain_label =
                                            GainLabel} ->
            case catch ets:lookup(market_silver_price_tab, BaseId)
                of
                [#market_silver_price{sellers = Sellers, price = Price}]
                    when GainLabel =:= gold orelse
                             GainLabel =:= gold_bind ->
                    Now = date:unixtime(),
                    case check_auto_buy_gold(Sellers, Now) of
                        true -> query_market_price(Price, Data);
                        _ ->
                            ItemName = item:attr(name, BaseId),
                            Msg = util:flist(lang:get("没有物品~ts可购买"),
                                             [ItemName]),
                            {false, Msg}
                    end;
                [_Price = #market_silver_price{price = Price}] ->
                    query_market_price(Price, Data);
                _False ->
                    logger:error("未知银币市场物品[BaseId:~w]",
                                 [BaseId],
                                 market_silver,
                                 864),
                    false
            end;
        _ -> false
    end.

check_auto_buy_gold([], _Now) -> false;
check_auto_buy_gold([{Rid, CellId} | Rest], Now) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [#market_silver_shop{cells = Cells}] ->
            case lists:keyfind(CellId,
                               #market_silver_shop_cell.cell_id,
                               Cells)
                of
                #market_silver_shop_cell{status = Status,
                                         expiry = Expiry}
                    when (Status =:= 0 orelse Status =:= 5) andalso
                             Expiry > Now ->
                    true;
                _ -> check_auto_buy_gold(Rest, Now)
            end;
        _ -> check_auto_buy_gold(Rest, Now)
    end;
check_auto_buy_gold(_, _Now) -> false.

auto_buy_seller(ItemInfo, _Role) ->
    gen_server:cast(market_silver,
                    {auto_buy_seller, ItemInfo}).

auto_buy_seller(BaseId, BuyNum, _Role) ->
    gen_server:cast(market_silver,
                    {auto_buy_seller, [{BaseId, BuyNum}]}).

take_off(CellId, Role = #role{id = Rid, pid = Pid}) ->
    case get_cell(CellId, Role) of
        {ok, #market_silver_shop_cell{status = 1}} ->
            draw(CellId, Role);
        {ok, #market_silver_shop_cell{status = 5}} ->
            role:apply(async, Pid, {market_silver, push_shop, []}),
            false;
        {ok,
         Cell = #market_silver_shop_cell{status = Status,
                                         item_base_id = ItemBaseId, num = Num,
                                         item_attrs = ItemAttrs,
                                         price = _Price}}
            when Status =:= 0 orelse
                     Status =:= 6 orelse Status =:= 2 ->
            Step = case lists:keyfind(1, 1, ItemAttrs) of
                       {1, StepAttr} -> StepAttr;
                       _False ->
                           case market_silver_data:get(ItemBaseId) of
                               #market_silver_item_data{step = StepAttr} ->
                                   StepAttr;
                               _False -> 0
                           end
                   end,
            Items = [#{base_id => ItemBaseId, bind => 0,
                       quantity => Num, step => Step}],
            Gain = [#gain{label = item_base_id, val = Items}],
            case role_gain:auto_overlap(Gain, Role) of
                {ok, NRole, _SucL, _FailL} ->
                    case case catch gen_server:call(market_silver,
                                                    {take_off, Rid, {CellId}},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        {ok, _Else} ->
                            logger:debug("=========:~w",
                                         [_Else],
                                         market_silver,
                                         921),
                            push_shop(NRole),
                            push_take_off(NRole, {CellId, 1}),
                            NewRole = case set_cell_timer(NRole) of
                                          {ok, TimerRole} ->
                                              case set_cell_timer2(TimerRole) of
                                                  {ok, TimerRole2} ->
                                                      TimerRole2;
                                                  _ -> TimerRole
                                              end;
                                          _Ok ->
                                              role_timer:del(market_silver_cell_timer,
                                                             NRole)
                                      end,
                            LogText = log_take_off_text(Cell, Items),
                            log:market(log_market_silver,
                                       Role,
                                       NewRole,
                                       "下架",
                                       LogText),
                            {ok, NewRole};
                        {false, 1} -> {false, 1};
                        _Reply -> false
                    end;
                {false, #gain{msg = Msg}} -> {false, Msg};
                _Fail -> ok
            end;
        _False -> false
    end.

draw(CellId, Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [#market_silver_shop{cells = Cells}] ->
            case lists:keyfind(CellId,
                               #market_silver_shop_cell.cell_id,
                               Cells)
                of
                Cell = #market_silver_shop_cell{} ->
                    do_draw(Cell, Role);
                _ -> false
            end;
        _ -> false
    end.

do_draw(Cell = #market_silver_shop_cell{cell_id =
                                            CellId,
                                        item_base_id = ItemBaseId},
        Role = #role{id = Rid}) ->
    case case catch gen_server:call(market_silver,
                                    {draw, Rid, {CellId}},
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {ok, #market_silver_draw_item{num = 0}} ->
            {false, lang:get("该摊位物品还未被购买，无法提现")};
        {ok,
         DrawItem = #market_silver_draw_item{price = Price,
                                             num = SoldNum, rest = RestNum}} ->
            GainVal = Price * SoldNum,
            Format = lang:get("提现成功，扣除手续费~ts，获得~ts"),
            {GainLabel, Fee, NewGainVal, FormatArgs} = case
                                                           market_silver_data:get(ItemBaseId)
                                                           of
                                                           #market_silver_item_data{gain_label
                                                                                        =
                                                                                        gold} ->
                                                               GoldFee1 =
                                                                   erlang:max(util:ceil(GainVal
                                                                                            *
                                                                                            2.0e-1),
                                                                              1),
                                                               GoldFee =
                                                                   calc_pray_discount_draw(Role,
                                                                                           GoldFee1),
                                                               GainGold =
                                                                   GainVal -
                                                                       GoldFee,
                                                               GoldFmtArgs =
                                                                   [{assets_1,
                                                                     90002,
                                                                     GoldFee},
                                                                    {assets_1,
                                                                     90002,
                                                                     GainGold}],
                                                               {gold,
                                                                GoldFee,
                                                                GainGold,
                                                                GoldFmtArgs};
                                                           #market_silver_item_data{gain_label
                                                                                        =
                                                                                        gold_bind} ->
                                                               GoldFee1 =
                                                                   erlang:max(util:ceil(GainVal
                                                                                            *
                                                                                            1.0e-1),
                                                                              1),
                                                               GoldFee =
                                                                   calc_pray_discount_draw(Role,
                                                                                           GoldFee1),
                                                               GainGold =
                                                                   GainVal -
                                                                       GoldFee,
                                                               GoldFmtArgs =
                                                                   [{assets_1,
                                                                     90003,
                                                                     GoldFee},
                                                                    {assets_1,
                                                                     90003,
                                                                     GainGold}],
                                                               {gold_bind,
                                                                GoldFee,
                                                                GainGold,
                                                                GoldFmtArgs};
                                                           _Other ->
                                                               CoinFee1 =
                                                                   util:ceil(GainVal
                                                                                 *
                                                                                 5.0e-2),
                                                               CoinFee =
                                                                   calc_pray_discount_draw(Role,
                                                                                           CoinFee1),
                                                               GainCoin =
                                                                   GainVal -
                                                                       CoinFee,
                                                               CoinFmtArgs =
                                                                   [{assets_1,
                                                                     90000,
                                                                     CoinFee},
                                                                    {assets_1,
                                                                     90000,
                                                                     GainCoin}],
                                                               {coin,
                                                                CoinFee,
                                                                GainCoin,
                                                                CoinFmtArgs}
                                                       end,
            Gain = [#gain{label = GainLabel, val = NewGainVal}],
            case role_gain:do(Gain, Role) of
                {ok, NRole} ->
                    SoldEvt = #evt_market_silver_sold{assets =
                                                          [{GainLabel,
                                                            NewGainVal}],
                                                      sold_items = [DrawItem]},
                    SoldFireRole = role_trigger:fire(SoldEvt, NRole),
                    NewRole = SoldFireRole,
                    Text = notice:format(Format, FormatArgs),
                    notice:send(NewRole, 3, Text),
                    push_shop(NewRole),
                    push_draw(NewRole, {CellId, 1}),
                    LogText = log_draw_text(Cell, Fee, NewGainVal),
                    log:market(log_market_silver,
                               Role,
                               NewRole,
                               "提现",
                               LogText),
                    log:new_market(log_market_silver,
                                   NewRole,
                                   "提现",
                                   NewGainVal,
                                   SoldNum,
                                   ItemBaseId,
                                   Price,
                                   RestNum,
                                   Fee,
                                   GainLabel,
                                   ""),
                    {ok, NewRole};
                _ -> false
            end;
        false -> false
    end.

calc_pray_discount_draw(Role, Fee) ->
    Value = case
                buff:is_special_effect_exists_one_param(Role, 10)
                of
                {true, ValueAdd} -> ValueAdd;
                _ -> 0
            end,
    util:ceil(Fee * (1000 - Value) / 1000).

draw_gain([], CoinFee, Coin, GoldFee, Gold, GoldBindFee,
          GoldBind, Logs, _Role) ->
    {util:ceil(CoinFee),
     util:ceil(Coin),
     util:ceil(GoldFee),
     util:ceil(Gold),
     util:ceil(GoldBindFee),
     util:ceil(GoldBind),
     Logs};
draw_gain([#market_silver_draw_item{base_id = BaseId,
                                    price = Price, num = Num, cell_id = CellId,
                                    attrs = Attrs, rest = RestNum}
           | Rest],
          CoinFee, Coin, GoldFee, Gold, GoldBindFee, GoldBind,
          Logs, Role) ->
    case market_silver_data:get(BaseId) of
        #market_silver_item_data{gain_label = gold} ->
            Total = Price * Num,
            AddFee1 = Total * 2.0e-1,
            AddFee = calc_pray_discount_draw(Role, AddFee1),
            GainGold = Total - AddFee,
            Log = #{base_id => BaseId, label => gold,
                    price => Price, num => Num, fee => AddFee,
                    gain_val => GainGold, attrs => Attrs, cell_id => CellId,
                    rest => RestNum},
            draw_gain(Rest,
                      CoinFee,
                      Coin,
                      GoldFee + AddFee,
                      Gold + GainGold,
                      GoldBindFee,
                      GoldBind,
                      [Log | Logs],
                      Role);
        #market_silver_item_data{gain_label = gold_bind} ->
            Total = Price * Num,
            AddFee1 = Total * 1.0e-1,
            AddFee = calc_pray_discount_draw(Role, AddFee1),
            GainGoldBind = Total - AddFee,
            Log = #{base_id => BaseId, label => gold_bind,
                    price => Price, num => Num, fee => AddFee,
                    gain_val => GainGoldBind, attrs => Attrs,
                    cell_id => CellId, rest => RestNum},
            draw_gain(Rest,
                      CoinFee,
                      Coin,
                      GoldFee,
                      Gold,
                      GoldBindFee + AddFee,
                      GoldBind + GainGoldBind,
                      [Log | Logs],
                      Role);
        _Other ->
            Total = Price * Num,
            AddFee1 = Total * 5.0e-2,
            AddFee = calc_pray_discount_draw(Role, AddFee1),
            GainCoin = Total - AddFee,
            Log = #{base_id => BaseId, label => coin,
                    price => Price, num => Num, fee => AddFee,
                    gain_val => GainCoin, attrs => Attrs, cell_id => CellId,
                    rest => RestNum},
            draw_gain(Rest,
                      CoinFee + AddFee,
                      Coin + GainCoin,
                      GoldFee,
                      Gold,
                      GoldBindFee,
                      GoldBind,
                      [Log | Logs],
                      Role)
    end.

one_click(Type = 2, Role = #role{id = Rid}) ->
    case case catch gen_server:call(market_silver,
                                    {one_click, Rid, {Type}},
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {ok, []} -> {false, lang:get("没有摊位可以提现")};
        {ok, GainAcc} ->
            {Loss, Gain, Logs} = case draw_gain(GainAcc,
                                                0,
                                                0,
                                                0,
                                                0,
                                                0,
                                                0,
                                                [],
                                                Role)
                                     of
                                     {0, _, GoldFee, Gold, 0, _, RtnLogs} ->
                                         LossGold = [#loss{label = gold,
                                                           val = GoldFee}],
                                         GainGold = [#gain{label = gold,
                                                           val = Gold}],
                                         {LossGold, GainGold, RtnLogs};
                                     {CoinFee, Coin, 0, _, 0, _, RtnLogs} ->
                                         LossCoin = [#loss{label = coin,
                                                           val = CoinFee}],
                                         GainList = [#gain{label = coin,
                                                           val = Coin}],
                                         {LossCoin, GainList, RtnLogs};
                                     {0,
                                      _,
                                      0,
                                      _,
                                      GoldBindFee,
                                      GoldBind,
                                      RtnLogs} ->
                                         LossCoin = [#loss{label = gold_bind,
                                                           val = GoldBindFee}],
                                         GainList = [#gain{label = gold_bind,
                                                           val = GoldBind}],
                                         {LossCoin, GainList, RtnLogs};
                                     {CoinFee,
                                      Coin,
                                      GoldFee,
                                      Gold,
                                      GoldBindFee,
                                      GoldBind,
                                      RtnLogs} ->
                                         LossCoin = [#loss{label = coin,
                                                           val = CoinFee},
                                                     #loss{label = gold,
                                                           val = GoldFee},
                                                     #loss{label = gold_bind,
                                                           val = GoldBindFee}],
                                         GainList = [#gain{label = coin,
                                                           val = Coin},
                                                     #gain{label = gold,
                                                           val = Gold},
                                                     #gain{label = gold_bind,
                                                           val = GoldBind}],
                                         {LossCoin, GainList, RtnLogs}
                                 end,
            LossTag = lang:get("扣除手续费"),
            Msg = format:gain_text(Loss ++ Gain,
                                   #gain_text_opts{loss_tag = LossTag},
                                   Role),
            role:send_buff_begin(),
            case role_gain:do(Gain, Role) of
                {ok, NRole} ->
                    GainAssets = draw_assets_evts(Gain, []),
                    SoldEvt = #evt_market_silver_sold{assets = GainAssets,
                                                      sold_items = GainAcc},
                    SoldFireRole = role_trigger:fire(SoldEvt, NRole),
                    NewRole = SoldFireRole,
                    Text = util:flist(lang:get("提现成功，~ts"), [Msg]),
                    notice:send(NRole, 3, Text),
                    push_shop(NRole),
                    log_one_click_draw_text(Logs, Role, NewRole),
                    role:send_buff_flush(),
                    {ok, NewRole};
                _ ->
                    role:send_buff_clean(),
                    false
            end;
        false -> false
    end;
one_click(Type = 1, Role = #role{id = Rid}) ->
    case case catch gen_server:call(market_silver,
                                    {one_click, Rid, {Type}},
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {ok, false} -> {false, lang:get("没有可以重新上架的物品")};
        {ok, RepeatCells} when is_list(RepeatCells) ->
            notice:send(Role, 1, lang:get("重新上架成功")),
            push_shop(Role),
            log_one_click_sale_text(RepeatCells, Role),
            case set_cell_timer2(Role) of
                {ok, SetTimerRole} -> set_cell_timer(SetTimerRole);
                _False -> set_cell_timer(Role)
            end;
        _False ->
            logger:error("一键上架错误:~w",
                         [_False],
                         market_silver,
                         1130),
            {false, lang:get("没有可以重新上架的物品")}
    end;
one_click(_Type, _Role) -> ok.

draw_assets_evts([], Evts) -> Evts;
draw_assets_evts([#gain{label = Label, val = Val}
                  | Rest],
                 Evts) ->
    draw_assets_evts(Rest, [{Label, Val} | Evts]);
draw_assets_evts([_ | Rest], Evts) ->
    draw_assets_evts(Rest, Evts).

get_silver_shop(#role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{}] -> {ok, Shop};
        [] -> false;
        false -> false
    end.

get_goods_price(ItemBaseId) ->
    case catch ets:lookup(market_silver_price_tab,
                          ItemBaseId)
        of
        [#market_silver_price{price = GoodsPrice}] ->
            {ok, GoodsPrice};
        [] ->
            logger:debug("未知银币市场物品[Id:~w]",
                         [ItemBaseId],
                         market_silver,
                         1152),
            false;
        _ -> false
    end.

get_pages(Start, End, Role) ->
    get_pages([1, 2, 3, 4, 5, 6], Start, End, Role, []).

get_pages([], _Start, _End, _Role, Acc) -> Acc;
get_pages([Type | Rest], Start, End, Role, Acc) ->
    List = get_pages(Type, Start, End, Role),
    get_pages(Rest, Start, End, Role, [{Type, List} | Acc]).

get_pages(Type, Start, End,
          #role{m_market_silver =
                    #m_market_silver{refresh = Refresh}})
    when End > Start ->
    case lists:keyfind(Type, 1, Refresh) of
        {_, []} -> [];
        {_, List} -> List;
        false ->
            logger:error("没有分页数据[type:~w, start:~w, end:~w]",
                         [Type, Start, End],
                         market_silver,
                         1184),
            []
    end;
get_pages(Type, Start, End, _Role) ->
    logger:error("没有分页数据[type:~w, start:~w, end:~w]",
                 [Type, Start, End],
                 market_silver,
                 1188),
    [].

open_cell(Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [#market_silver_shop{max_cell_id = MaxId}]
            when MaxId < 15 ->
            case market_silver_data:get_cell_loss(MaxId + 1) of
                Loss = [_ | _] ->
                    case role_gain:do_notice(Loss, Role) of
                        Rtn = {ok, LossRole = #role{id = Rid}} ->
                            case case catch gen_server:call(market_silver,
                                                            {open_cell, Rid},
                                                            10000)
                                     of
                                     {'EXIT', {timeout, _}} -> {error, timeout};
                                     {'EXIT', {noproc, _}} -> {error, noproc};
                                     {'EXIT', {normal, _}} -> {error, exit};
                                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                                     _Call_Return -> _Call_Return
                                 end
                                of
                                ok ->
                                    push_shop(LossRole),
                                    LogText = log_open_cell_text(MaxId + 1,
                                                                 Loss),
                                    log:market(log_market_silver,
                                               Role,
                                               LossRole,
                                               "开放摊位",
                                               LogText),
                                    Rtn;
                                false -> false
                            end;
                        {false, #loss{label = coin}} ->
                            {false, lang:get("银币不足")};
                        {false, #loss{label = gold}} ->
                            {false, lang:get("钻石不足")};
                        _ -> false
                    end;
                _ -> false
            end;
        _False -> {false, lang:get("最多只可以开启15个格子哟!")}
    end.

query_market_price(BaseId) ->
    case market_silver_data:get(BaseId) of
        Data = #market_silver_item_data{} ->
            case catch ets:lookup(market_silver_price_tab, BaseId)
                of
                [#market_silver_price{price = Price,
                                      sellers = [{SellerId, CellId} | _]}] ->
                    query_market_price(Price,
                                       Data,
                                       #{seller_id => SellerId,
                                         cell_id => CellId});
                [#market_silver_price{price = Price}] ->
                    query_market_price(Price, Data);
                _False ->
                    logger:error("未知银币市场物品[BaseId:~w]",
                                 [BaseId],
                                 market_silver,
                                 1226),
                    false
            end;
        _ ->
            logger:error("未知银币市场物品[BaseId:~w]",
                         [BaseId],
                         market_silver,
                         1230),
            false
    end.

query_market_price(Price, Data) ->
    query_market_price(Price,
                       Data,
                       #{seller_id => 0, cell_id => 0}).

query_market_price(Price,
                   #market_silver_item_data{gain_label = Label,
                                            base_id = BaseId},
                   #{seller_id := _SellerId, cell_id := CellId}) ->
    {Assets, Pcnt} = case Label of
                         coin -> {90000, 1.1};
                         gold_bind -> {90003, 1.1};
                         _ -> {90002, 1.3}
                     end,
    NewPrice = util:ceil(Price * Pcnt),
    MarketPrice = #market_price{base_id = BaseId,
                                price = NewPrice, assets = Assets, source = 3,
                                val2 = CellId},
    {ok, MarketPrice}.

exchange_gold(Coin, Role) ->
    {WorldLev, _Time} = world_lev:get_world_lev(Role),
    case market_silver_data:get_exchange(WorldLev) of
        Rate when is_integer(Rate) ->
            {ok, util:ceil(Coin / Rate)};
        _None -> false
    end.

exchange_gold(BaseId, Num, Role) ->
    {WorldLev, _Time} = world_lev:get_world_lev(Role),
    case market_silver_data:get_exchange(WorldLev) of
        Rate when is_integer(Rate) ->
            case case catch ets:lookup(market_silver_price_tab,
                                       BaseId)
                     of
                     [#market_silver_price{price = GoodsPrice}] ->
                         {ok, GoodsPrice};
                     [] ->
                         logger:debug("未知银币市场物品[Id:~w]",
                                      [BaseId],
                                      market_silver,
                                      1265),
                         false;
                     _ -> false
                 end
                of
                {ok, UnitPrice} ->
                    {ok, util:ceil(UnitPrice / Rate) * Num};
                false -> false
            end;
        _None -> false
    end.

refresh(2, Role) ->
    Loss = [#loss{label = gold_bind, val = 300}],
    case role_gain:do_notice(Loss, Role) of
        {ok,
         LossRole = #role{m_market_silver = MMarketSilver}} ->
            TypeGoods = do_refresh(LossRole),
            Now = date:unixtime(),
            Time = Now + 120 -
                       month_card:get_privilege(Role, market_silver_refresh),
            NewRole = LossRole#role{m_market_silver =
                                        MMarketSilver#m_market_silver{refresh =
                                                                          TypeGoods,
                                                                      refresh_time
                                                                          =
                                                                          Time}},
            RtnList = get_pages(1, 2, NewRole),
            LogText = log_refresh_text(Loss),
            log:market(log_market_silver,
                       Role,
                       LossRole,
                       "金币刷新",
                       LogText),
            {ok, NewRole, {Time, RtnList}};
        _ ->
            notice:return(lang:get("金币不足")),
            false
    end;
refresh(1,
        Role = #role{m_market_silver =
                         MMarketSilver = #m_market_silver{refresh_time =
                                                              RefreshTime}}) ->
    Now = date:unixtime(),
    case Now > RefreshTime - 3 of
        true ->
            TypeGoods = do_refresh(Role),
            Time = Now + 120 -
                       month_card:get_privilege(Role, market_silver_refresh),
            NewRole = Role#role{m_market_silver =
                                    MMarketSilver#m_market_silver{refresh =
                                                                      TypeGoods,
                                                                  refresh_time =
                                                                      Time}},
            RtnList = get_pages(1, 2, NewRole),
            {ok, NewRole, {Time, RtnList}};
        false ->
            notice:return(lang:get("未到冷却时间")),
            false
    end;
refresh(3,
        Role = #role{m_market_silver =
                         MMarketSilver = #m_market_silver{refresh_time =
                                                              RefreshTime}}) ->
    Now = date:unixtime(),
    case Now > RefreshTime of
        true ->
            TypeGoods = do_refresh(Role),
            Time = Now + 120 -
                       month_card:get_privilege(Role, market_silver_refresh),
            NewRole = Role#role{m_market_silver =
                                    MMarketSilver#m_market_silver{refresh =
                                                                      TypeGoods,
                                                                  refresh_time =
                                                                      Time}},
            RtnList = get_pages(1, 2, NewRole),
            {ok, NewRole, {Time, RtnList}};
        false ->
            RtnList = get_pages(1, 2, Role),
            {ok, {RefreshTime, RtnList}}
    end;
refresh(_Unknow, _Role) -> false.

do_refresh(Role) ->
    TypeGoods = get_goods([1, 2, 3, 4, 5, 6], Role, []),
    random_goods(TypeGoods, Role, []).

random_goods([], _Role, Acc) -> Acc;
random_goods([{Type, 0, List} | Rest], Role, Acc) ->
    random_goods(Rest, Role, [{Type, List} | Acc]);
random_goods([{Type, _Len, GoodsList} | Rest],
             Role = #role{lev = Lev}, Acc) ->
    Size = 8 * 10,
    Now = date:unixtime(),
    {Size1, RandAcc1, SPriceAcc} = rand_round_1(GoodsList,
                                                Size,
                                                Now,
                                                [],
                                                [],
                                                Lev),
    StatusticsData = statistics_refresh_count(RandAcc1, []),
    MaxRfCount = calc_rfgoods_count(StatusticsData),
    {Size3, RandAcc3} = rand_round_3(Size1,
                                     Size1,
                                     SPriceAcc,
                                     Now,
                                     [],
                                     StatusticsData,
                                     MaxRfCount,
                                     Lev),
    NRandAcc = RandAcc3 ++ RandAcc1,
    SortRandAcc = sort_rand(NRandAcc, []),
    {DefRandAcc, NonDefRandAcc} = rand_round_4(Size3,
                                               SortRandAcc,
                                               []),
    NewRandAcc = shuffle_rand(NonDefRandAcc ++ DefRandAcc,
                              0,
                              [],
                              0,
                              []),
    SeqList = seq_goods(NewRandAcc, 1, Size, []),
    random_goods(Rest, Role, [{Type, SeqList} | Acc]).

rand_round_3(0, Size, _SPriceAcc, _Now, Acc,
             _StatusticsData, _MaxRfCount, _Lev) ->
    {Size, Acc};
rand_round_3(Size, NSize, SPriceAcc, Now, Acc,
             StatusticsData, MaxRfCountVal, Lev) ->
    case util:rand_list(SPriceAcc) of
        SPrice = #market_silver_price{sellers = Sellers,
                                      item_base_id = BaseId} ->
            MaxRfCount = case is_quest_need(BaseId) of
                             false -> 1;
                             true -> MaxRfCountVal
                         end,
            Result = case lists:keyfind(BaseId, 1, StatusticsData)
                         of
                         {BaseId, Num} -> {MaxRfCount > Num, Num};
                         false -> {true, 0}
                     end,
            case Result of
                {true, StNum} ->
                    RefreshList = check_rand_cell(Sellers,
                                                  BaseId,
                                                  Now,
                                                  [],
                                                  Lev),
                    case util:rand_list(RefreshList) of
                        Goods = #market_silver_refresh{seller_id = SellerId,
                                                       cell_id = CellId} ->
                            NewSellers = lists:delete({SellerId, CellId},
                                                      Sellers),
                            NewSPrice = SPrice#market_silver_price{sellers =
                                                                       NewSellers},
                            NewSPriceAcc = lists:keystore(BaseId,
                                                          #market_silver_price.item_base_id,
                                                          SPriceAcc,
                                                          NewSPrice),
                            NewStatusticsData = lists:keyreplace(BaseId,
                                                                 1,
                                                                 StatusticsData,
                                                                 {BaseId,
                                                                  StNum + 1}),
                            rand_round_3(Size - 1,
                                         NSize - 1,
                                         NewSPriceAcc,
                                         Now,
                                         [Goods | Acc],
                                         NewStatusticsData,
                                         MaxRfCount,
                                         Lev);
                        _ ->
                            rand_round_3(Size - 1,
                                         NSize,
                                         SPriceAcc,
                                         Now,
                                         Acc,
                                         StatusticsData,
                                         MaxRfCount,
                                         Lev)
                    end;
                {false, _} ->
                    rand_round_3(Size - 1,
                                 NSize,
                                 SPriceAcc,
                                 Now,
                                 Acc,
                                 StatusticsData,
                                 MaxRfCount,
                                 Lev)
            end;
        _ ->
            rand_round_3(Size - 1,
                         NSize,
                         SPriceAcc,
                         Now,
                         Acc,
                         StatusticsData,
                         MaxRfCountVal,
                         Lev)
    end.

sort_rand([], Acc) -> lists:keysort(2, Acc);
sort_rand([Price = #market_silver_refresh{item_base_id =
                                              BaseId}
           | Rest],
          Acc) ->
    case lists:keyfind(BaseId, 1, Acc) of
        {_, Len, List} ->
            New = {BaseId, Len + 1, [Price | List]},
            NewAcc = lists:keystore(BaseId, 1, Acc, New),
            sort_rand(Rest, NewAcc);
        _ ->
            NewAcc = [{BaseId, 1, [Price]} | Acc],
            sort_rand(Rest, NewAcc)
    end.

shuffle_rand([], QLen, QAcc, OLen, OAcc) ->
    case QLen > OLen of
        true -> shuffle(OAcc) ++ shuffle(QAcc);
        false -> shuffle(QAcc) ++ shuffle(OAcc)
    end;
shuffle_rand([{_BaseId, Len, List} | Rest], QLen, QAcc,
             OLen, OAcc) ->
    shuffle_rand(Rest,
                 QLen + Len,
                 List ++ QAcc,
                 OLen,
                 OAcc).

rand_round_4(0, RandAcc, NonDefRandAcc) ->
    {RandAcc, NonDefRandAcc};
rand_round_4(_, [], NonDefRandAcc) ->
    {[], NonDefRandAcc};
rand_round_4(Size,
             RandAcc = [{BaseId, Len, List} | Rest],
             NonDefRandAcc) ->
    case catch ets:lookup(market_silver_price_tab, BaseId)
        of
        [SPrice = #market_silver_price{}] ->
            case make_default_goods(BaseId, SPrice, Size, 1) of
                {Size, _} ->
                    rand_round_4(Size,
                                 Rest,
                                 [{BaseId, Len, List} | NonDefRandAcc]);
                {NSize, Default} ->
                    New = [{BaseId, Len + 1, Default ++ List} | Rest],
                    NewRandAcc = lists:keysort(2, New),
                    rand_round_4(NSize, NewRandAcc, NonDefRandAcc)
            end;
        _ -> rand_round_4(Size - 1, RandAcc, NonDefRandAcc)
    end.

rand_round_1(_, 0, _Now, Acc, SPriceAcc, _Lev) ->
    {0, Acc, SPriceAcc};
rand_round_1([], Size, _Now, Acc, SPriceAcc, _Lev) ->
    {Size, Acc, SPriceAcc};
rand_round_1([#market_silver_item_data{base_id = BaseId,
                                       is_quest_need = IsQuestNeed}
              | Rest],
             Size, Now, Acc, SPriceAcc, Lev) ->
    case catch ets:lookup(market_silver_price_tab, BaseId)
        of
        [SPrice = #market_silver_price{sellers = []}] ->
            RandNum = case IsQuestNeed of
                          true -> 2;
                          _ -> 1
                      end,
            {NewSize, Default} = make_default_goods(BaseId,
                                                    SPrice,
                                                    Size,
                                                    RandNum),
            rand_round_1(Rest,
                         NewSize,
                         Now,
                         Default ++ Acc,
                         SPriceAcc,
                         Lev);
        [SPrice = #market_silver_price{sellers = Sellers,
                                       price = _Price}] ->
            RefreshList = check_rand_cell(Sellers,
                                          BaseId,
                                          Now,
                                          [],
                                          Lev),
            RandNum = case market_silver_data:get(BaseId) of
                          #market_silver_item_data{is_quest_need = 0} -> 1;
                          _ -> 2
                      end,
            case util:rand_list_n(RefreshList, RandNum) of
                RandList = [_ | _] ->
                    Len = length(RandList),
                    DelSellers = [{SellerId, CellId}
                                  || #market_silver_refresh{seller_id =
                                                                SellerId,
                                                            cell_id = CellId}
                                         <- RandList],
                    NewSellers = util:sub_big_list(Sellers, DelSellers),
                    NewSPrice = SPrice#market_silver_price{sellers =
                                                               NewSellers},
                    {NSize, Default} = case Len < 2 of
                                           true ->
                                               make_default_goods(BaseId,
                                                                  SPrice,
                                                                  Size,
                                                                  2);
                                           false -> {Size, []}
                                       end,
                    NewSize = erlang:max(NSize - Len, 0),
                    NewAcc = Default ++ RandList ++ Acc,
                    rand_round_1(Rest,
                                 NewSize,
                                 Now,
                                 NewAcc,
                                 [NewSPrice | SPriceAcc],
                                 Lev);
                _ ->
                    {NSize, Default} = make_default_goods(BaseId,
                                                          SPrice,
                                                          Size,
                                                          2),
                    rand_round_1(Rest,
                                 NSize,
                                 Now,
                                 Default ++ Acc,
                                 SPriceAcc,
                                 Lev)
            end;
        _ -> rand_round_1(Rest, Size, Now, Acc, SPriceAcc, Lev)
    end.

check_rand_cell([], _BaseId, _Now, Acc, _Lev) -> Acc;
check_rand_cell([{Rid, CellId} | Rest], BaseId, Now,
                Acc, Lev) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [#market_silver_shop{cells = Cells}] ->
            case lists:keyfind(CellId,
                               #market_silver_shop_cell.cell_id,
                               Cells)
                of
                #market_silver_shop_cell{status = Status,
                                         item_base_id = 26025, num = Num,
                                         sale_time = SaleTime,
                                         system_price = SysPrice, price = Price,
                                         item_attrs = Attrs, expiry = Expiry}
                    when Expiry > Now andalso
                             Now > SaleTime andalso
                                 (Status =:= 0 orelse Status =:= 5) ->
                    case lists:keyfind(1, 1, Attrs) of
                        {_, Step} ->
                            case experience_bottle_data:get(Step) of
                                {_, _, MinLev, MaxLev, _} ->
                                    case Lev < MinLev orelse Lev > MaxLev of
                                        false ->
                                            NewPrice = case SysPrice =:= 0 of
                                                           true ->
                                                               calc_system_price(Price);
                                                           _ -> SysPrice
                                                       end,
                                            Goods =
                                                #market_silver_refresh{cell_id =
                                                                           CellId,
                                                                       item_base_id
                                                                           =
                                                                           26025,
                                                                       num =
                                                                           Num,
                                                                       price =
                                                                           NewPrice,
                                                                       seller_id
                                                                           =
                                                                           Rid,
                                                                       item_attrs
                                                                           =
                                                                           Attrs},
                                            check_rand_cell(Rest,
                                                            BaseId,
                                                            Now,
                                                            [Goods | Acc],
                                                            Lev);
                                        _ ->
                                            check_rand_cell(Rest,
                                                            BaseId,
                                                            Now,
                                                            Acc,
                                                            Lev)
                                    end;
                                _ ->
                                    check_rand_cell(Rest, BaseId, Now, Acc, Lev)
                            end;
                        _ -> check_rand_cell(Rest, BaseId, Now, Acc, Lev)
                    end;
                #market_silver_shop_cell{status = Status,
                                         item_base_id = BaseId, num = Num,
                                         sale_time = SaleTime,
                                         system_price = SysPrice, price = Price,
                                         item_attrs = Attrs, expiry = Expiry}
                    when Expiry > Now andalso
                             Now > SaleTime andalso
                                 (Status =:= 0 orelse Status =:= 5) ->
                    NewPrice = case SysPrice =:= 0 of
                                   true -> calc_system_price(Price);
                                   _ -> SysPrice
                               end,
                    Goods = #market_silver_refresh{cell_id = CellId,
                                                   item_base_id = BaseId,
                                                   num = Num, price = NewPrice,
                                                   seller_id = Rid,
                                                   item_attrs = Attrs},
                    check_rand_cell(Rest, BaseId, Now, [Goods | Acc], Lev);
                _False -> check_rand_cell(Rest, BaseId, Now, Acc, Lev)
            end;
        _False -> check_rand_cell(Rest, BaseId, Now, Acc, Lev)
    end.

seq_goods([], _N, _Size, Acc) -> lists:reverse(Acc);
seq_goods(_Rest, N, Size, Acc) when N > Size ->
    lists:reverse(Acc);
seq_goods([Goods | Rest], N, Size, Acc) ->
    seq_goods(Rest,
              N + 1,
              Size,
              [Goods#market_silver_refresh{id = N} | Acc]).

make_default_goods(BaseId,
                   SPrice = #market_silver_price{price = BasePrice}, Size,
                   MakeSize) ->
    RandPcnt = util:rand(100, 130) / 100,
    DefaultPrice = util:ceil(RandPcnt * BasePrice),
    SystemPrice = calc_system_price(DefaultPrice),
    case market_silver_data:get(BaseId) of
        Data = #market_silver_item_data{min_price = Min,
                                        max_price = Max, is_system = 1,
                                        type = Type} ->
            NewPrice = erlang:min(erlang:max(Min, SystemPrice),
                                  Max),
            RandNum = case Type of
                          2 -> 1;
                          _ -> util:rand(2, 4)
                      end,
            List = lists:duplicate(MakeSize, RandNum),
            PriceList = make_default_goods(List,
                                           BaseId,
                                           NewPrice,
                                           SPrice,
                                           Data,
                                           []),
            NSize = erlang:max(Size - length(PriceList), 0),
            {NSize, PriceList};
        _ -> {Size, []}
    end.

make_default_goods([], _BaseId, _Price, _SPrice, _Data,
                   Acc) ->
    Acc;
make_default_goods([Num | Rest], BaseId, Price, SPrice,
                   Data = #market_silver_item_data{step = Step,
                                                   type = Type},
                   Acc) ->
    Attrs = case Type of
                Type when Type =:= 2 orelse Type =:= 4 ->
                    case Step > 0 of
                        true ->
                            {ok, AvgStep} = get_silver_price_ext(avg_step,
                                                                 SPrice,
                                                                 Step),
                            {ok, MaxStep} = get_silver_price_ext(max_step,
                                                                 SPrice,
                                                                 Step),
                            MinRand = max(10, AvgStep - 5),
                            MaxRand = max(10, MaxStep),
                            NewStep = util:rand(MinRand, MaxRand),
                            [{1, NewStep}];
                        false -> []
                    end;
                _ -> []
            end,
    Refresh = #market_silver_refresh{item_base_id = BaseId,
                                     num = Num, price = Price,
                                     item_attrs = Attrs},
    make_default_goods(Rest,
                       BaseId,
                       Price,
                       SPrice,
                       Data,
                       [Refresh | Acc]).

get_goods([], _Role, Acc) -> Acc;
get_goods([Type | Rest], Role, Acc) ->
    Goods = market_silver_data:get_item_by_type(Type),
    {Len, FilterGoods} = filter_goods(Goods, Role, 0, []),
    get_goods(Rest, Role, [{Type, Len, FilterGoods} | Acc]).

filter_goods([], _Role, Count, Acc) ->
    {Count, lists:reverse(Acc)};
filter_goods([Goods | Rest], Role, Count, Acc) ->
    case check_goods([classes, lev], Goods, Role) of
        true ->
            filter_goods(Rest, Role, Count + 1, [Goods | Acc]);
        false -> filter_goods(Rest, Role, Count, Acc)
    end.

check_goods([], _Goods, _Role) -> true;
check_goods([classes | Rest],
            Data = #market_silver_item_data{classes = 0}, Role) ->
    check_goods(Rest, Data, Role);
check_goods([classes | Rest],
            Data = #market_silver_item_data{classes = Classes},
            Role = #role{classes = Classes}) ->
    check_goods(Rest, Data, Role);
check_goods([lev | Rest],
            Data = #market_silver_item_data{min_lev = MinLev,
                                            max_lev = MaxLev},
            Role = #role{lev = Lev})
    when Lev =< MaxLev andalso MinLev =< Lev ->
    check_goods(Rest, Data, Role);
check_goods(_Cond, _Data, _Role) -> false.

push_ico_mark(Role) ->
    role:link_send(Role, 12419, {}),
    ok.

check_cell_draw_status([]) -> false;
check_cell_draw_status([#market_silver_shop_cell{status
                                                     = Status}
                        | _Rest])
    when Status =:= 5 orelse
             Status =:= 1 orelse Status =:= 6 ->
    true;
check_cell_draw_status([#market_silver_shop_cell{status
                                                     = Status,
                                                 expiry = Expiry}
                        | Rest]) ->
    TimeOutStatus = case Expiry < date:unixtime() of
                        false -> Status;
                        true -> 6
                    end,
    case TimeOutStatus of
        6 -> true;
        _ -> check_cell_draw_status(Rest)
    end;
check_cell_draw_status(#role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [#market_silver_shop{cells = Cells}] ->
            check_cell_draw_status(Cells);
        _ -> false
    end;
check_cell_draw_status([_H | Rest]) ->
    check_cell_draw_status(Rest).

record_recover_timeout(BaseId, Num) ->
    gen_server:cast(market_silver,
                    {record_recover_timeout, BaseId, Num}).

recover_timeout(Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{}] ->
            recover_timeout(Role, Shop);
        _ -> false
    end,
    remove.

recover_timeout(#role{id = Rid, pid = Pid},
                #market_silver_shop{cells = Cells, pid = ShopPid}) ->
    Now = date:unixtime(),
    RecoverCells = recover_cell(Cells, Now, []),
    case RecoverCells of
        [] ->
            case ShopPid =:= Pid of
                true -> false;
                false ->
                    gen_server:cast(market_silver, {login, Rid, Pid}),
                    false
            end;
        _ ->
            CellIds = [CellId
                       || #market_silver_shop_cell{cell_id = CellId}
                              <- RecoverCells],
            gen_server:cast(market_silver,
                            {recover_timeout, Rid, Pid, CellIds}),
            ok
    end.

recover_exp_bottle_water(Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{}] ->
            recover_exp_bottle_water(Role, Shop);
        _ -> false
    end,
    remove.

recover_exp_bottle_water(#role{id = Rid, pid = Pid},
                         Shop = #market_silver_shop{cells = Cells,
                                                    pid = ShopPid}) ->
    Now = date:unixtime(),
    RecoverCells = recover_cell2(Cells, Now, []),
    case RecoverCells of
        [] ->
            case ShopPid =:= Pid of
                true -> false;
                false ->
                    gen_server:cast(market_silver, {login, Rid, Pid}),
                    false
            end;
        _ ->
            NewCells = [replace_exp_bottle_cell(Cell, RecoverCells)
                        || Cell = #market_silver_shop_cell{} <- Cells],
            NewShop = Shop#market_silver_shop{cells = NewCells,
                                              pid = Pid},
            role:apply(async,
                       Pid,
                       {market_silver, callback_recover_timeout, [NewShop]}),
            save(market_silver_shop_tab, NewShop)
    end.

replace_exp_bottle_cell(MCell1 =
                            #market_silver_shop_cell{cell_id = CellId},
                        RecoverCells) ->
    case lists:keyfind(CellId,
                       #market_silver_shop_cell.cell_id,
                       RecoverCells)
        of
        MCell2 = #market_silver_shop_cell{sold_num = SoldNum,
                                          num = Num} ->
            case util:rand(1, 100) =< 30 of
                true ->
                    MCell2#market_silver_shop_cell{status = 5,
                                                   sold_num = SoldNum + 1,
                                                   num = Num - 1};
                _ -> MCell1
            end;
        _ -> MCell1
    end.

set_cell_timer(Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [#market_silver_shop{cells = []}] -> ok;
        [Shop] ->
            TimerRole = set_cell_timer(Role, Shop),
            {ok, TimerRole};
        _False -> ok
    end.

set_cell_timer(Role, #market_silver_shop{cells = []}) ->
    Role;
set_cell_timer(Role,
               #market_silver_shop{cells = Cells}) ->
    case get_cell_timer(Cells) of
        false -> Role;
        {ok, Timer} ->
            NewRole = role_timer:set(Timer, Role),
            NewRole
    end.

set_cell_timer2(Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [#market_silver_shop{cells = []}] -> ok;
        [Shop] ->
            TimerRole = set_cell_timer2(Role, Shop),
            {ok, TimerRole};
        _False -> ok
    end.

set_cell_timer2(Role,
                #market_silver_shop{cells = []}) ->
    Role;
set_cell_timer2(Role,
                #market_silver_shop{cells = Cells}) ->
    case get_cell_timer2(Cells) of
        false -> Role;
        {ok, Timer} ->
            NewRole = role_timer:set(Timer, Role),
            NewRole
    end.

get_cell_timer(Cells) ->
    Now = date:unixtime(),
    RecoverCells = recover_cell(Cells, Now, []),
    case RecoverCells of
        [] -> false;
        _ ->
            SortList =
                lists:keysort(#market_silver_shop_cell.expiry,
                              RecoverCells),
            ValidList = [Cell
                         || Cell = #market_silver_shop_cell{status = Status,
                                                            expiry = Expiry}
                                <- SortList,
                            Status =/= 6, Expiry > Now],
            case ValidList of
                [#market_silver_shop_cell{expiry = Expiry} | _] ->
                    Timeout = erlang:max((Expiry - Now) * 1000, 1),
                    Timer = #timer{id = market_silver_cell_timer,
                                   timeout = Timeout, m = market_silver,
                                   f = recover_timeout, a = []},
                    {ok, Timer};
                _ -> false
            end
    end.

get_cell_timer2(Cells) ->
    Now = date:unixtime(),
    RecoverCells2 = recover_cell2(Cells, Now, []),
    case RecoverCells2 of
        [] -> false;
        _ ->
            SortList2 =
                lists:keysort(#market_silver_shop_cell.expiry,
                              RecoverCells2),
            ValidList2 = [Cell
                          || Cell = #market_silver_shop_cell{expiry = Expiry}
                                 <- SortList2,
                             Expiry > Now],
            case ValidList2 of
                [#market_silver_shop_cell{expiry = Expiry} | _] ->
                    Timeout = erlang:max((Expiry - Now) * 1000, 1),
                    Timer = #timer{id = market_silver_exp_bottle_water,
                                   timeout = Timeout, m = market_silver,
                                   f = recover_exp_bottle_water, a = []},
                    {ok, Timer};
                _ -> false
            end
    end.

recover_cell([], _Now, Acc) -> Acc;
recover_cell([Cell = #market_silver_shop_cell{status =
                                                  Status,
                                              percent = Percent,
                                              item_base_id = BaseId}
              | Rest],
             Now, Acc)
    when Status =:= 0 orelse
             Status =:= 5 orelse Status =:= 6 ->
    {LimitPercent, _} =
        market_silver_data:get_recover_upprice(BaseId),
    logger:debug("进行回购确认，道具:~w小于：~w进行回购",
                 [BaseId, LimitPercent],
                 market_silver,
                 1800),
    case Percent =< LimitPercent of
        true -> recover_cell(Rest, Now, [Cell | Acc]);
        false -> recover_cell(Rest, Now, Acc)
    end;
recover_cell([_ | Rest], Now, Acc) ->
    recover_cell(Rest, Now, Acc).

recover_cell2([], _Now, Acc) -> Acc;
recover_cell2([Cell = #market_silver_shop_cell{status =
                                                   Status,
                                               percent = Percent,
                                               item_base_id = BaseId}
               | Rest],
              Now, Acc)
    when Status =:= 0 andalso BaseId =:= 26025 ->
    case Percent =< 100 of
        true -> recover_cell2(Rest, Now, [Cell | Acc]);
        false -> recover_cell2(Rest, Now, Acc)
    end;
recover_cell2([_ | Rest], Now, Acc) ->
    recover_cell2(Rest, Now, Acc).

callback_recover_timeout(Role, Shop) ->
    push_ico_mark(Role),
    push_shop(Role, Shop),
    Role1 = set_cell_timer2(Role, Shop),
    NewRole = set_cell_timer(Role1, Shop),
    {ok, NewRole}.

init([]) ->
    logger:info("[~w] 正在启动...",
                [market_silver],
                market_silver,
                1832),
    process_flag(trap_exit, true),
    case catch load_data() of
        ok ->
            TRef = reset_timer(),
            RecoverRef = set_server_recover_timer(),
            Pltm = case env:get(platform) of
                       undefined -> "";
                       TmpPltm -> TmpPltm
                   end,
            ZoneId = case env:get(zone_id) of
                         undefined -> 0;
                         TmpZoneId -> TmpZoneId
                     end,
            logger:info("[~w] 启动完成",
                        [market_silver],
                        market_silver,
                        1840),
            {ok,
             #state{reset_timer = TRef, recover_timer = RecoverRef,
                    platform = Pltm, zone_id = ZoneId}};
        Err ->
            logger:error("[~w] 启动失败，无法载入数据[Err:~w]",
                         [market_silver, Err],
                         market_silver,
                         1843),
            {stop, abnormal}
    end.

handle_call({on_sale, RoleId, Data}, _From, State) ->
    Reply = do_save_on_sale(RoleId, Data),
    {reply, Reply, State};
handle_call({buy, RoleId, Data}, _From, State) ->
    Reply = server_buy(RoleId, Data),
    {reply, Reply, State};
handle_call({open_cell, Rid}, _From, State) ->
    Reply = do_save_open_cell(Rid),
    {reply, Reply, State};
handle_call({one_click, Rid, Data}, _From, State) ->
    Reply = do_save_one_click(Rid, Data),
    {reply, Reply, State};
handle_call({take_off, Rid, Data}, _From, State) ->
    Reply = do_save_take_off(Rid, Data),
    {reply, Reply, State};
handle_call({draw, Rid, Data}, _From, State) ->
    Reply = do_save_draw(Rid, Data),
    {reply, Reply, State};
handle_call(server_recover, _From, State) ->
    Reply = server_recover(),
    {reply, Reply, State};
handle_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.

handle_cast(reload, State) ->
    reload_data(),
    logger:info("银币市场重载完成", [], market_silver, 1874),
    {noreply, State};
handle_cast({init_shop, Info}, State) ->
    server_init_shop(Info),
    {noreply, State};
handle_cast({revise_shop_cells, Rid}, State) ->
    server_revise_shop_cells(Rid),
    {noreply, State};
handle_cast({record_recover_timeout, BaseId, Num},
            State) ->
    server_record_recover_timeout(BaseId, Num, timeout),
    {noreply, State};
handle_cast({recover_timeout, Rid, Pid, CellIds},
            State) ->
    server_recover_timeout(Rid, Pid, CellIds),
    {noreply, State};
handle_cast({auto_buy_seller, ItemInfo}, State) ->
    case catch package:merge(ItemInfo) of
        NewInfo = [_ | _] -> server_auto_buy_seller(NewInfo);
        _ -> skip
    end,
    {noreply, State};
handle_cast({login, Rid, Pid}, State) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{}] ->
            save(market_silver_shop_tab,
                 Shop#market_silver_shop{pid = Pid});
        _ -> false
    end,
    {noreply, State};
handle_cast({logout, Rid}, State) ->
    server_logout(Rid),
    {noreply, State};
handle_cast(Msg, State) ->
    logger:error("[~w]接收到错误的消息[~w]",
                 [market_silver, Msg],
                 market_silver,
                 1906),
    {noreply, State}.

handle_info(reset,
            #state{reset_timer = TRef} = State) ->
    erlang:cancel_timer(TRef),
    reset_price(State),
    NewTRef = reset_timer(),
    garbage_collect(),
    logger:info("0点重置银币市场服务器价格完成", [], market_silver, 1914),
    {noreply, State#state{reset_timer = NewTRef}};
handle_info(server_recover,
            #state{recover_timer = TRef} = State) ->
    erlang:cancel_timer(TRef),
    server_recover(),
    garbage_collect(),
    logger:debug("定时10分钟回收玩家道具", [], market_silver, 1920),
    NewTRef = set_server_recover_timer(),
    {noreply, State#state{recover_timer = NewTRef}};
handle_info(_Info, State) -> {noreply, State}.

terminate(Reason, State) ->
    clean(State),
    case Reason of
        normal ->
            logger:info("银币市场正常关闭:[~w]",
                        [market_silver],
                        market_silver,
                        1930);
        shutdown ->
            logger:info("由Supervisor主动shutdown银币市场进程",
                        [],
                        market_silver,
                        1931);
        _Unknow ->
            logger:error("银币市场关闭异常:[Reason:~w]",
                         [_Unknow],
                         market_silver,
                         1932)
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

push_take_off(Role, Data) ->
    role:link_send(Role, 12406, Data).

push_draw(Role, Data) ->
    role:link_send(Role, 12411, Data).

push_shop(Role) ->
    case get_silver_shop(Role) of
        false -> false;
        {ok, Shop} -> role:link_send(Role, 12407, {Shop})
    end,
    ok.

push_shop(Role, Shop) ->
    role:link_send(Role, 12407, {Shop}),
    ok.

load_data() ->
    market_silver_shop_tab = ets:new(market_silver_shop_tab,
                                     [set,
                                      named_table,
                                      public,
                                      {keypos, #market_silver_shop.rid}]),
    {ok, market_silver_shop_tab} =
        dets:open_file(market_silver_shop_tab,
                       [{file, "dets/market_silver_shop.dets"},
                        {keypos, #market_silver_shop.rid},
                        {type, set}]),
    market_silver_shop_tab =
        dets:to_ets(market_silver_shop_tab,
                    market_silver_shop_tab),
    market_silver_price_tab =
        ets:new(market_silver_price_tab,
                [set,
                 named_table,
                 public,
                 {keypos, #market_silver_price.item_base_id}]),
    {ok, market_silver_price_tab} =
        dets:open_file(market_silver_price_tab,
                       [{file, "dets/market_silver_price.dets"},
                        {keypos, #market_silver_price.item_base_id},
                        {type, set}]),
    silver_shop_var(),
    silver_price_ver(),
    reload_data(),
    ok.

silver_price_ver() ->
    FunPrice = fun (SilverPrice, Acc) ->
                       case market_ver:silver_price_ver(SilverPrice) of
                           {ok,
                            NVerPrice = #market_silver_price{sellers =
                                                                 Sellers}} ->
                               NewSellers = util:remove_duplicate(Sellers),
                               NewSilverPrice =
                                   NVerPrice#market_silver_price{sellers =
                                                                     NewSellers},
                               [NewSilverPrice | Acc];
                           {false, _Msg} -> [SilverPrice | Acc]
                       end
               end,
    case dets:foldl(FunPrice, [], market_silver_price_tab)
        of
        {error, PriceErr} ->
            logger:error("银币市场价格数据载入错误:~w",
                         [PriceErr],
                         market_silver,
                         1987),
            false;
        PriceList ->
            ok = dets:insert(market_silver_price_tab, PriceList),
            true = ets:insert(market_silver_price_tab, PriceList),
            ok
    end.

silver_shop_var() ->
    FunShop = fun (Shop, Acc) ->
                      case market_ver:silver_shop_ver(Shop) of
                          {ok, NShop = #market_silver_shop{}} -> [NShop | Acc];
                          {false, _Msg} -> [Shop | Acc]
                      end
              end,
    case dets:foldl(FunShop, [], market_silver_shop_tab) of
        {error, ShopErr} ->
            logger:error("银币市场摊位数据载入错误:~w",
                         [ShopErr],
                         market_silver,
                         2006),
            false;
        ShopList ->
            ok = dets:insert(market_silver_shop_tab, ShopList),
            true = ets:insert(market_silver_shop_tab, ShopList),
            ok
    end.

reload_data() ->
    Now = date:unixtime(),
    {Date, _Time} = date:seconds_to_datetime(Now),
    CfgItems = market_silver_data:get_all_items(),
    ItemList = ets:tab2list(market_silver_price_tab),
    {AddItems, DelItems} = reload_data(ItemList,
                                       CfgItems,
                                       Date,
                                       [],
                                       [],
                                       []),
    [delete(market_silver_price_tab, Id) || Id <- DelItems],
    save(market_silver_price_tab, AddItems),
    garbage_collect(),
    ok.

reload_data([], CfgItems, _Date, UpdateItems, DelItems,
            PriceChain) ->
    AddItems = [#market_silver_price{item_base_id =
                                         ItemBaseId,
                                     price = Price}
                || #market_silver_item_data{base_id = ItemBaseId,
                                            def_price = Price}
                       <- CfgItems],
    NewUpdateItems = AddItems ++ UpdateItems,
    NewItems = reload_price(PriceChain,
                            NewUpdateItems,
                            CfgItems),
    {NewItems, DelItems};
reload_data([PriceRec =
                 #market_silver_price{item_base_id = ItemBaseId,
                                      sellers = Sellers, price = _Price}
             | Rest],
            CfgItems, Date, UpdateItems, DelItems, PriceChain) ->
    case lists:keyfind(ItemBaseId,
                       #market_silver_item_data.base_id,
                       CfgItems)
        of
        Data = #market_silver_item_data{update_time = Date,
                                        def_price = DefPrice, group = Group} ->
            UpdatePriceRec = PriceRec#market_silver_price{price =
                                                              DefPrice,
                                                          deal_price = []},
            NewPriceRec = fix_price(UpdatePriceRec),
            NewPriceChain = case Group > 0 of
                                true ->
                                    case lists:keyfind(Group, 1, PriceChain) of
                                        {_, List} ->
                                            NewList = [Data | List],
                                            DelPriceChan =
                                                lists:keydelete(Group,
                                                                1,
                                                                PriceChain),
                                            [{Group, NewList} | DelPriceChan];
                                        _ -> [{Group, [Data]} | PriceChain]
                                    end;
                                _ -> PriceChain
                            end,
            NewCfgItems = lists:keydelete(ItemBaseId,
                                          #market_silver_item_data.base_id,
                                          CfgItems),
            reload_data(Rest,
                        NewCfgItems,
                        Date,
                        [NewPriceRec | UpdateItems],
                        DelItems,
                        NewPriceChain);
        #market_silver_item_data{} ->
            NewCfgItems = lists:keydelete(ItemBaseId,
                                          #market_silver_item_data.base_id,
                                          CfgItems),
            NewPriceRec = fix_price(PriceRec),
            reload_data(Rest,
                        NewCfgItems,
                        Date,
                        [NewPriceRec | UpdateItems],
                        DelItems,
                        PriceChain);
        false ->
            reload_cells(Sellers),
            reload_data(Rest,
                        CfgItems,
                        Date,
                        UpdateItems,
                        [ItemBaseId | DelItems],
                        PriceChain)
    end.

reload_price([], Update, _Cfg) -> Update;
reload_price([{_, List} | Rest], Update, Cfg) ->
    SortList =
        lists:keysort(#market_silver_item_data.group_id, List),
    NewUpdate = do_reload_price(SortList, Update, Cfg),
    reload_price(Rest, NewUpdate, Cfg).

do_reload_price([], Update, _Cfg) -> Update;
do_reload_price([#market_silver_item_data{pre_base_id =
                                              0}
                 | Rest],
                Update, Cfg) ->
    do_reload_price(Rest, Update, Cfg);
do_reload_price([Data = #market_silver_item_data{base_id
                                                     = BaseId}
                 | Rest],
                Update, Cfg) ->
    NewUpdate = case calc_chain_price(Data, Update, Cfg) of
                    {ok, NewPriceRec} ->
                        lists:keystore(BaseId,
                                       #market_silver_price.item_base_id,
                                       Update,
                                       NewPriceRec);
                    _ -> Update
                end,
    do_reload_price(Rest, NewUpdate, Cfg).

recalc_chain_price([], _Date, _WorldLev, _State, Acc) ->
    Acc;
recalc_chain_price([{_, PriceList, DataList} | Rest],
                   Date, WorldLev, State, Acc) ->
    SortList =
        lists:keysort(#market_silver_item_data.group_id,
                      DataList),
    NewPriceList = do_recalc_chain_price(SortList,
                                         Date,
                                         WorldLev,
                                         State,
                                         PriceList,
                                         DataList),
    recalc_chain_price(Rest,
                       Date,
                       WorldLev,
                       State,
                       NewPriceList ++ Acc).

do_recalc_chain_price([], _Date, _WorldLev, _State,
                      Update, _Cfg) ->
    Update;
do_recalc_chain_price([Data =
                           #market_silver_item_data{pre_base_id = 0,
                                                    base_id = BaseId}
                       | Rest],
                      Date, WorldLev, State, Update, Cfg) ->
    NewUpdate = case lists:keyfind(BaseId,
                                   #market_silver_price.item_base_id,
                                   Update)
                    of
                    PriceRec = #market_silver_price{} ->
                        NewPrice = calc_base_price(PriceRec,
                                                   Data,
                                                   WorldLev,
                                                   State,
                                                   Date),
                        NewPriceRec = PriceRec#market_silver_price{price =
                                                                       NewPrice,
                                                                   deal_price =
                                                                       []},
                        lists:keystore(BaseId,
                                       #market_silver_price.item_base_id,
                                       Update,
                                       NewPriceRec);
                    _ -> Update
                end,
    do_recalc_chain_price(Rest,
                          Date,
                          WorldLev,
                          State,
                          NewUpdate,
                          Cfg);
do_recalc_chain_price([Data =
                           #market_silver_item_data{base_id = BaseId}
                       | Rest],
                      Date, WorldLev, State, Update, Cfg) ->
    NewUpdate = case calc_chain_price(Data, Update, Cfg) of
                    {ok, NPriceRec} ->
                        NewPrice = calc_base_price(NPriceRec,
                                                   Data,
                                                   WorldLev,
                                                   State,
                                                   Date),
                        NewPriceRec = NPriceRec#market_silver_price{price =
                                                                        NewPrice,
                                                                    deal_price =
                                                                        []},
                        lists:keystore(BaseId,
                                       #market_silver_price.item_base_id,
                                       Update,
                                       NewPriceRec);
                    _ -> Update
                end,
    do_recalc_chain_price(Rest,
                          Date,
                          WorldLev,
                          State,
                          NewUpdate,
                          Cfg).

calc_chain_price(Data =
                     #market_silver_item_data{pre_base_id = PreBaseId,
                                              pre_pcnt = PrePcnt,
                                              base_id = BaseId,
                                              chain_type = ChainType},
                 Update, Cfg) ->
    case lists:keyfind(BaseId,
                       #market_silver_price.item_base_id,
                       Update)
        of
        PriceRec = #market_silver_price{} ->
            case get_item_pre_price(PreBaseId, Update, Cfg) of
                {ok, PrePrice} ->
                    NewPriceRec = case ChainType of
                                      1 ->
                                          calc_price_mutil_pre(Data,
                                                               PriceRec,
                                                               PrePrice,
                                                               PrePcnt);
                                      _ ->
                                          calc_price_ge_pre(Data,
                                                            PriceRec,
                                                            PrePrice,
                                                            PrePcnt)
                                  end,
                    {ok, NewPriceRec};
                _ -> false
            end;
        _ -> false
    end.

get_item_pre_price(PreBaseId, Update, Cfg) ->
    case lists:keyfind(PreBaseId,
                       #market_silver_price.item_base_id,
                       Update)
        of
        #market_silver_price{price = TmpPrePrice} ->
            {ok, TmpPrePrice};
        _ ->
            case catch ets:lookup(market_silver_price_tab,
                                  PreBaseId)
                of
                [#market_silver_price{price = TmpPrePrice}] ->
                    {ok, TmpPrePrice};
                _ ->
                    case lists:keyfind(PreBaseId,
                                       #market_silver_item_data.base_id,
                                       Cfg)
                        of
                        #market_silver_item_data{def_price = TmpPrePrice} ->
                            {ok, TmpPrePrice};
                        _ -> false
                    end
            end
    end.

calc_price_ge_pre(#market_silver_item_data{min_price =
                                               MinPrice,
                                           def_price = DefPrice,
                                           max_price = MaxPrice,
                                           base_id = _BaseId},
                  PriceRec = #market_silver_price{price = CurPrice},
                  PrePrice, Pcnt) ->
    CalcPrice = util:floor(PrePrice * Pcnt / 1000),
    CompPrice1 = erlang:max(MinPrice, DefPrice),
    CompPrice2 = erlang:max(CompPrice1, CurPrice),
    CompPrice3 = erlang:max(CompPrice2, CalcPrice),
    Price = erlang:min(CompPrice3, MaxPrice),
    logger:debug("银币市场重新计算联动价格（不低于前置），BaseId:~w, PrePrice:~w, "
                 "CurPrice:~w, CalcPrice:~w, Pcnt:~w, "
                 "Price:~w",
                 [_BaseId, PrePrice, CurPrice, CalcPrice, Pcnt, Price],
                 market_silver,
                 2164),
    PriceRec#market_silver_price{price = Price}.

calc_price_mutil_pre(#market_silver_item_data{base_id =
                                                  _BaseId},
                     PriceRec, PrePrice, Pcnt) ->
    Price = util:floor(PrePrice * Pcnt / 1000),
    logger:debug("银币市场重新计算联动价格（前置倍数），BaseId:~w, PrePrice:~w, "
                 "Pcnt:~w, Price:~w",
                 [_BaseId, PrePrice, Pcnt, Price],
                 market_silver,
                 2171),
    PriceRec#market_silver_price{price = Price}.

reload_cells([]) -> ok;
reload_cells([{Rid, CellId} | Rest]) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{cells = Cells}] ->
            case lists:keytake(CellId,
                               #market_silver_shop_cell.cell_id,
                               Cells)
                of
                {value, Cell, RestCells} ->
                    NewCell = Cell#market_silver_shop_cell{status = 6},
                    NewCells = [NewCell | RestCells],
                    save(market_silver_shop_tab,
                         Shop#market_silver_shop{cells = NewCells}),
                    reload_cells(Rest);
                false -> reload_cells(Rest)
            end;
        _ -> reload_cells(Rest)
    end.

reset_price(State) ->
    Now = date:unixtime(),
    {Date, _Time} = date:seconds_to_datetime(Now),
    PriceList = ets:tab2list(market_silver_price_tab),
    WorldLev = world_lev:get_world_lev(),
    NewList = reset_price(PriceList,
                          Date,
                          WorldLev,
                          State,
                          [],
                          []),
    ResetList = [SilverPrice#market_silver_price{day_auto =
                                                     0,
                                                 day_recover = 0}
                 || SilverPrice <- NewList],
    save(market_silver_price_tab, ResetList),
    ok.

reset_normal_price(SilverPrice =
                       #market_silver_price{item_base_id = ItemBaseId},
                   WorldLev, State, Date) ->
    case market_silver_data:get(ItemBaseId) of
        Data = #market_silver_item_data{group = Group}
            when Group > 0 ->
            {chain, Data};
        Data = #market_silver_item_data{} ->
            NewPrice = calc_base_price(SilverPrice,
                                       Data,
                                       WorldLev,
                                       State,
                                       Date),
            NSilverPrice = SilverPrice#market_silver_price{price =
                                                               NewPrice,
                                                           deal_price = []},
            {normal, NSilverPrice};
        _False -> false
    end.

reset_price([], Date, WorldLev, State, NormalAcc,
            ChainAcc) ->
    NewChainPrice = recalc_chain_price(ChainAcc,
                                       Date,
                                       WorldLev,
                                       State,
                                       []),
    NewChainPrice ++ NormalAcc;
reset_price([Price | Rest], Date, WorldLev, State,
            NormalAcc, ChainAcc) ->
    case reset_normal_price(Price, WorldLev, State, Date) of
        {normal, NewPrice} ->
            NewNormalAcc = [NewPrice | NormalAcc],
            reset_price(Rest,
                        Date,
                        WorldLev,
                        State,
                        NewNormalAcc,
                        ChainAcc);
        {chain,
         Data = #market_silver_item_data{group = Group}} ->
            NewChainAcc = case lists:keyfind(Group, 1, ChainAcc) of
                              {_, PriceList, List} ->
                                  NewList = [Data | List],
                                  NewPriceList = [Price | PriceList],
                                  DelChainAcc = lists:keydelete(Group,
                                                                1,
                                                                ChainAcc),
                                  [{Group, NewPriceList, NewList}
                                   | DelChainAcc];
                              _ -> [{Group, [Price], [Data]} | ChainAcc]
                          end,
            reset_price(Rest,
                        Date,
                        WorldLev,
                        State,
                        NormalAcc,
                        NewChainAcc);
        _ ->
            reset_price(Rest,
                        Date,
                        WorldLev,
                        State,
                        NormalAcc,
                        ChainAcc)
    end.

calc_base_price(#market_silver_price{price = Price,
                                     deal_price = DealList,
                                     day_recover = DayRecover,
                                     day_auto = DayAuto, item_base_id = BaseId},
                #market_silver_item_data{min_price = MinPrice,
                                         max_price = MaxPrice, base_id = BaseId,
                                         update_time = UpdateTime,
                                         def_price = DefPrice,
                                         world_lev = WorldLevCfg},
                {WorldLev, _NextTime},
                #state{platform = Pltm, zone_id = ZoneId}, Date) ->
    {RtnPrice, RtnNum, RtnAvgPrice} = case UpdateTime =:=
                                               Date
                                          of
                                          true -> {DefPrice, 0, 0};
                                          false ->
                                              Flag = WorldLev >= WorldLevCfg,
                                              Num = length(DealList),
                                              if Num < 10 andalso Flag ->
                                                     Tag1 = util:floor(DefPrice
                                                                           *
                                                                           9.0e-1),
                                                     NewPrice = case Tag1 >
                                                                         Price
                                                                    of
                                                                    true ->
                                                                        Price;
                                                                    false ->
                                                                        util:floor(Price
                                                                                       *
                                                                                       9.79999999999999982236e-1)
                                                                end,
                                                     {NewPrice, Num, 0};
                                                 Num >= 10 andalso Flag ->
                                                     AvgPrice =
                                                         util:list_avg(DealList),
                                                     {_, LimitUpPrice} =
                                                         market_silver_data:get_recover_upprice(BaseId),
                                                     Tag1 = util:floor(Price *
                                                                           LimitUpPrice
                                                                           /
                                                                           100),
                                                     BasePrice = if AvgPrice >
                                                                        Tag1 ->
                                                                        Price +
                                                                            (AvgPrice
                                                                                 -
                                                                                 Tag1)
                                                                                *
                                                                                2.5e-1;
                                                                    AvgPrice <
                                                                        Price ->
                                                                        Price -
                                                                            (Price
                                                                                 -
                                                                                 AvgPrice)
                                                                                *
                                                                                5.0e-1;
                                                                    true ->
                                                                        Price *
                                                                            9.79999999999999982236e-1
                                                                 end,
                                                     NewPrice =
                                                         erlang:min(MaxPrice,
                                                                    erlang:max(MinPrice,
                                                                               util:floor(BasePrice))),
                                                     {NewPrice, Num, AvgPrice};
                                                 true -> {Price, Num, 0}
                                              end
                                      end,
    ItemStr = log:item_str(BaseId),
    Title = "0点更新",
    Msg = util:flist("~ts$$~w$$~w$$~w$$~w$$~w$$~w$$~w",
                     [ItemStr,
                      DefPrice,
                      Price,
                      RtnPrice,
                      RtnAvgPrice,
                      RtnNum,
                      DayRecover,
                      DayAuto]),
    log:market_silver_server(log_market_silver_server,
                             Pltm,
                             ZoneId,
                             Title,
                             Msg),
    RtnPrice.

do_save_take_off(Rid, {CellId}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{cells = Cells,
                                    free_ids = FreeIds}] ->
            case lists:keytake(CellId,
                               #market_silver_shop_cell.cell_id,
                               Cells)
                of
                {value,
                 #market_silver_shop_cell{status = 1},
                 _RestCells} ->
                    {false, 1};
                {value,
                 #market_silver_shop_cell{status = Status,
                                          item_base_id = ItemBaseId, num = Num},
                 RestCells}
                    when Status =:= 0 orelse
                             Status =:= 6 orelse Status =:= 2 ->
                    NewShop = Shop#market_silver_shop{cells = RestCells,
                                                      free_ids =
                                                          [CellId | FreeIds]},
                    case catch ets:lookup(market_silver_price_tab,
                                          ItemBaseId)
                        of
                        [PriceRec = #market_silver_price{sellers = Sellers}] ->
                            NewSellers = lists:delete({Rid, CellId}, Sellers),
                            save(market_silver_price_tab,
                                 PriceRec#market_silver_price{sellers =
                                                                  NewSellers}),
                            save(market_silver_shop_tab, NewShop),
                            {ok, {ItemBaseId, Num}};
                        _
                            when Status =:= 2 orelse
                                     Status =:= 6 orelse Status =:= 0 ->
                            save(market_silver_shop_tab, NewShop),
                            {ok, {ItemBaseId, Num}};
                        _ -> false
                    end;
                false -> false
            end;
        _ -> false
    end.

do_save_draw(Rid, {CellId}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{cells = Cells,
                                    free_ids = FreeIds}] ->
            case lists:keytake(CellId,
                               #market_silver_shop_cell.cell_id,
                               Cells)
                of
                {value,
                 _Cell = #market_silver_shop_cell{price = Price, num = 0,
                                                  sold_num = SoldNum,
                                                  item_base_id = BaseId,
                                                  percent = Percent},
                 RestCells} ->
                    NewShop = Shop#market_silver_shop{free_ids =
                                                          [CellId | FreeIds],
                                                      cells = RestCells},
                    save(market_silver_shop_tab, NewShop),
                    DrawItem = #market_silver_draw_item{base_id = BaseId,
                                                        num = SoldNum,
                                                        pcnt = Percent,
                                                        price = Price},
                    {ok, DrawItem};
                {value,
                 Cell = #market_silver_shop_cell{price = Price,
                                                 sold_num = SoldNum,
                                                 expiry = Expiry,
                                                 item_base_id = BaseId,
                                                 percent = Percent},
                 RestCells} ->
                    Now = date:unixtime(),
                    NewStatus = case Expiry < Now of
                                    false -> 0;
                                    true -> 6
                                end,
                    NewCell = Cell#market_silver_shop_cell{sold_num = 0,
                                                           status = NewStatus},
                    NewShop = Shop#market_silver_shop{cells =
                                                          [NewCell
                                                           | RestCells]},
                    save(market_silver_shop_tab, NewShop),
                    DrawItem = #market_silver_draw_item{base_id = BaseId,
                                                        num = SoldNum,
                                                        pcnt = Percent,
                                                        price = Price},
                    {ok, DrawItem};
                _False -> false
            end;
        _ -> false
    end.

do_save_open_cell(Rid) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{free_ids = FreeIds,
                                    max_cell_id = MaxId}]
            when MaxId < 15 ->
            NewMaxId = MaxId + 1,
            NewShop = Shop#market_silver_shop{free_ids =
                                                  [NewMaxId | FreeIds],
                                              max_cell_id = NewMaxId},
            save(market_silver_shop_tab, NewShop),
            ok;
        _ -> false
    end.

server_buy(_Rid, {CellId, SellerId, PurchsNum}) ->
    case catch ets:lookup(market_silver_shop_tab, SellerId)
        of
        [Shop = #market_silver_shop{cells = Cells,
                                    pid = SellerPid}] ->
            case lists:keytake(CellId,
                               #market_silver_shop_cell.cell_id,
                               Cells)
                of
                {value,
                 Cell = #market_silver_shop_cell{status = Status,
                                                 num = Num,
                                                 sold_num = SouldNum},
                 RestCells}
                    when Num >= PurchsNum andalso
                             (Status =:= 0 orelse Status =:= 5) ->
                    RestNum = Num - PurchsNum,
                    NewSoldNum = SouldNum + PurchsNum,
                    NewStatus = case RestNum =:= 0 of
                                    true -> 1;
                                    false -> 5
                                end,
                    NewCell = Cell#market_silver_shop_cell{status =
                                                               NewStatus,
                                                           num = RestNum,
                                                           sold_num =
                                                               NewSoldNum},
                    NewShop = Shop#market_silver_shop{cells =
                                                          [NewCell
                                                           | RestCells]},
                    case save(market_silver_shop_tab, NewShop) of
                        true -> server_buy_price(NewCell, SellerId, SellerPid);
                        false -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

server_buy_price(#market_silver_shop_cell{cell_id =
                                              CellId,
                                          item_base_id = ItemBaseId,
                                          status = Status, price = Price,
                                          num = Num},
                 SellerId, Pid) ->
    case catch ets:lookup(market_silver_price_tab,
                          ItemBaseId)
        of
        [PriceRec = #market_silver_price{deal_price = Deal,
                                         sellers = Sellers}] ->
            NewSellers = case Status of
                             1 -> lists:delete({SellerId, CellId}, Sellers);
                             5 -> Sellers
                         end,
            case save(market_silver_price_tab,
                      PriceRec#market_silver_price{deal_price =
                                                       [Price | Deal],
                                                   sellers = NewSellers})
                of
                true ->
                    case is_pid(Pid) of
                        true ->
                            role:apply(async,
                                       Pid,
                                       {market_silver, push_ico_mark, []});
                        false -> ok
                    end,
                    {ok, Num};
                false -> false
            end;
        _ -> false
    end.

do_save_on_sale(RoleId,
                {CellId, Price, Num, Percent}) ->
    case catch ets:lookup(market_silver_shop_tab, RoleId) of
        [Shop = #market_silver_shop{cells = Cells}] ->
            case lists:keytake(CellId,
                               #market_silver_shop_cell.cell_id,
                               Cells)
                of
                {value,
                 Cell = #market_silver_shop_cell{item_base_id =
                                                     ItemBaseId},
                 RestCells} ->
                    Now = date:unixtime(),
                    Expiry = Now + 24 * 3600,
                    SaleTime = calc_sale_tiem(Now),
                    SystemPrice = calc_system_price(ItemBaseId, Price),
                    NewCell = Cell#market_silver_shop_cell{price = Price,
                                                           status = 0,
                                                           num = Num,
                                                           sold_num = 0,
                                                           expiry = Expiry,
                                                           percent = Percent,
                                                           sale_time = SaleTime,
                                                           system_price =
                                                               SystemPrice},
                    NewShop = Shop#market_silver_shop{cells =
                                                          [NewCell
                                                           | RestCells]},
                    case catch ets:lookup(market_silver_price_tab,
                                          ItemBaseId)
                        of
                        [PriceRec = #market_silver_price{sellers = Sellers}] ->
                            DelSellers = lists:delete({RoleId, CellId},
                                                      Sellers),
                            NewSellers = [{RoleId, CellId} | DelSellers],
                            MaxStepPrice = update_max_step(PriceRec, NewCell),
                            NewPriceRec =
                                MaxStepPrice#market_silver_price{sellers =
                                                                     NewSellers},
                            save(market_silver_shop_tab, NewShop),
                            save(market_silver_price_tab, NewPriceRec),
                            ok;
                        _ -> false
                    end;
                false -> false
            end;
        _Err -> false
    end;
do_save_on_sale(RoleId,
                {BaseId, Num, Price, Percent, CellId, Attrs}) ->
    case catch ets:lookup(market_silver_shop_tab, RoleId) of
        [Shop = #market_silver_shop{free_ids = FreeIds,
                                    cells = Cells}] ->
            RestFreeIds = lists:delete(CellId, FreeIds),
            Now = date:unixtime(),
            Expiry = Now + 24 * 3600,
            SaleTime = calc_sale_tiem(Now),
            SystemPrice = calc_system_price(BaseId, Price),
            NewCell = #market_silver_shop_cell{cell_id = CellId,
                                               item_base_id = BaseId, num = Num,
                                               sale_time = SaleTime,
                                               price = Price, expiry = Expiry,
                                               item_attrs = Attrs,
                                               percent = Percent,
                                               system_price = SystemPrice},
            NewShop = Shop#market_silver_shop{free_ids =
                                                  RestFreeIds,
                                              cells = [NewCell | Cells]},
            case catch ets:lookup(market_silver_price_tab, BaseId)
                of
                [PriceRec = #market_silver_price{sellers = Sellers}] ->
                    NewSellers = [{RoleId, CellId} | Sellers],
                    MaxStepPrice = update_max_step(PriceRec, NewCell),
                    NewPriceRec = MaxStepPrice#market_silver_price{sellers =
                                                                       NewSellers},
                    save(market_silver_shop_tab, NewShop),
                    save(market_silver_price_tab, NewPriceRec),
                    ok;
                _ ->
                    logger:debug("查询物品[~w]价格报错",
                                 [BaseId],
                                 market_silver,
                                 2474),
                    false
            end;
        _Err ->
            logger:debug("查询摊位[~w]信息报错, ~w",
                         [RoleId, _Err],
                         market_silver,
                         2478),
            false
    end.

do_save_one_click(Rid, {1}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{cells = Cells}] ->
            Now = date:unixtime(),
            {PriceRecList, NewCells, RepeatCells} =
                one_click_on_sale(Cells, Rid, Now, [], [], []),
            NewShop = Shop#market_silver_shop{cells = NewCells},
            case PriceRecList of
                [_ | _] ->
                    save(market_silver_shop_tab, NewShop),
                    save(market_silver_price_tab, PriceRecList),
                    {ok, RepeatCells};
                _ ->
                    save(market_silver_shop_tab, NewShop),
                    {ok, false}
            end;
        _Err -> false
    end;
do_save_one_click(Rid, {2}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{cells = Cells,
                                    free_ids = FreeIds}] ->
            Now = date:unixtime(),
            {NewCells, NewFreeIds, GainAcc} = one_click_draw(Cells,
                                                             Now,
                                                             Rid,
                                                             FreeIds,
                                                             [],
                                                             []),
            NewShop = Shop#market_silver_shop{cells = NewCells,
                                              free_ids = NewFreeIds},
            save(market_silver_shop_tab, NewShop),
            {ok, GainAcc};
        _ -> false
    end.

one_click_on_sale([], _Rid, _Now, PriceRecList, Cells,
                  RepeatCells) ->
    {PriceRecList, Cells, RepeatCells};
one_click_on_sale([Cell =
                       #market_silver_shop_cell{status = Status,
                                                expiry = Expiry,
                                                item_base_id = ItemBaseId,
                                                cell_id = CellId}
                   | Rest],
                  Rid, Now, PriceRecList, Cells, RepeatCells)
    when Status =:= 6 orelse
             Status =:= 0 andalso Now >= Expiry ->
    case catch ets:lookup(market_silver_price_tab,
                          ItemBaseId)
        of
        [PriceRec = #market_silver_price{sellers = Sellers,
                                         price = Price}] ->
            NewCell = Cell#market_silver_shop_cell{expiry =
                                                       Now + 24 * 3600,
                                                   price = Price, status = 0},
            MaxStepPrice = update_max_step(PriceRec, NewCell),
            NewPriceRec = MaxStepPrice#market_silver_price{sellers =
                                                               [{Rid, CellId}
                                                                | lists:delete({Rid,
                                                                                CellId},
                                                                               Sellers)]},
            one_click_on_sale(Rest,
                              Rid,
                              Now,
                              [NewPriceRec | PriceRecList],
                              [NewCell | Cells],
                              [NewCell | RepeatCells]);
        _ ->
            one_click_on_sale(Rest,
                              Rid,
                              Now,
                              PriceRecList,
                              [Cell | Cells],
                              RepeatCells)
    end;
one_click_on_sale([Cell | Rest], Rid, Now, PriceRecList,
                  Cells, RepeatCells) ->
    one_click_on_sale(Rest,
                      Rid,
                      Now,
                      PriceRecList,
                      [Cell | Cells],
                      RepeatCells).

one_click_draw([], _Now, _Rid, FreeIds, Cells, Acc) ->
    {Cells, FreeIds, Acc};
one_click_draw([Cell = #market_silver_shop_cell{sold_num
                                                    = SoldNum,
                                                num = Num, cell_id = CellId,
                                                price = Price, expiry = Expiry,
                                                item_base_id = BaseId,
                                                percent = Pcnt,
                                                item_attrs = ItemAttrs}
                | Rest],
               Now, Rid, FreeIds, Cells, Acc)
    when SoldNum > 0 ->
    {NewFreeIds, NewCells} = case Num =:= 0 of
                                 true ->
                                     case catch
                                              ets:lookup(market_silver_price_tab,
                                                         BaseId)
                                         of
                                         [Price = #market_silver_price{sellers =
                                                                           Sellers}] ->
                                             NewSellers = lists:delete({Rid,
                                                                        CellId},
                                                                       Sellers),
                                             NewPrice =
                                                 Price#market_silver_price{sellers
                                                                               =
                                                                               NewSellers},
                                             save(market_silver_price_tab,
                                                  NewPrice),
                                             ok;
                                         _ -> ok
                                     end,
                                     {[CellId | FreeIds], Cells};
                                 false ->
                                     NewStatus = case Expiry < Now of
                                                     false -> 0;
                                                     true -> 6
                                                 end,
                                     NewCell =
                                         Cell#market_silver_shop_cell{sold_num =
                                                                          0,
                                                                      status =
                                                                          NewStatus},
                                     {FreeIds, [NewCell | Cells]}
                             end,
    DrawItem = #market_silver_draw_item{base_id = BaseId,
                                        num = SoldNum, price = Price,
                                        pcnt = Pcnt, attrs = ItemAttrs,
                                        cell_id = CellId, rest = Num},
    NewAcc = [DrawItem | Acc],
    one_click_draw(Rest,
                   Now,
                   Rid,
                   NewFreeIds,
                   NewCells,
                   NewAcc);
one_click_draw([Cell | Rest], Now, Rid, FreeIds, Cells,
               Acc) ->
    one_click_draw(Rest,
                   Now,
                   Rid,
                   FreeIds,
                   [Cell | Cells],
                   Acc).

-spec server_recover_timeout(BaseId, Num,
                             Source) -> true | false when BaseId ::
                                                              pos_integer(),
                                                          Num :: pos_integer(),
                                                          Source :: auto |
                                                                    timeout.

server_record_recover_timeout(BaseId, Num, Source) ->
    case catch ets:lookup(market_silver_price_tab, BaseId)
        of
        [SilverPrice = #market_silver_price{recover_num =
                                                CurNum,
                                            day_auto = DayAuto}] ->
            NSilverPrice = case CurNum < 50 of
                               true ->
                                   Max = erlang:min(CurNum + Num, 50),
                                   SilverPrice#market_silver_price{recover_num =
                                                                       Max};
                               false -> SilverPrice
                           end,
            NDayAuto = case Source of
                           auto -> DayAuto + Num;
                           _ -> DayAuto
                       end,
            NewPrice = NSilverPrice#market_silver_price{day_auto =
                                                            NDayAuto},
            save(market_silver_price_tab, NewPrice);
        _False -> false
    end.

server_recover_timeout(Rid, Pid, CellIds) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{cells = Cells,
                                    pid = ShopPid}] ->
            IsPush = 0,
            case do_server_recover_timeout(CellIds,
                                           Cells,
                                           Rid,
                                           IsPush)
                of
                {0, _} ->
                    case ShopPid =:= Pid of
                        true -> false;
                        false ->
                            save(market_silver_shop_tab,
                                 Shop#market_silver_shop{pid = Pid})
                    end;
                {1, NewCells} ->
                    NewShop = Shop#market_silver_shop{cells = NewCells,
                                                      pid = Pid},
                    role:apply(async,
                               Pid,
                               {market_silver,
                                callback_recover_timeout,
                                [NewShop]}),
                    save(market_silver_shop_tab, NewShop)
            end;
        _False -> false
    end.

do_server_recover_timeout([], Cells, _Rid, IsPush) ->
    {IsPush, Cells};
do_server_recover_timeout([CellId | Rest], Cells, Rid,
                          IsPush) ->
    case server_recover_cell(CellId, Cells, Rid) of
        {ok, _, RecoverPrice, NewCell} ->
            AvgPrice = update_avg_step(RecoverPrice, NewCell),
            save(market_silver_price_tab, AvgPrice),
            NewCells = lists:keystore(CellId,
                                      #market_silver_shop_cell.cell_id,
                                      Cells,
                                      NewCell),
            do_server_recover_timeout(Rest, NewCells, Rid, 1);
        false ->
            do_server_recover_timeout(Rest, Cells, Rid, IsPush)
    end.

update_avg_step(SPrice =
                    #market_silver_price{item_base_id = ItemBaseId,
                                         ext = Ext},
                #market_silver_shop_cell{item_attrs = Attrs}) ->
    case market_silver_data:get(ItemBaseId) of
        #market_silver_item_data{type = Type, step = Step}
            when Step > 0 andalso (Type =:= 2 orelse Type =:= 4) ->
            case lists:keyfind(1, 1, Attrs) of
                {_, CellStep} ->
                    {ok, AvgStep} = get_silver_price_ext(avg_step,
                                                         SPrice,
                                                         Step),
                    NewAvgStep = (AvgStep + CellStep) div 2,
                    NewExt = lists:keystore(avg_step,
                                            1,
                                            Ext,
                                            {avg_step, NewAvgStep}),
                    SPrice#market_silver_price{ext = NewExt};
                _ -> SPrice
            end;
        _ -> SPrice
    end.

update_max_step(SPrice =
                    #market_silver_price{item_base_id = ItemBaseId,
                                         ext = Ext},
                #market_silver_shop_cell{item_attrs = Attrs}) ->
    case market_silver_data:get(ItemBaseId) of
        #market_silver_item_data{type = Type, step = Step}
            when Step > 0 andalso (Type =:= 2 orelse Type =:= 4) ->
            case lists:keyfind(1, 1, Attrs) of
                {_, CellStep} ->
                    {ok, MaxStep} = get_silver_price_ext(max_step,
                                                         SPrice,
                                                         Step),
                    case CellStep > MaxStep of
                        true ->
                            NewExt = lists:keystore(max_step,
                                                    1,
                                                    Ext,
                                                    {max_step, CellStep}),
                            SPrice#market_silver_price{ext = NewExt};
                        false -> SPrice
                    end;
                _ -> SPrice
            end;
        _ -> SPrice
    end.

server_recover_cell(CellId, Cells, Rid) ->
    case lists:keyfind(CellId,
                       #market_silver_shop_cell.cell_id,
                       Cells)
        of
        Cell = #market_silver_shop_cell{status = 6} ->
            do_server_recover_cell(Rid, Cell);
        Cell = #market_silver_shop_cell{status = Status}
            when Status =:= 0 orelse Status =:= 5 ->
            do_server_recover_cell(Rid, Cell);
        _False -> false
    end.

do_server_recover_cell(SellerId,
                       Cell = #market_silver_shop_cell{item_base_id = BaseId,
                                                       num = Num,
                                                       sold_num = SoldNum,
                                                       cell_id = CellId}) ->
    LimitNum = erlang:min(Num, 5),
    case catch ets:lookup(market_silver_price_tab, BaseId)
        of
        [#market_silver_price{recover_num = 0}] -> false;
        [Price = #market_silver_price{recover_num = RequireNum,
                                      day_recover = DayRecover,
                                      sellers = Sellers}]
            when LimitNum =< RequireNum ->
            NDayRecover = DayRecover + LimitNum,
            NRequireNum = RequireNum - LimitNum,
            UpdatePrice = Price#market_silver_price{recover_num =
                                                        NRequireNum,
                                                    day_recover = NDayRecover},
            {NewPrice, NewCell} = case Num > LimitNum of
                                      true ->
                                          NewSoldNum = SoldNum + LimitNum,
                                          NewNum = Num - LimitNum,
                                          UpdateCell =
                                              Cell#market_silver_shop_cell{status
                                                                               =
                                                                               5,
                                                                           sold_num
                                                                               =
                                                                               NewSoldNum,
                                                                           num =
                                                                               NewNum},
                                          {UpdatePrice, UpdateCell};
                                      false ->
                                          NewSoldNum = SoldNum + LimitNum,
                                          UpdateCell =
                                              Cell#market_silver_shop_cell{status
                                                                               =
                                                                               1,
                                                                           sold_num
                                                                               =
                                                                               NewSoldNum,
                                                                           num =
                                                                               0},
                                          NewSellers = lists:delete({SellerId,
                                                                     CellId},
                                                                    Sellers),
                                          RtnPrice =
                                              UpdatePrice#market_silver_price{sellers
                                                                                  =
                                                                                  NewSellers},
                                          {RtnPrice, UpdateCell}
                                  end,
            {ok, LimitNum, NewPrice, NewCell};
        [Price = #market_silver_price{recover_num = RequireNum,
                                      day_recover = DayRecover}] ->
            NewSoldNum = SoldNum + RequireNum,
            NewNum = Num - RequireNum,
            NDayRecover = DayRecover + RequireNum,
            UpdatePrice = Price#market_silver_price{recover_num = 0,
                                                    day_recover = NDayRecover},
            UpdateCell = Cell#market_silver_shop_cell{status = 5,
                                                      sold_num = NewSoldNum,
                                                      num = NewNum},
            {ok, RequireNum, UpdatePrice, UpdateCell};
        _False -> false
    end.

reset_timer() ->
    Now = date:unixtime(),
    Time = date:unixtime({next_day, Now}),
    erlang:send_after((Time - Now) * 1000, self(), reset).

set_server_recover_timer() ->
    NextDiff = 10 * 60,
    erlang:send_after(NextDiff * 1000,
                      self(),
                      server_recover).

clean(#state{reset_timer = TRef}) ->
    erlang:cancel_timer(TRef),
    logger:debug("清理银币市场数据", [], market_silver, 2724),
    util:close_dets(market_silver_shop_tab),
    util:close_dets(market_silver_price_tab).

shuffle(L) ->
    List1 = [{random:uniform(), X} || X <- L],
    List2 = lists:keysort(1, List1),
    [E || {_, E} <- List2].

get_cell(CellId, #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [#market_silver_shop{cells = Cells}] ->
            case lists:keyfind(CellId,
                               #market_silver_shop_cell.cell_id,
                               Cells)
                of
                Cell = #market_silver_shop_cell{} -> {ok, Cell};
                false -> false
            end;
        _False -> false
    end.

server_recover() ->
    Now = date:unixtime(),
    F = fun (#market_silver_price{sellers =
                                      Sellers = [_ | _],
                                  recover_num = Num},
             Acc)
                when Num > 0 ->
                merge_sellers(Sellers, Acc);
            (_H, Acc) -> Acc
        end,
    Rids = ets:foldl(F, [], market_silver_price_tab),
    Shops = recover_shops(Rids, Now, []),
    ShuffleShops = shuffle(Shops),
    do_server_recover(ShuffleShops, Now, []).

merge_sellers([], Acc) -> Acc;
merge_sellers([{Rid, _} | Rest], Acc) ->
    NewAcc = case lists:member(Rid, Acc) of
                 true -> Acc;
                 _ -> [Rid | Acc]
             end,
    merge_sellers(Rest, NewAcc).

recover_shops([], _Now, Shops) -> Shops;
recover_shops([Rid | Rest], Now, Shops) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
        [Shop = #market_silver_shop{pid = Pid}]
            when is_pid(Pid) ->
            recover_shops(Rest, Now, [Shop | Shops]);
        [Shop = #market_silver_shop{last_logout = LastLogout}]
            when Now - LastLogout < 86400 ->
            recover_shops(Rest, Now, [Shop | Shops]);
        _ -> recover_shops(Rest, Now, Shops)
    end.

do_server_recover([], _Now, ShopList) ->
    [role:apply(async,
                Pid,
                {market_silver, push_ico_mark, []})
     || #market_silver_shop{pid = Pid} <- ShopList,
        is_pid(Pid)],
    save(market_silver_shop_tab, ShopList),
    {ok, ShopList};
do_server_recover([Shop = #market_silver_shop{cells =
                                                  Cells,
                                              rid = Rid}
                   | Rest],
                  Now, ShopList) ->
    RecoverCells = recover_cell(Cells, Now, []),
    CellIds = [CellId
               || #market_silver_shop_cell{cell_id = CellId}
                      <- RecoverCells],
    case do_server_recover_timeout(CellIds, Cells, Rid, 0)
        of
        {0, _} -> do_server_recover(Rest, Now, ShopList);
        {1, NewCells} ->
            NewShop = Shop#market_silver_shop{cells = NewCells},
            do_server_recover(Rest, Now, [NewShop | ShopList])
    end.

server_auto_buy_seller([]) -> ok;
server_auto_buy_seller([{BaseId, Num} | Rest]) ->
    case catch ets:lookup(market_silver_price_tab, BaseId)
        of
        [#market_silver_price{sellers = []}] ->
            server_record_recover_timeout(BaseId, Num, auto),
            server_auto_buy_seller(Rest);
        [#market_silver_price{sellers = Sellers}] ->
            server_auto_buy_seller(Num, Sellers, BaseId),
            server_auto_buy_seller(Rest);
        _ -> server_auto_buy_seller(Rest)
    end;
server_auto_buy_seller([_ | Rest]) ->
    server_auto_buy_seller(Rest);
server_auto_buy_seller(_) -> false.

server_auto_buy_seller(0, _Sellers, _BaseId) -> ok;
server_auto_buy_seller(Num, [], BaseId) ->
    server_record_recover_timeout(BaseId, Num, auto),
    ok;
server_auto_buy_seller(Num, [{SellerId, CellId} | Rest],
                       BaseId) ->
    case catch ets:lookup(market_silver_shop_tab, SellerId)
        of
        [Shop = #market_silver_shop{cells = Cells}] ->
            case server_recover_cell(CellId, Cells, SellerId) of
                {ok,
                 RecoverNum,
                 SilverPrice = #market_silver_price{day_auto = DayAuto},
                 NewCell} ->
                    NewCells = lists:keystore(CellId,
                                              #market_silver_shop_cell.cell_id,
                                              Cells,
                                              NewCell),
                    NewNum = erlang:max(Num - RecoverNum, 0),
                    NewDayAuto = DayAuto + RecoverNum,
                    NSilverPrice = SilverPrice#market_silver_price{day_auto
                                                                       =
                                                                       NewDayAuto},
                    save(market_silver_price_tab, NSilverPrice),
                    save(market_silver_shop_tab,
                         Shop#market_silver_shop{cells = NewCells}),
                    server_auto_buy_seller(NewNum, Rest, BaseId);
                _False -> server_auto_buy_seller(Num, Rest, BaseId)
            end;
        _False -> server_auto_buy_seller(Num, Rest, BaseId)
    end.

calc_sale_tiem(Now) ->
    Rand = util:rand(5, 10),
    Now + Rand * 60.

calc_system_price(Price) ->
    Rand = util:rand(1, 10),
    case Rand >= 5 of
        true ->
            Percent = (5 + Rand - 10) / 100,
            util:ceil(Price * Percent) + Price;
        false ->
            Percent = (5 - Rand) / 100,
            Price - util:ceil(Price * Percent)
    end.

calc_system_price(ItemBaseId, Price) ->
    SystemPrice = calc_system_price(Price),
    case market_silver_data:get(ItemBaseId) of
        #market_silver_item_data{min_price = Min,
                                 max_price = Max} ->
            erlang:min(Max, erlang:max(Min, SystemPrice));
        _ -> SystemPrice
    end.

fix_price(SPrice = #market_silver_price{item_base_id =
                                            BaseId,
                                        sellers = Sellers}) ->
    NewSellers = del_dirty_sellers(Sellers, BaseId, []),
    SPrice#market_silver_price{sellers = NewSellers}.

del_dirty_sellers([], _BaseId, Sellers) -> Sellers;
del_dirty_sellers([{Rid, CellId} | Rest], BaseId,
                  Sellers) ->
    NewSellers = case catch
                          ets:lookup(market_silver_shop_tab, Rid)
                     of
                     [#market_silver_shop{cells = Cells}] ->
                         case lists:keyfind(CellId,
                                            #market_silver_shop_cell.cell_id,
                                            Cells)
                             of
                             #market_silver_shop_cell{item_base_id = BaseId} ->
                                 [{Rid, CellId} | Sellers];
                             _False -> Sellers
                         end;
                     _ -> Sellers
                 end,
    del_dirty_sellers(Rest, BaseId, NewSellers).

get_silver_price_ext(Tag,
                     #market_silver_price{ext = Ext}, Default) ->
    case lists:keyfind(Tag, 1, Ext) of
        {Tag, Val} -> {ok, Val};
        _ -> {ok, Default}
    end.

log_purchs_text(default, Loss, Items) ->
    LossStr = log:item_str(Loss),
    GainStr = log:item_str(Items),
    complete_log_args([loss,
                       gain,
                       id,
                       platform,
                       zone_id,
                       name,
                       cell_id,
                       tax,
                       cell],
                      [{loss, LossStr}, {gain, GainStr}],
                      []);
log_purchs_text({{Id, Platform, ZoneId}, Name, CellId},
                Loss, Items) ->
    LossStr = log:item_str(Loss),
    GainStr = log:item_str(Items),
    complete_log_args([loss,
                       gain,
                       id,
                       platform,
                       zone_id,
                       name,
                       cell_id,
                       tax,
                       cell],
                      [{loss, LossStr},
                       {gain, GainStr},
                       {id, Id},
                       {platform, Platform},
                       {zone_id, ZoneId},
                       {name, Name},
                       {cell_id, CellId}],
                      []);
log_purchs_text(_Unknow, Loss, Items) ->
    logger:error("未知购买日志:[~w][~w][~w]",
                 [_Unknow, Loss, Items],
                 market_silver,
                 2901),
    "".

log_on_sale_text(#item{base_id = ItemBaseId,
                       step = Step},
                 Num, Price, CellId) ->
    LossStr = log:item_str({ItemBaseId, Num}),
    CellStr = util:flist("{~w,~ts,~w,~w,~w}",
                         [ItemBaseId,
                          item:attr(name, ItemBaseId),
                          Num,
                          Step,
                          Price]),
    complete_log_args([loss,
                       gain,
                       id,
                       platform,
                       zone_id,
                       name,
                       cell_id,
                       tax,
                       cell],
                      [{loss, LossStr}, {cell_id, CellId}, {cell, CellStr}],
                      []);
log_on_sale_text(_Unknow, Num, Price, CellId) ->
    logger:error("未知日志:[~w][~w][~w]",
                 [_Unknow, Num, Price, CellId],
                 market_silver,
                 2910),
    "".

log_on_sale_again_text(#market_silver_shop_cell{cell_id
                                                    = CellId,
                                                item_base_id = ItemBaseId,
                                                num = OldNum,
                                                item_attrs = Attrs},
                       NewNum, PrePrice) ->
    Step = case lists:keyfind(1, 1, Attrs) of
               {_, Step0} -> Step0;
               _False -> 0
           end,
    {GainStr, LossStr} = if NewNum < OldNum ->
                                {log:item_str({ItemBaseId, OldNum - NewNum}),
                                 ""};
                            NewNum > OldNum ->
                                {"",
                                 log:item_str({ItemBaseId, NewNum - OldNum})};
                            true -> {"", ""}
                         end,
    CellStr = util:flist("{~w,~ts,~w,~w,~w}",
                         [ItemBaseId,
                          item:attr(name, ItemBaseId),
                          NewNum,
                          Step,
                          PrePrice]),
    complete_log_args([loss,
                       gain,
                       id,
                       platform,
                       zone_id,
                       name,
                       cell_id,
                       tax,
                       cell],
                      [{loss, LossStr},
                       {gain, GainStr},
                       {cell_id, CellId},
                       {cell, CellStr}],
                      []).

log_one_click_sale_text([], _Role) -> ok;
log_one_click_sale_text([#market_silver_shop_cell{cell_id
                                                      = CellId,
                                                  item_base_id = ItemBaseId,
                                                  num = Num, item_attrs = Attrs,
                                                  price = Price}
                         | Rest],
                        Role) ->
    Step = case lists:keyfind(1, 1, Attrs) of
               {_, Step0} -> Step0;
               _False -> 0
           end,
    CellStr = util:flist("{~w,~ts,~w,~w,~w}",
                         [ItemBaseId,
                          item:attr(name, ItemBaseId),
                          Num,
                          Step,
                          Price]),
    Tags = [{cell_id, CellId}, {cell, CellStr}],
    LogText = complete_log_args([loss,
                                 gain,
                                 id,
                                 platform,
                                 zone_id,
                                 name,
                                 cell_id,
                                 tax,
                                 cell],
                                Tags,
                                []),
    log:market(log_market_silver,
               Role,
               Role,
               "一键重新上架",
               LogText),
    log_one_click_sale_text(Rest, Role).

log_draw_text(#market_silver_shop_cell{cell_id = CellId,
                                       item_base_id = ItemBaseId,
                                       sold_num = SoldNum, num = Num,
                                       price = Price, item_attrs = Attrs},
              ExtraCoin, GainCoin) ->
    LossStr = log:item_str({ItemBaseId, SoldNum}),
    ExtraStr = log:item_str(#loss{label = coin,
                                  val = ExtraCoin}),
    GainStr = log:item_str(#loss{label = coin,
                                 val = GainCoin}),
    Step = case lists:keyfind(1, 1, Attrs) of
               {_, Step0} -> Step0;
               _False -> 0
           end,
    CellStr = util:flist("{~w,~ts,~w,~w,~w}",
                         [ItemBaseId,
                          item:attr(name, ItemBaseId),
                          Num,
                          Step,
                          Price]),
    complete_log_args([loss,
                       gain,
                       id,
                       platform,
                       zone_id,
                       name,
                       cell_id,
                       tax,
                       cell],
                      [{loss, LossStr},
                       {gain, GainStr},
                       {cell_id, CellId},
                       {tax, ExtraStr},
                       {cell, CellStr}],
                      []).

log_one_click_draw_text([], _Role, _NewRole) -> ok;
log_one_click_draw_text([H | Rest], Role, NewRole) ->
    case H of
        #{base_id := BaseId, label := Label, price := Price,
          num := Num, fee := AddFee, gain_val := GainVal,
          attrs := Attrs, cell_id := CellId, rest := RestNum} ->
            LossStr = log:item_str({BaseId, Num}),
            ExtraStr = log:item_str(#loss{label = Label,
                                          val = AddFee}),
            GainStr = log:item_str(#gain{label = Label,
                                         val = GainVal}),
            Step = case lists:keyfind(1, 1, Attrs) of
                       {_, Step0} -> Step0;
                       _False -> 0
                   end,
            CellStr = util:flist("{~w,~ts,~w,~w,~w}",
                                 [BaseId,
                                  item:attr(name, BaseId),
                                  RestNum,
                                  Step,
                                  Price]),
            Tags = [{loss, LossStr},
                    {gain, GainStr},
                    {cell_id, CellId},
                    {tax, ExtraStr},
                    {cell, CellStr}],
            LogText = complete_log_args([loss,
                                         gain,
                                         id,
                                         platform,
                                         zone_id,
                                         name,
                                         cell_id,
                                         tax,
                                         cell],
                                        Tags,
                                        []),
            log:market(log_market_silver,
                       Role,
                       NewRole,
                       "一键提现",
                       LogText),
            log:new_market(log_market_silver,
                           NewRole,
                           "一键提现",
                           GainVal,
                           Num,
                           BaseId,
                           Price,
                           RestNum,
                           AddFee,
                           Label,
                           ""),
            ok;
        _ -> ok
    end,
    log_one_click_draw_text(Rest, Role, NewRole).

log_take_off_text(#market_silver_shop_cell{cell_id =
                                               CellId},
                  Items) ->
    GainStr = log:item_str(Items),
    complete_log_args([loss,
                       gain,
                       id,
                       platform,
                       zone_id,
                       name,
                       cell_id,
                       tax,
                       cell],
                      [{gain, GainStr}, {cell_id, CellId}],
                      []).

log_open_cell_text(CellId, Loss) ->
    LossStr = log:item_str(Loss),
    complete_log_args([loss,
                       gain,
                       id,
                       platform,
                       zone_id,
                       name,
                       cell_id,
                       tax,
                       cell],
                      [{loss, LossStr}, {cell_id, CellId}],
                      []).

log_refresh_text(Loss) ->
    LossStr = log:item_str(Loss),
    complete_log_args([loss,
                       gain,
                       id,
                       platform,
                       zone_id,
                       name,
                       cell_id,
                       tax,
                       cell],
                      [{loss, LossStr}],
                      []).

complete_log_args([], _Log, Acc) ->
    log:format(lists:reverse(Acc));
complete_log_args([Arg | Rest], Log, Acc) ->
    case lists:keyfind(Arg, 1, Log) of
        {Arg, Val} when is_integer(Val) ->
            complete_log_args(Rest, Log, [{"~w", Val} | Acc]);
        {Arg, Val} when is_list(Val) ->
            complete_log_args(Rest, Log, [{"~ts", Val} | Acc]);
        _False ->
            complete_log_args(Rest, Log, [{"~ts", ""} | Acc])
    end.

calc_rfgoods_count(StatisticeInfo) ->
    TypeCount = calc_type_count(StatisticeInfo),
    TotalCount = 8 * 10,
    Count = case TypeCount =:= 0 of
                true -> TypeCount + 1;
                false -> TypeCount
            end,
    TotalCount div Count + 5.

calc_type_count(StatisticeInfo) ->
    calc_type_count(StatisticeInfo, 0).

calc_type_count([], Num) -> Num;
calc_type_count([{BaseId, _N} | Rest], Num) ->
    case is_quest_need(BaseId) of
        true -> calc_type_count(Rest, Num + 1);
        false -> calc_type_count(Rest, Num)
    end.

is_quest_need(BaseId) ->
    case market_silver_data:get(BaseId) of
        #market_silver_item_data{is_quest_need = 1} -> true;
        _ -> false
    end.

statistics_refresh_count([], RetAcc) -> RetAcc;
statistics_refresh_count([#market_silver_refresh{item_base_id
                                                     = BaseId}
                          | Rest],
                         RetAcc) ->
    case lists:keyfind(BaseId, 1, RetAcc) of
        {BaseId, OldNum} ->
            NewAcc = lists:keyreplace(BaseId,
                                      1,
                                      RetAcc,
                                      {BaseId, OldNum + 1}),
            statistics_refresh_count(Rest, NewAcc);
        false ->
            statistics_refresh_count(Rest, [{BaseId, 1} | RetAcc])
    end.

