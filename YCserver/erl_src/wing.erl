-file("src/mod/wing/wing.erl", 1).

-module(wing).

-export([init/0,
         login/1,
         fuse_wing/1,
         use_wing/2,
         use_wing_appearance/4,
         use_enhance/1,
         reset_wing/1,
         upgrade_wing/1,
         update_wing/4,
         tmp_save_wing/1,
         push_wing/1,
         get_look/1,
         plot_wing/2,
         tmp_reset_wing/1,
         calc_wing_score/1,
         calc_wing_grade_score/1,
         calc_wing_reset_score/1,
         calc_wing_skill_score/1,
         calc_wing_lev_score/1,
         reset_wing_skill/1,
         save_wing_skill/1,
         get_wing_skill/1,
         change_wing_skill_plan/2,
         five_flush/2,
         lock_skill/3,
         action_lev_break_skill/3,
         reset_lev_break_skill/1,
         set_wing_skill/2,
         change_wing_id/2,
         group_flush/0,
         fix_wing_lev/1,
         get_last_wing_id/1,
         timer_tick/1,
         change_wing_speed/2,
         gm_data/1,
         do_fix_break_skill/1,
         calc_wing_ids/1,
         adm_show/1,
         wing_group_random/3,
         push_11615/2,
         wing_group_exchange/3,
         add_wing_power/2,
         get_combat_ext_args_wing_power/1,
         apply_evt/2,
         wing_classes_modify/2,
         calc_wing_group_score/1,
         add_full_wing_power/1,
         set_wing_power/2,
         reward_wing_group/2,
         del_lev_break_skill/1,
         repaire_break_skill/1]).

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

-file("src/mod/wing/wing.erl", 64).

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

-file("src/mod/wing/wing.erl", 65).

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

-file("src/mod/wing/wing.erl", 66).

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

-file("src/mod/wing/wing.erl", 67).

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

-file("src/mod/wing/wing.erl", 68).

-file("inc/looks.hrl", 1).

-file("src/mod/wing/wing.erl", 69).

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

-file("src/mod/wing/wing.erl", 70).

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

-file("src/mod/wing/wing.erl", 71).

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

-file("src/mod/wing/wing.erl", 72).

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

-file("src/mod/wing/wing.erl", 73).

init() ->
    PlanData = [#wing_skill_plan{}],
    #m_wing{plan_data = PlanData, growth = 1, star_lev = 1}.

login(Role = #role{m_wing = MWing}) ->
    WingGroups = get_wing_group(Role),
    NewMWing = MWing#m_wing{wing_group_list = WingGroups},
    Role1 = Role#role{m_wing = NewMWing},
    EvnList = [#trigger{label = evt_combat_wing_power,
                        a = [], m = wing, f = apply_evt}],
    {_, Role2} = role_trigger:add(EvnList, Role1),
    {ok, NewRole} = timer_tick(Role2),
    {ok, NewRole}.

get_wing_group(Role = #role{m_wing =
                                #m_wing{wing_ids = WingIDs}}) ->
    case wing_data:get_wing_group_ids() of
        [_ | _] = GroupList ->
            Fun = fun (GroupID, Acc) ->
                          case wing_data:get_wing_group_info(GroupID) of
                              #wing_base_group{wing_ids = WingGroupIDs} ->
                                  NewWingGroupIDs = [ID
                                                     || {ID, _, _}
                                                            <- WingGroupIDs],
                                  IDList = NewWingGroupIDs --
                                               NewWingGroupIDs -- WingIDs,
                                  case IDList of
                                      [_ | _] ->
                                          WingGroup = get_role_group_info(Role,
                                                                          GroupID),
                                          [WingGroup#wing_group{wing_ids =
                                                                    IDList}
                                           | Acc];
                                      _ -> Acc
                                  end;
                              _ -> Acc
                          end
                  end,
            lists:foldl(Fun, [], GroupList);
        _ -> []
    end.

apply_evt(#evt_combat_wing_power{val = Val},
          Role = #role{m_wing = MWing}) ->
    NewMWing = MWing#m_wing{wing_power = Val},
    NewRole = Role#role{m_wing = NewMWing},
    push_wing(NewRole),
    {ok, NewRole};
apply_evt(_, _) -> ok.

calc_wing_score(Role = #role{classes = Classes,
                             m_wing =
                                 #m_wing{grade = Grade, star_lev = Star}}) ->
    case wing_data:get_attr({Grade, Star, Classes}) of
        {_AttrBase, _, Score} ->
            Score + calc_wing_skill_score(Role) +
                calc_wing_group_score(Role);
        _ ->
            logger:debug("没有该评分 ~w ~w ~w",
                         [Grade, Star, Classes],
                         wing,
                         139),
            100
    end.

calc_wing_lev_score(#role{classes = Classes,
                          m_wing = #m_wing{grade = Grade, star_lev = Star}}) ->
    case wing_data:get_attr({Grade, Star, Classes}) of
        {_AttrBase, _, Score} -> Score;
        _ ->
            logger:debug("没有该评分 ~w ~w ~w",
                         [Grade, Star, Classes],
                         wing,
                         148),
            100
    end.

calc_wing_skill_score(#role{m_wing =
                                #m_wing{lev_break_skill = LevBreakSkill}}) ->
    Fun = fun (#wing_lev_break_skill{skill_id = SkillId,
                                     skill_grade = SkillGrade,
                                     skill_lev = SkillLev},
               Sfc) ->
                  case wing_data:get_action_break({SkillGrade,
                                                   SkillId,
                                                   SkillLev})
                      of
                      #{fc := Fc} -> Sfc + Fc;
                      _ -> Sfc
                  end;
              (_, Sfc) -> Sfc
          end,
    lists:foldl(Fun, 0, LevBreakSkill).

calc_wing_grade_score(#role{m_wing =
                                #m_wing{grade = Grade, star_lev = Star}}) ->
    BaseVal = Grade + Star * 1.0e-1,
    round(BaseVal * 40).

calc_wing_reset_score(#role{m_wing =
                                #m_wing{grade = Grade, star_lev = Star,
                                        growth = Growth}}) ->
    BaseVal = Grade + Star * 1.0e-1,
    round(BaseVal * Growth * 12).

calc_wing_group_score(#role{m_wing =
                                #m_wing{wing_group_list = WingGroups},
                            classes = Classes}) ->
    calc_wing_group_score(WingGroups, 0, Classes).

calc_wing_group_score([], Acc, _) -> Acc;
calc_wing_group_score([H | T], Acc, Classes) ->
    case H of
        #wing_group{group_id = GroupID,
                    wing_ids = [_ | _] = WingGroupIDs} ->
            case wing_data:get_wing_group_info(GroupID) of
                #wing_base_group{wing_ids = WingIDs} ->
                    case length(WingGroupIDs) =:= length(WingIDs) of
                        true ->
                            Score = wing_data:get_wing_group_score(GroupID,
                                                                   Classes),
                            calc_wing_group_score(T, Score + Acc, Classes);
                        _ -> calc_wing_group_score(T, Acc, Classes)
                    end;
                _ -> calc_wing_group_score(T, Acc, Classes)
            end;
        _ -> calc_wing_group_score(T, Acc, Classes)
    end.

get_look(#role{m_wing =
                   #m_wing{plot_wing_id = PlotWingId, wing_id = WingId,
                           expiry = Expiry}})
    when PlotWingId > 0 ->
    Now = date:unixtime(),
    case lists:keyfind(PlotWingId, 1, Expiry) of
        {PlotWingId, Timeout} when Now < Timeout ->
            [{50, 0, PlotWingId, ""}];
        _False ->
            case WingId > 0 of
                true -> [{50, 0, WingId, ""}];
                false -> []
            end
    end;
get_look(#role{m_wing = #m_wing{wing_id = WingId}})
    when WingId > 0 ->
    [{50, 0, WingId, ""}];
get_look(_) -> [].

plot_wing(Role, WingId) ->
    looks:add({50, 0, WingId, ""}, Role, replace).

reset_lev_break_skill(Role = #role{m_wing =
                                       Mwing = #m_wing{}}) ->
    NewMwing = Mwing#m_wing{lev_break_skill = []},
    NewRole = Role#role{m_wing = NewMwing},
    NewRole1 = recalc_lev_break_skill(NewRole),
    NewRole2 = attr:calc_and_push(NewRole1),
    push_wing(NewRole2),
    {ok, NewRole2}.

del_lev_break_skill(Role = #role{m_wing =
                                     Mwing = #m_wing{}}) ->
    NewMwing = Mwing#m_wing{lev_break_skill = []},
    NewRole = Role#role{m_wing = NewMwing},
    NewRole2 = attr:calc_and_push(NewRole),
    push_wing(NewRole2),
    {ok, NewRole2}.

recalc_lev_break_skill(Role = #role{classes = Classes,
                                    m_wing =
                                        Mwing = #m_wing{grade = Grade,
                                                        lev_break_skill =
                                                            LevBreakSkill}}) ->
    case wing_data:get_lev_break_skill({Classes, Grade}) of
        SkillIds = [_ | _] ->
            Fun = fun (#wing_lev_break_skill{skill_grade =
                                                 Grade1}) ->
                          Grade1 =:= Grade
                  end,
            {GradeSkill, RestSkill} = lists:partition(Fun,
                                                      LevBreakSkill),
            Fun2 = fun (SkillId, SkillList) ->
                           case lists:keyfind(SkillId,
                                              #wing_lev_break_skill.skill_id,
                                              GradeSkill)
                               of
                               Skill = #wing_lev_break_skill{} ->
                                   [Skill | SkillList];
                               _ ->
                                   Skill = #wing_lev_break_skill{skill_grade =
                                                                     Grade,
                                                                 skill_id =
                                                                     SkillId},
                                   [Skill | SkillList]
                           end
                   end,
            NewGradeSkill = lists:foldl(Fun2, [], SkillIds),
            NewLevBreakSkill = RestSkill ++ NewGradeSkill,
            NewMwing = Mwing#m_wing{lev_break_skill =
                                        NewLevBreakSkill},
            Role#role{m_wing = NewMwing};
        _ -> Role
    end.

fuse_wing(Role = #role{lev = Lev,
                       m_wing = #m_wing{grade = 0}}) ->
    case wing_data:get_fuse() of
        {NeedLev, _Cost} when Lev < NeedLev ->
            {false,
             util:flist(lang:get("等级不足~w级, 无法合成翅膀"), [NeedLev])};
        {_NeedLev, Cost} ->
            Loss = format:val_to_loss(Cost,
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("合成翅膀")}),
            case role_gain:do_notice(Loss, Role) of
                {false, #loss{msg = Msg}} -> {false, Msg};
                {ok, Role1} ->
                    case update_wing(1, Role1, false, true) of
                        {ok,
                         Role2 = #role{m_wing =
                                           #m_wing{grade = Grade,
                                                   star_lev = 1}}} ->
                            NewRole = role_trigger:fire(#evt_wing_lev{grade =
                                                                          Grade,
                                                                      star_lev =
                                                                          1},
                                                        Role2),
                            {ok, NewRole};
                        {false, Reason} -> {false, Reason}
                    end
            end;
        _ -> {false, lang:get("数据错误, 无法合成")}
    end;
fuse_wing(_) -> {false, lang:get("已有一阶翅膀，无需再次合成")}.

lock_skill(Role = #role{m_wing =
                            MWing = #m_wing{plan_data = PlanData,
                                            valid_plan = Plan, grade = Grade}},
           SkillId, Lev) ->
    case lists:keyfind(Plan,
                       #wing_skill_plan.index,
                       PlanData)
        of
        SkillPlan = #wing_skill_plan{skills = Skills} ->
            case wing_data:get_lock(Grade) of
                #wing_lock_data{max = Max} ->
                    Key = {SkillId, Lev},
                    LockLen = length([1
                                      || #wing_skill{is_lock = 1} <- Skills]),
                    case lists:keyfind(Key, #wing_skill.key, Skills) of
                        Skill = #wing_skill{is_lock = 1} ->
                            NSkills = lists:keyreplace(Key,
                                                       #wing_skill.key,
                                                       Skills,
                                                       Skill#wing_skill{is_lock
                                                                            =
                                                                            0}),
                            NPlanData = lists:keyreplace(Plan,
                                                         #wing_skill_plan.index,
                                                         PlanData,
                                                         SkillPlan#wing_skill_plan{skills
                                                                                       =
                                                                                       NSkills}),
                            NewWing = MWing#m_wing{plan_data = NPlanData},
                            NewRole = Role#role{m_wing = NewWing},
                            push_wing(NewRole),
                            {ok, NewRole};
                        #wing_skill{} when LockLen >= Max ->
                            {false, lang:get("当前锁定技能超过最大个数")};
                        Skill = #wing_skill{} ->
                            NSkills = lists:keyreplace(Key,
                                                       #wing_skill.key,
                                                       Skills,
                                                       Skill#wing_skill{is_lock
                                                                            =
                                                                            1}),
                            NPlanData = lists:keyreplace(Plan,
                                                         #wing_skill_plan.index,
                                                         PlanData,
                                                         SkillPlan#wing_skill_plan{skills
                                                                                       =
                                                                                       NSkills}),
                            NewWing = MWing#m_wing{plan_data = NPlanData},
                            NewRole = Role#role{m_wing = NewWing},
                            push_wing(NewRole),
                            {ok, NewRole};
                        false -> {false, lang:get("没有找到该技能")}
                    end;
                _ -> {false, lang:get("现在还不能锁定")}
            end;
        false -> {false, lang:get("没有技能方案")}
    end.

