-file("src/mod/gods_duel/gods_place_agent.erl", 1).

-module(gods_place_agent).

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

-file("src/mod/gods_duel/gods_place_agent.erl", 13).

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

-file("src/mod/gods_duel/gods_place_agent.erl", 14).

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

-file("src/mod/gods_duel/gods_place_agent.erl", 15).

-file("inc/gods_place.hrl", 1).

-record(gods_place_team_statue,
        {ver = 1,
         team_id = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         members = [],
         qualification = 0,
         serial_id = 0,
         team_leader = {0, "", 0}}).

-record(gods_place_team_mate_statue,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         break_times = 0,
         looks = []}).

-record(m_gods_place,
        {ver = 3,
         group_id = 0,
         zone_id = 0,
         zone_pid = 0,
         pick_chest = 0,
         worship_times = 0,
         total_num = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0,
         efficiency_flag = 0,
         pick_flag = 0}).

-file("src/mod/gods_duel/gods_place_agent.erl", 16).

-file("inc/gods_duel.hrl", 1).

-record(gods_duel_team,
        {ver = 1 :: pos_integer(),
         id = {0, "", 0},
         name = "",
         lev = 0,
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         applys = [],
         invite_info = [],
         declaration = "",
         win_times = 0,
         loss_times = 0,
         qualification = 0,
         team_group_256 = 0,
         team_group_64 = 0,
         team_group_8 = 0,
         team_group_4 = 0,
         team_seq = 0,
         team_index = 0}).

-record(gods_duel_team_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         position = 0,
         fight_capacity = 0,
         join_time = 0}).

-record(m_gods_duel,
        {ver = 2, team_id = {0, "", 0}, gods_score = 0}).

-record(gods_duel_season_data,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_season_info,
        {ver = 1,
         id = 0,
         status = 0,
         teams = [],
         group_order = 0,
         season_time_info = []}).

-record(invite_info,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         break_times = 0,
         classes = 0,
         sex = 0,
         total_fc = 0,
         online = 0}).

-record(gods_duel_join_team,
        {id = {0, "", 0},
         team_pid = undefined,
         team_data = undefined,
         fighters = [],
         is_ready = false}).

-record(gods_duel_match,
        {id = {0, 0},
         teams = [],
         combat_pid = undefined :: pid(),
         calc_args = [],
         combat_ref = undefined,
         is_over = 0,
         map_id = 0,
         map_pid = undefined,
         roles = []}).

-record(gods_duel_match_profile,
        {id = 0,
         ver = 1,
         season_id = 0,
         match_type = 0,
         match_round = 0,
         match_id = 0,
         group_id = 0,
         combat_type = 0,
         atk_name,
         dfd_name,
         combat_pid = undefined :: pid(),
         is_over = 0,
         platform = "",
         zone_id = 0,
         time = 0,
         fc_diff = 0,
         round = 0}).

-record(gods_duel_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(gods_duel_vote,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(gods_duel_vote_choice,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         match_zone = 0,
         is_right = 0 :: 0..2}).

-record(gods_duel_poll,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         voted_cnt = 0 :: non_neg_integer()}).

-record(gods_duel_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 1 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         gods_duel_score = 0 :: non_neg_integer()}).

-record(gods_challenge_info,
        {id, combat_pid, is_over = 0}).

-record(gods_duel_team_rank,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_team_rank_data,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         win_times = 0,
         qualification = 0,
         rank = 0}).

-record(gods_duel_team_rank_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 2,
         lev = 0,
         break_times = 0,
         position = 2,
         fight_capacity = 0,
         looks = []}).

-record(gods_challenge_team,
        {season_id = 0,
         team_name = "",
         member_num = 0,
         members = []}).

-record(gods_challenge_team_mate,
        {id = {0, "", 0}, name = ""}).

-file("src/mod/gods_duel/gods_place_agent.erl", 17).

-file("inc/looks.hrl", 1).

-file("src/mod/gods_duel/gods_place_agent.erl", 18).

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

-file("src/mod/gods_duel/gods_place_agent.erl", 19).

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

-file("src/mod/gods_duel/gods_place_agent.erl", 20).

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

-file("src/mod/gods_duel/gods_place_agent.erl", 21).

-behaviour(gen_server).

