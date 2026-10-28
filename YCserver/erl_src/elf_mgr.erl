-file("src/mod/elf/elf_mgr.erl", 1).

-module(elf_mgr).

-behaviour(gen_fsm).

-export([start_link/1,
         tick/3,
         m/0,
         cast/1,
         call/1,
         login/1,
         logout/1,
         lookup/1,
         update_data/1,
         reload/0]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2,
         notice/2,
         ready/2,
         fight/2,
         reward/2,
         over/2]).

-record(state,
        {ts,
         timeout,
         npc_battle_id,
         ready_zones = [],
         ready_zone_num = 0,
         timer_ready_reward,
         zones = [],
         switch = open,
         m_time = 0,
         id = 1,
         cross_type = 0,
         open_mode = 0}).

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

-file("src/mod/elf/elf_mgr.erl", 55).

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

-file("src/mod/elf/elf_mgr.erl", 56).

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

-file("src/mod/elf/elf_mgr.erl", 57).

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

-file("src/mod/elf/elf_mgr.erl", 58).

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

-file("src/mod/elf/elf_mgr.erl", 59).

-file("inc/looks.hrl", 1).

-file("src/mod/elf/elf_mgr.erl", 60).

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

-file("src/mod/elf/elf_mgr.erl", 61).

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

-file("src/mod/elf/elf_mgr.erl", 62).

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

-file("src/mod/elf/elf_mgr.erl", 63).

