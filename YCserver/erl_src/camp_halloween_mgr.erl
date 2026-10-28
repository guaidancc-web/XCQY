-file("src/mod/campaign/camp_halloween_mgr.erl", 1).

-module(camp_halloween_mgr).

-behaviour(gen_fsm).

-export([start_link/0,
         login/1,
         logout/1,
         m/0,
         cast/1,
         call/1,
         apply_leave_zone/2,
         leave/1,
         sign/1,
         apply_enter_ready/2,
         apply_set_event/3,
         apply_enter_zone/2,
         lookup/1,
         update_data/1,
         aim/3,
         trans/2,
         get_look/1,
         m/1,
         push_pre/1,
         calc/1,
         push_times/1,
         push_times/2,
         rpc_flash_appear/1,
         rpc_clear_aim_cd/1,
         rpc_send_screen_msg/2,
         push_skill_cd/1]).

-export([idel/2, notice/2, open/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

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

-file("src/mod/campaign/camp_halloween_mgr.erl", 50).

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

-file("src/mod/campaign/camp_halloween_mgr.erl", 51).

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

-file("src/mod/campaign/camp_halloween_mgr.erl", 52).

-file("inc/battle.hrl", 1).

-record(battle_base,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         global = [] :: list(),
         map = [] :: list(),
         unit = [] :: list(),
         point = [] :: list(),
         trigger = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(battle,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         map = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         ext = [],
         role_id = {0, "", 0}}).

-record(battle_context,
        {grade = 1 :: pos_integer(),
         score = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         hurt = 0 :: non_neg_integer(),
         ratio_val = 0,
         die_num = 0}).

-record(battle_role,
        {id,
         status = 1,
         pid,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         is_kill_boss = 0 :: 0..1,
         sub_id = 0 :: non_neg_integer(),
         flip_cards = [] :: [],
         has_reward_floor = [],
         context = #battle_context{}}).

-record(battle_combat_info,
        {sub_id = 0, sub_type = 0, gains = []}).

-record(battle_trigger,
        {name :: undefined | bitstring(),
         status = open :: open | close,
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         condition = [] :: [tuple()],
         action = [] :: list()}).

-record(tri_timer,
        {mode :: undefined | cycle | count,
         times = 0 :: integer(),
         timeout = 1000 :: pos_integer()}).

-record(cfg_act,
        {tpl :: undefined | atom(), cfg = [] :: list()}).

-record(tpl_act,
        {name = "" :: string(),
         type :: undefined | atom(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_cond,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_cond,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_evt,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_evt,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_val,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_val,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_unit,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_unit,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(point,
        {map = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(tpl_fun,
        {name :: undefined | atom(),
         return :: undefined | unit | point,
         args = [] :: [atom()],
         code = "" :: string(),
         mfa_code = "" :: string(),
         label = "" :: string(),
         desc = "" :: string()}).

-file("src/mod/campaign/camp_halloween_mgr.erl", 53).

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

-file("src/mod/campaign/camp_halloween_mgr.erl", 54).

-file("inc/looks.hrl", 1).

-file("src/mod/campaign/camp_halloween_mgr.erl", 55).

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

-file("src/mod/campaign/camp_halloween_mgr.erl", 56).

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

-file("src/mod/campaign/camp_halloween_mgr.erl", 57).

-file("inc/camp_halloween.hrl", 1).

-record(halloween_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         camp = 0,
         sex = 0,
         classes = 0,
         lev = 0,
         times = 0,
         times_cd = 0,
         die = 0,
         win = 0,
         score = 0,
         zone_id = 0,
         zone_pid,
         num = 0,
         pos,
         mtime = 0,
         escape_time = 0}).

-record(halloween_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         flag = 0}).

-record(halloween_rank_data,
        {min = 0,
         max = 0,
         win = 0,
         reward = [],
         exp_mode = 0,
         exp_radio = 0,
         title = "",
         content = ""}).

-record(halloween_reward_data,
        {min = 0,
         max = 0,
         win = 0,
         reward = [],
         exp_mode = 0,
         exp_radio = 0,
         pet_exp_mode = 0,
         pet_exp_radio = 0}).

-record(halloween_item_reward_data,
        {id = 0,
         type = 0,
         min_lev = 0,
         max_lev = 0,
         item_id = 0,
         num = 0,
         bind = 0,
         is_cast = 0,
         weigth = 0}).

-record(halloween_exp_reward_data,
        {type = 0,
         min = 0,
         max = 0,
         exp_mode = 0,
         exp_radio = 0,
         pet_exp_mode = 0,
         pet_exp_radio = 0}).

-file("src/mod/campaign/camp_halloween_mgr.erl", 58).

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

-file("src/mod/campaign/camp_halloween_mgr.erl", 59).

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

-file("src/mod/campaign/camp_halloween_mgr.erl", 60).

-file("inc/unit.hrl", 1).

-record(unit_order,
        {order :: undefined | move | guard | attack | atom(),
         type = 0 :: 0..2,
         arg :: undefined | tuple() | [tuple()],
         data :: undefined | term(),
         condition = [] :: list(),
         over :: undefined | defense | stop | atom()}).

-record(unit_data,
        {id = 0 :: pos_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1 :: non_neg_integer(),
         desc = "",
         classes = 0,
         sex = 0,
         lev = 1,
         name = "" :: list(),
         activity = 0 :: 0..1,
         guide_lev = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: bitstring(),
         condition = [] :: [tuple()],
         speed = 120 :: pos_integer(),
         lock = 0 :: 0 | 1,
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         gain = [] :: list(),
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         talk = [] :: list(),
         looks = [] :: list(),
         data = [] :: list(),
         def_status = defense :: defense | patrol | loaf}).

-record(unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1,
         name = "" :: list(),
         pid = 0 :: non_neg_integer() | pid(),
         lev = 1,
         classes = 0,
         sex = 0,
         activity = 0 :: 0..1,
         dun_info :: undefined | {pid(), pos_integer()},
         combat_pid = 0 :: non_neg_integer() | pid(),
         status = 0 :: non_neg_integer(),
         guide_lev = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: list(),
         condition = [] :: [tuple()],
         speed = 180 :: pos_integer(),
         lock = 0 :: 0 | 1,
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         defxy = {0, 0, 0} :: tuple(),
         def_status = defense :: defense | patrol | loaf,
         talk = [] :: list(),
         pos :: undefined | tuple(),
         data :: undefined | term(),
         looks = [] :: [tuple()],
         evt = [] :: [atom()],
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         prop = [] :: [{non_neg_integer(), string()}],
         order = [] :: list(),
         path = [] :: list(),
         ts = {1, 1, 1} ::
             {pos_integer(), pos_integer(), pos_integer()},
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         ai_id = 0,
         ai = {[], []} :: {list(), list()},
         attr,
         role_id = {0, "", 0}}).

-record(map_unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: pos_integer(),
         activity = 0 :: 0..1,
         status = 0 :: non_neg_integer(),
         classes = 0,
         sex = 0,
         guide_lev = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         looks = [] :: [tuple()],
         prop = [] :: [tuple()]}).

-record(plot_unit,
        {id = 0 :: pos_integer(),
         name = "" :: bitstring(),
         base_id = 0 :: non_neg_integer(),
         type = 1,
         fun_type = 1,
         dun_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: non_neg_integer(),
         act_type = "" :: bitstring(),
         looks = [] :: [tuple()],
         status = 0 :: non_neg_integer(),
         quest_id = 0 :: non_neg_integer(),
         quest_prog_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(unit_statue,
        {type = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = []}).

-file("src/mod/campaign/camp_halloween_mgr.erl", 61).

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

-file("src/mod/campaign/camp_halloween_mgr.erl", 62).

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

-file("src/mod/campaign/camp_halloween_mgr.erl", 63).

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

-file("src/mod/campaign/camp_halloween_mgr.erl", 64).

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

-file("src/mod/campaign/camp_halloween_mgr.erl", 65).

-record(state,
        {ts,
         timeout,
         zones = [],
         map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         role_list = [],
         pre_role_list = [],
         end_time = 0,
         num = 1,
         zone_id = 1,
         cross_type = 0}).

login(Role = #role{s_event = Event,
                   pos =
                       Pos = #pos{platform = Platform, zone_id = ZoneId}})
    when Event >= 36 andalso Event =< 39 ->
    Role1 = looks:del([],
                      Role#role{s_event = 0, s_event_pid = undefined}),
    {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                    {10001, 2583, 3848},
                                    {10001, 4957, 3680},
                                    {10001, 445, 2565},
                                    {10001, 4646, 704},
                                    {10001, 841, 1033},
                                    {10001, 2098, 1834},
                                    {10001, 3617, 1816}]),
    NewPos = Pos#pos{platform = Platform, zone_id = ZoneId,
                     map = MapId, x = X, y = Y},
    {ok, Role1#role{pos = NewPos}};
login(_) -> ok.

logout(#role{s_event = Event, id = Id, cross_type = 1})
    when Event >= 36 andalso Event =< 39 ->
    cross:cast(camp_halloween_mgr, cast, [{logout, Id}]),
    ok;
logout(#role{s_event = Event, id = Id})
    when Event >= 36 andalso Event =< 39 ->
    cast({logout, Id}),
    ok;
logout(_) -> ok.

get_look(#role{id = RoleId, s_event = Event,
               cross_type = 1})
    when Event == 37 orelse Event == 38 ->
    case cross:call(camp_halloween_mgr, lookup, [RoleId]) of
        #halloween_role{camp = Camp} ->
            [{59, 0, Camp, ""}, {64, 0, Camp, ""}];
        _ -> []
    end;
get_look(#role{id = RoleId, s_event = Event})
    when Event == 37 orelse Event == 38 ->
    case lookup(RoleId) of
        #halloween_role{camp = Camp} ->
            [{59, 0, Camp, ""}, {64, 0, Camp, ""}];
        _ -> []
    end;
get_look(_) -> [].

-spec m() -> ok.

m() ->
    logger:info("有人输入了下阶段", [], camp_halloween_mgr, 148),
    gen_fsm:send_event(camp_halloween_mgr, timeout).

m(_Role = #role{s_event = Event, s_event_pid = Pid})
    when Event == 37 orelse Event == 38 ->
    logger:info("下阶段", [], camp_halloween_mgr, 151),
    gen_fsm:send_event(Pid, timeout);
m(_) -> ok.

cast(Event) ->
    gen_fsm:send_all_state_event(camp_halloween_mgr, Event).

call(Event) ->
    try
        gen_fsm:sync_send_all_state_event(camp_halloween_mgr,
                                          Event)
    catch
        _Type:_Reason ->
            logger:debug("Type: ~w  Reason: ~w",
                         [_Type, _Reason],
                         camp_halloween_mgr,
                         166),
            {error, timeout}
    end.

push_pre(#role{pid = Pid, s_event = 36,
               cross_type = 1}) ->
    cross:cast(camp_halloween_mgr,
               cast,
               [{push_pre, #{pid => Pid}}]);
push_pre(#role{pid = Pid, s_event = 36}) ->
    cast({push_pre, #{pid => Pid}});
push_pre(_) -> ok.

calc(Role = #role{s_event = Event, attr = Attr})
    when Event == 37 orelse Event == 38 ->
    NAttr = case unit_data:get(76880) of
                #unit_data{speed = Speed} ->
                    Attr#attr{speed = Speed + 40};
                _ -> Attr
            end,
    Role#role{attr = NAttr};
calc(Role) -> Role.

sign(#role{cross_type = 2}) ->
    {false, lang:get("大跨服状态不能参与")};
sign(#role{lev = Lev}) when Lev < 30 ->
    Fmt = lang:get("~ts级才能参加该活动,努力升级吧~ts~ts~ts"),
    Args = [{string_1, 30},
            {face_1, 18},
            {face_1, 18},
            {face_1, 18}],
    {false, notice:format(Fmt, Args)};
sign(#role{s_event = 1}) ->
    {false, lang:get("你当前正在副本中，不能报名参加")};
sign(#role{s_event = 36}) -> {false, lang:get("")};
sign(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("组队状态不能参加")};
sign(Role = #role{cross_type = CrossType}) ->
    case role_misc:check_event(Role) of
        {false, Reason} -> {false, Reason};
        true ->
            case var:get_var(Role, day, 83, 0) >= 2 of
                true ->
                    {false, lang:get("今天的活动次数用完了，下次再战吧！{face_1,7}")};
                _ ->
                    case role_convert(Role) of
                        {ok, ElfRole} ->
                            case CrossType of
                                1 ->
                                    cross:cast(camp_halloween_mgr,
                                               cast,
                                               [{sign, ElfRole}]);
                                _ -> cast({sign, ElfRole})
                            end,
                            ok;
                        {false, Msg} -> {false, Msg};
                        _ -> {false, lang:get("报名失败")}
                    end
            end
    end.

leave(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("组队状态下，无法退出")};
leave(#role{s_event = SEvent}) when SEvent == 39 ->
    {false, lang:get("准备进入正式区中不能退出")};
leave(#role{s_event = SEvent})
    when SEvent == 37 orelse SEvent == 38 ->
    {false, lang:get("正式区中不能退出")};
leave(#role{s_event = SEvent, id = RoleId, pid = Pid,
            cross_type = 1})
    when SEvent == 36 ->
    cross:cast(camp_halloween_mgr,
               cast,
               [{leave, #{id => RoleId, pid => Pid}}]),
    ok;
leave(#role{s_event = SEvent, id = RoleId, pid = Pid})
    when SEvent == 36 ->
    cast({leave, #{id => RoleId, pid => Pid}}),
    ok;
leave(#role{}) -> {false, lang:get("不能执行此操作")}.

apply_leave_zone(Role, ZonePid) ->
    case leave_zone(Role, ZonePid) of
        {false, _Reason} -> ok;
        {ok, NewRole} -> {ok, NewRole};
        ok -> ok
    end.

leave_zone(TRole = #role{id = RoleId, s_event = SEvent,
                         cross_type = CrossType},
           _ZonePid)
    when SEvent == 36 ->
    Role = case team:async_leave(TRole) of
               {ok, TRole1} -> TRole1;
               _ -> TRole
           end,
    Role1 = Role#role{s_event = 0, s_event_pid = undefined},
    case CrossType of
        1 ->
            cross:cast(camp_halloween_mgr,
                       cast,
                       [{leave_succ, RoleId}]);
        _ -> cast({leave_succ, RoleId})
    end,
    NRole1 = looks:calc(Role1),
    NRole2 = attr:calc_and_push(NRole1),
    NewRole = NRole2,
    map:role_update(NewRole),
    {ok, NewRole};
leave_zone(TRole = #role{id = RoleId, s_event = SEvent,
                         pos = #pos{platform = P, zone_id = Z}},
           ZonePid)
    when SEvent == 37 orelse SEvent == 38 ->
    Role = case team:async_leave(TRole) of
               {ok, TRole1} -> TRole1;
               _ -> TRole
           end,
    Role1 = Role#role{s_event = 0, s_event_pid = undefined},
    {Map, X, Y} = case var:get_var(Role, day, 83, 0) >= 2 of
                      true ->
                          util:rand_list([{10001, 306, 3507},
                                          {10001, 2583, 3848},
                                          {10001, 4957, 3680},
                                          {10001, 445, 2565},
                                          {10001, 4646, 704},
                                          {10001, 841, 1033},
                                          {10001, 2098, 1834},
                                          {10001, 3617, 1816}]);
                      _ ->
                          case map_data:get(30015) of
                              {ok, #map_data{revive = [{Tx, Ty} | _]}} ->
                                  {30015, Tx, Ty};
                              _ ->
                                  util:rand_list([{10001, 306, 3507},
                                                  {10001, 2583, 3848},
                                                  {10001, 4957, 3680},
                                                  {10001, 445, 2565},
                                                  {10001, 4646, 704},
                                                  {10001, 841, 1033},
                                                  {10001, 2098, 1834},
                                                  {10001, 3617, 1816}])
                          end
                  end,
    case map:role_enter({P, Z, Map, X, Y}, [], Role1) of
        {error, Reason} ->
            logger:error("退出地图失败：~w",
                         [Reason],
                         camp_halloween_mgr,
                         292),
            {false, Reason};
        {ok, NRole} ->
            case is_pid(ZonePid) of
                _ when ZonePid == camp_halloween_mgr ->
                    cast({leave_succ, RoleId});
                true ->
                    camp_halloween:cast(ZonePid, {leave_succ, RoleId});
                false -> skip
            end,
            NRole1 = looks:calc(NRole),
            NRole2 = looks:del([59, 64], NRole1, all),
            NRole3 = attr:calc_and_push(NRole2),
            NewRole = NRole3,
            map:role_update(NewRole),
            {ok, NewRole}
    end;
leave_zone(_Role, _ZonePid) -> ok.

push_times(Role, _) -> push_times(Role).

push_times(Role) ->
    Times = var:get_var(Role, day, 83, 0),
    role:pack_send(Role, 17807, {Times}),
    ok.

rpc_flash_appear(#role{s_event = 38}) ->
    {false, lang:get("被人放倒不能使用技能")};
rpc_flash_appear(Role = #role{id = RoleId,
                              s_event_pid = ZonePid,
                              pos = #pos{x = OldX, y = OldY}}) ->
    {X, Y} = get_rand_pos(OldX, OldY),
    case map:role_transmit(4, 0, X, Y, Role) of
        NewRole = #role{pos = Pos} ->
            camp_halloween:cast(ZonePid, {enter_zone, RoleId, Pos}),
            EnterRole1 = attr:calc_and_push(NewRole),
            LooksRole = looks:calc(EnterRole1),
            map:role_update(LooksRole),
            camp_halloween:cast(ZonePid,
                                {update_escape_boss_time, RoleId}),
            {ok, LooksRole};
        _Err ->
            logger:error("使用南瓜活动闪现技能失败:~w",
                         [_Err],
                         camp_halloween_mgr,
                         338),
            {ok, Role}
    end.

rpc_clear_aim_cd(#role{s_event = 38}) ->
    {false, lang:get("被人放倒不能使用技能")};
rpc_clear_aim_cd(#role{id = RoleId,
                       s_event_pid = ZonePid}) ->
    case camp_halloween:call(ZonePid,
                             {clear_aim_cd, RoleId})
        of
        ok -> ok;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("无法使用该技能")}
    end.

rpc_send_screen_msg(#role{id = RoleId,
                          s_event_pid = ZonePid},
                    Index) ->
    case is_pid(ZonePid) of
        true ->
            camp_halloween:cast(ZonePid,
                                {send_screen_msg,
                                 #{index => Index, id => RoleId}}),
            ok;
        false -> ok
    end.

push_skill_cd(_Role) ->
    CdTime1 = role_misc:get_cd(rpc_17834),
    EndTime1 = case get(rpc_17834) of
                   T1 when is_integer(T1) -> (T1 + CdTime1) div 1000;
                   _ -> 0
               end,
    CdTime2 = role_misc:get_cd(rpc_17835),
    EndTime2 = case get(rpc_17835) of
                   T2 when is_integer(T2) -> (T2 + CdTime2) div 1000;
                   _ -> 0
               end,
    {[{82180, EndTime1}, {82181, EndTime2}]}.

apply_enter_ready(Role = #role{m_team =
                                   #m_team{pid = Pid}},
                  _)
    when is_pid(Pid) ->
    role:link_send(Role, 16301, {0, "组队状态不能进入"}),
    ok;
apply_enter_ready(Role = #role{name = _Name,
                               cross_type = CrossType},
                  #{map_id := _MapId, zone_role := R}) ->
    case role_misc:check_event(Role, [2]) of
        {false, Reason} ->
            logger:debug("进入准备区地图~ts",
                         [Reason],
                         camp_halloween_mgr,
                         384),
            notice:return(Reason),
            role:link_send(Role, 16301, {0, ""}),
            ok;
        true ->
            case role_fly:force_landing(Role) of
                {ok, DownRole} ->
                    DownRole2 = DownRole#role{s_event = 36},
                    NRole = DownRole2,
                    NewRole = NRole,
                    case CrossType of
                        1 ->
                            cross:cast(camp_halloween_mgr,
                                       cast,
                                       [{sign_succ, R}]);
                        _ -> cast({sign_succ, R})
                    end,
                    role:link_send(NewRole,
                                   16301,
                                   {1, lang:get("报名成功，进入准备厅")}),
                    map:role_update(NewRole),
                    {ok, NewRole};
                _False ->
                    logger:debug("进入准备区地图失败[Err:~w]",
                                 [_False],
                                 camp_halloween_mgr,
                                 405),
                    ok
            end
    end.

apply_set_event(Role = #role{name = _Name,
                             s_event = Event, s_looks = _OSLooks},
                NewEvent, Args)
    when Event >= 36 andalso Event =< 39 ->
    NRole = looks:calc(Role#role{s_event = NewEvent}),
    Role2 = #role{s_looks = _SLooks} =
                attr:calc_and_push(NRole),
    map:role_update(Role2),
    set_event_do(Role2, Args),
    logger:debug("改变状态：~ts, oldlook:~w, newloos:~w, ~w",
                 [_Name, _OSLooks, _SLooks, {Event, NewEvent}],
                 camp_halloween_mgr,
                 418),
    {ok, Role2};
apply_set_event(_Role, _Event, _) -> ok.

set_event_do(Role,
             #{label := pre_enter, time := _Time}) ->
    notice:send(Role, 3, lang:get("匹配成功，准备开始{face_1,18}")),
    ok;
set_event_do(Role,
             #{label := die, msg := Msg, name := Name}) ->
    notice:send(Role, 3, Msg),
    role:pack_send(Role, 17811, {Name}),
    ok;
set_event_do(Role, #{label := trans, msg := Msg}) ->
    notice:send(Role, 3, Msg),
    ok;
set_event_do(_Role, _) -> ok.

apply_enter_zone(Role = #role{s_event = 39,
                              pos = #pos{platform = P, zone_id = Z},
                              name = _Name, id = RoleId},
                 #{map_id := MapId, zone_pid := ZonePid,
                   zone_role := #halloween_role{camp = Camp}}) ->
    {X, Y} = map:rand_pos(30014),
    case map:role_enter({P, Z, MapId, X, Y},
                        [],
                        Role#role{s_event = 37, s_event_pid = ZonePid})
        of
        {ok, EnterRole = #role{pos = Pos}} ->
            logger:debug("[~ts]成功进入正式区",
                         [_Name],
                         camp_halloween_mgr,
                         442),
            camp_halloween:cast(ZonePid, {enter_zone, RoleId, Pos}),
            EnterRole1 = attr:calc_and_push(EnterRole),
            NRole = looks:calc(EnterRole1),
            map:role_update(NRole),
            NewRole = var:acc_var(NRole, day, 83),
            CampMsg = case Camp of
                          2 -> lang:get("红方玩家");
                          _ -> lang:get("蓝方玩家")
                      end,
            Msg =
                notice:format(lang:get("比赛正式开始！找出藏在南瓜怪中的~ts，并将其<color='#ffff00'>识破</c"
                                       "olor>即可获得得分，率先达到<color='#ffff00'>20分</color>的"
                                       "一方获胜{face_1,22}"),
                              [{string_2, 5, CampMsg}]),
            notice:pop(Role, 0, Msg),
            push_times(NewRole),
            {ok, role_trigger:fire(#evt_camp_halloween{}, NewRole)};
        _Err ->
            logger:error("[~ts]进入准备区失败[Err:~w]",
                         [_Name, _Err],
                         camp_halloween_mgr,
                         457),
            ok
    end;
apply_enter_zone(_Role, _) -> ok.

trans(Role = #role{pos =
                       #pos{platform = Platform, zone_id = ZoneId}},
      {MapId, X, Y}) ->
    case map:role_enter({Platform, ZoneId, MapId, X, Y},
                        Role)
        of
        {ok, NewRole} ->
            camp_halloween:update_pos(NewRole),
            {ok, NewRole};
        {error, Reason} ->
            logger:error("传送出错， ~w",
                         [Reason],
                         camp_halloween_mgr,
                         471),
            ok
    end.

start_link() ->
    gen_fsm:start_link({local, camp_halloween_mgr},
                       camp_halloween_mgr,
                       [],
                       []).

lookup(RoleId) ->
    case ets:lookup(halloween_role, RoleId) of
        [R] -> R;
        _ -> false
    end.

update_data(Data) -> ets:insert(halloween_role, Data).

aim(#role{id = RoleId}, _, RoleId) ->
    {false, lang:get("自己不能识别自己")};
aim(Role = #role{s_event = 37, s_event_pid = Pid,
                 id = RoleId, pos = Pos},
    Type, ToRoleId) ->
    case camp_halloween:call(Pid,
                             {aim,
                              #{type => Type, id => RoleId, to_id => ToRoleId,
                                pos => Pos}})
        of
        {true,
         #{flag := Flag = 1, msg := Msg,
           zone_role := #halloween_role{times = Times}}} ->
            Ids = case Times =< 10 andalso util:rand(1, 1000) =< 100
                      of
                      true -> camp_halloween_data:item_type(3);
                      _ -> []
                  end,
            {NRole, _} = camp_halloween:do_reward(Role,
                                                  #{reward_type => 3,
                                                    times => Times,
                                                    add_items => [],
                                                    title => lang:get("抓住调皮精"),
                                                    ids => Ids}),
            {ok, Flag, Msg, NRole};
        {true,
         #{flag := Flag, msg := Msg,
           zone_role := #halloween_role{times = Times}}} ->
            AddExp = case camp_halloween_data:get_exp({Times, 3}) of
                         #halloween_exp_reward_data{exp_mode = ExpMode,
                                                    exp_radio = ExpRadio,
                                                    pet_exp_mode = PetExpMode,
                                                    pet_exp_radio =
                                                        PetExpRadio} ->
                             Exp = camp_halloween:get_exp(Role,
                                                          ExpMode,
                                                          ExpRadio / 1000 / 2),
                             PetExp = camp_halloween:get_pet_exp(Role,
                                                                 PetExpMode,
                                                                 PetExpRadio /
                                                                     1000
                                                                     / 2),
                             Exp ++ PetExp;
                         _ -> []
                     end,
            Gain = format:val_to_gain(AddExp),
            NewRole = case role_gain:do_notice(Gain, Role) of
                          {ok, NRole} -> NRole;
                          _ -> Role
                      end,
            {ok, Flag, Msg, NewRole};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙")}
    end;
aim(#role{s_event = 38}, _, _ToRoleId) ->
    {false, lang:get("被人放倒不能识破")};
aim(_, _, _ToRoleId) -> {false, lang:get("当前状态不能识别")}.

init([]) ->
    logger:info("开始启动...", [], camp_halloween_mgr, 539),
    process_flag(trap_exit, true),
    ets:new(halloween_role,
            [set,
             named_table,
             public,
             {keypos, #halloween_role.id}]),
    {_, TimeLeft} = get_idle_time(),
    StateName = idel,
    logger:info("下一个状态~w",
                [{StateName, TimeLeft}],
                camp_halloween_mgr,
                544),
    State = #state{ts = date:now2(),
                   timeout = TimeLeft * 1000},
    CrossType = case env:get(is_center) of
                    true -> 1;
                    _ -> 0
                end,
    NewState = State#state{cross_type = CrossType},
    logger:info("启动完成", [], camp_halloween_mgr, 551),
    {ok, StateName, NewState, TimeLeft * 1000}.

handle_event({sign,
              ElfRole = #halloween_role{pid = Pid}},
             StateName = open, State = #state{map_id = MapId}) ->
    role:apply(async,
               Pid,
               {camp_halloween_mgr,
                apply_enter_ready,
                [#{map_id => MapId, zone_role => ElfRole}]}),
    continue(StateName, State);
handle_event({sign,
              _ElfRole = #halloween_role{pid = Pid}},
             StateName = active, State) ->
    notice:send(Pid, 1, lang:get("现在还不能报名")),
    continue(StateName, State);
handle_event({sign,
              _ElfRole = #halloween_role{pid = Pid}},
             StateName, State) ->
    notice:send(Pid, 1, lang:get("活动未开启")),
    continue(StateName, State);
handle_event({sign_succ,
              R = #halloween_role{id = RoleId, name = _Name}},
             StateName,
             State = #state{role_list = RoleList, num = Num,
                            pre_role_list = PreList}) ->
    logger:debug("报名成功~ts",
                 [_Name],
                 camp_halloween_mgr,
                 567),
    NRoleList = lists:keystore(RoleId,
                               #halloween_role.id,
                               RoleList,
                               R),
    push_pre_role(NRoleList, 2, [R]),
    push_pre_role(R, 1, NRoleList),
    NewState = case length(NRoleList) >= 10 of
                   true ->
                       AddPreList = lists:sublist(NRoleList, 10),
                       AddPreList2 = util:shuffle(AddPreList),
                       NAddPreList = camp(AddPreList2, 0, 10 div 2, []),
                       push_camp(NAddPreList, NAddPreList),
                       erlang:send_after(10 * 1000,
                                         self(),
                                         {pre_enter, Num, NAddPreList}),
                       [role:apply(async,
                                   IRoleId,
                                   {camp_halloween_mgr,
                                    apply_set_event,
                                    [39, #{label => pre_enter, time => 10}]})
                        || #halloween_role{id = IRoleId} <- AddPreList],
                       State#state{role_list = NRoleList -- AddPreList,
                                   pre_role_list =
                                       [{Num, NAddPreList} | PreList],
                                   num = Num + 1};
                   _ -> State#state{role_list = NRoleList}
               end,
    continue(StateName, NewState);
handle_event({leave, #{id := RoleId, pid := Pid}},
             StateName, State = #state{role_list = RoleList}) ->
    case lists:keyfind(RoleId, #halloween_role.id, RoleList)
        of
        #halloween_role{} ->
            role:apply(async,
                       Pid,
                       {camp_halloween_mgr, apply_leave_zone, [self()]});
        _ -> notice:send({pid, Pid}, 1, lang:get("活动中没有数据"))
    end,
    continue(StateName, State);
handle_event({leave_succ, RoleId}, StateName,
             State = #state{role_list = RoleList}) ->
    NewRoleList = lists:keydelete(RoleId,
                                  #halloween_role.id,
                                  RoleList),
    push_pre_role(RoleList,
                  3,
                  [#halloween_role{id = RoleId}]),
    continue(StateName,
             State#state{role_list = NewRoleList});
handle_event({push_pre, #{pid := Pid}}, StateName,
             State = #state{role_list = RoleList}) ->
    push_pre_role(Pid, 1, RoleList),
    continue(StateName, State);
handle_event({logout, RoleId}, StateName,
             State = #state{role_list = RoleList}) ->
    NewRoleList = lists:keydelete(RoleId,
                                  #halloween_role.id,
                                  RoleList),
    push_pre_role(RoleList,
                  3,
                  [#halloween_role{id = RoleId}]),
    continue(StateName,
             State#state{role_list = NewRoleList});
handle_event(_Info = {push, #{pid := RolePid}},
             StateName, State) ->
    push_state(State, StateName, RolePid),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info({pre_enter, Num, AddPreList}, StateName,
            State = #state{pre_role_list = PreList,
                           zone_id = ZoneId, zones = Zones}) ->
    NewPreList = lists:keydelete(Num, 1, PreList),
    NewState = case camp_halloween:start_link(#{id =>
                                                    ZoneId,
                                                from => self()})
                   of
                   {ok, Pid} ->
                       Zone = #halloween_zone{id = ZoneId, pid = Pid},
                       enter_zone(AddPreList, Zone),
                       State#state{zones = [Zone | Zones],
                                   zone_id = ZoneId + 1,
                                   pre_role_list = NewPreList};
                   False ->
                       logger:error("创建战场失败[Err:~w]",
                                    [False],
                                    camp_halloween_mgr,
                                    631),
                       State
               end,
    continue(StateName, NewState);
handle_info({over_zone, Id}, StateName,
            State = #state{zones = Zones}) ->
    NewZones = lists:keydelete(Id,
                               #halloween_zone.id,
                               Zones),
    continue(StateName, State#state{zones = NewZones});
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idel(timeout, State) ->
    Now = date:unixtime2(),
    case campaign_data:get(1278) of
        #camp_cfg{start_time = StartTime, end_time = EndTime}
            when StartTime =< Now andalso Now =< EndTime ->
            TimeLeft = 300,
            logger:info("下一个状态~w",
                        [{notice, TimeLeft}],
                        camp_halloween_mgr,
                        659),
            Args = [{string_2, 1, lang:get("淘气南瓜")}],
            Msg =
                notice:format(lang:get("~ts将在~ts分钟后开启，调整好表情，准备对飙演技吧！{face_1, 7}"),
                              Args ++ [{string_2, 1, 5}]),
            notice:cast(all, 8, Msg),
            NState = State#state{ts = date:now2(),
                                 timeout = TimeLeft * 1000},
            NewState = NState,
            push_state(NewState, notice),
            continue(notice, NewState);
        _ ->
            case agenda_data:get(2084) of
                #{starttime := Start, endtime := _End} ->
                    Timeout = date:next_diff(Start - 300, Now),
                    IdelState = State#state{ts = date:now2(),
                                            timeout = Timeout * 1000},
                    continue(idel, IdelState);
                _ ->
                    continue(idel,
                             State#state{ts = date:now2(),
                                         timeout =
                                             date:next_diff(16 * 60 * 60 - 300,
                                                            Now)})
            end
    end;
idel(_Any, State) -> continue(idel, State).

notice(timeout, State) ->
    TimeLeft = agenda:get_duration(2084),
    Args = [{string_2, 1, lang:get("淘气南瓜")}],
    Msg =
        notice:format(lang:get("~ts活动开始啦，飙演技的时候到了，快来与南瓜精们争夺小金人！{face_1, 7}"),
                      Args),
    notice:cast(all, 8, Msg),
    Now = date:unixtime(),
    NState = State#state{ts = date:now2(),
                         timeout = TimeLeft * 1000, end_time = Now + TimeLeft},
    NewState = NState,
    push_state(NewState, open),
    continue(open, NewState);
notice(_Any, State) -> continue(notice, State).

open(timeout, State = #state{role_list = RoleList}) ->
    {_, TimeLeft} = get_idle_time(),
    logger:info("下一个状态~w",
                [{idel, TimeLeft}],
                camp_halloween_mgr,
                696),
    push_state(State, idel),
    [role:apply(async,
                RoleId,
                {camp_halloween_mgr, apply_leave_zone, [self()]})
     || #halloween_role{id = RoleId} <- RoleList],
    continue(idel,
             State#state{ts = date:now2(), timeout = TimeLeft * 1000,
                         role_list = [], end_time = 0});
open(_Any, State) -> continue(open, State).

get_idle_time() -> agenda:get_state_timeout(2084, 300).

push_state(#state{end_time = EndTime}, StateName,
           Pid) ->
    Status = get_staues(StateName),
    role:pack_send(Pid, 17800, {Status, EndTime}).

push_state(#state{end_time = EndTime}, StateName) ->
    Status = get_staues(StateName),
    role_group:pack_send(world, 17800, {Status, EndTime}).

enter_zone([], _Zone) -> ok;
enter_zone([R = #halloween_role{name = _Name} | T],
           Zone = #halloween_zone{pid = ZonePid}) ->
    logger:debug("========================:~ts",
                 [_Name],
                 camp_halloween_mgr,
                 740),
    camp_halloween:cast(ZonePid, {enter, R}),
    enter_zone(T, Zone);
enter_zone([_I | T], Zone) ->
    logger:debug("=======================这个没有进入=:~w",
                 [_I],
                 camp_halloween_mgr,
                 744),
    enter_zone(T, Zone).

get_staues(open) -> 2;
get_staues(notice) -> 1;
get_staues(_) -> 0.

role_convert(Role = #role{id = RoleId, pid = Pid,
                          name = Name, classes = Classes, sex = Sex,
                          lev = Lev}) ->
    Num = var:get_var(Role, day, 83, 0),
    Now = date:unixtime(),
    {ok,
     #halloween_role{id = RoleId, pid = Pid, name = Name,
                     sex = Sex, classes = Classes, lev = Lev, num = Num + 1,
                     mtime = Now}}.

camp([], _, _Max, List) -> List;
camp([R | T], Num, Max, List) when Num >= Max ->
    NR = R#halloween_role{camp = 2},
    update_data(NR),
    camp(T, Num + 1, Max, [NR | List]);
camp([R | T], Num, Max, List) ->
    NR = R#halloween_role{camp = 1},
    update_data(NR),
    camp(T, Num + 1, Max, [NR | List]).

push_pre_role(Pid, Type, RoleList) when is_pid(Pid) ->
    role:pack_send(Pid, 17808, {Type, RoleList});
push_pre_role(#halloween_role{id = RoleId}, Type,
              RoleList) ->
    role:pack_send(RoleId, 17808, {Type, RoleList});
push_pre_role([], _Type, _RoleList) -> ok;
push_pre_role([I | T], Type, RoleList) ->
    push_pre_role(I, Type, RoleList),
    push_pre_role(T, Type, RoleList).

push_camp(#halloween_role{id = RoleId}, RoleList) ->
    role:pack_send(RoleId, 17809, {RoleList});
push_camp([], _RoleList) -> ok;
push_camp([I | T], RoleList) ->
    push_camp(I, RoleList),
    push_camp(T, RoleList).

get_rand_pos(OldX, OldY) ->
    {X, Y} = map:rand_pos(30014),
    case erlang:abs(OldX - X) >= 400 orelse
             erlang:abs(OldY - Y) >= 400
        of
        true -> {X, Y};
        _ -> get_rand_pos(OldX, OldY)
    end.

continue(StateName,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

continue(StateName, Reply,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

