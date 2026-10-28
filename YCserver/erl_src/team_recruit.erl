-file("src/mod/team/team_recruit.erl", 1).

-module(team_recruit).

-behaviour(gen_server).

-export([start_link/1,
         reg/1,
         levup/3,
         logout/1,
         clean/1,
         dispatch/3,
         broadcast_recruitment_info/5,
         broadcast_pre_recruitment_info/5,
         push_recruitment_info/5,
         push_pre_recruitment_info/5,
         check_chat_recruit/1,
         get_recruit/2,
         update/1,
         diff_notice_list/4,
         cancel_reg/1]).

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

-file("src/mod/team/team_recruit.erl", 38).

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

-file("src/mod/team/team_recruit.erl", 39).

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

-file("src/mod/team/team_recruit.erl", 40).

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

-file("src/mod/team/team_recruit.erl", 41).

-file("inc/wedding.hrl", 1).

-record(m_wedding,
        {ver = 1,
         lover_id = {0, "", 0},
         lover_name = "",
         status = 0,
         honor_ids = [],
         reward = [],
         mail = []}).

-record(lover,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         lover_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         lover_name = "" :: bitstring(),
         type = 1 :: 1..2,
         status = 1 :: 0..2,
         ring_lev = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         order_index = 0 :: non_neg_integer(),
         order_time = 0 :: non_neg_integer(),
         atmosp = 0 :: non_neg_integer(),
         index = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lover_sex = 2 :: 0..2,
         lover_classes = 0,
         lover_lev = 0,
         lover_fc = 0,
         lover_pet_fc = 0,
         lover_face = 0}).

-record(guest,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid = 0 :: 0 | pid(),
         act_list = [],
         unit_list = [],
         classes = 0,
         sex = 0,
         lev = 0,
         face = 0}).

-record(wedding_atmosp_data,
        {type = 0 :: non_neg_integer(),
         min_val = 0 :: non_neg_integer(),
         max_val = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         scene_reward = [] :: list(),
         scene_msg = "" :: string(),
         male_reward = [] :: list(),
         famale_reward = [] :: list(),
         title = "" :: string(),
         content = "" :: string()}).

-record(wedding_act_data,
        {id = 0,
         type = 0,
         target = 1,
         free_num = 0,
         max_num = 0,
         cost = [],
         msg = "",
         log_msg = "",
         atmosp = 0,
         gain = [],
         main_gain = [],
         effect_type = 0,
         effect_id = 1,
         effect_num = 1,
         cd = 0}).

-record(wedding_rank, {type = 0, list = []}).

