-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      1).

-module(oracle_treasure_role).

-export([rpc_enter/1,
         rpc_exit/1,
         rpc_query_unit_info/1,
         rpc_get_status/1,
         rpc_get_card/2,
         rpc_get_rank/1,
         kill_npc/2,
         push/1,
         gm_reset/1,
         gm_reset_week/1,
         gm_set_star/4,
         gm_clear_unit_info/0,
         sync_spirit_offer/1,
         sync_spirit_offer/0]).

-export([apply_team_mate_enter/3,
         apply_team_mate_leave/3,
         apply_open_card/1,
         apply_lost_offer/1,
         apply_get_fighters/1,
         apply_exit/1,
         apply_replace_offer/1,
         async_enter_cross_spt/2,
         async_exit_cross_spt/2,
         check_fight_general/2,
         check_fight_final/2,
         check_gain/3,
         init/0,
         login/1,
         delay_login/1,
         role_week_five/2,
         check_offer/1,
         wave_reward/5,
         get_fighters/1,
         recruit_lev/3,
         cross_group_info/0,
         is_cross/0,
         fire_evt/2]).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      56).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      57).

-file("inc/oracle_treasure.hrl", 1).

-record(m_oracle_treasure,
        {ver = 2,
         is_offer = 0,
         unit_id = 0,
         is_get = 0,
         card_gain_list = [],
         max_wave = 0,
         wave_reward = [],
         week_times = 0,
         times = 0}).

-record(oracle_treasure_state,
        {ts,
         timeout = 0,
         state_name,
         cross_type = 0,
         map_info = []}).

-record(oracle_treasure_unit,
        {base_id = {0, 0},
         ver = 1,
         difficulty = 1,
         kill_times = 0,
         offer_teams = [],
         now_star = 0,
         diff_num = 0}).

-record(oracle_treasure_team,
        {leader_id = {0, "", 0},
         all_mate_id = [],
         team_mates = [],
         record_id = {0, {0, "", 0}},
         wave = 0,
         use_time = 0}).

-record(oracle_treasure_offer_mate,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         status = 2,
         looks = []}).

-record(oracle_treasure_rank_rc,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         wave = 0,
         use_time = 0,
         rank = 0}).

-record(oracle_treasure_rank_list,
        {group = 0, min_val = {0, 0}, list = [], len = 0}).

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      58).

-file("inc/spirit_treasure.hrl", 1).

-record(m_spirit_treasure,
        {ver = 1,
         is_offer = 0,
         unit_id = 0,
         is_get = 0,
         card_gain_list = [],
         max_wave = 0,
         wave_reward = []}).

-record(spirit_treasure_state,
        {ts,
         timeout = 0,
         state_name,
         cross_type = 0,
         map_info = []}).

-record(spirit_treasure_unit,
        {base_id = {0, 0},
         ver = 1,
         difficulty = 1,
         kill_times = 0,
         offer_teams = [],
         now_star = 1,
         diff_num = 0}).

-record(spirit_treasure_team,
        {leader_id = {0, "", 0},
         all_mate_id = [],
         team_mates = [],
         record_id = {0, {0, "", 0}},
         wave = 0,
         use_time = 0}).

-record(spirit_treasure_offer_mate,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         status = 2,
         looks = []}).

-record(spirit_treasure_rank_rc,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         wave = 0,
         use_time = 0,
         rank = 0}).

-record(spirit_treasure_rank_list,
        {group = 0, min_val = {0, 0}, list = [], len = 0}).

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      59).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      60).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      61).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      62).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      63).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      64).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      65).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      66).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      67).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      68).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      69).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      70).

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

-file("src/mod/oracle_treasure/oracle_treasure_role.erl",
      71).

