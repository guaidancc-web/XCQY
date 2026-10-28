-file("src/mod/gods_duel/gods_duel_match.erl", 1).

-module(gods_duel_match).

-behaviour(gen_fsm).

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

-file("src/mod/gods_duel/gods_duel_match.erl", 13).

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

-file("src/mod/gods_duel/gods_duel_match.erl", 14).

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

-file("src/mod/gods_duel/gods_duel_match.erl", 15).

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

-file("src/mod/gods_duel/gods_duel_match.erl", 16).

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

-file("src/mod/gods_duel/gods_duel_match.erl", 17).

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

-file("src/mod/gods_duel/gods_duel_match.erl", 18).

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

-file("src/mod/gods_duel/gods_duel_match.erl", 19).

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

-file("src/mod/gods_duel/gods_duel_match.erl", 20).

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

-file("src/mod/gods_duel/gods_duel_match.erl", 21).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idel/2, prepare/2, match/2, over/2]).

-export([start_link/0,
         info/1,
         call/1,
         cast/1,
         next/0,
         combat_over/1,
         combat_fail/3,
         produce_match_info/1,
         get_target_team_id/2,
         test/0,
         update_match_profile/1,
         lookup_match_profile/1]).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         team_join = [],
         season_status = 0,
         round = 0}).

start_link() ->
    gen_fsm:start_link({local, gods_duel_match},
                       gods_duel_match,
                       [],
                       []).

next() -> gen_fsm:send_event(gods_duel_match, timeout).

call(Msg) -> call(gods_duel_match, Msg).

call(Mod, Event) ->
    try gen_fsm:sync_send_all_state_event(Mod, Event) catch
        _Type:_Reason ->
            logger:debug("诸神之战调用失败 Type:~w Reason: ~w, 原因：~w",
                         [Mod, Event, {_Type, _Reason}],
                         gods_duel_match,
                         95),
            {error, timeout}
    end.

info(Msg) -> gods_duel_match ! Msg.

cast(Msg) ->
    gen_fsm:send_all_state_event(gods_duel_match, Msg).

combat_over(#combat{type = CombatType, winner = Winner,
                    loser = Loser,
                    start_args = #combat_start_args{ext_args = ExtArgs},
                    round = Round}) ->
    WinnerF = [F || F = #fighter{type = 1} <- Winner],
    LoserF = [F || F = #fighter{type = 1} <- Loser],
    logger:debug("比赛结算===============",
                 [],
                 gods_duel_match,
                 109),
    case lists:keyfind(match_id, 1, ExtArgs) of
        {_, MatchZoneId} ->
            logger:debug("比赛结算===============:~w",
                         [ExtArgs],
                         gods_duel_match,
                         113),
            CombatRecordId = case lists:keyfind(combat_record_id,
                                                1,
                                                ExtArgs)
                                 of
                                 {combat_record_id, _RecordId} -> _RecordId;
                                 _ -> 0
                             end,
            MatchRound = case lists:keyfind(match_round, 1, ExtArgs)
                             of
                             {_, _MatchRound} -> _MatchRound;
                             _ -> 0
                         end,
            cast_record(#{match_round => MatchRound,
                          combat_type => CombatType, winner => WinnerF,
                          loser => LoserF, record => combat_record:get_buffer(),
                          match_id => CombatRecordId}),
            WinnerRoleIds = [{Rid, Plat, RZoneId}
                             || #fighter{rid = Rid, platform = Plat,
                                         zone_id = RZoneId}
                                    <- WinnerF],
            LoserRoleIds = [{Rid, Plat, RZoneId}
                            || #fighter{rid = Rid, platform = Plat,
                                        zone_id = RZoneId}
                                   <- LoserF],
            SumDmgW = lists:sum([Dmg1
                                 || #fighter{combat_statistics =
                                                 #combat_statistics{total_dmg =
                                                                        Dmg1}}
                                        <- WinnerF]),
            AvgDmgW = round(SumDmgW / 5 / Round),
            AvgDmgL = 0,
            WinFighterList = [to_fighter(F, AvgDmgW)
                              || F <- WinnerF],
            LoseFighterList = [to_fighter(F, AvgDmgL)
                               || F <- LoserF],
            Fun1 = fun (#fighter{pid = Pid1}) when is_pid(Pid1) ->
                           role:pack_send(Pid1,
                                          17926,
                                          {1, WinFighterList, LoseFighterList})
                   end,
            lists:foreach(Fun1, WinnerF),
            Fun2 = fun (#fighter{pid = Pid2}) when is_pid(Pid2) ->
                           role:pack_send(Pid2,
                                          17926,
                                          {0, LoseFighterList, WinFighterList})
                   end,
            lists:foreach(Fun2, LoserF),
            info({combat_over,
                  #{winner => WinnerRoleIds, loser => LoserRoleIds,
                    match_id => MatchZoneId, round => Round,
                    combat_record_id => CombatRecordId}});
        _ ->
            logger:error("查找战区匹配信息出错", [], gods_duel_match, 144),
            false
    end;
combat_over(_) -> skip.

combat_fail(#combat{type = CombatType}, AtkList,
            DefList) ->
    StartArgs = get(start_args),
    gods_duel_match:info({restart_combat,
                          CombatType,
                          AtkList,
                          DefList,
                          StartArgs}),
    ok.

to_fighter(#fighter{origin_id = Id, sex = Sex,
                    lev = Lev, classes = Classes, name = Name,
                    combat_statistics =
                        Stats = #combat_statistics{total_hurt = TotalHurt,
                                                   total_dmg = TotalDmg,
                                                   kill_group_target = KillNum,
                                                   killed_group_target =
                                                       DeadNum,
                                                   total_heal = TotalHeal,
                                                   control_num = ControlNum}},
           AvgDmg) ->
    MvpScore = calc_mvp_score(Stats, AvgDmg),
    #gods_duel_fighter{id = Id, sex = Sex, lev = Lev,
                       classes = Classes, name = Name, total_hurt = TotalHurt,
                       total_dmg = TotalDmg, kill_num = KillNum,
                       dead_num = DeadNum, total_heal = TotalHeal,
                       control_num = ControlNum, mvp_score = MvpScore}.

calc_mvp_score(_, 0) -> 0;
calc_mvp_score(#combat_statistics{total_dmg = TotalDmg,
                                  total_heal = TotalHeal,
                                  control_num = ControlNum},
               AvgDmg) ->
    MvpScore = round(TotalDmg / 1000) +
                   round(ControlNum * AvgDmg * 2 / 1000)
                   + round(TotalHeal / 1000),
    logger:debug("mvp计算：总输出~w，总治疗 ~w，控制数 ~w，队伍平均输出 ~w, "
                 "mvp分数 ~w",
                 [TotalDmg, TotalHeal, ControlNum, AvgDmg, MvpScore],
                 gods_duel_match,
                 163),
    MvpScore.