-export([info/1,
         call/1,
         start_link/0,
         update_worship/1,
         set_efficiency_flag/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state,
        {worship_id = 0, mname = 0, mts = 0, mtimeout = 0}).

start_link() ->
    gen_server:start_link({local, gods_place_agent},
                          gods_place_agent,
                          [],
                          []).

update_worship([Msg | T]) ->
    gods_place_agent ! {update_worship, [Msg | T]};
update_worship(Msg) ->
    gods_place_agent ! {update_worship, Msg}.

info(Info) -> gods_place_agent ! Info.

call(Info) ->
    case catch gen_server:call(gods_place_agent,
                               Info,
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

set_efficiency_flag(Role = #role{m_gods_place =
                                     MgodsPlace}) ->
    {ok,
     Role#role{m_gods_place =
                   MgodsPlace#m_gods_place{efficiency_flag = 1}}}.

init([]) ->
    logger:info("启动中...", [], gods_place_agent, 91),
    process_flag(trap_exit, true),
    dets:open_file(gods_place_team_statue,
                   [{file, "./dets/gods_place_team_statue.dets"},
                    {keypos, #gods_place_team_statue.team_id},
                    {type, set}]),
    ets:new(gods_place_team_statue,
            [set,
             named_table,
             public,
             {keypos, #gods_place_team_statue.team_id}]),
    dets:to_ets(gods_place_team_statue,
                gods_place_team_statue),
    dets:open_file(gods_place_worship_msg,
                   [{file, "./dets/gods_place_worship_msg.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(gods_place_worship_msg,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(gods_place_worship_msg,
                gods_place_worship_msg),
    Ref = set_timer(10, request_state_info),
    put(request_state_info_ref, {1, Ref}),
    Num = length(ets:tab2list(gods_place_worship_msg)),
    State = #state{worship_id = Num},
    logger:info("启动完成", [], gods_place_agent, 112),
    {ok, State}.

handle_call({update_worship, Msg}, _From,
            State = #state{worship_id = Num}) ->
    NewId = (Num + 1) rem 20,
    update_gods_place_worship_msg(NewId, Msg),
    NewState = State#state{worship_id = NewId},
    Reply = ets:tab2list(gods_place_worship_msg),
    {reply, Reply, NewState};
handle_call(get_worship, _From, State) ->
    Reply = ets:tab2list(gods_place_worship_msg),
    {reply, Reply, State};
handle_call({get_status}, _From,
            State = #state{mname = 0, mts = 0, mtimeout = 0}) ->
    {Data, NewState} = case big_world:call(gods_place_mgr,
                                           call,
                                           [{get_status}])
                           of
                           {Mname, Mts, Mtimeout} ->
                               EndTime = calc_end_time(Mts, Mtimeout),
                               Data1 = {Mname, EndTime},
                               logger:debug("同步状态:~w",
                                            [Data1],
                                            gods_place_agent,
                                            137),
                               {Data1,
                                State#state{mname = Mname, mts = Mts,
                                            mtimeout = Mtimeout}};
                           _ ->
                               logger:info("从央服请求活动状态错误",
                                           [],
                                           gods_place_agent,
                                           140),
                               {{0, 0}, State}
                       end,
    {reply, Data, NewState};
handle_call({get_status}, _From,
            State = #state{mname = Mname, mts = Mts,
                           mtimeout = Mtimeout}) ->
    EndTime = calc_end_time(Mts, Mtimeout),
    Data = {Mname, EndTime},
    logger:debug("同步状态:~w", [Data], gods_place_agent, 147),
    {reply, Data, State};
handle_call(get_end_time, _From,
            State = #state{mname = 0, mts = 0, mtimeout = 0}) ->
    {Data, NewState} = case big_world:call(gods_place_mgr,
                                           call,
                                           [{get_status}])
                           of
                           {2, Mts1, Mtimeout1} ->
                               EndTime = calc_end_time(Mts1,
                                                       (140 + 1500) * 1000),
                               {EndTime,
                                State#state{mname = 2, mts = Mts1,
                                            mtimeout = Mtimeout1}};
                           {Mname, Mts, Mtimeout} ->
                               EndTime = calc_end_time(Mts, Mtimeout),
                               {EndTime,
                                State#state{mname = Mname, mts = Mts,
                                            mtimeout = Mtimeout}};
                           _ ->
                               logger:debug("从央服请求活动状态错误",
                                            [],
                                            gods_place_agent,
                                            160),
                               {0, State}
                       end,
    {reply, Data, NewState};
handle_call(get_end_time, _From,
            State = #state{mname = Mname, mts = Mts,
                           mtimeout = Mtimeout}) ->
    EndTime = case Mname =:= 2 of
                  true -> calc_end_time(Mts, (140 + 1500) * 1000);
                  _ -> calc_end_time(Mts, Mtimeout)
              end,
    {reply, EndTime, State};
handle_call(ceremony_flag, _From, State) ->
    Flag = case
               gods_duel_data:get_season_date({gods_duel_common:get_season_id(),
                                               31})
               of
               {_, [EndTime]} ->
                   {Today, _} = date:seconds_to_datetime(date:unixtime2()),
                   EndTime =:= Today orelse Today =:= {2018, 11, 26};
               _ -> false
           end,
    Data = case Flag of
               false -> 0;
               _ -> 1
           end,
    {reply, Data, State};
handle_call({get_champion_team, Group}, _From, State) ->
    GodsTeam = case ets:match_object(gods_place_team_statue,
                                     #gods_place_team_statue{lev = Group,
                                                             _ = '_'})
                   of
                   [] -> [#gods_place_team_statue{}];
                   TeamList ->
                       lists:reverse(lists:keysort(#gods_place_team_statue.serial_id,
                                                   TeamList))
               end,
    Data = {ok, GodsTeam},
    {reply, Data, State};
handle_call(get_season_id, _From, State) ->
    SeasonId = case big_world:call(gods_place_mgr,
                                   call,
                                   [get_season_id])
                   of
                   Num when is_integer(Num) -> Num;
                   _ -> gods_duel_common:get_season_id()
               end,
    {reply, SeasonId, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({update_team, TeamInfo, ChallengeList},
            State) ->
    update_champion_profile(TeamInfo),
    env:set(gods_challenge_list, ChallengeList),
    {noreply, State};
handle_info({update_state,
             SName,
             Ts = {M, S, _},
             TimeOut},
            State) ->
    TimeActive = date:unixtime(zero) +
                     calendar:time_to_seconds({22, 10, 0}),
    case SName of
        1 ->
            Msg = case gods_place_mgr:is_have_ceremony() of
                      true ->
                          lang:get("<color='#00ff00'>封神殿堂</color>将在5分钟后开放，膜拜诸神冠军，"
                                   "观看<color='#00ff00'>诸神挑战</color>，丰富奖励等你来拿{face"
                                   "_1,7}");
                      _ ->
                          notice:format(lang:get("~ts将在5分钟后开放，勇士们准备进场膜拜诸神冠军和抢宝箱啦{face_1,7}"),
                                        [{string_2, 1, lang:get("封神殿堂")}])
                  end,
            notice:cast(all, 5, Msg);
        2 ->
            Msg = case gods_place_mgr:is_have_ceremony() of
                      true ->
                          lang:get("<color='#00ff00'>封神殿堂</color>已开启，膜拜诸神冠军，观看<co"
                                   "lor='#00ff00'>诸神挑战</color>，丰富奖励等你来拿{face_1,7}"
                                   "");
                      _ ->
                          notice:format(lang:get("~ts已经开启，勇士们快进场膜拜诸神冠军和抢宝箱啦{face_1,7}"),
                                        [{string_2, 1, lang:get("封神殿堂")}])
                  end,
            notice:cast(all, 5, Msg);
        3 ->
            case M * 1000000 + S =< TimeActive of
                true ->
                    Msg =
                        notice:format(lang:get("~ts已经开启，勇士们快进场膜拜诸神冠军和抢宝箱啦{face_1,7}"),
                                      [{string_2, 1, lang:get("封神殿堂")}]),
                    notice:cast(all, 5, Msg);
                _ -> ok
            end,
            Ref = case gods_place_mgr:is_have_ceremony() of
                      true ->
                          info({champion_drop_box_time, -1}),
                          erlang:send_after(5 * 60 * 1000,
                                            self(),
                                            {champion_drop_box_time, -1});
                      _ ->
                          info({-1, drop_box_time}),
                          erlang:send_after(5 * 60 * 1000,
                                            self(),
                                            {-1, drop_box_time})
                  end,
            put(gods_place_push_drop_box_time, Ref);
        4 ->
            Msg = notice:format(lang:get("~ts活动结束，各位自行离场"),
                                [{string_2, 1, lang:get("封神殿堂")}]),
            notice:cast(all, 5, Msg),
            case get(gods_place_push_drop_box_time) of
                OldRef when is_reference(OldRef) ->
                    erlang:cancel_timer(OldRef);
                _ -> ok
            end;
        6 ->
            role_group:apply(world,
                             {gods_place_agent, set_efficiency_flag, []});
        _ -> ignore
    end,
    EndTime = calc_end_time(Ts, TimeOut),
    Data = {SName, EndTime},
    logger:debug("同步状态:~w", [Data], gods_place_agent, 278),
    role_group:pack_send(world, 17938, Data),
    NewState = State#state{mname = SName, mts = Ts,
                           mtimeout = TimeOut},
    {noreply, NewState};
handle_info(request_state_info,
            State = #state{mname = 0, mts = 0, mtimeout = 0}) ->
    {Times, OldRef} = case get(request_state_info_ref) of
                          {T, ORef} -> {T, ORef};
                          _ -> {0, udefind}
                      end,
    stop_timer(OldRef),
    NewState = case big_world:call(gods_place_mgr,
                                   call,
                                   [{get_status}])
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
                               logger:error("诸神殿堂平台：~w, 区服：~w请求中央服数据出错",
                                            [env:get(platform),
                                             env:get(zone_id)],
                                            gods_place_agent,
                                            300),
                               State
                       end;
                   {SName, Ts, Timeout} ->
                       State#state{mname = SName, mts = Ts, mtimeout = Timeout}
               end,
    {noreply, NewState};
handle_info(request_state_info, State) ->
    OldRef = get(request_state_info_ref),
    stop_timer(OldRef),
    {noreply, State};
handle_info({Rid, drop_box_time},
            State = #state{mname = 0, mts = 0, mtimeout = 0}) ->
    Nstate = case big_world:call(gods_place_mgr,
                                 call,
                                 [{drop_box_time}])
                 of
                 {error, _Msg} ->
                     logger:error("~ts", [_Msg], gods_place_agent, 316),
                     Data = {0, 0, 0, 0, lang:get("从央服请求活动状态错误")},
                     end_send_box_time(Rid, Data),
                     State;
                 {Ts, Timeout} ->
                     send_box_time(Rid, Ts, Timeout),
                     State#state{mname = 3, mts = Ts, mtimeout = Timeout}
             end,
    {noreply, Nstate};
handle_info({Rid, drop_box_time},
            State = #state{mname = 3, mts = Mts,
                           mtimeout = Mtimeout}) ->
    send_box_time(Rid, Mts, Mtimeout),
    {noreply, State};
handle_info({Rid, drop_box_time}, State) ->
    Data = {0, 0, 0, 0, lang:get("")},
    end_send_box_time(Rid, Data),
    {noreply, State};
handle_info({champion_drop_box_time, Rid},
            State = #state{mname = 0, mts = 0, mtimeout = 0}) ->
    NewState = case big_world:call(gods_place_mgr,
                                   call,
                                   [champion_drop_box_time])
                   of
                   {error, _Msg} ->
                       Data = {0, 0},
                       champion_end_send_box_time(Rid, Data),
                       State;
                   {Ts, Timeout} ->
                       send_box_time(Rid, Ts, Timeout),
                       State#state{mname = 3, mts = Ts, mtimeout = Timeout}
               end,
    {noreply, NewState};
handle_info({champion_drop_box_time, Rid},
            State = #state{mname = 3, mts = Mts,
                           mtimeout = MTimeout}) ->
    champion_send_box_time(Rid, Mts, MTimeout),
    {noreply, State};
handle_info({champion_drop_box_time, Rid}, State) ->
    Data = {0, 0},
    champion_end_send_box_time(Rid, Data),
    {noreply, State};
handle_info({reset, SName, Ts, Timeout}, State) ->
    ets:delete_all_objects(gods_place_team_statue),
    dets:delete_all_objects(gods_place_team_statue),
    ets:delete_all_objects(gods_place_worship_msg),
    dets:delete_all_objects(gods_place_worship_msg),
    EndTime = calc_end_time(Ts, Timeout),
    Data = {SName, EndTime},
    logger:debug("同步状态:~w", [Data], gods_place_agent, 364),
    role_group:pack_send(world, 17938, Data),
    role_group:apply(world, {gods_place_role, reset, []}),
    NewState = State#state{mname = SName, mts = Ts,
                           mtimeout = Timeout},
    {noreply, NewState};
handle_info(_Info, State) ->
    logger:debug("收到未知消息:~w",
                 [_Info],
                 gods_place_agent,
                 371),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [gods_place_agent],
                gods_place_agent,
                375),
    logger:info("[~w] 关闭完成",
                [gods_place_agent],
                gods_place_agent,
                376),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

send_box_time(Rid, Mts, Mtimeout) ->
    {STime1, NRound, ARound} = calc_box_time(Mts, Mtimeout),
    STime2 = calc_end_time(Mts, Mtimeout),
    Data = case STime1 < STime2 of
               true -> {1, STime1, NRound, ARound, lang:get("")};
               _ -> {0, 0, 0, 0, lang:get("")}
           end,
    case Rid of
        -1 ->
            case get(gods_place_push_drop_box_time) of
                OldRef when is_reference(OldRef) ->
                    erlang:cancel_timer(OldRef);
                _ -> ok
            end,
            Ref = erlang:send_after(5 * 60 * 1000,
                                    self(),
                                    {-1, drop_box_time}),
            put(gods_place_push_drop_box_time, Ref),
            role_group:pack_send(world, 17946, Data);
        _ ->
            logger:debug("~w", [Data], gods_place_agent, 406),
            role:pack_send(Rid, 17946, Data)
    end.

end_send_box_time(Rid, Data) ->
    case Rid of
        -1 ->
            case get(gods_place_push_drop_box_time) of
                OldRef when is_reference(OldRef) ->
                    erlang:cancel_timer(OldRef);
                _ -> ok
            end,
            role_group:pack_send(world, 17946, Data);
        _ -> role:pack_send(Rid, 17946, Data)
    end.

champion_send_box_time(Rid, Ts, Timeout) ->
    {STime1, _, _} = calc_box_time(Ts, Timeout),
    STime2 = calc_end_time(Ts, Timeout),
    Data = case STime1 < STime2 of
               true -> {1, STime1};
               _ -> {0, 0}
           end,
    case Rid of
        -1 ->
            case get(gods_place_push_drop_box_time) of
                OldRef when is_reference(OldRef) ->
                    erlang:cancel_timer(OldRef);
                _ -> ok
            end,
            Ref = erlang:send_after(5 * 60 * 1000,
                                    self(),
                                    {champion_drop_box_time, -1}),
            put(gods_place_push_drop_box_time, Ref),
            role_group:pack_send(world, 17965, Data);
        _ -> role:pack_send(Rid, 17965, Data)
    end.

champion_end_send_box_time(Rid, Data) ->
    case Rid of
        -1 ->
            case get(gods_place_push_drop_box_time) of
                OldRef when is_reference(OldRef) ->
                    erlang:cancel_timer(OldRef);
                _ -> ok
            end,
            role_group:pack_send(world, 17965, Data);
        _ -> role:pack_send(Rid, 17965, Data)
    end.

calc_end_time(Ts, TimeOut) ->
    LeftTime = util:time_left(TimeOut, Ts) div 1000,
    Now = date:unixtime(),
    Now + LeftTime.

calc_box_time(Ts, TimeOut) ->
    T1 = util:floor(timer:now_diff(erlang:now(), Ts) /
                        1000),
    SpanTime = case T1 > 0 of
                   true -> T1 div 1000;
                   false -> 0
               end,
    LeftTime = 5 * 60 - SpanTime rem (5 * 60),
    Nextround = SpanTime div (5 * 60) + 1,
    Allround = TimeOut div 1000 div (5 * 60),
    Now = date:unixtime(),
    {Now + LeftTime, Nextround, Allround}.

set_timer(Time, InfoMsg) ->
    erlang:send_after(Time * 1000, self(), InfoMsg).

stop_timer(OldRef) when is_reference(OldRef) ->
    erlang:cancel_timer(OldRef);
stop_timer(_) -> ok.

update_gods_place_worship_msg(NumId, Msg) ->
    ets:insert(gods_place_worship_msg, {NumId, Msg}),
    dets:insert(gods_place_worship_msg, {NumId, Msg}),
    ok.

update_champion_profile(ChampionTeamInfo) ->
    ets:insert(gods_place_team_statue, ChampionTeamInfo),
    dets:insert(gods_place_team_statue, ChampionTeamInfo),
    ok.

