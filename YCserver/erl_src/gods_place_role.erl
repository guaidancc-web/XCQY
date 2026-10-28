-file("src/mod/gods_duel/gods_place_role.erl", 1).

-module(gods_place_role).

-export([rpc_join/1,
         rpc_exit/1,
         rpc_champion/1,
         rpc_worship/1,
         rpc_worship_msg/0,
         rpc_set_barrage/3,
         rpc_send_barrage/2,
         rpc_query_worship_info/1,
         rpc_set_efficiency/1,
         rpc_query_efficiency_info/1,
         rpc_get_champion_video/1,
         rpc_get_marvelous/1,
         rpc_drop_box_time/1,
         rpc_champion_drop_box_time/1,
         role_callback/4,
         role_callback/2,
         role_week_five/2,
         init/0,
         pick_gain/2,
         check_pick/2,
         reset/1,
         push_drop_box/2,
         champion_push_drop_box/2,
         login/1,
         check_fight_boss/2]).

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

-file("src/mod/gods_duel/gods_place_role.erl", 37).

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

-file("src/mod/gods_duel/gods_place_role.erl", 38).

-file("inc/question_match.hrl", 1).

-record(question_match_role,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = [],
         break_times = 0,
         fc = 0,
         right_count = 0,
         score = 0,
         choose = 1,
         answer_time = 0,
         rank = 0,
         his_items = [],
         map_id = 0,
         is_join = 0,
         lasted_right = 0}).

-record(question_match_zone,
        {map_id = 0, map_pid = 0, role_count = 0}).

-file("src/mod/gods_duel/gods_place_role.erl", 39).

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

-file("src/mod/gods_duel/gods_place_role.erl", 40).

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

-file("src/mod/gods_duel/gods_place_role.erl", 41).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/mod/gods_duel/gods_place_role.erl", 42).

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

-file("src/mod/gods_duel/gods_place_role.erl", 43).

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

-file("src/mod/gods_duel/gods_place_role.erl", 44).

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

-file("src/mod/gods_duel/gods_place_role.erl", 45).

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

-file("src/mod/gods_duel/gods_place_role.erl", 46).

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

-file("src/mod/gods_duel/gods_place_role.erl", 47).

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

-file("src/mod/gods_duel/gods_place_role.erl", 48).

-file("inc/gods_place.hrl", 1).

-record(gods_place_team_statue,
        {ver = 1,
         team_id = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         members = [],
         qualification = 0,
         serial_id = 0,
         team_leader = {0, "", 0}}).

-record(gods_place_team_mate_statue,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         break_times = 0,
         looks = []}).

-record(m_gods_place,
        {ver = 3,
         group_id = 0,
         zone_id = 0,
         zone_pid = 0,
         pick_chest = 0,
         worship_times = 0,
         total_num = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0,
         efficiency_flag = 0,
         pick_flag = 0}).

-file("src/mod/gods_duel/gods_place_role.erl", 49).

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

-file("src/mod/gods_duel/gods_place_role.erl", 50).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/gods_duel/gods_place_role.erl", 51).

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

-file("src/mod/gods_duel/gods_place_role.erl", 52).

init() -> #m_gods_place{}.

login(Role = #role{s_event = 63,
                   m_gods_place = MgodsPlace, pos = Pos}) ->
    case gods_place_agent:call({get_status}) of
        {Mname, _} when Mname =:= 0 ->
            {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                            {10001, 2583, 3848},
                                            {10001, 4957, 3680},
                                            {10001, 445, 2565},
                                            {10001, 4646, 704},
                                            {10001, 841, 1033},
                                            {10001, 2098, 1834},
                                            {10001, 3617, 1816}]),
            NMgodsPlace = MgodsPlace#m_gods_place{group_id = 0,
                                                  zone_id = 0, zone_pid = 0},
            NRole = Role#role{m_gods_place = NMgodsPlace,
                              s_event = 0,
                              pos = Pos#pos{map = MapId, x = X, y = Y}},
            {ok, NRole};
        _ -> ok
    end;
login(Role = #role{m_gods_place = MgodsPlace}) ->
    NMgodsPlace = case gods_place_mgr:is_have_ceremony() of
                      true ->
                          case date:unixtime() >
                                   date:unixtime(zero) +
                                       calendar:time_to_seconds({21, 10, 0})
                              of
                              true ->
                                  MgodsPlace#m_gods_place{efficiency_flag = 1};
                              _ -> MgodsPlace
                          end;
                      _ -> MgodsPlace
                  end,
    {ok, Role#role{m_gods_place = NMgodsPlace}}.

role_week_five(Role = #role{m_gods_place = MgodsPlace,
                            s_event = Event},
               _) ->
    NMgodsPlace = MgodsPlace#m_gods_place{zone_id = 0,
                                          zone_pid = 0, pick_chest = 0,
                                          worship_times = 0,
                                          efficiency_flag = 0, pick_flag = 0},
    NewEvent = case Event of
                   63 -> 0;
                   E -> E
               end,
    NRole = Role#role{m_gods_place = NMgodsPlace,
                      s_event = NewEvent},
    {ok, NRole};
role_week_five(_Role, _) -> {ok, _Role}.

reset(Role = #role{m_gods_place = MgodsPlace}) ->
    NMgodsPlace = MgodsPlace#m_gods_place{pick_chest = 0,
                                          worship_times = 0,
                                          efficiency_flag = 0, pick_flag = 0},
    NRole = Role#role{m_gods_place = NMgodsPlace},
    {ok, NRole}.

push_drop_box(Role = #role{m_gods_place = MgodsPlace},
              Data) ->
    role:pack_send(Role, 17946, Data),
    NMgodsPlace = MgodsPlace#m_gods_place{pick_flag = 0},
    NRole = Role#role{m_gods_place = NMgodsPlace},
    {ok, NRole}.

