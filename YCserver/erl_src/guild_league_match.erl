-file("src/mod/guild/guild_league_match.erl", 1).

-module(guild_league_match).

-behaviour(gen_server).

-export([start_link/1,
         stop/1,
         update/1,
         lookup/2,
         login/1,
         logout/2,
         active/0,
         judge/1,
         cannon_ready/0,
         calc_result/0,
         join/2,
         leave/2,
         to_war/2,
         follow_join/2,
         follow_to_war/2,
         check_join/2,
         check_team_join/2,
         check_fight/2,
         check_fight_movability/1,
         combat_over/3,
         combat_start/2,
         stop_guarding/2,
         attack_unit/3,
         done_attack_unit/2,
         guard_unit/3,
         disturb_unit/2,
         set_trump/1,
         mark_trump/2,
         cost_movability/3,
         live_log/2,
         push/3]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/guild/guild_league_match.erl", 45).

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

-file("src/mod/guild/guild_league_match.erl", 46).

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

-file("src/mod/guild/guild_league_match.erl", 47).

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

-file("src/mod/guild/guild_league_match.erl", 48).

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

-file("src/mod/guild/guild_league_match.erl", 49).

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

-file("src/mod/guild/guild_league_match.erl", 50).

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

-file("src/mod/guild/guild_league_match.erl", 51).

-file("inc/guild_league.hrl", 1).

-record(guild_league_role,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         to_war = 0,
         movability = 500 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         side = 1,
         pid :: undefined | reference(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         key = {{0, "", 0}, 0},
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         is_trump = 0,
         operating_unit = 0 :: 0 | tuple(),
         last_operated = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         cannon_attacked = 0 :: non_neg_integer(),
         cannon_used = 0 :: non_neg_integer(),
         guarding_unit = 0 :: non_neg_integer(),
         operating_num = 0 :: non_neg_integer()}).

-record(guild_league_guild,
        {id = {0, "", 0} :: tuple(),
         key = {{0, "", 0}, 0, 0},
         ver = 5,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         match_id = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         phase = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         order = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         strenth = 0 :: non_neg_integer(),
         members = [],
         trumps = [],
         attacked_unit = 0 :: non_neg_integer(),
         consecutive_win = 0 :: non_neg_integer(),
         season_consecutive_win = 0 :: non_neg_integer(),
         avg_lev = 0 :: non_neg_integer(),
         eliminated = 8 :: non_neg_integer()}).

-record(guild_league_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         battle_id = 0 :: non_neg_integer(),
         battle_pid = 0 :: pid(),
         win_side = 0,
         time = 0 :: non_neg_integer(),
         phase = 0,
         season = 0 :: non_neg_integer(),
         combat_time = 0,
         is_judge = false,
         can_join = false,
         cannon_ready = false,
         later_phase = 0 :: non_neg_integer(),
         grade = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer()}).

-record(guild_league_alliance,
        {id = {0, 0} :: {integer(), integer()},
         gids = [] :: list(),
         names = [],
         totems = [] :: list(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         match_id = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         remain_unit = 3 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         subsidize_buff = [] :: list()}).

-record(guild_league_trump,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         pos = 1 :: non_neg_integer()}).

-record(guild_league_unit,
        {id = {0, 0} :: tuple(),
         phase = 0,
         season = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         battle_id = 0 :: non_neg_integer(),
         side = 0,
         duration = 1000 :: non_neg_integer(),
         operators = [] :: list(),
         last_operated = 0 :: non_neg_integer()}).

-record(guild_league_operator,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         side = 0,
         timeout = 0 :: non_neg_integer()}).

-record(guild_league_summary,
        {id = {0, "", 0} :: tuple(),
         ver = 4,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         member_num = 0 :: non_neg_integer(),
         season_win = 0 :: non_neg_integer(),
         season_lost = 0 :: non_neg_integer(),
         season_draw = 0 :: non_neg_integer(),
         total_win = 0 :: non_neg_integer(),
         totem = 0 :: non_neg_integer(),
         season_score = 0 :: non_neg_integer(),
         total_score = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         rank = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         order = 0 :: non_neg_integer(),
         recent_matchs = [] :: list(),
         absence = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         last_result = 0 :: non_neg_integer(),
         strenth = 0 :: non_neg_integer(),
         consecutive_win = 0 :: non_neg_integer(),
         season_consecutive_win = 0 :: non_neg_integer(),
         eliminated = 8 :: non_neg_integer()}).