use_wing(WingId, Role) ->
    case wing_data:get_wing(WingId) of
        #{grade := Grade} ->
            case update_wing(Grade, Role, true, true) of
                {ok,
                 Role2 = #role{m_wing =
                                   #m_wing{grade = Grade, star_lev = Star}}} ->
                    NewRole = role_trigger:fire(#evt_wing_lev{grade = Grade,
                                                              star_lev = Star},
                                                Role2),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("不存在的翅膀, 无法使用")}
    end.

use_wing_appearance(BaseId, WingId, Time,
                    Role = #role{m_wing =
                                     MWing = #m_wing{appearance_list =
                                                         Appearances}}) ->
    Result = case wing_data:get_wing(WingId) of
                 #{grade := Grade, lev := StarLev} when Time =:= 0 ->
                     case lists:keyfind(WingId,
                                        #wing_appearance.id,
                                        Appearances)
                         of
                         #wing_appearance{timeout = 0} ->
                             {false, lang:get("已获得该翅膀,不能幻化")};
                         _ ->
                             NewAppearance = #wing_appearance{grade = Grade,
                                                              id = WingId,
                                                              star_lev =
                                                                  StarLev,
                                                              time =
                                                                  date:unixtime(),
                                                              timeout = 0},
                             NewAppearances = lists:keystore(WingId,
                                                             #wing_appearance.id,
                                                             Appearances,
                                                             NewAppearance),
                             Msg = notice:format(lang:get("获得~ts"),
                                                 [{item_2, BaseId}]),
                             notice:send(Role, 3, Msg),
                             {ok,
                              Role#role{m_wing =
                                            MWing#m_wing{wing_id = WingId,
                                                         appearance_list =
                                                             NewAppearances}}}
                     end;
                 #{grade := Grade, lev := StarLev} ->
                     case lists:keyfind(WingId,
                                        #wing_appearance.id,
                                        Appearances)
                         of
                         #wing_appearance{timeout = 0} ->
                             {false, lang:get("已获得该翅膀,不能幻化")};
                         #wing_appearance{timeout = OldTimeout,
                                          star_lev = OldTimeLev, id = WingId} =
                             Appearance ->
                             case lists:member(Grade,
                                               wing_data:get_wing_time_grades())
                                 of
                                 true ->
                                     OffTimeOut = OldTimeout + Time,
                                     OffDays = util:floor((OffTimeOut -
                                                               date:unixtime())
                                                              / 86400),
                                     NewTimeOut = case OffDays >=
                                                           wing_data:get_max_time(Grade)
                                                      of
                                                      true -> 0;
                                                      _ -> OffTimeOut
                                                  end,
                                     TimeLev =
                                         wing_data:get_lev_by_time(OffDays),
                                     NewWingID = wing_data:get_wing_id({Grade,
                                                                        TimeLev}),
                                     NewAppearance =
                                         Appearance#wing_appearance{id =
                                                                        NewWingID,
                                                                    star_lev =
                                                                        TimeLev,
                                                                    timeout =
                                                                        NewTimeOut},
                                     NewAppearances =
                                         lists:keystore(Appearance#wing_appearance.grade,
                                                        #wing_appearance.grade,
                                                        Appearances,
                                                        NewAppearance),
                                     Msg = case NewTimeOut of
                                               0 ->
                                                   MaxDay =
                                                       wing_data:get_max_time(Grade),
                                                   notice:format(lang:get("获得~ts，使用期限≥~ts天，自动转化为~ts"),
                                                                 [{item_2,
                                                                   BaseId},
                                                                  {string_2,
                                                                   5,
                                                                   MaxDay},
                                                                  {string_2,
                                                                   5,
                                                                   lang:get("永久")}]);
                                               _ ->
                                                   Day = util:floor((NewTimeOut
                                                                         -
                                                                         date:unixtime())
                                                                        /
                                                                        86400),
                                                   case TimeLev =/= OldTimeLev
                                                       of
                                                       true ->
                                                           notice:format(lang:get("获得~ts，使用期限~ts天，恭喜升级新外观"),
                                                                         [{item_2,
                                                                           BaseId},
                                                                          {string_2,
                                                                           5,
                                                                           Day}]);
                                                       _ ->
                                                           notice:format(lang:get("获得~ts，使用期限~ts天"),
                                                                         [{item_2,
                                                                           BaseId},
                                                                          {string_2,
                                                                           5,
                                                                           Day}])
                                                   end
                                           end,
                                     notice:send(Role, 3, Msg),
                                     NewRole = Role#role{m_wing =
                                                             MWing#m_wing{wing_id
                                                                              =
                                                                              Appearance#wing_appearance.id,
                                                                          appearance_list
                                                                              =
                                                                              NewAppearances}},
                                     {ok, NewRole};
                                 _ ->
                                     NewTimeOut = Time + OldTimeout,
                                     NewAppearance =
                                         Appearance#wing_appearance{timeout =
                                                                        NewTimeOut},
                                     NewAppearances =
                                         lists:keystore(Appearance#wing_appearance.id,
                                                        #wing_appearance.id,
                                                        Appearances,
                                                        NewAppearance),
                                     Day = util:floor((NewTimeOut -
                                                           date:unixtime())
                                                          / 86400),
                                     Msg =
                                         notice:format(lang:get("获得~ts，使用期限~ts天"),
                                                       [{item_2, BaseId},
                                                        {string_2, 5, Day}]),
                                     notice:send(Role, 3, Msg),
                                     NewRole = Role#role{m_wing =
                                                             MWing#m_wing{wing_id
                                                                              =
                                                                              Appearance#wing_appearance.id,
                                                                          appearance_list
                                                                              =
                                                                              NewAppearances}},
                                     {ok, NewRole}
                             end;
                         _ ->
                             case lists:member(Grade,
                                               wing_data:get_wing_time_grades())
                                 of
                                 true ->
                                     case lists:keyfind(Grade,
                                                        #wing_appearance.grade,
                                                        Appearances)
                                         of
                                         #wing_appearance{timeout = 0,
                                                          id = OutWingID} ->
                                             Name = case
                                                        wing_data:get_wing(OutWingID)
                                                        of
                                                        #{name := Name1} ->
                                                            Name1;
                                                        _ -> lang:get("翅膀")
                                                    end,
                                             Msg =
                                                 notice:format(lang:get("~ts已经是~ts，不需再增加时长"),
                                                               [{string_2,
                                                                 5,
                                                                 Name},
                                                                {string_2,
                                                                 5,
                                                                 lang:get("永久")}]),
                                             {false, Msg};
                                         #wing_appearance{id = UpLevWingID} ->
                                             use_wing_appearance(BaseId,
                                                                 UpLevWingID,
                                                                 Time,
                                                                 Role);
                                         _ ->
                                             OffTimeOut = Time +
                                                              date:unixtime(),
                                             OffDays = util:floor((OffTimeOut -
                                                                       date:unixtime())
                                                                      / 86400),
                                             NewTimeOut = case OffDays >=
                                                                   wing_data:get_max_time(Grade)
                                                              of
                                                              true -> 0;
                                                              _ -> OffTimeOut
                                                          end,
                                             TimeLev =
                                                 wing_data:get_lev_by_time(OffDays),
                                             NewWingID =
                                                 wing_data:get_wing_id({Grade,
                                                                        TimeLev}),
                                             Appearance = #wing_appearance{grade
                                                                               =
                                                                               Grade,
                                                                           id =
                                                                               NewWingID,
                                                                           star_lev
                                                                               =
                                                                               TimeLev,
                                                                           time
                                                                               =
                                                                               date:unixtime(),
                                                                           timeout
                                                                               =
                                                                               NewTimeOut},
                                             NewAppearances =
                                                 lists:keystore(Appearance#wing_appearance.id,
                                                                #wing_appearance.id,
                                                                Appearances,
                                                                Appearance),
                                             Day = util:floor(Time / 86400),
                                             Msg = case NewTimeOut of
                                                       0 ->
                                                           MaxDay =
                                                               wing_data:get_max_time(Grade),
                                                           notice:format(lang:get("获得~ts，使用期限≥~ts天，自动转化为~ts"),
                                                                         [{item_2,
                                                                           BaseId},
                                                                          {string_2,
                                                                           5,
                                                                           MaxDay},
                                                                          {string_2,
                                                                           5,
                                                                           lang:get("永久")}]);
                                                       _ ->
                                                           Day = util:floor(Time
                                                                                /
                                                                                86400),
                                                           notice:format(lang:get("获得~ts，使用期限~ts天，恭喜升级新外观"),
                                                                         [{item_2,
                                                                           BaseId},
                                                                          {string_2,
                                                                           5,
                                                                           Day}])
                                                   end,
                                             notice:send(Role, 3, Msg),
                                             NewRole = Role#role{m_wing =
                                                                     MWing#m_wing{wing_id
                                                                                      =
                                                                                      Appearance#wing_appearance.id,
                                                                                  appearance_list
                                                                                      =
                                                                                      NewAppearances}},
                                             {ok, NewRole}
                                     end;
                                 _ ->
                                     Appearance = #wing_appearance{grade =
                                                                       Grade,
                                                                   id = WingId,
                                                                   star_lev =
                                                                       StarLev,
                                                                   time =
                                                                       date:unixtime(),
                                                                   timeout =
                                                                       Time +
                                                                           date:unixtime()},
                                     NewAppearances =
                                         lists:keystore(Appearance#wing_appearance.id,
                                                        #wing_appearance.id,
                                                        Appearances,
                                                        Appearance),
                                     Day = util:floor(Time / 86400),
                                     Msg =
                                         notice:format(lang:get("获得~ts，使用期限~ts天"),
                                                       [{item_2, BaseId},
                                                        {string_2, 5, Day}]),
                                     notice:send(Role, 3, Msg),
                                     NewRole = Role#role{m_wing =
                                                             MWing#m_wing{wing_id
                                                                              =
                                                                              Appearance#wing_appearance.id,
                                                                          appearance_list
                                                                              =
                                                                              NewAppearances}},
                                     {ok, NewRole}
                             end
                     end;
                 _ -> {false, lang:get("不存在的翅膀, 无法幻化")}
             end,
    case Result of
        {ok, Role1} -> timer_tick(Role1);
        Else -> Else
    end.

timer_tick(Role = #role{m_wing =
                            MWing = #m_wing{appearance_list = Appearances,
                                            wing_id = OldWingId,
                                            wing_ids = WingIds}}) ->
    Role1 = role_timer:del(wing_appearance, Role),
    Now = date:unixtime(),
    Appearances0 = [Apr
                    || #wing_appearance{timeout = Timeout} = Apr
                           <- Appearances,
                       Timeout =:= 0],
    Appearances1 = [Apr
                    || #wing_appearance{timeout = Timeout} = Apr
                           <- Appearances,
                       Timeout =/= 0],
    Appearances2 = [Apr
                    || Apr = #wing_appearance{timeout = Timeout}
                           <- Appearances1,
                       Timeout =< Now],
    Appearances3 = Appearances1 -- Appearances2,
    Appearances4 = lists:keysort(#wing_appearance.timeout,
                                 Appearances3),
    logger:debug("永久列表长度 ~w, 已过期列表长度 ~w, 未过期列表长度 ~w",
                 [length(Appearances0),
                  length(Appearances2),
                  length(Appearances3)],
                 wing,
                 466),
    [begin
         #{name := WingName} = wing_data:get_wing(ElemWingId),
         mail:send(Role,
                   lang:get("翅膀过期提醒"),
                   notice:format(lang:get("您的幻化翅膀~ts已过期，请知悉"),
                                 [{string_2, 5, WingName}]))
     end
     || #wing_appearance{id = ElemWingId} <- Appearances2],
    case Appearances4 of
        [] ->
            NewWingId = case lists:member(OldWingId, WingIds) of
                            true -> OldWingId;
                            _ ->
                                case lists:keyfind(OldWingId,
                                                   #wing_appearance.id,
                                                   Appearances0)
                                    of
                                    false -> get_last_wing_id(Role1);
                                    _ -> OldWingId
                                end
                        end,
            NewMWing = MWing#m_wing{appearance_list = Appearances0,
                                    wing_id = NewWingId},
            NewRole = Role1#role{m_wing = NewMWing},
            push_wing(NewRole),
            AttrRole = attr:calc_and_push(NewRole),
            LookRole = looks:calc(AttrRole),
            looks:update_looks(Role, LookRole),
            {ok, LookRole};
        [#wing_appearance{timeout = Timeout} | _] ->
            Appearances5 = Appearances0 ++ Appearances4,
            NewWingId = case lists:member(OldWingId, WingIds) of
                            true -> OldWingId;
                            _ ->
                                case lists:keyfind(OldWingId,
                                                   #wing_appearance.id,
                                                   Appearances5)
                                    of
                                    false -> get_last_wing_id(Role1);
                                    _ -> OldWingId
                                end
                        end,
            NewMWing = MWing#m_wing{appearance_list = Appearances5,
                                    wing_id = NewWingId},
            Role2 = Role1#role{m_wing = NewMWing},
            Timer = #timer{id = wing_appearance,
                           timeout = max(0, Timeout - Now) * 1000, times = 1,
                           m = wing, f = timer_tick, a = []},
            NewRole = role_timer:set(Timer, Role2),
            push_wing(NewRole),
            AttrRole = attr:calc_and_push(NewRole),
            LookRole = looks:calc(AttrRole),
            looks:update_looks(Role, LookRole),
            {ok, LookRole}
    end.