init([]) ->
    _TimeOut = 60000,
    State = #state{ts = now(), timeout = infinity},
    ets:new(gods_duel_match_info,
            [set,
             named_table,
             public,
             {keypos, #gods_duel_match.id}]),
    case env:get(gods_duel_combat_record_id) of
        RecId when is_integer(RecId) -> ok;
        _ -> env:set(gods_duel_combat_record_id, 1)
    end,
    dets:open_file(gods_duel_match_profile,
                   [{file, "./dets/gods_duel_match_profile.dets"},
                    {keypos, #gods_duel_match_profile.id},
                    {type, set}]),
    ets:new(gods_duel_match_profile,
            [set,
             named_table,
             public,
             {keypos, #gods_duel_match_profile.id}]),
    Result = case dets:first(gods_duel_match_profile) of
                 '$end_of_table' ->
                     logger:info("没有数据需要加载", [], gods_duel_match, 188),
                     [];
                 _ ->
                     dets:traverse(gods_duel_match_profile,
                                   fun (Data) ->
                                           case
                                               gods_duel_ver:conver_match_profile(Data)
                                               of
                                               {false, _} -> {done, false};
                                               {ok, NewData} ->
                                                   update_match_profile(NewData),
                                                   continue
                                           end
                                   end)
             end,
    case Result of
        [] -> {ok, idel, State, infinity};
        _Err ->
            logger:debug("加载数据失败:~w", [_Err], gods_duel_match, 207),
            {stop, data_load_err}
    end.

handle_event(_Event, StateName, State) ->
    logger:error("未知消息 ~w", [_Event], gods_duel_match, 215),
    continue(StateName, State).

handle_sync_event({match_map_info, GodsTeamId}, _From,
                  StateName,
                  State = #state{season_status = SeasonStatus}) ->
    logger:debug("收到查询请求:~w",
                 [{GodsTeamId}],
                 gods_duel_match,
                 219),
    Reply = case get_match_zone_id(SeasonStatus, GodsTeamId)
                of
                {ok, MatchId, MatchZoneId} ->
                    logger:debug("MatchId, MatchZoneId:~w, ~w",
                                 [MatchId, MatchZoneId],
                                 gods_duel_match,
                                 222),
                    Platfrom = env:get(platform),
                    MapZoneId = env:get(zone_id),
                    case lookup_match({MatchId, MatchZoneId}) of
                        {ok, #gods_duel_match{is_over = 1}} ->
                            {false, lang:get("您的比赛已经结束了")};
                        {ok, #gods_duel_match{map_id = MapId, map_pid = MapPid}}
                            when is_pid(MapPid) ->
                            {ok,
                             #{platform => Platfrom, zone_id => MapZoneId,
                               map_id => MapId}};
                        {ok, Match = #gods_duel_match{}} ->
                            case map_mgr:create(30016) of
                                {ok, MapPid, MapId} ->
                                    NewMatch = Match#gods_duel_match{map_id =
                                                                         MapId,
                                                                     map_pid =
                                                                         MapPid},
                                    update_match(NewMatch),
                                    {ok,
                                     #{platform => Platfrom,
                                       zone_id => MapZoneId, map_id => MapId}};
                                _ -> {false, lang:get("创建地图失败，无法进入")}
                            end;
                        _ -> {false, lang:get("不存在的比赛信息")}
                    end;
                _ -> {false, lang:get("您没有比赛，不能入场")}
            end,
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:error("未知消息 ~w", [_Event], gods_duel_match, 248),
    Reply = false,
    continue(Reply, StateName, State).

handle_info({start_match, SeasonStatus}, _StateName,
            #state{}) ->
    TimeOut = 10 * 60 * 1000,
    NewState = #state{ts = now(), timeout = TimeOut,
                      season_status = SeasonStatus},
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{update_match_status,
                     1,
                     SeasonStatus,
                     date:unixtime()}]),
    match_clear(),
    ets:delete_all_objects(gods_duel_match_info),
    produce_match_info(SeasonStatus),
    continue(prepare, NewState);
handle_info(do_match, StateName, State = #state{}) ->
    CombatFun = fun (#gods_duel_match{combat_pid = Pid},
                     _Rtn)
                        when is_pid(Pid) ->
                        ok;
                    (#gods_duel_match{is_over = 1}, _Rtn) -> ok;
                    (Match = #gods_duel_match{}, _) ->
                        start_combat(Match, State);
                    (_, _) -> ok
                end,
    ets:foldl(CombatFun, ok, gods_duel_match_info),
    continue(StateName, State);
handle_info({team_fighter_leave, GodsTeamId, RoleId},
            StateName,
            State = #state{season_status = SeasonStatus}) ->
    logger:debug("队伍[~w]队员[~w]注销参赛",
                 [GodsTeamId, RoleId],
                 gods_duel_match,
                 291),
    case get_match_zone_id(SeasonStatus, GodsTeamId) of
        {ok, MatchId, MatchZoneId} ->
            logger:debug("队伍[~w]队员[~w]注销参赛",
                         [MatchId, MatchZoneId],
                         gods_duel_match,
                         294),
            case lookup_match({MatchId, MatchZoneId}) of
                {ok, #gods_duel_match{combat_pid = Pid}}
                    when is_pid(Pid) ->
                    ok;
                {ok, #gods_duel_match{is_over = 1}} -> ok;
                {ok, Match = #gods_duel_match{teams = TeamJoins}} ->
                    logger:debug("队伍[~w]队员[~w]注销参赛",
                                 [GodsTeamId, TeamJoins],
                                 gods_duel_match,
                                 301),
                    case lists:keyfind(GodsTeamId,
                                       #gods_duel_join_team.id,
                                       TeamJoins)
                        of
                        JoinTeamInfo = #gods_duel_join_team{fighters =
                                                                [Leader
                                                                 | Mates]} ->
                            logger:debug("队伍[~w]队员[~w]注销参赛",
                                         [GodsTeamId, RoleId],
                                         gods_duel_match,
                                         304),
                            NewMates = lists:keydelete(RoleId,
                                                       #team_mate.id,
                                                       Mates),
                            NewFighters = [Leader | NewMates],
                            NewJoinTeamInfo =
                                JoinTeamInfo#gods_duel_join_team{fighters =
                                                                     NewFighters,
                                                                 is_ready = 0},
                            case get_target_team_id(SeasonStatus, GodsTeamId) of
                                false ->
                                    update_team_ready_status(GodsTeamId,
                                                             0,
                                                             team_null,
                                                             Match);
                                {true, TargetTeamId} ->
                                    update_team_ready_status(GodsTeamId,
                                                             0,
                                                             TargetTeamId,
                                                             Match)
                            end,
                            NewTeamJoins = lists:keystore(GodsTeamId,
                                                          #gods_duel_join_team.id,
                                                          TeamJoins,
                                                          NewJoinTeamInfo),
                            NewMatch = Match#gods_duel_match{teams =
                                                                 NewTeamJoins},
                            logger:debug("-------------：~w",
                                         [{MatchId, MatchZoneId}],
                                         gods_duel_match,
                                         319),
                            update_match(NewMatch);
                        _ -> ok
                    end;
                _ ->
                    logger:error("未查询到参战信息", [], gods_duel_match, 325),
                    ok
            end;
        _Err ->
            logger:error("未查询到参战信息：~w, 错误信息:~w",
                         [{GodsTeamId, RoleId}, _Err],
                         gods_duel_match,
                         329),
            ok
    end,
    continue(StateName, State);
handle_info({match_leave, GodsTeamId, RoleId},
            StateName,
            State = #state{season_status = SeasonStatus}) ->
    logger:debug("离开诸神战场:~w",
                 [{GodsTeamId, RoleId}],
                 gods_duel_match,
                 336),
    case get_match_zone_id(SeasonStatus, GodsTeamId) of
        {ok, MatchId, MatchZoneId} ->
            case lookup_match({MatchId, MatchZoneId}) of
                {ok,
                 Match = #gods_duel_match{teams = JoinTeams,
                                          roles = Roles}} ->
                    NewJoinTeams = case lists:keyfind(GodsTeamId,
                                                      #gods_duel_join_team.id,
                                                      JoinTeams)
                                       of
                                       JoinTeamInfo =
                                           #gods_duel_join_team{fighters =
                                                                    [Leader
                                                                     | Mates]} ->
                                           NewMates = lists:keydelete(RoleId,
                                                                      #team_mate.id,
                                                                      Mates),
                                           NewFighters = [Leader | NewMates],
                                           NewJoinTeamInfo =
                                               JoinTeamInfo#gods_duel_join_team{fighters
                                                                                    =
                                                                                    NewFighters,
                                                                                is_ready
                                                                                    =
                                                                                    0},
                                           lists:keystore(GodsTeamId,
                                                          #gods_duel_join_team.id,
                                                          JoinTeams,
                                                          NewJoinTeamInfo);
                                       _ -> JoinTeams
                                   end,
                    case get_target_team_id(SeasonStatus, GodsTeamId) of
                        false ->
                            update_team_ready_status(GodsTeamId,
                                                     0,
                                                     team_null,
                                                     Match);
                        {true, TargetTeamId} ->
                            update_team_ready_status(GodsTeamId,
                                                     0,
                                                     TargetTeamId,
                                                     Match)
                    end,
                    NewRoles = lists:keydelete(RoleId, 1, Roles),
                    NewMatch = Match#gods_duel_match{roles = NewRoles,
                                                     teams = NewJoinTeams},
                    update_match(NewMatch);
                _ -> ok
            end;
        _ -> ok
    end,
    continue(StateName, State);
handle_info({enter_match,
             GodsTeamInfo = #gods_duel_team{id = TeamId},
             Fighters,
             MateIds},
            StateName,
            State = #state{season_status = SeasonStatus}) ->
    logger:debug("进入场地:队伍信息~w， 战斗信息:~w, 队员:~w",
                 [GodsTeamInfo, Fighters, MateIds],
                 gods_duel_match,
                 369),
    case get_match_zone_id(SeasonStatus, TeamId) of
        {ok, MatchId, MatchZoneId} ->
            case lookup_match({MatchId, MatchZoneId}) of
                {ok,
                 Match = #gods_duel_match{teams = JoinTeams,
                                          roles = Roles}} ->
                    case lists:keyfind(TeamId,
                                       #gods_duel_join_team.id,
                                       JoinTeams)
                        of
                        #gods_duel_join_team{fighters = OldFigters}
                            when length(OldFigters) =< length(Fighters) ->
                            logger:debug("正式战队进入", [], gods_duel_match, 376),
                            case get_target_team_id(SeasonStatus, TeamId) of
                                false ->
                                    update_team_ready_status(TeamId,
                                                             0,
                                                             team_null,
                                                             Match);
                                {true, TargetTeamId} ->
                                    update_team_ready_status(TeamId,
                                                             0,
                                                             TargetTeamId,
                                                             Match)
                            end,
                            JoinTeamInfo = #gods_duel_join_team{id = TeamId,
                                                                team_data =
                                                                    GodsTeamInfo,
                                                                fighters =
                                                                    Fighters,
                                                                is_ready = 0},
                            NewJoinTeams = lists:keystore(TeamId,
                                                          #gods_duel_join_team.id,
                                                          JoinTeams,
                                                          JoinTeamInfo),
                            NewRoles = lists:foldl(fun ({RoleId, Pid}, Rtn) ->
                                                           lists:keystore(RoleId,
                                                                          1,
                                                                          Rtn,
                                                                          {RoleId,
                                                                           Pid})
                                                   end,
                                                   MateIds,
                                                   Roles),
                            NewMatch = Match#gods_duel_match{teams =
                                                                 NewJoinTeams,
                                                             roles = NewRoles},
                            update_match(NewMatch);
                        false ->
                            logger:debug("战队第一次进入", [], gods_duel_match, 396),
                            case get_target_team_id(SeasonStatus, TeamId) of
                                false ->
                                    update_team_ready_status(TeamId,
                                                             0,
                                                             team_null,
                                                             Match);
                                {true, TargetTeamId} ->
                                    update_team_ready_status(TeamId,
                                                             0,
                                                             TargetTeamId,
                                                             Match)
                            end,
                            JoinTeamInfo = #gods_duel_join_team{id = TeamId,
                                                                team_data =
                                                                    GodsTeamInfo,
                                                                fighters =
                                                                    Fighters,
                                                                is_ready = 0},
                            NewJoinTeams = lists:keystore(TeamId,
                                                          #gods_duel_join_team.id,
                                                          JoinTeams,
                                                          JoinTeamInfo),
                            NewRoles = lists:foldl(fun ({RoleId, Pid}, Rtn) ->
                                                           lists:keystore(RoleId,
                                                                          1,
                                                                          Rtn,
                                                                          {RoleId,
                                                                           Pid})
                                                   end,
                                                   MateIds,
                                                   Roles),
                            NewMatch = Match#gods_duel_match{teams =
                                                                 NewJoinTeams,
                                                             roles = NewRoles},
                            update_match(NewMatch);
                        _ ->
                            logger:debug("无效战队进入", [], gods_duel_match, 416),
                            ok
                    end;
                _Err ->
                    logger:error("入场时查询比赛信息失败:~w",
                                 [_Err],
                                 gods_duel_match,
                                 420),
                    skip
            end;
        _ -> ok
    end,
    continue(StateName, State);
handle_info({team_fighter_update, GodsTeamId, Figters},
            StateName,
            State = #state{season_status = SeasonStatus}) ->
    logger:debug("战队参赛队员更新:~w，参赛信息:~w",
                 [GodsTeamId, Figters],
                 gods_duel_match,
                 432),
    case get_match_zone_id(SeasonStatus, GodsTeamId) of
        {ok, MatchId, MatchZoneId} ->
            case lookup_match({MatchId, MatchZoneId}) of
                {ok, Match = #gods_duel_match{teams = TeamJoins}} ->
                    case lists:keyfind(GodsTeamId,
                                       #gods_duel_join_team.id,
                                       TeamJoins)
                        of
                        JoinTeamInfo = #gods_duel_join_team{fighters =
                                                                OldFigters}
                            when length(OldFigters) =< length(Figters) ->
                            NewJoinTeamInfo =
                                JoinTeamInfo#gods_duel_join_team{fighters =
                                                                     Figters,
                                                                 is_ready = 0},
                            case get_target_team_id(SeasonStatus, GodsTeamId) of
                                false ->
                                    update_team_ready_status(GodsTeamId,
                                                             0,
                                                             team_null,
                                                             Match);
                                {true, TargetTeamId} ->
                                    update_team_ready_status(GodsTeamId,
                                                             0,
                                                             TargetTeamId,
                                                             Match)
                            end,
                            NewTeamJoins = lists:keystore(GodsTeamId,
                                                          #gods_duel_join_team.id,
                                                          TeamJoins,
                                                          NewJoinTeamInfo),
                            NewMatch = Match#gods_duel_match{teams =
                                                                 NewTeamJoins},
                            update_match(NewMatch);
                        _ -> ok
                    end;
                _ ->
                    logger:error("未查询到参战信息", [], gods_duel_match, 456),
                    ok
            end;
        _ ->
            logger:error("未查询到参战信息：~w",
                         [{GodsTeamId, Figters}],
                         gods_duel_match,
                         460),
            ok
    end,
    continue(StateName, State);
handle_info({team_ready, GodsTeamId, Figters},
            StateName,
            State = #state{season_status = SeasonStatus}) ->
    case get_match_zone_id(SeasonStatus, GodsTeamId) of
        {ok, MatchId, ZoneId} ->
            logger:debug("战队准备就绪:~w",
                         [{MatchId, ZoneId}],
                         gods_duel_match,
                         471),
            case lookup_match({MatchId, ZoneId}) of
                {ok, #gods_duel_match{combat_pid = Pid}}
                    when is_pid(Pid) ->
                    State;
                {ok, #gods_duel_match{is_over = 1}} -> State;
                {ok, Match = #gods_duel_match{teams = JoinTeams}} ->
                    case lists:keyfind(GodsTeamId,
                                       #gods_duel_join_team.id,
                                       JoinTeams)
                        of
                        JoinTeamInfo = #gods_duel_join_team{} ->
                            NewJoinTeamInfo =
                                JoinTeamInfo#gods_duel_join_team{fighters =
                                                                     Figters,
                                                                 is_ready = 1},
                            NewJoinTeams = lists:keystore(GodsTeamId,
                                                          #gods_duel_join_team.id,
                                                          JoinTeams,
                                                          NewJoinTeamInfo),
                            NewMatch = Match#gods_duel_match{teams =
                                                                 NewJoinTeams},
                            update_match(NewMatch);
                        _ ->
                            logger:error("查询战队参战信息出错",
                                         [],
                                         gods_duel_match,
                                         487),
                            ok
                    end,
                    TargetTeamId = get_target_team_id(SeasonStatus,
                                                      GodsTeamId,
                                                      MatchId,
                                                      ZoneId),
                    case lists:keyfind(TargetTeamId,
                                       #gods_duel_join_team.id,
                                       JoinTeams)
                        of
                        #gods_duel_join_team{is_ready = 1} ->
                            logger:debug("双方已经准备，发起战斗：~w, 战区:~w",
                                         [MatchId, ZoneId],
                                         gods_duel_match,
                                         494),
                            info({start_combat, MatchId, ZoneId});
                        _Else -> ok
                    end,
                    update_team_ready_status(GodsTeamId,
                                             1,
                                             TargetTeamId,
                                             Match),
                    ok;
                _ ->
                    logger:error("不存在的准备信息：~w",
                                 [{MatchId, ZoneId}],
                                 gods_duel_match,
                                 504)
            end;
        _ ->
            logger:error("查询赛区id出错：~w",
                         [{SeasonStatus, GodsTeamId}],
                         gods_duel_match,
                         507),
            ok
    end,
    continue(StateName, State);
handle_info({query_team_status, GodsTeamId}, StateName,
            State = #state{season_status = SeasonStatus}) ->
    case get_match_zone_id(SeasonStatus, GodsTeamId) of
        {ok, MatchId, ZoneId} ->
            logger:debug("战队准备状态:~w",
                         [{MatchId, ZoneId}],
                         gods_duel_match,
                         516),
            case lookup_match({MatchId, ZoneId}) of
                {ok, Match = #gods_duel_match{teams = JoinTeams}} ->
                    case lists:keyfind(GodsTeamId,
                                       #gods_duel_join_team.id,
                                       JoinTeams)
                        of
                        #gods_duel_join_team{is_ready = IsReady} ->
                            TargetTeamId = get_target_team_id(SeasonStatus,
                                                              GodsTeamId,
                                                              MatchId,
                                                              ZoneId),
                            update_team_ready_status(GodsTeamId,
                                                     IsReady,
                                                     TargetTeamId,
                                                     Match);
                        _ ->
                            logger:error("查询战队参战信息出错",
                                         [],
                                         gods_duel_match,
                                         525),
                            ok
                    end,
                    ok;
                _ -> ok
            end;
        _ ->
            logger:error("查询赛区id出错：~w",
                         [{SeasonStatus, GodsTeamId}],
                         gods_duel_match,
                         533),
            ok
    end,
    continue(StateName, State);
handle_info({team_ready, TeamId}, StateName,
            State = #state{season_status = SeasonStatus}) ->
    case get_match_zone_id(SeasonStatus, TeamId) of
        {ok, MatchId, ZoneId} ->
            case lookup_match({MatchId, ZoneId}) of
                {ok, Match = #gods_duel_match{teams = JoinTeams}} ->
                    case lists:keyfind(TeamId,
                                       #gods_duel_join_team.id,
                                       JoinTeams)
                        of
                        JoinTeam = #gods_duel_join_team{is_ready = 1} ->
                            NewJoinTeam = JoinTeam#gods_duel_join_team{is_ready
                                                                           = 0},
                            NewJoinTeams = lists:keystore(TeamId,
                                                          #gods_duel_join_team.id,
                                                          JoinTeams,
                                                          NewJoinTeam),
                            NewMatch = Match#gods_duel_match{teams =
                                                                 NewJoinTeams},
                            update_match(NewMatch),
                            TargetTeamId = get_target_team_id(SeasonStatus,
                                                              TeamId,
                                                              MatchId,
                                                              ZoneId),
                            update_team_ready_status(TeamId,
                                                     0,
                                                     TargetTeamId,
                                                     NewMatch);
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ ->
            logger:error("战队场次查询失败:~w",
                         [{TeamId, SeasonStatus}],
                         gods_duel_match,
                         559)
    end,
    continue(StateName, State);
handle_info({restart_combat,
             _CombatType,
             AtkFighters,
             DfdFighters,
             StartArgs = #combat_start_args{ext_args = Args}},
            StateName = prepare, State) ->
    case lists:keyfind(match_id, 1, Args) of
        {_, MatchZoneId} ->
            Msg = lang:get("由于有队员没有准备好,请重新发起准备"),
            [notice:send(RoleId, 1, Msg)
             || #fighter{origin_id = RoleId, type = 1}
                    <- AtkFighters ++ DfdFighters],
            case lookup_match(MatchZoneId) of
                {ok, Match} ->
                    NewMatch = Match#gods_duel_match{combat_pid =
                                                         undefined},
                    update_match(NewMatch);
                _ -> ok
            end,
            case lists:keyfind(combat_record_id, 1, Args) of
                {_, CombatRecordId} ->
                    ets:update_element(gods_duel_match_profile,
                                       CombatRecordId,
                                       [{#gods_duel_match_profile.combat_pid,
                                         undefined}]);
                _ -> ok
            end;
        _ ->
            logger:error("重复发起战斗失败:~w",
                         [StartArgs],
                         gods_duel_match,
                         584),
            false
    end,
    continue(StateName, State);
handle_info({restart_combat,
             _CombatType,
             AtkFighters,
             DfdFighters,
             #combat_start_args{ext_args = Args}},
            StateName, State) ->
    logger:debug("发起战斗失败", [], gods_duel_match, 590),
    AtkFightNum = erlang:length([ok
                                 || #fighter{origin_id = RoleId, type = 1}
                                        <- AtkFighters,
                                    check_combat_status(RoleId) =:= false]),
    DfdFightNum = erlang:length([ok
                                 || #fighter{origin_id = RoleId, type = 1}
                                        <- DfdFighters,
                                    check_combat_status(RoleId) =:= false]),
    logger:debug("发起战斗失败:~w",
                 [{AtkFightNum, DfdFightNum}],
                 gods_duel_match,
                 594),
    case lists:keyfind(fighter_team, 1, Args) of
        {_, {AtkTeamId, DfdTeamId}} ->
            logger:debug("发起战斗失败:~w",
                         [{AtkTeamId, DfdTeamId}],
                         gods_duel_match,
                         597),
            ArkRoles = [RoleId
                        || #fighter{origin_id = RoleId, type = 1}
                               <- AtkFighters],
            DfdRoles = [RoleId
                        || #fighter{origin_id = RoleId, type = 1}
                               <- DfdFighters],
            {WinnerRoleIds, LoserRoleIds} = case true of
                                                _
                                                    when AtkFightNum >
                                                             DfdFightNum ->
                                                    {ArkRoles, DfdRoles};
                                                _
                                                    when AtkFightNum =:=
                                                             DfdFightNum ->
                                                    AtkTotalFC = case catch
                                                                          ets:lookup(gods_duel_team_sign,
                                                                                     AtkTeamId)
                                                                     of
                                                                     [#gods_duel_team{fight_capacity
                                                                                          =
                                                                                          _AtkFC}] ->
                                                                         _AtkFC;
                                                                     _ -> 0
                                                                 end,
                                                    DfdTotalFC = case catch
                                                                          ets:lookup(gods_duel_team_sign,
                                                                                     DfdTeamId)
                                                                     of
                                                                     [#gods_duel_team{fight_capacity
                                                                                          =
                                                                                          _DfdFC}] ->
                                                                         _DfdFC;
                                                                     _ -> 0
                                                                 end,
                                                    case AtkTotalFC >=
                                                             DfdTotalFC
                                                        of
                                                        true ->
                                                            {ArkRoles,
                                                             DfdRoles};
                                                        _ ->
                                                            {DfdRoles, ArkRoles}
                                                    end;
                                                _ -> {DfdRoles, ArkRoles}
                                            end,
            case lists:keyfind(match_id, 1, Args) of
                {_, MatchZoneId} ->
                    case lists:keyfind(combat_record_id, 1, Args) of
                        {_, CombatRecordId} ->
                            case lists:keyfind(match_round, 1, Args) of
                                {_, Round} ->
                                    ResultArgs = #{winner => WinnerRoleIds,
                                                   loser => LoserRoleIds,
                                                   match_id => MatchZoneId,
                                                   round => Round,
                                                   combat_record_id =>
                                                       CombatRecordId},
                                    logger:debug("发起战斗失败:~w",
                                                 [ResultArgs],
                                                 gods_duel_match,
                                                 625),
                                    info({combat_over, ResultArgs});
                                _ -> ok
                            end;
                        _ -> ok
                    end;
                _ ->
                    logger:error("诸神战斗找不到比赛id:~w",
                                 [Args],
                                 gods_duel_match,
                                 634),
                    ok
            end;
        _ ->
            logger:error("诸神战斗找不到进攻防守方:~w",
                         [Args],
                         gods_duel_match,
                         638),
            ok
    end,
    continue(StateName, State);
handle_info({start_combat,
             AtkTeamId,
             DfdTeamId,
             AtkFighters,
             DfdFighters,
             #combat_start_args{ext_args = ExtArgs}},
            StateName,
            State = #state{season_status = SeasonStatus}) ->
    {_, {MatchId, ZoneId}} = lists:keyfind(match_id,
                                           1,
                                           ExtArgs),
    AtkFightNum = length(AtkFighters),
    DfdFightNum = length(DfdFighters),
    case lookup_match({MatchId, ZoneId}) of
        {ok, #gods_duel_match{is_over = 1}} ->
            logger:debug("已经进入战斗，无需重复发起", [], gods_duel_match, 649),
            ok;
        {ok, #gods_duel_match{combat_pid = Pid}}
            when is_pid(Pid) ->
            logger:debug("已经进入战斗，无需重复发起", [], gods_duel_match, 652),
            ok;
        {ok, Match = #gods_duel_match{teams = MatchTeams}} ->
            {CombatType, ExtArgs1} = case
                                         gods_duel_common:get_match_index(SeasonStatus)
                                         of
                                         {1, _} -> {110, ExtArgs};
                                         {2, MatchRound} ->
                                             {111,
                                              [{match_round, MatchRound}
                                               | ExtArgs]};
                                         _ -> {110, ExtArgs}
                                     end,
            NewExtArgs = [{fighter_team, {AtkTeamId, DfdTeamId}}
                          | ExtArgs1],
            NewStartArgs = #combat_start_args{ext_args =
                                                  NewExtArgs},
            case combat_mgr:start_combat(CombatType,
                                         AtkFighters,
                                         DfdFighters,
                                         NewStartArgs)
                of
                {ok, CombatPid} ->
                    NewMatch = Match#gods_duel_match{combat_pid =
                                                         CombatPid},
                    update_match(NewMatch),
                    AtkName = case lists:keyfind(AtkTeamId,
                                                 #gods_duel_join_team.id,
                                                 MatchTeams)
                                  of
                                  #gods_duel_join_team{team_data =
                                                           #gods_duel_team{name
                                                                               =
                                                                               _AtkName}} ->
                                      _AtkName;
                                  _ -> lang:get("神秘战队")
                              end,
                    DfdName = case lists:keyfind(DfdTeamId,
                                                 #gods_duel_join_team.id,
                                                 MatchTeams)
                                  of
                                  #gods_duel_join_team{team_data =
                                                           #gods_duel_team{name
                                                                               =
                                                                               _DfdName}} ->
                                      _DfdName;
                                  _ -> lang:get("神秘战队")
                              end,
                    {_, CombatRecordId} = lists:keyfind(combat_record_id,
                                                        1,
                                                        ExtArgs),
                    case gods_duel_common:get_match_index(SeasonStatus) of
                        {2, MatchRoud} when MatchRoud >= 1 ->
                            SeasonId = case
                                           gods_duel_mgr:get_current_season_id()
                                           of
                                           {ok, _SeasonId} -> _SeasonId;
                                           _ -> 0
                                       end,
                            MatchProfile = #gods_duel_match_profile{id =
                                                                        CombatRecordId,
                                                                    season_id =
                                                                        SeasonId,
                                                                    match_type =
                                                                        2,
                                                                    match_round
                                                                        =
                                                                        MatchRoud,
                                                                    match_id =
                                                                        MatchId,
                                                                    group_id =
                                                                        ZoneId,
                                                                    combat_type
                                                                        =
                                                                        CombatType,
                                                                    atk_name =
                                                                        AtkName,
                                                                    dfd_name =
                                                                        DfdName,
                                                                    combat_pid =
                                                                        CombatPid,
                                                                    is_over = 0,
                                                                    time =
                                                                        date:unixtime()},
                            big_world:cast(all,
                                           gods_duel_agent,
                                           info,
                                           [{update_match_profile,
                                             MatchProfile}]),
                            update_match_profile(MatchProfile),
                            ok;
                        _ -> ok
                    end,
                    ok;
                {false, Reason} ->
                    logger:error("发起战斗失败 ids1 ~w , ids2 ~w Reason:~w",
                                 [AtkFighters, DfdFighters, Reason],
                                 gods_duel_match,
                                 703),
                    {WTid, LTid} = case true of
                                       _ when AtkFightNum > DfdFightNum ->
                                           {AtkTeamId, DfdTeamId};
                                       _ when AtkFightNum =:= DfdFightNum ->
                                           AtkTotalFC = case catch
                                                                 ets:lookup(gods_duel_team_sign,
                                                                            AtkTeamId)
                                                            of
                                                            [#gods_duel_team{fight_capacity
                                                                                 =
                                                                                 _AtkFC}] ->
                                                                _AtkFC;
                                                            _ -> 0
                                                        end,
                                           DfdTotalFC = case catch
                                                                 ets:lookup(gods_duel_team_sign,
                                                                            DfdTeamId)
                                                            of
                                                            [#gods_duel_team{fight_capacity
                                                                                 =
                                                                                 _DfdFC}] ->
                                                                _DfdFC;
                                                            _ -> 0
                                                        end,
                                           case AtkTotalFC >= DfdTotalFC of
                                               true -> {AtkTeamId, DfdTeamId};
                                               _ -> {DfdTeamId, AtkTeamId}
                                           end;
                                       _ -> {DfdTeamId, AtkTeamId}
                                   end,
                    Args = #{win_team_id => WTid, loss_team_id => LTid,
                             match_id => {MatchId, ZoneId}},
                    info({combat_over, Args})
            end;
        _Err ->
            logger:error("发起战斗失败:~w", [_Err], gods_duel_match, 726)
    end,
    continue(StateName, State);
