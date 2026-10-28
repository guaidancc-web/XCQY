-file("src/mod/campaign/camp_animal_chess.erl", 1).

-module(camp_animal_chess).

-behaviour(gen_fsm).

-export([start_link/1,
         call/2,
         cast/2,
         init_pos/0,
         push/1,
         push_times/1,
         push_score/1,
         apply_start/2,
         apply_active/3,
         apply_over/2,
         apply_cancle/1,
         apply_kill/2,
         apply_killed/2,
         calc_score/3,
         check_move/2,
         shuffle/1]).

-export([start/2, active/2, over/2]).

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

-file("src/mod/campaign/camp_animal_chess.erl", 42).

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

-file("src/mod/campaign/camp_animal_chess.erl", 43).

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

-file("src/mod/campaign/camp_animal_chess.erl", 44).

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

-file("src/mod/campaign/camp_animal_chess.erl", 45).

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

-file("src/mod/campaign/camp_animal_chess.erl", 46).

-file("inc/looks.hrl", 1).

-file("src/mod/campaign/camp_animal_chess.erl", 47).

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

-file("src/mod/campaign/camp_animal_chess.erl", 48).

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

-file("src/mod/campaign/camp_animal_chess.erl", 49).

-file("inc/camp_animal_chess.hrl", 1).

-record(animal_chess,
        {id = 0,
         first_id = {0, "", 0},
         first_name = "",
         first_lev = 0,
         first_classes = 0,
         first_sex = 0,
         first_pid,
         first_looks = [],
         first_grade = 0,
         first_score = 0,
         second_id = {0, "", 0},
         second_name = "",
         second_lev = 0,
         second_classes = 0,
         second_sex = 0,
         second_pid,
         second_looks = [],
         second_grade = 0,
         second_score = 0,
         chesses = [],
         no_open = [],
         list = []}).

-record(animal_chess_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         looks = [],
         grade = 0,
         score = 0,
         time = 0}).

-record(animal_chess_pos,
        {pos = {0, 0},
         x = 0,
         y = 0,
         camp = 0,
         grade = 0,
         status = 0}).

-record(m_animal_chess,
        {grade = 1, score = 0, all_score = 0}).

-file("src/mod/campaign/camp_animal_chess.erl", 50).

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

-file("src/mod/campaign/camp_animal_chess.erl", 51).

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

-file("src/mod/campaign/camp_animal_chess.erl", 52).

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

-file("src/mod/campaign/camp_animal_chess.erl", 53).

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

-file("src/mod/campaign/camp_animal_chess.erl", 54).

-file("inc/pet.hrl", 1).

-record(pet_attr,
        {point = 0,
         p_str = 0,
         p_con = 0,
         p_mag = 0,
         p_agi = 0,
         p_end = 0,
         pre_str = 0,
         pre_con = 0,
         pre_mag = 0,
         pre_agi = 0,
         pre_end = 0,
         max_hp_apt_used = 0,
         max_phy_apt_used = 0,
         max_pdef_apt_used = 0,
         max_magic_apt_used = 0,
         max_aspd_apt_used = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         max_hp_aptitude = 0,
         max_phy_aptitude = 0,
         max_pdef_aptitude = 0,
         max_magic_aptitude = 0,
         max_aspd_aptitude = 0}).

-record(pet_tmp_aptitude,
        {is_valid = 0,
         tmp_genre = 0,
         tmp_pet_attr = #pet_attr{} :: #pet_attr{},
         tmp_skills = [],
         tmp_growth = 0,
         tmp_growth_type = 0,
         tmp_happy = 0,
         talent = 0}).

-record(pet_base,
        {id = 0,
         name = "",
         type = 1,
         genre = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         need_lev_break = 0,
         base_skills = [],
         vari_skills = [],
         lev_break_skills = [],
         has_break_skill = 0,
         base_happy = 1000,
         min_happy_ratio = 800,
         max_happy_ratio = 1050,
         min_happy_genre_ratio = 1000,
         max_happy_genre_ratio = 1100,
         growth_blue = 0,
         growth_purple = 0,
         growth_orange = 0,
         growth_red = 0,
         model_id = 0,
         model_id1 = 0,
         model_id2 = 0,
         model_id3 = 0,
         skin_id_0 = 0,
         skin_id_1 = 0,
         skin_id_2 = 0,
         skin_id_3 = 0,
         skin_id_s0 = 0,
         skin_id_s1 = 0,
         skin_id_s2 = 0,
         skin_id_s3 = 0,
         cost = [],
         lev_break_cost = [],
         max_wash_time = 0,
         manual_level = 0}).

-record(pet_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(pet_skill,
        {id = 0,
         lev = 1,
         exp = 1,
         step = 0,
         type = 0,
         source = 1,
         is_lock = 0,
         is_last_study = 0}).

-record(pet_skin,
        {use_skin = 0,
         has_skin = [],
         add_hp_aptitude = 0,
         add_phy_aptitude = 0,
         add_pdef_aptitude = 0,
         add_magic_aptitude = 0,
         add_aspd_aptitude = 0,
         add_growth = 0}).

-record(pet,
        {ver = 32 :: pos_integer(),
         id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         name = "" :: bitstring(),
         lev = 1 :: pos_integer(),
         talent = 0,
         growth = 0,
         growth_type = 2,
         use_growth = 0,
         genre = 0,
         exp = 0 :: non_neg_integer(),
         max_exp = 1 :: pos_integer(),
         status = 0 :: 0 | 1,
         base_id :: undefined | pos_integer(),
         attr :: undefined | tuple(),
         hp = 1,
         mp = 1,
         hp_max = 1,
         mp_max = 1,
         pet_attr = #pet_attr{} :: #pet_attr{},
         happy = 0 :: non_neg_integer(),
         looks = [] :: list(),
         skills = [],
         comprehend_lev = 1,
         grade = 0,
         grade_attr = [],
         stones = [],
         feed_item = [],
         feed_point = 0,
         free_reset_flag = 0,
         combat_talk = [],
         lock = 0,
         wash_time = 0,
         ai_skillid = 0,
         mount_skills = [],
         break_times = 0,
         is_first = 0,
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         pet_tmp_aptitude = #pet_tmp_aptitude{},
         glue_pudding_used = 0,
         pet_skin = #pet_skin{},
         spirit_attached = 0 :: 0 | 1,
         spirit_attached_id = 0 :: non_neg_integer(),
         spirit_skills = [],
         spirit_info = [],
         unreal = [],
         spirit_child_flag = 0 :: 0 | 1,
         spirit_child_id = {0, "", 0} :: tuple(),
         unreal_looks_flag = 0 :: 0 | 1,
         pet_rune = []}).

-record(m_pet,
        {ver = 2 :: pos_integer(),
         fresh_id = 1,
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         rename = 3 :: non_neg_integer(),
         pet_nums = 5,
         time = 0}).

-record(m_pet_store,
        {ver = 1 :: pos_integer(),
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         pet_nums = 4}).

-record(pet_goods,
        {base_id :: undefined | pos_integer(),
         actv_lev :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_shop_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | binary(),
         actv_lev :: undefined | pos_integer(),
         def_buy_price :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_exchange_data,
        {base_id = 0,
         item_id = 0,
         item_num = 0,
         exchange_item_num = 0,
         genre = 0,
         talent = 0}).

-record(pet_stone_polish_data,
        {stone_id = 0,
         attr = [],
         attr_name = 0,
         val_list = [],
         skill_list = []}).

-record(pet_unreal, {item_id = 0, timeout = 0}).

-record(pet_unreal_data,
        {item_id = 0,
         attr = [],
         skills = [],
         model_id = 0,
         skin_id = 0}).

-record(pet_rune,
        {rune_index = 0,
         rune_type = 0,
         rune_status = 0,
         rune_id = 0,
         rune_lev = 0,
         is_resonance = 0,
         resonances = []}).

-record(pet_resonance,
        {resonance_index = 0,
         resonance_id = 0,
         rune_index = 0}).

-file("src/mod/campaign/camp_animal_chess.erl", 55).

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

-file("src/mod/campaign/camp_animal_chess.erl", 56).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/campaign/camp_animal_chess.erl", 57).

-record(state,
        {ts,
         timeout,
         round = 0,
         round_acc = 0,
         id = 1,
         action = 1,
         endtime = 0,
         draw_list = [],
         role_list = [],
         flag = 0}).

push(#state{round = Round, id = Id, action = NextMove,
            endtime = Time, draw_list = DrawList}) ->
    case ets:lookup(animal_chess, Id) of
        [AnimalChess = #animal_chess{first_pid = FirstPid,
                                     second_pid = SecondPid}] ->
            role:pack_send(FirstPid,
                           17848,
                           {Round, Time, NextMove, DrawList, AnimalChess}),
            role:pack_send(SecondPid,
                           17848,
                           {Round, Time, NextMove, DrawList, AnimalChess});
        _R ->
            logger:debug("拿不到数据 ~w",
                         [{Id, _R}],
                         camp_animal_chess,
                         96),
            ok
    end.