tmp_reset_wing(Role = #role{m_wing =
                                #m_wing{grade = Grade}}) ->
    case wing_data:get_reset(Grade) of
        Cfg = #{need_item := Cost = [_ | _]} ->
            Loss = format:val_to_loss(Cost,
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("重置临时翅膀")}),
            case role_gain:do_notice(Loss, Role) of
                {false, #loss{label = coin}} ->
                    {false,
                     notice:format(lang:get("你的~ts不足"),
                                   [{assets_2, 90000}])};
                {false, _} ->
                    {false,
                     notice:format(lang:get("你的~ts不足"),
                                   [{assets_2, 90002}])};
                {ok, Role1} ->
                    case do_reset_wing(Role1, Cfg) of
                        {ok, NewRole} ->
                            push_wing(NewRole),
                            {ok, NewRole};
                        {ok, Msg, NewRole} ->
                            push_wing(NewRole),
                            {ok, Msg, NewRole};
                        {false, Reason} -> {false, Reason}
                    end
            end;
        _ -> {false, lang:get("当前翅膀无需重置")}
    end.

reset_wing_skill(Role = #role{m_wing =
                                  MWing = #m_wing{grade = Grade,
                                                  valid_plan = VL,
                                                  plan_data = PlanData,
                                                  wing_id = _WingId}}) ->
    case lists:keyfind(VL, #wing_skill_plan.index, PlanData)
        of
        SL = #wing_skill_plan{tmp_skills = TmpSkills,
                              skills = Skills}
            when VL =:= 1 andalso
                     Grade >= 4 andalso
                         length(Skills) =:= 0 andalso length(TmpSkills) =:= 0 ->
            case wing_data:get_skill_num({Grade, 1}) of
                {0, _} -> {false, lang:get("翅膀阶数不足，不能进行重置技能")};
                {Count, _} when is_integer(Count) ->
                    case rand_wing_skill(Role) of
                        {true, SkillList} ->
                            NewSL = SL#wing_skill_plan{tmp_skills = SkillList},
                            NewPlanData = lists:keystore(VL,
                                                         #wing_skill_plan.index,
                                                         PlanData,
                                                         NewSL),
                            SkillRole = Role#role{m_wing =
                                                      MWing#m_wing{plan_data =
                                                                       NewPlanData}},
                            Msg = skill_msg(SkillList, lang:get("重置成功，翅膀获得了")),
                            notice:send(Role, 3, Msg),
                            push_wing(SkillRole),
                            {ok, SkillRole};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("翅膀阶数不足，不能进行重置技能")}
            end;
        SL = #wing_skill_plan{skills = Skills} ->
            case wing_data:get_skill_num({Grade, 1}) of
                {0, _} -> {false, lang:get("翅膀阶数不足，不能进行重置技能")};
                {Count, _} when is_integer(Count) ->
                    case wing_data:get_reset_skill_cost(Grade) of
                        LossList = [_ | _] ->
                            LockItem = case wing_data:get_lock(Grade) of
                                           #wing_lock_data{item_list =
                                                               LockItemList} ->
                                               LockItemList;
                                           _ -> []
                                       end,
                            LockLen = length([1
                                              || #wing_skill{is_lock = 1}
                                                     <- Skills]),
                            LockLoss = case LockLen > 0 of
                                           true ->
                                               format:val_to_loss([{IItem,
                                                                    INum *
                                                                        LockLen}
                                                                   || {IItem,
                                                                       INum}
                                                                          <- LockItem],
                                                                  #{item_base_id_auto_buy
                                                                        => 1,
                                                                    auto_scene
                                                                        =>
                                                                        lang:get("翅膀重置锁")});
                                           _ -> []
                                       end,
                            Loss = format:val_to_loss(LossList,
                                                      #{item_base_id_auto_buy =>
                                                            1,
                                                        auto_scene =>
                                                            lang:get("重置翅膀技能")}),
                            case role_gain:do(Loss ++ LockLoss, Role) of
                                {ok, LossRole} ->
                                    case rand_wing_skill(LossRole) of
                                        {true, SkillList} ->
                                            NewSL =
                                                SL#wing_skill_plan{tmp_skills =
                                                                       SkillList},
                                            NewPlanData = lists:keystore(VL,
                                                                         #wing_skill_plan.index,
                                                                         PlanData,
                                                                         NewSL),
                                            SkillRole = LossRole#role{m_wing =
                                                                          MWing#m_wing{plan_data
                                                                                           =
                                                                                           NewPlanData}},
                                            push_wing(SkillRole),
                                            Msg = skill_msg(SkillList,
                                                            lang:get("重置成功，翅膀获得了")),
                                            notice:send(Role, 3, Msg),
                                            {ok, SkillRole};
                                        {false, Reason} -> {false, Reason}
                                    end;
                                {false, #loss{label = coin}} ->
                                    {false,
                                     notice:format(lang:get("你的~ts不足"),
                                                   [{assets_2, 90000}])};
                                {false, #loss{label = item_base_id_auto_buy}} ->
                                    {false,
                                     notice:format(lang:get("你的~ts不足"),
                                                   [{assets_2, 90002}])};
                                {false, #loss{}} ->
                                    {false, lang:get("道具不足，无法重置")}
                            end;
                        _ -> {false, lang:get("当前状态不能进行翅膀技能重置")}
                    end;
                _ -> {false, lang:get("翅膀阶数不足，不能进行重置技能")}
            end;
        false ->
            logger:error("玩家翅膀方案数据为空", [], wing, 597),
            case wing_data:get_skill_num({Grade, 1}) of
                {0, _} -> {false, lang:get("翅膀阶数不足，不能进行重置技能")};
                {Count, _} when is_integer(Count) ->
                    case rand_wing_skill(Role) of
                        {true, SkillList} ->
                            NewSL = #wing_skill_plan{index = VL,
                                                     tmp_skills = SkillList},
                            NewPlanData = lists:keystore(VL,
                                                         #wing_skill_plan.index,
                                                         PlanData,
                                                         NewSL),
                            SkillRole = Role#role{m_wing =
                                                      MWing#m_wing{plan_data =
                                                                       NewPlanData}},
                            push_wing(SkillRole),
                            Msg = skill_msg(SkillList, lang:get("重置成功，翅膀获得了")),
                            notice:send(Role, 3, Msg),
                            {ok, SkillRole};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("翅膀阶数不足，不能进行重置技能")}
            end
    end;
reset_wing_skill(_) ->
    {false, lang:get("您还未拥有翅膀，努力加油吧")}.

save_wing_skill(Role = #role{m_wing =
                                 MWing = #m_wing{valid_plan = VL,
                                                 plan_data = PlanData}}) ->
    case lists:keyfind(VL, #wing_skill_plan.index, PlanData)
        of
        SL = #wing_skill_plan{tmp_skills =
                                  TmpSkills = [_ | _]} ->
            NewSL = SL#wing_skill_plan{skills = TmpSkills,
                                       tmp_skills = []},
            NewPlanData = lists:keystore(VL,
                                         #wing_skill_plan.index,
                                         PlanData,
                                         NewSL),
            WingRole = Role#role{m_wing =
                                     MWing#m_wing{plan_data = NewPlanData}},
            NewRole = role_trigger:fire(#evt_wing_skill{count =
                                                            length(TmpSkills)},
                                        WingRole),
            push_wing(NewRole),
            {ok, NewRole};
        #wing_skill_plan{tmp_skills = []} ->
            {false, lang:get("没有技能需要保存")};
        false -> {false, lang:get("没有技能需要保存")}
    end.

set_wing_skill(Role = #role{m_wing =
                                Mwing = #m_wing{valid_plan = VL,
                                                plan_data = PlanData,
                                                grade = Grade}},
               SkillIds) ->
    case lists:keyfind(VL, #wing_skill_plan.index, PlanData)
        of
        SL = #wing_skill_plan{} ->
            SkillConfigList1 = get_skill_list(Grade, 1),
            SkillConfigList2 = get_skill_list(Grade, 2),
            SkillConfigList = SkillConfigList1 ++ SkillConfigList2,
            Skills = do_set_wing_skill(SkillIds,
                                       SkillConfigList,
                                       []),
            NewSL = SL#wing_skill_plan{skills = Skills},
            NewPlanData = lists:keystore(VL,
                                         #wing_skill_plan.index,
                                         PlanData,
                                         NewSL),
            WingRole = Role#role{m_wing =
                                     Mwing#m_wing{plan_data = NewPlanData}},
            push_wing(WingRole),
            {ok, WingRole};
        _ ->
            logger:error("找不到指定技能方案", [], wing, 647),
            ok
    end.

do_set_wing_skill([], _SkillConfigList, Skills) ->
    Skills;
do_set_wing_skill([SkillId | T], SkillConfigList,
                  Skills) ->
    case lists:keyfind(SkillId, 1, SkillConfigList) of
        {RetSkillId, RetLev, _, _} ->
            S = #wing_skill{key = {RetSkillId, RetLev},
                            id = RetSkillId, lev = RetLev},
            do_set_wing_skill(T, SkillConfigList, [S | Skills]);
        _ -> do_set_wing_skill(T, SkillConfigList, Skills)
    end.

get_wing_skill(#role{m_wing =
                         #m_wing{valid_plan = VL, plan_data = PlanData,
                                 lev_break_skill = LevBreakSkill}}) ->
    case lists:keyfind(VL, #wing_skill_plan.index, PlanData)
        of
        #wing_skill_plan{skills = Skills} ->
            BaseSkill = [{Id, Lev}
                         || #wing_skill{id = Id, lev = Lev} <- Skills],
            BreakSkill = [{Id, Lev}
                          || #wing_lev_break_skill{skill_id = Id,
                                                   skill_lev = Lev}
                                 <- LevBreakSkill],
            BaseSkill ++ BreakSkill;
        false -> []
    end.

tmp_save_wing(#role{m_wing =
                        #m_wing{tmp_wing_id = 0}}) ->
    {false, lang:get("现在翅膀可以保存")};
tmp_save_wing(Role = #role{name = RoleName,
                           m_wing =
                               MWing = #m_wing{wing_id = OldId,
                                               growth = OldGrowth,
                                               star_lev = Star,
                                               tmp_wing_id = TmpWingId,
                                               tmp_grade = TmpGrade,
                                               tmp_growth = TmpGrowth}}) ->
    CastFlag = case wing_data:get_wing(TmpWingId) of
                   _
                       when TmpWingId =:= OldId andalso
                                OldGrowth =:= TmpGrade ->
                       false;
                   #{name := WingName}
                       when TmpGrade > 2 andalso TmpGrowth >= 4 ->
                       {true, WingName};
                   #{name := WingName}
                       when TmpGrade > 1 andalso TmpGrowth >= 5 ->
                       {true, WingName};
                   #{name := WingName}
                       when TmpGrade > 3 andalso TmpGrowth >= 4 ->
                       {true, WingName};
                   _ -> false
               end,
    case CastFlag of
        {true, GetWingName} ->
            {Color, _} = color_name(TmpGrowth),
            Msg =
                notice:format(lang:get("风驰电掣，~ts进行~ts时，将翅膀重置为酷炫的~ts{face_1,38}"),
                              [{role_2, RoleName},
                               {string_2, 1, lang:get("翅膀重置")},
                               {string_2, Color, GetWingName}]),
            notice:cast(all, 5, Msg);
        _ -> ok
    end,
    NewMwing = MWing#m_wing{grade = TmpGrade,
                            wing_id = TmpWingId, growth = TmpGrowth,
                            tmp_wing_id = 0, tmp_grade = 0, tmp_growth = 0},
    Role2 = Role#role{m_wing = NewMwing},
    Role3 = role_trigger:fire(#evt_wing_lev{grade =
                                                TmpGrade,
                                            star_lev = Star},
                              Role2),
    NewRole = role_trigger:fire(#evt_wing_reset{}, Role3),
    push_wing(NewRole),
    {ok, NewRole}.

reset_wing(Role = #role{m_wing =
                            #m_wing{grade = Grade, wing_id = OldId,
                                    growth = OldGrowth, star_lev = Star},
                        name = RoleName}) ->
    case wing_data:get_reset(Grade) of
        #{need_item := Cost = [_ | _]} ->
            Loss = format:val_to_loss(Cost,
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("重置翅膀")}),
            case role_gain:do_notice(Loss, Role) of
                {false, #loss{label = coin}} ->
                    {false,
                     notice:format(lang:get("你的~ts不足"),
                                   [{assets_2, 90000}])};
                {false, _} ->
                    {false,
                     notice:format(lang:get("你的~ts不足"),
                                   [{assets_2, 90002}])};
                {ok, Role1} ->
                    logger:debug("进行重置翅膀", [], wing, 711),
                    case update_wing(Grade, Role1, true, true) of
                        {ok,
                         Role2 = #role{m_wing =
                                           #m_wing{wing_id = Id,
                                                   growth = NewGrowth}}} ->
                            CastFlag = case wing_data:get_wing(Id) of
                                           _
                                               when Id =:= OldId andalso
                                                        OldGrowth =:=
                                                            NewGrowth ->
                                               false;
                                           #{name := WingName}
                                               when Grade > 2 andalso
                                                        NewGrowth >= 4 ->
                                               {true, WingName};
                                           #{name := WingName}
                                               when Grade > 1 andalso
                                                        NewGrowth >= 5 ->
                                               {true, WingName};
                                           #{name := WingName}
                                               when Grade > 3 andalso
                                                        NewGrowth >= 4 ->
                                               {true, WingName};
                                           _ -> false
                                       end,
                            case CastFlag of
                                {true, GetWingName} ->
                                    Msg =
                                        notice:format(lang:get("风驰电掣，~ts进行~ts时，将翅膀重置为酷炫的~ts~ts！"),
                                                      [{role_2, RoleName},
                                                       {string_2,
                                                        1,
                                                        lang:get("翅膀重置")},
                                                       {string_1,
                                                        color_name(NewGrowth)},
                                                       {string_2,
                                                        1,
                                                        GetWingName}]),
                                    notice:cast(all, 5, Msg);
                                _ -> ok
                            end,
                            Role3 = role_trigger:fire(#evt_wing_lev{grade =
                                                                        Grade,
                                                                    star_lev =
                                                                        Star},
                                                      Role2),
                            NewRole = role_trigger:fire(#evt_wing_reset{},
                                                        Role3),
                            {ok, NewRole};
                        {false, Reason} -> {false, Reason}
                    end
            end;
        _ -> {false, lang:get("当前翅膀无需重置")}
    end.