handle_info({start_combat, MatchId, ZoneId}, StateName,
            State = #state{}) ->
    logger:debug("发起战斗,对战id:~w, 战区：~w",
                 [MatchId, ZoneId],
                 gods_duel_match,
                 731),
    case lookup_match({MatchId, ZoneId}) of
        {ok, #gods_duel_match{combat_pid = Pid}}
            when is_pid(Pid) ->
            ok;
        {ok, #gods_duel_match{is_over = 1}} -> ok;
        {ok, Match = #gods_duel_match{combat_ref = Ref}} ->
            case erlang:is_reference(Ref) of
                true -> erlang:cancel_timer(Ref);
                false -> ok
            end,
            start_combat(Match, State),
            ok;
        _Err ->
            logger:error("无效的战斗匹配:~w, 错误信息:~w",
                         [{MatchId, ZoneId}, _Err],
                         gods_duel_match,
                         745),
            ok
    end,
    continue(StateName, State);
handle_info({combat_over,
             Args = #{win := Win, loss := Loss, win_team_id := WTid,
                      loss_team_id := LTid, match_id := {MatchId, ZoneId}}},
            StateName,
            State = #state{season_status = SeasonStatus}) ->
    case get_match_team_info(SeasonStatus, MatchId, ZoneId)
        of
        {true, LTid, WTid, _} ->
            case lookup_match({MatchId, ZoneId}) of
                {ok, Match = #gods_duel_match{teams = Teams}} ->
                    NewTeams = [Jt#gods_duel_join_team{is_ready = 2}
                                || Jt <- Teams],
                    NewMatch = Match#gods_duel_match{is_over = 1,
                                                     combat_pid = undefined,
                                                     teams = NewTeams},
                    update_team_ready_status(LTid, 2, WTid, NewMatch),
                    update_match(NewMatch);
                _ErrMatch ->
                    logger:error("查询匹配信息错误:~w",
                                 [_ErrMatch],
                                 gods_duel_match,
                                 764),
                    skip
            end,
            gods_duel_mgr:info({combat_over,
                                #{win => Win, loss => Loss, win_team => WTid,
                                  loss_team => LTid,
                                  match_id => {MatchId, ZoneId}}});
        {true, WTid, LTid, _} ->
            case lookup_match({MatchId, ZoneId}) of
                {ok, Match = #gods_duel_match{teams = Teams}} ->
                    NewTeams = [Jt#gods_duel_join_team{is_ready = 2}
                                || Jt <- Teams],
                    NewMatch = Match#gods_duel_match{is_over = 1,
                                                     combat_pid = undefined,
                                                     teams = NewTeams},
                    update_team_ready_status(LTid, 2, WTid, NewMatch),
                    update_match(NewMatch);
                _ErrMatch ->
                    logger:error("查询匹配信息错误:~w",
                                 [_ErrMatch],
                                 gods_duel_match,
                                 779),
                    skip
            end,
            gods_duel_mgr:info({combat_over,
                                #{win => Win, loss => Loss, win_team => WTid,
                                  loss_team => LTid,
                                  match_id => {MatchId, ZoneId}}});
        _Err ->
            logger:error("战斗结算获取战队信息错误:~w, 战斗结算信息:~w",
                         [_Err, Args],
                         gods_duel_match,
                         787),
            skip
    end,
    case gods_duel_common:get_match_index(SeasonStatus) of
        {2, 7} ->
            gods_duel_mgr:info({gods_champion, #{team_id => WTid}}),
            info(combat_over_check);
        {2, _} -> info(combat_over_check);
        _ -> ok
    end,
    continue(StateName, State);
handle_info({combat_over,
             #{winner := WinnerRoleIds, loser := _LoserRoleIds,
               match_id := {MatchId, ZoneId},
               combat_record_id := CombatRecordId}},
            StateName,
            State = #state{season_status = SeasonStatus}) ->
    logger:debug("战斗结束, 胜利者:~w, 失败者:~w, 比赛id：~w",
                 [WinnerRoleIds, _LoserRoleIds, {MatchId, ZoneId}],
                 gods_duel_match,
                 802),
    case get_match_team_info(SeasonStatus, MatchId, ZoneId)
        of
        {true, TeamId1, TeamId2, _} ->
            case lookup_match({MatchId, ZoneId}) of
                {ok, Match = #gods_duel_match{teams = Teams}} ->
                    NewTeams = [Jt#gods_duel_join_team{is_ready = 2}
                                || Jt <- Teams],
                    NewMatch = Match#gods_duel_match{is_over = 1,
                                                     combat_pid = undefined,
                                                     teams = NewTeams},
                    update_team_ready_status(TeamId1, 2, TeamId2, NewMatch),
                    update_match(NewMatch);
                _ErrMatch ->
                    logger:error("查询匹配信息错误:~w",
                                 [_ErrMatch],
                                 gods_duel_match,
                                 813),
                    skip
            end,
            case lookup_match_profile(CombatRecordId) of
                {ok, MatchProfile} ->
                    NewMatchProfile =
                        MatchProfile#gods_duel_match_profile{is_over = 1,
                                                             combat_pid =
                                                                 undefined},
                    update_match_profile(NewMatchProfile),
                    big_world:cast(all,
                                   gods_duel_agent,
                                   info,
                                   [{update_match_profile, NewMatchProfile}]);
                _ -> ok
            end,
            {WTid, LTid} = case is_team_member({MatchId, ZoneId},
                                               TeamId1,
                                               WinnerRoleIds)
                               of
                               true -> {TeamId1, TeamId2};
                               _ -> {TeamId2, TeamId1}
                           end,
            logger:debug("胜利的战队是:~w, 失败的战队是:~w",
                         [WTid, LTid],
                         gods_duel_match,
                         830),
            case gods_duel_common:get_match_index(SeasonStatus) of
                {2, 7} ->
                    gods_duel_mgr:info({gods_champion, #{team_id => WTid}});
                _ -> ok
            end,
            gods_duel_mgr:info({combat_over,
                                #{win => win, loss => loss, win_team => WTid,
                                  loss_team => LTid,
                                  match_id => {MatchId, ZoneId}}});
        _Err ->
            logger:error("战斗结算获取战队信息错误:~w",
                         [_Err],
                         gods_duel_match,
                         840),
            skip
    end,
    case gods_duel_common:get_match_index(SeasonStatus) of
        {2, _} -> info(combat_over_check);
        _ -> ok
    end,
    continue(StateName, State);
handle_info(push_17966, StateName,
            State = #state{season_status = SeasonStatus}) ->
    logger:debug("收到开始处理协议17966:~w",
                 [StateName],
                 gods_duel_match,
                 853),
    SeasonID = gods_duel_common:get_season_id(),
    TimeOut1 = case
                   gods_duel_common:get_state_get_time_config(SeasonID,
                                                              SeasonStatus)
                   of
                   {StartTime, EndTime} ->
                       (EndTime - StartTime) * 1000 - 11 * 60 * 1000;
                   _ ->
                       case gods_duel_common:get_match_index(SeasonStatus) of
                           {2, _} -> 2940000;
                           _ -> 1140000
                       end
               end,
    FinishTime = erlang:round(TimeOut1 / 1000 +
                                  date:unixtime()),
    ets:foldl(fun (#gods_duel_match{is_over = 0,
                                    roles = RoleIds},
                   FinishTime1) ->
                      logger:debug("收到开始处理1协议17966:~w",
                                   [RoleIds],
                                   gods_duel_match,
                                   870),
                      [big_world:cast(all,
                                      gods_duel_role,
                                      apply_push_17966,
                                      [{RolePid, FinishTime1}])
                       || {_RoleId, RolePid} <- RoleIds],
                      FinishTime1;
                  (_, FinishTime1) -> FinishTime1
              end,
              FinishTime,
              gods_duel_match_info),
    continue(StateName, State);
handle_info({push_17966, Link}, match,
            State = #state{ts = {S1, S2, S3},
                           season_status = SeasonStatus}) ->
    NowTime = date:unixtime(ms),
    MatchTime = NowTime -
                    trunc(S1 * 1000000000 + S2 * 1000 + S3 / 1000),
    SeasonID = gods_duel_common:get_season_id(),
    TimeOut1 = case
                   gods_duel_common:get_state_get_time_config(SeasonID,
                                                              SeasonStatus)
                   of
                   {StartTime, EndTime} ->
                       (EndTime - StartTime) * 1000 - 11 * 60 * 1000;
                   _ ->
                       case gods_duel_common:get_match_index(SeasonStatus) of
                           {2, _} -> 2940000;
                           _ -> 1140000
                       end
               end,
    case TimeOut1 - MatchTime < 15 * 60 * 1000 of
        true ->
            SendTime = erlang:round((NowTime - MatchTime + TimeOut1)
                                        / 1000),
            role:link_send(Link, 17966, {SendTime});
        false -> ok
    end,
    continue(match, State);
handle_info({push_17966, _Link}, StateName, State) ->
    logger:debug("处理2协议17966", [], gods_duel_match, 904),
    continue(StateName, State);
handle_info(combat_over_check, StateName, State) ->
    Fun = fun (#gods_duel_match{is_over = 0}, Rtn) ->
                  [Rtn | 0];
              (_, Rtn) -> Rtn
          end,
    case ets:foldl(Fun, [], gods_duel_match_info) of
        [] -> next();
        _ -> ok
    end,
    continue(StateName, State);
handle_info(print, StateName, State) ->
    logger:info("状态:~w, 信息:~w",
                [StateName, State],
                gods_duel_match,
                921),
    continue(StateName, State);
handle_info({'EXIT', _Pid, normal}, StateName, State) ->
    logger:debug("回收地图成功:~w", [_Pid], gods_duel_match, 925),
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:error("未知消息 ~w", [_Info], gods_duel_match, 929),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = TimeOut}) ->
    {next_state,
     StateName,
     State,
     util:time_left(TimeOut, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = TimeOut}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(TimeOut, Ts)}.

idel(timeout, State) -> continue(idel, State).

prepare(timeout,
        State = #state{season_status = SeasonStatus}) ->
    self() ! do_match,
    SeasonID = gods_duel_common:get_season_id(),
    TimeOut = case
                  gods_duel_common:get_state_get_time_config(SeasonID,
                                                             SeasonStatus)
                  of
                  {StartTime, EndTime} ->
                      (EndTime - StartTime) * 1000 - 11 * 60 * 1000;
                  _ ->
                      case gods_duel_common:get_match_index(SeasonStatus) of
                          {2, _} -> 2940000;
                          _ -> 1140000
                      end
              end,
    NewState = State#state{ts = now(), timeout = TimeOut,
                           team_join = [], round = 0},
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{update_match_status,
                     2,
                     SeasonStatus,
                     date:unixtime()}]),
    logger:debug("ppppppppppppppppppppppppppppppppppppppppppp",
                 [],
                 gods_duel_match,
                 978),
    big_world:cast(all, gods_duel_agent, notice, [150]),
    erlang:send_after(TimeOut - 15 * 60 * 1000,
                      self(),
                      push_17966),
    continue(match, NewState).

