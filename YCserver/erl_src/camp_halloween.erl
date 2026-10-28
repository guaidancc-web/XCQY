-file("src/mod/campaign/camp_halloween.erl", 1).

-module(camp_halloween).

-behaviour(gen_fsm).

-export([start_link/1,
         call/2,
         cast/2,
         update_pos/1,
         active/2,
         over/2,
         apply_reward/2,
         push_rank/1,
         do_reward/2,
         get_exp/3,
         get_pet_exp/3]).

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

-file("src/mod/campaign/camp_halloween.erl", 27).

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

-file("src/mod/campaign/camp_halloween.erl", 28).

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

-file("src/mod/campaign/camp_halloween.erl", 29).

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

-file("src/mod/campaign/camp_halloween.erl", 30).

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

-file("src/mod/campaign/camp_halloween.erl", 31).

-file("inc/looks.hrl", 1).

-file("src/mod/campaign/camp_halloween.erl", 32).

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

-file("src/mod/campaign/camp_halloween.erl", 33).

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

-file("src/mod/campaign/camp_halloween.erl", 34).

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

-file("src/mod/campaign/camp_halloween.erl", 35).

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

-file("src/mod/campaign/camp_halloween.erl", 36).

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

-file("src/mod/campaign/camp_halloween.erl", 37).

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

-file("src/mod/campaign/camp_halloween.erl", 38).

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

-file("src/mod/campaign/camp_halloween.erl", 39).

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

-file("src/mod/campaign/camp_halloween.erl", 40).

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

-file("src/mod/campaign/camp_halloween.erl", 41).

-record(state,
        {ts,
         timeout,
         map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         uid = 0,
         unit_list = [],
         ids = [],
         green_score = 0,
         bule_score = 0,
         green_time = 0,
         bule_time = 0,
         end_time = 0,
         line = 0,
         pos_list = [],
         boss,
         zone_id = 0,
         boss_pos,
         from_pid,
         aim_win = 0}).

start_link(Args) ->
    gen_fsm:start_link(camp_halloween, [Args], []).

update_pos(#role{id = RoleId, s_event = Event,
                 s_event_pid = Pid, pos = Pos})
    when Event == 37 orelse Event == 38 ->
    cast(Pid, {update_pos, RoleId, Pos}),
    ok;
update_pos(_) -> ok.