-record(guild_league_guess,
        {id = {0, "", 0} :: tuple(),
         ver = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(guild_league_guess_choice,
        {gid = {0, "", 0} :: tuple(),
         phase = 0 :: non_neg_integer(),
         bingo = 0 :: 0..2}).

-record(guild_league_poll,
        {gid = {0, "", 0} :: tuple(),
         phase = 0 :: non_neg_integer(),
         voted = 0 :: non_neg_integer()}).

-record(guild_league_live,
        {id = 0 :: non_neg_integer(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         grade = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         names1 = [] :: string(),
         names2 = [] :: string(),
         logs = [] :: list()}).

-record(guild_league_champion,
        {season = 0 :: non_neg_integer(), top3 = []}).

-file("src/mod/guild/guild_league_match.erl", 52).

stop(Pid) when is_pid(Pid) -> Pid ! stop;
stop(_) -> ok.

update(M = #guild_league_match{}) ->
    ets:insert(guild_league_match, M);
update(_M) ->
    logger:debug("未知数据 ~w", [_M], guild_league_match, 74),
    ok.

login(Rid) ->
    case lookup(by_rid, Rid) of
        [#guild_league_match{pid = Pid}] when is_pid(Pid) ->
            {ok, Pid};
        _ -> false
    end.

logout(Pid, Rid) when is_pid(Pid) ->
    Pid ! {logout, Rid};
logout(_, _) -> ok.

join(MatchPid, R) ->
    gen_server:call(MatchPid, {join, R}).

follow_join(MatchPid, R = #guild_league_role{}) ->
    MatchPid ! {follow_join, R}.

follow_to_war(MatchPid, Rid) ->
    MatchPid ! {to_war, Rid}.

to_war(MatchPid, Rid) ->
    gen_server:call(MatchPid, {to_war, Rid}).

leave(MatchPid, Rid) when is_pid(MatchPid) ->
    MatchPid ! {leave, Rid};
leave(_, _) -> ok.

lookup(by_rid, Rid) ->
    case ets:lookup(guild_league_role, Rid) of
        [#guild_league_role{match_id = MatchId}] ->
            lookup(by_id, MatchId);
        _ -> false
    end;
lookup(by_gid, Gid) ->
    case guild_league_guild:lookup(Gid) of
        [#guild_league_guild{match_id = MatchId}] ->
            lookup(by_id, MatchId);
        _ -> false
    end;
lookup(by_id, Id) -> ets:lookup(guild_league_match, Id).

active() ->
    L = ets:match(guild_league_match,
                  #guild_league_match{pid = '$1', _ = '_'}),
    do_active(L).

judge(LaterPhase) ->
    [Pid ! {judge, LaterPhase}
     || [Pid]
            <- ets:match(guild_league_match,
                         #guild_league_match{pid = '$1', _ = '_'}),
        is_pid(Pid)],
    ok.

cannon_ready() ->
    [Pid ! cannon_ready
     || [Pid]
            <- ets:match(guild_league_match,
                         #guild_league_match{pid = '$1', _ = '_'}),
        is_pid(Pid)],
    ok.

calc_result() ->
    [Pid ! calc_result
     || [Pid]
            <- ets:match(guild_league_match,
                         #guild_league_match{pid = '$1', _ = '_'})],
    ok.

check_join([], Args) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    {ok, Args#{platform => Platform, zone_id => ZoneId}};
check_join([guild | T], Args = #{gid := Gid}) ->
    case guild_league_guild:lookup(Gid) of
        [#guild_league_guild{match_id = MatchId, side = Side,
                             name = GName}] ->
            case lookup(by_id, MatchId) of
                [#guild_league_match{win_side = 0, map_id = MapId,
                                     pid = Pid}] ->
                    case ets:lookup(guild_league_alliance, {MatchId, Side})
                        of
                        [#guild_league_alliance{member_num = MemNum}]
                            when MemNum >= 100 ->
                            {false, lang:get("公会参与人数已满、下次记得早点哦")};
                        [#guild_league_alliance{map_id = ReadyMapId = true}] ->
                            check_join(T,
                                       Args#{side => Side, map_id => MapId,
                                             match_id => MatchId,
                                             match_pid => Pid,
                                             ready_map_id => ReadyMapId,
                                             guild_name => GName});
                        _ -> {false, lang:get("准备区还没开放")}
                    end;
                _ -> {false, lang:get("冠军联赛已开始30分钟，不能入场{face_1,30}")}
            end;
        _ -> {false, lang:get("你公会没有参与本次冠军联赛")}
    end;
check_join([to_war | T], Args = #{rid := Id}) ->
    case check_to_war(Id) of
        true -> check_join(T, Args);
        _ -> {false, lang:get("你已从战场退出过，不能再进入")}
    end;
check_join([movability | T], Args = #{rid := Id}) ->
    case check_movability(Id) of
        true -> check_join(T, Args);
        _ -> {false, lang:get("行动力不足，不能进入战场")}
    end.

check_team_join([], _Args) -> true;
check_team_join([guild | T],
                Args = #{leader_gid := Gid1, mate_gid := Gid2}) ->
    case guild_league_guild:check_alliance({gid, Gid1},
                                           {gid, Gid2})
        of
        true -> check_team_join(T, Args);
        _ -> {false, lang:get("和队长不在同一公会联盟")}
    end;
check_team_join([movability | T],
                Args = #{mate_id := Id}) ->
    case check_movability(Id) of
        true -> check_team_join(T, Args);
        _ -> {false, lang:get("行动力不足")}
    end;
check_team_join([to_war | T],
                Args = #{mate_id := Id}) ->
    case check_to_war(Id) of
        true -> check_team_join(T, Args);
        _ -> {false, lang:get("不能进入战场")}
    end.

check_fight(Id, TargetId) ->
    Now = date:unixtime(),
    case ets:lookup(guild_league_role, Id) of
        [#guild_league_role{last_killed = Last}]
            when Now - Last < 90 ->
            {false,
             notice:format(lang:get("刚刚战败了，请稍候~ts秒"),
                           [{string_2, 5, 90 - (Now - Last)}])};
        [#guild_league_role{last_win = Last}]
            when Now - Last < 30 ->
            {false,
             notice:format(lang:get("刚刚胜利一场，请稍候~ts秒"),
                           [{string_2, 5, 30 - (Now - Last)}])};
        [#guild_league_role{movability = M}] when M =< 2 ->
            {false, lang:get("行动力不足，不能发起战斗")};
        [#guild_league_role{match_id = MatchId,
                            side = TmpAtkSide}] ->
            case lookup(by_id, MatchId) of
                [#guild_league_match{win_side = WinSide}]
                    when WinSide =/= 0 ->
                    {false, lang:get("比赛已结束，胜者可打开宝箱喔{face_1,31}")};
                [#guild_league_match{pid = MatchPid, grade = Grade,
                                     phase = Phase}] ->
                    case guild_league_guild:check_alliance(Id, TargetId) of
                        true -> {false, lang:get("对方是自己人")};
                        _ ->
                            check_fight_target(TargetId,
                                               #{match_id => MatchId,
                                                 atk_side => TmpAtkSide,
                                                 now => Now,
                                                 match_pid => MatchPid,
                                                 grade => Grade,
                                                 phase => Phase})
                    end
            end;
        _ -> {false, lang:get("行动力不足")}
    end.

check_fight_movability(Id) ->
    case ets:lookup(guild_league_role, Id) of
        [#guild_league_role{movability = M}] when M < 2 ->
            false;
        _ -> true
    end.

combat_over(MatchPid, WinnerF, LoserF) ->
    MatchPid ! {combat_over, WinnerF, LoserF}.

combat_start(MatchPid, Ids) ->
    MatchPid ! {combat_start, Ids}.

stop_guarding(MatchPid, [H | T])
    when is_pid(MatchPid) ->
    MatchPid ! {stop_guarding, [H | T]};
stop_guarding(_, _) -> ok.

attack_unit(Rid, Uid, MatchPid) ->
    gen_server:call(MatchPid, {attack_unit, Rid, Uid}).

done_attack_unit(Rid, MatchPid) ->
    gen_server:call(MatchPid, {done_attack_unit, Rid}).

disturb_unit(Rid, MatchPid) ->
    MatchPid ! {disturb_unit, Rid},
    ok.

set_trump(Trump = #guild_league_trump{gid = Gid}) ->
    case lookup(by_gid, Gid) of
        [#guild_league_match{pid = Pid}] ->
            gen_server:call(Pid, {set_trump, Trump});
        _ -> {false, lang:get("请在对阵当天收到通知后再操作")}
    end.

mark_trump(Pid, Rid) when is_pid(Pid) ->
    Pid ! {mark_trump, Rid},
    ok;
mark_trump(_, _) -> ok.

guard_unit(Rid, Uid, MatchPid) ->
    gen_server:call(MatchPid, {guard_unit, Rid, Uid}).

cost_movability(MatchPid, Rid, CostMovability)
    when is_pid(MatchPid) ->
    MatchPid ! {cost_movability, Rid, CostMovability};
cost_movability(_, _, _) -> ok.

live_log(MatchPid, Msg) -> MatchPid ! {live_log, Msg}.

push(MatchPid, Pid, Cmd = 17622) ->
    MatchPid ! {push, Pid, Cmd}.

start_link(Matche) ->
    gen_server:start_link(guild_league_match, [Matche], []).

init([Match = #guild_league_match{id = Id,
                                  phase = Phase, grade = Grade,
                                  season = Season}]) ->
    case battle:create(battle_guild_league) of
        {ok, _Platform, _ZoneId, BattleId, BattlePid} ->
            case battle_mgr:lookup(BattleId) of
                {ok,
                 _Battle = #battle{enter_point = {MapBaseId, _X, _Y},
                                   map = LoadMaps}} ->
                    case battle:find_map_id_and_pid(MapBaseId, LoadMaps) of
                        {ok, MapId, MapPid} ->
                            guild_league_unit:init(#{battle_id => BattleId,
                                                     match_id => Id,
                                                     phase => Phase,
                                                     grade => Grade,
                                                     season => Season}),
                            Match1 = Match#guild_league_match{pid = self(),
                                                              battle_id =
                                                                  BattleId,
                                                              battle_pid =
                                                                  BattlePid,
                                                              map_id = MapId,
                                                              map_pid = MapPid},
                            update(Match1),
                            guild_league_live:init(Match1),
                            logger:info("战场~w启动",
                                        [Id],
                                        guild_league_match,
                                        316),
                            {ok, Match1};
                        _ ->
                            logger:error("找不到战场地图信息",
                                         [],
                                         guild_league_match,
                                         319),
                            ok
                    end;
                _ ->
                    logger:error("找不到战场信息", [], guild_league_match, 323),
                    ok
            end;
        _Err ->
            logger:error("创建战区区失败: ~w",
                         [_Err],
                         guild_league_match,
                         327),
            ok
    end.

handle_call({join, _WR}, _From,
            State = #guild_league_match{is_judge = true}) ->
    Reply = {false,
             notice:format(lang:get("战场开启超过~ts分钟，无法进入"),
                           [{string_2, 5, 15 * 1}])},
    {reply, Reply, State};
handle_call({join, WR}, _From,
            State = #guild_league_match{can_join = CanJoin,
                                        map_pid = MapPid,
                                        later_phase = LaterPhase}) ->
    StateName = case CanJoin of
                    true -> active;
                    _ -> ready
                end,
    handle_join(#{joiner => WR, state_name => StateName,
                  map_pid => MapPid, later_phase => LaterPhase}),
    Reply = {ok, StateName},
    {reply, Reply, State};
handle_call({to_war, Id}, _From,
            M = #guild_league_match{can_join = true}) ->
    case ets:lookup(guild_league_role, Id) of
        [R = #guild_league_role{to_war = Acc}] ->
            guild_league_guild:update(R#guild_league_role{to_war =
                                                              Acc + 1});
        _ -> ok
    end,
    Reply = ok,
    {reply, Reply, M};
handle_call({to_war, _}, _From, State) ->
    Reply = {false, lang:get("还没到开打时间")},
    {reply, Reply, State};
handle_call({attack_unit, _Rid, {_, 7}}, _From,
            M = #guild_league_match{cannon_ready = false,
                                    time = Time}) ->
    Now = date:unixtime(),
    Reply = {false,
             notice:format(lang:get("炮台火力正在准备，将在~ts后正式启动"),
                           [{string_2,
                             5,
                             date:seconds_to_str(720 - (Now - Time))}])},
    {reply, Reply, M};
handle_call({attack_unit,
             [Rid | MateIds],
             Uid = {_, USid}},
            _From, M = #guild_league_match{win_side = 0}) ->
    Reply = case ets:lookup(guild_league_role, Rid) of
                [#guild_league_role{movability = RM}]
                    when USid =:= 7 andalso RM < 50 ->
                    {false,
                     notice:format(lang:get("行动力低于~ts，不能进行此操作"),
                                   [{string_2, 5, 50}])};
                [#guild_league_role{movability = RM}] when RM < 30 ->
                    {false,
                     notice:format(lang:get("行动力低于~ts，不能进行此操作"),
                                   [{string_2, 5, 30}])};
                [R = #guild_league_role{match_id = MatchId,
                                        side = Side}] ->
                    case
                        guild_league_unit:attack(R#guild_league_role{operating_num
                                                                         =
                                                                         length(MateIds)
                                                                             +
                                                                             1},
                                                 Uid)
                        of
                        {ok, Operator = #guild_league_operator{}} ->
                            CombatArgs = get_combat_args(M, Side),
                            {ok, Operator, MatchId, CombatArgs};
                        {ok, NewR, Operator = #guild_league_operator{}} ->
                            guild_league_guild:update(NewR),
                            guild_league_unit:set_cd(MateIds, USid),
                            CombatArgs = get_combat_args(M, Side),
                            {ok, Operator, MatchId, CombatArgs};
                        {ok, NewR} ->
                            guild_league_guild:update(NewR),
                            guild_league_unit:set_cd(MateIds, USid),
                            ok;
                        Else -> Else
                    end;
                _ -> {false, lang:get("不在战场")}
            end,
    {reply, Reply, M};
handle_call({attack_unit, _, _}, _From, State) ->
    Reply = {false, lang:get("比赛已结束，胜者可打开宝箱喔{face_1,31}")},
    {reply, Reply, State};
handle_call({guard_unit, Rid, Uid}, _From,
            M = #guild_league_match{win_side = 0}) ->
    Reply = case ets:lookup(guild_league_role, Rid) of
                [#guild_league_role{movability = RM}] when RM < 1 ->
                    {false,
                     notice:format(lang:get("行动力低于~ts，不能进行此操作"),
                                   [{string_2, 5, 1}])};
                [R = #guild_league_role{match_id = MatchId,
                                        side = Side}] ->
                    case guild_league_unit:guard(R, Uid) of
                        {ok, Operator = #guild_league_operator{}} ->
                            CombatArgs = get_combat_args(M, Side),
                            {ok, Operator, MatchId, CombatArgs};
                        {ok, NewR = #guild_league_role{}} ->
                            guild_league_guild:update(NewR),
                            ok;
                        Else -> Else
                    end;
                _ -> {false, lang:get("不在战场")}
            end,
    {reply, Reply, M};
handle_call({guard_unit, _, _}, _From, State) ->
    Reply = {false, lang:get("比赛已结束，胜者可打开宝箱喔{face_1,31}")},
    {reply, Reply, State};
handle_call({done_attack_unit, Id}, _From,
            M = #guild_league_match{win_side = 0, map_pid = MapPid,
                                    map_id = MapId, id = MatchId}) ->
    Res = case ets:lookup(guild_league_role, Id) of
              [R = #guild_league_role{operating_unit = Uid,
                                      name = Name, side = Side, pid = Pid}] ->
                  case guild_league_unit:done_attack(R) of
                      {ok,
                       R1 = #guild_league_role{},
                       NewU = #guild_league_unit{id = {_, TUid},
                                                 battle_id = TBid,
                                                 duration = Duration},
                       UDmg} ->
                          guild_league_guild:update(R1),
                          guild_league_guild:sync_data(R1),
                          guild_league_guild:sync_data(NewU),
                          guild_league_unit:reward_destroy(NewU),
                          acc_attacked_unit(R1, R),
                          BaseId2 = guild_league_unit:get_base_id(TUid),
                          role:apply(async,
                                     Pid,
                                     {guild_league_role,
                                      callback,
                                      [{team_unit_reward,
                                        #{operating_unit => Uid,
                                          base_id => BaseId2,
                                          duration => Duration,
                                          unit_dmg => UDmg}}]}),
                          notice_done_attack_unit(R, NewU, UDmg),
                          case Uid =:= 7 of
                              true ->
                                  case erlang:get(cannon_cd_notice_ref) of
                                      OldRef when is_reference(OldRef) ->
                                          erlang:cancel_timer(OldRef);
                                      _ -> ok
                                  end,
                                  Ref = erlang:send_after(180 * 1000,
                                                          self(),
                                                          cannon_cd_notice),
                                  erlang:put(cannon_cd_notice_ref, Ref),
                                  AnnFmt =
                                      lang:get("惊天巨响！~ts的~ts，成功使用~ts，对~ts~ts造成~ts点伤害{face_1,7}"),
                                  BaseId1 = guild_league_unit:get_base_id(Uid),
                                  AName1 = get_alliance_name(R),
                                  AName2 = get_alliance_name({MatchId,
                                                              guild_league_guild:get_opposite_side(Side)}),
                                  AnnStr = notice:format(AnnFmt,
                                                         [{string_2, 2, AName1},
                                                          {role_2, Name},
                                                          {unit_1, BaseId1},
                                                          {string_2, 2, AName2},
                                                          {unit_1, BaseId2},
                                                          {string_2, 5, UDmg}]),
                                  notice:cast({map, MapId}, 22, AnnStr),
                                  map_async(MapPid,
                                            {guild_league_role,
                                             callback,
                                             [{push, {17622, {180}}}]}),
                                  map_async(MapPid,
                                            {guild_league_role,
                                             callback,
                                             [{push, {17617, {TBid, TUid}}}]});
                              _ -> ok
                          end,
                          {ok, Uid, calc_unit(M)};
                      Else -> Else
                  end;
              _ -> {false, lang:get("不在状态中")}
          end,
    case Res of
        {ok, UnitId, NewM = #guild_league_match{}} ->
            update(NewM),
            map_async(MapPid,
                      {guild_league_role, callback, [{push, 17614}]}),
            Reply = {ok, UnitId},
            {reply, Reply, NewM};
        Other -> {reply, Other, M}
    end;
handle_call({done_attack_unit, _}, _From, State) ->
    Reply = {false, lang:get("不在开打时间")},
    {reply, Reply, State};
handle_call({set_trump, Trump}, _From,
            M = #guild_league_match{can_join = false}) ->
    Reply = case guild_league_guild:set_trump(Trump) of
                {ok, NewG = #guild_league_guild{trumps = Trumps}} ->
                    guild_league_guild:sync_data(NewG),
                    {ok, Trumps};
                Else -> Else
            end,
    {reply, Reply, M};
handle_call({set_trump, _}, _From, State) ->
    Reply = {false, lang:get("已经开打了，不能再设置了哦")},
    {reply, Reply, State};
handle_call(_Request, _From, State) ->
    logger:debug("未知调用 ~w",
                 [_Request],
                 guild_league_match,
                 477),
    {reply, false, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({logout, Id},
            M = #guild_league_match{map_pid = MapPid,
                                    win_side = 0}) ->
    NewM = case ets:lookup(guild_league_role, Id) of
               [WR = #guild_league_role{match_id = MatchId,
                                        side = Side, movability = Rm}] ->
                   guild_league_guild:update(WR#guild_league_role{pid =
                                                                      0}),
                   case ets:lookup(guild_league_alliance, {MatchId, Side})
                       of
                       [A = #guild_league_alliance{match_id = MatchId}]
                           when Rm < 1 ->
                           M1 = leave_judge(M, A),
                           map_async(MapPid,
                                     {guild_league_role,
                                      callback,
                                      [{push, 17601}]}),
                           M1;
                       [A = #guild_league_alliance{movability = Gm,
                                                   remain_num = GRnum,
                                                   match_id = MatchId}] ->
                           M1 = leave_judge(M,
                                            A#guild_league_alliance{movability =
                                                                        max(0,
                                                                            Gm -
                                                                                Rm),
                                                                    remain_num =
                                                                        max(0,
                                                                            GRnum
                                                                                -
                                                                                1)}),
                           map_async(MapPid,
                                     {guild_league_role,
                                      callback,
                                      [{push, 17601}]}),
                           M1;
                       _ -> M
                   end;
               _ -> M
           end,
    update(NewM),
    {noreply, NewM};
handle_info({logout, _}, State) -> {noreply, State};
handle_info({leave, Id},
            M = #guild_league_match{map_pid = MapPid,
                                    win_side = 0}) ->
    NewM = case ets:lookup(guild_league_role, Id) of
               [WR = #guild_league_role{match_id = MatchId,
                                        side = Side, movability = Rm}] ->
                   guild_league_guild:update(WR#guild_league_role{pid =
                                                                      0}),
                   case ets:lookup(guild_league_alliance, {MatchId, Side})
                       of
                       [A = #guild_league_alliance{match_id = MatchId}]
                           when Rm < 1 ->
                           M1 = leave_judge(M, A),
                           map_async(MapPid,
                                     {guild_league_role,
                                      callback,
                                      [{push, 17601}]}),
                           M1;
                       [A = #guild_league_alliance{movability = Gm,
                                                   remain_num = GRnum,
                                                   match_id = MatchId}] ->
                           M1 = leave_judge(M,
                                            A#guild_league_alliance{movability =
                                                                        max(0,
                                                                            Gm -
                                                                                Rm),
                                                                    remain_num =
                                                                        max(0,
                                                                            GRnum
                                                                                -
                                                                                1)}),
                           map_async(MapPid,
                                     {guild_league_role,
                                      callback,
                                      [{push, 17601}]}),
                           M1;
                       _ -> M
                   end;
               _ -> M
           end,
    update(NewM),
    {noreply, NewM};
handle_info({leave, _}, State) -> {noreply, State};
handle_info({create_box, MapId, Num, WinId}, State) ->
    add_treasure(WinId),
    create_box({38, MapId}, Num),
    {noreply, State};
handle_info(active,
            M = #guild_league_match{id = MatchId, map_pid = MapPid,
                                    map_id = MapId}) ->
    NewM = M#guild_league_match{can_join = true,
                                time = date:unixtime()},
    ready_to_war(MatchId),
    clear_block_units(MapPid),
    update(NewM),
    update_trumps(MatchId),
    guild_league_guild:sync_data(guild_league_unit:list_all(MatchId)),
    AnnStr = lang:get("比赛正式开始！{sound_1, 567} "),
    notice:cast({map, MapId}, 11, AnnStr),
    Msg = lang:get("比赛正式开始！看看谁能拿下第一滴血！{face_1, 7}"),
    guild_league_live:add_log(MatchId, Msg),
    {noreply, NewM};
handle_info(cannon_ready,
            M = #guild_league_match{map_id = MapId,
                                    map_pid = MapPid, id = MatchId}) ->
    NewM = M#guild_league_match{cannon_ready = true},
    update(NewM),
    AnnStr =
        notice:format(lang:get("~ts准备就绪，威力无穷的炮火可对敌方水晶塔造成~ts{face_1,23}"),
                      [{unit_1, guild_league_unit:get_base_id(7)},
                       {string_2, 5, lang:get("大量伤害")}]),
    AnnStr1 = notice:format(lang:get("~ts{sound_1, 568}"),
                            [{string_1, AnnStr}]),
    guild_league_live:add_log(MatchId, AnnStr),
    notice:cast({map, MapId}, 22, AnnStr1),
    notice:cast({map, MapId}, 32, AnnStr),
    notice:cast({map, MapId}, 11, AnnStr),
    map_async(MapPid,
              {guild_league_role, callback, [{push, {17622, {0}}}]}),
    {noreply, NewM};
handle_info({judge, LaterPhase}, M) ->
    NewM = case LaterPhase >= 1 of
               true ->
                   M1 = do_judge(M),
                   M1#guild_league_match{is_judge = true,
                                         later_phase = LaterPhase};
               _ -> M#guild_league_match{later_phase = LaterPhase}
           end,
    update(NewM),
    {noreply, NewM};
handle_info(calc_result, M) ->
    NewM = do_calc_result(M),
    update(NewM),
    {noreply, NewM};
handle_info({follow_join, WR},
            State = #guild_league_match{can_join = CanJoin,
                                        map_pid = MapPid,
                                        later_phase = LaterPhase}) ->
    StateName = case CanJoin of
                    true -> active;
                    _ -> ready
                end,
    handle_join(#{joiner => WR, state_name => StateName,
                  map_pid => MapPid, later_phase => LaterPhase}),
    {noreply, State};
handle_info({to_war, Id},
            M = #guild_league_match{can_join = true}) ->
    case ets:lookup(guild_league_role, Id) of
        [R = #guild_league_role{to_war = Acc}] ->
            guild_league_guild:update(R#guild_league_role{to_war =
                                                              Acc + 1});
        _ -> ok
    end,
    {noreply, M};
handle_info({to_war, _}, State) -> {noreply, State};
handle_info({combat_over, Winner, Loser},
            M = #guild_league_match{win_side = 0, map_pid = MapPid,
                                    map_id = MapId}) ->
    logger:debug("战斗结果-----", [], guild_league_match, 602),
    calc_guard_unit(Winner, Loser),
    Loser1 = treat_guarding_loser(Winner, Loser),
    M1 = case Winner of
             [] -> M;
             _ ->
                 calc_first_blood(Winner, MapId),
                 WinScore = get_win_score(length(Loser)) div
                                length(Winner),
                 calc_fighter({win, WinScore}, M, Winner)
         end,
    M2 = calc_unit(M1),
    NewM = calc_fighter(lost, M2, Loser1),
    update(NewM),
    map_async(MapPid,
              {guild_league_role, callback, [{push, 17601}]}),
    map_async(MapPid,
              {guild_league_role, callback, [{push, 17614}]}),
    {noreply, NewM};
handle_info({combat_over, _Winner, _Loser}, M) ->
    {noreply, M};
handle_info({combat_start, Ids},
            M = #guild_league_match{map_pid = MapPid,
                                    win_side = 0}) ->
    atk_movability_lost(Ids, MapPid),
    {noreply, M};
handle_info({combat_start, _Ids}, M) -> {noreply, M};
handle_info({disturb_unit, Ids},
            M = #guild_league_match{win_side = 0}) ->
    do_disturb_unit(Ids),
    {noreply, M};
handle_info({disturb_unit, _}, State) ->
    {noreply, State};
handle_info({stop_guarding, Ids},
            M = #guild_league_match{win_side = 0}) ->
    do_stop_guarding(Ids),
    {noreply, M};
handle_info({stop_guarding, _}, State) ->
    {noreply, State};
handle_info({mark_trump, Id},
            M = #guild_league_match{win_side = 0, id = MatchId}) ->
    case ets:lookup(guild_league_role, Id) of
        [R = #guild_league_role{side = Side}] ->
            case ets:lookup(guild_league_alliance, {MatchId, Side})
                of
                [A = #guild_league_alliance{}] ->
                    NewA = do_mark_trump(R, A),
                    guild_league_guild:update(NewA),
                    guild_league_guild:sync_data(NewA);
                _ -> ok
            end;
        _ -> ok
    end,
    {noreply, M};
handle_info({mark_trump, _}, State) -> {noreply, State};
handle_info({cost_movability, Id, CostMovability},
            M = #guild_league_match{win_side = 0,
                                    map_pid = MapPid}) ->
    case ets:lookup(guild_league_role, Id) of
        [R = #guild_league_role{match_id = MatchId, side = Side,
                                gid = Gid, movability = Rm}] ->
            case ets:lookup(guild_league_alliance, {MatchId, Side})
                of
                [A = #guild_league_alliance{movability = Gm}] ->
                    NewRm = max(1, Rm - CostMovability),
                    R1 = R#guild_league_role{movability = NewRm},
                    guild_league_guild:update(R1),
                    guild_league_guild:sync_data(R1),
                    NewA = A#guild_league_alliance{movability =
                                                       max(NewRm,
                                                           Gm -
                                                               max(0,
                                                                   Rm -
                                                                       NewRm))},
                    guild_league_guild:update(NewA),
                    guild_league_guild:sync_data(NewA),
                    map_async(MapPid,
                              {guild_league_role, callback, [{push, 17601}]});
                _ ->
                    logger:error("没找到联盟 ~w, ~w",
                                 [Gid, {MatchId, Side}],
                                 guild_league_match,
                                 674)
            end;
        _ ->
            logger:error("没找到参战者 ~w", [Id], guild_league_match, 677)
    end,
    {noreply, M};
handle_info({cost_movability, _, _}, State) ->
    {noreply, State};
handle_info({live_log, Msg},
            State = #guild_league_match{win_side = 0,
                                        id = MatchId}) ->
    guild_league_live:add_log(MatchId, Msg),
    {noreply, State};
handle_info({live_log, _}, State) -> {noreply, State};
handle_info(cannon_cd_notice,
            State = #guild_league_match{win_side = 0,
                                        map_id = MapId, map_pid = MapPid,
                                        id = MatchId}) ->
    case erlang:get(cannon_cd_notice_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    AnnStr =
        notice:format(lang:get("~ts准备就绪，威力无穷的炮火可对敌方水晶塔造成~ts{face_1,23}"),
                      [{unit_1, guild_league_unit:get_base_id(7)},
                       {string_2, 5, lang:get("大量伤害")}]),
    AnnStr1 = notice:format(lang:get("~ts{sound_1, 568}"),
                            [{string_1, AnnStr}]),
    guild_league_live:add_log(MatchId, AnnStr),
    notice:cast({map, MapId}, 22, AnnStr1),
    notice:cast({map, MapId}, 32, AnnStr),
    notice:cast({map, MapId}, 11, AnnStr),
    map_async(MapPid,
              {guild_league_role, callback, [{push, {17622, {0}}}]}),
    {noreply, State};
handle_info(cannon_cd_notice, State) ->
    {noreply, State};
handle_info({push, Pid, Cmd = 17622},
            State = #guild_league_match{cannon_ready = false,
                                        time = Time}) ->
    Now = date:unixtime(),
    Cd = max(0, 720 - (Now - Time)),
    role:apply(async,
               Pid,
               {guild_league_role, callback, [{push, {Cmd, {Cd}}}]}),
    {noreply, State};
handle_info({push, Pid, Cmd = 17622},
            State = #guild_league_match{id = MatchId}) ->
    Now = date:unixtime(),
    Cd = case guild_league_guild:lookup({MatchId, 7}) of
             [#guild_league_unit{last_operated = Last}] ->
                 max(0, 180 - (Now - Last));
             _ -> 0
         end,
    role:apply(async,
               Pid,
               {guild_league_role, callback, [{push, {Cmd, {Cd}}}]}),
    {noreply, State};
handle_info(stop, State) -> {stop, normal, State};
handle_info(_Info, State) ->
    logger:debug("未知消息 ~w",
                 [_Info],
                 guild_league_match,
                 727),
    {noreply, State}.

terminate(_Reason,
          #guild_league_match{id = Id, battle_pid = Pid}) ->
    battle:stop(Pid),
    guild_league_unit:clear(Id),
    ets:delete(guild_league_match, Id),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

map_async({match, Id}, MFA) ->
    case ets:lookup(guild_league_match, Id) of
        [#guild_league_match{map_pid = Pid}] ->
            map_async(Pid, MFA);
        _ -> ok
    end;
map_async(#guild_league_match{pid = Pid}, MFA) ->
    map_async(Pid, MFA);
map_async(Pid, MFA) when is_pid(Pid) ->
    map:async_apply(Pid, MFA);
map_async(_, _) -> ok.

leave_judge(H = #guild_league_match{is_judge = true,
                                    id = MatchId, win_side = 0, grade = Grade},
            A1 = #guild_league_alliance{remain_num = M0,
                                        match_id = MatchId, side = Side,
                                        remain_unit = U1})
    when M0 < 1 ->
    case ets:lookup(guild_league_alliance,
                    {MatchId, guild_league_guild:get_opposite_side(Side)})
        of
        [A2 = #guild_league_alliance{remain_num = M}]
            when M > 0 ->
            save_result(guild_league_guild:get_opposite_side(Side),
                        H,
                        A2,
                        A1#guild_league_alliance{remain_unit = 0});
        [A2 = #guild_league_alliance{remain_unit = U2}]
            when U2 > U1 ->
            save_result(guild_league_guild:get_opposite_side(Side),
                        H,
                        A2,
                        A1#guild_league_alliance{remain_unit = 0});
        [A2 = #guild_league_alliance{remain_num = 0}] ->
            case Grade of
                1 ->
                    case util:rand(1, 2) of
                        1 -> save_result(1, H, A1, A2);
                        _ -> save_result(2, H, A2, A1)
                    end;
                _ -> save_result(3, H, A1, A2)
            end;
        _ ->
            logger:error("找不到联盟 ~w",
                         [{MatchId,
                           guild_league_guild:get_opposite_side(Side)}],
                         guild_league_match,
                         775),
            H
    end;
leave_judge(H = #guild_league_match{is_judge = true,
                                    win_side = 0, grade = Grade},
            A1 = #guild_league_alliance{remain_num = M1,
                                        movability = M1, remain_unit = U1,
                                        match_id = MatchId, side = Side}) ->
    case ets:lookup(guild_league_alliance,
                    {MatchId, guild_league_guild:get_opposite_side(Side)})
        of
        [A2 = #guild_league_alliance{remain_num = M2,
                                     movability = M2, remain_unit = U2}]
            when U2 > U1 ->
            save_result(guild_league_guild:get_opposite_side(Side),
                        H,
                        A2,
                        A1);
        [A2 = #guild_league_alliance{remain_num = M2,
                                     movability = M2, remain_unit = U2}]
            when U2 < U1 ->
            save_result(Side, H, A1, A2);
        [A2 = #guild_league_alliance{remain_num = M2,
                                     movability = M2}]
            when M2 > M1 ->
            save_result(guild_league_guild:get_opposite_side(Side),
                        H,
                        A2,
                        A1);
        [A2 = #guild_league_alliance{remain_num = M2,
                                     movability = M2}]
            when M2 < M1 ->
            save_result(Side, H, A1, A2);
        [A2 = #guild_league_alliance{remain_num = M1,
                                     movability = M1}] ->
            case Grade of
                1 ->
                    case util:rand(1, 2) of
                        1 -> save_result(1, H, A1, A2);
                        _ -> save_result(2, H, A2, A1)
                    end;
                _ -> save_result(3, H, A1, A2)
            end;
        _ ->
            logger:error("找不到联盟 ~w",
                         [{MatchId,
                           guild_league_guild:get_opposite_side(Side)}],
                         guild_league_match,
                         802),
            H
    end;
leave_judge(M, A) ->
    guild_league_guild:update(A),
    guild_league_guild:sync_data(A),
    M.

save_result(3,
            H = #guild_league_match{grade = Grade, id = MatchId},
            A1 = #guild_league_alliance{names = Names1,
                                        members = Mems1, gids = Gid1},
            A2 = #guild_league_alliance{names = Names2,
                                        members = Mems2, gids = Gid2}) ->
    Name1 = get_alliance_name(Names1),
    Name2 = get_alliance_name(Names2),
    AL = [A1#guild_league_alliance{is_win = 3, score = 1},
          A2#guild_league_alliance{is_win = 3, score = 1}],
    guild_league_guild:update(AL),
    guild_league_guild:sync_data(AL),
    guild_league_guild:save_result(Gid1, 3, 1),
    guild_league_guild:save_result(Gid2, 3, 1),
    exhaust_notice(H, A1, A2),
    do_reward_guild(Gid1,
                    #{type => draw, gname => Name1, name => Name2,
                      unit_score => 1, rival_gid => Gid2, grade => Grade}),
    do_reward_guild(Gid2,
                    #{type => draw, gname => Name2, name => Name1,
                      unit_score => 1, rival_gid => Gid1, grade => Grade}),
    result_reward(Mems1, lost),
    result_reward(Mems2, lost),
    Msg =
        notice:format(lang:get("~ts公会与~ts公会势均力敌，在冠军联赛中打成平局！{face_1, "
                               "19}"),
                      [{string_2, 2, Name2}, {string_2, 2, Name1}]),
    guild_league_live:add_log(MatchId, Msg),
    guild_league:update_grade_rank(Grade),
    H#guild_league_match{win_side = 3};
save_result(WinSide,
            H = #guild_league_match{id = MatchId, map_id = MapId,
                                    grade = Grade, phase = Phase},
            A1 = #guild_league_alliance{names = Names1,
                                        gids = WinId, remain_num = Remain,
                                        members = Mems1, remain_unit = U1},
            A2 = #guild_league_alliance{names = Names2,
                                        members = Mems2, gids = LostId,
                                        remain_unit = U2}) ->
    Name1 = get_alliance_name(Names1),
    Name2 = get_alliance_name(Names2),
    AL = [A1#guild_league_alliance{is_win = 1, score = 2},
          A2#guild_league_alliance{is_win = 2, score = 0}],
    exhaust_notice(H, A1, A2),
    UnitScore1 = get_unit_score(U1, U2),
    UnitScore2 = get_unit_score(U2, U1),
    guild_league_guild:update(AL),
    guild_league_guild:sync_data(AL),
    guild_league_guild:save_result(WinId, 1, UnitScore1),
    guild_league_guild:save_result(LostId, 2, UnitScore2),
    do_reward_guild(WinId,
                    #{type => win, gname => Name1, name => Name2,
                      unit_score => UnitScore1, rival_gid => LostId,
                      grade => Grade, phase => Phase}),
    do_reward_guild(LostId,
                    #{type => lost, gname => Name2, name => Name1,
                      unit_score => UnitScore2, rival_gid => WinId,
                      grade => Grade, phase => Phase}),
    result_reward(Mems1, win),
    result_reward(Mems2, lost),
    Msg =
        notice:format(lang:get("~ts公会成员众志成城，力克强敌~ts公会取得冠军联赛胜利！{face_1, "
                               "18}"),
                      [{string_2, 2, Name1}, {string_2, 2, Name2}]),
    guild_league_live:add_log(MatchId, Msg),
    erlang:send_after(60000,
                      self(),
                      {create_box, MapId, Remain + 2, WinId}),
    guild_league:update_grade_rank(Grade),
    H#guild_league_match{win_side = WinSide}.

get_unit_score(U1, U1) -> 1;
get_unit_score(_, 0) -> 3;
get_unit_score(0, _) -> -1;
get_unit_score(U1, U2) when U1 > U2 -> 2;
get_unit_score(_, _) -> 0.

get_alliance_name(#guild_league_role{side = Side,
                                     match_id = MatchId}) ->
    get_alliance_name({MatchId, Side});
get_alliance_name({MatchId, Side}) ->
    case ets:lookup(guild_league_alliance, {MatchId, Side})
        of
        [#guild_league_alliance{names = Names}] ->
            get_alliance_name(Names);
        _ -> ""
    end;
get_alliance_name(Names) -> string:join(Names, "、").

exhaust_notice(#guild_league_match{map_id = MapId},
               #guild_league_alliance{movability = M1,
                                      remain_num = M1},
               #guild_league_alliance{movability = M2,
                                      remain_num = M2}) ->
    Msg = lang:get("双方筋疲力，尽无人能发起战斗，冠军联赛结束"),
    notice:cast({map, MapId}, 3, Msg);
exhaust_notice(_, _, _) -> ok.

do_reward_guild([], _) -> ok;
do_reward_guild([Gid = {_, P, Z} | T], Args) ->
    case ets:lookup(guild_league_summary, Gid) of
        [#guild_league_summary{season_consecutive_win =
                                   ConsecutiveWin,
                               eliminated = Eliminated}] ->
            big_world:cast(P,
                           Z,
                           guild_league_agent,
                           reward_guild,
                           [Args#{gid => Gid, consecutive_win => ConsecutiveWin,
                                  eliminated => Eliminated}]);
        _ ->
            logger:error("找不到公会 ~w",
                         [Gid],
                         guild_league_match,
                         884),
            ok
    end,
    do_reward_guild(T, Args).