use_enhance(Role = #role{m_wing =
                             Mwing = #m_wing{enhance_num = EnhanceNum}})
    when EnhanceNum < 50 ->
    NewMwing = Mwing#m_wing{enhance_num = EnhanceNum + 1},
    Role#role{m_wing = NewMwing};
use_enhance(_) -> {false, lang:get("当前灵犀丹使用已达上限")}.

upgrade_wing(Role) ->
    case check_wing_group_times(Role) of
        true ->
            Msg =
                notice:format(lang:get("请先使用~ts，再进行升级吧{face_1,2}"),
                              [{string_2, 5, lang:get("免费抽取机会")}]),
            {false, Msg};
        _ ->
            case check_can_upgrade(Role) of
                false -> do_upstar_wing(Role);
                true -> do_upgrade_wing(Role)
            end
    end.

check_wing_group_times(#role{m_wing =
                                 #m_wing{wing_group_list = WingGroups}}) ->
    WingTimes = lists:foldl(fun (WingGroup, AccTimes) ->
                                    case WingGroup of
                                        #wing_group{wing_times = Times} ->
                                            AccTimes + Times;
                                        _ -> AccTimes
                                    end
                            end,
                            0,
                            WingGroups),
    WingTimes > 0.

push_wing(Role = #role{m_wing =
                           #m_wing{grade = Grade, wing_id = WingId,
                                   growth = Growth, enhance_num = EnhanceNum,
                                   tmp_wing_id = TmpWingId,
                                   tmp_grade = TmpGrade, tmp_growth = TmpGrowth,
                                   star_lev = Star, valid_plan = VL,
                                   plan_data = PlanData, change_times = Ctimes,
                                   reset_times = ResetTimes,
                                   lev_break_skill = LevBreakSkill,
                                   wing_ids = WingIds, exp = Exp,
                                   appearance_list = AppList, speed = Speed,
                                   wing_group_list = WingGroups,
                                   wing_power = WingPower}}) ->
    role:link_send(Role,
                   11600,
                   {Grade,
                    WingId,
                    Growth,
                    EnhanceNum,
                    TmpGrade,
                    TmpWingId,
                    TmpGrowth,
                    Star,
                    VL,
                    PlanData,
                    Ctimes,
                    ResetTimes,
                    LevBreakSkill,
                    WingIds,
                    Exp,
                    AppList,
                    Speed,
                    WingGroups,
                    WingPower}),
    ok.

update_wing(Grade, Role, CanMaxGrowth, IsPush) ->
    update_wing(Grade,
                Role,
                #{can_max_growth => CanMaxGrowth, is_push => IsPush}).

update_wing(Grade,
            Role = #role{m_wing =
                             Mwing = #m_wing{wing_id = OldWingId,
                                             wing_ids = WingIds}},
            #{can_max_growth := _CanMaxGrowth,
              is_push := IsPush}) ->
    NewWingId = OldWingId,
    NewWingIds = WingIds,
    NewMwing = Mwing#m_wing{wing_id = NewWingId,
                            grade = Grade, wing_ids = NewWingIds, exp = 0,
                            star_lev = 1},
    NewRole = Role#role{m_wing = NewMwing},
    logger:debug("新翅膀Id ~w, 旧翅膀ID ~w Grade ~w",
                 [NewWingId, OldWingId, Grade],
                 wing,
                 827),
    case IsPush of
        true -> push_wing(NewRole);
        false -> ok
    end,
    {ok, NewRole}.

color_name(2) -> {2, lang:get("蓝色")};
color_name(3) -> {3, lang:get("紫色")};
color_name(4) -> {4, lang:get("橙色")};
color_name(5) -> {6, lang:get("红色")};
color_name(_) -> {1, lang:get("绿色")}.

do_upgrade_wing(Role = #role{lev = Lev,
                             m_wing =
                                 MWing0 = #m_wing{grade = Grade,
                                                  star_lev = StarLev,
                                                  valid_plan = VL,
                                                  plan_data = PlanData,
                                                  exp = Exp},
                             name = _RoleName}) ->
    LevBreak = lev_break:get_times(Role),
    case wing_data:upgrade({Grade, StarLev}) of
        {_, NeedLevBreak, _, _, _, _, _}
            when LevBreak < NeedLevBreak ->
            GradeName = util:flist(lang:get("~w阶"), [Grade + 1]),
            Msg = notice:format(lang:get("角色~ts才能进阶至~ts"),
                                [{string_2, 5, lang:get("突破后")},
                                 {string_2, 5, GradeName}]),
            {false, Msg};
        {NeedLev,
         NeedLevBreak,
         Cost = [_ | _],
         IsInitSkill,
         SkillCount,
         NeedExp,
         Crits} ->
            LevResult = case LevBreak > NeedLevBreak of
                            true -> true;
                            false ->
                                case Lev >= NeedLev of
                                    true -> check_next_grade(Grade);
                                    _ ->
                                        {false,
                                         util:flist(lang:get("角色等级不足~w级, 无法进阶"),
                                                    [NeedLev])}
                                end
                        end,
            case LevResult of
                true ->
                    Loss = format:val_to_loss(Cost,
                                              #{item_base_id_auto_buy => 1,
                                                auto_scene =>
                                                    lang:get("进阶翅膀")}),
                    case role_gain:do_notice(Loss, Role) of
                        {false, #loss{label = coin}} ->
                            {false,
                             notice:format(lang:get("你的~ts不足"),
                                           [{assets_2, 90000}])};
                        {false, _} ->
                            {false,
                             notice:format(lang:get("你的~ts不足"),
                                           [{assets_2, 90002}])};
                        {ok, Role1} ->
                            CritNum = case util:rand_list(Crits, 2) of
                                          {Crit, _} -> Crit;
                                          _ -> 1
                                      end,
                            AddExp = round(100 * CritNum),
                            case Exp + AddExp >= NeedExp of
                                true ->
                                    NewGrade = Grade + 1,
                                    case update_wing(NewGrade,
                                                     Role1,
                                                     false,
                                                     false)
                                        of
                                        {false, Reason} -> {false, Reason};
                                        {ok,
                                         Role2 = #role{m_wing =
                                                           MWing =
                                                               #m_wing{wing_group_list
                                                                           =
                                                                           WingGroups}}} ->
                                            NewPlanData = case IsInitSkill of
                                                              1 ->
                                                                  Skills =
                                                                      do_rand_wing_skill(NewGrade,
                                                                                         #wing_skill{},
                                                                                         [],
                                                                                         SkillCount),
                                                                  case
                                                                      SkillCount
                                                                          =/= 0
                                                                      of
                                                                      true ->
                                                                          role:link_send(Role2,
                                                                                         11608,
                                                                                         {Skills});
                                                                      false ->
                                                                          ok
                                                                  end,
                                                                  NewSL = case
                                                                              lists:keyfind(VL,
                                                                                            #wing_skill_plan.index,
                                                                                            PlanData)
                                                                              of
                                                                              SL =
                                                                                  #wing_skill_plan{} ->
                                                                                  SL#wing_skill_plan{skills
                                                                                                         =
                                                                                                         Skills,
                                                                                                     tmp_skills
                                                                                                         =
                                                                                                         []};
                                                                              false ->
                                                                                  #wing_skill_plan{index
                                                                                                       =
                                                                                                       VL,
                                                                                                   skills
                                                                                                       =
                                                                                                       Skills,
                                                                                                   tmp_skills
                                                                                                       =
                                                                                                       []}
                                                                          end,
                                                                  lists:keystore(VL,
                                                                                 #wing_skill_plan.index,
                                                                                 PlanData,
                                                                                 NewSL);
                                                              _ -> PlanData
                                                          end,
                                            GroupID =
                                                get_group_by_grade(NewGrade),
                                            GroupInfo = #wing_group{wing_times =
                                                                        WingTimes} =
                                                            get_role_group_info(Role2,
                                                                                GroupID),
                                            NewGroupInfo =
                                                GroupInfo#wing_group{wing_times
                                                                         =
                                                                         WingTimes
                                                                             +
                                                                             1},
                                            NewWingGroups =
                                                lists:keystore(GroupID,
                                                               #wing_group.group_id,
                                                               WingGroups,
                                                               NewGroupInfo),
                                            Role3 = Role2#role{m_wing =
                                                                   MWing#m_wing{wing_group_list
                                                                                    =
                                                                                    NewWingGroups,
                                                                                tmp_wing_id
                                                                                    =
                                                                                    0,
                                                                                tmp_grade
                                                                                    =
                                                                                    0,
                                                                                tmp_growth
                                                                                    =
                                                                                    0,
                                                                                plan_data
                                                                                    =
                                                                                    NewPlanData,
                                                                                reset_times
                                                                                    =
                                                                                    0}},
                                            Role4 =
                                                recalc_lev_break_skill(Role3),
                                            Role5 = Role4,
                                            Msg =
                                                notice:format(lang:get("进阶成功，恭喜获得一次~ts{face_1,18}"),
                                                              [{string_2,
                                                                5,
                                                                lang:get("免费抽取机会")}]),
                                            notice:send(Role5, 3, Msg),
                                            Role7 =
                                                role_trigger:fire(#evt_wing_skill{count
                                                                                      =
                                                                                      SkillCount},
                                                                  Role5),
                                            NewRole =
                                                role_trigger:fire(#evt_wing_lev{grade
                                                                                    =
                                                                                    NewGrade,
                                                                                star_lev
                                                                                    =
                                                                                    1},
                                                                  Role7),
                                            push_wing(NewRole),
                                            {ok, NewRole, CritNum}
                                    end;
                                _ ->
                                    NewRole = Role1#role{m_wing =
                                                             MWing0#m_wing{exp =
                                                                               Exp
                                                                                   +
                                                                                   AddExp}},
                                    push_wing(NewRole),
                                    {ok, NewRole, CritNum}
                            end
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _R ->
            logger:debug("=========== ~w", [_R], wing, 971),
            {false, lang:get("当前翅膀无法进阶")}
    end.

