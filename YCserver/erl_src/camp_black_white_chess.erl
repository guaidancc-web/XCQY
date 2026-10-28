-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      1).

-module(camp_black_white_chess).

-author("GangChen").

-file("inc/camp_black_white_chess.hrl", 1).

-record(black_white_chess_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         looks = [],
         self_grade = 0,
         grade = 0,
         score = 0,
         all_score = 0,
         start_match_time = 0,
         last_color = 1,
         fail_do_times = 0,
         max_change_in_round = 0,
         match_fail_times = 0}).

-record(black_white_chess_game_state,
        {id = 0,
         black_role,
         white_role,
         round = 0,
         round_end_time = date:unixtime(),
         round_start_time_stamp = date:now2(),
         timeout = 20 * 1000,
         m_probable_use_pos = [],
         m_black_can_use_pos = [],
         m_white_can_use_pos = [],
         m_chess = [],
         m_change_chess = [],
         do_flag = false,
         game_type = 1,
         skip_flag = false,
         ask_draw_flag = false,
         ask_draw_time_stamp = date:unixtime(),
         black_keep_ahead_round = 0,
         white_keep_ahead_round = 0,
         is_comeback = 0}).

-record(m_black_white_chess,
        {grade = 1, score = 0, all_score = 0, last_color = 1}).

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      10).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      12).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      13).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      14).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      15).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      16).

-file("inc/looks.hrl", 1).

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      17).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      18).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      19).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      20).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      21).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      22).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      23).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      24).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      26).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      27).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess.erl",
      28).

-export([start_link/1,
         call/2,
         cast/2,
         get_self_information_to_20900/1]).

-export([apply_start/2,
         apply_active/2,
         apply_over/3,
         apply_cancle/1]).

-export([start/2, active/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         code_change/4,
         terminate/3]).

get_self_information_to_20900(#role{m_campaign =
                                        #m_campaign{camp_black_white_chess =
                                                        #m_black_white_chess{grade
                                                                                 =
                                                                                 Grade,
                                                                             score
                                                                                 =
                                                                                 Score}}}) ->
    {Grade, Score, #black_white_chess_role{}, [], 0}.

push_information(_State =
                     #black_white_chess_game_state{black_role =
                                                       BlackRole =
                                                           #black_white_chess_role{pid
                                                                                       =
                                                                                       BlackChessPid,
                                                                                   looks
                                                                                       =
                                                                                       Blooks},
                                                   white_role =
                                                       WhiteRole =
                                                           #black_white_chess_role{pid
                                                                                       =
                                                                                       WhiteChessPid,
                                                                                   looks
                                                                                       =
                                                                                       Wlooks}}) ->
    #black_white_chess_role{grade = BlackGrade,
                            score = BlackScore} =
        BlackRole,
    #black_white_chess_role{grade = WhiteGrade,
                            score = WhiteScore} =
        WhiteRole,
    role:pack_send(BlackChessPid,
                   20900,
                   {BlackGrade, BlackScore, WhiteRole, Wlooks, 1}),
    role:pack_send(WhiteChessPid,
                   20900,
                   {WhiteGrade, WhiteScore, BlackRole, Blooks, 2}).

push_chess(_State =
               #black_white_chess_game_state{black_role =
                                                 #black_white_chess_role{pid =
                                                                             BlackChessPid},
                                             white_role =
                                                 #black_white_chess_role{pid =
                                                                             WhiteChessPid},
                                             round = Round,
                                             m_chess = TChessList,
                                             m_black_can_use_pos =
                                                 BlackCanUseList,
                                             m_white_can_use_pos =
                                                 WhiteCanUseList,
                                             round_end_time = RoundEndTime,
                                             m_change_chess = ChessChangeList,
                                             black_keep_ahead_round =
                                                 BlackKeepAheadRound,
                                             white_keep_ahead_round =
                                                 WhiteKeepAheadRound,
                                             is_comeback = IsComback}) ->
    ChessList = format_chessList(TChessList),
    case Round rem 2 =:= 1 of
        true ->
            logger:debug("Who:~w , RoundEndTime :~w, round:~w, "
                         "ChessList: ~w, BlackCanUseList:~w, BlackKeepA"
                         "headRound:~w, WhiteKeepAheadRound:~w, "
                         "is_comeback:~w",
                         [1,
                          RoundEndTime,
                          Round,
                          ChessList,
                          BlackCanUseList,
                          BlackKeepAheadRound,
                          WhiteKeepAheadRound,
                          IsComback],
                         camp_black_white_chess,
                         84),
            role:pack_send(BlackChessPid,
                           20901,
                           {1,
                            RoundEndTime,
                            Round,
                            ChessList,
                            BlackCanUseList,
                            ChessChangeList,
                            BlackKeepAheadRound,
                            WhiteKeepAheadRound,
                            IsComback}),
            role:pack_send(WhiteChessPid,
                           20901,
                           {1,
                            RoundEndTime,
                            Round,
                            ChessList,
                            BlackCanUseList,
                            ChessChangeList,
                            BlackKeepAheadRound,
                            WhiteKeepAheadRound,
                            IsComback});
        _ ->
            logger:debug("Who:~w , RoundEndTime :~w, round:~w, "
                         "ChessList: ~w, WhiteCanUseList:~w, BlackKeepA"
                         "headRound:~w, WhiteKeepAheadRound:~w, "
                         "IsComback:~w",
                         [2,
                          RoundEndTime,
                          Round,
                          ChessList,
                          WhiteCanUseList,
                          BlackKeepAheadRound,
                          WhiteKeepAheadRound,
                          IsComback],
                         camp_black_white_chess,
                         90),
            role:pack_send(BlackChessPid,
                           20901,
                           {2,
                            RoundEndTime,
                            Round,
                            ChessList,
                            WhiteCanUseList,
                            ChessChangeList,
                            BlackKeepAheadRound,
                            WhiteKeepAheadRound,
                            IsComback}),
            role:pack_send(WhiteChessPid,
                           20901,
                           {2,
                            RoundEndTime,
                            Round,
                            ChessList,
                            WhiteCanUseList,
                            ChessChangeList,
                            BlackKeepAheadRound,
                            WhiteKeepAheadRound,
                            IsComback})
    end.

push_turn_chess(_State, _Turn_list) -> ok.

push_result(#role{pid = Pid,
                  m_campaign =
                      #m_campaign{camp_black_white_chess =
                                      #m_black_white_chess{grade = Grade,
                                                           score = Score}}},
            Result, GainList) ->
    ResultFlag = case Result of
                     win -> 1;
                     lose -> 2;
                     _ -> 3
                 end,
    logger:debug("Grade:~w,Score:~w",
                 [Grade, Score],
                 camp_black_white_chess,
                 106),
    role:pack_send(Pid,
                   20911,
                   {ResultFlag, Grade, Score, GainList}).

push_say(_State, []) -> ok;
push_say(_State =
             #black_white_chess_game_state{black_role =
                                               #black_white_chess_role{pid =
                                                                           BlackChessPid},
                                           white_role =
                                               #black_white_chess_role{pid =
                                                                           WhiteChessPid}},
         [{To, WhoSay, Msg} | T]) ->
    ToPid = case To =:= 1 of
                true -> BlackChessPid;
                _ -> WhiteChessPid
            end,
    logger:debug("Who Say:~w, Message:~w",
                 [WhoSay, Msg],
                 camp_black_white_chess,
                 122),
    role:pack_send(ToPid, 20903, {WhoSay, Msg}),
    push_say(_State, T).

