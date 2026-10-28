-file("src/mod/elf/elf.erl", 1).

-module(elf).

-behaviour(gen_fsm).

-export([start_link/1,
         cast/2,
         call/2,
         last_enter_field/2,
         get_team_mem/1,
         push_role/2,
         unit_data_score_add/2,
         honor_rank/3,
         to_rank_rc/3]).

-export([fight/2, reward/2, over/2]).

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

-file("src/mod/elf/elf.erl", 33).

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

-file("src/mod/elf/elf.erl", 34).

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

-file("src/mod/elf/elf.erl", 35).

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

-file("src/mod/elf/elf.erl", 36).

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

-file("src/mod/elf/elf.erl", 37).

-file("inc/looks.hrl", 1).

-file("src/mod/elf/elf.erl", 38).

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

-file("src/mod/elf/elf.erl", 39).

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

-file("src/mod/elf/elf.erl", 40).

-file("inc/elf.hrl", 1).

-record(elf_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         win = 0,
         win_streak = 0,
         times = 0,
         die = 0,
         score = 0,
         is_combat = 0,
         last_combat_over_time = 0,
         combat_protect_time = 0,
         last_role_id,
         zone_id = 0,
         zone_pid,
         has_enter = 0,
         has_mail = 0,
         group = 0,
         seq_id = 0,
         fc = 0,
         m_time = 0,
         pos,
         rank = 0,
         grade_flag = 0,
         grade_first_flag = 0,
         unit_list = [],
         match = 0,
         exp = 0,
         group_key = 0,
         open_id = 0}).

-record(elf_role_map,
        {id = 0, map_id = 0, map_base_id = 0, num = 0}).

-record(elf_ready_zone,
        {map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         group_key = {0, 0},
         open_id = 0,
         group_id = 0 :: pos_integer(),
         members = [],
         num = 0}).

-record(elf_group_data,
        {min = 0, max = 0, group = 0, order = 0, name = ""}).

-record(elf_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         group = 0,
         group_key = {0, 0},
         open_id = 0,
         flag = 0}).

-record(elf_map,
        {id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         map_id = 0,
         map_base_id = 0,
         num = 0,
         max_num = 0}).

-record(elf_map_data,
        {id = 0 :: non_neg_integer(),
         map_base_id = 0,
         num = 0,
         unit_list = [],
         boss_list = [],
         super_list = [],
         box_list = [],
         next_score = 0,
         win_score = 0,
         fail_score = 0,
         end_score = 0,
         next_base_id = 0,
         buff_id = 0,
         grade_buff_id = 0,
         grade_msg = "",
         grade_cast_msg = "",
         grade_score = 0,
         grade_dec_score = 0,
         grade_dec_msg = "",
         fail_buff_id = 0,
         fail_msg = "",
         pos_list = [],
         msg = "",
         del_buff = [],
         max_score = 0,
         max_guard = 4}).

-record(elf_unit,
        {id = {0, 0} :: non_neg_integer(), base_id = 0, pos}).

-record(elf_unit_data,
        {id = 0,
         is_del = 1,
         pos = [],
         score = 0,
         kill_num = 0,
         create_msg = "",
         item_list = [],
         buff_id = 0,
         msg = "",
         cast_msg = ""}).

-record(elf_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         item_list = [],
         exp_mode = 0}).

-record(elf_first_data,
        {group = 0,
         map_base_id,
         min = 0,
         max = 0,
         item_list = [],
         cast = "",
         title = "",
         comment = ""}).

-record(elf_win_data,
        {group = 0,
         min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp = 0,
         pet_exp = 0}).

-file("src/mod/elf/elf.erl", 41).

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

-file("src/mod/elf/elf.erl", 42).

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

-file("src/mod/elf/elf.erl", 43).

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

-file("src/mod/elf/elf.erl", 44).

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

-file("src/mod/elf/elf.erl", 45).

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

-file("src/mod/elf/elf.erl", 46).

-record(state,
        {ts,
         timeout,
         map_list = [],
         uid = 0,
         zone_id = 0,
         group = 0,
         open_id = 0,
         group_key = {0, 0},
         unit_list = [],
         m_time = 0,
         rank_list = [],
         ids = [],
         combat_pid = [],
         cross_type = 0}).

start_link(Args) -> gen_fsm:start_link(elf, [Args], []).

cast(Pid, Event) ->
    gen_fsm:send_all_state_event(Pid, Event).

call(Pid, Event) ->
    try gen_fsm:sync_send_all_state_event(Pid, Event) catch
        _Type:_Reason ->
            logger:debug("Type: ~w  Reason: ~w",
                         [_Type, _Reason],
                         elf,
                         81),
            {error, timeout}
    end.

last_enter_field(Pid, Warrior) when is_pid(Pid) ->
    cast(Pid, {sign, Warrior});
last_enter_field(_Pid, _Warrior) -> ok.