do_upstar_wing(Role = #role{lev = Lev,
                            m_wing =
                                MWing = #m_wing{grade = Grade, star_lev = Star,
                                                valid_plan = VL,
                                                plan_data = PlanData}}) ->
    LevBreak = lev_break:get_times(Role),
    case wing_data:upstar({Grade, Star}) of
        {_, _, _, NeedLevBreak, _NeedExp, _}
            when LevBreak < NeedLevBreak ->
            Msg = notice:format(lang:get("角色~ts才能提升翅膀等级"),
                                [{string_2, 5, lang:get("突破后")}]),
            {false, Msg};
        {_, _, NeedLev, NeedLevBreak, _NeedExp, _}
            when Lev < NeedLev andalso LevBreak =:= NeedLevBreak ->
            {false,
             util:flist(lang:get("等级不足~w级, 无法提升翅膀等级"), [NeedLev])};
        {_, CostList = [_ | _], _, _, _, Crits} ->
            Loss = format:val_to_loss(CostList,
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("进阶翅膀")}),
            case role_gain:do_notice(Loss, Role) of
                {false, #loss{label = coin}} ->
                    {false,
                     notice:format(lang:get("你的~ts不足"),
                                   [{assets_2, 90000}])};
                {false, _} ->
                    {false,
                     notice:format(lang:get("你的~ts不足"),
                                   [{assets_2, 90002}])};
                {ok, LossRole} ->
                    CritNum = case util:rand_list(Crits, 2) of
                                  {Crit, _} -> Crit;
                                  _ -> 1
                              end,
                    AddExp = round(100 * CritNum),
                    {_, NewGrade, NewStar, NewExp} =
                        check_start_by_exp(Role, Star, AddExp),
                    case NewGrade > Grade of
                        true ->
                            case wing_data:upgrade({NewGrade, NewStar}) of
                                {_, _, _, IsInitSkill, SkillCount, _, _} ->
                                    case update_wing(NewGrade,
                                                     LossRole,
                                                     false,
                                                     false)
                                        of
                                        {ok,
                                         Role2 = #role{m_wing =
                                                           MWing1 =
                                                               #m_wing{wing_group_list
                                                                           =
                                                                           WingGroups}}} ->
                                            NewPlanData = case IsInitSkill of
                                                              1 ->
                                                                  Skills =
                                                                      do_rand_wing_skill(NewGrade,
                                                                                         #wing_skill{},
                                                                                         [],
                                                                                         SkillCount),
                                                                  case
                                                                      SkillCount
                                                                          =/= 0
                                                                      of
                                                                      true ->
                                                                          role:link_send(Role2,
                                                                                         11608,
                                                                                         {Skills});
                                                                      false ->
                                                                          ok
                                                                  end,
                                                                  NewSL = case
                                                                              lists:keyfind(VL,
                                                                                            #wing_skill_plan.index,
                                                                                            PlanData)
                                                                              of
                                                                              SL =
                                                                                  #wing_skill_plan{} ->
                                                                                  SL#wing_skill_plan{skills
                                                                                                         =
                                                                                                         Skills,
                                                                                                     tmp_skills
                                                                                                         =
                                                                                                         []};
                                                                              false ->
                                                                                  #wing_skill_plan{index
                                                                                                       =
                                                                                                       VL,
                                                                                                   skills
                                                                                                       =
                                                                                                       Skills,
                                                                                                   tmp_skills
                                                                                                       =
                                                                                                       []}
                                                                          end,
                                                                  lists:keystore(VL,
                                                                                 #wing_skill_plan.index,
                                                                                 PlanData,
                                                                                 NewSL);
                                                              _ -> PlanData
                                                          end,
                                            GroupID =
                                                get_group_by_grade(NewGrade),
                                            GroupInfo = #wing_group{wing_times =
                                                                        WingTimes} =
                                                            get_role_group_info(Role2,
                                                                                GroupID),
                                            NewGroupInfo =
                                                GroupInfo#wing_group{wing_times
                                                                         =
                                                                         WingTimes
                                                                             +
                                                                             1},
                                            NewWingGroups =
                                                lists:keystore(GroupID,
                                                               #wing_group.group_id,
                                                               WingGroups,
                                                               NewGroupInfo),
                                            Role3 = Role2#role{m_wing =
                                                                   MWing1#m_wing{wing_group_list
                                                                                     =
                                                                                     NewWingGroups,
                                                                                 tmp_wing_id
                                                                                     =
                                                                                     0,
                                                                                 tmp_grade
                                                                                     =
                                                                                     0,
                                                                                 tmp_growth
                                                                                     =
                                                                                     0,
                                                                                 plan_data
                                                                                     =
                                                                                     NewPlanData,
                                                                                 reset_times
                                                                                     =
                                                                                     0}},
                                            Role4 =
                                                recalc_lev_break_skill(Role3),
                                            Role5 = Role4,
                                            Msg =
                                                notice:format(lang:get("进阶成功，恭喜获得一次~ts{face_1,18}"),
                                                              [{string_2,
                                                                5,
                                                                lang:get("免费抽取机会")}]),
                                            notice:send(Role5, 3, Msg),
                                            Role7 =
                                                role_trigger:fire(#evt_wing_skill{count
                                                                                      =
                                                                                      SkillCount},
                                                                  Role5),
                                            NewRole =
                                                role_trigger:fire(#evt_wing_lev{grade
                                                                                    =
                                                                                    NewGrade,
                                                                                star_lev
                                                                                    =
                                                                                    1},
                                                                  Role7),
                                            push_wing(NewRole),
                                            {ok, NewRole, CritNum};
                                        _ ->
                                            logger:error("翅膀升级暴击经验升阶出错NewGrade:~w,NewStar:~w",
                                                         [NewGrade, NewStar],
                                                         wing,
                                                         1054),
                                            {false, lang:get("翅膀升级暴击经验升阶出错")}
                                    end;
                                _ ->
                                    logger:error("翅膀升级暴击经验升阶出错NewGrade:~w,NewStar:~w",
                                                 [NewGrade, NewStar],
                                                 wing,
                                                 1058),
                                    {false, lang:get("翅膀升级暴击经验升阶出错")}
                            end;
                        _ ->
                            case NewStar > Star of
                                true ->
                                    WingRole = LossRole#role{m_wing =
                                                                 MWing#m_wing{star_lev
                                                                                  =
                                                                                  NewStar,
                                                                              exp
                                                                                  =
                                                                                  NewExp}},
                                    push_wing(WingRole),
                                    Msg =
                                        notice:format(lang:get("恭喜！成功将翅膀提升到了~ts阶~ts级，属性得到了加强"),
                                                      [{string_2, 1, NewGrade},
                                                       {string_2, 1, NewStar}]),
                                    notice:send(WingRole, 3, Msg),
                                    NewRole =
                                        role_trigger:fire(#evt_wing_lev{grade =
                                                                            NewGrade,
                                                                        star_lev
                                                                            =
                                                                            NewStar},
                                                          WingRole),
                                    {ok, NewRole, CritNum};
                                _ ->
                                    WingRole = LossRole#role{m_wing =
                                                                 MWing#m_wing{star_lev
                                                                                  =
                                                                                  NewStar,
                                                                              exp
                                                                                  =
                                                                                  NewExp}},
                                    push_wing(WingRole),
                                    {ok, WingRole, CritNum}
                            end
                    end
            end;
        _Err ->
            logger:error("翅膀升星数据错误:~w",
                         [{_Err, Grade, Star}],
                         wing,
                         1078),
            {false, lang:get("当前翅膀无法进行翅膀升星")}
    end.

check_can_upgrade(#role{m_wing =
                            #m_wing{grade = Grade, star_lev = Star}}) ->
    case wing_data:upstar({Grade, Star}) of
        {0, _, _, _, _, _} -> false;
        {1, _, _, _, _, _} -> true;
        _ -> false
    end.

check_start_by_exp(Role = #role{lev = Lev,
                                m_wing =
                                    MWing = #m_wing{grade = Grade, exp = Exp}},
                   Star, AddExp) ->
    LevBreak = lev_break:get_times(Role),
    case wing_data:upstar({Grade, Star}) of
        {_, _, _, NeedLevBreak, _, _}
            when LevBreak < NeedLevBreak ->
            {{false, lev_break}, Grade, Star, Exp + AddExp};
        {_, _, NeedLev, NeedLevBreak, _, _}
            when Lev < NeedLev andalso LevBreak =:= NeedLevBreak ->
            {{false, lev}, Grade, Star, Exp + AddExp};
        {1, _, _, _, NeedExp, _} when AddExp + Exp >= NeedExp ->
            case check_next_grade(Grade) of
                true -> {{ok, upgrade}, Grade + 1, 1, 0};
                _ -> {{false, upgrade}, Grade, Star, NeedExp}
            end;
        {0, _, _, _, NeedExp, _} when AddExp + Exp >= NeedExp ->
            NewMWing = MWing#m_wing{exp = 0},
            check_start_by_exp(Role#role{m_wing = NewMWing},
                               Star + 1,
                               AddExp + Exp - NeedExp);
        _ -> {ok, Grade, Star, Exp + AddExp}
    end.

check_next_grade(Grade) ->
    case wing_data:upgrade({Grade + 1, 1}) of
        {_, _, _, _, _, _, _} -> true;
        _ -> {false, lang:get("已升级到最高等级")}
    end.

rand_wing_skill(#role{m_wing =
                          #m_wing{wing_id = _WingId, grade = Grade,
                                  valid_plan = VL, plan_data = PlanData}}) ->
    case wing_data:get_skill_num({Grade, 1}) of
        {0, _} -> {false, lang:get("翅膀阶数不足, 不能进行技能重置")};
        {Count, SkillCountRate} when is_integer(Count) ->
            TSkillCount = case util:rand_list(SkillCountRate, 2) of
                              {TmpSkillCount, _} -> TmpSkillCount;
                              _ -> Count
                          end,
            case lists:keyfind(VL, #wing_skill_plan.index, PlanData)
                of
                #wing_skill_plan{tmp_skills = TmpSkills,
                                 skills = Skills} ->
                    TmpSkillLen = length(TmpSkills),
                    SkillCount = case length(Skills) >= Count of
                                     true when TmpSkillLen == 0 -> TSkillCount;
                                     _ when TmpSkillLen == 0 ->
                                         length(Skills) + 1;
                                     _ when TmpSkillLen >= Count -> TSkillCount;
                                     _ -> TmpSkillLen + 1
                                 end,
                    IgnoreSkill = calc_ignore_skill(Skills,
                                                    TmpSkills,
                                                    SkillCount),
                    LocSkill = [I
                                || I = #wing_skill{is_lock = 1} <- Skills],
                    case do_rand_wing_skill(Grade,
                                            IgnoreSkill,
                                            LocSkill,
                                            SkillCount)
                        of
                        SkillList = [_ | _] -> {true, SkillList};
                        _ -> {false, lang:get("当前状态无法进行重置技能")}
                    end;
                false -> {false, lang:get("未使用该技能方案，不能进行重置")}
            end;
        _ -> {false, lang:get("翅膀阶数不足")}
    end.

do_rand_wing_skill(Grade, IgnoreSkill, LockSkill,
                   SkillCount) ->
    LockLen = length(LockSkill),
    do_rand_wing_skill(Grade,
                       IgnoreSkill,
                       SkillCount,
                       LockLen,
                       [],
                       LockSkill).

do_rand_wing_skill(_Grade, _IgnoreSkill, SkillCount,
                   End, _ConfilictList, RandSkillList)
    when End >= SkillCount ->
    RandSkillList;
do_rand_wing_skill(Grade,
                   IgnoreSkill = #wing_skill{id = IgnoreSkillId,
                                             lev = IgnoreSkillLev},
                   SkillCount, Beg, ConfilictList, RandSkillList) ->
    TypeRandCfg = wing_data:get_skill_type_rand(),
    case util:rand_list(TypeRandCfg, 2) of
        {SkillType, _} ->
            SkillConfigList = get_skill_list(Grade, SkillType),
            ResultSkillConfigList = [{SkillId, Lev, Ratio, CnfList}
                                     || {SkillId, Lev, Ratio, CnfList}
                                            <- SkillConfigList,
                                        SkillId =/= IgnoreSkillId orelse
                                            Lev =/= IgnoreSkillLev],
            Fun = fun ({ElmSkillId, ElmLev, _, _}) ->
                          lists:keyfind({ElmSkillId, ElmLev},
                                        #wing_skill.key,
                                        RandSkillList)
                              =/= false
                              orelse
                              lists:member({ElmSkillId, ElmLev}, ConfilictList);
                      (_) -> false
                  end,
            {_, FinalSkillCfgList} = lists:partition(Fun,
                                                     ResultSkillConfigList),
            case util:rand_list(FinalSkillCfgList, 3) of
                {RetSkillId, RetLev, _, CfgCnfList} ->
                    do_rand_wing_skill(Grade,
                                       IgnoreSkill,
                                       SkillCount,
                                       Beg + 1,
                                       CfgCnfList ++ ConfilictList,
                                       [#wing_skill{key = {RetSkillId, RetLev},
                                                    id = RetSkillId,
                                                    lev = RetLev}
                                        | RandSkillList]);
                _ ->
                    do_rand_wing_skill(Grade,
                                       IgnoreSkill,
                                       SkillCount,
                                       Beg + 1,
                                       ConfilictList,
                                       RandSkillList)
            end;
        _ ->
            do_rand_wing_skill(Grade,
                               IgnoreSkill,
                               SkillCount,
                               Beg + 1,
                               ConfilictList,
                               RandSkillList)
    end.

calc_ignore_skill(Skills, TmpSkills, SkillCount) ->
    case length(TmpSkills) =/= 0 of
        true ->
            case length(TmpSkills) =/= SkillCount of
                true ->
                    case util:rand_list([I
                                         || I = #wing_skill{is_lock = 0}
                                                <- TmpSkills])
                        of
                        S = #wing_skill{} -> S;
                        _ -> #wing_skill{}
                    end;
                false -> #wing_skill{}
            end;
        false ->
            case length(Skills) =:= SkillCount of
                true ->
                    case util:rand_list([I
                                         || I = #wing_skill{is_lock = 0}
                                                <- Skills])
                        of
                        S = #wing_skill{} -> S;
                        _ -> #wing_skill{}
                    end;
                false -> #wing_skill{}
            end
    end.

get_skill_list(Grade, SkillType) ->
    SkillList = [wing_data:get_skill_list({G, SkillType})
                 || G <- lists:seq(1, Grade)],
    lists:flatten(SkillList).

