-file("src/mod/guard/guard_astroid.erl", 1).

-module(guard_astroid).

-export([init/1,
         activate/2,
         arouse/3,
         upgrade/2,
         calc/2,
         calc_growth/1,
         calc_fc/1,
         calc_score/1,
         share_attr/1,
         push/2]).

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

-file("src/mod/guard/guard_astroid.erl", 22).

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

-file("src/mod/guard/guard_astroid.erl", 23).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/guard/guard_astroid.erl", 24).

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

-file("src/mod/guard/guard_astroid.erl", 25).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/guard/guard_astroid.erl", 26).

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

-file("src/mod/guard/guard_astroid.erl", 27).

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

-file("src/mod/guard/guard_astroid.erl", 28).

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

-file("src/mod/guard/guard_astroid.erl", 29).

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

-file("src/mod/guard/guard_astroid.erl", 30).

init(#guard_data{growth = Growth}) ->
    #guard_astroid{growth = Growth};
init(BaseId) ->
    case guard_data:get_guard_cfg(BaseId) of
        D = #guard_data{} -> init(D);
        _ -> #guard_astroid{}
    end.

activate(Role = #role{m_guard =
                          MG = #m_guard{guards = Guards}},
         BaseId) ->
    case lists:keyfind(BaseId, #guard.base_id, Guards) of
        #guard{quality = Q,
               astroid = #guard_astroid{active = Q}} ->
            {false, lang:get("当前阶段已经激活了")};
        Guard = #guard{quality = Q, astroid = Astroid} ->
            case guard_data:get_astroid_active({BaseId, Q}) of
                #{condition := Conditions, cost := Cost} ->
                    Res1 = case role_cond:check(Conditions, Role) of
                               {false, #condition{msg = Msg}} -> {false, Msg};
                               Else -> Else
                           end,
                    case Res1 of
                        true ->
                            Guard1 = Guard#guard{astroid =
                                                     Astroid#guard_astroid{active
                                                                               =
                                                                               Q}},
                            Role1 = Role#role{m_guard =
                                                  MG#m_guard{guards =
                                                                 lists:keyreplace(BaseId,
                                                                                  #guard.base_id,
                                                                                  Guards,
                                                                                  Guard1)}},
                            Loss = format:val_to_loss(Cost),
                            case role_gain:do_notice(Loss, Role1) of
                                {ok, Role2} ->
                                    log:guard_astroid(Role2,
                                                      "守护星阵激活",
                                                      Astroid,
                                                      Guard1),
                                    push(Role2, Guard1),
                                    Evt = #evt_guard_activate{},
                                    TriggerRole = role_trigger:fire(Evt, Role2),
                                    NewRole = TriggerRole,
                                    {ok, NewRole};
                                {false, #loss{msg = Why}} -> {false, Why}
                            end;
                        _ -> Res1
                    end;
                _ -> {false, lang:get("当前不能激活")}
            end;
        _ -> {false, lang:get("找不到指定守护")}
    end.

arouse(Role = #role{m_guard =
                        #m_guard{guards = Guards}},
       BaseId, StarId) ->
    case lists:keyfind(BaseId, #guard.base_id, Guards) of
        #guard{quality = Q,
               astroid = #guard_astroid{active = A}}
            when Q > A ->
            {false, lang:get("请先激活当前品质")};
        Guard = #guard{quality = Q,
                       astroid = #guard_astroid{aroused = Aroused}} ->
            case lists:keyfind(StarId,
                               #guard_astroid_star.id,
                               Aroused)
                of
                #guard_astroid_star{lev = Q} ->
                    {false, lang:get("当前已经充能完毕")};
                Star = #guard_astroid_star{} ->
                    do_arouse(Role, Guard, Star);
                _ ->
                    do_arouse(Role, Guard, #guard_astroid_star{id = StarId})
            end;
        _ -> {false, lang:get("找不到指定守护")}
    end.

upgrade(Role = #role{m_guard =
                         MG = #m_guard{guards = Guards}},
        BaseId) ->
    case lists:keyfind(BaseId, #guard.base_id, Guards) of
        Guard = #guard{quality = Q,
                       astroid =
                           Astroid = #guard_astroid{aroused = Aroused}} ->
            NewQ = Q + 1,
            case guard_data:get_astroid_upgrade({BaseId, NewQ}) of
                #{condition := Conditions, cost := Cost,
                  need_num := NeedNum, skills := Skills,
                  attrs := Attrs} ->
                    Res = case lists:keyfind(NeedNum,
                                             #guard_astroid_star.id,
                                             Aroused)
                              of
                              #guard_astroid_star{lev = Q} -> true;
                              _ -> {false, lang:get("请给当前所有星阵充能")}
                          end,
                    Res1 = case Res of
                               true ->
                                   case role_cond:check(Conditions, Role) of
                                       {false, #condition{msg = Msg}} ->
                                           {false, Msg};
                                       Else -> Else
                                   end;
                               _ -> Res
                           end,
                    case Res1 of
                        true ->
                            Guard1 = Guard#guard{quality = NewQ,
                                                 astroid =
                                                     Astroid#guard_astroid{attrs
                                                                               =
                                                                               Attrs,
                                                                           skills
                                                                               =
                                                                               Skills}},
                            Guard2 = guard_attr:calc(Guard1, Role),
                            Role1 = Role#role{m_guard =
                                                  MG#m_guard{guards =
                                                                 lists:keyreplace(BaseId,
                                                                                  #guard.base_id,
                                                                                  Guards,
                                                                                  Guard2)}},
                            Loss = format:val_to_loss(Cost),
                            case role_gain:do_notice(Loss, Role1) of
                                {ok, Role2} ->
                                    log:guard_astroid(Role2,
                                                      "守护星阵进阶",
                                                      Astroid,
                                                      Guard2),
                                    push(Role2, Guard2),
                                    guard_api:push_guard(Role, Guard2),
                                    NewRole = attr:calc_and_push(Role2),
                                    {ok, NewQ, NewRole};
                                {false, #loss{msg = Why}} -> {false, Why}
                            end;
                        _ -> Res1
                    end;
                _ -> {false, lang:get("当前不能进阶")}
            end;
        #guard{} -> {false, lang:get("该守护不能进阶")};
        _ -> {false, lang:get("找不到指定守护")}
    end.

-spec calc(Ac :: #attr_calc{},
           Role :: #role{} | #guard{}) -> NewAc :: #attr_calc{}.

calc(Ac,
     #role{m_guard = #m_guard{guards = Guards},
           classes = Classes}) ->
    do_calc(Guards, Classes, Ac);
calc(Ac,
     #guard{astroid =
                #guard_astroid{aroused = Aroused, attrs = AttrL},
            base_id = BaseId}) ->
    NewAttrL = attr_type:to_attr(fixed, AttrL),
    case attr_type:do_attr(NewAttrL, Ac) of
        {false, Reason} ->
            logger:error("星阵属性计算出错[~w]:[~w]",
                         [BaseId, Reason],
                         guard_astroid,
                         174),
            do_calc(Aroused, Ac);
        {ok, NewAc} -> do_calc(Aroused, NewAc)
    end.