result_reward([], _) -> ok;
result_reward([Id | T], Type) ->
    case ets:lookup(guild_league_role, Id) of
        [#guild_league_role{pid = Pid}] when is_pid(Pid) ->
            case Type of
                win ->
                    role_trigger:async_fire(Pid, #evt_guild_league_win{});
                _ -> ok
            end,
            role:apply(async,
                       Pid,
                       {guild_league_role, callback, [{reward, Type}]});
        _ -> ok
    end,
    result_reward(T, Type).

create_box(_, Num) when Num < 1 -> ok;
create_box(Where = {GuildMatchId, MapId}, Num) ->
    {X, Y} = map:rand_pos(52001),
    unit_mgr:create(GuildMatchId, 79583, {MapId, X, Y}),
    create_box(Where, Num - 1).

add_treasure(_) -> ok.

check_movability(Id) ->
    case ets:lookup(guild_league_role, Id) of
        [#guild_league_role{movability = M}] when M < 1 ->
            false;
        _ -> true
    end.

check_to_war(Id) ->
    case ets:lookup(guild_league_role, Id) of
        [#guild_league_role{to_war = Acc}] when Acc > 0 ->
            false;
        _ -> true
    end.

do_active([]) -> ok;
do_active([[Pid] | T]) when is_pid(Pid) ->
    Pid ! active,
    do_active(T).

handle_join(#{joiner :=
                  WR = #guild_league_role{id = Id = {_, Platform, ZoneId},
                                          pid = Pid, movability = Rm1,
                                          gid = Gid},
              state_name := StateName, map_pid := MapPid,
              later_phase := LaterPhase}) ->
    Reduce = get_later_reduce(LaterPhase),
    {WR2, AddNum} = case ets:lookup(guild_league_role, Id)
                        of
                        [WR1 = #guild_league_role{movability = Rm2}]
                            when StateName =:= active ->
                            {WR1#guild_league_role{pid = Pid,
                                                   movability =
                                                       max(0, Rm2 - Reduce)},
                             0};
                        [] when StateName =:= active ->
                            {WR#guild_league_role{movability =
                                                      max(0, Rm1 - Reduce)},
                             1};
                        [WR1 = #guild_league_role{}] ->
                            {WR1#guild_league_role{pid = Pid}, 0};
                        [] -> {WR, 1};
                        _E ->
                            logger:error("其他参与类型 ~w",
                                         [_E],
                                         guild_league_match,
                                         948),
                            {WR, 1}
                    end,
    case Rm1 of
        500 -> ignore;
        _ ->
            big_world:cast(Platform,
                           ZoneId,
                           notice,
                           send,
                           [Id,
                            3,
                            notice:format(lang:get("由于你的等级低于世界等级，行动力减少为~ts"),
                                          [{string_2, 5, Rm1}])])
    end,
    #guild_league_role{match_id = MatchId, side = Side,
                       movability = Rm, to_war = ToWar} =
        WR2,
    WR3 = case StateName of
              active -> WR2#guild_league_role{to_war = ToWar + 1};
              _ -> WR2
          end,
    guild_league_guild:update(WR3),
    guild_league_guild:sync_data(WR3),
    case guild_league_guild:lookup(Gid) of
        [G = #guild_league_guild{member_num = GMnum,
                                 members = GMems, trumps = Trumps}] ->
            GMems1 = [Id | GMems -- [Id]],
            NewG = G#guild_league_guild{member_num = GMnum + AddNum,
                                        members = GMems1},
            guild_league_guild:update(NewG),
            case lists:keyfind(Id, #guild_league_trump.id, Trumps)
                of
                #guild_league_trump{} when StateName =:= active ->
                    mark_trump(self(), Id);
                _ -> ok
            end,
            guild_league_guild:sync_data(NewG);
        _ -> ok
    end,
    case ets:lookup(guild_league_alliance, {MatchId, Side})
        of
        [A = #guild_league_alliance{movability = Gm,
                                    member_num = Mnum, remain_num = Rnum,
                                    match_id = MatchId, members = Mems}]
            when Rm < 1 ->
            Mems1 = [Id | Mems -- [Id]],
            NewA = A#guild_league_alliance{movability = Gm + Rm,
                                           member_num = Mnum + AddNum,
                                           remain_num = Rnum, members = Mems1},
            guild_league_guild:update(NewA),
            guild_league_guild:sync_data(NewA),
            map_async(MapPid,
                      {guild_league_role, callback, [{push, 17601}]});
        [A = #guild_league_alliance{movability = Gm,
                                    member_num = Mnum, remain_num = Rnum,
                                    match_id = MatchId, members = Mems}] ->
            Mems1 = [Id | Mems -- [Id]],
            NewA = A#guild_league_alliance{movability = Gm + Rm,
                                           member_num = Mnum + AddNum,
                                           remain_num = Rnum + 1,
                                           members = Mems1},
            guild_league_guild:update(NewA),
            guild_league_guild:sync_data(NewA),
            map_async(MapPid,
                      {guild_league_role, callback, [{push, 17601}]});
        _R ->
            logger:error("找不到联盟 ~w ~w",
                         [{MatchId, Side}, _R],
                         guild_league_match,
                         993),
            ok
    end.