push(#state{round = Round, action = NextMove,
            endtime = Time, draw_list = DrawList},
     AnimalChess = #animal_chess{first_pid = FirstPid,
                                 second_pid = SecondPid}) ->
    role:pack_send(FirstPid,
                   17848,
                   {Round, Time, NextMove, DrawList, AnimalChess}),
    role:pack_send(SecondPid,
                   17848,
                   {Round, Time, NextMove, DrawList, AnimalChess});
push(#state{round = Round, id = Id, action = NextMove,
            endtime = Time, draw_list = DrawList},
     Pid)
    when is_pid(Pid) ->
    case ets:lookup(animal_chess, Id) of
        [AnimalChess = #animal_chess{}] ->
            role:pack_send(Pid,
                           17848,
                           {Round, Time, NextMove, DrawList, AnimalChess});
        _R ->
            logger:debug("拿不到数据 ~w",
                         [{Id, _R}],
                         camp_animal_chess,
                         107),
            ok
    end;
push(_A, _B) ->
    logger:debug("============ ~w ~w",
                 [_A, _B],
                 camp_animal_chess,
                 111),
    ok.

push_times(Role) ->
    Times = var:get_var(Role, day, 110, 0),
    {Status1, EndTime1} = case
                              env:get(camp_animal_chess_status)
                              of
                              {Status, EndTime} -> {Status, EndTime};
                              _ -> {0, 0}
                          end,
    role:link_send(Role,
                   17851,
                   {max(2 - Times, 0), Status1, EndTime1}),
    ok.

push_score(Role = #role{m_campaign =
                            #m_campaign{camp_animal_chess =
                                            #m_animal_chess{grade = Grade,
                                                            score = Score}}}) ->
    logger:debug("============ ~w ~w",
                 [Grade, Score],
                 camp_animal_chess,
                 125),
    role:link_send(Role, 17856, {Grade, Score}),
    ok.

push(Role, Cmd = 17853, Data) ->
    role:link_send(Role, Cmd, Data),
    ok.

apply_start(Role, EventPid) ->
    logger:debug("更新个人信息", [], camp_animal_chess, 134),
    NewRole = Role#role{s_event = 50,
                        s_event_pid = EventPid},
    notice:send(NewRole, 1, lang:get("匹配成功，5秒后进入游戏")),
    map:role_status_update(NewRole),
    {ok, NewRole}.

apply_active(Role, EventPid, Msg) ->
    logger:debug("更新个人信息", [], camp_animal_chess, 142),
    NewRole = Role#role{s_event = 49,
                        s_event_pid = EventPid},
    notice:pop(NewRole, 2, Msg),
    map:role_status_update(NewRole),
    {ok, NewRole}.

