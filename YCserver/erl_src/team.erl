-file("src/mod/team/team.erl", 1).

-module(team).

-behaviour(gen_server).

-export([init/0,
         get_status/1,
         start/2,
         start/3,
         login/2,
         logout/1,
         sync_pos/1,
         move/2,
         sync_transmit/1,
         sync_info/1,
         enter_map/2,
         send/3,
         notice_up/2,
         send_to_leader/3,
         get_leader/1,
         join/3,
         join/4,
         join_apply/3,
         leave/1,
         async_leave/1,
         async_leave/2,
         verify/3,
         update_fly/1,
         away/1,
         sync_away/1,
         follow/1,
         recall/2,
         kickout/2,
         is_team/1,
         is_leader/1,
         handover/2,
         recruit/3,
         stop_recruiting/1,
         stop_recruiting/2,
         get_fighters/1,
         get_fighters/2,
         get_members/1,
         get_teammate_pid/1,
         leader_async/2,
         async_teammate/2,
         get_avg_lev/1,
         get_members_num/1,
         escape/1,
         info/1,
         get_applys/1,
         swap_role/3,
         update_mate_formation/4,
         set_mods/2,
         calc_looks/1,
         calc/1,
         set_recruit_timer/0,
         cancel_recruit_timer/0,
         apply/3,
         avg_lev/2,
         notice/2,
         combat/1,
         enter_dungeon/2,
         del_energy_apply/1,
         rename/2,
         make_recruit_cond/3,
         async_mfa_leader/2,
         update_target/2,
         is_leader_only/1,
         update_formation/1,
         get_members_follow_num/1,
         to_leader_pos/1,
         push/2]).

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

-file("src/mod/team/team.erl", 81).

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

-file("src/mod/team/team.erl", 82).

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

-file("src/mod/team/team.erl", 83).

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

-file("src/mod/team/team.erl", 84).

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

-file("src/mod/team/team.erl", 85).

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

-file("src/mod/team/team.erl", 86).

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

-file("src/mod/team/team.erl", 87).

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

-file("src/mod/team/team.erl", 88).

-file("inc/looks.hrl", 1).

-file("src/mod/team/team.erl", 89).

-file("inc/trial.hrl", 1).

-record(trial_unit,
        {battle_id = 0,
         unit_id = 0,
         unit_baseid = 0,
         unit_name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         dir = 0,
         looks = [],
         map_id = 0,
         x = 0,
         y = 0}).

-record(m_trial,
        {ver = 3,
         mode = 0,
         order = 0,
         fighter,
         unit = #trial_unit{},
         direct_order = 0,
         clear_normal = 0,
         round = 0,
         times = 2,
         coin = 0,
         reset = 2,
         max_order_easy = 0,
         max_order_hard = 0,
         has_match = [],
         is_helped = "",
         gain_items = []}).

-record(trial_help,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         unit_id = 0,
         battle_id = 0,
         unit_name = "",
         time = 0}).

-file("src/mod/team/team.erl", 90).

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

-file("src/mod/team/team.erl", 91).

-file("inc/tower.hrl", 1).

-record(m_tower, {gain_list = [], pass_boss = []}).

-file("src/mod/team/team.erl", 92).

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

-file("src/mod/team/team.erl", 93).

-file("inc/preparation.hrl", 1).

-record(m_preparation,
        {ver = 0,
         pid :: undefined | pid(),
         id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer()}).

-record(preparation_room,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid :: undefined | pid(),
         matching = [] :: list(),
         num = 1,
         matched = 0 :: non_neg_integer(),
         match_ref :: undefined | reference(),
         mode = 1,
         is_open = true :: boolean()}).

