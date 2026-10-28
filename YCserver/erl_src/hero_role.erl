-file("src/mod/hero/hero_role.erl", 1).

-module(hero_role).

-export([exit/2,
         apply_check_mate/2,
         sign/1,
         apply_enter_ready/2,
         role_callback/4,
         leave/1,
         is_same_group/2,
         leave_zone/1,
         leave_zone/2,
         apply_leave_zone/2,
         die_leave_zone/1,
         do_die_leave_zone/1,
         combat_over/1,
         async_combat_over/5,
         apply_enter_zone/2,
         check_box/2,
         gain_box/3,
         async_over/3,
         push/1,
         push_zone/1,
         push_role/1,
         push_rank/1,
         cast_enemy/3,
         calc_looks/1,
         apply_prepare_exp/1,
         recruit_lev/3,
         check_group/2,
         leave_all/0,
         show_error/0,
         show_error/1,
         apply_show_error/2]).

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

-file("src/mod/hero/hero_role.erl", 43).

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

-file("src/mod/hero/hero_role.erl", 44).

-file("inc/hero.hrl", 1).

-record(hero_ready_zone,
        {map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc}).

-record(hero_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         series = 0,
         flag = 0}).

-record(hero_group,
        {id = 0,
         score = 0,
         num = 0,
         offline_num = 0,
         all_num = 0,
         ave_fc = 0,
         sum_fc = 0}).

-record(hero_group_team,
        {group = 0, num = 0, fight = 0, match = 0}).

-record(hero_series,
        {group = 0,
         num = 0,
         ave_fc = 0,
         sum_fc = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         members = []}).

-record(hero_series_ready,
        {tiger = #hero_series{},
         dragon = #hero_series{},
         series = 0,
         ave_fc = 0,
         num = 0}).

-record(hero_series_data,
        {min = 0, max = 0, series = 0, name = ""}).

-record(hero_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         win = 0,
         win_streak = 0,
         times = 0,
         die = 4,
         rank_point = 0,
         score = 0,
         is_combat = 0,
         last_combat_over_time = 0,
         last_role_id,
         zone_id = 0,
         zone_pid,
         team_status = 0,
         team_lev = 40,
         team_len = 1,
         match = 0,
         exp = 0,
         has_enter = 0,
         looks = [],
         has_mail = 0,
         group = 1,
         box = 0,
         series = 0,
         fc = 0,
         m_time = 0}).

-record(hero_reward_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp_mode = 0,
         pet_exp_mode = 0}).

-record(hero_win_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp = 0,
         pet_exp = 0}).

-file("src/mod/hero/hero_role.erl", 45).

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

-file("src/mod/hero/hero_role.erl", 46).

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

-file("src/mod/hero/hero_role.erl", 47).

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

-file("src/mod/hero/hero_role.erl", 48).

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

-file("src/mod/hero/hero_role.erl", 49).

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

-file("src/mod/hero/hero_role.erl", 50).

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

-file("src/mod/hero/hero_role.erl", 51).

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

-file("src/mod/hero/hero_role.erl", 52).

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

-file("src/mod/hero/hero_role.erl", 53).

-file("inc/looks.hrl", 1).

-file("src/mod/hero/hero_role.erl", 54).

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

-file("src/mod/hero/hero_role.erl", 55).

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

-file("src/mod/hero/hero_role.erl", 56).

-file("inc/elf.hrl", 1).

-record(elf_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         win = 0,
         win_streak = 0,
         times = 0,
         die = 0,
         score = 0,
         is_combat = 0,
         last_combat_over_time = 0,
         combat_protect_time = 0,
         last_role_id,
         zone_id = 0,
         zone_pid,
         has_enter = 0,
         has_mail = 0,
         group = 0,
         seq_id = 0,
         fc = 0,
         m_time = 0,
         pos,
         rank = 0,
         grade_flag = 0,
         grade_first_flag = 0,
         unit_list = [],
         match = 0,
         exp = 0,
         group_key = 0,
         open_id = 0}).

-record(elf_role_map,
        {id = 0, map_id = 0, map_base_id = 0, num = 0}).

-record(elf_ready_zone,
        {map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         group_key = {0, 0},
         open_id = 0,
         group_id = 0 :: pos_integer(),
         members = [],
         num = 0}).

-record(elf_group_data,
        {min = 0, max = 0, group = 0, order = 0, name = ""}).

-record(elf_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         group = 0,
         group_key = {0, 0},
         open_id = 0,
         flag = 0}).

-record(elf_map,
        {id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         map_id = 0,
         map_base_id = 0,
         num = 0,
         max_num = 0}).

-record(elf_map_data,
        {id = 0 :: non_neg_integer(),
         map_base_id = 0,
         num = 0,
         unit_list = [],
         boss_list = [],
         super_list = [],
         box_list = [],
         next_score = 0,
         win_score = 0,
         fail_score = 0,
         end_score = 0,
         next_base_id = 0,
         buff_id = 0,
         grade_buff_id = 0,
         grade_msg = "",
         grade_cast_msg = "",
         grade_score = 0,
         grade_dec_score = 0,
         grade_dec_msg = "",
         fail_buff_id = 0,
         fail_msg = "",
         pos_list = [],
         msg = "",
         del_buff = [],
         max_score = 0,
         max_guard = 4}).

-record(elf_unit,
        {id = {0, 0} :: non_neg_integer(), base_id = 0, pos}).

-record(elf_unit_data,
        {id = 0,
         is_del = 1,
         pos = [],
         score = 0,
         kill_num = 0,
         create_msg = "",
         item_list = [],
         buff_id = 0,
         msg = "",
         cast_msg = ""}).

-record(elf_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         item_list = [],
         exp_mode = 0}).

-record(elf_first_data,
        {group = 0,
         map_base_id,
         min = 0,
         max = 0,
         item_list = [],
         cast = "",
         title = "",
         comment = ""}).

-record(elf_win_data,
        {group = 0,
         min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp = 0,
         pet_exp = 0}).

-file("src/mod/hero/hero_role.erl", 57).