match(timeout,
      State = #state{season_status = SeasonStatus}) ->
    logger:debug("比赛结束:===============",
                 [],
                 gods_duel_match,
                 985),
    big_world:cast(all, gods_duel_agent, notice, [151]),
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{update_match_status, 0, SeasonStatus, 0}]),
    match_clear(),
    NewState = State#state{ts = now(), timeout = 60000},
    continue(over, NewState).

over(timeout,
     State = #state{season_status = SeasonStatus}) ->
    case SeasonStatus of
        9 -> gods_duel_mgr:info(statistics);
        25 -> gods_duel_mgr:info({team_rise_jubilation, 25});
        _ -> skip
    end,
    ets:delete_all_objects(gods_duel_match_info),
    case gods_duel_common:get_match_index(SeasonStatus) of
        {2, MatchRound} ->
            case gods_duel_common:is_vote_match(MatchRound) of
                true ->
                    big_world:cast(all,
                                   gods_duel_agent,
                                   info,
                                   [{match_end, MatchRound}]);
                false -> ok
            end;
        _ -> ok
    end,
    NewState = State#state{ts = now(), timeout = infinity,
                           team_join = [], round = 0},
    continue(idel, NewState).

update_match(Match) ->
    ets:insert(gods_duel_match_info, Match).