check_fight_target(TargetId, Args = #{now := Now}) ->
    case ets:lookup(guild_league_role, TargetId) of
        [#guild_league_role{last_killed = Last}]
            when Now - Last < 90 ->
            {false,
             notice:format(lang:get("对方才刚刚战败了，请稍候~ts秒"),
                           [{string_2, 5, 90 - (Now - Last)}])};
        [#guild_league_role{last_win = Last}]
            when Now - Last < 30 ->
            {false,
             notice:format(lang:get("对方才刚刚战斗完，请稍候~ts秒"),
                           [{string_2, 5, 30 - (Now - Last)}])};
        [#guild_league_role{movability = M, side = DfdSide}]
            when M >= 0 ->
            {ok, get_combat_args(Args#{dfd_side => DfdSide})};
        _ -> {false, lang:get("对方行动力不足了")}
    end.

calc_fighter(_Type, M, []) -> M;
calc_fighter(Type, M, L = [#{id := Id} | _]) ->
    case ets:lookup(guild_league_role, Id) of
        [#guild_league_role{match_id = MatchId, side = Side,
                            gid = Gid}] ->
            guild_league_guild:acc_win(Type, Gid),
            case ets:lookup(guild_league_alliance, {MatchId, Side})
                of
                [A = #guild_league_alliance{}] ->
                    calc_fighter(Type, M, L, A);
                _ ->
                    logger:error("找不到公会联盟信息[~w]",
                                 [{MatchId, Side}],
                                 guild_league_match,
                                 1021),
                    M
            end;
        _ ->
            logger:error("找不到角色参战信息[~w]",
                         [Id],
                         guild_league_match,
                         1025),
            M
    end.

calc_fighter(Type,
             M = #guild_league_match{is_judge = true, win_side = 0},
             [],
             A0 = #guild_league_alliance{side = Side,
                                         match_id = MatchId, remain_num = 0,
                                         win = Win, lost = Lost}) ->
    A = case Type of
            {win, _} ->
                A0#guild_league_alliance{win = Win + 1, remain_num = 0,
                                         remain_unit = 0};
            _ ->
                A0#guild_league_alliance{lost = Lost + 1,
                                         remain_num = 0, remain_unit = 0}
        end,
    NewM = case ets:lookup(guild_league_alliance,
                           {MatchId,
                            guild_league_guild:get_opposite_side(Side)})
               of
               [A2 = #guild_league_alliance{}] ->
                   save_result(guild_league_guild:get_opposite_side(Side),
                               M,
                               A2,
                               A);
               _ ->
                   logger:error("找不到联盟 ~w",
                                [{MatchId,
                                  guild_league_guild:get_opposite_side(Side)}],
                                guild_league_match,
                                1038),
                   M
           end,
    NewM;
calc_fighter({win, _},
             H = #guild_league_match{is_judge = true, win_side = 0,
                                     grade = Grade},
             [],
             A0 = #guild_league_alliance{side = Side,
                                         match_id = MatchId, remain_num = M1,
                                         movability = M1, win = Win,
                                         remain_unit = U1}) ->
    A = A0#guild_league_alliance{win = Win + 1,
                                 remain_num = 0},
    {D2, U2} =
        guild_league_unit:calc_duration_and_remain(guild_league_guild:get_opposite_side(Side),
                                                   MatchId),
    NewH = case ets:lookup(guild_league_alliance,
                           {MatchId,
                            guild_league_guild:get_opposite_side(Side)})
               of
               [A2 = #guild_league_alliance{side = OpSide,
                                            remain_num = M2, movability = M2,
                                            remain_unit = U2}]
                   when U2 > U1 ->
                   save_result(OpSide,
                               H,
                               A2#guild_league_alliance{duration = D2,
                                                        remain_unit = U2},
                               A);
               [A2 = #guild_league_alliance{remain_num = M2,
                                            movability = M2, remain_unit = U2}]
                   when U2 < U1 ->
                   save_result(Side,
                               H,
                               A,
                               A2#guild_league_alliance{duration = D2,
                                                        remain_unit = U2});
               [A2 = #guild_league_alliance{side = OpSide,
                                            remain_num = M2, movability = M2}]
                   when M2 > M1 ->
                   save_result(OpSide,
                               H,
                               A2#guild_league_alliance{duration = D2,
                                                        remain_unit = U2},
                               A);
               [A2 = #guild_league_alliance{remain_num = M2,
                                            movability = M2}]
                   when M2 < M1 ->
                   save_result(Side,
                               H,
                               A,
                               A2#guild_league_alliance{duration = D2,
                                                        remain_unit = U2});
               [A2 = #guild_league_alliance{remain_num = M1,
                                            movability = M1}] ->
                   case Grade of
                       1 ->
                           case util:rand(1, 2) of
                               1 -> save_result(1, H, A, A2);
                               _ -> save_result(2, H, A2, A)
                           end;
                       _ -> save_result(3, H, A, A2)
                   end;
               [_] ->
                   guild_league_guild:update(A),
                   H;
               _ ->
                   logger:error("找不到联盟 ~w",
                                [{MatchId,
                                  guild_league_guild:get_opposite_side(Side)}],
                                guild_league_match,
                                1075),
                   guild_league_guild:update(A),
                   H
           end,
    NewH;