start_link(Args = #{role1 :=
                        #black_white_chess_role{pid = BlackChessPid},
                    role2 :=
                        #black_white_chess_role{pid = WhiteChessPid}}) ->
    logger:debug("Prepare Start FSM for black_white_chess",
                 [],
                 camp_black_white_chess,
                 128),
    case gen_fsm:start_link(camp_black_white_chess,
                            [Args],
                            [])
        of
        {ok, Pid} ->
            role:apply(async,
                       BlackChessPid,
                       {camp_black_white_chess, apply_start, [Pid]}),
            role:apply(async,
                       WhiteChessPid,
                       {camp_black_white_chess, apply_start, [Pid]}),
            ok;
        _Result ->
            logger:debug("Result:~w",
                         [_Result],
                         camp_black_white_chess,
                         135),
            logger:info("black_witte_chess fail to start",
                        [],
                        camp_black_white_chess,
                        136)
    end.

start(timeout,
      State = #black_white_chess_game_state{black_role =
                                                BlackRole,
                                            white_role = WhiteRole,
                                            m_chess = ChessList,
                                            m_probable_use_pos =
                                                ProbableUseList}) ->
    logger:debug("Game Begin",
                 [],
                 camp_black_white_chess,
                 142),
    #black_white_chess_role{pid = BlackRolePid} = BlackRole,
    #black_white_chess_role{pid = WhiteRolePid} = WhiteRole,
    BlackCanUseList = calc_can_use_pos(ChessList,
                                       ProbableUseList,
                                       1),
    WhiteCanUseList = calc_can_use_pos(ChessList,
                                       ProbableUseList,
                                       2),
    role:apply(async,
               BlackRolePid,
               {camp_black_white_chess, apply_active, [self()]}),
    role:apply(async,
               WhiteRolePid,
               {camp_black_white_chess, apply_active, [self()]}),
    NewState =
        State#black_white_chess_game_state{round_start_time_stamp
                                               = erlang:now(),
                                           timeout = 20 * 1000, round = 1,
                                           round_end_time =
                                               date:unixtime() + 20,
                                           m_black_can_use_pos =
                                               BlackCanUseList,
                                           m_white_can_use_pos =
                                               WhiteCanUseList},
    push_chess(NewState),
    continue(active, NewState);
start(_Event, State) -> continue(start, State).

active(timeout,
       State = #black_white_chess_game_state{round = Round,
                                             game_type = GameType,
                                             m_chess = ChessList}) ->
    Result = check_result(State),
    logger:debug("11111111111111111111111111",
                 [],
                 camp_black_white_chess,
                 169),
    logger:debug("Result:~w",
                 [Result],
                 camp_black_white_chess,
                 170),
    case Result of
        {done,
         {WinerPid, WinerColor},
         {LoserPid, LoserColor}} ->
            push_chess(State#black_white_chess_game_state{round =
                                                              Round + 1}),
            role:apply(async,
                       WinerPid,
                       {camp_black_white_chess,
                        apply_over,
                        [win,
                         #{color => WinerColor, game_type => GameType,
                           max_change_in_round =>
                               get_max_change(State, WinerColor),
                           m_chess => ChessList}]}),
            role:apply(async,
                       LoserPid,
                       {camp_black_white_chess,
                        apply_over,
                        [lose,
                         #{color => LoserColor, game_type => GameType,
                           max_change_in_round =>
                               get_max_change(State, LoserColor),
                           m_chess => ChessList}]}),
            {stop, normal, State};
        {draw, {Role1Pid, Color1}, {Role2Pid, Color2}} ->
            push_chess(State#black_white_chess_game_state{round =
                                                              Round + 1}),
            role:apply(async,
                       Role1Pid,
                       {camp_black_white_chess,
                        apply_over,
                        [draw,
                         #{color => Color1, game_type => GameType,
                           max_change_in_round => get_max_change(State, Color1),
                           darw_type => fight}]}),
            role:apply(async,
                       Role2Pid,
                       {camp_black_white_chess,
                        apply_over,
                        [draw,
                         #{color => Color2, game_type => GameType,
                           max_change_in_round => get_max_change(State, Color2),
                           darw_type => fight}]}),
            {stop, normal, State};
        {next_act} ->
            NewState = State#black_white_chess_game_state{round =
                                                              Round + 1,
                                                          do_flag = false,
                                                          round_start_time_stamp
                                                              = erlang:now(),
                                                          round_end_time =
                                                              date:unixtime() +
                                                                  20,
                                                          timeout = 20 * 1000},
            {RealNewState, MsgList} = deal_skip_round(NewState),
            push_chess(RealNewState),
            push_say(State, MsgList),
            continue(active, RealNewState);
        {timeout} ->
            NewState = case Round rem 2 =:= 1 of
                           true ->
                               logger:debug("黑棋超时",
                                            [],
                                            camp_black_white_chess,
                                            204),
                               auto_place_chess(1, State);
                           false ->
                               logger:debug("白棋超时",
                                            [],
                                            camp_black_white_chess,
                                            207),
                               auto_place_chess(2, State)
                       end,
            continue(active, NewState)
    end.

cast(Pid, Event) ->
    gen_fsm:send_all_state_event(Pid, Event).

call(Pid, Event) ->
    try gen_fsm:sync_send_all_state_event(Pid, Event) catch
        _Type:_Reason ->
            logger:debug("Type: ~w  Reason: ~w",
                         [_Type, _Reason],
                         camp_black_white_chess,
                         223),
            {error, timeout}
    end.

apply_start(Role, EventPid) ->
    logger:debug("update information",
                 [],
                 camp_black_white_chess,
                 232),
    NewRole = Role#role{s_event = 70,
                        s_event_pid = EventPid},
    notice:send(NewRole, 1, lang:get("匹配成功，3秒进入游戏")),
    map:role_status_update(NewRole),
    {ok, NewRole}.

apply_active(Role, EventPid) ->
    logger:debug("更新个人信息", [], camp_black_white_chess, 239),
    NewRole = Role#role{s_event = 68,
                        s_event_pid = EventPid},
    map:role_status_update(NewRole),
    {ok, NewRole}.