apply_over(Role = #role{name = RoleName,
                        m_campaign =
                            Mc = #m_campaign{camp_animal_chess =
                                                 CAC = #m_animal_chess{all_score
                                                                           =
                                                                           AllScore}}},
           Result) ->
    logger:debug("获胜结算 ~w",
                 [Result],
                 camp_animal_chess,
                 151),
    ResultType = case Result of
                     win -> 1;
                     loss -> 2;
                     _ -> 3
                 end,
    {Grade,
     Score,
     AddScore,
     ExpReward,
     ItemReward,
     CastReward} =
        get_reward(Role, ResultType),
    {ok, ExpRole} =
        role_gain:do(format:val_to_gain(ExpReward), Role),
    GainRole1 = case
                    role_gain:do(format:val_to_gain(ItemReward), ExpRole)
                    of
                    {ok, GainRole} -> GainRole;
                    _ ->
                        mail:send(ExpRole,
                                  lang:get("斗兽棋奖励"),
                                  lang:get("你在参加斗兽棋活动中，背包已满"),
                                  ItemReward),
                        ExpRole
                end,
    Role1 = var:acc_var(GainRole1, day, 110),
    TriggerRole =
        role_trigger:fire(#evt_camp_animal_chess{}, Role1),
    NewRole = TriggerRole#role{m_campaign =
                                   Mc#m_campaign{camp_animal_chess =
                                                     CAC#m_animal_chess{grade =
                                                                            Grade,
                                                                        score =
                                                                            Score,
                                                                        all_score
                                                                            =
                                                                            AllScore
                                                                                +
                                                                                AddScore}},
                               s_event = 0, s_event_pid = undefined},
    push(NewRole,
         17853,
         {ResultType, Grade, Score, ExpReward ++ ItemReward}),
    case CastReward of
        [_ | _] ->
            Msg =
                notice:format(lang:get("~ts在~ts中激战正酣，吃掉对方棋子后竟发现了一个~ts{face_1 "
                                       ",42}"),
                              [{role_2, RoleName},
                               {string_2, 1, lang:get("斗兽棋")},
                               {item_2, CastReward}]),
            notice:cast(all, 5, Msg);
        _ -> ok
    end,
    map:role_status_update(NewRole),
    NewRole1 = case Result of
                   win ->
                       role_trigger:fire(#evt_animal_chess_win{}, NewRole);
                   loss ->
                       role_trigger:fire(#evt_animal_chess_fail{}, NewRole);
                   _ -> NewRole
               end,
    push_times(NewRole1),
    {ok, NewRole1}.

apply_cancle(Role = #role{s_event = Event})
    when Event =:= 49 ->
    NewRole = Role#role{s_event = 0,
                        s_event_pid = undefined},
    map:role_status_update(NewRole),
    {ok, NewRole};
apply_cancle(_) -> ok.

apply_kill(Role = #role{id = RoleId, s_event = Event},
           #{round := Round, grade1 := Grade1, grade2 := Grade2})
    when Event =:= 49 ->
    logger:debug("击杀奖励 ~w",
                 [Event],
                 camp_animal_chess,
                 194),
    {RoleExp, PetExp} = get_exp_reward(Role, 4),
    logger:debug("击杀奖励 ~w",
                 [{RoleExp, PetExp}],
                 camp_animal_chess,
                 196),
    Reward = RoleExp ++ PetExp,
    SoldierRole = case Grade1 =:= 1 andalso Grade2 =:= 6 of
                      true ->
                          role_trigger:fire(#evt_animal_chess_soldier{}, Role);
                      _ -> Role
                  end,
    KillCoachRole = case Grade2 =:= 6 andalso Round =< 10 of
                        true ->
                            role_trigger:fire(#evt_animal_chess_kill_coach{},
                                              SoldierRole);
                        _ -> SoldierRole
                    end,
    KillSoldierRole = case Grade2 =:= 1 of
                          true ->
                              role_trigger:fire(#evt_animal_chess_kill_soldier{},
                                                KillCoachRole);
                          _ -> KillCoachRole
                      end,
    GainRole1 = case
                    role_gain:do_notice(format:val_to_gain(Reward),
                                        KillSoldierRole)
                    of
                    {ok, GainRole} -> GainRole;
                    _ ->
                        mail:send(RoleId,
                                  lang:get("斗兽棋奖励"),
                                  lang:get("你在参加斗兽棋活动中，背包已满"),
                                  Reward),
                        KillSoldierRole
                end,
    {ok, GainRole1};
apply_kill(_Role, _) ->
    logger:debug("错误的击杀奖励 ~w",
                 [_Role#role.s_event],
                 camp_animal_chess,
                 219),
    ok.

apply_killed(Role,
             #{round := Round, grade1 := _Grade1,
               grade2 := Grade2}) ->
    CoachKilledRole = case Grade2 =:= 6 andalso Round =< 10
                          of
                          true ->
                              role_trigger:fire(#evt_animal_chess_coach_killed{},
                                                Role);
                          _ -> Role
                      end,
    {ok, CoachKilledRole};
apply_killed(_Role, _Args) -> ok.

get_reward(Role = #role{m_campaign =
                            #m_campaign{camp_animal_chess =
                                            #m_animal_chess{grade = LastGrade,
                                                            score =
                                                                LastScore}}},
           Result) ->
    {AddScore, AddFlower} = case
                                camp_animal_chess_data:get_score(LastGrade)
                                of
                                #{win := Win, win_flower := WinFlower}
                                    when Result =:= 1 ->
                                    {Win, WinFlower};
                                #{loss := Loss, loss_flower := LossFlower}
                                    when Result =:= 2 ->
                                    {0 - Loss, LossFlower};
                                #{draw := Draw, draw_flower := DrawFlower}
                                    when Result =:= 3 ->
                                    {Draw, DrawFlower};
                                _ -> {0, 0}
                            end,
    {NewGrade, NewScore} = calc_score(LastGrade,
                                      LastScore,
                                      AddScore),
    logger:debug("========= ~w",
                 [{LastGrade,
                   LastScore,
                   AddScore,
                   AddFlower,
                   NewGrade,
                   NewScore}],
                 camp_animal_chess,
                 245),
    ScoreReward = [{90037, 0, AddFlower}],
    {RoleExp, PetExp} = get_exp_reward(Role, Result),
    case camp_animal_chess_data:get_special_list(Result) of
        {{_}, SpecialList} ->
            SpecialNum = get_reward_num(SpecialList),
            SpecialList1 = check_role_cond(Role, SpecialList),
            GetSpecialGain = get_rand_list(SpecialList1,
                                           SpecialNum),
            NewGainInfo = make_gain(GetSpecialGain, []),
            NewGainInfo1 = [{item_type:special_id(BaseId),
                             Bind,
                             Num,
                             IsCast}
                            || {BaseId, Bind, Num, IsCast} <- NewGainInfo],
            GetGainInfo = [{BaseId, Bind, Num}
                           || {BaseId, Bind, Num, _} <- NewGainInfo1],
            CastGainInfo = [{BaseId, Bind, Num}
                            || {BaseId, Bind, Num, IsCast} <- NewGainInfo1,
                               IsCast =:= 1],
            ExpReward = RoleExp ++ PetExp,
            ItemReward = GetGainInfo ++ ScoreReward,
            logger:debug("====== ~w",
                         [{GetGainInfo, RoleExp, PetExp, ScoreReward}],
                         camp_animal_chess,
                         259),
            {NewGrade,
             NewScore,
             AddScore,
             ExpReward,
             ItemReward,
             CastGainInfo};
        _ -> {NewGrade, NewScore, AddScore, [], [], []}
    end.

get_exp_reward(Role = #role{lev = Lev}, Result) ->
    {Model, ExpRatio} = get_exp_mod(Result),
    RoleExp = case levup_data:get_exp({Model, Lev}) of
                  #{exp := GetExp} when GetExp > 0 ->
                      [{90010, 0, round(GetExp * ExpRatio / 1000)}];
                  _ -> []
              end,
    PetExp = case pet:get_war_pet(Role) of
                 {ok, #pet{lev = PetLev}} ->
                     case levup_data:get_exp({Model, PetLev}) of
                         #{pet_exp := GetPetExp} when GetPetExp > 0 ->
                             [{90005, 0, round(GetPetExp * ExpRatio / 1000)}];
                         _ -> []
                     end;
                 _ -> []
             end,
    {RoleExp, PetExp}.

get_exp_mod(Result) ->
    case camp_animal_chess_data:get_exp(Result) of
        #{model := Model, ratio := Ratio} -> {Model, Ratio};
        _ ->
            logger:info("没有经验模型 ~w",
                        [Result],
                        camp_animal_chess,
                        286),
            {0, 0}
    end.

calc_score(LastGrade, LastScore, AddScore) ->
    case camp_animal_chess_data:get_score(LastGrade) of
        #{next_grade := NextGrade} ->
            if LastScore + AddScore >= NextGrade ->
                   calc_score(LastGrade + 1,
                              0,
                              LastScore + AddScore - NextGrade);
               LastScore + AddScore < 0 andalso LastGrade =< 1 ->
                   {1, 0};
               LastScore + AddScore < 0 ->
                   logger:debug("===== ~w",
                                [{LastScore + AddScore, LastGrade}],
                                camp_animal_chess,
                                300),
                   #{next_grade := LastGrade1} =
                       camp_animal_chess_data:get_score(LastGrade - 1),
                   calc_score(LastGrade - 1,
                              LastGrade1,
                              LastScore + AddScore);
               true -> {LastGrade, LastScore + AddScore}
            end;
        _ ->
            logger:info("错误的数据~w",
                        [LastGrade],
                        camp_animal_chess,
                        307),
            {LastGrade, LastScore}
    end.

check_role_cond(#role{sex = Sex, lev = Lev,
                      classes = Classes,
                      m_lev_break = #m_lev_break{times = BreakTimes}},
                List) ->
    check_role_cond(#{lev => Lev, sex => Sex,
                      classes => Classes, break_times => BreakTimes},
                    List,
                    []).

check_role_cond(_Args, [], List) -> List;
check_role_cond(Args = #{sex := Sex, lev := Lev,
                         classes := Classes, break_times := BreakTimes},
                [H = #{sex := Sex1, lev_low := LevLow,
                       lev_high := LevHigh, classes := Classes1,
                       break_times_min := MinBreakTimes,
                       break_times_max := MaxBreakTimes}
                 | T],
                List)
    when (Sex1 =:= Sex orelse Sex1 =:= 2) andalso
             (Classes1 =:= Classes orelse Classes1 =:= 0) andalso
                 (BreakTimes >= MinBreakTimes andalso
                      BreakTimes =< MaxBreakTimes)
                     andalso
                     (LevLow =:= 0 andalso LevHigh =:= 0 orelse
                          LevLow =:= 0 andalso Lev =< LevHigh orelse
                              Lev >= LevLow andalso LevHigh =:= 0 orelse
                                  Lev >= LevLow andalso Lev =< LevHigh) ->
    check_role_cond(Args, T, [H | List]);
check_role_cond(Args, [_ | T], List) ->
    check_role_cond(Args, T, List).

