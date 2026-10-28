-file("src/mod/campaign/camp_rushing_top.erl", 1).

-module(camp_rushing_top).

-author("jia").

-behaviour(gen_server).

-export([start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([push_rush_role/1,
         push_config/1,
         push_state/1,
         sign/1,
         enter_map/1,
         leave_map/1,
         answer/3,
         revive/1,
         send_barrage/2,
         set_barrage/3,
         call/1,
         cast/1,
         info/1,
         login/1,
         re_login/1,
         role_callback/2,
         get_etc_config/1,
         get_config/1,
         init_data/0,
         get_season_info/0,
         clean_all_sign/0]).

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

-file("src/mod/campaign/camp_rushing_top.erl", 56).

-file("inc/camp_rushing_top.hrl", 1).

-author("jia").

-record(camp_rushing_top_season_info,
        {season_id = 0,
         cur_index = 0,
         total_index = 0,
         question_group = 0,
         option_a = 0,
         option_b = 0,
         option_c = 0,
         gold = 0,
         final_num = 0,
         final_roles = [],
         gain_gold = 0,
         last_num = 0}).

-record(camp_rushing_top_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         is_sign = 0,
         in_map = 0,
         index = 0,
         option = 0,
         is_lost = 0,
         sign_times = 0,
         final_times = 0,
         revive_times = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0}).

-record(camp_rushing_top_question_base,
        {question_group = 0,
         question_index = 0,
         question = "",
         option_a = "",
         option_b = "",
         option_c = "",
         answer = 0}).

-file("src/mod/campaign/camp_rushing_top.erl", 57).

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

-file("src/mod/campaign/camp_rushing_top.erl", 58).

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

-file("src/mod/campaign/camp_rushing_top.erl", 59).

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

-file("src/mod/campaign/camp_rushing_top.erl", 60).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/mod/campaign/camp_rushing_top.erl", 61).

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

-file("src/mod/campaign/camp_rushing_top.erl", 62).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/mod/campaign/camp_rushing_top.erl", 63).

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

-file("src/mod/campaign/camp_rushing_top.erl", 64).

-record(state,
        {cur_state = 0,
         timeout = 0,
         gain_gold = 0,
         barrage_ref = undefind,
         msgs = [],
         ready_map_info = {0, undefind},
         answer_map_info = {0, undefind},
         group_id = 0,
         index = 0,
         stop_answer = 0,
         answer_state = 0,
         is_push = 0,
         exp_ref = undefind}).

start_link() ->
    gen_server:start_link({local, camp_rushing_top},
                          camp_rushing_top,
                          [],
                          []).

cast(Info) -> gen_server:cast(camp_rushing_top, Info).

call(Info) ->
    case catch gen_server:call(camp_rushing_top,
                               Info,
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Info) -> camp_rushing_top ! Info.

init([]) ->
    logger:info("区服冲顶答题活动开始启动...",
                [],
                camp_rushing_top,
                122),
    process_flag(trap_exit, true),
    dets:open_file(camp_rushing_top_role,
                   [{file, "./dets/camp_rushing_top_role.dets"},
                    {keypos, #camp_rushing_top_role.rid}]),
    ets:new(camp_rushing_top_role,
            [set,
             named_table,
             public,
             {keypos, #camp_rushing_top_role.rid}]),
    dets:to_ets(camp_rushing_top_role,
                camp_rushing_top_role),
    ets:new(camp_rushing_top_season_info,
            [set, named_table, public, {keypos, 1}]),
    P = env:get(platform),
    Z = env:get(zone_id),
    big_world:cast(c_camp_rushing_top,
                   cast,
                   [{request_season_info, P, Z}]),
    Ref = set_timer(10, request_season_info),
    put(request_season_info_ref, {1, Ref}),
    logger:info("区服冲顶答题活动启动完成...",
                [],
                camp_rushing_top,
                136),
    {ok, #state{}}.

handle_call(enter_map, _From,
            State = #state{cur_state = StateCode,
                           ready_map_info = RMapInfo,
                           answer_map_info = AMapInfo}) ->
    Replay = case StateCode of
                 1 -> {false, lang:get("当前场次冲顶答题尚未开始")};
                 2 -> {false, lang:get("当前场次冲顶答题尚未开始")};
                 3 ->
                     case RMapInfo of
                         {MapID, MapPid} when is_pid(MapPid) ->
                             {TransX, TransY} = case map_data:get(53012) of
                                                    {ok,
                                                     #map_data{revive =
                                                                   Revive}} ->
                                                        case
                                                            util:rand_list(Revive)
                                                            of
                                                            {X, Y} -> {X, Y};
                                                            _ -> {2040, 1200}
                                                        end;
                                                    _ -> {2040, 1200}
                                                end,
                             {ok, {MapID, TransX, TransY}};
                         _ERR ->
                             logger:error("冲顶答题准备地图场景出错:~w",
                                          [_ERR],
                                          camp_rushing_top,
                                          163),
                             {false, lang:get("冲顶答题准备地图场景出错")}
                     end;
                 _ when StateCode > 3 ->
                     case AMapInfo of
                         {MapID, MapPid} when is_pid(MapPid) ->
                             {TransX, TransY} = case map_data:get(53013) of
                                                    {ok,
                                                     #map_data{revive =
                                                                   _Revive}} ->
                                                        case map:rand_pos(53013)
                                                            of
                                                            {DefineX,
                                                             DefineY} ->
                                                                {DefineX,
                                                                 DefineY};
                                                            _ ->
                                                                util:rand_list([{919,
                                                                                 839},
                                                                                {640,
                                                                                 1400},
                                                                                {880,
                                                                                 2000},
                                                                                {2047,
                                                                                 947},
                                                                                {3200,
                                                                                 1960},
                                                                                {3480,
                                                                                 1400},
                                                                                {3240,
                                                                                 800},
                                                                                {2047,
                                                                                 1803}])
                                                        end;
                                                    _ -> {919, 839}
                                                end,
                             {ok, {MapID, TransX, TransY}};
                         _ERR ->
                             logger:error("冲顶答题比赛地图场景出错:~w",
                                          [_ERR],
                                          camp_rushing_top,
                                          183),
                             {false, lang:get("冲顶答题比赛地图场景出错")}
                     end;
                 _ -> {false, lang:get("当前场次冲顶答题尚未开始")}
             end,
    {reply, Replay, State};
handle_call({revive, RoleIndex}, _From,
            State = #state{cur_state = CurSate, index = Index,
                           group_id = GroupID})
    when CurSate =:= 4 ->
    Replay = case
                 camp_rushing_top_data:question_list(GroupID)
                 of
                 List when is_list(List) ->
                     TotalIndex = length(List),
                     case Index < TotalIndex of
                         true ->
                             case RoleIndex + 1 =:= Index of
                                 true -> ok;
                                 _ -> {false, lang:get("复活阶段已过，不能复活")}
                             end;
                         _ -> {false, lang:get("当前题目不能使用复活")}
                     end;
                 _ -> {false, lang:get("系统错误，复活失败")}
             end,
    {reply, Replay, State};
handle_call({revive, _}, _From,
            State = #state{answer_state = 1}) ->
    Replay = {false, lang:get("当前阶段不能复活")},
    {reply, Replay, State};
handle_call({check_sign, Rid}, _From,
            State = #state{cur_state = StateCode}) ->
    Replay = case StateCode of
                 _ when StateCode =:= 2 orelse StateCode =:= 3 ->
                     case get_rush_role(Rid) of
                         {ok, #camp_rushing_top_role{is_sign = 1}} ->
                             {false, lang:get("已经报名，无需重复报名")};
                         _ -> {ok, StateCode}
                     end;
                 1 -> {false, lang:get("活动尚未开启，请留意活动公告{face_1,7}")};
                 _ -> {false, lang:get("当前时间不能报名，请留意活动公告{face_1,7}")}
             end,
    {reply, Replay, State};
handle_call({add_answer, Rid, AnswerIndex, Option},
            _From,
            State = #state{answer_state = AnswerState,
                           group_id = GroupID, index = CurIndex}) ->
    Replay = case AnswerState of
                 1 ->
                     case AnswerIndex =/= CurIndex of
                         true -> {false, lang:get("作答题目与当前题目不符合")};
                         _ ->
                             case Option > 3 of
                                 true -> {false, lang:get("作答错误，作答无效")};
                                 _ ->
                                     case get_season_info() of
                                         Info =
                                             #camp_rushing_top_season_info{option_a
                                                                               =
                                                                               OptionA,
                                                                           option_b
                                                                               =
                                                                               OptionB,
                                                                           option_c
                                                                               =
                                                                               OptionC,
                                                                           final_roles
                                                                               =
                                                                               FinalRoles} ->
                                             {NewOptionA,
                                              NewOptionB,
                                              NewOptionC} =
                                                 case Option of
                                                     1 ->
                                                         {OptionA + 1,
                                                          OptionB,
                                                          OptionC};
                                                     2 ->
                                                         {OptionA,
                                                          OptionB + 1,
                                                          OptionC};
                                                     3 ->
                                                         {OptionA,
                                                          OptionB,
                                                          OptionC + 1};
                                                     _ ->
                                                         {OptionA,
                                                          OptionB,
                                                          OptionC}
                                                 end,
                                             Answer = case
                                                          camp_rushing_top_data:get_question({GroupID,
                                                                                              CurIndex})
                                                          of
                                                          #camp_rushing_top_question_base{answer
                                                                                              =
                                                                                              AS} ->
                                                              AS;
                                                          _ ->
                                                              logger:error("题目出错：~w",
                                                                           [{GroupID,
                                                                             CurIndex}],
                                                                           camp_rushing_top,
                                                                           262),
                                                              1
                                                      end,
                                             NewFinalRoles = case Answer =:=
                                                                      Option
                                                                 of
                                                                 true ->
                                                                     [Rid
                                                                      | FinalRoles];
                                                                 _ -> FinalRoles
                                                             end,
                                             NewInfo =
                                                 Info#camp_rushing_top_season_info{option_a
                                                                                       =
                                                                                       NewOptionA,
                                                                                   option_b
                                                                                       =
                                                                                       NewOptionB,
                                                                                   option_c
                                                                                       =
                                                                                       NewOptionC,
                                                                                   final_roles
                                                                                       =
                                                                                       NewFinalRoles},
                                             save_season_info(NewInfo),
                                             {ok, Answer};
                                         _ -> {false, lang:get("作答失败，请重新作答")}
                                     end
                             end
                     end;
                 _ -> {false, lang:get("题目作答超时，作答无效")}
             end,
    {reply, Replay, State};
handle_call(_Request, _From, State) ->
    logger:info("收到未知同步消息：~w",
                [_Request],
                camp_rushing_top,
                286),
    {reply, ok, State}.

handle_cast({push_rush_state, Args},
            State = #state{ready_map_info = ReadyMapInfo,
                           answer_map_info = AnswerMapInfo,
                           cur_state = OldState, exp_ref = ExpRef,
                           barrage_ref = BarrageRef}) ->
    #{state_code := StateCode, timeout := TimeOut,
      info := Info} =
        Args,
    save_season_info(Info),
    #camp_rushing_top_season_info{gold = Gold} = Info,
    {_RMapID, RMapPID} = ReadyMapInfo,
    {AMapID, AMapPID} = AnswerMapInfo,
    Now = date:unixtime(),
    NewTimeOut = TimeOut + Now,
    State1 = State#state{cur_state = StateCode,
                         timeout = NewTimeOut},
    State2 = case StateCode > 2 of
                 true ->
                     ST = case is_pid(RMapPID) andalso is_pid(AMapPID) of
                              false ->
                                  {RMapInfo, AMapInfo} = create_map(),
                                  State1#state{ready_map_info = RMapInfo,
                                               answer_map_info = AMapInfo};
                              _ -> State1
                          end,
                     case is_reference(ExpRef) of
                         true -> ST;
                         _ -> ST#state{exp_ref = set_timer(30, add_exp)}
                     end;
                 _ -> State1
             end,
    State3 = case StateCode of
                 1 ->
                     case is_pid(RMapPID) andalso is_pid(AMapPID) of
                         true ->
                             map:async_apply(RMapPID,
                                             {camp_rushing_top,
                                              role_callback,
                                              [leave]}),
                             map:async_apply(AMapPID,
                                             {camp_rushing_top,
                                              role_callback,
                                              [leave]}),
                             stop_timer(BarrageRef),
                             map:stop(RMapPID),
                             map:stop(AMapPID);
                         _ -> ok
                     end,
                     State2#state{gain_gold = 0, barrage_ref = undefind,
                                  ready_map_info = {0, undefind},
                                  answer_map_info = {0, undefind}, index = 0,
                                  group_id = o, stop_answer = 0};
                 _ -> State2
             end,
    case OldState =:= 1 andalso StateCode =/= OldState of
        true -> init_data();
        _ -> ok
    end,
    case OldState =:= 1 andalso StateCode =:= 2 of
        true ->
            List = [5, 10, 15],
            lists:foreach(fun (Time) ->
                                  case TimeOut > Time * 60 of
                                      true ->
                                          Msg1 =
                                              notice:format(lang:get("~ts将于~ts分钟后开启，现在就可以报名咯，赠送他人入场券还可获得复活卡哟{face_1,7}"),
                                                            [{string_2,
                                                              1,
                                                              lang:get("冲顶答题")},
                                                             {string_2,
                                                              1,
                                                              Time}]),
                                          set_timer(NewTimeOut - Time * 60 -
                                                        Now,
                                                    {notice_msg, Msg1}),
                                          ok;
                                      _ -> ok
                                  end
                          end,
                          List);
        _ -> ok
    end,
    case OldState =:= 2 andalso StateCode =:= 3 of
        true ->
            Msg1 =
                notice:format(lang:get("~ts最后5分钟报名时间，还没入场的小伙伴抓紧时间啦，用智慧争夺~ts钻石奖池吧{face"
                                       "_1,25}"),
                              [{string_2, 1, lang:get("冲顶答题")},
                               {string_2, 1, Gold}]),
            set_timer(NewTimeOut - 5 * 60 - Now,
                      {notice_msg, Msg1}),
            Msg2 =
                notice:format(lang:get("~ts请进场准备，10分钟后正式开启答题，~ts钻石奖池等你来拿{face_1,31}"),
                              [{string_2, 1, lang:get("冲顶答题")},
                               {string_2, 1, Gold}]),
            notice:cast(all, 8, Msg2),
            Msg3 =
                notice:format(lang:get("~ts将于3分钟后截止报名，请参赛选手入场准备{face_1,7}"),
                              [{string_2, 1, lang:get("冲顶答题")}]),
            set_timer(NewTimeOut - 3 * 60 - Now,
                      {notice_msg, Msg3}),
            Msg4 =
                notice:format(lang:get("~ts将于1分钟后截止报名，请参赛选手入场准备{face_1,7}"),
                              [{string_2, 1, lang:get("冲顶答题")}]),
            set_timer(NewTimeOut - 1 * 60 - Now,
                      {notice_msg, Msg4}),
            put(zone_barrage_msg, []),
            put(barrage_msg, []),
            info(send_center_barrage),
            info(notic_zone_barrage),
            ok;
        _ -> ok
    end,
    case OldState =:= 3 andalso StateCode =:= 4 of
        true ->
            case is_pid(AMapPID) andalso is_pid(RMapPID) of
                true ->
                    map:async_apply(RMapPID,
                                    {camp_rushing_top,
                                     role_callback,
                                     [{answer_enter_map, AMapID}]}),
                    ok;
                _ERR ->
                    logger:error("冲顶答题比赛地图场景出错:~w",
                                 [_ERR],
                                 camp_rushing_top,
                                 391),
                    ok
            end,
            Msg5 =
                notice:format(lang:get("~ts已经正式开启，~ts钻石奖池究竟花落谁家，让我们拭目以待吧{face_1,18}"),
                              [{string_2, 1, lang:get("冲顶答题")},
                               {string_2, 1, Gold}]),
            notice:cast(all, 8, Msg5);
        _ -> ok
    end,
    NewState = State3,
    Data = {StateCode, NewTimeOut},
    role_group:pack_send(world, 20422, Data),
    {noreply, NewState};