apply_over(Role = #role{name = _Name}, Result,
           Args = #{color := Color, game_type := GameType,
                    max_change_in_round := MaxChangeInRound}) ->
    logger:debug("Name:~w,Result:~w",
                 [_Name, Result],
                 camp_black_white_chess,
                 245),
    EvtRole = case GameType of
                  2 ->
                      case Result of
                          win ->
                              #{m_chess := ChessList} = Args,
                              SelfChessNum = length([_Elem
                                                     || _Elem = {_, TColor}
                                                            <- ChessList,
                                                        TColor =:= Color]),
                              OpsChessNum = length(ChessList) - SelfChessNum,
                              MoreThanOpsNum = case SelfChessNum >= OpsChessNum
                                                   of
                                                   true ->
                                                       SelfChessNum -
                                                           OpsChessNum;
                                                   _ -> 0
                                               end,
                              ExtraEvent = case OpsChessNum of
                                               0 ->
                                                   [#evt_black_white_chess_win_remain_one_color{}];
                                               _ -> []
                                           end,
                              logger:debug("比对面多的棋子数目:~w",
                                           [MoreThanOpsNum],
                                           camp_black_white_chess,
                                           264),
                              role_trigger:fire([#evt_black_white_chess_change_in_round{change_num
                                                                                            =
                                                                                            MaxChangeInRound},
                                                 #evt_camp_black_white_chess{},
                                                 #evt_black_white_chess_win{},
                                                 #evt_black_white_chess_more_than_ops_chess{num
                                                                                                =
                                                                                                MoreThanOpsNum}]
                                                    ++ ExtraEvent,
                                                Role);
                          lose ->
                              #{m_chess := ChessList} = Args,
                              SelfChessNum = length([_Elem
                                                     || _Elem = {_, TColor}
                                                            <- ChessList,
                                                        TColor =:= Color]),
                              ExtraEvent = case SelfChessNum of
                                               0 ->
                                                   [#evt_black_white_chess_lose_remain_one_color{}];
                                               _ -> []
                                           end,
                              role_trigger:fire([#evt_black_white_chess_change_in_round{change_num
                                                                                            =
                                                                                            MaxChangeInRound},
                                                 #evt_camp_black_white_chess{},
                                                 #evt_black_white_chess_lose{}]
                                                    ++ ExtraEvent,
                                                Role);
                          _ ->
                              #{darw_type := DrawType} = Args,
                              ExtraEvent = case DrawType of
                                               fight ->
                                                   [#evt_black_white_chess_draw_whitout_ask_draw{}];
                                               _ -> []
                                           end,
                              role_trigger:fire([#evt_black_white_chess_change_in_round{change_num
                                                                                            =
                                                                                            MaxChangeInRound},
                                                 #evt_camp_black_white_chess{}]
                                                    ++ ExtraEvent,
                                                Role)
                      end;
                  _ -> Role
              end,
    NewRole = EvtRole#role{s_event = 0,
                           s_event_pid = undefine},
    {CampRole, LastGrade} =
        update_role_campaingn_msg(NewRole,
                                  Result,
                                  Color,
                                  GameType),
    RewardRole = get_reward(CampRole,
                            Result,
                            LastGrade,
                            GameType),
    map:role_status_update(RewardRole),
    NewRole2 = case GameType of
                   1 -> RewardRole;
                   _ -> var:acc_var(RewardRole, day_five, 159)
               end,
    {ok, NewRole2}.

apply_cancle(Role = #role{s_event = Event})
    when Event =:= 68 ->
    NewRole = Role#role{s_event = 0,
                        s_event_pid = undefined},
    map:role_status_update(NewRole),
    {ok, NewRole};
apply_cancle(_) -> ok.

init([_Args = #{id := GameId, game_type := GameType,
                role1 := BlackRole, role2 := WhiteRole}]) ->
    process_flag(trap_exit, true),
    logger:debug("start FSM",
                 [],
                 camp_black_white_chess,
                 330),
    ChessList = [{{4, 4}, 1},
                 {{5, 5}, 1},
                 {{4, 5}, 2},
                 {{5, 4}, 2}],
    ProbableUseList = [{3, 3},
                       {3, 4},
                       {3, 5},
                       {3, 6},
                       {4, 3},
                       {4, 6},
                       {5, 3},
                       {5, 6},
                       {6, 3},
                       {6, 4},
                       {6, 5},
                       {6, 6}],
    BlackCanUseList = calc_can_use_pos(ChessList,
                                       ProbableUseList,
                                       1),
    WhiteCanUseList = calc_can_use_pos(ChessList,
                                       ProbableUseList,
                                       2),
    TimeLeft = 3,
    Now = date:unixtime(),
    FirstRoundStartTime = Now + TimeLeft,
    FirstState = #black_white_chess_game_state{id = GameId,
                                               black_role = BlackRole,
                                               white_role = WhiteRole,
                                               round_start_time_stamp =
                                                   erlang:now(),
                                               timeout = TimeLeft * 1000,
                                               round_end_time =
                                                   FirstRoundStartTime,
                                               m_probable_use_pos =
                                                   ProbableUseList,
                                               m_black_can_use_pos =
                                                   BlackCanUseList,
                                               m_white_can_use_pos =
                                                   WhiteCanUseList,
                                               m_chess = ChessList,
                                               game_type = GameType},
    push_chess(FirstState),
    push_information(FirstState),
    logger:debug("done init",
                 [],
                 camp_black_white_chess,
                 362),
    logger:debug("State:~w, ~w",
                 [FirstState,
                  erlang:is_record(FirstState,
                                   black_white_chess_game_state)],
                 camp_black_white_chess,
                 363),
    {ok, start, FirstState, TimeLeft * 1000}.

handle_event({give_up,
              #{role_id := RoleId, pid := Pid}},
             StateName,
             State = #black_white_chess_game_state{round = Round,
                                                   black_role =
                                                       #black_white_chess_role{id
                                                                                   =
                                                                                   BlackRoleId,
                                                                               pid
                                                                                   =
                                                                                   BlackPid},
                                                   white_role =
                                                       #black_white_chess_role{id
                                                                                   =
                                                                                   WhiteRoleId,
                                                                               pid
                                                                                   =
                                                                                   WhitePid},
                                                   game_type = GameType,
                                                   m_chess = ChessList})
    when Round > 16 ->
    case RoleId =:= BlackRoleId orelse
             RoleId =:= WhiteRoleId
        of
        true ->
            {WinerPid, WinerColor, LoserPid, LoserColor} = case
                                                               RoleId =:=
                                                                   BlackRoleId
                                                               of
                                                               false ->
                                                                   {BlackPid,
                                                                    1,
                                                                    WhitePid,
                                                                    2};
                                                               _ ->
                                                                   {WhitePid,
                                                                    2,
                                                                    BlackPid,
                                                                    1}
                                                           end,
            notice:send(WinerPid,
                        1,
                        lang:get("折服于你出色的棋技，对方投降了！{face_1 ,10}")),
            notice:send(WinerPid,
                        22,
                        lang:get("折服于你出色的棋技，对方投降了！{face_1 ,10}")),
            role:apply(async,
                       WinerPid,
                       {camp_black_white_chess,
                        apply_over,
                        [win,
                         #{color => WinerColor, game_type => GameType,
                           max_change_in_round =>
                               get_max_change(State, WinerColor),
                           m_chess => ChessList}]}),
            role:apply(async,
                       LoserPid,
                       {camp_black_white_chess,
                        apply_over,
                        [lose,
                         #{color => LoserColor, game_type => GameType,
                           max_change_in_round =>
                               get_max_change(State, LoserColor),
                           m_chess => ChessList}]}),
            {stop, normal, State};
        _ ->
            role:pack_send(Pid, 20906, {0, lang:get("参数错误")}),
            logger:debug("State:~w, ~w",
                         [State,
                          erlang:is_record(State,
                                           black_white_chess_game_state)],
                         camp_black_white_chess,
                         389),
            continue(StateName, State)
    end;
handle_event({give_up, #{pid := Pid}}, StateName,
             State) ->
    role:pack_send(Pid,
                   20906,
                   {0,
                    notice:format(lang:get("~ts回合之后才可以投降哦"),
                                  [{string_1, 16}])}),
    continue(StateName, State);
handle_event({say,
              #{role_id := RoleId, msg_id := MsgId}},
             StateName,
             State = #black_white_chess_game_state{black_role =
                                                       #black_white_chess_role{id
                                                                                   =
                                                                                   BlackRoleId},
                                                   white_role =
                                                       #black_white_chess_role{id
                                                                                   =
                                                                                   WhiteRoleId}}) ->
    logger:debug("有人发言了", [], camp_black_white_chess, 400),
    TMsgList = camp_black_white_chess_data:get_msg(MsgId),
    case TMsgList of
        false ->
            logger:error("传入数据出错", [], camp_black_white_chess, 404);
        {_, MsgList1} ->
            logger:debug("~w",
                         [MsgList1],
                         camp_black_white_chess,
                         406),
            NewMsgList = [{Message, Weight}
                          || #{message := Message, weight := Weight}
                                 <- MsgList1],
            Result = util:rand_list(NewMsgList, 2),
            logger:debug("~w",
                         [Result],
                         camp_black_white_chess,
                         409),
            {Msg, _} = Result,
            logger:debug("lalallalalala",
                         [],
                         camp_black_white_chess,
                         411),
            case RoleId =:= BlackRoleId orelse
                     RoleId =:= WhiteRoleId
                of
                true ->
                    WhoSay = case RoleId =:= BlackRoleId of
                                 true -> 1;
                                 _ -> 2
                             end,
                    MsgList = [{1, WhoSay, Msg}, {2, WhoSay, Msg}],
                    push_say(State, MsgList);
                _ ->
                    logger:error("传入数据出错", [], camp_black_white_chess, 426)
            end
    end,
    continue(StateName, State);