-record(wedding_rank_rc,
        {id = {{0, "", 0}, {0, "", 0}},
         male_id = {0, "", 0},
         male_name = "",
         rank = 1,
         time = 0 :: non_neg_integer(),
         male_sex = 0 :: 0..2,
         male_classes = 0 :: 0..4,
         male_lev = 0 :: non_neg_integer(),
         female_id = {0, "", 0},
         female_name = "",
         female_sex = 0 :: 0..2,
         female_classes = 0 :: 0..4,
         female_lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(wedding_rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys =
             [#wedding_rank_rc.val3,
              #wedding_rank_rc.val2,
              #wedding_rank_rc.val1]
             :: [pos_integer()],
         min_val = 1 :: pos_integer()}).

-record(wedding_unit_data,
        {id = 0, target = 0, rand = [], limit = 0}).

-record(wedding_rank_honor_data,
        {type = 0,
         rank = 0,
         male_honor = 0,
         female_honor = 0,
         reward = [],
         title = "",
         content = ""}).

-record(wedding_rank_honor_type_data,
        {type = 0, day = day}).

-file("src/mod/team/team_recruit.erl", 42).

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

-file("src/mod/team/team_recruit.erl", 43).

-record(state, {mod = zone}).

reg(Role = #role{lev = Lev, cross_type = CrossType}) ->
    {ok, Mate} = role_convert:to(team_mate, Role),
    gen_server:cast(team_recruit, {reg, Mate, Lev}),
    case CrossType of
        1 ->
            cross:cast(gen_server,
                       cast,
                       [team_recruit, {reg, Mate, Lev}]);
        _ -> ignore
    end,
    ok.

levup(Role = #role{cross_type = CrossType}, OldLev,
      NewLev) ->
    {ok, Mate} = role_convert:to(team_mate, Role),
    gen_server:cast(team_recruit,
                    {levup, Mate, OldLev, NewLev}),
    case CrossType of
        1 ->
            cross:cast(gen_server,
                       cast,
                       [team_recruit, {levup, Mate, OldLev, NewLev}]);
        _ -> ignore
    end,
    Role.

update(Role = #role{cross_type = CrossType}) ->
    {ok, Mate} = role_convert:to(team_mate, Role),
    gen_server:cast(team_recruit, {update, Mate}),
    case CrossType of
        1 ->
            cross:cast(gen_server,
                       cast,
                       [team_recruit, {update, Mate}]);
        _ -> ignore
    end,
    ok.

logout(#role{id = Rid, lev = Lev,
             cross_type = CrossType}) ->
    gen_server:cast(team_recruit, {logout, Rid, Lev}),
    case CrossType of
        1 ->
            cross:cast(gen_server,
                       cast,
                       [team_recruit, {logout, Rid, Lev}]);
        _ -> ignore
    end,
    ok.

cancel_reg(#role{id = Rid, lev = Lev}) ->
    cross:cast(gen_server,
               cast,
               [team_recruit, {cancel_reg, Rid, Lev}]),
    ok.

clean(Role = #role{m_team =
                       #m_team{recruitment = Recruitment}}) ->
    Ids = [Id || {Id, _Pid} <- Recruitment],
    role:link_send(Role, 11723, {[], [], Ids}),
    ok.

dispatch(Team,
         Recruit = #team_recruitment{lev_min = MinLev,
                                     lev_max = MaxLev, id = Id,
                                     lev = LeaderLev},
         LeaderPid) ->
    {LevSet, _} = filter_lev(MinLev,
                             MaxLev,
                             {Id, LeaderLev},
                             [],
                             0),
    {TypeSet, Sum} = filter_type(Recruit, LevSet, [], 0),
    PrecisionNoticeList = get_pre(Team, Recruit, TypeSet),
    NoticeList = filter_role(TypeSet, Sum - 1),
    NewNoticeList = [{TRid, TPid}
                     || #team_mate{id = TRid, pid = TPid} <- NoticeList],
    NewPrecisionNoticeList = [{TRid, TPid}
                              || #team_mate{id = TRid, pid = TPid}
                                     <- PrecisionNoticeList],
    Recruit#team_recruitment{notice_list =
                                 [{Id, LeaderPid} | NewNoticeList],
                             precision_notice_list = NewPrecisionNoticeList}.

filter_type(_Recruit, [], List, Sum) -> {List, Sum};
filter_type(Recruit = #team_recruitment{type = Type,
                                        sex = Sex},
            [I = #team_mate{sex = ISex, lover_status = ILoverStatus,
                            quest_couple_round = IQuestCoupleRound}
             | T],
            List, Sum) ->
    case team_data:get(Type) of
        #{type := 14}
            when Sex =/= ISex andalso
                     ILoverStatus == 0 andalso IQuestCoupleRound == 0 ->
            filter_type(Recruit, T, [I | List], Sum + 1);
        #{type := 14} -> filter_type(Recruit, T, List, Sum);
        _ -> filter_type(Recruit, T, [I | List], Sum + 1)
    end.

get_pre(#team{members = Members},
        #team_recruitment{id = RoleId, type = Type,
                          precision_notice_list = PrecisionNoticeList},
        TypeSet) ->
    case PrecisionNoticeList of
        [] ->
            case team_data:get(Type) of
                #{type := 14} ->
                    case var:get_role_var(RoleId, day, 40, 0) >= 1 of
                        true -> PrecisionNoticeList;
                        _ ->
                            var:acc_role_var(RoleId, day, 40, 0),
                            lists:sublist(TypeSet --
                                              [{TRid, TPid}
                                               || #team_mate{id = TRid,
                                                             pid = TPid}
                                                      <- Members],
                                          2)
                    end;
                _ -> PrecisionNoticeList
            end;
        _ -> PrecisionNoticeList
    end.