handle_cast({push_rush_question, GroupID, Index},
            State = #state{answer_map_info = MapInfo}) ->
    Info = #camp_rushing_top_season_info{season_id =
                                             SeasonID,
                                         final_num = FinalNum} =
               get_season_info(),
    AllList = ets:tab2list(camp_rushing_top_role),
    Content =
        notice:format(lang:get("本场比赛中您答对了~ts题，获得了以下奖励。温馨提示：每场比赛可以使用~ts张复活卡，复活"
                               "卡可通过赠送他人入场券获得，祝您下次冲顶成功！"),
                      [{string_2, 5, Index - 2},
                       {string_2, 5, get_config(max_revive)}]),
    ChangeRoles = lists:foldl(fun (R =
                                       #camp_rushing_top_role{rid = Rid,
                                                              is_sign = 1,
                                                              is_lost = IsLost,
                                                              index = RIndex,
                                                              name = Name},
                                   Acc)
                                      when RIndex + 2 =:= Index ->
                                      R1 = R#camp_rushing_top_role{option = 0},
                                      R2 = case IsLost =:= 0 of
                                               true ->
                                                   R1#camp_rushing_top_role{index
                                                                                =
                                                                                RIndex
                                                                                    +
                                                                                    1};
                                               _ ->
                                                   LostRewards = case
                                                                     camp_rushing_top_data:get_lost_reward({SeasonID,
                                                                                                            Index
                                                                                                                -
                                                                                                                1})
                                                                     of
                                                                     {SeasonID,
                                                                      _,
                                                                      Reward}
                                                                         when
                                                                           length(Reward)
                                                                               >
                                                                               0 ->
                                                                         [{item_type:special_id(BaseID),
                                                                           Bind,
                                                                           Num}
                                                                          || {BaseID,
                                                                              Bind,
                                                                              Num}
                                                                                 <- Reward];
                                                                     _ERR1 -> []
                                                                 end,
                                                   mail:send(Rid,
                                                             #{title =>
                                                                   lang:get("冲顶答题结算奖励"),
                                                               content =>
                                                                   Content,
                                                               items =>
                                                                   LostRewards}),
                                                   case Index >= 9 andalso
                                                            Index =< 12
                                                       of
                                                       true ->
                                                           Msg =
                                                               notice:format(lang:get("本服~ts在~ts中不慎出局，遗憾之际竟获得了~ts奖励，瞬间喜笑颜开{face_1,10}"),
                                                                             [{role_2,
                                                                               Name},
                                                                              {string_2,
                                                                               1,
                                                                               lang:get("冲顶答题")},
                                                                              {item_2,
                                                                               LostRewards}]),
                                                           notice:cast(all,
                                                                       8,
                                                                       Msg),
                                                           ok;
                                                       _ -> ok
                                                   end,
                                                   R1
                                           end,
                                      [R2 | Acc];
                                  (R3 = #camp_rushing_top_role{in_map = 0}, Acc)
                                      when Index =:= 1 ->
                                      R4 = R3#camp_rushing_top_role{is_lost =
                                                                        1},
                                      [R4 | Acc];
                                  (_, Acc) -> Acc
                              end,
                              [],
                              AllList),
    LastList = [R
                || R = #camp_rushing_top_role{is_sign = 1, is_lost = 0}
                       <- AllList],
    NewList = LastList -- ChangeRoles,
    save_rush_role(ChangeRoles),
    case MapInfo of
        {_MapID, MapPid} when is_pid(MapPid) ->
            StopTime = get_config(answer_time) + date:unixtime(),
            map:async_apply(MapPid,
                            {camp_rushing_top,
                             role_callback,
                             [{push_rush_question, GroupID, Index, StopTime}]}),
            NewState = State#state{index = Index,
                                   group_id = GroupID, answer_state = 1,
                                   is_push = 0, stop_answer = StopTime},
            NewInfo = Info#camp_rushing_top_season_info{option_a =
                                                            0,
                                                        option_b = 0,
                                                        option_c = 0,
                                                        final_roles = [],
                                                        cur_index = Index,
                                                        question_group =
                                                            GroupID},
            save_season_info(NewInfo),
            case Index of
                _ when Index < 12 andalso Index > 1 ->
                    Msg3 =
                        util:flist(lang:get("恭喜<color='#FFFF00'>~ts</color>位参赛者进入第~ts题，本服剩"
                                            "余~ts人，恭喜他们！"),
                                   [integer_to_list(FinalNum),
                                    integer_to_list(Index),
                                    integer_to_list(length(NewList))]),
                    send_barrage(MapInfo, 1, Msg3),
                    ok;
                _ -> ok
            end,
            {noreply, NewState};
        _ERR2 ->
            logger:error("冲顶答题地图场景出错:~w",
                         [_ERR2],
                         camp_rushing_top,
                         465),
            {noreply, State}
    end;
