-file("src/mod/arena/arena_mgr.erl", 1).

-module(arena_mgr).

-behaviour(gen_server).

-export([init_panel/1,
         push_count/1,
         push_graph/1,
         get_role/1,
         get_role_cup/1,
         login/1,
         sign/3,
         get_count/1,
         async_result/6,
         async_other_result/3,
         rename/1,
         update_setting/2,
         update_formation/2,
         get_self_data/1,
         get_enemy_def/2,
         list_arena_roles/2,
         make_graph/1,
         reset_five/2,
         levup/2]).

-export([start_link/0, cast/1, call/1, info/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state,
        {rank_list = [],
         last_rank_list = [],
         last_join = [],
         today_join = []}).

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

-file("src/mod/arena/arena_mgr.erl", 47).

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

-file("src/mod/arena/arena_mgr.erl", 48).

-file("inc/arena.hrl", 1).

-record(m_arena,
        {ver = 1,
         cd_time = 0 :: non_neg_integer(),
         acc_num = 0 :: non_neg_integer(),
         cup = 1000 :: non_neg_integer(),
         roll_time = 0,
         roll_id = 0,
         roll_graph = []}).

-record(arena_role,
        {id = {0, "", 0} :: tuple(),
         ver = 6,
         name = "" :: bitstring(),
         win = 0 :: non_neg_integer(),
         acc_num = 0,
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         last_time = 0 :: non_neg_integer(),
         is_robot = 0 :: 0..1,
         cup = 0,
         next_log_id = 1,
         log = [],
         win_list = [],
         win_ratio = 0,
         day_time_flag = 0,
         enemy = [],
         day_win = 0,
         day_lost = 0,
         def_acc_num = 0,
         def_win = 0,
         max_cup = 1000,
         acc_sword_num = 0,
         acc_mage_num = 0,
         acc_archer_num = 0,
         acc_orc_num = 0,
         acc_devine_num = 0,
         acc_moon_num = 0,
         acc_templar_num = 0,
         win_sword = 0,
         win_mage = 0,
         win_archer = 0,
         win_orc = 0,
         win_devine = 0,
         win_moon = 0,
         win_templar = 0,
         init_def = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         last_win_role}).

-record(arena_enemy,
        {order = 0,
         role_id = {0, "", 0},
         is_robot = 0,
         classes = 0,
         lev = 0,
         sex = 0,
         cup = 0,
         soul = 1}).

-record(arena_log,
        {log_id = 1,
         s_role_id = {0, "", 0} :: tuple(),
         s_name = "" :: list(),
         result = 0 :: 0..1,
         t_role_id = {0, "", 0} :: tuple(),
         t_name = "" :: list(),
         time = 0 :: non_neg_integer(),
         s_cup = 0,
         t_cup = 0,
         s_cup_change = 0,
         t_cup_change = 0,
         feedback = 0}).

-record(arena_role_index,
        {id = {0, "", 0},
         lev = 0,
         cup = 0,
         time = 0,
         day_time_flag = 0,
         day_win = 0,
         day_lost = 0,
         win_list = [],
         win_ratio = 0}).

-record(arena_robot,
        {id = {0, "robot", 0},
         lev = 0,
         name = "",
         classes = 0,
         sex = 0,
         cup = 0}).

-record(arena_graph,
        {id = 1,
         base_id = 0,
         num = 0,
         status = 0,
         quality = 0}).

-record(arena_graph_base,
        {id = 1,
         base_id = 0,
         num = 0,
         quality = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev_low = 0,
         lev_high = 0,
         ratio = 0,
         times = 1,
         order_list = []}).

-file("src/mod/arena/arena_mgr.erl", 49).

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

-file("src/mod/arena/arena_mgr.erl", 50).

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

-file("src/mod/arena/arena_mgr.erl", 51).

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

-file("src/mod/arena/arena_mgr.erl", 52).

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

-file("src/mod/arena/arena_mgr.erl", 53).

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

-file("src/mod/arena/arena_mgr.erl", 54).

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

-file("src/mod/arena/arena_mgr.erl", 55).

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

-file("src/mod/arena/arena_mgr.erl", 56).

-file("inc/formation.hrl", 1).

-record(m_formation,
        {id = 1, lev = 1, pos = 1, forms = [], team_form = []}).

-record(formation, {id = 0, lev = 0, exp = 0}).

-record(formation_data,
        {id = 0,
         type = 1,
         lev = 0,
         max_lev = 1,
         name = "",
         pos_desc = [],
         attr_1 = [],
         attr_2 = [],
         attr_3 = [],
         attr_4 = [],
         attr_5 = [],
         pet_attr = [],
         strong_restrain = [],
         weak_restrain = [],
         next_exp = 0,
         need_item = [],
         item_id = 0}).

-file("src/mod/arena/arena_mgr.erl", 57).

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

-file("src/mod/arena/arena_mgr.erl", 58).

-file("inc/robot.hrl", 1).

-record(robot_role,
        {ver = 4,
         id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         face = 0,
         ai_id = 0,
         skills = [],
         talents = [],
         pet,
         backup_pets = [],
         guard,
         slave = [],
         attr :: undefined | tuple(),
         looks = [],
         time = 0,
         m_formation,
         pet_fc = 0,
         all_fc = 0,
         cup = 1000,
         m_lev_break}).

-record(robot_role_index,
        {id = {0, "", 0} :: tuple(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         pet_fc = 0,
         cup = 1000,
         all_fc = 0,
         time = 0}).

-file("src/mod/arena/arena_mgr.erl", 59).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/mod/arena/arena_mgr.erl", 60).

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

-file("src/mod/arena/arena_mgr.erl", 61).

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

-file("src/mod/arena/arena_mgr.erl", 62).

cast(Args) -> gen_server:cast(arena_mgr, Args).

call(Args) ->
    case catch gen_server:call(arena_mgr, Args, 10000) of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Args) -> arena_mgr ! Args.

start_link() ->
    gen_server:start_link({local, arena_mgr},
                          arena_mgr,
                          [],
                          []).

init_panel(Role = #role{id = RoleId}) ->
    RoleFc = attr:get_war_fc(Role),
    case get_role(RoleId) of
        {ok, #arena_role{enemy = []}} ->
            case call({get_enemy,
                       RoleId,
                       RoleFc,
                       arena:to_arena_role(Role)})
                of
                {true, {Cup, Enemy, ArenaLog}} ->
                    {true, Cup, Enemy, ArenaLog};
                false -> false;
                _ -> false
            end;
        {ok,
         #arena_role{cup = Cup, enemy = Enemy,
                     log = ArenaLog}} ->
            {true, Cup, Enemy, ArenaLog};
        null ->
            robot_mgr:update(Role),
            case call({get_enemy,
                       RoleId,
                       RoleFc,
                       arena:to_arena_role(Role)})
                of
                {true, {Cup, Enemy, ArenaLog}} ->
                    {true, Cup, Enemy, ArenaLog};
                false -> false;
                _ -> false
            end;
        _ -> false
    end.

sign(Role = #role{id = RoleId}, OldLev, NewLev)
    when OldLev < 20 andalso NewLev >= 20 ->
    robot_mgr:update(Role),
    cast({sign, RoleId, arena:to_arena_role(Role)}),
    ok;
sign(Role = #role{id = RoleId}, OldLev, NewLev)
    when OldLev < NewLev andalso NewLev >= 20 ->
    cast({sign_update, RoleId, arena:to_arena_role(Role)}),
    ok;
sign(_, _, _) -> ok.

rename(Role = #role{id = RoleId, lev = Lev})
    when Lev >= 20 ->
    cast({sign_update, RoleId, arena:to_arena_role(Role)}),
    ok;
rename(_) -> ok.

get_self_data(#role{id = RoleId, pid = RolePid,
                    m_pet = #m_pet{pets = Pets}}) ->
    GetPetId = case lists:keyfind(1, #pet.is_first, Pets) of
                   #pet{id = PetId} -> PetId;
                   _ -> 0
               end,
    cast({get_self_data, RoleId, RolePid, GetPetId}),
    ok.

update_setting(#role{id = RoleId, pid = RolePid,
                     m_formation = #m_formation{forms = FormList},
                     m_guard = #m_guard{guards = GuardList}},
               {FormationId, GuardIds}) ->
    case lists:keyfind(FormationId, #formation.id, FormList)
        of
        #formation{lev = FormationLev} ->
            case do_update_check(GuardIds, GuardList) of
                true ->
                    cast({update_setting,
                          RoleId,
                          RolePid,
                          FormationId,
                          FormationLev,
                          GuardIds}),
                    ok;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("没有激活该阵法，无法设置")}
    end.

update_formation(#role{id = RoleId, pid = RolePid},
                 {FormationId, FormationLev}) ->
    cast({update_formation,
          RoleId,
          RolePid,
          FormationId,
          FormationLev}).

do_update_check([], _GuardList) -> true;
do_update_check([{GuardId, _Pos} | T], GuardList) ->
    case lists:keytake(GuardId, #guard.base_id, GuardList)
        of
        {value, _, GuardList1} ->
            do_update_check(T, GuardList1);
        false -> {false, lang:get("没有招募的守护无法设置出战")}
    end.

login(Role = #role{id = RoleId, m_arena = Marena}) ->
    NewMarea = case get_role_cup(RoleId) of
                   {ok, Cup} -> Marena#m_arena{cup = Cup};
                   _ -> Marena
               end,
    NewRole = Role#role{m_arena = NewMarea},
    NewRole1 = check_graph(NewRole),
    friend:update(friend_role, NewRole1),
    {ok, NewRole1}.

reset_five(Role = #role{id = RoleId, lev = Lev,
                        m_arena = Marena},
           _OldRole)
    when Lev >= 23 ->
    RollGraph = make_graph(Role),
    NewMarena = Marena#m_arena{roll_graph = RollGraph,
                               roll_id = 0, roll_time = 0},
    NewRole = Role#role{m_arena = NewMarena},
    push_graph(NewRole),
    case arena_mgr:get_role(RoleId) of
        {ok, #arena_role{}} ->
            RoleFc = attr:get_war_fc(Role),
            case arena_mgr:call({get_enemy,
                                 RoleId,
                                 RoleFc,
                                 arena:to_arena_role(NewRole)})
                of
                {true, {_, Enemy, _}} ->
                    role:link_send(NewRole, 12202, {1, "", Enemy});
                _ -> skip
            end;
        _ -> skip
    end,
    {ok, NewRole};
reset_five(_, _) -> ok.

levup(Role = #role{lev = Lev, m_arena = Marena}, OldLev)
    when Lev >= 23 andalso OldLev < 23 ->
    RollGraph = make_graph(Role),
    NewMarena = Marena#m_arena{roll_graph = RollGraph,
                               roll_id = 0},
    NewRole = Role#role{m_arena = NewMarena},
    push_graph(NewRole),
    NewRole;
levup(Role, _) -> Role.

check_graph(Role = #role{m_arena =
                             Marena = #m_arena{roll_graph = []},
                         lev = Lev})
    when Lev >= 23 ->
    RollGraph = make_graph(Role),
    NewMarena = Marena#m_arena{roll_graph = RollGraph,
                               roll_id = 0},
    NewRole = Role#role{m_arena = NewMarena},
    push_graph(NewRole),
    NewRole;
check_graph(Role) -> Role.

push_graph(Role = #role{m_arena = Marena}) ->
    role:link_send(Role, 12211, {Marena});
push_graph(_) -> ok.

make_graph(Role) ->
    GraphList = arena_data:get_graph(),
    GraphList1 = check_role_cond(Role, GraphList),
    make_graph(GraphList1, 16, []).

make_graph(_GraphList, Order, Graph) when Order =< 0 ->
    Graph;
make_graph(GraphList, Order, Graph) ->
    GraphList1 = [G
                  || G = #arena_graph_base{order_list = OrderList}
                         <- GraphList,
                     lists:member(Order, OrderList)],
    case do_make_graph(GraphList1) of
        {true, GetG = #arena_graph_base{id = Id, times = Times}}
            when Times =< 0 ->
            NewGraphList = lists:keydelete(Id,
                                           #arena_graph_base.id,
                                           GraphList),
            NewG = to_arena_graph(GetG, Order),
            make_graph(NewGraphList, Order - 1, [NewG | Graph]);
        {true, GetG = #arena_graph_base{id = Id}} ->
            NewGraphList = lists:keystore(Id,
                                          #arena_graph_base.id,
                                          GraphList,
                                          GetG),
            NewG = to_arena_graph(GetG, Order),
            make_graph(NewGraphList, Order - 1, [NewG | Graph]);
        false ->
            logger:error("无法抽取竞技场胜利之路数据[~w:~w]",
                         [GraphList, Order],
                         arena_mgr,
                         261),
            make_graph(GraphList, Order - 1, Graph)
    end.

to_arena_graph(#arena_graph_base{base_id = BaseId,
                                 num = Num, quality = Quality},
               Order) ->
    #arena_graph{id = Order, base_id = BaseId, num = Num,
                 quality = Quality}.

do_make_graph([]) -> false;
do_make_graph(GraphList) ->
    G = #arena_graph_base{times = Times} =
            util:rand_list(GraphList, #arena_graph_base.ratio),
    NewG = G#arena_graph_base{times = Times - 1},
    {true, NewG}.

check_role_cond(#role{sex = Sex, lev = Lev,
                      classes = Classes},
                List) ->
    check_role_cond(Sex, Lev, Classes, List, []).

check_role_cond(_Sex, _Lev, _Classes, [], List) -> List;
check_role_cond(Sex, Lev, Classes,
                [H = #arena_graph_base{sex = Sex1, lev_low = LevLow,
                                       lev_high = LevHigh, classes = Classes1}
                 | T],
                List)
    when (Sex1 =:= Sex orelse Sex1 =:= 2) andalso
             (Classes1 =:= Classes orelse Classes1 =:= 0) andalso
                 (LevLow =:= 0 andalso LevHigh =:= 0 orelse
                      LevLow =:= 0 andalso Lev =< LevHigh orelse
                          Lev >= LevLow andalso LevHigh =:= 0 orelse
                              Lev >= LevLow andalso Lev =< LevHigh) ->
    check_role_cond(Sex, Lev, Classes, T, [H | List]);
check_role_cond(Sex, Lev, Classes, [_ | T], List) ->
    check_role_cond(Sex, Lev, Classes, T, List).

push_count(Role = #role{m_arena =
                            #m_arena{roll_time = RollTime}}) ->
    {_, HasTimes} = get_count(Role),
    Score = var:get_var(Role, day_five, 120, 0),
    role:link_send(Role,
                   12205,
                   {HasTimes, Score, RollTime}),
    ok.

get_count(Role) ->
    Times = var:get_var(Role, day_five, 102, 0),
    {5, max(0, 5 - Times)}.

get_enemy_def(Role = #role{id = RoleId,
                           m_arena = #m_arena{acc_num = AccNum},
                           m_guard = Mguard},
              Order) ->
    case arena_mgr:get_role(RoleId) of
        {ok, #arena_role{enemy = Enemy}} ->
            case lists:keyfind(Order, #arena_enemy.order, Enemy) of
                #arena_enemy{is_robot = 1} ->
                    NewMguard = arena:first_fight(Mguard, AccNum),
                    {ok, #robot_role{guard = Guards}} =
                        role_convert:to(robot_role,
                                        Role#role{m_guard = NewMguard}),
                    Guards1 = [{GuardId, WarId}
                               || #c_guard{base_id = GuardId, war_id = WarId}
                                      <- Guards,
                                  WarId =/= 0],
                    {true, Guards1};
                #arena_enemy{role_id = OtherRoleId} ->
                    case arena_mgr:get_role(OtherRoleId) of
                        {ok, #arena_role{init_def = 1, guards = Guards}} ->
                            {true, Guards};
                        _ -> ok
                    end;
                _ -> {false, lang:get("无法找到对手信息")}
            end;
        _ -> {false, lang:get("没有参加过竞技场")}
    end.

get_role(RoleId) ->
    case catch ets:lookup(arena_role, RoleId) of
        [R = #arena_role{}] -> {ok, R};
        [] -> null;
        _ -> false
    end.

get_role_cup(RoleId) ->
    case catch ets:lookup_element(arena_role,
                                  RoleId,
                                  #arena_role.cup)
        of
        Cup when is_integer(Cup) -> {ok, Cup};
        _ -> false
    end.

save_log(Key, Val) ->
    ets:insert(arena_log, {Key, Val}),
    dets:insert(arena_log, {Key, Val}),
    ok.

get_log(Key) ->
    case catch ets:lookup(arena_log, Key) of
        [{_, Val}] -> Val;
        [] -> null;
        _ -> undefined
    end.

-spec list_arena_roles(Ms :: term(),
                       Limit :: pos_integer()) -> [#arena_role{}].

list_arena_roles(Ms, Limit) ->
    case catch ets:select(arena_role, Ms, Limit) of
        {Match, _Continue} -> Match;
        '$end_of_table' -> [];
        _False ->
            logger:error("查询竞技场角色数据:~w, False:~w",
                         [Ms, _False],
                         arena_mgr,
                         370),
            []
    end.

init([]) ->
    logger:info("[~w] 正在启动...",
                [arena_mgr],
                arena_mgr,
                378),
    process_flag(trap_exit, true),
    dets:open_file(arena_role,
                   [{file, "./dets/arena_role.dets"},
                    {keypos, #arena_role.id}]),
    dets:open_file(arena_log,
                   [{file, "./dets/arena_log.dets"}, {keypos, 1}]),
    ets:new(arena_role,
            [set, named_table, public, {keypos, #arena_role.id}]),
    ets:new(arena_log,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(arena_log, arena_log),
    case do_init() of
        State = #state{} ->
            Ref1 = erlang:send_after(date:next_diff(5, 0, 1) * 1000,
                                     self(),
                                     five_update_join),
            Ref2 = erlang:send_after(date:next_diff(0, 0, 1) * 1000,
                                     self(),
                                     zero_update_rank),
            put(five_update_ref, Ref1),
            put(zero_update_ref, Ref2),
            logger:info("[~w] 启动完成", [arena_mgr], arena_mgr, 391),
            {ok, State};
        _Err ->
            logger:error("竞技场数据载入失败:~w", [_Err], arena_mgr, 394),
            {stop, date_load_err}
    end.

handle_call({get_enemy, RoleId, RoleFc, InitRole},
            _From, State) ->
    ArenaRole = case get_role(RoleId) of
                    {ok, OldArenaRole} ->
                        update_old(OldArenaRole, InitRole);
                    null -> InitRole;
                    _ -> false
                end,
    Reply = case ArenaRole of
                #arena_role{cup = Cup, day_time_flag = DayTimeFlag,
                            day_win = DayWin, day_lost = DayLost, log = Log,
                            acc_num = 0} ->
                    SameDay = date:is_same_five_reset(DayTimeFlag,
                                                      date:unixtime()),
                    {NewDayFlag, NewDayWin, NewDayLost} = case SameDay of
                                                              true ->
                                                                  {DayTimeFlag,
                                                                   DayWin,
                                                                   DayLost};
                                                              false ->
                                                                  {date:unixtime(),
                                                                   0,
                                                                   0}
                                                          end,
                    Enemy = robot_list(ArenaRole),
                    NewArenaRole = ArenaRole#arena_role{enemy = Enemy,
                                                        day_time_flag =
                                                            NewDayFlag,
                                                        day_win = NewDayWin,
                                                        day_lost = NewDayLost},
                    update_role(NewArenaRole),
                    {true, {Cup, Enemy, Log}};
                #arena_role{cup = Cup, day_time_flag = DayTimeFlag,
                            day_win = DayWin, day_lost = DayLost, log = Log} ->
                    SameDay = date:is_same_five_reset(DayTimeFlag,
                                                      date:unixtime()),
                    {NewDayFlag, NewDayWin, NewDayLost} = case SameDay of
                                                              true ->
                                                                  {DayTimeFlag,
                                                                   DayWin,
                                                                   DayLost};
                                                              false ->
                                                                  {date:unixtime(),
                                                                   0,
                                                                   0}
                                                          end,
                    Enemy = range_list(ArenaRole, RoleFc, State),
                    NewArenaRole = ArenaRole#arena_role{enemy = Enemy,
                                                        day_time_flag =
                                                            NewDayFlag,
                                                        day_win = NewDayWin,
                                                        day_lost = NewDayLost},
                    update_role(NewArenaRole),
                    {true, {Cup, Enemy, Log}};
                _ -> false
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({sign, RoleId, InitRole}, State) ->
    case get_role(RoleId) of
        null ->
            NewArenaRole = InitRole#arena_role{day_time_flag =
                                                   date:unixtime()},
            update_role(NewArenaRole),
            {noreply, State};
        _ -> {noreply, State}
    end;
handle_cast({sign_update, RoleId, InitRole}, State) ->
    NewArenaRole = case get_role(RoleId) of
                       {ok, OldArenaRole} ->
                           update_old(OldArenaRole, InitRole);
                       null -> InitRole;
                       _ -> false
                   end,
    case NewArenaRole of
        #arena_role{} -> update_role(NewArenaRole);
        _ -> skip
    end,
    {noreply, State};
handle_cast({get_self_data, RoleId, RolePid, PetId},
            State) ->
    MaxWorldCup = get(world_max_cup),
    case get_role(RoleId) of
        {ok, ArenaRole = #arena_role{}} ->
            role:pack_send(RolePid,
                           12206,
                           {MaxWorldCup, ArenaRole, PetId});
        _ -> skip
    end,
    {noreply, State};
handle_cast({combat_over,
             Spid,
             SRoleId,
             _,
             Result,
             FeedBack,
             {true, RobotArgs},
             RoleFc,
             AddSoul,
             Record,
             _,
             CombatStatistics},
            State) ->
    NewState = case get_role(SRoleId) of
                   {ok, SRole = #arena_role{}} ->
                       {SRole1, BaseLog} = calc_combat_over(SRole,
                                                            RobotArgs,
                                                            Result,
                                                            FeedBack,
                                                            Record),
                       NewSRole = recalc(SRole1, atk, Result),
                       Enemy = range_list(NewSRole, RoleFc, State),
                       role:pack_send(Spid, 12202, {1, "", Enemy}),
                       NewSRole1 = NewSRole#arena_role{enemy = Enemy},
                       update_role(NewSRole1),
                       push_result(Spid,
                                   Result,
                                   NewSRole1,
                                   AddSoul,
                                   BaseLog,
                                   CombatStatistics),
                       update_state(State, [{1, NewSRole1}]);
                   _ -> State
               end,
    {noreply, NewState};
handle_cast({combat_over,
             Spid,
             SRoleId,
             TRoleId,
             Result,
             FeedBack,
             _RobotArgs,
             RoleFc,
             AddSoul,
             Record,
             Round,
             CombatStatistics},
            State = #state{last_rank_list = LastRankList}) ->
    NewState = case get_role(SRoleId) of
                   {ok, SRole = #arena_role{lev = SLev}} ->
                       case get_role(TRoleId) of
                           {ok, TRole = #arena_role{lev = TLev}} ->
                               SRank1 = case lists:keyfind(SRoleId,
                                                           1,
                                                           LastRankList)
                                            of
                                            {_, SRank} -> SRank;
                                            _ -> 0
                                        end,
                               TRank1 = case lists:keyfind(TRoleId,
                                                           1,
                                                           LastRankList)
                                            of
                                            {_, TRank} -> TRank;
                                            _ -> 0
                                        end,
                               NewFeedBack = case FeedBack of
                                                 {true, OldLogId}
                                                     when Result =:= 1 ->
                                                     {true, OldLogId};
                                                 _ ->
                                                     case SRank1 >= 1 andalso
                                                              SRank1 =< 50
                                                                  andalso
                                                                  TRank1 >= 1
                                                                      andalso
                                                                      TRank1 =<
                                                                          50
                                                         of
                                                         true -> {true, 0};
                                                         _ -> FeedBack
                                                     end
                                             end,
                               case NewFeedBack of
                                   {true, 0} when Round >= 5 ->
                                       if SLev >= 40 andalso TLev >= 40 ->
                                              combat_record:save(#{ids =>
                                                                       [SRoleId,
                                                                        TRoleId],
                                                                   record =>
                                                                       Record,
                                                                   is_marvel =>
                                                                       true});
                                          SLev >= 40 ->
                                              combat_record:save(#{ids =>
                                                                       [SRoleId],
                                                                   record =>
                                                                       Record,
                                                                   is_marvel =>
                                                                       true});
                                          TLev >= 40 ->
                                              combat_record:save(#{ids =>
                                                                       [TRoleId],
                                                                   record =>
                                                                       Record,
                                                                   is_marvel =>
                                                                       true});
                                          true -> ok
                                       end;
                                   _ when SLev >= 40 andalso TLev >= 40 ->
                                       combat_record:save(#{ids =>
                                                                [SRoleId,
                                                                 TRoleId],
                                                            record => Record,
                                                            is_marvel =>
                                                                false});
                                   _ when SLev >= 40 ->
                                       combat_record:save(#{ids => [SRoleId],
                                                            record => Record,
                                                            is_marvel =>
                                                                false});
                                   _ when TLev >= 40 ->
                                       combat_record:save(#{ids => [TRoleId],
                                                            record => Record,
                                                            is_marvel =>
                                                                false});
                                   _ -> ok
                               end,
                               {SRole1, TRole1, BaseLog} =
                                   calc_combat_over(SRole,
                                                    TRole,
                                                    Result,
                                                    NewFeedBack,
                                                    Record),
                               NewSRole = recalc(SRole1, atk, Result),
                               NewTRole = recalc(TRole1, def, Result),
                               update_role(NewTRole),
                               NewSRole2 = case Result of
                                               1 ->
                                                   NewSRole1 =
                                                       NewSRole#arena_role{last_win_role
                                                                               =
                                                                               TRoleId},
                                                   Enemy = range_list(NewSRole1,
                                                                      RoleFc,
                                                                      State),
                                                   role:pack_send(Spid,
                                                                  12202,
                                                                  {1,
                                                                   "",
                                                                   Enemy}),
                                                   NewSRole1#arena_role{enemy =
                                                                            Enemy};
                                               _ -> NewSRole
                                           end,
                               update_role(NewSRole2),
                               push_result(Spid,
                                           Result,
                                           NewSRole2,
                                           AddSoul,
                                           BaseLog,
                                           CombatStatistics),
                               push_other_result(TRoleId, NewTRole),
                               update_state(State,
                                            [{1, NewSRole2}, {0, NewTRole}]);
                           _ -> State
                       end;
                   _ -> State
               end,
    {noreply, NewState};
handle_cast({update_setting,
             RoleId,
             RolePid,
             FormationId,
             FormationLev,
             GuardIds},
            State) ->
    case get_role(RoleId) of
        {ok, ArenaRole = #arena_role{guards = ArenaGuards}} ->
            case length(GuardIds) >= length(ArenaGuards) of
                true ->
                    NewArenaRole = ArenaRole#arena_role{init_def = 1,
                                                        formation = FormationId,
                                                        formation_lev =
                                                            FormationLev,
                                                        guards = GuardIds},
                    update_role(NewArenaRole),
                    role:pack_send(RolePid,
                                   12207,
                                   {1,
                                    lang:get("防御阵型设置成功"),
                                    FormationId,
                                    FormationLev,
                                    GuardIds}),
                    {noreply, State};
                false ->
                    role:pack_send(RolePid,
                                   12207,
                                   {0, lang:get("该守护已经上阵"), 1, 1, []}),
                    {noreply, State}
            end;
        _ -> {noreply, State}
    end;
handle_cast({update_formation,
             RoleId,
             RolePid,
             FormationId,
             FormationLev},
            State) ->
    case get_role(RoleId) of
        {ok,
         ArenaRole = #arena_role{formation = FormationId,
                                 guards = GuardIds, init_def = 1}} ->
            NewArenaRole = ArenaRole#arena_role{formation_lev =
                                                    FormationLev},
            update_role(NewArenaRole),
            role:pack_send(RolePid,
                           12207,
                           {1, "", FormationId, FormationLev, GuardIds}),
            {noreply, State};
        _ -> {noreply, State}
    end;
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(zero_update_rank,
            State = #state{rank_list = RankList,
                           last_join = LastJoin, today_join = TodayJoin}) ->
    logger:info("0点更新排行榜排名", [], arena_mgr, 593),
    OldRef = get(zero_update_ref),
    case is_reference(OldRef) of
        true -> catch erlang:cancel_timer(OldRef);
        false -> skip
    end,
    Now = date:unixtime(),
    env:del(arena_fashion),
    {RankList1, LastRankList} = calc_reward(RankList,
                                            1,
                                            Now,
                                            TodayJoin,
                                            LastJoin,
                                            0,
                                            1,
                                            [],
                                            []),
    rank_zone:cast(30,
                   {replace, 30, RankList1, #{reward => 1}}),
    Ref = erlang:send_after(date:next_diff(0, 0, 1) * 1000,
                            self(),
                            zero_update_rank),
    NewState = State#state{last_rank_list = LastRankList},
    save_log(arena_log,
             {RankList, LastRankList, LastJoin, TodayJoin}),
    log:rank(RankList1, 30),
    put(zero_update_ref, Ref),
    {noreply, NewState};
handle_info(reset_ten, State) ->
    logger:info("清除10点定时器", [], arena_mgr, 614),
    OldRef = get(ten_update_ref),
    case is_reference(OldRef) of
        true -> catch erlang:cancel_timer(OldRef);
        false -> skip
    end,
    erase(ten_update_ref),
    logger:info("增加12点定时器", [], arena_mgr, 622),
    OldRef1 = get(zero_update_ref),
    case is_reference(OldRef1) of
        true -> catch erlang:cancel_timer(OldRef1);
        false -> skip
    end,
    Ref1 = erlang:send_after(date:next_diff(0, 0, 1) * 1000,
                             self(),
                             zero_update_rank),
    put(zero_update_ref, Ref1),
    {noreply, State};
handle_info(five_update_join,
            State = #state{rank_list = RankList,
                           last_rank_list = LastRankList,
                           today_join = TodayJoin}) ->
    logger:info("5点更新竞技场参与", [], arena_mgr, 634),
    OldRef = get(five_update_ref),
    case is_reference(OldRef) of
        true -> catch erlang:cancel_timer(OldRef);
        false -> skip
    end,
    NewState = State#state{last_join = TodayJoin,
                           today_join = []},
    save_log(arena_log,
             {RankList, LastRankList, TodayJoin, []}),
    Ref = erlang:send_after(date:next_diff(5, 0, 1) * 1000,
                            self(),
                            five_update_join),
    put(five_update_ref, Ref),
    {noreply, NewState};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [arena_mgr],
                arena_mgr,
                650),
    dets:close(arena_role),
    logger:info("[~w] 关闭完成", [arena_mgr], arena_mgr, 652),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

calc_reward([], _Num, _Now, TodayJoin, LastJoin,
            FirstCup, SendFlag, RankList, LastRankList) ->
    lists:foreach(fun ({RoleId, Cup}) ->
                          send_reward(SendFlag,
                                      {RoleId, Cup},
                                      101,
                                      FirstCup,
                                      TodayJoin,
                                      LastJoin)
                  end,
                  TodayJoin),
    {lists:reverse(RankList), LastRankList};
calc_reward([Arena = #arena_role{id = RoleId, cup = Cup}
             | T],
            Num, Now, TodayJoin, LastJoin, FirstCup, SendFlag,
            RankList, LastRankList) ->
    Rc = to_rank_list(Arena, Now),
    NewTodayJoin = send_reward(SendFlag,
                               Arena,
                               Num,
                               FirstCup,
                               TodayJoin,
                               LastJoin),
    case Num =:= 1 of
        true ->
            calc_reward(T,
                        Num + 1,
                        Now,
                        NewTodayJoin,
                        LastJoin,
                        Cup,
                        SendFlag,
                        [Rc | RankList],
                        [{RoleId, Num} | LastRankList]);
        false ->
            calc_reward(T,
                        Num + 1,
                        Now,
                        NewTodayJoin,
                        LastJoin,
                        FirstCup,
                        SendFlag,
                        [Rc | RankList],
                        [{RoleId, Num} | LastRankList])
    end;
calc_reward([_Arena | T], Num, Now, TodayJoin, LastJoin,
            FirstCup, SendFlag, RankList, LastRankList) ->
    logger:error("无法给[~w]发送竞技场[~w]奖励",
                 [_Arena, Num],
                 arena_mgr,
                 680),
    calc_reward(T,
                Num,
                Now,
                TodayJoin,
                LastJoin,
                FirstCup,
                SendFlag,
                RankList,
                LastRankList).

to_rank_list(#arena_role{id =
                             {RoleId, Platform, ZoneId},
                         name = Name, sex = Sex, classes = Classes, cup = Cup,
                         lev = Lev},
             Now) ->
    RankRc = #rank_rc{id = {RoleId, Platform, ZoneId},
                      role_id = RoleId, platform = Platform, zone_id = ZoneId,
                      name = Name, sex = Sex, classes = Classes, lev = Lev,
                      time = Now, val1 = Cup},
    RankRc.

send_reward(0, _Arena, _Num, _FirstCup, TodayJoin,
            _LastJoin) ->
    TodayJoin;
send_reward(1,
            #arena_role{id = RoleId, sex = _Sex, name = Name,
                        cup = Cup, classes = Classes},
            Num, FirstCup, TodayJoin, LastJoin) ->
    StarsScore = arena_data:get_reward(Num),
    ItemNum = arena_data:get_item(Num),
    Title = lang:get("竞技场结算"),
    TodayFlag = lists:keymember(RoleId, 1, TodayJoin),
    LastFlag = lists:keymember(RoleId, 1, LastJoin),
    TItem = case ItemNum > 0 of
                true -> [{22592, ItemNum}];
                _ -> []
            end,
    FashionItem = get_fashion({Classes, Num}),
    Item = TItem ++ FashionItem,
    case FashionItem of
        [_ | _] ->
            NArenaFashion = case env:get(arena_fashion) of
                                ArenaFashion when is_list(ArenaFashion) ->
                                    ArenaFashion;
                                _ -> []
                            end,
            NewArenaFashion = NArenaFashion ++
                                  [{RoleId, Name, Classes}],
            env:save(arena_fashion, NewArenaFashion);
        _ -> ignore
    end,
    Result = case {TodayFlag, LastFlag} of
                 {true, _} when Num =:= 1 ->
                     {notice:format(lang:get("恭喜您在昨日竞技场中以~w杯获得~ts的成绩！请继续努力，捍卫自己的荣誉！进入排行榜前50"
                                             "名，获得~ts身份，挑战者将无法看见您的职业与杯数，神秘高手之间不可反击。"),
                                    [Cup,
                                     {string_2, 4, lang:get("全服第一")},
                                     {string_2, 5, lang:get("神秘高手")}]),
                      [{90012, StarsScore}],
                      Item};
                 {true, _} when Num >= 2 andalso Num =< 10 ->
                     {notice:format(lang:get("您在昨日竞技场中以~w杯获得~ts的成绩，离“全服第一”仅差~w分，请勇敢去超越！进入排行"
                                             "榜前50名，获得~ts身份，挑战者将无法看见您的职业与杯数，神秘高手之间不可反击。"),
                                    [Cup,
                                     {string_2,
                                      4,
                                      util:flist(lang:get("第~w名"), [Num])},
                                     FirstCup - Cup,
                                     {string_2, 5, lang:get("神秘高手")}]),
                      [{90012, StarsScore}],
                      Item};
                 {true, _} when Num > 10 andalso Num =< 50 ->
                     {notice:format(lang:get("您在昨日竞技场中以~w杯获得第~w名的成绩，请继续加油！进入排行榜前50名，获得~ts身份"
                                             "，挑战者将无法看见您的职业与杯数，神秘高手之间不可反击。"),
                                    [Cup,
                                     Num,
                                     {string_2, 5, lang:get("神秘高手")}]),
                      [{90012, StarsScore}],
                      Item};
                 {true, _} ->
                     {notice:format(lang:get("您在昨日竞技场中以~w杯获得第~w名的成绩，请继续加油！"),
                                    [Cup, Num]),
                      [{90012, StarsScore}],
                      Item};
                 {false, true} ->
                     {notice:format(lang:get("您昨日未参与竞技场，无法获得结算奖励，当前排名为第~w名，至少损失了~w点星辰积分。今天请"
                                             "加油，拿回您应得的！"),
                                    [Num, StarsScore]),
                      [],
                      []};
                 _ -> false
             end,
    case Result of
        {Content, Assets, Item1} ->
            mail:send(RoleId,
                      #{title => Title, content => Content,
                        items => Assets ++ Item1});
        _ -> skip
    end,
    case TodayFlag of
        true -> lists:keydelete(RoleId, 1, TodayJoin);
        false -> TodayJoin
    end;
send_reward(1, {RoleId, Cup}, Num, _FirstCup,
            _TodayJoin, _LastJoin) ->
    StarsScore = arena_data:get_reward(Num),
    ItemNum = arena_data:get_item(Num),
    Title = lang:get("竞技场结算"),
    Content =
        util:flist(lang:get("根据您在昨日竞技场中~w杯的成绩，获得如下奖励，请继续加油！"),
                   [Cup]),
    Assets = [{90012, StarsScore}],
    Item = case ItemNum > 0 of
               true -> [{22592, ItemNum}];
               false -> []
           end,
    mail:send(RoleId,
              #{title => Title, content => Content,
                items => Assets ++ Item}),
    ok.

push_result(Pid, Result,
            #arena_role{cup = Cup, log = Log}, AddSoul, BaseLog,
            CombatStatistics) ->
    {AddSoul1, AddRollTime} = case Result of
                                  1 -> {AddSoul, 1};
                                  _ -> {0, 0}
                              end,
    LastCombatStatistics = do_make_statistics(Result,
                                              BaseLog,
                                              CombatStatistics),
    role:apply(async,
               Pid,
               {arena_mgr,
                async_result,
                [{Cup, Log},
                 Result,
                 AddSoul1,
                 AddRollTime,
                 LastCombatStatistics]}),
    ok.

do_make_statistics(Result,
                   #arena_log{s_cup = SCup, s_cup_change = SCupChange,
                              t_cup = TCup, t_cup_change = TCupChange},
                   {#{data := Sdata}, T = #{data := Tdata}}) ->
    case maps:get(role, T, undefined) of
        {RoleId, RoleName, RoleClasses, RoleSex, RoleLev} ->
            {true,
             {Result,
              RoleId,
              RoleName,
              RoleClasses,
              RoleSex,
              RoleLev,
              SCup,
              SCupChange,
              TCup,
              TCupChange,
              Sdata,
              Tdata}};
        _ -> false
    end.

async_result(Role = #role{name = RoleName, lev = Lev,
                          m_arena = Marena = #m_arena{roll_time = RollTime}},
             {Cup, Log}, Result, AddSoul, AddRollTime,
             LastCombatStatistics) ->
    OldSoul = var:get_var(Role, other, 2012, 0),
    NewSoul = min(25, OldSoul + AddSoul),
    role:link_send(Role, 12203, {Cup, NewSoul, Log}),
    case LastCombatStatistics of
        {true, CombatStatisticsData} ->
            role:link_send(Role, 12216, CombatStatisticsData);
        _ -> skip
    end,
    NewMarena = Marena#m_arena{cup = Cup,
                               roll_time = RollTime + AddRollTime},
    NRole = Role#role{m_arena = NewMarena},
    Role1 = var:set_var(NRole, other, 2012, NewSoul),
    friend:update(friend_role, Role1),
    Win = var:get_var(Role1, day_five, 111, 0),
    Role3 = case Result of
                1 ->
                    NewWin = Win + 1,
                    Role2 = var:set_var(Role1, day_five, 111, NewWin),
                    case NewWin >= 5 of
                        true ->
                            Msg =
                                notice:format(lang:get("~ts获得了竞技场~ts，拜托谁去终结他吧！！{face_1, 11}{face_1, "
                                                       "11}{face_1, 11}"),
                                              [{role_2, RoleName},
                                               {string_2, 6, lang:get("五连胜")}]),
                            notice:cast(all, 5, Msg);
                        false -> skip
                    end,
                    role_trigger:fire(#evt_arena_win{cup = Cup}, Role2);
                0 -> Role1
            end,
    case arena_data:get_exp(Lev) of
        {Exp, PetExp} ->
            PrayBuffResult = case
                                 buff:is_special_effect_exists_two_param(Role3,
                                                                         4)
                                 of
                                 {true, ValueAdd, Times} ->
                                     case buff:get_info_by_special_effect(Role3,
                                                                          4)
                                         of
                                         {true, BuffId, BuffName} ->
                                             case buff:get_ext_param(Role3,
                                                                     BuffId,
                                                                     2)
                                                 of
                                                 {true, Count} ->
                                                     case Times - Count of
                                                         LeftTimes
                                                             when LeftTimes >
                                                                      0 ->
                                                             {true,
                                                              ValueAdd,
                                                              BuffId,
                                                              BuffName,
                                                              LeftTimes};
                                                         NoneTimes
                                                             when NoneTimes =<
                                                                      0 ->
                                                             {false, BuffId}
                                                     end;
                                                 _ ->
                                                     {true,
                                                      ValueAdd,
                                                      BuffId,
                                                      BuffName,
                                                      Times}
                                             end;
                                         _ -> ok
                                     end;
                                 _ -> ok
                             end,
            {Role4, BuffAddPrecent} = case PrayBuffResult of
                                          {true,
                                           ValueAdd1,
                                           BuffId1,
                                           BuffName1,
                                           LeftTimes1} ->
                                              NoticeMsg =
                                                  notice:format(lang:get("包含~ts效果, 额外获得了~w%积分"),
                                                                [{string_2,
                                                                  5,
                                                                  util:flist("[~ts]",
                                                                             [BuffName1])},
                                                                 ValueAdd1 div
                                                                     10]),
                                              notice:send(Role3, 3, NoticeMsg),
                                              BuffAddExParamRole = case
                                                                       LeftTimes1
                                                                           - 1
                                                                           =:= 0
                                                                       of
                                                                       true ->
                                                                           case
                                                                               buff:del(Role3,
                                                                                        [BuffId1])
                                                                               of
                                                                               {ok,
                                                                                BuffDelRole3} ->
                                                                                   BuffDelRole3;
                                                                               _ ->
                                                                                   Role3
                                                                           end;
                                                                       false ->
                                                                           case
                                                                               buff:add_ext_param(Role3,
                                                                                                  BuffId1,
                                                                                                  2,
                                                                                                  1)
                                                                               of
                                                                               {ok,
                                                                                BuffAddExParamRole1} ->
                                                                                   BuffAddExParamRole1;
                                                                               _ ->
                                                                                   Role3
                                                                           end
                                                                   end,
                                              {BuffAddExParamRole, ValueAdd1};
                                          {false, BuffId2} ->
                                              BuffDelRole = case buff:del(Role3,
                                                                          [BuffId2])
                                                                of
                                                                {ok, Role5} ->
                                                                    Role5;
                                                                _ -> Role3
                                                            end,
                                              {BuffDelRole, 0};
                                          _ -> {Role3, 0}
                                      end,
            StarsScore1 = case Result of
                              1 ->
                                  case Lev >= 60 of
                                      true -> 8;
                                      _ -> 12
                                  end;
                              0 -> 6
                          end,
            StarsScore = util:ceil(StarsScore1 *
                                       (1000 + BuffAddPrecent)
                                       / 1000),
            {NewExp, NewPetExp} = case Result of
                                      1 -> {Exp, PetExp};
                                      0 ->
                                          {round(Exp * 7.5e-1),
                                           round(PetExp * 7.5e-1)}
                                  end,
            GainItems = case Result =:= 1 andalso Lev >= 60 of
                            true -> [{22400, 0, 1}];
                            _ -> []
                        end,
            DoneTimes = var:get_var(Role4, day_five, 102),
            Gain = case DoneTimes < 2 of
                       true ->
                           [{90010, NewExp},
                            {90005, NewPetExp},
                            {90012, StarsScore},
                            {90021, 2}];
                       false ->
                           [{90010, NewExp},
                            {90005, NewPetExp},
                            {90012, StarsScore}]
                   end,
            CampList = camp_assets:get(Role4, 4, 0),
            Role41 = camp_assets:acc(Role4, 4),
            Gain1 = Gain ++ GainItems ++ CampList,
            Gain2 = format:val_to_gain(Gain1),
            case role_gain:do_notice(Gain2, Role41) of
                {ok, NewRole} ->
                    NewRole1 = var:add_var(NewRole,
                                           day_five,
                                           120,
                                           StarsScore),
                    NewRole2 = var:acc_var(NewRole1, day_five, 102),
                    NewRole3 = role_trigger:fire(#evt_arena_fight{},
                                                 NewRole2),
                    push_count(NewRole3),
                    {ok, NewRole3};
                {false, #gain{reason = bag_full}} ->
                    NewRole1 = var:add_var(Role41,
                                           day_five,
                                           120,
                                           StarsScore),
                    NewRole2 = var:acc_var(NewRole1, day_five, 102),
                    NewRole3 = role_trigger:fire(#evt_arena_fight{},
                                                 NewRole2),
                    push_count(NewRole3),
                    Title = lang:get("竞技场奖励"),
                    Content = lang:get("竞技场获得奖励时，背包已满"),
                    mail:send(NewRole3,
                              #{title => Title, content => Content,
                                items => Gain1}),
                    {ok, NewRole3};
                {false, _} -> ok
            end;
        _ -> ok
    end.

push_other_result(RoleId,
                  #arena_role{cup = Cup, log = Log}) ->
    case role_query:pid(by_id, RoleId) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {arena_mgr, async_other_result, [Cup, Log]}),
            ok;
        _ -> ok
    end.

async_other_result(Role = #role{m_arena = Marena}, Cup,
                   Log) ->
    OldSoul = var:get_var(Role, other, 2012, 0),
    role:link_send(Role, 12203, {Cup, OldSoul, Log}),
    NewMarena = Marena#m_arena{cup = Cup},
    NewRole = Role#role{m_arena = NewMarena},
    {ok, NewRole}.

calc_combat_over(Srole = #arena_role{id = SroleId,
                                     name = Sname, cup = Cup1, log = Slog,
                                     next_log_id = SlogId,
                                     acc_sword_num = AccSwordNum,
                                     acc_mage_num = AccMageNum,
                                     acc_archer_num = AccArcherNum,
                                     acc_orc_num = AccOrcNum,
                                     acc_devine_num = AccDevineNum,
                                     acc_moon_num = AccMoonNum,
                                     acc_templar_num = AccTemplarNum,
                                     win_sword = WinSword, win_mage = WinMage,
                                     win_archer = WinArcher, win_orc = WinOrc,
                                     win_devine = WinDevine, win_moon = WinMoon,
                                     win_templar = WinTemplar, max_cup = MaxCup,
                                     lev = SLev},
                 #arena_robot{id = TroleId, cup = Cup2, name = Tname,
                              classes = Classes},
                 Result, _FeedBackFlag, Record) ->
    SCupChange = case Result of
                     1 ->
                         round(math:pow(max(0, 1000 + Cup2 - Cup1) / 100,
                                        1.44999999999999995559)
                                   + 6);
                     0 -> 0
                 end,
    CampRadio = case campaign_time:check({camp, 2009}) of
                    true -> 2;
                    _ -> 1
                end,
    {SCup, SCupChange1} = calc_cup(Cup1,
                                   SCupChange * CampRadio),
    BaseLog = #arena_log{s_role_id = SroleId,
                         s_name = Sname, result = Result, t_role_id = TroleId,
                         t_name = Tname, time = date:unixtime(), s_cup = SCup,
                         s_cup_change = SCupChange1},
    Sl = BaseLog#arena_log{log_id = SlogId, feedback = 0},
    NewSlog = lists:sublist([Sl | Slog], 10),
    NewSlogId = case SlogId + 1 > 1000 of
                    true -> 1;
                    false -> SlogId + 1
                end,
    case SLev >= 40 of
        true ->
            combat_record:save(7, {SlogId, SroleId}, Record);
        _ -> ok
    end,
    NewMaxCup = max(SCup, MaxCup),
    Srole1 = Srole#arena_role{cup = SCup, log = NewSlog,
                              next_log_id = NewSlogId, max_cup = NewMaxCup},
    {AddAccNum, AddWinNum} = case Result of
                                 1 -> {1, 1};
                                 _ -> {1, 0}
                             end,
    Srole2 = case Classes of
                 1 ->
                     Srole1#arena_role{acc_sword_num =
                                           AccSwordNum + AddAccNum,
                                       win_sword = WinSword + AddWinNum};
                 2 ->
                     Srole1#arena_role{acc_mage_num = AccMageNum + AddAccNum,
                                       win_mage = WinMage + AddWinNum};
                 3 ->
                     Srole1#arena_role{acc_archer_num =
                                           AccArcherNum + AddAccNum,
                                       win_archer = WinArcher + AddWinNum};
                 4 ->
                     Srole1#arena_role{acc_orc_num = AccOrcNum + AddAccNum,
                                       win_orc = WinOrc + AddWinNum};
                 5 ->
                     Srole1#arena_role{acc_devine_num =
                                           AccDevineNum + AddAccNum,
                                       win_devine = WinDevine + AddWinNum};
                 6 ->
                     Srole1#arena_role{acc_moon_num = AccMoonNum + AddAccNum,
                                       win_moon = WinMoon + AddWinNum};
                 7 ->
                     Srole1#arena_role{acc_templar_num =
                                           AccTemplarNum + AddAccNum,
                                       win_templar = WinTemplar + AddWinNum};
                 _ -> Srole1
             end,
    role_trigger:async_fire(SroleId,
                            #evt_arena_cup{cup = SCup}),
    {Srole2, BaseLog};
calc_combat_over(Srole = #arena_role{id = SroleId,
                                     name = Sname, cup = Cup1, log = Slog,
                                     next_log_id = SlogId,
                                     acc_sword_num = AccSwordNum,
                                     acc_mage_num = AccMageNum,
                                     acc_archer_num = AccArcherNum,
                                     acc_orc_num = AccOrcNum,
                                     acc_devine_num = AccDevineNum,
                                     acc_moon_num = AccMoonNum,
                                     acc_templar_num = AccTemplarNum,
                                     win_sword = WinSword, win_mage = WinMage,
                                     win_archer = WinArcher, win_orc = WinOrc,
                                     win_devine = WinDevine, win_moon = WinMoon,
                                     win_templar = WinTemplar, max_cup = MaxCup,
                                     lev = SLev},
                 Trole = #arena_role{id = TroleId, name = Tname,
                                     classes = Classes, cup = Cup2, log = Tlog,
                                     next_log_id = TlogId,
                                     def_acc_num = DefAccNum, def_win = DefWin,
                                     lev = TLev},
                 Result, FeedBackFlag, Record) ->
    SelfFc = case robot_mgr:get_role(SroleId) of
                 {ok, #robot_role{fc = SFc}} -> SFc;
                 _ -> 0
             end,
    TargetFc = case robot_mgr:get_role(TroleId) of
                   {ok, #robot_role{fc = TFc}} -> TFc;
                   _ -> 0
               end,
    IsStong = SelfFc > TargetFc,
    {SCupChange, TCupChange} = case Result of
                                   1 ->
                                       Wcup = round(math:pow(max(0,
                                                                 1000 + Cup2 -
                                                                     Cup1)
                                                                 / 100,
                                                             1.44999999999999995559)
                                                        + 6),
                                       Lcup = -round(math:pow(max(0,
                                                                  1000 + Cup2 -
                                                                      Cup1)
                                                                  / 100,
                                                              1.44999999999999995559)
                                                         + 1),
                                       LoseCup = case IsStong of
                                                     true -> Lcup;
                                                     _ ->
                                                         Lcup -
                                                             min(round(Lcup *
                                                                           100
                                                                           /
                                                                           1000),
                                                                 -2)
                                                 end,
                                       logger:debug("比对手战力弱：变化前：~w, 变化+：~w, 变化后：~w",
                                                    [Lcup,
                                                     min(round(Lcup * 100 /
                                                                   1000),
                                                         -2),
                                                     LoseCup],
                                                    arena_mgr,
                                                    1049),
                                       {Wcup, LoseCup};
                                   0 -> {0, 0}
                               end,
    CampRadio = case campaign_time:check({camp, 2009}) of
                    true -> 2;
                    _ -> 1
                end,
    {SCup, SCupChange1} = calc_cup(Cup1,
                                   SCupChange * CampRadio),
    TCup = Cup2 + TCupChange,
    {SCup2, SCupChange3} = case IsStong of
                               true when Result =:= 1 ->
                                   SCupChange2 = SCupChange1 +
                                                     max(1,
                                                         round(SCupChange1 * 50
                                                                   / 1000)),
                                   SCup1 = SCup - SCupChange1 + SCupChange2,
                                   logger:debug("战力强：变化前：~w, 变化+：~w, 变化后：~w",
                                                [SCupChange1,
                                                 max(1,
                                                     round(SCupChange1 * 50 /
                                                               1000)),
                                                 SCupChange2],
                                                arena_mgr,
                                                1065),
                                   {SCup1, SCupChange2};
                               _ -> {SCup, SCupChange1}
                           end,
    BaseLog = #arena_log{s_role_id = SroleId,
                         s_name = Sname, result = Result, t_role_id = TroleId,
                         t_name = Tname, time = date:unixtime(), s_cup = SCup2,
                         t_cup = TCup, s_cup_change = SCupChange3,
                         t_cup_change = TCupChange},
    {NewSlog, NewTlog} = case FeedBackFlag of
                             false ->
                                 Sl = BaseLog#arena_log{log_id = SlogId,
                                                        feedback = 0},
                                 Tl = case Result of
                                          1 ->
                                              BaseLog#arena_log{log_id = TlogId,
                                                                feedback = 1};
                                          _ ->
                                              BaseLog#arena_log{log_id = TlogId,
                                                                feedback = 0}
                                      end,
                                 Slog1 = lists:sublist([Sl | Slog], 10),
                                 Tlog1 = lists:sublist([Tl | Tlog], 10),
                                 {Slog1, Tlog1};
                             {true, FeedLogId} ->
                                 Sl = BaseLog#arena_log{log_id = SlogId,
                                                        feedback = 0},
                                 Tl = BaseLog#arena_log{log_id = TlogId,
                                                        feedback = 0},
                                 Slog1 = lists:sublist([Sl | Slog], 10),
                                 Tlog1 = lists:sublist([Tl | Tlog], 10),
                                 Slog2 = case lists:keyfind(FeedLogId,
                                                            #arena_log.log_id,
                                                            Slog1)
                                             of
                                             OldLog = #arena_log{}
                                                 when Result =:= 1 ->
                                                 FeedLog =
                                                     OldLog#arena_log{feedback =
                                                                          0},
                                                 lists:keyreplace(FeedLogId,
                                                                  #arena_log.log_id,
                                                                  Slog1,
                                                                  FeedLog);
                                             #arena_log{} -> Slog1;
                                             _Err -> Slog1
                                         end,
                                 {Slog2, Tlog1}
                         end,
    NewSlogId = case SlogId + 1 > 1000 of
                    true -> 1;
                    false -> SlogId + 1
                end,
    NewTlogId = case TlogId + 1 > 1000 of
                    true -> 1;
                    false -> TlogId + 1
                end,
    case SLev >= 40 of
        true ->
            SDelIds = [Olid || #arena_log{log_id = Olid} <- Slog] --
                          [Nlid || #arena_log{log_id = Nlid} <- NewSlog],
            [combat_record:delete({7, {SDelId, SroleId}})
             || SDelId <- SDelIds],
            combat_record:save(7, {SlogId, SroleId}, Record);
        _ -> ok
    end,
    case TLev >= 40 of
        true ->
            TDelIds = [Olid || #arena_log{log_id = Olid} <- Tlog] --
                          [Nlid || #arena_log{log_id = Nlid} <- NewTlog],
            [combat_record:delete({7, {TDelId, TroleId}})
             || TDelId <- TDelIds],
            combat_record:save(7, {TlogId, TroleId}, Record);
        _ -> ok
    end,
    NewMaxCup = max(SCup2, MaxCup),
    Srole1 = Srole#arena_role{cup = SCup2, log = NewSlog,
                              next_log_id = NewSlogId, max_cup = NewMaxCup},
    Trole1 = Trole#arena_role{cup = TCup, log = NewTlog,
                              next_log_id = NewTlogId},
    {AddAccNum, AddWinNum, AddDefAccNum, AddDefWinNum} =
        case Result of
            1 -> {1, 1, 1, 0};
            _ -> {1, 0, 1, 1}
        end,
    {Srole2, Acc, WinAcc} = case Classes of
                                1 ->
                                    {Srole1#arena_role{acc_sword_num =
                                                           AccSwordNum +
                                                               AddAccNum,
                                                       win_sword =
                                                           WinSword +
                                                               AddWinNum},
                                     AccSwordNum + AddAccNum,
                                     WinSword + AddWinNum};
                                2 ->
                                    {Srole1#arena_role{acc_mage_num =
                                                           AccMageNum +
                                                               AddAccNum,
                                                       win_mage =
                                                           WinMage + AddWinNum},
                                     AccMageNum + AddAccNum,
                                     WinMage + AddWinNum};
                                3 ->
                                    {Srole1#arena_role{acc_archer_num =
                                                           AccArcherNum +
                                                               AddAccNum,
                                                       win_archer =
                                                           WinArcher +
                                                               AddWinNum},
                                     AccArcherNum + AddAccNum,
                                     WinArcher + AddWinNum};
                                4 ->
                                    {Srole1#arena_role{acc_orc_num =
                                                           AccOrcNum +
                                                               AddAccNum,
                                                       win_orc =
                                                           WinOrc + AddWinNum},
                                     AccOrcNum + AddAccNum,
                                     WinOrc + AddWinNum};
                                5 ->
                                    {Srole1#arena_role{acc_devine_num =
                                                           AccDevineNum +
                                                               AddAccNum,
                                                       win_devine =
                                                           WinDevine +
                                                               AddWinNum},
                                     AccDevineNum + AddAccNum,
                                     WinDevine + AddWinNum};
                                6 ->
                                    {Srole1#arena_role{acc_moon_num =
                                                           AccMoonNum +
                                                               AddAccNum,
                                                       win_moon =
                                                           WinMoon + AddWinNum},
                                     AccMoonNum + AddAccNum,
                                     WinMoon + AddWinNum};
                                7 ->
                                    {Srole1#arena_role{acc_templar_num =
                                                           AccTemplarNum +
                                                               AddAccNum,
                                                       win_templar =
                                                           WinTemplar +
                                                               AddWinNum},
                                     AccTemplarNum + AddAccNum,
                                     WinTemplar + AddWinNum};
                                _ -> {Srole1, 0, 0}
                            end,
    Trole2 = Trole1#arena_role{def_acc_num =
                                   DefAccNum + AddDefAccNum,
                               def_win = DefWin + AddDefWinNum},
    case WinAcc >= 10 of
        true ->
            role_trigger:async_fire(SroleId,
                                    #evt_arena_win_rate{classes = Classes,
                                                        rate =
                                                            util:ceil(Acc /
                                                                          WinAcc
                                                                          *
                                                                          1000)});
        _ -> ignore
    end,
    role_trigger:async_fire(SroleId,
                            #evt_arena_cup{cup = SCup2}),
    case role_query:local_cache(by_id, TroleId) of
        {ok, #role_cache{}} ->
            role_trigger:async_fire(TroleId,
                                    #evt_arena_cup{cup = TCup});
        _ ->
            role_trigger:async_fire(SroleId,
                                    #evt_arena_cup_target{id = TroleId})
    end,
    {Srole2, Trole2, BaseLog}.

calc_cup(Cup, 0) -> {Cup, 0};
calc_cup(Cup, Change) ->
    {WorldLev, _} = world_lev:get_world_lev(),
    case arena_data:get_base_cup(WorldLev) of
        BaseCup when is_integer(BaseCup) ->
            case Cup >= BaseCup of
                true ->
                    Ratio = (Cup - BaseCup) / BaseCup * 100,
                    NewChange = if Ratio >= 20 -> round(Change * 10 / 100);
                                   Ratio >= 10 -> round(Change * 20 / 100);
                                   Ratio >= 5 -> round(Change * 40 / 100);
                                   Ratio =:= 0 -> Change;
                                   true -> round(Change * 60 / 100)
                                end,
                    {Cup + NewChange, NewChange};
                false ->
                    Ratio = (BaseCup - Cup) / BaseCup * 100,
                    NewChange = if Ratio >= 20 -> round(Change * 130 / 100);
                                   Ratio >= 10 -> round(Change * 110 / 100);
                                   true -> Change
                                end,
                    {Cup + NewChange, NewChange}
            end;
        _ ->
            logger:error("无法找到[~w]世界等级对应的竞技场杯数",
                         [WorldLev],
                         arena_mgr,
                         1193),
            {Cup + Change, Change}
    end.

do_init() ->
    Now = date:unixtime(),
    put(del_arena_role, []),
    put(world_max_cup, 1000),
    case dets:first(arena_role) of
        '$end_of_table' ->
            logger:info("竞技场没有数据需要加载", [], arena_mgr, 1204),
            [];
        _ ->
            dets:traverse(arena_role,
                          fun (ArenaRole) ->
                                  case arena_ver:convert(ArenaRole) of
                                      {false, Reason} ->
                                          logger:error("竞技场数据转换失败:~w",
                                                       [Reason],
                                                       arena_mgr,
                                                       1211),
                                          {done, false};
                                      {ok,
                                       #arena_role{id = Id, last_time = Time,
                                                   lev = Lev}}
                                          when Time + 2592000 < Now andalso
                                                   Lev < 25 ->
                                          put(del_arena_role,
                                              [Id | get(del_arena_role)]),
                                          continue;
                                      {ok,
                                       NewArenaRole = #arena_role{cup = Cup,
                                                                  day_time_flag
                                                                      =
                                                                      DayTimeFlag,
                                                                  log =
                                                                      OldLog}} ->
                                          MaxWorldCup = get(world_max_cup),
                                          NewMaxWorldCup = max(MaxWorldCup,
                                                               Cup),
                                          put(world_max_cup, NewMaxWorldCup),
                                          NewArenaRole1 = case DayTimeFlag > 0
                                                              of
                                                              true ->
                                                                  case
                                                                      DayTimeFlag
                                                                          +
                                                                          2592000
                                                                          < Now
                                                                      of
                                                                      true ->
                                                                          case
                                                                              OldLog
                                                                              of
                                                                              [_
                                                                               | _] ->
                                                                                  #arena_log{log_id
                                                                                                 =
                                                                                                 OldLogId} =
                                                                                      lists:last(OldLog),
                                                                                  NewArenaRole#arena_role{log
                                                                                                              =
                                                                                                              [],
                                                                                                          enemy
                                                                                                              =
                                                                                                              [],
                                                                                                          next_log_id
                                                                                                              =
                                                                                                              OldLogId};
                                                                              _ ->
                                                                                  NewArenaRole#arena_role{log
                                                                                                              =
                                                                                                              [],
                                                                                                          enemy
                                                                                                              =
                                                                                                              []}
                                                                          end;
                                                                      _ ->
                                                                          NewArenaRole
                                                                  end;
                                                              _ -> NewArenaRole
                                                          end,
                                          ets:insert(arena_role, NewArenaRole1),
                                          continue
                                  end
                          end)
    end,
    L = erase(del_arena_role),
    [del_role(DelId) || DelId <- L],
    case get_log(arena_log) of
        {RankList, LastRankList, LastJoin, TodayJoin} ->
            NewLastRankList = [{LRoleId, LRank}
                               || {LRoleId, LRank} <- LastRankList,
                                  lists:member(LRoleId, L) =:= false],
            NewRankList = arena_ver:convert_rank_list(RankList),
            #state{rank_list = NewRankList,
                   last_rank_list = NewLastRankList, last_join = LastJoin,
                   today_join = TodayJoin};
        null -> #state{};
        _ -> false
    end.