filter_role(LevSet, Sum) ->
    case Sum =< 80 of
        true -> LevSet;
        false -> filter_role_rand(LevSet, 80, [])
    end.

filter_role_rand(_LevSet, 0, List) -> List;
filter_role_rand(LevSet, Num, List) ->
    case util:rand_list(LevSet) of
        undefined -> List;
        I ->
            filter_role_rand(LevSet -- [I], Num - 1, List ++ [I])
    end.

filter_lev(Lev, MaxLev, _Leader, Acc, Sum)
    when MaxLev < Lev ->
    {Acc, Sum};
filter_lev(MinLev, MaxLev, Leader = {Id, LeaderLev},
           Acc, Sum) ->
    case catch ets:lookup(team_recruit_room, MinLev) of
        [#team_recruit_room{role_num = Num,
                            members = Members}] ->
            NewMembers = case LeaderLev =:= MinLev of
                             true ->
                                 lists:keydelete(Id, #team_mate.id, Members);
                             false -> Members
                         end,
            filter_lev(MinLev + 1,
                       MaxLev,
                       Leader,
                       Acc ++ NewMembers,
                       Sum + Num);
        _False ->
            filter_lev(MinLev + 1, MaxLev, Leader, Acc, Sum)
    end.

broadcast_recruitment_info([], _Now, _Mode, _Info, _) ->
    ok;
broadcast_recruitment_info([{_Rid, Pid} | Rest], Now,
                           Mode, TeamPid, Extra)
    when is_pid(TeamPid) ->
    Args = [Mode, 0, TeamPid, Extra],
    role:apply(async,
               Pid,
               {team_recruit, push_recruitment_info, Args}),
    broadcast_recruitment_info(Rest,
                               Now,
                               Mode,
                               TeamPid,
                               Extra);
broadcast_recruitment_info([{_Rid, Pid} | Rest], Now,
                           Mode, Info = #team_recruitment{type = Type},
                           Extra) ->
    case check_chat_recruit(Type) of
        false -> skip;
        {ok, RecruitType} ->
            Args = [Mode,
                    RecruitType,
                    Info#team_recruitment{notice_list = []},
                    Extra],
            role:apply(async,
                       Pid,
                       {team_recruit, push_recruitment_info, Args})
    end,
    broadcast_recruitment_info(Rest,
                               Now,
                               Mode,
                               Info,
                               Extra);
broadcast_recruitment_info([_H | Rest], Now, Mode, Info,
                           Extra) ->
    broadcast_recruitment_info(Rest,
                               Now,
                               Mode,
                               Info,
                               Extra).

push_recruitment_info(Role = #role{name = _Name,
                                   id = Id,
                                   m_team = #m_team{pid = Pid, status = 1}},
                      Type, RecruitType,
                      #team_recruitment{id = Id = {Rid, Plat, ZoneId},
                                        name = Name, lev = Lev,
                                        member_num = Num, face_id = Faceid,
                                        lev_min = LevMin, lev_max = LevMax,
                                        matched = Matched,
                                        constellation_lev = ConstltLev,
                                        chat_recruit_info = RecruitInfo},
                      _)
    when is_pid(Pid) ->
    Args = [{1, ConstltLev}] ++ RecruitInfo,
    Info = [{1,
             Rid,
             Plat,
             ZoneId,
             Name,
             Faceid,
             Lev,
             LevMin,
             LevMax,
             RecruitType,
             Num,
             Matched,
             Args}],
    case Type of
        new -> role:link_send(Role, 11723, {Info, [], []});
        update -> role:link_send(Role, 11723, {[], Info, []});
        _ -> ok
    end,
    ok;
