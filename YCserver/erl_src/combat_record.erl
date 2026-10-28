-file("src/mod/combat/combat_record.erl", 1).

-module(combat_record).

-behaviour(gen_server).

-export([add_buffer/2,
         get_buffer/0,
         save/1,
         save/3,
         delete/1,
         replay/2,
         replay_next/1,
         replay_end/0,
         like/2,
         share/1,
         collect/2,
         abandon/2,
         push/2,
         fetch/1,
         fetch_replay/1,
         cite/1,
         uncite/1,
         list_rank/2,
         list_system/2,
         gm/1,
         push_like/1,
         cast/1,
         info/1,
         fetch_cross/1,
         call/1,
         do_list/2,
         store/1,
         del/1,
         sum_sys/0,
         gm_sum/2,
         gm_del/1,
         rpc_add_screen_msg/4,
         update_screen_msg/3]).

-export([start_link/0]).

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

-file("src/mod/combat/combat_record.erl", 48).

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

-file("src/mod/combat/combat_record.erl", 49).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/combat/combat_record.erl", 50).

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

-file("src/mod/combat/combat_record.erl", 51).

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

-file("src/mod/combat/combat_record.erl", 52).

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

-file("src/mod/combat/combat_record.erl", 53).

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

-file("src/mod/combat/combat_record.erl", 54).

-file("inc/qualifying.hrl", 1).

-record(m_qualifying,
        {rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         update_time = 0,
         day_win = 0,
         day_log = [],
         sign_type = 0,
         win_flag = 0,
         win_five_flag = 0}).

-record(qualifying_role_mark,
        {id = {0, "", 0},
         ver = 4,
         name = "",
         rank_lev = 0,
         rank_type = 0,
         rank_point = 1000,
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         thumb_up = 0,
         thumb_up_other = 0,
         day_flag = 0,
         day_win = 0,
         day_win_streak = 0,
         season_max_rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         season_win_streak = 0,
         season_max_win_streak = 0,
         week_flag = 0,
         week_max_rank_point = 0,
         up_ranklev_reward = []}).

-record(qualifying_role,
        {id = {0, "", 0},
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         fc = 0,
         rank_lev = 1,
         rank_point = 1000,
         looks = [],
         type = 1,
         times = 1,
         point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_team,
        {ids = [],
         origin_team = [],
         rank_point = 1,
         point = 1,
         match_time = 0,
         reward_point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_rank_data,
        {lev = 1,
         max_lev = 1,
         point = 0,
         need_point = 200,
         rank_type = 0,
         lev_name = "",
         gain = [],
         five_gain = [],
         rank_type_name = [],
         uplev_reward = 0}).

-record(qualifying_zone_role,
        {id = {0, "", 0},
         name = "",
         is_online = 1,
         zone_pid,
         pid,
         zone_id = 0}).

-record(qualifying_season_data,
        {ver = 1,
         id = 1 :: pos_integer(),
         end_time = 0,
         count = 0,
         champion_list = []}).

-file("src/mod/combat/combat_record.erl", 55).

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

-file("src/mod/combat/combat_record.erl", 56).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
        {ver = 4,
         dun_id = 0,
         battle_id = 0,
         cards = [],
         unit_rewards = [],
         unit_rewarded = 0}).

-record(dungeon_base,
        {id = 0,
         name = "",
         type = 2,
         need_num = 1,
         cond_enter = [],
         cond_loss = [],
         cross_cond_enter = [],
         cross_cond_loss = [],
         exit_pos = last ::
             last |
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         battle_name_list = [],
         lev_interval = 0,
         unit_list = [],
         lev_max = 0,
         team_dungeon = 0}).

-record(dungeon_role_info,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         score_list = [] :: [tuple()]}).

-record(dungeon_unit_count, {id = 0, num = 0}).

-record(dungeon_score,
        {id = 0,
         score = 0 :: non_neg_integer(),
         grade = 1 :: pos_integer()}).

-record(dungeon_lord_data,
        {unit_id = 0,
         id = 0,
         floor = 0,
         map_id = 0,
         is_lord = 0,
         msg = ""}).

-record(dungeon_lord,
        {key = {0, 0},
         dun_id = 0,
         floor = 0,
         lords = [],
         ranks = []}).

-record(dungeon_lord_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         looks = []}).

-record(dungeon_rank_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         looks = [],
         up = 1,
         rank = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0,
         msg1 = "",
         msg2 = "",
         msg3 = ""}).

-record(dungeon_first,
        {key = {0, 0}, dun_id = 0, floor = 0, roles = []}).

-record(dungeon_first_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer()}).

-record(dungeon_reward_data,
        {id = 0,
         floor = 0,
         type = 0,
         item_list = [],
         title = "",
         msg = "",
         cast_msg = ""}).

-record(dungeon_team,
        {id = {0, "", 0} :: tuple(),
         leader :: undefined | tuple(),
         members = [] :: list(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         kicked = [] :: list()}).

-record(dungeon_enlistment,
        {id = {0, "", 0} :: tuple(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         leader :: undefined | tuple()}).

-record(dungeon_mate,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         team_id = {0, "", 0} :: tuple(),
         matched = 0 :: non_neg_integer(),
         join_time = 0 :: non_neg_integer(),
         origin_ids = [] :: list()}).

-record(dungeon_invitation,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         team_id = {0, "", 0},
         dun_id = 0,
         dun_name = "",
         time = 0}).

-record(dungeon_card,
        {item_id = 0,
         item_num = 0,
         announce = 0,
         selected = 0}).

-file("src/mod/combat/combat_record.erl", 57).

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

-file("src/mod/combat/combat_record.erl", 58).

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

-file("src/mod/combat/combat_record.erl", 59).

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

-file("src/mod/combat/combat_record.erl", 60).

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

-file("src/mod/combat/combat_record.erl", 61).

-file("/usr/local/lib/erlang/lib/stdlib-2.1/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/combat/combat_record.erl", 62).

-record(state, {rank_ref :: undefined | reference()}).

call(Info) -> gen_server:call(combat_record, Info).

cast(Info) -> gen_server:cast(combat_record, Info).

info(Info) -> combat_record ! Info.

del(frames) ->
    del_frames(combat_record_system,
               ets:tab2list(combat_record_system)),
    del_frames(combat_record_public,
               ets:tab2list(combat_record_public)),
    del_frames(combat_record_tournament,
               ets:tab2list(combat_record_tournament)),
    del_frames(combat_record_gods_duel_final,
               ets:tab2list(combat_record_gods_duel_final)),
    del_frames(combat_record_gods_challenge,
               ets:tab2list(combat_record_gods_challenge)),
    del_frames(combat_record_provocation,
               ets:tab2list(combat_record_provocation)).

del_frames(_Tab, []) -> ok;
del_frames(Tab,
           [#combat_record{id = Id, frames = []} | T]) ->
    ets:delete(Tab, Id),
    dets:delete(Tab, Id),
    del_frames(Tab, T);
del_frames(Tab, [_ | T]) -> del_frames(Tab, T).

add_buffer(Code, Data) ->
    case mapping:module(game_server, Code) of
        {ok, _Auth, _Caller, Proto, _ModName} ->
            case Proto:pack(srv, Code, Data) of
                {ok, Bin} ->
                    case get(combat_record) of
                        L when is_list(L) -> put(combat_record, [Bin | L]);
                        _ -> put(combat_record, [Bin])
                    end;
                {error, Reason} ->
                    logger:error("打包数据出错[Code:~w][Reason:~w]",
                                 [Code, Reason],
                                 combat_record,
                                 119)
            end;
        {error, _Code} ->
            logger:error("模块影射失败[~w]:~w",
                         [Code, Data],
                         combat_record,
                         122)
    end.

get_buffer() ->
    case get(combat_record) of
        L when is_list(L) ->
            CombatType = get(combat_type),
            #combat_context{round = Round, origin_atk = AtkList,
                            origin_dfd = DfdList} =
                combat_cache:get_context(),
            {AtkName, AtkSex, AtkClasses} = case catch
                                                     lists:keyfind(1,
                                                                   #fighter.is_leader,
                                                                   AtkList)
                                                of
                                                #fighter{name = AtkN,
                                                         sex = AtkX,
                                                         classes = AtkC} ->
                                                    {AtkN, AtkX, AtkC};
                                                _FailLeader ->
                                                    logger:error("找不到战斗队长 ~w, ~w",
                                                                 [_FailLeader,
                                                                  AtkList],
                                                                 combat_record,
                                                                 134),
                                                    {"", 0, 0}
                                            end,
            {DfdName, DfdSex, DfdClasses} = case catch
                                                     lists:keyfind(1,
                                                                   #fighter.is_leader,
                                                                   DfdList)
                                                of
                                                #fighter{name = TDfdN,
                                                         base_id = BaseId,
                                                         sex = DfdX,
                                                         classes = DfdC}
                                                    when CombatType == 21 ->
                                                    DfdN = case
                                                               unit_data:get(BaseId)
                                                               of
                                                               #unit_data{desc =
                                                                              DfdN2} ->
                                                                   DfdN2;
                                                               _ -> TDfdN
                                                           end,
                                                    {DfdN, DfdX, DfdC};
                                                #fighter{name = DfdN,
                                                         sex = DfdX,
                                                         classes = DfdC} ->
                                                    {DfdN, DfdX, DfdC};
                                                _ -> {"", 0, 0}
                                            end,
            Atk = [#combat_record_fighter{id = Rid, name = Name,
                                          classes = Classes, sex = Sex,
                                          lev = Lev, group = Group}
                   || #fighter{origin_id = Rid, name = Name,
                               classes = Classes, sex = Sex, lev = Lev,
                               type = FighterType, group = Group}
                          <- AtkList,
                      FighterType =:= 1 orelse FighterType =:= 4],
            Dfd = [#combat_record_fighter{id = Rid, name = Name,
                                          classes = Classes, sex = Sex,
                                          lev = Lev, group = Group}
                   || #fighter{origin_id = Rid, name = Name,
                               classes = Classes, sex = Sex, lev = Lev,
                               type = FighterType, group = Group}
                          <- DfdList,
                      FighterType =:= 1 orelse FighterType =:= 4],
            Fighters = Atk ++ Dfd,
            AvgLev = lists:sum([Lev
                                || #combat_record_fighter{lev = Lev}
                                       <- Fighters])
                         div max(1, length(Fighters)),
            L1 = lists:reverse(L),
            L2 = zlib:compress(L1),
            ScreenMsg = case get(combat_record_screen_msg) of
                            _ScreenMsg when is_list(_ScreenMsg) -> _ScreenMsg;
                            _ -> []
                        end,
            logger:debug("弹幕信息:~w",
                         [ScreenMsg],
                         combat_record,
                         159),
            #combat_record{combat_type = CombatType, frames = L2,
                           atk_name = AtkName, atk_sex = AtkSex,
                           atk_classes = AtkClasses, dfd_name = DfdName,
                           dfd_sex = DfdSex, dfd_classes = DfdClasses,
                           time = date:unixtime(), fighters = Fighters,
                           avg_lev = AvgLev, round = Round,
                           screen_msg = ScreenMsg};
        _ -> #combat_record{}
    end.