handle_cast({push_rush_answer, SeasonInfo},
            State = #state{index = Index, group_id = GroupID,
                           answer_map_info = MapInfo}) ->
    save_season_info(SeasonInfo),
    #camp_rushing_top_season_info{option_a = OptionA,
                                  option_b = OptionB, option_c = OptionC,
                                  final_num = FinalNum, gold = Gold,
                                  last_num = LastNum,
                                  total_index = TotalIndex} =
        SeasonInfo,
    case Index of
        6 ->
            Msg =
                notice:format(lang:get("~ts赛程过半，场内还剩~ts名参赛者，~ts钻石奖池就在前方，加油加油{face_1,29}"),
                              [{string_2, 1, lang:get("冲顶答题")},
                               {string_2, 1, FinalNum},
                               {string_2, 1, Gold}]),
            notice:cast(all, 8, Msg),
            ok;
        11 ->
            Msg2 =
                util:flist(lang:get("即将揭晓第<color='#FFFF00'>~ts</color>题-决胜题，请剩余的参赛"
                                    "者做好准备，答对即可获得奖池奖金"),
                           [integer_to_list(TotalIndex)]),
            send_barrage(MapInfo, 1, Msg2),
            ok;
        _ -> ok
    end,
    case camp_rushing_top_data:get_question({GroupID,
                                             Index})
        of
        #camp_rushing_top_question_base{answer = Answer} ->
            case MapInfo of
                {_MapID, MapPid} when is_pid(MapPid) ->
                    Data = {Index,
                            OptionA,
                            OptionB,
                            OptionC,
                            Answer,
                            LastNum},
                    map:async_apply(MapPid,
                                    {camp_rushing_top,
                                     role_callback,
                                     [{push_rush_answer, Data}]}),
                    NewState = State#state{index = Index,
                                           group_id = GroupID,
                                           answer_state = 1},
                    {noreply, NewState};
                _ERR ->
                    logger:error("冲顶答题地图场景出错:~w",
                                 [_ERR],
                                 camp_rushing_top,
                                 495),
                    {noreply, State}
            end;
        _ -> {noreply, State}
    end;
handle_cast({add_rush_role, RushRole}, State) ->
    save_rush_role(RushRole),
    big_world:cast(c_camp_rushing_top,
                   cast,
                   [{add_rush_role, RushRole}]),
    {noreply, State};
handle_cast({save_without_center, RushRole}, State) ->
    save_rush_role(RushRole),
    {noreply, State};
handle_cast({role_leave, Rid}, State) ->
    case get_rush_role(Rid) of
        {ok, R = #camp_rushing_top_role{rid = Rid}} ->
            NR = R#camp_rushing_top_role{in_map = 0},
            save_rush_role(NR),
            ok;
        _ -> ok
    end,
    {noreply, State};
handle_cast({send_barrage, Rid, Msg},
            State = #state{cur_state = StateCode,
                           answer_map_info = AMapInfo,
                           ready_map_info = RMapInfo}) ->
    case get_rush_role(Rid) of
        {ok, RRole = #camp_rushing_top_role{}} ->
            NewRushRole = RRole#camp_rushing_top_role{barrage_time =
                                                          date:unixtime() + 6},
            save_rush_role(NewRushRole),
            push_rush_role(NewRushRole);
        _ -> ok
    end,
    MapInfo = case StateCode of
                  3 -> RMapInfo;
                  4 -> AMapInfo;
                  _ -> {0, undefind}
              end,
    send_barrage(MapInfo, 2, Msg),
    NewMsg = case get(barrage_msg) of
                 L when is_list(L) -> [Msg | L];
                 _ -> [Msg]
             end,
    put(barrage_msg, NewMsg),
    {noreply, State};
handle_cast({push_state, Rid},
            State = #state{cur_state = StateCode,
                           timeout = TimeOut}) ->
    Data = {StateCode, TimeOut},
    role:pack_send(Rid, 20422, Data),
    {noreply, State};