lookup_match(MatchId) ->
    case catch ets:lookup(gods_duel_match_info, MatchId) of
        [Match = #gods_duel_match{}] -> {ok, Match};
        _ -> false
    end.

update_match_profile(MatchProfile) ->
    ets:insert(gods_duel_match_profile, MatchProfile),
    dets:insert(gods_duel_match_profile, MatchProfile),
    ok.

lookup_match_profile(CombatRecordId) ->
    case catch ets:lookup(gods_duel_match_profile,
                          CombatRecordId)
        of
        [MatchProfile = #gods_duel_match_profile{}] ->
            {ok, MatchProfile};
        _ -> false
    end.

produce_match_info(SeasonStatus) ->
    case gods_duel_common:get_match_index(SeasonStatus) of
        {1, _} ->
            MatchFun = fun ({MatchId, ZoneId}) ->
                               TargetMatchId =
                                   gods_duel_team:get_target_rank(SeasonStatus,
                                                                  MatchId),
                               CurrentMatchId = min(MatchId, TargetMatchId),
                               case lookup_match({CurrentMatchId, ZoneId}) of
                                   {ok, _} -> ok;
                                   _ ->
                                       logger:debug("生成比赛信息{CurrentMatchId, ZoneId}:~w",
                                                    [{CurrentMatchId, ZoneId}],
                                                    gods_duel_match,
                                                    1076),
                                       Match = #gods_duel_match{id =
                                                                    {CurrentMatchId,
                                                                     ZoneId}},
                                       update_match(Match)
                               end
                       end,
            MatchZoneList = [{FetchMatchId, FetchZoneId}
                             || FetchMatchId <- lists:seq(1, 128),
                                FetchZoneId <- [1, 2, 3, 4, 5, 6]],
            lists:foreach(MatchFun, MatchZoneList);
        {2, MatchRound} ->
            MatchFun = fun ({ZoneId, {MatchId, _TeamRankList}}) ->
                               case lookup_match({MatchId, ZoneId}) of
                                   {ok, _} -> ok;
                                   _ ->
                                       logger:debug("生成比赛信息{MatchId, ZoneId}:~w",
                                                    [{MatchId, ZoneId}],
                                                    gods_duel_match,
                                                    1089),
                                       Match = #gods_duel_match{id =
                                                                    {MatchId,
                                                                     ZoneId}},
                                       update_match(Match)
                               end
                       end,
            MatchTableList =
                gods_duel_common:get_gods_duel_match_list(MatchRound),
            MatchList = [{ZoneId, MatchRankList}
                         || ZoneId <- [1, 2, 3, 4, 5, 6],
                            MatchRankList <- MatchTableList],
            lists:foreach(MatchFun, MatchList);
        _ -> ok
    end.

