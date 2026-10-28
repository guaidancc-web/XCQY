-file("src/mod/guard/guard.erl", 1).

-module(guard).

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

-file("src/mod/guard/guard.erl", 13).

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

-file("src/mod/guard/guard.erl", 14).

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

-file("src/mod/guard/guard.erl", 15).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/guard/guard.erl", 16).

-file("inc/guard.hrl", 1).

-record(m_guard,
        {ver = 1 :: pos_integer(),
         free_war_ids = [] :: [pos_integer()],
         tactics_fields = [] :: list(),
         tactics_attr = [] :: list(),
         guards = [] :: list()}).

-record(guard_eqm,
        {ver = 5,
         base_id :: undefined | non_neg_integer(),
         type :: undefined | non_neg_integer(),
         lev,
         eqm_attrs = [] :: list(),
         reset_base_id = 0,
         reset_attrs = [] :: list(),
         gem = [] :: list(),
         is_init = 1,
         timeout = 0,
         back_effect_timeout = 0,
         back_effect_attr = []}).

-record(guard_astroid,
        {ver = 2 :: non_neg_integer(),
         aroused = [] :: non_neg_integer(),
         skills = [] :: list(),
         attrs = [] :: list(),
         growth = 0 :: non_neg_integer(),
         active = 0 :: non_neg_integer()}).

-record(guard_astroid_star,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         attrs = [] :: list()}).