get_rand_list(List, Nums) ->
    {Normal, RandomList} = lists:partition(fun (#{ratio :=
                                                      Ratio}) ->
                                                   Ratio =:= 0
                                           end,
                                           List),
    Len = length(Normal),
    AllRatio = lists:sum([Ratio
                          || #{ratio := Ratio} <- RandomList]),
    do_get_rand_list(RandomList, AllRatio, Nums - Len, [])
        ++ Normal.

do_get_rand_list(_List, _Rate, Num, GetList)
    when Num =< 0 ->
    GetList;
do_get_rand_list([], _Rate, _Num, GetList) -> GetList;
do_get_rand_list(List, Rate, Num, GetList) ->
    Seed = util:rand(1, Rate),
    case do_get_rand_item(List, Seed, Rate) of
        {NewL, GetL, NewRate} ->
            do_get_rand_list(NewL,
                             NewRate,
                             Num - 1,
                             [GetL | GetList]);
        {false, Reason} ->
            logger:error("随机奖励发生错误，礼包内容为:~w",
                         [Reason],
                         camp_animal_chess,
                         346),
            do_get_rand_list(List, Rate, Num - 1, GetList)
    end.

do_get_rand_item(List, Seed, Rate) ->
    do_get_rand_item(List, Seed, Rate, 0, []).

do_get_rand_item([], _Seed, _Rate, _Range, _Back) ->
    {false, util:flist("~w", [_Back])};
do_get_rand_item([L = #{ratio := Ratio} | T], Seed,
                 Rate, Range, Back) ->
    case Seed =< Ratio + Range of
        true -> {T ++ Back, L, Rate - Ratio};
        false ->
            do_get_rand_item(T,
                             Seed,
                             Rate,
                             Range + Ratio,
                             [L | Back])
    end.

make_gain([], GainInfo) -> GainInfo;
make_gain([#{item_id := ItemId, num := Num,
             bind := Bind, is_cast := IsCast}
           | T],
          GainInfo) ->
    case lists:keyfind(ItemId, 1, GainInfo) of
        {ItemId, Bind, OldNum} ->
            make_gain(T,
                      lists:keyreplace(ItemId,
                                       1,
                                       GainInfo,
                                       {ItemId, Bind, OldNum + Num, IsCast}));
        _ ->
            make_gain(T, [{ItemId, Bind, Num, IsCast} | GainInfo])
    end.

check_move(StartPos, StartPos) ->
    {false, lang:get("请选择相邻的位置发起移动或进攻")};
check_move({X, Y}, Pos) ->
    List = [{X - 1, Y}, {X + 1, Y}, {X, Y - 1}, {X, Y + 1}],
    case lists:member(Pos, List) of
        true -> ok;
        _ -> {false, lang:get("请选择相邻的位置发起移动或进攻")}
    end.

start_link(Args = #{role1 :=
                        #animal_chess_role{pid = FirstPid},
                    role2 := #animal_chess_role{pid = SecondPid}}) ->
    logger:debug("============ ",
                 [],
                 camp_animal_chess,
                 384),
    case gen_fsm:start_link(camp_animal_chess, [Args], [])
        of
        {ok, Pid} ->
            role:apply(async,
                       FirstPid,
                       {camp_animal_chess, apply_start, [Pid]}),
            role:apply(async,
                       SecondPid,
                       {camp_animal_chess, apply_start, [Pid]}),
            ok;
        _ -> logger:info("斗兽棋启动失败", [], camp_animal_chess, 391)
    end.

cast(Pid, Event) ->
    gen_fsm:send_all_state_event(Pid, Event).

call(Pid, Event) ->
    try gen_fsm:sync_send_all_state_event(Pid, Event) catch
        _Type:_Reason ->
            logger:debug("Type: ~w  Reason: ~w",
                         [_Type, _Reason],
                         camp_animal_chess,
                         406),
            {error, timeout}
    end.

init([Args = #{id := Id}]) ->
    process_flag(trap_exit, true),
    logger:debug("开始启动", [], camp_animal_chess, 415),
    List = init_pos(),
    {Data, RoleList} = init_data(Args),
    NewData = Data#animal_chess{chesses = List, id = Id},
    save(NewData),
    TimeLeft = 5,
    Now = date:unixtime(),
    NState = #state{id = Id, endtime = Now + TimeLeft,
                    ts = date:now2(), timeout = TimeLeft * 1000,
                    role_list = RoleList},
    push(NState, NewData),
    logger:debug("启动完成", [], camp_animal_chess, 424),
    {ok, start, NState, TimeLeft * 1000}.

handle_event({push_role, #{pid := Pid}}, StateName,
             State) ->
    push(State, Pid),
    continue(StateName, State);
handle_event({give_up,
              #{role_id := RoleId, pid := Pid}},
             StateName, State = #state{round = Round, id = Id})
    when Round > 15 ->
    logger:debug("=================== ~w",
                 [{RoleId, Id}],
                 camp_animal_chess,
                 434),
    case fetch(Id) of
        #animal_chess{first_id = FirstId,
                      second_id = SecondId} ->
            {WinId, GiveUpId} = case RoleId of
                                    FirstId -> {SecondId, FirstId};
                                    _ -> {FirstId, SecondId}
                                end,
            notice:send(WinId,
                        1,
                        lang:get("折服于你出色的棋技，对方投降了！{face_1 ,10}")),
            notice:send(WinId,
                        22,
                        lang:get("折服于你出色的棋技，对方投降了！{face_1 ,10}")),
            role:apply(async,
                       WinId,
                       {camp_animal_chess, apply_over, [win]}),
            role:apply(async,
                       GiveUpId,
                       {camp_animal_chess, apply_over, [loss]}),
            {stop, normal, State};
        _ ->
            role:pack_send(Pid, 17850, {0, lang:get("数据出错了")}),
            continue(StateName, State)
    end;
handle_event({give_up, _Args = #{pid := Pid}},
             StateName, State) ->
    logger:debug("===== ~w",
                 [{_Args, StateName, State#state.round}],
                 camp_animal_chess,
                 451),
    role:pack_send(Pid,
                   17850,
                   {0, lang:get("15回合后才可投降哟~{face_1, 30}")}),
    continue(StateName, State);
handle_event({ask_draw,
              #{role_id := RoleId, pid := Pid}},
             StateName,
             State = #state{round = Round, id = Id,
                            draw_list = DrawList})
    when Round > 25 ->
    logger:debug("=================== ~w",
                 [{RoleId, Id}],
                 camp_animal_chess,
                 457),
    Now = date:unixtime(),
    case fetch(Id) of
        #animal_chess{first_id = FirstId, first_pid = FirstPid,
                      second_id = _SecondId, second_pid = SecondPid} ->
            {Camp, ToPid} = case FirstId =:= RoleId of
                                true -> {1, SecondPid};
                                _ -> {2, FirstPid}
                            end,
            Result = case lists:keyfind(Camp, 1, DrawList) of
                         false -> ok;
                         {Camp, _, Time} when Now >= Time -> ok;
                         {Camp, Time, _} when Now < Time ->
                             {false, lang:get("正在进行求和{face_1 ,22}，不要重复请求哟")};
                         {Camp, _, Time} ->
                             {false,
                              notice:format(lang:get("还有~ts秒才能再次求和"),
                                            [{string_2, 5, Time - Now}])};
                         _ ->
                             logger:error("错误的求和数据 ~w",
                                          [{RoleId, DrawList}],
                                          camp_animal_chess,
                                          475),
                             {false, lang:get("求和数据出错")}
                     end,
            case Result of
                ok ->
                    role:pack_send(ToPid, 17857, {}),
                    role:pack_send(Pid,
                                   17850,
                                   {1,
                                    lang:get("已向对方请求和棋，等待对方确认{face_1 ,21}")}),
                    continue(StateName,
                             State#state{draw_list =
                                             lists:keystore(Camp,
                                                            1,
                                                            DrawList,
                                                            {Camp,
                                                             Now + 20,
                                                             Now + 120})});
                {false, Reason} ->
                    role:pack_send(Pid, 17850, {0, Reason}),
                    continue(StateName, State)
            end;
        _R ->
            logger:error("发起求和失败 ~w", [_R], camp_animal_chess, 488),
            role:pack_send(Pid, 17850, {0, lang:get("发起求和失败")}),
            continue(StateName, State)
    end;
handle_event({ask_draw, #{pid := Pid}}, StateName,
             State) ->
    role:pack_send(Pid,
                   17850,
                   {0, lang:get("25回合后才可求和哟~{face_1, 30}")}),
    continue(StateName, State);
handle_event({reply_draw,
              #{role_id := RoleId, pid := Pid, flag := Flag}},
             StateName,
             State = #state{round = Round, id = Id,
                            draw_list = DrawList})
    when Round >= 0 ->
    logger:debug("=================== ~w",
                 [{RoleId, Id, Flag}],
                 camp_animal_chess,
                 498),
    Now = date:unixtime(),
    {DrawCamp, DrawId} = case fetch(Id) of
                             #animal_chess{first_id = FirstId,
                                           second_id = SecondId}
                                 when FirstId =:= RoleId ->
                                 {2, SecondId};
                             #animal_chess{first_id = FirstId,
                                           second_id = SecondId}
                                 when SecondId =:= RoleId ->
                                 {1, FirstId};
                             _ -> 0
                         end,
    case lists:keyfind(DrawCamp, 1, DrawList) of
        {_, Time1, _Time2}
            when Now =< Time1 andalso Flag =:= 1 ->
            role:apply(async,
                       RoleId,
                       {camp_animal_chess, apply_over, [draw]}),
            role:apply(async,
                       DrawId,
                       {camp_animal_chess, apply_over, [draw]}),
            {stop, normal, State};
        {_, Time1, _Time2}
            when Now =< Time1 andalso Flag =:= 0 ->
            Msg1 =
                notice:format(lang:get("~ts残忍拒绝了~ts的求和{face_1 ,17}"),
                              [{string_2, 2, lang:get("你")},
                               {string_2, 6, lang:get("对方")}]),
            Msg2 =
                notice:format(lang:get("~ts残忍拒绝了~ts的求和{face_1 ,19}"),
                              [{string_2, 6, lang:get("对方")},
                               {string_2, 2, lang:get("你")}]),
            notice:send({pid, Pid}, 1, Msg1),
            notice:send(DrawId, 1, Msg2),
            notice:send({pid, Pid}, 22, Msg1),
            notice:send(DrawId, 22, Msg2),
            NewDrawList = lists:keystore(DrawCamp,
                                         1,
                                         DrawList,
                                         {DrawCamp, 0, Now + 120}),
            NewState = State#state{draw_list = NewDrawList},
            push(NewState),
            continue(StateName, NewState);
        _R ->
            logger:info("过期的求和求 ~w",
                        [{DrawId, _R, Now}],
                        camp_animal_chess,
                        524),
            notice:send({pid, Pid}, 1, lang:get("该请求已过期")),
            continue(StateName, State)
    end;
handle_event({chat, Msg}, StateName,
             State = #state{role_list = RoleList}) ->
    logger:debug("场景聊天", [], camp_animal_chess, 531),
    [role:pack_send(RoleId, 10400, Msg)
     || RoleId <- RoleList],
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event({push_role, #{pid := Pid}}, _From,
                  StateName, State) ->
    logger:debug("======================================",
                 [],
                 camp_animal_chess,
                 542),
    push(State, Pid),
    continue(StateName, State);
handle_sync_event({move,
                   #{start_pos := StartPos, end_pos := EndPos,
                     role_id := RoleId}},
                  _From, StateName,
                  State = #state{id = Id, action = Camp,
                                 round_acc = RoundAcc, round = Round}) ->
    Result = case ets:lookup(animal_chess, Id) of
                 [Ac = #animal_chess{first_id = FirstId,
                                     second_id = SecondId, first_pid = FirstPid,
                                     second_pid = SecondPid, chesses = Chesses,
                                     list = List}]
                     when FirstId =:= RoleId andalso Camp =:= 1 orelse
                              SecondId =:= RoleId andalso Camp =:= 2 ->
                     case lists:keyfind(StartPos,
                                        #animal_chess_pos.pos,
                                        Chesses)
                         of
                         Acp1 = #animal_chess_pos{camp = Camp1, grade = Grade1,
                                                  status = Status1}
                             when Status1 =:= 2 andalso Camp =:= Camp1 ->
                             case lists:keyfind(EndPos,
                                                #animal_chess_pos.pos,
                                                Chesses)
                                 of
                                 Acp2 = #animal_chess_pos{status = Status2}
                                     when Status2 =:= 0 ->
                                     logger:debug("向空的位置移动",
                                                  [],
                                                  camp_animal_chess,
                                                  554),
                                     Chesses1 = lists:keystore(StartPos,
                                                               #animal_chess_pos.pos,
                                                               Chesses,
                                                               Acp1#animal_chess_pos{status
                                                                                         =
                                                                                         0,
                                                                                     camp
                                                                                         =
                                                                                         0,
                                                                                     grade
                                                                                         =
                                                                                         0}),
                                     Chesses2 = lists:keystore(EndPos,
                                                               #animal_chess_pos.pos,
                                                               Chesses1,
                                                               Acp2#animal_chess_pos{status
                                                                                         =
                                                                                         Status1,
                                                                                     camp
                                                                                         =
                                                                                         Camp1,
                                                                                     grade
                                                                                         =
                                                                                         Grade1}),
                                     NewAc = Ac#animal_chess{chesses = Chesses2,
                                                             list =
                                                                 lists:keydelete(Camp,
                                                                                 1,
                                                                                 List)},
                                     save(NewAc),
                                     State1 = State#state{timeout = 0, flag = 1,
                                                          round_acc =
                                                              RoundAcc + 1},
                                     {ok, State1};
                                 Acp2 = #animal_chess_pos{camp = Camp2,
                                                          status = Status2,
                                                          grade = Grade2}
                                     when Status2 =:= 2 andalso
                                              Camp2 =/= Camp1 ->
                                     case check_grade(Grade1, Grade2) of
                                         true ->
                                             logger:debug("对对方棋子发起进攻",
                                                          [],
                                                          camp_animal_chess,
                                                          564),
                                             Chesses1 = lists:keystore(StartPos,
                                                                       #animal_chess_pos.pos,
                                                                       Chesses,
                                                                       Acp1#animal_chess_pos{status
                                                                                                 =
                                                                                                 0,
                                                                                             camp
                                                                                                 =
                                                                                                 0,
                                                                                             grade
                                                                                                 =
                                                                                                 0}),
                                             Chesses2 = lists:keystore(EndPos,
                                                                       #animal_chess_pos.pos,
                                                                       Chesses1,
                                                                       Acp2#animal_chess_pos{status
                                                                                                 =
                                                                                                 Status1,
                                                                                             camp
                                                                                                 =
                                                                                                 Camp1,
                                                                                             grade
                                                                                                 =
                                                                                                 Grade1}),
                                             Msg1 =
                                                 notice:format(lang:get("~ts~ts击杀了~ts~ts"),
                                                               [{string_2,
                                                                 2,
                                                                 get_name(Grade1)},
                                                                {string_2,
                                                                 2,
                                                                 lang:get("(我方)")},
                                                                {string_2,
                                                                 6,
                                                                 get_name(Grade2)},
                                                                {string_2,
                                                                 6,
                                                                 lang:get("(敌方)")}]),
                                             Msg2 =
                                                 notice:format(lang:get("~ts~ts击杀了~ts~ts"),
                                                               [{string_2,
                                                                 6,
                                                                 get_name(Grade1)},
                                                                {string_2,
                                                                 6,
                                                                 lang:get("(敌方)")},
                                                                {string_2,
                                                                 2,
                                                                 get_name(Grade2)},
                                                                {string_2,
                                                                 2,
                                                                 lang:get("(我方)")}]),
                                             case Camp of
                                                 1 ->
                                                     notice:send({pid,
                                                                  FirstPid},
                                                                 22,
                                                                 Msg1),
                                                     notice:send({pid,
                                                                  SecondPid},
                                                                 22,
                                                                 Msg2);
                                                 _ ->
                                                     notice:send({pid,
                                                                  FirstPid},
                                                                 22,
                                                                 Msg2),
                                                     notice:send({pid,
                                                                  SecondPid},
                                                                 22,
                                                                 Msg1)
                                             end,
                                             ToRoleId = case RoleId of
                                                            FirstId -> SecondId;
                                                            _ -> FirstId
                                                        end,
                                             role:apply(async,
                                                        RoleId,
                                                        {camp_animal_chess,
                                                         apply_kill,
                                                         [#{round => Round,
                                                            grade1 => Grade1,
                                                            grade2 =>
                                                                Grade2}]}),
                                             role:apply(async,
                                                        ToRoleId,
                                                        {camp_animal_chess,
                                                         apply_killed,
                                                         [#{round => Round,
                                                            grade1 => Grade1,
                                                            grade2 =>
                                                                Grade2}]}),
                                             NewAc = Ac#animal_chess{chesses =
                                                                         Chesses2,
                                                                     list =
                                                                         lists:keydelete(Camp,
                                                                                         1,
                                                                                         List)},
                                             save(NewAc),
                                             State1 = State#state{timeout = 0,
                                                                  flag = 1,
                                                                  round_acc =
                                                                      0},
                                             {ok, State1};
                                         false -> {false, lang:get("这个目标太强了")}
                                     end;
                                 #animal_chess_pos{camp = Camp2}
                                     when Camp1 =:= Camp2 ->
                                     {false, lang:get("不可攻击友方单位哟")};
                                 #animal_chess_pos{status = Status2}
                                     when Status2 =:= 1 ->
                                     {false, lang:get("该位置未打开,不能发起进攻")};
                                 _ ->
                                     logger:info("错误的位置 ~w",
                                                 [EndPos],
                                                 camp_animal_chess,
                                                 595),
                                     {false, lang:get("错误的位置")}
                             end;
                         _R ->
                             logger:debug("============ ~w",
                                          [{_R, Chesses, Camp}],
                                          camp_animal_chess,
                                          599),
                             {false, lang:get("这不是你的单位")}
                     end;
                 [#animal_chess{}] ->
                     {false,
                      notice:format(lang:get("当前是~ts回合！请稍等后再进行操作{face_1 ,22}"),
                                    [{string_2, 6, lang:get("对方")}])};
                 _ -> {false, lang:get("出错了")}
             end,
    {Reply, NewState} = case Result of
                            {ok, State2} -> {ok, State2};
                            {false, Reason} -> {{false, Reason}, State}
                        end,
    continue(StateName, Reply, NewState);
handle_sync_event({open,
                   #{pos := Pos, role_id := RoleId}},
                  _From, StateName,
                  State = #state{action = Action, id = Id}) ->
    logger:debug("=================== ~w",
                 [{Pos, Id}],
                 camp_animal_chess,
                 616),
    Result = case fetch(Id) of
                 Ac = #animal_chess{first_id = FirstId,
                                    first_pid = FirstPid,
                                    second_pid = SecondPid,
                                    first_name = FirstName,
                                    second_name = SecondName,
                                    second_id = SecondId, chesses = Chesses,
                                    list = List}
                     when FirstId =:= RoleId andalso Action =:= 1 orelse
                              SecondId =:= RoleId andalso Action =:= 2 ->
                     case lists:keyfind(Pos, #animal_chess_pos.pos, Chesses)
                         of
                         #animal_chess_pos{status = Status, grade = Grade,
                                           camp = Camp} =
                             Acp
                             when Status =:= 1 ->
                             logger:debug("打开箱子", [], camp_animal_chess, 622),
                             Name = case Action of
                                        1 -> FirstName;
                                        _ -> SecondName
                                    end,
                             {Color1, Color2, CampName1, CampName2} = case
                                                                          Action
                                                                              =:=
                                                                              Camp
                                                                          of
                                                                          true ->
                                                                              {2,
                                                                               6,
                                                                               lang:get("(我方)"),
                                                                               lang:get("(敌方)")};
                                                                          _ ->
                                                                              {6,
                                                                               2,
                                                                               lang:get("(敌方)"),
                                                                               lang:get("(我方)")}
                                                                      end,
                             Msg1 = notice:format(lang:get("~ts开启了一个~ts~ts"),
                                                  [{string_2, 2, Name},
                                                   {string_2,
                                                    Color1,
                                                    get_name(Grade)},
                                                   {string_2,
                                                    Color1,
                                                    CampName1}]),
                             Msg2 = notice:format(lang:get("~ts开启了一个~ts~ts"),
                                                  [{string_2, 6, Name},
                                                   {string_2,
                                                    Color2,
                                                    get_name(Grade)},
                                                   {string_2,
                                                    Color2,
                                                    CampName2}]),
                             case Action of
                                 1 ->
                                     notice:send({pid, FirstPid}, 22, Msg1),
                                     notice:send({pid, SecondPid}, 22, Msg2);
                                 _ ->
                                     notice:send({pid, FirstPid}, 22, Msg2),
                                     notice:send({pid, SecondPid}, 22, Msg1)
                             end,
                             Chesses1 = lists:keystore(Pos,
                                                       #animal_chess_pos.pos,
                                                       Chesses,
                                                       Acp#animal_chess_pos{status
                                                                                =
                                                                                2}),
                             NewAc = Ac#animal_chess{chesses = Chesses1,
                                                     list =
                                                         lists:keydelete(Action,
                                                                         1,
                                                                         List)},
                             save(NewAc),
                             State1 = State#state{timeout = 0, flag = 1,
                                                  round_acc = 0},
                             {ok, State1};
                         _R ->
                             logger:debug("=================== ~w",
                                          [_R],
                                          camp_animal_chess,
                                          647),
                             {false, lang:get("该位置不能打开")}
                     end;
                 #animal_chess{} ->
                     {false,
                      notice:format(lang:get("当前是~ts回合！请稍等后再进行操作{face_1 ,22}"),
                                    [{string_2, 6, lang:get("对方")}])};
                 _R ->
                     logger:debug("=================== ~w",
                                  [_R],
                                  camp_animal_chess,
                                  653),
                     {false, lang:get("数据出错了")}
             end,
    {Reply, NewState} = case Result of
                            {ok, State2} -> {ok, State2};
                            {false, Reason} -> {{false, Reason}, State}
                        end,
    continue(StateName, Reply, NewState);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName,
          _State = #state{id = Id}) ->
    logger:debug("斗兽棋报错退出处理 ~w ~w",
                 [_Reason, _StateName],
                 camp_animal_chess,
                 674),
    #animal_chess{first_pid = FirstPid,
                  second_pid = SecondPid} =
        fetch(Id),
    role:apply(async,
               FirstPid,
               {camp_animal_chess, apply_cancle, []}),
    role:apply(async,
               SecondPid,
               {camp_animal_chess, apply_cancle, []}),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