push_recruitment_info(Role = #role{name = _Name,
                                   m_team = #m_team{pid = Pid, status = 1}},
                      del, _RecruitType, Pid, _)
    when is_pid(Pid) ->
    role:link_send(Role, 11723, {[], [], [1]}),
    ok;
push_recruitment_info(#role{name = _Name,
                            m_team = #m_team{pid = Pid}},
                      _Type, _RecruitType, _Info, _)
    when is_pid(Pid) ->
    ok;
push_recruitment_info(Role = #role{name = _Name,
                                   m_combat = #m_combat{pid = CombatPid},
                                   m_team = #m_team{recruitment = List},
                                   cross_type = CrossType},
                      update, RecruitType,
                      #team_recruitment{pid = Pid, id = {Rid, Plat, ZoneId},
                                        name = Name, lev = Lev,
                                        member_num = Num, face_id = Faceid,
                                        lev_min = LevMin, lev_max = LevMax,
                                        matched = Matched,
                                        constellation_lev = ConstltLev,
                                        chat_recruit_info = RecruitInfo},
                      #{cross_type := CrossType})
    when not is_pid(CombatPid) ->
    case lists:keyfind(Pid, 2, List) of
        {Id, Pid} ->
            Args = [{1, ConstltLev}] ++ RecruitInfo,
            Update = [{Id,
                       Rid,
                       Plat,
                       ZoneId,
                       Name,
                       Faceid,
                       Lev,
                       LevMin,
                       LevMax,
                       RecruitType,
                       Num,
                       Matched,
                       Args}],
            role:link_send(Role, 11723, {[], Update, []}),
            ok;
        _ -> ok
    end;
