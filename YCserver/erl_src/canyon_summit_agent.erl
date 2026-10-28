-file("src/mod/canyon_summit/canyon_summit_agent.erl",
      1).

-module(canyon_summit_agent).

-author("Liyf").

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

-file("src/mod/canyon_summit/canyon_summit_agent.erl",
      13).

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

-file("src/mod/canyon_summit/canyon_summit_agent.erl",
      14).

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

-file("src/mod/canyon_summit/canyon_summit_agent.erl",
      15).

-file("inc/looks.hrl", 1).

-file("src/mod/canyon_summit/canyon_summit_agent.erl",
      16).

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

-file("src/mod/canyon_summit/canyon_summit_agent.erl",
      17).

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

-file("src/mod/canyon_summit/canyon_summit_agent.erl",
      18).

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

-file("src/mod/canyon_summit/canyon_summit_agent.erl",
      19).

-file("inc/canyon_summit.hrl", 1).

-record(canyon_summit_role,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         group_id = 0 :: non_neg_integer(),
         fight = 0 :: non_neg_integer(),
         movability = 1000 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         side = 1,
         pid :: undefined | reference(),
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         operating_unit = 0 :: 0 | tuple(),
         last_operated = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         cannon_attacked = 0 :: non_neg_integer(),
         cannon_used = 0 :: non_neg_integer(),
         guarding_unit = 0 :: non_neg_integer(),
         operating_num = 0 :: non_neg_integer()}).

-record(canyon_summit_side,
        {id = {0, 0, 0} :: {integer(), integer(), integer()},
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         map_id = 0 :: non_neg_integer(),
         match_pid = 0 :: pid(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         remain_unit = 3 :: non_neg_integer(),
         subsidize_buff = [] :: list(),
         all_fc = 0 :: non_neg_integer()}).

-record(canyon_summit_team,
        {ver = 1 :: pos_integer(),
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         team_side = 0,
         battle_id = 0,
         match_pid = undefined :: pid(),
         map_id = 0}).

-record(canyon_summit_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         battle_id = 0 :: non_neg_integer(),
         battle_pid = 0 :: pid(),
         win_side = 0,
         combat_time = 0,
         is_judge = false,
         cannon_ready = false,
         time = 0 :: non_neg_integer()}).

-record(canyon_summit_info,
        {id = {0, 0},
         group_id = 0,
         match_id = 0,
         map_id = 0,
         match_pid = 0,
         black_num = 0,
         red_num = 0,
         black_fc = 0,
         red_fc = 0,
         black_team_num = 0,
         red_team_num = 0}).

-record(canyon_summit_unit,
        {id = {0, 0, 0} :: tuple(),
         match_id = 0 :: non_neg_integer(),
         group_id = 0 :: non_neg_integer(),
         battle_id = 0 :: non_neg_integer(),
         side = 0,
         duration = 1000 :: non_neg_integer(),
         operators = [] :: list(),
         last_operated = 0 :: non_neg_integer()}).

-record(canyon_summit_operator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         side = 0,
         timeout = 0 :: non_neg_integer()}).

-record(canyon_summit_result,
        {id = {0, 0},
         red_fc = 0,
         red_team_num = 0,
         red_role_num = 0,
         black_fc = 0,
         black_team_num = 0,
         black_role_num = 0,
         red_acc_team = 0,
         black_acc_team = 0,
         red_acc_role = 0,
         black_acc_role = 0}).

-file("src/mod/canyon_summit/canyon_summit_agent.erl",
      20).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/canyon_summit/canyon_summit_agent.erl",
      21).

-behaviour(gen_server).