update_role([]) -> ok;
update_role(ArenaRoles) when is_list(ArenaRoles) ->
    dets:insert(arena_role, ArenaRoles),
    ets:insert(arena_role, ArenaRoles),
    ok;
update_role(ArenaRole) -> update_role([ArenaRole]).

del_role(Id) ->
    dets:delete(arena_role, Id),
    ok.

recalc(ArenaRole = #arena_role{win = Win,
                               acc_num = AccNum, win_list = WinList,
                               day_time_flag = DayTimeFlag, day_win = DayWin,
                               day_lost = DayLost},
       atk, 1) ->
    NewWinList = lists:sublist([1 | WinList], 10),
    WinRatio = calc_win_ratio(NewWinList),
    SameDay = date:is_same_five_reset(DayTimeFlag,
                                      date:unixtime()),
    {NewDayFlag, NewDayWin, NewDayLost} = case SameDay of
                                              true ->
                                                  {DayTimeFlag,
                                                   DayWin + 1,
                                                   DayLost};
                                              false -> {date:unixtime(), 1, 0}
                                          end,
    ArenaRole#arena_role{win = Win + 1,
                         acc_num = AccNum + 1, win_list = NewWinList,
                         win_ratio = WinRatio, day_time_flag = NewDayFlag,
                         day_win = NewDayWin, day_lost = NewDayLost};