save(Type, Id, Record) ->
    case cross:is_center() orelse
             big_world:is_big_world_center()
        of
        true -> ok;
        _ ->
            logger:debug("保存录像 ~w", [Id], combat_record, 183),
            NewRecord = Record#combat_record{id = {Type, Id},
                                             type = Type},
            store(NewRecord)
    end.

save(#combat{type = Type})
    when Type == 8 orelse
             Type == 3 orelse
                 Type == 13 orelse
                     Type =:= 71 orelse
                         Type =:= 1 orelse
                             Type =:= 2 orelse
                                 Type =:= 4 orelse
                                     Type =:= 9 orelse
                                         Type =:= 10 orelse
                                             Type =:= 14 orelse
                                                 Type =:= 18 orelse
                                                     Type =:= 19 orelse
                                                         Type =:= 20 orelse
                                                             Type =:= 22 orelse
                                                                 Type =:= 27
                                                                     orelse
                                                                     Type =:= 28
                                                                         orelse
                                                                         Type
                                                                             =:=
                                                                             29
                                                                             orelse
                                                                             Type
                                                                                 =:=
                                                                                 30
                                                                                 orelse
                                                                                 Type
                                                                                     =:=
                                                                                     33
                                                                                     orelse
                                                                                     Type
                                                                                         =:=
                                                                                         34
                                                                                         orelse
                                                                                         Type
                                                                                             =:=
                                                                                             35
                                                                                             orelse
                                                                                             Type
                                                                                                 =:=
                                                                                                 37
                                                                                                 orelse
                                                                                                 Type
                                                                                                     =:=
                                                                                                     38
                                                                                                     orelse
                                                                                                     Type
                                                                                                         =:=
                                                                                                         39
                                                                                                         orelse
                                                                                                         Type
                                                                                                             =:=
                                                                                                             42
                                                                                                             orelse
                                                                                                             Type
                                                                                                                 =:=
                                                                                                                 55
                                                                                                                 orelse
                                                                                                                 Type
                                                                                                                     =:=
                                                                                                                     57 ->
    ok;
save(Combat) ->
    logger:debug("录像保存", [], combat_record, 222),
    case cross:is_center() orelse
             big_world:is_big_world_center()
        of
        true ->
            case Combat of
                #combat{type = CombatType} ->
                    logger:debug("战斗类型~w",
                                 [CombatType],
                                 combat_record,
                                 227),
                    Label = case cross:is_center() of
                                true -> cross;
                                _ -> big_world
                            end,
                    case lists:member(CombatType,
                                      [43, 40, 58, 110, 111, 113, 71])
                        of
                        true -> ok;
                        false -> do_save(Label, Combat)
                    end;
                _ -> ignore
            end;
        _ ->
            case Combat of
                #combat{type = CombatType} ->
                    logger:debug("战斗类型~w",
                                 [CombatType],
                                 combat_record,
                                 243),
                    case lists:member(CombatType,
                                      [43, 40, 58, 110, 111, 113, 71])
                        of
                        true -> ok;
                        false -> do_save(Combat)
                    end;
                #{record := #combat_record{combat_type = CombatType}} ->
                    logger:debug("战斗类型~w",
                                 [CombatType],
                                 combat_record,
                                 250),
                    case lists:member(CombatType, [43]) of
                        true -> ok;
                        false -> do_save(Combat)
                    end;
                _ -> do_save(Combat)
            end
    end.

do_save(Combat) -> do_save(local, Combat).

do_save(Label,
        Combat = #combat{winner = Winner,
                         start_time = StartTime, loser = Loser,
                         type = TCombatType,
                         start_args =
                             StartArgs = #combat_start_args{ext_args =
                                                                ExtArgs}}) ->
    logger:debug("战斗类型~w",
                 [TCombatType],
                 combat_record,
                 263),
    case [Rid
          || #fighter{origin_id = Rid, type = 1, lev = Lev}
                 <- Winner ++ Loser,
             Lev >= 40]
        of
        Ids0 = [_ | _] when TCombatType =/= 100 ->
            Ids = lists:usort(Ids0),
            Record = #combat_record{time = Time} = get_buffer(),
            case env:get(combat_record_id) of
                TRecId when is_integer(TRecId) -> ok;
                _ -> env:set(combat_record_id, 1)
            end,
            RecId1 = {env:update_counter(combat_record_id, 1),
                      env:get(platform),
                      env:get(zone_id)},
            FRoleList = [F
                         || F = #fighter{type = 1} <- Winner ++ Loser],
            CombatType = case TCombatType of
                             11 ->
                                 case [Mdun
                                       || #fighter{m_dungeon = Mdun, type = 1}
                                              <- FRoleList]
                                     of
                                     [#m_dungeon{dun_id = 10085} | _] -> 54;
                                     _ -> TCombatType
                                 end;
                             _ -> TCombatType
                         end,
            {Platform, ZoneId} = case lists:keyfind(1,
                                                    #fighter.type,
                                                    FRoleList)
                                     of
                                     #fighter{platform = TPlatform,
                                              zone_id = TZoneId} ->
                                         {TPlatform, TZoneId};
                                     _ -> {env:get(platform), env:get(zone_id)}
                                 end,
            RecId = case RecId1 of
                        {IRecId1, _, _} -> {IRecId1, Platform, ZoneId};
                        _ -> RecId1
                    end,
            Record1 = Record#combat_record{id = {9, RecId},
                                           type = 9, cited = length(Ids),
                                           combat_type = CombatType},
            NewLabel = case Label of
                           cross ->
                               cross:cast(Platform,
                                          ZoneId,
                                          combat_record,
                                          store,
                                          [Record1]),
                               cross:cast(Platform,
                                          ZoneId,
                                          combat_record,
                                          info,
                                          [{update_role, Ids, {9, RecId}}]),
                               {Label, Platform, ZoneId};
                           big_world ->
                               big_world:cast(Platform,
                                              ZoneId,
                                              combat_record,
                                              store,
                                              [Record1]),
                               big_world:cast(Platform,
                                              ZoneId,
                                              combat_record,
                                              info,
                                              [{update_role, Ids, {9, RecId}}]),
                               {Label, Platform, ZoneId};
                           _ ->
                               combat_record ! {update_role, Ids, {9, RecId}},
                               store(Record1),
                               Label
                       end,
            case CombatType of
                60 ->
                    Wave = get(glory_id),
                    case ExtArgs of
                        [FirstId | _] when Wave > FirstId ->
                            [glory_mgr ! {update_record, WaveId, {9, RecId}}
                             || WaveId <- lists:seq(FirstId, Wave)];
                        [FirstId | _] ->
                            case [Rid
                                  || #fighter{origin_id = Rid, type = 1,
                                              lev = Lev}
                                         <- Winner,
                                     Lev >= 40]
                                of
                                [_ | _] ->
                                    glory_mgr !
                                        {update_record, FirstId, {9, RecId}};
                                _ -> ignore
                            end;
                        _ -> ignore
                    end;
                61 ->
                    case [1 || #fighter{type = 1} <- Winner] of
                        [_ | _] ->
                            spirit_treasure_mgr !
                                {update_record, ExtArgs, {9, RecId}};
                        _ -> ignore
                    end;
                62 ->
                    CurrentWave = get(spirit_treasure_wave),
                    case CurrentWave > 1 of
                        true ->
                            spirit_treasure_mgr !
                                {update_record, ExtArgs, {9, RecId}};
                        _ -> ignore
                    end;
                69 ->
                    case [1 || #fighter{type = 1} <- Winner] of
                        [_ | _] ->
                            oracle_treasure_mgr !
                                {update_record, ExtArgs, {9, RecId}};
                        _ -> ignore
                    end;
                70 ->
                    CurrentWave = get(oracle_treasure_wave),
                    case CurrentWave > 1 of
                        true ->
                            oracle_treasure_mgr !
                                {update_record, ExtArgs, {9, RecId}};
                        _ -> ignore
                    end;
                114 ->
                    logger:debug("===============", [], combat_record, 361),
                    case lists:keyfind(state_name, 1, ExtArgs) of
                        {_, fight_out} ->
                            case lists:keyfind(open_mode, 1, ExtArgs) of
                                {_, cross} ->
                                    logger:debug("===============",
                                                 [],
                                                 combat_record,
                                                 366),
                                    cross:cast(gold_league_mgr,
                                               info,
                                               [{update_record,
                                                 {9, RecId},
                                                 ExtArgs}]);
                                _ ->
                                    gold_league_mgr !
                                        {update_record, {9, RecId}, ExtArgs}
                            end;
                        _ -> ignore
                    end;
                63 ->
                    logger:debug("宝阁战斗录像处理", [], combat_record, 375),
                    Now = date:unixtime(),
                    UseTime = Now - StartTime,
                    exquisite_shelf_mgr:info({update_record,
                                              {9, RecId},
                                              UseTime,
                                              ExtArgs});
                _ -> ignore
            end,
            logger:debug("钻石联赛保存录像 ~w",
                         [ExtArgs],
                         combat_record,
                         382),
            save_marvelous(NewLabel,
                           Combat#combat{type = CombatType},
                           #combat_record_marvelous{id = {9, RecId},
                                                    time = Time,
                                                    combat_type = CombatType}),
            guild_league_role:live_record(Record1, StartArgs);
        _ -> ok
    end;
do_save(_Label,
        Stuff = #{ids := Ids0,
                  record :=
                      Record = #combat_record{combat_type = CombatType,
                                              time = Time},
                  is_marvel := IsMarvel}) ->
    logger:debug("钻石联赛保存录像 ~w",
                 [Stuff],
                 combat_record,
                 388),
    case [Rid || Rid <- Ids0, role_misc:is_local_role(Rid)]
        of
        [] ->
            case Stuff of
                #{combat_type := 111, match_id := CombatRecordId,
                  record := Record} ->
                    logger:debug("===============", [], combat_record, 394),
                    Platform = env:get(platform),
                    ZoneId = env:get(zone_id),
                    Record2 = Record#combat_record{id =
                                                       {13,
                                                        {CombatRecordId,
                                                         Platform,
                                                         ZoneId}},
                                                   type = 13, cited = 1},
                    store(Record2);
                #{combat_type := 71, match_id := CombatRecordId,
                  record := Record} ->
                    Platform = env:get(platform),
                    ZoneId = env:get(zone_id),
                    Record3 = Record#combat_record{id =
                                                       {23,
                                                        {CombatRecordId,
                                                         Platform,
                                                         ZoneId}},
                                                   type = 23, cited = 1},
                    store(Record3);
                _ -> ok
            end;
        Ids ->
            RecId = {env:update_counter(combat_record_id, 1),
                     env:get(platform),
                     env:get(zone_id)},
            Record1 = Record#combat_record{id = {9, RecId},
                                           type = 9, cited = length(Ids0)},
            store(Record1),
            case IsMarvel of
                true ->
                    M = #combat_record_marvelous{id = {9, RecId},
                                                 time = Time,
                                                 combat_type = CombatType},
                    case Stuff of
                        #{cross := true} ->
                            logger:debug("钻石联赛保存:~w", [M], combat_record, 427),
                            big_world:cast(combat_record_cross,
                                           cast,
                                           [{store_marvelous, M}]),
                            [cross:cast(TPlatform,
                                        TZoneId,
                                        combat_record,
                                        info,
                                        [{update_role, [TId], {9, RecId}}])
                             || TId = {_, TPlatform, TZoneId} <- Ids0];
                        _ ->
                            store(M),
                            combat_record ! {update_role, Ids, {9, RecId}}
                    end;
                _ ->
                    case Stuff of
                        #{cross := true} ->
                            [cross:cast(TPlatform,
                                        TZoneId,
                                        combat_record,
                                        info,
                                        [{update_role, [TId], {9, RecId}}])
                             || TId = {_, TPlatform, TZoneId} <- Ids0];
                        _ -> combat_record ! {update_role, Ids, {9, RecId}}
                    end
            end,
            {Platform, ZoneId} = case Stuff of
                                     #{pz := {TP, TZ}} -> {TP, TZ};
                                     _ -> {env:get(platform), env:get(zone_id)}
                                 end,
            logger:debug("武道会保存录像", [], combat_record, 449),
            case Stuff of
                #{combat_type := 40, match_id := MatchId} ->
                    Record2 = Record#combat_record{id =
                                                       {12,
                                                        {MatchId,
                                                         Platform,
                                                         ZoneId}},
                                                   type = 12, cited = 0},
                    store(Record2);
                #{combat_type := 58, match_id := MatchId} ->
                    Record2 = Record#combat_record{id =
                                                       {12,
                                                        {MatchId,
                                                         Platform,
                                                         ZoneId}},
                                                   type = 12, cited = 0},
                    store(Record2);
                #{combat_type := 111, match_id := CombatRecordId} ->
                    logger:debug("===============", [], combat_record, 466),
                    Record2 = Record#combat_record{id =
                                                       {13,
                                                        {CombatRecordId,
                                                         Platform,
                                                         ZoneId}},
                                                   type = 13, cited = 1},
                    store(Record2);
                #{combat_type := 110, match_id := _CombatRecordId} ->
                    logger:debug("===============", [], combat_record, 475),
                    Record2 = Record#combat_record{id = {9, RecId},
                                                   type = 9,
                                                   cited = length(Ids0)},
                    store(Record2);
                #{combat_type := 71, match_id := CombatRecordId} ->
                    Record2 = Record#combat_record{id =
                                                       {23,
                                                        {CombatRecordId,
                                                         Platform,
                                                         ZoneId}},
                                                   type = 23, cited = 1},
                    store(Record2);
                #{combat_type := 114, match_id := CombatRecordId} ->
                    logger:debug("钻石联赛录像保存 ~w",
                                 [{CombatRecordId, Platform, ZoneId}],
                                 combat_record,
                                 491),
                    Record2 = Record#combat_record{id =
                                                       {19,
                                                        {CombatRecordId,
                                                         Platform,
                                                         ZoneId}},
                                                   type = 19,
                                                   cited = length(Ids0)},
                    store(Record2);
                #{combat_type := 115, match_id := CombatRecordId} ->
                    logger:debug("跨服约战录像保存 ~w",
                                 [{CombatRecordId, Platform, ZoneId}],
                                 combat_record,
                                 499),
                    Record2 = Record#combat_record{id =
                                                       {21,
                                                        {CombatRecordId,
                                                         Platform,
                                                         ZoneId}},
                                                   type = 21,
                                                   cited = length(Ids0)},
                    store(Record2);
                _ -> ok
            end
    end;