handle_event({ask_draw,
              #{role_id := RoleId, pid := Pid}},
             StateName,
             State = #black_white_chess_game_state{black_role =
                                                       #black_white_chess_role{id
                                                                                   =
                                                                                   BlackRoleId,
                                                                               pid
                                                                                   =
                                                                                   BlackRolePid},
                                                   white_role =
                                                       #black_white_chess_role{id
                                                                                   =
                                                                                   WhiteRoleId,
                                                                               pid
                                                                                   =
                                                                                   WhiteRolePid},
                                                   round = Round,
                                                   ask_draw_time_stamp =
                                                       LastAskTimeStamp})
    when Round >= 26 ->
    case RoleId =:= BlackRoleId orelse
             RoleId =:= WhiteRoleId
        of
        true ->
            {_OpsRoleId, OpsPid} = case RoleId =:= BlackRoleId of
                                       true -> {WhiteRoleId, WhiteRolePid};
                                       _ -> {BlackRoleId, BlackRolePid}
                                   end,
            case date:unixtime() - LastAskTimeStamp >= 10 of
                true ->
                    logger:debug("发送求和请求", [], camp_black_white_chess, 449),
                    role:pack_send(OpsPid, 20914, {}),
                    logger:debug("OpsPid:~w",
                                 [OpsPid],
                                 camp_black_white_chess,
                                 451),
                    role:pack_send(Pid, 20904, {1, lang:get("求和请求已经发送")}),
                    NewState =
                        State#black_white_chess_game_state{ask_draw_time_stamp =
                                                               date:unixtime(),
                                                           ask_draw_flag =
                                                               true},
                    continue(StateName, NewState);
                _ ->
                    role:pack_send(Pid,
                                   20904,
                                   {0, lang:get("求和发送的太频繁了，请休息下吧")}),
                    continue(StateName, State)
            end;
        _ ->
            role:pack_send(Pid, 20904, {0, lang:get("参数错误")}),
            continue(StateName, State)
    end;
handle_event({ask_draw, #{pid := Pid}}, StateName,
             State) ->
    role:pack_send(Pid,
                   20904,
                   {0,
                    notice:format(lang:get("~ts回合之后才能求和"),
                                  [{string_1, 26}])}),
    continue(StateName, State);
handle_event({reply_draw,
              #{role_id := RoleId, pid := Pid, result := Result}},
             StateName,
             State = #black_white_chess_game_state{black_role =
                                                       #black_white_chess_role{id
                                                                                   =
                                                                                   BlackRoleId,
                                                                               pid
                                                                                   =
                                                                                   BlackRolePid},
                                                   white_role =
                                                       #black_white_chess_role{id
                                                                                   =
                                                                                   WhiteRoleId,
                                                                               pid
                                                                                   =
                                                                                   WhiteRolePid},
                                                   game_type = GameType}) ->
    case RoleId =:= BlackRoleId orelse
             RoleId =:= WhiteRoleId
        of
        true ->
            OpsPid = case RoleId =:= BlackRoleId of
                         true -> WhiteRolePid;
                         _ -> BlackRolePid
                     end,
            case Result of
                1 ->
                    role:pack_send(Pid, 20905, {1, lang:get("和对面平局")}),
                    role:pack_send(OpsPid,
                                   20905,
                                   {1, lang:get("对面同意你的求和")}),
                    role:apply(async,
                               BlackRolePid,
                               {camp_black_white_chess,
                                apply_over,
                                [draw,
                                 #{color => 1, game_type => GameType,
                                   max_change_in_round =>
                                       get_max_change(State, 1),
                                   darw_type => ask_draw}]}),
                    role:apply(async,
                               WhiteRolePid,
                               {camp_black_white_chess,
                                apply_over,
                                [draw,
                                 #{color => 2, game_type => GameType,
                                   max_change_in_round =>
                                       get_max_change(State, 2),
                                   darw_type => ask_draw}]}),
                    {stop, normal, State};
                _ ->
                    logger:debug("拒绝和对面平局",
                                 [],
                                 camp_black_white_chess,
                                 494),
                    role:pack_send(Pid, 20905, {1, lang:get("拒绝和对面平局")}),
                    role:pack_send(OpsPid,
                                   20905,
                                   {1, lang:get("对面拒绝和你平局")}),
                    NewState =
                        State#black_white_chess_game_state{ask_draw_flag =
                                                               false},
                    continue(StateName, NewState)
            end;
        _ ->
            logger:debug("参数错误", [], camp_black_white_chess, 503),
            role:pack_send(Pid, 20905, {0, lang:get("参数错误")}),
            continue(StateName, State)
    end;
handle_event({push_chess}, StateName, State) ->
    push_chess(State),
    logger:debug("State:~w, ~w",
                 [State,
                  erlang:is_record(State, black_white_chess_game_state)],
                 camp_black_white_chess,
                 510),
    continue(StateName, State);
handle_event({gm_set_color, Color}, StateName,
             State = #black_white_chess_game_state{m_chess =
                                                       ChessList}) ->
    NewChessList = set_color(ChessList, Color, []),
    continue(StateName,
             State#black_white_chess_game_state{m_chess =
                                                    NewChessList}).

handle_sync_event({get_player_information,
                   #{role_id := RoleId}},
                  _From, StateName,
                  State = #black_white_chess_game_state{black_role =
                                                            BlackRole =
                                                                #black_white_chess_role{id
                                                                                            =
                                                                                            BlackRoleId,
                                                                                        looks
                                                                                            =
                                                                                            Blooks},
                                                        white_role =
                                                            WhiteRole =
                                                                #black_white_chess_role{id
                                                                                            =
                                                                                            WhiteRoleId,
                                                                                        looks
                                                                                            =
                                                                                            Wlooks}}) ->
    #black_white_chess_role{grade = BlackGrade,
                            score = BlackScore} =
        BlackRole,
    #black_white_chess_role{grade = WhiteGrade,
                            score = WhiteScore} =
        WhiteRole,
    {SelfGrade, SelfScore, OpsRole, OpsLook, SelfColor} =
        case RoleId =:= BlackRoleId orelse
                 RoleId =:= WhiteRoleId
            of
            true ->
                case RoleId =:= BlackRoleId of
                    true -> {BlackGrade, BlackScore, WhiteRole, Wlooks, 1};
                    _ -> {WhiteGrade, WhiteScore, BlackRole, Blooks, 2}
                end;
            _ ->
                logger:debug("传入数据出错", [], camp_black_white_chess, 533),
                {1, 0, #black_white_chess_role{}, [], 0}
        end,
    logger:debug("Reply = ~w",
                 [{SelfGrade, SelfScore, OpsRole, OpsLook, SelfColor}],
                 camp_black_white_chess,
                 537),
    continue(StateName,
             {SelfGrade, SelfScore, OpsRole, OpsLook, SelfColor},
             State);
handle_sync_event({place_chess, RoleId, X, Y}, _From,
                  StateName,
                  State = #black_white_chess_game_state{round = Round,
                                                        black_role =
                                                            #black_white_chess_role{id
                                                                                        =
                                                                                        BlackRoleId},
                                                        white_role =
                                                            #black_white_chess_role{id
                                                                                        =
                                                                                        WhiteRoleId},
                                                        m_black_can_use_pos =
                                                            BlackCanUseList,
                                                        m_white_can_use_pos =
                                                            WhiteCanUseList}) ->
    WhosTurn = case Round rem 2 =:= 1 of
                   true -> 1;
                   _ -> 2
               end,
    {NewState, Reply} = case WhosTurn of
                            1 ->
                                case BlackRoleId =:= RoleId of
                                    true ->
                                        case lists:member({X, Y},
                                                          BlackCanUseList)
                                            of
                                            true ->
                                                logger:debug("黑棋下棋: ~w",
                                                             [{X, Y}],
                                                             camp_black_white_chess,
                                                             557),
                                                {do_place_chess(State,
                                                                {X, Y},
                                                                1),
                                                 {1, lang:get("")}};
                                            _ ->
                                                logger:debug("黑棋：该位置不可下",
                                                             [],
                                                             camp_black_white_chess,
                                                             560),
                                                {State, {0, lang:get("该位置不可下")}}
                                        end;
                                    _ ->
                                        logger:debug("黑棋：当前是对方回合",
                                                     [],
                                                     camp_black_white_chess,
                                                     564),
                                        {State, {0, lang:get("当前是对方回合")}}
                                end;
                            _ ->
                                case WhiteRoleId =:= RoleId of
                                    true ->
                                        case lists:member({X, Y},
                                                          WhiteCanUseList)
                                            of
                                            true ->
                                                logger:debug("白棋下棋: ~w",
                                                             [{X, Y}],
                                                             camp_black_white_chess,
                                                             572),
                                                {do_place_chess(State,
                                                                {X, Y},
                                                                2),
                                                 {1, lang:get("")}};
                                            _ ->
                                                logger:debug("白棋：该位置不可下",
                                                             [],
                                                             camp_black_white_chess,
                                                             575),
                                                {State, {0, lang:get("该位置不可下")}}
                                        end;
                                    _ ->
                                        logger:debug("白棋：当前是对方回合",
                                                     [],
                                                     camp_black_white_chess,
                                                     579),
                                        {State, {0, lang:get("当前是对方回合")}}
                                end
                        end,
    continue(StateName, Reply, NewState);
