-file("src/mod/roll/roll_mgr.erl", 1).

-module(roll_mgr).

-behaviour(gen_server).

-export([start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([add_roll/4,
         add_roll/5,
         choice/3,
         do_async_gain/2,
         get_status/0,
         async_copy_gain/2,
         async_reward_other/3]).

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

-file("src/mod/roll/roll_mgr.erl", 23).

-file("inc/roll.hrl", 1).

-record(roll,
        {id = 0,
         mode = 0,
         key = 0,
         end_tick = 0,
         timeout = 0,
         items = [],
         has_reward = 0,
         channel}).

-record(roll_item,
        {id = 1,
         has_reward = 0,
         base_id = 0,
         origin_base_id = 0,
         num = 1,
         choices = [1],
         roles = [],
         is_cast = 0,
         crystal = 0}).

-record(roll_role,
        {role_id,
         name = "",
         pid,
         sex = 0,
         classes = 0,
         choice = 0,
         rand_num = 0,
         time = 0,
         reward = 0,
         team_status = 0}).

-file("src/mod/roll/roll_mgr.erl", 24).

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

-file("src/mod/roll/roll_mgr.erl", 25).

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

-file("src/mod/roll/roll_mgr.erl", 26).

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

-file("src/mod/roll/roll_mgr.erl", 27).

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

-file("src/mod/roll/roll_mgr.erl", 28).

-file("inc/team.hrl", 1).

-record(team,
        {ver = 0,
         pid :: undefined | pid(),
         leader,
         members = [] :: list(),
         applys = [],
         pos :: undefined | tuple(),
         member_num = 1,
         status = 0,
         matched = 0 :: non_neg_integer(),
         is_fly = 0 :: 0 | 1,
         order = [],
         team_formation = 1,
         team_formation_lev = 1,
         usurpers = [],
         type = 0,
         lev_flag = 0,
         lev_min = 0,
         lev_max = 0,
         last_join_time = 0,
         combat_num = 0,
         chat_recruit_info = [],
         target = 0,
         cross_type = 0,
         dun_id = 0}).

-record(m_team,
        {ver = 0,
         pid :: undefined | pid(),
         status = 3 :: non_neg_integer(),
         applys = [],
         mod = 0,
         speed = 0,
         recruitment_time = 0,
         recruitment_ids = lists:seq(1, 5),
         recruitment = [],
         member_num = 0}).

-record(team_mate,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         expect_type = [] :: non_neg_integer(),
         s_ride = 0,
         team_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         mod = 0,
         speed = 0,
         join_type = 1,
         join_sub_type = 0,
         join_time = 0,
         combat_num = 0,
         constellation_lev = 0,
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0}).

-record(team_recruitment,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         pid,
         type = 0,
         status = 1,
         member_num = 1,
         inviter_status = 0,
         lev_min = 0,
         lev_max = 0,
         matched = 0 :: non_neg_integer(),
         notice_list = [] :: list(),
         cur_classes = [] :: list(),
         constellation_lev = 0,
         chat_recruit_info = [],
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0,
         precision_notice_list = [] :: list(),
         cross_type = 0}).

-record(team_recruit_room,
        {lev = 0, role_num = 0, members = []}).

-record(team_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(team_recruit_lev_range,
        {flag = 0, lev = 0, val1 = 0, val2 = 0}).

-record(team_start_args, {pos, is_fly = 0, target = 0}).

-file("src/mod/roll/roll_mgr.erl", 29).

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

-file("src/mod/roll/roll_mgr.erl", 30).

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

-file("src/mod/roll/roll_mgr.erl", 31).

-record(state, {roll_id = 1, ref, rolls = []}).

-spec start_link() -> {ok, pid()} |
                      ignore |
                      {error, term()}.

start_link() ->
    gen_server:start_link({local, roll_mgr},
                          roll_mgr,
                          [],
                          []).

add_roll(RollKey, TimeOut, RollItems, RollRoles) ->
    add_roll(RollKey,
             TimeOut,
             RollItems,
             RollRoles,
             undefined).

add_roll(RollKey, TimeOut, RollItems, RollRoles,
         Channel) ->
    gen_server:cast(roll_mgr,
                    {add_roll,
                     RollKey,
                     TimeOut,
                     RollItems,
                     RollRoles,
                     Channel}).

choice(#role{id = RoleId, pid = RolePid,
             cross_type = 1},
       RollId, ItemId) ->
    Choice = 1,
    cross:cast(gen_server,
               cast,
               [roll_mgr,
                {choice, RollId, ItemId, Choice, RoleId, RolePid}]);
