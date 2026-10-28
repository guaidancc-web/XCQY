-file("src/mod/canyon_summit/canyon_summit_match.erl",
      1).

-module(canyon_summit_match).

-behaviour(gen_server).

-export([start_link/1,
         stop/1,
         update/1,
         login/1,
         logout/2,
         leave/2,
         check_fight/2,
         check_fight_movability/1,
         cal_score/4,
         attack_unit/3,
         guard_unit/3,
         done_attack_unit/2,
         disturb_unit/2,
         combat_start/3,
         combat_over/6,
         stop_guarding/2,
         push/1,
         get_team/1,
         insert_combat/2]).

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

-file("src/mod/canyon_summit/canyon_summit_match.erl",
      33).

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

-file("src/mod/canyon_summit/canyon_summit_match.erl",
      34).

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

-file("src/mod/canyon_summit/canyon_summit_match.erl",
      35).

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

-file("src/mod/canyon_summit/canyon_summit_match.erl",
      36).

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

-file("src/mod/canyon_summit/canyon_summit_match.erl",
      37).

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

-file("src/mod/canyon_summit/canyon_summit_match.erl",
      38).

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

-file("src/mod/canyon_summit/canyon_summit_match.erl",
      39).

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

-file("src/mod/canyon_summit/canyon_summit_match.erl",
      40).

stop(Pid) when is_pid(Pid) -> Pid ! stop;
stop(_) -> ok.