handle_sync_event(_Oth, _From, StateName, State) ->
    logger:debug("Oth:~w",
                 [_Oth],
                 camp_black_white_chess,
                 588),
    Reply = {0, lang:get("未知错误")},
    continue(StateName, Reply, State).

handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName,
          _State = #black_white_chess_game_state{black_role =
                                                     #black_white_chess_role{pid
                                                                                 =
                                                                                 BlackRolePid},
                                                 white_role =
                                                     #black_white_chess_role{pid
                                                                                 =
                                                                                 WhiteRolePid}}) ->
    logger:debug("龙凤棋报错退出处理 ~w ~w",
                 [_Reason, _StateName],
                 camp_black_white_chess,
                 599),
    role:apply(async,
               BlackRolePid,
               {camp_black_white_chess, apply_cancle, []}),
    role:apply(async,
               WhiteRolePid,
               {camp_black_white_chess, apply_cancle, []}),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

auto_place_chess(1,
                 State = #black_white_chess_game_state{black_role =
                                                           BlackRole =
                                                               #black_white_chess_role{fail_do_times
                                                                                           =
                                                                                           FDT},
                                                       m_black_can_use_pos =
                                                           CanUseList}) ->
    NewBlackRole =
        BlackRole#black_white_chess_role{fail_do_times =
                                             FDT + 1},
    RandNum = util:rand(1, length(CanUseList)),
    PlacePos = lists:nth(RandNum, CanUseList),
    NewState = State#black_white_chess_game_state{black_role
                                                      = NewBlackRole},
    do_place_chess(NewState, PlacePos, 1);
auto_place_chess(2,
                 State = #black_white_chess_game_state{white_role =
                                                           WhiteRole =
                                                               #black_white_chess_role{fail_do_times
                                                                                           =
                                                                                           FDT},
                                                       m_white_can_use_pos =
                                                           CanUseList}) ->
    NewWhiteRole =
        WhiteRole#black_white_chess_role{fail_do_times =
                                             FDT + 1},
    RandNum = util:rand(1, length(CanUseList)),
    PlacePos = lists:nth(RandNum, CanUseList),
    NewState = State#black_white_chess_game_state{white_role
                                                      = NewWhiteRole},
    do_place_chess(NewState, PlacePos, 2).

do_place_chess(State =
                   #black_white_chess_game_state{m_chess = ChessList,
                                                 m_probable_use_pos =
                                                     ProbableUseList,
                                                 black_keep_ahead_round =
                                                     BlackKeepAheadRound,
                                                 white_keep_ahead_round =
                                                     WhiteKeepAheadRound},
               {X, Y}, Color) ->
    NewProbableUseList = update_probeble_list(ChessList,
                                              ProbableUseList,
                                              {X, Y}),
    logger:debug("NewProbableUseList:~w",
                 [NewProbableUseList],
                 camp_black_white_chess,
                 642),
    {ChangeChessList, NoticeMsgList} =
        get_need_to_change_chess(ChessList, {X, Y}, Color),
    logger:debug("ChangeChessList:~w",
                 [ChangeChessList],
                 camp_black_white_chess,
                 645),
    PreNumber = length([Elem
                        || Elem = {_Pos, TColor} <- ChessList,
                           TColor =:= Color]),
    FixNoitcList = case PreNumber * 2 < length(ChessList) of
                       true -> NoticeMsgList;
                       _ -> []
                   end,
    check_and_do_say(State,
                     ChessList,
                     {X, Y},
                     Color,
                     FixNoitcList),
    NewChessList = change_chess_color(ChessList,
                                      [{X, Y} | ChangeChessList],
                                      Color),
    logger:debug("NewChessList:~w",
                 [NewChessList],
                 camp_black_white_chess,
                 663),
    BlackCanUseList = calc_can_use_pos(NewChessList,
                                       NewProbableUseList,
                                       1),
    logger:debug("BlackCanUseList:~w",
                 [BlackCanUseList],
                 camp_black_white_chess,
                 666),
    WhiteCanUseList = calc_can_use_pos(NewChessList,
                                       NewProbableUseList,
                                       2),
    logger:debug("WhiteCanUseList:~w",
                 [WhiteCanUseList],
                 camp_black_white_chess,
                 668),
    NewState = State#black_white_chess_game_state{m_chess =
                                                      NewChessList,
                                                  m_black_can_use_pos =
                                                      BlackCanUseList,
                                                  m_white_can_use_pos =
                                                      WhiteCanUseList,
                                                  m_probable_use_pos =
                                                      NewProbableUseList,
                                                  m_change_chess =
                                                      [{X, Y}
                                                       | ChangeChessList],
                                                  do_flag = true, timeout = 0},
    NewState2 = case Color of
                    1 ->
                        #black_white_chess_game_state{black_role =
                                                          BlackRole =
                                                              #black_white_chess_role{max_change_in_round
                                                                                          =
                                                                                          MCIR}} =
                            NewState,
                        case length(ChangeChessList) > MCIR of
                            true ->
                                NewBlackRole =
                                    BlackRole#black_white_chess_role{max_change_in_round
                                                                         =
                                                                         length(ChangeChessList)},
                                NewState#black_white_chess_game_state{black_role
                                                                          =
                                                                          NewBlackRole};
                            _ -> NewState
                        end;
                    _ ->
                        #black_white_chess_game_state{white_role =
                                                          WhiteRole =
                                                              #black_white_chess_role{max_change_in_round
                                                                                          =
                                                                                          MCIR}} =
                            NewState,
                        case length(ChangeChessList) > MCIR of
                            true ->
                                NewWhiteRole =
                                    WhiteRole#black_white_chess_role{max_change_in_round
                                                                         =
                                                                         length(ChangeChessList)},
                                NewState#black_white_chess_game_state{white_role
                                                                          =
                                                                          NewWhiteRole};
                            _ -> NewState
                        end
                end,
    {BlackList, WhiteList} = lists:partition(fun (_Elem =
                                                      {_, TColor}) ->
                                                     TColor =:= 1
                                             end,
                                             NewChessList),
    BlackLength = length(BlackList),
    WhiteLength = length(WhiteList),
    logger:debug("黑色棋子数:~w,白色棋子数:~w",
                 [BlackLength, WhiteLength],
                 camp_black_white_chess,
                 703),
    {NewBlackKeepAheadRound,
     NewWhiteKeepAheadRound,
     NewIsComeback} =
        case BlackKeepAheadRound - WhiteKeepAheadRound of
            _DiffRound when _DiffRound > 0 ->
                case BlackLength - WhiteLength of
                    _DiffLength when _DiffLength < 0 ->
                        logger:debug("白棋反超", [], camp_black_white_chess, 710),
                        case BlackKeepAheadRound >= 3 of
                            true -> {0, 1, 1};
                            _ -> {0, 1, 0}
                        end;
                    _DiffLength when _DiffLength =:= 0 ->
                        logger:debug("下完一样多", [], camp_black_white_chess, 719),
                        {0, 0, 0};
                    _ ->
                        logger:debug("黑棋依旧领先", [], camp_black_white_chess, 723),
                        {BlackKeepAheadRound + 1, 0, 0}
                end;
            _DiffRound when _DiffRound < 0 ->
                case WhiteLength - BlackLength of
                    _DiffLength when _DiffLength < 0 ->
                        logger:debug("黑棋反超", [], camp_black_white_chess, 731),
                        case WhiteKeepAheadRound >= 3 of
                            true -> {1, 0, 1};
                            _ -> {1, 0, 0}
                        end;
                    _DiffLength when _DiffLength =:= 0 ->
                        logger:debug("下完一样多", [], camp_black_white_chess, 740),
                        {0, 0, 0};
                    _ ->
                        logger:debug("白棋依旧领先", [], camp_black_white_chess, 744),
                        {0, WhiteKeepAheadRound + 1, 0}
                end;
            _ ->
                case BlackLength - WhiteLength of
                    _Diff when _Diff > 0 -> {1, 0, 0};
                    _Diff when _Diff < 0 -> {0, 1, 0};
                    _ -> {0, 0, 0}
                end
        end,
    NewState3 =
        NewState2#black_white_chess_game_state{black_keep_ahead_round
                                                   = NewBlackKeepAheadRound,
                                               white_keep_ahead_round =
                                                   NewWhiteKeepAheadRound,
                                               is_comeback = NewIsComeback},
    push_turn_chess(NewState3, [{X, Y} | ChangeChessList]),
    NewState3.