get_match_zone_id(SeasonStatus, GodsTeamId) ->
    case gods_duel_common:get_match_index(SeasonStatus) of
        {1, _} ->
            case catch ets:lookup(gods_duel_team_sign, GodsTeamId)
                of
                [#gods_duel_team{lev = ZoneId}] ->
                    case catch ets:lookup(gods_duel_group_team, ZoneId) of
                        [{_, GroupTeamList}] ->
                            case lists:keyfind(GodsTeamId,
                                               #gods_duel_team.id,
                                               GroupTeamList)
                                of
                                #gods_duel_team{team_group_256 = SelfRank} ->
                                    TargetRank =
                                        gods_duel_team:get_target_rank(SeasonStatus,
                                                                       SelfRank),
                                    {ok, min(TargetRank, SelfRank), ZoneId};
                                _ -> false
                            end;
                        _ -> false
                    end;
                _Err -> false
            end;
        {2, MatchRound} ->
            logger:debug("决赛查询队伍匹配信息:~w",
                         [GodsTeamId],
                         gods_duel_match,
                         1125),
            case catch ets:lookup(gods_duel_team_sign, GodsTeamId)
                of
                [#gods_duel_team{lev = ZoneId}] ->
                    MatchTableList =
                        gods_duel_common:get_gods_duel_match_list(MatchRound),
                    case ets:lookup(gods_duel_group_team, ZoneId) of
                        [{ZoneId, GroupTeamList}] ->
                            logger:debug("决赛查询队伍匹配信息:~w",
                                         [GodsTeamId],
                                         gods_duel_match,
                                         1131),
                            case lists:keyfind(GodsTeamId,
                                               #gods_duel_team.id,
                                               GroupTeamList)
                                of
                                #gods_duel_team{team_group_64 = SelfRank} ->
                                    case lists:filter(fun ({_,
                                                            MatchRankList}) ->
                                                              lists:member(SelfRank,
                                                                           MatchRankList)
                                                      end,
                                                      MatchTableList)
                                        of
                                        [{MatchId, _}] -> {ok, MatchId, ZoneId};
                                        _ -> false
                                    end;
                                _ -> false
                            end;
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

get_target_team_id(SeasonStatus, GodsTeamId) ->
    case gods_duel_common:get_match_index(SeasonStatus) of
        {1, _} ->
            case catch ets:lookup(gods_duel_team_sign, GodsTeamId)
                of
                [#gods_duel_team{lev = ZoneId}] ->
                    case catch ets:lookup(gods_duel_group_team, ZoneId) of
                        [{_, GroupTeamList}] ->
                            case lists:keyfind(GodsTeamId,
                                               #gods_duel_team.id,
                                               GroupTeamList)
                                of
                                #gods_duel_team{team_group_256 = SelfRank} ->
                                    TargetRank =
                                        gods_duel_team:get_target_rank(SeasonStatus,
                                                                       SelfRank),
                                    case lists:keyfind(TargetRank,
                                                       #gods_duel_team.team_group_256,
                                                       GroupTeamList)
                                        of
                                        #gods_duel_team{id = TargetTeamId} ->
                                            {true, TargetTeamId};
                                        _ -> false
                                    end;
                                _ -> false
                            end;
                        _ -> false
                    end;
                _ -> false
            end;
        {2, MatchRound} ->
            case catch ets:lookup(gods_duel_team_sign, GodsTeamId)
                of
                [#gods_duel_team{lev = ZoneId}] ->
                    case catch ets:lookup(gods_duel_group_team, ZoneId) of
                        [{_, GroupTeamList}] ->
                            MatchQua =
                                gods_duel_common:get_final_match_qua(MatchRound),
                            MatchTableList =
                                gods_duel_common:get_gods_duel_match_list(MatchRound),
                            case lists:keyfind(GodsTeamId,
                                               #gods_duel_team.id,
                                               GroupTeamList)
                                of
                                #gods_duel_team{team_group_64 = SelfRank} ->
                                    case lists:filter(fun ({_, TeamRankList}) ->
                                                              lists:member(SelfRank,
                                                                           TeamRankList)
                                                      end,
                                                      MatchTableList)
                                        of
                                        [{_, TeamRankList}] ->
                                            MatchTeams = lists:filter(fun
                                                                          (#gods_duel_team{qualification
                                                                                               =
                                                                                               Qua,
                                                                                           id
                                                                                               =
                                                                                               Id,
                                                                                           team_group_64
                                                                                               =
                                                                                               Rank}) ->
                                                                              case
                                                                                  MatchRound
                                                                                  of
                                                                                  6 ->
                                                                                      (Qua
                                                                                           =:=
                                                                                           8
                                                                                           orelse
                                                                                           Qua
                                                                                               =:=
                                                                                               9
                                                                                               orelse
                                                                                               Qua
                                                                                                   =:=
                                                                                                   10)
                                                                                          andalso
                                                                                          lists:member(Rank,
                                                                                                       TeamRankList)
                                                                                              andalso
                                                                                              Id
                                                                                                  =/=
                                                                                                  GodsTeamId;
                                                                                  7 ->
                                                                                      (Qua
                                                                                           =:=
                                                                                           11
                                                                                           orelse
                                                                                           Qua
                                                                                               =:=
                                                                                               12
                                                                                               orelse
                                                                                               Qua
                                                                                                   =:=
                                                                                                   13)
                                                                                          andalso
                                                                                          lists:member(Rank,
                                                                                                       TeamRankList)
                                                                                              andalso
                                                                                              Id
                                                                                                  =/=
                                                                                                  GodsTeamId;
                                                                                  _ ->
                                                                                      Qua
                                                                                          >=
                                                                                          MatchQua
                                                                                          andalso
                                                                                          lists:member(Rank,
                                                                                                       TeamRankList)
                                                                                              andalso
                                                                                              Id
                                                                                                  =/=
                                                                                                  GodsTeamId
                                                                              end
                                                                      end,
                                                                      GroupTeamList),
                                            case MatchTeams of
                                                [#gods_duel_team{id =
                                                                     TeamId1}] ->
                                                    {true, TeamId1};
                                                _ -> false
                                            end;
                                        _Err ->
                                            logger:error("查找队伍所在分组出错:~w",
                                                         [GodsTeamId, _Err],
                                                         gods_duel_match,
                                                         1212),
                                            false
                                    end
                            end;
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

get_target_team_id(SeasonStatus, GodsTeamId, MatchId,
                   ZoneId) ->
    case get_match_team_info(SeasonStatus, MatchId, ZoneId)
        of
        {true, GodsTeamId, TargetTeamId, _} -> TargetTeamId;
        {true, TargetTeamId, _, _} -> TargetTeamId;
        false -> false
    end.

get_match_team_info(SeasonStatus, MatchId, ZoneId) ->
    case gods_duel_common:get_match_index(SeasonStatus) of
        {1, _} ->
            case catch ets:lookup(gods_duel_group_team, ZoneId) of
                [{_, GroupTeamList}] ->
                    case lists:keyfind(MatchId,
                                       #gods_duel_team.team_group_256,
                                       GroupTeamList)
                        of
                        #gods_duel_team{id = TeamId1} ->
                            TargetRank =
                                gods_duel_team:get_target_rank(SeasonStatus,
                                                               MatchId),
                            case lists:keyfind(TargetRank,
                                               #gods_duel_team.team_group_256,
                                               GroupTeamList)
                                of
                                #gods_duel_team{id = TargetTeamId} ->
                                    {true, TeamId1, TargetTeamId, MatchId};
                                _ -> {true, TeamId1, team_null, MatchId}
                            end;
                        _ -> false
                    end;
                _ -> false
            end;
        {2, MatchRound} ->
            MatchQua =
                gods_duel_common:get_final_match_qua(MatchRound),
            MatchTableList =
                gods_duel_common:get_gods_duel_match_list(MatchRound),
            logger:debug("查看比赛信息:~w",
                         [{MatchRound, MatchQua}],
                         gods_duel_match,
                         1257),
            case ets:lookup(gods_duel_group_team, ZoneId) of
                [{_, GroupTeamList}] ->
                    logger:debug("查看比赛信息:~w",
                                 [{MatchRound, MatchQua}],
                                 gods_duel_match,
                                 1260),
                    case lists:keyfind(MatchId, 1, MatchTableList) of
                        {_, TeamRankList} ->
                            logger:debug("查看比赛信息:~w",
                                         [{MatchRound, TeamRankList}],
                                         gods_duel_match,
                                         1263),
                            MatchTeams = lists:filter(fun
                                                          (#gods_duel_team{qualification
                                                                               =
                                                                               Qua,
                                                                           team_group_64
                                                                               =
                                                                               SelfRank}) ->
                                                              case MatchRound of
                                                                  6 ->
                                                                      (Qua =:= 8
                                                                           orelse
                                                                           Qua
                                                                               =:=
                                                                               9
                                                                               orelse
                                                                               Qua
                                                                                   =:=
                                                                                   10)
                                                                          andalso
                                                                          lists:member(SelfRank,
                                                                                       TeamRankList);
                                                                  7 ->
                                                                      (Qua =:=
                                                                           11
                                                                           orelse
                                                                           Qua
                                                                               =:=
                                                                               12
                                                                               orelse
                                                                               Qua
                                                                                   =:=
                                                                                   13)
                                                                          andalso
                                                                          lists:member(SelfRank,
                                                                                       TeamRankList);
                                                                  _ ->
                                                                      Qua >=
                                                                          MatchQua
                                                                          andalso
                                                                          lists:member(SelfRank,
                                                                                       TeamRankList)
                                                              end
                                                      end,
                                                      GroupTeamList),
                            case MatchTeams of
                                [#gods_duel_team{id = TeamId1},
                                 #gods_duel_team{id = TeamId2}] ->
                                    logger:debug("查看比赛信息:~w",
                                                 [{MatchRound, MatchQua}],
                                                 gods_duel_match,
                                                 1285),
                                    {true, TeamId1, TeamId2, MatchId};
                                [#gods_duel_team{id = TeamId1}] ->
                                    {true, TeamId1, team_null, MatchId};
                                _ -> false
                            end;
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

get_fighters(team_null, _) -> [];
get_fighters(TeamId, TeamJoins) ->
    case lists:keyfind(TeamId,
                       #gods_duel_join_team.id,
                       TeamJoins)
        of
        #gods_duel_join_team{fighters = [Leader | _],
                             team_data =
                                 #gods_duel_team{lev = Group,
                                                 members = Members}} ->
            case Leader of
                {leader,
                 #fighter_wrap{fighter =
                                   #fighter{origin_id =
                                                LeaderId = {_,
                                                            LeaderPlat,
                                                            LeaderZoneId}}},
                 _} ->
                    case big_world:call(LeaderPlat,
                                        LeaderZoneId,
                                        gods_duel_role,
                                        get_fighters,
                                        [LeaderId])
                        of
                        {ok, Figters = [_ | Mates]} ->
                            case [true
                                  || #team_mate{id = MateId, lev = Lev,
                                                lev_break_times = BreakTimes}
                                         <- Mates,
                                     lists:keymember(MateId,
                                                     #gods_duel_team_mate.id,
                                                     Members)
                                         =:= false
                                         orelse
                                         Group <
                                             gods_duel_data:get_group_num(Lev,
                                                                          BreakTimes)]
                                of
                                [] -> Figters;
                                _ ->
                                    logger:debug("校验成员失败:~w, ~w",
                                                 [Mates, Figters],
                                                 gods_duel_match,
                                                 1313),
                                    []
                            end;
                        _Err ->
                            logger:error("诸神查询队伍信息失败:~w",
                                         [_Err],
                                         gods_duel_match,
                                         1317),
                            []
                    end;
                _Elese ->
                    logger:error("队长信息:~w",
                                 [_Elese],
                                 gods_duel_match,
                                 1321),
                    []
            end;
        _Err ->
            logger:debug("==========:~w",
                         [_Err],
                         gods_duel_match,
                         1325),
            []
    end.