update(M = #canyon_summit_match{}) ->
    ets:insert(canyon_summit_match, M);
update(_M) ->
    logger:debug("未知数据 ~w", [_M], canyon_summit_match, 60),
    ok.

combat_start(MatchPid, Ids, LostMove) ->
    MatchPid ! {combat_start, Ids, LostMove}.

combat_over(MatchPid, WinnerF, LoserF, AtkSide, Type,
            CombatPid) ->
    MatchPid !
        {combat_over,
         WinnerF,
         LoserF,
         AtkSide,
         Type,
         CombatPid}.

stop_guarding(MatchPid, [H | T])
    when is_pid(MatchPid) ->
    MatchPid ! {stop_guarding, [H | T]};
stop_guarding(_, _) -> ok.

insert_combat(MatchPid, CombatPid)
    when is_pid(MatchPid) ->
    MatchPid ! {insert_combat, CombatPid};
insert_combat(_, _) -> ok.

attack_unit(Rid, Uid, MatchPid) ->
    gen_server:call(MatchPid, {attack_unit, Rid, Uid}).

done_attack_unit(Rid, MatchPid) ->
    gen_server:call(MatchPid, {done_attack_unit, Rid}).

disturb_unit(Rid, MatchPid) ->
    MatchPid ! {disturb_unit, Rid},
    ok.

guard_unit(Rid, Uid, MatchPid) ->
    gen_server:call(MatchPid, {guard_unit, Rid, Uid}).

cal_score(MatchPid, Rid, CostMovability, AddScore)
    when is_pid(MatchPid) ->
    MatchPid ! {cal_score, Rid, CostMovability, AddScore};
cal_score(_, _, _, _) -> ok.

push({MatchPid, Pid, Cmd = 21122}) ->
    MatchPid ! {push, Pid, Cmd};
push({MatchPid, Cmd = 21106}) -> MatchPid ! {push, Cmd}.

get_team(MatchPid) ->
    gen_server:call(MatchPid, get_team).

login(Rid) ->
    case lookup(by_rid, Rid) of
        [#canyon_summit_match{pid = Pid}] when is_pid(Pid) ->
            {ok, Pid};
        _ -> false
    end.

logout(Pid, Rid) when is_pid(Pid) ->
    Pid ! {logout, Rid};
logout(_, _) -> ok.

check_fight(Id, TargetId) ->
    Now = date:unixtime(),
    case ets:lookup(canyon_summit_role, Id) of
        [#canyon_summit_role{last_killed = Last}]
            when Now - Last < 90 ->
            {false,
             notice:format(lang:get("刚刚战败了，请稍候~ts秒"),
                           [{string_2, 5, 90 - (Now - Last)}])};
        [#canyon_summit_role{last_win = Last}]
            when Now - Last < 10 ->
            {false,
             notice:format(lang:get("刚刚胜利一场，请稍候~ts秒"),
                           [{string_2, 5, 10 - (Now - Last)}])};
        [#canyon_summit_role{movability = M}] when M =< 2 ->
            {false, lang:get("行动力不足，不能发起战斗")};
        [#canyon_summit_role{match_id = MatchId,
                             group_id = GroupId, side = TmpAtkSide}] ->
            case lookup(by_id, {GroupId, MatchId}) of
                [#canyon_summit_match{win_side = WinSide}]
                    when WinSide =/= 0 ->
                    {false, lang:get("比赛已结束，胜者可打开宝箱喔{face_1,31}")};
                [#canyon_summit_match{pid = MatchPid}] ->
                    case canyon_summit_util:check_side(Id, TargetId) of
                        true -> {false, lang:get("对方是自己人")};
                        _ ->
                            check_fight_target(TargetId,
                                               #{match_id => MatchId,
                                                 group_id => GroupId,
                                                 atk_side => TmpAtkSide,
                                                 now => Now,
                                                 match_pid => MatchPid})
                    end
            end;
        _ -> {false, lang:get("行动力不足")}
    end.

check_fight_movability(Id) ->
    case ets:lookup(canyon_summit_role, Id) of
        [#canyon_summit_role{movability = M}] when M < 2 ->
            false;
        _ -> true
    end.

leave(MatchPid, Rid) when is_pid(MatchPid) ->
    MatchPid ! {leave, Rid};
leave(_, _) -> ok.

lookup(by_rid, Rid) ->
    case ets:lookup(canyon_summit_role, Rid) of
        [#canyon_summit_role{match_id = MatchId}] ->
            lookup(by_id, MatchId);
        _ -> false
    end;
lookup(by_id, Id) ->
    ets:lookup(canyon_summit_match, Id).

start_link(Match) ->
    gen_server:start_link(canyon_summit_match, [Match], []).

init([Match = #canyon_summit_match{id =
                                       Id = {GroupId, MatchId}}]) ->
    case battle:create(battle_guild_league) of
        {ok, _Platform, _ZoneId, BattleId, BattlePid} ->
            case battle_mgr:lookup(BattleId) of
                {ok,
                 _Battle = #battle{enter_point = {MapBaseId, _X, _Y},
                                   map = LoadMaps}} ->
                    case battle:find_map_id_and_pid(MapBaseId, LoadMaps) of
                        {ok, MapId, MapPid} ->
                            canyon_summit_unit:init(#{battle_id => BattleId,
                                                      match_id => MatchId,
                                                      group_id => GroupId}),
                            Match1 = Match#canyon_summit_match{pid = self(),
                                                               battle_id =
                                                                   BattleId,
                                                               battle_pid =
                                                                   BattlePid,
                                                               map_id = MapId,
                                                               map_pid =
                                                                   MapPid},
                            update(Match1),
                            logger:info("战场~w启动",
                                        [Id],
                                        canyon_summit_match,
                                        206),
                            {ok, Match1};
                        _ ->
                            logger:error("找不到战场地图信息",
                                         [],
                                         canyon_summit_match,
                                         209),
                            ok
                    end;
                _ ->
                    logger:error("找不到战场信息", [], canyon_summit_match, 213),
                    ok
            end;
        _Err ->
            logger:error("创建战区区失败: ~w",
                         [_Err],
                         canyon_summit_match,
                         217),
            ok
    end.

handle_call({attack_unit, _Rid, {_, 7}}, _From,
            M = #canyon_summit_match{cannon_ready = false,
                                     time = Time}) ->
    Now = date:unixtime(),
    Reply = {false,
             notice:format(lang:get("炮台火力正在准备，将在~ts后正式启动"),
                           [{string_2,
                             5,
                             date:seconds_to_str(480 - (Now - Time))}])},
    {reply, Reply, M};
handle_call({attack_unit,
             [Rid = {_, P, Z} | MateIds],
             Uid = {_, USid}},
            _From, M = #canyon_summit_match{win_side = 0}) ->
    Reply = case ets:lookup(canyon_summit_role, Rid) of
                [#canyon_summit_role{movability = RM}]
                    when USid =:= 7 andalso RM < 50 ->
                    {false,
                     notice:format(lang:get("行动力低于~ts，不能进行此操作"),
                                   [{string_2, 5, 50}])};
                [#canyon_summit_role{movability = RM}] when RM < 30 ->
                    {false,
                     notice:format(lang:get("行动力低于~ts，不能进行此操作"),
                                   [{string_2, 5, 30}])};
                [R = #canyon_summit_role{match_id = MatchId,
                                         side = Side}] ->
                    case
                        canyon_summit_unit:attack(R#canyon_summit_role{operating_num
                                                                           =
                                                                           length(MateIds)
                                                                               +
                                                                               1},
                                                  Uid)
                        of
                        {ok, Operator = #canyon_summit_operator{}} ->
                            CombatArgs = get_combat_args(M, Side),
                            {ok, Operator, MatchId, CombatArgs};
                        {ok,
                         NewR,
                         Operator = #canyon_summit_operator{},
                         RematchFlag} ->
                            canyon_summit_mgr:update(canyon_summit_role, NewR),
                            cross:cast(P,
                                       Z,
                                       canyon_summit_agent,
                                       sync_update,
                                       [canyon_summit_role, NewR]),
                            canyon_summit_unit:set_cd(MateIds, USid),
                            CombatArgs = get_combat_args(M, Side),
                            NewCombatArgs = rematch_args(attack,
                                                         CombatArgs,
                                                         RematchFlag),
                            {ok, Operator, MatchId, NewCombatArgs};
                        {ok, NewR} ->
                            canyon_summit_mgr:update(canyon_summit_role, NewR),
                            cross:cast(P,
                                       Z,
                                       canyon_summit_agent,
                                       sync_update,
                                       [canyon_summit_role, NewR]),
                            canyon_summit_unit:set_cd(MateIds, USid),
                            ok;
                        Else -> Else
                    end;
                _ -> {false, lang:get("不在战场")}
            end,
    {reply, Reply, M};
handle_call({attack_unit, _, _}, _From, State) ->
    Reply = {false, lang:get("比赛已结束，胜者可打开宝箱喔{face_1,31}")},
    {reply, Reply, State};
handle_call({guard_unit, Rid = {_, P, Z}, Uid}, _From,
            M = #canyon_summit_match{win_side = 0}) ->
    Reply = case ets:lookup(canyon_summit_role, Rid) of
                [#canyon_summit_role{movability = RM}] when RM < 1 ->
                    {false,
                     notice:format(lang:get("行动力低于~ts，不能进行此操作"),
                                   [{string_2, 5, 1}])};
                [R = #canyon_summit_role{match_id = MatchId,
                                         side = Side}] ->
                    case canyon_summit_unit:guard(R, Uid) of
                        {ok,
                         Operator = #canyon_summit_operator{},
                         RematchFlag} ->
                            CombatArgs = get_combat_args(M, Side),
                            NewCombatArgs = rematch_args(guard,
                                                         CombatArgs,
                                                         RematchFlag),
                            {ok, Operator, MatchId, NewCombatArgs};
                        {ok, NewR = #canyon_summit_role{}} ->
                            canyon_summit_mgr:update(canyon_summit_role, NewR),
                            cross:cast(P,
                                       Z,
                                       canyon_summit_agent,
                                       sync_update,
                                       [canyon_summit_role, NewR]),
                            ok;
                        Else -> Else
                    end;
                _ -> {false, lang:get("不在战场")}
            end,
    {reply, Reply, M};
handle_call({guard_unit, _, _}, _From, State) ->
    Reply = {false, lang:get("比赛已结束，胜者可打开宝箱喔{face_1,31}")},
    {reply, Reply, State};
handle_call({done_attack_unit, Id = {_, P, Z}}, _From,
            M = #canyon_summit_match{id = {GroupId, MatchId},
                                     win_side = 0, map_pid = MapPid,
                                     map_id = MapId}) ->
    Res = case ets:lookup(canyon_summit_role, Id) of
              [R = #canyon_summit_role{operating_unit = Uid,
                                       name = Name, side = Side, pid = Pid}] ->
                  case canyon_summit_unit:done_attack(R) of
                      {ok,
                       R1 = #canyon_summit_role{score = OldScore},
                       NewU = #canyon_summit_unit{id = {_, _, TUid},
                                                  battle_id = TBid,
                                                  duration = Duration},
                       UDmg} ->
                          NR1 = case Duration of
                                    0 ->
                                        notice:send(Id,
                                                    3,
                                                    notice:format(lang:get("摧毁敌方水晶塔，额外获得个人积分~ts"),
                                                                  [{string_2,
                                                                    5,
                                                                    10}])),
                                        R1#canyon_summit_role{score =
                                                                  OldScore +
                                                                      10};
                                    _ -> R1
                                end,
                          canyon_summit_mgr:update(canyon_summit_role, NR1),
                          cross:cast(P,
                                     Z,
                                     canyon_summit_agent,
                                     sync_update,
                                     [canyon_summit_role, NR1]),
                          canyon_summit_unit:reward_destroy(NewU),
                          acc_attacked_unit(NR1, R),
                          BaseId2 = canyon_summit_unit:get_base_id(TUid),
                          notice_done_attack_unit(R, NewU, UDmg),
                          case Uid =:= 7 of
                              true ->
                                  role:apply(async,
                                             Pid,
                                             {canyon_summit_role,
                                              role_callback,
                                              [{team_unit_reward,
                                                #{operating_unit => Uid,
                                                  base_id => BaseId2,
                                                  duration => Duration,
                                                  unit_dmg => UDmg,
                                                  direct_unit => cannon}}]}),
                                  case erlang:get(cannon_cd_notice_ref) of
                                      OldRef when is_reference(OldRef) ->
                                          erlang:cancel_timer(OldRef);
                                      _ -> ok
                                  end,
                                  Ref = erlang:send_after(5 * 1000,
                                                          self(),
                                                          cannon_cd_notice),
                                  erlang:put(cannon_cd_notice_ref, Ref),
                                  AnnFmt =
                                      lang:get("惊天巨响！~ts的~ts，成功使用~ts，对~ts~ts造成~ts点伤害{face_1,7}"),
                                  BaseId1 = canyon_summit_unit:get_base_id(Uid),
                                  AName1 = canyon_summit_util:get_name(Side),
                                  AName2 =
                                      canyon_summit_util:get_name(canyon_summit_util:get_opposite_side(Side)),
                                  AnnStr = notice:format(AnnFmt,
                                                         [{string_2, 2, AName1},
                                                          {role_2, Name},
                                                          {unit_1, BaseId1},
                                                          {string_2, 2, AName2},
                                                          {unit_1, BaseId2},
                                                          {string_2, 5, UDmg}]),
                                  notice:cast({map, MapId}, 22, AnnStr),
                                  map_async(MapPid,
                                            {canyon_summit_role,
                                             role_callback,
                                             [{push, {21122, {5}}}]}),
                                  map_async(MapPid,
                                            {canyon_summit_role,
                                             role_callback,
                                             [{push, {21117, {TBid, TUid}}}]});
                              _ ->
                                  role:apply(async,
                                             Pid,
                                             {canyon_summit_role,
                                              role_callback,
                                              [{team_unit_reward,
                                                #{operating_unit => Uid,
                                                  base_id => BaseId2,
                                                  duration => Duration,
                                                  unit_dmg => UDmg,
                                                  direct_unit => tower}}]})
                          end,
                          {ok, Uid, calc_unit(M)};
                      Else -> Else
                  end;
              _ -> {false, lang:get("不在状态中")}
          end,
    case Res of
        {ok, UnitId, NewM = #canyon_summit_match{}} ->
            update(NewM),
            Units = canyon_summit_unit:list_all(GroupId, MatchId),
            Data = {Units},
            map_async(MapPid,
                      {canyon_summit_role,
                       role_callback,
                       [{push, 21114, Data}]}),
            Reply = {ok, UnitId},
            {reply, Reply, NewM};
        Other -> {reply, Other, M}
    end;
handle_call({done_attack_unit, _}, _From, State) ->
    Reply = {false, lang:get("不在开打时间")},
    {reply, Reply, State};
handle_call({get_map_id, Id}, _From, State) ->
    Data = ets:lookup_element(canyon_summit_match,
                              Id,
                              #canyon_summit_match.map_id),
    {reply, Data, State};
handle_call(_Request, _From, State) ->
    logger:debug("未知调用 ~w",
                 [_Request],
                 canyon_summit_match,
                 348),
    {reply, false, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({logout, Id},
            M = #canyon_summit_match{map_id = Mapid,
                                     win_side = 0}) ->
    NewM = case ets:lookup(canyon_summit_role, Id) of
               [WR = #canyon_summit_role{group_id = GroupId,
                                         match_id = MatchId, side = Side,
                                         movability = Rm}] ->
                   canyon_summit_mgr:update(canyon_summit_role,
                                            WR#canyon_summit_role{pid = 0}),
                   case ets:lookup(canyon_summit_side,
                                   {GroupId, MatchId, Side})
                       of
                       [A = #canyon_summit_side{}] when Rm < 1 ->
                           M1 = leave_judge(M, A),
                           push_21106(A, Mapid),
                           M1;
                       [A = #canyon_summit_side{movability = Gm,
                                                remain_num = GRnum}] ->
                           NewA = A#canyon_summit_side{movability =
                                                           max(0, Gm - Rm),
                                                       remain_num =
                                                           max(0, GRnum - 1)},
                           M1 = leave_judge(M, NewA),
                           push_21106(NewA, Mapid),
                           M1;
                       _ -> M
                   end;
               _ -> M
           end,
    update(NewM),
    {noreply, NewM};
handle_info({logout, _}, State) -> {noreply, State};
handle_info({leave, Id},
            M = #canyon_summit_match{map_id = Mapid,
                                     win_side = 0}) ->
    NewM = case ets:lookup(canyon_summit_role, Id) of
               [WR = #canyon_summit_role{group_id = GroupId,
                                         match_id = MatchId, side = Side,
                                         movability = Rm}] ->
                   canyon_summit_mgr:update(canyon_summit_role,
                                            WR#canyon_summit_role{pid = 0}),
                   case ets:lookup(canyon_summit_side,
                                   {GroupId, MatchId, Side})
                       of
                       [A = #canyon_summit_side{}] when Rm < 1 ->
                           M1 = leave_judge(M, A),
                           push_21106(A, Mapid),
                           M1;
                       [A = #canyon_summit_side{movability = Gm,
                                                remain_num = GRnum}] ->
                           NewA = A#canyon_summit_side{movability =
                                                           max(0, Gm - Rm),
                                                       remain_num =
                                                           max(0, GRnum - 1)},
                           M1 = leave_judge(M, NewA),
                           push_21106(NewA, Mapid),
                           M1;
                       _ -> M
                   end;
               _ -> M
           end,
    update(NewM),
    {noreply, NewM};