recalc(ArenaRole = #arena_role{acc_num = AccNum,
                               win_list = WinList, day_time_flag = DayTimeFlag,
                               day_win = DayWin, day_lost = DayLost},
       atk, 0) ->
    NewWinList = lists:sublist([0 | WinList], 10),
    WinRatio = calc_win_ratio(NewWinList),
    SameDay = date:is_same_five_reset(DayTimeFlag,
                                      date:unixtime()),
    {NewDayFlag, NewDayWin, NewDayLost} = case SameDay of
                                              true ->
                                                  {DayTimeFlag,
                                                   DayWin,
                                                   DayLost};
                                              false -> {date:unixtime(), 0, 0}
                                          end,
    ArenaRole#arena_role{acc_num = AccNum + 1,
                         win_list = NewWinList, win_ratio = WinRatio,
                         day_time_flag = NewDayFlag, day_win = NewDayWin,
                         day_lost = NewDayLost};
recalc(ArenaRole = #arena_role{day_time_flag =
                                   DayTimeFlag,
                               day_win = DayWin, day_lost = DayLost},
       def, 1) ->
    SameDay = date:is_same_five_reset(DayTimeFlag,
                                      date:unixtime()),
    {NewDayFlag, NewDayWin, NewDayLost} = case SameDay of
                                              true ->
                                                  {DayTimeFlag,
                                                   DayWin,
                                                   DayLost + 1};
                                              false -> {date:unixtime(), 0, 1}
                                          end,
    ArenaRole#arena_role{day_time_flag = NewDayFlag,
                         day_win = NewDayWin, day_lost = NewDayLost};