leave_all() ->
    role_group:apply(world,
                     {hero_role, leave_zone, [undefined]}).

exit(_Role, #{label := _Label}) -> ok.

show_error() -> show_error(21).

show_error(Event) ->
    List = ets:tab2list(hero_role),
    show_error(List, Event).

show_error([], _) -> ok;
show_error([#hero_role{id = Id} | T], Event) ->
    role:apply(async,
               Id,
               {hero_role, apply_show_error, [Event]}),
    show_error(T, Event).

apply_show_error(#role{id = Id, name = Name,
                       s_event = SEvent, s_event_pid = SEventPid},
                 Event)
    when SEvent =/= Event ->
    logger:error("武道大会检测(~w)：~p, ~ts, ~w, ~w",
                 [Event, Id, Name, SEvent, SEventPid],
                 hero_role,
                 78),
    ok;
apply_show_error(#role{id = Id, name = Name,
                       s_event = Event, s_event_pid = SEventPid,
                       m_team = MTeam},
                 Event = 21)
    when not is_pid(SEventPid) ->
    logger:error("武道大会检测(~w)：~p, ~ts, ~w, ~w, ~w",
                 [Event, Id, Name, Event, SEventPid, MTeam],
                 hero_role,
                 81),
    ok;
apply_show_error(_, _) -> ok.

sign(#role{cross_type = 1}) ->
    {false, lang:get("跨服状态不能参与")};
sign(#role{lev = Lev}) when Lev < 40 ->
    Fmt = lang:get("~ts级才能参加精灵总动员， 升级吧~ts~ts~ts"),
    Args = [{string_1, 40},
            {face_1, 18},
            {face_1, 18},
            {face_1, 18}],
    {false, notice:format(Fmt, Args)};
sign(#role{s_event = 1}) ->
    {false, lang:get("你当前正在副本中，不能报名参加")};
sign(#role{s_event = 10}) ->
    {false, lang:get("不能重复报名")};
sign(Role = #role{m_team = #m_team{pid = Pid},
                  lev = Lev})
    when not is_pid(Pid) ->
    case role_misc:check_event(Role) of
        {false, Reason} -> {false, Reason};
        true ->
            case check_statue(Role, [leader_sign]) of
                ok ->
                    case hero_data:get_series(Lev) of
                        #hero_series_data{series = Series} ->
                            do_sign(Role,
                                    #{mate => [], series => Series, fc => 0});
                        _ -> {false, lang:get("该等级无法分组")}
                    end;
                {false, Reason} -> {false, Reason}
            end
    end;
sign(Role = #role{lev = Lev,
                  m_team = #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    case role_misc:check_event(Role) of
        {false, Reason} -> {false, Reason};
        true ->
            Members = team:get_members(Role),
            case check_statue(Role,
                              [{leader_sign, length(Members)}])
                of
                ok ->
                    case Members of
                        [_, _ | _] ->
                            {false,
                             notice:format(lang:get("请~ts进入后再行组队（如果~ts组队前来，我可以偷偷帮你们安排在同一阵营，但不要超过~t"
                                                    "s个哦！）"),
                                           [{string_2, 1, lang:get("单人")},
                                            {string_2, 1, lang:get("两人")},
                                            {string_2, 1, 2}])};
                        MateList = [#team_mate{id = TRoleId, status = 2}] ->
                            case hero_data:get_series(Lev) of
                                #hero_series_data{series = Series} ->
                                    case role:apply(sync,
                                                    TRoleId,
                                                    {hero_role,
                                                     apply_check_mate,
                                                     [Series]})
                                        of
                                        {false, Reason} -> {false, Reason};
                                        {ok, MateFc} ->
                                            do_sign(Role,
                                                    #{mate => MateList,
                                                      series => Series,
                                                      fc => MateFc})
                                    end;
                                _ -> {false, lang:get("该等级无法分组")}
                            end;
                        [#team_mate{}] -> {false, lang:get("让对方归队才能报名")};
                        [] ->
                            case hero_data:get_series(Lev) of
                                #hero_series_data{series = Series} ->
                                    do_sign(Role,
                                            #{mate => [], series => Series,
                                              fc => 0});
                                _ -> {false, lang:get("该等级无法分组")}
                            end;
                        _ -> {false, lang:get("组上你队友再过来报名")}
                    end;
                {false, Reason} -> {false, Reason}
            end
    end;
sign(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("只有队长才能报名")};
sign(_Role) -> {false, lang:get("现在什么情况")}.

leave(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("组队状态下，无法退出")};
leave(#role{s_event = SEvent, id = RoleId, pid = Pid})
    when SEvent == 20 orelse SEvent == 21 ->
    hero_mgr:cast({leave, #{id => RoleId, pid => Pid}}),
    ok;
leave(#role{}) -> {false, lang:get("不在荣耀战场不能执行此操作")}.

apply_leave_zone(Role = #role{pid = RolePid},
                 ZonePid) ->
    case team_check(exit, Role) of
        {true, _TeamList} ->
            case leave_zone(Role, ZonePid) of
                {false, _Reason} -> ok;
                {ok, NewRole} -> {ok, NewRole};
                ok -> ok
            end;
        {false, Reason} ->
            role:pack_send(RolePid, 16302, {0, Reason}),
            ok
    end.

leave_zone(Role) -> leave_zone(Role, undefined).

push(_Role = #role{id = RoleId, pid = Pid}) ->
    hero_mgr:cast({push, #{pid => Pid, id => RoleId}}).

push_zone(_Role = #role{id = RoleId, pid = Pid,
                        s_event = 21, s_event_pid = ZonePid}) ->
    hero:cast(ZonePid,
              {push_zone, #{pid => Pid, id => RoleId}});
push_zone(_) -> ok.

push_role(_Role = #role{id = RoleId, pid = Pid,
                        s_event = 20}) ->
    hero_mgr:cast({push_role, #{pid => Pid, id => RoleId}});
push_role(_Role = #role{id = RoleId, pid = Pid,
                        s_event = 21, s_event_pid = ZonePid}) ->
    hero:cast(ZonePid,
              {push_role, #{pid => Pid, id => RoleId}});
push_role(_) -> ok.

push_rank(_Role = #role{id = RoleId, pid = Pid,
                        s_event = 21, s_event_pid = ZonePid}) ->
    hero:cast(ZonePid,
              {push_rank, #{pid => Pid, id => RoleId}});
push_rank(_) -> ok.

leave_zone(TRole = #role{id = RoleId, pid = RolePid,
                         s_event = SEvent},
           ZonePid)
    when SEvent == 20 orelse SEvent == 21 ->
    Role = case team:async_leave(TRole) of
               {ok, TRole1} -> TRole1;
               _ -> TRole
           end,
    Role1 = looks:del([54, 56, 63],
                      Role#role{s_event = 0, s_event_pid = undefined}),
    Role2 = looks:add({54, 0, 1, ""}, Role1, replace),
    TeamEvt = make_team_event(Role2, [ZonePid]),
    case map:role_enter(util:rand_list([{10001, 306, 3507},
                                        {10001, 2583, 3848},
                                        {10001, 4957, 3680},
                                        {10001, 445, 2565},
                                        {10001, 4646, 704},
                                        {10001, 841, 1033},
                                        {10001, 2098, 1834},
                                        {10001, 3617, 1816}]),
                        TeamEvt,
                        Role2)
        of
        {error, Reason} -> {false, Reason};
        {ok, NewRole} ->
            case is_pid(ZonePid) of
                _ when ZonePid == hero_mgr ->
                    hero_mgr:cast({leave_succ, RoleId});
                true -> hero:cast(ZonePid, {leave_succ, RoleId});
                false -> skip
            end,
            looks:async_del(RolePid, 63),
            NewRole1 = case SEvent of
                           21 -> role_trigger:fire(#evt_hero{}, NewRole);
                           _ -> NewRole
                       end,
            {ok, NewRole1}
    end;
leave_zone(_Role, _ZonePid) -> ok.

apply_check_mate(Role = #role{lev = Lev,
                              attr = #attr{fc = Fc}},
                 Series) ->
    Reply = case hero_data:get_series(Lev) of
                #hero_series_data{series = Series} ->
                    case role_misc:check_event(Role) of
                        {false, Reason} ->
                            {false,
                             notice:format(lang:get("~ts ~ts"),
                                           [{role_2, Role},
                                            {string_1, Reason}])};
                        true ->
                            case check_statue(Role, [sign]) of
                                ok ->
                                    PetFc = pet_attr:calc_fc(Role),
                                    {ok, Fc + PetFc};
                                {false, Reason} ->
                                    {false,
                                     notice:format(lang:get("~ts ~ts"),
                                                   [{role_2, Role},
                                                    {string_1, Reason}])}
                            end
                    end;
                #hero_series_data{} ->
                    {false,
                     notice:format(lang:get("~ts不能跟你进入同一战区"),
                                   [{role_2, Role}])};
                _ ->
                    {false,
                     notice:format(lang:get("~ts等级无法找到战区"),
                                   [{role_2, Role}])}
            end,
    {ok, Reply, Role}.

apply_enter_ready(Role = #role{name = _Name},
                  #{map_id := MapId, group := Group, team_lev := TeamLev,
                    team_len := TeamLen, series := Series,
                    hero_pid := HeroPid, state_name := StateName}) ->
    case role_misc:check_event(Role, [2]) of
        {false, Reason} ->
            logger:debug("进入准备区地图~ts", [Reason], hero_role, 274),
            notice:npc_talk(Role, 20064, Reason),
            role:link_send(Role, 16301, {0, ""}),
            ok;
        true ->
            case role_fly:force_landing(Role) of
                {ok, DownRole} ->
                    #role{pos =
                              #pos{map = OldMap, x = OldX, y = OldY,
                                   platform = OldPlatform,
                                   zone_id = OldZoneId}} =
                        DownRole,
                    {{NX, NY}, NewTeamEvt, DownRole2} = case StateName of
                                                            prepare ->
                                                                {X, Y} =
                                                                    util:rand_list([{3126,
                                                                                     888},
                                                                                    {974,
                                                                                     899},
                                                                                    {973,
                                                                                     1972},
                                                                                    {3121,
                                                                                     1968},
                                                                                    {2042,
                                                                                     1835},
                                                                                    {2042,
                                                                                     873}]),
                                                                TeamEvt =
                                                                    make_team_event(Role#role{s_event
                                                                                                  =
                                                                                                  20},
                                                                                    [TeamLev,
                                                                                     TeamLen,
                                                                                     Group,
                                                                                     Series,
                                                                                     HeroPid]),
                                                                DownRole1 =
                                                                    DownRole#role{s_event
                                                                                      =
                                                                                      20},
                                                                {{X, Y},
                                                                 TeamEvt,
                                                                 DownRole1};
                                                            _ ->
                                                                {X, Y} =
                                                                    util:rand_list([{710,
                                                                                     761},
                                                                                    {1024,
                                                                                     909},
                                                                                    {1339,
                                                                                     1098},
                                                                                    {1801,
                                                                                     1106},
                                                                                    {2276,
                                                                                     1111},
                                                                                    {2018,
                                                                                     787},
                                                                                    {2941,
                                                                                     1013},
                                                                                    {3393,
                                                                                     752},
                                                                                    {2923,
                                                                                     1376},
                                                                                    {2869,
                                                                                     1685},
                                                                                    {2513,
                                                                                     1881},
                                                                                    {2984,
                                                                                     1904},
                                                                                    {3328,
                                                                                     2049},
                                                                                    {2241,
                                                                                     1969},
                                                                                    {1824,
                                                                                     1949},
                                                                                    {2062,
                                                                                     2069},
                                                                                    {1453,
                                                                                     1873},
                                                                                    {1116,
                                                                                     1702},
                                                                                    {1127,
                                                                                     1888},
                                                                                    {749,
                                                                                     2035},
                                                                                    {1042,
                                                                                     1598},
                                                                                    {1040,
                                                                                     1372},
                                                                                    {658,
                                                                                     1424},
                                                                                    {1603,
                                                                                     1510},
                                                                                    {2044,
                                                                                     1298},
                                                                                    {2489,
                                                                                     1512},
                                                                                    {2044,
                                                                                     1739},
                                                                                    {2243,
                                                                                     1616},
                                                                                    {2254,
                                                                                     1403},
                                                                                    {1823,
                                                                                     1407},
                                                                                    {1824,
                                                                                     1618},
                                                                                    {2044,
                                                                                     1511}]),
                                                                TeamEvt =
                                                                    make_team_event(Role#role{s_event
                                                                                                  =
                                                                                                  21,
                                                                                              s_event_pid
                                                                                                  =
                                                                                                  HeroPid},
                                                                                    [TeamLev,
                                                                                     TeamLen,
                                                                                     Group,
                                                                                     Series,
                                                                                     HeroPid]),
                                                                DownRole1 =
                                                                    DownRole#role{s_event
                                                                                      =
                                                                                      21,
                                                                                  s_event_pid
                                                                                      =
                                                                                      HeroPid},
                                                                {{X, Y},
                                                                 TeamEvt,
                                                                 DownRole1}
                                                        end,
                    case map:role_enter({MapId, NX, NY},
                                        NewTeamEvt,
                                        DownRole2)
                        of
                        {ok, EnterRole = #role{pos = Pos}} ->
                            logger:debug("[~ts]成功进入准备区",
                                         [_Name],
                                         hero_role,
                                         296),
                            PrePos = #pos_history{map = OldMap, x = OldX,
                                                  y = OldY,
                                                  platform = OldPlatform,
                                                  zone_id = OldZoneId},
                            NewPos = Pos#pos{last = PrePos},
                            NewRole = calc_looks(EnterRole#role{pos = NewPos},
                                                 Group),
                            {ok, R} = role_convert:to(hero, Role),
                            case StateName of
                                prepare ->
                                    hero_mgr:cast({sign_succ,
                                                   R#hero_role{team_lev =
                                                                   TeamLev,
                                                               team_len =
                                                                   TeamLen,
                                                               group = Group,
                                                               series =
                                                                   Series}}),
                                    role:link_send(NewRole,
                                                   16301,
                                                   {1,
                                                    notice:format(lang:get("报名成功，进入~ts准备厅"),
                                                                  [{string_2,
                                                                    5,
                                                                    hero_mgr:group_name(Group)}])});
                                _ ->
                                    hero:cast(HeroPid,
                                              {sign_succ,
                                               R#hero_role{die = 4 - 1,
                                                           team_lev = TeamLev,
                                                           team_len = TeamLen,
                                                           group = Group,
                                                           series = Series}}),
                                    role:link_send(NewRole,
                                                   16301,
                                                   {1,
                                                    lang:get("错过报名时间，复活次数-1")})
                            end,
                            {ok, NewRole};
                        _Err ->
                            logger:error("[~ts]进入准备区失败[Err:~w]",
                                         [_Name, _Err],
                                         hero_role,
                                         314),
                            notice:npc_talk(Role,
                                            20064,
                                            lang:get("无法进入准备区，报名失败")),
                            ok
                    end;
                _False ->
                    logger:debug("进入准备区地图失败[Err:~w]",
                                 [_False],
                                 hero_role,
                                 320),
                    ok
            end
    end.

apply_enter_zone(Role = #role{s_event = 20,
                              name = _Name, id = RoleId},
                 #{map_id := MapId, zone_pid := ZonePid,
                   group := Group}) ->
    TeamEvt = make_team_event(Role#role{s_event = 21},
                              [ZonePid, Group]),
    {X, Y} = util:rand_list([{710, 761},
                             {1024, 909},
                             {1339, 1098},
                             {1801, 1106},
                             {2276, 1111},
                             {2018, 787},
                             {2941, 1013},
                             {3393, 752},
                             {2923, 1376},
                             {2869, 1685},
                             {2513, 1881},
                             {2984, 1904},
                             {3328, 2049},
                             {2241, 1969},
                             {1824, 1949},
                             {2062, 2069},
                             {1453, 1873},
                             {1116, 1702},
                             {1127, 1888},
                             {749, 2035},
                             {1042, 1598},
                             {1040, 1372},
                             {658, 1424},
                             {1603, 1510},
                             {2044, 1298},
                             {2489, 1512},
                             {2044, 1739},
                             {2243, 1616},
                             {2254, 1403},
                             {1823, 1407},
                             {1824, 1618},
                             {2044, 1511}]),
    case map:role_enter({MapId, X, Y},
                        TeamEvt,
                        Role#role{s_event = 21, s_event_pid = ZonePid})
        of
        {ok, EnterRole = #role{}} ->
            logger:debug("[~ts]成功进入正式区", [_Name], hero_role, 331),
            hero:cast(ZonePid, {enter_zone, RoleId}),
            NewRole = calc_looks(EnterRole, Group),
            {ok, NewRole};
        _Err ->
            logger:error("[~ts]进入准备区失败[Err:~w]",
                         [_Name, _Err],
                         hero_role,
                         336),
            ok
    end;
apply_enter_zone(_Role, _) -> ok.

cast_enemy(#combat{}, AtkList, DfdList) ->
    LeaderName1 = case lists:keyfind(1,
                                     #fighter.is_leader,
                                     AtkList)
                      of
                      #fighter{name = Name1} -> Name1;
                      _ -> lang:get("神秘人")
                  end,
    LeaderName2 = case lists:keyfind(1,
                                     #fighter.is_leader,
                                     DfdList)
                      of
                      #fighter{name = Name2} -> Name2;
                      _ -> lang:get("神秘人")
                  end,
    Msg1 = notice:format(lang:get("遭遇了~ts的队伍"),
                         [{role_2, LeaderName1}]),
    Msg2 = notice:format(lang:get("遭遇了~ts的队伍"),
                         [{role_2, LeaderName2}]),
    lists:foreach(fun (#fighter{type = 1, pid = Pid})
                          when is_pid(Pid) ->
                          notice:send({pid, Pid}, 3, Msg2);
                      (_) -> skip
                  end,
                  AtkList),
    lists:foreach(fun (#fighter{type = 1, pid = Pid})
                          when is_pid(Pid) ->
                          notice:send({pid, Pid}, 3, Msg1);
                      (_) -> skip
                  end,
                  DfdList),
    ok.

die_leave_zone(Role = #role{name = _Name}) ->
    Timer = #timer{id = hero_leave, timeout = 3 * 1000,
                   m = hero_role, f = do_die_leave_zone, a = []},
    Role1 = role_timer:set(Timer, Role),
    {ok, Role1}.

do_die_leave_zone(Role = #role{s_event_pid = ZonePid,
                               name = Name}) ->
    ExitRole = case leave_zone(Role, ZonePid) of
                   {false, _Reason} -> Role;
                   {ok, NewRole} -> NewRole;
                   _ -> Role
               end,
    AwayRole = case team:sync_away(ExitRole) of
                   {ok, NewRole1} -> NewRole1;
                   _ -> ExitRole
               end,
    NoticeMsg = lang:get("荣耀战场复活次数已用完，系统自动传送出场"),
    notice:send(AwayRole, 3, NoticeMsg),
    Msg = notice:format(lang:get("~ts已用完所有死亡次数，系统自动将其传送出场"),
                        [{role_2, Name}]),
    team:notice(Role, Msg),
    {ok, AwayRole}.

is_same_group(Id, Id2) ->
    case hero_mgr:lookup(Id) of
        #hero_role{series = Series, group = Group} ->
            case hero_mgr:lookup(Id2) of
                #hero_role{series = Series, group = Group} -> true;
                _ -> false
            end;
        _ -> false
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

make_team_event(Role = #role{s_event = Event}, Args) ->
    case check_team(Role) of
        [] -> self;
        MateIds when Event =:= 20 ->
            #{label => enter_event, event => Event,
              role_ids => MateIds,
              mfa =>
                  {hero_role, role_callback, [{follow_join, Args}]}};
        MateIds when Event =:= 21 ->
            #{label => enter_event, event => Event,
              role_ids => MateIds,
              mfa =>
                  {hero_role, role_callback, [{follow_zone, Args}]}};
        MateIds ->
            #{label => exit_event, event => Event,
              role_ids => MateIds,
              mfa =>
                  {hero_role, role_callback, [{follow_quit, Args}]}}
    end.

role_callback(_, Role, _,
              {follow_join,
               [TeamLev, TeamLen, Group, Series, HeroPid]}) ->
    Role2 = Role#role{s_event = 20},
    NewRole = calc_looks(Role2, Group),
    map:role_update(NewRole),
    {ok, R} = role_convert:to(hero, Role2),
    hero:cast(HeroPid,
              {sign_succ,
               R#hero_role{team_lev = TeamLev, team_len = TeamLen,
                           group = Group, series = Series}}),
    {ok, NewRole};
role_callback(_, Role, _,
              {follow_zone,
               [TeamLev, TeamLen, Group, Series, HeroPid]}) ->
    Role2 = Role#role{s_event = 21, s_event_pid = HeroPid},
    {ok, R} = role_convert:to(hero, Role2),
    hero:cast(HeroPid,
              {sign_succ,
               R#hero_role{die = 4 - 1, team_lev = TeamLev,
                           team_len = TeamLen, group = Group,
                           series = Series}}),
    role:link_send(Role,
                   16301,
                   {1, lang:get("错过报名时间，复活次数-1")}),
    NewRole = calc_looks(Role2, Group),
    map:role_update(NewRole),
    {ok, NewRole};
role_callback(_, Role = #role{id = RoleId}, _,
              {follow_zone, [Pid, Group]}) ->
    Role2 = Role#role{s_event = 21, s_event_pid = Pid},
    hero:cast(Pid, {enter_zone, RoleId}),
    NewRole = calc_looks(Role2, Group),
    map:role_update(NewRole),
    {ok, NewRole};
role_callback(_,
              Role = #role{id = RoleId, pid = _RolePid}, _,
              {follow_quit, [ZonePid]}) ->
    Role2 = Role#role{s_event = 0, s_event_pid = undefined},
    case is_pid(ZonePid) of
        _ when ZonePid == hero_mgr ->
            hero_mgr:cast({leave_succ, RoleId});
        true -> hero:cast(ZonePid, {leave_succ, RoleId});
        false -> skip
    end,
    Role3 = looks:del([54, 56, 63], Role2),
    NewRole = looks:add({54, 0, 1, ""}, Role3, replace),
    map:role_update(NewRole),
    {ok, NewRole}.

combat_over(#combat{type = 107, winner = Winner,
                    loser = Loser, pid = CombatPid,
                    start_args =
                        #combat_start_args{common_referee = Referee}})
    when is_pid(Referee) ->
    case Winner of
        [_ | _] ->
            WinMate = [#{id => OriginId, is_leader => IsLeader,
                         pid => Pid}
                       || #fighter{origin_id = OriginId, is_leader = IsLeader,
                                   pid = Pid, type = 1}
                              <- Winner],
            LoseMate = [#{id => OriginId, is_leader => IsLeader,
                          pid => Pid}
                        || #fighter{origin_id = OriginId, is_leader = IsLeader,
                                    pid = Pid, type = 1}
                               <- Loser],
            hero:cast(Referee,
                      {combat_over, CombatPid, WinMate, LoseMate});
        _ ->
            case Loser of
                [_ | _] ->
                    LoseMate = [#{id => OriginId, is_leader => IsLeader,
                                  pid => Pid}
                                || #fighter{origin_id = OriginId,
                                            is_leader = IsLeader, pid = Pid,
                                            type = 1}
                                       <- Loser],
                    hero:cast(Referee, {combat_fail, CombatPid, LoseMate});
                _ -> ok
            end
    end;
combat_over(_) -> ok.

async_combat_over(Role = #role{name = RoleName,
                               s_event = 21},
                  IsWin, AddScore,
                  Tz = #hero_role{times = Times, die = Die}, SendMail) ->
    Msg = case IsWin of
              1 ->
                  notice:format(lang:get("战斗胜利，获得~ts点荣耀积分"),
                                [{string_2, 1, AddScore}]);
              _ ->
                  notice:format(lang:get("战斗失败，获得~ts点荣耀积分"),
                                [{string_2, 1, AddScore}])
          end,
    notice:send(Role, 3, Msg),
    Role1 = case Die =< 0 of
                true ->
                    {ok, ExitRole} = die_leave_zone(Role),
                    ExitRole;
                _ -> Role
            end,
    {ok, TRole1} = case SendMail of
                       true -> send_mail(Role1, Tz, 0);
                       _ -> {ok, Role1}
                   end,
    StarScore = if Times > 7 -> [];
                   Times >= 3 ->
                       case IsWin of
                           1 -> [{90012, 10}];
                           _ -> [{90012, 6}]
                       end;
                   true ->
                       case IsWin of
                           1 -> [{90012, 20}];
                           _ -> [{90012, 12}]
                       end
                end,
    case hero_data:get_win({Times, IsWin}) of
        #hero_win_data{item_list = ItemList, exp = ExpMode,
                       pet_exp = PetExpMode} ->
            {NewItemList, IsCast} = weight_item(ItemList),
            Exp = get_exp(Role, 3310, ExpMode / 1000),
            PetExp = get_pet_exp(Role, 3310, PetExpMode / 1000),
            Gain = StarScore ++ NewItemList ++ Exp ++ PetExp,
            GainList = format:val_to_gain(Gain),
            case role_gain:do_notice(GainList, TRole1) of
                {ok, NewRole} ->
                    cast_item_gain(NewRole,
                                   {combat, Tz},
                                   IsWin,
                                   NewItemList,
                                   IsCast),
                    {ok, NewRole};
                {false, #gain{reason = bag_full}} ->
                    Title = lang:get("荣耀战场奖励"),
                    Content = lang:get("荣耀战场战斗奖励时，背包已满"),
                    mail:send(Role,
                              #{title => Title, content => Content,
                                items => Gain}),
                    cast_item_gain(Role,
                                   {combat, Tz},
                                   IsWin,
                                   NewItemList,
                                   IsCast),
                    {ok, Role1};
                {false, _Reason} ->
                    logger:error("[~ts]荣耀战场结算时无法增加[~w]",
                                 [RoleName, _Reason],
                                 hero_role,
                                 543),
                    {ok, Role1}
            end;
        _ -> {ok, Role1}
    end;
async_combat_over(_, _, _, _, _) -> ok.

async_over(Role = #role{name = _RoleName, s_event = 21},
           IsWin, Tz = #hero_role{group = Group}) ->
    GroupName = hero_mgr:group_name(Group),
    Msg = case IsWin of
              1 ->
                  notice:format(lang:get("~ts 胜利，~ts秒之后将刷出宝箱"),
                                [{string_2, 1, GroupName}, {string_2, 5, 60}]);
              _ ->
                  notice:format(lang:get("~ts 失败，退出战场"),
                                [{string_2, 1, GroupName}])
          end,
    notice:send(Role, 3, Msg),
    NRole1 = case IsWin of
                 0 ->
                     case leave_zone(Role) of
                         ok -> Role;
                         {ok, NRole} -> NRole;
                         _ -> Role
                     end;
                 _ -> Role
             end,
    send_mail(NRole1, Tz, IsWin);
async_over(_, _, _) -> ok.

send_mail(Role,
          Tz = #hero_role{id = RoleId, name = RoleName,
                          score = Score, die = Die},
          IsWin) ->
    case hero_data:get_reward({Score, IsWin}) of
        #hero_reward_data{item_list = ItemList,
                          exp_mode = ExpMode, pet_exp_mode = PetExpMode} ->
            {NewItemList, IsCast} = weight_item(ItemList),
            Exp = get_exp(Role, ExpMode),
            PetExp = get_pet_exp(Role, PetExpMode),
            Title = lang:get("荣耀战场结算"),
            {_ExpRatio, Content} = case Die > 0 of
                                       true ->
                                           {1,
                                            lang:get("你在荣耀战场中表现优异，额外获得了以下奖励")};
                                       _ ->
                                           {5.99999999999999977796e-1,
                                            lang:get("你在荣耀战场中的积极表现被星辰学院注意到，额外获得了以下奖励")}
                                   end,
            Gain = NewItemList ++ Exp ++ PetExp,
            GainList = format:val_to_gain(Gain),
            sys_conn:pack_send(16308, {IsWin, Die, Gain}),
            case role_gain:do_notice(GainList, Role) of
                {ok, NewRole} ->
                    cast_item_gain(Role,
                                   {reward, Tz},
                                   IsWin,
                                   NewItemList,
                                   IsCast),
                    {ok, NewRole};
                {false, #gain{reason = bag_full}} ->
                    mail:send(RoleId,
                              #{title => Title, content => Content,
                                items => Gain}),
                    cast_item_gain(Role,
                                   {reward, Tz},
                                   IsWin,
                                   NewItemList,
                                   IsCast),
                    {ok, Role};
                {false, _Reason} ->
                    logger:error("[~ts]荣耀战场结算时无法增加[~w]",
                                 [RoleName, _Reason],
                                 hero_role,
                                 604),
                    {ok, Role}
            end;
        _ -> {ok, Role}
    end;