do_reset_wing(Role = #role{m_wing =
                               MWing = #m_wing{grade = Grade, wing_id = Wid,
                                               growth = Grth,
                                               tmp_wing_id = TmpWid,
                                               tmp_growth = TmpGrth,
                                               reset_times = ResetTimes}},
              #{growth := GrowthList, insurance := Insurance}) ->
    OldData = case TmpWid =/= 0 andalso TmpGrth =/= 0 of
                  true -> {TmpWid, TmpGrth};
                  false -> {Wid, Grth}
              end,
    case wing_data:wing_list(Grade) of
        WingList = [_ | _] ->
            case Insurance - (ResetTimes + 1) of
                Diff when Diff =< 0 ->
                    NewGrowth = 5,
                    {NewWingId, _} = util:rand_list(WingList, 2),
                    NewMwing = MWing#m_wing{tmp_wing_id = NewWingId,
                                            tmp_growth = NewGrowth,
                                            tmp_grade = Grade, reset_times = 0},
                    {ok, "", Role#role{m_wing = NewMwing}};
                _ ->
                    ResetRatio = 12 * ResetTimes,
                    ResetGrouthList = reset_growth_list(GrowthList,
                                                        ResetRatio),
                    logger:debug("进行重置翅膀概率:~w, 幸运值:~w",
                                 [ResetGrouthList, ResetRatio],
                                 wing,
                                 1221),
                    RandWGList = [{{CfgWid, CfgGrth}, WingRatio * GrthRatio}
                                  || {CfgWid, WingRatio} <- WingList,
                                     {CfgGrth, GrthRatio} <- ResetGrouthList],
                    NewRandWGList = lists:keydelete(OldData, 1, RandWGList),
                    case util:rand_list(NewRandWGList, 2) of
                        {{NewWingId, NewGrowth}, _} ->
                            NewMwing = case NewGrowth =:= 5 of
                                           true ->
                                               MWing#m_wing{tmp_wing_id =
                                                                NewWingId,
                                                            tmp_growth =
                                                                NewGrowth,
                                                            tmp_grade = Grade,
                                                            reset_times = 0};
                                           false ->
                                               MWing#m_wing{tmp_wing_id =
                                                                NewWingId,
                                                            tmp_growth =
                                                                NewGrowth,
                                                            tmp_grade = Grade,
                                                            reset_times =
                                                                ResetTimes + 1}
                                       end,
                            Msg = case NewGrowth of
                                      5 -> "";
                                      _ ->
                                          {Color, ColorName} =
                                              color_name(NewGrowth),
                                          notice:format(lang:get("恭喜你重置出~ts，下次出现~ts的幸运值得到提升"),
                                                        [{string_2,
                                                          Color,
                                                          ColorName},
                                                         {string_2,
                                                          6,
                                                          lang:get("红色")}])
                                  end,
                            {ok, Msg, Role#role{m_wing = NewMwing}};
                        _Err ->
                            logger:error("随机翅膀外观和品质错误:~w", [_Err], wing, 1241),
                            {false, lang:get("当前状态不能进行翅膀重置")}
                    end
            end;
        _ -> {false, lang:get("当前状态不能进行翅膀重置")}
    end;
do_reset_wing(_, _) ->
    {false, lang:get("当前状态不能进行翅膀重置")}.

change_wing_skill_plan(#role{m_wing =
                                 #m_wing{valid_plan = ValidPlan}},
                       ValidPlan) ->
    ok;
change_wing_skill_plan(#role{m_wing =
                                 #m_wing{grade = Grade}},
                       _ValidPlan)
    when Grade < 5 ->
    {false, lang:get("您的翅膀小于5阶，不能进行技能方案切换")};
change_wing_skill_plan(Role = #role{m_wing =
                                        MWing = #m_wing{grade = Grade,
                                                        change_times = Ctimes,
                                                        plan_data = PlanData}},
                       Plan) ->
    CostGold = wing_data:change_plan_price(Ctimes + 1),
    case check_can_cheange_plan(Grade, Plan) of
        true ->
            Loss = [#loss{label = coin, val = CostGold}],
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    case lists:keyfind(Plan,
                                       #wing_skill_plan.index,
                                       PlanData)
                        of
                        #wing_skill_plan{} ->
                            NewWing = MWing#m_wing{valid_plan = Plan,
                                                   change_times = Ctimes + 1},
                            NewRole = LossRole#role{m_wing = NewWing},
                            push_wing(NewRole),
                            {ok, NewRole};
                        false ->
                            WL = #wing_skill_plan{index = Plan},
                            NewPlanData = [WL | PlanData],
                            NewRole = LossRole#role{m_wing =
                                                        MWing#m_wing{plan_data =
                                                                         NewPlanData,
                                                                     valid_plan
                                                                         = Plan,
                                                                     change_times
                                                                         =
                                                                         Ctimes
                                                                             +
                                                                             1}},
                            push_wing(NewRole),
                            {ok, NewRole}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("您的金币不足，不能进行切换")}
            end;
        Else -> Else
    end.

check_can_cheange_plan(Grade, Plan) ->
    case Plan of
        1 -> true;
        2 ->
            case Grade >= 5 of
                true -> true;
                false -> {false, lang:get("翅膀达到5阶才能切换该方案")}
            end;
        3 ->
            case Grade >= 6 of
                true -> true;
                false -> {false, lang:get("翅膀达到5阶才能切换该方案")}
            end;
        _ -> {false, lang:get("该方案系统未开放，敬请期待")}
    end.

five_flush(Role = #role{m_wing = MWing = #m_wing{}},
           _) ->
    NewRole = Role#role{m_wing =
                            MWing#m_wing{change_times = 0}},
    push_wing(NewRole),
    {ok, NewRole}.

action_lev_break_skill(Role = #role{m_wing =
                                        Mwing = #m_wing{lev_break_skill =
                                                            LevBreakSkill}},
                       Grade, SkillId) ->
    Result = case lists_ext:multikeyfind([{Grade,
                                           #wing_lev_break_skill.skill_grade},
                                          {SkillId,
                                           #wing_lev_break_skill.skill_id}],
                                         LevBreakSkill)
                 of
                 Skill = #wing_lev_break_skill{skill_lev = 0} ->
                     case wing_data:get_action_break({Grade, SkillId, 0}) of
                         #{uplev_loss := UpLevLoss,
                           max_charge_val := MaxChargeVal} ->
                             {true,
                              {active, UpLevLoss, {[], MaxChargeVal}},
                              Skill};
                         _ -> {false, lang:get("找不到激活数据")}
                     end;
                 Skill = #wing_lev_break_skill{skill_lev = SkillLev,
                                               skill_val = SkillVal} ->
                     case wing_data:get_action_break({Grade,
                                                      SkillId,
                                                      SkillLev})
                         of
                         #{max_lev := SkillLev} -> {false, lang:get("技能已经满级")};
                         #{uplev_loss := UpLevLoss,
                           max_charge_val := MaxChargeVal}
                             when SkillVal >= MaxChargeVal ->
                             {true,
                              {uplev, UpLevLoss, {[], MaxChargeVal}},
                              Skill};
                         #{charge_loss := Chargeloss,
                           charge_val := ChargeVal = [_ | _],
                           max_charge_val := MaxChargeVal} ->
                             {true,
                              {charge, Chargeloss, {ChargeVal, MaxChargeVal}},
                              Skill};
                         _ -> {false, lang:get("找不到消耗数据")}
                     end;
                 _ -> {false, lang:get("没有找到突破翅膀技能")}
             end,
    case Result of
        {true,
         {Flag, Loss, {ChargeList, GetMaxChargeVal}},
         GetSkill = #wing_lev_break_skill{skill_lev =
                                              GetSkillLev,
                                          skill_val = GetSkillVal}} ->
            Loss1 = format:val_to_loss(Loss,
                                       #{item_base_id_auto_buy => 1,
                                         auto_scene => lang:get("翅膀突破技能")}),
            case role_gain:do(Loss1, Role) of
                {ok, NewRole} ->
                    {NewGetSkill, BackMsg} = case Flag of
                                                 active ->
                                                     {GetSkill#wing_lev_break_skill{skill_lev
                                                                                        =
                                                                                        1},
                                                      ""};
                                                 uplev ->
                                                     {GetSkill#wing_lev_break_skill{skill_lev
                                                                                        =
                                                                                        GetSkillLev
                                                                                            +
                                                                                            1,
                                                                                    skill_val
                                                                                        =
                                                                                        0},
                                                      ""};
                                                 charge ->
                                                     Adv = case
                                                               util:rand_list(ChargeList,
                                                                              2)
                                                               of
                                                               {AddVal, _} ->
                                                                   AddVal;
                                                               _ -> 0
                                                           end,
                                                     RMsg = case Adv > 10 of
                                                                true ->
                                                                    notice:format(lang:get("幸运爆发，充能经验增加~ts点 {face_1,18}"),
                                                                                  [{string_2,
                                                                                    5,
                                                                                    Adv}]);
                                                                _
                                                                    when Adv >
                                                                             0 ->
                                                                    notice:format(lang:get("觉醒技能充能增加~ts点{face_1,18}"),
                                                                                  [{string_2,
                                                                                    5,
                                                                                    Adv}]);
                                                                _ ->
                                                                    notice:format(lang:get("由于姿势不对，充能经验损失了~ts点"),
                                                                                  [{string_2,
                                                                                    6,
                                                                                    abs(Adv)}])
                                                            end,
                                                     {GetSkill#wing_lev_break_skill{skill_val
                                                                                        =
                                                                                        util:check_range(GetSkillVal
                                                                                                             +
                                                                                                             Adv,
                                                                                                         0,
                                                                                                         GetMaxChargeVal)},
                                                      RMsg}
                                             end,
                    NewLevBreaSkill = lists_ext:multikeystore([{Grade,
                                                                #wing_lev_break_skill.skill_grade},
                                                               {SkillId,
                                                                #wing_lev_break_skill.skill_id}],
                                                              LevBreakSkill,
                                                              NewGetSkill),
                    NewMwing = Mwing#m_wing{lev_break_skill =
                                                NewLevBreaSkill},
                    NewRole1 = NewRole#role{m_wing = NewMwing},
                    NewRole2 = case lists:member(Flag, [active, uplev]) of
                                   true -> attr:calc_and_push(NewRole1);
                                   _ -> NewRole1
                               end,
                    {ok, NewRole2, NewGetSkill, BackMsg};
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("无法获取数据")}
    end.

reset_growth_list(GrowthList, ResetRatio) ->
    case length(GrowthList) =:= 2 of
        true -> GrowthList;
        false ->
            SortFun = fun ({G1, _}, {G2, _}) -> G1 < G2 end,
            {MinGrowth, MinGrowthRatio} = lists_ext:min(SortFun,
                                                        GrowthList),
            logger:debug("最小的品质与概率:~w",
                         [{MinGrowth, MinGrowthRatio}],
                         wing,
                         1386),
            if MinGrowthRatio > ResetRatio ->
                   OtherGrowthList = lists:keydelete(MinGrowth,
                                                     1,
                                                     GrowthList),
                   LuckeyGrowthList =
                       growth_list_add_luckey(OtherGrowthList, ResetRatio),
                   [{MinGrowth, MinGrowthRatio - ResetRatio}
                    | LuckeyGrowthList];
               MinGrowthRatio =:= ResetRatio ->
                   OtherGrowthList = lists:keydelete(MinGrowth,
                                                     1,
                                                     GrowthList),
                   growth_list_add_luckey(OtherGrowthList, ResetRatio);
               MinGrowthRatio < ResetRatio ->
                   OtherGrowthList = lists:keydelete(MinGrowth,
                                                     1,
                                                     GrowthList),
                   LuckeyGrowthList =
                       growth_list_add_luckey(OtherGrowthList, MinGrowthRatio),
                   reset_growth_list(LuckeyGrowthList,
                                     ResetRatio - MinGrowthRatio);
               true ->
                   logger:error("reset_growth_list未知的对比条件:~w",
                                [{MinGrowthRatio, ResetRatio}],
                                wing,
                                1400),
                   GrowthList
            end
    end.

growth_list_add_luckey(GrowthList, ResetRatio) ->
    growth_list_add_luckey(GrowthList, ResetRatio, []).

growth_list_add_luckey([], _ResetRatio,
                       NewGrowthList) ->
    NewGrowthList;
growth_list_add_luckey([{5, Ratio} | Rest], ResetRatio,
                       NewGrowthList) ->
    NewRatio = round(Ratio +
                         2.99999999999999988898e-1 * ResetRatio),
    growth_list_add_luckey(Rest,
                           ResetRatio,
                           [{5, NewRatio} | NewGrowthList]);
growth_list_add_luckey([{4, Ratio} | Rest], ResetRatio,
                       NewGrowthList) ->
    NewRatio = round(Ratio +
                         6.99999999999999955591e-1 * ResetRatio),
    growth_list_add_luckey(Rest,
                           ResetRatio,
                           [{4, NewRatio} | NewGrowthList]);
growth_list_add_luckey([Other | Rest], _ResetRatio,
                       NewGrowthList) ->
    growth_list_add_luckey(Rest,
                           _ResetRatio,
                           [Other | NewGrowthList]).

skill_msg([], Msg) -> Msg;
skill_msg([#wing_skill{id = Skill, lev = Lev}], Msg) ->
    NewMsg = notice:format("~ts~ts",
                           [{string_1, Msg},
                            {string_2, 5, skill_name(Skill, Lev)}]),
    skill_msg([], NewMsg);
skill_msg([#wing_skill{id = Skill, lev = Lev} | T],
          Msg) ->
    NewMsg = notice:format("~ts~ts、",
                           [{string_1, Msg},
                            {string_2, 5, skill_name(Skill, Lev)}]),
    skill_msg(T, NewMsg).

skill_name(Id, Lev) ->
    case skill_data:get_wing({Id, Lev}) of
        #{name := Name} -> Name;
        _ -> ""
    end.

change_wing_id(#role{m_wing =
                         #m_wing{wing_id = OldWingId}},
               WingId)
    when OldWingId =:= WingId ->
    {false, lang:get("无需切换")};
change_wing_id(Role = #role{m_wing =
                                MWing = #m_wing{wing_ids = WingIds,
                                                appearance_list = AppList}},
               WingId) ->
    WingId1 = [ElemWingId
               || #wing_appearance{id = ElemWingId} <- AppList],
    case lists:member(WingId, WingId1 ++ WingIds) of
        true ->
            NewRole = Role#role{m_wing =
                                    MWing#m_wing{wing_id = WingId}},
            push_wing(NewRole),
            {ok, NewRole};
        _ -> {false, lang:get("你尚未获得此翅膀,不能切换")}
    end.

change_wing_speed(Role = #role{m_wing = MWing}, Flag) ->
    NewMWing = MWing#m_wing{speed = Flag},
    NewRole = Role#role{m_wing = NewMWing},
    push_wing(NewRole),
    {ok, NewRole}.

group_flush() ->
    role_group:apply(world, {wing, fix_wing_lev, []}),
    ok.

fix_wing_lev(Role = #role{id = RoleId,
                          m_wing =
                              MWing = #m_wing{grade = Grade,
                                              star_lev = StarLev}})
    when StarLev > 10 andalso Grade =:= 15 ->
    logger:info("翅膀升级有问题玩家 ~w", [RoleId], wing, 1463),
    NewRole = Role#role{m_wing =
                            MWing#m_wing{star_lev = 10}},
    AttrRole = attr:calc_and_push(NewRole),
    LookRole = looks:calc(AttrRole),
    looks:update_looks(Role, LookRole),
    {ok, LookRole};
fix_wing_lev(_) ->
    logger:debug("======没问题========", [], wing, 1470),
    ok.

get_last_wing_id(#role{m_wing =
                           #m_wing{wing_group_list = WingGroups,
                                   wing_ids = WingIDs1}}) ->
    WingGroups1 = lists:keysort(#wing_group.group_id,
                                WingGroups),
    WingGroups2 = lists:reverse(WingGroups1),
    case WingGroups2 of
        [#wing_group{wing_ids = WingIDs2 = [_ | _]} | _] ->
            lists:max(WingIDs2);
        _ ->
            case WingIDs1 of
                [_ | _] -> lists:max(WingIDs1);
                _ -> 0
            end
    end.

gm_data(Role = #role{m_wing = _MWing}) ->
    NewMWing = {m_wing,
                10,
                17,
                5,
                0,
                30000,
                0,
                [],
                0,
                0,
                0,
                1,
                3,
                [{wing_skill_plan,
                  3,
                  [],
                  [{wing_skill, 1, {88119, 1}, 88119, 1, 0},
                   {wing_skill, 1, {88109, 1}, 88109, 1, 0},
                   {wing_skill, 1, {88116, 1}, 88116, 1, 0}],
                  []},
                 {wing_skill_plan,
                  2,
                  [],
                  [{wing_skill, 1, {88112, 1}, 88112, 1, 0},
                   {wing_skill, 1, {88123, 1}, 88123, 1, 0}],
                  []},
                 {wing_skill_plan,
                  1,
                  [],
                  [{wing_skill, 1, {88006, 1}, 88006, 1, 0},
                   {wing_skill, 1, {88111, 1}, 88111, 1, 0}],
                  []}],
                0,
                0,
                [{wing_lev_break_skill, 1, 15, 88126, 1, 25}],
                [30000,
                 20021,
                 20015,
                 20019,
                 20020,
                 20018,
                 20017,
                 20016,
                 20014,
                 20013,
                 20011,
                 20010,
                 20008,
                 20006,
                 20005,
                 20003,
                 20001,
                 20000],
                0,
                6,
                4,
                [],
                1},
    NewRole = Role#role{m_wing = NewMWing},
    push_wing(NewRole),
    AttrRole = attr:calc_and_push(NewRole),
    LookRole = looks:calc(AttrRole),
    looks:update_looks(Role, LookRole),
    {ok, NewRole}.

do_fix_break_skill(Role = #role{classes = Classes,
                                m_wing =
                                    Mwing = #m_wing{lev_break_skill =
                                                        OldLevBreakSkill,
                                                    old_grade = OldGrade,
                                                    old_star = OldStar,
                                                    growth = Growth}}) ->
    case OldGrade =:= 6 andalso
             OldStar =:= 2 andalso Growth =:= 5
             orelse
             OldGrade =:= 6 andalso
                 OldStar =:= 3 andalso Growth =:= 5
                 orelse
                 OldGrade =:= 6 andalso
                     OldStar =:= 4 andalso Growth =:= 5
        of
        true ->
            case OldLevBreakSkill of
                [] ->
                    Grade = 15,
                    SkillIds = wing_data:get_lev_break_skill({Classes,
                                                              Grade}),
                    Fun = fun (#wing_lev_break_skill{skill_grade =
                                                         Grade1}) ->
                                  Grade1 =:= Grade
                          end,
                    {GradeSkill, RestSkill} = lists:partition(Fun,
                                                              OldLevBreakSkill),
                    Fun2 = fun (SkillId, SkillList) ->
                                   case lists:keyfind(SkillId,
                                                      #wing_lev_break_skill.skill_id,
                                                      GradeSkill)
                                       of
                                       Skill = #wing_lev_break_skill{} ->
                                           [Skill | SkillList];
                                       _ ->
                                           Skill =
                                               #wing_lev_break_skill{skill_grade
                                                                         =
                                                                         Grade,
                                                                     skill_id =
                                                                         SkillId},
                                           [Skill | SkillList]
                                   end
                           end,
                    NewGradeSkill = lists:foldl(Fun2, [], SkillIds),
                    NewLevBreakSkill = RestSkill ++ NewGradeSkill,
                    NewMwing = Mwing#m_wing{lev_break_skill =
                                                NewLevBreakSkill},
                    NewRole = Role#role{m_wing = NewMwing},
                    push_wing(NewRole),
                    logger:info("修复翅膀突破技能成功", [], wing, 1524),
                    {ok, NewRole};
                _ ->
                    logger:debug("不需要修复", [], wing, 1527),
                    ok
            end;
        _ ->
            logger:debug("不需要修复", [], wing, 1531),
            ok
    end.