do_calc([], Ac) -> Ac;
do_calc([#guard_astroid_star{id = Id} | T], Ac) ->
    case attr_type:do_attr([], Ac) of
        {false, Reason} ->
            logger:error("星阵属性计算出错[~w]:[~w]",
                         [Id, Reason],
                         guard_astroid,
                         186),
            do_calc(T, Ac);
        {ok, NewAc} -> do_calc(T, NewAc)
    end.

do_calc([], _, Ac) -> Ac;
do_calc([#guard{base_id = BaseId, quality = Q} | T],
        Classes, Ac) ->
    case guard_data:get_astroid_upgrade({BaseId, Q}) of
        #{role_attrs := AttrL = [_ | _]} ->
            AttrL1 = [{N, V}
                      || {N, C, V} <- AttrL, C =:= 0 orelse C =:= Classes],
            NewAttrL = attr_type:to_attr(fixed, AttrL1),
            case attr_type:do_attr(NewAttrL, Ac) of
                {false, Reason} ->
                    logger:error("星阵属性计算出错[~w]:[~w]",
                                 [BaseId, Reason],
                                 guard_astroid,
                                 201),
                    do_calc(T, Classes, Ac);
                {ok, NewAc} -> do_calc(T, Classes, NewAc)
            end;
        _ -> do_calc(T, Classes, Ac)
    end.

calc_growth(Guard = #guard{astroid =
                               Astroid = #guard_astroid{aroused = Aroused},
                           base_id = BaseId, quality = Q}) ->
    Base = case guard_data:get_guard_cfg(BaseId) of
               #guard_data{growth = Bgth} -> Bgth;
               _ -> 0
           end,
    Growth = do_calc_groth(Aroused, BaseId, Base),
    Skills = case guard_data:get_astroid_upgrade({BaseId,
                                                  Q})
                 of
                 #{skills := Sks} -> Sks;
                 _ -> []
             end,
    Guard#guard{astroid =
                    Astroid#guard_astroid{growth = Growth,
                                          skills = Skills}};
calc_growth(Guard) -> Guard.

calc_fc(#role{m_guard = #m_guard{guards = Guards}}) ->
    do_calc_fc(Guards, 0).

calc_score(#guard{base_id = BaseId, quality = Q,
                  astroid = #guard_astroid{aroused = Aroused}}) ->
    QualityScore = case
                       guard_data:get_astroid_upgrade({BaseId, Q})
                       of
                       #{score := QScore} -> QScore;
                       _ -> 0
                   end,
    do_calc_score(Aroused, BaseId, QualityScore).

share_attr(#role{m_guard = #m_guard{guards = Guards},
                 classes = Classes}) ->
    Data = do_share_attr(Guards,
                         #{num => 0, score => 0, classes => Classes,
                           attrs => []}),
    {ok, Data}.