start(timeout, State = #state{id = Id}) ->
    logger:debug("正式开始", [], camp_animal_chess, 688),
    #animal_chess{first_pid = FirstPid,
                  second_pid = SecondPid} =
        fetch(Id),
    Msg1 =
        notice:format(lang:get("~ts开始了！本局游戏~ts先手，请进行操作{face_1 ,7}"),
                      [{string_2, 5, lang:get("斗兽棋")},
                       {string_2, 2, lang:get("我方")}]),
    Msg2 =
        notice:format(lang:get("~ts开始了！本局游戏~ts先手，请稍等后进行操作{face_1 ,7}"),
                      [{string_2, 5, lang:get("斗兽棋")},
                       {string_2, 6, lang:get("对方")}]),
    role:apply(async,
               FirstPid,
               {camp_animal_chess, apply_active, [self(), Msg1]}),
    role:apply(async,
               SecondPid,
               {camp_animal_chess, apply_active, [self(), Msg2]}),
    NewState = State#state{ts = date:now2(),
                           timeout = 20 * 1000, action = 1,
                           endtime = date:unixtime() + 20, round = 1},
    push(NewState),
    continue(active, NewState);
start(_Event, State) -> continue(start, State).

active(timeout, State = #state{round = Round})
    when Round >= 80 ->
    round_limit(State),
    {stop, normal, State};
active(timeout,
       State = #state{action = NowAction, flag = 1,
                      round = Round}) ->
    Result = case check_draw(State) of
                 {draw,
                  #animal_chess{first_id = FirstId0,
                                second_id = SecondId0}} ->
                     role:pack_send(FirstId0,
                                    1,
                                    lang:get("由于长时间未进行击杀，本局游戏判定平局")),
                     role:pack_send(SecondId0,
                                    1,
                                    lang:get("由于长时间未进行击杀，本局游戏判定平局")),
                     role:pack_send(FirstId0,
                                    22,
                                    lang:get("由于长时间未进行击杀，本局游戏判定平局")),
                     role:pack_send(SecondId0,
                                    22,
                                    lang:get("由于长时间未进行击杀，本局游戏判定平局")),
                     role:apply(async,
                                FirstId0,
                                {camp_animal_chess, apply_over, [draw]}),
                     role:apply(async,
                                SecondId0,
                                {camp_animal_chess, apply_over, [draw]}),
                     {stop, normal, State};
                 {ok, Ac0} -> {ok, Ac0};
                 _ -> {stop, error_data, State}
             end,
    case Result of
        {ok, Ac} ->
            case check_over(Ac) of
                {false, FirstPid, SecondPid} ->
                    NextAction = next_action(NowAction),
                    Msg = notice:format(lang:get("~ts回合！快快出手吧{face_1 ,7}"),
                                        [{string_2, 2, lang:get("我方")}]),
                    case NextAction of
                        1 -> notice:send({pid, FirstPid}, 1, Msg);
                        _ -> notice:send({pid, SecondPid}, 1, Msg)
                    end,
                    NewState = State#state{ts = date:now2(),
                                           round = Round + 1, flag = 0,
                                           timeout = 20 * 1000,
                                           action = NextAction,
                                           endtime = date:unixtime() + 20},
                    push(NewState),
                    continue(active, NewState);
                {true, WinId, LossId} ->
                    logger:debug("结束 ~w", [WinId], camp_animal_chess, 733),
                    role:apply(async,
                               WinId,
                               {camp_animal_chess, apply_over, [win]}),
                    role:apply(async,
                               LossId,
                               {camp_animal_chess, apply_over, [loss]}),
                    {stop, normal, State};
                _R ->
                    logger:info("发生错误 ~w", [_R], camp_animal_chess, 738),
                    {stop, normal, State}
            end;
        Else -> Else
    end;