check_and_do_say(State, ChessList, {X, Y}, Color,
                 NoticeMsgList) ->
    NewNoticeMsgList = case (X =:= 1 orelse X =:= 8) andalso
                                (Y =:= 1 orelse Y =:= 8)
                           of
                           true ->
                               Fun = fun ({{FX, FY}, TColor}) ->
                                             case (FX =:= 1 orelse FX =:= 8)
                                                      andalso
                                                      (FY =:= 1 orelse FY =:= 8)
                                                          andalso
                                                          TColor =:= Color
                                                 of
                                                 true -> true;
                                                 _ -> false
                                             end
                                     end,
                               Flist = lists:filter(Fun, ChessList),
                               case length(Flist) of
                                   3 ->
                                       Msg = case Color of
                                                 1 ->
                                                     lang:get("此刻的我，胜券在握{face_1,9}");
                                                 2 ->
                                                     lang:get("胜券在握，哦耶{face_1,9}");
                                                 _ ->
                                                     logger:error("Color Error",
                                                                  [],
                                                                  camp_black_white_chess,
                                                                  783)
                                             end,
                                       [{1, Color, Msg}, {2, Color, Msg}];
                                   0 ->
                                       Msg = case Color of
                                                 1 ->
                                                     lang:get("我这叫占山为王{face_1,26}");
                                                 2 ->
                                                     lang:get("占据有利位置，哈哈{face_1,13}");
                                                 _ ->
                                                     logger:error("Color Error",
                                                                  [],
                                                                  camp_black_white_chess,
                                                                  796)
                                             end,
                                       [{1, Color, Msg}, {2, Color, Msg}];
                                   _ -> NoticeMsgList
                               end;
                           _ -> NoticeMsgList
                       end,
    push_say(State, NewNoticeMsgList).

get_need_to_change_chess(ChessList, Pos, Color) ->
    D = [{-1, -1},
         {-1, 0},
         {-1, 1},
         {0, -1},
         {0, 1},
         {1, -1},
         {1, 0},
         {1, 1}],
    get_need_to_change_chess(ChessList,
                             Pos,
                             Color,
                             D,
                             [],
                             []).

get_need_to_change_chess(_, _, _, [], List,
                         NoticeMsgList) ->
    {List, NoticeMsgList};
get_need_to_change_chess(ChessList, Pos = {X, Y}, Color,
                         [{Dx, Dy} | T], NeedList, NoticeMsgList) ->
    {NeedChangeList, TNoticeMsgList} = check_line(ChessList,
                                                  {X + Dx, Y + Dy},
                                                  Color,
                                                  {Dx, Dy}),
    NewNoticeMsgList = case length(NoticeMsgList) > 0 of
                           true -> NoticeMsgList;
                           _ -> TNoticeMsgList
                       end,
    get_need_to_change_chess(ChessList,
                             Pos,
                             Color,
                             T,
                             NeedChangeList ++ NeedList,
                             NewNoticeMsgList).

check_line(ChessList, {X, Y}, Color, Dv) ->
    check_line(ChessList, {X, Y}, Color, Dv, []).

check_line(ChessList, {X, Y}, Color, Dv = {Dx, Dy},
           NeedChangeList) ->
    case do_check([border, not_empty], {X, Y}, ChessList) of
        true ->
            case lists:keyfind({X, Y}, 1, ChessList) of
                {_, TColor} when TColor =:= Color ->
                    MsgList = case length(NeedChangeList) >= 5 of
                                  true ->
                                      Msg = case Color of
                                                1 ->
                                                    lang:get("看我涅槃重生，吃你一排{face_1,15}");
                                                2 ->
                                                    lang:get("想不到吧，吃你一排{face_1,15}");
                                                _ ->
                                                    logger:error("Color error",
                                                                 [],
                                                                 camp_black_white_chess,
                                                                 846),
                                                    lang:get("")
                                            end,
                                      [{1, Color, Msg}, {2, Color, Msg}];
                                  _ -> []
                              end,
                    case length(NeedChangeList) > 0 of
                        true -> {NeedChangeList, MsgList};
                        _ -> {[], []}
                    end;
                {_, _TColor} ->
                    check_line(ChessList,
                               {X + Dx, Y + Dy},
                               Color,
                               Dv,
                               [{X, Y} | NeedChangeList]);
                _ ->
                    logger:error("Check_line_Error",
                                 [],
                                 camp_black_white_chess,
                                 864),
                    {[], []}
            end;
        false -> {[], []}
    end.

change_chess_color(ChessList, ChangeChessList, Color) ->
    lists:foldl(fun (X, List) ->
                        lists:keystore(X, 1, List, {X, Color})
                end,
                ChessList,
                ChangeChessList).

calc_can_use_pos(ChessList, ProbableUseList, Color) ->
    calc_can_use_pos(ChessList, ProbableUseList, Color, []).

calc_can_use_pos(_ChessList, [], _Color, CanUseList) ->
    CanUseList;