push_rank(_Role = #role{id = RoleId, pid = Pid,
                        s_event = Event, s_event_pid = ZonePid})
    when Event == 37 orelse Event == 38 ->
    cast(ZonePid, {push_zone, #{pid => Pid, id => RoleId}});
push_rank(_) -> ok.

cast(Pid, Event) ->
    gen_fsm:send_all_state_event(Pid, Event).

call(Pid, Event) ->
    try gen_fsm:sync_send_all_state_event(Pid, Event) catch
        _Type:_Reason ->
            logger:debug("Type: ~w  Reason: ~w",
                         [_Type, _Reason],
                         camp_halloween,
                         95),
            {error, timeout}
    end.

init([#{id := ZoneId, from := Pid}]) ->
    UId = ZoneId * 10000,
    process_flag(trap_exit, true),
    case map_mgr:create(30014) of
        {ok, MapPid, MapId} ->
            Now = date:unixtime(),
            TimeLeft = 10 * 60,
            {ok, NUId, UnitList} = unit_create(76880,
                                               10,
                                               #{map_base_id => 30014,
                                                 map_id => MapId,
                                                 pos => undefined},
                                               UId,
                                               []),
            Lines = camp_halloween_data:lines(),
            Line = util:rand_list(Lines),
            [Pos | PosList] = camp_halloween_data:get_line(Line),
            {ok, NewUId, [Boss | _]} = unit_create(76881,
                                                   1,
                                                   #{map_base_id => 30014,
                                                     map_id => MapId,
                                                     pos => Pos},
                                                   NUId,
                                                   []),
            NState = #state{map_pid = MapPid, from_pid = Pid,
                            zone_id = ZoneId, map_id = MapId,
                            end_time = Now + TimeLeft, ts = date:now2(),
                            boss_pos = Pos, timeout = TimeLeft * 1000,
                            line = Line, pos_list = PosList,
                            unit_list = UnitList, uid = NewUId, boss = Boss},
            logger:info("启动完成", [], camp_halloween, 115),
            erlang:send_after(1 * 1000, self(), boss_aim),
            erlang:send_after(6 * 1000, self(), unit_trans),
            {ok, active, NState, TimeLeft * 1000};
        _Err ->
            logger:error("创建准备区失败:~w", [_Err], camp_halloween, 120),
            {stop, normal, #state{}}
    end.

handle_event({send_screen_msg,
              #{id := RoleId, index := Index}},
             StateName, State = #state{map_id = MapId}) ->
    case camp_halloween_mgr:lookup(RoleId) of
        HR = #halloween_role{} ->
            Msg = get_screen_msg(HR, Index),
            notice:cast({map, MapId}, 13, Msg),
            ok;
        _ -> ok
    end,
    continue(StateName, State);
handle_event({update_escape_boss_time, RoleId},
             StateName, State) ->
    case camp_halloween_mgr:lookup(RoleId) of
        HR = #halloween_role{} ->
            Now = date:unixtime(),
            NewHR = HR#halloween_role{escape_time = Now + 3},
            camp_halloween_mgr:update_data(NewHR);
        _ -> ok
    end,
    continue(StateName, State);
handle_event({update_pos, RoleId, Pos}, StateName,
             State) ->
    case camp_halloween_mgr:lookup(RoleId) of
        R = #halloween_role{} ->
            camp_halloween_mgr:update_data(R#halloween_role{pos =
                                                                Pos});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({enter, R = #halloween_role{pid = Pid}},
             StateName, State = #state{map_id = MapId}) ->
    role:apply(async,
               Pid,
               {camp_halloween_mgr,
                apply_enter_zone,
                [#{map_id => MapId, zone_pid => self(),
                   zone_role => R}]}),
    continue(StateName, State);
handle_event({enter_zone, RoleId, Pos}, StateName,
             State = #state{zone_id = ZoneId, ids = Ids}) ->
    case lists:member(RoleId, Ids) of
        false ->
            NewState = case camp_halloween_mgr:lookup(RoleId) of
                           HeroRole = #halloween_role{name = _Name} ->
                               logger:debug("进入正式区成功~ts",
                                            [_Name],
                                            camp_halloween,
                                            168),
                               NewR = HeroRole#halloween_role{zone_id = ZoneId,
                                                              zone_pid = self(),
                                                              pos = Pos},
                               push_role(HeroRole, State),
                               camp_halloween_mgr:update_data(NewR),
                               State;
                           _ -> State
                       end,
            push_zone(NewState),
            continue(StateName,
                     NewState#state{ids = [RoleId | Ids]});
        _ -> continue(StateName, State)
    end;
handle_event({push_role, #{pid := Pid, id := RoleId}},
             StateName, State) ->
    logger:debug("======================================",
                 [],
                 camp_halloween,
                 184),
    case camp_halloween_mgr:lookup(RoleId) of
        R = #halloween_role{} ->
            push_role(R#halloween_role{pid = Pid}, State);
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({push_zone, #{pid := Pid}}, StateName,
             State) ->
    push_zone(Pid, State),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event({clear_aim_cd, RoleId}, _From,
                  StateName = active, State) ->
    Now = date:unixtime(),
    Reply = case camp_halloween_mgr:lookup(RoleId) of
                HR = #halloween_role{times_cd = TimesCd}
                    when Now < TimesCd ->
                    NewHR = HR#halloween_role{times_cd = 0},
                    camp_halloween_mgr:update_data(NewHR),
                    push_role(NewHR, State),
                    ok;
                _ -> {false, lang:get("识破技能还没有进入cd哟{face_1, 22}")}
            end,
    continue(StateName, Reply, State);
handle_sync_event({aim, #{type := 2, id := RoleId}},
                  _From, StateName = active, State) ->
    Now = date:unixtime(),
    Reply = case camp_halloween_mgr:lookup(RoleId) of
                #halloween_role{times_cd = TimesCd}
                    when Now < TimesCd ->
                    {false,
                     notice:format(lang:get("技能冷却中，剩余~ts秒"),
                                   [{string_2, 5, TimesCd - Now}])};
                #halloween_role{times = Times} when Times >= 20 ->
                    {false, lang:get("识别次数已满")};
                R = #halloween_role{times = Times} ->
                    Cd = Now + 20,
                    NR = R#halloween_role{times = Times + 1, times_cd = Cd},
                    camp_halloween_mgr:update_data(NR),
                    push_role(NR, State),
                    {true,
                     #{flag => 0,
                       msg =>
                           notice:format(lang:get("看错啦！这是一个假的南瓜精，技能增加~ts秒冷却{face_1,10}"),
                                         [{string_2, 5, 20}]),
                       zone_role => NR}};
                _ -> {false, lang:get("不在活动中")}
            end,
    continue(StateName, Reply, State);
handle_sync_event({aim,
                   #{id := RoleId, to_id := ToRoleId,
                     pos := #pos{map = Map, x = X, y = Y}}},
                  _From, StateName = active,
                  State = #state{map_id = MapId, green_score = GScore,
                                 bule_score = BScore, aim_win = AimWin}) ->
    Now = date:unixtime(),
    Result = case {camp_halloween_mgr:lookup(RoleId),
                   camp_halloween_mgr:lookup(ToRoleId)}
                 of
                 {#halloween_role{times = Times}, _} when Times >= 20 ->
                     {false, lang:get("识别次数已满")};
                 {#halloween_role{times_cd = TimesCd}, _}
                     when Now < TimesCd ->
                     {false, lang:get("识别冷却中")};
                 {#halloween_role{camp = Camp},
                  #halloween_role{camp = Camp}} ->
                     {false, lang:get("不怕神一样的对手！就怕...自己人不要乱点哟！")};
                 {#halloween_role{}, #halloween_role{status = 1}} ->
                     {false, lang:get("对方已经被揍倒，放他一马吧")};
                 {R = #halloween_role{camp = Camp, times = Times,
                                      win = Win, score = Score, name = Name},
                  TR = #halloween_role{name = ToName, score = _ToScore,
                                       die = Die,
                                       pos = #pos{map = Map, x = Tx, y = Ty}}}
                     when abs(X - Tx) < 600 andalso abs(Y - Ty) < 600 ->
                     NR = R#halloween_role{times = Times + 1,
                                           score = Score + 1, win = Win + 1,
                                           mtime = Now},
                     NTR = TR#halloween_role{status = 1, die = Die + 1},
                     camp_halloween_mgr:update_data(NR),
                     camp_halloween_mgr:update_data(NTR),
                     NState = case Camp of
                                  1 ->
                                      State#state{green_score = GScore + 1,
                                                  green_time = Now};
                                  _ ->
                                      State#state{bule_score = BScore + 1,
                                                  bule_time = Now}
                              end,
                     Msg = notice:format(lang:get("~ts，可算找到你了，看我不胖揍你一顿"),
                                         [{role_2, ToName}]),
                     role:apply(async,
                                ToRoleId,
                                {camp_halloween_mgr,
                                 apply_set_event,
                                 [38,
                                  #{label => die, name => Name,
                                    msg =>
                                        notice:format(lang:get("哎呀！演技太差不小心被~ts识破啦！好痛"),
                                                      [{role_2, Name}])}]}),
                     push_zone(NState),
                     push_role(NR, NState),
                     push_die(NTR, NState),
                     erlang:send_after(20 * 1000,
                                       self(),
                                       {die_over, ToRoleId}),
                     {CastMsg, BCastMsg} = case Camp of
                                               2 ->
                                                   {notice:format(lang:get("红方阵营~ts被~ts机智地识破了{face_1,36}"),
                                                                  [{role_2,
                                                                    ToName},
                                                                   {role_2,
                                                                    Name}]),
                                                    util:flist(lang:get("<color='#FFFFFF'><color='#F27FE9'>~ts</color>"
                                                                        "被<color='#77C6FE'>~ts</color>机智地识破了</color>"),
                                                               [ToName, Name])};
                                               _ ->
                                                   {notice:format(lang:get("蓝方阵营~ts被~ts机智地识破了{face_1,36}"),
                                                                  [{role_2,
                                                                    ToName},
                                                                   {role_2,
                                                                    Name}]),
                                                    util:flist(lang:get("<color='#FFFFFF'><color='#77C6FE'>~ts</color>"
                                                                        "被<color='#F27FE9'>~ts</color>机智地识破了</color>"),
                                                               [ToName, Name])}
                                           end,
                     notice:cast({map, MapId}, 22, CastMsg),
                     notice:cast({map, MapId}, 13, BCastMsg),
                     case AimWin of
                         0 ->
                             FirstMsg =
                                 notice:format(lang:get("~ts机智果断，率先识破~ts的伪装，夺得本场比赛一血"),
                                               [{role_2, Name},
                                                {role_2, ToName}]),
                             notice:cast({map, MapId}, 22, FirstMsg),
                             notice:cast({map, MapId}, 11, FirstMsg),
                             role_trigger:async_fire(RoleId,
                                                     #evt_camp_halloween_first{}),
                             mail:send(RoleId,
                                       lang:get("淘气南瓜一血奖励"),
                                       lang:get("恭喜你在本场比赛率先识破对手，这是你的奖励{face_1,10}"),
                                       [{90037, 3}]);
                         _ -> ignore
                     end,
                     {ok,
                      #{flag => 1, msg => Msg, zone_role => NR},
                      NState#state{aim_win = AimWin + 1}};
                 {#halloween_role{},
                  #halloween_role{pos = #pos{map = Map}}} ->
                     {false, lang:get("距离太远，无法识别")};
                 {#halloween_role{}, #halloween_role{}} ->
                     {false, lang:get("对方不在同一个战场")};
                 {#halloween_role{}, _} -> {false, lang:get("对方不在活动中")};
                 {_, #halloween_role{}} -> {false, lang:get("自己不在活动中")};
                 _ -> {false, lang:get("两个不在活动中")}
             end,
    case Result of
        {ok, Args, NewState} ->
            case NewState of
                #state{green_score = GScore} when GScore >= 20 ->
                    self() ! over;
                #state{bule_score = BScore} when BScore >= 20 ->
                    self() ! over;
                _ -> ignore
            end,
            continue(StateName, {true, Args}, NewState);
        _ -> continue(StateName, Result, State)
    end;
handle_sync_event({aim, _}, _From, StateName, State) ->
    Reply = {false, lang:get("发奖阶段，不能识别")},
    continue(StateName, Reply, State);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info({die_over, RoleId}, StateName = active,
            State = #state{map_id = MapId}) ->
    case camp_halloween_mgr:lookup(RoleId) of
        R = #halloween_role{status = 1} ->
            role:apply(async,
                       RoleId,
                       {camp_halloween_mgr,
                        apply_set_event,
                        [37,
                         #{label => trans,
                           msg => lang:get("复活啦，重整旗鼓{face_1,7}")}]}),
            case map:rand_pos(30014) of
                {X, Y} ->
                    role:apply(async,
                               RoleId,
                               {camp_halloween_mgr, trans, [{MapId, X, Y}]});
                _ -> ignore
            end,
            camp_halloween_mgr:update_data(R#halloween_role{status =
                                                                0});
        _ -> ignore
    end,
    continue(StateName, State);
handle_info(unit_trans, StateName = active,
            State = #state{unit_list = UnitList, uid = UId,
                           map_id = MapId}) ->
    logger:debug("===========================换位置",
                 [],
                 camp_halloween,
                 336),
    erlang:send_after(6 * 1000, self(), unit_trans),
    Num = 2,
    DelList = lists:sublist(UnitList, Num),
    del_unit(DelList),
    {ok, NUId, AddList} = unit_create(76880,
                                      Num,
                                      #{map_base_id => 30014, map_id => MapId,
                                        pos => undefined},
                                      UId,
                                      []),
    continue(StateName,
             State#state{unit_list =
                             (UnitList -- DelList) ++ AddList,
                         uid = NUId});
handle_info(boss_aim, StateName = active,
            State = #state{map_id = MapId,
                           boss = Boss = {Bid, BossId}, ids = Ids}) ->
    erlang:send_after(3 * 1000, self(), boss_move),
    Flag = get(boss_aim),
    case unit_mgr:info(Boss) of
        {ok, #unit{pos = #pos{x = OX, y = OY}}}
            when Flag == 1 ->
            List = get_roles(Ids, []),
            AimList = boss_role(List, {OX, OY}, []),
            NState = boss_aim(AimList, State),
            case AimList of
                [] -> ignore;
                _ -> push_zone(NState)
            end,
            map:pack_send_to_all(MapId,
                                 17810,
                                 {Bid, BossId, 76881, OX, OY, 200}),
            unit:talk(Boss, lang:get("吃俺老孙一棒")),
            case NState of
                #state{green_score = GScore} when GScore >= 20 ->
                    self() ! over;
                #state{bule_score = BScore} when BScore >= 20 ->
                    self() ! over;
                _ -> ignore
            end,
            continue(StateName, NState);
        _Err ->
            put(boss_aim, 1),
            logger:debug("~w:w",
                         [{_Err, Boss}],
                         camp_halloween,
                         374),
            continue(StateName, State)
    end;
handle_info(boss_move, StateName = active,
            State = #state{pos_list = [Pos = {X, Y} | T],
                           boss = Boss, line = Line, map_id = _MapId}) ->
    unit:resume(Boss),
    unit:order(Boss,
               #unit_order{type = 2, order = move,
                           arg = {30014, X, Y}}),
    PosList = case T of
                  [] -> camp_halloween_data:get_line(Line);
                  _ -> T
              end,
    erlang:send_after(6 * 1000, self(), boss_pause),
    continue(StateName,
             State#state{pos_list = PosList, boss_pos = Pos});
handle_info(boss_pause, StateName = active,
            State = #state{boss = Boss}) ->
    unit:pause(Boss),
    erlang:send_after(1 * 1000, self(), boss_aim),
    continue(StateName, State);
handle_info(over, _StateName = active, State) ->
    active(timeout, State);
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName,
          _State = #state{zone_id = ZoneId, ids = _Ids,
                          map_id = MapId, from_pid = FromPid}) ->
    FromPid ! {over_zone, ZoneId},
    unit_mgr:remove_map_all(MapId),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

active(timeout,
       State = #state{ids = Ids, map_id = MapId}) ->
    NewState = State#state{ts = date:now2(),
                           timeout = 10 * 1000},
    List = get_roles(Ids, []),
    reward(State, List),
    [role:apply(async,
                RoleId,
                {camp_halloween_mgr, apply_leave_zone, [self()]})
     || #halloween_role{id = RoleId} <- List],
    unit_mgr:remove_map_all(MapId),
    [ets:delete(halloween_role, Id) || Id <- Ids],
    continue(over, NewState);
active(_Event, State) -> continue(active, State).

over(timeout, State) -> {stop, normal, State};
over(_Event, State) -> continue(over, State).

unit_create(_BaseId, 0, _Map, UId, List) ->
    {ok, UId, List};
unit_create(BaseId, Num,
            Map = #{map_base_id := MapBaseId, map_id := MapId,
                    pos := Pos},
            UId, List) ->
    case map:rand_pos(MapBaseId) of
        {TPosX, TPosY} ->
            {PosX, PosY} = case Pos of
                               {_, _} -> Pos;
                               _ -> {TPosX, TPosY}
                           end,
            BattleId = {40, UId},
            case unit_mgr:create(BattleId,
                                 BaseId,
                                 {MapId, PosX, PosY})
                of
                {ok, #unit{}} ->
                    unit_create(BaseId,
                                Num - 1,
                                Map,
                                UId + 1,
                                [BattleId | List]);
                _ -> unit_create(BaseId, Num - 1, Map, UId, List)
            end;
        _ -> unit_create(BaseId, Num - 1, Map, UId, List)
    end.

push_role(R = #halloween_role{pid = Pid}, _State) ->
    role:pack_send(Pid, 17803, {[R]}),
    ok.

push_zone(_State = #state{ids = Ids,
                          green_score = GScore, bule_score = BScore,
                          map_id = MapId, end_time = EndTime}) ->
    List = get_roles(Ids, []),
    RankList = util:keys_sort([#halloween_role.mtime,
                               {asc, #halloween_role.die},
                               #halloween_role.win,
                               #halloween_role.score],
                              List),
    logger:debug("==============================阵营分数：~w",
                 [{GScore, BScore}],
                 camp_halloween,
                 460),
    map:pack_send_to_all(MapId,
                         17804,
                         {RankList, GScore, BScore, EndTime}).

push_zone(Pid,
          #state{ids = Ids, green_score = GScore,
                 bule_score = BScore, end_time = EndTime}) ->
    List = get_roles(Ids, []),
    RankList = util:keys_sort([#halloween_role.mtime,
                               {asc, #halloween_role.die},
                               #halloween_role.win,
                               #halloween_role.score],
                              List),
    logger:debug("===================阵营分数：~w",
                 [{GScore, BScore}],
                 camp_halloween,
                 465),
    role:pack_send(Pid,
                   17804,
                   {RankList, GScore, BScore, EndTime}).

push_die(_R, _State) -> ok.

push_reward(#role{pid = Pid},
            #{win_list := WinList, fail_list := FailList,
              green_score := GScore, blue_score := BScore,
              reward := Reward, win_camp := Camp = 2}) ->
    role:pack_send(Pid,
                   17805,
                   {WinList, FailList, GScore, BScore, Camp, Reward}),
    ok;
push_reward(#role{pid = Pid},
            #{win_list := WinList, fail_list := FailList,
              green_score := GScore, blue_score := BScore,
              reward := Reward, win_camp := Camp}) ->
    role:pack_send(Pid,
                   17805,
                   {FailList, WinList, GScore, BScore, Camp, Reward}),
    ok.

get_roles([], List) -> List;
get_roles([Id | T], List) ->
    case camp_halloween_mgr:lookup(Id) of
        R = #halloween_role{} -> get_roles(T, [R | List]);
        _ -> get_roles(T, List)
    end.

reward(_State = #state{green_score = 0, bule_score = 0},
       List) ->
    logger:info("没有分数：~w", [List], camp_halloween, 490),
    ok;
reward(State = #state{green_score = GScore,
                      bule_score = BScore},
       List)
    when GScore > BScore ->
    reward(State, List, 1);
reward(State = #state{green_score = GScore,
                      green_time = GTime, bule_score = BScore,
                      bule_time = BTime},
       List)
    when GScore == BScore andalso GTime < BTime ->
    reward(State, List, 1);
reward(State = #state{}, List) ->
    reward(State, List, 2).

reward(_State = #state{green_score = GScore,
                       bule_score = BScore},
       List, Win) ->
    WinList = [I
               || I = #halloween_role{camp = Camp} <- List,
                  Camp == Win],
    FailList = List -- WinList,
    WinRankList = util:keys_sort([#halloween_role.mtime,
                                  {asc, #halloween_role.die},
                                  #halloween_role.win,
                                  #halloween_role.score],
                                 WinList),
    FailRankList = util:keys_sort([#halloween_role.mtime,
                                   {asc, #halloween_role.die},
                                   #halloween_role.win,
                                   #halloween_role.score],
                                  FailList),
    reward_rank(WinRankList, 1, 1),
    reward_rank(FailRankList, 1, 0),
    reward_score(WinRankList,
                 #{win_list => WinRankList, fail_list => FailRankList,
                   win_camp => Win, green_score => GScore,
                   blue_score => BScore},
                 1),
    reward_score(FailRankList,
                 #{win_list => WinRankList, fail_list => FailRankList,
                   win_camp => Win, green_score => GScore,
                   blue_score => BScore},
                 0),
    ok.

reward_rank([], _, _) -> ok;
reward_rank([#halloween_role{id = RoleId, lev = Lev}
             | T],
            Num, Win) ->
    role_trigger:async_fire(RoleId,
                            #evt_camp_halloween_rank{win = Win, rank = Num}),
    case camp_halloween_data:get_rank({Num, Win}) of
        #halloween_rank_data{reward = Reward,
                             exp_mode = ExpMode, exp_radio = ExpRadio,
                             title = Title, content = Content} ->
            ExpAdd = get_exp(Lev, ExpMode, ExpRadio / 1000),
            mail:send(RoleId, Title, Content, Reward ++ ExpAdd);
        _ -> ignore
    end,
    reward_rank(T, Num + 1, Win).

reward_score([], _, _) -> ok;
reward_score([R = #halloween_role{id = RoleId} | T],
             Args, Win) ->
    role:apply(async,
               RoleId,
               {camp_halloween,
                apply_reward,
                [Args#{win => Win, zone_role => R}]}),
    reward_score(T, Args, Win).

get_exp(#role{lev = Lev}, Mode, Rate) ->
    get_exp(Lev, Mode, Rate);
get_exp(Lev, Mode, Rate) ->
    case levup_data:get_exp({Mode, Lev}) of
        #{exp := Exp} -> [{90010, 1, util:ceil(Exp * Rate)}];
        _ -> []
    end.

get_pet_exp(Role, Mode, Rate) ->
    case pet:get_war_pet(Role) of
        {ok, #pet{lev = Lev}} ->
            case levup_data:get_exp({Mode, Lev}) of
                #{pet_exp := Exp} ->
                    [{90005, 1, util:ceil(Exp * Rate)}];
                _ -> []
            end;
        _ -> []
    end.

apply_reward(Role = #role{s_event = Event},
             Args = #{win := Win,
                      zone_role := #halloween_role{score = Score}})
    when Event == 37 orelse Event == 38 ->
    RewardType = case Win of
                     1 -> 1;
                     _ -> 2
                 end,
    Ids = camp_halloween_data:item_type(RewardType),
    AddItems = case var:get_var(Role, day, 83, 0) =< 3 of
                   true -> [{90037, 1, 3}];
                   _ -> []
               end,
    {NewRole, RewardList} = do_reward(Role,
                                      #{score => Score,
                                        reward_type => RewardType, times => 1,
                                        add_items => AddItems,
                                        title => lang:get("淘气南瓜结算"),
                                        ids => Ids}),
    AllReward = [{IItemId, INum}
                 || {IItemId, _, INum} <- RewardList],
    push_reward(Role, Args#{reward => AllReward}),
    {ok, NewRole};
apply_reward(#role{s_event = _Event}, _Args) -> ok.

do_reward(Role,
          Args = #{reward_type := RewardType, times := Times,
                   add_items := AddItems, title := Title, ids := Ids}) ->
    Items = get_items(Role, Ids, []),
    {ItemList, IsCast} = case Items of
                             [] -> {[], 0};
                             _ ->
                                 #halloween_item_reward_data{item_id = ItemId,
                                                             bind = Bind,
                                                             num = Num,
                                                             is_cast =
                                                                 IIsCast} =
                                     util:rand_list(Items,
                                                    #halloween_item_reward_data.weigth),
                                 {[{item_type:special_id(ItemId), Bind, Num}],
                                  IIsCast}
                         end,
    AddExp = case camp_halloween_data:get_exp({Times,
                                               RewardType})
                 of
                 #halloween_exp_reward_data{exp_mode = ExpMode,
                                            exp_radio = ExpRadio,
                                            pet_exp_mode = PetExpMode,
                                            pet_exp_radio = PetExpRadio} ->
                     Exp = get_exp(Role, ExpMode, ExpRadio / 1000),
                     PetExp = get_pet_exp(Role,
                                          PetExpMode,
                                          PetExpRadio / 1000),
                     Exp ++ PetExp;
                 _ -> []
             end,
    Score = case Args of
                #{score := _Score} -> _Score;
                _ -> 0
            end,
    UnBindWinLossReward = case RewardType of
                              1 ->
                                  WinLossReward = case
                                                      camp_halloween_data:get_reward({Score,
                                                                                      1})
                                                      of
                                                      #halloween_reward_data{reward
                                                                                 =
                                                                                 _WinLossReward} ->
                                                          _WinLossReward;
                                                      _ -> []
                                                  end,
                                  [{ItemId, 0, Num}
                                   || {ItemId, Num} <- WinLossReward];
                              2 ->
                                  WinLossReward = case
                                                      camp_halloween_data:get_reward({Score,
                                                                                      0})
                                                      of
                                                      #halloween_reward_data{reward
                                                                                 =
                                                                                 _WinLossReward} ->
                                                          _WinLossReward;
                                                      _ -> []
                                                  end,
                                  [{ItemId, 0, Num}
                                   || {ItemId, Num} <- WinLossReward];
                              _ -> []
                          end,
    RewardList = ItemList ++
                     AddExp ++ AddItems ++ UnBindWinLossReward,
    Gain = format:val_to_gain(RewardList),
    NewRole = case role_gain:do_notice(Gain, Role) of
                  {ok, NRole} -> NRole;
                  _ ->
                      mail:send(Role, Title, lang:get("背包已满"), RewardList),
                      Role
              end,
    case IsCast of
        1 when RewardType == 1 ->
            Msg =
                notice:format(lang:get("恭喜~ts在淘气南瓜活动与队友合力揪出了调皮精并幸运的获得了~ts{face_1,3}"),
                              [{role_2, Role}, {item_2, ItemList}]),
            notice:cast(all, 5, Msg);
        1 when RewardType == 2 ->
            Msg =
                notice:format(lang:get("人生如戏，全靠演技。~ts在被调皮精胖揍一顿后惊喜的发现遗落的~ts{face_1,3}"),
                              [{role_2, Role}, {item_2, ItemList}]),
            notice:cast(all, 5, Msg);
        1 when RewardType == 3 ->
            Msg =
                notice:format(lang:get("恭喜~ts揪出了调皮精并幸运的获得了~ts{face_1,3}"),
                              [{role_2, Role}, {item_2, ItemList}]),
            notice:cast(all, 5, Msg);
        _ -> ignore
    end,
    {NewRole, RewardList}.

get_items(_Role, [], List) -> List;
get_items(Role = #role{lev = Lev}, [Id | T], List) ->
    case camp_halloween_data:get_item(Id) of
        I = #halloween_item_reward_data{min_lev = MinLev,
                                        max_lev = MaxLev}
            when Lev >= MinLev andalso Lev =< MaxLev ->
            get_items(Role, T, [I | List]);
        _ -> get_items(Role, T, List)
    end.

boss_role([], _, List) ->
    lists:sublist(util:shuffle(List), 3);
boss_role([R = #halloween_role{pos = #pos{x = X, y = Y},
                               status = 0}
           | T],
          TPos = {Tx, Ty}, List)
    when abs(X - Tx) < 200 andalso abs(Y - Ty) < 200 ->
    boss_role(T, TPos, [R | List]);
boss_role([_ | T], TPos, List) ->
    boss_role(T, TPos, List).

boss_aim([], State) -> State;
boss_aim([R = #halloween_role{camp = Camp, name = Name,
                              id = RoleId, die = Die, escape_time = EscapeTime}
          | T],
         State = #state{bule_score = BScore, map_id = MapId,
                        green_score = GScore}) ->
    case date:unixtime() > EscapeTime of
        true ->
            Msg = lang:get("呆子，休想逃过我的火眼金睛{face_1,36}"),
            role:apply(async,
                       RoleId,
                       {camp_halloween_mgr,
                        apply_set_event,
                        [38,
                         #{label => die, msg => Msg,
                           name => lang:get("美猴王")}]}),
            NR = R#halloween_role{status = 1, die = Die + 1},
            camp_halloween_mgr:update_data(NR),
            erlang:send_after(20 * 1000,
                              self(),
                              {die_over, RoleId}),
            NState = case Camp of
                         1 -> State#state{bule_score = BScore + 1};
                         _ -> State#state{green_score = GScore + 1}
                     end,
            {CastMsg, BCastMsg} = case Camp of
                                      2 ->
                                          {notice:format(lang:get("红方阵营~ts撞在美猴王眼底，不幸被识破了{face_1,4}"),
                                                         [{role_2, Name}]),
                                           util:flist(lang:get("<color='#FFFFFF'><color='#F27FE9'>~ts</color>"
                                                               "撞在美猴王眼底，不幸被识破了</color>"),
                                                      [Name])};
                                      _ ->
                                          {notice:format(lang:get("蓝方阵营~ts撞在美猴王眼底，不幸被识破了{face_1,4}"),
                                                         [{role_2, Name}]),
                                           util:flist(lang:get("<color='#FFFFFF'><color='#77C6FE'>~ts</color>"
                                                               "撞在美猴王眼底，不幸被识破了</color>"),
                                                      [Name])}
                                  end,
            notice:cast({map, MapId}, 22, CastMsg),
            notice:cast({map, MapId}, 13, BCastMsg),
            boss_aim(T, NState);
        false -> boss_aim(T, State)
    end.

del_unit([]) -> ok;
del_unit([Id | T]) ->
    case unit_mgr:info(Id) of
        {ok, #unit{}} -> unit_mgr:remove(Id);
        _ -> ignore
    end,
    del_unit(T).

get_screen_msg(#halloween_role{name = Name,
                               camp = Camp},
               Index) ->
    case Index of
        1 ->
            CampInfo = case Camp of
                           2 -> lang:get("<color='#225ee7'>蓝队</color>");
                           _ -> lang:get("<color='#df3435'>红队</color>")
                       end,
            util:flist(lang:get("<color='#60ff4b'>~ts</color>说:~ts加油!!!"),
                       [Name, CampInfo]);
        2 ->
            util:flist(lang:get("<color='#60ff4b'>~ts</color>说:点我的那个你别走!!!"),
                       [Name]);
        3 ->
            util:flist(lang:get("<color='#60ff4b'>~ts</color>说:让我起来，我还能送!!!"),
                       [Name]);
        4 ->
            util:flist(lang:get("<color='#60ff4b'>~ts</color>说:如果找到我，我就让你嘿嘿嘿！"),
                       [Name]);
        5 ->
            util:flist(lang:get("<color='#60ff4b'>~ts</color>说:看不到我，看不到我！"),
                       [Name]);
        6 ->
            util:flist(lang:get("<color='#60ff4b'>~ts</color>说:我要抓人了！还有谁！"),
                       [Name]);
        _ ->
            CampInfo = case Camp of
                           2 -> lang:get("<color='#225ee7'>蓝队</color>");
                           _ -> lang:get("<color='#df3435'>红队</color>")
                       end,
            util:flist(lang:get("<color='#60ff4b'>~ts</color>说:~ts加油!!!"),
                       [Name, CampInfo])
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