active(timeout,
       State = #state{action = NowAction, id = _Id,
                      round = Round}) ->
    Result = case check_draw(State) of
                 {draw,
                  #animal_chess{first_id = FirstId0,
                                second_id = SecondId0}} ->
                     role:pack_send(FirstId0,
                                    1,
                                    lang:get("由于长时间未进行击杀，本局游戏判定平局")),
                     role:pack_send(SecondId0,
                                    1,
                                    lang:get("由于长时间未进行击杀，本局游戏判定平局")),
                     role:pack_send(FirstId0,
                                    22,
                                    lang:get("由于长时间未进行击杀，本局游戏判定平局")),
                     role:pack_send(SecondId0,
                                    22,
                                    lang:get("由于长时间未进行击杀，本局游戏判定平局")),
                     role:apply(async,
                                FirstId0,
                                {camp_animal_chess, apply_over, [draw]}),
                     role:apply(async,
                                SecondId0,
                                {camp_animal_chess, apply_over, [draw]}),
                     {stop, normal, State};
                 {ok, Ac0} -> {ok, Ac0};
                 _ -> {stop, error_data, State}
             end,
    case Result of
        {ok,
         #animal_chess{list = List, first_id = FirstId,
                       first_pid = FirstPid, second_id = SecondId,
                       second_pid = SecondPid} =
             Ac} ->
            Times1 = case lists:keyfind(NowAction, 1, List) of
                         {NowAction, Times} -> Times;
                         _ -> 0
                     end,
            case Times1 >= 3 of
                true ->
                    {WinId, LossId} = case NowAction of
                                          1 -> {SecondId, FirstId};
                                          _ -> {FirstId, SecondId}
                                      end,
                    role:apply(async,
                               WinId,
                               {camp_animal_chess, apply_over, [win]}),
                    role:apply(async,
                               LossId,
                               {camp_animal_chess, apply_over, [loss]}),
                    {stop, normal, State};
                _ ->
                    {State1, Ac1} = action_auto(State, Ac, NowAction),
                    NewAc = Ac1#animal_chess{list =
                                                 lists:keystore(NowAction,
                                                                1,
                                                                List,
                                                                {NowAction,
                                                                 Times1 + 1})},
                    save(NewAc),
                    NextAction = next_action(NowAction),
                    Msg = notice:format(lang:get("~ts回合！快快出手吧{face_1 ,7}"),
                                        [{string_2, 2, lang:get("我方")}]),
                    case NextAction of
                        1 -> notice:send({pid, FirstPid}, 1, Msg);
                        _ -> notice:send({pid, SecondPid}, 1, Msg)
                    end,
                    NewState = State1#state{ts = date:now2(),
                                            round = Round + 1,
                                            timeout = 20 * 1000,
                                            action = NextAction,
                                            endtime = date:unixtime() + 20},
                    push(NewState, NewAc),
                    continue(active, NewState)
            end;
        Else -> Else
    end;