push_recruitment_info(Role = #role{name = _Name,
                                   m_combat = #m_combat{pid = CombatPid},
                                   cross_type = CrossType,
                                   m_team =
                                       MTeam = #m_team{recruitment = List,
                                                       recruitment_ids =
                                                           [FreeId | RestIds]}},
                      new, RecruitType,
                      #team_recruitment{pid = Pid, id = {Rid, Plat, ZoneId},
                                        name = Name, lev = Lev,
                                        member_num = Num, face_id = Faceid,
                                        lev_min = LevMin, lev_max = LevMax,
                                        matched = Matched,
                                        constellation_lev = ConstltLev,
                                        chat_recruit_info = RecruitInfo},
                      #{cross_type := CrossType})
    when not is_pid(CombatPid) ->
    case lists:keyfind(Pid, 2, List) of
        {Id, Pid} ->
            Args = [{1, ConstltLev}] ++ RecruitInfo,
            New = [{Id,
                    Rid,
                    Plat,
                    ZoneId,
                    Name,
                    Faceid,
                    Lev,
                    LevMin,
                    LevMax,
                    RecruitType,
                    Num,
                    Matched,
                    Args}],
            role:link_send(Role, 11723, {New, [], []}),
            {ok,
             Role#role{m_team = MTeam#m_team{recruitment = List}}};
        _ ->
            Args = [{1, ConstltLev}] ++ RecruitInfo,
            New = [{FreeId,
                    Rid,
                    Plat,
                    ZoneId,
                    Name,
                    Faceid,
                    Lev,
                    LevMin,
                    LevMax,
                    RecruitType,
                    Num,
                    Matched,
                    Args}],
            role:link_send(Role, 11723, {New, [], []}),
            NewTeam = MTeam#m_team{recruitment =
                                       [{FreeId, Pid} | List],
                                   recruitment_ids = RestIds},
            {ok, Role#role{m_team = NewTeam}}
    end;
push_recruitment_info(Role = #role{name = _Name,
                                   m_combat = #m_combat{pid = CombatPid},
                                   cross_type = CrossType,
                                   m_team =
                                       MTeam = #m_team{recruitment = List,
                                                       recruitment_ids =
                                                           [FreeId | RestIds]}},
                      timer, RecruitType,
                      #team_recruitment{pid = Pid, id = {Rid, Plat, ZoneId},
                                        name = Name, lev = Lev,
                                        member_num = Num, face_id = Faceid,
                                        lev_min = LevMin, lev_max = LevMax,
                                        matched = Matched,
                                        constellation_lev = ConstltLev,
                                        chat_recruit_info = RecruitInfo},
                      #{cross_type := CrossType})
    when not is_pid(CombatPid) ->
    case lists:keyfind(Pid, 2, List) of
        {Id, Pid} ->
            Args = [{1, ConstltLev}] ++ RecruitInfo,
            role:link_send(Role, 11723, {[], [], [Id]}),
            New = [{Id,
                    Rid,
                    Plat,
                    ZoneId,
                    Name,
                    Faceid,
                    Lev,
                    LevMin,
                    LevMax,
                    RecruitType,
                    Num,
                    Matched,
                    Args}],
            role:link_send(Role, 11723, {New, [], []}),
            {ok,
             Role#role{m_team = MTeam#m_team{recruitment = List}}};
        _ ->
            Args = [{1, ConstltLev}] ++ RecruitInfo,
            New = [{FreeId,
                    Rid,
                    Plat,
                    ZoneId,
                    Name,
                    Faceid,
                    Lev,
                    LevMin,
                    LevMax,
                    RecruitType,
                    Num,
                    Matched,
                    Args}],
            role:link_send(Role, 11723, {New, [], []}),
            NewTeam = MTeam#m_team{recruitment =
                                       [{FreeId, Pid} | List],
                                   recruitment_ids = RestIds},
            {ok, Role#role{m_team = NewTeam}}
    end;
push_recruitment_info(Role = #role{name = _Name,
                                   m_team =
                                       MTeam = #m_team{recruitment = List,
                                                       recruitment_ids = Ids}},
                      del, _RecruitType, Pid, _) ->
    case lists:keytake(Pid, 2, List) of
        {value, {Id, Pid}, RestList} ->
            role:link_send(Role, 11723, {[], [], [Id]}),
            {ok,
             Role#role{m_team =
                           MTeam#m_team{recruitment = RestList,
                                        recruitment_ids = [Id | Ids]}}};
        _False -> ok
    end;
push_recruitment_info(_Role = #role{name = _Name}, _Op,
                      _RecruitType, _Info, _) ->
    logger:debug("招募错误[~ts][Op:~w]",
                 [_Name, _Op],
                 team_recruit,
                 373),
    ok.

check_chat_recruit(Type) ->
    MatchList = team_data:notice_recruit(),
    case lists:member(Type, MatchList) of
        true -> {ok, Type};
        false -> false
    end.

diff_notice_list([], Del, New, Update) ->
    {Del, New, Update};
diff_notice_list([{Rid, Pid} | Rest], Del, New,
                 Update) ->
    {ChangeDel, ChangeNew, ChangeUpdate} = case
                                               lists:keyfind(Rid, 1, New)
                                               of
                                               {Rid, _} ->
                                                   RtnNew = lists:keydelete(Rid,
                                                                            1,
                                                                            New),
                                                   RtnDel = lists:keydelete(Rid,
                                                                            1,
                                                                            Del),
                                                   {RtnDel,
                                                    RtnNew,
                                                    [{Rid, Pid} | Update]};
                                               _ -> {Del, New, Update}
                                           end,
    diff_notice_list(Rest,
                     ChangeDel,
                     ChangeNew,
                     ChangeUpdate).