handle_info({leave, _}, State) -> {noreply, State};
handle_info({create_box, MapId, Num, _WinId}, State) ->
    create_box({60, MapId}, Num),
    {noreply, State};
handle_info(active,
            M = #canyon_summit_match{id = {_GroupId, _MatchId},
                                     map_pid = MapPid, map_id = MapId}) ->
    logger:debug("========", [], canyon_summit_match, 413),
    NewM = M#canyon_summit_match{time = date:unixtime()},
    clear_block_units(MapPid),
    update(NewM),
    AnnStr = lang:get("比赛正式开始！{sound_1, 567} "),
    notice:cast({map, MapId}, 11, AnnStr),
    {noreply, NewM};
handle_info(cannon_ready,
            M = #canyon_summit_match{map_id = MapId,
                                     map_pid = MapPid}) ->
    NewM = M#canyon_summit_match{cannon_ready = true},
    update(NewM),
    AnnStr =
        notice:format(lang:get("~ts准备就绪，威力无穷的炮火可对敌方水晶塔造成~ts{face_1,23}"),
                      [{unit_1, canyon_summit_unit:get_base_id(7)},
                       {string_2, 5, lang:get("大量伤害")}]),
    AnnStr1 = notice:format(lang:get("~ts{sound_1, 568}"),
                            [{string_1, AnnStr}]),
    notice:cast({map, MapId}, 22, AnnStr1),
    notice:cast({map, MapId}, 61, AnnStr),
    notice:cast({map, MapId}, 11, AnnStr),
    map_async(MapPid,
              {canyon_summit_role,
               role_callback,
               [{push, {21122, {0}}}]}),
    {noreply, NewM};
handle_info(judge, M) ->
    M1 = do_judge(M),
    NewM = M1#canyon_summit_match{is_judge = true},
    update(NewM),
    {noreply, NewM};