champion_push_drop_box(Role = #role{m_gods_place =
                                        MGodsPlace},
                       Data) ->
    role:pack_send(Role, 17965, Data),
    NMGodsPlace = MGodsPlace#m_gods_place{pick_flag = 0},
    NewRole = Role#role{m_gods_place = NMGodsPlace},
    {ok, NewRole}.

check_pick(Role = #role{m_gods_place =
                            #m_gods_place{pick_chest = PickNum,
                                          pick_flag = _PickFlag}},
           PickArgs = #{base_id := BaseId}) ->
    case PickNum >= 3 of
        true ->
            {false, lang:get("您已经领取完本周所有宝箱，请下周再来{face_1,2}")};
        _ ->
            case role_misc:check_cd({pick_gods_place_box, 1}) of
                true ->
                    GainList = gods_place_data:get_gain(BaseId),
                    GainList1 = check_role_cond(Role, GainList),
                    case util:rand_list(GainList1, 5) of
                        {GainBaseId, Bind, Num, IsCast, _, _} ->
                            GainBaseId1 = item_type:special_id(GainBaseId),
                            {true,
                             PickArgs#{get_base_id => GainBaseId1,
                                       get_bind => Bind, get_num => Num,
                                       is_cast => IsCast}};
                        _ -> {false, lang:get("没有找到可以拾取的道具")}
                    end;
                _ ->
                    case get({pick_gods_place_box, 1}) of
                        T when is_integer(T) ->
                            Time = role_misc:get_cd({pick_gods_place_box, 1}),
                            RTime = Time - date:unixtime(ms) + T,
                            Msg = case RTime =< 60000 of
                                      true ->
                                          notice:format(lang:get("刚刚领取过一个宝箱的，~ts秒之后再来{face_1,15}"),
                                                        [{string_2,
                                                          1,
                                                          RTime div 1000}]);
                                      _ ->
                                          notice:format(lang:get("刚刚领取过一个宝箱，~ts分钟之后再来{face_1,15}"),
                                                        [{string_2,
                                                          1,
                                                          RTime div 60000}])
                                  end,
                            {false, Msg};
                        _ ->
                            {false,
                             lang:get("您刚刚已经领取过一个宝箱的，过段时间再来领吧{face_1,15}")}
                    end
            end
    end.

pick_gain(Role = #role{name = RoleName,
                       m_gods_place =
                           MgodsPlace = #m_gods_place{pick_chest = PickNum,
                                                      zone_pid = ZonePid}},
          #{uid := UnitId, get_base_id := GainBaseId,
            get_bind := Bind, get_num := Num, is_cast := IsCast,
            base_id := UnitBaseId}) ->
    case UnitBaseId of
        43089 ->
            big_world:cast(gods_place_zone,
                           cast,
                           [ZonePid, {pick_box, UnitId, RoleName, 1}]);
        43090 ->
            big_world:cast(gods_place_zone,
                           cast,
                           [ZonePid, {pick_box, UnitId, RoleName, 1}]);
        _ ->
            logger:error("未知宝箱", [], gods_place_role, 155),
            ignore
    end,
    Gain = format:val_to_gain([{GainBaseId, Bind, Num}]),
    case role_gain:do_notice(Gain, Role) of
        {ok, Role1} ->
            cast_gain(RoleName, GainBaseId, Num, IsCast),
            NewM = MgodsPlace#m_gods_place{pick_chest = PickNum + 1,
                                           pick_flag = 1},
            Role2 = Role1#role{m_gods_place = NewM},
            {ok, Role2};
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("诸神殿堂宝箱"),
            Content = lang:get("采集宝箱时，背包空间已满"),
            Items = [{GainBaseId, Bind, Num}],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items}),
            cast_gain(RoleName, GainBaseId, Num, IsCast),
            NewM = MgodsPlace#m_gods_place{pick_chest = PickNum + 1,
                                           pick_flag = 1},
            Role1 = Role#role{m_gods_place = NewM},
            {ok, Role1};
        _ -> {ok, Role}
    end;
pick_gain(Role, _) -> {ok, Role}.

rpc_join(Role = #role{}) ->
    case check_join([lev, combat, team, event, cross_type],
                    Role)
        of
        {true, CheckRole} -> transe_map(CheckRole);
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("活动还没开启")}
    end.

rpc_exit(#role{m_team = #m_team{status = 2}}) ->
    {false, lang:get("您正在跟随队伍，无法操作")};
rpc_exit(#role{m_team = #m_team{pid = TPid}})
    when is_pid(TPid) ->
    {false, lang:get("请离开队伍后再退出")};
rpc_exit(Role = #role{platform = P, zone_id = Z,
                      s_event = 63,
                      m_gods_place =
                          MgodsPlace = #m_gods_place{group_id = Gid,
                                                     zone_id = ZoneId,
                                                     zone_pid = ZonePid}}) ->
    {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                    {10001, 2583, 3848},
                                    {10001, 4957, 3680},
                                    {10001, 445, 2565},
                                    {10001, 4646, 704},
                                    {10001, 841, 1033},
                                    {10001, 2098, 1834},
                                    {10001, 3617, 1816}]),
    logger:debug("进入点:~w",
                 [{P, Z, MapId, X, Y}],
                 gods_place_role,
                 199),
    case map:role_enter({P, Z, MapId, X, Y},
                        [],
                        Role#role{s_event = 0, cross_type = 0})
        of
        {error, Reason} ->
            logger:error("退出地图失败：~w",
                         [Reason],
                         gods_place_role,
                         202),
            {false, Reason};
        {ok, MapRole} ->
            NMgodsPlace = MgodsPlace#m_gods_place{group_id = 0,
                                                  zone_id = 0, zone_pid = 0},
            NRole = MapRole#role{m_gods_place = NMgodsPlace},
            map:role_update(NRole),
            role_misc:push_cross(NRole),
            big_world:cast(gods_place_mgr,
                           cast,
                           [{exit_place, Gid, ZoneId, ZonePid}]),
            {ok, NRole}
    end;