choice(#role{id = RoleId, pid = RolePid}, RollId,
       ItemId) ->
    Choice = 1,
    gen_server:cast(roll_mgr,
                    {choice, RollId, ItemId, Choice, RoleId, RolePid}).

get_status() -> gen_server:cast(roll_mgr, get_status).

init([]) ->
    logger:info("[~w] 正在启动...", [roll_mgr], roll_mgr, 71),
    process_flag(trap_exit, true),
    State = #state{},
    logger:info("[~w] 启动完成...", [roll_mgr], roll_mgr, 74),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({add_roll,
             {RollMode, RollKey},
             TimeOut,
             BaseItems,
             Roles,
             Channel},
            State = #state{ref = Ref, roll_id = RollId,
                           rolls = Rolls}) ->
    FilterItems = filter_items(RollMode, BaseItems),
    case make_roll_item(FilterItems, Roles) of
        {true, RollItems, BaseId, RollRoles} ->
            Roll = #roll{id = RollId, mode = RollMode,
                         key = RollKey, timeout = TimeOut, items = RollItems,
                         channel = Channel},
            case check_add(Roll) of
                {true, NewRoll} ->
                    cancel_timer(Ref),
                    cast_roll(NewRoll, RollRoles),
                    {NewRef, NewRolls} = next_roll([NewRoll | Rolls]),
                    logger:debug("模型~w, 物品 ~w",
                                 [RollMode, BaseId],
                                 roll_mgr,
                                 92),
                    case {RollMode, BaseId} of
                        {3, 20291} -> env:save(fairyland_roll_pool, 0);
                        _ -> ok
                    end,
                    NewState = State#state{ref = NewRef,
                                           roll_id = RollId + 1,
                                           rolls = NewRolls},
                    {noreply, NewState};
                {false, Reason} ->
                    logger:error("增加roll任务失败, Reason:~ts",
                                 [Reason],
                                 roll_mgr,
                                 101),
                    {noreply, State}
            end;
        false ->
            logger:error("roll点数据错误, 无法增加roll点任务[~w:~w:~w]",
                         [RollMode, RollKey, BaseItems],
                         roll_mgr,
                         105),
            {noreply, State}
    end;
