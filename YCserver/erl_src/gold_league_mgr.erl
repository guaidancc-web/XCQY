-file("src/mod/gold_league/gold_league_mgr.erl", 1).

-module(gold_league_mgr).

-behaviour(gen_fsm).

-export([start_link/1,
         cast/1,
         call/1,
         cast/2,
         call/2,
         info/1,
         sign/1,
         login/1,
         logout/1,
         exit_gold_league/1,
         exit_map/1,
         ready_reward/1,
         reply_notice/3,
         apply_enter_ready_zone/4,
         apply_exit_ready_zone/2,
         reload_idle_time/0,
         switch/1,
         can_team/1,
         update_role/2,
         delete_role/2,
         find_role/1,
         find_field/2,
         update_16_role/2,
         update_field/1,
         update_combat/1,
         del_combat/1,
         update_state/1,
         broadcast/1,
         broadcast/2,
         broadcast_phase/2,
         rank_notice_timer/1,
         get_world_lev/1,
         phase_enum/1,
         merge_combat_list/2,
         do_send_back/1,
         get_sign_status/1,
         send_barrage/2,
         do_send_barrage/3,
         sign_or_enter/1,
         reload/0,
         m/0]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4,
         format_status/2]).

-export([idle/2,
         early/2,
         notice/2,
         ready/2,
         enter/2,
         fight/2,
         fight_out/2,
         exit/2]).

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

-file("src/mod/gold_league/gold_league_mgr.erl", 77).

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

-file("src/mod/gold_league/gold_league_mgr.erl", 78).

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

-file("src/mod/gold_league/gold_league_mgr.erl", 79).

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

-file("src/mod/gold_league/gold_league_mgr.erl", 80).

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

-file("src/mod/gold_league/gold_league_mgr.erl", 81).

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

-file("src/mod/gold_league/gold_league_mgr.erl", 82).

-file("inc/honor.hrl", 1).

-record(m_honor,
        {ver = 3,
         use_id = 0,
         last_id = 0,
         r_list = [] :: list(),
         pre_id = 0,
         r_pre_list = [] :: list(),
         pre_reward_list = [] :: list()}).