push(#role{link = #link{conn_pid = ConnPid}},
     #guard{base_id = BaseId,
            astroid = Astroid = #guard_astroid{}}) ->
    sys_conn:pack_send(ConnPid, 10916, {BaseId, Astroid});
push(Role = #role{m_guard = #m_guard{guards = Guards}},
     Id) ->
    case lists:keyfind(Id, #guard.base_id, Guards) of
        Guard = #guard{} -> push(Role, Guard);
        _ -> ok
    end.

do_arouse(Role = #role{m_guard =
                           MG = #m_guard{guards = Guards},
                       lev = Lev},
          Guard = #guard{base_id = BaseId, quality = Q,
                         astroid = Astroid = #guard_astroid{aroused = Aroused}},
          Star = #guard_astroid_star{id = StarId, exp = Exp}) ->
    case guard_data:get_astroid({BaseId, StarId, Q}) of
        #{need_exp := NeedExp} when Exp >= NeedExp ->
            Attrs1 = trans_arouse_attr([], BaseId, Lev),
            Star1 = Star#guard_astroid_star{lev = Q,
                                            attrs = Attrs1},
            Guard1 = Guard#guard{astroid =
                                     Astroid#guard_astroid{aroused =
                                                               lists:keystore(StarId,
                                                                              #guard_astroid_star.id,
                                                                              Aroused,
                                                                              Star1)}},
            Guard2 = calc_growth(Guard1),
            Guard3 = guard_attr:calc(Guard2, Role),
            Role1 = Role#role{m_guard =
                                  MG#m_guard{guards =
                                                 lists:keyreplace(BaseId,
                                                                  #guard.base_id,
                                                                  Guards,
                                                                  Guard3)}},
            log:guard_astroid(Role1, "守护星阵充能", Astroid, Guard3),
            push(Role1, Guard3),
            guard_api:push_guard(Role, Guard3),
            {ok, 1, "", Role1};
        #{condition := Conditions,
          cost := Cost = [{CostItem, _} | _], need_exp := NeedExp,
          add_exp := AddExp, multi_odds := MultiOdds} ->
            Res = case StarId of
                      1 -> true;
                      _ ->
                          case lists:keyfind(StarId - 1,
                                             #guard_astroid_star.id,
                                             Aroused)
                              of
                              #guard_astroid_star{lev = Q} -> true;
                              _ -> {false, lang:get("请先激活前一个")}
                          end
                  end,
            Res1 = case Res of
                       true ->
                           case role_cond:check(Conditions, Role) of
                               {false, #condition{msg = Msg}} -> {false, Msg};
                               Else -> Else
                           end;
                       _ -> Res
                   end,
            case Res1 of
                true ->
                    {Rate, _} = util:rand_list(MultiOdds, 2),
                    WorldLevRate = get_world_lev_rate(Q),
                    MultiExp = round(AddExp * Rate * WorldLevRate / 1000),
                    Star1 = Star#guard_astroid_star{exp =
                                                        min(NeedExp,
                                                            Exp + MultiExp)},
                    Guard1 = Guard#guard{astroid =
                                             Astroid#guard_astroid{aroused =
                                                                       lists:keystore(StarId,
                                                                                      #guard_astroid_star.id,
                                                                                      Aroused,
                                                                                      Star1)}},
                    Role1 = Role#role{m_guard =
                                          MG#m_guard{guards =
                                                         lists:keyreplace(BaseId,
                                                                          #guard.base_id,
                                                                          Guards,
                                                                          Guard1)}},
                    Loss = format:val_to_loss(Cost),
                    case role_gain:do(Loss, Role1) of
                        {ok, Role2} ->
                            RMsg = case Rate > 1 of
                                       true ->
                                           notice:format(lang:get("~ts幸运爆发，充能经验增加~ts倍 {face_1,18}"),
                                                         [{assets_2, CostItem},
                                                          {string_2, 5, Rate}]);
                                       _ ->
                                           notice:format(lang:get("~ts充能增加~ts经验"),
                                                         [{assets_2, CostItem},
                                                          {string_2,
                                                           5,
                                                           MultiExp}])
                                   end,
                            case WorldLevRate > 1000 of
                                true ->
                                    notice:send(Role2,
                                                3,
                                                notice:format(lang:get("受世界等级影响，~ts色守护充能经验+~ts%"),
                                                              [{string_2,
                                                                Q,
                                                                notice:quality_name(Q)},
                                                               {string_2,
                                                                1,
                                                                (WorldLevRate -
                                                                     1000)
                                                                    div 10}]));
                                _ -> ok
                            end,
                            log:guard_astroid(Role2, "守护星阵充能", Astroid, Guard1),
                            push(Role2, Guard1),
                            {ok, Rate, RMsg, Role2};
                        {false, #loss{msg = Why}} -> {false, Why}
                    end;
                _ -> Res1
            end;
        _ -> {false, lang:get("充能失败")}
    end.

do_calc_groth([], _, Growth) -> Growth;
do_calc_groth([#guard_astroid_star{id = Id, lev = Lev}
               | T],
              BaseId, Growth) ->
    case guard_data:get_astroid({BaseId, Id, Lev}) of
        #{growth := Add} ->
            do_calc_groth(T, BaseId, Add + Growth);
        _ -> do_calc_groth(T, BaseId, Growth)
    end.

do_share_attr([],
              #{num := Num, score := Score, attrs := Attrs}) ->
    {Num, Score, Attrs};
do_share_attr([#guard{score = AScore, base_id = BaseId,
                      quality = Q}
               | T],
              Acc = #{num := Num, score := Score, attrs := Attrs,
                      classes := Classes}) ->
    case guard_data:get_astroid_upgrade({BaseId, Q}) of
        #{role_attrs := AttrL = [_ | _]} ->
            do_share_attr(T,
                          Acc#{num := Num + 1, score := AScore + Score,
                               attrs := acc_share_attr(AttrL, Classes, Attrs)});
        _ ->
            do_share_attr(T,
                          Acc#{num := Num + 1, score := AScore + Score})
    end.

acc_share_attr([], _, Attrs) -> Attrs;
acc_share_attr([{N, C, V} | T], Classes, Attrs)
    when C =:= 0 orelse C =:= Classes ->
    case lists:keyfind(N, 1, Attrs) of
        {_, OV} ->
            acc_share_attr(T,
                           Classes,
                           lists:keyreplace(N, 1, Attrs, {N, V + OV}));
        _ -> acc_share_attr(T, Classes, [{N, V} | Attrs])
    end;
acc_share_attr([_ | T], Classes, Attrs) ->
    acc_share_attr(T, Classes, Attrs).

do_calc_score([], _, Growth) -> Growth;
do_calc_score([#guard_astroid_star{id = Id, lev = Lev}
               | T],
              BaseId, Score) ->
    case guard_data:get_astroid({BaseId, Id, Lev}) of
        #{score := Add} ->
            do_calc_score(T, BaseId, Add + Score);
        _ -> do_calc_score(T, BaseId, Score)
    end.

get_world_lev_rate(Quality) ->
    {WorldLev, _} = world_lev:get_world_lev(),
    guard_data:get_astroid_arouse_rate({WorldLev, Quality}).

do_calc_fc([], Fc) -> Fc;
do_calc_fc([#guard{base_id = BaseId, quality = Q} | T],
           Fc) ->
    Add = case guard_data:get_astroid_upgrade({BaseId, Q})
              of
              #{fc := A} -> A;
              _ -> 0
          end,
    do_calc_fc(T, Fc + Add).

trans_arouse_attr(Attrs, BaseId, Lev) ->
    #{base_attrs := BaseAttrs} =
        guard_data:get_lev_cfg({BaseId, Lev}),
    trans_arouse_attr(Attrs, BaseAttrs).

trans_arouse_attr([], _) -> [];
trans_arouse_attr([{51, Per} | T], BaseAttrs) ->
    N = 1,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([{52, Per} | T], BaseAttrs) ->
    N = 2,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([{53, Per} | T], BaseAttrs) ->
    N = 3,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([{54, Per} | T], BaseAttrs) ->
    N = 4,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([{55, Per} | T], BaseAttrs) ->
    N = 5,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([{56, Per} | T], BaseAttrs) ->
    N = 6,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([{57, Per} | T], BaseAttrs) ->
    N = 7,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([{58, Per} | T], BaseAttrs) ->
    N = 8,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([{59, Per} | T], BaseAttrs) ->
    N = 9,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([{60, Per} | T], BaseAttrs) ->
    N = 10,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([{61, Per} | T], BaseAttrs) ->
    N = 11,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([{25, Per} | T], BaseAttrs) ->
    N = 25,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([{26, Per} | T], BaseAttrs) ->
    N = 26,
    case lists:keyfind(N, 1, BaseAttrs) of
        {_, V} ->
            [{N, round(V * Per / 1000)} | trans_arouse_attr(T,
                                                            BaseAttrs)];
        _ -> trans_arouse_attr(T, BaseAttrs)
    end;
trans_arouse_attr([_P | T], BaseAttrs) ->
    logger:error("未知属性 ~w", [_P], guard_astroid, 517),
    trans_arouse_attr(T, BaseAttrs).