handle_cast({choice,
             RollId,
             ItemId,
             Choice,
             RoleId,
             RolePid},
            State = #state{ref = Ref, rolls = Rolls}) ->
    case lists:keyfind(RollId, #roll.id, Rolls) of
        Roll = #roll{} ->
            case check_choice(Roll, ItemId, Choice, RoleId, RolePid)
                of
                {false, Reason} ->
                    role:pack_send(RolePid, 12302, {0, Reason}),
                    {noreply, State};
                {Flag, NewRoll} ->
                    case Flag of
                        null ->
                            NewRolls = lists:keyreplace(RollId,
                                                        #roll.id,
                                                        Rolls,
                                                        NewRoll),
                            NewState = State#state{rolls = NewRolls},
                            {noreply, NewState};
                        recalc ->
                            cancel_timer(Ref),
                            {NewRef, NewRolls} =
                                next_roll(lists:keydelete(RollId,
                                                          #roll.id,
                                                          Rolls)),
                            NewState = State#state{ref = NewRef,
                                                   rolls = NewRolls},
                            {noreply, NewState}
                    end
            end;
        _ ->
            role:pack_send(RolePid,
                           12302,
                           {0, lang:get("当前道具已经结束选择")}),
            {noreply, State}
    end;
handle_cast(get_status,
            State = #state{rolls = Rolls, roll_id = RollId}) ->
    logger:info("roll点进程状态Id:~w, Roll任务:~w",
                [RollId, Rolls],
                roll_mgr,
                138),
    {noreply, State};
handle_cast(_Request, State) -> {noreply, State}.

handle_info(time_end, State = #state{rolls = []}) ->
    {noreply, State};
handle_info(time_end,
            State = #state{ref = Ref,
                           rolls = [#roll{has_reward = 1} | T]}) ->
    cancel_timer(Ref),
    {NewRef, NewRolls} = next_roll(T),
    NewState = State#state{ref = NewRef, rolls = NewRolls},
    {noreply, NewState};
handle_info(time_end,
            State = #state{ref = Ref, rolls = [Roll | T]}) ->
    cancel_timer(Ref),
    time_end_roll(Roll),
    {NewRef, NewRolls} = next_roll(T),
    NewState = State#state{ref = NewRef, rolls = NewRolls},
    {noreply, NewState};
handle_info(_Info, State) ->
    logger:error("roll点进程收到未知消息:~w",
                 [_Info],
                 roll_mgr,
                 161),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...", [roll_mgr], roll_mgr, 165),
    logger:info("[~w] 关闭完成", [roll_mgr], roll_mgr, 166),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

make_roll_item([], _Roles) ->
    logger:error("roll点道具列表为空，无法增加roll点",
                 [],
                 roll_mgr,
                 180),
    false;
make_roll_item(Items, Roles) ->
    case make_roll_role(Roles) of
        RollRoles = [_ | _] ->
            RollItem = #roll_item{origin_base_id = OriginBaseId} =
                           case util:rand_list(Items, ratio) of
                               #{item_id := BaseId, num := Num,
                                 is_cast := IsCast, crystal := Crystal} ->
                                   NewBaseId = item_type:special_id(BaseId),
                                   #roll_item{base_id = NewBaseId, num = Num,
                                              roles = RollRoles,
                                              is_cast = IsCast,
                                              origin_base_id = BaseId,
                                              crystal = Crystal};
                               #{item_id := BaseId, num := Num,
                                 is_cast := IsCast} ->
                                   NewBaseId = item_type:special_id(BaseId),
                                   #roll_item{base_id = NewBaseId, num = Num,
                                              roles = RollRoles,
                                              is_cast = IsCast,
                                              origin_base_id = BaseId}
                           end,
            {true, [RollItem], OriginBaseId, RollRoles};
        _Err ->
            logger:error("传入的roll点角色列表错误[~w]",
                         [_Err],
                         roll_mgr,
                         195),
            false
    end.

make_roll_role(Roles) -> make_roll_role(Roles, []).

make_roll_role([], RollRoles) -> RollRoles;
make_roll_role([{RoleId,
                 RoleName,
                 RolePid,
                 Sex,
                 Classes}
                | T],
               RollRoles) ->
    RollRole = #roll_role{role_id = RoleId, name = RoleName,
                          pid = RolePid, sex = Sex, classes = Classes},
    make_roll_role(T, [RollRole | RollRoles]);
make_roll_role([RollRole = #roll_role{} | T],
               RollRoles) ->
    make_roll_role(T, [RollRole | RollRoles]);
make_roll_role([R | T], RollRoles) ->
    logger:error("未知的roll角色:~w", [R], roll_mgr, 211),
    make_roll_role(T, RollRoles).

check_add(#roll{items = []}) ->
    {false, lang:get("roll点道具列表为空")};
check_add(#roll{timeout = T}) when T =< 0 ->
    {false, lang:get("roll点时间为0")};
check_add(Roll = #roll{timeout = TimeOut}) ->
    NewRoll = Roll#roll{end_tick =
                            date:unixtime() + TimeOut},
    {true, NewRoll}.

cancel_timer(Ref) when is_reference(Ref) ->
    erlang:cancel_timer(Ref);
cancel_timer(_Ref) -> ok.

next_roll([]) -> {undefined, []};
next_roll([Roll = #roll{end_tick = 0, timeout = TimeOut}
           | T]) ->
    Now = date:unixtime(),
    NewRoll = Roll#roll{end_tick = Now + TimeOut},
    next_roll([NewRoll | T]);
next_roll(Rolls) ->
    Now = date:unixtime(),
    L = lists:keysort(#roll.end_tick, Rolls),
    [#roll{end_tick = EndTick} | _] = L,
    Time = case EndTick - Now of
               Diff when Diff > 0 -> Diff;
               _ -> 1
           end,
    NewRef = erlang:send_after(Time * 1000,
                               self(),
                               time_end),
    logger:debug("下一个道具在~w秒后触发", [Time], roll_mgr, 245),
    {NewRef, L}.

check_choice(#roll{has_reward = 1}, _ItemId, _Choice,
             _RoleId, _RolePid) ->
    {false, lang:get("该道具已经发放")};
check_choice(Roll = #roll{items = Items, mode = Mode},
             ItemId, Choice, RoleId, RolePid) ->
    case lists:keyfind(ItemId, #roll_item.id, Items) of
        #roll_item{has_reward = 1} ->
            {false, lang:get("该道具已经发放")};
        Item = #roll_item{choices = Choices, roles = Iroles} ->
            case lists:keyfind(RoleId, #roll_role.role_id, Iroles)
                of
                RollRole = #roll_role{choice = 0,
                                      team_status = TeamStatus} ->
                    case lists:member(Choice, Choices) of
                        true ->
                            Time = date:unixtime(),
                            RAdd = case {Mode, TeamStatus} of
                                       {3, 1} ->
                                           5 +
                                               fairyland:update_roll_counter(RoleId);
                                       {3, _} ->
                                           fairyland:update_roll_counter(RoleId);
                                       _ -> 0
                                   end,
                            RandNumList0 = lists:usort([min(100, I + RAdd)
                                                        || I
                                                               <- lists:seq(1,
                                                                            100)]),
                            RandNumList = RandNumList0 -- get_num(Iroles),
                            RandNum = util:rand_list(RandNumList),
                            notice:send({pid, RolePid},
                                        1,
                                        util:flist(lang:get("成功掷出~w点"),
                                                   [RandNum])),
                            NewRollRole = RollRole#roll_role{rand_num = RandNum,
                                                             time = Time,
                                                             choice = Choice,
                                                             pid = RolePid},
                            NewIroles = lists:keystore(RoleId,
                                                       #roll_role.role_id,
                                                       Iroles,
                                                       NewRollRole),
                            NewItem = Item#roll_item{roles = NewIroles},
                            check_reward(NewItem, NewRollRole, Roll);
                        false -> {false, lang:get("当前不支持该选择")}
                    end;
                #roll_role{} -> {false, lang:get("已经选择过, 无法重复选择")};
                _ -> {false, lang:get("已经选择过,无法重复选择")}
            end;
        _ -> {false, lang:get("不存在该道具")}
    end.

check_reward(Item = #roll_item{id = ItemId,
                               roles = Iroles},
             RollRole, Roll = #roll{items = Items}) ->
    Now = [R
           || R = #roll_role{choice = Choice} <- Iroles,
              Choice =:= 0],
    case Now of
        [] ->
            Item1 = reward_item(Roll, Item),
            NewItem = Item1#roll_item{has_reward = 1},
            NewItems = lists:keyreplace(ItemId,
                                        #roll_item.id,
                                        Items,
                                        NewItem),
            NewRoll = Roll#roll{items = NewItems},
            update_roll(NewRoll, NewItem),
            check_roll(NewRoll);
        _ ->
            NewItems = lists:keyreplace(ItemId,
                                        #roll_item.id,
                                        Items,
                                        Item),
            NewRoll = Roll#roll{items = NewItems},
            update_roll(NewRoll, Item, RollRole),
            {null, NewRoll}
    end.

check_roll(Roll = #roll{items = Items}) ->
    case [I || I = #roll_item{has_reward = 0} <- Items] of
        [] -> {recalc, Roll#roll{has_reward = 1}};
        _ -> {null, Roll}
    end.

time_end_roll(#roll{has_reward = 1}) -> ok;
time_end_roll(Roll = #roll{items = Items}) ->
    do_time_end_roll(Roll, Items).

do_time_end_roll(_Roll, []) -> ok;
do_time_end_roll(Roll,
                 [#roll_item{has_reward = 1} | T]) ->
    do_time_end_roll(Roll, T);
do_time_end_roll(Roll = #roll{mode = Mode},
                 [RollItem = #roll_item{choices = [BaseChoice | _],
                                        roles = Iroles}
                  | T]) ->
    Last = [RollRole
            || RollRole = #roll_role{choice = Choice} <- Iroles,
               Choice =:= 0],
    case Last of
        [_ | _] ->
            Fun = fun (RollRole = #roll_role{role_id = RoleId,
                                             team_status = TeamStatus},
                       NewIroles) ->
                          Time = date:unixtime(),
                          RandNumList = lists:seq(1, 100) -- get_num(NewIroles),
                          RandNum0 = util:rand_list(RandNumList),
                          RandNum = case {Mode, TeamStatus} of
                                        {3, 1} ->
                                            min(100,
                                                RandNum0 + 5 +
                                                    fairyland:update_roll_counter(RoleId));
                                        {3, _} ->
                                            min(100,
                                                RandNum0 +
                                                    fairyland:update_roll_counter(RoleId));
                                        _ -> RandNum0
                                    end,
                          NewRollRole = RollRole#roll_role{choice = BaseChoice,
                                                           rand_num = RandNum,
                                                           time = Time},
                          lists:keystore(RoleId,
                                         #roll_role.role_id,
                                         NewIroles,
                                         NewRollRole)
                  end,
            NewIroles = lists:foldl(Fun, Iroles, Last),
            RollItem1 = RollItem#roll_item{roles = NewIroles},
            RollItem2 = reward_item(Roll, RollItem1),
            RollItem3 = RollItem2#roll_item{has_reward = 1},
            update_roll(Roll, RollItem3),
            do_time_end_roll(Roll, T);
        _ -> do_time_end_roll(Roll, T)
    end.

reward_item(#roll{mode = Mode, key = Key,
                  channel = Channel},
            RollItem = #roll_item{roles = Roles}) ->
    Fun = fun (R = #roll_role{choice = Choice},
               {Need, Greed}) ->
                  case Choice of
                      1 -> {[R | Need], Greed};
                      2 -> {Need, [R | Greed]};
                      _ -> {Need, Greed}
                  end
          end,
    {Need, Greed} = lists:foldl(Fun, {[], []}, Roles),
    SortNeed = util:keys_sort([{asc, #roll_role.time},
                               #roll_role.rand_num],
                              Need),
    SortGreed = util:keys_sort([{asc, #roll_role.time},
                                #roll_role.rand_num],
                               Greed),
    case SortNeed of
        [Role = #roll_role{role_id = RoleId, pid = RolePid,
                           rand_num = RandNum, team_status = TeamStatus}
         | Rest] ->
            case Mode of
                3 -> fairyland:reset_roll_counter(RoleId);
                _ -> ok
            end,
            async_gain(RolePid,
                       #{item => RollItem, channel => Channel, mode => Mode,
                         key => Key, rand_num => RandNum,
                         team_status => TeamStatus}),
            role_trigger:async_fire(RolePid,
                                    #evt_roll{point = RandNum, reward = 1}),
            fire_trigger(Rest),
            Role1 = Role#roll_role{reward = 1},
            NewRoles = lists:keyreplace(RoleId,
                                        #roll_role.role_id,
                                        Roles,
                                        Role1),
            RollItem#roll_item{roles = NewRoles};
        _ ->
            case SortGreed of
                [Role = #roll_role{role_id = RoleId, pid = RolePid,
                                   rand_num = RandNum, team_status = TeamStatus}
                 | Rest] ->
                    case Mode of
                        3 -> fairyland:reset_roll_counter(RoleId);
                        _ -> ok
                    end,
                    async_gain(RolePid,
                               #{item => RollItem, channel => Channel,
                                 mode => Mode, key => Key, rand_num => RandNum,
                                 team_status => TeamStatus}),
                    role_trigger:async_fire(RolePid,
                                            #evt_roll{point = RandNum,
                                                      reward = 1}),
                    fire_trigger(Rest),
                    Role1 = Role#roll_role{reward = 1},
                    NewRoles = lists:keyreplace(RoleId,
                                                #roll_role.role_id,
                                                Roles,
                                                Role1),
                    RollItem#roll_item{roles = NewRoles};
                _ -> RollItem
            end
    end.

fire_trigger(Rest) ->
    Fun = fun (#roll_role{pid = RolePid,
                          rand_num = RandNum})
                  when is_pid(RolePid) ->
                  role_trigger:async_fire(RolePid,
                                          #evt_roll{point = RandNum,
                                                    reward = 0});
              (_) -> ok
          end,
    lists:foreach(Fun, Rest).

async_gain(RolePid, RollGain = #{})
    when is_pid(RolePid) ->
    role:apply(async,
               RolePid,
               {roll_mgr, do_async_gain, [RollGain]}),
    ok;
async_gain(_, _) -> ok.

do_async_gain(Role = #role{id = RoleId, name = RName,
                           lev = RoleLev},
              RollGain = #{item :=
                               #roll_item{base_id = BaseId, num = Num,
                                          is_cast = IsCast,
                                          origin_base_id = OriginBaseId},
                           mode := RollMode, key := RollKey})
    when Num > 0 ->
    Result = case roll_data:get({RollMode, RollKey}) of
                 {#{reset_time := ResetMode, limittime := LimitTimes,
                    backgain := BackGain, caststr := CastStr,
                    limitlev := LimitLev},
                  _} ->
                     TimesList = case ResetMode of
                                     1 -> var:get_var(Role, day_five, 103, []);
                                     2 -> var:get_var(Role, week_five, 205, []);
                                     _ -> var:get_var(Role, day, 23, [])
                                 end,
                     NowTimes = case lists:keyfind({RollMode, RollKey},
                                                   1,
                                                   TimesList)
                                    of
                                    {_, Times} -> Times;
                                    _ -> 0
                                end,
                     RollLog = {{RollMode, RollKey}, NowTimes + 1},
                     NewTimesList = lists:keystore({RollMode, RollKey},
                                                   1,
                                                   TimesList,
                                                   RollLog),
                     Role1 = case ResetMode of
                                 1 ->
                                     var:set_var(Role,
                                                 day_five,
                                                 103,
                                                 NewTimesList);
                                 2 ->
                                     var:set_var(Role,
                                                 week_five,
                                                 205,
                                                 NewTimesList);
                                 _ -> var:set_var(Role, day, 23, NewTimesList)
                             end,
                     BackFlag = case RoleLev >= LimitLev of
                                    true -> {lev_limit, LimitLev};
                                    false ->
                                        case NowTimes >= LimitTimes of
                                            true -> times_limit;
                                            false -> false
                                        end
                                end,
                     case BackFlag of
                         false ->
                             case IsCast of
                                 1 ->
                                     {Msg} = util:rand_list(CastStr),
                                     Msg1 = notice:format(Msg,
                                                          [{role_1,
                                                            RoleId,
                                                            RName},
                                                           {item_2,
                                                            BaseId,
                                                            Num}]),
                                     case lists:member(OriginBaseId,
                                                       [29010, 29011, 20291])
                                         of
                                         true -> notice:cast(all, 10, Msg1);
                                         _ -> notice:cast(all, 5, Msg1)
                                     end;
                                 0 -> skip
                             end,
                             {BackFlag, [{BaseId, 0, Num}], Role1};
                         _ -> {BackFlag, BackGain, Role1}
                     end;
                 _ -> false
             end,
    case Result of
        {BackFlag1, GainList, LimitRole} ->
            Gain = format:val_to_gain(GainList),
            case role_gain:do(Gain, LimitRole) of
                {false, #gain{reason = bag_full}} ->
                    mail:send(LimitRole,
                              #{title => lang:get("掷点道具奖励"),
                                content => lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
                                items => GainList}),
                    role_cast_gain(BackFlag1,
                                   RollGain#{name => RName, gain => GainList}),
                    reward_others(RollGain#{role_id => RoleId}),
                    copy_to_leader(LimitRole,
                                   #{mode => RollMode, base_id => BaseId,
                                     num => Num,
                                     origin_base_id => OriginBaseId}),
                    {ok, LimitRole};
                {ok, NewRole} ->
                    role_cast_gain(BackFlag1,
                                   RollGain#{name => RName, gain => GainList}),
                    reward_others(RollGain#{role_id => RoleId}),
                    copy_to_leader(NewRole,
                                   #{mode => RollMode, base_id => BaseId,
                                     num => Num,
                                     origin_base_id => OriginBaseId}),
                    {ok, NewRole};
                {false, _} -> ok
            end;
        _ -> ok
    end;
do_async_gain(_, _) -> ok.

role_cast_gain(false,
               #{name := RoleName, channel := RollChannel,
                 item :=
                     RollItem = #roll_item{base_id = BaseId, num = Num},
                 rand_num := RandNum, mode := Mode,
                 team_status := TeamStatus}) ->
    Msg = case {Mode, TeamStatus} of
              {3, 1} ->
                  RandStr = util:flist(lang:get("~w+5（队长额外加成）"),
                                       [RandNum - 5]),
                  notice:format(lang:get("~ts掷出了最高~ts点，获得了~ts"),
                                [{role_2, RoleName},
                                 {string_2, 6, RandStr},
                                 {item_2, BaseId, Num}]);
              _ ->
                  notice:format(lang:get("~ts掷出了最高~ts点，获得了~ts"),
                                [{role_2, RoleName},
                                 {string_2, 6, RandNum},
                                 {item_2, BaseId, Num}])
          end,
    notice_cast(RollChannel, RollItem, Msg);
role_cast_gain(BackFlag,
               #{name := RoleName, channel := RollChannel,
                 gain := GainList, item := RollItem, rand_num := RandNum,
                 mode := Mode, team_status := TeamStatus}) ->
    case GainList of
        [{BaseId, Num}] ->
            Msg = case {Mode, TeamStatus} of
                      {3, 1} ->
                          RandStr = util:flist(lang:get("~w+5（队长额外加成）"),
                                               [RandNum - 5]),
                          notice:format(lang:get("~ts掷出了最高~ts点，由于今天已经获得过一次奖励，自动转换为~ts"),
                                        [{role_2, RoleName},
                                         {string_2, 6, RandStr},
                                         {item_2, BaseId, Num}]);
                      _ ->
                          case BackFlag of
                              {lev_limit, LevLimit} ->
                                  notice:format(lang:get("~ts掷出了最高~ts点，由于超过~ts级，自动转换为~ts"),
                                                [{role_2, RoleName},
                                                 {string_2, 6, RandNum},
                                                 {string_2, 6, LevLimit},
                                                 {item_2, BaseId, Num}]);
                              _ ->
                                  notice:format(lang:get("~ts掷出了最高~ts点，由于今天已经获得过一次奖励，自动转换为~ts"),
                                                [{role_2, RoleName},
                                                 {string_2, 6, RandNum},
                                                 {item_2, BaseId, Num}])
                          end
                  end,
            notice_cast(RollChannel, RollItem, Msg);
        _ -> skip
    end;
role_cast_gain(_Flag, _Gain) -> skip.

reward_others(#{mode := 3,
                item :=
                    #roll_item{roles = Roles, crystal = Crystal,
                               base_id = BaseId},
                role_id := RoleId})
    when Crystal > 0 ->
    [role:apply(async,
                Pid,
                {roll_mgr, async_reward_other, [BaseId, Crystal]})
     || #roll_role{pid = Pid, role_id = Id} <- Roles,
        Id =/= RoleId andalso is_pid(Pid)],
    ok;
reward_others(_) -> ok.

async_reward_other(Role = #role{id = RoleId}, BaseId,
                   Crystal) ->
    case fairyland:check_crystall_val(RoleId, Crystal) of
        0 ->
            Msg = notice:format(lang:get("本次活动获得次~ts已达上限"),
                                [{assets_2, 90035}]),
            notice:send(Role, 3, Msg),
            ok;
        _ ->
            Gain = format:val_to_gain([{90035, Crystal}]),
            case role_gain:do(Gain, Role) of
                {ok, NRole} ->
                    Msg = notice:format(lang:get("~ts遗憾没有抽中，不过意外获得了~ts"),
                                        [{item_2, BaseId},
                                         {item_2, 90035, Crystal}]),
                    notice:send(Role, 3, Msg),
                    fairyland:update_roll_crystal(RoleId, Crystal),
                    {ok, NRole};
                _ -> ok
            end
    end.

notice_cast({map, MapId}, _RollItem, Msg) ->
    notice:cast({map, MapId}, 3, Msg),
    ok;
notice_cast({roll_role, NoticeType},
            #roll_item{roles = Roles}, Msg) ->
    lists:foreach(fun (#roll_role{pid = Pid})
                          when is_pid(Pid) ->
                          notice:send({pid, Pid}, NoticeType, Msg),
                          ok;
                      (_) -> skip
                  end,
                  Roles),
    ok;
notice_cast(_, _, _) -> ok.

get_num(Iroles) ->
    [RandNum
     || #roll_role{rand_num = RandNum} <- Iroles,
        RandNum =/= 0].

cast_roll(#roll{id = RollId, key = Key,
                end_tick = EndTick, items = Items, mode = Mode},
          RollRoles) ->
    Data = {RollId, Mode, Key, EndTick, Items},
    lists:foreach(fun (#roll_role{pid = RolePid})
                          when is_pid(RolePid) ->
                          role:pack_send(RolePid, 12300, Data);
                      (_) -> ok
                  end,
                  RollRoles),
    ok.

update_roll(#roll{id = RollId, end_tick = EndTick},
            #roll_item{id = ItemId, roles = Roles}) ->
    Data = {RollId, EndTick, ItemId, Roles},
    lists:foreach(fun (#roll_role{pid = RolePid})
                          when is_pid(RolePid) ->
                          role:pack_send(RolePid, 12301, Data);
                      (_) -> ok
                  end,
                  Roles),
    ok.

update_roll(#roll{id = RollId, end_tick = EndTick},
            #roll_item{id = ItemId, roles = Roles},
            RollRole = #roll_role{}) ->
    Data = {RollId, EndTick, ItemId, [RollRole]},
    lists:foreach(fun (#roll_role{pid = RolePid})
                          when is_pid(RolePid) ->
                          role:pack_send(RolePid, 12301, Data);
                      (_) -> ok
                  end,
                  Roles),
    ok.

copy_to_leader(#role{m_team =
                         #m_team{pid = TeamPid, status = Status}},
               Args = #{mode := 3, origin_base_id := OriginBaseId})
    when is_pid(TeamPid) andalso Status =/= 1 ->
    case team:get_leader(TeamPid) of
        {true, #team_mate{pid = LeaderPid}} ->
            case lists:member(OriginBaseId, [29010, 29011, 20291])
                     =:= false
                     andalso util:rand(1, 100) =< 20
                of
                true ->
                    role:apply(async,
                               LeaderPid,
                               {roll_mgr, async_copy_gain, [Args]});
                _ -> ok
            end;
        _ -> ok
    end;
copy_to_leader(_, _) -> ok.

async_copy_gain(Role = #role{m_team =
                                 #m_team{pid = Pid, status = 1},
                             name = Name},
                #{base_id := BaseId, num := Num})
    when is_pid(Pid) ->
    case var:get_var(Role, day, 42, 0) < 2 of
        true ->
            Role1 = var:acc_var(Role, day, 42),
            GL = format:val_to_gain([{BaseId, 0, Num}]),
            case role_gain:do_notice(GL, Role1) of
                {ok, Role2} ->
                    Msg = notice:format(lang:get("~ts由于是队长的关系，竟然也获得了~ts"),
                                        [{role_2, Name},
                                         {item_2, BaseId, Num}]),
                    team:notice(Role2, Msg),
                    {ok, Role2};
                _ -> ok
            end;
        _ -> ok
    end.

filter_items(3, ItemList0) ->
    case env:get(fairyland_roll_pool) of
        Pool when is_integer(Pool) ->
            logger:debug("珍兽奖池系数 ~w", [Pool], roll_mgr, 650),
            do_fairyland_box_items(ItemList0, Pool);
        _ -> ItemList0
    end;
filter_items(_, Items) -> Items.

do_fairyland_box_items([], _) -> [];
do_fairyland_box_items([H = #{item_id := 20291,
                              ratio := Ratio}
                        | T],
                       Fac) ->
    [H#{ratio := Ratio * Fac} | do_fairyland_box_items(T,
                                                       Fac)];
do_fairyland_box_items([H | T], Fac) ->
    [H | do_fairyland_box_items(T, Fac)].