rpc_enter(Role) ->
    Args = #{members => []},
    case check_enter([lev,
                      combat,
                      event,
                      status,
                      team_members],
                     Role,
                     Args)
        of
        {true, CheckRole, #{members := Members}} ->
            transe_map(CheckRole, Members);
        {false, Reason} ->
            logger:debug("进入失败:~ts",
                         [Reason],
                         oracle_treasure_role,
                         81),
            {false, Reason};
        {_, _, _Args} ->
            logger:debug("=======:~w",
                         [_Args],
                         oracle_treasure_role,
                         84),
            {false, lang:get("进入地图失败")}
    end.

rpc_exit(#role{m_team = #m_team{status = 2}}) ->
    {false, lang:get("您正在跟随队伍，无法操作")};
rpc_exit(Role = #role{id = LeaderId = {_, P, Z},
                      name = Name, cross_type = CrossType,
                      m_team = #m_team{status = TeamStatus}}) ->
    {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                    {10001, 2583, 3848},
                                    {10001, 4957, 3680},
                                    {10001, 445, 2565},
                                    {10001, 4646, 704},
                                    {10001, 841, 1033},
                                    {10001, 2098, 1834},
                                    {10001, 3617, 1816}]),
    TeamEvt = make_team_evt(Role#role{s_event = 0}),
    ToPos = {P, Z, MapId, X, Y},
    ExitRole = Role#role{s_event = 0, cross_type = 0},
    case TeamEvt of
        self -> exit_normal(ToPos, TeamEvt, ExitRole);
        _ when CrossType =:= 0 ->
            exit_normal(ToPos, TeamEvt, ExitRole);
        _ when TeamStatus =/= 1 ->
            exit_normal(ToPos, TeamEvt, ExitRole);
        _ ->
            Members = team:get_members(ExitRole),
            logger:debug("队员信息:~w",
                         [Members],
                         oracle_treasure_role,
                         107),
            NewTeamRole = #role{m_team = MTeam} = case
                                                      team:async_leave(ExitRole,
                                                                       "")
                                                      of
                                                      {ok, LeaveTeamRole} ->
                                                          case
                                                              team_mgr:create(LeaveTeamRole)
                                                              of
                                                              {ok,
                                                               CreateTeamRole} ->
                                                                  CreateTeamRole;
                                                              Else ->
                                                                  logger:error("创建队伍失败 ~w",
                                                                               [Else],
                                                                               oracle_treasure_role,
                                                                               113),
                                                                  LeaveTeamRole
                                                          end;
                                                      _LeaveFalse -> ExitRole
                                                  end,
            case map:role_enter(ToPos, self, NewTeamRole) of
                {ok, NewRole} ->
                    TeamPid = case MTeam of
                                  #m_team{pid = Tpid} when is_pid(Tpid) -> Tpid;
                                  _ -> 0
                              end,
                    [role:apply(async,
                                MatePid,
                                {oracle_treasure_role,
                                 async_exit_cross_spt,
                                 [#{pos => ToPos, team_pid => TeamPid,
                                    status => Status, leader_id => LeaderId}]})
                     || #team_mate{pid = MatePid, status = Status}
                            <- Members,
                        is_pid(MatePid)],
                    map:role_update(NewRole),
                    role_misc:push_cross(NewRole),
                    team:stop_recruiting(NewRole),
                    cross:cast(role_group,
                               leave,
                               [center_world, Role#role.pid]),
                    {ok, NewRole};
                {error, Reason} ->
                    logger:error("退出跨服失败:~w",
                                 [Name],
                                 oracle_treasure_role,
                                 135),
                    {false, Reason}
            end
    end.

rpc_query_unit_info(#role{pid = RolePid}) ->
    logger:debug("====", [], oracle_treasure_role, 143),
    case cross_group_info() of
        {IsCross, Group} ->
            logger:debug("====", [], oracle_treasure_role, 146),
            handle_mgr(cast,
                       IsCross,
                       {query_unit_info, Group, RolePid});
        _ ->
            logger:debug("====", [], oracle_treasure_role, 149),
            handle_mgr(cast, 0, {query_unit_info, 0, RolePid})
    end,
    ok;
rpc_query_unit_info(_) -> ok.

rpc_get_rank(#role{pid = RolePid}) ->
    case cross_group_info() of
        {IsCross, Group} ->
            handle_mgr(cast, IsCross, {get_rank, Group, RolePid});
        _ -> handle_mgr(cast, 0, {get_rank, 0, RolePid})
    end,
    ok.

rpc_get_status(#role{pid = RolePid}) ->
    {IsCross, Group} = cross_group_info(),
    handle_mgr(cast, IsCross, {get_status, Group, RolePid}),
    ok.

rpc_get_card(Role = #role{m_oracle_treasure =
                              #m_oracle_treasure{card_gain_list = [_ | _],
                                                 is_get = GetTimes}},
             Order)
    when GetTimes =< 2 ->
    send_card_reward(Role, Order);
rpc_get_card(_Role, _Order) ->
    {false, lang:get("您已经领取过奖励了")}.

kill_npc(_Role = #role{id = RoleId}, BaseId) ->
    {IsCross, CrossGroup} = cross_group_info(),
    UnitId = {CrossGroup, BaseId},
    put(oracle_new_combat_flag, 1),
    handle_mgr(cast, IsCross, {kill_npc, RoleId, UnitId}),
    ok.

push(Role = #role{m_oracle_treasure =
                      #m_oracle_treasure{is_offer = IsOffer1,
                                         unit_id = UnitId1,
                                         max_wave = MaxWave1},
                  m_spirit_treasure =
                      #m_spirit_treasure{is_offer = IsOffer2,
                                         unit_id = UnitId2,
                                         max_wave = MaxWave2}}) ->
    logger:debug("==============:~w",
                 [{IsOffer1, UnitId1, MaxWave1}],
                 oracle_treasure_role,
                 184),
    HelpTimes = var:get_var(Role, day, 618, 0),
    role:link_send(Role,
                   20800,
                   {IsOffer1, UnitId1, MaxWave1, HelpTimes}),
    role:link_send(Role,
                   20200,
                   {IsOffer2, UnitId2, MaxWave2, HelpTimes}),
    ok.

init() -> #m_oracle_treasure{}.

login(Role = #role{s_event = 67, pos = Pos}) ->
    {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                    {10001, 2583, 3848},
                                    {10001, 4957, 3680},
                                    {10001, 445, 2565},
                                    {10001, 4646, 704},
                                    {10001, 841, 1033},
                                    {10001, 2098, 1834},
                                    {10001, 3617, 1816}]),
    NewRole = Role#role{s_event = 0,
                        pos = Pos#pos{map = MapId, x = X, y = Y}},
    {ok, NewRole};
login(_Role) -> ok.

delay_login(Role = #role{id = RoleId,
                         m_oracle_treasure =
                             MST = #m_oracle_treasure{is_offer = IsOffer}}) ->
    CheckHasOffer = check_offer(RoleId),
    case IsOffer of
        1 when CheckHasOffer =:= 0 ->
            case oracle_treasure_mgr:check_spirit_offer(RoleId) of
                0 ->
                    Title = lang:get("天启试练资格改变"),
                    Content =
                        notice:format(lang:get("由于有~ts挑战了更高难度的门徒，您的资格被顶替了，~ts可以获得资格{face_1,1}"),
                                      [{string_2, 1, lang:get("8个队伍")},
                                       {string_2, 1, lang:get("再次挑战")}]),
                    mail:send(Role, Title, Content);
                _ -> ok
            end,
            NewRole = Role#role{m_oracle_treasure =
                                    MST#m_oracle_treasure{is_offer =
                                                              CheckHasOffer}},
            push(NewRole),
            {ok, NewRole};
        _ -> ok
    end.

role_week_five(Role = #role{id = RoleId,
                            m_oracle_treasure = MST = #m_oracle_treasure{}},
               _) ->
    NewRole = Role#role{m_oracle_treasure =
                            MST#m_oracle_treasure{is_offer = 0, is_get = 0,
                                                  card_gain_list = [],
                                                  wave_reward = [],
                                                  week_times = 0}},
    push(NewRole),
    honor_mgr:del(oracle_treasure_honor_general, RoleId),
    {ok, NewRole}.