recalc(ArenaRole, _, _) -> ArenaRole.

calc_win_ratio([]) -> 0;
calc_win_ratio(WinList) ->
    Len = length(WinList),
    WinLen = length([W || W <- WinList, W =:= 1]),
    round(WinLen / Len * 100).

update_old(OldArenaRole,
           #arena_role{name = Name, sex = Sex, classes = Classes,
                       lev = Lev, last_time = LastTime}) ->
    OldArenaRole#arena_role{name = Name, sex = Sex,
                            classes = Classes, lev = Lev, last_time = LastTime}.

robot_list(Arena) ->
    order_list(make_robot(Arena, 5, [])).

range_list(ArenaRole = #arena_role{id = RoleId,
                                   last_win_role = LastWinRoleId},
           RoleFc, #state{last_rank_list = LastRankList}) ->
    case lists:keyfind(RoleId, 1, LastRankList) of
        {_, Rank} when Rank >= 1 andalso Rank =< 100 ->
            order_list(range_list_rank(ArenaRole,
                                       RoleFc,
                                       LastRankList,
                                       LastWinRoleId));
        _ ->
            order_list(range_list_lev(ArenaRole,
                                      RoleFc,
                                      LastRankList,
                                      LastWinRoleId))
    end.

order_list(List) -> order_list(List, 1, []).