handle_cast({send_reward,
             Info = #camp_rushing_top_season_info{final_num =
                                                      FinalNum,
                                                  total_index = TotalIndex,
                                                  gold = TotalGold},
             GainGold,
             GainItems},
            State = #state{barrage_ref = OldRef,
                           answer_map_info = AnswerMapInfo}) ->
    save_season_info(Info),
    stop_timer(OldRef),
    MinBarrage = get_config(min_barrage),
    AllList = ets:tab2list(camp_rushing_top_role),
    NewList = lists:foldl(fun (R =
                                   #camp_rushing_top_role{rid = Rid,
                                                          is_sign = 1,
                                                          is_lost = 0,
                                                          name = Name,
                                                          final_times =
                                                              OldTime},
                               Acc) ->
                                  role:apply(async,
                                             Rid,
                                             {camp_rushing_top,
                                              role_callback,
                                              [{fire_final_times,
                                                OldTime + 1}]}),
                                  Content =
                                      notice:format(lang:get("恭喜您在~ts中成功答对~ts题，与~ts位参赛者平分~ts钻石奖池，您获得了~ts钻石，"
                                                             "请查收{face_1,18}"),
                                                    [{string_2,
                                                      1,
                                                      lang:get("冲顶答题")},
                                                     {string_2, 5, TotalIndex},
                                                     {string_2, 5, FinalNum},
                                                     {string_2, 5, TotalGold},
                                                     {string_2, 5, GainGold}]),
                                  mail:send(Rid,
                                            #{title => lang:get("冲顶成功奖励"),
                                              content => Content,
                                              items => GainItems}),
                                  Msg =
                                      notice:format(lang:get("登顶成功！恭喜本服~ts在登顶答题中智慧与美貌并重，成功分得~ts钻石奖励，太令人羡慕啦{"
                                                             "face_1,29}"),
                                                    [{role_2, Name},
                                                     {string_2, 5, GainGold}]),
                                  notice:cast(all, 8, Msg),
                                  R1 = R#camp_rushing_top_role{final_times =
                                                                   OldTime + 1},
                                  [R1 | Acc];
                              (_, Acc) -> Acc
                          end,
                          [],
                          AllList),
    save_rush_role(NewList),
    LenRoles = length(NewList),
    NewFinalRoles = case LenRoles < MinBarrage of
                        true ->
                            AddList = lists:seq(LenRoles, MinBarrage),
                            NewList ++ AddList;
                        _ -> ok
                    end,
    set_timer(5, {send_reward_barrage, NewFinalRoles}),
    NewState = State#state{gain_gold = GainGold},
    notice:effect(all, 30220),
    Msg6 =
        notice:format(lang:get("本轮~ts已结束，恭喜~ts名参赛者（本服~ts名）答对~ts题冲顶成功，平分~ts钻石大"
                               "奖，可喜可贺{face_1,18}"),
                      [{string_2, 1, lang:get("冲顶答题")},
                       {string_2, 5, FinalNum},
                       {string_2, 5, length(NewList)},
                       {string_2, 5, TotalIndex},
                       {string_2, 5, GainGold}]),
    notice:cast(all, 8, Msg6),
    notice:cast(all, 11, Msg6),
    BarrageMsg =
        util:flist(lang:get("本轮冲顶答题已结束，恭喜~ts名参赛者（本服~ts名）答对12题冲顶成功，平分~ts钻石大"
                            "奖，可喜可贺"),
                   [integer_to_list(FinalNum),
                    integer_to_list(length(NewList)),
                    integer_to_list(GainGold)]),
    send_barrage(AnswerMapInfo, 1, BarrageMsg),
    {noreply, NewState};
handle_cast({re_login, Rid},
            State = #state{group_id = GroupID, index = Index,
                           stop_answer = StopTime, cur_state = StateCode}) ->
    case get_season_info() of
        #camp_rushing_top_season_info{final_num = FinalNum} ->
            NQ = case camp_rushing_top_data:get_question({GroupID,
                                                          Index})
                     of
                     Q = #camp_rushing_top_question_base{} -> Q;
                     _ -> #camp_rushing_top_question_base{}
                 end,
            Option = case get_rush_role(Rid) of
                         {ok, #camp_rushing_top_role{option = Op}} -> Op;
                         _ -> 0
                     end,
            NewFinalNum = case StateCode of
                              4 -> FinalNum;
                              _ -> 0
                          end,
            Data = {NQ,
                    StopTime,
                    NewFinalNum,
                    NQ#camp_rushing_top_question_base.answer,
                    Option},
            role:pack_send(Rid, 20433, Data);
        _ -> ok
    end,
    {noreply, State};
handle_cast({zone_barrage_msg, BarrageMsg},
            State = #state{cur_state = StateCode}) ->
    Result = case StateCode of
                 3 -> 1;
                 4 -> 1;
                 5 -> 1;
                 _ -> 0
             end,
    case Result of
        1 ->
            NewList = case get(zone_barrage_msg) of
                          List when is_list(List) -> List ++ BarrageMsg;
                          _ -> BarrageMsg
                      end,
            put(zone_barrage_msg, NewList);
        _ -> ok
    end,
    {noreply, State};
handle_cast(_Request, State) -> {noreply, State}.

handle_info(request_season_info, State) ->
    {Times, OldRef} = case get(request_season_info_ref) of
                          {T, ORef} -> {T, ORef};
                          _ -> {0, udefind}
                      end,
    stop_timer(OldRef),
    case get_season_info() of
        #camp_rushing_top_season_info{} -> ok;
        _ ->
            case Times < 30 of
                true ->
                    P = env:get(platform),
                    Z = env:get(zone_id),
                    big_world:cast(c_camp_rushing_top,
                                   cast,
                                   [{request_season_info, P, Z}]),
                    put(request_season_info_ref,
                        {Times + 1, set_timer(10, request_season_info)});
                _ -> ok
            end
    end,
    {noreply, State};
handle_info(add_exp,
            State = #state{cur_state = StateCode, exp_ref = OldRef,
                           answer_map_info = AMapInfo,
                           ready_map_info = RMapInfo}) ->
    stop_timer(OldRef),
    NewRef = case StateCode of
                 _ when StateCode > 2 -> set_timer(30, add_exp);
                 _ -> undefind
             end,
    MapInfo = case StateCode of
                  3 -> RMapInfo;
                  4 -> AMapInfo;
                  _ -> {0, undefind}
              end,
    case MapInfo of
        {_MapID, MapPid} when is_pid(MapPid) ->
            map:async_apply(MapPid,
                            {camp_rushing_top, role_callback, [add_exp]}),
            ok;
        _ERR -> ok
    end,
    NewState = State#state{exp_ref = NewRef},
    {noreply, NewState};
handle_info(push_rush_notice,
            State = #state{answer_map_info = MapInfo,
                           group_id = GroupID, index = Index}) ->
    Times = case get(push_zone_info) of
                undefind -> {0, undefind};
                {T, OldRef} when is_reference(OldRef) ->
                    erlang:cancel_timer(OldRef),
                    T;
                _ -> 0
            end,
    State1 = State#state{answer_state = 0},
    NewState = case get_season_info() of
                   Info = #camp_rushing_top_season_info{} ->
                       case big_world:call(c_camp_rushing_top,
                                           call,
                                           [{push_zone_info, Info}])
                           of
                           ok -> State1#state{is_push = 1};
                           _ ->
                               case Times < 30 of
                                   true ->
                                       Ref = erlang:send_after(1 * 60 * 100,
                                                               self(),
                                                               push_rush_notice),
                                       put(push_zone_info, {Times + 1, Ref}),
                                       ok;
                                   _ ->
                                       logger:error("冲顶答题平台：~w, 区服：~w推送中央服数据出错",
                                                    [env:get(platform),
                                                     env:get(zone_id)],
                                                    camp_rushing_top,
                                                    740),
                                       ok
                               end,
                               State1
                       end;
                   _ -> State1
               end,
    #camp_rushing_top_season_info{total_index = TotalIndex,
                                  season_id = SeasonID} =
        get_season_info(),
    LostRoles = ets:foldl(fun (R =
                                   #camp_rushing_top_role{is_sign = 1,
                                                          name = Name,
                                                          is_lost = IsLost,
                                                          option = Option,
                                                          index = RIndex},
                               Acc)
                                  when RIndex + 1 =:= Index ->
                                  case IsLost =:= 1 andalso Option > 0 orelse
                                           IsLost =:= 0 andalso Option =:= 0
                                      of
                                      true ->
                                          NR = R#camp_rushing_top_role{is_lost =
                                                                           1},
                                          BarrageMsg = case util:rand(1, 3) of
                                                           1 ->
                                                               util:flist(lang:get("~ts对这题自信满满，却不料手抖选错答案（づ￣3￣）づ～"),
                                                                          [Name]);
                                                           2 ->
                                                               util:flist(lang:get("~ts听信了弹幕的错误答案，仰天长叹好气啊T_T"),
                                                                          [Name]);
                                                           _ ->
                                                               util:flist(lang:get("~ts左顾右盼，最后几秒才匆忙作答，不慎选错答案（＝。＝）"),
                                                                          [Name])
                                                       end,
                                          send_barrage(MapInfo, 1, BarrageMsg),
                                          [NR | Acc];
                                      _ -> Acc
                                  end;
                              (_, Acc) -> Acc
                          end,
                          [],
                          camp_rushing_top_role),
    save_rush_role(LostRoles),
    case camp_rushing_top_data:get_question({GroupID,
                                             Index})
        of
        #camp_rushing_top_question_base{answer = Answer} ->
            case MapInfo of
                {_MapID, MapPid} when is_pid(MapPid) ->
                    map:async_apply(MapPid,
                                    {camp_rushing_top,
                                     role_callback,
                                     [{role_answer, Index, Answer}]}),
                    ok;
                _ERR ->
                    logger:error("冲顶答题地图场景出错:~w",
                                 [_ERR],
                                 camp_rushing_top,
                                 786),
                    ok
            end;
        _ -> ok
    end,
    case Index =:= TotalIndex of
        true ->
            MaxRevive = get_config(max_revive),
            Content =
                notice:format(lang:get("本场比赛中您答对了~ts题，获得了以下奖励。温馨提示：每场比赛可以使用~ts张复活卡，复活"
                                       "卡可通过赠送他人入场券获得，祝您下次冲顶成功！"),
                              [{string_2, 5, Index - 1},
                               {string_2, 5, MaxRevive}]),
            lists:foreach(fun (#camp_rushing_top_role{rid = Rid,
                                                      name = Name}) ->
                                  LostRewards = case
                                                    camp_rushing_top_data:get_lost_reward({SeasonID,
                                                                                           Index})
                                                    of
                                                    {SeasonID, _, Reward}
                                                        when length(Reward) >
                                                                 0 ->
                                                        Reward;
                                                    _ERR1 ->
                                                        logger:error("camp_rushing_top_data冲顶答题配置失败奖励错误：~w",
                                                                     [_ERR1],
                                                                     camp_rushing_top,
                                                                     805),
                                                        []
                                                end,
                                  mail:send(Rid,
                                            #{title => lang:get("冲顶答题结算奖励"),
                                              content => Content,
                                              items => LostRewards}),
                                  Msg =
                                      notice:format(lang:get("本服~ts在登顶答题中只差一步就可以领取奖金，出色的表现仍然获得了~ts，可喜可贺{fac"
                                                             "e_1,18}"),
                                                    [{role_2, Name},
                                                     {item_2, LostRewards}]),
                                  notice:cast(all, 8, Msg)
                          end,
                          LostRoles);
        _ -> ok
    end,
    {noreply, NewState};