start_combat(#gods_duel_match{combat_pid = Pid}, _)
    when is_pid(Pid) ->
    ok;
start_combat(#gods_duel_match{is_over = 1}, _) -> ok;
start_combat(#gods_duel_match{id = {MatchId, ZoneId},
                              teams = JoinTeams, roles = Roles},
             #state{season_status = SeasonStatus}) ->
    case get_match_team_info(SeasonStatus, MatchId, ZoneId)
        of
        {true, AtkTeamId, team_null, _} ->
            Args = #{win => idle, loss => idle,
                     win_team_id => AtkTeamId, loss_team_id => team_null,
                     match_id => {MatchId, ZoneId}},
            info({combat_over, Args}),
            ok;
        {true, AtkTeamId, DfdTeamId, _} ->
            AtkFighters = get_fighters(AtkTeamId, JoinTeams),
            DfdFighters = get_fighters(DfdTeamId, JoinTeams),
            logger:debug("==========：~w",
                         [{AtkFighters, DfdFighters}],
                         gods_duel_match,
                         1345),
            AtkFightNum = length(AtkFighters),
            DfdFightNum = length(DfdFighters),
            Fun = fun ({leader,
                        #fighter_wrap{fighter = #fighter{origin_id = Fid}},
                        _},
                       Rtn) ->
                          [Fid | Rtn];
                      (#team_mate{id = MateId}, Rtn) -> [MateId | Rtn];
                      (#fighter_wrap{fighter = #fighter{origin_id = Fid}},
                       Rtn) ->
                          [Fid | Rtn];
                      (_, Rtn) -> Rtn
                  end,
            case {AtkFightNum >= 3 + 1, DfdFightNum >= 3 + 1} of
                {false, false} ->
                    {WTid, LTid} = case true of
                                       _ when AtkFightNum > DfdFightNum ->
                                           {AtkTeamId, DfdTeamId};
                                       _ when AtkFightNum =:= DfdFightNum ->
                                           AtkTotalFC = case catch
                                                                 ets:lookup(gods_duel_team_sign,
                                                                            AtkTeamId)
                                                            of
                                                            [#gods_duel_team{fight_capacity
                                                                                 =
                                                                                 _AtkFC}] ->
                                                                _AtkFC;
                                                            _ -> 0
                                                        end,
                                           DfdTotalFC = case catch
                                                                 ets:lookup(gods_duel_team_sign,
                                                                            DfdTeamId)
                                                            of
                                                            [#gods_duel_team{fight_capacity
                                                                                 =
                                                                                 _DfdFC}] ->
                                                                _DfdFC;
                                                            _ -> 0
                                                        end,
                                           case AtkTotalFC >= DfdTotalFC of
                                               true -> {AtkTeamId, DfdTeamId};
                                               _ -> {DfdTeamId, AtkTeamId}
                                           end;
                                       _ -> {DfdTeamId, AtkTeamId}
                                   end,
                    AutoWinMsg = lang:get("由于您的对手本轮小组赛中弃权，您的战队自动获得胜利"),
                    AtkIds = lists:foldl(Fun, [], AtkFighters),
                    AutoLossMsg = lang:get("由于您的队伍人数不足，已自动弃权，比赛失败"),
                    DfdIds = lists:foldl(Fun, [], DfdFighters),
                    case {WTid, LTid} of
                        {AtkTeamId, DfdTeamId} ->
                            [notice:send({pid, RolePid}, 1, AutoWinMsg)
                             || {Rid, RolePid} <- Roles,
                                lists:member(Rid, AtkIds)],
                            [notice:send({pid, RolePid}, 1, AutoLossMsg)
                             || {Rid, RolePid} <- Roles,
                                lists:member(Rid, DfdIds)];
                        {DfdTeamId, AtkTeamId} ->
                            [notice:send({pid, RolePid}, 1, AutoLossMsg)
                             || {Rid, RolePid} <- Roles,
                                lists:member(Rid, AtkIds)],
                            [notice:send({pid, RolePid}, 1, AutoWinMsg)
                             || {Rid, RolePid} <- Roles,
                                lists:member(Rid, DfdIds)]
                    end,
                    Args = #{win => auto_win, loss => auto_loss,
                             win_team_id => WTid, loss_team_id => LTid,
                             match_id => {MatchId, ZoneId}},
                    info({combat_over, Args});
                {false, _} ->
                    AutoWinMsg = lang:get("由于您的对手本轮小组赛中弃权，您的战队自动获得胜利"),
                    AtkIds = lists:foldl(Fun, [], AtkFighters),
                    AutoLossMsg = lang:get("由于您的队伍人数不足，已自动弃权，比赛失败"),
                    DfdIds = lists:foldl(Fun, [], DfdFighters),
                    [notice:send({pid, RolePid}, 1, AutoLossMsg)
                     || {Rid, RolePid} <- Roles, lists:member(Rid, AtkIds)],
                    [notice:send({pid, RolePid}, 1, AutoWinMsg)
                     || {Rid, RolePid} <- Roles, lists:member(Rid, DfdIds)],
                    Args = #{win => auto_win, loss => auto_loss,
                             win_team_id => DfdTeamId,
                             loss_team_id => AtkTeamId,
                             match_id => {MatchId, ZoneId}},
                    info({combat_over, Args});
                {_, false} ->
                    AutoWinMsg = lang:get("由于您的对手本轮小组赛中弃权，您的战队自动获得胜利"),
                    AtkIds = lists:foldl(Fun, [], AtkFighters),
                    AutoLossMsg = lang:get("由于您的队伍人数不足，已自动弃权，比赛失败"),
                    DfdIds = lists:foldl(Fun, [], DfdFighters),
                    [notice:send({pid, RolePid}, 1, AutoWinMsg)
                     || {Rid, RolePid} <- Roles, lists:member(Rid, AtkIds)],
                    [notice:send({pid, RolePid}, 1, AutoLossMsg)
                     || {Rid, RolePid} <- Roles, lists:member(Rid, DfdIds)],
                    Args = #{win => auto_win, loss => auto_loss,
                             win_team_id => AtkTeamId,
                             loss_team_id => DfdTeamId,
                             match_id => {MatchId, ZoneId}},
                    info({combat_over, Args});
                _ ->
                    TimeOut = 5000,
                    CombatRecordId =
                        env:update_counter(gods_duel_combat_record_id, 1),
                    ExtArgs = [{match_id, {MatchId, ZoneId}},
                               {combat_record_id, CombatRecordId}],
                    StartArgs = #combat_start_args{ext_args = ExtArgs},
                    erlang:send_after(TimeOut,
                                      self(),
                                      {start_combat,
                                       AtkTeamId,
                                       DfdTeamId,
                                       AtkFighters,
                                       DfdFighters,
                                       StartArgs}),
                    SeasonID = gods_duel_common:get_season_id(),
                    TimeOut1 = case
                                   gods_duel_common:get_state_get_time_config(SeasonID,
                                                                              SeasonStatus)
                                   of
                                   {StartTime, EndTime} ->
                                       (EndTime - StartTime) * 1000 -
                                           11 * 60 * 1000;
                                   _ ->
                                       case
                                           gods_duel_common:get_match_index(SeasonStatus)
                                           of
                                           {2, _} -> 2940000;
                                           _ -> 1140000
                                       end
                               end,
                    erlang:send_after(TimeOut1 - 15 * 60 * 1000,
                                      self(),
                                      push_17966),
                    AtkIds = lists:foldl(Fun, [], AtkFighters),
                    AtkTeamData = case lists:keyfind(AtkTeamId,
                                                     #gods_duel_join_team.id,
                                                     JoinTeams)
                                      of
                                      #gods_duel_join_team{team_data =
                                                               _AtkTeamData =
                                                                   #gods_duel_team{members
                                                                                       =
                                                                                       AtkMembers}} ->
                                          AtkFilterMembers = lists:filter(fun
                                                                              (#gods_duel_team_mate{id
                                                                                                        =
                                                                                                        Id}) ->
                                                                                  lists:member(Id,
                                                                                               AtkIds)
                                                                          end,
                                                                          AtkMembers),
                                          _AtkTeamData#gods_duel_team{members =
                                                                          AtkFilterMembers};
                                      _ -> #gods_duel_team{}
                                  end,
                    DfdIds = lists:foldl(Fun, [], DfdFighters),
                    DfdTeamData = case lists:keyfind(DfdTeamId,
                                                     #gods_duel_join_team.id,
                                                     JoinTeams)
                                      of
                                      #gods_duel_join_team{team_data =
                                                               _DfdTeamData =
                                                                   #gods_duel_team{members
                                                                                       =
                                                                                       DfdMembers}} ->
                                          DfdFilterMembers = lists:filter(fun
                                                                              (#gods_duel_team_mate{id
                                                                                                        =
                                                                                                        Id}) ->
                                                                                  lists:member(Id,
                                                                                               DfdIds)
                                                                          end,
                                                                          DfdMembers),
                                          _DfdTeamData#gods_duel_team{members =
                                                                          DfdFilterMembers};
                                      _ -> #gods_duel_team{}
                                  end,
                    ReplyData = [AtkTeamData, DfdTeamData],
                    logger:debug("===============：~w",
                                 [AtkIds],
                                 gods_duel_match,
                                 1451),
                    logger:debug("===============：~w",
                                 [DfdIds],
                                 gods_duel_match,
                                 1452),
                    logger:debug("战斗广播数据:~w",
                                 [ReplyData],
                                 gods_duel_match,
                                 1453),
                    [role:pack_send(RolePid, 17924, {ReplyData})
                     || {Rid, RolePid} <- Roles, lists:member(Rid, AtkIds)],
                    [role:pack_send(RolePid, 17924, {ReplyData})
                     || {Rid, RolePid} <- Roles, lists:member(Rid, DfdIds)]
            end;
        _ -> ok
    end.