do_save(_, _Otehr) ->
    logger:debug("战斗录像异常:~w", [_Otehr], combat_record, 510),
    ok.

delete(Id = {9, _}) ->
    ets:delete(combat_record_public, Id),
    dets:delete(combat_record_public, Id),
    ets:delete(combat_record_marvelous, Id),
    dets:delete(combat_record_marvelous, Id);
delete(Id = {12, _}) ->
    ets:delete(combat_record_tournament, Id),
    dets:delete(combat_record_tournament, Id);
delete(Id = {21, _}) ->
    ets:delete(combat_record_provocation, Id),
    dets:delete(combat_record_provocation, Id);
delete(Id) ->
    ets:delete(combat_record_system, Id),
    dets:delete(combat_record_system, Id).

fetch_dets(Id = {9, _}) ->
    case dets:lookup(combat_record_public, Id) of
        [O] -> O;
        _ -> false
    end;
fetch_dets(Id = {12, _}) ->
    case dets:lookup(combat_record_tournament, Id) of
        [O] -> O;
        _ -> false
    end;
fetch_dets(Id = {13, _}) ->
    case dets:lookup(combat_record_gods_duel_final, Id) of
        [O] -> O;
        _ -> false
    end;
fetch_dets(Id = {23, _}) ->
    case dets:lookup(combat_record_gods_challenge, Id) of
        [0] -> 0;
        _ -> false
    end;