send_mail(Role, _, _) -> {ok, Role}.

check_box(_Role = #role{id = RoleId, s_event = 21,
                        s_event_pid = ZonePid},
          BaseId) ->
    case hero:call(ZonePid, {check_box, RoleId}) of
        {ok, true} ->
            case hero_data:get_box(BaseId) of
                List = [_ | _] ->
                    case util:rand_list(List, ratio) of
                        Item = #{} -> {ok, Item};
                        _ -> {false, lang:get("该宝箱无法打开")}
                    end;
                _ -> {false, lang:get("该宝箱无法打开")}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙")}
    end;
check_box(_Role, _) ->
    {false, lang:get("不在荣耀战场中，不能采集")}.

gain_box(Role = #role{id = RoleId,
                      s_event_pid = ZonePid},
         UnitBaseId,
         #{item_id := ItemId, num := Num, is_cast := IsCast}) ->
    NewItemId = item_type:special_id(ItemId),
    Gain = format:val_to_gain([{NewItemId, 0, Num}]),
    case role_gain:do(Gain, Role) of
        {ok, NewRole} ->
            Msg = show_table(NewRole, UnitBaseId, NewItemId, Num),
            notice:send(Role, 7, Msg),
            cast_gain(NewRole, UnitBaseId, NewItemId, Num, IsCast),
            hero:cast(ZonePid, {gain_box, RoleId}),
            {ok, NewRole};
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("荣耀战场打开宝箱"),
            Content = lang:get("荣耀战场宝箱奖励时，背包已满"),
            Items = [{NewItemId, 0, Num}],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items}),
            Msg = show_table(Role, UnitBaseId, NewItemId, Num),
            notice:send(Role, 7, Msg),
            hero:cast(ZonePid, {gain_box, RoleId}),
            cast_gain(Role, UnitBaseId, NewItemId, Num, IsCast),
            {ok, Role};
        {false, _} -> {false, lang:get("宝箱数据错误，无法获得奖励")}
    end.