calc_can_use_pos(ChessList, [H | T], Color,
                 CanUseList) ->
    case do_check_can_use_pos(ChessList, H, Color) of
        true ->
            calc_can_use_pos(ChessList, T, Color, [H | CanUseList]);
        _ -> calc_can_use_pos(ChessList, T, Color, CanUseList)
    end.

do_check_can_use_pos(ChessList, {X, Y}, Color) ->
    D = [{-1, -1},
         {-1, 0},
         {-1, 1},
         {0, -1},
         {0, 1},
         {1, -1},
         {1, 0},
         {1, 1}],
    do_check_can_use_pos(ChessList, {X, Y}, D, Color).

do_check_can_use_pos(_, _, [], _) -> false;
do_check_can_use_pos(ChessList, {X, Y},
                     [Dv = {Dx, Dy} | T], Color) ->
    case check_line(ChessList, {X + Dx, Y + Dy}, Color, Dv)
        of
        {[], _} ->
            do_check_can_use_pos(ChessList, {X, Y}, T, Color);
        _ -> true
    end.

do_check([], _, _) -> true;
do_check([border | T], {X, Y}, ChessList) ->
    case X < 1 orelse X > 8 orelse Y < 1 orelse Y > 8 of
        true -> false;
        _ -> do_check(T, {X, Y}, ChessList)
    end;
do_check([not_empty | T], {X, Y}, ChessList) ->
    case lists:keyfind({X, Y}, 1, ChessList) of
        false -> false;
        _Val -> do_check(T, {X, Y}, ChessList)
    end.

update_probeble_list(ChessList, ProbableUseList,
                     {X, Y}) ->
    D = [{-1, -1},
         {-1, 0},
         {-1, 1},
         {0, -1},
         {0, 1},
         {1, -1},
         {1, 0},
         {1, 1}],
    DelNowPosList = ProbableUseList -- [{X, Y}],
    NewProbableUseList =
        check_and_add_pos_to_probableUseList(ChessList,
                                             DelNowPosList,
                                             {X, Y},
                                             D),
    NewProbableUseList.

check_and_add_pos_to_probableUseList(_CheessList,
                                     ProbableUseList, _Pos, []) ->
    ProbableUseList;
check_and_add_pos_to_probableUseList(ChessList,
                                     ProbableUseList, {X, Y}, [{Dx, Dy} | T]) ->
    NewPos = {X + Dx, Y + Dy},
    case do_check([border], NewPos, ChessList) of
        false ->
            check_and_add_pos_to_probableUseList(ChessList,
                                                 ProbableUseList,
                                                 {X, Y},
                                                 T);
        _ ->
            case do_check([not_empty], NewPos, ChessList) of
                true ->
                    check_and_add_pos_to_probableUseList(ChessList,
                                                         ProbableUseList,
                                                         {X, Y},
                                                         T);
                _ ->
                    case catch lists:member(NewPos, ProbableUseList) of
                        true ->
                            check_and_add_pos_to_probableUseList(ChessList,
                                                                 ProbableUseList,
                                                                 {X, Y},
                                                                 T);
                        false ->
                            case lists:member(NewPos, ChessList) of
                                true ->
                                    check_and_add_pos_to_probableUseList(ChessList,
                                                                         ProbableUseList,
                                                                         {X, Y},
                                                                         T);
                                _ ->
                                    check_and_add_pos_to_probableUseList(ChessList,
                                                                         [NewPos
                                                                          | ProbableUseList],
                                                                         {X, Y},
                                                                         T)
                            end;
                        _ ->
                            logger:error("Judge Member in list Error happen",
                                         [],
                                         camp_black_white_chess,
                                         946)
                    end
            end
    end.

check_result(State =
                 #black_white_chess_game_state{black_role =
                                                   #black_white_chess_role{pid =
                                                                               BlackPid},
                                               white_role =
                                                   #black_white_chess_role{pid =
                                                                               WhitePid}}) ->
    case do_check_result([game_over, move_chess], State) of
        {done, black_win} ->
            {done, {BlackPid, 1}, {WhitePid, 2}};
        {done, white_win} ->
            {done, {WhitePid, 2}, {BlackPid, 1}};
        {draw} -> {draw, {BlackPid, 1}, {WhitePid, 2}};
        {next_act} -> {next_act};
        {timeout} -> {timeout};
        _ -> false
    end.

do_check_result([], _) ->
    logger:error("undefine State",
                 [],
                 camp_black_white_chess,
                 974),
    false;
do_check_result([game_over | T],
                State = #black_white_chess_game_state{black_role =
                                                          #black_white_chess_role{fail_do_times
                                                                                      =
                                                                                      BFDT},
                                                      white_role =
                                                          #black_white_chess_role{fail_do_times
                                                                                      =
                                                                                      WFDT},
                                                      m_black_can_use_pos =
                                                          BlackCanUseList,
                                                      m_white_can_use_pos =
                                                          WhiteCanUseList,
                                                      m_chess = ChessList}) ->
    case BFDT =:= 3 of
        true -> {done, white_win};
        _ ->
            case WFDT =:= 3 of
                true -> {done, black_win};
                _ ->
                    case length(BlackCanUseList) =:= 0 andalso
                             length(WhiteCanUseList) =:= 0
                        of
                        true ->
                            BlackNum = length([{X, Y}
                                               || {{X, Y}, Color} <- ChessList,
                                                  Color =:= 1]),
                            WhiteNum = length([{X, Y}
                                               || {{X, Y}, Color} <- ChessList,
                                                  Color =:= 2]),
                            case BlackNum - WhiteNum of
                                Num when Num > 0 -> {done, black_win};
                                Num when Num < 0 -> {done, white_win};
                                _ -> {draw}
                            end;
                        _ -> do_check_result(T, State)
                    end
            end
    end;
do_check_result([move_chess | _T],
                #black_white_chess_game_state{do_flag = Flag}) ->
    case Flag of
        true -> {next_act};
        _ -> {timeout}
    end.

deal_skip_round(State =
                    #black_white_chess_game_state{round = Round,
                                                  m_black_can_use_pos =
                                                      BlackCanUseList,
                                                  m_white_can_use_pos =
                                                      WhiteCanUseList,
                                                  skip_flag = SkipFlag}) ->
    case Round rem 2 =:= 1 of
        true ->
            case length(BlackCanUseList) =:= 0 of
                true ->
                    {do_skip_round(State),
                     [{1, 1, lang:get("不是吧，我的回合没了{face_1,48}")},
                      {2, 1, lang:get("不是吧，我的回合没了{face_1,48}")}]};
                _ ->
                    SayList = case SkipFlag of
                                  true ->
                                      [{1,
                                        1,
                                        lang:get("(ノ⊙ω⊙)ノ哦嚯，承让承让{face_1,52}")},
                                       {2,
                                        1,
                                        lang:get("(ノ⊙ω⊙)ノ哦嚯，承让承让{face_1,52}")}];
                                  _ -> []
                              end,
                    {State#black_white_chess_game_state{skip_flag = false},
                     [] ++ SayList}
            end;
        _ ->
            case length(WhiteCanUseList) =:= 0 of
                true ->
                    {do_skip_round(State),
                     [{1, 2, lang:get("哎呀我去，失误失误{face_1,50}")},
                      {2, 2, lang:get("哎呀我去，失误失误{face_1,50}")}]};
                _ ->
                    SayList = case SkipFlag of
                                  true ->
                                      [{1,
                                        2,
                                        lang:get("乘胜追击，就问你怕不怕{face_1,25}")},
                                       {2,
                                        2,
                                        lang:get("乘胜追击，就问你怕不怕{face_1,25}")}];
                                  _ -> []
                              end,
                    {State#black_white_chess_game_state{skip_flag = false},
                     [] ++ SayList}
            end
    end.