broadcast_pre_recruitment_info([], _Now, _Mode, _Info,
                               _) ->
    ok;
broadcast_pre_recruitment_info([{_Rid, Pid} | Rest],
                               Now, Mode, TeamPid, Extra)
    when is_pid(TeamPid) ->
    Args = [Mode, 0, TeamPid, Extra],
    role:apply(async,
               Pid,
               {team_recruit, push_pre_recruitment_info, Args}),
    broadcast_pre_recruitment_info(Rest,
                                   Now,
                                   Mode,
                                   TeamPid,
                                   Extra);
broadcast_pre_recruitment_info([{_Rid, Pid} | Rest],
                               Now, Mode, Info = #team_recruitment{type = Type},
                               Extra) ->
    case check_chat_recruit(Type) of
        false -> skip;
        {ok, RecruitType} ->
            Args = [Mode,
                    RecruitType,
                    Info#team_recruitment{notice_list = []},
                    Extra],
            role:apply(async,
                       Pid,
                       {team_recruit, push_pre_recruitment_info, Args})
    end,
    broadcast_pre_recruitment_info(Rest,
                                   Now,
                                   Mode,
                                   Info,
                                   Extra);
broadcast_pre_recruitment_info([_H | Rest], Now, Mode,
                               Info, Extra) ->
    broadcast_pre_recruitment_info(Rest,
                                   Now,
                                   Mode,
                                   Info,
                                   Extra).

push_pre_recruitment_info(Role = #role{name = _Name,
                                       cross_type = CrossType,
                                       m_combat = #m_combat{pid = CombatPid},
                                       m_team = #m_team{recruitment = List}},
                          update, RecruitType,
                          #team_recruitment{pid = Pid, id = {Rid, Plat, ZoneId},
                                            name = Name, lev = Lev,
                                            member_num = Num, face_id = Faceid,
                                            lev_min = LevMin, lev_max = LevMax,
                                            matched = Matched, sex = Sex,
                                            classes = Classes,
                                            constellation_lev = ConstltLev,
                                            chat_recruit_info = RecruitInfo},
                          #{cross_type := CrossType})
    when not is_pid(CombatPid) ->
    case lists:keyfind(Pid, 2, List) of
        {Id, Pid} ->
            Args = [{1, ConstltLev}] ++ RecruitInfo,
            Update = [{Id,
                       Rid,
                       Plat,
                       ZoneId,
                       Name,
                       Sex,
                       Classes,
                       Faceid,
                       Lev,
                       LevMin,
                       LevMax,
                       RecruitType,
                       Num,
                       Matched,
                       Args}],
            role:link_send(Role, 11733, {[], Update, []}),
            ok;
        _ -> ok
    end;