order_list([], _Order, List) -> List;
order_list([Enemy = #arena_enemy{} | T], Order, List) ->
    order_list(T,
               Order + 1,
               [Enemy#arena_enemy{order = Order} | List]).

update_state(State = #state{rank_list = RankList,
                            last_rank_list = LastRankList,
                            today_join = TodayJoin, last_join = LastJoin},
             ArenaRoles) ->
    Fun = fun ({Flag,
                Arena = #arena_role{id = RoleId, cup = Cup}},
               {RL, TJ}) ->
                  RL1 = lists:keystore(RoleId, #arena_role.id, RL, Arena),
                  TJ1 = case Flag of
                            1 -> lists:keystore(RoleId, 1, TJ, {RoleId, Cup});
                            0 -> TJ
                        end,
                  {RL1, TJ1}
          end,
    {NewRankList, NewTodayJoin} = lists:foldl(Fun,
                                              {RankList, TodayJoin},
                                              ArenaRoles),
    NewRankList1 = util:keys_sort([#arena_role.acc_num,
                                   #arena_role.lev,
                                   #arena_role.cup],
                                  NewRankList),
    NewRankList2 = lists:sublist(NewRankList1, 100),
    case NewRankList2 of
        [#arena_role{cup = WorldMaxCup} | _] ->
            put(world_max_cup, WorldMaxCup);
        _ -> skip
    end,
    NewState = State#state{rank_list = NewRankList2,
                           today_join = NewTodayJoin},
    save_log(arena_log,
             {NewRankList2, LastRankList, LastJoin, NewTodayJoin}),
    NewState.

range_list_lev(Arena = #arena_role{id = RoleId,
                                   lev = Lev, cup = RoleCup},
               RoleFc, LastRankList, LastWinRoleId) ->
    LevList = lists:seq(Lev - 5, Lev + 5),
    RoleList = robot_mgr:get_role_index_list(LevList),
    EnemyCond = arena_data:get_enemy(),
    RoleList1 = [Robot
                 || Robot = #robot_role_index{id = RobotId} <- RoleList,
                    RobotId =/= RoleId andalso RobotId =/= LastWinRoleId],
    do_range_list_lev(RoleList1,
                      Arena,
                      RoleCup,
                      RoleFc,
                      Lev,
                      EnemyCond,
                      LastRankList,
                      []).

do_range_list_lev(_RoleList, Arena, _RoleCup, _RoleFc,
                  _RoleLev, [], _LastRankList, EnemyList) ->
    Len = length(EnemyList),
    case Len >= 5 of
        true -> lists:sublist(EnemyList, 5);
        false -> EnemyList ++ make_robot(Arena, 5 - Len, [])
    end;
do_range_list_lev(RoleList, Arena, RoleCup, RoleFc,
                  RoleLev, [{Cup1, Cup2, Fc1, Fc2, Lev1, Lev2} | T],
                  LastRankList, EnemyList) ->
    case do_range_list_lev(RoleList,
                           RoleCup,
                           RoleFc,
                           RoleLev,
                           {Cup1, Cup2, Fc1, Fc2, Lev1, Lev2})
        of
        {true, Robot = #robot_role_index{id = RoleId}} ->
            RoleList1 = lists:keydelete(RoleId,
                                        #robot_role_index.id,
                                        RoleList),
            case role_index_to_enemy(Robot, RoleFc, LastRankList) of
                {true, E} ->
                    do_range_list_lev(RoleList1,
                                      Arena,
                                      RoleCup,
                                      RoleFc,
                                      RoleLev,
                                      T,
                                      LastRankList,
                                      [E | EnemyList]);
                _ ->
                    do_range_list_lev(RoleList1,
                                      Arena,
                                      RoleCup,
                                      RoleFc,
                                      RoleLev,
                                      T,
                                      LastRankList,
                                      EnemyList)
            end;
        _ ->
            do_range_list_lev(RoleList,
                              Arena,
                              RoleCup,
                              RoleFc,
                              RoleLev,
                              T,
                              LastRankList,
                              EnemyList)
    end.

do_range_list_lev(RoleList, RoleCup, RoleFc, RoleLev,
                  {Cup1, Cup2, Fc1, Fc2, Lev1, Lev2}) ->
    MinCup = round(RoleCup * (1000 + Cup1) / 1000),
    MaxCup = round(RoleCup * (1000 + Cup2) / 1000),
    MinFc = round(RoleFc * (1000 + Fc1) / 1000),
    MaxFc = round(RoleFc * (1000 + Fc2) / 1000),
    MinLev = RoleLev + Lev1,
    MaxLev = RoleLev + Lev2,
    BackRoleList = [Robot
                    || Robot = #robot_role_index{cup = Cup} <- RoleList,
                       Cup >= MinCup andalso Cup =< MaxCup],
    BackRoleList1 = [Robot
                     || Robot = #robot_role_index{all_fc = AllFc}
                            <- BackRoleList,
                        AllFc >= MinFc andalso AllFc =< MaxFc],
    case {BackRoleList, BackRoleList1} of
        {_, [_ | _]} ->
            BackRoleList2 = [Robot
                             || Robot = #robot_role_index{lev = Lev}
                                    <- BackRoleList1,
                                Lev >= MinLev andalso Lev =< MaxLev],
            case BackRoleList2 of
                [_ | _] -> get_range_role(BackRoleList2);
                _ -> get_range_role(BackRoleList1)
            end;
        {[_ | _], _} ->
            BackRoleList2 = [Robot
                             || Robot = #robot_role_index{lev = Lev}
                                    <- BackRoleList,
                                Lev >= MinLev andalso Lev =< MaxLev],
            case BackRoleList2 of
                [_ | _] -> get_range_role(BackRoleList2);
                _ -> get_range_role(BackRoleList)
            end;
        _ ->
            BackRoleList2 = [Robot
                             || Robot = #robot_role_index{lev = Lev}
                                    <- RoleList,
                                Lev >= MinLev andalso Lev =< MaxLev],
            case BackRoleList2 of
                [_ | _] -> get_range_role(BackRoleList2);
                _ -> get_range_role(RoleList)
            end
    end.

get_range_role([]) -> false;
get_range_role(List = [_ | _]) ->
    Robot = util:rand_list(List),
    {true, Robot};
get_range_role(_) -> false.

role_index_to_enemy(#robot_role_index{id = RoleId,
                                      all_fc = AllFc},
                    RoleFc, LastRankList) ->
    GetRank = case lists:keyfind(RoleId, 1, LastRankList) of
                  {_, Rank} -> Rank;
                  _ -> 0
              end,
    case get_role(RoleId) of
        {ok, #arena_role{lev = Lev}}
            when GetRank >= 1 andalso GetRank =< 50 ->
            {true,
             #arena_enemy{role_id = RoleId, classes = 0, lev = Lev,
                          sex = 0, cup = 0, soul = 2}};
        {ok,
         #arena_role{id = RoleId, classes = Classes, lev = Lev,
                     sex = Sex, cup = Cup}} ->
            Soul = case AllFc >= RoleFc * 9.39999999999999946709e-1
                       of
                       true -> 2;
                       _ -> 1
                   end,
            {true,
             #arena_enemy{role_id = RoleId, classes = Classes,
                          lev = Lev, sex = Sex, cup = Cup, soul = Soul}};
        _ ->
            logger:error("无法查到[~w]的竞技场数据",
                         [RoleId],
                         arena_mgr,
                         1474),
            false
    end.

make_robot(_Arena, LastNum, List) when LastNum =< 0 ->
    List;
make_robot(Ar = #arena_role{id = {Rid, _, _}, sex = Sex,
                            classes = Classes, lev = Lev, cup = Cup},
           LastNum, List) ->
    Robot = #arena_enemy{role_id = {Rid, "robot", 0},
                         is_robot = 1, classes = Classes,
                         lev = util:rand(-2, 2) + Lev, sex = Sex,
                         cup = util:rand(-50, 50) + Cup, soul = 1},
    make_robot(Ar, LastNum - 1, [Robot | List]).

range_list_rank(Arena = #arena_role{id = RoleId},
                RoleFc, LastRankList, LastWinRoleId) ->
    LastRankList1 = [R
                     || R = {Rid, Rank} <- LastRankList,
                        Rank >= 1 andalso
                            Rank =< 100 andalso
                                Rid =/= RoleId andalso Rid =/= LastWinRoleId],
    SixLoseFun = fun ({Rid, _Rank}) ->
                         case get_role(Rid) of
                             {ok, ArenaRole = #arena_role{}} ->
                                 is_lost_six_today(ArenaRole);
                             _ -> false
                         end
                 end,
    {LostSixList, OtherRankList} =
        lists:partition(SixLoseFun, LastRankList1),
    logger:debug("被击败6次的玩家:~w",
                 [LostSixList],
                 arena_mgr,
                 1506),
    Count = length(OtherRankList),
    ShuffleRankList = case LostSixList < 5 of
                          true ->
                              OtherRankList ++
                                  lists:sublist(LostSixList, 5 - Count);
                          _ -> OtherRankList
                      end,
    LastRankList2 = util:shuffle(ShuffleRankList),
    LastRankList3 = lists:sublist(LastRankList2, 5),
    do_range_list1(Arena, RoleFc, LastRankList3, []).

do_range_list1(Arena, _RoleFc, [], List) ->
    Len = length(List),
    case Len >= 5 of
        true -> List;
        false -> List ++ make_robot(Arena, 5 - Len, [])
    end;
do_range_list1(Arena, RoleFc, [{RoleId, Rank} | T],
               List) ->
    case get_role(RoleId) of
        {ok, #arena_role{lev = Lev}}
            when Rank >= 1 andalso Rank =< 50 ->
            Enemy = #arena_enemy{role_id = RoleId, classes = 0,
                                 lev = Lev, sex = 0, cup = 0, soul = 2},
            do_range_list1(Arena, RoleFc, T, [Enemy | List]);
        {ok,
         #arena_role{id = RoleId, classes = Classes, lev = Lev,
                     sex = Sex, cup = Cup}} ->
            case robot_mgr:get_role(RoleId) of
                {ok, #robot_role{all_fc = AllFc}} ->
                    Soul = case AllFc >= RoleFc * 9.39999999999999946709e-1
                               of
                               true -> 2;
                               _ -> 1
                           end,
                    Enemy = #arena_enemy{role_id = RoleId,
                                         classes = Classes, lev = Lev,
                                         sex = Sex, cup = Cup, soul = Soul},
                    do_range_list1(Arena, RoleFc, T, [Enemy | List]);
                _ -> do_range_list1(Arena, RoleFc, T, List)
            end;
        _ -> do_range_list1(Arena, RoleFc, T, List)
    end.

is_lost_six_today(#arena_role{day_time_flag = TimeFlag,
                              day_lost = DayLost}) ->
    case date:is_same_five_reset(TimeFlag, date:unixtime())
        of
        true -> DayLost >= 6;
        _ -> false
    end.

