-file("src/mod/skill/skill.erl", 1).

-module(skill).

-export([init/0,
         login/1,
         study/2,
         multi_study/1,
         push_10800/1,
         push_10802/2,
         get_total_skill/1,
         get_total_skill_lev/1,
         calc/2,
         get_effect_skill/1,
         get_effect_skill/2,
         get_effect_skill_attr/1,
         dynamic_skill_attr/2,
         skill_name/2,
         skill_classes_modify/2,
         is_classes_skill/2,
         classes_modify_skill_repair/1,
         speed_attr/3,
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

-file("src/mod/skill/skill.erl", 32).

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

-file("src/mod/skill/skill.erl", 33).

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

-file("src/mod/skill/skill.erl", 34).

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

-file("src/mod/skill/skill.erl", 35).

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

-file("src/mod/skill/skill.erl", 36).

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

-file("src/mod/skill/skill.erl", 37).

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

-file("src/mod/skill/skill.erl", 38).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/skill/skill.erl", 39).

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

-file("src/mod/skill/skill.erl", 40).

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

-file("src/mod/skill/skill.erl", 41).

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

-file("src/mod/skill/skill.erl", 42).

-file("inc/mount.hrl", 1).

-record(mount_goal,
        {ver = 1 :: non_neg_integer(),
         finish = [] :: list(),
         doing = [] :: list(),
         day_reward = [] :: list()}).

-record(m_mount,
        {ver = 10 :: pos_integer(),
         mounts = [] :: list(),
         mount_goal = #mount_goal{},
         next_mount_id = 1 :: non_neg_integer(),
         ride_mount = 0,
         appearance_list = [],
         combat_active_times = [],
         dye_list = [],
         dye_diff_list = [],
         pre_mount_status = 0 :: non_neg_integer(),
         evolution_list = [],
         double_ride_role = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         is_driver = 0}).

-record(mount,
        {ver = 4 :: pos_integer(),
         index = 0 :: non_neg_integer(),
         mount_base_id = 0 :: non_neg_integer(),
         transformation_id = 0 :: non_neg_integer(),
         lev = 1 :: pos_integer(),
         skill_point = 1 :: pos_integer(),
         fail_times = 0 :: non_neg_integer(),
         upgrade_lev = 0 :: non_neg_integer(),
         live_status = 0,
         skill_list = [],
         fight_times = 0 :: non_neg_integer(),
         spirit = 0 :: non_neg_integer(),
         growth = 1 :: pos_integer(),
         growth_item_num = 0 :: non_neg_integer(),
         speed_lev = 1 :: pos_integer(),
         manger_pets = [],
         tmp_growth = 1 :: pos_integer(),
         tmp_skill_list = [],
         decorate_list = [],
         score = 0,
         expire_time = 0}).

-record(mount_skill,
        {skill_index = 1 :: pos_integer(),
         skill_id = 1 :: non_neg_integer(),
         skill_lev = 0 :: non_neg_integer()}).

-record(mount_decorate,
        {decorate_index = 1 :: pos_integer(),
         decorate_base_id = 0 :: non_neg_integer(),
         is_hide = 0 :: non_neg_integer()}).

-record(mount_dye,
        {trans_id = 0, dye_id = 0, cache_dye_list = []}).

-record(mount_evolution,
        {trans_id = 0, evolution_id = 0}).

-file("src/mod/skill/skill.erl", 43).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/skill/skill.erl", 44).

init() -> #m_skill{}.

login(Role = #role{classes = Classes,
                   m_skill = MSkill = #m_skill{skills = []}}) ->
    SkillIds = skill_data:get_init(Classes),
    Skills = [{SkillId, 0} || SkillId <- SkillIds],
    MinSkillId = lists:min([Id || {Id, _} <- Skills]),
    NewSkills = lists:keystore(MinSkillId,
                               1,
                               Skills,
                               {MinSkillId, 1}),
    NewMSkill = MSkill#m_skill{skills = NewSkills},
    Role1 = Role#role{m_skill = NewMSkill},
    {ok, Role1};
login(Role) -> {ok, Role}.

get_total_skill(#role{m_skill =
                          #m_skill{skills = Skills}}) ->
    Skills.

get_total_skill_lev(#role{m_skill =
                              #m_skill{skills = Skills}}) ->
    lists:sum([Lev || {_, Lev} <- Skills]).

get_base_skill(#role{m_skill =
                         #m_skill{skills = Skills},
                     classes = Classes}) ->
    FirstSkillId = case Classes of
                       1 -> 10001;
                       2 -> 20001;
                       3 -> 30001;
                       4 -> 40001;
                       5 -> 50001;
                       6 -> 69001;
                       7 -> 69501;
                       _ -> 1000
                   end,
    FirstSkillLev = case lists:keyfind(FirstSkillId,
                                       1,
                                       Skills)
                        of
                        {_, Lev} -> Lev;
                        _ -> 0
                    end,
    {FirstSkillId, FirstSkillLev}.

study(SkillId,
      Role = #role{lev = RoleLev,
                   m_skill = #m_skill{skills = Skills},
                   m_lev_break = #m_lev_break{times = MLBTimes}}) ->
    {BaseSkillId, BaseSkillLev} = get_base_skill(Role),
    case lists:keyfind(SkillId, 1, Skills) of
        false -> {false, lang:get("不能学习不属于你职业的技能")};
        {_SkillId, Lev}
            when Lev >= RoleLev andalso
                     MLBTimes =:= 1 andalso
                         Lev =:= 100 andalso RoleLev =< 100 ->
            NoticeMsg =
                notice:format(lang:get("达到~ts级再来吧{face_1,3}"),
                              [{string_2, 5, Lev + 1}]),
            {false, NoticeMsg};
        {_SkillId, Lev}
            when Lev >= RoleLev andalso
                     MLBTimes =:= 1 andalso Lev >= 100 ->
            {false, lang:get("技能等级不能超过角色等级")};
        {_SkillId, Lev}
            when Lev >= RoleLev andalso MLBTimes =:= 0 ->
            {false, lang:get("技能等级不能超过角色等级")};
        {SkillId, Lev} ->
            case check_study(SkillId,
                             Lev,
                             BaseSkillId,
                             BaseSkillLev,
                             RoleLev,
                             MLBTimes)
                of
                {true, RoleBaseSkill} ->
                    case study_loss(RoleBaseSkill, Role) of
                        {ok, NewRole, SkillId, NewLev, Flag} ->
                            update_role(NewRole, [{SkillId, NewLev}], Flag);
                        {false, Reason} -> {false, Reason}
                    end;
                {false, Reason} -> {false, Reason}
            end
    end.

multi_study(Role = #role{lev = RoleLev,
                         m_skill = #m_skill{skills = Skills}}) ->
    case multi_study(Role, RoleLev, Skills) of
        {false, Reason} -> {false, Reason};
        {NewRole, LastSkills, AttrFlag} ->
            NeedStudy = [{SkillId, Lev}
                         || {SkillId, BaseLev, Lev} <- LastSkills,
                            BaseLev =/= Lev],
            update_role(NewRole, NeedStudy, AttrFlag)
    end.

get_effect_skill(#role{p_eqm = #package{items = Items},
                       m_skill = #m_skill{skills = SkillList}}) ->
    get_effect_skill(Items, SkillList).

get_effect_skill(Items, SkillList) ->
    SkillAttrs = do_get_effect_skill(Items, []),
    Fun1 = fun (#attr_base{type = SkillType, val = SkillId},
                {L1, L2}) ->
                   case SkillType of
                       10 -> {L1, [SkillId | L2]};
                       _ -> {[SkillId | L1], L2}
                   end;
               (_, {L1, L2}) -> {L1, L2}
           end,
    {SkillAttrs1, SkillEff} = lists:foldl(Fun1,
                                          {[], []},
                                          SkillAttrs),
    SkillAttrs2 = lists:usort(SkillAttrs1),
    SkillEff2 = lists:usort(SkillEff),
    Fun = fun (SkillId) ->
                  lists:keymember(SkillId, 1, SkillList)
          end,
    {TalentSkills, AddSkills} = lists:partition(Fun,
                                                SkillAttrs2),
    {TalentSkills, AddSkills, SkillEff2}.

do_get_effect_skill([], SkillAttrs) -> SkillAttrs;
do_get_effect_skill([#item{attr = Attr} | T],
                    SkillAttrs) ->
    case [S || S = #attr_base{name = 100} <- Attr] of
        [_ | _] = L -> do_get_effect_skill(T, L ++ SkillAttrs);
        _ -> do_get_effect_skill(T, SkillAttrs)
    end;
do_get_effect_skill([#guard_eqm{eqm_attrs = Attr} | T],
                    SkillAttrs) ->
    case [S || S = #attr_base{name = 100} <- Attr] of
        [_ | _] = L -> do_get_effect_skill(T, L ++ SkillAttrs);
        _ -> do_get_effect_skill(T, SkillAttrs)
    end.

get_effect_skill_attr(Role) ->
    {TalentSkills, AddSkills, EffSkills} =
        get_effect_skill(Role),
    TalentEffect = lists:foldl(fun (SkillId, TalentList) ->
                                       case skill_talent_data:get(SkillId) of
                                           #{talent3_eff := []} -> TalentList;
                                           #{talent3_eff := Teff3} ->
                                               [{SkillId, Teff3} | TalentList];
                                           _ -> TalentList
                                       end
                               end,
                               [],
                               TalentSkills),
    NewAddSkills = [{SkillId, 1} || SkillId <- AddSkills],
    NewEffSkills = [{SkillId, 1} || SkillId <- EffSkills],
    {TalentEffect, NewAddSkills, NewEffSkills}.

check_study(SkillId, Lev, BaseSkillId, BaseSkillLev,
            RoleLev, MLBTimes) ->
    case skill_data:get_role({SkillId, Lev + 1}) of
        RoleBaseSkill1 = #role_base_skill{study_lev = StudyLev}
            when StudyLev > RoleLev andalso
                     MLBTimes =:= 1 andalso Lev < 100 ->
            {true, RoleBaseSkill1};
        #role_base_skill{study_lev = StudyLev}
            when StudyLev > RoleLev ->
            {false,
             util:flist(lang:get("角色未达到~w级, 无法学习该技能"), [StudyLev])};
        #role_base_skill{way = 2} when Lev =:= 0 ->
            {false, lang:get("该技能需要通过剧情任务领悟")};
        #role_base_skill{}
            when SkillId =/= BaseSkillId andalso
                     Lev >= BaseSkillLev ->
            SkillName = skill_name(BaseSkillId, BaseSkillLev),
            Msg = notice:format(lang:get("技能等级不能超过主技能[~ts]的等级"),
                                [{string_2, 5, SkillName}]),
            {false, Msg};
        RoleBaseSkill = #role_base_skill{} ->
            {true, RoleBaseSkill};
        _ -> {false, lang:get("该技能已经学到最高等级了")}
    end.

study_loss(#role_base_skill{id = SkillId, lev = Lev,
                            cost = Cost, attr = Attr},
           Role = #role{}) ->
    {WorldLev, _} = world_lev:get_world_lev(Role),
    NewCost = case Lev =< WorldLev - 5 of
                  true ->
                      [{BaseId, max(1, util:floor(Val * 5.0e-1))}
                       || {BaseId, Val} <- Cost];
                  false -> Cost
              end,
    Loss = format:val_to_loss(NewCost),
    case role_gain:do(Loss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, NewRole} ->
            Flag = case Attr of
                       [_ | _] -> true;
                       _ -> false
                   end,
            {ok, NewRole, SkillId, Lev, Flag}
    end.

pre_study_loss(#role_base_skill{id = SkillId, lev = Lev,
                                cost = Cost, attr = Attr},
               Assets = #assets{coin = AllCoin}, WorldLev) ->
    case Cost of
        [] ->
            Flag = case Attr of
                       [_ | _] -> true;
                       _ -> false
                   end,
            {ok, 0, SkillId, Lev, Flag, Assets};
        [{90000, CostCoin}] ->
            case AllCoin >= CostCoin of
                true ->
                    Flag = case Attr of
                               [_ | _] -> true;
                               _ -> false
                           end,
                    NewCostCoin = case Lev =< WorldLev - 5 of
                                      true ->
                                          max(1, util:floor(CostCoin * 5.0e-1));
                                      false -> CostCoin
                                  end,
                    {ok,
                     NewCostCoin,
                     SkillId,
                     Lev,
                     Flag,
                     Assets#assets{coin = AllCoin - CostCoin}};
                false -> {false_coin, lang:get("银币不足, 无法升级")}
            end;
        _ -> {false, lang:get("有特殊升级道具, 无法升级")}
    end.

speed_attr(Role = #role{m_skill =
                            MSkill = #m_skill{skills = Skills, speed = Speed}},
           SkillId, Flag) ->
    case lists:keyfind(SkillId, 1, Skills) of
        false -> {false, lang:get("该技能不存在")};
        _ ->
            NewSpeed = case Flag of
                           1 -> [SkillId | lists:delete(SkillId, Speed)];
                           _ -> lists:delete(SkillId, Speed)
                       end,
            NewRole = Role#role{m_skill =
                                    MSkill#m_skill{speed = NewSpeed}},
            push_10800(NewRole),
            {ok, attr:calc_and_push(NewRole)}
    end.

update_role(Role, [], Flag) ->
    case Flag of
        true -> {ok, attr:calc_and_push(Role)};
        false -> {ok, Role}
    end;
update_role(Role = #role{m_skill =
                             Mskill = #m_skill{skills = Skills}},
            [{SkillId, Lev} | T], Flag) ->
    NewSkills = lists:keystore(SkillId,
                               1,
                               Skills,
                               {SkillId, Lev}),
    NewRole = Role#role{m_skill =
                            Mskill#m_skill{skills = NewSkills}},
    push_10802(NewRole, {SkillId, Lev}),
    Nr = role_trigger:fire(#evt_skill_up{id = SkillId,
                                         lev = Lev},
                           NewRole),
    update_role(Nr, T, Flag).

skill_name(SkillId, Lev) ->
    case skill_data:get_role({SkillId, Lev}) of
        #role_base_skill{name = Name} -> Name;
        _ -> ""
    end.

skill_classes_modify(Role = #role{m_skill =
                                      MSkills = #m_skill{skills = Skills}},
                     TargetClass) ->
    Fun = fun ({SkillId, SkillLev}, Rtn) ->
                  Index = SkillId rem 100,
                  SKillInitList = skill_data:get_init(TargetClass),
                  NewSkillId = lists:nth(Index, SKillInitList),
                  lists:keystore(SkillId, 1, Rtn, {NewSkillId, SkillLev});
              (_Other, Rtn) -> [_Other | Rtn]
          end,
    NewSkills = lists:foldl(Fun, [], Skills),
    logger:debug("专职变更职业技能:~w, 变更后:~w",
                 [Skills, NewSkills],
                 skill,
                 296),
    NewRole = Role#role{m_skill =
                            MSkills#m_skill{skills = NewSkills}},
    push_10800(NewRole),
    NewRole.

is_classes_skill(SkillId, SkillLev) ->
    case skill_data:get_role({SkillId, SkillLev}) of
        #role_base_skill{} -> true;
        _ -> false
    end.

calc(Ac = #attr_calc{},
     Role = #role{m_skill =
                      #m_skill{skills = Skills, speed = Speed},
                  lev = RoleLev}) ->
    Skills1 = do_calc(Skills, Speed, []),
    {_, AddSkills, _} = get_effect_skill(Role),
    AddSkills1 = do_calc_effect(AddSkills, []),
    BuffSkill = buff:buff_skill(Role),
    BuffSkill1 = do_calc_buff(BuffSkill, RoleLev, []),
    MountSkill = mount:get_mount_skills(Role),
    MountSkill1 = do_calc_mount(MountSkill, RoleLev, []),
    TalismanSkill = talisman:get_skills(Role),
    TalismanSkill1 = do_calc_talisman(TalismanSkill,
                                      RoleLev,
                                      []),
    Ac1 = calc_skill(Ac,
                     Skills1 ++
                         AddSkills1 ++
                             BuffSkill1 ++ MountSkill1 ++ TalismanSkill1),
    Ac1;
calc(Ac = #attr_calc{}, _Role) -> Ac.

do_calc([], _Speed, Result) -> Result;
do_calc([{Id, Lev} | T], Speed, Result) ->
    case lists:member(Id, Speed) of
        true ->
            case skill_data:get_role({Id, Lev}) of
                Skill = #role_base_skill{attr = Attr = [_ | _]} ->
                    Skill1 = Skill#role_base_skill{attr =
                                                       lists:keydelete(3,
                                                                       #attr_base.name,
                                                                       Attr)},
                    logger:debug("========================== ~w ~w",
                                 [Attr,
                                  lists:keydelete(3, #attr_base.name, Attr)],
                                 skill,
                                 334),
                    do_calc(T, Speed, [Skill1 | Result]);
                _ -> do_calc(T, Speed, Result)
            end;
        _ ->
            case skill_data:get_role({Id, Lev}) of
                Skill = #role_base_skill{attr = [_ | _]} ->
                    do_calc(T, Speed, [Skill | Result]);
                _ -> do_calc(T, Speed, Result)
            end
    end.

do_calc_effect([], Result) -> Result;
do_calc_effect([Id | T], Result) ->
    case skill_data:get_effect({Id, 1}) of
        Skill = #{attr := [_ | _]} ->
            do_calc_effect(T, [Skill | Result]);
        _ -> do_calc_effect(T, Result)
    end.

do_calc_buff([], _RoleLev, Result) -> Result;
do_calc_buff([{Id, Lev} | T], RoleLev, Result) ->
    case skill_data:get_other({Id, Lev}) of
        Skill = #{attr := Attr = [_ | _]} ->
            Attr1 = skill:dynamic_skill_attr(Attr, RoleLev),
            do_calc_buff(T,
                         RoleLev,
                         [Skill#{attr => Attr1} | Result]);
        _ -> do_calc_buff(T, RoleLev, Result)
    end.

do_calc_mount([], _RoleLev, Result) -> Result;
do_calc_mount([#mount_skill{skill_id = SkillId,
                            skill_lev = SkillLev}
               | T],
              RoleLev, Result) ->
    case skill_data:get_mount({SkillId, SkillLev}) of
        Skill = #{attr := Attr = [_ | _]} ->
            Attr1 = skill:dynamic_skill_attr(Attr, RoleLev),
            do_calc_mount(T,
                          RoleLev,
                          [Skill#{attr => Attr1} | Result]);
        _ -> do_calc_mount(T, RoleLev, Result)
    end;
do_calc_mount([_ | T], RoleLev, Result) ->
    do_calc_mount(T, RoleLev, Result).

do_calc_talisman([], _RoleLev, Result) -> Result;
do_calc_talisman([{SkillId, Lev} | T], RoleLev,
                 Result) ->
    case skill_data:get_talisman({SkillId, Lev}) of
        Skill = #{attr := Attr = [_ | _]} ->
            Attr1 = skill:dynamic_skill_attr(Attr, RoleLev),
            do_calc_talisman(T,
                             RoleLev,
                             [Skill#{attr => Attr1} | Result]);
        _ -> do_calc_talisman(T, RoleLev, Result)
    end.

calc_skill(Ac, []) -> Ac;
calc_skill(Ac,
           [#role_base_skill{id = Id, attr = Attr} | T]) ->
    case attr_type:do_attr(Attr, Ac) of
        {false, Reason} ->
            logger:error("技能属性计算出错[~w]:[~w]",
                         [Id, Reason],
                         skill,
                         388),
            calc_skill(Ac, T);
        {ok, NewAc} -> calc_skill(NewAc, T)
    end;
calc_skill(Ac, [#{id := Id, attr := Attr} | T]) ->
    Attr1 = attr_type:to_attr(base, Attr),
    case attr_type:do_attr(Attr1, Ac) of
        {false, Reason} ->
            logger:error("技能属性计算出错[~w]:[~w]",
                         [Id, Reason],
                         skill,
                         397),
            calc_skill(Ac, T);
        {ok, NewAc} -> calc_skill(NewAc, T)
    end;
calc_skill(Ac, [_Err | T]) ->
    logger:error("技能数据损坏，无法计算[~w]", [_Err], skill, 403),
    calc_skill(Ac, T).

dynamic_skill_attr(Attr, Lev) ->
    MapVal = skill_data:get_passive_attr(Lev),
    dynamic_skill_attr(Attr, MapVal, Lev, []).

dynamic_skill_attr([], _MapVal, _Lev, AttrList) ->
    AttrList;
dynamic_skill_attr([{1, AttrName, AttrVal} | T], MapVal,
                   Lev, AttrList) ->
    dynamic_skill_attr(T,
                       MapVal,
                       Lev,
                       [{AttrName, AttrVal} | AttrList]);
dynamic_skill_attr([{2, AttrName, Ratio} | T], MapVal,
                   Lev, AttrList) ->
    case get_base_val(MapVal, AttrName, Ratio) of
        {true, AttrVal} ->
            dynamic_skill_attr(T,
                               MapVal,
                               Lev,
                               [{AttrName, AttrVal} | AttrList]);
        false ->
            logger:error("技能动态属性计算错误[~w][~w][~w]",
                         [MapVal, AttrName, Ratio],
                         skill,
                         420),
            dynamic_skill_attr(T, MapVal, Lev, AttrList)
    end;
dynamic_skill_attr([{3, AttrName, {ValA, ValB}} | T],
                   MapVal, Lev, AttrList) ->
    AttrVal = round(Lev * ValA / 10 + ValB),
    dynamic_skill_attr(T,
                       MapVal,
                       Lev,
                       [{AttrName, AttrVal} | AttrList]);
dynamic_skill_attr([{8, AttrName, {ValA, ValB}} | T],
                   MapVal, Lev, AttrList) ->
    AttrVal = round(Lev * ValA / 100 + ValB),
    dynamic_skill_attr(T,
                       MapVal,
                       Lev,
                       [{AttrName, AttrVal} | AttrList]).

get_base_val(#{hp_max := BaseVal}, 1, Ratio) ->
    {true, round(BaseVal * Ratio / 1000)};
get_base_val(#{mp_max := BaseVal}, 2, Ratio) ->
    {true, round(BaseVal * Ratio / 1000)};
get_base_val(#{atk_speed := BaseVal}, 3, Ratio) ->
    {true, round(BaseVal * Ratio / 1000)};
get_base_val(#{phy_dmg := BaseVal}, 4, Ratio) ->
    {true, round(BaseVal * Ratio / 1000)};
get_base_val(#{magic_dmg := BaseVal}, 5, Ratio) ->
    {true, round(BaseVal * Ratio / 1000)};
get_base_val(#{phy_def := BaseVal}, 6, Ratio) ->
    {true, round(BaseVal * Ratio / 1000)};
get_base_val(#{magic_def := BaseVal}, 7, Ratio) ->
    {true, round(BaseVal * Ratio / 1000)};
get_base_val(#{crit := BaseVal}, 8, Ratio) ->
    {true, round(BaseVal * Ratio / 1000)};
get_base_val(#{tenacity := BaseVal}, 9, Ratio) ->
    {true, round(BaseVal * Ratio / 1000)};
get_base_val(#{accuracy := BaseVal}, 10, Ratio) ->
    {true, round(BaseVal * Ratio / 1000)};
get_base_val(#{evasion := BaseVal}, 11, Ratio) ->
    {true, round(BaseVal * Ratio / 1000)};
get_base_val(_, _, _) -> false.

push_10800(Role = #role{m_skill =
                            #m_skill{skills = Skills, speed = Speed}}) ->
    logger:debug("============= ~w", [Speed], skill, 447),
    role:link_send(Role, 10800, {Skills, Speed}),
    ok.

push_10802(Role, {SkillId, Lev}) ->
    role:link_send(Role, 10802, {SkillId, Lev}),
    SkillName = skill_name(SkillId, Lev),
    Msg = notice:format(lang:get("~ts技能升级到~ts级"),
                        [{string_2, 5, SkillName}, {string_2, 1, Lev}]),
    notice:send(Role, 1, Msg),
    ok.

multi_study(Role = #role{assets = Assets}, RoleLev,
            Skills) ->
    NewSkills = lists:keysort(1,
                              [{SkillId, BaseLev, BaseLev}
                               || {SkillId, BaseLev} <- Skills]),
    {WorldLev, _} = world_lev:get_world_lev(Role),
    {BaseSkillId, BaseSkillLev} = get_base_skill(Role),
    do_multi_study(Role,
                   RoleLev,
                   NewSkills,
                   #{next_skills => [], last_skills => [], flag => false,
                     attr_flag => false, fail_flag => true, loss => 0,
                     assets => Assets, world_lev => WorldLev,
                     base_skill => BaseSkillId,
                     base_skill_lev => BaseSkillLev}).

do_multi_study(_Role, _RoleLev, [],
               #{next_skills := [], flag := false,
                 fail_flag := true}) ->
    {false, lang:get("没有可提升的技能")};
do_multi_study(_Role, _RoleLev, [],
               #{next_skills := [], flag := false,
                 fail_flag := {false, Reason}}) ->
    {false, Reason};
do_multi_study(#role{pid = Pid}, _RoleLev, [],
               #{next_skills := [], flag := false,
                 fail_flag := {false_coin, _Reason}}) ->
    role:apply(async, Pid, {role_gain, push_9908, [coin]}),
    {false,
     notice:format(lang:get("你的~ts不足"),
                   [{assets_2, 90000}])};
do_multi_study(Role = #role{}, _, [],
               #{next_skills := [], flag := true,
                 last_skills := LastSkills, attr_flag := AttrFlag,
                 loss := LossVal}) ->
    Loss = format:val_to_loss([{90000, LossVal}]),
    case role_gain:do(Loss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, NewRole} -> {NewRole, LastSkills, AttrFlag}
    end;
do_multi_study(Role, RoleLev, [],
               Data = #{next_skills := NextSkills}) ->
    do_multi_study(Role,
                   RoleLev,
                   lists:reverse(NextSkills),
                   Data#{next_skills => []});
do_multi_study(Role = #role{m_lev_break =
                                #m_lev_break{times = MLBTimes}},
               RoleLev, [{SkillId, BaseLev, NowLev} | T],
               Data = #{last_skills := LastSkills})
    when NowLev >= RoleLev andalso
             MLBTimes =:= 1 andalso NowLev >= 100 ->
    NewLastSkills = [{SkillId, BaseLev, NowLev}
                     | LastSkills],
    do_multi_study(Role,
                   RoleLev,
                   T,
                   Data#{last_skills => NewLastSkills});
do_multi_study(Role = #role{m_lev_break =
                                #m_lev_break{times = MLBTimes}},
               RoleLev, [{SkillId, BaseLev, NowLev} | T],
               Data = #{last_skills := LastSkills})
    when NowLev >= RoleLev andalso MLBTimes =:= 0 ->
    NewLastSkills = [{SkillId, BaseLev, NowLev}
                     | LastSkills],
    do_multi_study(Role,
                   RoleLev,
                   T,
                   Data#{last_skills => NewLastSkills});
do_multi_study(Role = #role{m_lev_break =
                                #m_lev_break{times = MLBTimes}},
               RoleLev, [{SkillId, BaseLev, NowLev} | T],
               Data = #{next_skills := NextSkills,
                        last_skills := LastSkills, attr_flag := AttrFlag,
                        loss := Loss, assets := Assets, world_lev := WorldLev,
                        base_skill := BaseSkillId,
                        base_skill_lev := BaseSkillLev}) ->
    case check_study(SkillId,
                     NowLev,
                     BaseSkillId,
                     BaseSkillLev,
                     RoleLev,
                     MLBTimes)
        of
        {true, RoleBaseSkill} ->
            case pre_study_loss(RoleBaseSkill, Assets, WorldLev) of
                {ok, AddLoss, SkillId, NewLev, AttrF, Assets1} ->
                    NewNextSkills = [{SkillId, BaseLev, NewLev}
                                     | NextSkills],
                    NewAttrFlag = case AttrF of
                                      true -> true;
                                      false -> AttrFlag
                                  end,
                    NewLoss = Loss + AddLoss,
                    NewBaseSkillLev = case SkillId =:= BaseSkillId of
                                          true -> NewLev;
                                          false -> BaseSkillLev
                                      end,
                    NewData = Data#{next_skills => NewNextSkills,
                                    flag => true,
                                    base_skill_lev => NewBaseSkillLev,
                                    attr_flag => NewAttrFlag, loss => NewLoss,
                                    assets => Assets1},
                    do_multi_study(Role, RoleLev, T, NewData);
                {false, Reason} ->
                    NewLastSkills = [{SkillId, BaseLev, NowLev}
                                     | LastSkills],
                    NewData = Data#{last_skills => NewLastSkills,
                                    fail_flag => {false, Reason}},
                    do_multi_study(Role, RoleLev, T, NewData);
                {false_coin, Reason} ->
                    NewLastSkills = [{SkillId, BaseLev, NowLev}
                                     | LastSkills],
                    NewData = Data#{last_skills => NewLastSkills,
                                    fail_flag => {false_coin, Reason}},
                    do_multi_study(Role, RoleLev, T, NewData)
            end;
        {false, _Reason} ->
            NewLastSkills = [{SkillId, BaseLev, NowLev}
                             | LastSkills],
            NewData = Data#{last_skills => NewLastSkills},
            do_multi_study(Role, RoleLev, T, NewData)
    end.

classes_modify_skill_repair(Role = #role{classes =
                                             Classes,
                                         m_skill =
                                             MSkill = #m_skill{skills =
                                                                   Skills}}) ->
    Fun = fun ({SkillId, Lev}, Rtn) ->
                  case skill_data:get_role({SkillId, Lev}) of
                      false ->
                          logger:debug("玩家登陆数据修复:~w",
                                       [{SkillId, Lev}],
                                       skill,
                                       539),
                          Index = SkillId rem 100,
                          SKillInitList = skill_data:get_init(Classes),
                          NewSkillId = lists:nth(Index, SKillInitList),
                          [{NewSkillId, Lev} | Rtn];
                      _ -> [{SkillId, Lev} | Rtn]
                  end
          end,
    NewSkills = lists:foldr(Fun, [], Skills),
    logger:debug("玩家登陆数据修复:~w", [NewSkills], skill, 548),
    {ok,
     Role#role{m_skill =
                   MSkill#m_skill{skills = NewSkills}}}.

adm_show(_Role = #role{m_skill =
                           #m_skill{skills = Skills}}) ->
    ShowSkills = adm_show(skill, Skills, []),
    {ok, ShowSkills}.

adm_show(skill, [], List) -> List;
adm_show(Label = skill, [{SkillId, Lev} | T], List) ->
    Add = [{skill_id, SkillId},
           {lev, Lev},
           {name, skill_name(SkillId, Lev)}],
    adm_show(Label, T, [Add | List]);
adm_show(Label, [_ | T], List) ->
    adm_show(Label, T, List).