-record(honor,
        {id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(pre_honor,
        {pre_id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_info,
        {key :: undefined | atom(),
         list = [] :: list(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         mode_type = 0 :: non_neg_integer(),
         show_type = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         is_cast = 0,
         sex = 2 :: non_neg_integer(),
         attr_list = [] :: list(),
         is_can_pre = 0 :: non_neg_integer(),
         collect_val = 0 :: non_neg_integer(),
         color = 12 :: non_neg_integer()}).

-record(pre_honor_base,
        {pre_id = 0 :: non_neg_integer(),
         pre_name = "" :: list(),
         is_cast = 0,
         items = [] :: list(),
         loss_items = [] :: list()}).

-file("src/mod/gold_league/gold_league_mgr.erl", 83).

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

-file("src/mod/gold_league/gold_league_mgr.erl", 84).

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

-file("src/mod/gold_league/gold_league_mgr.erl", 85).

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

-file("src/mod/gold_league/gold_league_mgr.erl", 86).

-file("inc/gold_league.hrl", 1).

-record(gold_league_ready_zone,
        {cross_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_zone = 0,
         map_plat = "",
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc,
         combat_mode = 0,
         init_combat_mode = 0}).

-record(gold_league_zone,
        {cross_id = 0,
         id = 0,
         key,
         group_id = 0 :: pos_integer(),
         seq_id = 0,
         pid,
         is_close = 0}).

-record(gold_league_field,
        {id = 0 :: non_neg_integer(),
         key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         seq_id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         map_id = 0,
         map_pid,
         map_plat = "",
         map_zone = 0,
         phase = 0,
         end_time = 0,
         combat_mode = 0,
         now_round = 0,
         max_round = 0}).

-record(gold_league_state,
        {key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         state_name,
         phase = 0,
         end_time = 0,
         now_round = 0,
         max_round = 0,
         ids = []}).

-record(gold_league_zone_role,
        {id,
         pid,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         group_id = 0 :: pos_integer(),
         field_id = 0,
         status = 0,
         is_combat = 0,
         combat_pid,
         last_combat_over_time = 0,
         rival_id = undefined,
         rival_pid = undefined,
         rival_name = "",
         ref = undefined,
         win_count = 0,
         combat_count = 0,
         score = 0,
         cross_id = 0,
         match = 0,
         pos = 0,
         match_num = 0,
         match_group_id = 0,
         is_lose = 0,
         lose_round = 0,
         rank = 0,
         is_out = 0,
         is_result = 0}).

-record(gold_league,
        {id ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: pid() | undefined,
         name = "" :: string(),
         sex = 0,
         classes = 0,
         face_id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         group_id = 0 :: pos_integer(),
         match = 0 :: pos_integer(),
         combat_count = 0 :: pos_integer(),
         win = 0,
         lose = 0,
         rival_id = {0, "", 0} :: tuple(),
         multi_kill = 0 :: non_neg_integer(),
         win_count = 0,
         score = 0 :: non_neg_integer(),
         rank = 0 :: pos_integer(),
         ready_map_id = 0 :: non_neg_integer(),
         ready_map_pid :: pid() | undefined,
         ready_map_plat = "",
         ready_map_zone = 0,
         seq_id = 0 :: non_neg_integer(),
         field_id = 0 :: non_neg_integer(),
         field_map_id = 0 :: non_neg_integer(),
         field_map_plat = "",
         field_map_zone = 0,
         field_pid :: pid() | undefined,
         field_time = 0,
         reward = [] :: list(),
         status = 0,
         cross_id = 0,
         ref = undefined,
         match_time = 0,
         combat_time = 0,
         camp = 0,
         is_combat = 0,
         combat_mode = 0,
         is_rise = 0,
         pos = 0,
         is_lose = 0,
         lose_round = 0}).

-record(gold_league_group_data,
        {id = 0, name = "", order = 0, members = [], ids = []}).

-record(gold_league_drop_item_data,
        {base_id = 0,
         weight = 0,
         result = 0,
         is_notice = 0,
         num = 0}).

-record(gold_league_combat,
        {pid,
         field_id = 0,
         field_key,
         type = 1,
         ref,
         first_id = {0, "", 0},
         first_name = "",
         first_classes = 0,
         first_sex = 0,
         first_lev = 0,
         second_id = {0, "", 0},
         second_name = "",
         second_classes = 0,
         second_lev = 0,
         second_sex = 0,
         cross_id = 0,
         group_id = 0,
         ids = []}).

-record(gold_league_timer_data,
        {id = 0,
         phase = 0,
         type = 0,
         spec_id = 0,
         buff_id = 0,
         start = 0,
         interval = 0,
         finished = 0,
         num = 0,
         max = 0}).

-record(gold_league_combat_result,
        {field_pid, round = 0}).

-record(gold_league_combat_win,
        {field_pid,
         score = 0,
         round = 0,
         now_round = 0,
         max_round = 0,
         state_name = fight,
         is_lose = 0,
         id,
         name = "",
         time = 0,
         group_id = 0}).

-record(gold_league_combat_lose,
        {field_pid,
         score = 0,
         round = 0,
         now_round = 0,
         max_round = 0,
         state_name = fight,
         is_lose = 0,
         id,
         name = "",
         time = 0,
         group_id = 0}).

-record(gold_league_rank_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         items = [],
         title = "",
         content = ""}).

-record(gold_league_16,
        {cross_id = 0,
         group_id = 0,
         key = {0, 0},
         members = []}).

-record(gold_league_guess,
        {id = 0, name = "", num = 0, amount = 0, members = []}).

-record(gold_league_guess_role,
        {id = 0, members = [], group_id = 0, cross_id = 0}).

-record(gold_league_combat_record,
        {id = 0,
         first_id = {0, "", 0},
         second_id = {0, "", 0}}).

-file("src/mod/gold_league/gold_league_mgr.erl", 87).

-file("inc/looks.hrl", 1).

-file("src/mod/gold_league/gold_league_mgr.erl", 88).

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

-file("src/mod/gold_league/gold_league_mgr.erl", 89).

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

-file("src/mod/gold_league/gold_league_mgr.erl", 90).

-file("inc/guard.hrl", 1).

-record(m_guard,
        {ver = 1 :: pos_integer(),
         free_war_ids = [] :: [pos_integer()],
         tactics_fields = [] :: list(),
         tactics_attr = [] :: list(),
         guards = [] :: list()}).

-record(guard_eqm,
        {ver = 5,
         base_id :: undefined | non_neg_integer(),
         type :: undefined | non_neg_integer(),
         lev,
         eqm_attrs = [] :: list(),
         reset_base_id = 0,
         reset_attrs = [] :: list(),
         gem = [] :: list(),
         is_init = 1,
         timeout = 0,
         back_effect_timeout = 0,
         back_effect_attr = []}).

-record(guard_astroid,
        {ver = 2 :: non_neg_integer(),
         aroused = [] :: non_neg_integer(),
         skills = [] :: list(),
         attrs = [] :: list(),
         growth = 0 :: non_neg_integer(),
         active = 0 :: non_neg_integer()}).

-record(guard_astroid_star,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         attrs = [] :: list()}).

-record(guard,
        {ver = 2,
         base_id = 0 :: non_neg_integer(),
         war_id = 0 :: non_neg_integer(),
         name = "" :: string(),
         alias = "" :: string(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         tac_pos = 0 :: non_neg_integer(),
         skills = [] :: list(),
         eqm = [] :: list(),
         attr :: undefined | tuple(),
         score = 0 :: non_neg_integer(),
         astroid = #guard_astroid{} :: #guard_astroid{}}).

-record(guard_data,
        {base_id = 0 :: non_neg_integer(),
         name = "" :: binary(),
         alias = "" :: binary(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss = [] :: tuple(),
         recruit_lev = 1 :: non_neg_integer(),
         desc = "" :: list(),
         normal_atk_id = 0 :: integer(),
         ai_id = 0 :: integer(),
         base_score = 0,
         growth = 0 :: non_neg_integer()}).

-record(guard_eqm_data,
        {base_id = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss_coin = 0 :: [tuple()],
         reset_coin = 0 :: [tuple()],
         gem_list = [] :: list()}).

-record(guard_lev_data,
        {base_id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         lev_up_exp :: undefined | non_neg_integer(),
         attrs = [] :: non_neg_integer()}).

-record(guard_eqm_gem,
        {id = 0, base_id = 0, type = 0, lev = 0}).

-record(guard_eqm_gem_data,
        {base_id = 0,
         next_base_id = 0,
         name = "",
         lev = 0,
         type = 0,
         need_lev = 0,
         loss_coin = [],
         attrs = []}).

-file("src/mod/gold_league/gold_league_mgr.erl", 91).

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

-file("src/mod/gold_league/gold_league_mgr.erl", 92).

-record(state,
        {switch = open,
         ts,
         timeout,
         ready_zones = [],
         timer_ready_reward,
         npc_battle_id,
         fields = [],
         cancel_cross_id = [],
         start_time = 0,
         end_time = 0,
         open_mode = 1,
         cross_id = 0,
         is_cross = 0,
         combat_mode = []}).

m() -> gen_fsm:send_event(gold_league_mgr, timeout).

switch(close) -> cast({switch, close});
switch(open) -> cast({switch, open});
switch(_) -> ok.

can_team(#role{s_event = 52}) ->
    {false, lang:get("钻石联赛准备中，不能进行此操作")};
can_team(#role{s_event = 54}) ->
    {false, lang:get("钻石联赛中，不能进行此操作")};
can_team(_Role) -> true.

cast(Event) ->
    gen_fsm:send_all_state_event(gold_league_mgr, Event).

cast(To, Event) ->
    gen_fsm:send_all_state_event(To, Event).

call(Msg) ->
    case catch
             gen_fsm:sync_send_all_state_event(gold_league_mgr,
                                               Msg,
                                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

call(To, Msg) ->
    case catch gen_fsm:sync_send_all_state_event(To,
                                                 Msg,
                                                 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Msg) -> gold_league_mgr ! Msg.

login(Role = #role{s_event = 52, pos = Pos}) ->
    logger:debug("钻石联赛进行中  重登游戏", [], gold_league_mgr, 197),
    {LMapId, Lx, Ly} = util:rand_list([{10001, 306, 3507},
                                       {10001, 2583, 3848},
                                       {10001, 4957, 3680},
                                       {10001, 445, 2565},
                                       {10001, 4646, 704},
                                       {10001, 841, 1033},
                                       {10001, 2098, 1834},
                                       {10001, 3617, 1816}]),
    NewPos = Pos#pos{map = LMapId, x = Lx, y = Ly},
    NewRole = Role#role{pos = NewPos, s_event = 0,
                        s_event_pid = undefined, s_action = 0},
    {ok, NewRole};
login(Role = #role{s_event = Event, id = Rid,
                   pid = Pid})
    when Event =:= 54 orelse
             Event =:= 55 orelse Event =:= 53 ->
    logger:debug("钻石联赛进行中  重登游戏", [], gold_league_mgr, 203),
    case gold_league_mgr:find_role(Rid) of
        {true, #gold_league{field_pid = FPid}}
            when is_pid(FPid) ->
            case call(FPid, {login, Rid, Pid}) of
                {ok, Phase, #gold_league{field_pid = FPid}}
                    when Phase =:= fight orelse
                             Phase =:= fight_out orelse Phase =:= fight_guess ->
                    NewRole = Role#role{s_event_pid = FPid},
                    logger:debug("钻石联赛进行中  正常重登游戏",
                                 [],
                                 gold_league_mgr,
                                 210),
                    {ok, NewRole};
                _R ->
                    logger:debug("钻石联赛进行中  重登游戏", [], gold_league_mgr, 213),
                    logger:debug("============================= ~w",
                                 [_R],
                                 gold_league_mgr,
                                 214),
                    exit_field(Role)
            end;
        _R ->
            logger:debug("钻石联赛重登游戏  找不到数据 ~w",
                         [_R],
                         gold_league_mgr,
                         218),
            exit_field(Role)
    end;
login(_Role) ->
    logger:debug("钻石联赛进行中  重登游戏 ~w",
                 [_Role#role.s_event],
                 gold_league_mgr,
                 222),
    ok.

exit_field(Role = #role{id = RoleId, pos = Pos}) ->
    case gold_league_mgr:find_role(RoleId) of
        {true, #gold_league{field_pid = FPid}}
            when is_pid(FPid) ->
            cast(FPid, {exit, leave, RoleId});
        _ -> ok
    end,
    BuffRole = gold_league_api:clean_drug(Role),
    {LMapId, Lx, Ly} = util:rand_list([{10001, 306, 3507},
                                       {10001, 2583, 3848},
                                       {10001, 4957, 3680},
                                       {10001, 445, 2565},
                                       {10001, 4646, 704},
                                       {10001, 841, 1033},
                                       {10001, 2098, 1834},
                                       {10001, 3617, 1816}]),
    NewPos = Pos#pos{map = LMapId, x = Lx, y = Ly},
    EventRole = BuffRole#role{s_event = 0,
                              s_event_pid = undefined, s_action = 0,
                              pos = NewPos},
    NewRole = EventRole,
    {ok, NewRole};
exit_field(_Role) -> ok.

logout(Role = #role{name = _Name, s_event = 54,
                    id = Rid}) ->
    logger:info("钻石联赛进行中 玩家[~ts] 在战斗时退出了游戏~w",
                [_Name, 54],
                gold_league_mgr,
                242),
    case gold_league_mgr:find_role(Rid) of
        {true, GoldLeague = #gold_league{}} ->
            gold_league:logout_field(GoldLeague, Role);
        _ -> {ok, Role#role{s_event_pid = undefined}}
    end;
logout(#role{name = _Name, s_event = 52, id = Rid,
             cross_type = CrossType}) ->
    logger:info("钻石联赛进行中 玩家[~ts] 在准备厅地推时退出了游戏~w",
                [_Name, 52],
                gold_league_mgr,
                249),
    case CrossType of
        0 -> cast({cancel_sign, Rid});
        _ ->
            cross:cast(gold_league_mgr, cast, [{cancel_sign, Rid}])
    end,
    ok;
logout(#role{name = _Name, s_event = 53, id = Rid,
             cross_type = CrossType}) ->
    logger:info("钻石联赛进行中 玩家[~ts] 在1v1地图时退出了游戏~w",
                [_Name, 53],
                gold_league_mgr,
                256),
    case CrossType of
        0 -> cast({cancel_sign, Rid});
        _ ->
            cross:cast(gold_league_mgr, cast, [{cancel_sign, Rid}])
    end,
    ok;
logout(_) ->
    logger:debug("钻石联赛进行中  重登游戏", [], gold_league_mgr, 263),
    ok.

sign_or_enter(#role{lev = Lev}) when Lev < 50 ->
    Fmt = lang:get("~ts级才能参加钻石联赛， 升级吧~ts~ts~ts"),
    Args = [{string_1, 50},
            {face_1, 18},
            {face_1, 18},
            {face_1, 18}],
    {false, notice:format(Fmt, Args)};
sign_or_enter(Role = #role{pid = Pid, id = RoleId}) ->
    CrossId = gold_league_api:get_cross_id(),
    Result = case CrossId of
                 0 -> call(get_state);
                 _ -> cross:call(gold_league_mgr, call, [get_state])
             end,
    case Result of
        {ok, StateName}
            when StateName =:= early orelse StateName =:= notice ->
            SignList1 = case env:get(gold_league_sign) of
                            SignList when is_list(SignList) -> SignList;
                            _ -> []
                        end,
            case lists:member(RoleId, SignList1) of
                true -> {false, lang:get("已报名,无需重复报名")};
                _ ->
                    Loss = format:val_to_loss([{90003, 5000}]),
                    case role_gain:do_notice(Loss, Role) of
                        {ok, LossRole} ->
                            env:save(gold_league_sign,
                                     [RoleId | lists:delete(RoleId,
                                                            SignList1)]),
                            role:pack_send(Pid, 20024, {1}),
                            {ok, LossRole};
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end
            end;
        {ok, ready} -> sign(Role);
        _R ->
            logger:debug("================= ~w",
                         [_R],
                         gold_league_mgr,
                         300),
            {false, lang:get("当前时间不能报名")}
    end.

-spec sign(#role{}) -> {false, string()} |
                       {ok, #role{}}.

sign(#role{lev = Lev}) when Lev < 50 ->
    Fmt = lang:get("~ts级才能参加钻石联赛， 升级吧~ts~ts~ts"),
    Args = [{string_1, 50},
            {face_1, 18},
            {face_1, 18},
            {face_1, 18}],
    {false, notice:format(Fmt, Args)};
sign(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("你当前正在队伍中，不能参加")};
sign(#role{s_event = 1}) ->
    {false, lang:get("你当前正在副本中，不能参加")};
sign(#role{s_event = 52}) ->
    {false, lang:get("不能重复进入")};
sign(#role{s_event = 54}) ->
    {false, lang:get("已在钻石联赛的正式区，无需报名")};
sign(#role{s_event = 53}) ->
    {false, lang:get("已在钻石联赛的正式区，无需报名")};
sign(#role{cross_type = 1}) ->
    {false, lang:get("跨服状态不能参与")};
sign(Role = #role{id = RoleId, s_event = Event,
                  pid = Pid})
    when Event =:= 0 orelse Event =:= 2 ->
    case role_convert:to(gold_league, Role) of
        {ok, GoldLeague} ->
            CrossId = gold_league_api:get_cross_id(),
            NewGoldLeague = GoldLeague#gold_league{cross_id =
                                                       CrossId},
            SignList1 = case env:get(gold_league_sign) of
                            SignList when is_list(SignList) -> SignList;
                            _ -> []
                        end,
            Loss = case lists:member(RoleId, SignList1) of
                       true -> [];
                       _ -> format:val_to_loss([{90003, 5000}])
                   end,
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    Result = case CrossId =/= 0 of
                                 true ->
                                     cross:call(gold_league_mgr,
                                                call,
                                                [{enter, NewGoldLeague}]);
                                 false -> call({enter, NewGoldLeague})
                             end,
                    case Result of
                        ok ->
                            env:save(gold_league_sign,
                                     [RoleId | lists:delete(RoleId,
                                                            SignList1)]),
                            role:pack_send(Pid, 20024, {1}),
                            {ok, LossRole};
                        {false, Msg} -> {false, Msg};
                        _R ->
                            logger:debug("=== ~w", [_R], gold_league_mgr, 349),
                            {false, lang:get("系统繁忙")}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("报名失败")}
    end;
sign(_Role) -> {false, lang:get("不能进入")}.

-spec exit_gold_league(#role{}) -> ok |
                                   {false, bitstring()}.

exit_gold_league(Role = #role{id = RoleId, s_event = 52,
                              cross_type = CrossType}) ->
    case exit_map(Role#role{s_event = 0}) of
        {ok, NewRole} ->
            case CrossType of
                0 -> cast({cancel_sign, RoleId});
                _ ->
                    cross:cast(gold_league_mgr,
                               cast,
                               [{cancel_sign, RoleId}])
            end,
            {ok, NewRole};
        _ -> {false, lang:get("取消报名失败")}
    end;
exit_gold_league(#role{s_event = 54,
                       m_combat = #m_combat{pid = CombatPid}})
    when is_pid(CombatPid) ->
    {false, lang:get("当前正在战斗中，请在战斗结束后退出")};
exit_gold_league(Role = #role{s_event = 54}) ->
    gold_league:exit_gold_league_field(Role);
exit_gold_league(#role{s_event = 55,
                       m_combat = #m_combat{pid = CombatPid}})
    when is_pid(CombatPid) ->
    {false, lang:get("当前正在战斗中，请在战斗结束后退出")};
exit_gold_league(Role = #role{s_event = 55}) ->
    gold_league:exit_gold_league_field(Role);
exit_gold_league(Role = #role{s_event = 53}) ->
    gold_league:exit_gold_league_field(Role);
exit_gold_league(_Role) ->
    {false, lang:get("未参加钻石联赛，无需退出")}.

apply_exit_ready_zone(Role = #role{s_event = 52},
                      cancel) ->
    Title = lang:get("钻石联赛"),
    Content =
        lang:get("由于参加人数不足<color='#ffff00'>32人</color>，本次钻石联赛活动"
                 "暂不开启"),
    mail:send(Role, Title, Content, [{90003, 5000}]),
    exit_map(Role#role{s_event = 0});
apply_exit_ready_zone(Role, logout) ->
    ExitRole = Role#role{s_event = 0,
                         s_event_pid = undefined},
    case exit_map(ExitRole) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> ok
    end;
apply_exit_ready_zone(_Role, _Label) -> ok.

exit_map(Role = #role{name = Name,
                      cross_type = CrossType}) ->
    ExitPos = util:rand_list([{10001, 306, 3507},
                              {10001, 2583, 3848},
                              {10001, 4957, 3680},
                              {10001, 445, 2565},
                              {10001, 4646, 704},
                              {10001, 841, 1033},
                              {10001, 2098, 1834},
                              {10001, 3617, 1816}]),
    case map:role_enter(ExitPos, Role#role{cross_type = 0})
        of
        {ok, NRole} ->
            role_misc:push_cross(NRole),
            case CrossType of
                0 -> skip;
                _ ->
                    cross:cast(role_group,
                               leave,
                               [center_world, NRole#role.pid])
            end,
            {ok, NRole};
        _Err ->
            NewExitPos = util:rand_list([{10001, 306, 3507},
                                         {10001, 2583, 3848},
                                         {10001, 4957, 3680},
                                         {10001, 445, 2565},
                                         {10001, 4646, 704},
                                         {10001, 841, 1033},
                                         {10001, 2098, 1834},
                                         {10001, 3617, 1816}]),
            case map:role_enter(NewExitPos,
                                Role#role{cross_type = 0})
                of
                {ok, NRole} ->
                    role_misc:push_cross(NRole),
                    case CrossType of
                        0 -> skip;
                        _ ->
                            cross:cast(role_group,
                                       leave,
                                       [center_world, NRole#role.pid])
                    end,
                    {ok, NRole};
                _NewErr ->
                    logger:error("角色[~ts]退出钻石联赛地图失败:~w",
                                 [Name, _NewErr],
                                 gold_league_mgr,
                                 424),
                    ok
            end
    end.

ready_reward(Role = #role{lev = Lev}) ->
    case gold_league_data:ready_reward() of
        {ModId, ExpRatio, PetExpRatio, CoinRatio} ->
            Reward = case levup_data:get_exp({ModId, Lev}) of
                         #{exp := Exp, coin := Coin, pet_exp := PetExp} ->
                             [{90010, round(Exp * ExpRatio / 1000)},
                              {90005, round(PetExp * PetExpRatio / 1000)},
                              {90000, round(Coin * CoinRatio / 1000)}];
                         _ -> []
                     end,
            Gain = format:val_to_gain(Reward),
            case role_gain:do_notice(Gain, Role) of
                Rtn = {ok, _} -> Rtn;
                _False -> ok
            end;
        _ -> ok
    end.

get_sign_status(#role{pid = Pid, id = Id}) ->
    SignList1 = case env:get(gold_league_sign) of
                    SignList when is_list(SignList) -> SignList;
                    _ -> []
                end,
    Status = case lists:member(Id, SignList1) of
                 true -> 1;
                 _ -> 0
             end,
    role:pack_send(Pid, 20024, {Status}),
    ok.

send_barrage(Role, Msg) ->
    GroupId = gold_league_api:get_group_id(Role),
    CrossId = gold_league_api:get_cross_id(),
    logger:debug("发送弹幕 ~w",
                 [{GroupId, CrossId}],
                 gold_league_mgr,
                 468),
    case CrossId of
        0 -> do_send_barrage(CrossId, GroupId, Msg);
        _ ->
            cross:cast(gold_league_mgr,
                       do_send_barrage,
                       [CrossId, GroupId, Msg])
    end.

do_send_barrage(CrossId, GroupId, Msg) ->
    Ids = case ets:lookup(gold_league_state, {0, 0}) of
              [#gold_league_state{state_name = StateName}]
                  when StateName =:= idle orelse
                           StateName =:= ready orelse
                               StateName =:= notice orelse StateName =:= exit ->
                  [1, 2, 3, 4];
              _ ->
                  MatchSpec = [{#gold_league_state{cross_id = '$1',
                                                   _ = '_'},
                                [{'=:=', {const, CrossId}, '$1'}],
                                ['$_']}],
                  case ets:select(gold_league_state, MatchSpec) of
                      List when is_list(List) ->
                          Fun = fun (#gold_league_state{ids = ElemIds}, Acc) ->
                                        logger:debug("================= ~w ~w",
                                                     [length(List), ElemIds],
                                                     gold_league_mgr,
                                                     486),
                                        case lists:member(GroupId, ElemIds) of
                                            true -> ElemIds;
                                            _ -> Acc
                                        end
                                end,
                          lists:foldl(Fun, [], List);
                      _ -> []
                  end
          end,
    logger:debug("弹幕所有可接受组别 ~w ~w",
                 [Ids, GroupId],
                 gold_league_mgr,
                 497),
    case CrossId of
        0 -> role_group:pack_send(world, 20014, {1, Msg, Ids});
        _ ->
            gold_league_utils:run_mfa({cross_id, CrossId},
                                      role_group,
                                      pack_send,
                                      [world, 20014, {1, Msg, Ids}])
    end.

get_enter_pos(2, {MapPlat, MapZoneId, MapId}) ->
    {X, Y} = util:rand_list([{3470, 1401},
                             {1102, 1487},
                             {866, 777},
                             {3276, 759},
                             {3200, 1966},
                             {886, 1949},
                             {2047, 1871},
                             {2056, 869},
                             {1533, 1286},
                             {2536, 1302},
                             {2530, 1789},
                             {1559, 1788}]),
    {1, {MapPlat, MapZoneId, MapId, X, Y}};
get_enter_pos(_, {_, _, MapId}) ->
    {X, Y} = util:rand_list([{3470, 1401},
                             {1102, 1487},
                             {866, 777},
                             {3276, 759},
                             {3200, 1966},
                             {886, 1949},
                             {2047, 1871},
                             {2056, 869},
                             {1533, 1286},
                             {2536, 1302},
                             {2530, 1789},
                             {1559, 1788}]),
    {0, {MapId, X, Y}}.

reload_idle_time() ->
    gold_league_mgr ! reload_idle_time.

start_link(Mod) ->
    gen_fsm:start_link({local, gold_league_mgr},
                       gold_league_mgr,
                       [Mod],
                       []).

check_open_mode(_IsCross = 1) -> 2;
check_open_mode(_) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    DataList = gold_league_data:get_all_cross_list(),
    case lists:keymember({Platform, ZoneId}, 1, DataList) of
        true -> 3;
        _ -> 1
    end.

reload() -> cast({reload}).

init([Mod]) ->
    logger:info("[~w] 正在启动...",
                [gold_league_mgr],
                gold_league_mgr,
                539),
    process_flag(trap_exit, true),
    IsCross = case Mod of
                  center -> 1;
                  _ -> 0
              end,
    init_cache(),
    {StateName, IdleTime} = get_idle_time(IsCross),
    case {StateName, IdleTime} of
        {early, Time} ->
            update_state(#gold_league_state{key = {0, 0},
                                            cross_id = 0, group_id = 0,
                                            state_name = early,
                                            end_time =
                                                date:unixtime() + Time +
                                                    20 * 60,
                                            phase =
                                                gold_league_mgr:phase_enum(early)});
        Else -> Else
    end,
    OpenMode = check_open_mode(IsCross),
    State = #state{ts = erlang:now(), timeout = IdleTime,
                   is_cross = IsCross, open_mode = OpenMode},
    logger:info("钻石联赛状态 ~w 钻石联赛下次开启时间:~w",
                [StateName, IdleTime],
                gold_league_mgr,
                554),
    {Timeout, NewState} = case IdleTime of
                              undefined -> {infinity, State};
                              _ ->
                                  NpcState = set_npc(IsCross, IdleTime, State),
                                  {IdleTime * 1000, NpcState}
                          end,
    Ref = erlang:send_after(date:next_diff(0, 0, 30) * 1000,
                            self(),
                            reset),
    put(zero_reset_time, Ref),
    logger:info("[~w] 启动完成...",
                [gold_league_mgr],
                gold_league_mgr,
                565),
    {ok, StateName, NewState, Timeout}.

idle(timeout, State = #state{switch = close}) ->
    logger:info("空闲阶段处于close状态，无需开启",
                [],
                gold_league_mgr,
                570),
    {next_state, idle, State};
idle(timeout, State = #state{open_mode = 3}) ->
    Timeout = max(0, 19 * 3600 + 45 * 60 - 10 * 3600),
    logger:info("钻石联赛-本服跨服进入提前预告阶段 ~w",
                [Timeout],
                gold_league_mgr,
                574),
    Now = date:unixtime(),
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout, fields = [], start_time = Now},
    update_state(#gold_league_state{key = {0, 0},
                                    cross_id = 0, group_id = 0,
                                    state_name = early,
                                    end_time =
                                        date:unixtime() + Timeout + 20 * 60,
                                    phase = gold_league_mgr:phase_enum(early)}),
    continue(early, NewState);
idle(timeout, State = #state{}) ->
    Timeout = max(0, 19 * 3600 + 45 * 60 - 10 * 3600),
    logger:info("钻石联赛-本服跨服进入提前预告阶段 ~w",
                [Timeout],
                gold_league_mgr,
                582),
    Now = date:unixtime(),
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout, fields = [], start_time = Now},
    update_state(#gold_league_state{key = {0, 0},
                                    cross_id = 0, group_id = 0,
                                    state_name = early,
                                    end_time =
                                        date:unixtime() + Timeout + 20 * 60,
                                    phase = gold_league_mgr:phase_enum(early)}),
    continue(early, NewState);
idle(_Event, State) -> continue(idle, State).

early(timeout, State = #state{switch = close}) ->
    logger:info("空闲阶段处于close状态，无需开启",
                [],
                gold_league_mgr,
                593),
    {next_state, idle, State};
early(timeout, State = #state{open_mode = 3}) ->
    logger:info("钻石联赛-本服跨服进入进入准备区阶段",
                [],
                gold_league_mgr,
                596),
    clean_cache(),
    Timeout = 20 * 60,
    Ref = undefined,
    Now = date:unixtime(),
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout, timer_ready_reward = Ref,
                           start_time = Now},
    update_state(#gold_league_state{key = {0, 0},
                                    cross_id = 0, group_id = 0,
                                    state_name = ready,
                                    end_time = date:unixtime() + 20 * 60,
                                    phase = gold_league_mgr:phase_enum(ready)}),
    continue(ready, NewState);
early(timeout,
      State = #state{open_mode = OpenMode,
                     is_cross = IsCross}) ->
    logger:info("钻石联赛[~w]进入准备阶段",
                [OpenMode],
                gold_league_mgr,
                606),
    clean_cache(),
    Now = date:unixtime(),
    logger:debug("钻石联赛是否跨服 ~w",
                 [IsCross],
                 gold_league_mgr,
                 609),
    case init_ready_zone(State) of
        {ok, ReadyState} ->
            Timeout = 20 * 60,
            Fmt = lang:get("~ts已开启准备区，进入准备区可定时获得经验奖励{face_1, 7}"),
            Args = [{string_2, 1, lang:get("钻石联赛")}],
            Msg = notice:format(Fmt, Args),
            ready_notice_timer(),
            Ref = erlang:send_after(60 * 1000,
                                    self(),
                                    ready_reward),
            gold_league_utils:run_mfa(OpenMode,
                                      gold_league_mgr,
                                      broadcast,
                                      [8, Msg]),
            gold_league_utils:run_mfa(OpenMode,
                                      gold_league_mgr,
                                      broadcast_phase,
                                      [ready, Timeout]),
            NewState = ReadyState#state{ts = erlang:now(),
                                        timeout = Timeout,
                                        timer_ready_reward = Ref,
                                        start_time = Now},
            update_state(#gold_league_state{key = {0, 0},
                                            cross_id = 0, group_id = 0,
                                            state_name = ready,
                                            end_time =
                                                date:unixtime() + 20 * 60,
                                            phase =
                                                gold_league_mgr:phase_enum(ready)}),
            continue(ready, NewState);
        {false, Msg} ->
            logger:error("创建钻石联赛准备区失败:~ts",
                         [Msg],
                         gold_league_mgr,
                         625),
            {_, TimeLeft} = get_idle_time(IsCross),
            NewState = State#state{ts = erlang:now(),
                                   timeout = TimeLeft, fields = [],
                                   start_time = Now, cancel_cross_id = []},
            continue(idle, NewState);
        _False ->
            logger:error("创建钻石联赛准备区失败:~w",
                         [_False],
                         gold_league_mgr,
                         630),
            {stop, normal, State}
    end;
early(_Event, State) -> continue(early, State).

notice(timeout, State = #state{open_mode = 3}) ->
    logger:info("钻石联赛-本服代理进入报名阶段",
                [],
                gold_league_mgr,
                640),
    Timeout = 20 * 60,
    Ref = undefined,
    Now = date:unixtime(),
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout, timer_ready_reward = Ref,
                           start_time = Now},
    update_state(#gold_league_state{key = {0, 0},
                                    cross_id = 0, group_id = 0,
                                    state_name = ready,
                                    end_time = date:unixtime() + 20 * 60,
                                    phase = gold_league_mgr:phase_enum(ready)}),
    continue(ready, NewState);
notice(timeout, State = #state{open_mode = OpenMode}) ->
    logger:info("钻石联赛进入报名阶段", [], gold_league_mgr, 650),
    Timeout = 20 * 60,
    Fmt = lang:get("~ts已开启报名，报名进入准备区可定时获得经验奖励{face_1, 7}"),
    Args = [{string_2, 1, lang:get("钻石联赛")}],
    Msg = notice:format(Fmt, Args),
    gold_league_utils:run_mfa(OpenMode,
                              gold_league_mgr,
                              broadcast,
                              [8, Msg]),
    ready_notice_timer(),
    Ref = erlang:send_after(60 * 1000,
                            self(),
                            ready_reward),
    Now = date:unixtime(),
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout, timer_ready_reward = Ref,
                           start_time = Now},
    update_state(#gold_league_state{key = {0, 0},
                                    cross_id = 0, group_id = 0,
                                    state_name = ready,
                                    end_time = date:unixtime() + 20 * 60,
                                    phase = gold_league_mgr:phase_enum(ready)}),
    continue(ready, NewState);
notice(_Event, State) -> continue(notice, State).

ready(timeout, State = #state{open_mode = 3}) ->
    logger:info("钻石联赛-本服代理进入战斗开始阶段",
                [],
                gold_league_mgr,
                669),
    Groups = gold_league_data:orders(),
    [honor_mgr:clear(list_to_atom(lists:concat(["gold_league_honor_",
                                                G])))
     || G <- Groups],
    Now = date:unixtime(),
    NewState = State#state{ts = erlang:now(), timeout = 1,
                           timer_ready_reward = undefined, start_time = Now},
    continue(enter, NewState);
ready(timeout,
      State = #state{timer_ready_reward = Ref,
                     open_mode = OpenMode}) ->
    logger:info("钻石联赛进入战斗开始阶段", [], gold_league_mgr, 678),
    Groups = gold_league_data:orders(),
    [honor_mgr:clear(list_to_atom(lists:concat(["gold_league_honor_",
                                                G])))
     || G <- Groups],
    server_timer:del(ready_notice),
    erlang:cancel_timer(Ref),
    case open_battlefield(State) of
        {ok, FightState} ->
            Now = date:unixtime(),
            NewState = FightState#state{ts = erlang:now(),
                                        timeout = 1,
                                        timer_ready_reward = undefined,
                                        start_time = Now},
            continue(enter, NewState);
        all_cancel ->
            logger:info("没有可以开启的战场，终结比赛", [], gold_league_mgr, 692),
            case OpenMode of
                2 ->
                    gold_league_utils:run_mfa(OpenMode,
                                              gold_league_mgr,
                                              cast,
                                              [to_exit]);
                _ -> skip
            end,
            continue(exit,
                     State#state{ts = erlang:now(), timeout = 30});
        _Err ->
            logger:error("创建战场错误[Err:~w]",
                         [_Err],
                         gold_league_mgr,
                         701),
            case OpenMode of
                2 ->
                    gold_league_utils:run_mfa(OpenMode,
                                              gold_league_mgr,
                                              cast,
                                              [to_exit]);
                _ -> skip
            end,
            continue(exit,
                     State#state{ts = erlang:now(), timeout = 30})
    end;
ready(_Event, State) -> continue(ready, State).

enter(timeout, State = #state{open_mode = 3}) ->
    logger:info("钻石联赛-本服代理进入战场阶段",
                [],
                gold_league_mgr,
                716),
    Now = date:unixtime(),
    NewState = State#state{ts = erlang:now(),
                           timeout = 20 * 60, ready_zones = [],
                           start_time = Now},
    continue(fight, NewState);
enter(timeout,
      State = #state{ready_zones = Zones,
                     open_mode = OpenMode,
                     cancel_cross_id = CancelCrossId}) ->
    logger:info("钻石联赛进入进入战场阶段", [], gold_league_mgr, 722),
    enter_field(),
    clean_ready_zone(Zones),
    Timer = #timer{id = progress_notice,
                   timeout = 15 * 60 * 1000},
    server_timer:set(Timer),
    Fmt = lang:get("~ts正式开启！勇士们尽情战斗、为荣誉而战吧{face_1, 7}"),
    Msg = notice:format(Fmt,
                        [{string_2, 1, lang:get("钻石联赛")}]),
    gold_league_utils:run_mfa({filter,
                               CancelCrossId,
                               OpenMode},
                              gold_league_mgr,
                              broadcast,
                              [8, Msg]),
    Now = date:unixtime(),
    NewState = State#state{ts = erlang:now(),
                           timeout = 20 * 60, ready_zones = [],
                           start_time = Now},
    logger:info("来一行漂亮的打印", [], gold_league_mgr, 732),
    continue(fight, NewState);
enter(_Event, State) -> continue(enter, State).

fight(timeout, State = #state{open_mode = 3}) ->
    logger:info("钻石联赛-本服代理战斗阶段结束",
                [],
                gold_league_mgr,
                741),
    Now = date:unixtime(),
    NewState = State#state{ts = erlang:now(),
                           timeout = 60 * (8 + 2) * 7, start_time = Now},
    gold_league_mgr:update_state(#gold_league_state{ids =
                                                        [],
                                                    key = {0, 0}, cross_id = 0,
                                                    group_id = 0,
                                                    state_name = fight_out,
                                                    end_time =
                                                        date:unixtime() +
                                                            60 * (8 + 2) * 7,
                                                    phase =
                                                        gold_league_mgr:phase_enum(fight_out)}),
    continue(fight_out, NewState);
fight(timeout, State) ->
    logger:info("钻石联赛战斗阶段结束", [], gold_league_mgr, 748),
    Now = date:unixtime(),
    server_timer:del(progress_notice),
    NewState = State#state{ts = erlang:now(),
                           timeout = 60 * (8 + 2) * 7, start_time = Now},
    gold_league_mgr:update_state(#gold_league_state{ids =
                                                        [],
                                                    key = {0, 0}, cross_id = 0,
                                                    group_id = 0,
                                                    state_name = fight_out,
                                                    end_time =
                                                        date:unixtime() +
                                                            60 * (8 + 2) * 7,
                                                    phase =
                                                        gold_league_mgr:phase_enum(fight_out)}),
    continue(exit, NewState);
fight(_Event, State) -> continue(fight, State).

fight_out(timeout, State) ->
    Now = date:unixtime(),
    NewState = State#state{ts = erlang:now(), timeout = 30,
                           start_time = Now, end_time = Now + 30},
    continue(exit, NewState);
fight_out(_Event, State) -> continue(fight, State).

exit(timeout,
     State = #state{npc_battle_id = BattleId, open_mode = 3,
                    is_cross = IsCross}) ->
    logger:info("钻石联赛-本服代理活动结束", [], gold_league_mgr, 767),
    case BattleId of
        BattleId when is_tuple(BattleId) ->
            unit_mgr:remove(BattleId);
        _ -> ok
    end,
    erase(),
    garbage_collect(),
    {_, IdleTime} = get_idle_time(IsCross),
    State1 = State#state{npc_battle_id = undefined},
    NewState = case IdleTime of
                   IdleTime when is_integer(IdleTime) ->
                       set_npc(IsCross, IdleTime, State1);
                   _ -> State1
               end,
    ets:delete_all_objects(gold_league_state),
    logger:info("钻石联赛下次开启时间:~w",
                [IdleTime],
                gold_league_mgr,
                781),
    continue(idle,
             NewState#state{ts = erlang:now(), timeout = IdleTime});
exit(timeout,
     State = #state{ready_zones = Zones,
                    npc_battle_id = BattleId, open_mode = OpenMode,
                    is_cross = IsCross}) ->
    logger:info("钻石联赛活动结束", [], gold_league_mgr, 785),
    clean_ready_zone(Zones),
    case BattleId of
        BattleId when is_tuple(BattleId) ->
            unit_mgr:remove(BattleId);
        _ -> ok
    end,
    server_timer:clean(),
    erase(),
    garbage_collect(),
    {_, IdleTime} = get_idle_time(IsCross),
    State1 = State#state{npc_battle_id = undefined,
                         ready_zones = []},
    NewState = case IdleTime of
                   IdleTime when is_integer(IdleTime) ->
                       set_npc(IsCross, IdleTime, State1);
                   _ -> State1
               end,
    logger:info("钻石联赛下次开启时间:~w",
                [IdleTime],
                gold_league_mgr,
                800),
    gold_league_utils:run_mfa(OpenMode,
                              gold_league_mgr,
                              broadcast_phase,
                              [idle, IdleTime]),
    ets:delete_all_objects(gold_league_state),
    continue(idle,
             NewState#state{ts = erlang:now(), timeout = IdleTime});
exit(_Event, State) -> continue(exit, State).

handle_event({reload}, StateName,
             State = #state{is_cross = IsCross,
                            open_mode = OldOpenMode}) ->
    OpenMode = check_open_mode(IsCross),
    logger:info("收到重载钻石联赛从[~w]模式转换成[~w]模式",
                [OldOpenMode, OpenMode],
                gold_league_mgr,
                810),
    continue(StateName, State#state{open_mode = OpenMode});
handle_event({cancel_sign, RoleId}, Phase = ready,
             State) ->
    NewState = cancel_enter_info(RoleId, State),
    continue(Phase, NewState);
handle_event({get_phase, Pid}, Phase,
             State = #state{end_time = EndTime}) ->
    PhaseName = gold_league_utils:phase_left_time(Phase),
    role:pack_send(Pid,
                   20000,
                   {PhaseName, EndTime, 0, 0, []}),
    continue(Phase, State);
handle_event({switch, Switch}, Phase,
             State = #state{is_cross = IsCross}) ->
    NewState = case Phase of
                   idle ->
                       case Switch of
                           open ->
                               {_StateName, LeftTime} = get_idle_time(IsCross),
                               logger:info("活动开关，switch:~w, phase:~w, leftTime:~w",
                                           [Switch, Phase, LeftTime],
                                           gold_league_mgr,
                                           831),
                               State#state{switch = Switch, ts = erlang:now(),
                                           timeout = LeftTime};
                           _ ->
                               logger:info("活动开关，switch:~w, phase:~w",
                                           [Switch, Phase],
                                           gold_league_mgr,
                                           834),
                               State#state{switch = Switch}
                       end;
                   _ ->
                       logger:info("活动开关，switch:~w, phase:~w",
                                   [Switch, Phase],
                                   gold_league_mgr,
                                   838),
                       State#state{switch = Switch}
               end,
    continue(Phase, NewState);
handle_event(to_exit, _StateName, State) ->
    logger:info("收到中央服取消战场比赛消息", [], gold_league_mgr, 845),
    continue(exit,
             State#state{ts = erlang:now(), timeout = 30});
handle_event({update_honor, HonorType, RoleList},
             StateName, State) ->
    NewRankList = [{RoleId, HonorId}
                   || {RoleId, HonorId} <- RoleList,
                      role_misc:is_local_role(RoleId)],
    logger:info("钻石联赛称号：~w,~w",
                [HonorType, NewRankList],
                gold_league_mgr,
                851),
    honor_mgr:replace(HonorType, NewRankList, 0),
    continue(StateName, State);
handle_event(_Event, Phase, State) ->
    continue(Phase, State).

handle_sync_event(get_state, _From, StateName, State) ->
    Reply = {ok, StateName},
    continue(StateName, Reply, State);
handle_sync_event({enter,
                   GoldLeague = #gold_league{cross_id = CrossId,
                                             pid = _Pid, group_id = GroupId}},
                  _From, StateName = ready,
                  State = #state{ready_zones = Zones,
                                 combat_mode = AllCombatMode}) ->
    {NewState, Reply} = case get_ready_zone_map(Zones,
                                                [],
                                                GroupId,
                                                CrossId)
                            of
                            {ok, Zone} ->
                                Zone1 = get_combat_mode(Zone, AllCombatMode),
                                {enter_ready_zone(Zone1, GoldLeague, State),
                                 ok};
                            _False ->
                                case create_ready_zone_map(CrossId, GroupId) of
                                    false ->
                                        {State,
                                         {false,
                                          lang:get("钻石联赛准备区暂时无法创建，请稍后尝试")}};
                                    {ok, Zone} ->
                                        Zone1 = get_combat_mode(Zone,
                                                                AllCombatMode),
                                        {enter_ready_zone(Zone1,
                                                          GoldLeague,
                                                          State),
                                         ok}
                                end
                        end,
    continue(StateName, Reply, NewState);
handle_sync_event({enter, #gold_league{pid = _Pid}},
                  _From, Phase, State) ->
    Reply = {false, lang:get("参加时间已过，下次活动请注意公告提示")},
    logger:debug("============= ~w ~w",
                 [Phase, Reply],
                 gold_league_mgr,
                 883),
    continue(Phase, Reply, State);
handle_sync_event({login, RoleId, Pid}, _From,
                  Phase = ready, State = #state{open_mode = OpenMode}) ->
    Reply = case find_role(RoleId) of
                {true,
                 GoldLeague = #gold_league{ready_map_id = MapId}} ->
                    NewStatus = 1,
                    NewGoldLeague = GoldLeague#gold_league{pid = Pid,
                                                           status = NewStatus},
                    update_role(NewGoldLeague, OpenMode),
                    {ok, Phase, MapId};
                _ -> false
            end,
    continue(Phase, Reply, State);
handle_sync_event(get_combat_id, _From, Phase, State) ->
    Id = env:get(gold_league_combat_id),
    env:save(gold_league_combat_id, Id),
    continue(Phase, {ok, Id}, State);
handle_sync_event(_Event, _From, Phase, State) ->
    continue(Phase, false, State).

handle_info(ready_reward, Phase = ready,
            State = #state{timer_ready_reward = Ref}) ->
    case is_reference(Ref) of
        true -> catch erlang:cancel_timer(Ref);
        false -> skip
    end,
    Fun = fun (#gold_league{pid = Pid}, AccIn)
                  when is_pid(Pid) ->
                  role:apply(async,
                             Pid,
                             {gold_league_mgr, ready_reward, []}),
                  AccIn;
              (_, AccIn) -> AccIn
          end,
    ets:foldl(Fun, ok, gold_leagues),
    NewRef = erlang:send_after(60 * 1000,
                               self(),
                               ready_reward),
    continue(Phase,
             State#state{timer_ready_reward = NewRef});
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
                                    gold_league_mgr,
                                    935),
                       server_timer:timer(remove),
                       State
               end,
    continue(Phase, NewState);
handle_info({'EXIT', _Parent, normal}, Phase = idle,
            State) ->
    logger:info("钻石联赛准备区地图进程退出", [], gold_league_mgr, 941),
    continue(Phase, State);
handle_info({'EXIT', _Parent, normal}, Phase, State) ->
    continue(Phase, State);
handle_info({'EXIT', _Parent, abnormal}, Phase,
            State) ->
    continue(Phase, State);
handle_info(reload_idle_time, StateName,
            State = #state{npc_battle_id = BattleId,
                           is_cross = IsCross})
    when StateName =:= npc orelse
             StateName =:= idle orelse StateName =:= early ->
    case get(zero_reset_time) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    case BattleId of
        BattleId when is_tuple(BattleId) ->
            unit_mgr:remove(BattleId);
        _ -> ok
    end,
    {NewStateName, IdleTime} = get_idle_time(IsCross),
    case NewStateName of
        early ->
            update_state(#gold_league_state{key = {0, 0},
                                            cross_id = 0, group_id = 0,
                                            state_name = early,
                                            end_time =
                                                date:unixtime() + IdleTime,
                                            phase =
                                                gold_league_mgr:phase_enum(early)});
        _ -> ok
    end,
    State1 = State#state{npc_battle_id = undefined},
    logger:info("重置钻石联赛时间，下次时间:~w",
                [IdleTime],
                gold_league_mgr,
                965),
    NewState = case IdleTime of
                   IdleTime when is_integer(IdleTime) ->
                       set_npc(IsCross, IdleTime, State1);
                   _ -> State1
               end,
    Ref = erlang:send_after(date:next_diff(0, 0, 30) * 1000,
                            self(),
                            reset),
    put(zero_reset_time, Ref),
    continue(NewStateName,
             NewState#state{ts = erlang:now(), timeout = IdleTime});
handle_info(reset, StateName,
            State = #state{npc_battle_id = BattleId,
                           is_cross = IsCross})
    when StateName =:= npc orelse StateName =:= idle ->
    case get(zero_reset_time) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    case BattleId of
        BattleId when is_tuple(BattleId) ->
            unit_mgr:remove(BattleId);
        _ -> ok
    end,
    State1 = State#state{npc_battle_id = undefined},
    {NewStateName, IdleTime} = get_idle_time(IsCross),
    case NewStateName of
        early ->
            update_state(#gold_league_state{key = {0, 0},
                                            cross_id = 0, group_id = 0,
                                            state_name = early,
                                            end_time =
                                                date:unixtime() + IdleTime,
                                            phase =
                                                gold_league_mgr:phase_enum(early)});
        _ -> ok
    end,
    logger:info("凌晨判断钻石联赛时间，下次时间:~w",
                [IdleTime],
                gold_league_mgr,
                991),
    NewState = case IdleTime of
                   IdleTime when is_integer(IdleTime) ->
                       set_npc(IsCross, IdleTime, State1);
                   _ -> State1
               end,
    Ref = erlang:send_after(date:next_diff(0, 0, 30) * 1000,
                            self(),
                            reset),
    put(zero_reset_time, Ref),
    continue(NewStateName,
             NewState#state{ts = erlang:now(), timeout = IdleTime});
handle_info({update_record, RecId, ExtArgs}, Phase,
            State) ->
    logger:debug("钻石联赛录像更新:~w",
                 [RecId],
                 gold_league_mgr,
                 1002),
    case lists:keyfind(role_ids, 1, ExtArgs) of
        {_, [FirstId, SecondId]} ->
            logger:debug("===================",
                         [],
                         gold_league_mgr,
                         1005),
            ets:insert(gold_league_combat_record,
                       #gold_league_combat_record{id = RecId,
                                                  first_id = FirstId,
                                                  second_id = SecondId}),
            combat_record:cast({cite, RecId});
        _R ->
            logger:debug("=================== ~w",
                         [_R, ExtArgs],
                         gold_league_mgr,
                         1009),
            ok
    end,
    continue(Phase, State);
handle_info(_Info, Phase, State) ->
    logger:debug("未知消息[Info:~w][stateName:~w]",
                 [_Info, Phase],
                 gold_league_mgr,
                 1016),
    continue(Phase, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

format_status(_Opt, State) -> State.

phase_enum(idle) -> 0;
phase_enum(notice) -> 1;
phase_enum(ready) -> 2;
phase_enum(fight) -> 3;
phase_enum(fight_out) -> 4;
phase_enum(fight_guess) -> 5;
phase_enum(early) -> 7;
phase_enum(_) -> 0.

continue(StateName,
         #state{timeout = undefined} = State) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         #state{ts = Ts, timeout = Timeout} = State) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout * 1000, Ts)}.

continue(StateName, Reply,
         #state{timeout = undefined} = State) ->
    {reply, Reply, StateName, State, infinity};
continue(StateName, Reply,
         #state{ts = Ts, timeout = Timeout} = State) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout * 1000, Ts)}.

get_idle_time(_IsCross) ->
    case agenda:get_state_timeout(2056, 0) of
        {idle, Time} ->
            TimeLeft = Time - (20 * 3600 + 5 * 60 - 10 * 3600),
            case TimeLeft > 0 of
                true -> {idle, TimeLeft};
                _ ->
                    logger:info("提前预告出图标 ~w",
                                [Time],
                                gold_league_mgr,
                                1063),
                    {early, max(1, Time - 20 * 60)}
            end;
        _ -> {idle, undefined}
    end.

broadcast(Msg) ->
    role_group:pack_send(world, 9902, {4, Msg, []}).

broadcast(Type, Msg) ->
    role_group:pack_send(world, 9902, {Type, Msg, []}).

broadcast_phase(AtomPhase, LeftTime) ->
    Phase = phase_enum(AtomPhase),
    case is_integer(LeftTime) of
        true ->
            role_group:pack_send(world,
                                 20000,
                                 {Phase,
                                  date:unixtime() + LeftTime,
                                  0,
                                  0,
                                  [1, 2, 3, 4]});
        _ ->
            role_group:pack_send(world,
                                 20000,
                                 {Phase, 0, 0, 0, [1, 2, 3, 4]})
    end.

reply_notice(Pid, Type, Str) ->
    role:pack_send(Pid, 9902, {Type, Str, []}).

init_ready_zone(State = #state{open_mode = OpenMode}) ->
    AllCross = gold_league_utils:all_cross(OpenMode),
    Zones = init_ready_zone_map(AllCross, 20, [], State),
    case Zones of
        [_ | _] ->
            NewState = State#state{ready_zones = Zones},
            {ok, NewState};
        _False -> {false, "初始化准备区失败"}
    end.

init_ready_zone_map([], _, Zones, _State) -> Zones;
init_ready_zone_map([CrossId | T], MaxNum, Zones,
                    State) ->
    AddZones = do_init_ready_zone_map(CrossId,
                                      MaxNum,
                                      [],
                                      State),
    case AddZones of
        [_ | _] ->
            init_ready_zone_map(T,
                                MaxNum,
                                AddZones ++ Zones,
                                State);
        _ -> init_ready_zone_map(T, MaxNum, Zones, State)
    end.

do_init_ready_zone_map(CrossId, 0, Zones, _State) ->
    logger:info("给[~w]创建准备区完成,一共创建了[~w]个准备区",
                [CrossId, length(Zones)],
                gold_league_mgr,
                1130),
    Zones;
do_init_ready_zone_map(CrossId, Num, Zones, State) ->
    case create_ready_zone_map(CrossId) of
        {ok, Zone} ->
            do_init_ready_zone_map(CrossId,
                                   Num - 1,
                                   [Zone | Zones],
                                   State);
        _False ->
            do_init_ready_zone_map(CrossId, Num - 1, Zones, State)
    end.

create_ready_zone_map(CrossId) ->
    Plat = env:get(platform),
    ZoneId = env:get(zone_id),
    case map_mgr:create(53002) of
        {ok, MapPid, MapId} ->
            case unit_mgr:fetch_ids(1) of
                {ok, [Id]} ->
                    BattleId = {52, Id},
                    Pos = {MapId, 2040, 1200},
                    case unit_mgr:create(BattleId, 79548, Pos) of
                        {ok, _} ->
                            Zone = #gold_league_ready_zone{map_id = MapId,
                                                           map_plat = Plat,
                                                           map_zone = ZoneId,
                                                           map_pid = MapPid,
                                                           exit_npc = BattleId,
                                                           cross_id = CrossId},
                            {ok, Zone};
                        _ -> false
                    end;
                _ -> false
            end;
        _Err ->
            logger:error("创建勇士竞技场准备区失败:~w",
                         [_Err],
                         gold_league_mgr,
                         1159),
            false
    end.

create_ready_zone_map(CrossId, GroupId) ->
    case create_ready_zone_map(CrossId) of
        {ok, Zone} ->
            Zone1 = Zone#gold_league_ready_zone{group_id = GroupId},
            {ok, Zone1};
        _Err -> false
    end.

get_ready_zone_map([], [], _Group, _CrossId) -> false;
get_ready_zone_map([], [Zone | _T], GroupId,
                   _CrossId) ->
    {ok, Zone#gold_league_ready_zone{group_id = GroupId}};
get_ready_zone_map([Zone =
                        #gold_league_ready_zone{member_size = Size,
                                                group_id = GroupId,
                                                cross_id = CrossId}
                    | _T],
                   _Unalloc, GroupId, CrossId)
    when Size < 60 ->
    {ok, Zone};
get_ready_zone_map([Zone =
                        #gold_league_ready_zone{member_size = 0,
                                                cross_id = CrossId}
                    | T],
                   Unalloc, Group, CrossId) ->
    get_ready_zone_map(T, [Zone | Unalloc], Group, CrossId);
get_ready_zone_map([_H | T], Unalloc, Group, CrossId) ->
    get_ready_zone_map(T, Unalloc, Group, CrossId).

enter_ready_zone(Zone = #gold_league_ready_zone{map_id =
                                                    MapId,
                                                map_plat = MapPlat,
                                                map_zone = MapZoneId,
                                                map_pid = MapPid,
                                                member_size = Size,
                                                combat_mode = CombatMode},
                 GoldLeague = #gold_league{pid = Pid},
                 State = #state{ready_zones = Zones,
                                open_mode = OpenMode}) ->
    logger:debug("进入准备区", [], gold_league_mgr, 1184),
    role:apply(async,
               Pid,
               {gold_league_mgr,
                apply_enter_ready_zone,
                [{MapPlat, MapZoneId, MapId}, OpenMode, CombatMode]}),
    NewGoldLeague = GoldLeague#gold_league{ready_map_id =
                                               MapId,
                                           ready_map_pid = MapPid,
                                           ready_map_plat = MapPlat,
                                           ready_map_zone = MapZoneId,
                                           status = 1,
                                           combat_mode = CombatMode},
    update_role(NewGoldLeague, OpenMode),
    NewZone = Zone#gold_league_ready_zone{member_size =
                                              Size + 1},
    NewReadyZones = lists:keystore(MapId,
                                   #gold_league_ready_zone.map_id,
                                   Zones,
                                   NewZone),
    State#state{ready_zones = NewReadyZones}.

cancel_enter_info(RoleId,
                  State = #state{ready_zones = Zones,
                                 open_mode = OpenMode}) ->
    case catch ets:lookup(gold_leagues, RoleId) of
        [#gold_league{ready_map_id = MapId}] ->
            case lists:keyfind(MapId,
                               #gold_league_ready_zone.map_id,
                               Zones)
                of
                Zone = #gold_league_ready_zone{member_size = Size} ->
                    NewZone = Zone#gold_league_ready_zone{member_size =
                                                              Size - 1},
                    NewZones = lists:keystore(MapId,
                                              #gold_league_ready_zone.map_id,
                                              Zones,
                                              NewZone),
                    delete_role(RoleId, OpenMode),
                    State#state{ready_zones = NewZones};
                _False -> State
            end;
        _False -> State
    end.

open_battlefield(State = #state{open_mode =
                                    OpenMode}) ->
    GroupFun = fun (GoldLeague = #gold_league{lev = Lev,
                                              status = 1, cross_id = CrossId,
                                              break_times = BreakTimes},
                    {AllGroups, GoldLeagues}) ->
                       case gold_league_data:get_group({Lev, BreakTimes}) of
                           Data = #gold_league_group_data{id = GroupId} ->
                               case lists:keyfind(CrossId, 1, AllGroups) of
                                   {_, Groups} ->
                                       NewGroups = case lists:keyfind(GroupId,
                                                                      #gold_league_group_data.id,
                                                                      Groups)
                                                       of
                                                       Group =
                                                           #gold_league_group_data{members
                                                                                       =
                                                                                       Members} ->
                                                           NewMembers =
                                                               [GoldLeague
                                                                | Members],
                                                           NewGroup =
                                                               Group#gold_league_group_data{members
                                                                                                =
                                                                                                NewMembers},
                                                           lists:keystore(GroupId,
                                                                          #gold_league_group_data.id,
                                                                          Groups,
                                                                          NewGroup);
                                                       _ ->
                                                           NewGroup =
                                                               Data#gold_league_group_data{members
                                                                                               =
                                                                                               [GoldLeague],
                                                                                           ids
                                                                                               =
                                                                                               [GroupId]},
                                                           lists:keystore(GroupId,
                                                                          #gold_league_group_data.id,
                                                                          Groups,
                                                                          NewGroup)
                                                   end,
                                       NewAllGroups = lists:keystore(CrossId,
                                                                     1,
                                                                     AllGroups,
                                                                     {CrossId,
                                                                      NewGroups}),
                                       {NewAllGroups, GoldLeagues};
                                   _ ->
                                       NewGroups =
                                           [Data#gold_league_group_data{members
                                                                            =
                                                                            [GoldLeague],
                                                                        ids =
                                                                            [GroupId]}],
                                       NewAllGroups = lists:keystore(CrossId,
                                                                     1,
                                                                     AllGroups,
                                                                     {CrossId,
                                                                      NewGroups}),
                                       {NewAllGroups, GoldLeagues}
                               end;
                           _ -> {AllGroups, GoldLeagues}
                       end;
                   (W, {AllGroups, GoldLeagues}) ->
                       logger:debug("===================",
                                    [],
                                    gold_league_mgr,
                                    1239),
                       {AllGroups, [W | GoldLeagues]}
               end,
    {GetAllGroups, DelGoldLeagues} = ets:foldl(GroupFun,
                                               {[], []},
                                               gold_leagues),
    delete_role(DelGoldLeagues, OpenMode),
    AllResult = divide_group(GetAllGroups),
    case make_all_fields(AllResult, State) of
        all_cancel -> all_cancel;
        {ok, NewState} -> {ok, NewState}
    end.

make_all_fields(AllResult, State) ->
    make_all_fields(AllResult, State, all_cancel).

make_all_fields([], _State, all_cancel) -> all_cancel;
make_all_fields([], NewState, _) -> {ok, NewState};
make_all_fields([{CrossId, {false, _Reason, Members}}
                 | T],
                State = #state{cancel_cross_id = CancelCrossId},
                Flag) ->
    Msg = lang:get("由于参加人数不足，本次钻石联赛暂不开启"),
    gold_league_utils:run_mfa({cross_id, CrossId},
                              gold_league_mgr,
                              broadcast,
                              [Msg]),
    lists:foreach(fun (W) -> exit_ready_zone(W, cancel) end,
                  Members),
    RoleIds = [Id || #gold_league{id = Id} <- Members],
    send_back(CrossId, RoleIds),
    NewCancelCrossId = [CrossId | CancelCrossId],
    make_all_fields(T,
                    State#state{cancel_cross_id = NewCancelCrossId},
                    Flag);
make_all_fields([{CrossId,
                  {ok,
                   Groups = [#gold_league_group_data{members =
                                                         OnlyMembers}]}}
                 | T],
                State = #state{cancel_cross_id = CancelCrossId},
                Flag) ->
    case length(OnlyMembers) < 32 of
        true ->
            Msg = lang:get("由于参加人数不足，本次钻石联赛获得暂不开启"),
            gold_league_utils:run_mfa({cross_id, CrossId},
                                      gold_league_mgr,
                                      broadcast,
                                      [Msg]),
            lists:foreach(fun (W) -> exit_ready_zone(W, cancel) end,
                          OnlyMembers),
            RoleIds = [Id || #gold_league{id = Id} <- OnlyMembers],
            send_back(CrossId, RoleIds),
            NewCancelCrossId = [CrossId | CancelCrossId],
            make_all_fields(T,
                            State#state{cancel_cross_id = NewCancelCrossId},
                            Flag);
        false ->
            NewState = create_fields(CrossId, Groups, State),
            make_all_fields(T, NewState, ok)
    end;
make_all_fields([{CrossId, {ok, Groups}} | T], State,
                _Flag) ->
    NewState = create_fields(CrossId, Groups, State),
    make_all_fields(T, NewState, ok).

create_fields(CrossId, Groups,
              State = #state{fields = OldFields, open_mode = OpenMode,
                             combat_mode = AllCombatMode}) ->
    Fields = divide_fields(Groups, 1, []),
    logger:info("本次[~w]号分组钻石联赛共开放[~w]个战场",
                [CrossId, length(Fields)],
                gold_league_mgr,
                1285),
    {NewFields, RoleIds} = do_create_fields(CrossId,
                                            OpenMode,
                                            AllCombatMode,
                                            Fields,
                                            [],
                                            []),
    send_back(CrossId, RoleIds),
    State#state{fields = NewFields ++ OldFields}.

do_create_fields(_CrossId, _OpenMode, _AllCombatMode,
                 [], List, RoleIds) ->
    {List, RoleIds};
do_create_fields(CrossId, OpenMode, AllCombatMode,
                 [{Fid, SeqId, GroupId, Ids, GoldLeagues} | Rest], List,
                 RoleIds) ->
    Len = length(GoldLeagues),
    CombatMode = get_combat_mode({CrossId, GroupId},
                                 AllCombatMode),
    case gold_league:start_link(Fid,
                                SeqId,
                                GroupId,
                                Len,
                                OpenMode,
                                CrossId,
                                CombatMode,
                                Ids)
        of
        {ok, Pid} ->
            NewGoldLeagues = [GoldLeague#gold_league{field_pid =
                                                         Pid,
                                                     field_id = Fid,
                                                     seq_id = SeqId}
                              || GoldLeague <- GoldLeagues],
            NewRoleIds = [RoleId
                          || #gold_league{id = RoleId} <- GoldLeagues],
            update_role(NewGoldLeagues, OpenMode),
            Field = #gold_league_zone{id = Fid, cross_id = CrossId,
                                      key = {CrossId, GroupId},
                                      group_id = GroupId, seq_id = SeqId,
                                      pid = Pid, is_close = 0},
            do_create_fields(CrossId,
                             OpenMode,
                             AllCombatMode,
                             Rest,
                             [Field | List],
                             NewRoleIds ++ RoleIds);
        False ->
            logger:error("创建战场失败[Fid:~w][GroupId:~w][CrossId:~w][Err:~w]",
                         [Fid, GroupId, CrossId, False],
                         gold_league_mgr,
                         1302),
            do_create_fields(CrossId,
                             OpenMode,
                             AllCombatMode,
                             Rest,
                             List,
                             RoleIds)
    end.

divide_fields([], _N, Fields) -> Fields;
divide_fields([#gold_league_group_data{id = GroupId,
                                       members = Members, ids = Ids}
               | Rest],
              N, Fields) ->
    RawFields = [{N, 1, GroupId, Ids, Members}],
    NewFields = deenterate_camp(RawFields, Fields),
    divide_fields(Rest, N + 1, NewFields).

deenterate_camp([], Fields) -> Fields;
deenterate_camp([{FieldId, SeqId, GroupId, Ids, Members}
                 | Rest],
                Fields) ->
    SortMembers = lists:keysort(#gold_league.lev, Members),
    GoldLeagues = do_deenterate_camp(SortMembers,
                                     1,
                                     GroupId,
                                     []),
    deenterate_camp(Rest,
                    [{FieldId, SeqId, GroupId, Ids, GoldLeagues} | Fields]).

do_deenterate_camp([], _Const, _GroupId, GoldLeagues) ->
    GoldLeagues;
do_deenterate_camp([GoldLeague | Rest], Const, GroupId,
                   GoldLeagues) ->
    NewGoldLeague = GoldLeague#gold_league{group_id =
                                               GroupId},
    do_deenterate_camp(Rest,
                       Const,
                       GroupId,
                       [NewGoldLeague | GoldLeagues]).

divide_group(AllGroups) -> divide_group(AllGroups, []).

divide_group([], Result) -> Result;
divide_group([{CrossId, Groups} | T], Result) ->
    OrderGroups =
        lists:keysort(#gold_league_group_data.order, Groups),
    case do_divide_group(OrderGroups, [], []) of
        {false, Reason, Mem} ->
            divide_group(T,
                         [{CrossId, {false, Reason, Mem}} | Result]);
        {ok, BackGroups} ->
            divide_group(T, [{CrossId, {ok, BackGroups}} | Result])
    end.

do_divide_group([], [], []) ->
    {false, lang:get("没有分组，无法创建战场"), []};
do_divide_group([], [],
                [_PreGroups = #gold_league_group_data{members =
                                                          Members}]) ->
    {false, lang:get("没有分组，无法创建战场"), Members};
do_divide_group([], BaseGroups, []) -> {ok, BaseGroups};
do_divide_group([], [Group | BaseGroups], PreGroups) ->
    NewGroup = merge_divide_group(PreGroups, Group),
    {ok, [NewGroup | BaseGroups]};
do_divide_group([Group | RestGroups], BaseGroups,
                PreGroups) ->
    NewGroup = merge_divide_group(PreGroups, Group),
    #gold_league_group_data{members = Members} = NewGroup,
    case length(Members) < 32 of
        false ->
            do_divide_group(RestGroups,
                            [NewGroup | BaseGroups],
                            []);
        true ->
            do_divide_group(RestGroups, BaseGroups, [NewGroup])
    end.

merge_divide_group([], BaseGroup) -> BaseGroup;
merge_divide_group([#gold_league_group_data{members =
                                                Members,
                                            name = _PreName, ids = PreIds}],
                   BaseGroup = #gold_league_group_data{members =
                                                           BaseMembers,
                                                       name = _Name,
                                                       ids = BaseIds}) ->
    logger:info("本次钻石联赛的[~ts]合并至[~ts]",
                [_PreName, _Name],
                gold_league_mgr,
                1362),
    NewIds = PreIds ++ BaseIds,
    logger:info("本次钻石联赛合组ids ~w ~w, 合并后ids ~w",
                [PreIds, BaseIds, NewIds],
                gold_league_mgr,
                1364),
    NewMembers = Members ++ BaseMembers,
    BaseGroup#gold_league_group_data{members = NewMembers,
                                     ids = NewIds};
merge_divide_group(_Unknown, BaseGroup) ->
    logger:error("分组错误[Err:~w]",
                 [_Unknown],
                 gold_league_mgr,
                 1368),
    BaseGroup.

enter_field() ->
    Fun = fun (GoldLeague = #gold_league{status = 1,
                                         field_pid = FieldPid},
               AccIn)
                  when is_pid(FieldPid) ->
                  gold_league:enter_field(FieldPid, GoldLeague),
                  AccIn;
              (_W, AccIn) -> AccIn
          end,
    ets:foldl(Fun, ok, gold_leagues),
    ok.

clean_ready_zone([]) -> ok;
clean_ready_zone([#gold_league_ready_zone{map_pid = Pid,
                                          exit_npc = BattleId}
                  | Rest])
    when is_pid(Pid) ->
    unit_mgr:remove(BattleId),
    map:stop(Pid),
    clean_ready_zone(Rest);
clean_ready_zone([_ | Rest]) -> clean_ready_zone(Rest).

init_cache() ->
    ets:new(gold_leagues,
            [named_table, public, set, {keypos, #gold_league.id}]),
    ets:new(gold_league_fields,
            [named_table,
             public,
             set,
             {keypos, #gold_league_field.key}]),
    ets:new(gold_league_combat,
            [named_table,
             public,
             set,
             {keypos, #gold_league_combat.pid}]),
    ets:new(gold_league_16_role,
            [named_table, public, set, {keypos, #gold_league.id}]),
    ets:new(gold_league_guess,
            [named_table,
             public,
             set,
             {keypos, #gold_league_guess.id}]),
    ets:new(gold_league_guess_role,
            [named_table,
             public,
             set,
             {keypos, #gold_league_guess_role.id}]),
    ets:new(gold_league_state,
            [named_table,
             public,
             set,
             {keypos, #gold_league_state.key}]),
    ets:new(gold_league_combat_record,
            [named_table,
             public,
             set,
             {keypos, #gold_league_combat_record.id}]),
    dets:open_file(gold_league_16_role,
                   [{file, "./dets/gold_league_16_role.dets"},
                    {keypos, #gold_league.id}]),
    dets:open_file(gold_league_guess,
                   [{file, "./dets/gold_league_guess.dets"},
                    {keypos, #gold_league_guess.id}]),
    dets:open_file(gold_league_guess_role,
                   [{file, "./dets/gold_league_guess_role.dets"},
                    {keypos, #gold_league_guess_role.id}]),
    ok.

clean_cache() ->
    ets:delete_all_objects(gold_leagues),
    ets:delete_all_objects(gold_league_fields),
    ets:delete_all_objects(gold_league_combat),
    ets:delete_all_objects(gold_league_16_role),
    ets:delete_all_objects(gold_league_guess),
    ets:delete_all_objects(gold_league_guess_role),
    logger:info("钻石联赛清空数据", [], gold_league_mgr, 1414),
    ok.

find_role(Rid) ->
    case catch ets:lookup(gold_leagues, Rid) of
        [GoldLeague = #gold_league{}] -> {true, GoldLeague};
        [] -> false;
        _ -> false
    end.

update_role([], _OpenMode) -> ok;
update_role([W | T], OpenMode) ->
    update_role(W, OpenMode),
    update_role(T, OpenMode);
update_role(GoldLeague, 1) ->
    ets:insert(gold_leagues, GoldLeague),
    ok;
update_role(GoldLeague = #gold_league{id = {_, P, Z}},
            2) ->
    ets:insert(gold_leagues, GoldLeague),
    cross:cast(P,
               Z,
               ets,
               insert,
               [gold_leagues, GoldLeague]),
    ok;
update_role(_GoldLeague, _) -> ok.

delete_role([], _) -> ok;
delete_role([W | T], OpenMode) ->
    delete_role(W, OpenMode),
    delete_role(T, OpenMode);
delete_role(#gold_league{id = Id}, OpenMode) ->
    delete_role(Id, OpenMode);
delete_role(Id = {_, P, Z}, 2) ->
    ets:delete(gold_leagues, Id),
    cross:cast(P, Z, ets, delete, [gold_leagues, Id]),
    ok;
delete_role(Id, _) ->
    ets:delete(gold_leagues, Id),
    ok.

update_state(State = #gold_league_state{ids = NewIds,
                                        key = _Key, cross_id = CrossId,
                                        end_time = EndTime,
                                        now_round = NowRound,
                                        max_round = MaxRound, phase = Phase}) ->
    logger:debug("活动更新状态并推送 ~w  ~w ~w",
                 [CrossId, NewIds, State],
                 gold_league_mgr,
                 1458),
    case CrossId of
        0 ->
            role_group:pack_send(world,
                                 20000,
                                 {Phase, EndTime, NowRound, MaxRound, NewIds});
        _ ->
            gold_league_utils:run_mfa({cross_id, CrossId},
                                      ets,
                                      insert,
                                      [gold_league_state,
                                       State#gold_league_state{ids = NewIds}]),
            gold_league_utils:run_mfa({cross_id, CrossId},
                                      role_group,
                                      pack_send,
                                      [world,
                                       20000,
                                       {Phase,
                                        EndTime,
                                        NowRound,
                                        MaxRound,
                                        NewIds}])
    end,
    ets:insert(gold_league_state, State).

update_field(Field) ->
    ets:insert(gold_league_fields, Field).

update_16_role(GoldLeague, 1) ->
    ets:insert(gold_league_16_role, GoldLeague),
    ok;
update_16_role(GoldLeague = #gold_league{id =
                                             {_, P, Z}},
               2) ->
    ets:insert(gold_league_16_role, GoldLeague),
    cross:cast(P,
               Z,
               ets,
               insert,
               [gold_league_16_role, GoldLeague]),
    ok;
update_16_role(_GoldLeague, _) -> ok.

update_combat(Combat) ->
    ets:insert(gold_league_combat, Combat).

del_combat(CombatPid) ->
    case ets:lookup(gold_league_combat, CombatPid) of
        [#gold_league_combat{ref = Ref}]
            when is_reference(Ref) ->
            erlang:cancel_timer(Ref);
        _ -> ok
    end,
    ets:delete(gold_league_combat, CombatPid).

exit_ready_zone(#gold_league{pid = Pid}, Label)
    when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {gold_league_mgr, apply_exit_ready_zone, [Label]}),
    Label;
exit_ready_zone(Pid, Label) when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {gold_league_mgr, apply_exit_ready_zone, [Label]}),
    Label;
exit_ready_zone(_GoldLeague, Label) -> Label.

rank_notice_timer(GroupRankRc) ->
    case catch gold_league_rank:rank_notice_msg(GroupRankRc)
        of
        RankNotice = [_ | _] ->
            put(rank_notice, RankNotice),
            Timer = #timer{id = rank_notice, timeout = 30 * 1000},
            server_timer:set(Timer);
        _False ->
            logger:error("排名提示失败:~w",
                         [_False],
                         gold_league_mgr,
                         1517),
            erase(rank_notice)
    end,
    ok.

tick_rank_notice(_State = #state{}) ->
    case get(rank_notice) of
        [{{P, Z}, Msg} | Rest] ->
            cross:cast(P, Z, gold_league_mgr, broadcast, [8, Msg]),
            put(rank_notice, Rest),
            {ok,
             {set, #timer{id = rank_notice, timeout = 3 * 1000}}};
        _ ->
            erase(rank_notice),
            remove
    end.

ready_notice_timer() ->
    Timer = #timer{id = ready_notice, timeout = 180 * 1000},
    server_timer:set(Timer),
    ok.

tick_ready_notice(#state{ts = Ts, timeout = Timeout,
                         open_mode = OpenMode}) ->
    LeftTime = util:time_left(Timeout * 1000, Ts) div 60000,
    {Msg, Flag} = if LeftTime =< 1 ->
                         Fmt = lang:get("钻石联赛~ts分钟后报名截止，赶快报名迎接战场的洗礼吧。"),
                         Msg1 = notice:format(Fmt, [{string_2, 5, 1}]),
                         {Msg1, false};
                     true ->
                         Fmt = lang:get("钻石联赛~ts分钟后报名截止，还没进入准备区的勇士赶紧报名吧。"),
                         Msg2 = notice:format(Fmt, [{string_2, 5, LeftTime}]),
                         {Msg2, true}
                  end,
    gold_league_utils:run_mfa(OpenMode,
                              gold_league_mgr,
                              broadcast,
                              [8, Msg]),
    case Flag of
        true ->
            {ok,
             {set, #timer{id = ready_notice, timeout = 180 * 1000}}};
        false -> remove
    end.

tick(idle, create_npc, State) ->
    {ok, remove, npc(State)};
tick(fight, progress_notice, _State) ->
    Fun = fun (#gold_league_field{pid = Pid}, AccIn) ->
                  cast(Pid, AccIn),
                  AccIn;
              (_, AccIn) -> AccIn
          end,
    ets:foldl(Fun, progress_notice, gold_league_fields),
    remove;
tick(ready, ready_notice, State) ->
    tick_ready_notice(State);
tick(_Phase, rank_notice, State) ->
    tick_rank_notice(State);
tick(Phase, Msg, _State) ->
    logger:error("阶段[Phase:~w]收到未知的定时消息[Msg:~w]",
                 [Phase, Msg],
                 gold_league_mgr,
                 1573),
    remove.

set_npc(1, _IdleTime, State) -> State;
set_npc(_OpenMode, IdleTime, State)
    when is_integer(IdleTime) ->
    Now = date:unixtime(),
    Next = Now + IdleTime,
    case date:is_today(Next) of
        false -> State;
        _ -> npc(State)
    end;
set_npc(_, _IdleTime, State) -> State.

npc(State) -> State.

find_field(_GoldLeague, []) ->
    {false, lang:get("没有开启战区")};
find_field(#gold_league{group_id = GroupId,
                        cross_id = CrossId},
           List) ->
    List1 = [Field
             || Field = #gold_league_zone{cross_id = CrossId1}
                    <- List,
                CrossId =:= CrossId1],
    case lists:keyfind(GroupId,
                       #gold_league_zone.group_id,
                       List1)
        of
        #gold_league_zone{is_close = 1} ->
            {false, lang:get("你的战区已经结束")};
        Field = #gold_league_zone{} -> {ok, Field};
        _ ->
            Order = gold_league_data:group_order(GroupId),
            Orders = gold_league_data:orders(),
            MaxOrder = lists:max(Orders),
            MinOrder = lists:min(Orders),
            do_find_field(Order,
                          true,
                          #{max => MaxOrder, min => MinOrder},
                          List1)
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
    case do_find_field2(Order, List) of
        false -> do_find_field(Order + 1, up, Info, List);
        Result -> Result
    end;
do_find_field(Order, _Flag = up, _Info = #{max := Max},
              _List)
    when Order > Max ->
    {false, lang:get("没有找到合适你的战区")};
do_find_field(Order, _Flag = up,
              _Info = #{max := Order}, List) ->
    case do_find_field2(Order, List) of
        false -> {false, lang:get("没有找到合适你的战区")};
        Result -> Result
    end;
do_find_field(Order, Flag = up, Info, List) ->
    case do_find_field2(Order, List) of
        false -> do_find_field(Order + 1, Flag, Info, List);
        Result -> Result
    end;
do_find_field(Order, Flag = down, Info, List) ->
    case do_find_field2(Order, List) of
        false -> do_find_field(Order - 1, Flag, Info, List);
        Result -> Result
    end.

do_find_field2(Order, List) ->
    Group = gold_league_data:order_group(Order),
    case lists:keyfind(Group,
                       #gold_league_zone.group_id,
                       List)
        of
        #gold_league_zone{is_close = 1} ->
            {false, lang:get("你被合并的战区已经结束")};
        Field = #gold_league_zone{} -> {ok, Field};
        _ -> false
    end.

apply_enter_ready_zone(Role = #role{id = RoleId,
                                    name = _Name},
                       {MapPlat, MapZoneId, MapId}, OpenMode, _CombatMode) ->
    logger:debug("角色进入准备地图", [], gold_league_mgr, 1668),
    case role_misc:check_event(Role, [2]) of
        {false, Reason} ->
            case OpenMode of
                1 -> cast({cancel_sign, RoleId});
                _ ->
                    cross:cast(gold_league_mgr,
                               cast,
                               [{cancel_sign, RoleId}])
            end,
            logger:debug("进入准备区地图~ts",
                         [Reason],
                         gold_league_mgr,
                         1675),
            role:link_send(Role, 20001, {0, Reason}),
            ok;
        true ->
            case role_fly:force_landing(Role) of
                {ok, DownRole} ->
                    {CrossType, ToPos} = get_enter_pos(OpenMode,
                                                       {MapPlat,
                                                        MapZoneId,
                                                        MapId}),
                    case map:role_enter(ToPos,
                                        DownRole#role{s_event = 52,
                                                      cross_type = CrossType})
                        of
                        {ok, EnterRole} ->
                            logger:debug("[~ts]成功进入准备区",
                                         [_Name],
                                         gold_league_mgr,
                                         1685),
                            role:link_send(EnterRole,
                                           20001,
                                           {1, lang:get("报名成功")}),
                            role_misc:push_cross(EnterRole),
                            case CrossType of
                                0 -> skip;
                                _ ->
                                    {ok, Ginfo} = role_convert:to(member,
                                                                  EnterRole),
                                    cross:cast(role_group,
                                               join,
                                               [center_world, Ginfo])
                            end,
                            {ok, EnterRole};
                        _Err ->
                            case OpenMode of
                                1 -> cast({cancel_sign, RoleId});
                                _ ->
                                    cross:cast(gold_league_mgr,
                                               cast,
                                               [{cancel_sign, RoleId}])
                            end,
                            logger:error("[~ts]进入准备区失败[Err:~w]",
                                         [_Name, _Err],
                                         gold_league_mgr,
                                         1700),
                            role:link_send(Role,
                                           20001,
                                           {0, lang:get("无法进入准备区，报名失败")}),
                            ok
                    end;
                _False ->
                    case OpenMode of
                        1 -> cast({cancel_sign, RoleId});
                        _ ->
                            cross:cast(gold_league_mgr,
                                       cast,
                                       [{cancel_sign, RoleId}])
                    end,
                    role:link_send(Role,
                                   20001,
                                   {0, lang:get("无法进入准备区，报名失败")}),
                    logger:debug("进入准备区地图失败[Err:~w]",
                                 [_False],
                                 gold_league_mgr,
                                 1710),
                    ok
            end
    end.

get_combat_mode({_CrossId, GroupId}, _AllCombatMode)
    when is_integer(GroupId) ->
    1;
get_combat_mode(Zone, _AllCombatMode) ->
    Zone#gold_league_ready_zone{init_combat_mode = 1,
                                combat_mode = 1}.

get_world_lev(1) ->
    case world_lev:get_world_lev() of
        {WorldLev, _} -> [{0, WorldLev}];
        _ -> [{0, 50}]
    end;
get_world_lev(2) ->
    CrossIdList = gold_league_utils:get_cross_list(),
    do_get_world_lev(CrossIdList, []);
get_world_lev(_) -> [{0, 50}].

do_get_world_lev([], LevList) -> LevList;
do_get_world_lev([{{P, Z}, CrossId} | T], LevList) ->
    GetWlev = case cross:call(P,
                              Z,
                              world_lev,
                              get_world_lev,
                              [])
                  of
                  {Wlev, _} when is_integer(Wlev) ->
                      logger:info("[~ts:~w]的世界等级[~w]",
                                  [P, Z, Wlev],
                                  gold_league_mgr,
                                  1777),
                      Wlev;
                  _ -> 60
              end,
    OldLev = case lists:keyfind(CrossId, 1, LevList) of
                 {_, Olev} -> Olev;
                 _ -> 0
             end,
    do_get_world_lev(T,
                     lists:keystore(CrossId,
                                    1,
                                    LevList,
                                    {CrossId, max(GetWlev, OldLev)}));
do_get_world_lev([_ | T], LevList) ->
    do_get_world_lev(T, LevList).

merge_combat_list(WorldLevList, DataList) ->
    merge_combat_list(WorldLevList, DataList, []).

merge_combat_list([], _, DataList) -> DataList;
merge_combat_list([{CrossId, Lev} | T], DataList,
                  NewDataList) ->
    Add = [{CrossId, GroupId, filter_lev(Rand, Lev)}
           || {GroupId, Rand} <- DataList],
    merge_combat_list(T, DataList, Add ++ NewDataList);
merge_combat_list([_ | T], DataList, NewDataList) ->
    merge_combat_list(T, DataList, NewDataList).

filter_lev(Rand, Lev) ->
    [Mode || {Mode, NeedLev} <- Rand, Lev >= NeedLev].

send_back(CrossId, RoleIds) when CrossId =:= 0 ->
    do_send_back(RoleIds);
send_back(CrossId, RoleIds) ->
    gold_league_utils:run_mfa({cross_id, CrossId},
                              gold_league_mgr,
                              do_send_back,
                              [RoleIds]).

do_send_back(RoleIds) ->
    logger:debug("=============== ~w",
                 [{env:get(platform),
                   env:get(zone_id),
                   env:get(gold_league_sign)}],
                 gold_league_mgr,
                 1809),
    SignList1 = case env:get(gold_league_sign) of
                    SignList when is_list(SignList) -> SignList;
                    _ -> []
                end,
    SuccessList = [Id
                   || Id <- RoleIds, role_misc:is_local_role(Id)],
    NoEnterRoleIds = SignList1 -- RoleIds,
    logger:debug("==================== ~w",
                 [RoleIds],
                 gold_league_mgr,
                 1816),
    logger:info("报名人数 ~w 成功进入战场玩家数量 ~w, 未进入战场人数 ~w",
                [length(SignList1),
                 length(SuccessList),
                 length(NoEnterRoleIds)],
                gold_league_mgr,
                1817),
    mail:send(NoEnterRoleIds,
              lang:get("参赛费用返还"),
              notice:format(lang:get("由于您未能参与~ts，现返还报名费用，请查收"),
                            [{string_2, 5, lang:get("钻石联赛")}]),
              [{90003, 5000}]),
    env:del(gold_league_sign),
    ok.