get_fashion({1, 1}) -> [{29702, 1}];
get_fashion({1, 2}) -> [{29702, 1}];
get_fashion({1, 3}) -> [{29702, 1}];
get_fashion({1, 4}) -> [{29702, 1}];
get_fashion({1, 5}) -> [{29702, 1}];
get_fashion({2, 1}) -> [{29705, 1}];
get_fashion({2, 2}) -> [{29705, 1}];
get_fashion({2, 3}) -> [{29705, 1}];
get_fashion({2, 4}) -> [{29705, 1}];
get_fashion({2, 5}) -> [{29705, 1}];
get_fashion({3, 1}) -> [{29708, 1}];
get_fashion({3, 2}) -> [{29708, 1}];
get_fashion({3, 3}) -> [{29708, 1}];
get_fashion({3, 4}) -> [{29708, 1}];
get_fashion({3, 5}) -> [{29708, 1}];
get_fashion({4, 1}) -> [{29711, 1}];
get_fashion({4, 2}) -> [{29711, 1}];
get_fashion({4, 3}) -> [{29711, 1}];
get_fashion({4, 4}) -> [{29711, 1}];
get_fashion({4, 5}) -> [{29711, 1}];
get_fashion({5, 1}) -> [{29714, 1}];
get_fashion({5, 2}) -> [{29714, 1}];
get_fashion({5, 3}) -> [{29714, 1}];
get_fashion({5, 4}) -> [{29714, 1}];
get_fashion({5, 5}) -> [{29714, 1}];
get_fashion({6, 1}) -> [{29717, 1}];
get_fashion({6, 2}) -> [{29717, 1}];
get_fashion({6, 3}) -> [{29717, 1}];
get_fashion({6, 4}) -> [{29717, 1}];
get_fashion({6, 5}) -> [{29717, 1}];
get_fashion({7, 1}) -> [{29739, 1}];
get_fashion({7, 2}) -> [{29739, 1}];
get_fashion({7, 3}) -> [{29739, 1}];
get_fashion({7, 4}) -> [{29739, 1}];
get_fashion({7, 5}) -> [{29739, 1}];
get_fashion({_Classes, _Num}) -> [].