handle_info(calc_result, M = #canyon_summit_match{}) ->
    NewM = do_calc_result(M),
    update(NewM),
    {noreply, NewM};
handle_info({combat_over,
             Winner = [#{id := Id1} | _],
             Loser = [#{id := Id2} | _],
             AtkSide,
             Type,
             CombatPid},
            M = #canyon_summit_match{win_side = 0, map_pid = MapPid,
                                     map_id = MapId}) ->
    logger:debug("战斗结果-----~w, ~w, ~w, ~w, ~w",
                 [Winner, Loser, AtkSide, Type, CombatPid],
                 canyon_summit_match,
                 454),
    case erlang:get(canyon_summit_combat) of
        CombatList when is_list(CombatList) ->
            erlang:put(canyon_summit_combat,
                       lists:delete(CombatPid, CombatList));
        _ -> erlang:put(canyon_summit_combat, [])
    end,
    combat_cast(Winner, Loser),
    calc_guard_unit(Winner, Loser),
    Loser1 = treat_guarding_loser(Winner, Loser, Type),
    WinSide = case ets:lookup(canyon_summit_role, Id1) of
                  [#canyon_summit_role{side = Side}] -> Side;
                  _ ->
                      case ets:lookup(canyon_summit_role, Id2) of
                          [#canyon_summit_role{side = Side}] ->
                              canyon_summit_util:get_opposite_side(Side);
                          _ -> 0
                      end
              end,
    {WinScore, LostScore} = case {Type, AtkSide} of
                                {cast_enemy, WinSide} -> {20, 8};
                                {cast_enemy, _} -> {15, 10};
                                {cannon, WinSide} -> {22, 12};
                                {cannon, _} -> {22, 12};
                                {unit, WinSide} -> {22, 10};
                                {unit, _} -> {20, 12};
                                {rematch_attack, _} -> {22, 12};
                                {rematch_guard, _} -> {20, 10};
                                {false, false} ->
                                    logger:error("~w, ~w",
                                                 [Winner, Loser],
                                                 canyon_summit_match,
                                                 491),
                                    {0, 0}
                            end,
    M1 = case Winner of
             [] -> M;
             _ ->
                 calc_first_blood(Winner, MapId),
                 calc_fighter({win, WinScore}, M, Winner)
         end,
    M2 = calc_unit(M1),
    NewM = calc_fighter({lost, LostScore}, M2, Loser1),
    update(NewM),
    map_async(MapPid,
              {canyon_summit_role, role_callback, [{push, 21114}]}),
    {noreply, NewM};
handle_info({combat_over,
             _Winner,
             _Loser,
             _AtkSide,
             _Type,
             _CombatPid},
            M) ->
    {noreply, M};
handle_info({combat_start, Ids, LostMove},
            M = #canyon_summit_match{map_id = Mapid,
                                     win_side = 0}) ->
    atk_movability_lost(Ids, {LostMove, Mapid}),
    {noreply, M};
handle_info({combat_start, _Ids, _LostMove}, M) ->
    {noreply, M};
handle_info({insert_combat, CombatPid},
            M = #canyon_summit_match{win_side = 0}) ->
    logger:debug("==============insert_combat",
                 [],
                 canyon_summit_match,
                 519),
    case erlang:get(canyon_summit_combat) of
        CombatList when is_list(CombatList) ->
            erlang:put(canyon_summit_combat,
                       [CombatPid | CombatList]);
        _ -> erlang:put(canyon_summit_combat, [CombatPid])
    end,
    logger:debug("==============~w",
                 [erlang:get(canyon_summit_combat)],
                 canyon_summit_match,
                 526),
    {noreply, M};
handle_info({insert_combat, _CombatPid}, M) ->
    {noreply, M};
handle_info({disturb_unit, Ids},
            M = #canyon_summit_match{win_side = 0}) ->
    do_disturb_unit(Ids),
    {noreply, M};
handle_info({disturb_unit, _}, State) ->
    {noreply, State};
handle_info({stop_guarding, Ids},
            M = #canyon_summit_match{win_side = 0}) ->
    do_stop_guarding(Ids),
    {noreply, M};
handle_info({stop_guarding, _}, State) ->
    {noreply, State};
handle_info({cal_score,
             Id = {_, P, Z},
             CostMovability,
             AddScore},
            M = #canyon_summit_match{win_side = 0,
                                     map_id = Mapid}) ->
    case ets:lookup(canyon_summit_role, Id) of
        [R = #canyon_summit_role{group_id = GroupId,
                                 match_id = MatchId, side = Side,
                                 movability = Rm, score = OldScore}] ->
            case ets:lookup(canyon_summit_side,
                            {GroupId, MatchId, Side})
                of
                [A = #canyon_summit_side{movability = Gm}] ->
                    NewRm = max(1, Rm - CostMovability),
                    R1 = R#canyon_summit_role{movability = NewRm,
                                              score = OldScore + AddScore},
                    canyon_summit_mgr:update(canyon_summit_role, R1),
                    cross:cast(P,
                               Z,
                               canyon_summit_agent,
                               sync_update,
                               [canyon_summit_role, R1]),
                    NewA = A#canyon_summit_side{movability =
                                                    max(NewRm,
                                                        Gm -
                                                            max(0,
                                                                Rm - NewRm))},
                    canyon_summit_mgr:update(canyon_summit_side, NewA),
                    push_21106(NewA, Mapid);
                _ ->
                    logger:error("没找到阵营 ~w, ~w",
                                 [GroupId, {MatchId, Side}],
                                 canyon_summit_match,
                                 561)
            end;
        _ ->
            logger:error("没找到参战者 ~w",
                         [Id],
                         canyon_summit_match,
                         564)
    end,
    {noreply, M};
handle_info({cost_movability, _, _}, State) ->
    {noreply, State};
handle_info(cannon_cd_notice,
            State = #canyon_summit_match{win_side = 0,
                                         map_id = MapId, map_pid = MapPid}) ->
    case erlang:get(cannon_cd_notice_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    AnnStr =
        notice:format(lang:get("~ts准备就绪，威力无穷的炮火可对敌方水晶塔造成~ts{face_1,23}"),
                      [{unit_1, canyon_summit_unit:get_base_id(7)},
                       {string_2, 5, lang:get("大量伤害")}]),
    AnnStr1 = notice:format(lang:get("~ts{sound_1, 568}"),
                            [{string_1, AnnStr}]),
    notice:cast({map, MapId}, 22, AnnStr1),
    notice:cast({map, MapId}, 61, AnnStr),
    notice:cast({map, MapId}, 11, AnnStr),
    map_async(MapPid,
              {canyon_summit_role,
               role_callback,
               [{push, {21122, {0}}}]}),
    {noreply, State};
handle_info(cannon_cd_notice, State) ->
    {noreply, State};
handle_info({push, Pid, Cmd = 21122},
            State = #canyon_summit_match{cannon_ready = false,
                                         time = Time}) ->
    Now = date:unixtime(),
    Cd = max(0, 480 - (Now - Time)),
    logger:debug("21122：~w",
                 [Cd],
                 canyon_summit_match,
                 591),
    role:apply(async,
               Pid,
               {canyon_summit_role,
                role_callback,
                [{push, {Cmd, {Cd}}}]}),
    {noreply, State};
handle_info({push, Pid, Cmd = 21122},
            State = #canyon_summit_match{id =
                                             {GroupId, MatchId}}) ->
    Now = date:unixtime(),
    Cd = case ets:lookup(canyon_summit_unit,
                         {GroupId, MatchId, 7})
             of
             [#canyon_summit_unit{last_operated = Last}] ->
                 max(0, 5 - (Now - Last));
             _ -> 0
         end,
    role:apply(async,
               Pid,
               {canyon_summit_role,
                role_callback,
                [{push, {Cmd, {Cd}}}]}),
    {noreply, State};
handle_info({push, 21106},
            State = #canyon_summit_match{id = {GroupId, MatchId},
                                         map_id = MapId}) ->
    case ets:lookup(canyon_summit_side,
                    {GroupId, MatchId, 1})
        of
        [A = #canyon_summit_side{}] -> push_21106(A, MapId);
        _ -> ok
    end,
    {noreply, State};
handle_info(stop, State) -> {stop, normal, State};
handle_info(leave,
            State = #canyon_summit_match{map_pid = MapPid}) ->
    logger:debug("=================",
                 [],
                 canyon_summit_match,
                 616),
    map_async(MapPid,
              {canyon_summit_role, role_callback, [apply_leave]}),
    {stop, normal, State};
handle_info(_Info, State) ->
    logger:debug("未知消息 ~w",
                 [_Info],
                 canyon_summit_match,
                 621),
    {noreply, State}.

terminate(_Reason,
          #canyon_summit_match{id = Id, battle_pid = Pid}) ->
    battle:stop(Pid),
    canyon_summit_unit:clear(Id),
    ets:delete(canyon_summit_match, Id),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

rematch_args(attack, CombatArgs, RematchFlag) ->
    case RematchFlag of
        1 -> CombatArgs#{combat_type => rematch_attack};
        _ -> CombatArgs
    end;
rematch_args(guard, CombatArgs, RematchFlag) ->
    case RematchFlag of
        1 -> CombatArgs#{combat_type => rematch_guard};
        _ -> CombatArgs
    end;
rematch_args(_, CombatArgs, _RematchFlag) -> CombatArgs.

map_async({match, Id}, MFA) ->
    case ets:lookup(canyon_summit_match, Id) of
        [#canyon_summit_match{map_pid = Pid}] ->
            map_async(Pid, MFA);
        _ -> ok
    end;
map_async(#canyon_summit_match{pid = Pid}, MFA) ->
    map_async(Pid, MFA);
map_async(Pid, MFA) when is_pid(Pid) ->
    map:async_apply(Pid, MFA);
map_async(_, _) -> ok.

leave_judge(H = #canyon_summit_match{is_judge = true,
                                     id = {GroupId, MatchId}, win_side = 0},
            A1 = #canyon_summit_side{id = {GroupId, MatchId, Side},
                                     remain_num = M0, remain_unit = U1})
    when M0 < 1 ->
    case ets:lookup(canyon_summit_side,
                    {GroupId,
                     MatchId,
                     canyon_summit_util:get_opposite_side(Side)})
        of
        [A2 = #canyon_summit_side{remain_num = M}] when M > 0 ->
            save_result(canyon_summit_util:get_opposite_side(Side),
                        H,
                        A2,
                        A1#canyon_summit_side{remain_unit = 0});
        [A2 = #canyon_summit_side{remain_unit = U2}]
            when U2 > U1 ->
            save_result(canyon_summit_util:get_opposite_side(Side),
                        H,
                        A2,
                        A1#canyon_summit_side{remain_unit = 0});
        [A2 = #canyon_summit_side{remain_num = 0}] ->
            case util:rand(1, 2) of
                1 ->
                    save_result(Side,
                                H,
                                A1,
                                A2#canyon_summit_side{remain_unit = 0});
                _ ->
                    save_result(canyon_summit_util:get_opposite_side(Side),
                                H,
                                A2,
                                A1#canyon_summit_side{remain_unit = 0})
            end;
        _ ->
            logger:error("找不到阵营 ~w",
                         [{GroupId,
                           MatchId,
                           canyon_summit_util:get_opposite_side(Side)}],
                         canyon_summit_match,
                         681),
            H
    end;
leave_judge(H = #canyon_summit_match{is_judge = true,
                                     id = {GroupId, MatchId}, win_side = 0},
            A1 = #canyon_summit_side{id = {GroupId, MatchId, Side},
                                     remain_num = M1, movability = M1,
                                     remain_unit = U1}) ->
    case ets:lookup(canyon_summit_side,
                    {MatchId, canyon_summit_util:get_opposite_side(Side)})
        of
        [A2 = #canyon_summit_side{remain_num = M2,
                                  movability = M2, remain_unit = U2}]
            when U2 > U1 ->
            save_result(canyon_summit_util:get_opposite_side(Side),
                        H,
                        A2,
                        A1);
        [A2 = #canyon_summit_side{remain_num = M2,
                                  movability = M2, remain_unit = U2}]
            when U2 < U1 ->
            save_result(Side, H, A1, A2);
        [A2 = #canyon_summit_side{remain_num = M2,
                                  movability = M2}]
            when M2 > M1 ->
            save_result(canyon_summit_util:get_opposite_side(Side),
                        H,
                        A2,
                        A1);
        [A2 = #canyon_summit_side{remain_num = M2,
                                  movability = M2}]
            when M2 < M1 ->
            save_result(Side, H, A1, A2);
        [A2 = #canyon_summit_side{remain_num = M1,
                                  movability = M1}] ->
            case util:rand(1, 2) of
                1 -> save_result(1, H, A1, A2);
                _ -> save_result(2, H, A2, A1)
            end;
        _ ->
            logger:error("找不到阵营 ~w",
                         [{MatchId,
                           canyon_summit_guild:get_opposite_side(Side)}],
                         canyon_summit_match,
                         703),
            H
    end;
leave_judge(M, A) ->
    canyon_summit_mgr:update(canyon_summit_side, A),
    M.

save_result(3,
            H = #canyon_summit_match{id = {_GroupId, _MatchId},
                                     map_id = MapId},
            A1 = #canyon_summit_side{members = Mems1},
            A2 = #canyon_summit_side{members = Mems2}) ->
    case erlang:get(canyon_summit_combat) of
        CombatList when is_list(CombatList) ->
            logger:debug("=========================~w",
                         [CombatList],
                         canyon_summit_match,
                         715),
            [CombatPid ! stop
             || CombatPid <- CombatList, is_pid(CombatPid)],
            erlang:put(canyon_summit_combat, []);
        _Err ->
            logger:error("~w", [_Err], canyon_summit_match, 719),
            ok
    end,
    AL = [A1#canyon_summit_side{is_win = 3, score = 1},
          A2#canyon_summit_side{is_win = 3, score = 1}],
    canyon_summit_mgr:update(canyon_summit_side, AL),
    map:pack_send_to_all(MapId, 21106, {AL}),
    exhaust_notice(H, A1, A2),
    notice:cast({map, MapId},
                11,
                lang:get("联盟与部落势均力敌，在峡谷之巅中打成平局！{face_1, 19}")),
    result_reward(Mems1, lost),
    result_reward(Mems2, lost),
    H#canyon_summit_match{win_side = 3};
save_result(WinSide,
            H = #canyon_summit_match{id = {_GroupId, _MatchId},
                                     map_id = MapId},
            A1 = #canyon_summit_side{id = {_, _, Side1},
                                     remain_num = Remain, members = Mems1},
            A2 = #canyon_summit_side{id = {_, _, Side2},
                                     members = Mems2}) ->
    case erlang:get(canyon_summit_combat) of
        CombatList when is_list(CombatList) ->
            logger:debug("=========================~w",
                         [CombatList],
                         canyon_summit_match,
                         734),
            [CombatPid ! stop
             || CombatPid <- CombatList, is_pid(CombatPid)],
            erlang:put(canyon_summit_combat, []);
        _Err ->
            logger:error("~w", [_Err], canyon_summit_match, 738),
            ok
    end,
    AL = [A1#canyon_summit_side{is_win = 1, score = 2},
          A2#canyon_summit_side{is_win = 2, score = 0}],
    canyon_summit_mgr:update(canyon_summit_side, AL),
    map:pack_send_to_all(MapId, 21106, {AL}),
    exhaust_notice(H, A1, A2),
    result_reward(Mems1, win),
    result_reward(Mems2, lost),
    Msg =
        notice:format(lang:get("~ts成员众志成城，力克强敌~ts取得峡谷之巅胜利！{face_1, 18}"),
                      [{string_2, 2, canyon_summit_util:get_name(Side1)},
                       {string_2, 2, canyon_summit_util:get_name(Side2)}]),
    notice:cast({map, MapId}, 11, Msg),
    erlang:send_after(120000,
                      self(),
                      {create_box, MapId, Remain + 2, WinSide}),
    H#canyon_summit_match{win_side = WinSide}.

exhaust_notice(#canyon_summit_match{map_id = MapId,
                                    map_pid = _MapPid},
               #canyon_summit_side{movability = M1, remain_num = M1},
               #canyon_summit_side{movability = M2,
                                   remain_num = M2}) ->
    Msg = lang:get("双方筋疲力，尽无人能发起战斗，峡谷之巅结束"),
    notice:cast({map, MapId}, 3, Msg);
exhaust_notice(_, _, _) -> ok.

result_reward([], _) -> ok;
result_reward([Id | T], Type) ->
    logger:debug("~w", [Id], canyon_summit_match, 763),
    case ets:lookup(canyon_summit_role, Id) of
        [#canyon_summit_role{pid = Pid}] when is_pid(Pid) ->
            case Type of
                win ->
                    role_trigger:async_fire(Pid, #evt_canyon_summit_win{}),
                    ok;
                _ -> ok
            end,
            logger:debug("----------------------",
                         [],
                         canyon_summit_match,
                         772),
            role:apply(async,
                       Pid,
                       {canyon_summit_role, role_callback, [{reward, Type}]});
        _ -> ok
    end,
    result_reward(T, Type).

create_box(_, Num) when Num < 1 -> ok;
create_box(Where = {BattleId, MapId}, Num) ->
    {X, Y} = map:rand_pos(52001),
    unit_mgr:create(BattleId, 79586, {MapId, X, Y}),
    create_box(Where, Num - 1).

check_fight_target(TargetId, Args = #{now := Now}) ->
    case ets:lookup(canyon_summit_role, TargetId) of
        [#canyon_summit_role{last_killed = Last}]
            when Now - Last < 90 ->
            {false,
             notice:format(lang:get("对方才刚刚战败了，请稍候~ts秒"),
                           [{string_2, 5, 90 - (Now - Last)}])};
        [#canyon_summit_role{last_win = Last}]
            when Now - Last < 10 ->
            {false,
             notice:format(lang:get("对方才刚刚战斗完，请稍候~ts秒"),
                           [{string_2, 5, 10 - (Now - Last)}])};
        [#canyon_summit_role{movability = M, side = DfdSide}]
            when M >= 0 ->
            {ok, get_combat_args(Args#{dfd_side => DfdSide})};
        _ -> {false, lang:get("对方行动力不足了")}
    end.

calc_fighter(_Type, M, []) -> M;
calc_fighter(Type, M, L = [#{id := Id} | _]) ->
    case ets:lookup(canyon_summit_role, Id) of
        [#canyon_summit_role{group_id = GroupId,
                             match_id = MatchId, side = Side}] ->
            case ets:lookup(canyon_summit_side,
                            {GroupId, MatchId, Side})
                of
                [A = #canyon_summit_side{}] ->
                    calc_fighter(Type, M, L, A);
                _ ->
                    logger:error("找不到阵营信息[~w]",
                                 [{GroupId, MatchId, Side}],
                                 canyon_summit_match,
                                 817),
                    M
            end;
        _ ->
            logger:error("找不到角色参战信息[~w]",
                         [Id],
                         canyon_summit_match,
                         821),
            M
    end.

calc_fighter(Type,
             M = #canyon_summit_match{is_judge = true, win_side = 0},
             [],
             A0 = #canyon_summit_side{id = {GroupId, MatchId, Side},
                                      remain_num = 0, win = Win,
                                      lost = Lost}) ->
    A = case Type of
            {win, _} ->
                A0#canyon_summit_side{win = Win + 1, remain_num = 0,
                                      remain_unit = 0};
            _ ->
                A0#canyon_summit_side{lost = Lost + 1, remain_num = 0,
                                      remain_unit = 0}
        end,
    NewM = case ets:lookup(canyon_summit_side,
                           {GroupId,
                            MatchId,
                            canyon_summit_util:get_opposite_side(Side)})
               of
               [A2 = #canyon_summit_side{}] ->
                   save_result(canyon_summit_util:get_opposite_side(Side),
                               M,
                               A2,
                               A);
               _ ->
                   logger:error("找不到阵营 ~w",
                                [{GroupId,
                                  MatchId,
                                  canyon_summit_util:get_opposite_side(Side)}],
                                canyon_summit_match,
                                834),
                   M
           end,
    NewM;
calc_fighter({win, _},
             H = #canyon_summit_match{is_judge = true, win_side = 0,
                                      map_id = MapId},
             [],
             A0 = #canyon_summit_side{id = {GroupId, MatchId, Side},
                                      remain_num = M1, movability = M1,
                                      win = Win, remain_unit = U1}) ->
    A = A0#canyon_summit_side{win = Win + 1,
                              remain_num = 0},
    {D2, U2} =
        canyon_summit_unit:calc_duration_and_remain(canyon_summit_util:get_opposite_side(Side),
                                                    GroupId,
                                                    MatchId),
    NewH = case ets:lookup(canyon_summit_side,
                           {GroupId,
                            MatchId,
                            canyon_summit_util:get_opposite_side(Side)})
               of
               [A2 = #canyon_summit_side{id = {_, _, OpSide},
                                         remain_num = M2, movability = M2,
                                         remain_unit = U2}]
                   when U2 > U1 ->
                   save_result(OpSide,
                               H,
                               A2#canyon_summit_side{duration = D2,
                                                     remain_unit = U2},
                               A);
               [A2 = #canyon_summit_side{remain_num = M2,
                                         movability = M2, remain_unit = U2}]
                   when U2 < U1 ->
                   save_result(Side,
                               H,
                               A,
                               A2#canyon_summit_side{duration = D2,
                                                     remain_unit = U2});
               [A2 = #canyon_summit_side{id = {_, _, OpSide},
                                         remain_num = M2, movability = M2}]
                   when M2 > M1 ->
                   save_result(OpSide,
                               H,
                               A2#canyon_summit_side{duration = D2,
                                                     remain_unit = U2},
                               A);
               [A2 = #canyon_summit_side{remain_num = M2,
                                         movability = M2}]
                   when M2 < M1 ->
                   save_result(Side,
                               H,
                               A,
                               A2#canyon_summit_side{duration = D2,
                                                     remain_unit = U2});
               [A2 = #canyon_summit_side{id = {_, _, OpSide},
                                         remain_num = M1, movability = M1}] ->
                   case util:rand(1, 2) of
                       1 -> save_result(Side, H, A, A2);
                       _ -> save_result(OpSide, H, A2, A)
                   end;
               [_] ->
                   canyon_summit_mgr:update(canyon_summit_side, A),
                   push_21106(A, MapId),
                   H;
               _ ->
                   logger:error("找不到阵营 ~w",
                                [{GroupId,
                                  MatchId,
                                  canyon_summit_util:get_opposite_side(Side)}],
                                canyon_summit_match,
                                868),
                   canyon_summit_mgr:update(canyon_summit_side, A),
                   push_21106(A, MapId),
                   H
           end,
    NewH;