rpc_exit(_Role) -> ok.

rpc_champion(#role{s_event = 63,
                   m_gods_place = #m_gods_place{group_id = Group}}) ->
    case gods_place_agent:call({get_champion_team, Group})
        of
        {ok, Team} -> {ok, Team};
        _ -> {false, lang:get("本地代理异常")}
    end;
rpc_champion(_Role) -> {false, lang:get("活动还没开启")}.

rpc_worship(#role{s_event = 63,
                  m_gods_place =
                      #m_gods_place{worship_times = WorshipTimes}})
    when WorshipTimes >= 1 ->
    {false, lang:get("膜拜次数已达上限，请下周再来")};
rpc_worship(Role = #role{pid = RolePid, name = RoleName,
                         s_event = 63,
                         m_gods_place =
                             #m_gods_place{worship_times = WorshipTimes}}) ->
    Msg = case util:rand(1, 5) of
              1 ->
                  notice:format(lang:get("~ts：英明神武，一统星辰！"),
                                [{role_2, RoleName}]);
              2 ->
                  notice:format(lang:get("~ts：再接再厉，争取蝉联！"),
                                [{role_2, RoleName}]);
              3 ->
                  notice:format(lang:get("~ts：大神，求带！"),
                                [{role_2, RoleName}]);
              4 ->
                  notice:format(lang:get("~ts：下届诸神加油！"),
                                [{role_2, RoleName}]);
              _ ->
                  notice:format(lang:get("~ts：来拜大神啦，留个言！"),
                                [{role_2, RoleName}])
          end,
    case gods_place_agent:call({update_worship, Msg}) of
        [] -> {false, lang:get("膜拜数据存入出错")};
        List ->
            role:pack_send(RolePid, 17945, {1, List}),
            case do_worship_reward(Role) of
                {ok, NRole} ->
                    Flag = case WorshipTimes + 1 < 1 of
                               true -> 1;
                               false -> 0
                           end,
                    role:pack_send(RolePid, 17947, {Flag}),
                    {ok, NRole};
                {false, Msg} ->
                    Flag = case WorshipTimes < 1 of
                               true -> 1;
                               false -> 0
                           end,
                    role:pack_send(RolePid, 17947, {Flag}),
                    {false, Msg}
            end
    end;
rpc_worship(_Role) -> {false, lang:get("没有进入殿堂")}.

rpc_worship_msg() ->
    case gods_place_agent:call(get_worship) of
        [] -> {false, lang:get("读取膜拜数据出错")};
        List -> {ok, List}
    end.

rpc_set_barrage(Role = #role{s_event = 63,
                             m_gods_place = MgodsPlace},
                1, Value) ->
    NewValue = case Value of
                   0 -> 0;
                   _ -> 1
               end,
    NMgodsPlace = MgodsPlace#m_gods_place{sys_barrage =
                                              NewValue},
    NRole = Role#role{m_gods_place = NMgodsPlace},
    {ok, NRole};
rpc_set_barrage(Role = #role{s_event = 63,
                             m_gods_place = MgodsPlace},
                2, Value) ->
    NewValue = case Value of
                   0 -> 0;
                   _ -> 1
               end,
    NMgodsPlace = MgodsPlace#m_gods_place{ply_barrage =
                                              NewValue},
    NRole = Role#role{m_gods_place = NMgodsPlace},
    {ok, NRole};
rpc_set_barrage(_Role, _, _) ->
    {false, lang:get("没有参与膜拜活动")}.

rpc_send_barrage(#role{s_event = 63,
                       m_gods_place =
                           #m_gods_place{zone_pid = ZonePid,
                                         barrage_time = BarrageTime}},
                 Msg) ->
    case util:text_banned(Msg) of
        true -> {false, lang:get("内容中有禁用词语")};
        _ ->
            case date:unixtime() < BarrageTime of
                true -> {false, lang:get("")};
                _ ->
                    case date:unixtime() - BarrageTime >= 6 of
                        true ->
                            big_world:cast(gods_place_mgr,
                                           cast,
                                           [{send_barrage, ZonePid, Msg}]);
                        _ -> {false, lang:get("")}
                    end
            end
    end;
rpc_send_barrage(_Role, _Msg) ->
    {false, lang:get("您不在诸神殿堂中，不能发送弹幕")}.

rpc_query_worship_info(#role{m_gods_place =
                                 #m_gods_place{worship_times = WorshipTimes}})
    when WorshipTimes >= 1 ->
    0;
rpc_query_worship_info(_Role) -> 1.

rpc_set_efficiency(Role = #role{m_gods_place =
                                    MgodsPlace}) ->
    NMgodsPlace = MgodsPlace#m_gods_place{efficiency_flag =
                                              1},
    NRole = Role#role{m_gods_place = NMgodsPlace},
    {ok, NRole};
rpc_set_efficiency(_Role) -> {false, lang:get("设置失败")}.

