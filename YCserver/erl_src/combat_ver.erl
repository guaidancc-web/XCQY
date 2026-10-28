-file("src/mod/combat/combat_ver.erl", 1).

-module(combat_ver).

-export([do/1, do_record/1]).

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

-file("src/mod/combat/combat_ver.erl", 15).

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

-file("src/mod/combat/combat_ver.erl", 16).

-compile(export_all).

do({m_combat, Ver, Pid, ObPid, IsDebug, Ext}) ->
    NewVer = Ver + 1,
    SelfPreside = [],
    TargetPreside = [],
    do({m_combat,
        NewVer,
        Pid,
        ObPid,
        IsDebug,
        Ext,
        SelfPreside,
        TargetPreside});
do({m_combat,
    Ver,
    Pid,
    ObPid,
    IsDebug,
    Ext,
    SelfPreside,
    TargetPreside}) ->
    do({m_combat,
        Ver + 1,
        Pid,
        ObPid,
        IsDebug,
        Ext,
        SelfPreside,
        TargetPreside,
        0});
do(Mc = #m_combat{ver = 3}) -> {ok, Mc};
do(_) -> {false, lang:get("角色战斗版本转换失败")}.

do_record({combat_record,
           Id,
           Type,
           Ver = 3,
           Atk_name,
           Dfd_name,
           Combat_type,
           Time,
           Frames,
           Cited,
           Likes,
           Liked}) ->
    Replayed = 0,
    Round = 0,
    Fighters = [],
    Avg_lev = 0,
    do_record({combat_record,
               Id,
               Type,
               Ver + 1,
               Atk_name,
               Dfd_name,
               Combat_type,
               Time,
               Frames,
               Cited,
               Likes,
               Liked,
               Replayed,
               Round,
               Fighters,
               Avg_lev});
do_record({combat_record,
           Id,
           Type,
           Ver = 5,
           Atk_name,
           Dfd_name,
           Combat_type,
           Time,
           Frames,
           Cited,
           Likes,
           Liked,
           Replayed,
           Round,
           Fighters,
           Avg_lev}) ->
    Shared = 0,
    do_record({combat_record,
               Id,
               Type,
               Ver + 1,
               Atk_name,
               Dfd_name,
               Combat_type,
               Time,
               Frames,
               Cited,
               Likes,
               Liked,
               Replayed,
               Round,
               Fighters,
               Avg_lev,
               Shared});
do_record({combat_record,
           Id,
           Type,
           Ver = 6,
           Atk_name,
           Dfd_name,
           Combat_type,
           Time,
           Frames,
           Cited,
           Likes,
           Liked,
           Replayed,
           Round,
           Fighters,
           Avg_lev,
           Shared}) ->
    AtkSex = 0,
    AtkClasses = 0,
    DfdSex = 0,
    DfdClasses = 0,
    do_record({combat_record,
               Id,
               Type,
               Ver + 1,
               Atk_name,
               Dfd_name,
               Combat_type,
               Time,
               Frames,
               Cited,
               Likes,
               Liked,
               Replayed,
               Round,
               Fighters,
               Avg_lev,
               Shared,
               AtkSex,
               AtkClasses,
               DfdSex,
               DfdClasses});
do_record({combat_record,
           Id,
           Type,
           Ver = 8,
           Atk_name,
           Dfd_name,
           Combat_type,
           Time,
           Frames,
           Cited,
           Likes,
           Liked,
           Replayed,
           Round,
           Fighters,
           Avg_lev,
           Shared,
           AtkSex,
           AtkClasses,
           DfdSex,
           DfdClasses}) ->
    ScreenMsg = [],
    do_record({combat_record,
               Id,
               Type,
               Ver + 1,
               Atk_name,
               Dfd_name,
               Combat_type,
               Time,
               Frames,
               Cited,
               Likes,
               Liked,
               Replayed,
               Round,
               Fighters,
               Avg_lev,
               Shared,
               AtkSex,
               AtkClasses,
               DfdSex,
               DfdClasses,
               ScreenMsg});
do_record({combat_record,
           Id,
           Type,
           Ver = 9,
           Atk_name,
           Dfd_name,
           Combat_type,
           Time,
           Frames,
           Cited,
           Likes,
           Liked,
           Replayed,
           Round,
           Fighters,
           Avg_lev,
           Shared,
           AtkSex,
           AtkClasses,
           DfdSex,
           DfdClasses,
           ScreenMsg}) ->
    L1 = case Frames of
             <<BinFrames/binary>> -> zlib:uncompress(BinFrames);
             _ -> Frames
         end,
    L2 = do_frame(L1, <<>>),
    NewFrames = zlib:compress(L2),
    do_record({combat_record,
               Id,
               Type,
               Ver + 1,
               Atk_name,
               Dfd_name,
               Combat_type,
               Time,
               NewFrames,
               Cited,
               Likes,
               Liked,
               Replayed,
               Round,
               Fighters,
               Avg_lev,
               Shared,
               AtkSex,
               AtkClasses,
               DfdSex,
               DfdClasses,
               ScreenMsg});
do_record(Data = #combat_record{ver = 10}) -> Data;
do_record(_) -> false.

do_frame([], Bin) -> Bin;
do_frame(<<>>, Bin) -> Bin;
do_frame([<<_Len:32/little, 10710:16/little, H/binary>>
          | Rest],
         Bin) ->
    NH = do_frame_10710(H),
    NLen = erlang:byte_size(NH) + 2,
    do_frame(Rest,
             <<Bin/binary, NLen:32/little, 10710:16/little,
               NH/binary>>);
do_frame([<<_Len:32/little, 10720:16/little, H/binary>>
          | Rest],
         Bin) ->
    NH = do_frame_10720(H),
    NLen = erlang:byte_size(NH) + 2,
    do_frame(Rest,
             <<Bin/binary, NLen:32/little, 10710:16/little,
               NH/binary>>);
do_frame(<<Len:32/little, 10710:16/little, T/binary>>,
         Bin) ->
    Len1 = Len - 2,
    <<H:Len1/binary, Rest/binary>> = T,
    NH = do_frame_10710(H),
    NLen = erlang:byte_size(NH) + 2,
    do_frame(Rest,
             <<Bin/binary, NLen:32/little, 10710:16/little,
               NH/binary>>);
do_frame(<<Len:32/little, 10720:16/little, T/binary>>,
         Bin) ->
    Len1 = Len - 2,
    <<H:Len1/binary, Rest/binary>> = T,
    NH = do_frame_10720(H),
    NLen = erlang:byte_size(NH) + 2,
    do_frame(Rest,
             <<Bin/binary, NLen:32/little, 10720:16/little,
               NH/binary>>);
do_frame(<<Len:32/little, H:Len/binary, Rest/binary>>,
         Bin) ->
    <<_Pn:16, _/binary>> = H,
    logger:debug("长度：~w, 协议号:~w",
                 [Len, _Pn],
                 combat_ver,
                 94),
    do_frame(Rest,
             <<Bin/binary, Len:32/little, H:Len/binary>>).

do_frame_10710(_B0) ->
    {V0_combat_type, _B1} = protocol:uint8(_B0),
    {V0_enter_type, _B2} = protocol:uint8(_B1),
    {V0_enter_view, _B3} = protocol:uint8(_B2),
    {V0_start_time, _B4} = protocol:uint32(_B3),
    {V0_atk_formation, _B5} = protocol:uint8(_B4),
    {V0_atk_formation_lev, _B6} = protocol:uint8(_B5),
    {V0_dfd_formation, _B7} = protocol:uint8(_B6),
    {V0_dfd_formation_lev, _B8} = protocol:uint8(_B7),
    {V0_round, _B9} = protocol:uint16(_B8),
    {V0_guide, _B10} = protocol:uint16(_B9),
    {V0_status, _B11} = protocol:uint8(_B10),
    {V0_wait_time, _B12} = protocol:uint8(_B11),
    {V0_time, _B13} = protocol:uint8(_B12),
    {V0_fighter_list, _B60} = protocol:array(_B13,
                                             fun (_B14) ->
                                                     {V2_id, _B15} =
                                                         protocol:uint16(_B14),
                                                     {V2_group, _B16} =
                                                         protocol:uint8(_B15),
                                                     {V2_type, _B17} =
                                                         protocol:uint8(_B16),
                                                     {V2_rid, _B18} =
                                                         protocol:uint32(_B17),
                                                     {V2_platform, _B19} =
                                                         protocol:string(_B18),
                                                     {V2_zone_id, _B20} =
                                                         protocol:uint16(_B19),
                                                     {V2_base_id, _B21} =
                                                         protocol:uint32(_B20),
                                                     {V2_master_fid, _B22} =
                                                         protocol:uint16(_B21),
                                                     {V2_name, _B23} =
                                                         protocol:string(_B22),
                                                     {V2_sex, _B24} =
                                                         protocol:uint8(_B23),
                                                     {V2_classes, _B25} =
                                                         protocol:uint8(_B24),
                                                     {V2_lev, _B26} =
                                                         protocol:uint16(_B25),
                                                     {V2_face_id, _B27} =
                                                         protocol:uint32(_B26),
                                                     {V2_is_die, _B28} =
                                                         protocol:uint8(_B27),
                                                     {V2_is_die_disappear,
                                                      _B29} =
                                                         protocol:uint8(_B28),
                                                     {V2_hp, _B30} =
                                                         protocol:int32(_B29),
                                                     {V2_mp, _B31} =
                                                         protocol:int32(_B30),
                                                     {V2_pos, _B32} =
                                                         protocol:uint8(_B31),
                                                     {V2_order, _B33} =
                                                         protocol:uint8(_B32),
                                                     {V2_self_preside_status,
                                                      _B34} =
                                                         protocol:uint8(_B33),
                                                     {V2_self_preside_text,
                                                      _B35} =
                                                         protocol:string(_B34),
                                                     {V2_target_preside_status,
                                                      _B36} =
                                                         protocol:uint8(_B35),
                                                     {V2_target_preside_text,
                                                      _B37} =
                                                         protocol:string(_B36),
                                                     {V2_is_auto, _B38} =
                                                         protocol:uint8(_B37),
                                                     {V2_is_hosted, _B39} =
                                                         protocol:uint8(_B38),
                                                     {V2_fc, _B40} =
                                                         protocol:uint32(_B39),
                                                     {V2_hp_max, _B41} =
                                                         protocol:int32(_B40),
                                                     {V2_mp_max, _B42} =
                                                         protocol:int32(_B41),
                                                     {V2_model_id, _B43} =
                                                         protocol:uint32(_B42),
                                                     {V2_looks, _B50} =
                                                         protocol:array(_B43,
                                                                        fun
                                                                            (_B44) ->
                                                                                {V3_looks_type,
                                                                                 _B45} =
                                                                                    protocol:uint32(_B44),
                                                                                {V3_looks_mode,
                                                                                 _B46} =
                                                                                    protocol:uint32(_B45),
                                                                                {V3_looks_val,
                                                                                 _B47} =
                                                                                    protocol:uint32(_B46),
                                                                                {V3_looks_str,
                                                                                 _B48} =
                                                                                    protocol:string(_B47),
                                                                                {{V3_looks_type,
                                                                                  V3_looks_mode,
                                                                                  V3_looks_val,
                                                                                  V3_looks_str},
                                                                                 _B48}
                                                                        end),
                                                     {V2_buff_infos, _B58} =
                                                         protocol:array(_B50,
                                                                        fun
                                                                            (_B51) ->
                                                                                {V3_buff_id,
                                                                                 _B52} =
                                                                                    protocol:uint32(_B51),
                                                                                {V3_layer,
                                                                                 _B53} =
                                                                                    protocol:uint8(_B52),
                                                                                {V3_duration,
                                                                                 _B54} =
                                                                                    protocol:uint8(_B53),
                                                                                {V3_duration_left,
                                                                                 _B55} =
                                                                                    protocol:uint8(_B54),
                                                                                {V3_can_dispel,
                                                                                 _B56} =
                                                                                    protocol:uint8(_B55),
                                                                                {{V3_buff_id,
                                                                                  V3_layer,
                                                                                  V3_duration,
                                                                                  V3_duration_left,
                                                                                  V3_can_dispel},
                                                                                 _B56}
                                                                        end),
                                                     {{V2_id,
                                                       V2_group,
                                                       V2_type,
                                                       V2_rid,
                                                       V2_platform,
                                                       V2_zone_id,
                                                       V2_base_id,
                                                       V2_master_fid,
                                                       V2_name,
                                                       V2_sex,
                                                       V2_classes,
                                                       V2_lev,
                                                       V2_face_id,
                                                       V2_is_die,
                                                       V2_is_die_disappear,
                                                       V2_hp,
                                                       V2_hp_max,
                                                       V2_mp,
                                                       V2_pos,
                                                       V2_order,
                                                       V2_self_preside_status,
                                                       V2_self_preside_text,
                                                       V2_target_preside_status,
                                                       V2_target_preside_text,
                                                       V2_is_auto,
                                                       V2_is_hosted,
                                                       V2_fc,
                                                       V2_hp_max,
                                                       V2_mp_max,
                                                       V2_model_id,
                                                       V2_looks,
                                                       V2_buff_infos},
                                                      _B58}
                                             end),
    {V0_summon_num, _B61} = protocol:uint8(_B60),
    {V0_use_item_num, _B62} = protocol:uint8(_B61),
    {V0_anger, _B63} = protocol:uint16(_B62),
    {V0_use_anger_ratio, _B64} = protocol:uint16(_B63),
    {V0_skill_infos, _B73} = protocol:array(_B64,
                                            fun (_B65) ->
                                                    {V2_skill_type_1, _B66} =
                                                        protocol:uint8(_B65),
                                                    {V2_skill_data_1, _B71} =
                                                        protocol:array(_B66,
                                                                       fun
                                                                           (_B67) ->
                                                                               {V3_skill_id_1,
                                                                                _B68} =
                                                                                   protocol:uint32(_B67),
                                                                               {V3_skill_lev_1,
                                                                                _B69} =
                                                                                   protocol:uint8(_B68),
                                                                               {{V3_skill_id_1,
                                                                                 V3_skill_lev_1},
                                                                                _B69}
                                                                       end),
                                                    {{V2_skill_type_1,
                                                      V2_skill_data_1},
                                                     _B71}
                                            end),
    {V0_pet_skill_infos, _B86} = protocol:array(_B73,
                                                fun (_B74) ->
                                                        {V2_pet_id, _B75} =
                                                            protocol:uint32(_B74),
                                                        {V2_pet_skill_infos,
                                                         _B84} =
                                                            protocol:array(_B75,
                                                                           fun
                                                                               (_B76) ->
                                                                                   {V3_skill_type_2,
                                                                                    _B77} =
                                                                                       protocol:uint8(_B76),
                                                                                   {V3_skill_data_2,
                                                                                    _B82} =
                                                                                       protocol:array(_B77,
                                                                                                      fun
                                                                                                          (_B78) ->
                                                                                                              {V4_skill_id_2,
                                                                                                               _B79} =
                                                                                                                  protocol:uint32(_B78),
                                                                                                              {V4_skill_lev_2,
                                                                                                               _B80} =
                                                                                                                  protocol:uint8(_B79),
                                                                                                              {{V4_skill_id_2,
                                                                                                                V4_skill_lev_2},
                                                                                                               _B80}
                                                                                                      end),
                                                                                   {{V3_skill_type_2,
                                                                                     V3_skill_data_2},
                                                                                    _B82}
                                                                           end),
                                                        {{V2_pet_id,
                                                          V2_pet_skill_infos},
                                                         _B84}
                                                end),
    {V0_child_skill_infos, _B99} = protocol:array(_B86,
                                                  fun (_B87) ->
                                                          {V2_child_id, _B88} =
                                                              protocol:uint32(_B87),
                                                          {V2_child_skill_infos,
                                                           _B97} =
                                                              protocol:array(_B88,
                                                                             fun
                                                                                 (_B89) ->
                                                                                     {V3_skill_type_3,
                                                                                      _B90} =
                                                                                         protocol:uint8(_B89),
                                                                                     {V3_skill_data_3,
                                                                                      _B95} =
                                                                                         protocol:array(_B90,
                                                                                                        fun
                                                                                                            (_B91) ->
                                                                                                                {V4_skill_id_3,
                                                                                                                 _B92} =
                                                                                                                    protocol:uint32(_B91),
                                                                                                                {V4_skill_lev_3,
                                                                                                                 _B93} =
                                                                                                                    protocol:uint8(_B92),
                                                                                                                {{V4_skill_id_3,
                                                                                                                  V4_skill_lev_3},
                                                                                                                 _B93}
                                                                                                        end),
                                                                                     {{V3_skill_type_3,
                                                                                       V3_skill_data_3},
                                                                                      _B95}
                                                                             end),
                                                          {{V2_child_id,
                                                            V2_child_skill_infos},
                                                           _B97}
                                                  end),
    {V0_skill_cooldown_list, _B104} = protocol:array(_B99,
                                                     fun (_B100) ->
                                                             {V2_skill_id,
                                                              _B101} =
                                                                 protocol:uint32(_B100),
                                                             {V2_cd_left,
                                                              _B102} =
                                                                 protocol:uint16(_B101),
                                                             {{V2_skill_id,
                                                               V2_cd_left},
                                                              _B102}
                                                     end),
    {V0_skill_cooldown_list_pet, _B109} =
        protocol:array(_B104,
                       fun (_B105) ->
                               {V2_skill_id, _B106} = protocol:uint32(_B105),
                               {V2_cd_left, _B107} = protocol:uint16(_B106),
                               {{V2_skill_id, V2_cd_left}, _B107}
                       end),
    {V0_backup_pets, _B117} = protocol:array(_B109,
                                             fun (_B110) ->
                                                     {V2_id, _B111} =
                                                         protocol:uint32(_B110),
                                                     {V2_base_id, _B112} =
                                                         protocol:uint32(_B111),
                                                     {V2_can_summon, _B113} =
                                                         protocol:uint8(_B112),
                                                     {V2_name, _B114} =
                                                         protocol:string(_B113),
                                                     {V2_lev, _B115} =
                                                         protocol:uint8(_B114),
                                                     {{V2_id,
                                                       V2_base_id,
                                                       V2_can_summon,
                                                       V2_name,
                                                       V2_lev},
                                                      _B115}
                                             end),
    {V0_backup_childs, _B126} = protocol:array(_B117,
                                               fun (_B118) ->
                                                       {V2_id, _B119} =
                                                           protocol:uint32(_B118),
                                                       {V2_base_id, _B120} =
                                                           protocol:uint32(_B119),
                                                       {V2_can_summon, _B121} =
                                                           protocol:uint8(_B120),
                                                       {V2_name, _B122} =
                                                           protocol:string(_B121),
                                                       {V2_lev, _B123} =
                                                           protocol:uint8(_B122),
                                                       {V2_hungry, _B124} =
                                                           protocol:uint32(_B123),
                                                       {{V2_id,
                                                         V2_base_id,
                                                         V2_can_summon,
                                                         V2_name,
                                                         V2_lev,
                                                         V2_hungry},
                                                        _B124}
                                               end),
    <<V0_combat_type:8/little, V0_enter_type:8/little,
      V0_enter_view:8/little, V0_start_time:32/little,
      V0_atk_formation:8/little,
      V0_atk_formation_lev:8/little,
      V0_dfd_formation:8/little,
      V0_dfd_formation_lev:8/little, V0_round:16/little,
      V0_guide:16/little, V0_status:8/little,
      V0_wait_time:8/little, V0_time:8/little,
      (length(V0_fighter_list)):16/little,
      (list_to_binary([<<V1_id:16/little, V1_group:8/little,
                         V1_type:8/little, V1_rid:32/little,
                         (protocol:pack(string, V1_platform))/binary,
                         V1_zone_id:16/little, V1_base_id:32/little,
                         V1_master_fid:16/little,
                         (protocol:pack(string, V1_name))/binary,
                         V1_sex:8/little, V1_classes:8/little, V1_lev:16/little,
                         V1_face_id:32/little, V1_is_die:8/little,
                         V1_is_die_disappear:8/little, V1_hp:32/signed-little,
                         V1_tmp_hp_max:32/signed-little, V1_mp:32/signed-little,
                         V1_pos:8/little, V1_order:8/little,
                         V1_self_preside_status:8/little,
                         (protocol:pack(string, V1_self_preside_text))/binary,
                         V1_target_preside_status:8/little,
                         (protocol:pack(string, V1_target_preside_text))/binary,
                         V1_is_auto:8/little, V1_is_hosted:8/little,
                         V1_fc:32/little, V1_hp_max:32/signed-little,
                         V1_mp_max:32/signed-little, V1_model_id:32/little,
                         (length(V1_looks)):16/little,
                         (list_to_binary([<<V2_looks_type:32/little,
                                            V2_looks_mode:32/little,
                                            V2_looks_val:32/little,
                                            (protocol:pack(string,
                                                           V2_looks_str))/binary>>
                                          || {V2_looks_type,
                                              V2_looks_mode,
                                              V2_looks_val,
                                              V2_looks_str}
                                                 <- V1_looks]))/binary,
                         (length(V1_buff_infos)):16/little,
                         (list_to_binary([<<V2_buff_id:32/little,
                                            V2_layer:8/little,
                                            V2_duration:8/little,
                                            V2_duration_left:8/little,
                                            V2_can_dispel:8/little>>
                                          || {V2_buff_id,
                                              V2_layer,
                                              V2_duration,
                                              V2_duration_left,
                                              V2_can_dispel}
                                                 <- V1_buff_infos]))/binary>>
                       || {V1_id,
                           V1_group,
                           V1_type,
                           V1_rid,
                           V1_platform,
                           V1_zone_id,
                           V1_base_id,
                           V1_master_fid,
                           V1_name,
                           V1_sex,
                           V1_classes,
                           V1_lev,
                           V1_face_id,
                           V1_is_die,
                           V1_is_die_disappear,
                           V1_hp,
                           V1_tmp_hp_max,
                           V1_mp,
                           V1_pos,
                           V1_order,
                           V1_self_preside_status,
                           V1_self_preside_text,
                           V1_target_preside_status,
                           V1_target_preside_text,
                           V1_is_auto,
                           V1_is_hosted,
                           V1_fc,
                           V1_hp_max,
                           V1_mp_max,
                           V1_model_id,
                           V1_looks,
                           V1_buff_infos}
                              <- V0_fighter_list]))/binary,
      V0_summon_num:8/little, V0_use_item_num:8/little,
      V0_anger:16/little, V0_use_anger_ratio:16/little,
      (length(V0_skill_infos)):16/little,
      (list_to_binary([<<V1_skill_type_1:8/little,
                         (length(V1_skill_data_1)):16/little,
                         (list_to_binary([<<V2_skill_id_1:32/little,
                                            V2_skill_lev_1:8/little>>
                                          || {V2_skill_id_1, V2_skill_lev_1}
                                                 <- V1_skill_data_1]))/binary>>
                       || {V1_skill_type_1, V1_skill_data_1}
                              <- V0_skill_infos]))/binary,
      (length(V0_pet_skill_infos)):16/little,
      (list_to_binary([<<V1_pet_id:32/little,
                         (length(V1_pet_skill_infos)):16/little,
                         (list_to_binary([<<V2_skill_type_2:8/little,
                                            (length(V2_skill_data_2)):16/little,
                                            (list_to_binary([<<V3_skill_id_2:32/little,
                                                               V3_skill_lev_2:8/little>>
                                                             || {V3_skill_id_2,
                                                                 V3_skill_lev_2}
                                                                    <- V2_skill_data_2]))/binary>>
                                          || {V2_skill_type_2, V2_skill_data_2}
                                                 <- V1_pet_skill_infos]))/binary>>
                       || {V1_pet_id, V1_pet_skill_infos}
                              <- V0_pet_skill_infos]))/binary,
      (length(V0_child_skill_infos)):16/little,
      (list_to_binary([<<V1_child_id:32/little,
                         (length(V1_child_skill_infos)):16/little,
                         (list_to_binary([<<V2_skill_type_3:8/little,
                                            (length(V2_skill_data_3)):16/little,
                                            (list_to_binary([<<V3_skill_id_3:32/little,
                                                               V3_skill_lev_3:8/little>>
                                                             || {V3_skill_id_3,
                                                                 V3_skill_lev_3}
                                                                    <- V2_skill_data_3]))/binary>>
                                          || {V2_skill_type_3, V2_skill_data_3}
                                                 <- V1_child_skill_infos]))/binary>>
                       || {V1_child_id, V1_child_skill_infos}
                              <- V0_child_skill_infos]))/binary,
      (length(V0_skill_cooldown_list)):16/little,
      (list_to_binary([<<V1_skill_id:32/little,
                         V1_cd_left:16/little>>
                       || {V1_skill_id, V1_cd_left}
                              <- V0_skill_cooldown_list]))/binary,
      (length(V0_skill_cooldown_list_pet)):16/little,
      (list_to_binary([<<V1_skill_id:32/little,
                         V1_cd_left:16/little>>
                       || {V1_skill_id, V1_cd_left}
                              <- V0_skill_cooldown_list_pet]))/binary,
      (length(V0_backup_pets)):16/little,
      (list_to_binary([<<V1_id:32/little,
                         V1_base_id:32/little, V1_can_summon:8/little,
                         (protocol:pack(string, V1_name))/binary,
                         V1_lev:8/little>>
                       || {V1_id, V1_base_id, V1_can_summon, V1_name, V1_lev}
                              <- V0_backup_pets]))/binary,
      (length(V0_backup_childs)):16/little,
      (list_to_binary([<<V1_id:32/little,
                         V1_base_id:32/little, V1_can_summon:8/little,
                         (protocol:pack(string, V1_name))/binary,
                         V1_lev:8/little, V1_hungry:32/little>>
                       || {V1_id,
                           V1_base_id,
                           V1_can_summon,
                           V1_name,
                           V1_lev,
                           V1_hungry}
                              <- V0_backup_childs]))/binary>>.

do_frame_10720(_B0) ->
    {V0_round, _B1} = protocol:uint16(_B0),
    {V0_start_time, _B2} = protocol:uint32(_B1),
    {V0_action_list, _B43} = protocol:array(_B2,
                                            fun (_B3) ->
                                                    {V2_order, _B4} =
                                                        protocol:uint8(_B3),
                                                    {V2_sub_action_list, _B41} =
                                                        protocol:array(_B4,
                                                                       fun
                                                                           (_B5) ->
                                                                               {V3_self_id,
                                                                                _B6} =
                                                                                   protocol:uint16(_B5),
                                                                               {V3_target_id,
                                                                                _B7} =
                                                                                   protocol:uint16(_B6),
                                                                               {V3_sub_order,
                                                                                _B8} =
                                                                                   protocol:uint8(_B7),
                                                                               {V3_skill_id,
                                                                                _B9} =
                                                                                   protocol:uint32(_B8),
                                                                               {V3_skill_lev,
                                                                                _B10} =
                                                                                   protocol:uint8(_B9),
                                                                               {V3_attack_type,
                                                                                _B11} =
                                                                                   protocol:uint8(_B10),
                                                                               {V3_action_type,
                                                                                _B12} =
                                                                                   protocol:uint8(_B11),
                                                                               {V3_self_changes,
                                                                                _B18} =
                                                                                   protocol:array(_B12,
                                                                                                  fun
                                                                                                      (_B13) ->
                                                                                                          {V4_change_type,
                                                                                                           _B14} =
                                                                                                              protocol:uint8(_B13),
                                                                                                          {V4_change_val,
                                                                                                           _B15} =
                                                                                                              protocol:int32(_B14),
                                                                                                          {V4_other_val,
                                                                                                           _B16} =
                                                                                                              protocol:int32(_B15),
                                                                                                          {{V4_change_type,
                                                                                                            V4_change_val,
                                                                                                            V4_other_val},
                                                                                                           _B16}
                                                                                                  end),
                                                                               {V3_target_changes,
                                                                                _B24} =
                                                                                   protocol:array(_B18,
                                                                                                  fun
                                                                                                      (_B19) ->
                                                                                                          {V4_change_type,
                                                                                                           _B20} =
                                                                                                              protocol:uint8(_B19),
                                                                                                          {V4_change_val,
                                                                                                           _B21} =
                                                                                                              protocol:int32(_B20),
                                                                                                          {V4_other_val,
                                                                                                           _B22} =
                                                                                                              protocol:int32(_B21),
                                                                                                          {{V4_change_type,
                                                                                                            V4_change_val,
                                                                                                            V4_other_val},
                                                                                                           _B22}
                                                                                                  end),
                                                                               {V3_show_passive_skills,
                                                                                _B30} =
                                                                                   protocol:array(_B24,
                                                                                                  fun
                                                                                                      (_B25) ->
                                                                                                          {V4_id,
                                                                                                           _B26} =
                                                                                                              protocol:uint16(_B25),
                                                                                                          {V4_skill_id,
                                                                                                           _B27} =
                                                                                                              protocol:uint32(_B26),
                                                                                                          {V4_show_type,
                                                                                                           _B28} =
                                                                                                              protocol:uint8(_B27),
                                                                                                          {{V4_id,
                                                                                                            V4_skill_id,
                                                                                                            V4_show_type},
                                                                                                           _B28}
                                                                                                  end),
                                                                               {V3_is_hit,
                                                                                _B31} =
                                                                                   protocol:uint8(_B30),
                                                                               {V3_is_crit,
                                                                                _B32} =
                                                                                   protocol:uint8(_B31),
                                                                               {V3_is_defence,
                                                                                _B33} =
                                                                                   protocol:uint8(_B32),
                                                                               {V3_is_self_die,
                                                                                _B34} =
                                                                                   protocol:uint8(_B33),
                                                                               {V3_is_self_die_disappear,
                                                                                _B35} =
                                                                                   protocol:uint8(_B34),
                                                                               {V3_is_target_die,
                                                                                _B36} =
                                                                                   protocol:uint8(_B35),
                                                                               {V3_is_target_die_disappear,
                                                                                _B37} =
                                                                                   protocol:uint8(_B36),
                                                                               {V3_talk,
                                                                                _B38} =
                                                                                   protocol:string(_B37),
                                                                               {V3_action_msg,
                                                                                _B39} =
                                                                                   protocol:string(_B38),
                                                                               {{V3_self_id,
                                                                                 V3_target_id,
                                                                                 V3_sub_order,
                                                                                 V3_skill_id,
                                                                                 V3_skill_lev,
                                                                                 V3_attack_type,
                                                                                 V3_action_type,
                                                                                 V3_self_changes,
                                                                                 V3_target_changes,
                                                                                 V3_show_passive_skills,
                                                                                 V3_is_hit,
                                                                                 V3_is_crit,
                                                                                 V3_is_defence,
                                                                                 V3_is_self_die,
                                                                                 V3_is_self_die_disappear,
                                                                                 V3_is_target_die,
                                                                                 V3_is_target_die_disappear,
                                                                                 V3_talk,
                                                                                 V3_action_msg},
                                                                                _B39}
                                                                       end),
                                                    {{V2_order,
                                                      V2_sub_action_list},
                                                     _B41}
                                            end),
    {V0_buff_play_list, _B64} = protocol:array(_B43,
                                               fun (_B44) ->
                                                       {V2_order, _B45} =
                                                           protocol:uint8(_B44),
                                                       {V2_sub_order, _B46} =
                                                           protocol:uint8(_B45),
                                                       {V2_action_type, _B47} =
                                                           protocol:uint8(_B46),
                                                       {V2_buff_id, _B48} =
                                                           protocol:uint32(_B47),
                                                       {V2_layer, _B49} =
                                                           protocol:uint8(_B48),
                                                       {V2_duration, _B50} =
                                                           protocol:uint8(_B49),
                                                       {V2_duration_left,
                                                        _B51} =
                                                           protocol:uint8(_B50),
                                                       {V2_is_hit, _B52} =
                                                           protocol:uint8(_B51),
                                                       {V2_can_dispel, _B53} =
                                                           protocol:uint8(_B52),
                                                       {V2_caster_id, _B54} =
                                                           protocol:uint16(_B53),
                                                       {V2_target_id, _B55} =
                                                           protocol:uint16(_B54),
                                                       {V2_skill_fid, _B56} =
                                                           protocol:uint16(_B55),
                                                       {V2_target_changes,
                                                        _B62} =
                                                           protocol:array(_B56,
                                                                          fun
                                                                              (_B57) ->
                                                                                  {V3_change_type,
                                                                                   _B58} =
                                                                                      protocol:uint8(_B57),
                                                                                  {V3_change_val,
                                                                                   _B59} =
                                                                                      protocol:int32(_B58),
                                                                                  {V3_other_val,
                                                                                   _B60} =
                                                                                      protocol:int32(_B59),
                                                                                  {{V3_change_type,
                                                                                    V3_change_val,
                                                                                    V3_other_val},
                                                                                   _B60}
                                                                          end),
                                                       {{V2_order,
                                                         V2_sub_order,
                                                         V2_action_type,
                                                         V2_buff_id,
                                                         V2_layer,
                                                         V2_duration,
                                                         V2_duration_left,
                                                         V2_is_hit,
                                                         V2_can_dispel,
                                                         V2_caster_id,
                                                         V2_target_id,
                                                         V2_skill_fid,
                                                         V2_target_changes},
                                                        _B62}
                                               end),
    {V0_summon_play_list, _B112} = protocol:array(_B64,
                                                  fun (_B65) ->
                                                          {V2_order, _B66} =
                                                              protocol:uint8(_B65),
                                                          {V2_sub_order, _B67} =
                                                              protocol:uint8(_B66),
                                                          {V2_summon_type,
                                                           _B68} =
                                                              protocol:uint8(_B67),
                                                          {V2_summoner_id,
                                                           _B69} =
                                                              protocol:uint16(_B68),
                                                          {V2_summons, _B110} =
                                                              protocol:array(_B69,
                                                                             fun
                                                                                 (_B70) ->
                                                                                     {V3_id,
                                                                                      _B71} =
                                                                                         protocol:uint16(_B70),
                                                                                     {V3_group,
                                                                                      _B72} =
                                                                                         protocol:uint8(_B71),
                                                                                     {V3_type,
                                                                                      _B73} =
                                                                                         protocol:uint8(_B72),
                                                                                     {V3_rid,
                                                                                      _B74} =
                                                                                         protocol:uint32(_B73),
                                                                                     {V3_platform,
                                                                                      _B75} =
                                                                                         protocol:string(_B74),
                                                                                     {V3_zone_id,
                                                                                      _B76} =
                                                                                         protocol:uint16(_B75),
                                                                                     {V3_base_id,
                                                                                      _B77} =
                                                                                         protocol:uint32(_B76),
                                                                                     {V3_master_fid,
                                                                                      _B78} =
                                                                                         protocol:uint16(_B77),
                                                                                     {V3_name,
                                                                                      _B79} =
                                                                                         protocol:string(_B78),
                                                                                     {V3_sex,
                                                                                      _B80} =
                                                                                         protocol:uint8(_B79),
                                                                                     {V3_classes,
                                                                                      _B81} =
                                                                                         protocol:uint8(_B80),
                                                                                     {V3_lev,
                                                                                      _B82} =
                                                                                         protocol:uint16(_B81),
                                                                                     {V3_face_id,
                                                                                      _B83} =
                                                                                         protocol:uint32(_B82),
                                                                                     {V3_is_die,
                                                                                      _B84} =
                                                                                         protocol:uint8(_B83),
                                                                                     {V3_is_die_disappear,
                                                                                      _B85} =
                                                                                         protocol:uint8(_B84),
                                                                                     {V3_hp,
                                                                                      _B86} =
                                                                                         protocol:int32(_B85),
                                                                                     {V3_mp,
                                                                                      _B87} =
                                                                                         protocol:int32(_B86),
                                                                                     {V3_pos,
                                                                                      _B88} =
                                                                                         protocol:uint8(_B87),
                                                                                     {V3_order,
                                                                                      _B89} =
                                                                                         protocol:uint8(_B88),
                                                                                     {V3_fc,
                                                                                      _B90} =
                                                                                         protocol:uint32(_B89),
                                                                                     {V3_hp_max,
                                                                                      _B91} =
                                                                                         protocol:int32(_B90),
                                                                                     {V3_mp_max,
                                                                                      _B92} =
                                                                                         protocol:int32(_B91),
                                                                                     {V3_looks,
                                                                                      _B99} =
                                                                                         protocol:array(_B92,
                                                                                                        fun
                                                                                                            (_B93) ->
                                                                                                                {V4_looks_type,
                                                                                                                 _B94} =
                                                                                                                    protocol:uint32(_B93),
                                                                                                                {V4_looks_mode,
                                                                                                                 _B95} =
                                                                                                                    protocol:uint32(_B94),
                                                                                                                {V4_looks_val,
                                                                                                                 _B96} =
                                                                                                                    protocol:uint32(_B95),
                                                                                                                {V4_looks_str,
                                                                                                                 _B97} =
                                                                                                                    protocol:string(_B96),
                                                                                                                {{V4_looks_type,
                                                                                                                  V4_looks_mode,
                                                                                                                  V4_looks_val,
                                                                                                                  V4_looks_str},
                                                                                                                 _B97}
                                                                                                        end),
                                                                                     {V3_model_id,
                                                                                      _B100} =
                                                                                         protocol:uint32(_B99),
                                                                                     {V3_buff_infos,
                                                                                      _B108} =
                                                                                         protocol:array(_B100,
                                                                                                        fun
                                                                                                            (_B101) ->
                                                                                                                {V4_buff_id,
                                                                                                                 _B102} =
                                                                                                                    protocol:uint32(_B101),
                                                                                                                {V4_layer,
                                                                                                                 _B103} =
                                                                                                                    protocol:uint8(_B102),
                                                                                                                {V4_duration,
                                                                                                                 _B104} =
                                                                                                                    protocol:uint8(_B103),
                                                                                                                {V4_duration_left,
                                                                                                                 _B105} =
                                                                                                                    protocol:uint8(_B104),
                                                                                                                {V4_can_dispel,
                                                                                                                 _B106} =
                                                                                                                    protocol:uint8(_B105),
                                                                                                                {{V4_buff_id,
                                                                                                                  V4_layer,
                                                                                                                  V4_duration,
                                                                                                                  V4_duration_left,
                                                                                                                  V4_can_dispel},
                                                                                                                 _B106}
                                                                                                        end),
                                                                                     {{V3_id,
                                                                                       V3_group,
                                                                                       V3_type,
                                                                                       V3_rid,
                                                                                       V3_platform,
                                                                                       V3_zone_id,
                                                                                       V3_base_id,
                                                                                       V3_master_fid,
                                                                                       V3_name,
                                                                                       V3_sex,
                                                                                       V3_classes,
                                                                                       V3_lev,
                                                                                       V3_face_id,
                                                                                       V3_is_die,
                                                                                       V3_is_die_disappear,
                                                                                       V3_hp,
                                                                                       V3_hp_max,
                                                                                       V3_mp,
                                                                                       V3_pos,
                                                                                       V3_order,
                                                                                       V3_fc,
                                                                                       V3_hp_max,
                                                                                       V3_mp_max,
                                                                                       V3_looks,
                                                                                       V3_model_id,
                                                                                       V3_buff_infos},
                                                                                      _B108}
                                                                             end),
                                                          {{V2_order,
                                                            V2_sub_order,
                                                            V2_summon_type,
                                                            V2_summoner_id,
                                                            V2_summons},
                                                           _B110}
                                                  end),
    {V0_buff_list, _B123} = protocol:array(_B112,
                                           fun (_B113) ->
                                                   {V2_fighter_id, _B114} =
                                                       protocol:uint16(_B113),
                                                   {V2_buffs, _B121} =
                                                       protocol:array(_B114,
                                                                      fun
                                                                          (_B115) ->
                                                                              {V3_id,
                                                                               _B116} =
                                                                                  protocol:uint32(_B115),
                                                                              {V3_layer,
                                                                               _B117} =
                                                                                  protocol:uint8(_B116),
                                                                              {V3_duration,
                                                                               _B118} =
                                                                                  protocol:uint8(_B117),
                                                                              {V3_duration_left,
                                                                               _B119} =
                                                                                  protocol:uint8(_B118),
                                                                              {{V3_id,
                                                                                V3_layer,
                                                                                V3_duration,
                                                                                V3_duration_left},
                                                                               _B119}
                                                                      end),
                                                   {{V2_fighter_id, V2_buffs},
                                                    _B121}
                                           end),
    {V0_buff_play_list2, _B144} = protocol:array(_B123,
                                                 fun (_B124) ->
                                                         {V2_order, _B125} =
                                                             protocol:uint8(_B124),
                                                         {V2_sub_order, _B126} =
                                                             protocol:uint8(_B125),
                                                         {V2_action_type,
                                                          _B127} =
                                                             protocol:uint8(_B126),
                                                         {V2_buff_id, _B128} =
                                                             protocol:uint32(_B127),
                                                         {V2_layer, _B129} =
                                                             protocol:uint8(_B128),
                                                         {V2_duration, _B130} =
                                                             protocol:uint8(_B129),
                                                         {V2_duration_left,
                                                          _B131} =
                                                             protocol:uint8(_B130),
                                                         {V2_is_hit, _B132} =
                                                             protocol:uint8(_B131),
                                                         {V2_can_dispel,
                                                          _B133} =
                                                             protocol:uint8(_B132),
                                                         {V2_caster_id, _B134} =
                                                             protocol:uint16(_B133),
                                                         {V2_target_id, _B135} =
                                                             protocol:uint16(_B134),
                                                         {V2_skill_fid, _B136} =
                                                             protocol:uint16(_B135),
                                                         {V2_target_changes,
                                                          _B142} =
                                                             protocol:array(_B136,
                                                                            fun
                                                                                (_B137) ->
                                                                                    {V3_change_type,
                                                                                     _B138} =
                                                                                        protocol:uint8(_B137),
                                                                                    {V3_change_val,
                                                                                     _B139} =
                                                                                        protocol:int32(_B138),
                                                                                    {V3_other_val,
                                                                                     _B140} =
                                                                                        protocol:int32(_B139),
                                                                                    {{V3_change_type,
                                                                                      V3_change_val,
                                                                                      V3_other_val},
                                                                                     _B140}
                                                                            end),
                                                         {{V2_order,
                                                           V2_sub_order,
                                                           V2_action_type,
                                                           V2_buff_id,
                                                           V2_layer,
                                                           V2_duration,
                                                           V2_duration_left,
                                                           V2_is_hit,
                                                           V2_can_dispel,
                                                           V2_caster_id,
                                                           V2_target_id,
                                                           V2_skill_fid,
                                                           V2_target_changes},
                                                          _B142}
                                                 end),
    {V0_fighter_status_list, _B157} = protocol:array(_B144,
                                                     fun (_B145) ->
                                                             {V2_id, _B146} =
                                                                 protocol:uint16(_B145),
                                                             {V2_hp, _B147} =
                                                                 protocol:int32(_B146),
                                                             {V2_mp, _B148} =
                                                                 protocol:int32(_B147),
                                                             {V2_hp_max,
                                                              _B149} =
                                                                 protocol:int32(_B148),
                                                             {V2_mp_max,
                                                              _B150} =
                                                                 protocol:int32(_B149),
                                                             {V2_is_die,
                                                              _B151} =
                                                                 protocol:uint8(_B150),
                                                             {V2_is_die_disappear,
                                                              _B152} =
                                                                 protocol:uint8(_B151),
                                                             {V2_pos, _B153} =
                                                                 protocol:uint8(_B152),
                                                             {V2_order, _B154} =
                                                                 protocol:uint8(_B153),
                                                             {V2_is_escape,
                                                              _B155} =
                                                                 protocol:uint8(_B154),
                                                             {{V2_id,
                                                               V2_hp,
                                                               V2_hp_max,
                                                               V2_mp,
                                                               V2_hp_max,
                                                               V2_mp_max,
                                                               V2_is_die,
                                                               V2_is_die_disappear,
                                                               V2_pos,
                                                               V2_order,
                                                               V2_is_escape},
                                                              _B155}
                                                     end),
    {V0_combat_result, _B158} = protocol:uint8(_B157),
    {V0_guide, _B159} = protocol:uint16(_B158),
    {V0_time, _B160} = protocol:uint8(_B159),
    {V0_fighter_changes, _B170} = protocol:array(_B160,
                                                 fun (_B161) ->
                                                         {V2_id, _B162} =
                                                             protocol:uint16(_B161),
                                                         {V2_self_changes,
                                                          _B168} =
                                                             protocol:array(_B162,
                                                                            fun
                                                                                (_B163) ->
                                                                                    {V3_change_type,
                                                                                     _B164} =
                                                                                        protocol:uint8(_B163),
                                                                                    {V3_change_val,
                                                                                     _B165} =
                                                                                        protocol:int32(_B164),
                                                                                    {V3_other_val,
                                                                                     _B166} =
                                                                                        protocol:int32(_B165),
                                                                                    {{V3_change_type,
                                                                                      V3_change_val,
                                                                                      V3_other_val},
                                                                                     _B166}
                                                                            end),
                                                         {{V2_id,
                                                           V2_self_changes},
                                                          _B168}
                                                 end),
    {V0_summon_num, _B171} = protocol:uint8(_B170),
    {V0_use_item_num, _B172} = protocol:uint8(_B171),
    {V0_skill_cooldown_list, _B177} = protocol:array(_B172,
                                                     fun (_B173) ->
                                                             {V2_skill_id,
                                                              _B174} =
                                                                 protocol:uint32(_B173),
                                                             {V2_cd_left,
                                                              _B175} =
                                                                 protocol:uint16(_B174),
                                                             {{V2_skill_id,
                                                               V2_cd_left},
                                                              _B175}
                                                     end),
    {V0_skill_cooldown_list_pet, _B182} =
        protocol:array(_B177,
                       fun (_B178) ->
                               {V2_skill_id, _B179} = protocol:uint32(_B178),
                               {V2_cd_left, _B180} = protocol:uint16(_B179),
                               {{V2_skill_id, V2_cd_left}, _B180}
                       end),
    {V0_backup_pets, _B190} = protocol:array(_B182,
                                             fun (_B183) ->
                                                     {V2_id, _B184} =
                                                         protocol:uint32(_B183),
                                                     {V2_base_id, _B185} =
                                                         protocol:uint32(_B184),
                                                     {V2_can_summon, _B186} =
                                                         protocol:uint8(_B185),
                                                     {V2_name, _B187} =
                                                         protocol:string(_B186),
                                                     {V2_lev, _B188} =
                                                         protocol:uint8(_B187),
                                                     {{V2_id,
                                                       V2_base_id,
                                                       V2_can_summon,
                                                       V2_name,
                                                       V2_lev},
                                                      _B188}
                                             end),
    {V0_backup_childs, _B199} = protocol:array(_B190,
                                               fun (_B191) ->
                                                       {V2_id, _B192} =
                                                           protocol:uint32(_B191),
                                                       {V2_base_id, _B193} =
                                                           protocol:uint32(_B192),
                                                       {V2_can_summon, _B194} =
                                                           protocol:uint8(_B193),
                                                       {V2_name, _B195} =
                                                           protocol:string(_B194),
                                                       {V2_lev, _B196} =
                                                           protocol:uint8(_B195),
                                                       {V2_hungry, _B197} =
                                                           protocol:uint32(_B196),
                                                       {{V2_id,
                                                         V2_base_id,
                                                         V2_can_summon,
                                                         V2_name,
                                                         V2_lev,
                                                         V2_hungry},
                                                        _B197}
                                               end),
    <<V0_round:16/little, V0_start_time:32/little,
      (length(V0_action_list)):16/little,
      (list_to_binary([<<V1_order:8/little,
                         (length(V1_sub_action_list)):16/little,
                         (list_to_binary([<<V2_self_id:16/little,
                                            V2_target_id:16/little,
                                            V2_sub_order:8/little,
                                            V2_skill_id:32/little,
                                            V2_skill_lev:8/little,
                                            V2_attack_type:8/little,
                                            V2_action_type:8/little,
                                            (length(V2_self_changes)):16/little,
                                            (list_to_binary([<<V3_change_type:8/little,
                                                               V3_change_val:32/signed-little,
                                                               V3_other_val:32/signed-little>>
                                                             || {V3_change_type,
                                                                 V3_change_val,
                                                                 V3_other_val}
                                                                    <- V2_self_changes]))/binary,
                                            (length(V2_target_changes)):16/little,
                                            (list_to_binary([<<V3_change_type:8/little,
                                                               V3_change_val:32/signed-little,
                                                               V3_other_val:32/signed-little>>
                                                             || {V3_change_type,
                                                                 V3_change_val,
                                                                 V3_other_val}
                                                                    <- V2_target_changes]))/binary,
                                            (length(V2_show_passive_skills)):16/little,
                                            (list_to_binary([<<V3_id:16/little,
                                                               V3_skill_id:32/little,
                                                               V3_show_type:8/little>>
                                                             || {V3_id,
                                                                 V3_skill_id,
                                                                 V3_show_type}
                                                                    <- V2_show_passive_skills]))/binary,
                                            V2_is_hit:8/little,
                                            V2_is_crit:8/little,
                                            V2_is_defence:8/little,
                                            V2_is_self_die:8/little,
                                            V2_is_self_die_disappear:8/little,
                                            V2_is_target_die:8/little,
                                            V2_is_target_die_disappear:8/little,
                                            (protocol:pack(string,
                                                           V2_talk))/binary,
                                            (protocol:pack(string,
                                                           V2_action_msg))/binary>>
                                          || {V2_self_id,
                                              V2_target_id,
                                              V2_sub_order,
                                              V2_skill_id,
                                              V2_skill_lev,
                                              V2_attack_type,
                                              V2_action_type,
                                              V2_self_changes,
                                              V2_target_changes,
                                              V2_show_passive_skills,
                                              V2_is_hit,
                                              V2_is_crit,
                                              V2_is_defence,
                                              V2_is_self_die,
                                              V2_is_self_die_disappear,
                                              V2_is_target_die,
                                              V2_is_target_die_disappear,
                                              V2_talk,
                                              V2_action_msg}
                                                 <- V1_sub_action_list]))/binary>>
                       || {V1_order, V1_sub_action_list}
                              <- V0_action_list]))/binary,
      (length(V0_buff_play_list)):16/little,
      (list_to_binary([<<V1_order:8/little,
                         V1_sub_order:8/little, V1_action_type:8/little,
                         V1_buff_id:32/little, V1_layer:8/little,
                         V1_duration:8/little, V1_duration_left:8/little,
                         V1_is_hit:8/little, V1_can_dispel:8/little,
                         V1_caster_id:16/little, V1_target_id:16/little,
                         V1_skill_fid:16/little,
                         (length(V1_target_changes)):16/little,
                         (list_to_binary([<<V2_change_type:8/little,
                                            V2_change_val:32/signed-little,
                                            V2_other_val:32/signed-little>>
                                          || {V2_change_type,
                                              V2_change_val,
                                              V2_other_val}
                                                 <- V1_target_changes]))/binary>>
                       || {V1_order,
                           V1_sub_order,
                           V1_action_type,
                           V1_buff_id,
                           V1_layer,
                           V1_duration,
                           V1_duration_left,
                           V1_is_hit,
                           V1_can_dispel,
                           V1_caster_id,
                           V1_target_id,
                           V1_skill_fid,
                           V1_target_changes}
                              <- V0_buff_play_list]))/binary,
      (length(V0_summon_play_list)):16/little,
      (list_to_binary([<<V1_order:8/little,
                         V1_sub_order:8/little, V1_summon_type:8/little,
                         V1_summoner_id:16/little,
                         (length(V1_summons)):16/little,
                         (list_to_binary([<<V2_id:16/little, V2_group:8/little,
                                            V2_type:8/little, V2_rid:32/little,
                                            (protocol:pack(string,
                                                           V2_platform))/binary,
                                            V2_zone_id:16/little,
                                            V2_base_id:32/little,
                                            V2_master_fid:16/little,
                                            (protocol:pack(string,
                                                           V2_name))/binary,
                                            V2_sex:8/little,
                                            V2_classes:8/little,
                                            V2_lev:16/little,
                                            V2_face_id:32/little,
                                            V2_is_die:8/little,
                                            V2_is_die_disappear:8/little,
                                            V2_hp:32/signed-little,
                                            V2_tmp_hp_max:32/signed-little,
                                            V2_mp:32/signed-little,
                                            V2_pos:8/little, V2_order:8/little,
                                            V2_fc:32/little,
                                            V2_hp_max:32/signed-little,
                                            V2_mp_max:32/signed-little,
                                            (length(V2_looks)):16/little,
                                            (list_to_binary([<<V3_looks_type:32/little,
                                                               V3_looks_mode:32/little,
                                                               V3_looks_val:32/little,
                                                               (protocol:pack(string,
                                                                              V3_looks_str))/binary>>
                                                             || {V3_looks_type,
                                                                 V3_looks_mode,
                                                                 V3_looks_val,
                                                                 V3_looks_str}
                                                                    <- V2_looks]))/binary,
                                            V2_model_id:32/little,
                                            (length(V2_buff_infos)):16/little,
                                            (list_to_binary([<<V3_buff_id:32/little,
                                                               V3_layer:8/little,
                                                               V3_duration:8/little,
                                                               V3_duration_left:8/little,
                                                               V3_can_dispel:8/little>>
                                                             || {V3_buff_id,
                                                                 V3_layer,
                                                                 V3_duration,
                                                                 V3_duration_left,
                                                                 V3_can_dispel}
                                                                    <- V2_buff_infos]))/binary>>
                                          || {V2_id,
                                              V2_group,
                                              V2_type,
                                              V2_rid,
                                              V2_platform,
                                              V2_zone_id,
                                              V2_base_id,
                                              V2_master_fid,
                                              V2_name,
                                              V2_sex,
                                              V2_classes,
                                              V2_lev,
                                              V2_face_id,
                                              V2_is_die,
                                              V2_is_die_disappear,
                                              V2_hp,
                                              V2_tmp_hp_max,
                                              V2_mp,
                                              V2_pos,
                                              V2_order,
                                              V2_fc,
                                              V2_hp_max,
                                              V2_mp_max,
                                              V2_looks,
                                              V2_model_id,
                                              V2_buff_infos}
                                                 <- V1_summons]))/binary>>
                       || {V1_order,
                           V1_sub_order,
                           V1_summon_type,
                           V1_summoner_id,
                           V1_summons}
                              <- V0_summon_play_list]))/binary,
      (length(V0_buff_list)):16/little,
      (list_to_binary([<<V1_fighter_id:16/little,
                         (length(V1_buffs)):16/little,
                         (list_to_binary([<<V2_id:32/little, V2_layer:8/little,
                                            V2_duration:8/little,
                                            V2_duration_left:8/little>>
                                          || {V2_id,
                                              V2_layer,
                                              V2_duration,
                                              V2_duration_left}
                                                 <- V1_buffs]))/binary>>
                       || {V1_fighter_id, V1_buffs} <- V0_buff_list]))/binary,
      (length(V0_buff_play_list2)):16/little,
      (list_to_binary([<<V1_order:8/little,
                         V1_sub_order:8/little, V1_action_type:8/little,
                         V1_buff_id:32/little, V1_layer:8/little,
                         V1_duration:8/little, V1_duration_left:8/little,
                         V1_is_hit:8/little, V1_can_dispel:8/little,
                         V1_caster_id:16/little, V1_target_id:16/little,
                         V1_skill_fid:16/little,
                         (length(V1_target_changes)):16/little,
                         (list_to_binary([<<V2_change_type:8/little,
                                            V2_change_val:32/signed-little,
                                            V2_other_val:32/signed-little>>
                                          || {V2_change_type,
                                              V2_change_val,
                                              V2_other_val}
                                                 <- V1_target_changes]))/binary>>
                       || {V1_order,
                           V1_sub_order,
                           V1_action_type,
                           V1_buff_id,
                           V1_layer,
                           V1_duration,
                           V1_duration_left,
                           V1_is_hit,
                           V1_can_dispel,
                           V1_caster_id,
                           V1_target_id,
                           V1_skill_fid,
                           V1_target_changes}
                              <- V0_buff_play_list2]))/binary,
      (length(V0_fighter_status_list)):16/little,
      (list_to_binary([<<V1_id:16/little,
                         V1_hp:32/signed-little, V1_tmp_hp_max:32/signed-little,
                         V1_mp:32/signed-little, V1_hp_max:32/signed-little,
                         V1_mp_max:32/signed-little, V1_is_die:8/little,
                         V1_is_die_disappear:8/little, V1_pos:8/little,
                         V1_order:8/little, V1_is_escape:8/little>>
                       || {V1_id,
                           V1_hp,
                           V1_tmp_hp_max,
                           V1_mp,
                           V1_hp_max,
                           V1_mp_max,
                           V1_is_die,
                           V1_is_die_disappear,
                           V1_pos,
                           V1_order,
                           V1_is_escape}
                              <- V0_fighter_status_list]))/binary,
      V0_combat_result:8/little, V0_guide:16/little,
      V0_time:8/little,
      (length(V0_fighter_changes)):16/little,
      (list_to_binary([<<V1_id:16/little,
                         (length(V1_self_changes)):16/little,
                         (list_to_binary([<<V2_change_type:8/little,
                                            V2_change_val:32/signed-little,
                                            V2_other_val:32/signed-little>>
                                          || {V2_change_type,
                                              V2_change_val,
                                              V2_other_val}
                                                 <- V1_self_changes]))/binary>>
                       || {V1_id, V1_self_changes}
                              <- V0_fighter_changes]))/binary,
      V0_summon_num:8/little, V0_use_item_num:8/little,
      (length(V0_skill_cooldown_list)):16/little,
      (list_to_binary([<<V1_skill_id:32/little,
                         V1_cd_left:16/little>>
                       || {V1_skill_id, V1_cd_left}
                              <- V0_skill_cooldown_list]))/binary,
      (length(V0_skill_cooldown_list_pet)):16/little,
      (list_to_binary([<<V1_skill_id:32/little,
                         V1_cd_left:16/little>>
                       || {V1_skill_id, V1_cd_left}
                              <- V0_skill_cooldown_list_pet]))/binary,
      (length(V0_backup_pets)):16/little,
      (list_to_binary([<<V1_id:32/little,
                         V1_base_id:32/little, V1_can_summon:8/little,
                         (protocol:pack(string, V1_name))/binary,
                         V1_lev:8/little>>
                       || {V1_id, V1_base_id, V1_can_summon, V1_name, V1_lev}
                              <- V0_backup_pets]))/binary,
      (length(V0_backup_childs)):16/little,
      (list_to_binary([<<V1_id:32/little,
                         V1_base_id:32/little, V1_can_summon:8/little,
                         (protocol:pack(string, V1_name))/binary,
                         V1_lev:8/little, V1_hungry:32/little>>
                       || {V1_id,
                           V1_base_id,
                           V1_can_summon,
                           V1_name,
                           V1_lev,
                           V1_hungry}
                              <- V0_backup_childs]))/binary>>.