handle_info({send_reward_barrage, [RushRole | TRoles]},
            State = #state{barrage_ref = OldRef,
                           answer_map_info = MapInfo, gain_gold = GainGold,
                           cur_state = StateCode}) ->
    stop_timer(OldRef),
    NewState = case StateCode of
                   5 ->
                       case RushRole of
                           #camp_rushing_top_role{name = Name} ->
                               Msg =
                                   util:flist(lang:get("恭喜本服~ts强势冲顶，才思敏捷的TA获得~ts钻石"),
                                              [Name,
                                               integer_to_list(GainGold)]),
                               send_barrage(MapInfo, 1, Msg);
                           _ -> ok
                       end,
                       NewTRushRoles = lists:reverse([RushRole
                                                      | lists:reverse(TRoles)]),
                       NewRef = set_timer(5,
                                          {send_reward_barrage, NewTRushRoles}),
                       State#state{barrage_ref = NewRef};
                   _ -> State#state{barrage_ref = undefind}
               end,
    {noreply, NewState};
handle_info({notice_msg, Msg}, State) ->
    notice:cast(all, 8, Msg),
    {noreply, State};
handle_info(send_center_barrage, State) ->
    RTime = util:rand(7, 15),
    OldRef = get(send_center_barrage_ref),
    stop_timer(OldRef),
    NewRef = set_timer(RTime, send_center_barrage),
    put(send_center_barrage_ref, NewRef),
    case get(barrage_msg) of
        List = [_ | _] ->
            NewList = lists:sublist(List, 50),
            big_world:cast(c_camp_rushing_top,
                           cast,
                           [{send_barrage_msg, NewList}]),
            put(barrage_msg, []),
            ok;
        _ -> ok
    end,
    {noreply, State};
handle_info(notic_zone_barrage,
            State = #state{cur_state = StateCode,
                           answer_map_info = AMapInfo,
                           ready_map_info = RMapInfo}) ->
    OldRef = get(notic_zone_barrage_ref),
    stop_timer(OldRef),
    NewRef = set_timer(1, notic_zone_barrage),
    put(notic_zone_barrage_ref, NewRef),
    MapInfo = case StateCode of
                  3 -> RMapInfo;
                  4 -> AMapInfo;
                  _ -> udefind
              end,
    case get(zone_barrage_msg) of
        [Msg | T] when is_pid(MapInfo) ->
            send_barrage(MapInfo, 2, Msg),
            put(zone_barrage_msg, T);
        _ ->
            put(zone_barrage_msg, []),
            ok
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