do_skip_round(State) ->
    State#black_white_chess_game_state{timeout = 5 * 1000,
                                       do_flag = true, skip_flag = true,
                                       round_end_time = date:unixtime() + 5,
                                       m_change_chess = []}.

continue(StateName,
         State =
             #black_white_chess_game_state{round_start_time_stamp =
                                               StartTimeStamp,
                                           timeout = Timeout}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, StartTimeStamp)}.

continue(StateName, Reply,
         State =
             #black_white_chess_game_state{round_start_time_stamp =
                                               StartTimeStamp,
                                           timeout = Timeout}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, StartTimeStamp)};
continue(StateName, Reply, State) ->
    logger:debug("State出问题了",
                 [],
                 camp_black_white_chess,
                 1106),
    logger:debug("State ~w",
                 [erlang:is_record(State, black_white_chess_game_state)],
                 camp_black_white_chess,
                 1107),
    {reply, Reply, StateName, State, 20000}.

format_chessList(List) -> format_chessList(List, []).

format_chessList([], List) -> List;
format_chessList([H | T], List) ->
    case H of
        {{X, Y}, Color} ->
            format_chessList(T, [{X, Y, Color} | List]);
        _ -> format_chessList(T, List)
    end.

update_role_campaingn_msg(Role = #role{m_campaign =
                                           MC =
                                               #m_campaign{camp_black_white_chess
                                                               = CBWC}},
                          Result, Color, GameType) ->
    #m_black_white_chess{grade = OldGrade} = CBWC,
    NewCBWC = do_update_role_campaingn_msg(CBWC,
                                           Result,
                                           Color,
                                           GameType),
    {Role#role{m_campaign =
                   MC#m_campaign{camp_black_white_chess = NewCBWC}},
     OldGrade}.

do_update_role_campaingn_msg(_Old =
                                 #m_black_white_chess{grade = OldGrade,
                                                      score = OldScore,
                                                      all_score = OldAllScore},
                             Result, Color, 2) ->
    #{win := WinScore, loss := LossScore, draw := DrawScore,
      next_grade := NextGradeScore} =
        camp_black_white_chess_data:get_score(OldGrade),
    AddScore = case Result of
                   win -> WinScore;
                   draw -> DrawScore;
                   _ -> 0 - LossScore
               end,
    case OldScore + AddScore of
        NowScore when NowScore >= NextGradeScore ->
            #m_black_white_chess{grade = OldGrade + 1,
                                 score = NowScore - NextGradeScore,
                                 all_score = OldAllScore + AddScore,
                                 last_color = Color};
        NowScore when NowScore < 0 ->
            case OldGrade > 1 of
                true ->
                    #{next_grade := GradeScore1} =
                        camp_black_white_chess_data:get_score(OldGrade - 1),
                    #m_black_white_chess{grade = OldGrade - 1,
                                         score = GradeScore1 + NowScore,
                                         all_score = OldAllScore + AddScore,
                                         last_color = Color};
                _ ->
                    #m_black_white_chess{grade = 1, score = 0,
                                         all_score = 0, last_color = Color}
            end;
        NowScore ->
            #m_black_white_chess{grade = OldGrade, score = NowScore,
                                 all_score = OldAllScore + AddScore,
                                 last_color = Color}
    end;
do_update_role_campaingn_msg(Old, _, Color, 1) ->
    Old#m_black_white_chess{last_color = Color}.

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
check_role_cond(Args, [#{item_id := _ItemID} | T],
                List) ->
    logger:debug("物品~w被过滤",
                 [_ItemID],
                 camp_black_white_chess,
                 1176),
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
                         camp_black_white_chess,
                         1194),
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
    case camp_black_white_chess_data:get_exp(Result) of
        #{model := Model, ratio := Ratio} -> {Model, Ratio};
        _ ->
            logger:info("没有经验模型 ~w",
                        [Result],
                        camp_black_white_chess,
                        1237),
            {0, 0}
    end.

get_reward(Role = #role{name = RoleName}, ResultType,
           LastGrade, 2) ->
    Result = case ResultType of
                 win -> 1;
                 lose -> 2;
                 _ -> 3
             end,
    {RoleExp, PetExp} = get_exp_reward(Role, Result),
    AddFlower = case
                    camp_black_white_chess_data:get_score(LastGrade)
                    of
                    #{win_flower := WinFlower} when Result =:= 1 ->
                        WinFlower;
                    #{loss_flower := LossFlower} when Result =:= 2 ->
                        LossFlower;
                    #{draw_flower := DrawFlower} when Result =:= 3 ->
                        DrawFlower;
                    _ -> 0
                end,
    FlowerGain = [{90037, 0, AddFlower}],
    case
        camp_black_white_chess_data:get_special_list(Result)
        of
        {{_}, SpecialList} ->
            RewardNum = get_reward_num(SpecialList),
            SpecialList1 = check_role_cond(Role, SpecialList),
            GetSpecialGain = get_rand_list(SpecialList1, RewardNum),
            NewGainInfo = make_gain(GetSpecialGain, []),
            NewGainInfo1 = [{item_type:special_id(BaseId),
                             Bind,
                             Num,
                             IsCast}
                            || {BaseId, Bind, Num, IsCast} <- NewGainInfo],
            GetGainInfo = [{BaseId, Bind, Num}
                           || {BaseId, Bind, Num, _} <- NewGainInfo1]
                              ++ FlowerGain,
            CastGainInfo = [{BaseId, Bind, Num}
                            || {BaseId, Bind, Num, IsCast} <- NewGainInfo1,
                               IsCast =:= 1],
            ExpReward = RoleExp ++ PetExp,
            {ok, ExpRole} =
                role_gain:do(format:val_to_gain(ExpReward), Role),
            GainRole1 = case
                            role_gain:do(format:val_to_gain(GetGainInfo),
                                         ExpRole)
                            of
                            {ok, GainRole} -> GainRole;
                            _ ->
                                mail:send(ExpRole,
                                          lang:get("龙凤棋奖励"),
                                          lang:get("你在参加龙凤棋活动中，背包已满"),
                                          GetGainInfo),
                                ExpRole
                        end,
            case CastGainInfo of
                [_ | _] ->
                    Msg =
                        notice:format(lang:get("~ts在~ts中激战正酣，转换对方棋子后竟发现了一个~ts{face_1 "
                                               ",42}"),
                                      [{role_2, RoleName},
                                       {string_2, 1, lang:get("龙凤棋")},
                                       {item_2, CastGainInfo}]),
                    notice:cast(all, 5, Msg);
                _ -> ok
            end,
            push_result(Role, ResultType, GetGainInfo),
            GainRole1;
        _ ->
            logger:error("参数错误: ResultType:~w",
                         [ResultType],
                         camp_black_white_chess,
                         1292),
            Role
    end;
get_reward(Role, ResultType, _LastGrade, _GameType) ->
    push_result(Role, ResultType, []),
    Role.

get_max_change(#black_white_chess_game_state{black_role
                                                 =
                                                 #black_white_chess_role{max_change_in_round
                                                                             =
                                                                             MCIR}},
               1) ->
    MCIR;
get_max_change(#black_white_chess_game_state{white_role
                                                 =
                                                 #black_white_chess_role{max_change_in_round
                                                                             =
                                                                             MCIR}},
               2) ->
    MCIR.

get_reward_num([#{all_num := AllNum} | _]) -> AllNum;
get_reward_num(_) -> 0.

set_color([], _, List) -> List;
set_color([{Pos, _} | T], Color, DoneList) ->
    set_color(T, Color, [{Pos, Color} | DoneList]).