-export([info/1,
         call/1,
         start_link/0,
         update_role/1,
         trans_to_battle/4,
         sync_update/2,
         canyon_summit_rank/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {name = 0, ts = 0, timeout = 0}).

start_link() ->
    gen_server:start_link({local, canyon_summit_agent},
                          canyon_summit_agent,
                          [],
                          []).

update_role(RoleInfo) ->
    logger:debug("~w", [RoleInfo], canyon_summit_agent, 59),
    canyon_summit_agent !
        {update, canyon_summit_role, RoleInfo}.

trans_to_battle(RoleId, MatchPid, MapId, Side) ->
    case role_misc:is_local_role(RoleId) of
        true ->
            logger:debug("~w", [RoleId], canyon_summit_agent, 66),
            role:apply(async,
                       RoleId,
                       {canyon_summit_role,
                        role_callback,
                        [{trans_to_battle, MatchPid, MapId, Side}]});
        _ -> {error, lang:get("未找到该角色")}
    end.

sync_update(TabName, Data) ->
    logger:debug("~w", [Data], canyon_summit_agent, 74),
    canyon_summit_agent ! {update, TabName, Data}.

info(Info) -> canyon_summit_agent ! Info.

call(Info) ->
    case catch gen_server:call(canyon_summit_agent,
                               Info,
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

init([]) ->
    logger:info("启动中...", [], canyon_summit_agent, 103),
    process_flag(trap_exit, true),
    ets:new(canyon_summit_role,
            [set,
             named_table,
             public,
             {keypos, #canyon_summit_role.id}]),
    ets:new(canyon_summit_match,
            [set,
             named_table,
             public,
             {keypos, #canyon_summit_match.id}]),
    ets:new(canyon_summit_side,
            [set,
             named_table,
             public,
             {keypos, #canyon_summit_side.id}]),
    ets:new(canyon_summit_unit,
            [set,
             named_table,
             public,
             {keypos, #canyon_summit_unit.id}]),
    ets:new(canyon_summit_team,
            [set,
             named_table,
             public,
             {keypos, #canyon_summit_team.leader}]),
    Ref = set_timer(10, request_state_info),
    put(request_state_info_ref, {1, Ref}),
    State = #state{},
    logger:info("启动完成", [], canyon_summit_agent, 122),
    {ok, State}.

handle_call(get_status, _From,
            State = #state{name = 0, ts = 0, timeout = 0}) ->
    WorldLev = case world_lev:get_world_lev() of
                   {Lev, _} -> Lev;
                   _ -> 70
               end,
    {Data, NewState} = case cross:call(canyon_summit_mgr,
                                       call,
                                       [get_status])
                           of
                           {Mname, Mts, Mtimeout} when WorldLev >= 70 ->
                               EndTime = calc_end_time(Mts, Mtimeout),
                               Data1 = {Mname, EndTime},
                               logger:debug("同步状态:~w",
                                            [Data1],
                                            canyon_summit_agent,
                                            139),
                               {Data1,
                                State#state{name = Mname, ts = Mts,
                                            timeout = Mtimeout}};
                           {Mname, Mts, Mtimeout} ->
                               logger:info("本服世界等级不够",
                                           [],
                                           canyon_summit_agent,
                                           142),
                               {{0, 0},
                                State#state{name = Mname, ts = Mts,
                                            timeout = Mtimeout}};
                           _ ->
                               logger:info("请求活动状态错误",
                                           [],
                                           canyon_summit_agent,
                                           145),
                               {{0, 0}, State}
                       end,
    {reply, Data, NewState};
handle_call(get_status, _From,
            State = #state{name = Mname, ts = Mts,
                           timeout = Mtimeout}) ->
    Data = case world_lev:get_world_lev() of
               {Lev, _} when Lev >= 70 ->
                   EndTime = calc_end_time(Mts, Mtimeout),
                   {Mname, EndTime};
               _ -> {0, 0}
           end,
    {reply, Data, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(request_state_info,
            State = #state{name = 0, ts = 0, timeout = 0}) ->
    {Times, OldRef} = case get(request_state_info_ref) of
                          {T, ORef} -> {T, ORef};
                          _ -> {0, udefind}
                      end,
    stop_timer(OldRef),
    NewState = case cross:call(canyon_summit_mgr,
                               call,
                               [get_status])
                   of
                   {error, _} ->
                       case Times < 30 of
                           true ->
                               put(request_state_info_ref,
                                   {Times + 1,
                                    set_timer(1 * 60 * 100,
                                              request_state_info)}),
                               State;
                           _ ->
                               logger:error("峡谷之巅平台：~w, 区服：~w请求跨服数据出错",
                                            [env:get(platform),
                                             env:get(zone_id)],
                                            canyon_summit_agent,
                                            187),
                               State
                       end;
                   {Name, Ts, Timeout} ->
                       State#state{name = Name, ts = Ts, timeout = Timeout}
               end,
    {noreply, NewState};
handle_info(request_state_info, State) ->
    OldRef = get(request_state_info_ref),
    stop_timer(OldRef),
    {noreply, State};
handle_info({update_state, SName, Ts, TimeOut},
            State) ->
    case world_lev:get_world_lev() of
        {Lev, _} when Lev >= 70 ->
            EndTime = calc_end_time(Ts, TimeOut),
            Data = {SName, EndTime},
            role_group:pack_send(world, 21100, Data);
        _ -> ok
    end,
    NewState = State#state{name = SName, ts = Ts,
                           timeout = TimeOut},
    {noreply, NewState};
handle_info(enroll, State) ->
    RoleList = ets:tab2list(canyon_summit_role),
    cross:cast(canyon_summit_mgr,
               info,
               [{enroll, RoleList}]),
    {noreply, State};
handle_info({reset, SName, Ts, Timeout}, State) ->
    ets:delete_all_objects(canyon_summit_role),
    EndTime = calc_end_time(Ts, Timeout),
    Data = {SName, EndTime},
    logger:debug("同步状态:~w",
                 [Data],
                 canyon_summit_agent,
                 224),
    role_group:pack_send(world, 21100, Data),
    NewState = State#state{name = SName, ts = Ts,
                           timeout = Timeout},
    {noreply, NewState};
handle_info({update, TabName, Data}, State) ->
    update(TabName, Data),
    {noreply, State};
handle_info(del_info, State) ->
    del_ets(),
    {noreply, State};
handle_info(update_rank, State) ->
    canyon_summit_rank(),
    {noreply, State};
handle_info({chat_msg, 10400, RoleId, WorldData},
            State) ->
    case role_misc:is_local_role(RoleId) of
        true -> role:pack_send(RoleId, 10400, WorldData);
        _ ->
            logger:error("未找到该角色~w",
                         [RoleId],
                         canyon_summit_agent,
                         248)
    end,
    {noreply, State};
handle_info({notice_cast, Type, Msg}, State) ->
    case world_lev:get_world_lev() of
        {Lev, _} when Lev >= 70 -> notice:cast(all, Type, Msg);
        _ -> ok
    end,
    {noreply, State};
handle_info(trans_team, State) ->
    TeamList = ets:tab2list(canyon_summit_team),
    logger:debug("~w",
                 [TeamList],
                 canyon_summit_agent,
                 263),
    [role:apply(async,
                LeaderId,
                {canyon_summit_role,
                 role_callback,
                 [{trans_to_battle, MatchPid, MapId, Side}]})
     || #canyon_summit_team{leader = LeaderId,
                            match_pid = MatchPid, map_id = MapId,
                            team_side = Side}
            <- TeamList],
    {noreply, State};
handle_info(_Info, State) ->
    logger:debug("收到未知消息:~w",
                 [_Info],
                 canyon_summit_agent,
                 269),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [canyon_summit_agent],
                canyon_summit_agent,
                273),
    logger:info("[~w] 关闭完成",
                [canyon_summit_agent],
                canyon_summit_agent,
                274),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

calc_end_time(Ts, TimeOut) ->
    LeftTime = util:time_left(TimeOut, Ts) div 1000,
    Now = date:unixtime(),
    Now + LeftTime.

set_timer(Time, InfoMsg) ->
    erlang:send_after(Time * 1000, self(), InfoMsg).

stop_timer(OldRef) when is_reference(OldRef) ->
    erlang:cancel_timer(OldRef);
stop_timer(_) -> ok.

canyon_summit_rank() ->
    GroupList = canyon_summit_data:get_all_group(),
    Fun = fun (Id, Temp) when is_integer(Id) ->
                  RankType = get_rank_type(Id),
                  case lists:keyfind(RankType, 1, Temp) of
                      {RankType, L} ->
                          lists:keyreplace(RankType,
                                           1,
                                           Temp,
                                           {RankType, [Id | L]});
                      _ -> [{RankType, [Id]} | Temp]
                  end;
              (_, Temp) -> Temp
          end,
    NList = lists:foldl(Fun, [], GroupList),
    [canyon_summit_rank(RankType, IdList)
     || {RankType, IdList} <- NList].

canyon_summit_rank(RankType, IdList) ->
    ProfileList = [begin
                       case ets:match_object(canyon_summit_role,
                                             #canyon_summit_role{group_id =
                                                                     GroupId,
                                                                 _ = '_'})
                           of
                           _ProfileList when is_list(_ProfileList) ->
                               _ProfileList;
                           _ -> []
                       end
                   end
                   || GroupId <- IdList],
    NList = lists:flatten(ProfileList),
    SortData =
        lists:reverse(lists:keysort(#canyon_summit_role.score,
                                    NList)),
    RankData = to_rank_rc(SortData, 1, []),
    rank_zone:cast(RankType,
                   {replace, RankType, RankData, #{}}),
    HonorRoleList = honor_rank(SortData, 1, []),
    logger:info("峡谷之巅称号：~w,~w",
                [RankType, HonorRoleList],
                canyon_summit_agent,
                323),
    honor_mgr:replace(list_to_atom(lists:concat(["canyon_honor_",
                                                 RankType])),
                      HonorRoleList,
                      date:unixtime2() +
                          date:week_next_diff([3],
                                              20 * 3600 + 900 + 10 + 300 + 2400
                                                  + 300)).

get_rank_type(1) -> 79;
get_rank_type(2) -> 79;
get_rank_type(3) -> 80;
get_rank_type(4) -> 80;
get_rank_type(5) -> 81;
get_rank_type(6) -> 81;
get_rank_type(7) -> 82;
get_rank_type(_) -> 0.

to_rank_rc([], _, Acc) -> lists:reverse(Acc);
to_rank_rc([CanyonRole | Rest], Rank, Acc) ->
    #canyon_summit_role{id = Id = {RId, Plat, ZoneId},
                        name = Name, sex = Sex, classes = Classes, lev = Lev,
                        score = Score, group_id = Group} =
        CanyonRole,
    RankRc = #rank_rc{id = Id, rank = Rank, role_id = RId,
                      platform = Plat, zone_id = ZoneId, name = Name,
                      sex = Sex, classes = Classes, lev = Lev, val1 = Score,
                      val2 = Group},
    to_rank_rc(Rest, Rank + 1, [RankRc | Acc]).

honor_rank([], _, List) -> List;
honor_rank(_, Num, List) when Num >= 11 -> List;
honor_rank([#canyon_summit_role{id = _RoleId,
                                group_id = _Group, score = 0}
            | _],
           _Num, List) ->
    List;
honor_rank([#canyon_summit_role{id = RoleId,
                                group_id = _Group, score = _Score}
            | T],
           Num, List) ->
    Add = {RoleId, 30140},
    honor_rank(T, Num + 1, [Add | List]).

update(canyon_summit_role,
       [R = #canyon_summit_role{} | T]) ->
    ets:insert(canyon_summit_role, R),
    update(canyon_summit_role, T);
update(canyon_summit_role, []) -> ok;
update(canyon_summit_role,
       R = #canyon_summit_role{id = {_, P, Z}, pid = Pid}) ->
    ets:insert(canyon_summit_role, R),
    case role_misc:is_local_role({P, Z}) of
        true ->
            role:apply(async,
                       Pid,
                       {canyon_summit_role, role_callback, [{push, 21105}]});
        _ -> ok
    end,
    ok;
update(canyon_summit_team,
       Info = #canyon_summit_team{}) ->
    ets:insert(canyon_summit_team, Info),
    ok;
update(canyon_summit_team,
       [Info = #canyon_summit_team{} | T]) ->
    ets:insert(canyon_summit_team, Info),
    update(canyon_summit_team, T);
update(canyon_summit_team, []) -> ok;
update(canyon_summit_side,
       SideInfo = #canyon_summit_side{}) ->
    ets:insert(canyon_summit_side, SideInfo),
    ok;
update(canyon_summit_side,
       [SideInfo = #canyon_summit_side{} | T]) ->
    ets:insert(canyon_summit_side, SideInfo),
    update(canyon_summit_side, T);
update(canyon_summit_side, []) -> ok;
update(canyon_summit_unit,
       UnitInfo = #canyon_summit_unit{}) ->
    ets:insert(canyon_summit_unit, UnitInfo);
update(canyon_summit_unit,
       [UnitInfo = #canyon_summit_unit{} | T]) ->
    ets:insert(canyon_summit_unit, UnitInfo),
    update(canyon_summit_unit, T);
update(canyon_summit_unit, []) -> ok;
update(canyon_summit_match,
       MatchInfo = #canyon_summit_match{}) ->
    ets:insert(canyon_summit_match, MatchInfo),
    ok;
update(_Lable, _Data) ->
    logger:debug("~w:~w",
                 [_Lable, _Data],
                 canyon_summit_agent,
                 411),
    ok.

del_ets() ->
    ets:delete_all_objects(canyon_summit_side),
    ets:delete_all_objects(canyon_summit_match),
    ets:delete_all_objects(canyon_summit_unit),
    ets:delete_all_objects(canyon_summit_role),
    ets:delete_all_objects(canyon_summit_team),
    ok.