fetch_dets(Id = {21, _}) ->
    case dets:lookup(combat_record_provocation, Id) of
        [O] -> O;
        _ -> false
    end;
fetch_dets(Id) ->
    case dets:lookup(combat_record_system, Id) of
        [O] -> O;
        _ -> false
    end.

fetch_replay(Id) ->
    case fetch(Id) of
        #combat_record{frames = []} ->
            case fetch_dets(Id) of
                false -> false;
                D -> combat_ver:do_record(D)
            end;
        R -> R
    end.

replay(#role{m_combat = #m_combat{pid = Pid}}, _Id)
    when is_pid(Pid) ->
    {false, lang:get("战斗中不能看录像")};
replay(#role{link = #link{conn_pid = ConnPid}},
       Id = {_, {_, P, Z}}) ->
    logger:debug("战斗录像id:~w", [Id], combat_record, 580),
    Record = big_world:call(P,
                            Z,
                            combat_record,
                            fetch_replay,
                            [Id]),
    replay(ConnPid, Record);
replay(#role{link = #link{conn_pid = ConnPid}},
       Id = {_, {_, {_, P, Z}}}) ->
    Record = big_world:call(P,
                            Z,
                            combat_record,
                            fetch_replay,
                            [Id]),
    replay(ConnPid, Record);
replay(#role{link = #link{conn_pid = ConnPid}},
       Id = {_, _}) ->
    Record = fetch_replay(Id),
    replay(ConnPid, Record);
replay(ConnPid,
       #combat_record{id = Id, ver = 10, frames = [H | Frames],
                      screen_msg = ScreenMsg}) ->
    acc_replayed(Id),
    sys_conn:send(ConnPid, H),
    erlang:put(combat_record_replay, Frames),
    FirstRound = 1,
    erlang:put(combat_record_replay_screen_msg,
               {FirstRound + 1, ScreenMsg}),
    ok;
replay(ConnPid,
       #combat_record{id = Id, ver = 10,
                      frames = <<Frames/binary>>, screen_msg = ScreenMsg}) ->
    case zlib:uncompress(Frames) of
        <<Len:32/little, H:Len/binary, T/binary>> ->
            acc_replayed(Id),
            sys_conn:send(ConnPid, <<Len:32/little, H/binary>>),
            erlang:put(combat_record_replay, T),
            FirstRound = 1,
            erlang:put(combat_record_replay_screen_msg,
                       {FirstRound, ScreenMsg}),
            ok;
        _ -> {false, lang:get("该录像已失效")}
    end;
replay(_, _Data) -> {false, lang:get("该录像已失效")}.