login(Role = #role{s_event = Event}) ->
    case Event =:= 61 orelse Event =:= 62 of
        true ->
            {ok, #camp_rushing_top_role{is_sign = IsSign}} =
                get_rush_role(Role),
            case IsSign of
                1 ->
                    case enter_map(Role) of
                        {ok, NewRole} -> {ok, NewRole};
                        _ERR ->
                            logger:error("登录进入冲顶答题场景失败~w",
                                         [_ERR],
                                         camp_rushing_top,
                                         908),
                            case leave_map(Role) of
                                {ok, Role1} -> {ok, Role1};
                                _ -> {ok, Role#role{s_event = 0}}
                            end
                    end;
                _ ->
                    case leave_map(Role) of
                        {ok, Role1} -> {ok, Role1};
                        _ERR ->
                            logger:error("登录离开冲顶答题场景失败~w",
                                         [_ERR],
                                         camp_rushing_top,
                                         921),
                            {ok, Role#role{s_event = 0}}
                    end
            end;
        _ -> ok
    end.

push_config(#role{id = Rid}) ->
    case get_season_info() of
        #camp_rushing_top_season_info{gold = Gold} ->
            case camp_rushing_top_data:get_etc_config() of
                [CfgMaps = #{}] ->
                    GoldBaseID = maps:get(gold_id, CfgMaps),
                    Ticket = maps:get(ticket, CfgMaps),
                    Revive = maps:get(revive, CfgMaps),
                    MinLev = maps:get(min_lev, CfgMaps),
                    Rude = maps:get(rule, CfgMaps),
                    Info = maps:get(info, CfgMaps),
                    QuestionTime = maps:get(question_time, CfgMaps),
                    AnswerTime = maps:get(answer_time, CfgMaps),
                    NoticeTime = maps:get(notice_time, CfgMaps),
                    MaxRevive = maps:get(max_revive, CfgMaps),
                    FirstTime = maps:get(first_time, CfgMaps),
                    Data = {[{GoldBaseID, Gold}],
                            Ticket,
                            Revive,
                            MinLev,
                            Rude,
                            Info,
                            QuestionTime,
                            AnswerTime,
                            NoticeTime,
                            MaxRevive,
                            FirstTime},
                    role:pack_send(Rid, 20421, Data);
                _ ->
                    logger:error("camp_rushing_top_data配置表错误",
                                 [],
                                 camp_rushing_top,
                                 948),
                    ok
            end;
        _ -> ok
    end.

push_state(#role{id = Rid}) ->
    cast({push_state, Rid}),
    ok.

push_rush_role(Role = #role{}) ->
    case get_rush_role(Role) of
        {ok, RushRole = #camp_rushing_top_role{}} ->
            push_rush_role(RushRole);
        _ -> ok
    end;
push_rush_role(#camp_rushing_top_role{in_map = InMap,
                                      index = Index, is_lost = IsLost,
                                      rid = Rid, is_sign = IsSign,
                                      revive_times = ReviveTimes,
                                      sys_barrage = SysBarrage,
                                      ply_barrage = PlyBarrage,
                                      barrage_time = BarrageTime,
                                      final_times = FinalTimes,
                                      sign_times = SignTimes}) ->
    Data = {IsSign,
            ReviveTimes,
            SysBarrage,
            PlyBarrage,
            BarrageTime,
            FinalTimes,
            SignTimes,
            IsLost,
            InMap,
            Index},
    role:pack_send(Rid, 20429, Data);
push_rush_role(Rid) ->
    case get_rush_role(Rid) of
        {ok, RushRole = #camp_rushing_top_role{}} ->
            push_rush_role(RushRole);
        _ -> ok
    end.

re_login(#role{id = Rid}) -> cast({re_login, Rid}).

sign(Role = #role{name = Name, lev = Lev,
                  classes = Classes}) ->
    case check_sign(Role, [check_sign, lev]) of
        {ok, Rtn} ->
            StateCode = case lists:keyfind(check_sign, 1, Rtn) of
                            {check_sign, SC} -> SC;
                            _ -> 1
                        end,
            Cost = get_config(ticket),
            Loss = format:val_to_loss(Cost),
            role:send_buff_begin(),
            case role_gain:do_notice(Loss, Role) of
                {ok, Role1} ->
                    {ok, RushRole} = get_rush_role(Role1),
                    case RushRole of
                        #camp_rushing_top_role{is_sign = 0} ->
                            role:send_buff_flush(),
                            case StateCode =:= 3 of
                                true ->
                                    case check_enter([cross, team, lev], Role1)
                                        of
                                        ok ->
                                            case call(enter_map) of
                                                {ok, ToPos} ->
                                                    Role2 = Role1#role{s_event =
                                                                           61},
                                                    case map:role_enter(ToPos,
                                                                        Role2)
                                                        of
                                                        {error, Reason} ->
                                                            NewRushRole1 =
                                                                RushRole#camp_rushing_top_role{name
                                                                                                   =
                                                                                                   Name,
                                                                                               lev
                                                                                                   =
                                                                                                   Lev,
                                                                                               classes
                                                                                                   =
                                                                                                   Classes,
                                                                                               is_sign
                                                                                                   =
                                                                                                   1,
                                                                                               in_map
                                                                                                   =
                                                                                                   0},
                                                            cast({add_rush_role,
                                                                  NewRushRole1}),
                                                            push_rush_role(NewRushRole1),
                                                            logger:error("进入冲顶答题副本失败:~ts",
                                                                         [Reason],
                                                                         camp_rushing_top,
                                                                         1009),
                                                            Msg1 =
                                                                lang:get("报名成功，请及时进入准备场景准备答题{face_1,3}"),
                                                            {ok, Role2, Msg1};
                                                        {ok, Role3} ->
                                                            NewRushRole2 =
                                                                RushRole#camp_rushing_top_role{name
                                                                                                   =
                                                                                                   Name,
                                                                                               lev
                                                                                                   =
                                                                                                   Lev,
                                                                                               classes
                                                                                                   =
                                                                                                   Classes,
                                                                                               is_sign
                                                                                                   =
                                                                                                   1,
                                                                                               in_map
                                                                                                   =
                                                                                                   1},
                                                            cast({add_rush_role,
                                                                  NewRushRole2}),
                                                            push_rush_role(NewRushRole2),
                                                            Msg2 =
                                                                lang:get("报名成功，祝您拔得头筹{face_1,3}"),
                                                            {ok, Role3, Msg2};
                                                        _ERR ->
                                                            NewRushRole3 =
                                                                RushRole#camp_rushing_top_role{name
                                                                                                   =
                                                                                                   Name,
                                                                                               lev
                                                                                                   =
                                                                                                   Lev,
                                                                                               classes
                                                                                                   =
                                                                                                   Classes,
                                                                                               is_sign
                                                                                                   =
                                                                                                   1,
                                                                                               in_map
                                                                                                   =
                                                                                                   0},
                                                            cast({add_rush_role,
                                                                  NewRushRole3}),
                                                            push_rush_role(NewRushRole3),
                                                            logger:error("进入冲顶答题副本失败:~ts",
                                                                         [_ERR],
                                                                         camp_rushing_top,
                                                                         1022),
                                                            Msg3 =
                                                                lang:get("报名成功，请及时进入准备场景准备答题{face_1,3}"),
                                                            {ok, Role2, Msg3}
                                                    end;
                                                _ERR ->
                                                    NewRushRole4 =
                                                        RushRole#camp_rushing_top_role{name
                                                                                           =
                                                                                           Name,
                                                                                       lev
                                                                                           =
                                                                                           Lev,
                                                                                       classes
                                                                                           =
                                                                                           Classes,
                                                                                       is_sign
                                                                                           =
                                                                                           1,
                                                                                       in_map
                                                                                           =
                                                                                           0},
                                                    cast({add_rush_role,
                                                          NewRushRole4}),
                                                    push_rush_role(NewRushRole4),
                                                    logger:error("进入冲顶答题副本失败:~ts",
                                                                 [_ERR],
                                                                 camp_rushing_top,
                                                                 1030),
                                                    Msg4 =
                                                        lang:get("报名成功，请及时进入准备场景准备答题{face_1,3}"),
                                                    {ok, Role1, Msg4}
                                            end;
                                        _ERR ->
                                            NewRushRole5 =
                                                RushRole#camp_rushing_top_role{name
                                                                                   =
                                                                                   Name,
                                                                               lev
                                                                                   =
                                                                                   Lev,
                                                                               classes
                                                                                   =
                                                                                   Classes,
                                                                               is_sign
                                                                                   =
                                                                                   1,
                                                                               in_map
                                                                                   =
                                                                                   0},
                                            cast({add_rush_role, NewRushRole5}),
                                            push_rush_role(NewRushRole5),
                                            Msg5 =
                                                lang:get("报名成功，请及时进入准备场景准备答题{face_1,3}"),
                                            logger:info("报名成功未进入场景：~w",
                                                        [_ERR],
                                                        camp_rushing_top,
                                                        1039),
                                            {ok, Role1, Msg5}
                                    end;
                                _ ->
                                    NewRushRole5 =
                                        RushRole#camp_rushing_top_role{name =
                                                                           Name,
                                                                       is_sign =
                                                                           1},
                                    cast({add_rush_role, NewRushRole5}),
                                    push_rush_role(NewRushRole5),
                                    Msg = lang:get("报名成功，要记得准时参加喔{face_1,3}"),
                                    {ok, Role1, Msg}
                            end;
                        _ ->
                            role:send_buff_clean(),
                            {false, lang:get("已经报名，无需再报名")}
                    end;
                {false, #loss{msg = Msg}} ->
                    role:send_buff_clean(),
                    {false, Msg};
                _ ->
                    role:send_buff_clean(),
                    {false, lang:get("报名失败")}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("报名失败，请稍后重试")}
    end.

enter_map(Role = #role{pos =
                           #pos{map = MapId, x = X, y = Y,
                                platform = OldPlatform,
                                zone_id = OldZoneId}}) ->
    case check_enter([cross, team, lev], Role) of
        ok ->
            case get_rush_role(Role) of
                {ok, RushRole} ->
                    case call(enter_map) of
                        {ok, ToPos} ->
                            Role1 = Role#role{s_event = 61},
                            case map:role_enter(ToPos, Role1) of
                                {error, Reason} ->
                                    logger:error("进入冲顶答题副本失败:~ts",
                                                 [Reason],
                                                 camp_rushing_top,
                                                 1077),
                                    {false, lang:get("进入冲顶答题副本失败")};
                                {ok, Role2 = #role{pos = Pos}} ->
                                    Last = #pos_history{map = MapId, x = X,
                                                        y = Y,
                                                        platform = OldPlatform,
                                                        zone_id = OldZoneId},
                                    NewRole = Role2#role{pos =
                                                             Pos#pos{last =
                                                                         Last}},
                                    NewRushRole =
                                        RushRole#camp_rushing_top_role{in_map =
                                                                           1},
                                    cast({save_without_center, NewRushRole}),
                                    push_rush_role(NewRushRole),
                                    {ok, NewRole};
                                _ -> {false, lang:get("进入冲顶答题副本失败")}
                            end;
                        {false, Msg} -> {false, Msg};
                        _ -> {false, lang:get("进入冲顶答题地图失败")}
                    end;
                _ -> {false, lang:get("进入答题场景失败，请稍后再试")}
            end;
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("进入冲顶答题地图失败，请稍后再试")}
    end.