active(_Event, State) -> continue(active, State).

over(timeout, State = #state{id = Id}) ->
    logger:debug("活动结束结束", [], camp_animal_chess, 800),
    ets:delete(animal_chess, Id),
    {stop, normal, State}.

init_pos() ->
    List = [#animal_chess_pos{grade = 6},
            #animal_chess_pos{grade = 5},
            #animal_chess_pos{grade = 4},
            #animal_chess_pos{grade = 4},
            #animal_chess_pos{grade = 3},
            #animal_chess_pos{grade = 3}],
    Cats = [#animal_chess_pos{grade = 2}
            || _Num <- lists:seq(1, 4)],
    BoBos = [#animal_chess_pos{grade = 1}
             || _Num <- lists:seq(1, 8)],
    List1 = List ++ Cats ++ BoBos,
    FirstList = [Acp#animal_chess_pos{camp = 1, status = 1}
                 || Acp <- List1],
    SecondList = [Acp#animal_chess_pos{camp = 2, status = 1}
                  || Acp <- List1],
    PosList = [{X, Y}
               || X <- lists:seq(1, 6), Y <- lists:seq(1, 6)],
    PosList1 = shuffle(PosList),
    logger:debug("打乱后位置列表 ~w",
                 [PosList1],
                 camp_animal_chess,
                 823),
    init_pos(FirstList ++ SecondList, PosList1, []).

init_pos([], [], Result) -> Result;
init_pos([Acp | T1], [Pos = {X, Y} | T2], Result) ->
    init_pos(T1,
             T2,
             [Acp#animal_chess_pos{pos = Pos, x = X, y = Y}
              | Result]).

init_data(#{role1 :=
                #animal_chess_role{id = RoleId1, name = RoleName1,
                                   classes = Classes1, lev = Lev1, sex = Sex1,
                                   looks = Looks1, pid = Pid1, grade = Grade1},
            role2 :=
                #animal_chess_role{id = RoleId2, name = RoleName2,
                                   classes = Classes2, lev = Lev2, sex = Sex2,
                                   looks = Looks2, pid = Pid2,
                                   grade = Grade2}}) ->
    Ac = #animal_chess{first_id = RoleId1,
                       first_name = RoleName1, first_lev = Lev1,
                       first_classes = Classes1, first_sex = Sex1,
                       first_pid = Pid1, first_looks = Looks1,
                       first_grade = Grade1, second_id = RoleId2,
                       second_name = RoleName2, second_lev = Lev2,
                       second_classes = Classes2, second_sex = Sex2,
                       second_looks = Looks2, second_pid = Pid2,
                       second_grade = Grade2},
    {Ac, [RoleId1, RoleId2]}.

check_grade(Grade1, Grade2)
    when Grade1 =:= 6 andalso Grade2 =:= 1 ->
    false;
check_grade(Grade1, Grade2) when Grade1 >= Grade2 ->
    true;
check_grade(Grade1, Grade2)
    when Grade1 =:= 1 andalso Grade2 =:= 6 ->
    true;
check_grade(_Grade1, _Grade2) -> false.

check_draw(#state{round_acc = RoundAcc, id = Id}) ->
    case fetch(Id) of
        Ac = #animal_chess{chesses = Chesses} ->
            BoxList = [Acp
                       || Acp = #animal_chess_pos{status = Status} <- Chesses,
                          Status =:= 1],
            case BoxList of
                [] when RoundAcc > 30 -> {draw, Ac};
                _ when RoundAcc > 50 -> {draw, Ac};
                _ -> {ok, Ac}
            end;
        _ -> false
    end.

check_over(Id) when is_integer(Id) ->
    case fetch(Id) of
        #animal_chess{chesses = Chesses, first_id = FirstId,
                      first_pid = FirstPid, second_id = SecondId,
                      second_pid = SecondPid} ->
            check_over(Chesses,
                       FirstId,
                       SecondId,
                       FirstPid,
                       SecondPid);
        _ -> stop
    end;