replay_next(#role{m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    ok;
replay_next(#role{link = #link{conn_pid = ConnPid}}) ->
    logger:debug("播放一下真录像", [], combat_record, 619),
    case erlang:get(combat_record_replay) of
        [H | T] ->
            {ReplyRound, ScreenMsg} = case
                                          erlang:get(combat_record_replay_screen_msg)
                                          of
                                          {Round, _ScreenMsg}
                                              when is_integer(Round) ->
                                              {Round, _ScreenMsg};
                                          _ -> {1, []}
                                      end,
            erlang:put(combat_record_replay_screen_msg,
                       {ReplyRound + 1, ScreenMsg}),
            case lists:keyfind(ReplyRound, 1, ScreenMsg) of
                {_, MsgList} ->
                    logger:debug("播发录像弹幕:~w",
                                 [MsgList],
                                 combat_record,
                                 630),
                    role:link_send(ConnPid, 10770, {MsgList}),
                    ok;
                _ -> ok
            end,
            Frames = do_replay_next([H | T], ConnPid),
            erlang:put(combat_record_replay, Frames);
        <<H:32, T/binary>> ->
            {ReplyRound, ScreenMsg} = case
                                          erlang:get(combat_record_replay_screen_msg)
                                          of
                                          {Round, _ScreenMsg}
                                              when is_integer(Round) ->
                                              {Round, _ScreenMsg};
                                          _ -> {1, []}
                                      end,
            erlang:put(combat_record_replay_screen_msg,
                       {ReplyRound + 1, ScreenMsg}),
            case lists:keyfind(ReplyRound, 1, ScreenMsg) of
                {_, MsgList} ->
                    logger:debug("播发录像弹幕:~w",
                                 [MsgList],
                                 combat_record,
                                 648),
                    role:link_send(ConnPid, 10770, {MsgList}),
                    ok;
                _ -> ok
            end,
            Frames = do_replay_next(<<H:32, T/binary>>, ConnPid),
            erlang:put(combat_record_replay, Frames);
        _ -> ok
    end.

replay_end() -> erlang:put(combat_record_replay, []).

like(Role = #role{id = Id, lev = Lev, name = Name},
     RecId = {_, {_, Platform, ZoneId}}) ->
    case big_world:call(Platform,
                        ZoneId,
                        combat_record,
                        fetch_cross,
                        [RecId])
        of
        #combat_record{likes = Likes} ->
            case lists:member(Id, Likes) of
                true -> {false, lang:get("你已经赞过这个录像了")};
                _ ->
                    Now = date:unixtime(),
                    _PlayTime = var:get_var(Role,
                                            other,
                                            {2072, RecId},
                                            Now),
                    case var:get_var(Role, day_five, 144, 0) of
                        Liked when Liked >= 3 -> {false, lang:get("今天点赞次数已满")};
                        _Liked ->
                            case big_world:call(Platform,
                                                ZoneId,
                                                combat_record,
                                                call,
                                                [{like, Id, RecId}])
                                of
                                ok ->
                                    ExpMode = 3203,
                                    G1 = case levup_data:get_exp({ExpMode, Lev})
                                             of
                                             #{coin := Coin, exp := Exp} ->
                                                 [{90000, Coin}, {90010, Exp}];
                                             _ -> []
                                         end,
                                    G2 = case pet:get_war_pet(Role) of
                                             {ok, #pet{lev = PetLev}} ->
                                                 case
                                                     levup_data:get_exp({ExpMode,
                                                                         PetLev})
                                                     of
                                                     #{pet_exp := PetExp} ->
                                                         [{90005, PetExp} | G1];
                                                     _ -> G1
                                                 end;
                                             _ -> G1
                                         end,
                                    G4 = case util:rand(1, 100) =< 10 of
                                             true ->
                                                 #{item_id := Item,
                                                   item_num := ItemNum,
                                                   announce := Ann} =
                                                     util:rand_list(quest_guild_data:get_irrigate_reward(),
                                                                    item_weight),
                                                 case Ann of
                                                     1 ->
                                                         AnnStr =
                                                             notice:format(lang:get("~ts观看了大神的战斗录像，点赞的时候意外在大神们脚下捡到一件~ts{face_1, 4}"),
                                                                           [{role_2,
                                                                             Name},
                                                                            {item_2,
                                                                             Item}]),
                                                         notice:cast(all,
                                                                     5,
                                                                     AnnStr);
                                                     _ -> ok
                                                 end,
                                                 [{Item, 0, ItemNum}];
                                             _ -> []
                                         end,
                                    NewGain = format:val_to_gain(G2 ++ G4),
                                    case role_gain:do_notice(NewGain, Role) of
                                        {ok, Role2} ->
                                            NRole = var:acc_var(Role2,
                                                                day_five,
                                                                144),
                                            push_like(NRole),
                                            {ok, NRole};
                                        {false, _} ->
                                            {false, lang:get("背包空间已满")}
                                    end;
                                {false, Reason} -> {false, Reason};
                                _ -> {false, lang:get("系统繁忙")}
                            end
                    end
            end;
        _ -> {false, lang:get("录像不存在")}
    end.

push_like(Role) ->
    Online = var:get_var(Role, day_five, 143, 0),
    Liked = var:get_var(Role, day_five, 144, 0),
    role:pack_send(Role, 10757, {Online, Liked}).

share(RecId = {_, {_, Platform, ZoneId}}) ->
    big_world:cast(Platform,
                   ZoneId,
                   combat_record,
                   info,
                   [{acc_shared, RecId}]).

collect(#role{id = Id},
        RecId = {_, {_, Platform, ZoneId}}) ->
    case combat_record_cross:fetch(RecId) of
        #combat_record{} ->
            case lookup_combat_record_role(Id) of
                {true,
                 R = #combat_record_role{collection = Collection0}} ->
                    case lists:member(RecId, Collection0) of
                        true -> {false, lang:get("录像你已收藏过了")};
                        _ ->
                            case available_id(Collection0) of
                                Collection when length(Collection) >= 10 ->
                                    {false, lang:get("收藏夹满了")};
                                Collection ->
                                    case big_world:cast(Platform,
                                                        ZoneId,
                                                        combat_record,
                                                        call,
                                                        [{collect, Id, RecId}])
                                        of
                                        ok ->
                                            store(R#combat_record_role{collection
                                                                           =
                                                                           [RecId
                                                                            | Collection]}),
                                            ok;
                                        Result -> Result
                                    end
                            end
                    end;
                _ ->
                    case big_world:cast(Platform,
                                        ZoneId,
                                        combat_record,
                                        call,
                                        [{collect, Id, RecId}])
                        of
                        ok ->
                            store(#combat_record_role{id = Id,
                                                      collection = [RecId]}),
                            ok;
                        Result -> Result
                    end
            end;
        _ -> {false, lang:get("录像不存在")}
    end.

abandon(#role{id = Id}, RecId) ->
    case lookup_combat_record_role(Id) of
        {true,
         R = #combat_record_role{collection = Collection}} ->
            case lists:member(RecId, Collection) of
                true ->
                    store(R#combat_record_role{collection =
                                                   Collection -- [RecId]}),
                    minus_citeds([{RecId, 1}]),
                    ok;
                _ -> {false, lang:get("没有收藏该录像呢")}
            end;
        _ -> {false, lang:get("没有收藏该录像呢")}
    end.

push(Role = #role{id = Id}, Cmd = 10747) ->
    L = list(Id, recent),
    role:link_send(Role, Cmd, {L});
push(Role = #role{id = Id}, Cmd = 10748) ->
    L = list(Id, collection),
    role:link_send(Role, Cmd, {L});
push(Role = #role{id = Id}, Cmd = 10749) ->
    Ids = ets:select(combat_record_marvelous,
                     [{#combat_record_marvelous{id = '$1', _ = '_'},
                       [],
                       ['$1']}]),
    L = do_list(Id, Ids),
    role:link_send(Role, Cmd, {L}).

fetch(Id = {9, _}) ->
    case ets:lookup(combat_record_public, Id) of
        [O] -> O;
        _ -> false
    end;
fetch(Id = {12, _}) ->
    case ets:lookup(combat_record_tournament, Id) of
        [O] -> O;
        _ -> false
    end;
fetch(Id = {13, _}) ->
    case ets:lookup(combat_record_gods_duel_final, Id) of
        [O] -> O;
        _ -> false
    end;
fetch(Id = {23, _}) ->
    case ets:lookup(combat_record_gods_challenge, Id) of
        [O] -> O;
        _ -> false
    end;
fetch(Id = {21, _}) ->
    case ets:lookup(combat_record_provocation, Id) of
        [O] -> O;
        _ -> false
    end;
fetch(Id) ->
    case ets:lookup(combat_record_system, Id) of
        [O] -> O;
        _ -> false
    end.

fetch_cross(Id) ->
    case fetch(Id) of
        Data = #combat_record{} ->
            Data#combat_record{frames = []};
        Data -> Data
    end.

sum_sys() ->
    sum_sys(ets:select(combat_record_system,
                       [{#combat_record{type = '$1', _ = '_'}, [], ['$1']}]),
            []).

sum_sys([], List) -> List;
sum_sys([CombatType | T], List) ->
    NewList = case lists:keyfind(CombatType, 1, List) of
                  {_, Num} ->
                      lists:keyreplace(CombatType,
                                       1,
                                       List,
                                       {CombatType, Num + 1});
                  _ -> [{CombatType, 1} | List]
              end,
    sum_sys(T, NewList).

cite(Id) -> combat_record ! {cite, Id}.

uncite(Ids) -> combat_record ! {minus_citeds, Ids}.

list_rank(Id, week) ->
    L = ets:tab2list(combat_record_rank_week),
    do_list_rank(week, Id, L);
list_rank(Id, _) ->
    L = ets:tab2list(combat_record_rank),
    do_list_rank(history, Id, L).

list_system(Rid, Type) ->
    Fun = fun (Record = #combat_record{likes = Likes}) ->
                  Likable = case lists:member(Rid, Likes) of
                                true -> 0;
                                _ -> 1
                            end,
                  {Likable, Record}
          end,
    [Fun(R)
     || R = #combat_record{}
            <- ets:match_object(combat_record_system,
                                #combat_record{type = Type, _ = '_'})].

acc_replayed(Id = {9, _}) ->
    do_acc_replayed(combat_record_public, Id);
acc_replayed(Id = {12, _}) ->
    do_acc_replayed(combat_record_tournament, Id);
acc_replayed(Id = {13, _}) ->
    do_acc_replayed(combat_record_gods_duel_final, Id);
acc_replayed(Id = {23, _}) ->
    do_acc_replayed(combat_record_gods_challenge, Id);
acc_replayed(Id = {21, _}) ->
    do_acc_replayed(combat_record_provocation, Id);
acc_replayed(Id) ->
    do_acc_replayed(combat_record_system, Id).

do_acc_replayed(_Tab,
                Id = {_, {_, Platform, ZoneId}}) ->
    big_world:cast(Platform,
                   ZoneId,
                   combat_record,
                   info,
                   [{acc_replayed, Id}]);
do_acc_replayed(_Tab,
                Id = {_, {_, {_, Platform, ZoneId}}}) ->
    big_world:cast(Platform,
                   ZoneId,
                   combat_record,
                   info,
                   [{acc_replayed, Id}]);
do_acc_replayed(_Tab, Id) -> info({acc_replayed, Id}).

gm(clear) -> combat_record ! clear;
gm(clear_arena) -> combat_record ! clear_arena;
gm(clear_out_zone) -> combat_record ! clear_out_zone;
gm(clear_out_role) ->
    [{dets:delete(combat_record_role, Id),
      ets:delete(combat_record_role, Id)}
     || [Id]
            <- ets:match(combat_record_role,
                         #combat_record_role{id = '$1', _ = '_'}),
        role_misc:is_local_role(Id) =:= false];
gm(compress) ->
    ets:insert(combat_record_public,
               [R#combat_record{frames =
                                    zlib:compress(erlang:list_to_binary(F))}
                || R = #combat_record{frames = F = [_ | _]}
                       <- ets:tab2list(combat_record_public)]),
    ets:to_dets(combat_record_public, combat_record_public),
    ets:insert(combat_record_system,
               [R#combat_record{frames =
                                    zlib:compress(erlang:list_to_binary(F))}
                || R = #combat_record{frames = F = [_ | _]}
                       <- ets:tab2list(combat_record_system)]),
    ets:to_dets(combat_record_system, combat_record_system).

gm_sum(time, Time) ->
    Ms = [{{combat_record,
            '$1',
            '_',
            '_',
            '_',
            '_',
            '_',
            '$2',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_'},
           [{'=<', '$2', {const, Time}}],
           ['$1']}],
    ets:select(combat_record_public, Ms);
gm_sum(time_num, Time) -> length(gm_sum(time, Time));
gm_sum(no_collect, Time) ->
    Ids = gm_sum(time, Time),
    Ms = [{{combat_record_role, '_', '_', '$1'},
           [],
           ['$1']}],
    TCollIds = ets:select(combat_record_role, Ms),
    CollIds = lists:append(TCollIds),
    Ids -- CollIds;
gm_sum(no_collect_num, Time) ->
    length(gm_sum(no_collect, Time));
gm_sum(clear, Time) ->
    Ids = gm_sum(no_collect, Time),
    gm_del(Ids);
gm_sum(tournament, Time) ->
    Ms = [{{combat_record,
            '$1',
            '_',
            '_',
            '_',
            '_',
            '_',
            '$2',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_',
            '_'},
           [{'=<', '$2', {const, Time}}],
           ['$1']}],
    Ids = ets:select(combat_record_tournament, Ms),
    [ets:delete(combat_record_tournament, Id) || Id <- Ids],
    ets:to_dets(combat_record_tournament,
                combat_record_tournament).

gm_del([]) ->
    ets:to_dets(combat_record_public, combat_record_public);
gm_del([Id | T]) ->
    ets:delete(combat_record_public, Id),
    gm_del(T).

start_link() ->
    gen_server:start_link({local, combat_record},
                          combat_record,
                          [],
                          []).

init([]) ->
    logger:info("启动中...", [], combat_record, 957),
    State = #state{},
    case env:get(combat_record_id) of
        RecId when is_integer(RecId) -> ok;
        _ -> env:set(combat_record_id, 1)
    end,
    dets:open_file(combat_record_system,
                   [{file, "./dets/combat_record_system.dets"},
                    {keypos, #combat_record.id}]),
    dets:open_file(combat_record_public,
                   [{file, "./dets/combat_record_public.dets"},
                    {keypos, #combat_record.id}]),
    dets:open_file(combat_record_tournament,
                   [{file, "./dets/combat_record_tournament.dets"},
                    {keypos, #combat_record.id}]),
    dets:open_file(combat_record_gods_duel_final,
                   [{file, "./dets/combat_record_gods_duel_final.dets"},
                    {keypos, #combat_record.id}]),
    dets:open_file(combat_record_gods_challenge,
                   [{file, "./dets/combat_record_gods_challenge.dets"},
                    {keypos, #combat_record.id}]),
    dets:open_file(combat_record_provocation,
                   [{file, "./dets/combat_record_provocation.dets"},
                    {keypos, #combat_record.id}]),
    dets:open_file(combat_record_marvelous,
                   [{file, "./dets/combat_record_marvelous.dets"},
                    {keypos, #combat_record_marvelous.id}]),
    dets:open_file(combat_record_hot,
                   [{file, "./dets/combat_record_hot.dets"},
                    {keypos, #combat_record_hot.id}]),
    dets:open_file(combat_record_rank,
                   [{file, "./dets/combat_record_rank.dets"},
                    {keypos, #combat_record_hot.id}]),
    dets:open_file(combat_record_rank_week,
                   [{file, "./dets/combat_record_rank_week.dets"},
                    {keypos, #combat_record_hot.id}]),
    dets:open_file(combat_record_role,
                   [{file, "./dets/combat_record_role.dets"},
                    {keypos, #combat_record_role.id}]),
    ets:new(combat_record_system,
            [set,
             named_table,
             public,
             {keypos, #combat_record.id}]),
    ets:new(combat_record_public,
            [set,
             named_table,
             public,
             {keypos, #combat_record.id}]),
    ets:new(combat_record_tournament,
            [set,
             named_table,
             public,
             {keypos, #combat_record.id}]),
    ets:new(combat_record_gods_duel_final,
            [set,
             named_table,
             public,
             {keypos, #combat_record.id}]),
    ets:new(combat_record_gods_challenge,
            [set,
             named_table,
             public,
             {keypos, #combat_record.id}]),
    ets:new(combat_record_provocation,
            [set,
             named_table,
             public,
             {keypos, #combat_record.id}]),
    ets:new(combat_record_marvelous,
            [set,
             named_table,
             public,
             {keypos, #combat_record_marvelous.id}]),
    ets:new(combat_record_role,
            [set,
             named_table,
             public,
             {keypos, #combat_record_role.id}]),
    ets:new(combat_record_hot,
            [set,
             named_table,
             public,
             {keypos, #combat_record_hot.id}]),
    ets:new(combat_record_rank,
            [set,
             named_table,
             public,
             {keypos, #combat_record_hot.id}]),
    ets:new(combat_record_rank_week,
            [set,
             named_table,
             public,
             {keypos, #combat_record_hot.id}]),
    load_data(),
    erlang:send_after(10000, self(), loop),
    logger:info("启动完成...", [], combat_record, 1000),
    State1 = next_update_rank(State),
    {ok, State1}.

handle_call({collect, _Id, RecId}, _From, State) ->
    Reply = case fetch_replay(RecId) of
                Record = #combat_record{cited = Cited} ->
                    store(Record#combat_record{cited = Cited + 1}),
                    ok;
                _ -> {false, lang:get("该录像已失效")}
            end,
    {reply, Reply, State};
handle_call({like, Id, RecId}, _From, State) ->
    Reply = case fetch_replay(RecId) of
                Record = #combat_record{likes = Likes, liked = Liked,
                                        cited = _Cited,
                                        combat_type = _CombatType} ->
                    case lists:member(Id, Likes) of
                        true -> {false, lang:get("你已经赞过该录像")};
                        _ ->
                            Record1 = Record#combat_record{likes = [Id | Likes],
                                                           liked = Liked + 1},
                            big_world:cast(combat_record_cross,
                                           cast,
                                           [{like,
                                             Id,
                                             RecId,
                                             Record#combat_record{frames =
                                                                      []}}]),
                            store(Record1),
                            ok
                    end;
                _ -> {false, lang:get("该录像已失效")}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({update_role, Ids, RecId}, State) ->
    DelIds = update_role(Ids, RecId, []),
    combat_record_cross:minus_citeds(DelIds),
    {noreply, State};
handle_info({cite, RecId, CombatType}, State) ->
    case fetch_replay(RecId) of
        Record = #combat_record{cited = Cited} ->
            store(Record#combat_record{cited = Cited + 1});
        _ -> ok
    end,
    L1 = ets:select(combat_record_marvelous,
                    [{#combat_record_marvelous{id = '$1', time = '$2',
                                               combat_type = CombatType,
                                               _ = '_'},
                      [],
                      [{{'$1', '$2'}}]}]),
    case length(L1) of
        N when N > 40 ->
            L2 = lists:keysort(2, L1),
            DelL = lists:sublist(L2, N - 40),
            del_expire(DelL);
        _ -> ok
    end,
    {noreply, State};
handle_info({cite, RecId}, State) ->
    case fetch_replay(RecId) of
        Record = #combat_record{cited = Cited} ->
            store(Record#combat_record{cited = Cited + 1});
        _ -> ok
    end,
    {noreply, State};
handle_info({acc_replayed, RecId}, State) ->
    case fetch_replay(RecId) of
        Record = #combat_record{cited = _Cited,
                                replayed = Replayed,
                                combat_type = _CombatType} ->
            store(Record#combat_record{replayed = Replayed + 1});
        _ -> ok
    end,
    {noreply, State};
handle_info({acc_shared, RecId}, State) ->
    case fetch_replay(RecId) of
        Record = #combat_record{cited = _Cited,
                                combat_type = _CombatType, shared = Shared} ->
            big_world:cast(combat_record_cross,
                           cast,
                           [{acc_shared,
                             RecId,
                             Record#combat_record{frames = []}}]),
            store(Record#combat_record{shared = Shared + 1});
        _ -> ok
    end,
    {noreply, State};
handle_info({minus_citeds, DelIds}, State) ->
    minus_citeds(DelIds),
    {noreply, State};
handle_info(clear_out_zone, State) ->
    L1 = [{Recent, Collection}
          || [Id, Recent, Collection]
                 <- ets:match(combat_record_role,
                              #combat_record_role{id = '$1', recent = '$2',
                                                  collection = '$3', _ = '_'}),
             role_misc:is_local_role(Id) =:= false],
    L2 = sum_cited(L1, []),
    minus_citeds(L2),
    {noreply, State};
handle_info(loop, State) ->
    env:save_counter(combat_record_id, 0),
    erlang:send_after(10000, self(), loop),
    {noreply, State};
handle_info(clear, State) ->
    Now = date:unixtime(),
    L = ets:match(combat_record_system,
                  #combat_record{id = '$1', time = '$2', type = 7,
                                 _ = '_'}),
    F = fun ([Id, Time]) when Now - Time > 86400 * 5 ->
                delete(Id);
            (_) -> ok
        end,
    [F(O) || O <- L],
    {noreply, State};
handle_info(clear_arena, State) ->
    ets:match_delete(combat_record_system,
                     #combat_record{type = 7, _ = '_'}),
    dets:match_delete(combat_record_system,
                      #combat_record{type = 7, _ = '_'}),
    {noreply, State};
handle_info(update_rank, State) ->
    State1 = next_update_rank(State),
    {noreply, State1};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    env:save_counter(combat_record_id, 0),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

check_save_dets(#combat_record{type = 1}) -> true;
check_save_dets(#combat_record{type = 2}) -> true;
check_save_dets(#combat_record{type = 3}) -> true;
check_save_dets(#combat_record{type = 4}) -> true;
check_save_dets(#combat_record{type = 5}) -> true;
check_save_dets(#combat_record{type = 6}) -> true;
check_save_dets(#combat_record{type = 7}) -> true;
check_save_dets(#combat_record{type = 14}) -> true;
check_save_dets(#combat_record{type = 17}) -> true;
check_save_dets(#combat_record{type = 19}) -> true;
check_save_dets(_) -> false.

update_role([], _, DelIds) -> DelIds;
update_role([Id | T], RecId, DelIds) ->
    case lookup_combat_record_role(Id) of
        {true, R = #combat_record_role{recent = Recent}} ->
            NewRecent = lists:sublist([RecId | Recent], 20),
            Minus = Recent -- NewRecent,
            NewR = R#combat_record_role{recent = NewRecent},
            dets:insert(combat_record_role, NewR),
            ets:insert(combat_record_role, NewR),
            NewDelIds = acc_minus(Minus, DelIds),
            update_role(T, RecId, NewDelIds);
        _ ->
            NewR = #combat_record_role{id = Id, recent = [RecId]},
            dets:insert(combat_record_role, NewR),
            ets:insert(combat_record_role, NewR),
            update_role(T, RecId, DelIds)
    end.

acc_minus([], Minus) -> Minus;
acc_minus([Id | T], Minus) ->
    case lists:keyfind(Id, 1, Minus) of
        {Id, N} ->
            acc_minus(T,
                      lists:keyreplace(Id, 1, Minus, {Id, N + 1}));
        _ -> acc_minus(T, [{Id, 1} | Minus])
    end.

minus_citeds([]) -> ok;
minus_citeds([{RecId, Minus} | T]) ->
    case combat_record:fetch_replay(RecId) of
        Record = #combat_record{cited = Cited}
            when Cited > Minus ->
            store(Record#combat_record{cited = Cited - Minus});
        #combat_record{} -> delete(RecId);
        _ -> ok
    end,
    minus_citeds(T).

store(#combat_record{frames = []}) -> ok;
store(Record = #combat_record{type = 9}) ->
    dets:insert(combat_record_public, Record),
    ets:insert(combat_record_public, Record);
store(Record = #combat_record{type = 12}) ->
    dets:insert(combat_record_tournament, Record),
    ets:insert(combat_record_tournament, Record);
store(Record = #combat_record{type = 13}) ->
    dets:insert(combat_record_gods_duel_final, Record),
    ets:insert(combat_record_gods_duel_final, Record);
store(Record = #combat_record{type = 21}) ->
    dets:insert(combat_record_provocation, Record),
    ets:insert(combat_record_provocation, Record);
store(Record = #combat_record{type = 23}) ->
    dets:insert(combat_record_gods_challenge, Record),
    ets:insert(combat_record_gods_challenge, Record);
store(Record = #combat_record{}) ->
    case check_save_dets(Record) of
        true -> dets:insert(combat_record_system, Record);
        _ -> ok
    end,
    ets:insert(combat_record_system, Record);
store(R = #combat_record_role{}) ->
    dets:insert(combat_record_role, R),
    ets:insert(combat_record_role, R);
store(H = #combat_record_hot{}) ->
    dets:insert(combat_record_hot, H),
    ets:insert(combat_record_hot, H);
store(M = #combat_record_marvelous{combat_type =
                                       CombatType,
                                   id = Id}) ->
    dets:insert(combat_record_marvelous, M),
    ets:insert(combat_record_marvelous, M),
    combat_record ! {cite, Id, CombatType},
    ok.

del_expire([]) -> ok;
del_expire(L) ->
    DelFun = fun ({DelId, _}) ->
                     ets:delete(combat_record_marvelous, DelId),
                     dets:delete(combat_record_marvelous, DelId);
                 (_) -> ok
             end,
    [DelFun(O) || O <- L],
    minus_citeds([{Id, 1} || {Id, _} <- L]).

list(Id, recent) ->
    case lookup_combat_record_role(Id) of
        {true, #combat_record_role{recent = Recent}} ->
            do_list(Id, Recent);
        _ -> []
    end;
list(Id, collection) ->
    case lookup_combat_record_role(Id) of
        {true, #combat_record_role{collection = Collection}} ->
            do_list(Id, Collection);
        _ -> []
    end.

do_list(_, []) -> [];
do_list(Rid, [Id | T]) ->
    case combat_record_cross:fetch(Id) of
        R = #combat_record{likes = Likes} ->
            Likable = case lists:member(Rid, Likes) of
                          true -> 0;
                          _ -> 1
                      end,
            [{Likable, R#combat_record{frames = [], likes = []}}
             | do_list(Rid, T)];
        _ -> do_list(Rid, T)
    end.

save_marvelous(Label,
               #combat{type = 102, winner = Winner, loser = Loser},
               M) ->
    case rank:list_show(32) of
        [] -> ok;
        L1 ->
            case lists:last(L1) of
                #rank_rc{val1 = Val1} ->
                    CalcPoint = fun (#fighter{origin_id = OriginId}) ->
                                        case qualifying_mgr:find_role(OriginId)
                                            of
                                            {ok,
                                             #qualifying_role_mark{rank_point =
                                                                       Rp}} ->
                                                Rp;
                                            _ -> 0
                                        end
                                end,
                    AvgP1 = util:list_avg([CalcPoint(F1)
                                           || F1 = #fighter{type = 1}
                                                  <- Winner]),
                    AvgP2 = util:list_avg([CalcPoint(F2)
                                           || F2 = #fighter{type = 1}
                                                  <- Loser]),
                    case AvgP1 > Val1 andalso AvgP2 > Val1 of
                        true ->
                            case Label of
                                {cross, Platform, ZoneId} ->
                                    cross:cast(Platform,
                                               ZoneId,
                                               combat_record,
                                               store,
                                               [M]);
                                {big_world, Platform, ZoneId} ->
                                    big_world:cast(Platform,
                                                   ZoneId,
                                                   combat_record,
                                                   store,
                                                   [M]);
                                _ -> store(M)
                            end;
                        _ -> ok
                    end;
                _ -> ok
            end
    end;
save_marvelous(Label,
               Combat = #combat{winner = Winner, loser = Loser,
                                round = _Round},
               M = #combat_record_marvelous{combat_type =
                                                CombatType}) ->
    case check_marvelous([round, num, special_type],
                         #{combat => Combat, m => M})
        of
        true ->
            FcCalc = fun (#fighter{attr = #attr{fc = Rfc},
                                   active_pet = APet = #c_pet{},
                                   backup_pets = Pets}) ->
                             BkFc = case util:keys_sort([#c_pet.talent],
                                                        [APet | Pets])
                                        of
                                        PetList = [_ | _] ->
                                            do_calc_fc(PetList, 3, 0);
                                        _ -> 0
                                    end,
                             Rfc + BkFc;
                         (#fighter{attr = #attr{fc = Rfc},
                                   backup_pets = Pets}) ->
                             BkFc = case util:keys_sort([#c_pet.talent], Pets)
                                        of
                                        PetList = [_ | _] ->
                                            do_calc_fc(PetList, 3, 0);
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
                         combat_record,
                         1350),
            Rate = case WSumFc > LSumFc of
                       true when LSumFc > 0 -> round(LSumFc / WSumFc * 100);
                       _ when LSumFc > 0 -> round(WSumFc / LSumFc * 100);
                       _ -> 0
                   end,
            case Rate >= 90 of
                true ->
                    case Label of
                        _ when CombatType == 108 ->
                            big_world:cast(combat_record_cross,
                                           cast,
                                           [{store_marvelous, M}]);
                        _ when CombatType == 116 ->
                            big_world:cast(combat_record_cross,
                                           cast,
                                           [{store_marvelous, M}]);
                        {cross, Platform, ZoneId} ->
                            cross:cast(Platform,
                                       ZoneId,
                                       combat_record,
                                       store,
                                       [M]);
                        {big_world, Platform, ZoneId} ->
                            big_world:cast(Platform,
                                           ZoneId,
                                           combat_record,
                                           store,
                                           [M]);
                        _ -> store(M)
                    end;
                _ ->
                    case lists:member(CombatType,
                                      [103,
                                       114,
                                       104,
                                       107,
                                       102,
                                       105,
                                       40,
                                       108,
                                       110,
                                       111,
                                       113,
                                       58,
                                       116])
                        of
                        false ->
                            case Label of
                                {cross, Platform, ZoneId} ->
                                    cross:cast(Platform,
                                               ZoneId,
                                               combat_record,
                                               store,
                                               [M]);
                                {big_world, Platform, ZoneId} ->
                                    big_world:cast(Platform,
                                                   ZoneId,
                                                   combat_record,
                                                   store,
                                                   [M]);
                                _ -> store(M)
                            end;
                        _ -> ok
                    end
            end;
        _ -> ok
    end.

do_calc_fc([], _, Fc) -> Fc;
do_calc_fc(_, Num, Fc) when Num =< 0 -> Fc;
do_calc_fc([#c_pet{talent = Talent} | T], Num, Fc) ->
    do_calc_fc(T, Num - 1, Talent + Fc);
do_calc_fc([_ | T], Num, Fc) ->
    do_calc_fc(T, Num - 1, Fc).

check_marvelous([], _) -> true;
check_marvelous([Label | T], Data) ->
    logger:debug("==================================:~w",
                 [Label],
                 combat_record,
                 1399),
    case check_marvelous(Label, Data) of
        true -> check_marvelous(T, Data);
        _ -> false
    end;
check_marvelous(round,
                #{combat := #combat{round = Round},
                  m :=
                      #combat_record_marvelous{combat_type = CombatType}}) ->
    check_save_marvelous(CombatType, Round);
check_marvelous(num,
                #{combat := #combat{winner = Winner, loser = Loser},
                  m :=
                      #combat_record_marvelous{combat_type = CombatType}}) ->
    check_marvelous_num(Winner, Loser, CombatType);
check_marvelous(special_type,
                #{m := #combat_record_marvelous{combat_type = 54}}) ->
    #combat_context{origin_dfd = DfdList} =
        combat_cache:get_context(),
    case catch lists:keyfind(1, #fighter.is_leader, DfdList)
        of
        #fighter{base_id = BaseId} ->
            case dungeon_data:get_lord(BaseId) of
                #dungeon_lord_data{is_lord = 0} -> false;
                #dungeon_lord_data{} -> true;
                _ -> false
            end;
        _ -> false
    end;
check_marvelous(special_type, _) -> true;
check_marvelous(_, _) -> false.

check_save_marvelous(106, Round) when Round >= 5 ->
    true;
check_save_marvelous(105, Round) when Round >= 5 ->
    true;
check_save_marvelous(108, Round) when Round >= 5 ->
    true;
check_save_marvelous(107, Round) when Round >= 5 ->
    true;
check_save_marvelous(104, Round) when Round >= 5 ->
    true;
check_save_marvelous(116, Round) when Round >= 5 ->
    true;
check_save_marvelous(5, Round) when Round >= 1 -> true;
check_save_marvelous(26, Round) when Round >= 1 -> true;
check_save_marvelous(21, Round) when Round >= 1 -> true;
check_save_marvelous(16, Round) when Round >= 1 -> true;
check_save_marvelous(54, Round) when Round >= 1 -> true;
check_save_marvelous(63, Round) when Round >= 1 -> true;
check_save_marvelous(68, Round) when Round >= 1 -> true;
check_save_marvelous(72, Round) when Round >= 1 -> true;
check_save_marvelous(_, _) -> false.

check_marvelous_num(Winner, Loser, CombatType) ->
    WinnerNum = length([F
                        || F = #fighter{type = 1} <- Winner]),
    LoserNum = length([F
                       || F = #fighter{type = 1} <- Loser]),
    (WinnerNum + LoserNum) div 2 >=
        marvelous_need_num(CombatType).

marvelous_need_num(106) -> 5;
marvelous_need_num(105) -> 5;
marvelous_need_num(108) -> 5;
marvelous_need_num(116) -> 5;
marvelous_need_num(107) -> 5;
marvelous_need_num(104) -> 5;
marvelous_need_num(_) -> 0.

available_id([]) -> [];
available_id([Id | T]) ->
    case combat_record_cross:fetch(Id) of
        #combat_record{} -> [Id | available_id(T)];
        _ -> available_id(T)
    end.

load_data() ->
    do_load_data([combat_record_public,
                  combat_record_system,
                  combat_record_tournament,
                  combat_record_gods_duel_final,
                  combat_record_gods_challenge,
                  combat_record_marvelous,
                  combat_record_hot,
                  combat_record_rank,
                  combat_record_rank_week,
                  combat_record_provocation]).

do_load_data([]) -> ok;
do_load_data([Tab = combat_record_system | T]) ->
    case dets:first(Tab) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], combat_record, 1498),
            [];
        _ ->
            P = env:get(platform),
            Z = env:get(zone_id),
            dets:traverse(Tab,
                          fun (R) ->
                                  case combat_ver:do_record(R) of
                                      R1 = #combat_record{id = {Type, Id},
                                                          ver = 10}
                                          when is_integer(Id) ->
                                          R2 = R1#combat_record{id =
                                                                    {Type,
                                                                     {Id,
                                                                      P,
                                                                      Z}}},
                                          dets:delete_object(Tab, R),
                                          ets:insert(Tab, R2),
                                          dets:insert(Tab, R2),
                                          continue;
                                      R1 = #combat_record{ver = 10} ->
                                          R2 = check_load_frame(R1),
                                          ets:insert(Tab, R2),
                                          continue;
                                      _ ->
                                          dets:delete_object(Tab, R),
                                          continue
                                  end
                          end)
    end,
    case dets:info(Tab, size) of
        0 -> dets:delete_all_objects(Tab);
        _ -> ok
    end,
    do_load_data(T);
do_load_data([Tab = combat_record_marvelous | T]) ->
    dets:to_ets(Tab, Tab),
    do_load_data(T);
do_load_data([Tab = combat_record_hot | T]) ->
    dets:to_ets(Tab, Tab),
    do_load_data(T);
do_load_data([Tab = combat_record_rank | T]) ->
    dets:to_ets(Tab, Tab),
    do_load_data(T);
do_load_data([Tab = combat_record_rank_week | T]) ->
    dets:to_ets(Tab, Tab),
    do_load_data(T);
do_load_data([Tab | T]) ->
    case dets:first(Tab) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], combat_record, 1543),
            [];
        _ ->
            dets:traverse(Tab,
                          fun (R) ->
                                  case combat_ver:do_record(R) of
                                      R1 = #combat_record{ver = 10} ->
                                          R2 = check_load_frame(R1),
                                          ets:insert(Tab, R2),
                                          continue;
                                      _ ->
                                          dets:delete_object(Tab, R),
                                          continue
                                  end
                          end)
    end,
    case dets:info(Tab, size) of
        0 -> dets:delete_all_objects(Tab);
        _ -> ok
    end,
    do_load_data(T).

check_load_frame(R = #combat_record{replayed = Played})
    when Played < 30 ->
    R#combat_record{frames = [], screen_msg = []};
check_load_frame(R) -> R.

do_replay_next([], _) -> [];
do_replay_next(<<>>, _) -> <<>>;
do_replay_next([H = <<_:32, 10723:16/little, _/binary>>
                | Rest],
               ConnPid) ->
    sys_conn:send(ConnPid, H),
    do_replay_next(Rest, ConnPid);
do_replay_next([H | Rest], ConnPid) ->
    sys_conn:send(ConnPid, H),
    Rest;
do_replay_next(<<Len:32/little, 10723:16/little,
                 T/binary>>,
               ConnPid) ->
    Len1 = Len - 2,
    <<H:Len1/binary, Rest/binary>> = T,
    sys_conn:send(ConnPid,
                  <<Len:32/little, 10723:16, H/binary>>),
    do_replay_next(Rest, ConnPid);
do_replay_next(<<Len:32/little, H:Len/binary,
                 Rest/binary>>,
               ConnPid) ->
    sys_conn:send(ConnPid, <<Len:32/little, H/binary>>),
    Rest.

sum_cited([], Cited) -> Cited;
sum_cited([{Recent, Collection} | T], Cited) ->
    Cited1 = acc_minus(Collection ++ Recent, Cited),
    sum_cited(T, Cited1).

next_update_rank(State = #state{rank_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Time = case date:time() of
               {H, _, _} when H < 23 -> date:next_diff(H + 1, 0, 0);
               _ -> date:next_diff(0, 0, 0)
           end,
    Ref = erlang:send_after(Time * 1000,
                            self(),
                            update_rank),
    State#state{rank_ref = Ref}.

do_list_rank(_, _, []) -> [];
do_list_rank(Type = week, Rid,
             [#combat_record_hot{id = RecId, liked = Liked,
                                 replayed = Replayed, shared = Shared}
              | T]) ->
    case fetch(RecId) of
        Record = #combat_record{likes = Likes} ->
            Likable = case lists:member(Rid, Likes) of
                          true -> 0;
                          _ -> 1
                      end,
            [{Likable,
              Record#combat_record{liked = Liked, replayed = Replayed,
                                   shared = Shared}}
             | do_list_rank(Type, Rid, T)];
        _ -> do_list_rank(Type, Rid, T)
    end;
do_list_rank(Type, Rid,
             [#combat_record_hot{id = RecId} | T]) ->
    case fetch(RecId) of
        Record = #combat_record{likes = Likes} ->
            Likable = case lists:member(Rid, Likes) of
                          true -> 0;
                          _ -> 1
                      end,
            [{Likable, Record} | do_list_rank(Type, Rid, T)];
        _ -> do_list_rank(Type, Rid, T)
    end.

rpc_add_screen_msg(Role,
                   {RecordType, {RecId, Platform, ZoneId}}, Round, Msg) ->
    MsgInfo = chat:get_combat_screen_mgr(Role, Msg),
    {RecordPlatform, RecordZoneId} = case RecordType of
                                         13 ->
                                             case
                                                 gods_duel_agent:lookup_match_profile(RecId)
                                                 of
                                                 {ok,
                                                  #gods_duel_match_profile{is_over
                                                                               =
                                                                               1,
                                                                           platform
                                                                               =
                                                                               MatchPlatform,
                                                                           zone_id
                                                                               =
                                                                               MatchZoneId}} ->
                                                     {MatchPlatform,
                                                      MatchZoneId};
                                                 _ -> {Platform, ZoneId}
                                             end;
                                         _ -> {Platform, ZoneId}
                                     end,
    case util:check_text(Msg, 40) of
        ok ->
            NewRecordId = {RecordType,
                           {RecId, RecordPlatform, RecordZoneId}},
            case big_world:call(RecordPlatform,
                                RecordZoneId,
                                combat_record,
                                update_screen_msg,
                                [NewRecordId, Round, MsgInfo])
                of
                ok ->
                    notice:send(Role, 13, Msg),
                    ok;
                _ -> {false, lang:get("录像不存在")}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("存在不和谐词汇，换个试试吧")}
    end.

update_screen_msg(RecordId, Round, MsgInfo) ->
    case fetch_replay(RecordId) of
        CombatRecord = #combat_record{screen_msg = ScreenMsg} ->
            NewScreenMsg = case lists:keyfind(Round, 1, ScreenMsg)
                               of
                               {_, RoundScreenMsg} ->
                                   NewRoundScreenMsg = lists:sublist([MsgInfo
                                                                      | RoundScreenMsg],
                                                                     30),
                                   lists:keystore(Round,
                                                  1,
                                                  ScreenMsg,
                                                  {Round, NewRoundScreenMsg});
                               _ -> [{Round, [MsgInfo]} | ScreenMsg]
                           end,
            logger:debug("新的弹幕信息列表:~w",
                         [NewScreenMsg],
                         combat_record,
                         1712),
            NewCombatRecord = CombatRecord#combat_record{screen_msg
                                                             = NewScreenMsg},
            store(NewCombatRecord),
            ok;
        _ -> {false, lang:get("该录像已经失效")}
    end.

lookup_combat_record_role(RoleId) ->
    case catch ets:lookup(combat_record_role, RoleId) of
        [RecordRole = #combat_record_role{}] ->
            {true, RecordRole};
        _ ->
            case catch dets:lookup(combat_record_role, RoleId) of
                [RecordRole = #combat_record_role{}] ->
                    ets:insert(combat_record_role, RecordRole),
                    {true, RecordRole};
                _ -> false
            end
    end.