login(Role = #role{s_event = Event,
                   pos =
                       Pos = #pos{platform = Platform, zone_id = ZoneId}})
    when Event =:= 27 orelse Event =:= 26 ->
    Role1 = looks:del([],
                      Role#role{s_event = 0, s_event_pid = undefined}),
    {ok, Role2} = buff:del(Role1, elf_data:del_buffs()),
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
    {ok, Role2#role{pos = NewPos}};
login(_) -> ok.

logout(#role{s_event = Event, id = Id})
    when Event =:= 27 orelse Event =:= 26 ->
    elf_mgr ! {logout, Id},
    ok;
logout(_) -> ok.

-spec m() -> ok.

m() ->
    logger:info("有人输入了下阶段", [], elf_mgr, 90),
    gen_fsm:send_event(elf_mgr, timeout).

cast(Event) ->
    gen_fsm:send_all_state_event(elf_mgr, Event).

call(Event) ->
    try gen_fsm:sync_send_all_state_event(elf_mgr, Event)
    catch
        _Type:_Reason ->
            logger:debug("Type: ~w  Reason: ~w",
                         [_Type, _Reason],
                         elf_mgr,
                         103),
            {error, timeout}
    end.

reload() -> cast({reload}).

start_link(Args) ->
    gen_fsm:start_link({local, elf_mgr},
                       elf_mgr,
                       [Args],
                       []).

init([Mod]) ->
    logger:info("开始启动...", [], elf_mgr, 119),
    process_flag(trap_exit, true),
    ets:new(elf_role,
            [set, named_table, public, {keypos, #elf_role.id}]),
    TimeLeft = get_idle_time(),
    CrossType = case Mod of
                    center -> 1;
                    _ -> 0
                end,
    OpenMode = check_open_mode(CrossType),
    State = #state{ts = date:now2(),
                   timeout = TimeLeft * 1000, cross_type = CrossType,
                   open_mode = OpenMode},
    NewState = set_npc(TimeLeft, State),
    logger:info("启动完成", [], elf_mgr, 130),
    {ok, idle, NewState, TimeLeft * 1000}.

handle_event({update_honor, HonorType, RankList},
             StateName, State = #state{cross_type = 0}) ->
    NewRankList = [I
                   || I = #elf_role{id = RoleId} <- RankList,
                      role_misc:is_local_role(RoleId)],
    HonorRoleList = elf:honor_rank(NewRankList, 1, []),
    logger:info("精灵幻境称号：~w,~w",
                [HonorType, HonorRoleList],
                elf_mgr,
                137),
    honor_mgr:replace(HonorType, HonorRoleList, 0),
    continue(StateName, State);
handle_event({update_rank, Group, RankType, RankList},
             StateName, State = #state{cross_type = 0}) ->
    NewRankList = [I
                   || I = #elf_role{id = RoleId} <- RankList,
                      role_misc:is_local_role(RoleId)],
    RankRc = elf:to_rank_rc(lists:reverse(NewRankList),
                            1,
                            []),
    rank_zone:cast(RankType,
                   {replace, RankType, RankRc, #{reward => 1}}),
    _GroupName = case elf_data:get_group(Group) of
                     #elf_group_data{name = GName} -> GName;
                     _ -> ""
                 end,
    continue(StateName, State);
handle_event({sign,
              ElfRole = #elf_role{group = GroupId}},
             StateName = ready,
             State = #state{ready_zones = _Zones, cross_type = 0,
                            open_mode = 1}) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    OpenId = elf_data:get_cross({Platform, ZoneId}),
    cross:cast(elf_mgr,
               cast,
               [{sign,
                 ElfRole#elf_role{open_id = OpenId,
                                  group_key = {OpenId, GroupId}}}]),
    continue(StateName, State);
handle_event({sign,
              ElfRole = #elf_role{pid = Pid, group_key = GroupKey}},
             StateName = ready,
             State = #state{ready_zones = Zones,
                            cross_type = CrossType}) ->
    NewState = case lists:keyfind(GroupKey,
                                  #elf_ready_zone.group_key,
                                  Zones)
                   of
                   #elf_ready_zone{map_id = MapId} ->
                       Platform = env:get(platform),
                       ZoneId = env:get(zone_id),
                       role:apply(async,
                                  Pid,
                                  {elf_role,
                                   apply_enter_ready,
                                   [#{map_id => MapId, platform => Platform,
                                      zone_id => ZoneId,
                                      state_name => StateName,
                                      cross_type => CrossType,
                                      zone_pid => self(),
                                      elf_role => ElfRole}]}),
                       State;
                   _ ->
                       _Data = {_, Reason} = {0,
                                              lang:get("战场准备区暂时无法创建，请稍后尝试")},
                       notice:npc_talk({pid, Pid}, 62313, Reason),
                       State
               end,
    continue(StateName, NewState);
handle_event({sign,
              ElfRole = #elf_role{id = _Rid, pid = _Pid,
                                  group = GroupId}},
             StateName = fight,
             State = #state{cross_type = 0, open_mode = 1}) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    OpenId = elf_data:get_cross({Platform, ZoneId}),
    cross:cast(elf_mgr,
               cast,
               [{sign,
                 ElfRole#elf_role{open_id = OpenId,
                                  group_key = {OpenId, GroupId}}}]),
    continue(StateName, State);
handle_event({sign,
              ElfRole = #elf_role{id = Rid, pid = Pid}},
             StateName = fight,
             State = #state{zones = Zones, m_time = MTime}) ->
    Now = date:unixtime(),
    Time = 15,
    Result = case Now + 45 * 60 =< MTime + Time * 60 of
                 true ->
                     case lookup(Rid) of
                         #elf_role{} -> {false, lang:get("已经退出过不能再进入")};
                         _ ->
                             case find_field(ElfRole, Zones) of
                                 {ok, #elf_zone{pid = FPid, id = Fid}} ->
                                     elf:last_enter_field(FPid,
                                                          ElfRole#elf_role{zone_pid
                                                                               =
                                                                               FPid,
                                                                           zone_id
                                                                               =
                                                                               Fid}),
                                     ok;
                                 {false, Reason} -> {false, Reason}
                             end
                     end;
                 _ ->
                     {false,
                      notice:format(lang:get("精灵幻境已经开始超过~ts分钟，无法再进入，下次请早哦"),
                                    [{string_2, 5, Time}])}
             end,
    case Result of
        {false, Err} ->
            _Data = {0, Err},
            notice:npc_talk({pid, Pid}, 62313, Err),
            continue(StateName, State);
        ok -> continue(StateName, State)
    end;
handle_event({sign, #elf_role{pid = Pid}}, idle,
             State) ->
    _Data = {_, Reason} = {0, lang:get("活动还未开启，请耐心等待")},
    notice:npc_talk({pid, Pid}, 62313, Reason),
    continue(idle, State);
handle_event({reload}, StateName,
             State = #state{cross_type = CrossType,
                            open_mode = OldOpenMode}) ->
    OpenMode = check_open_mode(CrossType),
    logger:info("收到重载从[~w]模式转换成[~w]模式",
                [OldOpenMode, OpenMode],
                elf_mgr,
                234),
    continue(StateName, State#state{open_mode = OpenMode});
handle_event(Info = {leave,
                     #{id := RoleId, pid := Pid}},
             StateName, State) ->
    case lookup(RoleId) of
        #elf_role{zone_pid = ZonePid} when is_pid(ZonePid) ->
            case util:is_process_alive(ZonePid) of
                true -> elf:cast(ZonePid, Info);
                _ ->
                    role:apply(async,
                               Pid,
                               {elf_role, apply_leave_zone, [self()]})
            end;
        #elf_role{} ->
            role:apply(async,
                       Pid,
                       {elf_role, apply_leave_zone, [self()]});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event(Info = {leave_succ, RoleId}, StateName,
             State) ->
    case lookup(RoleId) of
        #elf_role{zone_pid = ZonePid} when is_pid(ZonePid) ->
            elf:cast(ZonePid, Info);
        R = #elf_role{} -> update_data(R#elf_role{status = 2});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event(_Info = {push, #{pid := RolePid}},
             StateName, State) ->
    push_state(RolePid, StateName, State),
    continue(StateName, State);
handle_event({push_role, #{pid := Pid, id := RoleId}},
             StateName, State) ->
    case elf_mgr:lookup(RoleId) of
        R = #elf_role{} ->
            elf:push_role(R#elf_role{pid = Pid}, 0);
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({sign_succ,
              R = #elf_role{name = _Name, group = _Group}},
             StateName, State = #state{}) ->
    Now = date:unixtime(),
    logger:debug("报名成功~ts, group:~w",
                 [_Name, _Group],
                 elf_mgr,
                 283),
    update_data(R#elf_role{m_time = Now}),
    continue(StateName, State);
handle_event({ready_exp, RoleId, AddExp},
             StateName = ready, State) ->
    case lookup(RoleId) of
        R = #elf_role{exp = Exp} ->
            NR = R#elf_role{exp = Exp + AddExp},
            update_data(NR),
            elf:push_role(NR, 0);
        _ -> ignore
    end,
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info({logout, RoleId}, StateName, State) ->
    case lookup(RoleId) of
        #elf_role{zone_pid = ZonePid} when is_pid(ZonePid) ->
            elf:cast(ZonePid, {logout, RoleId});
        R = #elf_role{} -> update_data(R#elf_role{status = 2});
        _ -> ignore
    end,
    continue(StateName, State);
handle_info({prepare_exp, Num}, StateName = ready,
            State = #state{ready_zones = ReadyZones}) ->
    [map:async_apply(MapPid,
                     {elf_role, apply_ready_exp, []})
     || #elf_ready_zone{map_pid = MapPid} <- ReadyZones],
    erlang:send_after(60 * 1000,
                      self(),
                      {prepare_exp, Num + 1}),
    continue(StateName, State);
handle_info({timer_tick, Msg}, Phase, State) ->
    NewState = case tick(Phase, Msg, State) of
                   {ok, {set, Timer}, RtnState} ->
                       server_timer:set(Timer),
                       RtnState;
                   {ok, {set, Timer}} ->
                       server_timer:set(Timer),
                       State;
                   {ok, remove, RtnState} ->
                       server_timer:timer(remove),
                       RtnState;
                   remove ->
                       server_timer:timer(remove),
                       State;
                   _False ->
                       logger:debug("[Msg:~w]定时器返回值:~w",
                                    [Msg, _False],
                                    elf_mgr,
                                    343),
                       server_timer:timer(remove),
                       State
               end,
    continue(Phase, NewState);
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State = #state{switch = close}) ->
    logger:info("空闲阶段处于close状态，无需开启", [], elf_mgr, 365),
    {next_state, idle, State};
idle(timeout, State) ->
    logger:info("精灵幻境进入广播阶段", [], elf_mgr, 368),
    Now = date:unixtime(),
    Timeout = 10 * 60,
    Args = [{string_2, 1, lang:get("精灵幻境")}],
    Msg =
        notice:format(lang:get("~ts将在~ts分钟后开启，请大家做好准备{face_1, 7}"),
                      Args ++ [{string_2, 1, 10}]),
    notice:cast(all, 8, Msg),
    NewState = State#state{ts = date:now2(),
                           timeout = Timeout * 1000, m_time = Now + Timeout},
    push_state(notice, NewState),
    continue(notice, NewState);
idle(_Event, State) -> continue(idle, State).

notice(timeout, State) ->
    logger:info("精灵幻境进入报名阶段", [], elf_mgr, 386),
    ets:delete_all_objects(elf_role),
    case init_ready_zone(State) of
        {ok, ReadyState} ->
            Now = date:unixtime(),
            Timeout = 10 * 60,
            Args = [{string_2, 1, lang:get("精灵幻境")}],
            Msg =
                notice:format(lang:get("~ts活动将在~ts分钟后开启，准备厅现已开放，请大家前往准备厅进行准备{face_1, 7}"),
                              Args ++ [{string_2, 1, 10}]),
            notice:cast(all, 8, Msg),
            erlang:send_after(60 * 1000, self(), {prepare_exp, 1}),
            NState = ReadyState#state{ts = date:now2(),
                                      timeout = Timeout * 1000,
                                      m_time = Now + Timeout, zones = []},
            NState1 = del_npc(NState),
            NewState = npc(NState1),
            push_state(ready, NewState),
            continue(ready, NewState);
        {false, Msg} ->
            logger:error("创建战场准备区失败:~ts", [Msg], elf_mgr, 407),
            TimeLeft = get_idle_time(),
            NState = del_npc(State),
            NewState = NState#state{ts = date:now2(),
                                    timeout = TimeLeft * 1000},
            push_state(idle, NewState),
            continue(idle, NewState);
        _False ->
            logger:error("创建战场准备区失败:~w", [_False], elf_mgr, 414),
            {stop, normal, State}
    end;
notice(_Event, State) -> continue(notice, State).

ready(timeout,
      State = #state{ready_zones = ReadyZones,
                     cross_type = _CrossType}) ->
    Groups = elf_data:groups(),
    [honor_mgr:clear(list_to_atom(lists:concat(["elf_honor_",
                                                G])))
     || G <- Groups],
    logger:info("精灵幻境进入进入战场阶段", [], elf_mgr, 424),
    Now = date:unixtime(),
    RoleList = ets:tab2list(elf_role),
    ReadyZones1 = group_role(RoleList, ReadyZones),
    {ReadyZones7, _FailList} = open_merge(ReadyZones1, []),
    logger:info("精灵幻境准备区：{~ts, ~w}, ~w",
                [env:get(platform), env:get(zone_id), ReadyZones],
                elf_mgr,
                429),
    case create_zone(State, ReadyZones7) of
        {ok, NState = #state{zones = _Zones}} ->
            Timeout = 45 * 60,
            Fmt = lang:get("~ts已经开始啦,大家赶紧冲进幻境里抢夺宝物吧！{face_1, 7}"),
            Msg = notice:format(Fmt,
                                [{string_2, 1, lang:get("精灵幻境")}]),
            notice:cast(all, 8, Msg),
            NewState = NState#state{ts = date:now2(),
                                    timeout = Timeout * 1000,
                                    m_time = Now + Timeout, ready_zones = []},
            close_ready_zone(ReadyZones),
            push_state(fight, NewState),
            continue(fight, NewState);
        {false, Reason} ->
            Msg = Reason,
            logger:info("创建战场失败[~ts]", [Reason], elf_mgr, 447),
            notice:cast(all, 8, Msg),
            [role:apply(async,
                        RPid,
                        {elf_role, apply_leave_zone, [undefined]})
             || #elf_role{pid = RPid, status = 1} <- RoleList],
            IdleTime = get_idle_time(),
            close_ready_zone(ReadyZones),
            push_state(idle, State),
            NState = del_npc(State),
            continue(idle,
                     NState#state{ts = date:now2(),
                                  timeout = IdleTime * 1000, ready_zones = []});
        _Err ->
            logger:error("创建战场错误[Err:~w]", [_Err], elf_mgr, 457),
            [role:apply(async,
                        RPid,
                        {elf_role, apply_leave_zone, [undefined]})
             || #elf_role{pid = RPid, status = 1} <- RoleList],
            IdleTime = get_idle_time(),
            close_ready_zone(ReadyZones),
            push_state(idle, State),
            NState = del_npc(State),
            continue(idle,
                     NState#state{ts = date:now2(),
                                  timeout = IdleTime * 1000, ready_zones = []})
    end;
ready(_Event, State) -> continue(ready, State).

fight(timeout, State = #state{zones = Zones}) ->
    logger:info("战斗阶段结束", [], elf_mgr, 475),
    Now = date:unixtime(),
    Timeout = 30,
    [elf:cast(Pid, end_fight)
     || #elf_zone{pid = Pid} <- Zones],
    NewState = State#state{ts = date:now2(),
                           timeout = Timeout * 1000, m_time = Now + Timeout},
    push_state(reward, NewState),
    Fmt = lang:get("~ts已经圆满结束啦，大家记得下次再来参加哦{face_1,18}"),
    Msg = notice:format(Fmt,
                        [{string_2, 1, lang:get("精灵幻境")}]),
    notice:cast(all, 8, Msg),
    continue(reward, NewState);
fight(_Event, State) -> continue(fight, State).

reward(timeout, State = #state{zones = Zones}) ->
    logger:info("奖励阶段", [], elf_mgr, 493),
    Now = date:unixtime(),
    Timeout = 1,
    [elf:cast(Pid, end_reward)
     || #elf_zone{pid = Pid} <- Zones],
    NewState = State#state{ts = date:now2(),
                           timeout = 1 * 1000, m_time = Now + Timeout},
    push_state(over, NewState),
    continue(over, NewState);
reward(_Event, State) -> continue(reward, State).

over(timeout, State = #state{zones = Zones}) ->
    logger:info("结束阶段", [], elf_mgr, 507),
    [elf:cast(Pid, stop) || #elf_zone{pid = Pid} <- Zones],
    IdleTime = get_idle_time(),
    NState = State#state{ts = date:now2(),
                         timeout = IdleTime * 1000, zones = [],
                         ready_zones = []},
    NState2 = del_npc(NState),
    NewState = case IdleTime of
                   IdleTime when is_integer(IdleTime) ->
                       set_npc(IdleTime, NState2);
                   _ -> NState
               end,
    continue(idle, NewState);
over(_Event, State) -> continue(over, State).

get_idle_time() ->
    case agenda_data:get(2027) of
        #{args := []} ->
            logger:error("错误的日程活动配置[Id:~w][Err:~w]",
                         [2027, "没有配置星期"],
                         elf_mgr,
                         529),
            undefined;
        #{args := Days1} ->
            date:week_next_diff(Days1, 19 * 3600 + 50 * 60);
        _False ->
            logger:error("错误的日程活动配置[Id:~w][Err:~w]",
                         [2027, _False],
                         elf_mgr,
                         534),
            undefined
    end.

set_npc(IdleTime, State) when is_integer(IdleTime) ->
    NState = del_npc(State),
    Now = date:unixtime(),
    Next = Now + IdleTime,
    case date:is_today(Next) of
        false ->
            NpcTime = date:unixtime({zero, Next}),
            Timeout = erlang:max(date:diff(second, NpcTime, Now),
                                 10),
            Timer = #timer{id = create_npc,
                           timeout = Timeout * 1000},
            server_timer:set(Timer),
            NState;
        _ -> npc(NState)
    end;
set_npc(_IdleTime, State) -> State.

tick(idle, create_npc, State) ->
    State1 = del_npc(State),
    {ok, remove, npc(State1)};
tick(Phase, Msg, _State) ->
    logger:error("阶段[Phase:~w]收到未知的定时消息[Msg:~w]",
                 [Phase, Msg],
                 elf_mgr,
                 563),
    remove.

npc(State) ->
    case unit_mgr:fetch_ids(1) of
        {ok, [_Id]} ->
            BattleId = {30, 1},
            case unit_mgr:create(BattleId,
                                 62313,
                                 {10001, 3031, 2313})
                of
                {ok, _} -> State#state{npc_battle_id = BattleId};
                _ -> State
            end;
        _ -> State
    end.

del_npc(State = #state{npc_battle_id = Npc = {_, _}}) ->
    unit_mgr:remove(Npc),
    State#state{npc_battle_id = undefined};
del_npc(State) -> State.

push_state(Pid, notice, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16500, {1, MTime});
push_state(Pid, ready, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16500, {2, MTime});
push_state(Pid, fight, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16500, {3, MTime});
push_state(Pid, reward, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16500, {4, MTime});
push_state(Pid, _StateName, _State) ->
    role:pack_send(Pid, 16500, {0, 0}).

push_state(notice, #state{m_time = MTime}) ->
    role_group:pack_send(world, 16500, {1, MTime});
push_state(ready, #state{m_time = MTime}) ->
    role_group:pack_send(world, 16500, {2, MTime});
push_state(fight, #state{m_time = MTime}) ->
    role_group:pack_send(world, 16500, {3, MTime});
push_state(reward, #state{m_time = MTime}) ->
    role_group:pack_send(world, 16500, {4, MTime});
push_state(_, _) ->
    role_group:pack_send(world, 16500, {0, 0}).

init_ready_zone(State = #state{cross_type =
                                   CrossType}) ->
    Groups = elf_data:groups(),
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    OpenList = elf_data:cross_list({Platform, ZoneId}),
    NOpenList = case CrossType of
                    1 -> merge_list(OpenList, []);
                    _ -> [0]
                end,
    Zones = init_ready_zone_map(Groups,
                                NOpenList,
                                [],
                                State),
    case Zones of
        [_ | _] ->
            Num = length(Zones),
            NewState = State#state{ready_zones = Zones,
                                   ready_zone_num = Num},
            {ok, NewState};
        _False -> {false, "初始化准备区失败"}
    end.

init_ready_zone_map([], _, Zones, _State) ->
    logger:info("创建准备区完成,一共创建了[~w]个准备区",
                [length(Zones)],
                elf_mgr,
                633),
    Zones;
init_ready_zone_map([GroupId | T], OpenList, Zones,
                    State) ->
    AddZones = do_init_ready_zone_map(GroupId,
                                      OpenList,
                                      []),
    init_ready_zone_map(T,
                        OpenList,
                        Zones ++ AddZones,
                        State).

do_init_ready_zone_map(_GroupId, [], Zones) -> Zones;
do_init_ready_zone_map(GroupId, [OpenId | T], Zones) ->
    case create_ready_zone_map(GroupId) of
        {ok, Zone} ->
            do_init_ready_zone_map(GroupId,
                                   T,
                                   [Zone#elf_ready_zone{open_id = OpenId,
                                                        group_key =
                                                            {OpenId, GroupId}}
                                    | Zones]);
        _False -> do_init_ready_zone_map(GroupId, T, Zones)
    end.

create_ready_zone_map() ->
    case map_mgr:create(71005) of
        {ok, MapPid, MapId} ->
            case unit_mgr:fetch_ids(1) of
                {ok, [Id1]} ->
                    BattleId1 = {30, Id1},
                    unit_mgr:create(BattleId1, 62314, {MapId, 2040, 1500}),
                    {ok, #elf_ready_zone{map_pid = MapPid, map_id = MapId}};
                _ -> false
            end;
        _Err ->
            logger:error("创建勇士竞技场准备区失败:~w", [_Err], elf_mgr, 660),
            false
    end.

create_ready_zone_map(GroupId) ->
    case create_ready_zone_map() of
        {ok, Zone} ->
            NewZone = Zone#elf_ready_zone{group_id = GroupId},
            {ok, NewZone};
        _Err -> false
    end.

group_role([], ReadyZones) -> ReadyZones;
group_role([R = #elf_role{group_key = Group} | T],
           ReadyZones) ->
    NewReadyZones = case lists:keyfind(Group,
                                       #elf_ready_zone.group_key,
                                       ReadyZones)
                        of
                        Z = #elf_ready_zone{members = Members} ->
                            NewMembers = [R | Members],
                            NewZ = Z#elf_ready_zone{members = NewMembers},
                            lists:keyreplace(Group,
                                             #elf_ready_zone.group_key,
                                             ReadyZones,
                                             NewZ);
                        _ -> ReadyZones
                    end,
    group_role(T, NewReadyZones).

group_merge([], List, []) -> List;
group_merge([H = #elf_ready_zone{num = Num} | T], List,
            [])
    when Num < 5 ->
    group_merge(T, List, [H]);
group_merge([H = #elf_ready_zone{num = Num} | T], List,
            [])
    when Num < 5 ->
    group_merge(T, List, [H]);
group_merge([H | T], List, []) ->
    group_merge(T, [H | List], []);
group_merge([H = #elf_ready_zone{members = Members}
             | T],
            List, [#elf_ready_zone{members = OMembers}]) ->
    NewMembers = Members ++ OMembers,
    Num = length(NewMembers),
    NH = H#elf_ready_zone{members = NewMembers, num = Num},
    case Num >= 5 of
        true -> group_merge(T, [NH | List], []);
        _ -> group_merge(T, List, [NH])
    end;
group_merge([], List, [H]) -> [H | List].

create_zone(State, []) -> {ok, State};
create_zone(State = #state{id = Id, zones = Zones,
                           cross_type = CrossType},
            [S = #elf_ready_zone{group_id = GroupId,
                                 open_id = OpenId, members = _Members}
             | T]) ->
    case elf:start_link(#{id => Id, group => GroupId,
                          open_id => OpenId, cross_type => CrossType})
        of
        {ok, Pid} ->
            Zone = #elf_zone{id = Id, group = GroupId,
                             open_id = OpenId, pid = Pid,
                             group_key = {OpenId, GroupId}},
            enter_zone(S, Zone),
            create_zone(State#state{zones = [Zone | Zones],
                                    id = Id + 1},
                        T);
        False ->
            logger:error("创建战场失败[Err:~w]", [False], elf_mgr, 720),
            False
    end.

enter_zone(#elf_ready_zone{group_id = Group,
                           members = Members},
           Zone) ->
    enter_zone(Members, Group, Zone).

enter_zone([], _, _Zone) -> ok;
enter_zone([R = #elf_role{pid = Pid, status = 1} | T],
           Group,
           Zone = #elf_zone{pid = ZonePid,
                            group_key = GroupKey}) ->
    update_data(R#elf_role{group = Group,
                           group_key = GroupKey}),
    elf:cast(ZonePid, {enter, Pid}),
    enter_zone(T, Group, Zone);
enter_zone([R | T], Group,
           Zone = #elf_zone{group_key = GroupKey}) ->
    update_data(R#elf_role{group = Group,
                           group_key = GroupKey}),
    enter_zone(T, Group, Zone).

lookup(RoleId) ->
    case ets:lookup(elf_role, RoleId) of
        [R] -> R;
        _ -> false
    end.

update_data(Data) -> ets:insert(elf_role, Data).

close_ready_zone([]) -> ok;
close_ready_zone([#elf_ready_zone{map_pid = MapPid,
                                  map_id = MapId}
                  | T]) ->
    map:stop(MapPid),
    unit_mgr:remove_map_all(MapId),
    close_ready_zone(T).

find_field(_Warrior, []) -> {false, lang:get("没有开启战区")};
find_field(#elf_role{group_key = GroupKey,
                     open_id = OpenId, group = GroupId},
           List) ->
    case lists:keyfind(GroupKey, #elf_zone.group_key, List)
        of
        #elf_zone{flag = 1} -> {false, lang:get("你的战区已经结束")};
        Field = #elf_zone{} -> {ok, Field};
        _ ->
            Order = elf_data:group_order(GroupId),
            Orders = elf_data:orders(),
            MaxOrder = lists:max(Orders),
            MinOrder = lists:min(Orders),
            do_find_field(Order,
                          true,
                          #{max => MaxOrder, min => MinOrder,
                            open_id => OpenId},
                          List)
    end.

do_find_field(Order, true, Info = #{max := Order},
              List) ->
    do_find_field(Order - 1, down, Info, List);
do_find_field(Order, true, Info = #{min := Order},
              List) ->
    do_find_field(Order + 1, up, Info, List);
do_find_field(Order, true, Info, List) ->
    do_find_field(Order - 1, down, Info, List);
do_find_field(Order, _Flag = down,
              Info = #{min := Order}, List) ->
    case do_find_field2(Order, Info, List) of
        false -> do_find_field(Order + 1, up, Info, List);
        Result -> Result
    end;
do_find_field(Order, _Flag = up, _Info = #{max := Max},
              _List)
    when Order > Max ->
    {false, lang:get("没有找到合适你的战区")};
do_find_field(Order, _Flag = up, Info = #{max := Order},
              List) ->
    case do_find_field2(Order, Info, List) of
        false -> {false, lang:get("没有找到合适你的战区")};
        Result -> Result
    end;
do_find_field(Order, Flag = up, Info, List) ->
    case do_find_field2(Order, Info, List) of
        false -> do_find_field(Order + 1, Flag, Info, List);
        Result -> Result
    end;
do_find_field(Order, Flag = down, Info, List) ->
    case do_find_field2(Order, Info, List) of
        false -> do_find_field(Order - 1, Flag, Info, List);
        Result -> Result
    end.

do_find_field2(Order, #{open_id := OpenId}, List) ->
    Group = elf_data:order_group(Order),
    case lists:keyfind({OpenId, Group},
                       #elf_zone.group_key,
                       List)
        of
        #elf_zone{flag = 1} -> {false, lang:get("你被合并的战区已经结束")};
        Field = #elf_zone{} -> {ok, Field};
        _ -> false
    end.

check_open_mode(_IsCross = 1) -> 1;
check_open_mode(_) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    case elf_data:get_cross({Platform, ZoneId}) of
        false -> 0;
        _ -> 1
    end.

merge_list([], List) -> List;
merge_list([{_, Id} | T], List) ->
    merge_list(T, (List -- [Id]) ++ [Id]).

open_merge([], List) ->
    List2 = open_merge2(List, []),
    open_merge3(List2, [], []);
open_merge([Z = #elf_ready_zone{open_id = OpenId} | T],
           List) ->
    case lists:keyfind(OpenId, 1, List) of
        {_, OList} ->
            open_merge(T,
                       lists:keyreplace(OpenId,
                                        1,
                                        List,
                                        {OpenId, [Z | OList]}));
        _ -> open_merge(T, [{OpenId, [Z]} | List])
    end.

open_merge2([], List) -> List;
open_merge2([{OpenId, ReadyZones1} | T], List) ->
    ReadyZones3 = lists:keysort(#elf_ready_zone.group_id,
                                ReadyZones1),
    ReadyZones4 = group_merge(ReadyZones3, [], []),
    ReadyZones5 = lists:keysort(#elf_ready_zone.group_id,
                                ReadyZones4),
    ReadyZones6 = lists:reverse(ReadyZones5),
    ReadyZones7 = group_merge(ReadyZones6, [], []),
    open_merge2(T, [{OpenId, ReadyZones7} | List]).

open_merge3([], List, FailList) -> {List, FailList};
open_merge3([{_OpenId, AddList} | T], List, FailList) ->
    open_merge3(T, List ++ AddList, FailList).

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