-record(preparation_team,
        {ids = [] :: list(),
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(preparation_role,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         s_ride = 0,
         preparation_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         team_id = [] :: list(),
         partner = [] :: list(),
         group = 1 :: non_neg_integer()}).

-record(preparation_show_role,
        {id = {0, "", 0},
         name = "",
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         group = 1 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         looks = [] :: list()}).

-file("src/mod/team/team.erl", 94).

-spec init() -> #m_team{}.

init() -> #m_team{}.

get_status(#role{m_team =
                     #m_team{pid = Pid, status = Status}})
    when is_pid(Pid) ->
    {true, Status};
get_status(_) -> false.

-spec start(Leader :: #team_mate{}, Pos :: #{},
            IsFly :: 0 | 1) -> {ok, pid()} | term().

start(Leader, Pos, IsFly) ->
    StartArgs = #team_start_args{pos = Pos, is_fly = IsFly},
    gen_server:start(team, [Leader, StartArgs], []).

-spec start(Leader :: #team_mate{},
            Args :: #team_start_args{}) -> {ok, pid()} | term().

start(Leader, Args = #team_start_args{}) ->
    gen_server:start(team, [Leader, Args], []);
start(_Leader, _Args) -> {false, lang:get("无法创建队伍")}.

join(Pid, Mate = #team_mate{join_type = 2}, match,
     Role = #role{cross_type = 0}) ->
    case ets:lookup(team_recruitment, Pid) of
        [] ->
            case c_trip_mgr:enter(Role) of
                {ok, NewRole} ->
                    case do_join(Pid, Mate, NewRole) of
                        ok -> {ok, NewRole};
                        {false, Reason} -> {ok, Reason, NewRole}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _ -> do_join(Pid, Mate, Role)
    end;
join(Pid, Mate, match, Role) ->
    do_join(Pid, Mate, Role).

-spec join(Pid :: pid(), Mate :: #team_mate{},
           Role :: #role{}) -> ok | {false, Why :: string()}.

join(Pid, Mate, Role) -> do_join(Pid, Mate, Role).

do_join(Pid, Mate,
        #role{s_event = Event, s_event_pid = EventPid,
              id = RoleId, cross_type = CrossType}) ->
    case case catch gen_server:call(Pid,
                                    {join,
                                     Mate#team_mate{join_time =
                                                        date:unixtime()},
                                     #{cross_type => CrossType}},
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        ok ->
            team_util:notice_team_status(Event,
                                         EventPid,
                                         [],
                                         [{away, RoleId}]),
            ok;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("对方正忙，请稍后尝试")}
    end.

-spec join_apply(Pid :: pid(), Mate :: #team_mate{},
                 map()) -> ok | {false, Why :: string()}.

join_apply(Pid, Mate, Info) ->
    gen_server:call(Pid,
                    {join_apply,
                     Mate#team_mate{matched = date:unixtime()},
                     Info}).

-spec leave(#role{}) -> {ok, NewRole :: #role{}} |
                        {false | none, Why :: string()}.

leave(#role{m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("战斗中不能离队")};
leave(Role = #role{pid = RolePid,
                   m_team = #m_team{pid = Pid}, id = MateId,
                   s_event = Event, s_event_pid = EventPid,
                   cross_type = CrossType})
    when is_pid(Pid) ->
    case check_leave(Role) of
        true ->
            CleanRole = leave_clean([quest], Role),
            gen_server:cast(Pid, {leave, RolePid, MateId}),
            team_mgr:delete(MateId),
            FireRole = role_trigger:fire(#evt_team_leave{},
                                         CleanRole),
            team_recruit:push_recruitment_info(FireRole,
                                               del,
                                               0,
                                               Pid,
                                               #{cross_type => CrossType}),
            HelpRole = help:leader_leave(FireRole),
            Role2 = attr:calc_and_push(HelpRole#role{m_team =
                                                         #m_team{}}),
            NewRole = Role2,
            team_util:notice_team_status(Event,
                                         EventPid,
                                         [],
                                         [{none, MateId}]),
            logger:debug("退出共骑调用", [], team, 206),
            role:apply(async,
                       RolePid,
                       {mount, exit_double_ride, []}),
            role_fly:update(NewRole);
        {false, Reason} -> {false, Reason}
    end;
leave(_) -> {none, lang:get("你不在队伍中")}.

async_leave(Role) ->
    async_leave(Role, lang:get("你已脱离队伍")).

async_leave(Role = #role{pid = Pid, name = _Name},
            Msg) ->
    case leave(Role) of
        {ok, NRole} ->
            role:pack_send(Pid, 11708, {1, Msg}),
            map:role_update(NRole),
            {ok, NRole};
        _Err ->
            logger:debug("[~ts]离开队伍失败 ~w",
                         [_Name, _Err],
                         team,
                         225),
            ok
    end.

sync_away(Role = #role{id = RoleId, s_event = Event,
                       s_event_pid = EventPid,
                       m_team =
                           Mteam = #m_team{pid = TeamPid, status = Status}})
    when Status =:= 1 orelse Status =:= 2 ->
    logger:debug("暂离队伍1:~w", [RoleId], team, 234),
    case check_away(Role) of
        {false, _Reason} -> ok;
        true ->
            case case catch gen_server:call(TeamPid,
                                            {sync_away, RoleId},
                                            10000)
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                {true, NewStatus} ->
                    Role1 = attr:calc_and_push(Role#role{m_team =
                                                             Mteam#m_team{status
                                                                              =
                                                                              NewStatus}}),
                    Role2 = role_trigger:fire(#evt_team_away{}, Role1),
                    team_util:notice_team_status(Event,
                                                 EventPid,
                                                 [],
                                                 [{away, RoleId}]),
                    role_fly:update(Role2);
                _ -> ok
            end
    end;
sync_away(_) -> ok.

rename(#role{id = Id, name = Name,
             m_team = #m_team{pid = Pid}},
       _OldName)
    when is_pid(Pid) ->
    gen_server:cast(Pid, {rename, Id, Name}),
    ok;
rename(_, _) -> ok.

-spec verify(Role :: #role{}, ApplyId :: tuple(),
             1 | 0) -> ok | {false, Why :: string()}.

verify(Role = #role{m_team =
                        #m_team{pid = Pid, status = 1}},
       ApplyId, Decision)
    when is_pid(Pid) ->
    case team_mgr:check([escort,
                         tournament,
                         sworn,
                         preparation],
                        Role)
        of
        true ->
            catch gen_server:call(Pid, {verify, ApplyId, Decision});
        Else -> Else
    end;
verify(_, _ApplyId, _Decision) ->
    {false, lang:get("只有队长可以这样做")}.

-spec login(Pid :: pid(), Mate :: #team_mate{}) -> ok.

login(Pid, Mate) -> gen_server:cast(Pid, {login, Mate}).

-spec logout(#role{}) -> ok.

logout(Role = #role{s_event = Event,
                    s_event_pid = EventPid, m_team = #m_team{pid = Pid},
                    id = MateId})
    when is_pid(Pid) ->
    gen_server:cast(Pid, {logout, MateId}),
    team_util:notice_team_status(Event,
                                 EventPid,
                                 [],
                                 [{away, MateId}]),
    {ok, role_trigger:fire(#evt_team_leave{}, Role)};
logout(#role{id = Id}) ->
    team_mgr:stop_matching(Id),
    ok.

-spec sync_pos(#role{}) -> ok.

sync_pos(#role{m_team = #m_team{pid = Pid, status = 1},
               pos = Pos, id = LeaderId})
    when is_pid(Pid) ->
    gen_server:cast(Pid,
                    {sync_pos, #{leader_id => LeaderId, pos => Pos}});
sync_pos(_) -> ok.

-spec move(#role{}, list()) -> ok.

move(#role{m_team = #m_team{pid = Pid, status = 1},
           id = LeaderId, pos = #pos{map_pid = MapPid}},
     Xys)
    when is_pid(Pid) ->
    gen_server:cast(Pid,
                    {move,
                     #{leader_id => LeaderId, map_pid => MapPid,
                       xys => Xys}});
move(_, _Xys) -> ok.

sync_transmit(#role{m_team =
                        #m_team{pid = Pid, status = 1},
                    pos = #pos{map_pid = MapPid, x = X, y = Y, dir = Dir},
                    id = LeaderId})
    when is_pid(Pid) ->
    logger:debug("传送", [], team, 297),
    gen_server:cast(Pid,
                    {sync_transmit,
                     #{leader_id => LeaderId, map_pid => MapPid, x => X,
                       y => Y, dir => Dir}});
sync_transmit(_) -> ok.

enter_map(#role{m_team = #m_team{pid = Pid, status = 1},
                s_event = Event,
                pos =
                    Pos = #pos{map_grid_pid = MapGridPid,
                               map_base_id = MapBaseId},
                id = LeaderId},
          _TeamEvt)
    when is_pid(Pid) andalso not is_pid(MapGridPid) ->
    IsStop = lists:member(Event, [4]),
    case lists:member(MapBaseId, [41001, 41002, 41003]) of
        true -> stop_recruiting(Pid, [71, 72, 73]);
        _ when IsStop == true -> stop_recruiting(Pid);
        _ -> ignore
    end,
    gen_server:cast(Pid, {all_away, LeaderId, Pos});
enter_map(#role{m_team =
                    #m_team{pid = Pid, status = 1}},
          self)
    when is_pid(Pid) ->
    stop_recruiting(Pid);
enter_map(#role{m_team = #m_team{pid = Pid, status = 1},
                pos = Pos = #pos{map_base_id = MapBaseId},
                id = LeaderId, s_event = Event, m_dungeon = MDungeon},
          TeamEvt)
    when is_pid(Pid) ->
    IsStop = lists:member(Event, [4]),
    case lists:member(MapBaseId, [41001, 41002, 41003]) of
        true -> stop_recruiting(Pid, [71, 72, 73]);
        _ when IsStop == true -> stop_recruiting(Pid);
        _ -> ignore
    end,
    gen_server:cast(Pid,
                    {enter_map,
                     #{leader_id => LeaderId, pos => Pos, event => Event,
                       dungeon => MDungeon},
                     TeamEvt});
enter_map(Role = #role{s_event = Event}, _)
    when Event =/= 0 ->
    team_mgr:stop_matching(Role),
    ok;
enter_map(Role = #role{pos =
                           #pos{map_base_id = MapBaseId}},
          _) ->
    case lists:member(MapBaseId, [41001, 41002, 41003]) of
        true -> team_mgr:stop_matching(Role, [71, 72, 73]);
        _ -> ignore
    end,
    ok.

update_fly(#role{m_team =
                     #m_team{pid = Pid, status = 1},
                 id = LeaderId, s_ride = IsFly})
    when is_pid(Pid) ->
    gen_server:cast(Pid, {update_fly, LeaderId, IsFly});
update_fly(_) -> ok.

set_mods(#role{m_team = #m_team{pid = Pid, status = 1},
               id = LeaderId},
         Mods)
    when is_pid(Pid) ->
    gen_server:cast(Pid, {set_mods, LeaderId, Mods});
set_mods(_, _) -> ok.

calc_looks(#role{m_team =
                     #m_team{mod = Mod, status = 2, pid = Pid}})
    when is_pid(Pid) andalso Mod =/= 0 ->
    [{53, 0, Mod, ""}];
calc_looks(#role{m_team = _M}) -> [].

calc(Role = #role{m_team =
                      #m_team{speed = Speed, status = 2, pid = Pid}})
    when is_pid(Pid) andalso Speed =/= 0 ->
    Role#role{speed = Speed};
calc(Role = #role{id = LeaderId, speed = Speed,
                  m_team = MTeam = #m_team{status = 1, pid = Pid}})
    when is_pid(Pid) andalso Speed =/= 0 ->
    gen_server:cast(Pid, {set_speed, LeaderId, Speed}),
    Role#role{m_team = MTeam#m_team{speed = Speed}};
calc(Role) -> Role.

swap_role(#role{id = RoleId, pid = RolePid,
                m_team = #m_team{pid = Pid, status = 1}},
          Sid, Tid)
    when is_pid(Pid) andalso
             Sid =/= RoleId andalso
                 Tid =/= RoleId andalso Sid =/= Tid ->
    gen_server:cast(Pid,
                    {swap_role, RoleId, RolePid, Sid, Tid});
swap_role(Role, _, _) ->
    role:link_send(Role, 12903, {0, lang:get("不能移动自身的位置")}),
    ok.

combat(#role{id = LeaderId,
             m_team = #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    gen_server:cast(Pid, {combat, LeaderId});
combat(_) -> ok.

enter_dungeon(#role{id = RoleID,
                    m_team = #m_team{pid = Pid}},
              DunID)
    when erlang:is_pid(Pid) ->
    gen_server:cast(Pid, {enter_dungeon, RoleID, DunID});
enter_dungeon(_, _) -> ok.

update_mate_formation(#role{id = RoleId,
                            m_team = #m_team{pid = Pid}},
                      FormationId, FormationLev, FormationName)
    when is_pid(Pid) ->
    gen_server:cast(Pid,
                    {update_mate_formation,
                     RoleId,
                     FormationId,
                     FormationLev,
                     FormationName});
update_mate_formation(_, _, _, _) -> ok.

sync_info(Role = #role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {ok, Mate} = role_convert:to(team_mate, Role),
    gen_server:cast(Pid, {sync_info, Mate});
sync_info(_) -> ok.

-spec send(#role{} | pid(), Code :: pos_integer(),
           Data :: tuple()) -> ok.

send(#role{m_team = #m_team{pid = Pid}}, Code, Data) ->
    send(Pid, Code, Data);
send(Pid, Code, Data) when is_pid(Pid) ->
    gen_server:cast(Pid, {send, Code, Data});
send(_, _C, _D) -> ok.

notice_up(#role{m_team = #m_team{pid = Pid}}, Msg) ->
    notice_up(Pid, Msg);
notice_up(Pid, Msg) when is_pid(Pid) ->
    gen_server:cast(Pid, {notice_up, Msg}),
    ok;
notice_up(Members, Msg) when is_list(Members) ->
    do_notice_up(Members, Msg);
notice_up(_, _) -> ok.

-spec send_to_leader(Pid :: pid(),
                     Code :: pos_integer(), Data :: tuple()) -> ok.

send_to_leader(Pid, Code, Data) when is_pid(Pid) ->
    gen_server:cast(Pid, {send_to_leader, Code, Data});
send_to_leader(_, _C, _D) -> ok.

-spec away(#role{}) -> ok.

away(Role = #role{s_event = Event,
                  s_event_pid = EventPid,
                  m_team = Mteam = #m_team{pid = TeamPid, status = 2},
                  id = MateId}) ->
    case check_away(Role) of
        {false, Reason} -> {false, Reason};
        true ->
            {ok, NRole} = mount:away_exit_ride(Role),
            gen_server:call(TeamPid, {away, MateId}),
            Role1 = attr:calc_and_push(NRole#role{m_team =
                                                      Mteam#m_team{status =
                                                                       3}}),
            Role2 = role_trigger:fire(#evt_team_away{}, Role1),
            team_util:notice_team_status(Event,
                                         EventPid,
                                         [],
                                         [{away, MateId}]),
            role_fly:update(Role2)
    end;
away(_) -> ok.

-spec follow(#role{}) -> ok.

follow(Role = #role{m_team =
                        #m_team{pid = TeamPid, status = 3},
                    id = MateId, pid = Pid, s_event = Event, pos = Pos})
    when is_pid(Pid) ->
    case check_follow(Role) of
        true ->
            TempleMap = quest:can_enter_temple(Role),
            {ok, TeamMate} = role_convert:to(team_mate, Role),
            gen_server:cast(TeamPid,
                            {follow,
                             #{id => MateId, pid => Pid, event => Event,
                               pos => Pos, temple_map => TempleMap,
                               team_mate => TeamMate}});
        {false, Reason} ->
            notice:send({pid, Pid}, 1, Reason),
            ok
    end;
follow(_) -> ok.

-spec to_leader_pos(#role{}) -> ok.

to_leader_pos(Role = #role{m_team =
                               #m_team{pid = TeamPid, status = 2},
                           id = MateId, pid = Pid, s_event = Event, pos = Pos})
    when is_pid(Pid) ->
    case check_follow(Role) of
        true ->
            {ok, TeamMate} = role_convert:to(team_mate, Role),
            gen_server:cast(TeamPid,
                            {to_leader_pos,
                             #{id => MateId, pid => Pid, event => Event,
                               pos => Pos, team_mate => TeamMate}});
        {false, Reason} ->
            notice:send({pid, Pid}, 1, Reason),
            ok
    end;
to_leader_pos(_) -> ok.

-spec recall(#role{}, MateId :: tuple()) -> ok |
                                            {false, Why :: string()}.

recall(#role{m_team = #m_team{pid = Pid, status = 1},
             s_event = Event,
             m_dungeon = #m_dungeon{dun_id = DunId}},
       MateId)
    when is_pid(Pid) ->
    case Event of
        1 ->
            case dungeon_data:get(DunId) of
                #dungeon_base{type = 4} ->
                    {false, lang:get("秘境探索中，暂时不能召唤归队")};
                _ -> gen_server:call(Pid, {recall, MateId})
            end;
        _ -> gen_server:call(Pid, {recall, MateId})
    end;
recall(_, _MateId) -> {false, lang:get("只有队长可以召唤")}.

-spec kickout(#role{}, MateId :: tuple()) -> ok |
                                             {false, Why :: string()}.

kickout(Role = #role{m_team =
                         #m_team{pid = Pid, status = 1},
                     m_combat = MCombat},
        MateId)
    when is_pid(Pid) ->
    case check_kickout(Role) of
        true ->
            IsCombating = case MCombat of
                              #m_combat{pid = CombatPid}
                                  when is_pid(CombatPid) ->
                                  true;
                              _ -> false
                          end,
            case gen_server:call(Pid,
                                 {kickout, MateId, IsCombating})
                of
                {ok, DelEnergy} when DelEnergy > 0 ->
                    CleanRole = kickout_clean([quest], MateId, Role),
                    del_del_energy_apply(CleanRole, DelEnergy);
                {ok, _} ->
                    CleanRole = kickout_clean([quest], MateId, Role),
                    {ok, CleanRole};
                Err -> Err
            end;
        {false, Reason} -> {false, Reason}
    end;
kickout(_, _MateId) -> {false, lang:get("只有队长可以这样做")}.

del_energy_apply(Role = #role{assets =
                                  #assets{energy = Energy}}) ->
    Loss = format:val_to_loss([{90006, min(10, Energy)}]),
    case role_gain:do_notice(Loss, Role, lang:get("")) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> {ok, Role}
    end.

del_del_energy_apply(Role, DelEnergy) ->
    Loss = format:val_to_loss([{90006, DelEnergy}]),
    case role_gain:do_notice(Loss, Role, lang:get("")) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> {ok, Role}
    end.

-spec handover(#role{}, MateId :: tuple()) -> ok |
                                              {false, Why :: string()}.

handover(Role = #role{pid = PPid, s_event = Event,
                      s_event_pid = EventPid,
                      m_team = Mteam = #m_team{pid = Pid, status = 1},
                      id = Origin},
         TargetId)
    when is_pid(Pid) ->
    case team_util:check_handover([escort,
                                   qualifying,
                                   combat,
                                   canyon_summit],
                                  Role)
        of
        true ->
            case gen_server:call(Pid, {handover, Origin, TargetId})
                of
                {ok, Status, NewLeaderId} ->
                    NewMteam = Mteam#m_team{status = Status},
                    Role1 = Role#role{m_team = NewMteam},
                    logger:debug("委任:~w",
                                 [{Status, NewLeaderId}],
                                 team,
                                 544),
                    role:apply(async, PPid, {mount, exit_double_ride, []}),
                    role:apply(async,
                               NewLeaderId,
                               {mount, exit_double_ride, []}),
                    NewRole = role_trigger:fire(#evt_team_appoint{status =
                                                                      Status,
                                                                  leader_id =
                                                                      NewLeaderId},
                                                Role1),
                    map:role_update(NewRole),
                    Info = case Status of
                               2 -> [{follow, Origin}];
                               _ -> [{away, Origin}]
                           end,
                    team_util:notice_team_status(Event, EventPid, [], Info),
                    {ok, NewRole};
                Else -> Else
            end;
        Else -> Else
    end;
handover(#role{}, _MateId) ->
    {false, lang:get("你不是队长")}.

-spec recruit(#role{}, Type :: non_neg_integer(),
              Flag :: non_neg_integer()) -> ok |
                                            {false, Why :: string()}.

recruit(Role = #role{m_team =
                         #m_team{pid = Pid, status = 1}},
        Type, Flag)
    when is_pid(Pid) ->
    case check_recruit(Role, Type, Flag) of
        {true, LevMin, LevMax, RecruitArgs} ->
            case case catch gen_server:call(Pid,
                                            {recruit,
                                             Type,
                                             LevMin,
                                             LevMax,
                                             Flag,
                                             RecruitArgs},
                                            10000)
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                true -> true;
                {false, Reason} -> {false, Reason};
                _ -> {false, lang:get("系统繁忙，请稍后尝试")}
            end;
        {false, Reason} -> {false, Reason}
    end;
recruit(#role{}, _Type, _LevLimit) ->
    {false, lang:get("你不是队长")}.

-spec stop_recruiting(#role{}) -> ok |
                                  {false, Why :: string()}.

stop_recruiting(#role{m_team =
                          #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    stop_recruiting(Pid);
stop_recruiting(Pid) when is_pid(Pid) ->
    gen_server:cast(Pid, stop_recruiting);
stop_recruiting(#role{}) -> {false, lang:get("你不是队长")}.

stop_recruiting(#role{m_team =
                          #m_team{pid = Pid, status = 1}},
                Types)
    when is_pid(Pid) ->
    stop_recruiting(Pid, Types);
stop_recruiting(Pid, Types) when is_pid(Pid) ->
    gen_server:cast(Pid, {stop_recruiting, Types});
stop_recruiting(#role{}, _) ->
    {false, lang:get("你不是队长")}.

-spec get_fighters(#role{}) -> {ok,
                                [#role{} | tuple()]} |
                               {false, Why :: string()}.

get_fighters(#role{m_team =
                       #m_team{status = 2, pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("你在跟随队长中，不能发起战斗")};
get_fighters(Role = #role{id = RoleId,
                          m_team = #m_team{status = 1, pid = Pid}})
    when is_pid(Pid) ->
    case catch gen_server:call(Pid,
                               {get_fight_info, RoleId})
        of
        {ok, TeamMate, GuardPosList} ->
            {ok, [{leader, Role, GuardPosList} | TeamMate]};
        {false, Reason} -> {false, Reason};
        null -> {ok, [Role]};
        _ -> {false, lang:get("无法请求队伍信息, 发起战斗失败")}
    end;
get_fighters(Wrap = #fighter_wrap{m_team =
                                      #m_team{status = 2, pid = Pid},
                                  fighter = #fighter{origin_id = RoleId}})
    when is_pid(Pid) ->
    case catch gen_server:call(Pid, get_fight_info) of
        {ok, [{leader, RoleId, GuardPosList} | TeamMates]} ->
            {ok, [{leader, Wrap, GuardPosList} | TeamMates]};
        {ok, [Leader | TeamMates]} ->
            {ok,
             [Leader | lists:keyreplace(RoleId,
                                        #team_mate.id,
                                        TeamMates,
                                        Wrap)]};
        _ -> {ok, [Wrap]}
    end;
get_fighters(Wrap = #fighter_wrap{m_team =
                                      #m_team{status = 1, pid = Pid},
                                  fighter = #fighter{origin_id = RoleId}})
    when is_pid(Pid) ->
    case catch gen_server:call(Pid,
                               {get_fight_info, RoleId})
        of
        {ok, TeamMate, GuardPosList} ->
            {ok, [{leader, Wrap, GuardPosList} | TeamMate]};
        {false, Reason} -> {false, Reason};
        null -> {ok, [Wrap]};
        _ -> {false, lang:get("无法请求队伍信息, 发起战斗失败")}
    end;
get_fighters(Role = #fighter_wrap{}) -> {ok, [Role]};
get_fighters(Role = #role{}) -> {ok, [Role]}.

get_fighters(RoleId, TeamPid) when is_pid(TeamPid) ->
    case catch gen_server:call(TeamPid,
                               {get_fight_info, RoleId})
        of
        {ok, TeamMate, GuardPosList} ->
            {ok, [{leader, RoleId, GuardPosList} | TeamMate]};
        {false, Reason} -> {false, Reason};
        null -> {ok, [RoleId]};
        _ -> {false, lang:get("无法请求队伍信息, 发起战斗失败")}
    end;
get_fighters(RoleId, _TeamPid) -> {ok, [RoleId]}.

-spec escape(#role{}) -> ok.

escape(#role{m_team = #m_team{pid = Pid}, id = MateId})
    when is_pid(Pid) ->
    gen_server:cast(Pid, {escape, MateId});
escape(_) -> ok.

get_teammate_pid(#role{id = Id,
                       m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    case case catch gen_server:call(Pid,
                                    {get_teammate_pid, Id},
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        Pids when is_list(Pids) -> Pids;
        _ -> []
    end;
get_teammate_pid(_Role) -> [].

get_members(#role{id = Id, m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    case case catch gen_server:call(Pid,
                                    {get_members, Id},
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        Members when is_list(Members) -> Members;
        _ -> []
    end;
get_members(_Role) -> [].

leader_async(#role{id = Id,
                   m_team = #m_team{pid = Pid, status = 1}},
             MFA) ->
    gen_server:cast(Pid, {async_teammate, Id, MFA}),
    ok;
leader_async(_Role, _MFA) -> false.

async_teammate(#role{id = Id,
                     m_team = #m_team{pid = Pid}},
               MFA)
    when is_pid(Pid) ->
    gen_server:cast(Pid, {async_teammate, Id, MFA}),
    ok;
async_teammate(_Role, _MFA) -> false.

is_team(#role{m_team = #m_team{pid = undefined}}) ->
    false;
is_team(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    true;
is_team(_Role) -> false.

is_leader(#role{m_team = #m_team{status = 1}}) -> true;
is_leader(_) -> false.

get_avg_lev(#role{m_team = #m_team{pid = undefined}}) ->
    {false, lang:get("您当前不在队伍中")};
get_avg_lev(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    case catch gen_server:call(Pid,
                               {calc_meta_attr, avg_lev},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
get_avg_lev(_Role) -> false.

get_members_num(#role{m_team =
                          #m_team{pid = undefined}}) ->
    false;
get_members_num(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    case catch gen_server:call(Pid,
                               {calc_meta_attr, members_num},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
get_members_num(#role{}) -> false.

get_members_follow_num(#role{m_team =
                                 #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    case catch gen_server:call(Pid,
                               {calc_meta_attr, members_num_follow},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
get_members_follow_num(#role{}) -> false.

-spec info(#role{}) -> ok.

info(Role = #role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    case info(Pid) of
        error -> {false, Role#role{m_team = #m_team{}}};
        Else -> Else
    end;
info(Pid) when is_pid(Pid) ->
    case case catch gen_server:call(Pid, info, 10000) of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {ok, Team = #team{}} -> {ok, Team};
        {error, _} -> error;
        _Err ->
            logger:error("请求队伍[~w]发生错误[~w]",
                         [Pid, _Err],
                         team,
                         730),
            false
    end;
info(_) -> {ok, #team{}}.

get_leader(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    get_leader(Pid);
get_leader(Pid) when is_pid(Pid) ->
    case catch gen_server:call(Pid, get_leader, 10000) of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
get_leader(_) -> false.

-spec get_applys(#role{}) -> list().

get_applys(#role{m_team =
                     #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    gen_server:call(Pid, get_applys);
get_applys(_) -> [].

-spec apply(T, Team, Mfa) -> ok |
                             {error, not_pid} |
                             {error, self_call} |
                             Reply when T :: async | sync,
                                        Team :: pid() | #role{},
                                        Mfa :: {F} | {F, A} | {M, F, A},
                                        M :: atom(), F :: function() | atom(),
                                        A :: list(), Reply :: term().

apply(T, #role{m_team = #m_team{pid = TeamPid}}, Mfa) ->
    team:apply(T, TeamPid, Mfa);
apply(async, TeamPid, _Mfa) when not is_pid(TeamPid) ->
    logger:error("队伍回调使用非PID，无法调用[~w]", [_Mfa], team, 762),
    ok;
apply(async, TeamPid, {F}) ->
    TeamPid ! {apply_async, {F}},
    ok;
apply(async, TeamPid, {F, A}) ->
    TeamPid ! {apply_async, {F, A}},
    ok;
apply(async, TeamPid, {M, F, A}) ->
    TeamPid ! {apply_async, {M, F, A}},
    ok;
apply(sync, TeamPid, _Mfa) when not is_pid(TeamPid) ->
    {error, not_pid};
apply(sync, TeamPid, Mfa) when self() =:= TeamPid ->
    {M, F, _, _} = hd(tl(erlang:get_stacktrace())),
    logger:error("调用者[~w:~w]执行apply[~w]时发生错误：调用了自身",
                 [M, F, Mfa],
                 team,
                 777),
    {error, self_call};
apply(sync, TeamPid, {F}) ->
    case catch gen_server:call(TeamPid,
                               {apply_sync, F},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
apply(sync, TeamPid, {F, A}) ->
    case catch gen_server:call(TeamPid,
                               {apply_sync, {F, A}},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
apply(sync, TeamPid, {M, F, A}) ->
    case catch gen_server:call(TeamPid,
                               {apply_sync, {M, F, A}},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

notice(#role{m_team = #m_team{pid = Pid}}, Msg)
    when is_pid(Pid) ->
    Pid ! {notice, Msg},
    ok;
notice(_, _) -> ok.

update_target(#role{m_team =
                        #m_team{pid = Pid, status = 1}},
              Target)
    when is_pid(Pid) ->
    gen_server:cast(Pid, {update_target, Target}),
    ok;
update_target(_Role, _Target) ->
    {false, lang:get("只有队长才能变更队伍目标")}.

init([Leader = #team_mate{id = MateId,
                          formation_id = TeamFormation,
                          formation_lev = TeamFormationLev},
      #team_start_args{pos = Pos, is_fly = IsFly,
                       target = Target}]) ->
    Leader1 = Leader#team_mate{team_pid = self()},
    CrossType = case env:get(is_center) of
                    true -> 1;
                    _ ->
                        case env:get(is_big_world_center) of
                            true -> 2;
                            _ -> 0
                        end
                end,
    Team = #team{leader = Leader1, members = [Leader1],
                 pos = Pos, pid = self(), is_fly = IsFly,
                 team_formation = TeamFormation,
                 team_formation_lev = TeamFormationLev, order = [MateId],
                 member_num = 1, target = Target,
                 cross_type = CrossType},
    team_mgr:update(Leader1),
    team_mgr:sync(Team, Team),
    push(Team, 11700),
    {ok, Team}.

handle_call({join, _, _}, _From,
            Team = #team{members = Members})
    when length(Members) >= 5 ->
    {reply, {false, lang:get("队伍人数已满")}, Team};
handle_call({join,
             Mate = #team_mate{id = Id, pid = JoinPid, name = Name,
                               lev = MLev, join_type = JoinType,
                               join_sub_type = JoinSubType,
                               join_time = JoinTime},
             #{cross_type := CrossType}},
            _From,
            Team = #team{status = OldStatus, members = Members,
                         order = Order, type = Type, applys = Applys,
                         leader = Leader, cross_type = CrossType}) ->
    NewMate = Mate#team_mate{team_pid = self(), status = 3},
    NewMembers = lists:keystore(Id,
                                #team_mate.id,
                                Members,
                                NewMate),
    NewOrder = Order ++ [Id],
    JoinMsg = join_msg(Type, Name),
    team_util:broadcast(NewMembers, notice, JoinMsg),
    team_util:notice_senior(Members, MLev),
    team_mgr:update(NewMate),
    MembersNum = length(NewMembers),
    Team1 = Team#team{members = NewMembers,
                      order = NewOrder, member_num = MembersNum},
    MaxNum = case Type of
                 63 -> 2;
                 _ ->
                     case team_data:get(Type) of
                         #{type := 14} -> 2;
                         #{type := 13} -> 2;
                         #{type := 60} -> 2;
                         _ -> 5
                     end
             end,
    {NewStatus, NewApplys} = case MembersNum >= MaxNum of
                                 true when OldStatus =:= 1 ->
                                     Msg = case Type of
                                               _ -> lang:get("已停止招募")
                                           end,
                                     push_leader(Leader, 11719, {1, Msg}),
                                     {0, []};
                                 true -> {OldStatus, []};
                                 _ -> {OldStatus, Applys}
                             end,
    NewTeam = case JoinType of
                  2 when JoinSubType == 51 ->
                      Team1#team{status = NewStatus, applys = NewApplys,
                                 combat_num = 0, last_join_time = JoinTime};
                  _ -> Team1#team{status = NewStatus, applys = NewApplys}
              end,
    team_mgr:sync(Team, NewTeam),
    push_11700([NewMate], NewTeam),
    team_util:broadcast(Members,
                        11726,
                        {[NewMate], NewOrder}),
    async_fire_leader(Leader,
                      [#evt_team_join{pid = JoinPid}]),
    async_mfa_leader(Leader,
                     {team_role, callback, [{member_update, MembersNum}]}),
    push(NewTeam, 11725),
    {reply, ok, NewTeam};
handle_call({join, _, #{cross_type := 1}}, _From,
            Team) ->
    {reply, {false, lang:get("对方不在跨服中，不能加入")}, Team};
handle_call({join, _A, _B}, _From, Team) ->
    logger:debug("=========:~w", [{Team, _B}], team, 886),
    {reply, {false, lang:get("对方队伍跨服中，不能加入")}, Team};
handle_call({join_apply, _Mate, _}, _From,
            Team = #team{members = Members})
    when length(Members) >= 5 ->
    {reply, {false, lang:get("队伍已经满员了")}, Team};
handle_call({join_apply,
             Mate = #team_mate{id = Id, pid = Pid},
             #{cross_type := CrossType}},
            _From,
            Team = #team{applys = Applys, cross_type = CrossType,
                         leader = #team_mate{name = LeaderName}}) ->
    case lists:keyfind(Id, #team_mate.id, Applys) of
        false ->
            NewApplys = lists:sublist([Mate | Applys], 10),
            NewTeam = Team#team{applys = NewApplys},
            push(NewTeam, {11717, Mate}),
            ReturnMsg =
                notice:format(lang:get("你申请加入~ts的队伍，请耐心等待回复"),
                              [{role_2, LeaderName}]),
            role:pack_send(Pid, 11704, {1, ReturnMsg}),
            {reply, ok, NewTeam};
        _ ->
            {reply, {false, lang:get("你已向对方发过队伍邀请，请耐心等待回复")}, Team}
    end;
handle_call({join_apply, _, #{cross_type := 1}}, _From,
            Team) ->
    {reply, {false, lang:get("对方不在跨服中，不能加入")}, Team};
handle_call({join_apply, _A, _B}, _From, Team) ->
    logger:debug("=========:~w", [{_A, _B}], team, 907),
    {reply, {false, lang:get("对方队伍跨服中，不能加入")}, Team};
handle_call({recall, MateId}, _From,
            Team = #team{members = Members}) ->
    Reply = case lists:keyfind(MateId,
                               #team_mate.id,
                               Members)
                of
                #team_mate{status = 3, pid = Pid} ->
                    role:apply(async, Pid, {team_role, callback, [recall]}),
                    ok;
                _ -> {false, lang:get("队友不在暂离状态")}
            end,
    {reply, Reply, Team};
handle_call({kickout, MateId, IsCombating}, _From,
            Team = #team{members = Members, order = Order,
                         leader = Leader}) ->
    Reply = case lists:keyfind(MateId,
                               #team_mate.id,
                               Members)
                of
                #team_mate{pid = Pid}
                    when IsCombating andalso is_pid(Pid) ->
                    {false, lang:get("战斗中不能踢出队友")};
                M = #team_mate{pid = Pid, name = Name}
                    when is_pid(Pid) ->
                    logger:debug("踢出 ~w", [MateId], team, 927),
                    role:apply(async,
                               MateId,
                               {mount, exit_double_ride, []}),
                    team_mgr:delete(MateId),
                    role:apply(async,
                               Pid,
                               {team_role, callback, [{kickout, M}]}),
                    Members1 = lists:keydelete(MateId,
                                               #team_mate.id,
                                               Members),
                    team_util:broadcast(Members1,
                                        notice,
                                        util:flist(lang:get("~ts被队长请离了队伍"),
                                                   [Name])),
                    Order1 = lists:delete(MateId, Order),
                    {true, Members1, Order1, M};
                M = #team_mate{name = Name} ->
                    logger:debug("踢出 ~w", [MateId], team, 936),
                    role:apply(async,
                               MateId,
                               {mount, exit_double_ride, []}),
                    team_mgr:delete(MateId),
                    Members1 = lists:keydelete(MateId,
                                               #team_mate.id,
                                               Members),
                    team_util:broadcast(Members1,
                                        notice,
                                        util:flist(lang:get("~ts被队长请离了队伍"),
                                                   [Name])),
                    Order1 = lists:delete(MateId, Order),
                    {true, Members1, Order1, M};
                _ -> {false, lang:get("当前队员不在队伍中")}
            end,
    case Reply of
        {false, Reason} -> {reply, {false, Reason}, Team};
        {true,
         NewMembers,
         NewOrder,
         #team_mate{status = MateStatus, join_time = JoinTime,
                    join_type = JoinType, join_sub_type = JoinSubType,
                    combat_num = CombatNum}} ->
            MembersNum = length(NewMembers),
            NewTeam = Team#team{members = NewMembers,
                                order = NewOrder, member_num = MembersNum},
            async_mfa_leader(Leader,
                             {team_role,
                              callback,
                              [{member_update, MembersNum}]}),
            case Leader of
                #team_mate{id = LeaderId} ->
                    catch dungeon_team:sync_kickout(LeaderId, MateId),
                    async_mfa_leader(Leader,
                                     {team_util,
                                      async_notice_team_status,
                                      [NewMembers, [{leader, LeaderId}]]});
                _ -> skip
            end,
            team_mgr:sync(Team, NewTeam),
            team_util:broadcast(NewMembers,
                                11727,
                                {[MateId], NewOrder}),
            Now = date:unixtime(),
            DelEnergy = case MateStatus of
                            2 when JoinType == 2 andalso JoinSubType == 51 ->
                                case CombatNum >= 2 orelse Now - JoinTime >= 180
                                    of
                                    true -> 0;
                                    _ -> 10
                                end;
                            2 when JoinSubType == 4 ->
                                case CombatNum > 0 of
                                    true ->
                                        case role_query:attr(by_id,
                                                             MateId,
                                                             [#role.pos])
                                            of
                                            {ok,
                                             [#pos{map_base_id = MapBaseId}]} ->
                                                dungeon_data:get_kickout_energy(MapBaseId);
                                            _ -> 0
                                        end;
                                    _ -> 0
                                end;
                            _ -> 0
                        end,
            {reply, {ok, DelEnergy}, NewTeam}
    end;
handle_call({handover, OriginId, TargetId}, _From,
            Team = #team{members = Members, order = Order}) ->
    Result = case lists:keyfind(OriginId,
                                #team_mate.id,
                                Members)
                 of
                 Origin = #team_mate{status = 1} ->
                     case lists:keyfind(TargetId, #team_mate.id, Members) of
                         #team_mate{status = 3} ->
                             {false, lang:get("无法委任暂离队员，请先让他归队再来委任队长")};
                         #team_mate{status = 4} ->
                             {false, lang:get("无法委任下线队员，请先让他归队再来委任队长")};
                         M = #team_mate{status = 2, pid = Pid,
                                        name = LeaderName}
                             when is_pid(Pid) ->
                             M1 = M#team_mate{status = 1},
                             Origin1 = Origin#team_mate{status = 2},
                             Members1 = lists:keyreplace(OriginId,
                                                         #team_mate.id,
                                                         Members,
                                                         Origin1),
                             Members2 = lists:keyreplace(TargetId,
                                                         #team_mate.id,
                                                         Members1,
                                                         M1),
                             role:apply(async,
                                        Pid,
                                        {team_role,
                                         callback,
                                         [{appoint, 1, Members2}]}),
                             quest_shipping:del_all_unit(Members),
                             role:apply(async,
                                        Pid,
                                        {quest_shipping, async_unit, []}),
                             team_mgr:update(Origin1),
                             team_mgr:update(M1),
                             team_util:broadcast(Members2,
                                                 notice,
                                                 util:flist(lang:get("~ts成为新队长"),
                                                            [LeaderName])),
                             Order1 = team_util:exchange_order(Order,
                                                               OriginId,
                                                               TargetId),
                             team_util:broadcast(Members2,
                                                 11726,
                                                 {[M1, Origin1], Order1}),
                             dungeon_team:handover(TargetId),
                             {true, 2, Members2, Order1, M1};
                         _ -> {false, lang:get("不能委任给下线队员")}
                     end;
                 _ -> {false, lang:get("不是队长")}
             end,
    case Result of
        {true,
         NewStatus,
         NewMembers,
         NewOrder,
         NewLeader = #team_mate{id = LeaderId}} ->
            NewTeam = update_formation(Team#team{members =
                                                     NewMembers,
                                                 order = NewOrder,
                                                 usurpers = [],
                                                 leader = NewLeader}),
            team_mgr:sync(Team, NewTeam),
            push(NewTeam, 11725),
            {reply, {ok, NewStatus, LeaderId}, NewTeam};
        {false, Reason} -> {reply, {false, Reason}, Team}
    end;
handle_call(get_follows, _From,
            Team = #team{members = Members}) ->
    Reply = {ok,
             [Id || #team_mate{id = Id, status = 2} <- Members]},
    {reply, Reply, Team};
handle_call({get_fight_info, LeaderId}, _From,
            Team = #team{members = Members, order = Order}) ->
    Reply = case lists:keyfind(LeaderId,
                               #team_mate.id,
                               Members)
                of
                #team_mate{status = 1} ->
                    do_get_fight_info(Members, Order);
                #team_mate{status = 2} ->
                    {false, lang:get("只有队长或暂离队员才能发起战斗")};
                _ -> null
            end,
    {reply, Reply, Team};
handle_call(get_fight_info, _From,
            Team = #team{members = Members, order = Order,
                         leader = #team_mate{id = Id}}) ->
    {ok, Teammates, GuardPosList} =
        do_get_fight_info(Members, Order),
    Reply = {ok, [{leader, Id, GuardPosList} | Teammates]},
    {reply, Reply, Team};
handle_call({get_teammate_pid, CallerId}, _From,
            Team = #team{members = Members}) ->
    Pids = [Pid
            || #team_mate{id = Id, pid = Pid} <- Members,
               Id =/= CallerId],
    {reply, Pids, Team};
handle_call({get_members, CallerId}, _From,
            Team = #team{members = Members}) ->
    Teammates = [Teammate
                 || Teammate = #team_mate{id = Id} <- Members,
                    Id =/= CallerId],
    {reply, Teammates, Team};
handle_call({calc_meta_attr, Type}, _From, Team) ->
    Reply = do_calc_team_meta_attr(Type, Team),
    {reply, Reply, Team};
handle_call(info, _From, Team) ->
    {reply, {ok, Team}, Team};
handle_call(get_leader, _From,
            Team = #team{members = Members}) ->
    Reply = case lists:keyfind(1,
                               #team_mate.status,
                               Members)
                of
                TeamMate = #team_mate{} -> {true, TeamMate};
                _ -> false
            end,
    {reply, Reply, Team};
handle_call(get_applys, _From,
            Team = #team{applys = Applys}) ->
    Reply = Applys,
    {reply, Reply, Team};
handle_call({verify, Id, 0}, _From,
            Team = #team{applys = Applys}) ->
    case lists:keyfind(Id, #team_mate.id, Applys) of
        #team_mate{} ->
            NewTeam = Team#team{applys =
                                    lists:keydelete(Id, #team_mate.id, Applys)},
            push(NewTeam, 11716),
            {reply, ok, NewTeam};
        _ -> {reply, {false, lang:get("不在申请列表")}, Team}
    end;
handle_call({verify, Id, 1}, _From,
            Team = #team{status = OldStatus, type = Type,
                         applys = Applys, members = Members, order = Order,
                         leader = Leader}) ->
    Now = date:unixtime(),
    case lists:keyfind(Id, #team_mate.id, Applys) of
        #team_mate{} when length(Members) >= 5 ->
            NewTeam = Team#team{applys = []},
            push(NewTeam, 11716),
            {reply, {false, lang:get("队伍人数已满")}, NewTeam};
        #team_mate{matched = Matched}
            when Now - Matched >= 180 ->
            NewTeam = Team#team{applys =
                                    lists:keydelete(Id, #team_mate.id, Applys)},
            push(NewTeam, 11716),
            {reply, {false, lang:get("请求已过期")}, NewTeam};
        M = #team_mate{pid = Pid, name = Name, lev = MLev} ->
            Result = case role:apply(sync,
                                     Pid,
                                     {team_role, callback, [{verify, self()}]})
                         of
                         ok ->
                             NewM = M#team_mate{team_pid = self(),
                                                join_time = date:unixtime(),
                                                status = 3},
                             team_mgr:update(NewM),
                             NewMbs = lists:keystore(Id,
                                                     #team_mate.id,
                                                     Members,
                                                     NewM),
                             team_util:broadcast(NewMbs,
                                                 notice,
                                                 util:flist(lang:get("~ts加入了队伍"),
                                                            [Name])),
                             team_util:notice_senior(Members, MLev),
                             Order1 = Order ++ [Id],
                             team_util:broadcast(Members,
                                                 11726,
                                                 {[NewM], Order1}),
                             {true, Pid, NewMbs, Order1};
                         {error, not_online} -> {false, lang:get("对方现在不在线")};
                         {false, Reason} -> {false, Reason};
                         _ -> {false, lang:get("对方似乎正忙，请稍后尝试")}
                     end,
            case Result of
                {true, MatePid, NewMembers, NewOrder} ->
                    MembersNum = length(NewMembers),
                    MaxNum = case Type of
                                 63 -> 2;
                                 _ ->
                                     case team_data:get(Type) of
                                         #{type := 14} -> 2;
                                         _ -> 5
                                     end
                             end,
                    {NewStatus, NewApplys} = case MembersNum >= MaxNum of
                                                 true when OldStatus =:= 1 ->
                                                     push_leader(Leader,
                                                                 11719,
                                                                 {1,
                                                                  lang:get("已停止招募")}),
                                                     {0, []};
                                                 true -> {OldStatus, []};
                                                 false ->
                                                     {OldStatus,
                                                      lists:keydelete(Id,
                                                                      #team_mate.id,
                                                                      Applys)}
                                             end,
                    NewTeam = Team#team{status = NewStatus,
                                        applys = NewApplys,
                                        members = NewMembers, order = NewOrder,
                                        member_num = MembersNum},
                    async_fire_leader(Leader, [#evt_team_join{pid = Pid}]),
                    async_mfa_leader(Leader,
                                     {team_role,
                                      callback,
                                      [{member_update, MembersNum}]}),
                    push(NewTeam, 11716),
                    push_11700(MatePid, NewTeam),
                    team_mgr:sync(Team, NewTeam),
                    {reply, ok, NewTeam};
                {false, Reason1} -> {reply, {false, Reason1}, Team}
            end;
        _ -> {reply, {false, lang:get("不在申请列表")}, Team}
    end;
handle_call({away, MateId}, _From,
            Team = #team{members = Members, order = Order}) ->
    NewMembers = case lists:keyfind(MateId,
                                    #team_mate.id,
                                    Members)
                     of
                     Mate = #team_mate{name = Name, status = 2} ->
                         Mate1 = Mate#team_mate{status = 3},
                         team_mgr:update(Mate1),
                         team_util:broadcast(Members,
                                             notice,
                                             notice:format(lang:get("~ts暂离了"),
                                                           [{role_2, Name}])),
                         Members1 = lists:keyreplace(MateId,
                                                     #team_mate.id,
                                                     Members,
                                                     Mate1),
                         team_util:broadcast(Members1, 11726, {[Mate1], Order}),
                         Members1;
                     _ ->
                         logger:error("不在队伍 ~w", [MateId], team, 1174),
                         team_mgr:delete(MateId),
                         Members
                 end,
    NewTeam = Team#team{members = NewMembers},
    {reply, ok, NewTeam};
handle_call({sync_away, RoleId}, _From,
            Team = #team{members = Members, order = Order}) ->
    case lists:keyfind(RoleId, #team_mate.id, Members) of
        Mate = #team_mate{name = Name, status = 2} ->
            Mate1 = Mate#team_mate{status = 3},
            team_mgr:update(Mate1),
            team_util:broadcast(Members,
                                notice,
                                notice:format(lang:get("~ts暂离了"),
                                              [{role_2, Name}])),
            Members1 = lists:keyreplace(RoleId,
                                        #team_mate.id,
                                        Members,
                                        Mate1),
            team_util:broadcast(Members1, 11726, {[Mate1], Order}),
            NewTeam = Team#team{members = Members1},
            {reply, {true, 3}, NewTeam};
        #team_mate{status = 1} ->
            F = fun (Mate = #team_mate{status = 2, pid = Pid,
                                       name = Name}) ->
                        Mate1 = Mate#team_mate{status = 3},
                        role:apply(async, Pid, {team_role, callback, [away]}),
                        team_mgr:update(Mate1),
                        team_util:broadcast(Members,
                                            notice,
                                            notice:format(lang:get("~ts暂离了"),
                                                          [{role_2, Name}])),
                        Mate1;
                    (Mate) -> Mate
                end,
            Members1 = lists:map(F, Members),
            NewTeam = Team#team{members = Members1},
            team_util:broadcast(Members, 11726, {Members1, Order}),
            {reply, {true, 1}, NewTeam};
        _ ->
            team_mgr:delete(RoleId),
            {reply, ok, Team}
    end;
handle_call({recruit,
             _Type,
             _LevMin,
             _LevMax,
             _Flag,
             _ChatRecruitArgs},
            _From, Team = #team{members = Members})
    when length(Members) >= 5 ->
    {reply, {false, lang:get("队伍已满员")}, Team};
handle_call({recruit,
             Type,
             LevMin,
             LevMax,
             Flag,
             ChatRecruitArgs},
            _From, Team = #team{members = Members}) ->
    MaxNum = case Type of
                 63 -> 2;
                 _ ->
                     case team_data:get(Type) of
                         #{type := 14} -> 2;
                         #{type := 60} -> 2;
                         _ -> 5
                     end
             end,
    case length(Members) >= MaxNum of
        true ->
            case team_data:get(Type) of
                #{type := 60} ->
                    {reply, {false, lang:get("缘定星辰活动已招募满员")}, Team};
                _ -> {reply, {false, lang:get("当前招募类型已经满员")}, Team}
            end;
        false ->
            NewTeam = Team#team{type = Type, lev_flag = Flag,
                                lev_min = LevMin, lev_max = LevMax, status = 1,
                                matched = date:unixtime(),
                                chat_recruit_info = ChatRecruitArgs},
            team_mgr:sync(Team, NewTeam),
            push(NewTeam, 11725),
            {reply, true, NewTeam}
    end;
handle_call({apply_sync, {F}}, _From, State) ->
    apply_sync_return(catch erlang:apply(F, [State]),
                      {undefined, F, []},
                      State);
handle_call({apply_sync, {F, A}}, _From, State) ->
    apply_sync_return(catch erlang:apply(F, [State | A]),
                      {undefined, F, A},
                      State);
handle_call({apply_sync, {M, F, A}}, _From, State) ->
    apply_sync_return(catch erlang:apply(M, F, [State | A]),
                      {M, F, A},
                      State);
handle_call(_Request, _From, State) ->
    logger:error("队伍进程收到未知消息 ~w", [_Request], team, 1265),
    {noreply, State}.

handle_cast({login,
             #team_mate{name = Name, id = MateId, pid = Pid}},
            Team = #team{members = Members, order = Order,
                         leader = Leader, cross_type = CrossType}) ->
    NewMembers = case lists:keyfind(MateId,
                                    #team_mate.id,
                                    Members)
                     of
                     Mate = #team_mate{mod = Mod, speed = Speed} ->
                         Mate1 = Mate#team_mate{team_pid = self(), pid = Pid,
                                                status = 3},
                         role:apply(async,
                                    Pid,
                                    {team_role,
                                     callback,
                                     [{login, self(), Mod, Speed, CrossType}]}),
                         team_mgr:update(Mate1),
                         async_fire_leader(Leader, [#evt_team_join{pid = Pid}]),
                         Members1 = lists:keyreplace(MateId,
                                                     #team_mate.id,
                                                     Members,
                                                     Mate1),
                         team_util:broadcast(Members1, 11726, {[Mate1], Order}),
                         team_util:broadcast(Members,
                                             notice,
                                             notice:format(lang:get("~ts上线了"),
                                                           [{role_2, Name}])),
                         Members1;
                     _ ->
                         logger:error("不在队伍 ~w", [MateId], team, 1281),
                         team_mgr:delete(MateId),
                         Members
                 end,
    NewTeam = Team#team{members = NewMembers},
    team_mgr:sync(Team, NewTeam),
    {noreply, NewTeam};
handle_cast({logout, MateId},
            Team = #team{members = Members, order = Order,
                         usurpers = Usurpers, leader = OldLeader,
                         status = TeamStatus}) ->
    {NewMembers,
     NewOrder,
     NewLeader,
     NewCastMsg,
     IsLeader} =
        case lists:keyfind(MateId, #team_mate.id, Members) of
            Leader = #team_mate{status = 1, name = LeaderName} ->
                Leader1 = Leader#team_mate{status = 4, pid = 0},
                team_mgr:update(Leader1),
                Members1 = lists:keyreplace(MateId,
                                            #team_mate.id,
                                            Members,
                                            Leader1),
                case lists:keyfind(2, #team_mate.status, Members1) of
                    Mate = #team_mate{id = MId, pid = Pid, name = Name} ->
                        Mate1 = Mate#team_mate{status = 1},
                        team_mgr:update(Mate1),
                        Members2 = lists:keyreplace(MId,
                                                    #team_mate.id,
                                                    Members1,
                                                    Mate1),
                        role:apply(async,
                                   Pid,
                                   {team_role,
                                    callback,
                                    [{appoint, 1, Members2}]}),
                        quest_shipping:del_all_unit(Members),
                        role:apply(async,
                                   Pid,
                                   {quest_shipping, async_unit, []}),
                        Order1 = team_util:exchange_order(Order, MateId, MId),
                        team_util:broadcast(Members2,
                                            11726,
                                            {[Mate1, Leader1], Order1}),
                        CastMsg = notice:format(lang:get("~ts下线了，队长转让给~ts"),
                                                [{role_2, LeaderName},
                                                 {role_2, Name}]),
                        dungeon_team:handover(MId),
                        {Members2, Order1, Mate1, CastMsg, 1};
                    _ ->
                        case lists:keyfind(3, #team_mate.status, Members) of
                            Mate = #team_mate{id = MId, pid = Pid,
                                              name = Name} ->
                                Mate1 = Mate#team_mate{status = 1},
                                team_mgr:update(Mate1),
                                Members2 = lists:keyreplace(MId,
                                                            #team_mate.id,
                                                            Members1,
                                                            Mate1),
                                role:apply(async,
                                           Pid,
                                           {team_role,
                                            callback,
                                            [{appoint, 1, Members2}]}),
                                quest_shipping:del_all_unit(Members),
                                role:apply(async,
                                           Pid,
                                           {quest_shipping, async_unit, []}),
                                Order1 = team_util:exchange_order(Order,
                                                                  MateId,
                                                                  MId),
                                team_util:broadcast(Members2,
                                                    11726,
                                                    {[Mate1, Leader1], Order1}),
                                CastMsg =
                                    notice:format(lang:get("~ts下线了，队长转让给~ts"),
                                                  [{role_2, LeaderName},
                                                   {role_2, Name}]),
                                dungeon_team:handover(MId),
                                {Members2, Order1, Mate1, CastMsg, 1};
                            _ -> {Members1, Order, OldLeader, "", 1}
                        end
                end;
            Mate = #team_mate{name = Name} ->
                Mate1 = Mate#team_mate{status = 4, pid = 0},
                team_mgr:update(Mate1),
                Members1 = lists:keyreplace(MateId,
                                            #team_mate.id,
                                            Members,
                                            Mate1),
                team_util:broadcast(Members1, 11726, {[Mate1], Order}),
                CastMsg = notice:format(lang:get("~ts下线了"),
                                        [{role_2, Name}]),
                case OldLeader of
                    #team_mate{id = LeaderId} ->
                        async_mfa_leader(OldLeader,
                                         {team_util,
                                          async_notice_team_status,
                                          [Members1, [{leader, LeaderId}]]});
                    _ -> skip
                end,
                {Members1, Order, OldLeader, CastMsg, 0};
            _ ->
                logger:error("不在队伍中 ~w", [MateId], team, 1346),
                team_mgr:delete(MateId),
                {Members, Order, OldLeader, "", 0}
        end,
    case [Status
          || #team_mate{status = Status} <- NewMembers,
             Status =/= 4]
        of
        [] ->
            {stop,
             normal,
             Team#team{members = NewMembers, leader = NewLeader}};
        _ ->
            NewTeamStatus = case IsLeader of
                                1 -> 0;
                                _ -> TeamStatus
                            end,
            NewUsurpers = lists:keydelete(MateId,
                                          #team_usurper.id,
                                          Usurpers),
            MembersNum = length(NewMembers),
            NewTeam = Team#team{members = NewMembers,
                                order = NewOrder, usurpers = NewUsurpers,
                                member_num = MembersNum, leader = NewLeader,
                                status = NewTeamStatus},
            case NewCastMsg of
                "" -> skip;
                _ -> team_util:broadcast(NewMembers, notice, NewCastMsg)
            end,
            NewTeam1 = update_formation(NewTeam),
            async_mfa_leader(NewLeader,
                             {team_role,
                              callback,
                              [{member_update, MembersNum}]}),
            push(NewTeam1, 11725),
            {noreply, NewTeam1}
    end;
handle_cast({all_away, LeaderId, Pos},
            Team = #team{members = Members, pos = OldPos,
                         order = Order}) ->
    {NewMembers, NewPos} = case lists:keyfind(LeaderId,
                                              #team_mate.id,
                                              Members)
                               of
                               #team_mate{status = 1} ->
                                   F = fun (Mate = #team_mate{status = 2,
                                                              pid = Pid}) ->
                                               Mate1 = Mate#team_mate{status =
                                                                          3},
                                               role:apply(async,
                                                          Pid,
                                                          {team_role,
                                                           callback,
                                                           [away]}),
                                               team_mgr:update(Mate1),
                                               Mate1;
                                           (Mate) -> Mate
                                       end,
                                   {lists:map(F, Members), Pos};
                               _ -> {Members, OldPos}
                           end,
    NewTeam = Team#team{members = NewMembers, pos = NewPos},
    team_util:broadcast(NewMembers,
                        11726,
                        {NewMembers, Order}),
    {noreply, NewTeam};
handle_cast({follow, M = #{id := MateId, pid := Pid}},
            Team = #team{members = Members, is_fly = IsFly,
                         order = Order, cross_type = CrossType}) ->
    NewMembers = case lists:keyfind(MateId,
                                    #team_mate.id,
                                    Members)
                     of
                     Mate = #team_mate{pid = Pid, name = Name} ->
                         case lists:keyfind(1, #team_mate.status, Members) of
                             #team_mate{id = LeaderId, pid = LPid} ->
                                 case role:apply(sync,
                                                 LPid,
                                                 {team_role,
                                                  callback,
                                                  [{check_follow,
                                                    M#{name => Name,
                                                       cross_type =>
                                                           CrossType}}]})
                                     of
                                     {true, Event, EventPid, Pos} ->
                                         role_trigger:async_fire(LPid,
                                                                 #evt_team_follow{}),
                                         Mate1 = Mate#team_mate{status = 2},
                                         role:apply(async,
                                                    Pid,
                                                    {team_role,
                                                     callback,
                                                     [{follow,
                                                       Pos,
                                                       IsFly,
                                                       Event}]}),
                                         role:apply(async,
                                                    LeaderId,
                                                    {quest_shipping,
                                                     async_unit,
                                                     [[Pid]]}),
                                         team_mgr:update(Mate1),
                                         Members1 = lists:keyreplace(MateId,
                                                                     #team_mate.id,
                                                                     Members,
                                                                     Mate1),
                                         team_util:notice_team_status(Event,
                                                                      EventPid,
                                                                      Members1,
                                                                      [{leader,
                                                                        LeaderId},
                                                                       {follow,
                                                                        MateId}]),
                                         team_util:broadcast(Members1,
                                                             11726,
                                                             {[Mate1], Order}),
                                         team_util:broadcast(Members1,
                                                             notice,
                                                             notice:format(lang:get("~ts归队了"),
                                                                           [{role_2,
                                                                             Name}])),
                                         Members1;
                                     _R ->
                                         logger:debug("条件不足 ~w",
                                                      [_R],
                                                      team,
                                                      1414),
                                         Members
                                 end;
                             _ -> Members
                         end;
                     _ ->
                         logger:error("不在队伍中 ~w", [MateId], team, 1421),
                         role:apply(async, Pid, {team_role, callback, [leave]}),
                         team_mgr:delete(MateId),
                         Members
                 end,
    NewTeam = Team#team{members = NewMembers},
    {noreply, NewTeam};
handle_cast({to_leader_pos,
             M = #{id := MateId, pid := Pid}},
            Team = #team{members = Members, is_fly = IsFly,
                         cross_type = CrossType}) ->
    case lists:keyfind(MateId, #team_mate.id, Members) of
        #team_mate{pid = Pid, name = Name} ->
            #team_mate{id = LeaderId, pid = LPid} = lists:keyfind(1,
                                                                  #team_mate.status,
                                                                  Members),
            case role:apply(sync,
                            LPid,
                            {team_role,
                             callback,
                             [{check_follow,
                               M#{name => Name, cross_type => CrossType}}]})
                of
                {true, Event, _, Pos} ->
                    role:apply(async,
                               Pid,
                               {team_role,
                                callback,
                                [{to_leader_pos, Pos, IsFly, Event}]}),
                    role:apply(async,
                               LeaderId,
                               {quest_shipping, async_unit, [[Pid]]}),
                    ok;
                _R ->
                    logger:debug("条件不足 ~w", [_R], team, 1441),
                    ok
            end;
        _ ->
            logger:error("不在队伍中 ~w", [MateId], team, 1445),
            ok
    end,
    {noreply, Team};
handle_cast({leave, RolePid, MateId},
            Team = #team{members = Members, status = Status,
                         order = Order, usurpers = Usurpers, leader = OldLeader,
                         combat_num = TeamCombatNum,
                         last_join_time = LastJoinTime}) ->
    MembersLength = length(Members),
    Now = date:unixtime(),
    {NewMembers, NewOrder, NewLeader, IsLeader} = case
                                                      lists:keyfind(MateId,
                                                                    #team_mate.id,
                                                                    Members)
                                                      of
                                                      #team_mate{status = 1,
                                                                 name =
                                                                     LeaveName,
                                                                 pid =
                                                                     LeaderPid} ->
                                                          Members1 =
                                                              lists:keydelete(MateId,
                                                                              #team_mate.id,
                                                                              Members),
                                                          Order1 =
                                                              lists:delete(MateId,
                                                                           Order),
                                                          case Status of
                                                              1 ->
                                                                  role:pack_send(LeaderPid,
                                                                                 11719,
                                                                                 {1,
                                                                                  lang:get("")});
                                                              _ -> ok
                                                          end,
                                                          case TeamCombatNum >=
                                                                   2
                                                              of
                                                              false
                                                                  when Now -
                                                                           LastJoinTime
                                                                           >=
                                                                           180 ->
                                                                  false;
                                                              false
                                                                  when
                                                                    MembersLength
                                                                        < 3 ->
                                                                  false;
                                                              false ->
                                                                  role:apply(async,
                                                                             RolePid,
                                                                             {team,
                                                                              del_energy_apply,
                                                                              []});
                                                              _ -> false
                                                          end,
                                                          case lists:keyfind(2,
                                                                             #team_mate.status,
                                                                             Members1)
                                                              of
                                                              M = #team_mate{id
                                                                                 =
                                                                                 MId,
                                                                             pid
                                                                                 =
                                                                                 Pid,
                                                                             name
                                                                                 =
                                                                                 LeaderName} ->
                                                                  M1 =
                                                                      M#team_mate{status
                                                                                      =
                                                                                      1},
                                                                  team_mgr:update(M1),
                                                                  Msg =
                                                                      util:flist(lang:get("~ts离开了队伍，~ts成为队长"),
                                                                                 [LeaveName,
                                                                                  LeaderName]),
                                                                  team_util:broadcast(Members1,
                                                                                      notice,
                                                                                      Msg),
                                                                  Members2 =
                                                                      lists:keyreplace(MId,
                                                                                       #team_mate.id,
                                                                                       Members1,
                                                                                       M1),
                                                                  role:apply(async,
                                                                             Pid,
                                                                             {team_role,
                                                                              callback,
                                                                              [{appoint,
                                                                                1,
                                                                                Members2}]}),
                                                                  quest_shipping:del_all_unit(Members),
                                                                  role:apply(async,
                                                                             Pid,
                                                                             {quest_shipping,
                                                                              async_unit,
                                                                              []}),
                                                                  Order2 = [MId
                                                                            | lists:delete(MId,
                                                                                           Order1)],
                                                                  team_util:broadcast(Members2,
                                                                                      11727,
                                                                                      {[MateId],
                                                                                       Order2}),
                                                                  team_util:broadcast(Members2,
                                                                                      11726,
                                                                                      {[M1],
                                                                                       Order2}),
                                                                  {Members2,
                                                                   Order2,
                                                                   M1,
                                                                   1};
                                                              _ ->
                                                                  case
                                                                      lists:keyfind(3,
                                                                                    #team_mate.status,
                                                                                    Members1)
                                                                      of
                                                                      M =
                                                                          #team_mate{id
                                                                                         =
                                                                                         MId,
                                                                                     pid
                                                                                         =
                                                                                         Pid,
                                                                                     name
                                                                                         =
                                                                                         LeaderName} ->
                                                                          M1 =
                                                                              M#team_mate{status
                                                                                              =
                                                                                              1},
                                                                          team_mgr:update(M1),
                                                                          Msg =
                                                                              util:flist(lang:get("~ts离开了队伍，~ts成为队长"),
                                                                                         [LeaveName,
                                                                                          LeaderName]),
                                                                          team_util:broadcast(Members1,
                                                                                              notice,
                                                                                              Msg),
                                                                          Members2 =
                                                                              lists:keyreplace(MId,
                                                                                               #team_mate.id,
                                                                                               Members1,
                                                                                               M1),
                                                                          role:apply(async,
                                                                                     Pid,
                                                                                     {team_role,
                                                                                      callback,
                                                                                      [{appoint,
                                                                                        1,
                                                                                        Members2}]}),
                                                                          quest_shipping:del_all_unit(Members),
                                                                          role:apply(async,
                                                                                     Pid,
                                                                                     {quest_shipping,
                                                                                      async_unit,
                                                                                      []}),
                                                                          Order2 =
                                                                              [MId
                                                                               | lists:delete(MId,
                                                                                              Order1)],
                                                                          team_util:broadcast(Members2,
                                                                                              11727,
                                                                                              {[MateId],
                                                                                               Order2}),
                                                                          team_util:broadcast(Members2,
                                                                                              11726,
                                                                                              {[M1],
                                                                                               Order2}),
                                                                          {Members2,
                                                                           Order2,
                                                                           M1,
                                                                           1};
                                                                      _ ->
                                                                          {Members1,
                                                                           Order1,
                                                                           OldLeader,
                                                                           1}
                                                                  end
                                                          end;
                                                      #team_mate{name =
                                                                     LeaveName,
                                                                 status =
                                                                     MateStatus,
                                                                 join_type =
                                                                     JoinType,
                                                                 join_sub_type =
                                                                     JoinSubType,
                                                                 combat_num =
                                                                     CombatNum,
                                                                 join_time =
                                                                     JoinTime} ->
                                                          Members1 =
                                                              lists:keydelete(MateId,
                                                                              #team_mate.id,
                                                                              Members),
                                                          Order1 =
                                                              lists:delete(MateId,
                                                                           Order),
                                                          team_util:broadcast(Members1,
                                                                              notice,
                                                                              util:flist(lang:get("~ts离开了队伍"),
                                                                                         [LeaveName])),
                                                          team_util:broadcast(Members1,
                                                                              11727,
                                                                              {[MateId],
                                                                               Order1}),
                                                          case MateStatus of
                                                              2
                                                                  when JoinType
                                                                           == 2
                                                                           andalso
                                                                           JoinSubType
                                                                               ==
                                                                               51 ->
                                                                  case CombatNum
                                                                           >= 2
                                                                           orelse
                                                                           Now -
                                                                               JoinTime
                                                                               >=
                                                                               180
                                                                      of
                                                                      true ->
                                                                          false;
                                                                      false
                                                                          when
                                                                            MembersLength
                                                                                <
                                                                                3 ->
                                                                          false;
                                                                      _ ->
                                                                          role:apply(async,
                                                                                     RolePid,
                                                                                     {team,
                                                                                      del_energy_apply,
                                                                                      []})
                                                                  end;
                                                              _ -> false
                                                          end,
                                                          case OldLeader of
                                                              #team_mate{id =
                                                                             OldLeaderId} ->
                                                                  async_mfa_leader(OldLeader,
                                                                                   {team_util,
                                                                                    async_notice_team_status,
                                                                                    [Members1,
                                                                                     [{leader,
                                                                                       OldLeaderId}]]});
                                                              _ -> skip
                                                          end,
                                                          {Members1,
                                                           Order1,
                                                           OldLeader,
                                                           0};
                                                      _ ->
                                                          logger:error("不在队伍中 ~w",
                                                                       [MateId],
                                                                       team,
                                                                       1534),
                                                          Members1 =
                                                              lists:keydelete(MateId,
                                                                              #team_mate.id,
                                                                              Members),
                                                          Order1 =
                                                              lists:delete(MateId,
                                                                           Order),
                                                          {Members1,
                                                           Order1,
                                                           OldLeader,
                                                           0}
                                                  end,
    case [S
          || #team_mate{status = S} <- NewMembers, S =/= 4]
        of
        [] ->
            team_mgr:delete(MateId),
            {stop,
             normal,
             Team#team{members = NewMembers, leader = NewLeader}};
        _ ->
            #team_mate{id = LeaderId} = NewLeader,
            NewTeamStatus = case IsLeader of
                                1 -> 0;
                                _ -> Status
                            end,
            Usurpers1 = lists:keydelete(LeaderId,
                                        #team_usurper.id,
                                        Usurpers),
            NewUsurpers = lists:keydelete(MateId,
                                          #team_usurper.id,
                                          Usurpers1),
            MembersNum = length(NewMembers),
            NewTeam = Team#team{members = NewMembers,
                                order = NewOrder, usurpers = NewUsurpers,
                                member_num = MembersNum, leader = NewLeader,
                                status = NewTeamStatus},
            NewTeam1 = update_formation(NewTeam),
            async_mfa_leader(NewLeader,
                             {team_role,
                              callback,
                              [{member_update, MembersNum}]}),
            team_mgr:sync(Team, NewTeam1),
            push(NewTeam1, 11725),
            team_mgr:delete(MateId),
            {noreply, NewTeam1}
    end;
handle_cast({escape, MateId},
            Team = #team{members = Members, order = Order,
                         leader = OldLeader}) ->
    {NewMembers, NewOrder, NewLeader} = case
                                            lists:keyfind(MateId,
                                                          #team_mate.id,
                                                          Members)
                                            of
                                            Mate = #team_mate{status = 1,
                                                              pid = LPid} ->
                                                case lists:keyfind(2,
                                                                   #team_mate.status,
                                                                   Members)
                                                    of
                                                    M = #team_mate{id = MId,
                                                                   pid = Pid} ->
                                                        role:apply(async,
                                                                   Pid,
                                                                   {mount,
                                                                    exit_double_ride,
                                                                    []}),
                                                        Mate1 =
                                                            Mate#team_mate{status
                                                                               =
                                                                               3},
                                                        M1 = M#team_mate{status
                                                                             =
                                                                             1},
                                                        Members1 =
                                                            lists:keyreplace(MateId,
                                                                             #team_mate.id,
                                                                             Members,
                                                                             Mate1),
                                                        Members2 =
                                                            lists:keyreplace(MId,
                                                                             #team_mate.id,
                                                                             Members1,
                                                                             M1),
                                                        role:apply(async,
                                                                   Pid,
                                                                   {team_role,
                                                                    callback,
                                                                    [{appoint,
                                                                      1,
                                                                      Members2}]}),
                                                        role:apply(async,
                                                                   LPid,
                                                                   {team_role,
                                                                    callback,
                                                                    [{appoint,
                                                                      3,
                                                                      Members2}]}),
                                                        quest_shipping:del_all_unit(Members),
                                                        role:apply(async,
                                                                   Pid,
                                                                   {quest_shipping,
                                                                    async_unit,
                                                                    []}),
                                                        team_mgr:update(M1),
                                                        team_mgr:update(Mate1),
                                                        Order1 =
                                                            team_util:exchange_order(Order,
                                                                                     MateId,
                                                                                     MId),
                                                        team_util:broadcast(Members2,
                                                                            11726,
                                                                            {[Mate1,
                                                                              M1],
                                                                             Order1}),
                                                        {Members2, Order1, M1};
                                                    _ ->
                                                        {Members,
                                                         Order,
                                                         OldLeader}
                                                end;
                                            Mate = #team_mate{pid = Pid} ->
                                                Mate1 = Mate#team_mate{status =
                                                                           3},
                                                team_mgr:update(Mate1),
                                                Members1 =
                                                    lists:keyreplace(MateId,
                                                                     #team_mate.id,
                                                                     Members,
                                                                     Mate1),
                                                role:apply(async,
                                                           Pid,
                                                           {mount,
                                                            exit_double_ride,
                                                            []}),
                                                role:apply(async,
                                                           Pid,
                                                           {team_role,
                                                            callback,
                                                            [{appoint,
                                                              3,
                                                              Members1}]}),
                                                quest_shipping:del_all_unit(Members),
                                                role:apply(async,
                                                           Pid,
                                                           {quest_shipping,
                                                            async_unit,
                                                            []}),
                                                team_util:broadcast(Members1,
                                                                    11726,
                                                                    {[Mate1],
                                                                     Order}),
                                                {Members1, Order, OldLeader};
                                            _ ->
                                                logger:error("不在队伍中 ~w",
                                                             [MateId],
                                                             team,
                                                             1599),
                                                team_mgr:delete(MateId),
                                                {Members, Order, OldLeader}
                                        end,
    NewTeam = update_formation(Team#team{members =
                                             NewMembers,
                                         order = NewOrder, leader = NewLeader}),
    push(NewTeam, 11725),
    {noreply, NewTeam};
handle_cast({rename, MateId, Name},
            Team = #team{members = Members,
                         leader = Leader = #team_mate{id = LeaderId},
                         order = Order}) ->
    NewMembers = case lists:keyfind(MateId,
                                    #team_mate.id,
                                    Members)
                     of
                     Mate = #team_mate{} ->
                         Mate1 = Mate#team_mate{name = Name},
                         team_mgr:update(Mate1),
                         Members1 = lists:keyreplace(MateId,
                                                     #team_mate.id,
                                                     Members,
                                                     Mate1),
                         team_util:broadcast(Members1, 11726, {[Mate1], Order}),
                         Members1;
                     _ ->
                         logger:error("不在队伍中 ~w", [MateId], team, 1617),
                         team_mgr:delete(MateId),
                         Members
                 end,
    NewLeader = case MateId of
                    LeaderId -> Leader#team_mate{name = Name};
                    _ -> Leader
                end,
    NewTeam = Team#team{leader = NewLeader,
                        members = NewMembers},
    team_mgr:sync(Team, NewTeam),
    {noreply, NewTeam};
handle_cast(stop_recruiting,
            Team = #team{status = 0}) ->
    {noreply, Team};
handle_cast(stop_recruiting,
            Team = #team{leader = Leader}) ->
    push_leader(Leader, 11719, {1, lang:get("已停止招募")}),
    NewTeam = Team#team{status = 0},
    team_mgr:sync(Team, NewTeam),
    push(NewTeam, 11725),
    {noreply, NewTeam};
handle_cast({stop_recruiting, _Types},
            Team = #team{status = 0}) ->
    {noreply, Team};
handle_cast({stop_recruiting, Types},
            Team = #team{leader = Leader, type = Type}) ->
    case lists:member(Type, Types) of
        true -> {noreply, Team};
        _ ->
            push_leader(Leader, 11719, {1, lang:get("已停止招募")}),
            NewTeam = Team#team{status = 0},
            team_mgr:sync(Team, NewTeam),
            push(NewTeam, 11725),
            {noreply, NewTeam}
    end;
handle_cast({update_recruitment_notice, {Rid, RolePid}},
            Team = #team{pid = Pid}) ->
    case catch ets:lookup(team_recruitment, Pid) of
        [Recruit = #team_recruitment{notice_list = List}] ->
            Now = date:unixtime(),
            case lists:keytake(Rid, 1, List) of
                {value, _Del, RestList} ->
                    NewRecruit = Recruit#team_recruitment{notice_list =
                                                              [{Rid,
                                                                RolePid,
                                                                Now}
                                                               | RestList]},
                    ets:insert(team_recruitment, NewRecruit),
                    ok;
                _ ->
                    NewRecruit = Recruit#team_recruitment{notice_list =
                                                              [{Rid,
                                                                RolePid,
                                                                Now}
                                                               | List]},
                    ets:insert(team_recruitment, NewRecruit),
                    ok
            end;
        _Err -> ok
    end,
    {noreply, Team};
handle_cast({update_mate_formation,
             RoleId,
             FormationId,
             FormationLev,
             FormationName},
            Team = #team{members = Members}) ->
    case lists:keyfind(RoleId, #team_mate.id, Members) of
        Mate = #team_mate{name = Name, status = 1} ->
            Mate1 = Mate#team_mate{formation_id = FormationId,
                                   formation_lev = FormationLev},
            Members1 = lists:keyreplace(RoleId,
                                        #team_mate.id,
                                        Members,
                                        Mate1),
            LevName = case FormationLev of
                          2 -> "Lv.2";
                          3 -> "Lv.3";
                          4 -> "Lv.4";
                          _ -> "Lv.1"
                      end,
            team_util:broadcast(Members1,
                                notice,
                                notice:format(lang:get("队长~ts将阵法切换至~ts~ts"),
                                              [{role_2, Name},
                                               {string_2, 1, FormationName},
                                               {string_1, LevName}])),
            NewTeam = Team#team{members = Members1,
                                team_formation = FormationId,
                                team_formation_lev = FormationLev},
            team_mgr:sync(Team, NewTeam),
            push(NewTeam, 11725),
            {noreply, NewTeam};
        Mate = #team_mate{} ->
            Mate1 = Mate#team_mate{formation_id = FormationId,
                                   formation_lev = FormationLev},
            Members1 = lists:keyreplace(RoleId,
                                        #team_mate.id,
                                        Members,
                                        Mate1),
            NewTeam = Team#team{members = Members1},
            team_mgr:sync(Team, NewTeam),
            {noreply, NewTeam};
        _ -> {noreply, Team}
    end;
handle_cast({combat, LeaderId},
            Team = #team{members = Members,
                         combat_num = CombatNum}) ->
    case lists:keyfind(LeaderId, #team_mate.id, Members) of
        #team_mate{status = 1} ->
            NewMembers1 = [M#team_mate{combat_num = MCombatNum + 1}
                           || M = #team_mate{status = Status,
                                             combat_num = MCombatNum}
                                  <- Members,
                              Status == 1 orelse Status == 2],
            NewMembers2 = [M
                           || M = #team_mate{status = Status} <- Members,
                              Status =/= 1 andalso Status =/= 2],
            NewMembers = NewMembers1 ++ NewMembers2,
            NewTeam = Team#team{members = NewMembers,
                                combat_num = CombatNum + 1},
            team_mgr:sync(Team, NewTeam),
            push(NewTeam, 11725),
            team_util:broadcast(NewMembers, 11729, {NewMembers1}),
            {noreply, NewTeam};
        _ -> {noreply, Team}
    end;
handle_cast({enter_dungeon, LeaderId, DunID},
            Team = #team{members = Members}) ->
    case lists:keyfind(LeaderId, #team_mate.id, Members) of
        #team_mate{status = 1} ->
            NewMembers1 = [M#team_mate{combat_num = 0}
                           || M = #team_mate{status = Status} <- Members,
                              Status == 1 orelse Status == 2],
            NewMembers2 = [M
                           || M = #team_mate{status = Status} <- Members,
                              Status =/= 1 andalso Status =/= 2],
            NewMembers = NewMembers1 ++ NewMembers2,
            NewTeam = Team#team{members = NewMembers,
                                dun_id = DunID},
            team_mgr:sync(Team, NewTeam),
            push(NewTeam, 11725),
            team_util:broadcast(NewMembers, 11729, {NewMembers1}),
            {noreply, NewTeam};
        _ -> {noreply, Team}
    end;
handle_cast({swap_role, RoleId, RolePid, Sid, Tid},
            Team = #team{members = Members, order = Order}) ->
    case lists:keyfind(RoleId, #team_mate.id, Members) of
        #team_mate{status = 1} ->
            case lists:keyfind(Sid, #team_mate.id, Members) of
                #team_mate{} ->
                    case lists:keyfind(Tid, #team_mate.id, Members) of
                        #team_mate{} ->
                            Order1 = team_util:exchange_order(Order, Sid, Tid),
                            NewTeam = Team#team{order = Order1},
                            team_mgr:sync(Team, NewTeam),
                            team_util:broadcast(Members, 11726, {[], Order1}),
                            {noreply, NewTeam};
                        _ ->
                            role:pack_send(RolePid,
                                           12903,
                                           {0, lang:get("没有找到目标队员")}),
                            {noreply, Team}
                    end;
                _ ->
                    role:pack_send(RolePid,
                                   12903,
                                   {0, lang:get("没有找到目标队员")}),
                    {noreply, Team}
            end;
        _ ->
            role:pack_send(RolePid,
                           12903,
                           {0, lang:get("只有队长能操作")}),
            {noreply, Team}
    end;
handle_cast({sync_pos,
             #{leader_id := LeaderId, pos := Pos}},
            Team = #team{members = Members}) ->
    case lists:keyfind(LeaderId, #team_mate.id, Members) of
        #team_mate{status = 1} ->
            {noreply, Team#team{pos = Pos}};
        _ -> {noreply, Team}
    end;
handle_cast({sync_transmit,
             #{leader_id := LeaderId, map_pid := MapPid, x := X,
               y := Y, dir := Dir}},
            Team = #team{members = Members, pos = Pos}) ->
    case lists:keyfind(LeaderId, #team_mate.id, Members) of
        #team_mate{status = 1} ->
            lists:foreach(fun (#team_mate{pid = Pid, status = 2}) ->
                                  role:apply(async,
                                             Pid,
                                             {team_role,
                                              callback,
                                              [{transmit, MapPid, X, Y}]});
                              (_) -> ok
                          end,
                          Members),
            {noreply,
             Team#team{pos = Pos#pos{x = X, y = Y, dir = Dir}}};
        _ -> {noreply, Team}
    end;
handle_cast({enter_map,
             Evt = #{leader_id := LeaderId, pos := Pos},
             TeamEvt},
            Team = #team{members = Members, status = OldStatus,
                         order = Order}) ->
    case lists:keyfind(LeaderId, #team_mate.id, Members) of
        #team_mate{status = 1, pid = LeadPid} ->
            NewTeam = case do_get_enter_role(Members, TeamEvt) of
                          {ok, TeamPids} ->
                              logger:debug("=====:~w==========:~w",
                                           [Members, TeamPids],
                                           team,
                                           1794),
                              lists:foreach(fun (Pid) when is_pid(Pid) ->
                                                    Args = [{enter_map,
                                                             Evt,
                                                             TeamEvt}],
                                                    role:apply(async,
                                                               Pid,
                                                               {team_role,
                                                                callback,
                                                                Args});
                                                (_) -> ok
                                            end,
                                            TeamPids),
                              Members1 = [force_away(M, TeamPids)
                                          || M <- Members],
                              case [CM
                                    || CM = #team_mate{pid = CPid} <- Members1,
                                       lists:member(CPid, TeamPids) =:= false
                                           andalso CPid =/= LeadPid]
                                  of
                                  [] -> ok;
                                  CMS ->
                                      CMS1 = [CM1
                                              || CM1 = #team_mate{pid = CPid,
                                                                  status = 2}
                                                     <- Members,
                                                 lists:member(CPid, TeamPids)
                                                     =:= false],
                                      case {TeamEvt, CMS1} of
                                          {_, []} -> ok;
                                          {{enter_guild, _}, _} ->
                                              team_util:broadcast(Members1,
                                                                  notice,
                                                                  notice:format(lang:get("~ts由于与队长不同公会，暂离了"),
                                                                                [{role_1,
                                                                                  [{Cid,
                                                                                    CName}
                                                                                   || #team_mate{id
                                                                                                     =
                                                                                                     Cid,
                                                                                                 name
                                                                                                     =
                                                                                                     CName}
                                                                                          <- CMS1]}]));
                                          {#{event := 28}, _} ->
                                              LeaveList = [{Cid, CName}
                                                           || #team_mate{id =
                                                                             Cid,
                                                                         name =
                                                                             CName}
                                                                  <- CMS1],
                                              team_util:broadcast(Members1,
                                                                  notice,
                                                                  notice:format(lang:get("~ts由于家园设置了访问权限，暂离了"),
                                                                                [{role_1,
                                                                                  LeaveList}]));
                                          _ ->
                                              team_util:broadcast(Members1,
                                                                  notice,
                                                                  notice:format(lang:get("~ts暂离了"),
                                                                                [{role_1,
                                                                                  [{Cid,
                                                                                    CName}
                                                                                   || #team_mate{id
                                                                                                     =
                                                                                                     Cid,
                                                                                                 name
                                                                                                     =
                                                                                                     CName}
                                                                                          <- CMS1]}]))
                                      end,
                                      team_util:broadcast(Members1,
                                                          11726,
                                                          {CMS, Order})
                              end,
                              Team#team{pos = Pos, members = Members1};
                          _ -> Team#team{pos = Pos}
                      end,
            logger:debug("队伍状态 ~w, 队伍事件 ~w",
                         [OldStatus, TeamEvt],
                         team,
                         1822),
            NewStatus = case Evt of
                            #{event := NewEvent}
                                when NewEvent =/= 0 andalso OldStatus =:= 1 ->
                                role:pack_send(LeadPid,
                                               11719,
                                               {1, lang:get("已停止招募")}),
                                0;
                            _ -> OldStatus
                        end,
            NewTeam1 = NewTeam#team{status = NewStatus},
            push(NewTeam1, 11725),
            team_mgr:sync(Team, NewTeam1),
            {noreply, NewTeam1};
        _ -> {noreply, Team}
    end;
handle_cast({update_fly, LeaderId, IsFly},
            Team = #team{members = Members, pos = Pos}) ->
    case lists:keyfind(LeaderId, #team_mate.id, Members) of
        #team_mate{status = 1} ->
            lists:foreach(fun (#team_mate{pid = Pid, status = 2}) ->
                                  role:apply(async,
                                             Pid,
                                             {team_role,
                                              callback,
                                              [{update_fly, IsFly, Pos}]}),
                                  role:apply(async,
                                             Pid,
                                             {mount, exit_double_ride, []});
                              (_) -> ok
                          end,
                          Members),
            {noreply, Team#team{is_fly = IsFly}};
        _ -> {noreply, Team}
    end;
handle_cast({set_mods, LeaderId, Mods},
            Team = #team{members = Members}) ->
    case lists:keyfind(LeaderId, #team_mate.id, Members) of
        #team_mate{status = 1} ->
            Fun = fun (M = #team_mate{status = 1}, {T, L}) ->
                          {T, [M | L]};
                      (M = #team_mate{pid = Pid}, {[], L}) when is_pid(Pid) ->
                          role:apply(async,
                                     Pid,
                                     {team_role, callback, [{set_mod, 0}]}),
                          M1 = M#team_mate{mod = 0},
                          team_mgr:update(M1),
                          {[], [M1 | L]};
                      (M, {[], L}) ->
                          M1 = M#team_mate{mod = 0},
                          team_mgr:update(M1),
                          {[], [M1 | L]};
                      (M = #team_mate{pid = Pid}, {[H | T], L})
                          when is_pid(Pid) ->
                          role:apply(async,
                                     Pid,
                                     {team_role, callback, [{set_mod, H}]}),
                          M1 = M#team_mate{mod = H},
                          team_mgr:update(M1),
                          {T, [M1 | L]};
                      (M, {[H | T], L}) ->
                          M1 = M#team_mate{mod = H},
                          team_mgr:update(M1),
                          {T, [M1 | L]}
                  end,
            {_, Members1} = lists:foldl(Fun, {Mods, []}, Members),
            {noreply, Team#team{members = Members1}};
        _ -> {noreply, Team}
    end;
handle_cast({set_speed, LeaderId, Speed},
            Team = #team{members = Members}) ->
    case lists:keyfind(LeaderId, #team_mate.id, Members) of
        #team_mate{status = 1} ->
            Fun = fun (M = #team_mate{status = 1}) -> M;
                      (M = #team_mate{pid = Pid}) when is_pid(Pid) ->
                          role:apply(async,
                                     Pid,
                                     {team_role,
                                      callback,
                                      [{set_speed, Speed}]}),
                          M1 = M#team_mate{speed = Speed},
                          team_mgr:update(M1),
                          M1;
                      (M) ->
                          M1 = M#team_mate{speed = Speed},
                          team_mgr:update(M1),
                          M1
                  end,
            Members1 = [Fun(E) || E <- Members],
            {noreply, Team#team{members = Members1}};
        _ -> {noreply, Team}
    end;
handle_cast({move,
             #{leader_id := LeaderId, map_pid := MapPid,
               xys := Xys}},
            Team = #team{members = Members,
                         pos = #pos{x = Lx, y = Ly, dir = LDir}}) ->
    case lists:keyfind(LeaderId, #team_mate.id, Members) of
        #team_mate{status = 1} ->
            lists:foreach(fun (#team_mate{id = Id, pid = Pid,
                                          status = 2}) ->
                                  case lists:keyfind(Id, 1, Xys) of
                                      {Id, X, Y, Dir} ->
                                          role:apply(async,
                                                     Pid,
                                                     {team_role,
                                                      callback,
                                                      [{move,
                                                        MapPid,
                                                        X,
                                                        Y,
                                                        Dir}]});
                                      _R ->
                                          logger:debug("队友没有发来坐标 ~w",
                                                       [Id],
                                                       team,
                                                       1917),
                                          role:apply(async,
                                                     Pid,
                                                     {team_role,
                                                      callback,
                                                      [{move,
                                                        MapPid,
                                                        Lx,
                                                        Ly,
                                                        LDir}]})
                                  end;
                              (_) -> ok
                          end,
                          Members),
            {noreply, Team};
        _ -> {noreply, Team}
    end;
handle_cast({sync_info,
             #team_mate{id = Id, lev = Lev, fc = Fc,
                        face_id = FaceId, looks = Looks, lover_id = LoverId,
                        lover_name = LoverName, lover_status = LoverStatus,
                        quest_couple_round = QuestCoupleRound}},
            Team = #team{members = Members, order = Order}) ->
    case lists:keyfind(Id, #team_mate.id, Members) of
        #team_mate{lev = Lev, fc = Fc, face_id = FaceId,
                   looks = Looks, lover_id = LoverId,
                   lover_name = LoverName, lover_status = LoverStatus,
                   quest_couple_round = QuestCoupleRound} ->
            {noreply, Team};
        M = #team_mate{} ->
            M1 = M#team_mate{lev = Lev, fc = Fc, face_id = FaceId,
                             looks = Looks, lover_id = LoverId,
                             lover_name = LoverName, lover_status = LoverStatus,
                             quest_couple_round = QuestCoupleRound},
            Members1 = lists:keyreplace(Id,
                                        #team_mate.id,
                                        Members,
                                        M1),
            team_mgr:update(M1),
            NewTeam = Team#team{members = Members1},
            team_util:broadcast(Members1, 11726, {[M1], Order}),
            {noreply, NewTeam};
        _ -> {noreply, Team}
    end;
handle_cast({send, Code, Data},
            Team = #team{members = Members}) ->
    lists:foreach(fun (#team_mate{pid = Pid})
                          when is_pid(Pid) ->
                          catch role:pack_send(Pid, Code, Data);
                      (_) -> ok
                  end,
                  Members),
    {noreply, Team};
handle_cast({notice_up, Msg},
            Team = #team{members = Members}) ->
    do_notice_up(Members, Msg),
    {noreply, Team};
handle_cast({async_teammate, SendId, MFA},
            Team = #team{members = Members}) ->
    [role:apply(async, Pid, MFA)
     || #team_mate{id = Id, pid = Pid} <- Members,
        SendId =/= Id],
    {noreply, Team};
handle_cast({send_to_leader, Code, Data},
            Team = #team{members = Members}) ->
    #team_mate{pid = Pid} = lists:keyfind(1,
                                          #team_mate.status,
                                          Members),
    catch role:pack_send(Pid, Code, Data),
    {noreply, Team};
handle_cast({update_target, Target}, Team = #team{})
    when is_integer(Target) ->
    NewTeam = Team#team{target = Target},
    team_mgr:sync(Team, NewTeam),
    {noreply, NewTeam};
handle_cast(_Msg, State) ->
    logger:debug("收到未知的cast消息 ~w", [_Msg], team, 1978),
    {noreply, State}.

handle_info({apply_async, {F}}, State) ->
    apply_async_return(catch erlang:apply(F, [State]),
                       {undefined, F, []},
                       State);
handle_info({apply_async, {F, A}}, State) ->
    apply_async_return(catch erlang:apply(F, [State | A]),
                       {undefined, F, A},
                       State);
handle_info({apply_async, {M, F, A}}, State) ->
    apply_async_return(catch erlang:apply(M,
                                          F,
                                          [State | A]),
                       {M, F, A},
                       State);
handle_info({notice, Msg},
            State = #team{members = Members}) ->
    team_util:broadcast(Members, notice, Msg),
    {noreply, State};
handle_info(check_usurper, State) ->
    NewState = case team_common:async_callback(State,
                                               check_usurper)
                   of
                   {ok, State1 = #team{}} -> State1;
                   _ -> State
               end,
    {noreply, NewState};
handle_info(timer_recruit_info,
            Team = #team{pid = Pid, members = Members,
                         cross_type = CrossType}) ->
    case catch ets:lookup(team_recruitment, Pid) of
        [Recruit = #team_recruitment{type = Type,
                                     notice_list = OldNoticeList}] ->
            case team_recruit:check_chat_recruit(Type) of
                {ok, _} ->
                    Now = date:unixtime(),
                    case lists:keyfind(1, #team_mate.status, Members) of
                        #team_mate{pid = LeaderPid} ->
                            NewRecruit = #team_recruitment{notice_list =
                                                               NoticeList} =
                                             team_recruit:dispatch(Team,
                                                                   Recruit,
                                                                   LeaderPid),
                            ets:insert(team_recruitment, NewRecruit),
                            {Del, New, Update} =
                                team_recruit:diff_notice_list(OldNoticeList,
                                                              OldNoticeList,
                                                              NoticeList,
                                                              []),
                            team_recruit:broadcast_recruitment_info(Del,
                                                                    Now,
                                                                    del,
                                                                    Pid,
                                                                    #{cross_type
                                                                          =>
                                                                          CrossType}),
                            team_recruit:broadcast_recruitment_info(New,
                                                                    Now,
                                                                    new,
                                                                    NewRecruit,
                                                                    #{cross_type
                                                                          =>
                                                                          CrossType}),
                            team_recruit:broadcast_recruitment_info(Update,
                                                                    Now,
                                                                    update,
                                                                    NewRecruit,
                                                                    #{cross_type
                                                                          =>
                                                                          CrossType}),
                            set_recruit_timer(),
                            ok;
                        _ -> ok
                    end;
                _ ->
                    cancel_recruit_timer(),
                    ok
            end;
        _ ->
            cancel_recruit_timer(),
            ok
    end,
    {noreply, Team};
handle_info(_Info, State) ->
    logger:debug("收到未知的info消息 ~w", [_Info], team, 2033),
    {noreply, State}.

terminate(_Reason, Team = #team{members = Members}) ->
    logger:debug("理由 ~w", [_Reason], team, 2038),
    Fun = fun (M = #team_mate{pid = Pid})
                  when is_pid(Pid) ->
                  role:apply(async,
                             Pid,
                             {team_role, callback, [{stop, self()}]}),
                  team_mgr:delete(M);
              (M) -> team_mgr:delete(M)
          end,
    catch [Fun(M) || M <- Members],
    catch team_mgr:sync(Team, Team#team{status = 0}),
    ok.

is_leader_only(#role{m_team =
                         #m_team{pid = Pid, status = 1}}) ->
    case info(Pid) of
        {ok, #team{member_num = MemNum, members = Members}} ->
            case MemNum =:= 1 of
                true -> true;
                false -> check_team_mem_is_away(Members)
            end;
        _ -> true
    end;
is_leader_only(_) -> false.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

push_leader(_Leader = #team_mate{pid = RolePid}, Code,
            Data)
    when is_pid(RolePid) ->
    role:pack_send(RolePid, Code, Data),
    ok;
push_leader(_, _, _) -> ok.

async_mfa_leader(_Leader = #team_mate{pid = RolePid},
                 Mfa)
    when is_pid(RolePid) ->
    role:apply(async, RolePid, Mfa),
    ok;
async_mfa_leader(_, _) -> ok.

async_fire_leader(_Leader = #team_mate{pid = RolePid},
                  Evts)
    when is_pid(RolePid) ->
    role_trigger:async_fire(RolePid, Evts),
    ok;
async_fire_leader(_, _) -> ok.

push_11700(MatePid, Team) when is_pid(MatePid) ->
    role:pack_send(MatePid, 11700, Team);
push_11700([], _) -> ok;
push_11700(TeamMate = [_ | _], Team) ->
    team_util:broadcast(TeamMate, 11700, Team);
push_11700(_, _) -> ok.

push(Team = #team{members = Members}, 11700 = Cmd) ->
    team_util:broadcast(Members, Cmd, Team);
push(#team{applys = Applys, members = Members},
     11716 = Cmd) ->
    Leader = lists:keyfind(1, #team_mate.status, Members),
    team_util:broadcast([Leader], Cmd, {Applys});
push(#team{members = Members},
     {11717 = Cmd, Mate = #team_mate{}}) ->
    Leader = lists:keyfind(1, #team_mate.status, Members),
    team_util:broadcast([Leader], Cmd, {Mate});
push(Role = #role{}, 11721 = Cmd) ->
    role:link_send(Role, Cmd, {0, ""});
push(#team{members = Members}, {11719 = Cmd, Data}) ->
    Leader = lists:keyfind(1, #team_mate.status, Members),
    team_util:broadcast([Leader], Cmd, Data);
push(#team{type = Type, lev_flag = LevFlag,
           team_formation = TeamFormation, status = Status,
           team_formation_lev = TeamFormationLev,
           members = Members, last_join_time = LastJoinTime,
           combat_num = CombatNum},
     11725) ->
    team_util:broadcast(Members,
                        11725,
                        {Type,
                         LevFlag,
                         TeamFormation,
                         TeamFormationLev,
                         Status,
                         LastJoinTime,
                         CombatNum}).

do_calc_team_meta_attr(avg_lev,
                       #team{members = Members}) ->
    {ok, avg_lev(Members, 0, 0)};
do_calc_team_meta_attr(members_num,
                       #team{members = Members}) ->
    length(Members);
do_calc_team_meta_attr(members_num_follow,
                       #team{members = Members}) ->
    team_get_follow_number(Members, 0);
do_calc_team_meta_attr(_Type, _Team) -> ok.

team_get_follow_number([], N) -> N;
team_get_follow_number([#team_mate{status = 2} | Rest],
                       N) ->
    team_get_follow_number(Rest, N + 1);
team_get_follow_number([#team_mate{status = 1} | Rest],
                       N) ->
    team_get_follow_number(Rest, N + 1);
team_get_follow_number([_TeamMate | Rest], N) ->
    team_get_follow_number(Rest, N).

avg_lev(Role, Teammate) ->
    case role_convert:to(team_mate, Role) of
        {ok, Mate} -> avg_lev([Mate | Teammate], 0, 0);
        _False -> 0
    end.

avg_lev([], _Sum, 0) -> 0;
avg_lev([], Sum, Len) -> erlang:round(Sum / Len);
avg_lev([#team_mate{lev = Lev} | Rest], Sum, Len) ->
    avg_lev(Rest, Sum + Lev, Len + 1).

update_formation(Team = #team{members = Members}) ->
    case lists:keyfind(1, #team_mate.status, Members) of
        #team_mate{formation_id = TeamFormation,
                   formation_lev = TeamFormationLev} ->
            Team#team{team_formation = TeamFormation,
                      team_formation_lev = TeamFormationLev};
        _ -> Team
    end.

do_get_enter_role(Members, follow) ->
    TeamPids = [Pid
                || #team_mate{pid = Pid, status = 2} <- Members],
    {ok, TeamPids};
do_get_enter_role(Members, #{role_ids := RoleIds}) ->
    TeamPids = [Pid
                || #team_mate{id = Rid, pid = Pid} <- Members,
                   lists:member(Rid, RoleIds)],
    {ok, TeamPids};
do_get_enter_role(Members, {enter_guild, LeadId}) ->
    TeamPids = [Pid
                || #team_mate{pid = Pid, status = 2, id = Id}
                       <- Members,
                   guild_util:is_in_same(LeadId, Id)],
    {ok, TeamPids};
do_get_enter_role(_, _) -> ok.

force_away(M = #team_mate{pid = Pid, status = 2},
           Pids) ->
    case lists:member(Pid, Pids) of
        true -> M;
        _ ->
            role:apply(async, Pid, {team_role, callback, [away]}),
            M#team_mate{status = 3}
    end;
force_away(M, _Pids) -> M.

check_away(#role{s_event = 5,
                 m_qualifying = #m_qualifying{sign_type = SignType}})
    when SignType =/= 0 ->
    {false, lang:get("正在段位赛匹配中，请先取消匹配再来暂离")};
check_away(#role{s_event = 25}) ->
    {false, lang:get("正在武道会匹配中，请先取消匹配再来暂离")};
check_away(#role{s_event = 24}) ->
    {false, lang:get("正在武道会匹配中，请先取消匹配再来暂离")};
check_away(#role{s_event = 40}) ->
    {false, lang:get("正在结拜中，请结拜完了再来暂离")};
check_away(#role{s_event = 42,
                 m_preparation = #m_preparation{status = Status}})
    when Status =/= 0 ->
    {false, lang:get("正在匹配中，不能暂离")};
check_away(#role{s_event = 43}) ->
    {false, lang:get("正在副本匹配中，不能暂离")};
check_away(Role = #role{s_event = 72}) ->
    canyon_summit_role:check_away(Role);
check_away(_) -> true.

check_leave(#role{s_event = 5,
                  m_qualifying = #m_qualifying{sign_type = SignType}})
    when SignType =/= 0 ->
    {false, lang:get("正在段位赛匹配中，请先取消匹配再来离队")};
check_leave(#role{s_event = 25}) ->
    {false, lang:get("正在武道会匹配中，请先取消匹配再来离队")};
check_leave(#role{s_event = 40}) ->
    {false, lang:get("正在结拜中，请结拜完了再来离队")};
check_leave(#role{s_event = 42,
                  m_preparation = #m_preparation{status = Status}})
    when Status =/= 0 ->
    {false, lang:get("正在匹配中，请先取消匹配再来离队")};
check_leave(#role{s_event = 66,
                  m_team = #m_team{status = 1, member_num = Num}})
    when Num =:= 1 ->
    {false, lang:get("正在约战房间中，不能退队{face_1,3}")};
check_leave(_) -> true.

check_kickout(#role{s_event = 5,
                    m_qualifying = #m_qualifying{sign_type = SignType}})
    when SignType =/= 0 ->
    {false, lang:get("正在段位赛匹配中，请先取消匹配再来踢除")};
check_kickout(#role{s_event = 25}) ->
    {false, lang:get("正在武道会匹配中，请先取消匹配再来踢除")};
check_kickout(#role{s_event = 40}) ->
    {false, lang:get("正在结拜中，请结拜完了再来踢除")};
check_kickout(#role{s_event = 42,
                    m_preparation = #m_preparation{status = Status}})
    when Status =/= 0 ->
    {false, lang:get("正在匹配中，不能踢除")};
check_kickout(#role{s_event = 1,
                    assets = #assets{energy = Energy}})
    when Energy < 100 ->
    {false, lang:get("体力值不足，不能踢除")};
check_kickout(Role = #role{s_event = 72}) ->
    canyon_summit_role:check_kickout(Role);
check_kickout(_) -> true.

check_follow(#role{m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("战斗中不能归队")};
check_follow(#role{status = 1}) ->
    {false, lang:get("死亡中不能进行此操作")};
check_follow(#role{s_event = 5,
                   m_qualifying = #m_qualifying{sign_type = SignType}})
    when SignType =/= 0 ->
    {false, lang:get("正在段位赛匹配中，请先取消匹配再来归队")};
check_follow(#role{s_event = 25}) ->
    {false, lang:get("正在武道会匹配中，请先取消匹配再来归队")};
check_follow(#role{s_event = 24}) ->
    {false, lang:get("正在武道会匹配中，请先取消匹配再来归队")};
check_follow(#role{s_event = 42,
                   m_preparation = #m_preparation{status = Status}})
    when Status =/= 0 ->
    {false, lang:get("正在匹配中，请先取消匹配再来归队")};
check_follow(_Role) -> true.

check_recruit(#role{s_event = 1}, _, _) ->
    {false, lang:get("副本中不能进行此操作")};
check_recruit(#role{s_event = 17}, _, _) ->
    {false, lang:get("公会战中不能进行此操作")};
check_recruit(#role{s_event = 32}, _, _) ->
    {false, lang:get("公会联赛中不能进行此操作")};
check_recruit(#role{s_event = 3}, _, _) ->
    {false, lang:get("护送中不能进行此操作")};
check_recruit(#role{s_event = 63}, _, _) ->
    {false, lang:get("诸神殿堂活动中不能进行此操作")};
check_recruit(#role{s_event = 42,
                    m_preparation = #m_preparation{status = Status}},
              _, _)
    when Status =/= 0 ->
    {false, lang:get("正在匹配中，不能进行此操作")};
check_recruit(#role{cross_type = 2}, _, _) ->
    {false, lang:get("当前状态不能进行此操作")};
check_recruit(Role = #role{lev = Lev, s_event = Event,
                           cross_type = CrossType},
              Type, Flag) ->
    case lists:member(Event,
                      [0, 2, 7, 8, 6, 5, 16, 19, 21, 20, 43, 23, 56, 67, 72])
        of
        true ->
            logger:debug("~w", [Type], team, 2267),
            case team_data:get(Type) of
                #{cross_open_lev := 0} when CrossType == 1 ->
                    {false, lang:get("跨服不能报名此招募")};
                #{open_lev := OpenLev, type_name := TypeName}
                    when Lev < OpenLev ->
                    {false,
                     util:flist(lang:get("等级不足~w级，无法发起[~ts]招募"),
                                [OpenLev, TypeName])};
                #{type := 28} when Event =/= 0 andalso Event =/= 43 ->
                    {false, lang:get("当前状态不能报名此招募")};
                LevRangeCfg = #{type := 12} ->
                    quest_prac:recruit_lev(LevRangeCfg, Flag, Role);
                LevRangeCfg = #{type := 13} ->
                    meet_pet:recruit_lev(LevRangeCfg, Flag, Role);
                LevRangeCfg = #{type := 14} ->
                    quest_couple:recruit_lev(LevRangeCfg, Flag, Role);
                LevRangeCfg = #{type := 60} ->
                    quest_couple:recruit_lev(LevRangeCfg, Flag, Role);
                LevRangeCfg = #{type := 16} ->
                    hero_role:recruit_lev(LevRangeCfg, Flag, Role);
                LevRangeCfg = #{type := 17} ->
                    hero_role:recruit_lev(LevRangeCfg, Flag, Role);
                LevRangeCfg = #{type := 63} ->
                    canyon_summit_role:recruit_lev(LevRangeCfg, Flag, Role);
                LevRangeCfg = #{type := Type} ->
                    case lists:member(Type,
                                      [29,
                                       30,
                                       31,
                                       32,
                                       33,
                                       34,
                                       35,
                                       36,
                                       37,
                                       38,
                                       39,
                                       40,
                                       41,
                                       42,
                                       43,
                                       44,
                                       45,
                                       30,
                                       46,
                                       47,
                                       48,
                                       49,
                                       50,
                                       51,
                                       52,
                                       53,
                                       54,
                                       55,
                                       56,
                                       57,
                                       58,
                                       59])
                        of
                        true ->
                            spirit_treasure_role:recruit_lev(LevRangeCfg,
                                                             Flag,
                                                             Role);
                        _ -> make_recruit_cond(LevRangeCfg, Flag, Role)
                    end;
                LevRangeCfg ->
                    make_recruit_cond(LevRangeCfg, Flag, Role)
            end;
        _ -> {false, lang:get("当前状态不能招募")}
    end;
check_recruit(_Role, _, _) ->
    {false, lang:get("当前状态不能招募")}.

make_recruit_cond(#{lev_recruit := LevRecruit1,
                    cross_lev_recruit := LevRecruit2, type_name := TypeName,
                    open_lev := OpenLev},
                  Flag,
                  Role = #role{lev = Lev, cross_type = CrossType}) ->
    WorldMaxLev = case world_lev:get_world_lev(Role) of
                      {WorldLev, _} -> WorldLev + 8;
                      _ -> Lev + 8
                  end,
    LevRecruit = case CrossType of
                     1 -> LevRecruit2;
                     _ -> LevRecruit1
                 end,
    case lists:keyfind(Flag,
                       #team_recruit_lev_range.flag,
                       LevRecruit)
        of
        #team_recruit_lev_range{lev = 0} ->
            {true, OpenLev, WorldMaxLev, []};
        #team_recruit_lev_range{lev = 2, val1 = ValA,
                                val2 = ValB}
            when CrossType == 1 ->
            LevMin = max(OpenLev, Lev + ValA),
            TLevMax = Lev + ValB,
            LevMax = min(130, TLevMax),
            {true, LevMin, LevMax, []};
        #team_recruit_lev_range{lev = 2, val1 = ValA,
                                val2 = ValB} ->
            LevMin = max(OpenLev, Lev + ValA),
            TLevMax = min(WorldMaxLev, Lev + ValB),
            LevMax = min(130, TLevMax),
            {true, LevMin, LevMax, []};
        #team_recruit_lev_range{lev = 1, val1 = ValA,
                                val2 = ValB}
            when CrossType == 1 ->
            LevMin = max(OpenLev, ValA),
            TLevMax = ValB,
            LevMax = min(130, TLevMax),
            {true, LevMin, LevMax, []};
        #team_recruit_lev_range{lev = 1, val1 = ValA,
                                val2 = ValB} ->
            LevMin = max(OpenLev, ValA),
            TLevMax = min(WorldMaxLev, ValB),
            LevMax = min(130, TLevMax),
            {true, LevMin, LevMax, []};
        _ ->
            {false,
             util:flist(lang:get("[~ts]招募无法选择此等级范围"), [TypeName])}
    end;
make_recruit_cond(_LevRangeCfg, _Flag, _Role) ->
    {false, lang:get("不存在此类型的队伍招募")}.

do_notice_up(Members, Msg) ->
    lists:foreach(fun (#team_mate{pid = Pid})
                          when is_pid(Pid) ->
                          notice:send({pid, Pid}, 1, Msg);
                      (_) -> skip
                  end,
                  Members),
    ok.

join_msg(4, Name) ->
    util:flist(lang:get("~ts加入, 队伍人数达到3, 可开启副本内宝箱"),
               [Name]);
join_msg(_, Name) ->
    util:flist(lang:get("~ts加入队伍"), [Name]).

apply_sync_return({ok, Reply, NewState = #team{}}, _Mfa,
                  State) ->
    team_mgr:sync(State, NewState),
    {reply, Reply, NewState};
apply_sync_return({ok, Reply}, _Mfa, State) ->
    {reply, Reply, State};
apply_sync_return({stop, Reason, NewState = #team{}},
                  _Mfa, _State) ->
    {stop, Reason, NewState};
apply_sync_return({stop,
                   Reason,
                   Reply,
                   NewState = #team{}},
                  _Mfa, _State) ->
    {stop, Reason, Reply, NewState};
apply_sync_return(Else, {M, F, A}, State) ->
    logger:error("队伍[~w]同步执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
                 [State#team.pid, M, F, A, Else],
                 team,
                 2374),
    {reply, Else, State}.

apply_async_return({ok, NewState = #team{}}, _Mfa,
                   State) ->
    team_mgr:sync(State, NewState),
    {noreply, NewState};
apply_async_return(ok, _Mfa, State) -> {noreply, State};
apply_async_return({stop, Reason, NewState = #team{}},
                   _Mfa, _State) ->
    {stop, Reason, NewState};
apply_async_return(Else, {M, F, A}, State) ->
    logger:error("队伍[~w]执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
                 [State#team.pid, M, F, A, Else],
                 team,
                 2386),
    {noreply, State}.

set_recruit_timer() ->
    cancel_recruit_timer(),
    Ref = erlang:send_after(100 * 1000,
                            self(),
                            timer_recruit_info),
    put(timer_recruit_info, Ref),
    ok.

cancel_recruit_timer() ->
    case get(timer_recruit_info) of
        undefined -> ok;
        Ref ->
            erlang:cancel_timer(Ref),
            ok
    end,
    ok.

do_get_fight_info(Members, Order) ->
    TeamMate = [Mate
                || Mate = #team_mate{status = 2} <- Members],
    Fun = fun (MateId, {TeamMate1, TeamMate2}) ->
                  case lists:keyfind(MateId, #team_mate.id, TeamMate1) of
                      Mate = #team_mate{} -> {TeamMate1, [Mate | TeamMate2]};
                      _ -> {TeamMate1, TeamMate2}
                  end
          end,
    {_, NewTeamMate} = lists:foldl(Fun,
                                   {TeamMate, []},
                                   Order),
    Len = length(NewTeamMate),
    GuardPosList = case Len of
                       0 -> [2, 3, 4, 5];
                       1 -> [3, 4, 5];
                       2 -> [4, 5];
                       3 -> [5];
                       _ -> []
                   end,
    {ok, lists:reverse(NewTeamMate), GuardPosList}.

leave_clean([], Role) -> Role;
leave_clean([Step | Rest], Role) ->
    NewRole = leave_clean(Step, Role),
    leave_clean(Rest, NewRole);
leave_clean(quest, Role) ->
    quest:team_leave_clean(Role).

kickout_clean([], _MateId, Role) -> Role;
kickout_clean([Step | Rest], MateId, Role) ->
    NewRole = kickout_clean(Step, MateId, Role),
    kickout_clean(Rest, MateId, NewRole);
kickout_clean(quest, MateId, Role) ->
    quest:team_kickout_clean(Role, MateId).

check_team_mem_is_away([]) -> true;
check_team_mem_is_away([MemInfo | Rest]) ->
    case MemInfo of
        #team_mate{status = 3} -> check_team_mem_is_away(Rest);
        #team_mate{status = 1} -> check_team_mem_is_away(Rest);
        _ -> false
    end.