apply_lost_offer(Role = #role{m_oracle_treasure =
                                  Mst = #m_oracle_treasure{}}) ->
    NewRole = Role#role{m_oracle_treasure =
                            Mst#m_oracle_treasure{is_offer = 0, unit_id = 0}},
    push(NewRole),
    {ok, NewRole}.

apply_replace_offer(Role = #role{id = Rid, name = Name,
                                 m_oracle_treasure =
                                     Mot = #m_oracle_treasure{is_offer = 1}}) ->
    logger:debug("=====", [], oracle_treasure_role, 246),
    NewRole = Role#role{m_oracle_treasure =
                            Mot#m_oracle_treasure{is_offer = 0, unit_id = 0}},
    push(NewRole),
    Title = lang:get("试练资格改变"),
    Content =
        notice:format(lang:get("亲爱的~ts：由于你已经获得了龙王的挑战资格，原天启的挑战资格已被顶替！"),
                      [{role_2, Name}]),
    mail:send(Rid, Title, Content),
    {ok, NewRole};
apply_replace_offer(_Role) ->
    logger:debug("=====", [], oracle_treasure_role, 254),
    ok.

gm_reset_week(Role) -> role_week_five(Role, Role).

gm_set_star(#role{pid = RolePid}, UnitId, Star,
            KillTimes) ->
    {IsCross, Group} = cross_group_info(),
    handle_mgr(cast,
               IsCross,
               {gm_set_star,
                RolePid,
                {Group, UnitId},
                Star,
                KillTimes}).

apply_team_mate_enter(_, Role, _) ->
    {ok, Role#role{s_event = 67}}.

apply_team_mate_leave(_, Role, _) ->
    logger:debug("离开地图=======",
                 [],
                 oracle_treasure_role,
                 268),
    {ok, Role#role{s_event = 0}}.

apply_open_card(Role) ->
    {ok, CardRole1} = send_card_reward(Role, 1),
    {ok, CardRole2} = send_card_reward(CardRole1, 2),
    {ok, CardRole2}.

check_gain(Role = #role{id = RoleId,
                        m_oracle_treasure =
                            Mst = #m_oracle_treasure{is_get = GetTimes},
                        m_spirit_treasure =
                            #m_spirit_treasure{is_get = GetTimes2}},
           win, ExtArgs)
    when GetTimes >= 2 orelse GetTimes2 >= 2 ->
    BaseId = case lists:keyfind(unit_id, 1, ExtArgs) of
                 {_, {_, _BaseId}} -> _BaseId;
                 _ -> 0
             end,
    case oracle_treasure_data:get_card(BaseId) of
        [#{honor_id := HonorId} | _] ->
            honor_mgr:del(oracle_treasure_honor_general, RoleId),
            honor_mgr:add(oracle_treasure_honor_general,
                          [{RoleId, HonorId}],
                          0);
        _ -> ingore
    end,
    Star = case lists:keyfind(unit_star, 1, ExtArgs) of
               {_, _Star} -> _Star;
               _ -> 1
           end,
    TriggerRole = fire_evt(Role,
                           #evt_oracle_treasure_offer_star{star = Star}),
    NewRole = TriggerRole#role{m_oracle_treasure =
                                   Mst#m_oracle_treasure{is_offer = 1}},
    HelpTimes = var:get_var(Role, day, 618, 0),
    NewRole2 = case HelpTimes > 0 of
                   true -> NewRole;
                   _ ->
                       send_help_reward(RoleId),
                       var:set_var(NewRole, day, 618, HelpTimes + 1)
               end,
    push(NewRole2),
    {NewRole2, []};
check_gain(Role = #role{id = RoleId,
                        m_oracle_treasure = Mst = #m_oracle_treasure{}},
           win, ExtArgs) ->
    BaseId = case lists:keyfind(unit_id, 1, ExtArgs) of
                 {_, {_, _BaseId}} -> _BaseId;
                 _ -> 0
             end,
    MapCard = oracle_treasure_data:get_card(BaseId),
    GainList = case util:rand_list_n(MapCard, rate, 1) of
                   _Gl = [_ | _] -> _Gl;
                   _ -> []
               end,
    logger:debug("===============：~w",
                 [GainList],
                 oracle_treasure_role,
                 335),
    GainItems = [{ItemId, Num, IsNotice, BaseReward}
                 || #{base_id := ItemId, num := Num,
                      is_notice := IsNotice, base_reward := BaseReward}
                        <- GainList],
    CardGainList = GainItems,
    Star = case lists:keyfind(unit_star, 1, ExtArgs) of
               {_, _Star} -> _Star;
               _ -> 1
           end,
    TriggerRole = fire_evt(Role,
                           #evt_oracle_treasure_offer_star{star = Star}),
    MStRole = TriggerRole#role{m_oracle_treasure =
                                   Mst#m_oracle_treasure{card_gain_list =
                                                             CardGainList,
                                                         is_offer = 1,
                                                         unit_id = BaseId}},
    push(MStRole),
    CardInfo = {0, 2, [], []},
    logger:debug("推送翻牌数据:~w,实际翻牌数据:~w",
                 [CardInfo, CardGainList],
                 oracle_treasure_role,
                 351),
    role:link_send(MStRole, 20803, CardInfo),
    case GainList of
        [#{honor_id := HonorId} | _] ->
            honor_mgr:del(oracle_treasure_honor_general, RoleId),
            honor_mgr:add(oracle_treasure_honor_general,
                          [{RoleId, HonorId}],
                          0);
        _ -> ingore
    end,
    Timer = #timer{id = oracle_treasure_card,
                   timeout = 60000, times = 1, m = oracle_treasure_role,
                   f = apply_open_card, a = []},
    NewRole = role_timer:add(Timer, MStRole),
    {NewRole, []};
check_gain(Role, _Result, _ExtArgs) -> {Role, []}.

check_fight_general(#role{m_team = #m_team{pid = Pid}},
                    _)
    when not is_pid(Pid) ->
    {false, lang:get("请组队后再来")};
check_fight_general(#role{m_team =
                              #m_team{status = Status}},
                    _)
    when Status =/= 1 ->
    {false, lang:get("您不是队长，无法发起挑战")};
check_fight_general(Role = #role{id = RoleId},
                    UnitBaseId) ->
    case check_offer(RoleId) of
        1 -> {false, lang:get("您已获得资格，未获得资格的队长才能挑战，请切换队长")};
        _ ->
            case check_time() of
                true ->
                    case team:get_members(Role) of
                        Members when is_list(Members) ->
                            {ok, SelfTeamMate} = role_convert:to(team_mate,
                                                                 Role),
                            FollowMembers = [Mate
                                             || Mate = #team_mate{status = 2}
                                                    <- Members],
                            CheckMembers = [SelfTeamMate | FollowMembers],
                            logger:debug("======:~w",
                                         [CheckMembers],
                                         oracle_treasure_role,
                                         388),
                            case length(CheckMembers) < 3 of
                                true ->
                                    Msg =
                                        notice:format(lang:get("队伍人数不足~ts人，请完成组队后再来"),
                                                      [{string_2, 1, 3}]),
                                    {false, Msg};
                                _ ->
                                    logger:debug("检查信息:~w",
                                                 [CheckMembers],
                                                 oracle_treasure_role,
                                                 394),
                                    case check_team_members_fight_general([lev,
                                                                           offer],
                                                                          CheckMembers,
                                                                          #{unit_base_id
                                                                                =>
                                                                                UnitBaseId})
                                        of
                                        true -> true;
                                        {false, Reason} -> {false, Reason}
                                    end
                            end;
                        _ ->
                            Msg = notice:format(lang:get("队伍人数不足~ts人，请完成组队后再来"),
                                                [{string_2, 1, 3}]),
                            {false, Msg}
                    end;
                {false, Reason} -> {false, Reason};
                _ ->
                    Msg =
                        notice:format(lang:get("活动暂未开放，开启时间为~ts{face_1,3}"),
                                      [{string_2,
                                        1,
                                        lang:get("10:00-12:00、15:00-20:00")}]),
                    {false, Msg}
            end
    end.

check_fight_final(#role{m_team = #m_team{pid = Pid}}, _)
    when not is_pid(Pid) ->
    {false, lang:get("请组队后再来")};
check_fight_final(Role, UnitBaseId) ->
    case check_time() of
        true ->
            case team:get_members(Role) of
                Members when is_list(Members) ->
                    {ok, SelfTeamMate} = role_convert:to(team_mate, Role),
                    FollowMembers = [Mate
                                     || Mate = #team_mate{status = 2}
                                            <- Members],
                    CheckMembers = [SelfTeamMate | FollowMembers],
                    logger:debug("======:~w",
                                 [CheckMembers],
                                 oracle_treasure_role,
                                 422),
                    case length(CheckMembers) < 3 of
                        true ->
                            Msg = notice:format(lang:get("队伍人数不足~ts人，请完成组队后再来"),
                                                [{string_2, 1, 3}]),
                            {false, Msg};
                        _ ->
                            case check_team_members_fight_general([lev,
                                                                   final_offer,
                                                                   in_rank_num],
                                                                  CheckMembers,
                                                                  #{unit_base_id
                                                                        =>
                                                                        UnitBaseId})
                                of
                                true -> true;
                                {false, Reason} -> {false, Reason}
                            end
                    end;
                _ ->
                    Msg = notice:format(lang:get("队伍人数不足~ts人，请完成组队后再来"),
                                        [{string_2, 1, 3}]),
                    {false, Msg}
            end;
        {false, Reason} -> {false, Reason};
        _ ->
            Msg =
                notice:format(lang:get("活动暂未开放，开启时间为~ts{face_1,3}"),
                              [{string_2,
                                1,
                                lang:get("10:00-12:00、15:00-20:00")}]),
            {false, Msg}
    end.

wave_reward(Role = #role{lev = RoleLev, name = RoleName,
                         m_team = MTeam,
                         m_oracle_treasure =
                             Mst = #m_oracle_treasure{max_wave = MaxWave,
                                                      wave_reward =
                                                          RoleWaveReward,
                                                      week_times = WeekTimes,
                                                      times = Times}},
            Wave, Result, _UseTime, IsFirstKill) ->
    RewardWave = MaxWave + 1,
    CurrentWave = Wave - 1,
    logger:debug("~ts发送龙王试炼波数奖励:~w",
                 [RoleName, {RewardWave, CurrentWave, Result}],
                 oracle_treasure_role,
                 447),
    {NRole, NMst} = case get(oracle_new_combat_flag) of
                        1 ->
                            TRole = oracle_treasure_role:fire_evt(Role,
                                                                  #evt_oracle_treasure_boss_times{times
                                                                                                      =
                                                                                                      Times
                                                                                                          +
                                                                                                          1}),
                            Mst2 = Mst#m_oracle_treasure{times = Times + 1,
                                                         week_times =
                                                             WeekTimes + 1},
                            put(oracle_new_combat_flag, 0),
                            {TRole#role{m_oracle_treasure = Mst2}, Mst2};
                        _ -> {Role, Mst}
                    end,
    case CurrentWave >= RewardWave of
        true when Result =:= 98 orelse Result =:= 10 ->
            logger:debug("~ts发送龙王试炼波数奖励:~w",
                         [RoleName, {RewardWave, CurrentWave, Result}],
                         oracle_treasure_role,
                         460),
            TriggerRole = case CurrentWave of
                              5 ->
                                  logger:debug("触发通关boss成就:~w",
                                               [CurrentWave],
                                               oracle_treasure_role,
                                               464),
                                  case IsFirstKill of
                                      true ->
                                          logger:debug("触发通关boss成就:~w",
                                                       [CurrentWave],
                                                       oracle_treasure_role,
                                                       467),
                                          oracle_treasure_role:fire_evt(NRole,
                                                                        #evt_oracle_treasure_boss_wave{wave
                                                                                                           =
                                                                                                           CurrentWave});
                                      _ ->
                                          logger:debug("触发通关boss成就以及首杀成就:~w",
                                                       [CurrentWave],
                                                       oracle_treasure_role,
                                                       470),
                                          oracle_treasure_role:fire_evt(NRole,
                                                                        [#evt_oracle_treasure_first_kill{},
                                                                         #evt_oracle_treasure_boss_wave{wave
                                                                                                            =
                                                                                                            CurrentWave}])
                                  end;
                              _ ->
                                  logger:debug("触发通关boss成就:~w",
                                               [CurrentWave],
                                               oracle_treasure_role,
                                               474),
                                  oracle_treasure_role:fire_evt(NRole,
                                                                #evt_oracle_treasure_boss_wave{wave
                                                                                                   =
                                                                                                   CurrentWave})
                          end,
            case MTeam of
                #m_team{status = 1} ->
                    case CurrentWave of
                        3 ->
                            Msg =
                                notice:format(lang:get("简直难以置信，勇士~ts带领的队伍竟然通过了天启试练第三阶段{face_1,38}"),
                                              [{role_2, RoleName}]),
                            notice:cast(all, 11, Msg),
                            notice:cast(all, 5, Msg);
                        4 ->
                            Msg =
                                notice:format(lang:get("天启门徒合力也不能阻止勇士~ts带领的队伍，他们通过了天启试练第四阶段{face_1,30}"),
                                              [{role_2, RoleName}]),
                            notice:cast(all, 11, Msg),
                            notice:cast(all, 5, Msg);
                        5 ->
                            Msg =
                                notice:format(lang:get("这绝对是天启被黑的最惨的一次，勇士~ts竟然带领队伍推倒了天启{face_1,25}"),
                                              [{role_2, RoleName}]),
                            notice:cast(all, 11, Msg),
                            notice:cast(all, 5, Msg);
                        _ -> lang:get("")
                    end;
                _ -> ingore
            end,
            NewRole = case
                          oracle_treasure_data:get_wave_info(CurrentWave)
                          of
                          Cfg = #{exp_mod := ExpMod} ->
                              WaveReward = case Cfg of
                                               #{wave_reward := _WaveReward} ->
                                                   _WaveReward;
                                               _ -> []
                                           end,
                              ExpReward = case levup_data:get_exp({ExpMod,
                                                                   RoleLev})
                                              of
                                              #{exp := Exp} -> [{90010, Exp}];
                                              _ -> []
                                          end,
                              AllRewards = ExpReward ++ WaveReward,
                              NewWaveReward = format:merge_val(RoleWaveReward,
                                                               AllRewards),
                              TriggerRole#role{m_oracle_treasure =
                                                   NMst#m_oracle_treasure{wave_reward
                                                                              =
                                                                              NewWaveReward,
                                                                          max_wave
                                                                              =
                                                                              RewardWave}};
                          _Err ->
                              logger:error("结算天启试炼奖励错误:~w",
                                           [_Err],
                                           oracle_treasure_role,
                                           517),
                              TriggerRole
                      end,
            {ok, NewRole};
        _ -> {ok, NRole}
    end.