calc_fighter({lost, _},
             H = #canyon_summit_match{is_judge = true, win_side = 0,
                                      map_id = MapId},
             [],
             A0 = #canyon_summit_side{id = {GroupId, MatchId, Side},
                                      remain_num = M1, movability = M1,
                                      lost = Lost}) ->
    A = A0#canyon_summit_side{lost = Lost + 1,
                              remain_unit = 0},
    NewH = case ets:lookup(canyon_summit_side,
                           {GroupId,
                            MatchId,
                            canyon_summit_util:get_opposite_side(Side)})
               of
               [A2 = #canyon_summit_side{id = {_, _, OpSide},
                                         remain_num = M2, movability = M2}]
                   when M2 > M1 ->
                   save_result(OpSide, H, A2, A);
               [A2 = #canyon_summit_side{remain_num = M2,
                                         movability = M2}]
                   when M2 < M1 ->
                   save_result(Side, H, A, A2);
               [A2 = #canyon_summit_side{id = {_, _, OpSide},
                                         remain_num = M1, movability = M1}] ->
                   case util:rand(1, 2) of
                       1 -> save_result(Side, H, A, A2);
                       _ -> save_result(OpSide, H, A2, A)
                   end;
               [_] ->
                   canyon_summit_mgr:update(canyon_summit_side, A),
                   push_21106(A, MapId),
                   H;
               _ ->
                   logger:error("找不到阵营 ~w",
                                [{MatchId,
                                  canyon_summit_util:get_opposite_side(Side)}],
                                canyon_summit_match,
                                898),
                   canyon_summit_mgr:update(canyon_summit_side, A),
                   push_21106(A, MapId),
                   H
           end,
    NewH;