update_team_ready_status(TeamId1, Flag1, team_null,
                         #gods_duel_match{teams = JoinTeams, map_id = MapId,
                                          map_pid = MapPid})
    when is_pid(MapPid) ->
    TeamName1 = case lists:keyfind(TeamId1,
                                   #gods_duel_join_team.id,
                                   JoinTeams)
                    of
                    #gods_duel_join_team{team_data =
                                             #gods_duel_team{name =
                                                                 _TeamName1}} ->
                        _TeamName1;
                    _ -> lang:get("")
                end,
    map:pack_send_to_all(MapId,
                         17922,
                         {TeamId1, TeamName1, Flag1, {0, "", 0}, [], 0});
update_team_ready_status(TeamId1, Flag1, TeamId2,
                         #gods_duel_match{teams = JoinTeams, map_id = MapId,
                                          map_pid = MapPid})
    when is_pid(MapPid) ->
    TeamName1 = case lists:keyfind(TeamId1,
                                   #gods_duel_join_team.id,
                                   JoinTeams)
                    of
                    #gods_duel_join_team{team_data =
                                             #gods_duel_team{name =
                                                                 _TeamName1}} ->
                        _TeamName1;
                    _ -> lang:get("")
                end,
    {TeamName2, Flag2} = case lists:keyfind(TeamId2,
                                            #gods_duel_join_team.id,
                                            JoinTeams)
                             of
                             #gods_duel_join_team{team_data =
                                                      #gods_duel_team{name =
                                                                          _TeamName2},
                                                  is_ready = Ready} ->
                                 {_TeamName2, Ready};
                             _ -> {lang:get(""), 0}
                         end,
    map:pack_send_to_all(MapId,
                         17922,
                         {TeamId1,
                          TeamName1,
                          Flag1,
                          TeamId2,
                          TeamName2,
                          Flag2});
update_team_ready_status(_, _, _, _) -> ok.

cast_record(CastM1 = #{combat_type := CombatType,
                       winner := Winner, loser := Loser,
                       record := Record = #combat_record{round = Round},
                       match_id := MatchId}) ->
    Ids = [Id
           || #fighter{origin_id = Id} <- Winner ++ Loser],
    CastM = CastM1#{record => Record, is_marvel => true,
                    combat_type => CombatType, match_id => MatchId},
    logger:debug("广播录像数据:~w",
                 [{CastM, Ids}],
                 gods_duel_match,
                 1487),
    case Ids of
        [{_, Platform, ZoneId} | _] ->
            case ets:lookup(gods_duel_match_profile, MatchId) of
                [MatchProfile = #gods_duel_match_profile{}] ->
                    MatchProfile1 = add_match_profile_info(MatchProfile,
                                                           Winner,
                                                           Loser,
                                                           Round),
                    NewMatchProfile =
                        MatchProfile1#gods_duel_match_profile{platform =
                                                                  Platform,
                                                              zone_id = ZoneId},
                    update_match_profile(NewMatchProfile),
                    big_world:cast(all,
                                   gods_duel_agent,
                                   info,
                                   [{update_match_profile, MatchProfile1}]),
                    ok;
                _ -> ok
            end,
            big_world:cast(all,
                           combat_record,
                           save,
                           [CastM#{ids => Ids, cross => true,
                                   pz => {Platform, ZoneId}}]);
        _ -> ok
    end.

add_match_profile_info(P = #gods_duel_match_profile{},
                       Winner, Loser, Round) ->
    FcCalc = fun (#fighter{attr = #attr{fc = Rfc},
                           active_pet = APet = #c_pet{}, backup_pets = Pets}) ->
                     BkFc = case util:keys_sort([#c_pet.talent],
                                                [APet | Pets])
                                of
                                PetList = [_ | _] -> do_calc_fc(PetList, 3, 0);
                                _ -> 0
                            end,
                     Rfc + BkFc;
                 (#fighter{attr = #attr{fc = Rfc},
                           backup_pets = Pets}) ->
                     BkFc = case util:keys_sort([#c_pet.talent], Pets) of
                                PetList = [_ | _] -> do_calc_fc(PetList, 3, 0);
                                _ -> 0
                            end,
                     Rfc + BkFc;
                 (_) -> 0
             end,
    WSumFc = lists:sum([FcCalc(F1)
                        || F1 = #fighter{type = 1} <- Winner]),
    LSumFc = lists:sum([FcCalc(F2)
                        || F2 = #fighter{type = 1} <- Loser]),
    logger:debug("战斗力 winner ~w, loser ~w",
                 [WSumFc, LSumFc],
                 gods_duel_match,
                 1524),
    DiffNum = case LSumFc - WSumFc of
                  Num when Num > 0 -> Num;
                  _ -> 0
              end,
    P#gods_duel_match_profile{fc_diff = DiffNum,
                              round = Round}.

is_team_member(_MatchZone, _TeamId, []) -> false;
is_team_member(MatchZoneId, TeamId, Ids) ->
    case lookup_match(MatchZoneId) of
        {ok, #gods_duel_match{teams = JoinTeams}} ->
            case lists:keyfind(TeamId,
                               #gods_duel_join_team.id,
                               JoinTeams)
                of
                #gods_duel_join_team{team_data =
                                         #gods_duel_team{members = Members}} ->
                    is_member(Members, Ids);
                _ -> false
            end;
        _ -> false
    end.

is_member(_Members, []) -> true;
is_member(Members, [Id | Rest]) ->
    case lists:keymember(Id,
                         #gods_duel_team_mate.id,
                         Members)
        of
        true -> is_member(Members, Rest);
        false -> false
    end.

match_clear() ->
    ets:foldl(fun (#gods_duel_match{combat_pid = Pid,
                                    roles = RoleIds, map_pid = MapPid},
                   _) ->
                      case is_pid(Pid) of
                          true -> Pid ! stop_result;
                          false -> ok
                      end,
                      [big_world:cast(all,
                                      gods_duel_role,
                                      apply_team_mate_leave,
                                      [RolePid])
                       || {_RoleId, RolePid} <- RoleIds],
                      case is_pid(MapPid) of
                          true -> map:stop(MapPid);
                          false -> ok
                      end
              end,
              true,
              gods_duel_match_info),
    ok.

do_calc_fc([], _, Fc) -> Fc;
do_calc_fc(_, Num, Fc) when Num =< 0 -> Fc;
do_calc_fc([#c_pet{talent = Talent} | T], Num, Fc) ->
    do_calc_fc(T, Num - 1, Talent + Fc);
do_calc_fc([_ | T], Num, Fc) ->
    do_calc_fc(T, Num - 1, Fc).

test() ->
    TestData = [#gods_duel_match_profile{id = 5, ver = 1,
                                         season_id = 4, match_type = 2,
                                         match_round = 7, match_id = 1,
                                         group_id = 1, combat_type = 111,
                                         atk_name = "tm889", dfd_name = "tm989",
                                         combat_pid = undefined, is_over = 1,
                                         platform = "dev", zone_id = 1,
                                         time = 1491449782, fc_diff = 0,
                                         round = 10},
                #gods_duel_match_profile{id = 2, ver = 1, season_id = 4,
                                         match_type = 2, match_round = 3,
                                         match_id = 4, group_id = 1,
                                         combat_type = 111, atk_name = "tm474",
                                         dfd_name = "tm479",
                                         combat_pid = undefined, is_over = 1,
                                         platform = "dev", zone_id = 1,
                                         time = 1495182442, fc_diff = 10,
                                         round = 6},
                #gods_duel_match_profile{id = 3, ver = 1, season_id = 4,
                                         match_type = 2, match_round = 7,
                                         match_id = 1, group_id = 1,
                                         combat_type = 111, atk_name = "tm939",
                                         dfd_name = "tm599",
                                         combat_pid = undefined, is_over = 1,
                                         platform = "dev", zone_id = 1,
                                         time = 1495186269, fc_diff = 30,
                                         round = 11},
                #gods_duel_match_profile{id = 4, ver = 1, season_id = 4,
                                         match_type = 2, match_round = 5,
                                         match_id = 1, group_id = 1,
                                         combat_type = 111, atk_name = "tm349",
                                         dfd_name = "tm889",
                                         combat_pid = undefined, is_over = 1,
                                         platform = "dev", zone_id = 1,
                                         time = 1491449432, fc_diff = 3,
                                         round = 9}],
    lists:map(fun (P) -> update_match_profile(P) end,
              TestData),
    lists:map(fun (P) ->
                      big_world:cast(all,
                                     gods_duel_agent,
                                     info,
                                     [{update_match_profile, P}])
              end,
              TestData).

check_combat_status(RoleId = {_, Platform, ZoneId}) ->
    case big_world:call(Platform,
                        ZoneId,
                        role_query,
                        attr,
                        [by_id, RoleId, [#role.m_combat]])
        of
        {ok, [#m_combat{pid = Pid}]} when is_pid(Pid) -> true;
        _ -> false
    end.