rpc_query_efficiency_info(#role{m_gods_place =
                                    #m_gods_place{efficiency_flag = Flag}}) ->
    Flag;
rpc_query_efficiency_info(_Role) -> 0.

rpc_drop_box_time(#role{id = Rid}) ->
    gods_place_agent:info({Rid, drop_box_time}).

rpc_champion_drop_box_time(#role{id = Rid}) ->
    gods_place_agent:info({champion_drop_box_time, Rid}).

rpc_get_marvelous(Role) ->
    SeasonId = case gods_place_agent:call(get_season_id) of
                   Num when is_integer(Num) -> Num;
                   _ -> gods_duel_common:get_season_id()
               end,
    AllList1 = ets:match_object(gods_duel_match_profile,
                                #gods_duel_match_profile{season_id = SeasonId,
                                                         _ = '_'}),
    AllList2 = [P
                || P = #gods_duel_match_profile{round = Round}
                       <- AllList1,
                   Round > 5],
    logger:debug("=====~w",
                 [AllList2],
                 gods_place_role,
                 349),
    FcDiffMaxList1 = case AllList2 of
                         [] -> [];
                         L1 when is_list(L1) ->
                             FcL1 = [P
                                     || P = #gods_duel_match_profile{fc_diff =
                                                                         FcDiff}
                                            <- L1,
                                        FcDiff > 0],
                             case length(FcL1) of
                                 Length1 when Length1 > 5 ->
                                     lists:nthtail(Length1 - 5,
                                                   lists:keysort(#gods_duel_match_profile.fc_diff,
                                                                 FcL1));
                                 _ ->
                                     lists:keysort(#gods_duel_match_profile.fc_diff,
                                                   FcL1)
                             end
                     end,
    logger:debug("=====~w",
                 [FcDiffMaxList1],
                 gods_place_role,
                 361),
    LikedMaxList1 = case AllList2 -- FcDiffMaxList1 of
                        [] -> [];
                        L2 when is_list(L2) ->
                            Fun1 = fun (#gods_duel_match_profile{id = Id,
                                                                 platform =
                                                                     Platform,
                                                                 zone_id =
                                                                     ZoneId},
                                        Temp) ->
                                           case big_world:call(Platform,
                                                               ZoneId,
                                                               combat_record,
                                                               fetch,
                                                               [{13,
                                                                 {Id,
                                                                  Platform,
                                                                  ZoneId}}])
                                               of
                                               #combat_record{liked = Liked} ->
                                                   [{Id, Liked} | Temp];
                                               _ -> Temp
                                           end;
                                       (_, Temp) -> Temp
                                   end,
                            LikedL = lists:foldl(Fun1, [], L2),
                            LikedL2 = case length(LikedL) of
                                          Length2 when Length2 > 5 ->
                                              lists:nthtail(Length2 - 5,
                                                            lists:keysort(2,
                                                                          LikedL));
                                          _ -> lists:keysort(2, LikedL)
                                      end,
                            Fun2 = fun ({Id, _}, Temp) ->
                                           case
                                               ets:lookup(gods_duel_match_profile,
                                                          Id)
                                               of
                                               [P =
                                                    #gods_duel_match_profile{}] ->
                                                   [P | Temp];
                                               _ -> Temp
                                           end;
                                       (_, Temp) -> Temp
                                   end,
                            lists:foldl(Fun2, [], LikedL2)
                    end,
    logger:debug("=====~w",
                 [LikedMaxList1],
                 gods_place_role,
                 392),
    RoundMaxList1 = case (AllList2 -- FcDiffMaxList1) --
                             LikedMaxList1
                        of
                        [] -> [];
                        L3 when is_list(L3) ->
                            case length(L3) of
                                Length3 when Length3 > 5 ->
                                    lists:nthtail(Length3 - 5,
                                                  lists:keysort(#gods_duel_match_profile.round,
                                                                L3));
                                _ ->
                                    lists:keysort(#gods_duel_match_profile.round,
                                                  L3)
                            end
                    end,
    logger:debug("=====~w",
                 [RoundMaxList1],
                 gods_place_role,
                 403),
    FcDiffMaxList2 = do_list(FcDiffMaxList1, []),
    LikedMaxList2 = do_list(LikedMaxList1, []),
    RoundMaxList2 = do_list(RoundMaxList1, []),
    Data = [{1, RoundMaxList2},
            {2, LikedMaxList2},
            {3, FcDiffMaxList2}],
    logger:debug("发送:~w", [Data], gods_place_role, 408),
    role:pack_send(Role, 17950, {Data}).

rpc_get_champion_video(Role) ->
    SeasonId = case gods_place_agent:call(get_season_id) of
                   Num when is_integer(Num) -> Num;
                   _ -> gods_duel_common:get_season_id()
               end,
    ChampionVideo1 =
        ets:match_object(gods_duel_match_profile,
                         #gods_duel_match_profile{season_id = SeasonId,
                                                  match_round = 7, _ = '_'}),
    ChampionVideo2 = do_list(ChampionVideo1, []),
    logger:debug("发送:~w",
                 [ChampionVideo2],
                 gods_place_role,
                 421),
    role:pack_send(Role, 17951, {ChampionVideo2}).

role_callback(_,
              Role = #role{pos = OldPos, m_gods_place = MgodsPlace},
              ToPos, {apply_enter, GId, HouseId, ZonePid}) ->
    logger:debug("~w,~w",
                 [GId, HouseId],
                 gods_place_role,
                 431),
    Role1 = Role#role{s_event = 63, s_event_pid = ZonePid},
    #pos{platform = Lp, zone_id = Lz, map = LMapId, x = Lx,
         y = Ly} =
        OldPos,
    case map:role_enter(ToPos, Role1) of
        {error, Reason} -> {false, Reason};
        {ok, NewRole = #role{pos = Pos}} ->
            NewPos = Pos#pos{last =
                                 #pos_history{platform = Lp, zone_id = Lz,
                                              map = LMapId, x = Lx, y = Ly}},
            NMgodsPlace = case date:unixtime() >
                                   date:unixtime(zero) +
                                       calendar:time_to_seconds({21, 10, 0})
                              of
                              true ->
                                  MgodsPlace#m_gods_place{group_id = GId,
                                                          zone_id = HouseId,
                                                          zone_pid = ZonePid,
                                                          efficiency_flag = 1};
                              _ ->
                                  MgodsPlace#m_gods_place{group_id = GId,
                                                          zone_id = HouseId,
                                                          zone_pid = ZonePid}
                          end,
            NewRole1 = NewRole#role{pos = NewPos,
                                    m_gods_place = NMgodsPlace},
            role_misc:push_cross(NewRole1),
            {ok, NewRole1}
    end;
role_callback(_, _, _Arg1, _Arg2) ->
    logger:debug("~w,~w",
                 [_Arg1, _Arg2],
                 gods_place_role,
                 451),
    ok.