calc_wing_ids(Role = #role{name = Name,
                           m_wing =
                               MWing = #m_wing{grade = Grade,
                                               star_lev = StarLev,
                                               wing_id = OldWingId,
                                               wing_ids = OldWingIds}}) ->
    {LastWingId, WingIds} = wing_ver:get_wing_ids(Grade,
                                                  StarLev),
    case length(WingIds) =:= length(OldWingIds) of
        true -> ok;
        _ ->
            logger:info("玩家 [~ts] 翅膀ids错误 已修复", [Name], wing, 1542),
            NewWingId = case lists:member(OldWingId, WingIds) of
                            true -> OldWingId;
                            _ -> LastWingId
                        end,
            NewMWing = MWing#m_wing{wing_ids = WingIds,
                                    wing_id = NewWingId},
            NewRole = Role#role{m_wing = NewMWing},
            push_wing(NewRole),
            AttrRole = attr:calc_and_push(NewRole),
            LookRole = looks:calc(AttrRole),
            looks:update_looks(Role, LookRole),
            logger:info("玩家 [~ts] 翅膀ids错误 已修复 旧翅膀ID ~w 新翅膀Id ~w",
                        [Name, OldWingId, NewWingId],
                        wing,
                        1553),
            {ok, LookRole}
    end.

adm_show(Role = #role{m_wing =
                          #m_wing{grade = Grade, growth = Growth,
                                  star_lev = StarLev, wing_id = WingId}}) ->
    Skills = adm_show_skill(get_wing_skill(Role), 1, []),
    {ok,
     [{id, WingId},
      {name, item:attr(name, WingId)},
      {grade, Grade},
      {growth, Growth},
      {star_lev, StarLev}]
         ++ Skills}.

adm_show_skill([], _, List) -> List;
adm_show_skill([{SkillId, Lev} | T], N, List) ->
    SkillName = skill:skill_name(SkillId, Lev),
    adm_show_skill(T,
                   N + 1,
                   [{lists:concat(["skillid", N]), SkillId},
                    {lists:concat(["skill_name", N]), SkillName},
                    {lists:concat(["skill_lev", N]), Lev}
                    | List]).

get_group_by_grade(Grade) ->
    case wing_data:get_wing_group_ids() of
        [_ | _] = GroupList ->
            case check_is_group(GroupList, Grade) of
                {ok, Group} -> Group;
                _ -> 0
            end;
        _ -> 0
    end.

check_is_group([], _) -> 0;
check_is_group([H | T], Grade) ->
    case check_is_group(H, Grade) of
        {ok, Group} -> {ok, Group};
        _ -> check_is_group(T, Grade)
    end;
check_is_group(Group, Grade) ->
    case wing_data:get_wing_group_info(Group) of
        #wing_base_group{grades = [_ | _] = Grades} ->
            case lists:member(Grade, Grades) of
                true -> {ok, Group};
                _ -> ignort
            end;
        _ -> ignort
    end.

get_role_group_info(#role{m_wing =
                              #m_wing{wing_group_list = Groups}},
                    GroupID) ->
    case lists:keyfind(GroupID,
                       #wing_group.group_id,
                       Groups)
        of
        #wing_group{} = GroupInfo -> GroupInfo;
        _ -> #wing_group{group_id = GroupID}
    end.

wing_group_random(item,
                  Role = #role{m_wing =
                                   MWing = #m_wing{wing_group_list = WingGroups,
                                                   wing_ids = RoleWingIDs}},
                  GroupID) ->
    case check_group_random([grade], Role, GroupID) of
        ok ->
            GroupInfo = #wing_group{wing_ids = WingGroupIDs} =
                            get_role_group_info(Role, GroupID),
            case wing_data:get_wing_group_info(GroupID) of
                #wing_base_group{wing_ids = WingIDs,
                                 loss_item = LossItem}
                    when length(WingGroupIDs) < length(WingIDs) ->
                    Loss = format:val_to_loss(LossItem),
                    logger:debug("===Loss====:~w", [Loss], wing, 1617),
                    role:send_buff_begin(),
                    case role_gain:do(Loss, Role) of
                        {ok, Role1} ->
                            {WingID, _, Index} = util:rand_list(WingIDs, 2),
                            case wing_data:get_wing(WingID) of
                                #{group_gain := GroupGain} ->
                                    logger:debug("===GroupGain====:~w",
                                                 [GroupGain],
                                                 wing,
                                                 1624),
                                    role:send_buff_flush(),
                                    case lists:member(WingID, WingGroupIDs) of
                                        true ->
                                            Gain =
                                                format:val_to_gain(GroupGain),
                                            Role3 = case role_gain:do(Gain,
                                                                      Role1)
                                                        of
                                                        {ok, Role2} -> Role2;
                                                        _ ->
                                                            mail:send(Role1,
                                                                      lang:get("重复翅膀"),
                                                                      lang:get("升阶获得重复翅膀获得以下物品"),
                                                                      GroupGain),
                                                            Role1
                                                    end,
                                            {ok, Role3, Index, GroupGain};
                                        _ ->
                                            NewRoleWingIDs = [WingID
                                                              | lists:delete(WingID,
                                                                             RoleWingIDs)],
                                            NewGroupInfo =
                                                GroupInfo#wing_group{wing_ids =
                                                                         [WingID
                                                                          | lists:delete(WingID,
                                                                                         WingGroupIDs)]},
                                            NewWingGroups =
                                                lists:keystore(GroupID,
                                                               #wing_group.group_id,
                                                               WingGroups,
                                                               NewGroupInfo),
                                            Role2 = Role1#role{m_wing =
                                                                   MWing#m_wing{wing_id
                                                                                    =
                                                                                    WingID,
                                                                                wing_group_list
                                                                                    =
                                                                                    NewWingGroups,
                                                                                wing_ids
                                                                                    =
                                                                                    NewRoleWingIDs}},
                                            Role3 = attr:calc_and_push(Role2),
                                            Role4 = looks:calc(Role3),
                                            looks:update_looks(Role3, Role4),
                                            push_wing(Role4),
                                            {ok, Role4, Index}
                                    end;
                                _ ->
                                    role:send_buff_clean(),
                                    logger:error("wing_data 翅膀数据有错",
                                                 [],
                                                 wing,
                                                 1651),
                                    {false, lang:get("找不到配置")}
                            end;
                        {false, #loss{msg = Msg}} ->
                            role:send_buff_clean(),
                            {false, Msg};
                        _ ->
                            role:send_buff_clean(),
                            {false, lang:get("系统错误")}
                    end;
                _ -> {false, lang:get("恭喜您，当前星级翅膀已集齐{face_1,3}")}
            end;
        {fasle, Reason} -> {fasle, Reason}
    end;
wing_group_random(upgrade,
                  Role = #role{m_wing =
                                   MWing = #m_wing{wing_group_list = WingGroups,
                                                   wing_ids = RoleWingIDs}},
                  GroupID) ->
    case check_group_random([grade], Role, GroupID) of
        ok ->
            case wing_data:get_wing_group_info(GroupID) of
                #wing_base_group{wing_ids = [_ | _] = WingIDs} ->
                    GroupInfo = #wing_group{wing_ids = WingGroupIDs,
                                            wing_times = WingTimes} =
                                    get_role_group_info(Role, GroupID),
                    case WingTimes > 0 of
                        true ->
                            {WingID, _, Index} = util:rand_list(WingIDs, 2),
                            case wing_data:get_wing(WingID) of
                                #{group_gain := GroupGain} ->
                                    case lists:member(WingID, WingGroupIDs) of
                                        true ->
                                            Gain =
                                                format:val_to_gain(GroupGain),
                                            role:send_buff_begin(),
                                            Role3 = case role_gain:do(Gain,
                                                                      Role)
                                                        of
                                                        {ok, Role2} ->
                                                            role:send_buff_flush(),
                                                            Role2;
                                                        _ ->
                                                            role:send_buff_clean(),
                                                            mail:send(Role,
                                                                      lang:get("重复翅膀"),
                                                                      lang:get("升阶获得重复翅膀获得以下物品"),
                                                                      GroupGain),
                                                            Role
                                                    end,
                                            NewGroupInfo =
                                                GroupInfo#wing_group{wing_times
                                                                         =
                                                                         WingTimes
                                                                             -
                                                                             1},
                                            NewWingGroups =
                                                lists:keystore(GroupID,
                                                               #wing_group.group_id,
                                                               WingGroups,
                                                               NewGroupInfo),
                                            Role4 = Role3#role{m_wing =
                                                                   MWing#m_wing{wing_group_list
                                                                                    =
                                                                                    NewWingGroups}},
                                            push_wing(Role4),
                                            {ok, Role4, Index, GroupGain};
                                        _ ->
                                            NewRoleWingIDs = [WingID
                                                              | lists:delete(WingID,
                                                                             RoleWingIDs)],
                                            NewGroupInfo =
                                                GroupInfo#wing_group{wing_ids =
                                                                         [WingID
                                                                          | lists:delete(WingID,
                                                                                         WingGroupIDs)],
                                                                     wing_times
                                                                         =
                                                                         WingTimes
                                                                             -
                                                                             1},
                                            NewWingGroups =
                                                lists:keystore(GroupID,
                                                               #wing_group.group_id,
                                                               WingGroups,
                                                               NewGroupInfo),
                                            Role2 = Role#role{m_wing =
                                                                  MWing#m_wing{wing_id
                                                                                   =
                                                                                   WingID,
                                                                               wing_group_list
                                                                                   =
                                                                                   NewWingGroups,
                                                                               wing_ids
                                                                                   =
                                                                                   NewRoleWingIDs}},
                                            Role3 = attr:calc_and_push(Role2),
                                            Role4 = looks:calc(Role3),
                                            looks:update_looks(Role3, Role4),
                                            push_wing(Role4),
                                            {ok, Role4, Index}
                                    end;
                                _ ->
                                    logger:error("wing_data 翅膀数据有错:~w",
                                                 [WingID],
                                                 wing,
                                                 1709),
                                    {false, lang:get("找不到配置")}
                            end;
                        _ -> {false, lang:get("随机次数不足")}
                    end;
                _ -> {false, lang:get("找不到配置")}
            end;
        {false, Reason} -> {false, Reason}
    end.