leave_map(Role = #role{id = Rid, pos = Pos}) ->
    ToPos = get_leave_pos(Pos),
    case map:role_enter(ToPos, Role#role{s_event = 0}) of
        {ok, NewRole} ->
            case get_rush_role(Rid) of
                {ok, R = #camp_rushing_top_role{rid = Rid}} ->
                    NR = R#camp_rushing_top_role{in_map = 0},
                    cast({save_without_center, NR}),
                    ok;
                _ -> ok
            end,
            {ok, NewRole};
        _ ->
            case map:role_enter(util:rand_list([{10001, 306, 3507},
                                                {10001, 2583, 3848},
                                                {10001, 4957, 3680},
                                                {10001, 445, 2565},
                                                {10001, 4646, 704},
                                                {10001, 841, 1033},
                                                {10001, 2098, 1834},
                                                {10001, 3617, 1816}]),
                                Role#role{s_event = 0})
                of
                {error, Reason} ->
                    logger:error("退出冲顶答题副本时出错:~w",
                                 [Reason],
                                 camp_rushing_top,
                                 1122),
                    {false, lang:get("退出失败")};
                {ok, NewRole} -> {ok, NewRole}
            end
    end;
leave_map(Role) -> {ok, Role}.

get_leave_pos(_) ->
    util:rand_list([{10001, 306, 3507},
                    {10001, 2583, 3848},
                    {10001, 4957, 3680},
                    {10001, 445, 2565},
                    {10001, 4646, 704},
                    {10001, 841, 1033},
                    {10001, 2098, 1834},
                    {10001, 3617, 1816}]).

answer(Role = #role{id = Rid}, CurIndex, Option) ->
    case get_rush_role(Rid) of
        {ok,
         RushRole = #camp_rushing_top_role{is_sign = 1,
                                           index = RoleIndex,
                                           is_lost = IsLost}} ->
            case check_answer(Role,
                              [{index, RoleIndex, CurIndex}, {is_lost, IsLost}])
                of
                {ok, _Rtn} ->
                    case call({add_answer, Rid, CurIndex, Option}) of
                        {ok, Answer} ->
                            NewIsLost = case Answer =/= Option of
                                            true -> 1;
                                            _ -> 0
                                        end,
                            NewRushRole = RushRole#camp_rushing_top_role{is_lost
                                                                             =
                                                                             NewIsLost,
                                                                         option
                                                                             =
                                                                             Option},
                            cast({save_without_center, NewRushRole}),
                            ok;
                        {false, Msg} -> {false, Msg};
                        _ -> {false, lang:get("作答服务器超时，请重试")}
                    end;
                {false, Msg} -> {false, Msg};
                _ -> {false, lang:get("作答失败，请重试")}
            end;
        _ -> {false, lang:get("尚未报名，不能作答")}
    end.

revive(Role = #role{id = Rid}) ->
    case get_rush_role(Rid) of
        {ok,
         RushRole = #camp_rushing_top_role{is_sign = 1,
                                           is_lost = IsLost, index = RoleIndex,
                                           revive_times = ReviveTimes}} ->
            case check_revive([{is_lost, IsLost},
                               {revive_times, ReviveTimes}],
                              Role,
                              [])
                of
                {ok, _Rtn} ->
                    case call({revive, RoleIndex}) of
                        ok ->
                            Cost = get_config(revive),
                            case is_list(Cost) andalso length(Cost) > 0 of
                                true ->
                                    Loss = format:val_to_loss(Cost),
                                    role:send_buff_begin(),
                                    case role_gain:do_notice(Loss,
                                                             Role,
                                                             lang:get("冲顶答题复活"))
                                        of
                                        {ok, Role1} ->
                                            role:send_buff_flush(),
                                            NewRushRole =
                                                RushRole#camp_rushing_top_role{is_lost
                                                                                   =
                                                                                   0,
                                                                               revive_times
                                                                                   =
                                                                                   ReviveTimes
                                                                                       +
                                                                                       1},
                                            cast({save_without_center,
                                                  NewRushRole}),
                                            push_rush_role(NewRushRole),
                                            NewRole = Role1#role{s_event = 62},
                                            map:role_update(NewRole),
                                            {ok, NewRole};
                                        {false, #loss{msg = Msg}} ->
                                            role:send_buff_clean(),
                                            {false, Msg};
                                        _ ->
                                            role:send_buff_clean(),
                                            {false, lang:get("冲顶答题复活卡不足")}
                                    end;
                                _ -> {false, lang:get("冲顶答题复活系统错误")}
                            end;
                        {false, Msg} -> {false, Msg};
                        _ -> {false, lang:get("服务器超时，复活失败")}
                    end;
                {false, Msg} -> {false, Msg};
                _ -> {false, lang:get("复活失败")}
            end;
        _ -> {false, lang:get("尚未参加活动，不能使用复活")}
    end.

send_barrage(#role{id = Rid}, Msg) ->
    case util:text_banned(Msg) of
        true -> {false, lang:get("内容中有禁用词语")};
        _ ->
            case get_rush_role(Rid) of
                {ok, #camp_rushing_top_role{in_map = 0}} ->
                    {false, lang:get("您不在答题场景中，不能发送弹幕")};
                {ok,
                 #camp_rushing_top_role{barrage_time = BarrageTime}} ->
                    case date:unixtime() < BarrageTime of
                        true -> {false, lang:get("坐下来喝杯茶，一会再发送弹幕弹幕吧")};
                        _ ->
                            cast({send_barrage, Rid, Msg}),
                            ok
                    end;
                _ -> {false, lang:get("您不在答题场景中，不能发送弹幕")}
            end
    end.

send_barrage(MapInfo, Type, Msg) ->
    case MapInfo of
        {_MapID, MapPid} when is_pid(MapPid) ->
            map:async_apply(MapPid,
                            {camp_rushing_top,
                             role_callback,
                             [{send_barrage, Type, Msg}]}),
            ok;
        _ERR ->
            logger:error("冲顶答题地图场景出错:~w",
                         [_ERR],
                         camp_rushing_top,
                         1241),
            ok
    end.

set_barrage(#role{id = Rid}, 1, Value) ->
    case get_rush_role(Rid) of
        {ok, RushRole = #camp_rushing_top_role{}} ->
            NewRushRole = RushRole#camp_rushing_top_role{sys_barrage
                                                             = Value},
            cast({save_without_center, NewRushRole}),
            push_rush_role(NewRushRole),
            ok;
        _ -> {false, lang:get("设置系统弹幕失败")}
    end;
set_barrage(#role{id = Rid}, 2, Value) ->
    case get_rush_role(Rid) of
        {ok, RushRole = #camp_rushing_top_role{}} ->
            NewRushRole = RushRole#camp_rushing_top_role{ply_barrage
                                                             = Value},
            cast({save_without_center, NewRushRole}),
            push_rush_role(NewRushRole),
            ok;
        _ -> {false, lang:get("设置个人弹幕失败")}
    end.

check_revive([], _Role, Rtn) -> {ok, Rtn};
check_revive([{is_lost, IsLost} | T], Role, Rtn) ->
    case IsLost of
        1 -> check_revive(T, Role, Rtn);
        _ -> {fasle, lang:get("暂未出局，无需复活")}
    end;
check_revive([{revive_times, ReviveTimes} | T], Role,
             Rtn) ->
    MaxRiveTime = get_config(max_revive),
    case ReviveTimes < MaxRiveTime of
        true -> check_revive(T, Role, Rtn);
        _ -> {fasle, lang:get("已达最大复活次数，不能再次复活")}
    end.

check_sign(Role, Con) -> check_sign(Role, Con, []).

check_sign(_Role, [], Rtn) -> {ok, Rtn};
check_sign(Role = #role{id = Rid}, [check_sign | T],
           Rtn) ->
    case call({check_sign, Rid}) of
        {ok, StateCode} ->
            NRtn = [{check_sign, StateCode} | Rtn],
            check_sign(Role, T, NRtn);
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("当前服务器繁忙，请稍后重试")}
    end;
check_sign(Role = #role{m_team = #m_team{pid = Pid}},
           [team | T], Rtn) ->
    case is_pid(Pid) of
        true -> {false, lang:get("组队状态中不能报名{face_1,2}")};
        _ -> check_sign(Role, T, Rtn)
    end;
check_sign(Role = #role{lev = Lev}, [lev | T], Rtn) ->
    MinLev = get_config(min_lev),
    case MinLev =< Lev of
        true -> check_sign(Role, T, Rtn);
        _ ->
            {false,
             notice:format(lang:get("等级不足~ts，不能报名"),
                           [{string_2, 5, MinLev}])}
    end.

check_answer(Role, Con) -> check_answer(Role, Con, []).

check_answer(_Role, [], Rtn) -> {ok, Rtn};
check_answer(Role, [{is_lost, IsLost} | T], Rtn) ->
    case IsLost of
        1 -> {false, lang:get("您已出局，不能作答")};
        _ -> check_answer(Role, T, Rtn)
    end;
check_answer(Role, [{index, RoleIndex, CurIndex} | T],
             Rtn) ->
    case RoleIndex + 1 =/= CurIndex of
        true ->
            logger:info("作答题目出错", [], camp_rushing_top, 1332),
            {false, lang:get("作答题目出错")};
        _ -> check_answer(Role, T, Rtn)
    end.

role_callback(#role{id = Rid},
              {role_answer, Index, Answer}) ->
    case get_rush_role(Rid) of
        {ok,
         RushRole = #camp_rushing_top_role{option = Option}} ->
            Data = {Index, Option, Answer},
            role:pack_send(Rid, 20432, Data),
            push_rush_role(RushRole);
        _ -> ok
    end,
    ok;
role_callback(#role{id = Rid},
              {push_rush_question, GroupID, Index, StopTime}) ->
    case camp_rushing_top_data:get_question({GroupID,
                                             Index})
        of
        Question = #camp_rushing_top_question_base{} ->
            RolesNum = case get_season_info() of
                           #camp_rushing_top_season_info{final_num =
                                                             FinalNum} ->
                               FinalNum;
                           _ -> 0
                       end,
            Data = {Question, StopTime, RolesNum},
            role:pack_send(Rid, 20425, Data),
            ok;
        _ -> ok
    end;
role_callback(#role{id = Rid},
              {send_barrage, Type, Msg}) ->
    IsSend = case Type of
                 1 ->
                     case get_rush_role(Rid) of
                         {ok, #camp_rushing_top_role{sys_barrage = 1}} -> 1;
                         _ -> 0
                     end;
                 2 ->
                     case get_rush_role(Rid) of
                         {ok, #camp_rushing_top_role{ply_barrage = 1}} -> 1;
                         _ -> 0
                     end;
                 _ -> 0
             end,
    case IsSend of
        1 ->
            role:pack_send(Rid, 20430, {1, Msg}),
            ok;
        _ -> ok
    end;
role_callback(Role = #role{lev = Lev}, add_exp) ->
    Rewards = warrior_data:ready_reward(Lev),
    case role_gain:do_notice(Rewards, Role) of
        Rtn = {ok, _} -> Rtn;
        _False -> ok
    end;
role_callback(Role = #role{}, leave) ->
    case leave_map(Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, _Msg} -> ok;
        _ -> ok
    end;
role_callback(Role = #role{},
              {answer_enter_map, AMapID}) ->
    {TransX, TransY} = case map_data:get(53013) of
                           {ok, #map_data{revive = _Revive}} ->
                               case map:rand_pos(53013) of
                                   {DefineX, DefineY} -> {DefineX, DefineY};
                                   _ ->
                                       util:rand_list([{919, 839},
                                                       {640, 1400},
                                                       {880, 2000},
                                                       {2047, 947},
                                                       {3200, 1960},
                                                       {3480, 1400},
                                                       {3240, 800},
                                                       {2047, 1803}])
                               end;
                           _ -> {919, 839}
                       end,
    ToPos = {AMapID, TransX, TransY},
    case map:role_enter(ToPos, Role) of
        {error, Reason} ->
            logger:error("进入冲顶答题副本失败:~ts",
                         [Reason],
                         camp_rushing_top,
                         1429),
            ok;
        {ok, NewRole} -> {ok, NewRole};
        _ -> ok
    end;
role_callback(Role = #role{id = Rid},
              {push_rush_answer, Data}) ->
    case get_rush_role(Rid) of
        {ok,
         #camp_rushing_top_role{is_sign = 1, is_lost = 0,
                                option = Option}} ->
            {Index, OptionA, OptionB, OptionC, Answer, LastNum} =
                Data,
            NewData = {Index,
                       OptionA,
                       OptionB,
                       OptionC,
                       Answer,
                       Option,
                       LastNum},
            role:pack_send(Rid, 20427, NewData),
            NewRole = Role#role{s_event = 62},
            map:role_update(NewRole),
            {ok, NewRole};
        {ok,
         #camp_rushing_top_role{option = Option,
                                index = RIndex}} ->
            {Index, OptionA, OptionB, OptionC, Answer, LastNum} =
                Data,
            NewOption = case Index =:= RIndex + 1 of
                            true -> Option;
                            _ -> 0
                        end,
            NewData = {Index,
                       OptionA,
                       OptionB,
                       OptionC,
                       Answer,
                       NewOption,
                       LastNum},
            role:pack_send(Rid, 20427, NewData),
            NewRole = Role#role{s_event = 61},
            map:role_update(NewRole),
            {ok, NewRole};
        _ -> ok
    end;
role_callback(_Role, clean_sign) ->
    role:send_buff_clean(20423),
    ok;
role_callback(Role, {fire_final_times, FinalTimes}) ->
    {ok,
     role_trigger:fire(#evt_rushing_top_final_times{final_times
                                                        = FinalTimes},
                       Role)}.

get_season_info() ->
    case catch ets:lookup(camp_rushing_top_season_info,
                          camp_rushing_top_season_info)
        of
        [SeasonInfo = #camp_rushing_top_season_info{}] ->
            SeasonInfo;
        _ -> {false, not_init}
    end.

save_season_info(Data) ->
    ets:insert(camp_rushing_top_season_info, Data),
    ok.

get_rush_role(Role = #role{id = Rid}) ->
    case get_rush_role(Rid) of
        {ok, R} -> {ok, R};
        _ -> get_new_rush_role(Role)
    end;
get_rush_role(Rid) ->
    case catch ets:lookup(camp_rushing_top_role, Rid) of
        [#camp_rushing_top_role{} = R] -> {ok, R};
        _ -> {false, not_found}
    end.

get_new_rush_role(#role{id = Rid, name = Name,
                        lev = Lev, sex = Sex, classes = Classes}) ->
    RushRole = #camp_rushing_top_role{rid = Rid,
                                      name = Name, lev = Lev, sex = Sex,
                                      classes = Classes},
    {ok, RushRole}.

save_rush_role(Data) ->
    ets:insert(camp_rushing_top_role, Data),
    dets:insert(camp_rushing_top_role, Data),
    ok.

set_timer(Time, InfoMsg) ->
    NewTIme = max(0, Time),
    erlang:send_after(NewTIme * 1000, self(), InfoMsg).

stop_timer(OldRef) when is_reference(OldRef) ->
    erlang:cancel_timer(OldRef);
stop_timer(_) -> ok.

get_config(Cfg) when is_atom(Cfg) ->
    [CfgValue] = get_etc_config(Cfg),
    CfgValue;
get_config(Cfg) -> Cfg.

get_etc_config(Cfg) when is_atom(Cfg) ->
    get_etc_config([Cfg]);
get_etc_config(Cfgs) when is_list(Cfgs) ->
    case camp_rushing_top_data:get_etc_config() of
        [CfgMap = #{}] -> get_etc_config(Cfgs, CfgMap, []);
        _ -> []
    end.

get_etc_config([], _CfgMap, Acc) -> lists:reverse(Acc);
get_etc_config([Cfg | T], CfgMap, Acc) ->
    Result = maps:get(Cfg, CfgMap, undefind),
    NewAcc = case Result of
                 undefind -> Acc;
                 _ -> [Result | Acc]
             end,
    get_etc_config(T, CfgMap, NewAcc).

check_enter([], _) -> ok;
check_enter([lev | T], Role = #role{lev = Lev}) ->
    MinLev = get_config(min_lev),
    case MinLev =< Lev of
        true -> check_enter(T, Role);
        _ ->
            {false,
             notice:format(lang:get("等级≥~ts才能参加活动"),
                           [{string_2, 5, MinLev}])}
    end;
check_enter([team | T],
            Role = #role{m_team = #m_team{pid = Pid}}) ->
    case not is_pid(Pid) of
        true -> check_enter(T, Role);
        _ -> {false, lang:get("组队状态下不能参加冲顶答题")}
    end;
check_enter([team | T], Role) -> check_enter(T, Role);
check_enter([cross | T],
            Role = #role{cross_type = CrossType}) ->
    case CrossType of
        0 -> check_enter(T, Role);
        _ -> {false, lang:get("跨服状态无法进入冲顶答题")}
    end.

create_map() ->
    case map_mgr:create(53012) of
        {ok, RMapPid, RMapId} ->
            case map_mgr:create(53013) of
                {ok, AMapPid, AMapId} ->
                    {{RMapId, RMapPid}, {AMapId, AMapPid}};
                _ ->
                    logger:error("创建地图失败", [], camp_rushing_top, 1582),
                    {{0, undefind}, {0, undefind}}
            end;
        _ ->
            logger:error("创建地图失败", [], camp_rushing_top, 1586),
            {{0, undefind}, {0, undefind}}
    end.

init_data() ->
    RushRoles = ets:foldl(fun (R = #camp_rushing_top_role{},
                               Acc) ->
                                  NR = R#camp_rushing_top_role{index = 0,
                                                               revive_times = 0,
                                                               is_lost = 0,
                                                               is_sign = 0,
                                                               sys_barrage = 1,
                                                               ply_barrage = 1,
                                                               in_map = 0,
                                                               option = 0},
                                  [NR | Acc];
                              (_, Acc) -> Acc
                          end,
                          [],
                          camp_rushing_top_role),
    save_rush_role(RushRoles),
    ok.

clean_all_sign() ->
    role_group:apply(world,
                     {camp_rushing_top, role_callback, [clean_sign]}),
    ok.