calc_fighter(lost,
             H = #guild_league_match{is_judge = true, win_side = 0,
                                     grade = Grade},
             [],
             A0 = #guild_league_alliance{side = Side,
                                         match_id = MatchId, remain_num = M1,
                                         movability = M1, lost = Lost}) ->
    A = A0#guild_league_alliance{lost = Lost + 1,
                                 remain_unit = 0},
    NewH = case ets:lookup(guild_league_alliance,
                           {MatchId,
                            guild_league_guild:get_opposite_side(Side)})
               of
               [A2 = #guild_league_alliance{side = OpSide,
                                            remain_num = M2, movability = M2}]
                   when M2 > M1 ->
                   save_result(OpSide, H, A2, A);
               [A2 = #guild_league_alliance{remain_num = M2,
                                            movability = M2}]
                   when M2 < M1 ->
                   save_result(Side, H, A, A2);
               [A2 = #guild_league_alliance{remain_num = M1,
                                            movability = M1}] ->
                   case Grade of
                       1 ->
                           case util:rand(1, 2) of
                               1 -> save_result(1, H, A, A2);
                               _ -> save_result(2, H, A2, A)
                           end;
                       _ -> save_result(3, H, A, A2)
                   end;
               [_] ->
                   guild_league_guild:update(A),
                   H;
               _ ->
                   logger:error("找不到联盟 ~w",
                                [{MatchId,
                                  guild_league_guild:get_opposite_side(Side)}],
                                guild_league_match,
                                1106),
                   guild_league_guild:update(A),
                   H
           end,
    NewH;