calc_fighter({lost, _},
             M = #canyon_summit_match{map_id = MapId}, [],
             A = #canyon_summit_side{lost = Lost}) ->
    NewA = A#canyon_summit_side{lost = Lost + 1},
    canyon_summit_mgr:update(canyon_summit_side, NewA),
    push_21106(NewA, MapId),
    M;
calc_fighter(_,
             M = #canyon_summit_match{map_id = MapId}, [],
             A = #canyon_summit_side{win = Win}) ->
    NewA = A#canyon_summit_side{win = Win + 1},
    canyon_summit_mgr:update(canyon_summit_side, NewA),
    push_21106(NewA, MapId),
    M;
calc_fighter({win, AddScore},
             Match = #canyon_summit_match{map_pid = _MapPid},
             [#{id := Id = {_, P, Z}} | T],
             A = #canyon_summit_side{remain_num = Remain,
                                     attacked_unit = Attacked,
                                     movability = Gm}) ->
    case ets:lookup(canyon_summit_role, Id) of
        [R = #canyon_summit_role{pid = Pid, win = RWin,
                                 movability = 0, score = Score,
                                 attacked_unit = RAU}] ->
            R1 = R#canyon_summit_role{win = RWin + 1,
                                      score = Score + AddScore,
                                      last_win = date:unixtime()},
            NewR = #canyon_summit_role{cannon_attacked = RAU1} =
                       case canyon_summit_unit:combat_over(R1) of
                           {ok, R2} -> R2#canyon_summit_role{pid = 0};
                           {ok,
                            R2,
                            NewU = #canyon_summit_unit{id = {_, _, TUid},
                                                       duration = Duration},
                            UDmg} ->
                               ExtScore = case Duration of
                                              0 -> 10;
                                              _ -> 0
                                          end,
                               canyon_summit_unit:reward_destroy(NewU),
                               BaseId2 = canyon_summit_unit:get_base_id(TUid),
                               notice_done_attack_unit(R, NewU, UDmg),
                               role:apply(async,
                                          Pid,
                                          {canyon_summit_role,
                                           role_callback,
                                           [{team_unit_reward,
                                             #{operating_unit => TUid,
                                               base_id => BaseId2,
                                               duration => Duration,
                                               unit_dmg => UDmg,
                                               direct_unit => false}}]}),
                               R2#canyon_summit_role{pid = 0,
                                                     score =
                                                         Score + AddScore +
                                                             ExtScore};
                           _ -> R1#canyon_summit_role{pid = 0}
                       end,
            canyon_summit_mgr:update(canyon_summit_role, NewR),
            cross:cast(P,
                       Z,
                       canyon_summit_agent,
                       sync_update,
                       [canyon_summit_role, NewR]),
            role:apply(async,
                       Pid,
                       {canyon_summit_role,
                        role_callback,
                        [leave_by_movability]}),
            notice:send({pid, Pid},
                        3,
                        notice:format(lang:get("战斗胜利，又向胜利迈进一步！获得个人积分~ts"),
                                      [{string_2, 5, AddScore}])),
            NewAttacked = case RAU1 > RAU of
                              true -> Attacked + 1;
                              _ -> Attacked
                          end,
            calc_fighter({win, AddScore},
                         Match,
                         T,
                         A#canyon_summit_side{remain_num = max(0, Remain - 1),
                                              attacked_unit = NewAttacked});
        [R = #canyon_summit_role{pid = Pid, win = RWin,
                                 score = Score, attacked_unit = RAU,
                                 movability = Rm}] ->
            R1 = R#canyon_summit_role{win = RWin + 1,
                                      score = Score + AddScore,
                                      last_win = date:unixtime()},
            NewR = #canyon_summit_role{movability = NewRm} =
                       #canyon_summit_role{cannon_attacked = RAU1} = case
                                                                         canyon_summit_unit:combat_over(R1)
                                                                         of
                                                                         {ok,
                                                                          R2} ->
                                                                             R2;
                                                                         {ok,
                                                                          R2,
                                                                          NewU =
                                                                              #canyon_summit_unit{id
                                                                                                      =
                                                                                                      {_,
                                                                                                       _,
                                                                                                       TUid},
                                                                                                  duration
                                                                                                      =
                                                                                                      Duration},
                                                                          UDmg} ->
                                                                             ExtScore =
                                                                                 case
                                                                                     Duration
                                                                                     of
                                                                                     0 ->
                                                                                         10;
                                                                                     _ ->
                                                                                         0
                                                                                 end,
                                                                             canyon_summit_unit:reward_destroy(NewU),
                                                                             BaseId2 =
                                                                                 canyon_summit_unit:get_base_id(TUid),
                                                                             notice_done_attack_unit(R,
                                                                                                     NewU,
                                                                                                     UDmg),
                                                                             role:apply(async,
                                                                                        Pid,
                                                                                        {canyon_summit_role,
                                                                                         role_callback,
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
                                                                                                 UDmg,
                                                                                             direct_unit
                                                                                                 =>
                                                                                                 false}}]}),
                                                                             R2#canyon_summit_role{score
                                                                                                       =
                                                                                                       Score
                                                                                                           +
                                                                                                           AddScore
                                                                                                           +
                                                                                                           ExtScore};
                                                                         _ -> R1
                                                                     end,
            NewAttacked = case RAU1 > RAU of
                              true -> Attacked + 1;
                              _ -> Attacked
                          end,
            canyon_summit_mgr:update(canyon_summit_role, NewR),
            cross:cast(P,
                       Z,
                       canyon_summit_agent,
                       sync_update,
                       [canyon_summit_role, NewR]),
            notice:send({pid, Pid},
                        3,
                        notice:format(lang:get("战斗胜利，又向胜利迈进一步！获得个人积分~ts"),
                                      [{string_2, 5, AddScore}])),
            calc_fighter({win, AddScore},
                         Match,
                         T,
                         A#canyon_summit_side{attacked_unit = NewAttacked,
                                              movability =
                                                  max(1, Gm - (Rm - NewRm))});
        _ -> calc_fighter({win, AddScore}, Match, T, A)
    end;
calc_fighter({lost, AddScore}, Match,
             [F = #{id := Id = {_, P, Z}} | T],
             A = #canyon_summit_side{movability = Gm,
                                     remain_num = Remain}) ->
    case ets:lookup(canyon_summit_role, Id) of
        [R = #canyon_summit_role{movability = Rm, pid = Pid,
                                 lost = RLost, score = Score}] ->
            CostMovability = case F of
                                 #{guarding_unit := true} -> 260;
                                 _ -> 300
                             end,
            NewRm = max(0, Rm - CostMovability),
            NewRemain = case NewRm of
                            0 -> max(0, Remain - 1);
                            _ -> Remain
                        end,
            NewPid = case NewRm of
                         0 -> 0;
                         _ -> Pid
                     end,
            NewR = R#canyon_summit_role{movability = NewRm,
                                        lost = RLost + 1,
                                        score = Score + AddScore,
                                        last_killed = date:unixtime(),
                                        operating_unit = 0, pid = NewPid},
            canyon_summit_mgr:update(canyon_summit_role, NewR),
            cross:cast(P,
                       Z,
                       canyon_summit_agent,
                       sync_update,
                       [canyon_summit_role, NewR]),
            notice:send({pid, Pid},
                        3,
                        notice:format(lang:get("战斗失败，获得个人积分~ts"),
                                      [{string_2, 5, AddScore}])),
            role:apply(async,
                       Pid,
                       {canyon_summit_role,
                        role_callback,
                        [{lost, NewRm, CostMovability}]}),
            calc_fighter({lost, AddScore},
                         Match,
                         T,
                         A#canyon_summit_side{movability =
                                                  max(NewRm,
                                                      Gm - max(0, Rm - NewRm)),
                                              remain_num = NewRemain});
        _ -> calc_fighter({lost, AddScore}, Match, T, A)
    end.

atk_movability_lost([], _) -> ok;
atk_movability_lost(L = [Id | T],
                    Arg = {_LostMove, _Mapid}) ->
    case ets:lookup(canyon_summit_role, Id) of
        [#canyon_summit_role{match_id = MatchId, side = Side,
                             group_id = GroupId}] ->
            case ets:lookup(canyon_summit_side,
                            {GroupId, MatchId, Side})
                of
                [A = #canyon_summit_side{}] ->
                    atk_movability_lost(L, A, Arg);
                _ ->
                    logger:error("没找到阵营 ~w",
                                 [{GroupId, MatchId, Side}],
                                 canyon_summit_match,
                                 1011),
                    atk_movability_lost(T, Arg)
            end;
        _ ->
            logger:error("没找到参战者 ~w",
                         [Id],
                         canyon_summit_match,
                         1015),
            atk_movability_lost(T, Arg)
    end.

atk_movability_lost([], A = #canyon_summit_side{},
                    {_LostMove, Mapid}) ->
    canyon_summit_mgr:update(canyon_summit_side, A),
    push_21106(A, Mapid),
    ok;
atk_movability_lost([Id = {_, P, Z} | T],
                    A = #canyon_summit_side{movability = Gm},
                    Arg = {LostMove, _Mapid}) ->
    case ets:lookup(canyon_summit_role, Id) of
        [R = #canyon_summit_role{movability = Rm}] ->
            NewRm = max(1, Rm - LostMove),
            R1 =
                canyon_summit_unit:disturb(R#canyon_summit_role{movability
                                                                    = NewRm}),
            canyon_summit_mgr:update(canyon_summit_role, R1),
            cross:cast(P,
                       Z,
                       canyon_summit_agent,
                       sync_update,
                       [canyon_summit_role, R1]),
            NewA = A#canyon_summit_side{movability =
                                            max(NewRm,
                                                Gm - max(0, Rm - NewRm))},
            atk_movability_lost(T, NewA, Arg);
        _ ->
            logger:error("找不到参战者 ~w",
                         [Id],
                         canyon_summit_match,
                         1034),
            atk_movability_lost(T, A, Arg)
    end.

