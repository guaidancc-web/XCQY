-file("src/mod/campaign/camp_7_7th_mgr.erl", 1).

-module(camp_7_7th_mgr).

-author("jia").

-behaviour(gen_fsm).

-export([start_link/0]).

-export([init/1,
         idel/2,
         active/2,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([init/0,
         login/1,
         logout/1,
         zero_flush/2,
         push/1,
         lookup_sign/1,
         update_data_sign/1,
         sign/2,
         get_sign_list/1,
         join/1,
         apply_join_camp/2,
         apply_evt/2,
         reward/1,
         pitui/1,
         init_link/0,
         relogin/0,
         check_is_open/0]).

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

-file("src/mod/campaign/camp_7_7th_mgr.erl", 46).

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

-file("src/mod/campaign/camp_7_7th_mgr.erl", 47).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/mod/campaign/camp_7_7th_mgr.erl", 48).

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

-file("src/mod/campaign/camp_7_7th_mgr.erl", 49).

-file("inc/camp_7_7th.hrl", 1).

-author("jia").

-record(camp_7_7th_sign,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         head_id = 0,
         sex = 0 :: 0..2,
         lev = 0,
         time,
         msg = "",
         is_sign = 0,
         online = 0}).

-record(m_camp_7_7th,
        {other_id = {0, "", 0},
         other_name = "",
         other_sex = 0,
         other_lev = 0,
         other_classes = 0,
         status = 0,
         point = 0,
         get_times = 1,
         time = 0}).

-record(camp_7_7th_link,
        {id = {0, "", 0}, is_break = 0}).

-file("src/mod/campaign/camp_7_7th_mgr.erl", 50).

-file("inc/head.hrl", 1).

-record(m_head,
        {ver = 2 :: pos_integer(),
         id_now = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         head = [] :: list(),
         frame_id_now = 0 :: non_neg_integer(),
         frame_time_buy = 0 :: non_neg_integer(),
         frame_day = 0 :: non_neg_integer(),
         head_frame = [] :: list()}).

-record(head,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-record(head_frame,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-file("src/mod/campaign/camp_7_7th_mgr.erl", 51).

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

-file("src/mod/campaign/camp_7_7th_mgr.erl", 52).

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

-file("src/mod/campaign/camp_7_7th_mgr.erl", 53).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/campaign/camp_7_7th_mgr.erl", 54).

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

-file("src/mod/campaign/camp_7_7th_mgr.erl", 55).

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

-file("src/mod/campaign/camp_7_7th_mgr.erl", 56).

-record(state, {end_time, ts, timeout}).

start_link() ->
    gen_fsm:start_link({local, camp_7_7th_mgr},
                       camp_7_7th_mgr,
                       [],
                       []).

init([]) ->
    process_flag(trap_exit, true),
    dets:open_file(camp_7_7th_sign,
                   [{file, "./dets/camp_7_7th_sign.dets"},
                    {keypos, #camp_7_7th_sign.id},
                    {type, set}]),
    dets:open_file(camp_7_7th_link,
                   [{file, "./dets/camp_7_7th_link.dets"},
                    {keypos, #camp_7_7th_link.id},
                    {type, set}]),
    ets:new(camp_7_7th_sign,
            [set,
             named_table,
             public,
             {keypos, #camp_7_7th_sign.id}]),
    ets:new(camp_7_7th_link,
            [set,
             named_table,
             public,
             {keypos, #camp_7_7th_link.id}]),
    RefreshRef = erlang:send_after(date:next_diff(0, 0, 7) *
                                       1000,
                                   self(),
                                   refresh),
    put(refresh_ref, RefreshRef),
    {StateName, TimeLeft} = get_idle_time(),
    logger:info("下一个状态~w",
                [{StateName, TimeLeft}],
                camp_7_7th_mgr,
                79),
    Now = date:unixtime(),
    State = #state{ts = date:now2(), timeout = TimeLeft},
    NewState = case StateName of
                   active ->
                       State#state{end_time = Now + TimeLeft div 1000};
                   _ -> State
               end,
    {ok, StateName, NewState, TimeLeft}.

idel(timeout, State) ->
    {StateName, TimeLeft} = get_idle_time(),
    logger:info("下一个状态~w",
                [{StateName, TimeLeft}],
                camp_7_7th_mgr,
                92),
    NState = State#state{ts = date:now2(),
                         timeout = TimeLeft},
    Now = date:unixtime(),
    NewState = case StateName of
                   active ->
                       NState2 = State#state{end_time =
                                                 Now + TimeLeft div 1000},
                       ets:delete_all_objects(camp_7_7th_sign),
                       dets:delete_all_objects(camp_7_7th_link),
                       NState2;
                   _ -> NState
               end,
    continue(StateName, NewState);
idel(_Any, State) -> continue(idel, State).

active(timeout, State) ->
    {StateName, TimeLeft} = get_idle_time(),
    logger:info("下一个状态~w",
                [{StateName, TimeLeft}],
                camp_7_7th_mgr,
                111),
    NState = State#state{ts = date:now2(),
                         timeout = TimeLeft},
    NewState = case StateName of
                   active ->
                       Now = date:unixtime(),
                       NState2 = State#state{end_time =
                                                 Now + TimeLeft div 1000},
                       NState2;
                   _ -> NState
               end,
    continue(StateName,
             NewState#state{ts = date:now2(), timeout = TimeLeft});
active(_Any, State) -> continue(idel, State).

handle_event({get_sign_list,
              #{pid := Pid, sex := Sex, classes := _Classes,
                lev := _Lev}},
             StateName, State) ->
    List = ets:tab2list(camp_7_7th_sign),
    List2 = [Sign
             || Sign = #camp_7_7th_sign{is_sign = IsSign, sex = Sex1}
                    <- List,
                IsSign =:= 1, Sex1 =/= Sex],
    List3 = case List2 of
                [] -> [];
                List2 -> util:rand_list_n(List2, 8)
            end,
    role:pack_send(Pid, 17879, {List3}),
    continue(StateName, State);
handle_event({del_sign, #{id := RoleId}}, StateName,
             State) ->
    logger:debug("删除报名信息======================",
                 [],
                 camp_7_7th_mgr,
                 139),
    del_sign(RoleId),
    continue(StateName, State);
handle_event({add_link, #{id := RoleId}}, StateName,
             State) ->
    add_link(RoleId),
    continue(StateName, State);
handle_event({logout, #{id := RoleId}}, StateName,
             State) ->
    case lookup_sign(RoleId) of
        SignInfo = #camp_7_7th_sign{} ->
            update_data_sign(SignInfo#camp_7_7th_sign{online = 0});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    {reply, Reply, StateName, State}.

handle_info(refresh, StateName, State) ->
    case get(refresh_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    NewRef = erlang:send_after(date:next_diff(0, 0, 7) *
                                   1000,
                               self(),
                               refresh),
    put(refresh_ref, NewRef),
    {NStateName, _} = get_idle_time(),
    case NStateName of
        active -> init_link();
        _ -> ignore
    end,
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    {next_state, StateName, State}.

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

continue(StateName,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

cast(Event) ->
    gen_fsm:send_all_state_event(camp_7_7th_mgr, Event).

get_camp() ->
    case campaign_mgr:get_camp_info(60034) of
        #camp_cache{id = Id, start_time = St, end_time = ET} ->
            {Id, St, ET};
        _ -> {0, -1, -1}
    end.

get_idle_time() ->
    Now = date:unixtime(),
    {_, StartTime, EndTime} = get_camp(),
    if Now < StartTime ->
           {idel, max((StartTime - Now) * 1000, 1)};
       Now >= StartTime andalso Now < EndTime ->
           {active, max((EndTime - Now) * 1000, 1)};
       true -> {idel, date:next_diff(0) * 1000}
    end.

init() -> #m_camp_7_7th{}.

login(Role = #role{id = RoleID,
                   m_camp_7_7th = M7_7_th = #m_camp_7_7th{time = Time}}) ->
    resign(RoleID),
    Role2 = case check_is_break(RoleID) of
                1 ->
                    Role#role{m_camp_7_7th =
                                  M7_7_th#m_camp_7_7th{point = 0,
                                                       other_id = {0, "", 0},
                                                       other_name = "",
                                                       other_classes = 0}};
                _ -> Role
            end,
    Role3 = case not date:is_today(Time) of
                true ->
                    Role2#role{m_camp_7_7th =
                                   M7_7_th#m_camp_7_7th{point = 0, status = 0,
                                                        other_id = {0, "", 0},
                                                        other_name = "",
                                                        other_classes = 0,
                                                        other_lev = 0,
                                                        other_sex = 0,
                                                        time =
                                                            date:unixtime()}};
                false -> Role2
            end,
    EvnList = [#trigger{label = evt_camp_7_7th_point,
                        a = [], m = camp_7_7th_mgr, f = apply_evt}],
    {_, NRole} = role_trigger:add(EvnList, Role3),
    push(NRole),
    {ok, NRole};
login(_) -> ok.

resign(RoleId) ->
    case lookup_sign(RoleId) of
        Data = #camp_7_7th_sign{} ->
            update_data_sign(Data#camp_7_7th_sign{online = 1});
        _ -> ignore
    end,
    ok.

logout(#role{id = RoleId}) ->
    case lookup_sign(RoleId) of
        #camp_7_7th_sign{} -> cast({logout, #{id => RoleId}});
        _ -> ignore
    end,
    ok.

zero_flush(Role = #role{m_camp_7_7th = M7_7_th}, _) ->
    NRole = Role#role{m_camp_7_7th =
                          M7_7_th#m_camp_7_7th{point = 0, status = 0,
                                               other_id = {0, "", 0},
                                               other_name = "",
                                               other_classes = 0, other_lev = 0,
                                               other_sex = 0,
                                               time = date:unixtime()}},
    push(NRole),
    {ok, NRole};
zero_flush(_, _) -> ok.

init_link() ->
    List = ets:tab2list(camp_7_7th_link),
    lists:foreach(fun (Link) ->
                          case Link of
                              #camp_7_7th_link{} ->
                                  save(Link#camp_7_7th_link{is_break = 1});
                              _ -> ok
                          end
                  end,
                  List).

relogin() ->
    role_group:apply(world, {camp_7_7th_mgr, login, []}).

save(Link) -> ets:insert(camp_7_7th_link, Link).

apply_evt(#evt_camp_7_7th_point{val = Val},
          Role = #role{m_team = #m_team{pid = TPid},
                       m_camp_7_7th =
                           MCamp7_7th = #m_camp_7_7th{point = Point,
                                                      other_id = TRoleID}})
    when Point < 99 andalso is_pid(TPid) ->
    case get_idle_time() of
        {active, _} ->
            Times = var:get_var(Role, day, 617, 0),
            case Times < 1 of
                true ->
                    Members = team:get_members(Role),
                    case lists:keyfind(TRoleID, #team_mate.id, Members) of
                        #team_mate{} ->
                            NPoint = erlang:min(Point + Val, 99),
                            NRole = Role#role{m_camp_7_7th =
                                                  MCamp7_7th#m_camp_7_7th{point
                                                                              =
                                                                              NPoint}},
                            push(NRole),
                            Msg = notice:format("战斗获胜，获得~ts点同心值，当前进度~ts/~ts",
                                                [{string_2, 1, Val},
                                                 {string_2, 1, NPoint},
                                                 {string_2, 1, 99}]),
                            notice:send(NRole, 1, Msg),
                            notice:send(NRole, 7, Msg),
                            {ok, NRole};
                        _ -> ok
                    end;
                _ -> ok
            end;
        _RRR -> ok
    end;
apply_evt(_, _) -> ok.

push(#role{pid = PID,
           m_camp_7_7th =
               #m_camp_7_7th{other_id = TRoleID,
                             other_classes = TClasses, other_name = TName,
                             other_sex = TSex, status = TStatus, point = Point,
                             other_lev = TLev}}) ->
    RewardList = camp_7_7th_data:get_reward(),
    role:pack_send(PID,
                   17880,
                   {TRoleID,
                    TName,
                    TSex,
                    TClasses,
                    TStatus,
                    RewardList,
                    Point,
                    TLev}),
    ok;
push(_) -> ok.

check_is_break(RoleID) ->
    case ets:lookup(camp_7_7th_link, RoleID) of
        [#camp_7_7th_link{is_break = IsBreak}] -> IsBreak;
        _ -> 0
    end.

check_is_sign(RoleID) ->
    case ets:lookup(camp_7_7th_sign, RoleID) of
        [#camp_7_7th_sign{is_sign = 1}] -> 1;
        _ -> 0
    end.

lookup_sign(Id) -> lookup(camp_7_7th_sign, Id).

lookup(Table, Id) ->
    case ets:lookup(Table, Id) of
        [Data] -> Data;
        _ -> false
    end.

update_data_sign(Data) ->
    update_ets(camp_7_7th_sign, Data),
    update_dets(camp_7_7th_sign, Data).

update_ets(Table, Data) -> ets:insert(Table, Data).

update_dets(Table, Data) -> dets:insert(Table, Data).

del_sign(RoleID) ->
    ets:delete(camp_7_7th_sign, RoleID),
    dets:delete(camp_7_7th_sign, RoleID).

add_link(RoleID) ->
    LinkInfo = #camp_7_7th_link{id = RoleID, is_break = 0},
    update_data_sign(LinkInfo).

sign(_Role = #role{lev = Lev}, _Msg) when Lev < 30 ->
    {false,
     notice:format(lang:get("你的等级已经低于~ts级，不能报名有缘人"),
                   [{string_2, 5, 30}])};
sign(_Role = #role{m_camp_7_7th =
                       #m_camp_7_7th{status = 1}},
     _Msg) ->
    {false, lang:get("已有有缘人的无需再报名")};
sign(#role{id = RoleID, sex = Sex, lev = Lev,
           name = Name, classes = Classes,
           m_head = #m_head{id_now = HeadID}},
     Msg) ->
    case check_is_sign(RoleID) of
        1 -> {false, lang:get("已经报名有缘人")};
        0 ->
            SignInfo = #camp_7_7th_sign{online = 1, id = RoleID,
                                        sex = Sex, time = date:unixtime(),
                                        msg = Msg, name = Name,
                                        classes = Classes, lev = Lev,
                                        head_id = HeadID, is_sign = 1},
            update_data_sign(SignInfo),
            {ok, lang:get("报名有缘人成功")}
    end;
sign(_, _) ->
    logger:error("玩家角色数据出错，无法报名", [], camp_7_7th_mgr, 374),
    {false, lang:get("玩家角色数据出错，无法报名")}.

get_sign_list2(_Role = #role{m_camp_7_7th =
                                 #m_camp_7_7th{status = 1}}) ->
    {false, lang:get("你已经拥有有缘人，无需再寻找有缘人了")};
get_sign_list2(_Role = #role{lev = Lev})
    when Lev < 30 ->
    Msg =
        notice:format(lang:get("参与活动等级需要≥~ts，快努力升级吧{face_1,18}"),
                      [{string_2, 5, lang:get("30级")}]),
    {false, Msg};
get_sign_list2(#role{pid = Pid, lev = Lev, sex = Sex,
                     classes = Classes}) ->
    cast({get_sign_list,
          #{pid => Pid, lev => Lev, sex => Sex,
            classes => Classes}}).

get_sign_list(Role) ->
    case get_idle_time() of
        {active, _} -> get_sign_list2(Role);
        _ -> {false, lang:get("甜蜜情人节活动尚未开启，敬请期待{face_1,57}")}
    end.

join(Role) ->
    case check_join(Role,
                    [camp_status,
                     lev,
                     status,
                     team,
                     team_leader,
                     team_num,
                     sex,
                     friend,
                     bag_num])
        of
        {ok, NRole} -> do_join(NRole);
        {false, Reason} -> {false, Reason}
    end.

check_join(Role, [camp_status | T]) ->
    case check_is_open() of
        1 -> check_join(Role, T);
        0 -> {false, lang:get("甜蜜情人节活动尚未开启，敬请期待{face_1,57}")}
    end;
check_join(Role = #role{lev = Lev, name = Name},
           [lev | T]) ->
    case Lev >= 30 of
        true -> check_join(Role, T);
        false ->
            Msg = notice:format(lang:get("~ts等级不足~ts，不能参加活动"),
                                [{role_2, Name}, {string_2, 5, 55}]),
            {false, Msg}
    end;
check_join(Role = #role{m_team = #m_team{pid = TPid}},
           [team | T]) ->
    case is_pid(TPid) of
        true -> check_join(Role, T);
        _ ->
            Msg =
                notice:format(lang:get("领取同心锁需要身为~ts，并带领一名异性哦{face_1,2}"),
                              [{string_2, 5, lang:get("队长")}]),
            {false, Msg}
    end;
check_join(Role = #role{m_team =
                            #m_team{member_num = MemberNum}},
           [team_num | T]) ->
    case MemberNum =:= 2 of
        true -> check_join(Role, T);
        _ ->
            Msg =
                notice:format(lang:get("完成同心锁需要一心一意，只能和~ts异性组队领取哟{face_1,9}"),
                              [{string_2, 5, lang:get("一名")}]),
            {false, Msg}
    end;
check_join(Role = #role{m_team =
                            #m_team{status = MateStatus}},
           [team_leader | T]) ->
    case MateStatus =:= 1 of
        true -> check_join(Role, T);
        _ ->
            Msg =
                notice:format(lang:get("领取同心锁需要身为~ts，并带领一名异性哦{face_1,2}"),
                              [{string_2, 5, lang:get("队长")}]),
            {false, Msg}
    end;
check_join(Role = #role{name = Name,
                        m_camp_7_7th = #m_camp_7_7th{status = Status}},
           [status | T]) ->
    case Status of
        0 -> check_join(Role, T);
        _ ->
            Msg =
                notice:format(lang:get("~ts今天已经领取过同心锁了，不能再次领取喔{face_1,3}"),
                              [{role_2, Name}]),
            {false, Msg}
    end;
check_join(Role = #role{name = Name,
                        p_bag = #package{free_cell = FreeCell}},
           [bag_num | T]) ->
    case is_list(FreeCell) andalso length(FreeCell) > 0 of
        true -> check_join(Role, T);
        _ ->
            Msg =
                notice:format(lang:get("~ts~ts，清理后再来领取~ts信物吧{face_1,34}"),
                              [{role_2, Name},
                               {string_2, 5, lang:get("背包已满")},
                               {string_2, 5, lang:get("同心锁")}]),
            {false, Msg}
    end;
check_join(Role = #role{sex = Sex}, [sex | T]) ->
    Members = team:get_members(Role),
    case Members of
        [#team_mate{sex = TSex}] ->
            case TSex =/= Sex of
                true -> check_join(Role, T);
                _ ->
                    Msg =
                        notice:format(lang:get("需要与一名~ts组队，才可以领取~ts信物哟{face_1,34}"),
                                      [{string_2, 5, lang:get("异性")},
                                       {string_2, 5, lang:get("同心锁")}]),
                    {false, Msg}
            end
    end;
check_join(Role = #role{id = RoleID}, [friend | T]) ->
    Members = team:get_members(Role),
    case Members of
        [#team_mate{id = TRoleID}] ->
            case friend:is_friend(RoleID, TRoleID) of
                true -> check_join(Role, T);
                _ ->
                    Msg =
                        notice:format(lang:get("需要~ts才可以领取~ts信物哟{face_1,34}"),
                                      [{string_2, 5, lang:get("添加好友")},
                                       {string_2, 5, lang:get("同心锁")}]),
                    {false, Msg}
            end;
        _ ->
            Msg =
                notice:format(lang:get("需要与一名~ts组队，才可以领取~ts信物哟{face_1,34}"),
                              [{string_2, 5, lang:get("异性")},
                               {string_2, 5, lang:get("同心锁")}]),
            {false, Msg}
    end;
check_join(Role, []) -> {ok, Role}.

do_join(Role = #role{sex = Sex, classes = Classes,
                     id = ID, name = Name, lev = Lev,
                     m_camp_7_7th =
                         MCamp7_7th = #m_camp_7_7th{get_times = Times}}) ->
    Members = team:get_members(Role),
    case Members of
        [#team_mate{id = TID, sex = TSex}] ->
            case TSex =/= Sex of
                true ->
                    case role_query:attr(by_id,
                                         TID,
                                         [#role.m_camp_7_7th,
                                          #role.p_bag,
                                          #role.name,
                                          #role.classes,
                                          #role.lev])
                        of
                        {ok,
                         [#m_camp_7_7th{status = 0},
                          #package{free_cell = FreeCell},
                          TName,
                          TClasses,
                          TLev]} ->
                            case FreeCell of
                                FreeCell2
                                    when is_list(FreeCell2) andalso
                                             length(FreeCell2) > 0 ->
                                    case role:apply(sync,
                                                    TID,
                                                    {camp_7_7th_mgr,
                                                     apply_join_camp,
                                                     [#{other_id => ID,
                                                        other_name => Name,
                                                        sex => Sex,
                                                        classes => Classes,
                                                        lev => Lev}]})
                                        of
                                        ok ->
                                            {_, StartTime, _} = get_camp(),
                                            Days = date:day_diff(StartTime,
                                                                 date:unixtime())
                                                       + 1,
                                            GainList =
                                                camp_7_7th_data:get_gain_by_times(Days),
                                            case GainList of
                                                [] ->
                                                    {false,
                                                     lang:get("无法获得同心锁")};
                                                GainList2 ->
                                                    Gain =
                                                        format:val_to_gain(GainList2),
                                                    case
                                                        role_gain:do_notice(Gain,
                                                                            Role,
                                                                            "恭喜你们成为同心伙伴，并获得结缘信物")
                                                        of
                                                        {false, G} ->
                                                            {false, G#gain.msg};
                                                        {ok, NewRole1} ->
                                                            cast({add_link,
                                                                  #{id => ID}}),
                                                            cast({del_sign,
                                                                  #{id => ID}}),
                                                            cast({add_link,
                                                                  #{id =>
                                                                        TID}}),
                                                            cast({del_sign,
                                                                  #{id =>
                                                                        TID}}),
                                                            NMCamp7_7th =
                                                                MCamp7_7th#m_camp_7_7th{time
                                                                                            =
                                                                                            date:unixtime(),
                                                                                        point
                                                                                            =
                                                                                            0,
                                                                                        get_times
                                                                                            =
                                                                                            Times
                                                                                                +
                                                                                                1,
                                                                                        other_classes
                                                                                            =
                                                                                            TClasses,
                                                                                        other_id
                                                                                            =
                                                                                            TID,
                                                                                        other_name
                                                                                            =
                                                                                            TName,
                                                                                        other_sex
                                                                                            =
                                                                                            TSex,
                                                                                        status
                                                                                            =
                                                                                            1,
                                                                                        other_lev
                                                                                            =
                                                                                            TLev},
                                                            NewRole2 =
                                                                NewRole1#role{m_camp_7_7th
                                                                                  =
                                                                                  NMCamp7_7th},
                                                            push(NewRole2),
                                                            {ok, NewRole2};
                                                        _ ->
                                                            Msg =
                                                                notice:format(lang:get("~ts~ts，清理后再来领取~ts信物吧{face_1,34}"),
                                                                              [{role_2,
                                                                                Name},
                                                                               {string_2,
                                                                                5,
                                                                                lang:get("背包已满")},
                                                                               {string_2,
                                                                                5,
                                                                                lang:get("同心锁")}]),
                                                            {false, Msg}
                                                    end
                                            end;
                                        {false, Reason} -> {false, Reason};
                                        _ERR ->
                                            logger:error("系统错误~w",
                                                         [_ERR],
                                                         camp_7_7th_mgr,
                                                         528),
                                            {false, lang:get("系统错误")}
                                    end;
                                _ ->
                                    Msg =
                                        notice:format(lang:get("~ts~ts，清理后再来领取~ts信物吧{face_1,34}"),
                                                      [{role_2, TName},
                                                       {string_2,
                                                        5,
                                                        lang:get("背包已满")},
                                                       {string_2,
                                                        5,
                                                        lang:get("同心锁")}]),
                                    {false, Msg}
                            end;
                        {ok, [#m_camp_7_7th{status = 1}, _, TName, _, _]} ->
                            Msg =
                                notice:format(lang:get("~ts今天已经领取过同心锁了，不能再次领取喔{face_1,3}"),
                                              [{role_2, TName}]),
                            {false, Msg};
                        _ERR -> {false, lang:get("对方似乎不在线，无法领取同心锁")}
                    end;
                _ERR ->
                    Msg =
                        notice:format(lang:get("需要与一名~ts组队，才可以领取~ts信物哟{face_1,34}"),
                                      [{string_2, 5, lang:get("异性")},
                                       {string_2, 5, lang:get("同心锁")}]),
                    {false, Msg}
            end;
        _ERR ->
            Msg =
                notice:format(lang:get("完成同心锁需要一心一意，只能和~ts异性组队领取哟{face_1,9}"),
                              [{string_2, 5, lang:get("一名")}]),
            {false, Msg}
    end.

apply_join_camp(TRole = #role{name = Name, lev = Lev,
                              m_camp_7_7th =
                                  MCamp7_7th = #m_camp_7_7th{get_times =
                                                                 Times}},
                #{other_id := TID, other_name := TName, sex := TSex,
                  classes := TClasses, lev := TLev}) ->
    case Lev >= 30 of
        true ->
            {_, StartTime, _} = get_camp(),
            Days = date:day_diff(StartTime, date:unixtime()) + 1,
            GainList = camp_7_7th_data:get_gain_by_times(Days),
            case GainList of
                [] -> {ok, {false, lang:get("对方无法获得同心锁")}};
                GainList2 ->
                    Gain = format:val_to_gain(GainList2),
                    case role_gain:do_notice(Gain,
                                             TRole,
                                             "恭喜你们成为同心伙伴，并获得结缘信物")
                        of
                        {ok, NewRole1} ->
                            NMCamp7_7th = MCamp7_7th#m_camp_7_7th{time =
                                                                      date:unixtime(),
                                                                  point = 0,
                                                                  get_times =
                                                                      Times + 1,
                                                                  other_classes
                                                                      =
                                                                      TClasses,
                                                                  other_id =
                                                                      TID,
                                                                  other_name =
                                                                      TName,
                                                                  other_sex =
                                                                      TSex,
                                                                  status = 1,
                                                                  other_lev =
                                                                      TLev},
                            NewRole2 = NewRole1#role{m_camp_7_7th =
                                                         NMCamp7_7th},
                            push(NewRole2),
                            role:pack_send(NewRole2, 17881, {1, ""}),
                            {ok, ok, NewRole2};
                        _ ->
                            Msg =
                                notice:format(lang:get("~ts~ts，清理后再来领取~ts信物吧{face_1,34}"),
                                              [{role_2, Name},
                                               {string_2, 5, lang:get("背包已满")},
                                               {string_2, 5, lang:get("同心锁")}]),
                            {ok, {false, Msg}}
                    end
            end;
        false ->
            Msg = notice:format(lang:get("~ts等级不足~ts，不能参加活动"),
                                [{role_2, Name}, {string_2, 5, 30}]),
            {false, Msg}
    end;
apply_join_camp(_, _) ->
    {ok, false, lang:get("情人节活动对方信息错误")}.

reward(#role{m_camp_7_7th =
                 #m_camp_7_7th{point = Point}})
    when Point < 99 ->
    {false, lang:get("同心值未满，不能兑换")};
reward(Role = #role{m_camp_7_7th = MCamp7_7th}) ->
    Times = var:get_var(Role, day, 617, 0),
    case Times < 1 of
        true ->
            {_, StartTime, _} = get_camp(),
            Days = date:day_diff(StartTime, date:unixtime()) + 1,
            logger:debug("DaysDaysDaysDaysDaysDaysDaysDays~w",
                         [Days],
                         camp_7_7th_mgr,
                         589),
            LossList = camp_7_7th_data:get_gain_by_times(Days),
            case LossList of
                [] -> {false, lang:get("配置找不到消耗兑换物品")};
                LossList2 ->
                    GainList = camp_7_7th_data:get_reward(),
                    GainList2 = [{BaseID, Bind, Num}
                                 || {BaseID, Bind, Num, _} <- GainList],
                    Loss = format:val_to_loss(LossList2),
                    Gain = format:val_to_gain(GainList2),
                    role:send_buff_begin(),
                    case role_gain:do_notice(Loss ++ Gain, Role, "解锁成功，") of
                        {ok, Role2} ->
                            Role3 = var:set_var(Role2, day, 617, Times + 1),
                            Role4 = Role3#role{m_camp_7_7th =
                                                   MCamp7_7th#m_camp_7_7th{get_times
                                                                               =
                                                                               Times
                                                                                   +
                                                                                   1,
                                                                           point
                                                                               =
                                                                               0,
                                                                           other_id
                                                                               =
                                                                               {0,
                                                                                "",
                                                                                0},
                                                                           other_name
                                                                               =
                                                                               "",
                                                                           other_sex
                                                                               =
                                                                               0,
                                                                           other_classes
                                                                               =
                                                                               0}},
                            case buff:add(Role4, 31002) of
                                {ok, NewRole1} ->
                                    NewRole2 = attr:calc_and_push(NewRole1),
                                    NewRole = looks:calc(NewRole2),
                                    map:role_update(NewRole),
                                    notice:send(NewRole,
                                                1,
                                                notice:format(lang:get("恭喜您解锁成功并获得~ts变身效果"),
                                                              [{string_2,
                                                                1,
                                                                lang:get("甜蜜小熊")}])),
                                    push(NewRole),
                                    role:send_buff_flush(),
                                    {ok, NewRole};
                                {false, Reason} ->
                                    role:send_buff_clean(),
                                    {false, Reason}
                            end;
                        {false, #loss{msg = Why}} ->
                            role:send_buff_clean(),
                            {false, Why};
                        _ ->
                            role:send_buff_clean(),
                            logger:error("兑换鸳鸯玉错误", [], camp_7_7th_mgr, 622),
                            {false, lang:get("兑换鸳鸯玉错误")}
                    end
            end;
        _ -> {false, lang:get("今日已达兑换上限")}
    end.

pitui(Role = #role{m_camp_7_7th = M7_7_th}) ->
    NRole = Role#role{m_camp_7_7th =
                          M7_7_th#m_camp_7_7th{status = 0, point = 0,
                                               other_id = {0, "", 0},
                                               other_name = "",
                                               other_classes = 0,
                                               get_times = 0}},
    push(NRole),
    notice:send(NRole, 1, lang:get("劈腿成功！")),
    {ok, NRole}.

check_is_open() ->
    case get_idle_time() of
        {active, _} -> 1;
        _ -> 0
    end.