check_over(#animal_chess{chesses = Chesses,
                         first_id = FirstId, first_pid = FirstPid,
                         second_id = SecondId, second_pid = SecondPid}) ->
    check_over(Chesses,
               FirstId,
               SecondId,
               FirstPid,
               SecondPid).

check_over(Chesses, FirstId, SecondId, FirstPid,
           SecondPid) ->
    BoxList = [Pos
               || #animal_chess_pos{pos = Pos, status = Status}
                      <- Chesses,
                  Status =:= 1],
    FirstList = [Pos
                 || #animal_chess_pos{pos = Pos, camp = Camp} <- Chesses,
                    Camp =:= 1],
    SecondList = [Pos
                  || #animal_chess_pos{pos = Pos, camp = Camp} <- Chesses,
                     Camp =:= 2],
    case BoxList of
        [] when FirstList =:= [] -> {true, SecondId, FirstId};
        [] when SecondList =:= [] -> {true, FirstId, SecondId};
        _ -> {false, FirstPid, SecondPid}
    end.

round_limit(#state{id = Id}) ->
    #animal_chess{chesses = Chesses, first_id = FirstId,
                  first_pid = _FirstPid, second_id = SecondId,
                  second_pid = _SecondPid} =
        fetch(Id),
    FirstList = [Acp
                 || Acp = #animal_chess_pos{camp = Camp} <- Chesses,
                    Camp =:= 1],
    SecondList = [Acp
                  || Acp = #animal_chess_pos{camp = Camp} <- Chesses,
                     Camp =:= 2],
    Result = case length(FirstList) =:= length(SecondList)
                 of
                 true ->
                     case
                         do_round_limit(lists:reverse(lists:keysort(#animal_chess_pos.grade,
                                                                    FirstList)),
                                        lists:reverse(lists:keysort(#animal_chess_pos.grade,
                                                                    SecondList)),
                                        FirstId,
                                        SecondId)
                         of
                         {ok, WinId, LossId} -> {ok, WinId, LossId};
                         _ -> draw
                     end;
                 _ ->
                     {WinId, LossId} = case length(FirstList) >
                                                length(SecondList)
                                           of
                                           true -> {FirstId, SecondId};
                                           _ -> {SecondId, FirstId}
                                       end,
                     {ok, WinId, LossId}
             end,
    case Result of
        {ok, WinId1, LossId1} ->
            Msg1 =
                notice:format(lang:get("游戏超过回合上限，因~ts棋子多于~ts，~ts胜利"),
                              [{string_2, 2, lang:get("我方")},
                               {string_2, 6, lang:get("对方")},
                               {string_2, 2, lang:get("我方")}]),
            Msg2 =
                notice:format(lang:get("游戏超过回合上限，因~ts棋子多于~ts，~ts失败"),
                              [{string_2, 6, lang:get("对方")},
                               {string_2, 2, lang:get("我方")},
                               {string_2, 2, lang:get("我方")}]),
            notice:send(WinId1, 1, Msg1),
            notice:send(LossId1, 1, Msg2),
            notice:send(WinId1, 22, Msg1),
            notice:send(LossId1, 22, Msg2),
            role:apply(async,
                       WinId1,
                       {camp_animal_chess, apply_over, [win]}),
            role:apply(async,
                       LossId1,
                       {camp_animal_chess, apply_over, [loss]});
        _ ->
            Msg = lang:get("游戏超过回合上限，双方剩余棋子相同，判定平局"),
            notice:send(FirstId, 1, Msg),
            notice:send(SecondId, 1, Msg),
            notice:send(FirstId, 22, Msg),
            notice:send(SecondId, 22, Msg),
            role:apply(async,
                       FirstId,
                       {camp_animal_chess, apply_over, [draw]}),
            role:apply(async,
                       SecondId,
                       {camp_animal_chess, apply_over, [draw]})
    end.

do_round_limit([], _, _, _) -> draw;
do_round_limit(_, [], _, _) -> draw;
do_round_limit([#animal_chess_pos{grade = Grade1} | T1],
               [#animal_chess_pos{grade = Grade2} | T2], FirstId,
               SecondId) ->
    if Grade1 > Grade2 -> {ok, FirstId, SecondId};
       Grade1 < Grade2 -> {ok, SecondId, FirstId};
       true -> do_round_limit(T1, T2, FirstId, SecondId)
    end.

fetch(Id) ->
    case ets:lookup(animal_chess, Id) of
        [#animal_chess{} = Ac] -> Ac;
        _ -> false
    end.

save(#animal_chess{} = Ac) ->
    ets:insert(animal_chess, Ac).

next_action(NowMove) ->
    case NowMove of
        1 -> 2;
        _ -> 1
    end.

get_name(6) -> lang:get("帅");
get_name(5) -> lang:get("将");
get_name(4) -> lang:get("校");
get_name(3) -> lang:get("尉");
get_name(2) -> lang:get("士");
get_name(_) -> lang:get("兵").

action_auto(State = #state{round_acc = RoundAcc},
            Ac = #animal_chess{chesses = Chesses,
                               first_name = FirstName, first_pid = FirstPid,
                               second_name = SecondName,
                               second_pid = SecondPid},
            Action) ->
    BoxList = [Acp
               || Acp = #animal_chess_pos{status = Status} <- Chesses,
                  Status =:= 1],
    logger:debug("自动开箱子 ~w",
                 [length(BoxList)],
                 camp_animal_chess,
                 994),
    _CampList = [Pos
                 || #animal_chess_pos{pos = Pos, camp = Camp} <- Chesses,
                    Camp =:= Action],
    _EmptyList = [Pos
                  || #animal_chess_pos{pos = Pos, status = Status}
                         <- Chesses,
                     Status =:= 0],
    case BoxList of
        [] -> {State#state{round_acc = RoundAcc + 1}, Ac};
        _ ->
            Acp = #animal_chess_pos{pos = Pos, grade = Grade,
                                    camp = Camp} =
                      util:rand_list(BoxList),
            NewAcp = Acp#animal_chess_pos{status = 2},
            Chesses1 = lists:keystore(Pos,
                                      #animal_chess_pos.pos,
                                      Chesses,
                                      NewAcp),
            logger:debug("自动开箱子 ~w",
                         [Pos],
                         camp_animal_chess,
                         1004),
            {Pid1, Pid2, Name} = case Action of
                                     1 -> {FirstPid, SecondPid, FirstName};
                                     _ -> {SecondPid, FirstPid, SecondName}
                                 end,
            {Color1, Color2, CampName1, CampName2} = case Action =:=
                                                              Camp
                                                         of
                                                         true ->
                                                             {2,
                                                              6,
                                                              lang:get("(我方)"),
                                                              lang:get("(敌方)")};
                                                         _ ->
                                                             {6,
                                                              2,
                                                              lang:get("(敌方)"),
                                                              lang:get("(我方)")}
                                                     end,
            Msg1 = notice:format(lang:get("~ts开启了一个~ts~ts"),
                                 [{string_2, 2, Name},
                                  {string_2, Color1, get_name(Grade)},
                                  {string_2, Color1, CampName1}]),
            Msg2 = notice:format(lang:get("~ts开启了一个~ts~ts"),
                                 [{string_2, 6, Name},
                                  {string_2, Color2, get_name(Grade)},
                                  {string_2, Color2, CampName2}]),
            notice:send({pid, Pid1}, 22, Msg1),
            notice:send({pid, Pid2}, 22, Msg2),
            {State#state{round_acc = 0},
             Ac#animal_chess{chesses = Chesses1}}
    end.

shuffle(L) when is_list(L) ->
    util:rand(1, 2),
    List1 = [{random:uniform(), X} || X <- L],
    List2 = lists:keysort(1, List1),
    [E || {_, E} <- List2].

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

get_reward_num([#{all_num := AllNum} | _]) -> AllNum;
get_reward_num(_) -> 0.