init([#{group := Group, id := ZoneId, open_id := OpenId,
        cross_type := CrossType}]) ->
    UId = ZoneId * 10000,
    process_flag(trap_exit, true),
    Maps = elf_data:maps(),
    case create_map(Maps, UId, [], []) of
        {MapList, UnitList, NewUId} ->
            Now = date:unixtime(),
            Timeout = 45 * 60,
            State = #state{m_time = Now + 45 * 60, group = Group,
                           open_id = OpenId, group_key = {OpenId, Group},
                           cross_type = CrossType, zone_id = ZoneId,
                           ts = date:now2(), timeout = Timeout * 1000,
                           map_list = MapList, unit_list = UnitList,
                           uid = NewUId},
            erlang:send_after(util:rand(1 * 1000, 3 * 1000),
                              self(),
                              pick_unit),
            erlang:send_after(util:rand(3000, 6000),
                              self(),
                              start_match),
            erlang:send_after(60 * 1000, self(), {prepare_exp, 1}),
            {ok, fight, State};
        _False ->
            logger:error("创建战场地图失败[Fid:~w][group:~w][Err:~w]",
                         [ZoneId, Group, _False],
                         elf,
                         112),
            {stop, normal, #state{}}
    end.

handle_event({chat, Msg}, StateName,
             State = #state{map_list = MapList}) ->
    [map:pack_send_to_all(MapId, 10400, Msg)
     || #elf_map{map_id = MapId} <- MapList],
    continue(StateName, State);
handle_event({enter, Pid}, StateName,
             State = #state{group = Group, map_list = MapList,
                            cross_type = CrossType}) ->
    case lists:keyfind(1, #elf_map.id, MapList) of
        #elf_map{map_id = MapId, map_base_id = MapBaseId} ->
            Platform = env:get(platform),
            ZoneId = env:get(zone_id),
            role:apply(async,
                       Pid,
                       {elf_role,
                        apply_enter_zone,
                        [#{map_id => MapId, platform => Platform,
                           zone_id => ZoneId, zone_pid => self(),
                           group => Group, cross_type => CrossType,
                           cfg => elf_data:get_map(MapBaseId)}]});
        _ -> logger:error("没有找到一层地图:~w", [Pid], elf, 128)
    end,
    continue(StateName, State);
handle_event({next_map, RoleId}, StateName = fight,
             State) ->
    case elf_mgr:lookup(RoleId) of
        R = #elf_role{name = Name,
                      pos = Pos = #pos{map_base_id = MapBaseId}} ->
            MapCfg = case elf_data:get_map(MapBaseId) of
                         MapData = #elf_map_data{} -> MapData;
                         _ ->
                             logger:error("地图没有配置~ts, ~w",
                                          [Name, Pos],
                                          elf,
                                          140),
                             #elf_map_data{}
                     end,
            check_score_statue(R, MapCfg, State, role);
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({grade_succ, #{id := RoleId}}, StateName,
             State = #state{map_list = MapList}) ->
    case elf_mgr:lookup(RoleId) of
        HeroRole = #elf_role{name = Name, group = _OldGroup,
                             grade_first_flag = GradeFirstFlag, pos = Pos,
                             grade_flag = OldGradeFlag} ->
            logger:debug("进阶成功~ts", [Name], elf, 153),
            NewR = HeroRole#elf_role{grade_flag = 1,
                                     grade_first_flag = GradeFirstFlag + 1},
            MapBaseId = case Pos of
                            #pos{map_base_id = TMapBaseId} -> TMapBaseId;
                            _ -> 0
                        end,
            case elf_data:get_map(MapBaseId) of
                #elf_map_data{grade_cast_msg = ""} -> ignore;
                #elf_map_data{grade_cast_msg = GradeCastMsg}
                    when OldGradeFlag == 0 ->
                    NewCastMsg = notice:replace_msg([{"#role#",
                                                      [{role_2, Name}]}],
                                                    GradeCastMsg),
                    logger:debug("广播：~ts", [NewCastMsg], elf, 164),
                    [notice:cast({map, MapId}, 4, NewCastMsg)
                     || #elf_map{map_id = MapId} <- MapList];
                _ -> ignore
            end,
            elf_mgr:update_data(NewR);
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({down_grade_succ, #{id := RoleId}},
             StateName, State = #state{map_list = MapList}) ->
    case elf_mgr:lookup(RoleId) of
        HeroRole = #elf_role{name = Name, group = _OldGroup,
                             grade_first_flag = _GradeFirstFlag} ->
            logger:debug("进阶成功~ts", [Name], elf, 178),
            NewR = HeroRole#elf_role{grade_flag = 0},
            NewCastMsg =
                notice:format(lang:get("~ts被人击败，遭到幻境意志的嫌弃，又变回了~ts"),
                              [{role_2, Name},
                               {string_2, 4, lang:get("幻影剑客")}]),
            logger:debug("广播：~ts", [NewCastMsg], elf, 181),
            [notice:cast({map, MapId}, 4, NewCastMsg)
             || #elf_map{map_id = MapId} <- MapList],
            elf_mgr:update_data(NewR);
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({enter_zone, RoleId, Pos}, StateName,
             State = #state{zone_id = ZoneId, ids = Ids,
                            group = Group}) ->
    case lists:member(RoleId, Ids) of
        false ->
            NewState = case elf_mgr:lookup(RoleId) of
                           HeroRole = #elf_role{name = _Name,
                                                group = _OldGroup} ->
                               logger:debug("进入正式区成功~ts,  group:~w,~w",
                                            [_Name, _OldGroup, Group],
                                            elf,
                                            195),
                               NewR = HeroRole#elf_role{zone_id = ZoneId,
                                                        zone_pid = self(),
                                                        group = Group,
                                                        pos = Pos,
                                                        match =
                                                            util:rand(0, 4)},
                               NState = update_map_list(NewR, State, add),
                               push_role(NewR, State),
                               elf_mgr:update_data(NewR),
                               NState;
                           _ -> State
                       end,
            push_zone(NewState),
            continue(StateName,
                     NewState#state{ids = [RoleId | Ids]});
        _ -> continue(StateName, State)
    end;
handle_event({update_pos,
              #{id := RoleId, pid := Pid, pos := Pos,
                old_pos := OldPos}},
             StateName,
             State = #state{zone_id = ZoneId, ids = Ids,
                            group = Group}) ->
    NewState = case elf_mgr:lookup(RoleId) of
                   HeroRole = #elf_role{name = _Name, group = _OldGroup} ->
                       logger:debug("进入下一层成功~ts,  group:~w,~w",
                                    [_Name, _OldGroup, Group],
                                    elf,
                                    214),
                       NewR = HeroRole#elf_role{zone_id = ZoneId,
                                                zone_pid = self(), pid = Pid,
                                                group = Group, pos = Pos,
                                                grade_flag = 0,
                                                grade_first_flag = 0},
                       NState = update_map_list(NewR, State, add),
                       NState2 = update_map_list(NewR#elf_role{pos = OldPos},
                                                 NState,
                                                 del),
                       NState3 = update_rank(NewR, NState2),
                       push_role(NewR, NState3),
                       elf_mgr:update_data(NewR),
                       NState3;
                   _ -> State
               end,
    push_zone(NewState),
    continue(StateName, NewState#state{ids = Ids});
handle_event({push_role, #{pid := Pid, id := RoleId}},
             StateName, State) ->
    case elf_mgr:lookup(RoleId) of
        R = #elf_role{} ->
            push_role(R#elf_role{pid = Pid}, State);
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({push_zone, #{pid := Pid}}, StateName,
             State) ->
    push_zone(Pid, State),
    continue(StateName, State);
handle_event({push_rank, #{pid := Pid}}, StateName,
             State = #state{rank_list = RankList}) ->
    role:pack_send(Pid,
                   16505,
                   {lists:sublist(RankList, 100)}),
    continue(StateName, State);
handle_event({pick_unit,
              #{id := RoleId, uid := UId, base_id := BaseId,
                cfg := #elf_unit_data{is_del = IsDel, score = TScore}}},
             StateName = fight,
             State = #state{unit_list = UnitList}) ->
    NewState = case elf_mgr:lookup(RoleId) of
                   R = #elf_role{name = Name, pid = Pid,
                                 unit_list = RUnitList, grade_flag = GradeFlag,
                                 score = RScore,
                                 pos = Pos = #pos{map_base_id = MapBaseId}} ->
                       Now = date:unixtime(),
                       put({pick_unit, RoleId}, Now),
                       NewRUnitList = case lists:keyfind(BaseId, 1, RUnitList)
                                          of
                                          {_, Num} ->
                                              [{BaseId, Num + 1}
                                               | lists:keydelete(BaseId,
                                                                 1,
                                                                 RUnitList)];
                                          _ -> [{BaseId, 1} | RUnitList]
                                      end,
                       MapCfg = #elf_map_data{next_score = NextScore,
                                              grade_score = GradeScore} =
                                    case elf_data:get_map(MapBaseId) of
                                        MapData = #elf_map_data{} -> MapData;
                                        _ ->
                                            logger:error("地图没有配置~ts, ~w",
                                                         [Name, Pos],
                                                         elf,
                                                         264),
                                            #elf_map_data{}
                                    end,
                       MaxScore = lists:max(elf_data:max_score()),
                       TTScore = case GradeFlag of
                                     1 when RScore >= MaxScore -> 0;
                                     _ -> TScore
                                 end,
                       DecScore = NextScore - RScore,
                       Max = case GradeScore of
                                 0 -> max(DecScore, 0);
                                 _ when GradeScore > RScore ->
                                     DecScore2 = GradeScore - RScore,
                                     max(min(DecScore, DecScore2), 0);
                                 _ -> 9999
                             end,
                       Score = util:check_range(TTScore, 0, Max),
                       NewScore = min(RScore + Score, MaxScore),
                       case RScore == NewScore of
                           true when TScore > 0 ->
                               notice:send({pid, Pid},
                                           3,
                                           lang:get("分数已满，不能再加分数"));
                           _ -> ignore
                       end,
                       NR = R#elf_role{unit_list = NewRUnitList,
                                       score = NewScore},
                       elf_mgr:update_data(NR),
                       check_score_statue(NR, MapCfg, State, timer),
                       NState = update_rank(NR, State),
                       push_role(NR, NState),
                       NState;
                   _ -> State
               end,
    NewUnitList = case IsDel of
                      1 -> lists:keydelete(UId, #elf_unit.id, UnitList);
                      _ -> UnitList
                  end,
    continue(StateName,
             NewState#state{unit_list = NewUnitList});
handle_event({sign,
              R = #elf_role{id = RoleId, pid = Pid}},
             StateName = fight,
             State = #state{group = Group, map_list = MapList,
                            cross_type = CrossType}) ->
    case elf_mgr:lookup(RoleId) of
        #elf_role{} ->
            notice:npc_talk({pid, Pid},
                            62313,
                            lang:get("你已经自己退出，不能再参加了"));
        _ ->
            case lists:keyfind(1, #elf_map.id, MapList) of
                #elf_map{map_id = MapId} ->
                    Platform = env:get(platform),
                    ZoneId = env:get(zone_id),
                    role:apply(async,
                               Pid,
                               {elf_role,
                                apply_enter_ready,
                                [#{map_id => MapId, group => Group,
                                   platform => Platform, zone_id => ZoneId,
                                   cross_type => CrossType, zone_pid => self(),
                                   elf_role => R, state_name => StateName}]});
                _ ->
                    notice:npc_talk({pid, Pid},
                                    62313,
                                    lang:get("你已经自己退出，不能再参加了"))
            end
    end,
    continue(StateName, State);
handle_event({sign_succ,
              R = #elf_role{id = RoleId, name = _Name}},
             StateName,
             State = #state{ids = Ids, group = Group,
                            group_key = GroupKey}) ->
    case lists:member(RoleId, Ids) of
        true -> continue(StateName, State);
        _ ->
            NR = R#elf_role{group = Group, group_key = GroupKey},
            NState = update_map_list(NR, State, add),
            NewState = NState#state{ids = [RoleId | Ids]},
            push_zone(NewState),
            Now = date:unixtime(),
            elf_mgr:update_data(NR#elf_role{m_time = Now}),
            continue(StateName, NewState)
    end;
handle_event({leave, #{id := RoleId, pid := Pid}},
             StateName, State) ->
    case elf_mgr:lookup(RoleId) of
        #elf_role{} ->
            role:apply(async,
                       Pid,
                       {elf_role, apply_leave_zone, [self()]});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({leave_succ, RoleId}, StateName,
             State = #state{}) ->
    NewState = case elf_mgr:lookup(RoleId) of
                   ElfRole = #elf_role{} ->
                       elf_mgr:update_data(ElfRole#elf_role{status = 2}),
                       State;
                   _ -> State
               end,
    push_zone(NewState),
    continue(StateName, NewState);
handle_event({combat_fail, CombatPid, LoseMate},
             StateName,
             State = #state{combat_pid = CombatPidList}) ->
    Now = date:unixtime(),
    RandTime = util:rand(0, 1),
    LoseNum = length(LoseMate),
    State1 = deal_combat_result(fail,
                                LoseMate,
                                [],
                                RandTime,
                                Now,
                                LoseNum,
                                0,
                                State),
    NewCombatPidList = lists:delete(CombatPid,
                                    CombatPidList),
    NewState = State1#state{combat_pid = NewCombatPidList},
    push_zone(NewState),
    continue(StateName, NewState);
handle_event({combat_over,
              CombatPid,
              WinMate,
              LoseMate},
             StateName = fight,
             State = #state{combat_pid = CombatPidList}) ->
    Now = date:unixtime(),
    RandTime1 = util:rand(0, 1),
    RandTime2 = util:rand(0, 1),
    WinNum = length(WinMate),
    LoseNum = length(LoseMate),
    State1 = deal_combat_result(win,
                                WinMate,
                                LoseMate,
                                RandTime1,
                                Now,
                                WinNum,
                                LoseNum,
                                State),
    State2 = deal_combat_result(lose,
                                LoseMate,
                                WinMate,
                                RandTime2,
                                Now,
                                LoseNum,
                                WinNum,
                                State1),
    NewCombatPidList = lists:delete(CombatPid,
                                    CombatPidList),
    NewState = State2#state{combat_pid = NewCombatPidList},
    push_zone(NewState),
    continue(StateName, NewState);
handle_event(end_fight, fight, State) ->
    fight(timeout, State);
handle_event(end_fight, StateName, State) ->
    continue(StateName, State);
handle_event(end_reward, reward, State) ->
    reward(timeout, State);
handle_event(end_reward, StateName, State) ->
    continue(StateName, State);
handle_event(stop, over, State) -> over(timeout, State);
handle_event(stop, StateName, State) ->
    continue(StateName, State);
handle_event({combat_over,
              CombatPid,
              WinMate,
              LoseMate},
             StateName,
             State = #state{combat_pid = CombatPidList}) ->
    Now = date:unixtime(),
    RandTime1 = util:rand(0, 1),
    RandTime2 = util:rand(0, 1),
    WinNum = length(WinMate),
    LoseNum = length(LoseMate),
    State1 = deal_combat_result(fail,
                                WinMate,
                                LoseMate,
                                RandTime1,
                                Now,
                                WinNum,
                                LoseNum,
                                State),
    State2 = deal_combat_result(fail,
                                LoseMate,
                                WinMate,
                                RandTime2,
                                Now,
                                LoseNum,
                                WinNum,
                                State1),
    NewCombatPidList = lists:delete(CombatPid,
                                    CombatPidList),
    NewState = State2#state{combat_pid = NewCombatPidList},
    push_zone(NewState),
    continue(StateName, NewState);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event({check_pick,
                   #{id := RoleId, base_id := BaseId,
                     cfg := #elf_unit_data{kill_num = KillNum}}},
                  _From, StateName = fight, State) ->
    Reply = case elf_mgr:lookup(RoleId) of
                #elf_role{unit_list = UnitList} ->
                    Now = date:unixtime(),
                    T = 10,
                    Time = case get({pick_unit, RoleId}) of
                               TTime when is_integer(TTime) -> TTime;
                               _ -> 0
                           end,
                    case lists:keyfind(BaseId, 1, UnitList) of
                        {_, _Num} when Time + T > Now ->
                            {false,
                             notice:format(lang:get("您刚进行了一次采集，需要休息~ts秒"),
                                           [{string_2, 5, T - (Now - Time)}])};
                        {_, Num} when Num >= KillNum andalso KillNum > 0 ->
                            {false,
                             notice:format(lang:get("每人最多只能采集~ts次"),
                                           [{string_2, 5, KillNum}])};
                        _ -> {ok}
                    end;
                _ -> {false, lang:get("没有找到玩家信息")}
            end,
    continue(StateName, Reply, State);
handle_sync_event({check_pick, _}, _From, StateName,
                  State) ->
    Reply = {false, lang:get("战斗阶段结束，不能采集")},
    continue(StateName, Reply, State);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info(rand_unit, StateName = fight,
            State = #state{unit_list = UnitList, uid = UId,
                           map_list = MapList}) ->
    erlang:send_after(util:rand(60000, 120000),
                      self(),
                      rand_unit),
    {AddUbitList, NUId} = check_unit(MapList,
                                     State,
                                     UId,
                                     rand_unit,
                                     []),
    continue(StateName,
             State#state{unit_list = UnitList ++ AddUbitList,
                         uid = NUId});
handle_info(boss_unit, StateName = fight,
            State = #state{unit_list = UnitList, uid = UId,
                           map_list = MapList}) ->
    erlang:send_after(util:rand(30000, 600000),
                      self(),
                      boss_unit),
    {AddUbitList, NUId} = check_unit(MapList,
                                     State,
                                     UId,
                                     boss_unit,
                                     []),
    continue(StateName,
             State#state{unit_list = UnitList ++ AddUbitList,
                         uid = NUId});
handle_info(pick_unit, StateName = fight,
            State = #state{unit_list = UnitList, uid = UId,
                           map_list = MapList}) ->
    erlang:send_after(util:rand(150 * 1000, 153 * 1000),
                      self(),
                      pick_unit),
    {AddUbitList, NUId} = check_unit(MapList,
                                     State,
                                     UId,
                                     pick_unit,
                                     []),
    continue(StateName,
             State#state{unit_list = UnitList ++ AddUbitList,
                         uid = NUId});
handle_info(start_match, StateName = fight,
            State = #state{map_list = MapList}) ->
    Msg = notice:format(lang:get("~ts正式开始"),
                        [{string_2, 1, lang:get("精灵幻境")}]),
    [notice:cast({map, MapId}, 1, Msg)
     || #elf_map{map_id = MapId} <- MapList],
    NewState = match(State),
    erlang:send_after(8 * 1000, self(), match),
    continue(StateName, NewState#state{});
handle_info(match, StateName = fight, State) ->
    NewState = match(State),
    erlang:send_after(8 * 1000, self(), match),
    continue(StateName, NewState);
handle_info({prepare_exp, Num}, StateName = fight,
            State = #state{map_list = MapList}) ->
    [map:async_apply(MapPid,
                     {elf_role, apply_ready_exp, []})
     || #elf_map{map_pid = MapPid} <- MapList],
    erlang:send_after(60 * 1000,
                      self(),
                      {prepare_exp, Num + 1}),
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName,
          _State = #state{zone_id = ZoneId, map_list = MapList,
                          ids = Ids}) ->
    List = get_roles(Ids, []),
    [role:apply(async,
                Pid,
                {elf_role, apply_leave_zone, [undefined]})
     || #elf_role{pid = Pid} <- List],
    elf_mgr:cast({close_zone, ZoneId}),
    [unit_mgr:remove_map_all(MapId)
     || #elf_map{map_id = MapId} <- MapList],
    [map:stop(MapPid)
     || #elf_map{map_pid = MapPid} <- MapList],
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

fight(timeout,
      State = #state{combat_pid = CombatList, group = Group,
                     group_key = _GroupKey, open_id = OpenId,
                     cross_type = CrossType, ids = Ids}) ->
    Now = date:unixtime(),
    lists:foreach(fun (CombatPid) when is_pid(CombatPid) ->
                          CombatPid ! stop;
                      (_) -> skip
                  end,
                  CombatList),
    List = get_roles(Ids, []),
    NList = List,
    {NewList, NState = #state{rank_list = RankList}} =
        update_score(NList, State, []),
    ZoneList = elf_data:get_zone(OpenId),
    HonorRoleList = honor_rank(RankList, 1, []),
    case OpenId of
        0 ->
            logger:info("精灵幻境称号：~w,~w",
                        [Group, HonorRoleList],
                        elf,
                        521),
            honor_mgr:replace(list_to_atom(lists:concat(["elf_honor_",
                                                         Group])),
                              HonorRoleList,
                              0);
        _ when CrossType == 1 ->
            [cross:cast(P,
                        Z,
                        elf_mgr,
                        cast,
                        [{update_honor,
                          list_to_atom(lists:concat(["elf_honor_", Group])),
                          RankList}])
             || {P, Z} <- ZoneList];
        _ -> ignore
    end,
    push_reward(NewList, NState),
    NewState = NState#state{ts = date:now2(),
                            m_time = Now + 30, timeout = 30 * 1000},
    case get_rank_type(Group) of
        0 -> ignore;
        RankType ->
            case OpenId of
                0 ->
                    RankRc = to_rank_rc(lists:reverse(RankList), 1, []),
                    rank_zone:cast(RankType,
                                   {replace, RankType, RankRc, #{reward => 1}});
                _ when CrossType == 1 ->
                    [cross:cast(P,
                                Z,
                                elf_mgr,
                                cast,
                                [{update_rank, Group, RankType, RankList}])
                     || {P, Z} <- ZoneList];
                _ -> ignore
            end
    end,
    GroupName = case elf_data:get_group(Group) of
                    #elf_group_data{name = GName} -> GName;
                    _ -> ""
                end,
    Msg = case RankList of
              [#elf_role{name = Name1}] ->
                  notice:format(lang:get("~ts活动顺利结束，~ts取得~ts前三名，获得大量奖励 {face_1, "
                                         "18}"),
                                [{string_2, 1, lang:get("精灵幻境")},
                                 {role_2, Name1},
                                 {string_2, 1, GroupName}]);
              [#elf_role{name = Name1}, #elf_role{name = Name2}] ->
                  notice:format(lang:get("~ts活动顺利结束，~ts、~ts取得~ts前三名，获得大量奖励 {face_1, "
                                         "18}"),
                                [{string_2, 1, lang:get("精灵幻境")},
                                 {role_2, Name1},
                                 {role_2, Name2},
                                 {string_2, 1, GroupName}]);
              [#elf_role{name = Name1},
               #elf_role{name = Name2},
               #elf_role{name = Name3}
               | _] ->
                  notice:format(lang:get("~ts活动顺利结束，~ts、~ts、~ts取得~ts前三名，获得大量奖励 "
                                         "{face_1, 18}"),
                                [{string_2, 1, lang:get("精灵幻境")},
                                 {role_2, Name1},
                                 {role_2, Name2},
                                 {role_2, Name3},
                                 {string_2, 1, GroupName}]);
              _ -> ""
          end,
    case Msg of
        "" -> ignore;
        _ ->
            case OpenId of
                0 -> notice:cast(all, 5, Msg);
                _ ->
                    [cross:cast(P, Z, notice, cast, [all, 5, Msg])
                     || {P, Z} <- ZoneList]
            end
    end,
    continue(reward, NewState);
fight(_Event, State) -> continue(fight, State).

reward(timeout, State = #state{ids = Ids}) ->
    Now = date:unixtime(),
    NewState = State#state{ts = date:now2(),
                           m_time = Now + 1, timeout = 1 * 1000},
    List = get_roles(Ids, []),
    [role:apply(async,
                Pid,
                {elf_role, apply_leave_zone, [self()]})
     || #elf_role{pid = Pid} <- List],
    continue(over, NewState);
reward(_Event, State) -> continue(reward, State).

over(timeout, State) -> {stop, normal, State};
over(_Event, State) -> continue(over, State).

push_zone(Pid,
          #state{group = Group, map_list = MapList}) ->
    role:pack_send(Pid, 16503, {Group, MapList}).

push_zone(#state{group = Group, map_list = MapList}) ->
    [map:pack_send_to_all(MapId, 16503, {Group, MapList})
     || #elf_map{map_id = MapId} <- MapList].

push_role(R = #elf_role{id = RoleId, pid = Pid},
          #state{rank_list = RankList}) ->
    Rank = case lists:keyfind(RoleId,
                              #elf_role.id,
                              RankList)
               of
               #elf_role{rank = TRank} -> TRank;
               _ -> 0
           end,
    role:pack_send(Pid, 16504, {[R#elf_role{rank = Rank}]});
push_role(R = #elf_role{pid = Pid}, Rank) ->
    role:pack_send(Pid, 16504, {[R#elf_role{rank = Rank}]}).

match(State = #state{ids = Ids,
                     combat_pid = CombatList}) ->
    L = get_roles(Ids, []),
    L1 = lists:keysort(#elf_role.match, L),
    L2 = lists:reverse(L1),
    MatchPair = do_match(L2, L2, []),
    Referee = self(),
    {CombatList1, UpdateIds, ResetIds} = combat(MatchPair,
                                                Referee,
                                                [],
                                                [],
                                                []),
    update_combat(L2, UpdateIds, ResetIds),
    State#state{combat_pid = CombatList ++ CombatList1}.

do_match([], _, MatchPair) -> MatchPair;
do_match([ARole = #elf_role{name = Name, match = Match,
                            status = Status, times = Times, win = Win}
          | T],
         Other, MatchPair) ->
    case match_role(ARole, Other) of
        {true, BRole = #elf_role{name = _OtherName}} ->
            do_match(T -- [ARole, BRole],
                     Other -- [ARole, BRole],
                     [{ARole, BRole} | MatchPair]);
        {false, Reason} ->
            case Match >= 7 of
                true when Reason =/= null ->
                    logger:info("[~ts]匹配次数[~w]状态[~w]获胜[~w]战斗次数[~w]原因[~w]",
                                [Name, Match, Status, Win, Times, Reason],
                                elf,
                                637);
                _ -> skip
            end,
            do_match(T, Other -- [ARole], MatchPair)
    end.

match_role(_ARole, []) -> {false, null};
match_role(ARole, [ARole | T]) -> match_role(ARole, T);
match_role(#elf_role{is_combat = 1, name = _Name}, _) ->
    {false, combat};
match_role(#elf_role{status = 2, name = _Name}, _) ->
    {false, leave};
match_role(#elf_role{status = 3, name = _Name}, _) ->
    {false, offline};
match_role(#elf_role{match = Match, name = _Name}, _)
    when Match =< 6 ->
    {false, six};
match_role(ARole,
           [#elf_role{is_combat = 1, name = _Name} | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#elf_role{status = 2, name = _Name} | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#elf_role{status = 3, name = _Name} | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#elf_role{match = Match, name = _Name} | T])
    when Match =< 3 ->
    match_role(ARole, T);
match_role(ARole = #elf_role{id = Aid,
                             last_role_id = Bid, match = Match, name = _Name1},
           [#elf_role{id = Bid, last_role_id = Aid, name = _Name2}
            | T])
    when Match =< 15 ->
    match_role(ARole, T);
match_role(ARole = #elf_role{pos = #pos{map = MapId},
                             name = _Name},
           [#elf_role{pos = #pos{map = MapId2}} | T])
    when MapId =/= MapId2 ->
    match_role(ARole, T);
match_role(ARole = #elf_role{match = Match,
                             name = AName, pos = #pos{map = MapId}},
           [BRole = #elf_role{name = BName,
                              pos = #pos{map = MapId}}
            | T]) ->
    case {get_info(ARole), get_info(BRole)} of
        {{ALev, ALen}, {BLev, BLen}} ->
            {LevRange, LenRange} = case Match of
                                       0 -> {0, 10};
                                       1 -> {1, 20};
                                       2 -> {1, 40};
                                       3 -> {2, 40};
                                       4 -> {2, 40};
                                       5 -> {3, 40};
                                       6 -> {4, 40};
                                       7 -> {5, 40};
                                       8 -> {8, 40};
                                       9 -> {10, 40};
                                       _ -> {100, 10}
                                   end,
            MinLev = ALev - LevRange,
            MaxLev = ALev + LevRange,
            MinLen = ALen - LenRange,
            MaxLen = ALen + LenRange,
            case BLev >= MinLev andalso
                     BLev =< MaxLev andalso
                         BLen >= MinLen andalso BLen =< MaxLen
                of
                true -> {true, BRole};
                false ->
                    case Match > 10 of
                        true ->
                            logger:info("[~ts]匹配大于10次也无法匹配到[~ts][~w][~w][~w][~w]~w",
                                        [AName,
                                         BName,
                                         MinLev,
                                         MaxLev,
                                         MinLen,
                                         MaxLen,
                                         {ALev, BLev, ALen, BLen}],
                                        elf,
                                        722);
                        _ -> skip
                    end,
                    match_role(ARole, T)
            end;
        _Err ->
            case _Err of
                null -> ignore;
                _ ->
                    logger:error("无法获取[~ts]和[~ts]对应状态,原因:~w",
                                 [AName, BName, _Err],
                                 elf,
                                 732)
            end,
            match_role(ARole, T)
    end.

get_info(#elf_role{lev = Lev}) -> {Lev, 1};
get_info(_Err) ->
    logger:error("无法获取个人信息:~w", [_Err], elf, 742),
    false.

update_combat([], _, _) -> ok;
update_combat([Tc = #elf_role{id = RoleId, status = 1,
                              is_combat = 0, match = Match}
               | T],
              IdList, ResetIds) ->
    NewTc = case lists:keyfind(RoleId, 2, IdList) of
                {LastRoleId, _} ->
                    Tc#elf_role{is_combat = 1, match = 0,
                                last_role_id = LastRoleId};
                false ->
                    case lists:member(RoleId, ResetIds) of
                        true -> Tc#elf_role{match = 0};
                        _ -> Tc#elf_role{match = Match + 1}
                    end
            end,
    elf_mgr:update_data(NewTc),
    update_combat(T, IdList, ResetIds);
update_combat([_ | T], IdList, ResetIds) ->
    update_combat(T, IdList, ResetIds).

combat([], _, CombatPids, UpdateIds, ResetIds) ->
    {CombatPids, UpdateIds, ResetIds};
combat([{A = #elf_role{name = AName},
         B = #elf_role{name = BName}}
        | T],
       Referee, CombatPids, UpdateIds, ResetIds) ->
    case do_combat(A, B, Referee, UpdateIds) of
        {true, CombatPid, AddUpdateIds} ->
            combat(T,
                   Referee,
                   [CombatPid | CombatPids],
                   AddUpdateIds ++ UpdateIds,
                   ResetIds);
        {false, AddResetIds} ->
            logger:error("[~ts]和[~ts]匹配却发起战斗失败",
                         [AName, BName],
                         elf,
                         775),
            combat(T,
                   Referee,
                   CombatPids,
                   UpdateIds,
                   AddResetIds ++ ResetIds)
    end.

do_combat(#elf_role{id = Aid, pid = _APid, name = AName,
                    pos = #pos{map_base_id = MapBaseId}},
          #elf_role{id = Bid, pid = _BPid, name = BName}, Referee,
          _UpdateIds) ->
    #elf_map_data{max_guard = MaxGuard} = case
                                              elf_data:get_map(MapBaseId)
                                              of
                                              TMap = #elf_map_data{} -> TMap;
                                              _ -> #elf_map_data{}
                                          end,
    Args = #combat_start_args{common_referee = Referee,
                              max_guard = MaxGuard},
    case combat_mgr:start_combat(41, [Aid], [Bid], Args) of
        {ok, CombatPid} ->
            [role_trigger:async_fire(RId, #evt_elf_combat{})
             || RId <- [Aid, Bid]],
            {true, CombatPid, [{Aid, Bid}, {Bid, Aid}]};
        {false, _Reason} ->
            logger:error("[~ts]和[~ts]发起战斗失败[~w]",
                         [AName, BName, _Reason],
                         elf,
                         802),
            {false, [Aid, Bid]}
    end.

get_team_mem(Role = #role{name = RoleName,
                          m_team = #m_team{pid = TeamPid}}) ->
    case check_status(Role) of
        {ok, true} ->
            case team:get_fighters(Role) of
                {ok, TeamMate} ->
                    NewTeamMate = case TeamMate of
                                      [{leader, #role{id = RoleId}, GuardPos}
                                       | T] ->
                                          [{leader, RoleId, GuardPos} | T];
                                      [#role{id = RoleId} | T] -> [RoleId | T];
                                      _ -> TeamMate
                                  end,
                    {FailMate, FailNames} = check_mate(NewTeamMate,
                                                       {[], []}),
                    NewTeamMate1 = NewTeamMate -- FailMate,
                    case NewTeamMate1 of
                        [] -> {ok, false};
                        _ -> {ok, {true, TeamPid, NewTeamMate1, FailNames}}
                    end;
                _Err ->
                    logger:error("无法获取[~ts]的队伍信息[~w]",
                                 [RoleName, _Err],
                                 elf,
                                 878),
                    {ok, false}
            end;
        _ -> {ok, false}
    end.

check_mate([], {FailMate, FailNames}) ->
    {FailMate, FailNames};
check_mate([Mate = #team_mate{pid = Pid, name = Name}
            | T],
           {FailMate, FailNames}) ->
    case role:apply(sync, Pid, {elf, check_status, []}) of
        true -> check_mate(T, {FailMate, FailNames});
        false ->
            check_mate(T, {[Mate | FailMate], [Name | FailNames]});
        _Err ->
            logger:error("请求队员状态失败[~w]", [_Err], elf, 894),
            check_mate(T, {[Mate | FailMate], [Name | FailNames]})
    end;
check_mate([{_, _, _} | T], {FailMate, FailNames}) ->
    check_mate(T, {FailMate, FailNames});
check_mate([_Err | T], {FailMate, FailNames}) ->
    logger:error("未知队员无法检测[~w]", [_Err], elf, 900),
    check_mate(T, {FailMate, FailNames}).

check_status(#role{name = Name, status = 2}) ->
    logger:error("[~ts]战斗中，无法进入战斗", [Name], elf, 905),
    {ok, false};
check_status(#role{name = Name,
                   m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    logger:error("[~ts]战斗中，无法进入战斗", [Name], elf, 908),
    {ok, false};
check_status(#role{s_event = 27}) -> {ok, true};
check_status(#role{id = Id, name = Name,
                   s_event = Event = 0}) ->
    logger:error("[~ts]状态异常[~w]，无法进入战斗",
                 [Name, {Id, Event}],
                 elf,
                 913),
    {ok, false};
check_status(#role{id = Id, name = Name,
                   s_event = Event}) ->
    logger:error("[~ts]状态异常[~w]，无法进入战斗",
                 [Name, {Id, Event}],
                 elf,
                 917),
    {ok, false};
check_status(_) -> {ok, false}.

deal_combat_result(_Flag, [], _, _, _, _, _, State) ->
    State;
deal_combat_result(Flag = win,
                   [#{id := RoleId, pid := Pid} | T], Lose, RandTime,
                   LastTime, MateNum, OtherNum, State = #state{}) ->
    case elf_mgr:lookup(RoleId) of
        Tz = #elf_role{name = Name, score = Score, win = Win,
                       grade_flag = GradeFlag, times = Times,
                       win_streak = WinStreak,
                       pos = Pos = #pos{map_base_id = MapBaseId},
                       classes = Classes} ->
            MapCfg = #elf_map_data{win_score = TAddScore,
                                   grade_score = GradeScore,
                                   next_score = NextScore} =
                         case elf_data:get_map(MapBaseId) of
                             MapData = #elf_map_data{} ->
                                 map_data_score_add(MapData, Classes);
                             _ ->
                                 logger:error("地图没有配置~ts, ~w",
                                              [Name, Pos],
                                              elf,
                                              936),
                                 #elf_map_data{}
                         end,
            NewTimes = Times + 1,
            NewWin = Win + 1,
            NewWinStreak = WinStreak + 1,
            MaxScore = lists:max(elf_data:max_score()),
            TTAddScore = case GradeFlag of
                             1 when Score >= MaxScore -> 0;
                             1 -> util:ceil(TAddScore * 1.19999999999999995559);
                             _ -> TAddScore
                         end,
            DecScore = NextScore - Score,
            Max = case GradeScore of
                      0 -> max(DecScore, 0);
                      _ when GradeScore > Score ->
                          DecScore2 = GradeScore - Score,
                          max(min(DecScore, DecScore2), 0);
                      _ -> 9999
                  end,
            AddScore = util:check_range(TTAddScore, 0, Max),
            NewScore = calc_score(win,
                                  NewTimes,
                                  AddScore,
                                  Score,
                                  MaxScore),
            NewTz = Tz#elf_role{score = NewScore, win = NewWin,
                                times = NewTimes, is_combat = 0,
                                last_combat_over_time = LastTime,
                                match = RandTime, win_streak = NewWinStreak},
            elf_mgr:update_data(NewTz),
            role_notice(NewTz, win),
            role_notice(NewTz, win_streak),
            role:apply(async,
                       Pid,
                       {elf_role,
                        async_combat_over,
                        [1, AddScore, NewTz, MapCfg, false]}),
            NState = State,
            NewState = update_rank(NewTz, NState),
            push_role(NewTz, NewState),
            check_score_statue(NewTz, MapCfg, NState, timer),
            cast_win_streak(NewTz),
            deal_combat_result(Flag,
                               T,
                               Lose,
                               RandTime,
                               LastTime,
                               MateNum,
                               OtherNum,
                               NewState);
        _ ->
            deal_combat_result(Flag,
                               T,
                               Lose,
                               RandTime,
                               LastTime,
                               MateNum,
                               OtherNum,
                               State)
    end;
deal_combat_result(Flag = lose,
                   [#{id := RoleId, pid := Pid, is_leader := _IsLeader}
                    | T],
                   Win, RandTime, LastTime, MateNum, OtherNum, State) ->
    case elf_mgr:lookup(RoleId) of
        Tz = #elf_role{score = Score, name = Name,
                       grade_flag = GradeFlag, times = Times, pid = Pid,
                       has_mail = OldHasMail, classes = Classes,
                       pos = Pos = #pos{map_base_id = MapBaseId}} ->
            NewTimes = Times + 1,
            MapCfg = #elf_map_data{fail_score = TAddScore,
                                   grade_score = GradeScore,
                                   grade_dec_score = GradeDecScore,
                                   next_score = NextScore} =
                         case elf_data:get_map(MapBaseId) of
                             MapData = #elf_map_data{} ->
                                 map_data_score_add(MapData, Classes);
                             _ ->
                                 logger:error("地图没有配置~ts, ~w",
                                              [Name, Pos],
                                              elf,
                                              996),
                                 #elf_map_data{}
                         end,
            TTAddScore = case GradeFlag of
                             1 -> -GradeDecScore;
                             _ -> TAddScore
                         end,
            DecScore = NextScore - Score,
            Max = case GradeScore of
                      0 -> max(DecScore, 0);
                      _ when GradeScore > Score ->
                          DecScore2 = GradeScore - Score,
                          max(min(DecScore, DecScore2), 0);
                      _ -> 9999
                  end,
            AddScore = util:check_range(TTAddScore,
                                        min(0, TTAddScore),
                                        Max),
            MaxScore = lists:max(elf_data:max_score()),
            NewScore = calc_score(lose,
                                  NewTimes,
                                  AddScore,
                                  Score,
                                  MaxScore),
            {SendMail, NewHasMail} = case OldHasMail of
                                         1 -> {false, OldHasMail};
                                         _ -> {false, 0}
                                     end,
            cast_lose_streak(Tz),
            NewTz = Tz#elf_role{score = NewScore, times = NewTimes,
                                is_combat = 0, last_combat_over_time = LastTime,
                                match = RandTime, has_mail = NewHasMail,
                                win_streak = 0},
            elf_mgr:update_data(NewTz),
            role_notice(NewTz, lose),
            role:apply(async,
                       Pid,
                       {elf_role,
                        async_combat_over,
                        [0, AddScore, NewTz, MapCfg, SendMail]}),
            NState = State,
            check_score_statue(NewTz, MapCfg, NState, timer),
            NewState = update_rank(NewTz, NState),
            push_role(NewTz, NewState),
            deal_combat_result(Flag,
                               T,
                               Win,
                               RandTime,
                               LastTime,
                               MateNum,
                               OtherNum,
                               NewState);
        _ ->
            deal_combat_result(Flag,
                               T,
                               Win,
                               RandTime,
                               LastTime,
                               MateNum,
                               OtherNum,
                               State)
    end;
deal_combat_result(Flag = fail, [#{id := RoleId} | T],
                   Win, RandTime, LastTime, MateNum, OtherNum, State) ->
    case elf_mgr:lookup(RoleId) of
        Tz = #elf_role{} ->
            NewTz = Tz#elf_role{is_combat = 0},
            push_role(NewTz, State),
            elf_mgr:update_data(NewTz);
        _ -> skip
    end,
    deal_combat_result(Flag,
                       T,
                       Win,
                       RandTime,
                       LastTime,
                       MateNum,
                       OtherNum,
                       State);
deal_combat_result(Flag, [_ | T], Win, RandTime,
                   LastTime, MateNum, OtherNum, State) ->
    deal_combat_result(Flag,
                       T,
                       Win,
                       RandTime,
                       LastTime,
                       MateNum,
                       OtherNum,
                       State).

update_rank(HeroRole = #elf_role{id = RoleId},
            State = #state{rank_list = RankList,
                           map_list = MapList}) ->
    NRankList = lists:keystore(RoleId,
                               #elf_role.id,
                               RankList,
                               HeroRole),
    NRankList1 = util:keys_sort([#elf_role.lev,
                                 #elf_role.win,
                                 #elf_role.win_streak,
                                 #elf_role.score],
                                NRankList),
    NRankList2 = update_rank2(NRankList1, 1, []),
    Old3 = lists:sublist(RankList, 3),
    New3 = lists:sublist(NRankList2, 3),
    case Old3 == New3 of
        false ->
            [map:pack_send_to_all(MapId,
                                  16505,
                                  {lists:sublist(New3, 100)})
             || #elf_map{map_id = MapId} <- MapList];
        _ -> ignore
    end,
    State#state{rank_list =
                    lists:sublist(NRankList2, 3000)}.

update_rank2([], _, List) -> lists:reverse(List);
update_rank2([R | T], Rank, List) ->
    update_rank2(T,
                 Rank + 1,
                 [R#elf_role{rank = Rank} | List]).

create_map([], UId, MapList, UnitList) ->
    {MapList, UnitList, UId};
create_map([BaseId | T], UId, MapList, UnitList) ->
    case elf_data:get_map(BaseId) of
        #elf_map_data{id = Id, unit_list = RandList,
                      boss_list = BossList, super_list = SuperList} ->
            case map_mgr:create(BaseId) of
                {ok, MapPid, MapId} ->
                    Map = #elf_map{id = Id, map_base_id = BaseId,
                                   map_id = MapId, map_pid = MapPid},
                    {RandUnitList, UId1} = create_unit(RandList,
                                                       Map,
                                                       UId,
                                                       [],
                                                       #state{}),
                    {BossUnitList, UId2} = create_unit(BossList,
                                                       Map,
                                                       UId1,
                                                       [],
                                                       #state{}),
                    {SuperUnitList, UId3} = create_unit(SuperList,
                                                        Map,
                                                        UId2,
                                                        [],
                                                        #state{}),
                    create_map(T,
                               UId3,
                               [Map | MapList],
                               UnitList ++
                                   RandUnitList ++
                                       BossUnitList ++ SuperUnitList);
                _ -> {false, lang:get("地图无法开启")}
            end;
        _ -> create_map(T, UId, MapList, UnitList)
    end.

check_unit([], _, UId, _, List) -> {List, UId};
check_unit([Map = #elf_map{map_base_id = MapBaseId}
            | T],
           State = #state{unit_list = UnitList, group = Group},
           UId, Label, List) ->
    Add = case elf_data:get_map(MapBaseId) of
              #elf_map_data{unit_list = RandList}
                  when Label == rand_unit ->
                  check_unit_num(Map, RandList, UnitList, []);
              #elf_map_data{boss_list = BossList}
                  when Label == boss_unit ->
                  check_unit_num(Map, BossList, UnitList, []);
              #elf_map_data{box_list = PickList}
                  when Label == pick_unit ->
                  check_unit_num(Map, PickList, UnitList, []);
              _ -> []
          end,
    logger:info("精灵创建单位:group:~w, map:~w, num:~w",
                [Group, Map, Add],
                elf,
                1099),
    {AddList, NUId} = create_unit(Add, Map, UId, [], State),
    check_unit(T, State, NUId, Label, List ++ AddList).

check_unit_num(_Map, [], _, List) -> List;
check_unit_num(Map = #elf_map{map_base_id = MapBaseId},
               [{BaseId, Num} | T], UnitList, List) ->
    Length = length([1
                     || #elf_unit{base_id = TBaseId,
                                  pos = #pos{map_base_id = TMapBaseId}}
                            <- UnitList,
                        TMapBaseId == MapBaseId andalso TBaseId == BaseId]),
    case Num - Length > 0 of
        true ->
            check_unit_num(Map,
                           T,
                           UnitList,
                           [{BaseId, Num - Length} | List]);
        _ -> check_unit_num(Map, T, UnitList, List)
    end;
check_unit_num(Map = #elf_map{num = RNum,
                              max_num = MaxNum},
               [_ | T], UnitList, List)
    when RNum < 4 andalso MaxNum == RNum ->
    check_unit_num(Map, T, UnitList, List);
check_unit_num(Map = #elf_map{map_base_id = MapBaseId,
                              num = RNum},
               [{BaseId, Radio, Min, Max} | T], UnitList, List) ->
    Length = length([1
                     || #elf_unit{base_id = TBaseId,
                                  pos = #pos{map_base_id = TMapBaseId}}
                            <- UnitList,
                        TMapBaseId == MapBaseId andalso TBaseId == BaseId]),
    Num = util:check_range(util:ceil(RNum * Radio / 1000),
                           Min,
                           Max),
    case Num - Length > 0 of
        true ->
            check_unit_num(Map,
                           T,
                           UnitList,
                           [{BaseId, Num - Length} | List]);
        _ -> check_unit_num(Map, T, UnitList, List)
    end.

create_unit([], _Map, UId, List, _) -> {List, UId};
create_unit([{BaseId, Num} | T], Map, UId, List,
            State = #state{group = Group}) ->
    logger:info("精灵创建单位:group:~w, map:~w, base_id:~w, "
                "num:~w",
                [Group, Map, BaseId, Num],
                elf,
                1131),
    {UnitList, UId2} = create_map2(BaseId,
                                   Num,
                                   Map,
                                   UId,
                                   []),
    create_unit(T, Map, UId2, List ++ UnitList, State);
create_unit([{BaseId, Radio, Min, Max} | T],
            Map = #elf_map{num = RNum}, UId, List,
            State = #state{unit_list = UnitList, group = Group}) ->
    Num = util:check_range(util:ceil(RNum * Radio / 1000),
                           Min,
                           Max),
    case check_unit_num(Map, [{BaseId, Num}], UnitList, [])
        of
        [] ->
            logger:info("精灵创建单位:group:~w, map:~w, base_id:~w, "
                        "num:~w",
                        [Group, Map, BaseId, 0],
                        elf,
                        1138),
            create_unit(T, Map, UId, List, State);
        [{_, Add} | _] ->
            logger:info("精灵创建单位:group:~w, map:~w, base_id:~w, "
                        "num:~w",
                        [Group, Map, BaseId, Add],
                        elf,
                        1141),
            {AddUnitList, UId2} = create_map2(BaseId,
                                              Add,
                                              Map,
                                              UId,
                                              []),
            create_unit(T, Map, UId2, List ++ AddUnitList, State)
    end.

create_map2(_BaseId, 0, _Map, UId, List) -> {List, UId};
create_map2(BaseId, Num,
            Map = #elf_map{map_base_id = MapBaseId, map_id = MapId},
            UId, List) ->
    case map:rand_pos(MapBaseId) of
        {TPosX, TPosY} ->
            #elf_unit_data{pos = [{PosX, PosY} | _],
                           create_msg = CreateMsg} =
                case elf_data:get_unit(BaseId) of
                    D = #elf_unit_data{pos = [_ | _]} -> D;
                    D = #elf_unit_data{pos = []} ->
                        D#elf_unit_data{pos = [{TPosX, TPosY}]};
                    _ -> #elf_unit_data{pos = [{TPosX, TPosY}]}
                end,
            BattleId = {30, UId},
            case unit_mgr:create(BattleId,
                                 BaseId,
                                 {MapId, PosX, PosY})
                of
                {ok, #unit{pos = Pos}} ->
                    U = #elf_unit{id = BattleId, base_id = BaseId,
                                  pos = Pos},
                    case CreateMsg of
                        "" -> ignore;
                        _ when Num == 1 ->
                            case CreateMsg of
                                "" -> ignore;
                                _ when Num == 1 ->
                                    notice:cast({map, MapId}, 8, CreateMsg);
                                _ -> ignore
                            end;
                        _ -> ignore
                    end,
                    create_map2(BaseId, Num - 1, Map, UId + 1, [U | List]);
                _ -> create_map2(BaseId, Num - 1, Map, UId, List)
            end;
        _ -> create_map2(BaseId, Num - 1, Map, UId, List)
    end.

get_roles([], List) -> List;
get_roles([Id | T], List) ->
    case elf_mgr:lookup(Id) of
        R = #elf_role{} -> get_roles(T, [R | List]);
        _ -> get_roles(T, List)
    end.

calc_score(win, _Time, AddScore, Score, MaxScore) ->
    min(Score + AddScore, MaxScore);
calc_score(lose, _Times, AddScore, Score, _) ->
    Score + AddScore.

role_notice(#elf_role{pid = Pid,
                      win_streak = WinStreak},
            win_streak)
    when WinStreak >= 2 ->
    notice:send({pid, Pid},
                3,
                notice:format(lang:get("战斗胜利，获得~ts连胜！"),
                              [{string_2, 4, WinStreak}]));
role_notice(_, _) -> ok.

cast_win_streak(#elf_role{name = RoleName,
                          win_streak = WinStreak, group = _Group})
    when WinStreak =:= 5 ->
    Msg =
        notice:format(lang:get("~ts在~ts中连挫强敌，获得5连胜{face_1,18}"),
                      [{role_2, RoleName}, {string_2, 1, lang:get("精灵幻境")}]),
    notice:cast(all, 5, Msg);
cast_win_streak(#elf_role{name = RoleName,
                          win_streak = WinStreak, group = Group})
    when WinStreak =:= 8 ->
    _GroupName = case elf_data:get_group(Group) of
                     #elf_group_data{name = GName} -> GName;
                     _ -> ""
                 end,
    Msg =
        notice:format(lang:get("~ts带领的队伍在~ts中表现突出，获得8连胜{face_1,18}"),
                      [{role_2, RoleName}, {string_2, 1, lang:get("精灵幻境")}]),
    notice:cast(all, 5, Msg);
cast_win_streak(#elf_role{name = RoleName,
                          win_streak = WinStreak, group = Group})
    when WinStreak =:= 10 ->
    _GroupName = case elf_data:get_group(Group) of
                     #elf_group_data{name = GName} -> GName;
                     _ -> ""
                 end,
    Msg =
        notice:format(lang:get("惊天动地，~ts带领的队伍在~ts中表现突出，获得10连胜{face_1,7}"),
                      [{role_2, RoleName}, {string_2, 1, lang:get("精灵幻境")}]),
    notice:cast(all, 5, Msg);
cast_win_streak(_) -> ok.

cast_lose_streak(#elf_role{name = RoleName,
                           win_streak = WinStreak, group = Group})
    when WinStreak =:= 5 ->
    _GroupName = case elf_data:get_group(Group) of
                     #elf_group_data{name = GName} -> GName;
                     _ -> ""
                 end,
    Msg =
        notice:format(lang:get("~ts的<color='#00ff00'>5连胜</color>被终结，正在路边默默流泪{"
                               "face_1, 21}"),
                      [{role_2, RoleName}]),
    notice:cast(all, 5, Msg);
cast_lose_streak(#elf_role{name = RoleName,
                           win_streak = WinStreak, group = Group})
    when WinStreak =:= 3 ->
    _GroupName = case elf_data:get_group(Group) of
                     #elf_group_data{name = GName} -> GName;
                     _ -> ""
                 end,
    Msg =
        notice:format(lang:get("~ts的<color='#00ff00'>3连胜</color>被终结，正在路边默默流泪{"
                               "face_1, 21}"),
                      [{role_2, RoleName}]),
    notice:cast(all, 5, Msg);
cast_lose_streak(_) -> ok.

update_score([], State, List) -> {List, State};
update_score([R = #elf_role{score = Score, pid = Pid,
                            pos = #pos{map_base_id = MapBaseId}}
              | T],
             State, List) ->
    case elf_data:get_map(MapBaseId) of
        #elf_map_data{end_score = EndScore} when EndScore > 0 ->
            Add = 200,
            NR = R#elf_role{score = Score + Add},
            NState = update_rank(NR, State),
            elf_mgr:update_data(NR),
            push_role(NR, NState),
            notice:send({pid, Pid},
                        3,
                        notice:format(lang:get("最终胜利，额外获得~ts变身能量！"),
                                      [{string_2, 5, Add}])),
            update_score(T, NState, [NR | List]);
        _ -> update_score(T, State, [R | List])
    end;
update_score([R | T], State, List) ->
    update_score(T, State, [R | List]).

honor_rank([], _, List) -> List;
honor_rank([#elf_role{id = RoleId, group = Group} | T],
           Num, List) ->
    case elf_data:get_honor({Group, Num}) of
        0 -> honor_rank(T, Num + 1, List);
        Honor ->
            Add2 = [{RoleId, Honor}],
            honor_rank(T, Num + 1, Add2 ++ List)
    end.

push_reward([], _State) -> ok;
push_reward([R = #elf_role{status = 1, pid = Pid,
                           group_key = GroupKey, group = Group}
             | T],
            State = #state{group_key = GroupKey,
                           rank_list = RankList}) ->
    role:pack_send(Pid, 16506, {Group, [R], RankList}),
    role:apply(async, Pid, {elf_role, async_over, [1, R]}),
    push_reward(T, State);
push_reward([R = #elf_role{id = RoleId, status = 3,
                           group_key = GroupKey, group = Group, score = Score,
                           lev = Lev}
             | T],
            State = #state{group_key = GroupKey}) ->
    case elf_data:get_reward({Score, Group}) of
        #elf_reward_data{item_list = ItemList,
                         exp_mode = ExpMode} ->
            NewItemList = case levup_data:get({ExpMode, Lev}) of
                              #{exp := Exp} -> ItemList ++ [{90010, Exp}];
                              _ -> ItemList
                          end,
            mail:send(RoleId,
                      lang:get("精灵幻境结算奖励"),
                      lang:get("结算不在线"),
                      NewItemList);
        _ ->
            logger:error("没有配置奖励elf_role:~w;~w~w",
                         [R, Group, Score],
                         elf,
                         1296),
            ignore
    end,
    push_reward(T, State);
push_reward([_R | T], State) -> push_reward(T, State).

to_rank_rc([], _, Acc) -> Acc;
to_rank_rc([Warrior | Rest], Rank, Acc) ->
    #elf_role{id = Id = {RId, Plat, ZoneId}, name = Name,
              sex = Sex, classes = Classes, lev = Lev, score = Score,
              group = Group} =
        Warrior,
    RankRc = #rank_rc{id = Id, rank = Rank, role_id = RId,
                      platform = Plat, zone_id = ZoneId, name = Name,
                      sex = Sex, classes = Classes, lev = Lev, val1 = Score,
                      val2 = Group},
    to_rank_rc(Rest, Rank + 1, [RankRc | Acc]).

get_rank_type(1) -> 48;
get_rank_type(2) -> 49;
get_rank_type(3) -> 50;
get_rank_type(4) -> 51;
get_rank_type(_) -> 0.

check_score_statue(#elf_role{pid = Pid, score = Score,
                             grade_flag = GradeFlag},
                   MapCfg = #elf_map_data{next_base_id = NextBaseId,
                                          next_score = NextScore,
                                          grade_score = GradeScore},
                   #state{map_list = MapList}, Label) ->
    NewMapId = case lists:keyfind(NextBaseId,
                                  #elf_map.map_base_id,
                                  MapList)
                   of
                   #elf_map{map_id = NMapId} -> NMapId;
                   _ -> 0
               end,
    NextMapCfg = elf_data:get_map(NextBaseId),
    case Score >= NextScore of
        true when NextScore > 0 andalso Label == timer ->
            role:apply(async,
                       Pid,
                       {elf_role,
                        next_map_timer,
                        [#{cfg => MapCfg, map_id => NewMapId,
                           next_cfg => NextMapCfg, pid => self()}]});
        true when NextScore > 0 ->
            role:apply(async,
                       Pid,
                       {elf_role,
                        apply_next_map,
                        [#{cfg => MapCfg, map_id => NewMapId,
                           next_cfg => NextMapCfg, pid => self()}]});
        true -> true;
        false when Score >= GradeScore andalso GradeScore > 0 ->
            role:apply(async,
                       Pid,
                       {elf_role,
                        apply_grade_buff,
                        [#{zone_id => self(), flag => up, cfg => MapCfg}]});
        false
            when Score < GradeScore andalso
                     GradeScore > 0 andalso GradeFlag == 1 ->
            role:apply(async,
                       Pid,
                       {elf_role,
                        apply_grade_buff,
                        [#{zone_id => self(), flag => down, cfg => MapCfg}]});
        _ -> ignore
    end.

update_map_list(R = #elf_role{pos = Pos},
                State = #state{map_list = MapList}, del) ->
    MapId = case Pos of
                #pos{map = TMapId} -> TMapId;
                _ -> 0
            end,
    NewMapList = case lists:keyfind(MapId,
                                    #elf_map.map_id,
                                    MapList)
                     of
                     Map = #elf_map{num = Num} ->
                         NNum = max(Num - 1, 0),
                         [Map#elf_map{num = NNum} | lists:keydelete(MapId,
                                                                    #elf_map.map_id,
                                                                    MapList)];
                     _ ->
                         logger:error("地图没有找到：~w", [R], elf, 1353),
                         MapList
                 end,
    State#state{map_list = NewMapList};
update_map_list(R = #elf_role{id = RoleId, name = Name,
                              pos = Pos},
                State = #state{map_list = MapList, group = Group}, _) ->
    {MapId, MapBaseId} = case Pos of
                             #pos{map = TMapId, map_base_id = TMapBaseId} ->
                                 {TMapId, TMapBaseId};
                             _ -> {0, 0}
                         end,
    NewMapList = case lists:keyfind(MapId,
                                    #elf_map.map_id,
                                    MapList)
                     of
                     Map = #elf_map{num = Num, max_num = MaxNum} ->
                         NNum = Num + 1,
                         NMaxNum = MaxNum + 1,
                         case elf_data:get_first({Group, MapBaseId, NMaxNum}) of
                             #elf_first_data{cast = Cast, item_list = ItemList,
                                             title = Title,
                                             comment = Comment} ->
                                 case Cast of
                                     "" -> ignore;
                                     _ ->
                                         NewCastMsg =
                                             notice:replace_msg([{"#role#",
                                                                  [{role_2,
                                                                    Name}]}],
                                                                Cast),
                                         logger:debug("广播：~ts",
                                                      [NewCastMsg],
                                                      elf,
                                                      1373),
                                         [notice:cast({map, IMapId},
                                                      4,
                                                      NewCastMsg)
                                          || #elf_map{map_id = IMapId}
                                                 <- MapList]
                                 end,
                                 case ItemList of
                                     [_ | _] ->
                                         mail:send(RoleId,
                                                   Title,
                                                   Comment,
                                                   ItemList);
                                     _ -> ignore
                                 end;
                             _ -> ignore
                         end,
                         [Map#elf_map{num = NNum, max_num = NMaxNum}
                          | lists:keydelete(MapId, #elf_map.map_id, MapList)];
                     _ ->
                         logger:error("地图没有找到：~w", [R], elf, 1387),
                         MapList
                 end,
    State#state{map_list = NewMapList};
update_map_list(_, State, _) -> State.

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

map_data_score_add(#elf_map_data{win_score = WinScore,
                                 fail_score = FailScore} =
                       MapData,
                   4) ->
    MapData#elf_map_data{win_score =
                             util:ceil(WinScore * 1.14999999999999991118),
                         fail_score =
                             util:ceil(FailScore * 1.14999999999999991118)};
map_data_score_add(#elf_map_data{win_score = WinScore,
                                 fail_score = FailScore} =
                       MapData,
                   5) ->
    MapData#elf_map_data{win_score =
                             util:ceil(WinScore * 1.14999999999999991118),
                         fail_score =
                             util:ceil(FailScore * 1.14999999999999991118)};
map_data_score_add(MapData, _Classes) -> MapData.

unit_data_score_add(UnitData = #elf_unit_data{score =
                                                  Score},
                    4) ->
    UnitData#elf_unit_data{score =
                               util:ceil(Score * 1.14999999999999991118)};
unit_data_score_add(UnitData = #elf_unit_data{score =
                                                  Score},
                    5) ->
    UnitData#elf_unit_data{score =
                               util:ceil(Score * 1.14999999999999991118)};
unit_data_score_add(UnitData, _Classes) -> UnitData.