get_fighters(LeaderId) ->
    role:apply(sync,
               LeaderId,
               {oracle_treasure_role, apply_get_fighters, []}).

recruit_lev(LevRangeCfg = #{type := Type}, Flag,
            Role) ->
    Rtn = team:make_recruit_cond(LevRangeCfg, Flag, Role),
    case cross_group_info() of
        {1, CrossGroup} when Type + 29 =:= CrossGroup -> Rtn;
        _ -> {false, lang:get("不是同一阵营不能招募")}
    end;
recruit_lev(_LevRangeCfg, _Flag, _Role = #role{}) ->
    {false, lang:get("荣耀战场中才能发起战斗")}.

apply_get_fighters(Role) ->
    case role_convert:to(fighter_wrap, Role) of
        {ok, FighterWarp} ->
            case team:get_fighters(FighterWarp) of
                {ok, Fighters} -> {ok, {ok, Fighters}};
                _Else -> {ok, false}
            end;
        _ -> {ok, false}
    end.

apply_exit(Role = #role{id = _RoleId,
                        pos = #pos{platform = P, zone_id = Z}}) ->
    logger:debug("==apply_exit=====:~w",
                 [_RoleId],
                 oracle_treasure_role,
                 556),
    {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                    {10001, 2583, 3848},
                                    {10001, 4957, 3680},
                                    {10001, 445, 2565},
                                    {10001, 4646, 704},
                                    {10001, 841, 1033},
                                    {10001, 2098, 1834},
                                    {10001, 3617, 1816}]),
    ExitRole = Role#role{s_event = 0},
    TeamEvt = make_team_evt(ExitRole),
    case map:role_enter({P, Z, MapId, X, Y},
                        TeamEvt,
                        ExitRole)
        of
        {ok, MapRole} ->
            logger:debug("成功推出地图:", [], oracle_treasure_role, 562),
            NewRole = MapRole,
            {ok, NewRole};
        _Err -> ok
    end.

async_enter_cross_spt(Role = #role{cross_type =
                                       OldCrossType},
                      #{pos := ToPos, team_pid := TeamPid,
                        cross_type := CrossType, status := Status}) ->
    logger:debug("async_enter_cross_spt",
                 [],
                 oracle_treasure_role,
                 571),
    case Status of
        2 ->
            logger:debug("async_enter_cross_spt",
                         [],
                         oracle_treasure_role,
                         574),
            case map:role_enter(ToPos,
                                self,
                                Role#role{s_event = 67, cross_type = CrossType})
                of
                {error, Reason} ->
                    logger:debug("async_enter_cross_spt",
                                 [],
                                 oracle_treasure_role,
                                 577),
                    {false, Reason};
                {ok, MapRole} ->
                    logger:debug("async_enter_cross_spt",
                                 [],
                                 oracle_treasure_role,
                                 580),
                    LeaveTeamRole = case team:async_leave(MapRole, "") of
                                        {ok, _LeaveTeamRole} -> _LeaveTeamRole;
                                        _Else -> MapRole
                                    end,
                    {ok, Mate} = role_convert:to(team_mate, LeaveTeamRole),
                    JoinTeamRole = case team:join(TeamPid,
                                                  Mate,
                                                  LeaveTeamRole)
                                       of
                                       ok ->
                                           logger:debug("加入队伍成功",
                                                        [],
                                                        oracle_treasure_role,
                                                        589),
                                           LeaveTeamRole#role{m_team =
                                                                  #m_team{pid =
                                                                              TeamPid}};
                                       {ok, _JoinTeamRole} ->
                                           logger:debug("加入队伍成功",
                                                        [],
                                                        oracle_treasure_role,
                                                        592),
                                           _JoinTeamRole#role{m_team =
                                                                  #m_team{pid =
                                                                              TeamPid}};
                                       _Err ->
                                           logger:debug("加入队伍失败:~w",
                                                        [_Err],
                                                        oracle_treasure_role,
                                                        595),
                                           LeaveTeamRole
                                   end,
                    NewRole = JoinTeamRole,
                    role_misc:push_cross(NewRole),
                    case CrossType of
                        OldCrossType -> ok;
                        1 ->
                            {ok, MemberInfo} = role_convert:to(member, NewRole),
                            cross:cast(role_group,
                                       join,
                                       [center_world, MemberInfo]);
                        _ -> ok
                    end,
                    {ok, NewRole}
            end;
        _ ->
            logger:debug("async_enter_cross_spt",
                         [],
                         oracle_treasure_role,
                         610),
            Msg = lang:get("由于队长进入了跨服天启试炼，你离开了队伍"),
            LeaveTeamRole = case team:async_leave(Role, Msg) of
                                {ok, _LeaveTeamRole} -> _LeaveTeamRole;
                                _Else -> Role
                            end,
            {ok, LeaveTeamRole}
    end.