cast_item_gain(#role{name = RoleName},
               {combat, #hero_role{group = Group}}, IsWin,
               CastGain = [_ | _], 1) ->
    Msg = case IsWin of
              1 ->
                  notice:format(lang:get("~ts ~ts在~ts将对手踢翻在地，顺势捞走~ts{face_1,18}"),
                                [{string_2, 1, hero_mgr:group_name(Group)},
                                 {role_2, RoleName},
                                 {string_2, 1, lang:get("荣耀战场")},
                                 {item_2, CastGain}]);
              _ ->
                  notice:format(lang:get("~ts ~ts在~ts被一拳揍趴在地，从地上捡起~ts{face_1,15}"),
                                [{string_2, 1, hero_mgr:group_name(Group)},
                                 {role_2, RoleName},
                                 {string_2, 1, lang:get("荣耀战场")},
                                 {item_2, CastGain}])
          end,
    notice:cast(all, 5, Msg),
    ok;
cast_item_gain(#role{name = RoleName},
               {reward, #hero_role{group = Group}}, IsWin,
               CastGain = [_ | _], 1) ->
    Msg = case IsWin of
              1 ->
                  notice:format(lang:get("~ts ~ts在~ts表现突出，为代表队赢得最终胜利~ts{face_1,18}"),
                                [{string_2, 1, hero_mgr:group_name(Group)},
                                 {role_2, RoleName},
                                 {string_2, 1, lang:get("荣耀战场")},
                                 {item_2, CastGain}]);
              _ ->
                  notice:format(lang:get("~ts ~ts从~ts败退时发现场外躺着~ts{face_1,15}"),
                                [{string_2, 1, hero_mgr:group_name(Group)},
                                 {role_2, RoleName},
                                 {string_2, 1, lang:get("荣耀战场")},
                                 {item_2, CastGain}])
          end,
    notice:cast(all, 5, Msg),
    ok;
cast_item_gain(_Role, _, _, _, _) -> ok.

weight_item([]) -> {[], 0};
weight_item(List) ->
    case util:rand_list(List, 5) of
        {0, _, _, _, _} -> {[], 0};
        {ItemId, Bind, Num, IsCast, _} ->
            NewItemId = item_type:special_id(ItemId),
            {[{NewItemId, Bind, Num}], IsCast};
        _ -> {[], 0}
    end.

get_exp(#role{lev = Lev}, Mode) ->
    case levup_data:get_exp({Mode, Lev}) of
        #{exp := Exp} -> [{90010, 0, Exp}];
        _ -> []
    end.

get_exp(#role{lev = Lev}, Mode, Rate) ->
    case levup_data:get_exp({Mode, Lev}) of
        #{exp := Exp} -> [{90010, 0, util:ceil(Exp * Rate)}];
        _ -> []
    end.

get_pet_exp(Role, Mode) ->
    case pet:get_war_pet(Role) of
        {ok, #pet{lev = Lev}} ->
            case levup_data:get_exp({Mode, Lev}) of
                #{pet_exp := Exp} -> [{90005, 0, Exp}];
                _ -> []
            end;
        _ -> []
    end.

get_pet_exp(Role, Mode, Rate) ->
    case pet:get_war_pet(Role) of
        {ok, #pet{lev = Lev}} ->
            case levup_data:get_exp({Mode, Lev}) of
                #{pet_exp := Exp} ->
                    [{90005, 0, util:ceil(Exp * Rate)}];
                _ -> []
            end;
        _ -> []
    end.

apply_prepare_exp(Role = #role{s_event = 20}) ->
    Exp = get_exp(Role, 3311),
    PetExp = get_pet_exp(Role, 3311),
    Title = lang:get("荣耀战场准备区"),
    Gain = Exp ++ PetExp,
    GainList = format:val_to_gain(Gain),
    case role_gain:do_notice(GainList, Role, Title) of
        {ok, NRole} -> {ok, NRole};
        _ -> ok
    end;
apply_prepare_exp(_) -> ok.

recruit_lev(LevRangeCfg = #{type := Type}, Flag,
            Role = #role{id = RoleId, s_event = Event})
    when Event == 20 orelse Event == 21 ->
    Rtn = team:make_recruit_cond(LevRangeCfg, Flag, Role),
    case hero_mgr:lookup(RoleId) of
        #hero_role{group = 1} when Type == 16 -> Rtn;
        #hero_role{} when Type == 17 -> Rtn;
        _ -> {false, lang:get("不是同一阵营不能招募")}
    end;
recruit_lev(_LevRangeCfg, _Flag, _Role = #role{}) ->
    {false, lang:get("荣耀战场中才能发起战斗")}.

check_group(#role{id = RoleId, s_event = Event}, Type)
    when Event == 20 orelse Event == 21 ->
    case hero_mgr:lookup(RoleId) of
        #hero_role{group = 1} when Type == 16 -> true;
        #hero_role{} when Type == 17 -> true;
        _ -> false
    end;
check_group(_, _) -> false.

do_sign(Role = #role{pid = Pid, lev = Lev, id = RoleId,
                     attr = #attr{fc = Fc}},
        #{mate := MateList, series := Series, fc := MateFc}) ->
    PetFc = pet_attr:calc_fc(Role),
    TeamLen = length(MateList) + 1,
    case hero_mgr:call({get_ready_num,
                        #{id => RoleId, series => Series,
                          fc => (Fc + PetFc + MateFc) / TeamLen}})
        of
        {ok, StateName, HeroPid, Group} ->
            LevList = [MLev || #team_mate{lev = MLev} <- MateList],
            TeamLev = calc_team_lev([Lev | LevList]),
            hero:cast(HeroPid,
                      {sign,
                       #{pid => Pid, id => RoleId, group => Group,
                         team_lev => TeamLev, team_len => TeamLen,
                         series => Series, state_name => StateName}}),
            ok;
        {false, Reason} -> {false, Reason}
    end.

calc_team_lev(AllLev) ->
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 5.0e-1 + Max * 5.0e-1),
            Val;
        _ -> 40
    end.

team_check(_, _) -> {true, []}.

show_table(Role, BaseId, ItemId, Num) ->
    Msg = notice:format(lang:get("获得~ts"),
                        [{item_2, ItemId, Num}]),
    case top_compete_data:get_box(BaseId) of
        List = [_ | _] ->
            ShowList = make_show(List, 19),
            role:link_send(Role,
                           16307,
                           {ItemId, Num, ShowList, Msg}),
            Msg;
        _ ->
            role:link_send(Role, 16307, {ItemId, Num, [], Msg}),
            Msg
    end.

cast_gain(#role{name = RoleName}, _BaseId, ItemId, Num,
          1) ->
    Msg =
        notice:format(lang:get("~ts以胜利者的姿态打开胜利宝箱，赫然发现宝箱里的~ts{face_1, "
                               "18}"),
                      [{role_2, RoleName}, {item_2, ItemId, Num}]),
    notice:cast(all, 5, Msg),
    ok;
cast_gain(_, _, _, _, _) -> ok.

make_show(List, Num) ->
    AllRatio = lists:sum([Ratio
                          || #{show_ratio := Ratio} <- List]),
    make_show(List, AllRatio, Num, []).

make_show(_List, _Rate, Num, GetList) when Num =< 0 ->
    GetList;
make_show([], _Rate, _Num, GetList) -> GetList;
make_show(List, Rate, Num, GetList) ->
    Seed = util:rand(1, Rate),
    case do_make_show(List, Seed, Rate) of
        {NewL, {GetItemId, GetNum}, NewRate} ->
            make_show(NewL,
                      NewRate,
                      Num - 1,
                      [{GetItemId, GetNum} | GetList]);
        {false, Reason} ->
            logger:error("荣耀战场随机发生错误，内容为:~w",
                         [Reason],
                         hero_role,
                         880),
            make_show(List, Rate, Num - 1, GetList)
    end.

do_make_show(List, Seed, Rate) ->
    do_make_show(List, Seed, Rate, 0, []).

do_make_show([], _Seed, _Rate, _Range, _Back) ->
    {false, util:flist("~w", [_Back])};
do_make_show([L = #{show_ratio := Ratio,
                    item_id := ItemId, num := Num}
              | T],
             Seed, Rate, Range, Back) ->
    case Seed =< Ratio + Range of
        true ->
            NewItemId = item_type:special_id(ItemId),
            {T ++ [L | Back], {NewItemId, Num}, Rate};
        false ->
            do_make_show(T, Seed, Rate, Range + Ratio, [L | Back])
    end.

check_statue(_Role, []) -> ok;
check_statue(Role, [H | T]) ->
    case check_statue(Role, H) of
        {false, Reason} -> {false, Reason};
        ok -> check_statue(Role, T)
    end;
check_statue(#role{id = RoleId}, sign) ->
    case hero_mgr:call({get_sign_statue, #{id => RoleId}})
        of
        {ok, true} -> ok;
        {false, Reason} -> {false, Reason}
    end;
check_statue(#role{id = RoleId}, leader_sign) ->
    case hero_mgr:call({get_leader_sign_statue,
                        #{id => RoleId, num => 0}})
        of
        {ok, true} -> ok;
        {false, Reason} -> {false, Reason}
    end;
check_statue(#role{id = RoleId}, {leader_sign, Num}) ->
    case hero_mgr:call({get_leader_sign_statue,
                        #{id => RoleId, num => Num}})
        of
        {ok, true} -> ok;
        {false, Reason} -> {false, Reason}
    end.

calc_looks(Role = #role{id = Rid}) ->
    case hero_mgr:lookup(Rid) of
        {true, Warrior} -> calc_looks(Role, Warrior);
        _ -> Role
    end.

calc_looks(Role, #hero_role{group = Camp}) ->
    CalcRole = looks:calc(Role),
    role_camp_looks(Camp, CalcRole);
calc_looks(Role, Camp) ->
    CalcRole = looks:calc(Role),
    role_camp_looks(Camp, CalcRole).

role_camp_looks(Camp,
                Role = #role{s_action = Action}) ->
    {Look, CampLook, HeroLook} = case Camp of
                                     1 ->
                                         {{54, 0, 6, ""},
                                          {59, 0, Camp, ""},
                                          {63, 0, Camp, ""}};
                                     _ ->
                                         {{54, 0, 1, ""},
                                          {59, 0, Camp, ""},
                                          {63, 0, Camp, ""}}
                                 end,
    Role1 = looks:add(Look, Role, replace),
    Role2 = looks:add(CampLook, Role1, replace),
    Role3 = looks:add(HeroLook, Role2, replace),
    Role4 = case Action of
                5 -> looks:add({56, 0, 1, ""}, Role3, replace);
                _ -> Role3
            end,
    NewRole = Role4,
    NewRole.