calc_fighter(lost, M = #guild_league_match{}, [],
             A = #guild_league_alliance{lost = Lost}) ->
    NewA = A#guild_league_alliance{lost = Lost + 1},
    guild_league_guild:update(NewA),
    M;
calc_fighter(_, M = #guild_league_match{}, [],
             A = #guild_league_alliance{win = Win}) ->
    NewA = A#guild_league_alliance{win = Win + 1},
    guild_league_guild:update(NewA),
    M;
calc_fighter({win, AddScore},
             Match = #guild_league_match{map_pid = _MapPid},
             [#{id := Id} | T],
             A = #guild_league_alliance{remain_num = Remain,
                                        attacked_unit = Attacked,
                                        movability = Gm}) ->
    case ets:lookup(guild_league_role, Id) of
        [R = #guild_league_role{pid = Pid, win = RWin,
                                movability = 0, score = Score,
                                attacked_unit = RAU}] ->
            R1 = R#guild_league_role{win = RWin + 1,
                                     score = Score + AddScore,
                                     last_win = date:unixtime()},
            NewR = #guild_league_role{cannon_attacked = RAU1} = case
                                                                    guild_league_unit:combat_over(R1)
                                                                    of
                                                                    {ok, R2} ->
                                                                        R2;
                                                                    {ok,
                                                                     R2,
                                                                     NewU =
                                                                         #guild_league_unit{id
                                                                                                =
                                                                                                {_,
                                                                                                 TUid},
                                                                                            duration
                                                                                                =
                                                                                                Duration},
                                                                     UDmg} ->
                                                                        guild_league_guild:sync_data(NewU),
                                                                        guild_league_unit:reward_destroy(NewU),
                                                                        BaseId2 =
                                                                            guild_league_unit:get_base_id(TUid),
                                                                        notice_done_attack_unit(R,
                                                                                                NewU,
                                                                                                UDmg),
                                                                        role:apply(async,
                                                                                   Pid,
                                                                                   {guild_league_role,
                                                                                    callback,
                                                                                    [{team_unit_reward,
                                                                                      #{operating_unit
                                                                                            =>
                                                                                            TUid,
                                                                                        base_id
                                                                                            =>
                                                                                            BaseId2,
                                                                                        duration
                                                                                            =>
                                                                                            Duration,
                                                                                        unit_dmg
                                                                                            =>
                                                                                            UDmg}}]}),
                                                                        R2;
                                                                    _ -> R1
                                                                end,
            guild_league_guild:update(NewR),
            guild_league_guild:sync_data(NewR),
            role:apply(async,
                       Pid,
                       {guild_league_role, callback, [leave_by_movability]}),
            notice:send({pid, Pid},
                        3,
                        lang:get("战斗胜利，公会又向胜利迈进一步！")),
            NewAttacked = case RAU1 > RAU of
                              true -> Attacked + 1;
                              _ -> Attacked
                          end,
            calc_fighter({win, AddScore},
                         Match,
                         T,
                         A#guild_league_alliance{remain_num =
                                                     max(0, Remain - 1),
                                                 attacked_unit = NewAttacked});
        [R = #guild_league_role{pid = Pid, win = RWin,
                                score = Score, attacked_unit = RAU,
                                movability = Rm}] ->
            R1 = R#guild_league_role{win = RWin + 1,
                                     score = Score + AddScore,
                                     last_win = date:unixtime()},
            NewR = #guild_league_role{movability = NewRm} =
                       #guild_league_role{cannon_attacked = RAU1} = case
                                                                        guild_league_unit:combat_over(R1)
                                                                        of
                                                                        {ok,
                                                                         R2} ->
                                                                            R2;
                                                                        {ok,
                                                                         R2,
                                                                         NewU =
                                                                             #guild_league_unit{id
                                                                                                    =
                                                                                                    {_,
                                                                                                     TUid},
                                                                                                duration
                                                                                                    =
                                                                                                    Duration},
                                                                         UDmg} ->
                                                                            guild_league_guild:sync_data(NewU),
                                                                            guild_league_unit:reward_destroy(NewU),
                                                                            BaseId2 =
                                                                                guild_league_unit:get_base_id(TUid),
                                                                            notice_done_attack_unit(R,
                                                                                                    NewU,
                                                                                                    UDmg),
                                                                            role:apply(async,
                                                                                       Pid,
                                                                                       {guild_league_role,
                                                                                        callback,
                                                                                        [{team_unit_reward,
                                                                                          #{operating_unit
                                                                                                =>
                                                                                                TUid,
                                                                                            base_id
                                                                                                =>
                                                                                                BaseId2,
                                                                                            duration
                                                                                                =>
                                                                                                Duration,
                                                                                            unit_dmg
                                                                                                =>
                                                                                                UDmg}}]}),
                                                                            R2;
                                                                        _ -> R1
                                                                    end,
            NewAttacked = case RAU1 > RAU of
                              true -> Attacked + 1;
                              _ -> Attacked
                          end,
            guild_league_guild:update(NewR),
            guild_league_guild:sync_data(NewR),
            notice:send({pid, Pid},
                        3,
                        lang:get("战斗胜利，公会又向胜利迈进一步！")),
            calc_fighter({win, AddScore},
                         Match,
                         T,
                         A#guild_league_alliance{attacked_unit = NewAttacked,
                                                 movability =
                                                     max(1,
                                                         Gm - (Rm - NewRm))});
        _ -> calc_fighter({win, AddScore}, Match, T, A)
    end;
calc_fighter(lost, Match, [F = #{id := Id} | T],
             A = #guild_league_alliance{movability = Gm,
                                        remain_num = Remain}) ->
    case ets:lookup(guild_league_role, Id) of
        [R = #guild_league_role{movability = Rm, pid = Pid}] ->
            CostMovability = case F of
                                 #{guarding_unit := true} -> 160;
                                 _ -> 240
                             end,
            NewRm = max(0, Rm - CostMovability),
            NewRemain = case NewRm of
                            0 -> max(0, Remain - 1);
                            _ -> Remain
                        end,
            NewR = R#guild_league_role{movability = NewRm,
                                       last_killed = date:unixtime(),
                                       operating_unit = 0},
            guild_league_guild:update(NewR),
            guild_league_guild:sync_data(NewR),
            role:apply(async,
                       Pid,
                       {guild_league_role,
                        callback,
                        [{lost, NewRm, CostMovability}]}),
            calc_fighter(lost,
                         Match,
                         T,
                         A#guild_league_alliance{movability =
                                                     max(NewRm,
                                                         Gm -
                                                             max(0,
                                                                 Rm - NewRm)),
                                                 remain_num = NewRemain});
        _ -> calc_fighter(lost, Match, T, A)
    end.

get_win_score(5) -> 100;
get_win_score(4) -> 72;
get_win_score(3) -> 45;
get_win_score(2) -> 24;
get_win_score(_) -> 10.