role_callback(Role = #role{s_event = 63, lev = Lev},
              {apply_gain_exp}) ->
    Gain1 = case qualifying_data:get_exp(Lev) of
                {Exp, _} when Exp > 0 ->
                    [#gain{label = exp, val = Exp}];
                _ -> []
            end,
    Gain2 = case pet:get_war_pet(Role) of
                {ok, #pet{lev = PetLev}} ->
                    case qualifying_data:get_exp(PetLev) of
                        {_, PetExp} when PetExp > 0 ->
                            [#gain{label = pet_exp, val = PetExp}];
                        _ -> []
                    end;
                _ -> []
            end,
    Gain = Gain1 ++ Gain2,
    case Gain of
        [_ | _] ->
            case role_gain:do_notice(Gain, Role) of
                {false, _} -> ok;
                {ok, NRole} -> {ok, NRole}
            end;
        _ -> ok
    end;
role_callback(_Role, {apply_gain_exp}) -> ok;
role_callback(Role = #role{name = _Name, s_event = 63,
                           platform = P, zone_id = Z,
                           m_gods_place = MgodsPlace},
              {apply_exit}) ->
    logger:debug("异步回调~ts", [_Name], gods_place_role, 483),
    NRole = case team:async_leave(Role, "") of
                {ok, LeaveTeamRole} -> LeaveTeamRole;
                _LeaveFalse -> Role
            end,
    {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                    {10001, 2583, 3848},
                                    {10001, 4957, 3680},
                                    {10001, 445, 2565},
                                    {10001, 4646, 704},
                                    {10001, 841, 1033},
                                    {10001, 2098, 1834},
                                    {10001, 3617, 1816}]),
    case map:role_enter({P, Z, MapId, X, Y},
                        [],
                        NRole#role{cross_type = 0, s_event = 0})
        of
        {error, Reason} ->
            logger:error("退出地图失败：~w",
                         [Reason],
                         gods_place_role,
                         494),
            {false, Reason};
        {ok, MapRole} ->
            NMgodsPlace = MgodsPlace#m_gods_place{group_id = 0,
                                                  zone_id = 0, zone_pid = 0},
            NewRole = MapRole#role{m_gods_place = NMgodsPlace},
            map:role_update(NewRole),
            role_misc:push_cross(NewRole),
            {ok, NewRole}
    end;
role_callback(_Role, {apply_exit}) -> ok;
role_callback(#role{id = Rid, s_event = 63,
                    m_gods_place = #m_gods_place{sys_barrage = 1}},
              {send_barrage, 1, Msg}) ->
    case Msg of
        [H | _T] when is_list(H) ->
            [notice:send(Rid, 13, Atom)
             || Atom <- Msg, is_list(Atom)];
        _ -> notice:send(Rid, 13, Msg)
    end,
    ok;
role_callback(Role = #role{id = Rid, s_event = 63,
                           m_gods_place =
                               MgodsPlace = #m_gods_place{ply_barrage = 1}},
              {send_barrage, 0, Msg}) ->
    notice:send(Rid, 13, Msg),
    NMgodsPlace = MgodsPlace#m_gods_place{barrage_time =
                                              date:unixtime()},
    NRole = Role#role{m_gods_place = NMgodsPlace},
    {ok, NRole};
role_callback(_Role, {send_barrage, _, _Msg}) ->
    logger:debug("玩家已屏蔽该弹幕~w",
                 [_Msg],
                 gods_place_role,
                 520),
    ok;
role_callback(#role{pid = RolePid, s_event = 63},
              create_box) ->
    notice:effect({role_pid, RolePid}, 30218),
    ok;
role_callback(_Role, create_box) -> ok;
role_callback(Role = #role{id = Rid,
                           m_gods_place = MgodsPlace},
              {async_enter,
               #{group_id := GId, zone_id := HouseId,
                 zone_pid := ZonePid}}) ->
    logger:debug("==========", [], gods_place_role, 530),
    FlyRole = case role_fly:force_landing(Role) of
                  {ok, _Role} -> _Role;
                  _ -> Role
              end,
    NewRole = FlyRole#role{m_gods_place =
                               MgodsPlace#m_gods_place{group_id = GId,
                                                       zone_id = HouseId,
                                                       zone_pid = ZonePid}},
    ChallengeList = case env:get(gods_challenge_list) of
                        undefined -> [];
                        _ChallengeList -> _ChallengeList
                    end,
    case lists:member(Rid, ChallengeList) of
        true ->
            Reply = case env:get(challenger_ready) of
                        undefined -> 0;
                        _Reply -> _Reply
                    end,
            role:link_send(NewRole, 17955, {Reply});
        _ -> ok
    end,
    {ok, NewRole};
role_callback(Role = #role{s_event = 63},
              {push_17955, Reply}) ->
    role:link_send(Role, 17955, Reply),
    ok;
role_callback(_Role, {push_17955, _Reply}) -> ok;
role_callback(_Role, _Msg) ->
    logger:debug("未知的回调消息：~w",
                 [_Msg],
                 gods_place_role,
                 561),
    ok.