-record(guard,
        {ver = 2,
         base_id = 0 :: non_neg_integer(),
         war_id = 0 :: non_neg_integer(),
         name = "" :: string(),
         alias = "" :: string(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         tac_pos = 0 :: non_neg_integer(),
         skills = [] :: list(),
         eqm = [] :: list(),
         attr :: undefined | tuple(),
         score = 0 :: non_neg_integer(),
         astroid = #guard_astroid{} :: #guard_astroid{}}).

-record(guard_data,
        {base_id = 0 :: non_neg_integer(),
         name = "" :: binary(),
         alias = "" :: binary(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss = [] :: tuple(),
         recruit_lev = 1 :: non_neg_integer(),
         desc = "" :: list(),
         normal_atk_id = 0 :: integer(),
         ai_id = 0 :: integer(),
         base_score = 0,
         growth = 0 :: non_neg_integer()}).

-record(guard_eqm_data,
        {base_id = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss_coin = 0 :: [tuple()],
         reset_coin = 0 :: [tuple()],
         gem_list = [] :: list()}).

-record(guard_lev_data,
        {base_id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         lev_up_exp :: undefined | non_neg_integer(),
         attrs = [] :: non_neg_integer()}).

-record(guard_eqm_gem,
        {id = 0, base_id = 0, type = 0, lev = 0}).

-record(guard_eqm_gem_data,
        {base_id = 0,
         next_base_id = 0,
         name = "",
         lev = 0,
         type = 0,
         need_lev = 0,
         loss_coin = [],
         attrs = []}).

-file("src/mod/guard/guard.erl", 17).

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

-file("src/mod/guard/guard.erl", 18).

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

-file("src/mod/guard/guard.erl", 19).

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

-file("src/mod/guard/guard.erl", 20).

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

-file("src/mod/guard/guard.erl", 21).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/guard/guard.erl", 22).

-export([get_max_score_guard/1,
         init/0,
         in_field/3,
         level_up/3,
         login/1,
         out_field/2,
         recruit_guard/2,
         swap_war_id/4,
         adm_show/1]).

login(Role = #role{m_guard =
                       MGuard = #m_guard{guards = Guards}}) ->
    NewGuards = revise_guard(Guards, Role, []),
    NewMGuard = MGuard#m_guard{guards = NewGuards},
    NewRole = Role#role{m_guard = NewMGuard},
    {ok,
     NewRole1 = #role{m_guard =
                          #m_guard{guards = NewGuards1}}} =
        guard_eqm:set_time(NewRole, false),
    NewRole2 = guard_attr:batch_calc(NewGuards1, NewRole1),
    {ok, NewRole2};
login(_) -> ok.

-spec init() -> #m_guard{}.

init() -> #m_guard{free_war_ids = lists:seq(2, 5)}.

-spec recruit_guard(BaseId :: pos_integer(),
                    Role :: #role{}) -> {ok, #role{}, #guard{}} |
                                        {false, string()} |
                                        false.

recruit_guard(BaseId, Role) ->
    case recruit_guard_flow([check, loss, final],
                            Role,
                            BaseId,
                            #{})
        of
        {ok, GuardRole, Guard = #guard{score = Score}} ->
            NewRole = role_trigger:fire([#evt_guard{base_id =
                                                        BaseId},
                                         #evt_guard_score{val = Score}],
                                        GuardRole),
            formation:push_self_formation(NewRole),
            provocation_role:push_to_provocation(NewRole),
            {ok, NewRole, Guard};
        Rtn -> Rtn
    end.

-spec recruit_guard_flow(Steps, Role, BaseId,
                         Cache) -> {ok, #role{}, #guard{}} |
                                   {false, string()} |
                                   false when Steps :: list(), Role :: #role{},
                                              BaseId :: pos_integer(),
                                              Cache :: map().

recruit_guard_flow([check | RestSteps], Role, BaseId,
                   Cache) ->
    case check_recruit_cond([lev, own], BaseId, Role, Cache)
        of
        {true, NewCache} ->
            recruit_guard_flow(RestSteps, Role, BaseId, NewCache);
        {false, Reason} -> {false, Reason}
    end;
recruit_guard_flow([loss | RestSteps], Role, BaseId,
                   Cache = #{guard_data := #guard_data{loss = Loss}}) ->
    case role_gain:do(Loss, Role) of
        {ok, NewRole} ->
            recruit_guard_flow(RestSteps, NewRole, BaseId, Cache);
        {false, #loss{label = coin, val = Val}} ->
            {false,
             notice:format(lang:get("您的~ts不足~w，无法招募"),
                           [{assets_2, 90000}, Val])};
        {false,
         #loss{label = item_base_id,
               val = [{ItemBaseId, Val}]}} ->
            {false,
             notice:format(lang:get("您的~ts不足~w个，请到金币市场购买"),
                           [{item_2, ItemBaseId}, Val])};
        {false, #loss{label = item_base_id}} ->
            {false, lang:get("物品不足，无法招募守护")};
        {false, #loss{label = item_base_id_auto_buy}} ->
            {false, lang:get("钻石不足，无法招募守护")};
        {false, _} -> {false, lang:get("金币不足，无法招募守护")}
    end;
recruit_guard_flow([final | _],
                   Role = #role{m_guard =
                                    MGuard = #m_guard{guards = Guards,
                                                      free_war_ids = FreeIds},
                                name = RoleName},
                   _BaseId, #{guard_data := GuardData}) ->
    Lev = lev_break:lev(Role),
    InitGuard = #guard{base_id = GuardBaseId, quality = Q} =
                    init_guard(Lev, GuardData, Role),
    {RecFlag, WarGuard, NewFreeIds, Guards1} = case FreeIds
                                                   of
                                                   []
                                                       when Lev =< 50 andalso
                                                                GuardBaseId =:=
                                                                    1014 ->
                                                       [SWG = #guard{war_id =
                                                                         Min,
                                                                     base_id =
                                                                         SWId}
                                                        | _] =
                                                           [SG
                                                            || SG =
                                                                   #guard{base_id
                                                                              =
                                                                              SBaseId,
                                                                          status
                                                                              =
                                                                              1}
                                                                   <- Guards,
                                                               lists:member(SBaseId,
                                                                            [1002,
                                                                             1012])],
                                                       {1,
                                                        InitGuard#guard{status =
                                                                            1,
                                                                        war_id =
                                                                            Min},
                                                        FreeIds,
                                                        lists:keyreplace(SWId,
                                                                         #guard.base_id,
                                                                         Guards,
                                                                         SWG#guard{status
                                                                                       =
                                                                                       0,
                                                                                   war_id
                                                                                       =
                                                                                       0})};
                                                   [] ->
                                                       {0,
                                                        InitGuard,
                                                        FreeIds,
                                                        Guards};
                                                   _ ->
                                                       Min = lists:min(FreeIds),
                                                       {1,
                                                        InitGuard#guard{status =
                                                                            1,
                                                                        war_id =
                                                                            Min},
                                                        lists:delete(Min,
                                                                     FreeIds),
                                                        Guards}
                                               end,
    WarGuard1 = case RecFlag of
                    1 -> guard_attr:calc(WarGuard, Role);
                    0 -> WarGuard
                end,
    NewMGuard = MGuard#m_guard{guards =
                                   [WarGuard1 | Guards1],
                               free_war_ids = NewFreeIds},
    Role1 = Role#role{m_guard = NewMGuard},
    Role2 = case RecFlag of
                1 -> formation:update_team_form(Role1);
                0 -> Role1
            end,
    NewRole = Role2,
    case Q >= 3 of
        true ->
            Msg =
                notice:format(lang:get("~ts在~ts中招募了~ts，实力得到了大幅提升！"),
                              [{role_2, RoleName},
                               {string_2, 1, lang:get("[守护酒馆]")},
                               {guard_2, GuardBaseId}]),
            notice:cast(all, 4, Msg);
        _ -> ok
    end,
    {ok, NewRole, WarGuard};
recruit_guard_flow(Steps, _, _, _) ->
    logger:error("守护招募流程出错:[Steps:~w]",
                 [Steps],
                 guard,
                 154),
    {false, lang:get("未知的招募检测")}.

in_field(Guard, Pos, Role) ->
    Args = #{guard => Guard, pos => Pos},
    in_field_flow([check, final], Role, Args).

in_field_flow([check | RestSteps],
              Role = #role{m_guard =
                               #m_guard{tactics_fields = TacticsFields}},
              Args = #{pos := Pos}) ->
    case lists:member(Pos, TacticsFields) of
        true -> in_field_flow(RestSteps, Role, Args);
        false -> {false, lang:get("该阵位尚未开启，无法助阵")}
    end;
in_field_flow([final | _], Role, Args) ->
    case in_field_final(Args, Role) of
        {ok, NewRole} ->
            NewRole1 = guard_attr:recalc_tactics(NewRole),
            NewRole2 = formation:update_team_form(NewRole1),
            {ok, NewRole2};
        {false, Reason} -> {false, Reason}
    end;
in_field_flow(Steps, _, _) ->
    logger:error("守护助阵流程出错:[Steps:~w]",
                 [Steps],
                 guard,
                 182),
    {false, lang:get("未知的助战检测")}.

in_field_final(Args, Role) ->
    in_field_final_flow([exist, final], Role, Args).

in_field_final_flow([exist | RestSteps],
                    Role = #role{m_guard = #m_guard{guards = Guards}},
                    Args = #{pos := Pos,
                             guard := #guard{base_id = BaseId}}) ->
    case find_guard(by_tac_pos, Pos, Guards) of
        #guard{base_id = BaseId} -> {false, ""};
        TGuard = #guard{} ->
            in_field_final_flow(RestSteps,
                                Role,
                                Args#{t_guard => TGuard});
        _ ->
            in_field_final_flow(RestSteps,
                                Role,
                                Args#{t_guard => false})
    end;
in_field_final_flow([final | _],
                    Role = #role{m_guard =
                                     MGuard = #m_guard{guards = Guards}},
                    #{pos := Pos,
                      guard := SGuard = #guard{base_id = BaseId},
                      t_guard := false}) ->
    NewSGuard = SGuard#guard{status = 2, tac_pos = Pos},
    NewGuards = lists:keystore(BaseId,
                               #guard.base_id,
                               Guards,
                               NewSGuard),
    NewMGuard = MGuard#m_guard{guards = NewGuards},
    NewRole = Role#role{m_guard = NewMGuard},
    {ok, NewRole};
in_field_final_flow([final | _],
                    Role = #role{m_guard =
                                     MGuard = #m_guard{guards = Guards}},
                    #{pos := Pos,
                      guard := SGuard = #guard{base_id = SBaseId},
                      t_guard := TGuard = #guard{base_id = TBaseId}}) ->
    Result = case SGuard of
                 #guard{status = 0} ->
                     SGuard1 = SGuard#guard{status = 2, tac_pos = Pos},
                     TGuard1 = TGuard#guard{status = 0, tac_pos = 0},
                     {true, SGuard1, TGuard1};
                 #guard{status = 2, tac_pos = OldPos} ->
                     SGuard1 = SGuard#guard{status = 2, tac_pos = Pos},
                     TGuard1 = TGuard#guard{status = 2, tac_pos = OldPos},
                     {true, SGuard1, TGuard1};
                 _ -> false
             end,
    case Result of
        {true, NewSGuard, NewTGuard} ->
            Guards1 = lists:keystore(SBaseId,
                                     #guard.base_id,
                                     Guards,
                                     NewSGuard),
            Guards2 = lists:keystore(TBaseId,
                                     #guard.base_id,
                                     Guards1,
                                     NewTGuard),
            NewMGuard = MGuard#m_guard{guards = Guards2},
            NewRole = Role#role{m_guard = NewMGuard},
            {ok, NewRole};
        _ -> {false, lang:get("上阵守护不能助战")}
    end;
in_field_final_flow(Steps, _, _Args) ->
    logger:error("守护上阵最后一步流程出错[Steps:~w][Args:~w]",
                 [Steps, _Args],
                 guard,
                 227),
    {false, lang:get("未知的助战检测")}.

find_guard(by_tac_pos, Pos, GuardList) ->
    case lists:keyfind(Pos, #guard.tac_pos, GuardList) of
        Guard = #guard{} -> Guard;
        false -> false
    end.

out_field(Guard = #guard{base_id = BaseId},
          Role = #role{m_guard =
                           MGuard = #m_guard{guards = Guards}}) ->
    NewGuard = Guard#guard{status = 0, tac_pos = 0},
    NewGuards = lists:keystore(BaseId,
                               #guard.base_id,
                               Guards,
                               NewGuard),
    NewMGuard = MGuard#m_guard{guards = NewGuards},
    NewRole = Role#role{m_guard = NewMGuard},
    NewRole1 = guard_attr:recalc_tactics(NewRole),
    {ok, NewRole1}.

level_up(Role = #role{m_guard =
                          MGuard = #m_guard{guards = Guards}},
         OldLev, _) ->
    NewLev = lev_break:lev(Role),
    NewTactics = activate_tac_pos(NewLev),
    NewGuards = level_up(Guards, OldLev, NewLev, Role, []),
    NewMGuard = MGuard#m_guard{tactics_fields = NewTactics,
                               guards = NewGuards},
    Role1 = Role#role{m_guard = NewMGuard},
    Role2 = guard_attr:batch_calc(NewGuards, Role1),
    NewRole = Role2,
    guard_api:push_guards(NewRole),
    provocation_role:push_to_provocation(NewRole),
    NewRole.

level_up([], _, _, _, Acc) -> Acc;
level_up([Guard = #guard{} | RestGuards], OldLev,
         NewLev, Role, Acc) ->
    Guard1 = activate_skills(Guard, NewLev),
    Guard2 = guard_eqm:auto_update_eqm(OldLev,
                                       NewLev,
                                       Guard1),
    NewGuard = Guard2,
    level_up(RestGuards,
             OldLev,
             NewLev,
             Role,
             [NewGuard | Acc]).

activate_tac_pos(Lev) ->
    FieldList = guard_data:get_tactics(),
    [TacPos
     || {TacPos, NeedLev} <- FieldList, Lev >= NeedLev].

activate_skills(Guard = #guard{base_id = BaseId},
                Lev) ->
    SkillList = guard_data:get_skills(BaseId),
    NewSkills = [SkillId
                 || {SkillId, NeedLev} <- SkillList, Lev >= NeedLev],
    Guard#guard{skills = NewSkills}.

swap_war_id(GuardSid, 0, _GuardTid,
            Role = #role{m_guard =
                             MGuard = #m_guard{guards = Guards,
                                               free_war_ids = FreeIds}}) ->
    case lists:keytake(GuardSid, #guard.base_id, Guards) of
        {value, #guard{status = 0}, _RestGuards} -> ok;
        {value,
         Guard = #guard{status = 1, war_id = WarId},
         RestGuards} ->
            NewGuard = Guard#guard{status = 0, war_id = 0},
            NewMGuard = MGuard#m_guard{guards =
                                           [NewGuard | RestGuards],
                                       free_war_ids = [WarId | FreeIds]},
            Role1 = Role#role{m_guard = NewMGuard},
            Role2 = formation:update_team_form(Role1),
            NewRole = Role2,
            formation:push_self_formation(NewRole),
            NewRole2 = guard_attr:recalc_tactics(NewRole),
            {ok, NewRole2};
        _ -> {false, lang:get("该守护没有上阵")}
    end;
swap_war_id(_GuardSid, 1, 0,
            #role{m_guard = #m_guard{free_war_ids = []}}) ->
    {false, lang:get("当前已经上阵4个守护，请先下阵其他守护")};
swap_war_id(GuardSid, 1, GuardTid,
            Role = #role{m_guard =
                             MGuard = #m_guard{guards = Guards}}) ->
    case lists:keyfind(GuardSid, #guard.base_id, Guards) of
        #guard{status = 1} when GuardTid =:= 0 ->
            {false, lang:get("当前守护已经上阵")};
        #guard{status = 2} -> {false, lang:get("当前守护正在助战中")};
        #guard{} when GuardTid =:= 0 ->
            OldList = [{GuardBaseId, WarId}
                       || #guard{base_id = GuardBaseId, status = 1,
                                 war_id = WarId}
                              <- Guards],
            OldList1 = lists:keysort(2, OldList),
            OldList2 = [GuardBaseId
                        || {GuardBaseId, _} <- OldList1],
            OldList3 = lists:sublist(OldList2 ++ [GuardSid], 4),
            Len = length(OldList3),
            NewList = case OldList3 =/= [] of
                          true ->
                              lists:zip(OldList3, lists:seq(2, 2 + Len - 1));
                          false -> []
                      end,
            FreeIds1 = if Len =:= 0 -> [2, 3, 4, 5];
                          Len =:= 1 -> [3, 4, 5];
                          Len =:= 2 -> [4, 5];
                          Len =:= 3 -> [5];
                          true -> []
                       end,
            Guards1 = update_war_id(Guards,
                                    NewList,
                                    GuardSid,
                                    Role),
            NewMGuard = MGuard#m_guard{guards = Guards1,
                                       free_war_ids = FreeIds1},
            Role1 = Role#role{m_guard = NewMGuard},
            Role2 = formation:update_team_form(Role1),
            MaxScore = lists:max([Score
                                  || #guard{score = Score} <- Guards1]),
            NewRole = role_trigger:fire([#evt_guard_score{val =
                                                              MaxScore}],
                                        Role2),
            NewRole2 = guard_attr:recalc_tactics(NewRole),
            formation:push_self_formation(NewRole2),
            {ok, NewRole2};
        SGuard = #guard{} ->
            case lists:keyfind(GuardTid, #guard.base_id, Guards) of
                TGuard = #guard{status = 1} ->
                    {TacFlag, NewSGuard, NewTGuard} = exchange_guard(SGuard,
                                                                     TGuard),
                    Guards1 = lists:keyreplace(GuardSid,
                                               #guard.base_id,
                                               Guards,
                                               NewSGuard),
                    Guards2 = lists:keyreplace(GuardTid,
                                               #guard.base_id,
                                               Guards1,
                                               NewTGuard),
                    NewMGuard = MGuard#m_guard{guards = Guards2},
                    Role1 = Role#role{m_guard = NewMGuard},
                    Role2 = formation:update_team_form(Role1),
                    Role3 = case TacFlag of
                                0 -> Role2;
                                1 -> guard_attr:recalc_tactics(Role2)
                            end,
                    NewRole = Role3,
                    formation:push_self_formation(NewRole),
                    {ok, NewRole};
                #guard{status = 2} -> {false, lang:get("目标守护在助战中")};
                _ -> {false, lang:get("目标守护没有在参战")}
            end;
        _ -> {false, lang:get("请先招募该守护")}
    end.

update_war_id(Guards, [], _, _) -> Guards;
update_war_id(Guards, [{GuardBaseId, WarId} | T],
              GuardSid, Role) ->
    case lists:keyfind(GuardBaseId, #guard.base_id, Guards)
        of
        Guard = #guard{status = Status}
            when Status =:= 1 orelse Status =:= 0 ->
            Guard1 = Guard#guard{status = 1, war_id = WarId},
            Guard2 = case GuardBaseId =:= GuardSid of
                         true -> guard_attr:calc(Guard1, Role);
                         false -> Guard1
                     end,
            Guards1 = lists:keyreplace(GuardBaseId,
                                       #guard.base_id,
                                       Guards,
                                       Guard2),
            update_war_id(Guards1, T, GuardSid, Role);
        _ -> update_war_id(Guards, T, GuardSid, Role)
    end.

exchange_guard(SGuard = #guard{status = Status,
                               war_id = WarId1},
               TGuard = #guard{war_id = WarId2}) ->
    Result = case Status of
                 1 ->
                     SGuard1 = SGuard#guard{war_id = WarId2},
                     TGuard1 = TGuard#guard{war_id = WarId1},
                     {0, SGuard1, TGuard1};
                 0 ->
                     SGuard1 = SGuard#guard{status = 1, war_id = WarId2},
                     TGuard1 = TGuard#guard{status = 0, war_id = WarId1},
                     {1, SGuard1, TGuard1}
             end,
    Result.

check_recruit_cond([], _, _, Cache) -> {true, Cache};
check_recruit_cond([Cond | RestConds], BaseID, Role,
                   Cache) ->
    case check_recruit_cond(Cond, BaseID, Role, Cache) of
        {true, NewCache} ->
            check_recruit_cond(RestConds, BaseID, Role, NewCache);
        {false, Reason} -> {false, Reason}
    end;
check_recruit_cond(lev, BaseId, Role = #role{},
                   Cache) ->
    Lev = lev_break:lev(Role),
    case guard_data:get_guard_cfg(BaseId) of
        #guard_data{recruit_lev = RecruitLev}
            when Lev < RecruitLev ->
            {false,
             util:flist(lang:get("角色等级不足~w，未达到守护招募等级"),
                        [RecruitLev])};
        GuardData = #guard_data{} ->
            {true, Cache#{guard_data => GuardData}};
        _ -> {false, lang:get("不存在该守护可招募")}
    end;
check_recruit_cond(own, BaseId,
                   #role{m_guard = #m_guard{guards = Guards}}, Cache) ->
    case lists:keyfind(BaseId, #guard.base_id, Guards) of
        #guard{} -> {false, lang:get("无法重复招募相同守护")};
        _ -> {true, Cache}
    end.

-spec init_guard(Lev :: non_neg_integer(),
                 GuardData :: #guard_data{},
                 Role :: #role{}) -> #guard{}.

init_guard(Lev,
           Data = #guard_data{base_id = BaseID, name = Name,
                              alias = Alias, classes = Classes,
                              quality = Quality},
           Role) ->
    Guard = #guard{base_id = BaseID, name = Name,
                   alias = Alias, classes = Classes, quality = Quality,
                   astroid = guard_astroid:init(Data)},
    EqmList = guard_eqm:init(Classes, Role),
    Guard1 = Guard#guard{eqm = EqmList},
    Guard2 = activate_skills(Guard1, Lev),
    NewGuard = guard_attr:calc(Guard2, Role),
    NewGuard.

revise_guard([], _, Acc) -> Acc;
revise_guard([Guard = #guard{eqm = EqmList} | Rest],
             Role = #role{name = _Name}, Acc) ->
    NewEqmList = [guard_attr:calc_eqm(Eqm)
                  || Eqm <- EqmList],
    NewGuard = guard_astroid:calc_growth(Guard#guard{eqm =
                                                         NewEqmList}),
    revise_guard(Rest, Role, [NewGuard | Acc]).

get_max_score_guard(#role{m_guard =
                              #m_guard{guards = []}}) ->
    false;
get_max_score_guard(#role{m_guard =
                              #m_guard{guards = [Guard | Guards]}}) ->
    find_max_score(Guards, Guard).

find_max_score([], Guard) -> Guard;
find_max_score([Guard = #guard{score = Score} | Rest],
               #guard{score = MaxScore})
    when Score > MaxScore ->
    find_max_score(Rest, Guard);
find_max_score([_Guard | Rest], MaxGuard) ->
    find_max_score(Rest, MaxGuard).

adm_show(#role{m_guard = #m_guard{guards = Guards}}) ->
    List = adm_show(Guards, []),
    {ok, List}.

adm_show([], List) -> List;
adm_show([#guard{base_id = BaseId, name = Name,
                 quality = Quality, score = Score, eqm = Eqms}
          | T],
         List) ->
    Stones = adm_show(eqm, Eqms, []),
    Add = [{base_id, BaseId},
           {name, Name},
           {quality, Quality},
           {score, Score},
           {stone, Stones}],
    adm_show(T, [Add | List]).

adm_show(_Label, [], List) -> List;
adm_show(Label = eqm, [#guard_eqm{gem = Gem} | T],
         List) ->
    Add = adm_show(stone, Gem, []),
    adm_show(Label, T, List ++ Add);
adm_show(Label = stone,
         [#guard_eqm_gem{base_id = BaseId} | T], List) ->
    Add = [{base_id, BaseId},
           {name, item:attr(name, BaseId)}],
    adm_show(Label, T, [Add | List]).