atk_movability_lost([], _) -> ok;
atk_movability_lost(L = [Id | T], MapPid) ->
    case ets:lookup(guild_league_role, Id) of
        [#guild_league_role{match_id = MatchId, side = Side,
                            gid = Gid}] ->
            case ets:lookup(guild_league_alliance, {MatchId, Side})
                of
                [A = #guild_league_alliance{}] ->
                    atk_movability_lost(L, A, MapPid);
                _ ->
                    logger:error("没找到联盟 ~w, ~w",
                                 [Gid, {MatchId, Side}],
                                 guild_league_match,
                                 1207),
                    atk_movability_lost(T, MapPid)
            end;
        _ ->
            logger:error("没找到参战者 ~w",
                         [Id],
                         guild_league_match,
                         1211),
            atk_movability_lost(T, MapPid)
    end.

atk_movability_lost([], A = #guild_league_alliance{},
                    MapPid) ->
    guild_league_guild:update(A),
    guild_league_guild:sync_data(A),
    map_async(MapPid,
              {guild_league_role, callback, [{push, 17601}]}),
    ok;
atk_movability_lost([Id | T],
                    A = #guild_league_alliance{movability = Gm}, MapPid) ->
    case ets:lookup(guild_league_role, Id) of
        [R = #guild_league_role{movability = Rm}] ->
            NewRm = max(1, Rm - 70),
            R1 =
                guild_league_unit:disturb(R#guild_league_role{movability
                                                                  = NewRm}),
            guild_league_guild:update(R1),
            guild_league_guild:sync_data(R1),
            NewA = A#guild_league_alliance{movability =
                                               max(NewRm,
                                                   Gm - max(0, Rm - NewRm))},
            atk_movability_lost(T, NewA, MapPid);
        _ ->
            logger:error("找不到参战者 ~w",
                         [Id],
                         guild_league_match,
                         1229),
            atk_movability_lost(T, A, MapPid)
    end.

do_judge(H = #guild_league_match{win_side = 0,
                                 id = MatchId, grade = Grade}) ->
    case {ets:lookup(guild_league_alliance, {MatchId, 1}),
          ets:lookup(guild_league_alliance, {MatchId, 2})}
        of
        {[A1 = #guild_league_alliance{remain_num = M}],
         [A2 = #guild_league_alliance{remain_num = M2}]}
            when M2 < 1 andalso M > 0 ->
            save_result(1,
                        H,
                        A1,
                        A2#guild_league_alliance{remain_unit = 0});
        {[A1 = #guild_league_alliance{remain_num = M1}],
         [A2 = #guild_league_alliance{remain_num = M}]}
            when M1 < 1 andalso M > 0 ->
            save_result(2,
                        H,
                        A2,
                        A1#guild_league_alliance{remain_unit = 0});
        {[A1 = #guild_league_alliance{remain_num = 0}],
         [A2 = #guild_league_alliance{remain_num = 0}]} ->
            case Grade of
                1 ->
                    case util:rand(1, 2) of
                        1 -> save_result(1, H, A1, A2);
                        _ -> save_result(2, H, A2, A1)
                    end;
                _ -> save_result(3, H, A1, A2)
            end;
        {[A1 = #guild_league_alliance{remain_num = M1,
                                      movability = M1, remain_unit = U1}],
         [A2 = #guild_league_alliance{remain_num = M2,
                                      movability = M2, remain_unit = U2}]}
            when U1 > U2 ->
            save_result(1, H, A1, A2);
        {[A1 = #guild_league_alliance{remain_num = M1,
                                      movability = M1, remain_unit = U1}],
         [A2 = #guild_league_alliance{remain_num = M2,
                                      movability = M2, remain_unit = U2}]}
            when U2 > U1 ->
            save_result(2, H, A2, A1);
        {[A1 = #guild_league_alliance{remain_num = M1,
                                      movability = M1}],
         [A2 = #guild_league_alliance{remain_num = M2,
                                      movability = M2}]}
            when M1 > M2 ->
            save_result(1, H, A1, A2);
        {[A1 = #guild_league_alliance{remain_num = M1,
                                      movability = M1}],
         [A2 = #guild_league_alliance{remain_num = M2,
                                      movability = M2}]}
            when M2 > M1 ->
            save_result(2, H, A2, A1);
        {[A1 = #guild_league_alliance{remain_num = M,
                                      movability = M}],
         [A2 = #guild_league_alliance{remain_num = M,
                                      movability = M}]} ->
            case Grade of
                1 ->
                    case util:rand(1, 2) of
                        1 -> save_result(1, H, A1, A2);
                        _ -> save_result(2, H, A2, A1)
                    end;
                _ -> save_result(3, H, A1, A2)
            end;
        _Else -> H
    end;
do_judge(M) -> M.

do_calc_result(H = #guild_league_match{grade = 1,
                                       win_side = 0, id = MatchId}) ->
    case {ets:lookup(guild_league_alliance, {MatchId, 1}),
          ets:lookup(guild_league_alliance, {MatchId, 2})}
        of
        {[A1 = #guild_league_alliance{remain_unit = U1}],
         [A2 = #guild_league_alliance{remain_unit = U2}]}
            when U1 > U2 ->
            save_result(1, H, A1, A2);
        {[A1 = #guild_league_alliance{remain_unit = U1}],
         [A2 = #guild_league_alliance{remain_unit = U2}]}
            when U2 > U1 ->
            save_result(2, H, A2, A1);
        {[A1 = #guild_league_alliance{duration = D1}],
         [A2 = #guild_league_alliance{duration = D2}]}
            when D1 > D2 ->
            save_result(1, H, A1, A2);
        {[A1 = #guild_league_alliance{duration = D1}],
         [A2 = #guild_league_alliance{duration = D2}]}
            when D2 > D1 ->
            save_result(2, H, A2, A1);
        {[A1 = #guild_league_alliance{remain_num = Rm1}],
         [A2 = #guild_league_alliance{remain_num = Rm2}]}
            when Rm1 > Rm2 ->
            save_result(1, H, A1, A2);
        {[A1 = #guild_league_alliance{remain_num = Rm1}],
         [A2 = #guild_league_alliance{remain_num = Rm2}]}
            when Rm2 > Rm1 ->
            save_result(2, H, A2, A1);
        {[A1 = #guild_league_alliance{movability = M1}],
         [A2 = #guild_league_alliance{movability = M2}]}
            when M1 > M2 ->
            save_result(1, H, A1, A2);
        {[A1 = #guild_league_alliance{movability = M1}],
         [A2 = #guild_league_alliance{movability = M2}]}
            when M2 > M1 ->
            save_result(2, H, A2, A1);
        {[A1 = #guild_league_alliance{}],
         [A2 = #guild_league_alliance{}]} ->
            case util:rand(1, 2) of
                1 -> save_result(1, H, A1, A2);
                _ -> save_result(2, H, A2, A1)
            end;
        _Else ->
            logger:error("战场结算异常 ~w",
                         [_Else],
                         guild_league_match,
                         1307),
            H#guild_league_match{win_side = 3}
    end;
do_calc_result(H = #guild_league_match{win_side = 0,
                                       id = MatchId}) ->
    case {ets:lookup(guild_league_alliance, {MatchId, 1}),
          ets:lookup(guild_league_alliance, {MatchId, 2})}
        of
        {[A1 = #guild_league_alliance{remain_unit = U1}],
         [A2 = #guild_league_alliance{remain_unit = U2}]}
            when U1 > U2 ->
            save_result(1, H, A1, A2);
        {[A1 = #guild_league_alliance{remain_unit = U1}],
         [A2 = #guild_league_alliance{remain_unit = U2}]}
            when U2 > U1 ->
            save_result(2, H, A2, A1);
        {[A1 = #guild_league_alliance{}],
         [A2 = #guild_league_alliance{}]} ->
            save_result(3, H, A1, A2);
        _Else ->
            logger:error("战场结算异常 ~w",
                         [_Else],
                         guild_league_match,
                         1321),
            H#guild_league_match{win_side = 3}
    end;
do_calc_result(M) -> M.

calc_unit(M = #guild_league_match{win_side = 0,
                                  id = MatchId}) ->
    case {ets:lookup(guild_league_alliance, {MatchId, 1}),
          ets:lookup(guild_league_alliance, {MatchId, 2})}
        of
        {[A1 = #guild_league_alliance{}],
         [A2 = #guild_league_alliance{}]} ->
            {D1, Num1} =
                guild_league_unit:calc_duration_and_remain(1, MatchId),
            {D2, Num2} =
                guild_league_unit:calc_duration_and_remain(2, MatchId),
            calc_unit(M,
                      A1#guild_league_alliance{duration = D1,
                                               remain_unit = Num1},
                      A2#guild_league_alliance{duration = D2,
                                               remain_unit = Num2});
        _Else ->
            logger:error("战场结算异常 ~w",
                         [_Else],
                         guild_league_match,
                         1335),
            M
    end;
calc_unit(M) -> M.

calc_unit(M, A1 = #guild_league_alliance{duration = 0},
          A2 = #guild_league_alliance{side = Side}) ->
    save_result(Side, M, A2, A1);
calc_unit(M, A1 = #guild_league_alliance{side = Side},
          A2 = #guild_league_alliance{duration = 0}) ->
    save_result(Side, M, A1, A2);
calc_unit(M = #guild_league_match{}, A1, A2) ->
    guild_league_guild:update([A1, A2]),
    guild_league_guild:sync_data([A1, A2]),
    M.

calc_guard_unit(Winner, Loser) ->
    case [DName
          || #{name := DName, is_leader := 1} <- Winner]
        of
        [DefName | _] ->
            case do_calc_guard_unit(loser, Loser, DefName) of
                {ok,
                 R = #guild_league_role{side = Side,
                                        match_id = MatchId}} ->
                    do_calc_guard_unit(winner, Winner, R),
                    case ets:lookup(guild_league_alliance,
                                    {MatchId,
                                     guild_league_guild:get_opposite_side(Side)})
                        of
                        [A = #guild_league_alliance{guarded_unit = Guarded}] ->
                            A1 = A#guild_league_alliance{guarded_unit =
                                                             Guarded + 1},
                            guild_league_guild:update(A1);
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

do_calc_guard_unit(_, [], _) -> ok;
do_calc_guard_unit(loser, [#{id := Id, pid := Pid} | T],
                   DefName) ->
    case ets:lookup(guild_league_role, Id) of
        [R = #guild_league_role{operating_unit = Uid}]
            when Uid =/= 0 ->
            Msg = notice:format(lang:get("进攻被打断，~ts对你发起~ts"),
                                [{role_2, DefName},
                                 {string_2, 5, lang:get("防守反击")}]),
            notice:send({pid, Pid}, 3, Msg),
            {ok, R};
        _ -> do_calc_guard_unit(loser, T, DefName)
    end;
do_calc_guard_unit(winner,
                   [#{pid := Pid, id := Id} | T],
                   R = #guild_league_role{name = Name,
                                          operating_unit = Uid = 7}) ->
    Msg = notice:format(lang:get("防守成功，你阻止了~ts使用~ts的进攻"),
                        [{role_2, Name},
                         {unit_1, guild_league_unit:get_base_id(Uid)}]),
    notice:send({pid, Pid}, 3, Msg),
    acc_guarded_unit(Id),
    do_calc_guard_unit(winner, T, R);
do_calc_guard_unit(winner,
                   [#{pid := Pid, id := Id} | T],
                   R = #guild_league_role{name = Name,
                                          operating_unit = Uid}) ->
    Msg = notice:format(lang:get("防守成功，你阻止了~ts的对~ts的进攻"),
                        [{role_2, Name},
                         {unit_1, guild_league_unit:get_base_id(Uid)}]),
    notice:send({pid, Pid}, 3, Msg),
    acc_guarded_unit(Id),
    do_calc_guard_unit(winner, T, R).

acc_guarded_unit(Rid) ->
    case ets:lookup(guild_league_role, Rid) of
        [R = #guild_league_role{guarded_unit = Guarded}] ->
            R1 = R#guild_league_role{guarded_unit = Guarded + 1},
            guild_league_guild:update(R1);
        _ -> ok
    end.

acc_attacked_unit(#guild_league_role{cannon_attacked =
                                         RAU1,
                                     match_id = MatchId, side = Side,
                                     movability = NewRm},
                  #guild_league_role{movability = Rm,
                                     cannon_attacked = RAU,
                                     operating_unit = Uid}) ->
    case ets:lookup(guild_league_alliance, {MatchId, Side})
        of
        [A = #guild_league_alliance{attacked_unit = Attacked,
                                    movability = Gm}] ->
            A1 = #guild_league_alliance{movability =
                                            max(1, Gm - (Rm - NewRm))},
            A2 = case Uid =:= 7 andalso RAU1 > RAU of
                     true ->
                         A#guild_league_alliance{attacked_unit = Attacked + 1};
                     _ -> A1
                 end,
            guild_league_guild:update(A2),
            guild_league_guild:sync_data(A2);
        _ -> ok
    end;
acc_attacked_unit(_, _) -> ok.

update_trumps(MatchId) ->
    case ets:lookup(guild_league_alliance, {MatchId, 1}) of
        [A1 = #guild_league_alliance{gids = Gids1}] ->
            do_update_trumps(Gids1, A1);
        _ -> ok
    end,
    case ets:lookup(guild_league_alliance, {MatchId, 2}) of
        [A2 = #guild_league_alliance{gids = Gids2}] ->
            do_update_trumps(Gids2, A2);
        _ -> ok
    end.

do_update_trumps([], A) ->
    guild_league_guild:update(A),
    guild_league_guild:sync_data(A),
    ok;
do_update_trumps([Id | T], A) ->
    NewA = case guild_league_guild:lookup(Id) of
               [#guild_league_guild{trumps = Trumps}] ->
                   do_mark_trumps(Trumps, A);
               _ -> A
           end,
    do_update_trumps(T, NewA).

do_mark_trumps([], A) -> A;
do_mark_trumps([#guild_league_trump{id = Id} | T], A) ->
    NewA = case ets:lookup(guild_league_role, Id) of
               [R = #guild_league_role{pid = Pid}] ->
                   role:apply(async,
                              Pid,
                              {guild_league_role, callback, [team_mark_trump]}),
                   do_mark_trump(R, A);
               _ -> A
           end,
    do_mark_trumps(T, NewA).

do_mark_trump(R = #guild_league_role{movability = RM},
              A = #guild_league_alliance{movability = AM}) ->
    NewRM = max(0, 1000 - max(0, 500 - RM)),
    R1 = R#guild_league_role{is_trump = 1,
                             movability = NewRM},
    guild_league_guild:update(R1),
    guild_league_guild:sync_data(R1),
    A#guild_league_alliance{movability =
                                AM + max(0, NewRM - RM)}.

clear_block_units(MapPid) ->
    case map:unit_list(MapPid) of
        {ok, L} ->
            lists:foreach(fun (#map_unit{id = Uid,
                                         base_id = BaseId}) ->
                                  case lists:member(BaseId,
                                                    [79580, 79581, 79582])
                                      of
                                      true -> unit_mgr:remove(Uid);
                                      _ -> ok
                                  end;
                              (_) -> ok
                          end,
                          L);
        _ -> ok
    end.

ready_to_war(MatchId) ->
    case ets:lookup(guild_league_alliance, {MatchId, 1}) of
        [#guild_league_alliance{members = L1}] ->
            do_ready_to_war(L1);
        _ -> ok
    end,
    case ets:lookup(guild_league_alliance, {MatchId, 2}) of
        [#guild_league_alliance{members = L2}] ->
            do_ready_to_war(L2);
        _ -> ok
    end.

do_ready_to_war([]) -> ok;
do_ready_to_war([Id | T]) ->
    case ets:lookup(guild_league_role, Id) of
        [#guild_league_role{pid = Pid}] when is_pid(Pid) ->
            role:apply(async,
                       Pid,
                       {guild_league_role, callback, [to_war]});
        _ -> ok
    end,
    do_ready_to_war(T).

do_disturb_unit([]) -> ok;
do_disturb_unit([Id | T]) ->
    do_disturb_unit(Id),
    do_disturb_unit(T);
do_disturb_unit(Id) ->
    case ets:lookup(guild_league_role, Id) of
        [R = #guild_league_role{}] ->
            R1 = guild_league_unit:disturb(R),
            guild_league_guild:update(R1),
            guild_league_guild:sync_data(R1);
        _ -> ok
    end.

do_stop_guarding([]) -> ok;
do_stop_guarding([Id | T]) ->
    do_stop_guarding(Id),
    do_stop_guarding(T);
do_stop_guarding(Id) ->
    case ets:lookup(guild_league_role, Id) of
        [R = #guild_league_role{}] ->
            R1 = guild_league_unit:stop_guarding(R),
            guild_league_guild:update(R1),
            guild_league_guild:sync_data(R1);
        _ -> ok
    end.

get_later_reduce(_) -> 0.

notice_side(Aid, Type, Msg) ->
    case ets:lookup(guild_league_alliance, Aid) of
        [#guild_league_alliance{members = Ids}] ->
            do_notice_side(Ids, Type, Msg);
        _ -> ok
    end.

do_notice_side([], _, _) -> ok;
do_notice_side([Id | T], Type, Msg) ->
    case ets:lookup(guild_league_role, Id) of
        [#guild_league_role{pid = Pid}] when is_pid(Pid) ->
            role:apply(async,
                       Pid,
                       {guild_league_role, callback, [{notice, Type, Msg}]});
        _ -> ok
    end,
    do_notice_side(T, Type, Msg).

notice_done_attack_unit(#guild_league_role{name = Name,
                                           match_id = MatchId, side = Side,
                                           operating_unit = Uid},
                        #guild_league_unit{id = {_, TUid},
                                           duration = NewDuration,
                                           side = USide},
                        Dmg) ->
    BaseId2 = guild_league_unit:get_base_id(TUid),
    GName1 = guild_league_guild:get_name(by_aid,
                                         {MatchId, Side}),
    GName2 = guild_league_guild:get_name(by_aid,
                                         {MatchId, USide}),
    case Uid of
        7 ->
            Msg1 =
                notice:format(lang:get("~ts带领的队伍成功开炮！敌方~ts遭到~ts点重创，剩余~ts耐久"),
                              [{role_2, Name},
                               {unit_1, BaseId2},
                               {string_2, 5, Dmg},
                               {string_2, 5, NewDuration}]),
            Msg2 =
                notice:format(lang:get("~ts带领的队伍成功开炮！我方~ts遭到~ts点重创，剩余~ts耐久"),
                              [{role_2, Name},
                               {unit_1, BaseId2},
                               {string_2, 5, Dmg},
                               {string_2, 5, NewDuration}]),
            Msg3 =
                notice:format(lang:get("~ts的~ts带领的队伍成功开炮！~ts的~ts遭到~ts点重创，剩余~ts耐久"),
                              [{string_2, 2, GName1},
                               {role_2, Name},
                               {string_2, 2, GName2},
                               {unit_1, BaseId2},
                               {string_2, 5, Dmg},
                               {string_2, 5, NewDuration}]),
            guild_league_live:add_log(MatchId, Msg3),
            notice_side({MatchId, Side}, 32, Msg1),
            notice_side({MatchId, USide}, 32, Msg2);
        _ ->
            Msg1 =
                notice:format(lang:get("~ts带领的队伍对敌方~ts造成了~ts伤害，剩余~ts耐久"),
                              [{role_2, Name},
                               {unit_1, BaseId2},
                               {string_2, 5, Dmg},
                               {string_2, 5, NewDuration}]),
            Msg2 =
                notice:format(lang:get("我方~ts被~ts带领的队伍造成了~ts伤害，剩余~ts耐久"),
                              [{unit_1, BaseId2},
                               {role_2, Name},
                               {string_2, 5, Dmg},
                               {string_2, 5, NewDuration}]),
            Msg3 =
                notice:format(lang:get("~ts的~ts带领的队伍对~ts的~ts造成了~ts伤害，剩余~ts耐久"),
                              [{string_2, 2, GName1},
                               {role_2, Name},
                               {string_2, 2, GName2},
                               {unit_1, BaseId2},
                               {string_2, 5, Dmg},
                               {string_2, 5, NewDuration}]),
            guild_league_live:add_log(MatchId, Msg3),
            notice_side({MatchId, Side}, 32, Msg1),
            notice_side({MatchId, USide}, 32, Msg2)
    end,
    case NewDuration of
        0 ->
            notice_side({MatchId, USide},
                        11,
                        notice:format(lang:get("我方~ts遭到摧毁。{sound_1, 569}"),
                                      [{unit_1, BaseId2}])),
            notice_side({MatchId, Side},
                        11,
                        notice:format(lang:get("敌方~ts遭到摧毁，向胜利进军！{sound_1, 570} "),
                                      [{unit_1, BaseId2}])),
            notice_side({MatchId, USide},
                        32,
                        notice:format(lang:get("我方~ts遭到摧毁。"),
                                      [{unit_1, BaseId2}])),
            notice_side({MatchId, Side},
                        32,
                        notice:format(lang:get("敌方~ts遭到摧毁，向胜利进军！ "),
                                      [{unit_1, BaseId2}]));
        _ -> ok
    end.

calc_first_blood([], _MapId) -> ok;
calc_first_blood(L, MapId) ->
    case erlang:get(first_blood) of
        true -> ok;
        _ ->
            case [O || O = #{is_leader := 1} <- L] of
                [#{id := Id}] ->
                    case ets:lookup(guild_league_role, Id) of
                        [#guild_league_role{gid = Gid, name = RName,
                                            match_id = MatchId}] ->
                            case guild_league_guild:lookup(Gid) of
                                [#guild_league_guild{name = GName}] ->
                                    AnnStr =
                                        notice:format(lang:get("~ts的~ts率领队伍一马当先，取得了本场比赛~ts{face_1,7}"),
                                                      [{string_2, 2, GName},
                                                       {role_2, RName},
                                                       {string_2,
                                                        5,
                                                        lang:get("第一滴血")}]),
                                    guild_league_live:add_log(MatchId, AnnStr),
                                    notice:cast({map, MapId}, 32, AnnStr),
                                    notice:cast({map, MapId}, 11, AnnStr);
                                _ -> ok
                            end;
                        _ -> ok
                    end;
                _ -> ok
            end,
            MailInfo = #{title => lang:get("冠军联赛一血奖励！"),
                         content => lang:get("恭喜您取得本场比赛首杀，祝您越战越勇{face_1,3}"),
                         items => [{90020, 5}]},
            [big_world:cast(P, Z, mail, send, [I, MailInfo])
             || #{id := I = {_, P, Z}} <- L],
            erlang:put(first_blood, true)
    end.

treat_guarding_loser(Winner, Loser) ->
    Fun = fun (#{id := Id}) ->
                  case ets:lookup(guild_league_role, Id) of
                      [#guild_league_role{operating_unit = Uid}]
                          when Uid =/= 0 ->
                          true;
                      _ -> false
                  end;
              (_) -> false
          end,
    case [F || F <- Winner, Fun(F)] of
        [_ | _] -> [Lf#{guarding_unit => true} || Lf <- Loser];
        _ -> Loser
    end.

get_combat_args(#guild_league_match{id = MatchId,
                                    grade = Grade, phase = Phase},
                Side) ->
    get_combat_args(#{match_id => MatchId, grade => Grade,
                      phase => Phase, atk_side => Side}).

get_combat_args(Args = #{match_id := MatchId,
                         grade := Grade, phase := Phase, atk_side := Side}) ->
    Buff = case ets:lookup(guild_league_alliance,
                           {MatchId, Side})
               of
               [#guild_league_alliance{subsidize_buff = [H | T]}] ->
                   {0, [H | T]};
               _ ->
                   case ets:lookup(guild_league_alliance,
                                   {MatchId,
                                    guild_league_guild:get_opposite_side(Side)})
                       of
                       [#guild_league_alliance{subsidize_buff = [H | T]}] ->
                           {1, [H | T]};
                       _ -> false
                   end
           end,
    LogId = case Grade of
                1 when Phase > 4 -> guild_league_live:get_log_id();
                _ -> 0
            end,
    Args#{subsidize_buff => Buff, log_id => LogId}.