check_group_random([], _, _) -> ok;
check_group_random([grade | T],
                   Role = #role{m_wing = #m_wing{grade = Grade}},
                   GroupID) ->
    case wing_data:get_wing_group_info(GroupID) of
        #wing_base_group{need_grade = NeedGrade}
            when Grade < NeedGrade ->
            {false, lang:get("当前翅膀等阶不能抽奖此阶段")};
        _ -> check_group_random(T, Role, Grade)
    end.

push_11615(Role, Data) ->
    role:link_send(Role, 11615, Data),
    ok.

wing_group_exchange(Role = #role{m_wing =
                                     MWing = #m_wing{wing_ids = RoleWingIDs,
                                                     grade = Grade,
                                                     wing_group_list =
                                                         WingGroups}},
                    GroupID, WingID) ->
    case lists:member(WingID, RoleWingIDs) of
        true -> {false, lang:get("已经拥有该翅膀，无需兑换")};
        _ ->
            WingGroupInfo = #wing_group{wing_ids = WingGroupIDs} =
                                get_role_group_info(Role, GroupID),
            case wing_data:get_wing_group_info(GroupID) of
                #wing_base_group{wing_ids = WingIDs,
                                 need_grade = NeedGrade}
                    when length(WingGroupIDs) < length(WingIDs) ->
                    case NeedGrade =< Grade of
                        true ->
                            case lists:keyfind(WingID, 1, WingIDs) of
                                {WingID, _, _} ->
                                    case wing_data:get_wing(WingID) of
                                        #{loss_item := LossItem} ->
                                            Loss = format:val_to_loss(LossItem),
                                            role:send_buff_begin(),
                                            case role_gain:do_notice(Loss,
                                                                     Role,
                                                                     lang:get("兑换翅膀"))
                                                of
                                                {ok, Role1} ->
                                                    role:send_buff_flush(),
                                                    NewWingGroupInfo =
                                                        WingGroupInfo#wing_group{wing_ids
                                                                                     =
                                                                                     [WingID
                                                                                      | WingGroupIDs]},
                                                    NewWingGroups =
                                                        lists:keystore(GroupID,
                                                                       #wing_group.group_id,
                                                                       WingGroups,
                                                                       NewWingGroupInfo),
                                                    NewRoleWingIDs = [WingID
                                                                      | RoleWingIDs],
                                                    Role2 = Role1#role{m_wing =
                                                                           MWing#m_wing{wing_ids
                                                                                            =
                                                                                            NewRoleWingIDs,
                                                                                        wing_group_list
                                                                                            =
                                                                                            NewWingGroups}},
                                                    Role3 =
                                                        attr:calc_and_push(Role2),
                                                    Role4 = looks:calc(Role3),
                                                    looks:update_looks(Role3,
                                                                       Role4),
                                                    push_wing(Role4),
                                                    {ok, Role4};
                                                {false, #loss{msg = Msg}} ->
                                                    role:send_buff_clean(),
                                                    {false, Msg};
                                                _ ->
                                                    role:send_buff_clean(),
                                                    {false,
                                                     lang:get("翅膀分组兑换翅膀错误")}
                                            end;
                                        _ -> {false, lang:get("该翅膀不能兑换")}
                                    end;
                                _ -> {false, lang:get("兑换的翅膀和分组不匹配")}
                            end;
                        _ -> {false, lang:get("当前等阶不能兑换该分组翅膀")}
                    end;
                _ -> {false, lang:get("当前分组翅膀已收集完成")}
            end
    end.

add_wing_power(Role = #role{m_wing =
                                MWing = #m_wing{wing_power = WingPower},
                            m_combat = #m_combat{pid = CombatPid}},
               Power) ->
    case is_pid(CombatPid) andalso
             util:is_process_alive(CombatPid)
        of
        true -> {false, lang:get("战斗结束后再补充能量吧{face_1,3}")};
        _ ->
            case WingPower >= 100 of
                true -> {false, lang:get("能量已满，无需补充{face_1,2}")};
                _ ->
                    NewWingPower = WingPower + Power,
                    NewRole = Role#role{m_wing =
                                            MWing#m_wing{wing_power =
                                                             NewWingPower}},
                    push_wing(NewRole),
                    {ok, NewRole}
            end
    end.

get_combat_ext_args_wing_power(#role{m_wing =
                                         #m_wing{wing_power = WingPower}}) ->
    [{8, WingPower}].

wing_classes_modify(Role = #role{classes = Classes,
                                 m_wing =
                                     MWing = #m_wing{lev_break_skill =
                                                         LevBreakSkills,
                                                     plan_data = PlanData}},
                    TargetClasses) ->
    NewLevBreakSkills = lists:foldl(fun (LevBreakSkill,
                                         Acc) ->
                                            case LevBreakSkill of
                                                WingLevBreak =
                                                    #wing_lev_break_skill{skill_grade
                                                                              =
                                                                              Grade} ->
                                                    case
                                                        wing_data:get_lev_break_skill({TargetClasses,
                                                                                       Grade})
                                                        of
                                                        [SkillID | _] ->
                                                            NewWingLevBreak =
                                                                WingLevBreak#wing_lev_break_skill{skill_id
                                                                                                      =
                                                                                                      SkillID},
                                                            [NewWingLevBreak
                                                             | Acc];
                                                        _ -> Acc
                                                    end;
                                                _ -> Acc
                                            end
                                    end,
                                    [],
                                    LevBreakSkills),
    NewPlanData = [begin
                       NewSkills = [begin
                                        case
                                            classes_modify_data:get_wing_skill({Classes,
                                                                                TargetClasses,
                                                                                OldSkillId})
                                            of
                                            NewId when is_integer(NewId) ->
                                                WK#wing_skill{key =
                                                                  {NewId,
                                                                   OldGrade},
                                                              id = NewId};
                                            _ -> WK
                                        end
                                    end
                                    || WK = #wing_skill{key = {_, OldGrade},
                                                        id = OldSkillId}
                                           <- Skills],
                       KP#wing_skill_plan{skills = NewSkills}
                   end
                   || KP = #wing_skill_plan{skills = Skills} <- PlanData],
    NewRole = Role#role{m_wing =
                            MWing#m_wing{lev_break_skill = NewLevBreakSkills,
                                         plan_data = NewPlanData}},
    push_wing(NewRole),
    NewRole.

add_full_wing_power(Role = #role{m_wing =
                                     #m_wing{wing_power = WingPower},
                                 m_combat = #m_combat{pid = CombatPid}}) ->
    case is_pid(CombatPid) andalso
             util:is_process_alive(CombatPid)
        of
        true -> {false, lang:get("战斗结束后再补充能量吧{face_1,3}")};
        _ ->
            case WingPower >= 100 of
                true -> {false, lang:get("能量已满，无需补充{face_1,2}")};
                _ ->
                    OffPower = 100 - WingPower,
                    Loss = format:val_to_loss([{90003,
                                                round(OffPower * 60)}]),
                    role:send_buff_begin(),
                    case role_gain:do_notice(Loss,
                                             Role,
                                             lang:get("翅膀能量一键充能"))
                        of
                        {ok, Role1 = #role{m_wing = MWing}} ->
                            role:send_buff_flush(),
                            NewRole = Role1#role{m_wing =
                                                     MWing#m_wing{wing_power =
                                                                      100}},
                            push_wing(NewRole),
                            {ok, NewRole};
                        {false, #loss{msg = Msg}} ->
                            role:send_buff_clean(),
                            {false, Msg};
                        _ ->
                            role:send_buff_clean(),
                            {false, lang:get("一键充能扣除金币失败")}
                    end
            end
    end.

set_wing_power(Role = #role{m_wing = MWing}, Power) ->
    NewRole = Role#role{m_wing =
                            MWing#m_wing{wing_power = Power}},
    push_wing(NewRole),
    {ok, NewRole}.

reward_wing_group(Role = #role{classes = Classes,
                               m_wing =
                                   MWing = #m_wing{wing_group_list =
                                                       WingGroups}},
                  GroupID) ->
    case lists:keyfind(GroupID,
                       #wing_group.group_id,
                       WingGroups)
        of
        WingGroup = #wing_group{wing_ids = WingIDs1,
                                rewarded = 0} ->
            case wing_data:get_wing_group_info(GroupID) of
                #wing_base_group{wing_ids = WingIDs2} ->
                    case length(WingIDs1) >= length(WingIDs2) of
                        true ->
                            {BaseReward, ExpressReward} =
                                wing_data:get_wing_group_reward(GroupID,
                                                                Classes),
                            case BaseReward =:= [] andalso ExpressReward =:= []
                                of
                                true -> {false, lang:get("配置奖励出错")};
                                _ ->
                                    role:send_buff_begin(),
                                    case chat_expression:add_expression(Role,
                                                                        ExpressReward,
                                                                        push)
                                        of
                                        {ok, Role1} ->
                                            Result = case BaseReward of
                                                         [_ | _] ->
                                                             Gain =
                                                                 format:val_to_gain(BaseReward),
                                                             case
                                                                 role_gain:do_notice(Gain,
                                                                                     Role1,
                                                                                     lang:get("领取翅膀分组奖励"))
                                                                 of
                                                                 {ok, Role2} ->
                                                                     {ok,
                                                                      Role2};
                                                                 {false,
                                                                  #gain{msg =
                                                                            Msg}} ->
                                                                     {false,
                                                                      Msg};
                                                                 _ ->
                                                                     {false,
                                                                      lang:get("领取翅膀分组奖励失败")}
                                                             end;
                                                         _ -> {ok, Role1}
                                                     end,
                                            case Result of
                                                {ok, Role3} ->
                                                    role:send_buff_flush(),
                                                    NewWingGroup =
                                                        WingGroup#wing_group{rewarded
                                                                                 =
                                                                                 1},
                                                    NewWingGroups =
                                                        lists:keystore(GroupID,
                                                                       #wing_group.group_id,
                                                                       WingGroups,
                                                                       NewWingGroup),
                                                    NewMWing =
                                                        MWing#m_wing{wing_group_list
                                                                         =
                                                                         NewWingGroups},
                                                    NewRole = Role3#role{m_wing
                                                                             =
                                                                             NewMWing},
                                                    push_wing(NewRole),
                                                    {ok, NewRole};
                                                {false, Reason} ->
                                                    role:send_buff_clean(),
                                                    {false, Reason};
                                                _ ->
                                                    role:send_buff_clean(),
                                                    {false,
                                                     lang:get("领取翅膀分组奖励失败")}
                                            end;
                                        _ ->
                                            role:send_buff_clean(),
                                            logger:error("领取翅膀分组奖励失败,翅膀分组表情配置错误~w",
                                                         [{GroupID, Classes}],
                                                         wing,
                                                         1919),
                                            {false, lang:get("领取翅膀分组奖励失败")}
                                    end
                            end;
                        _ -> {false, lang:get("请集齐翅膀后再领取奖励")}
                    end;
                _ ->
                    logger:error("领取翅膀分组奖励失败,翅膀分组配置错误~w",
                                 [GroupID],
                                 wing,
                                 1927),
                    {false, lang:get("领取翅膀分组奖励失败")}
            end;
        #wing_group{rewarded = 1} ->
            {false, lang:get("已经领取过该分组奖励")};
        _ -> {false, lang:get("当前分组尚未有收集满翅膀")}
    end.

repaire_break_skill(RoleId = {_, _, _}) ->
    case role_misc:is_local_role(RoleId) of
        true ->
            role:apply(async,
                       RoleId,
                       {wing, repaire_break_skill, []});
        _ -> {error, lang:get("角色平台出错")}
    end;
repaire_break_skill(Role) ->
    reset_lev_break_skill(Role).