do_judge(H = #canyon_summit_match{win_side = 0,
                                  id = {GroupId, MatchId}}) ->
    case {ets:lookup(canyon_summit_side,
                     {GroupId, MatchId, 1}),
          ets:lookup(canyon_summit_side, {GroupId, MatchId, 2})}
        of
        {[A1 = #canyon_summit_side{remain_num = M}],
         [A2 = #canyon_summit_side{remain_num = M2}]}
            when M2 < 1 andalso M > 0 ->
            save_result(1,
                        H,
                        A1,
                        A2#canyon_summit_side{remain_unit = 0});
        {[A1 = #canyon_summit_side{remain_num = M1}],
         [A2 = #canyon_summit_side{remain_num = M}]}
            when M1 < 1 andalso M > 0 ->
            save_result(2,
                        H,
                        A2,
                        A1#canyon_summit_side{remain_unit = 0});
        {[A1 = #canyon_summit_side{remain_num = 0}],
         [A2 = #canyon_summit_side{remain_num = 0}]} ->
            case util:rand(1, 2) of
                1 -> save_result(1, H, A1, A2);
                _ -> save_result(2, H, A2, A1)
            end;
        {[A1 = #canyon_summit_side{remain_num = M1,
                                   movability = M1, remain_unit = U1}],
         [A2 = #canyon_summit_side{remain_num = M2,
                                   movability = M2, remain_unit = U2}]}
            when U1 > U2 ->
            save_result(1, H, A1, A2);
        {[A1 = #canyon_summit_side{remain_num = M1,
                                   movability = M1, remain_unit = U1}],
         [A2 = #canyon_summit_side{remain_num = M2,
                                   movability = M2, remain_unit = U2}]}
            when U2 > U1 ->
            save_result(2, H, A2, A1);
        {[A1 = #canyon_summit_side{remain_num = M1,
                                   movability = M1}],
         [A2 = #canyon_summit_side{remain_num = M2,
                                   movability = M2}]}
            when M1 > M2 ->
            save_result(1, H, A1, A2);
        {[A1 = #canyon_summit_side{remain_num = M1,
                                   movability = M1}],
         [A2 = #canyon_summit_side{remain_num = M2,
                                   movability = M2}]}
            when M2 > M1 ->
            save_result(2, H, A2, A1);
        {[A1 = #canyon_summit_side{remain_num = M,
                                   movability = M}],
         [A2 = #canyon_summit_side{remain_num = M,
                                   movability = M}]} ->
            case util:rand(1, 2) of
                1 -> save_result(1, H, A1, A2);
                _ -> save_result(2, H, A2, A1)
            end;
        _Else -> H
    end;
do_judge(M) -> M.

do_calc_result(H = #canyon_summit_match{win_side = 0,
                                        id = {GroupId, MatchId}}) ->
    case {ets:lookup(canyon_summit_side,
                     {GroupId, MatchId, 1}),
          ets:lookup(canyon_summit_side, {GroupId, MatchId, 2})}
        of
        {[A1 = #canyon_summit_side{remain_unit = U1}],
         [A2 = #canyon_summit_side{remain_unit = U2}]}
            when U1 > U2 ->
            save_result(1, H, A1, A2);
        {[A1 = #canyon_summit_side{remain_unit = U1}],
         [A2 = #canyon_summit_side{remain_unit = U2}]}
            when U2 > U1 ->
            save_result(2, H, A2, A1);
        {[A1 = #canyon_summit_side{duration = D1}],
         [A2 = #canyon_summit_side{duration = D2}]}
            when D1 > D2 ->
            save_result(1, H, A1, A2);
        {[A1 = #canyon_summit_side{duration = D1}],
         [A2 = #canyon_summit_side{duration = D2}]}
            when D2 > D1 ->
            save_result(2, H, A2, A1);
        {[A1 = #canyon_summit_side{remain_num = Rm1}],
         [A2 = #canyon_summit_side{remain_num = Rm2}]}
            when Rm1 > Rm2 ->
            save_result(1, H, A1, A2);
        {[A1 = #canyon_summit_side{remain_num = Rm1}],
         [A2 = #canyon_summit_side{remain_num = Rm2}]}
            when Rm2 > Rm1 ->
            save_result(2, H, A2, A1);
        {[A1 = #canyon_summit_side{movability = M1}],
         [A2 = #canyon_summit_side{movability = M2}]}
            when M1 > M2 ->
            save_result(1, H, A1, A2);
        {[A1 = #canyon_summit_side{movability = M1}],
         [A2 = #canyon_summit_side{movability = M2}]}
            when M2 > M1 ->
            save_result(2, H, A2, A1);
        {[A1 = #canyon_summit_side{}],
         [A2 = #canyon_summit_side{}]} ->
            case util:rand(1, 2) of
                1 -> save_result(1, H, A1, A2);
                _ -> save_result(2, H, A2, A1)
            end;
        _Else ->
            logger:error("战场结算异常 ~w",
                         [_Else],
                         canyon_summit_match,
                         1102),
            H#canyon_summit_match{win_side = 3}
    end;
do_calc_result(M) -> M.

calc_unit(M = #canyon_summit_match{win_side = 0,
                                   id = {GroupId, MatchId}}) ->
    case {ets:lookup(canyon_summit_side,
                     {GroupId, MatchId, 1}),
          ets:lookup(canyon_summit_side, {GroupId, MatchId, 2})}
        of
        {[A1 = #canyon_summit_side{}],
         [A2 = #canyon_summit_side{}]} ->
            {D1, Num1} =
                canyon_summit_unit:calc_duration_and_remain(1,
                                                            GroupId,
                                                            MatchId),
            {D2, Num2} =
                canyon_summit_unit:calc_duration_and_remain(2,
                                                            GroupId,
                                                            MatchId),
            calc_unit(M,
                      A1#canyon_summit_side{duration = D1,
                                            remain_unit = Num1},
                      A2#canyon_summit_side{duration = D2,
                                            remain_unit = Num2});
        _Else ->
            logger:error("战场结算异常 ~w",
                         [_Else],
                         canyon_summit_match,
                         1116),
            M
    end;
calc_unit(M) -> M.

calc_unit(M, A1 = #canyon_summit_side{duration = 0},
          A2 = #canyon_summit_side{id = {_, _, Side}}) ->
    save_result(Side, M, A2, A1);
calc_unit(M,
          A1 = #canyon_summit_side{id = {_, _, Side}},
          A2 = #canyon_summit_side{duration = 0}) ->
    save_result(Side, M, A1, A2);
calc_unit(M = #canyon_summit_match{}, A1, A2) ->
    canyon_summit_mgr:update(canyon_summit_side, [A1, A2]),
    M.

calc_guard_unit(Winner, Loser) ->
    case [DName
          || #{name := DName, is_leader := 1} <- Winner]
        of
        [DefName | _] ->
            case do_calc_guard_unit(loser, Loser, DefName) of
                {ok,
                 R = #canyon_summit_role{group_id = GroupId, side = Side,
                                         match_id = MatchId}} ->
                    do_calc_guard_unit(winner, Winner, R),
                    case ets:lookup(canyon_summit_side,
                                    {GroupId,
                                     MatchId,
                                     canyon_summit_util:get_opposite_side(Side)})
                        of
                        [A = #canyon_summit_side{guarded_unit = Guarded}] ->
                            A1 = A#canyon_summit_side{guarded_unit =
                                                          Guarded + 1},
                            canyon_summit_mgr:update(canyon_summit_side, A1);
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

do_calc_guard_unit(_, [], _) -> ok;
do_calc_guard_unit(loser, [#{id := Id, pid := Pid} | T],
                   DefName) ->
    case ets:lookup(canyon_summit_role, Id) of
        [R = #canyon_summit_role{operating_unit = Uid}]
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
                   R = #canyon_summit_role{name = Name,
                                           operating_unit = Uid = 7}) ->
    Msg = notice:format(lang:get("防守成功，你阻止了~ts使用~ts的进攻"),
                        [{role_2, Name},
                         {unit_1, canyon_summit_unit:get_base_id(Uid)}]),
    notice:send({pid, Pid}, 3, Msg),
    acc_guarded_unit(Id),
    do_calc_guard_unit(winner, T, R);
do_calc_guard_unit(winner,
                   [#{pid := Pid, id := Id} | T],
                   R = #canyon_summit_role{name = Name,
                                           operating_unit = Uid}) ->
    Msg = notice:format(lang:get("防守成功，你阻止了~ts的对~ts的进攻"),
                        [{role_2, Name},
                         {unit_1, canyon_summit_unit:get_base_id(Uid)}]),
    notice:send({pid, Pid}, 3, Msg),
    acc_guarded_unit(Id),
    do_calc_guard_unit(winner, T, R).

acc_guarded_unit(Rid = {_, P, Z}) ->
    case ets:lookup(canyon_summit_role, Rid) of
        [R = #canyon_summit_role{guarded_unit = Guarded}] ->
            R1 = R#canyon_summit_role{guarded_unit = Guarded + 1},
            canyon_summit_mgr:update(canyon_summit_role, R1),
            cross:cast(P,
                       Z,
                       canyon_summit_agent,
                       sync_update,
                       [canyon_summit_role, R1]);
        _ -> ok
    end.

acc_attacked_unit(#canyon_summit_role{group_id =
                                          GroupId,
                                      cannon_attacked = RAU1,
                                      match_id = MatchId, side = Side,
                                      movability = NewRm},
                  #canyon_summit_role{movability = Rm,
                                      cannon_attacked = RAU,
                                      operating_unit = Uid}) ->
    case ets:lookup(canyon_summit_side,
                    {GroupId, MatchId, Side})
        of
        [A = #canyon_summit_side{attacked_unit = Attacked,
                                 movability = Gm}] ->
            A1 = #canyon_summit_side{movability =
                                         max(1, Gm - (Rm - NewRm))},
            A2 = case Uid =:= 7 andalso RAU1 > RAU of
                     true ->
                         A#canyon_summit_side{attacked_unit = Attacked + 1};
                     _ -> A1
                 end,
            canyon_summit_mgr:update(canyon_summit_side, A2);
        _ -> ok
    end;
acc_attacked_unit(_, _) -> ok.

do_disturb_unit([]) -> ok;
do_disturb_unit([Id | T]) ->
    do_disturb_unit(Id),
    do_disturb_unit(T);
do_disturb_unit(Id = {_, P, Z}) ->
    case ets:lookup(canyon_summit_role, Id) of
        [R = #canyon_summit_role{}] ->
            R1 = canyon_summit_unit:disturb(R),
            canyon_summit_mgr:update(canyon_summit_role, R1),
            cross:cast(P,
                       Z,
                       canyon_summit_agent,
                       sync_update,
                       [canyon_summit_role, R1]);
        _ -> ok
    end.

do_stop_guarding([]) -> ok;
do_stop_guarding([Id | T]) ->
    do_stop_guarding(Id),
    do_stop_guarding(T);
do_stop_guarding(Id = {_, P, Z}) ->
    case ets:lookup(canyon_summit_role, Id) of
        [R = #canyon_summit_role{}] ->
            R1 = canyon_summit_unit:stop_guarding(R),
            canyon_summit_mgr:update(canyon_summit_role, R1),
            cross:cast(P,
                       Z,
                       canyon_summit_agent,
                       sync_update,
                       [canyon_summit_role, R1]);
        _ -> ok
    end.

notice_side(Aid, Type, Msg) ->
    case ets:lookup(canyon_summit_side, Aid) of
        [#canyon_summit_side{members = Ids}] ->
            do_notice_side(Ids, Type, Msg);
        _ -> ok
    end.

do_notice_side([], _, _) -> ok;
do_notice_side([Id | T], Type, Msg) ->
    case ets:lookup(canyon_summit_role, Id) of
        [#canyon_summit_role{pid = Pid}] when is_pid(Pid) ->
            role:apply(async,
                       Pid,
                       {canyon_summit_role,
                        role_callback,
                        [{notice, Type, Msg}]});
        _ -> ok
    end,
    do_notice_side(T, Type, Msg).

notice_done_attack_unit(#canyon_summit_role{name = Name,
                                            match_id = MatchId,
                                            group_id = GroupId, side = Side,
                                            operating_unit = Uid},
                        #canyon_summit_unit{id = {_, _, TUid},
                                            duration = NewDuration,
                                            side = USide},
                        Dmg) ->
    BaseId2 = canyon_summit_unit:get_base_id(TUid),
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
            notice_side({GroupId, MatchId, Side}, 61, Msg1),
            notice_side({GroupId, MatchId, USide}, 61, Msg2);
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
            notice_side({GroupId, MatchId, Side}, 61, Msg1),
            notice_side({GroupId, MatchId, USide}, 61, Msg2)
    end,
    case NewDuration of
        0 ->
            notice_side({GroupId, MatchId, USide},
                        11,
                        notice:format(lang:get("我方~ts遭到摧毁。{sound_1, 569}"),
                                      [{unit_1, BaseId2}])),
            notice_side({GroupId, MatchId, Side},
                        11,
                        notice:format(lang:get("敌方~ts遭到摧毁，向胜利进军！{sound_1, 570} "),
                                      [{unit_1, BaseId2}])),
            notice_side({GroupId, MatchId, USide},
                        61,
                        notice:format(lang:get("我方~ts遭到摧毁。"),
                                      [{unit_1, BaseId2}])),
            notice_side({GroupId, MatchId, Side},
                        61,
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
                    case ets:lookup(canyon_summit_role, Id) of
                        [#canyon_summit_role{side = Side, name = RName,
                                             match_id = _MatchId}] ->
                            GName = canyon_summit_util:get_name(Side),
                            AnnStr =
                                notice:format(lang:get("~ts的~ts率领队伍一马当先，取得了本场比赛~ts{face_1,7}"),
                                              [{string_2, 2, GName},
                                               {role_2, RName},
                                               {string_2,
                                                5,
                                                lang:get("第一滴血")}]),
                            notice:cast({map, MapId}, 61, AnnStr),
                            notice:cast({map, MapId}, 11, AnnStr);
                        _ -> ok
                    end;
                _ -> ok
            end,
            erlang:put(first_blood, true)
    end.

combat_cast(Winner, Loser) ->
    do_combat_cast(win, Winner, Loser),
    do_combat_cast(lost, Loser, Winner).

do_combat_cast(_Type, _Ours, []) -> ok;
do_combat_cast(Type, Ours = [#{id := OId} | _],
               Theirs) ->
    [LeadName | _] = [LName
                      || #{is_leader := 1, name := LName} <- Theirs],
    Roles = [{Id, Name}
             || #{id := Id, name := Name} <- Ours],
    case Type of
        win ->
            case ets:lookup(canyon_summit_role, OId) of
                [#canyon_summit_role{side = Side, group_id = GroupId,
                                     match_id = MatchId}] ->
                    Msg =
                        notice:format(lang:get("~ts战胜了~ts带领的~ts人队伍，我方气势大涨{face_1,18}"),
                                      [{role_1, Roles},
                                       {role_2, LeadName},
                                       {string_2, 5, length(Theirs)}]),
                    notice_side({GroupId, MatchId, Side}, 61, Msg);
                _ -> ok
            end;
        _ ->
            case ets:lookup(canyon_summit_role, OId) of
                [#canyon_summit_role{side = Side, group_id = GroupId,
                                     match_id = MatchId}] ->
                    Msg =
                        notice:format(lang:get("~ts惜败于~ts带领的~ts人队伍，再继续努力{face_1,21}"),
                                      [{role_1, Roles},
                                       {role_2, LeadName},
                                       {string_2, 5, length(Theirs)}]),
                    notice_side({GroupId, MatchId, Side}, 61, Msg);
                _ -> ok
            end
    end;
do_combat_cast(_, _, _) -> ok.

treat_guarding_loser(Winner, Loser, Type) ->
    Fun = fun (#{id := Id}) ->
                  case ets:lookup(canyon_summit_role, Id) of
                      [#canyon_summit_role{operating_unit = Uid}]
                          when Uid =/= 0 ->
                          true;
                      _ -> false
                  end;
              (_) -> false
          end,
    case Type of
        rematch_attack -> Loser;
        rematch_guard ->
            [Lf#{guarding_unit => true} || Lf <- Loser];
        _ ->
            case [F || F <- Winner, Fun(F)] of
                [_ | _] -> [Lf#{guarding_unit => true} || Lf <- Loser];
                _ -> Loser
            end
    end.

get_combat_args(#canyon_summit_match{id =
                                         {GroupId, MatchId}},
                Side) ->
    get_combat_args(#{match_id => MatchId,
                      group_id => GroupId, atk_side => Side}).

get_combat_args(Args = #{match_id := MatchId,
                         group_id := GroupId, atk_side := Side}) ->
    Buff = case ets:lookup(canyon_summit_side,
                           {GroupId, MatchId, Side})
               of
               [#canyon_summit_side{subsidize_buff = [H | T]}] ->
                   {0, [H | T]};
               _ ->
                   case ets:lookup(canyon_summit_side,
                                   {GroupId,
                                    MatchId,
                                    canyon_summit_util:get_opposite_side(Side)})
                       of
                       [#canyon_summit_side{subsidize_buff = [H | T]}] ->
                           {1, [H | T]};
                       _ -> false
                   end
           end,
    Args#{subsidize_buff => Buff}.

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

push_21106(A1 = #canyon_summit_side{id =
                                        {GroupId, MatchId, Side1}},
           MapId) ->
    Side2 = canyon_summit_util:get_opposite_side(Side1),
    A2 = case ets:lookup(canyon_summit_side,
                         {GroupId, MatchId, Side2})
             of
             A = [#canyon_summit_side{}] -> A;
             _ -> []
         end,
    Data = [A1 | A2],
    logger:debug("21106:~w",
                 [Data],
                 canyon_summit_match,
                 1385),
    map:pack_send_to_all(MapId, 21106, {Data}).