async_exit_cross_spt(Role = #role{pid = RolePid},
                     #{pos := ToPos, team_pid := TeamPid, status := Status,
                       leader_id := LeaderId}) ->
    case Status of
        2 ->
            case role_misc:is_local_role(LeaderId) of
                true ->
                    case map:role_enter(ToPos,
                                        self,
                                        Role#role{s_event = 0, cross_type = 0})
                        of
                        {error, Reason} ->
                            logger:debug("async_exit_cross_spt",
                                         [],
                                         oracle_treasure_role,
                                         628),
                            {false, Reason};
                        {ok, MapRole} ->
                            logger:debug("async_exit_cross_spt",
                                         [],
                                         oracle_treasure_role,
                                         631),
                            LeaveTeamRole = case team:async_leave(MapRole, "")
                                                of
                                                {ok, _LeaveTeamRole} ->
                                                    _LeaveTeamRole;
                                                _Else -> MapRole
                                            end,
                            {ok, Mate} = role_convert:to(team_mate,
                                                         LeaveTeamRole),
                            JoinTeamRole = case team:join(TeamPid,
                                                          Mate,
                                                          LeaveTeamRole)
                                               of
                                               ok ->
                                                   logger:debug("加入队伍成功",
                                                                [],
                                                                oracle_treasure_role,
                                                                640),
                                                   LeaveTeamRole#role{m_team =
                                                                          #m_team{pid
                                                                                      =
                                                                                      TeamPid}};
                                               {ok, _JoinTeamRole} ->
                                                   logger:debug("加入队伍成功",
                                                                [],
                                                                oracle_treasure_role,
                                                                643),
                                                   _JoinTeamRole#role{m_team =
                                                                          #m_team{pid
                                                                                      =
                                                                                      TeamPid}};
                                               _Err ->
                                                   logger:debug("加入队伍失败:~w",
                                                                [_Err],
                                                                oracle_treasure_role,
                                                                646),
                                                   LeaveTeamRole
                                           end,
                            NewRole = JoinTeamRole,
                            role_misc:push_cross(NewRole),
                            map:role_update(NewRole),
                            cross:cast(role_group,
                                       leave,
                                       [center_world, RolePid]),
                            {ok, NewRole}
                    end;
                _ ->
                    logger:debug("=========由于队长退出了天启试炼，你被请离了队伍s",
                                 [],
                                 oracle_treasure_role,
                                 657),
                    Msg = lang:get("由于队长退出了天启试炼，你被请离了队伍"),
                    LeaveTeamRole = case team:async_leave(Role, Msg) of
                                        {ok, _LeaveTeamRole} -> _LeaveTeamRole;
                                        _Else -> Role
                                    end,
                    {ok, LeaveTeamRole}
            end;
        _ ->
            logger:debug("=========由于队长退出了天启试炼，你被请离了队伍s:~w",
                         [Status],
                         oracle_treasure_role,
                         667),
            Msg = lang:get("由于队长退出了天启试炼，你被请离了队伍"),
            LeaveTeamRole = case team:async_leave(Role, Msg) of
                                {ok, _LeaveTeamRole} -> _LeaveTeamRole;
                                _Else -> Role
                            end,
            {ok, LeaveTeamRole}
    end.