check_join([], Role) -> {true, Role};
check_join([lev | _Rest], #role{lev = Lev})
    when Lev < 50 ->
    Msg = notice:format("等级达到~ts才能参加诸神膜拜哦",
                        [{string_2, 1, 50}]),
    {false, Msg};
check_join([combat | _Rest],
           #role{m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    Msg = lang:get("正在战斗中，无法参加诸神膜拜"),
    {false, Msg};
check_join([team | _Rest],
           #role{m_team = #m_team{status = 2}}) ->
    {false, lang:get("您正在跟随队伍中，无法进行传送")};
check_join([team | Rest],
           Role = #role{m_team = #m_team{status = 3}}) ->
    check_join(Rest, Role);
check_join([team | Rest], Role = #role{lev = Lev}) ->
    BreakTimes = lev_break:get_times(Role),
    case team:get_members(Role) of
        [] -> check_join(Rest, Role);
        Members ->
            case [M || M = #team_mate{status = 2} <- Members] of
                Members ->
                    case check_team_members(Lev + 6 * BreakTimes, Members)
                        of
                        true -> check_join(Rest, Role);
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("请召回队员之后再进入诸神殿堂")}
            end
    end;
check_join([event | Rest], Role) ->
    case role_misc:check_event(Role, [2, 28]) of
        true -> check_join(Rest, Role);
        {false, _Reason} -> {false, lang:get("当前状态不能参加诸神膜拜")};
        _ -> {false, lang:get("当前状态不能参加诸神膜拜")}
    end;
check_join([cross_type | Rest],
           Role = #role{cross_type = CrossType}) ->
    case CrossType of
        2 -> {false, lang:get("不能在跨服进入诸神膜拜")};
        0 ->
            case cross:is_ready() of
                1 -> check_join(Rest, Role);
                0 -> {false, lang:get("没有连接跨服，不能进入诸神膜拜")}
            end;
        1 -> {false, lang:get("不能在跨服进入诸神膜拜")}
    end;
check_join([_Type | Rest], Role) ->
    check_join(Rest, Role).

check_team_members(_LeaderLev,
                   [#team_mate{name = Name, lev = Lev} | _Rest])
    when Lev < 50 ->
    Msg = notice:format(lang:get("队伍中~ts的等级不足~ts级，无法进入"),
                        [{role_2, Name}, {string_2, 1, 50}]),
    {false, Msg};
check_team_members(LeaderLev,
                   [#team_mate{name = Name, lev = Lev,
                               lev_break_times = BreakTimes}
                    | Rest]) ->
    case get_gods_place_group(LeaderLev) =:=
             get_gods_place_group(Lev + 6 * BreakTimes)
        of
        true -> check_team_members(LeaderLev, Rest);
        _ ->
            Msg =
                notice:format(lang:get("队伍中~ts的等级和队长不在同一个分段，不能一起进入"),
                              [{role_2, Name}]),
            {false, Msg}
    end;
check_team_members(_LeaderLev, []) -> true.

check_fight_boss(#role{s_event = Event}, _)
    when Event =/= 63 ->
    logger:debug("=====", [], gods_place_role, 637),
    {false, lang:get("不在诸神殿堂中，无法挑战")};
check_fight_boss(Role = #role{id = RoleId,
                              m_team = #m_team{status = Status}},
                 [members | T]) ->
    logger:debug("=====", [], gods_place_role, 640),
    case Status of
        1 ->
            ChallengeList = case env:get(gods_challenge_list) of
                                [] ->
                                    case big_world:call(gods_place_mgr,
                                                        call,
                                                        [get_gods_challenge_list])
                                        of
                                        {ok, Team} ->
                                            env:set(gods_challenge_list, Team),
                                            Team;
                                        _ -> []
                                    end;
                                List when is_list(List) -> List;
                                _ ->
                                    case big_world:call(gods_place_mgr,
                                                        call,
                                                        [get_gods_challenge_list])
                                        of
                                        {ok, Team} ->
                                            env:set(gods_challenge_list, Team),
                                            Team;
                                        _ -> []
                                    end
                            end,
            logger:info("==========~w",
                        [ChallengeList],
                        gods_place_role,
                        662),
            case lists:member(RoleId, ChallengeList) of
                true ->
                    Members = team:get_members(Role),
                    MateIds = [MateId
                               || #team_mate{id = MateId} <- Members],
                    case MateIds -- ChallengeList of
                        [] ->
                            logger:debug("==========",
                                         [],
                                         gods_place_role,
                                         669),
                            check_fight_boss(Role, T);
                        [Id1 | _] ->
                            logger:debug("==========~w",
                                         [Id1],
                                         gods_place_role,
                                         672),
                            {ok, [Name]} = role_query:attr(by_id,
                                                           Id1,
                                                           [#role.name]),
                            {false,
                             notice:format(lang:get("~ts不是王者组冠军成员，不能参与"),
                                           [{role_2, Name}])}
                    end;
                _ -> {false, lang:get("只有王者组冠军的成员才能挑战哦")}
            end;
        _ -> {false, lang:get("只有队长才能开启诸神挑战")}
    end;
check_fight_boss(Role, [status | T]) ->
    logger:debug("=====", [], gods_place_role, 691),
    Members = team:get_members(Role),
    case length(Members) of
        4 ->
            case [Id
                  || #team_mate{id = Id, status = Status} <- Members,
                     Status =:= 3 orelse Status =:= 4]
                of
                [] -> check_fight_boss(Role, T);
                _ -> {false, lang:get("所有成员都归队后才能参与")}
            end;
        _ -> {false, lang:get("队伍人数不足5人")}
    end;
check_fight_boss(Role, [time | T]) ->
    logger:debug("=====", [], gods_place_role, 705),
    case gods_place_agent:call({get_status}) of
        {Mname, _} when Mname =:= 6 ->
            {false,
             lang:get("你的队伍已准备就绪，活动将在<color='#00ff00'>21:15</color>开启")};
        {Mname, _} when Mname =:= 8 ->
            check_fight_boss(Role, T);
        {Mname, _} when Mname =:= 3 ->
            {false, lang:get("已经挑战过一次了，等下次再来吧")};
        _Err ->
            logger:error("~w", [_Err], gods_place_role, 714),
            {false, lang:get("挑战出现异常")}
    end;
check_fight_boss(_Role, []) -> true.

get_gods_place_group(Lev) ->
    case Lev of
        L when 50 =< L andalso L < 90 -> 1;
        L when 90 =< L andalso L < 100 -> 2;
        L when 100 =< L andalso L < 106 -> 3;
        L when 106 =< L andalso L < 116 -> 4;
        _ -> 5
    end.

do_worship_reward(Role = #role{m_gods_place =
                                   MGodsPlace = #m_gods_place{worship_times =
                                                                  WorshipTimes}}) ->
    case gods_place_data:get(1) of
        {_, GiftList} ->
            GiftInfo = check_role_cond(Role, GiftList),
            {GainBaseId, Bind, Num, Cast, _, _} =
                util:rand_list(GiftInfo, 5),
            GainBaseId1 = item_type:special_id(GainBaseId),
            role:send_buff_begin(),
            NMgodsPlace = MGodsPlace#m_gods_place{worship_times =
                                                      WorshipTimes + 1},
            NRole = Role#role{m_gods_place = NMgodsPlace},
            Gain = format:val_to_gain([{GainBaseId1, Bind, Num}]),
            case role_gain:do(Gain, NRole) of
                {false, #gain{reason = bag_full}} ->
                    case Cast of
                        1 ->
                            notice:cast(all,
                                        4,
                                        notice:format(lang:get("喜闻乐见，~ts膜拜诸神冠军时被赏赐了~ts{face_1,4}"),
                                                      [{role_2, NRole},
                                                       {item_2,
                                                        [{GainBaseId1,
                                                          Num}]}]));
                        _ -> ignore
                    end,
                    notice:send(NRole,
                                3,
                                notice:format(lang:get("膜拜大神成功，恭喜获得~ts"),
                                              [{item_2,
                                                [{GainBaseId1, Num}]}])),
                    Title = lang:get("膜拜诸神奖励"),
                    Content = lang:get("您在膜拜诸神时背包已满，奖励通过邮件发放"),
                    mail:send(NRole,
                              #{title => Title, content => Content,
                                items => [{GainBaseId1, Bind, Num}]}),
                    role:send_buff_flush(),
                    {ok, NRole};
                {ok, Role2} ->
                    case Cast of
                        1 ->
                            notice:cast(all,
                                        4,
                                        notice:format(lang:get("喜闻乐见，~ts膜拜诸神冠军时被赏赐了~ts{face_1,4}"),
                                                      [{role_2, NRole},
                                                       {item_2,
                                                        [{GainBaseId1,
                                                          Num}]}]));
                        _ -> ignore
                    end,
                    notice:send(Role2,
                                3,
                                notice:format(lang:get("膜拜大神成功，恭喜获得~ts"),
                                              [{item_2,
                                                [{GainBaseId1, Num}]}])),
                    role:send_buff_flush(),
                    {ok, Role2};
                {false, #gain{msg = Msg}} ->
                    role:send_buff_clean(),
                    {false, Msg}
            end;
        _ -> {false, lang:get("配表出错")}
    end.

cast_gain(RoleName, BaseId, Num, 1) ->
    CastMsg = case util:rand(1, 2) of
                  1 ->
                      notice:format(lang:get("手速惊人，~ts抢到了诸神冠军撒下的冠军宝箱获得了~ts{face_1,18}"),
                                    [{role_2, RoleName},
                                     {item_2, [{BaseId, Num}]}]);
                  _ ->
                      notice:format(lang:get("~ts兴匆匆打开诸神冠军宝箱时，~ts砸在了额头上{face_1,36}"),
                                    [{role_2, RoleName},
                                     {item_2, [{BaseId, Num}]}])
              end,
    notice:cast(all, 4, CastMsg);
cast_gain(_, _, _, _) -> ok.

do_list([#gods_duel_match_profile{id = Id,
                                  platform = Platform, zone_id = ZoneId,
                                  season_id = SeasonId,
                                  match_round = MatchRound, group_id = GroupId,
                                  atk_name = ATKName, dfd_name = DFDName,
                                  time = Time}
         | L],
        List) ->
    NList = case big_world:call(Platform,
                                ZoneId,
                                combat_record,
                                fetch,
                                [{13, {Id, Platform, ZoneId}}])
                of
                #combat_record{replayed = Replayed} ->
                    [{Id,
                      Platform,
                      ZoneId,
                      SeasonId,
                      MatchRound,
                      GroupId,
                      ATKName,
                      DFDName,
                      Time,
                      Replayed}
                     | List];
                _ -> List
            end,
    do_list(L, NList);
do_list([_ | L], List) -> do_list(L, List);
do_list([], List) -> List.

check_role_cond(#role{sex = Sex, lev = Lev,
                      classes = Classes},
                List) ->
    check_role_cond(#{lev => Lev, sex => Sex,
                      classes => Classes},
                    List,
                    []).

check_role_cond(_Args, [], List) -> List;
check_role_cond(Args = #{sex := Sex, lev := Lev,
                         classes := Classes},
                [#{item_id := ItemIDT, num := NumT, lev_low := LevLow,
                   lev_high := LevHigh, sex := SexT, classes := ClassesT,
                   ratio := RatioT, is_cast := CastT, bind := BindT,
                   name_item := NameT}
                 | T],
                List)
    when (SexT =:= Sex orelse SexT =:= 2) andalso
             (ClassesT =:= Classes orelse ClassesT =:= 0) andalso
                 (LevLow =:= 0 andalso LevHigh =:= 0 orelse
                      LevLow =:= 0 andalso Lev =< LevHigh orelse
                          Lev >= LevLow andalso LevHigh =:= 0 orelse
                              Lev >= LevLow andalso Lev =< LevHigh) ->
    check_role_cond(Args,
                    T,
                    [{ItemIDT, BindT, NumT, CastT, RatioT, NameT} | List]);
check_role_cond(Args, [_ | T], List) ->
    check_role_cond(Args, T, List).

transe_map(Role = #role{id = Rid, name = _Name,
                        lev = Lev, pos = OldPos, m_gods_place = MgodsPlace}) ->
    logger:debug("=====", [], gods_place_role, 840),
    FollowMembers = [M
                     || M = #team_mate{status = 2}
                            <- team:get_members(Role)],
    MemNum = length(FollowMembers) + 1,
    BreakTimes = lev_break:get_times(Role),
    GroupId = get_gods_place_group(Lev + 6 * BreakTimes),
    case MemNum =< 1 of
        true ->
            case big_world:call(gods_place_mgr,
                                call,
                                [{enter, GroupId, [Rid]}])
                of
                {false, Reason} -> {false, Reason};
                {ZonePid, MapId, Platform, ZoneId, GId, HouseId} ->
                    #pos{platform = Lp, zone_id = Lz, map = LMapId, x = Lx,
                         y = Ly} =
                        OldPos,
                    {X, Y} = {util:rand(1440, 2640), util:rand(1200, 1840)},
                    NRole = Role#role{s_event = 63, s_event_pid = ZonePid},
                    NewTeamRole = case team:async_leave(NRole, "") of
                                      {ok, LeaveTeamRole} -> LeaveTeamRole;
                                      _LeaveFalse -> NRole
                                  end,
                    case map:role_enter({Platform,
                                         ZoneId,
                                         {MapId,
                                          X + util:rand(-100, 100),
                                          Y + util:rand(-100, 100)}},
                                        self,
                                        NewTeamRole)
                        of
                        {ok, MapRole = #role{pos = Pos}} ->
                            NewRole = case role_fly:force_landing(MapRole) of
                                          {ok, _Role} -> _Role;
                                          _ -> MapRole
                                      end,
                            map:role_update(NewRole),
                            role_misc:push_cross(NewRole),
                            NewPos = Pos#pos{last =
                                                 #pos_history{platform = Lp,
                                                              zone_id = Lz,
                                                              map = LMapId,
                                                              x = Lx, y = Ly}},
                            NMgodsPlace = case date:unixtime() >
                                                   date:unixtime(zero) +
                                                       calendar:time_to_seconds({21,
                                                                                 10,
                                                                                 0})
                                              of
                                              true ->
                                                  MgodsPlace#m_gods_place{group_id
                                                                              =
                                                                              GId,
                                                                          zone_id
                                                                              =
                                                                              HouseId,
                                                                          zone_pid
                                                                              =
                                                                              ZonePid,
                                                                          efficiency_flag
                                                                              =
                                                                              1};
                                              _ ->
                                                  MgodsPlace#m_gods_place{group_id
                                                                              =
                                                                              GId,
                                                                          zone_id
                                                                              =
                                                                              HouseId,
                                                                          zone_pid
                                                                              =
                                                                              ZonePid}
                                          end,
                            NewRole1 = NewRole#role{pos = NewPos,
                                                    m_gods_place = NMgodsPlace},
                            {ok, NewRole1};
                        {error, Reason} -> {false, Reason}
                    end
            end;
        _ ->
            Members = team:get_members(Role),
            MateIds = [MateId
                       || #team_mate{id = MateId} <- Members],
            case big_world:call(gods_place_mgr,
                                call,
                                [{enter, GroupId, [Rid | MateIds]}])
                of
                {false, Reason} -> {false, Reason};
                {ZonePid, MapId, Platform, ZoneId, GId, HouseId} ->
                    #pos{platform = Lp, zone_id = Lz, map = LMapId, x = Lx,
                         y = Ly} =
                        OldPos,
                    {X, Y} = {util:rand(1440, 2640), util:rand(1200, 1840)},
                    NewTeamRole = Role#role{s_event = 63,
                                            s_event_pid = ZonePid},
                    MateEvent = make_team_evt(NewTeamRole,
                                              GId,
                                              HouseId,
                                              ZonePid),
                    case map:role_enter(ToPos = {Platform,
                                                 ZoneId,
                                                 {MapId,
                                                  X + util:rand(-100, 100),
                                                  Y + util:rand(-100, 100)}},
                                        MateEvent,
                                        NewTeamRole)
                        of
                        {error, Reason} ->
                            logger:error("[~w]进入诸神殿堂失败:~w, 进入坐标:~w",
                                         [_Name, Reason, ToPos],
                                         gods_place_role,
                                         895),
                            {false, lang:get("进入诸神殿堂失败")};
                        {ok, EnterRole = #role{pos = Pos}} ->
                            NewPos = Pos#pos{last =
                                                 #pos_history{platform = Lp,
                                                              zone_id = Lz,
                                                              map = LMapId,
                                                              x = Lx, y = Ly}},
                            NMgodsPlace = case date:unixtime() >
                                                   date:unixtime(zero) +
                                                       calendar:time_to_seconds({21,
                                                                                 10,
                                                                                 0})
                                              of
                                              true ->
                                                  MgodsPlace#m_gods_place{group_id
                                                                              =
                                                                              GId,
                                                                          zone_id
                                                                              =
                                                                              HouseId,
                                                                          zone_pid
                                                                              =
                                                                              ZonePid,
                                                                          efficiency_flag
                                                                              =
                                                                              1};
                                              _ ->
                                                  MgodsPlace#m_gods_place{group_id
                                                                              =
                                                                              GId,
                                                                          zone_id
                                                                              =
                                                                              HouseId,
                                                                          zone_pid
                                                                              =
                                                                              ZonePid}
                                          end,
                            NewRole = EnterRole#role{pos = NewPos,
                                                     m_gods_place =
                                                         NMgodsPlace},
                            {ok, NewRole}
                    end
            end
    end.

make_team_evt(Role = #role{s_event = Event}, GId,
              HouseId, ZonePid) ->
    case check_team(Role) of
        [] -> self;
        MateIds when Event =:= 63 ->
            FollowMateIds = [Id || Id <- MateIds],
            #{label => enter_event, event => Event,
              role_ids => FollowMateIds,
              mfa =>
                  {gods_place_role,
                   role_callback,
                   [{apply_enter, GId, HouseId, ZonePid}]}}
    end.

check_team(Role = #role{m_team =
                            #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    case team:get_members(Role) of
        TeamList = [_ | _] ->
            [Id || #team_mate{id = Id, status = 2} <- TeamList];
        _ -> []
    end;
check_team(_) -> [].