push_pre_recruitment_info(Role = #role{name = _Name,
                                       m_combat = #m_combat{pid = CombatPid},
                                       cross_type = CrossType,
                                       m_team =
                                           MTeam = #m_team{recruitment = List,
                                                           recruitment_ids =
                                                               [FreeId
                                                                | RestIds]}},
                          new, RecruitType,
                          #team_recruitment{pid = Pid, id = {Rid, Plat, ZoneId},
                                            name = Name, lev = Lev,
                                            member_num = Num, face_id = Faceid,
                                            lev_min = LevMin, lev_max = LevMax,
                                            matched = Matched,
                                            constellation_lev = ConstltLev,
                                            sex = Sex, classes = Classes,
                                            chat_recruit_info = RecruitInfo},
                          #{cross_type := CrossType})
    when not is_pid(CombatPid) ->
    case var:get_var(Role, day, 39, 0) of
        Val when Val >= 3 -> ok;
        _ ->
            NRole = var:acc_var(Role, day, 39),
            case lists:keyfind(Pid, 2, List) of
                {Id, Pid} ->
                    Args = [{1, ConstltLev}] ++ RecruitInfo,
                    New = [{Id,
                            Rid,
                            Plat,
                            ZoneId,
                            Name,
                            Sex,
                            Classes,
                            Faceid,
                            Lev,
                            LevMin,
                            LevMax,
                            RecruitType,
                            Num,
                            Matched,
                            Args}],
                    role:link_send(Role, 11733, {New, [], []}),
                    {ok,
                     NRole#role{m_team = MTeam#m_team{recruitment = List}}};
                _ ->
                    Args = [{1, ConstltLev}] ++ RecruitInfo,
                    New = [{FreeId,
                            Rid,
                            Plat,
                            ZoneId,
                            Name,
                            Sex,
                            Classes,
                            Faceid,
                            Lev,
                            LevMin,
                            LevMax,
                            RecruitType,
                            Num,
                            Matched,
                            Args}],
                    role:link_send(Role, 11733, {New, [], []}),
                    NewTeam = MTeam#m_team{recruitment =
                                               [{FreeId, Pid} | List],
                                           recruitment_ids = RestIds},
                    {ok, NRole#role{m_team = NewTeam}}
            end
    end;
push_pre_recruitment_info(Role = #role{name = _Name,
                                       m_team = #m_team{recruitment = List}},
                          del, _RecruitType, Pid, _) ->
    case lists:keytake(Pid, 2, List) of
        {value, {Id, Pid}, _RestList} ->
            role:link_send(Role, 11733, {[], [], [Id]}),
            ok;
        _False -> ok
    end;
push_pre_recruitment_info(_Role = #role{name = _Name},
                          _Op, _RecruitType, _Info, _) ->
    logger:debug("招募错误[~ts][Op:~w]",
                 [_Name, _Op],
                 team_recruit,
                 497),
    ok.

get_recruit(Type, #role{lev = Lev, cross_type = 1}) ->
    case cross:call(team_mgr, lookup_recruit, [Type, Lev])
        of
        RecruitList when is_list(RecruitList) ->
            RecruitList1 =
                lists:keysort(#team_recruitment.member_num,
                              RecruitList),
            RecruitList2 = lists:sublist(RecruitList1, 6),
            {ok, RecruitList2};
        _ -> {false, lang:get("系统波动")}
    end;
get_recruit(Type, #role{lev = Lev}) ->
    RecruitList = team_mgr:lookup_recruit(Type, Lev),
    RecruitList1 =
        lists:keysort(#team_recruitment.member_num,
                      RecruitList),
    RecruitList2 = lists:sublist(RecruitList1, 6),
    {ok, RecruitList2}.

start_link(Mod) ->
    gen_server:start_link({local, team_recruit},
                          team_recruit,
                          [Mod],
                          []).

init([Mod]) ->
    logger:info("聊天窗口招募进程正在启动:[~w]",
                [team_recruit],
                team_recruit,
                547),
    process_flag(trap_exit, true),
    team_recruit_room = ets:new(team_recruit_room,
                                [set,
                                 named_table,
                                 public,
                                 {keypos, #team_recruit_room.lev}]),
    logger:info("聊天窗口招募进程启动完成:[~w]",
                [team_recruit],
                team_recruit,
                550),
    {ok, #state{mod = Mod}}.

handle_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.

handle_cast({reg, Info, Lev}, State) ->
    server_reg(Info, Lev),
    {noreply, State};
handle_cast({levup,
             Info = #team_mate{id = Rid},
             OldLev,
             Lev},
            State) ->
    case case catch ets:lookup(team_recruit_room, OldLev) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Room = #team_recruit_room{role_num = OldNum,
                                  members = OldMembers} ->
            Members = lists:keydelete(Rid,
                                      #team_mate.id,
                                      OldMembers),
            case catch ets:insert(team_recruit_room,
                                  Room#team_recruit_room{role_num = OldNum - 1,
                                                         members = Members})
                of
                true -> true;
                _ -> false
            end,
            server_reg(Info, Lev);
        none ->
            case catch ets:insert(team_recruit_room,
                                  #team_recruit_room{role_num = 1,
                                                     members = [Info]})
                of
                true -> true;
                _ -> false
            end;
        _False ->
            logger:error("[~w]收到未知的消息:[~w]",
                         [team_recruit, _False],
                         team_recruit,
                         594),
            skip
    end,
    {noreply, State};
handle_cast({update,
             Mate = #team_mate{id = Rid, lev = Lev}},
            State) ->
    case case catch ets:lookup(team_recruit_room, Lev) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Room = #team_recruit_room{members = OldMembers} ->
            Members = lists:keyreplace(Rid,
                                       #team_mate.id,
                                       OldMembers,
                                       Mate),
            case catch ets:insert(team_recruit_room,
                                  Room#team_recruit_room{members = Members})
                of
                true -> true;
                _ -> false
            end;
        none -> ignore;
        _False -> skip
    end,
    {noreply, State};
handle_cast({logout, Rid, Lev}, State) ->
    case case catch ets:lookup(team_recruit_room, Lev) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Room = #team_recruit_room{role_num = Num,
                                  members = Members} ->
            NewMembers = lists:keydelete(Rid,
                                         #team_mate.id,
                                         Members),
            case catch ets:insert(team_recruit_room,
                                  Room#team_recruit_room{role_num = Num - 1,
                                                         members = NewMembers})
                of
                true -> true;
                _ -> false
            end;
        none -> skip;
        _False ->
            logger:error("[~w]收到未知的消息:[~w]",
                         [team_recruit, _False],
                         team_recruit,
                         618),
            skip
    end,
    {noreply, State};
handle_cast({cancel_reg, Rid, Lev}, State) ->
    case case catch ets:lookup(team_recruit_room, Lev) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Room = #team_recruit_room{role_num = Num,
                                  members = Members} ->
            NewMembers = lists:keydelete(Rid,
                                         #team_mate.id,
                                         Members),
            case catch ets:insert(team_recruit_room,
                                  Room#team_recruit_room{role_num = Num - 1,
                                                         members = NewMembers})
                of
                true -> true;
                _ -> false
            end;
        none -> skip;
        _False ->
            logger:error("[~w]收到未知的消息:[~w]",
                         [team_recruit, _False],
                         team_recruit,
                         630),
            skip
    end,
    {noreply, State};
handle_cast(Msg, State) ->
    logger:error("[~w]收到未知的消息:[~w]",
                 [team_recruit, Msg],
                 team_recruit,
                 635),
    {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("聊天窗口招募进程退出:[~w]",
                [_Reason],
                team_recruit,
                663),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

server_reg(Info = #team_mate{id = Rid}, Lev) ->
    case case catch ets:lookup(team_recruit_room, Lev) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Room = #team_recruit_room{role_num = Num,
                                  members = Members} ->
            case lists:keytake(Rid, #team_mate.id, Members) of
                {value, #team_mate{}, Rest} ->
                    case catch ets:insert(team_recruit_room,
                                          Room#team_recruit_room{role_num = Num,
                                                                 members =
                                                                     [Info
                                                                      | Rest]})
                        of
                        true -> true;
                        _ -> false
                    end;
                _False ->
                    case catch ets:insert(team_recruit_room,
                                          Room#team_recruit_room{role_num =
                                                                     Num + 1,
                                                                 members =
                                                                     [Info
                                                                      | Members]})
                        of
                        true -> true;
                        _ -> false
                    end
            end;
        none ->
            case catch ets:insert(team_recruit_room,
                                  #team_recruit_room{lev = Lev, role_num = 1,
                                                     members = [Info]})
                of
                true -> true;
                _ -> false
            end;
        _False ->
            logger:error("[~w]收到未知的消息:[~w]",
                         [team_recruit, _False],
                         team_recruit,
                         693),
            skip
    end.