gm_reset(Role = #role{id = RoleId}) ->
    NewRole = Role#role{m_oracle_treasure =
                            #m_oracle_treasure{}},
    push(NewRole),
    IsCross = is_cross(),
    handle_mgr(cast, IsCross, {gm_reset_offer, RoleId}),
    {ok, NewRole}.

gm_clear_unit_info() ->
    cross:call(oracle_treasure_mgr,
               info,
               [clear_unit_info]),
    oracle_treasure_mgr:info(clear_unit_info),
    ok.

check_enter([], Role, Args) -> {true, Role, Args};
check_enter([time | Rest], Role = #role{}, Args) ->
    case check_time() of
        true -> check_enter(Rest, Role, Args);
        {false, Reason} -> {false, Reason};
        _ ->
            Msg =
                notice:format(lang:get("活动暂未开放，开启时间为~ts{face_1,3}"),
                              [{string_2,
                                1,
                                lang:get("10:00-12:00、15:00-20:00")}]),
            {false, Msg}
    end;
check_enter([lev | _Rest], #role{lev = Lev}, _Args)
    when Lev < 90 ->
    Msg = notice:format(lang:get("您的等级不足~ts级"),
                        [{string_2, 1, 90}]),
    {false, Msg};
check_enter([combat | _Rest],
            #role{m_combat = #m_combat{pid = Pid}}, _Args)
    when is_pid(Pid) ->
    Msg = lang:get("正在战斗中，无法进行传送"),
    {false, Msg};
check_enter([event | Rest], Role, _Args) ->
    case role_misc:check_event(Role) of
        true -> check_enter(Rest, Role, _Args);
        {false, Reason} -> {false, Reason}
    end;
check_enter([team_members | _Rest],
            #role{m_team = #m_team{status = 2}}, _Args) ->
    {false, lang:get("您正在跟随队伍中，无法进行传送")};
check_enter([team_members | Rest], Role, Args) ->
    case team:get_members(Role) of
        [] -> check_enter(Rest, Role, Args);
        Members ->
            case [M || M = #team_mate{status = 2} <- Members] of
                Members ->
                    case check_team_members(lev,
                                            Members,
                                            #{offer_list => []})
                        of
                        {true, _} ->
                            check_enter(Rest, Role, Args#{members => Members});
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("请召回队员之后再进行天启试炼")}
            end
    end;
check_enter([_Other | Rest], Role, Args) ->
    check_enter(Rest, Role, Args).

transe_map(Role = #role{cross_type = RoleCrossType},
           Members) ->
    Result = case cross_group_info() of
                 {1, CrossGroup} ->
                     case env:get(center) of
                         #center{ready = 1, center_platform = Platform,
                                 center_zone_id = ZoneId} ->
                             {Platform, ZoneId, 1, CrossGroup};
                         _ -> {false, lang:get("当前未链接跨服，无法进行挑战")}
                     end;
                 _ -> {env:get(platform), env:get(zone_id), 0, 0}
             end,
    case Result of
        TransArgs = {P, Z, TransCrossType = 1, Group}
            when RoleCrossType =:= 0 ->
            EnterRole = Role#role{s_event = 67,
                                  cross_type = TransCrossType},
            case make_team_evt(EnterRole, Members) of
                self -> do_trans_map(EnterRole, self, TransArgs);
                _ ->
                    Members = team:get_members(Role),
                    case trans_pos(1, Group) of
                        {false, Reason} -> {false, Reason};
                        {ok, MapId, X, Y} ->
                            NewTeamRole = #role{m_team = MTeam} = case
                                                                      team:async_leave(EnterRole,
                                                                                       "")
                                                                      of
                                                                      {ok,
                                                                       LeaveTeamRole} ->
                                                                          case
                                                                              team_mgr:create(LeaveTeamRole)
                                                                              of
                                                                              {ok,
                                                                               CreateTeamRole} ->
                                                                                  CreateTeamRole;
                                                                              Else ->
                                                                                  logger:error("创建队伍失败 ~w",
                                                                                               [Else],
                                                                                               oracle_treasure_role,
                                                                                               777),
                                                                                  LeaveTeamRole
                                                                          end;
                                                                      _LeaveFalse ->
                                                                          EnterRole
                                                                  end,
                            ToPos = {P, Z, MapId, X, Y},
                            case map:role_enter(ToPos, self, NewTeamRole) of
                                {ok, NewRole} ->
                                    TeamPid = case MTeam of
                                                  #m_team{pid = Tpid}
                                                      when is_pid(Tpid) ->
                                                      Tpid;
                                                  _ -> 0
                                              end,
                                    [role:apply(async,
                                                MatePid,
                                                {oracle_treasure_role,
                                                 async_enter_cross_spt,
                                                 [#{pos => ToPos,
                                                    team_pid => TeamPid,
                                                    cross_type =>
                                                        TransCrossType,
                                                    status => Status}]})
                                     || #team_mate{pid = MatePid,
                                                   status = Status}
                                            <- Members,
                                        is_pid(MatePid)],
                                    map:role_update(NewRole),
                                    role_misc:push_cross(NewRole),
                                    team:stop_recruiting(NewRole),
                                    {ok, NewRole};
                                {error, Reason} -> {false, Reason}
                            end
                    end
            end;
        {_P, _Z, 0, _Group} when RoleCrossType =:= 1 ->
            {false, lang:get("请先回到本服，再进行天启试炼")};
        {false, Reason} -> {false, Reason};
        Args = {_, _, TransCrossType, _} ->
            EnterRole = Role#role{s_event = 67,
                                  cross_type = TransCrossType},
            TeamEvt = make_team_evt(EnterRole, Members),
            do_trans_map(EnterRole, TeamEvt, Args);
        _Else ->
            logger:error("进入龙王试炼地图失败:",
                         [_Else],
                         oracle_treasure_role,
                         810),
            {false, lang:get("传送失败")}
    end.

do_trans_map(Role = #role{name = Name}, TeamEvt,
             {P, Z, CrossType, Group}) ->
    case trans_pos(CrossType, Group) of
        {false, Reason} -> {false, Reason};
        {ok, MapId, X, Y} ->
            ToPos = {P, Z, MapId, X, Y},
            case map:role_enter(ToPos, TeamEvt, Role) of
                {ok, MapRole} ->
                    case role_fly:force_landing(MapRole) of
                        {ok, NewRole} ->
                            map:role_update(NewRole),
                            role_misc:push_cross(NewRole),
                            team:stop_recruiting(NewRole),
                            {ok, NewRole};
                        _ -> {false, lang:get("传送失败")}
                    end;
                _Err ->
                    logger:error("[~ts]传送元素之域失败[~w]",
                                 [Name, _Err],
                                 oracle_treasure_role,
                                 831),
                    {false, lang:get("传送失败")}
            end
    end.

is_cross() ->
    case env:get(oracle_treasure_is_cross) of
        {IsCross, _Group} -> IsCross;
        _ ->
            PZ = {env:get(platform), env:get(zone_id)},
            {IsCross, CrossGrpup} = case
                                        spirit_treasure_data:get_cross_group(PZ)
                                        of
                                        0 -> {0, 0};
                                        CfgCrossGrpup -> {1, CfgCrossGrpup}
                                    end,
            env:save(oracle_treasure_is_cross,
                     {IsCross, CrossGrpup}),
            IsCross
    end.

cross_group_info() ->
    case env:get(oracle_treasure_is_cross) of
        {IsCross, Group} -> {IsCross, Group};
        _ ->
            PZ = {env:get(platform), env:get(zone_id)},
            {IsCross, CrossGrpup} = case
                                        spirit_treasure_data:get_cross_group(PZ)
                                        of
                                        0 -> {0, 0};
                                        CfgCrossGrpup -> {1, CfgCrossGrpup}
                                    end,
            env:save(oracle_treasure_is_cross,
                     {IsCross, CrossGrpup})
    end.

trans_pos(0, _) ->
    case oracle_treasure_mgr:call({query_enter_map, 0}) of
        {ok, MapId, X, Y} -> {ok, MapId, X, Y};
        _ -> {false, lang:get("传送失败")}
    end;
trans_pos(_, CrossGrpup) ->
    case cross:call(oracle_treasure_mgr,
                    call,
                    [{query_enter_map, CrossGrpup}])
        of
        {ok, MapId, X, Y} -> {ok, MapId, X, Y};
        _ -> {false, lang:get("传送失败")}
    end.

make_team_evt(Role) ->
    Members = team:get_members(Role),
    make_team_evt(Role, Members).

make_team_evt(#role{s_event = Event,
                    m_team = #m_team{pid = Pid}},
              Members) ->
    case Members of
        [] when not is_pid(Pid) -> self;
        MateIds when Event =:= 67 ->
            FollowMateIds = [MateId
                             || #team_mate{id = MateId, status = 2} <- MateIds],
            #{label => enter_event, event => Event,
              role_ids => FollowMateIds,
              mfa =>
                  {oracle_treasure_role, apply_team_mate_enter, []}};
        MateIds ->
            FollowMateIds = [MateId
                             || #team_mate{id = MateId, status = 2} <- MateIds],
            #{label => exit_event, event => Event,
              role_ids => FollowMateIds,
              mfa =>
                  {oracle_treasure_role, apply_team_mate_leave, []}}
    end.

check_team_members_fight_general([], _Membsers,
                                 _Args) ->
    true;
check_team_members_fight_general([lev | Rest], Membsers,
                                 Args) ->
    case check_team_members(lev,
                            Membsers,
                            #{offer_list => []})
        of
        {true, _} ->
            check_team_members_fight_general(Rest, Membsers, Args);
        {false, Reason} -> {false, Reason}
    end;
check_team_members_fight_general([offer | Rest],
                                 Membsers, Args = #{unit_base_id := BaseId}) ->
    logger:debug("======:~w",
                 [Membsers],
                 oracle_treasure_role,
                 905),
    case check_team_members({offer, BaseId},
                            Membsers,
                            #{offer_list => []})
        of
        {true, #{offer_list := OfferList}} ->
            logger:debug("=====:~w",
                         [OfferList],
                         oracle_treasure_role,
                         908),
            case length(OfferList) >= 3 of
                true ->
                    FormatStr =
                        string:join(lists:duplicate(length(OfferList), "~ts"),
                                    "、"),
                    NameList = [{role_2, Name} || Name <- OfferList],
                    NameStr = notice:format(FormatStr, NameList),
                    Msg = notice:format(lang:get("队伍中已有资格的玩家(~ts)超过2人无法挑战"),
                                        [{string_1, NameStr}]),
                    {false, Msg};
                _ ->
                    check_team_members_fight_general(Rest, Membsers, Args)
            end;
        {false, Reason} -> {false, Reason}
    end;
check_team_members_fight_general([final_offer | Rest],
                                 Membsers, Args) ->
    CheckArgs = #{offer_list => []},
    case check_team_members(final_offer,
                            Membsers,
                            CheckArgs)
        of
        {true, _} ->
            check_team_members_fight_general(Rest, Membsers, Args);
        {false, Reason} -> {false, Reason}
    end;
check_team_members_fight_general([in_rank_num | Rest],
                                 Members, Args) ->
    RankList = case cross_group_info() of
                   {IsCross, Group} ->
                       handle_mgr(call, IsCross, {get_rank, Group});
                   _ -> handle_mgr(call, 0, {get_rank, 0})
               end,
    PreFiveRankList = lists:sublist(RankList, 5),
    case check_in_rank_num(PreFiveRankList, Members, [], 0)
        of
        {false, Reason} -> {false, Reason};
        _ ->
            check_team_members_fight_general(Rest, Members, Args)
    end;
check_team_members_fight_general([_ | Rest], Membsers,
                                 Args) ->
    check_team_members_fight_general(Rest, Membsers, Args).

check_in_rank_num([], Members, InRankRoleName,
                  InRankNum) ->
    case InRankNum =< 2 of
        true -> ok;
        _ ->
            Len = erlang:length(Members),
            case Len =:= InRankNum of
                true -> ok;
                _ ->
                    case InRankRoleName of
                        [Name1, Name2, Name3, Name4 | _] ->
                            {false,
                             notice:format(lang:get("<color='#00ff00'>~ts、~ts、~ts、~ts</color>成员位列排"
                                                    "行榜前5，威名远扬，天启不接受挑战（帮打成员不能超过2人，若想刷新成绩，请全组成员组队再来"
                                                    "）"),
                                           [{string_1, Name1},
                                            {string_1, Name2},
                                            {string_1, Name3},
                                            {string_1, Name4}])};
                        [Name1, Name2, Name3 | _] ->
                            {false,
                             notice:format(lang:get("<color='#00ff00'>~ts、~ts、~ts</color>成员位列排行榜前5"
                                                    "，威名远扬，天启不接受挑战（帮打成员不能超过2人，若想刷新成绩，请全组成员组队再来）"),
                                           [{string_1, Name1},
                                            {string_1, Name2},
                                            {string_1, Name3}])};
                        _ ->
                            logger:error("队伍排行前五人数匹配失败:~w",
                                         [InRankNum],
                                         oracle_treasure_role,
                                         964),
                            {false,
                             lang:get("队伍中成员位列排行榜前5，威名远扬，天启/龙王不接受挑战（帮打成员不能超过2人，若想刷新成"
                                      "绩，请全组成员组队再来）")}
                    end
            end
    end;
check_in_rank_num([#oracle_treasure_rank_rc{id = Id,
                                            name = Name}
                   | Rest],
                  Members, InRankRoleName, InRankNum) ->
    case lists:keyfind(Id, #team_mate.id, Members) of
        #team_mate{} ->
            check_in_rank_num(Rest,
                              Members,
                              [Name | InRankRoleName],
                              InRankNum + 1);
        _ ->
            check_in_rank_num(Rest,
                              Members,
                              InRankRoleName,
                              InRankNum)
    end.

check_team_members(_Flag, [], Args) -> {true, Args};
check_team_members(lev,
                   [#team_mate{name = Name, lev = Lev} | _Rest], _Args)
    when Lev < 90 ->
    Msg = notice:format(lang:get("队伍中~ts的等级不足~ts级，无法进入"),
                        [{role_2, Name}, {string_2, 1, 90}]),
    {false, Msg};
check_team_members({offer, BaseId},
                   [#team_mate{id = RoleId, name = Name} | Rest],
                   Args = #{offer_list := OfferList}) ->
    logger:debug("check_team_members====:~w",
                 [RoleId],
                 oracle_treasure_role,
                 984),
    case check_offer(RoleId) of
        1 ->
            NewOfferList = [Name | OfferList],
            NewArgs = Args#{offer_list => NewOfferList},
            check_team_members({offer, BaseId}, Rest, NewArgs);
        _ -> check_team_members({offer, BaseId}, Rest, Args)
    end;
check_team_members(final_offer,
                   [#team_mate{id = RoleId, name = Name} | Rest], Args) ->
    case check_offer(RoleId) of
        0 ->
            Msg =
                notice:format(lang:get("队伍中~ts的没有获得天启试炼的资格，不能进行挑战"),
                              [{role_2, Name}]),
            {false, Msg};
        _ -> check_team_members(final_offer, Rest, Args)
    end;
check_team_members(Flag, [_ | Rest], Args) ->
    check_team_members(Flag, Rest, Args).

check_offer(RoleId) ->
    case ets:lookup(ets_oracle_treasure_offer, RoleId) of
        [{_, 1}] -> 1;
        _ -> 0
    end.

handle_mgr(Fun, IsCross, Msg) ->
    case IsCross of
        1 -> cross:Fun(oracle_treasure_mgr, Fun, [Msg]);
        _ -> oracle_treasure_mgr:Fun(Msg)
    end.

send_card_reward(Role = #role{name = RoleName,
                              m_oracle_treasure =
                                  Mst = #m_oracle_treasure{card_gain_list =
                                                               CarGainList,
                                                           is_get = GetTimes}},
                 Order) ->
    NewRole = case CarGainList of
                  [{ItemId, Num, IsNotice, BaseReward}]
                      when GetTimes =:= 0 ->
                      MstRole = Role#role{m_oracle_treasure =
                                              Mst#m_oracle_treasure{card_gain_list
                                                                        =
                                                                        [{ItemId,
                                                                          Num,
                                                                          IsNotice,
                                                                          []}],
                                                                    is_get =
                                                                        GetTimes
                                                                            +
                                                                            1}},
                      ReplyCardInfo = {Order, 2, BaseReward, []},
                      logger:debug("=====20803返回====:~w",
                                   [ReplyCardInfo],
                                   oracle_treasure_role,
                                   1025),
                      role:link_send(MstRole, 20803, ReplyCardInfo),
                      UnbindItems = [{Assets, 0, Val}
                                     || {Assets, Val} <- BaseReward],
                      Gain = format:val_to_gain(UnbindItems),
                      case role_gain:do_notice(Gain, MstRole) of
                          {ok, GainRole} -> GainRole;
                          _ ->
                              Title = lang:get("天启试炼奖励"),
                              Content = lang:get("由于您的背包已满，您参加的天启试炼的奖励通过邮件发放:"),
                              mail:send(Role, Title, Content, UnbindItems),
                              MstRole
                      end;
                  [GainList] when GetTimes =:= 1 ->
                      MstRole = Role#role{m_oracle_treasure =
                                              Mst#m_oracle_treasure{card_gain_list
                                                                        = [],
                                                                    is_get =
                                                                        GetTimes
                                                                            +
                                                                            1}},
                      {ReplyGainList, IsCast, _} = case GainList of
                                                       {Assets,
                                                        Val,
                                                        IsNotice,
                                                        _BaseReward} ->
                                                           {[{Assets, Val}],
                                                            IsNotice,
                                                            _BaseReward};
                                                       _ -> {[], 0, []}
                                                   end,
                      case IsCast of
                          1 ->
                              Msg =
                                  notice:format(lang:get("恭喜玩家~ts把天启门徒胖揍一顿，从他身上抢到了~ts"),
                                                [{role_2, RoleName},
                                                 {item_2, ReplyGainList}]),
                              notice:send(Role, 5, Msg),
                              ok;
                          _ -> ok
                      end,
                      ReplyCardInfo = {3, 2, ReplyGainList, []},
                      logger:debug("=====20803返回====:~w",
                                   [ReplyCardInfo],
                                   oracle_treasure_role,
                                   1055),
                      role:link_send(MstRole, 20803, ReplyCardInfo),
                      UnbindItems = [{Assets, 0, Val}
                                     || {Assets, Val} <- ReplyGainList],
                      Gain = format:val_to_gain(UnbindItems),
                      case role_gain:do_notice(Gain, MstRole) of
                          {ok, GainRole} -> GainRole;
                          _ ->
                              Title = lang:get("天启试炼奖励"),
                              Content = lang:get("由于您的背包已满，您参加的天启试炼的奖励通过邮件发放:"),
                              mail:send(Role, Title, Content, UnbindItems),
                              MstRole
                      end;
                  _ -> Role
              end,
    push(NewRole),
    {ok, NewRole}.

check_time() ->
    case 1 of
        1 -> true;
        _ -> true
    end.

fire_evt(Role, []) -> Role;
fire_evt(Role, [Evt | Rest]) ->
    TriggerRole = fire_evt(Role, Evt),
    fire_evt(TriggerRole, Rest);
fire_evt(Role = #role{m_oracle_treasure =
                          #m_oracle_treasure{is_offer = 0}},
         Evt = #evt_oracle_treasure_offer_star{}) ->
    role_trigger:fire(Evt, Role);
fire_evt(Role,
         Evt = #evt_oracle_treasure_boss_wave{}) ->
    role_trigger:fire(Evt, Role);
fire_evt(Role,
         Evt = #evt_oracle_treasure_first_kill{}) ->
    role_trigger:fire(Evt, Role);
fire_evt(Role,
         Evt = #evt_oracle_treasure_boss_times{}) ->
    role_trigger:fire(Evt, Role);
fire_evt(Role, _Evt) -> Role.

exit_normal(ToPos, TeamEvt,
            Role = #role{name = Name}) ->
    ExitRole = Role#role{s_event = 0},
    case map:role_enter(ToPos, TeamEvt, ExitRole) of
        {ok, MapRole} ->
            logger:debug("成功推出地图:", [], oracle_treasure_role, 1109),
            NewRole = MapRole,
            map:role_update(NewRole),
            role_misc:push_cross(NewRole),
            cross:cast(role_group,
                       leave,
                       [center_world, Role#role.pid]),
            {ok, NewRole};
        _Err ->
            logger:error("[~ts]退出元素之域失败[~w]",
                         [Name, _Err],
                         oracle_treasure_role,
                         1117),
            {false, lang:get("退出失败")}
    end.

send_help_reward(ID) ->
    mail:send(ID,
              "天启热心礼",
              "你的热心行为受到了天启的赞赏{face_1, 38}特为你赠送了小礼物\n要继续努力哟~ ",
              [{90007, 0, 20}, {21098, 0, 1}]).

sync_spirit_offer() ->
    role_group:apply(world,
                     {oracle_treasure_role, sync_spirit_offer, []}).

sync_spirit_offer(Role = #role{id = RoleId,
                               m_oracle_treasure =
                                   MST = #m_oracle_treasure{is_offer = 0}}) ->
    CheckHasOffer = check_offer(RoleId),
    case CheckHasOffer of
        1 ->
            Title = lang:get("试练资格改变"),
            Content =
                lang:get("由于更新时服务器出现了波动，导致您收到了天启资格消失邮件（其实资格还在），现在获得资格提示"
                         "已经修复，祝游戏愉快！"),
            mail:send(Role, Title, Content),
            NewRole = Role#role{m_oracle_treasure =
                                    MST#m_oracle_treasure{is_offer =
                                                              CheckHasOffer}},
            push(NewRole),
            {ok, NewRole};
        _ -> ok
    end;
sync_spirit_offer(_Role) -> ok.

