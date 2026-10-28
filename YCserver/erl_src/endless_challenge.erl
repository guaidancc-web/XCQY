-file("src/mod/endless_challenge/endless_challenge.erl",
      1).

-module(endless_challenge).

-export([init/0,
         login/1,
         push_17200/2,
         push_17205/2,
         five_flush/2,
         apply_remomve_prepare/1,
         apply_remomve_prepare/2,
         apply_team_mate_start/2,
         wave_reward/3,
         do_check_enter_hall/1,
         get_endless_challenge_skills/1,
         apply_mate_data/1,
         apply_turn_card/1,
         rpc_query_reward_info/1,
         rpc_reset_endless_challenge/1]).

-export([rpc_enter/1,
         rpc_team_start/1,
         rpc_query_info/1,
         rpc_prepare/2,
         rpc_choose_skill/3,
         rpc_start_combat/1,
         rpc_unlock_skill/2,
         rpc_query_skill_list/1,
         rpc_turn_card/2]).

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

-file("src/mod/endless_challenge/endless_challenge.erl",
      47).

-file("inc/endless_challenge.hrl", 1).

-record(m_endless_challenge,
        {ver = 3 :: pos_integer(),
         is_prepare = 0 :: non_neg_integer(),
         choose_skills = [],
         reward_list = [],
         best_wave = 0 :: non_neg_integer(),
         skill_list = [] :: list(),
         turn_count = 0,
         free_count = 0,
         fighter_times = 0}).

-record(mate_data,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         best_wave = 0,
         max_wave = 0,
         is_prepare = 0 :: non_neg_integer(),
         choose_skills = []}).

-record(endless_challenge_rank,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         wave = 0 :: non_neg_integer(),
         use_time = 0 :: non_neg_integer(),
         mate_datas = []}).

-file("src/mod/endless_challenge/endless_challenge.erl",
      48).

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

-file("src/mod/endless_challenge/endless_challenge.erl",
      49).

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

-file("src/mod/endless_challenge/endless_challenge.erl",
      50).

-file("inc/glory.hrl", 1).

-record(m_glory,
        {ver = 2,
         id = 0,
         title_id = 0,
         end_time = 0,
         new_id = 0,
         new_title_id = 0,
         switch_time = 0,
         max_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         reward_list = [],
         day_reward = 0,
         lost_times = 0}).

-record(glory_role,
        {id = {0, "", 0},
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         new_id = 0,
         max_id = 0,
         new_title_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         update_time = 0,
         day_reward = 0}).

-record(glory_floor,
        {floor = 0,
         ver = 0,
         first = [],
         role_list = [],
         max_list = [],
         record_list = [],
         num = 0}).

-record(glory_rank_data,
        {min = 0, max = 0, reward = []}).

-record(glory_open_rank_data,
        {min = 0,
         max = 0,
         open = 0,
         reward = [],
         title = "",
         content = "",
         honor_id = 0}).

-record(glory_lev_data,
        {id = 0,
         name = "",
         title_id = 0,
         need_title_id = 0,
         need_lev = 0,
         need_fc = 0,
         fc_del = 0,
         fc_add = 0,
         lev_break = 0,
         unit_id = 0,
         all_point = 0,
         guard_num = 0,
         skill_prac = [],
         skill_prac_lev = [],
         first_reward = [],
         first_exp_mod = 0,
         normal_reward = [],
         normal_exp_mod = 0,
         day_reward = [],
         day_exp_mod = 0,
         buff_num = 0,
         buff_id = 0}).

-record(glory_title_data,
        {title_id = 0,
         next_title_id = 0,
         title_name = "",
         honor_id = 0,
         rate = 0}).

-file("src/mod/endless_challenge/endless_challenge.erl",
      51).

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

-file("src/mod/endless_challenge/endless_challenge.erl",
      52).

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

-file("src/mod/endless_challenge/endless_challenge.erl",
      53).

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

-file("src/mod/endless_challenge/endless_challenge.erl",
      54).

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

-file("src/mod/endless_challenge/endless_challenge.erl",
      55).

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

-file("src/mod/endless_challenge/endless_challenge.erl",
      56).

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

-file("src/mod/endless_challenge/endless_challenge.erl",
      57).

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

-file("src/mod/endless_challenge/endless_challenge.erl",
      58).

init() -> #m_endless_challenge{}.

login(Role = #role{s_event = 29, lev = Lev})
    when Lev >= 70 ->
    NewRole = Role#role{s_event = 0},
    {ok, NewRole};
login(_) -> ok.

five_flush(#role{lev = Lev}, _) when Lev < 70 -> ok;
five_flush(Role = #role{m_endless_challenge =
                            MEndlessChallenge = #m_endless_challenge{best_wave =
                                                                         BestWave,
                                                                     fighter_times
                                                                         =
                                                                         FightTimes}},
           _OldRole) ->
    YestdayWeek = date:day_of_the_week(date:unixtime() -
                                           86400
                                           - 18000),
    NewFightTimes = case lists:member(YestdayWeek,
                                      [1, 2, 3, 4, 5, 6, 7])
                        of
                        true ->
                            case BestWave =/= 0 of
                                true -> FightTimes;
                                false -> min(FightTimes + 1, 2)
                            end;
                        false -> FightTimes
                    end,
    TodayWeek = date:day_of_the_week(date:unixtime() -
                                         18000),
    case lists:member(TodayWeek, [1, 2, 3, 4, 5, 6, 7]) of
        true ->
            NewRole = Role#role{m_endless_challenge =
                                    MEndlessChallenge#m_endless_challenge{best_wave
                                                                              =
                                                                              0,
                                                                          reward_list
                                                                              =
                                                                              [],
                                                                          turn_count
                                                                              =
                                                                              0,
                                                                          free_count
                                                                              =
                                                                              0,
                                                                          fighter_times
                                                                              =
                                                                              NewFightTimes}},
            {ok, NewRole};
        false ->
            NewRole = Role#role{m_endless_challenge =
                                    MEndlessChallenge#m_endless_challenge{fighter_times
                                                                              =
                                                                              NewFightTimes}},
            {ok, NewRole}
    end.

push_17200(Role = #role{}, MateDatas) ->
    role:link_send(Role, 17200, {MateDatas}),
    ok.

push_17205(Role, Data) ->
    role:link_send(Role, 17205, Data),
    ok.

push_17210(Role, Data) ->
    role:link_send(Role, 17210, Data),
    ok.

push_17212(Role = #role{m_endless_challenge =
                            #m_endless_challenge{skill_list = SkillList,
                                                 choose_skills =
                                                     ChooseSkills}}) ->
    role:link_send(Role, 17212, {SkillList, ChooseSkills}),
    ok.

push_17215(Role = #role{m_endless_challenge =
                            #m_endless_challenge{fighter_times = FightTimes,
                                                 best_wave = BestWave}}) ->
    role:link_send(Role, 17215, {FightTimes, BestWave}),
    ok.

apply_remomve_prepare(#evt_team_leave{}, Role) ->
    apply_remomve_prepare(Role);
apply_remomve_prepare(#evt_team_away{}, Role) ->
    apply_remomve_prepare(Role);
apply_remomve_prepare(#evt_team_join{}, Role) ->
    apply_remomve_prepare(Role);
apply_remomve_prepare(#evt_team_appoint{}, Role) ->
    apply_remomve_prepare(Role);
apply_remomve_prepare(_, _) -> ok.

apply_remomve_prepare(Role = #role{s_event = 29,
                                   m_endless_challenge =
                                       MEndlessChallenge =
                                           #m_endless_challenge{}}) ->
    EndlessRole = Role#role{s_event = 0,
                            m_endless_challenge =
                                MEndlessChallenge#m_endless_challenge{is_prepare
                                                                          = 0}},
    NewRole = case get(endless_challenge_triggle) of
                  TL = [_ | _] -> role_trigger:del(TL, EndlessRole);
                  _ -> EndlessRole
              end,
    map:role_status_update(NewRole),
    {ok, NewRole};
apply_remomve_prepare(_Role) -> ok.

apply_team_mate_start(Role = #role{m_team =
                                       #m_team{pid = Pid}},
                      Data)
    when is_pid(Pid) ->
    logger:debug("通知状态同步:~w",
                 [Data],
                 endless_challenge,
                 144),
    EventRole = Role#role{s_event = 29},
    TriggerList = [#trigger{label = evt_team_leave, a = [],
                            m = endless_challenge, f = apply_remomve_prepare},
                   #trigger{label = evt_team_away, a = [],
                            m = endless_challenge, f = apply_remomve_prepare},
                   #trigger{label = evt_team_join, a = [],
                            m = endless_challenge, f = apply_remomve_prepare},
                   #trigger{label = evt_team_appoint, a = [],
                            m = endless_challenge, f = apply_remomve_prepare}],
    {TL, NewRole} = role_trigger:add(TriggerList,
                                     EventRole),
    logger:debug("存储的事件列表为:~w",
                 [TL],
                 endless_challenge,
                 155),
    put(endless_challenge_triggle, TL),
    map:role_status_update(NewRole),
    push_17200(NewRole, Data),
    {ok, NewRole};
apply_team_mate_start(_, _) -> ok.

wave_reward(Role = #role{name = _Name,
                         classes = Classes, lev = Lev,
                         m_endless_challenge =
                             MEndlessChallenge =
                                 #m_endless_challenge{reward_list = RewardList,
                                                      best_wave = BestWave,
                                                      free_count = FreeCount,
                                                      turn_count = TurnCount},
                         m_glory = #m_glory{id = GloryLev}},
            Wave, Result) ->
    logger:debug("结算波数奖励:~w, 结果:~w",
                 [Wave, Result],
                 endless_challenge,
                 165),
    RewardWave = BestWave + 1,
    CurrentWave = Wave - 1,
    case CurrentWave < RewardWave of
        true ->
            case Result of
                98 -> push_17205(Role, {Wave, []});
                _ -> skip
            end,
            ok;
        false ->
            logger:debug("完成波数 :~w, 玩家试炼等级: ~w",
                         [Wave, GloryLev],
                         endless_challenge,
                         180),
            case calc_reward_info(RewardWave,
                                  Wave,
                                  GloryLev,
                                  Classes,
                                  Lev,
                                  [])
                of
                DropRewardList = [_ | _] ->
                    CardNum = case TurnCount =:= 0 of
                                  true ->
                                      calc_card_num(RewardWave, CurrentWave, 0);
                                  false -> 0
                              end,
                    NewRewardList = format:merge_val(DropRewardList,
                                                     RewardList),
                    RewardRole = Role#role{m_endless_challenge =
                                               MEndlessChallenge#m_endless_challenge{reward_list
                                                                                         =
                                                                                         NewRewardList,
                                                                                     best_wave
                                                                                         =
                                                                                         Wave
                                                                                             -
                                                                                             1,
                                                                                     free_count
                                                                                         =
                                                                                         FreeCount
                                                                                             +
                                                                                             CardNum}},
                    OldMaxWave = var:get_var(RewardRole, other, 2056, 0),
                    NewRole = var:set_var(RewardRole,
                                          other,
                                          2056,
                                          max(OldMaxWave, Wave - 1)),
                    push_17205(NewRole, {Wave, DropRewardList}),
                    push_17210(NewRole, {NewRewardList}),
                    {ok, NewRole};
                _ ->
                    push_17205(Role, {Wave, []}),
                    ok
            end
    end.

get_endless_challenge_skills(#role{s_event = 29,
                                   m_endless_challenge =
                                       #m_endless_challenge{choose_skills =
                                                                Skills}}) ->
    [{SkillId, 1} || {_, SkillId} <- Skills];
get_endless_challenge_skills(_) -> [].

rpc_team_start(_Role = #role{cross_type = 2}) ->
    {false, lang:get("跨服状态下不能无尽挑战")};
rpc_team_start(Role = #role{cross_type = CrossType,
                            id = RoleId, name = RoleName, classes = SelfClasses,
                            lev = SelfLev, sex = SelfSex,
                            m_endless_challenge =
                                MEndlessChallenge =
                                    #m_endless_challenge{best_wave = BestWave,
                                                         choose_skills =
                                                             SelfChooseSkills},
                            m_team = #m_team{status = 1}}) ->
    Result = case check_team_start(Role) of
                 {ok, TMembers} when CrossType == 1 ->
                     case [I
                           || I = #team_mate{lev = MateLev} <- TMembers,
                              MateLev < SelfLev - 5 orelse
                                  MateLev > SelfLev + 5]
                         of
                         [#team_mate{name = MateName} | _] ->
                             {false,
                              notice:format(lang:get("~ts与队长等级差距超过~ts级，无法参与"),
                                            [{role_2, MateName},
                                             {string_2, 5, 5}])};
                         [] -> {ok, TMembers}
                     end;
                 {ok, TMembers} -> {ok, TMembers};
                 {false, Err} -> {false, Err}
             end,
    case Result of
        {ok, Members} ->
            MateDatas = apply_mate_data(Members),
            SlefData = #mate_data{id = RoleId, name = RoleName,
                                  sex = SelfSex, classes = SelfClasses,
                                  lev = SelfLev, best_wave = BestWave,
                                  is_prepare = 2,
                                  choose_skills = SelfChooseSkills},
            logger:debug("队员数据：~w",
                         [MateDatas],
                         endless_challenge,
                         233),
            Data = [SlefData | MateDatas],
            team:async_teammate(Role,
                                {endless_challenge,
                                 apply_team_mate_start,
                                 [Data]}),
            push_17200(Role, Data),
            NewRole = Role#role{m_endless_challenge =
                                    MEndlessChallenge#m_endless_challenge{is_prepare
                                                                              =
                                                                              1},
                                s_event = 29},
            map:role_status_update(NewRole),
            {ok, NewRole};
        {false, Reason} ->
            notice:return(Reason),
            ok
    end;
rpc_team_start(_Role) -> ok.

rpc_query_info(#role{m_combat =
                         #m_combat{pid = CombatPid}})
    when is_pid(CombatPid) ->
    ok;
rpc_query_info(Role = #role{s_event = 29, id = RoleId,
                            name = RoleName, classes = SelfClasses,
                            lev = SelfLev, sex = SelfSex,
                            m_endless_challenge =
                                #m_endless_challenge{best_wave = BestWave,
                                                     choose_skills =
                                                         SelfChooseSkills,
                                                     is_prepare = IsPrepare},
                            m_team =
                                #m_team{status = TeamStatus, pid = TeamPid}})
    when is_pid(TeamPid) ->
    case team:get_members(Role) of
        L = [_ | _] ->
            Members = [Mate
                       || Mate = #team_mate{status = Status, pid = Pid} <- L,
                          is_pid(Pid), Status =:= 1 orelse Status =:= 2],
            MateDatas = apply_mate_data(Members),
            PrepareStatus = case TeamStatus of
                                1 -> 2;
                                _ -> IsPrepare
                            end,
            SlefData = #mate_data{id = RoleId, name = RoleName,
                                  sex = SelfSex, classes = SelfClasses,
                                  lev = SelfLev, best_wave = BestWave,
                                  is_prepare = PrepareStatus,
                                  choose_skills = SelfChooseSkills},
            logger:debug("队员数据：~w",
                         [MateDatas],
                         endless_challenge,
                         262),
            Data = [SlefData | MateDatas],
            push_17200(Role, Data),
            ok;
        _ -> ok
    end;
rpc_query_info(_Role) -> ok.

rpc_enter(_Role = #role{cross_type = 2}) ->
    {false, lang:get("跨服状态下不能无尽挑战")};
rpc_enter(Role = #role{pos =
                           #pos{platform = P, zone_id = Z}}) ->
    case enter_check(Role) of
        {true, _TeamList} ->
            {X, Y} = util:rand_list([{1903, 1369},
                                     {2068, 1192},
                                     {1554, 1451},
                                     {2084, 1486},
                                     {1862, 837},
                                     {973, 981}]),
            logger:debug("进入准备大厅:~w",
                         [{X, Y}],
                         endless_challenge,
                         282),
            case map:role_enter({P,
                                 Z,
                                 42100,
                                 X + util:rand(-100, 100),
                                 Y + util:rand(-100, 100)},
                                Role)
                of
                {ok, NewRole} -> {ok, NewRole};
                {error, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

rpc_prepare(Role = #role{m_team = #m_team{status = 1},
                         m_endless_challenge = MEndlessChallenge},
            Flag)
    when Flag =:= 0 ->
    NewRole = Role#role{s_event = 0,
                        m_endless_challenge =
                            MEndlessChallenge#m_endless_challenge{is_prepare =
                                                                      0}},
    map:role_status_update(NewRole),
    team:async_teammate(Role,
                        {endless_challenge, apply_remomve_prepare, []}),
    {ok, NewRole, lang:get("您取消了准备，招募队员后可重新开始")};
rpc_prepare(_Role = #role{m_endless_challenge =
                              #m_endless_challenge{is_prepare = Flag}},
            Flag) ->
    ok;
rpc_prepare(Role = #role{id = RoleId,
                         m_endless_challenge =
                             MEndlessChallenge =
                                 #m_endless_challenge{choose_skills =
                                                          ChooseSkills}},
            Flag) ->
    logger:debug("同步队友数据:~w",
                 [{RoleId, Flag, ChooseSkills}],
                 endless_challenge,
                 304),
    team:send(Role, 17208, {RoleId, Flag, ChooseSkills}),
    case Flag of
        0 ->
            NoticeMsg = lang:get("您取消了准备状态，全队进行准备才能开始挑战"),
            NewRole = Role#role{m_endless_challenge =
                                    MEndlessChallenge#m_endless_challenge{is_prepare
                                                                              =
                                                                              Flag}},
            map:role_status_update(NewRole),
            {ok, NewRole, NoticeMsg};
        1 ->
            NoticeMsg = lang:get("您准备完毕,请等待队长开启挑战"),
            NewRole = Role#role{m_endless_challenge =
                                    MEndlessChallenge#m_endless_challenge{is_prepare
                                                                              =
                                                                              Flag}},
            map:role_status_update(NewRole),
            {ok, NewRole, NoticeMsg};
        _ -> ok
    end.

rpc_choose_skill(Role = #role{s_event = Event,
                              id = RoleId,
                              m_team = #m_team{status = TeamStatus},
                              m_endless_challenge =
                                  MEndlessChallenge =
                                      #m_endless_challenge{skill_list =
                                                               SkillList,
                                                           is_prepare = Flag,
                                                           choose_skills =
                                                               Skills}},
                 Index, SkillId) ->
    case lists:member(SkillId, SkillList) of
        true ->
            case lists:keyfind(SkillId, 2, Skills) of
                {Index, _} -> ok;
                {Idx, _} ->
                    Skills1 = lists:keydelete(Idx, 1, Skills),
                    Skills2 = lists:keystore(Index,
                                             1,
                                             Skills1,
                                             {Index, SkillId}),
                    NewRole = Role#role{m_endless_challenge =
                                            MEndlessChallenge#m_endless_challenge{choose_skills
                                                                                      =
                                                                                      Skills2}},
                    IsPrepare = case TeamStatus of
                                    1 -> 2;
                                    _ -> Flag
                                end,
                    case Event of
                        29 ->
                            team:send(NewRole,
                                      17208,
                                      {RoleId, IsPrepare, Skills2});
                        _ -> skip
                    end,
                    push_17212(NewRole),
                    {ok, NewRole};
                _ ->
                    Skills1 = lists:keystore(Index,
                                             1,
                                             Skills,
                                             {Index, SkillId}),
                    NewRole = Role#role{m_endless_challenge =
                                            MEndlessChallenge#m_endless_challenge{choose_skills
                                                                                      =
                                                                                      Skills1}},
                    IsPrepare = case TeamStatus of
                                    1 -> 2;
                                    _ -> Flag
                                end,
                    case Event of
                        29 ->
                            team:send(NewRole,
                                      17208,
                                      {RoleId, IsPrepare, Skills1});
                        _ -> skip
                    end,
                    push_17212(NewRole),
                    {ok, NewRole}
            end;
        false -> {false, lang:get("您未解锁该技能，继续努力哦")}
    end.

rpc_start_combat(_Role = #role{cross_type = 2}) ->
    {false, lang:get("跨服状态下不能无尽挑战")};
rpc_start_combat(Role = #role{id = RoleId,
                              cross_type = CrossType, lev = SelfLev}) ->
    case lists:member(date:day_of_the_week(date:unixtime() -
                                               18000),
                      [1, 2, 3, 4, 5, 6, 7])
        of
        true ->
            Members = team:get_members(Role),
            Fun = fun (#team_mate{status = Status}) -> Status =:= 2
                  end,
            Follows = lists:filter(Fun, Members),
            MateDatas = apply_mate_data(Follows),
            MaxWave = var:get_var(Role, other, 2056, 0),
            MaxWaveData = [{MateId, MateMaxWave}
                           || #mate_data{id = MateId, max_wave = MateMaxWave}
                                  <- MateDatas],
            ExtArgs = [{RoleId, MaxWave} | MaxWaveData],
            BuffArgs = make_combat_buff(ExtArgs, []),
            ExtArgs1 = [{endless_buff_args, BuffArgs}],
            case [Name
                  || #mate_data{name = Name, is_prepare = IsPrepare}
                         <- MateDatas,
                     IsPrepare =:= 0]
                of
                [] when CrossType == 1 ->
                    case [I
                          || I = #mate_data{lev = MateLev} <- MateDatas,
                             MateLev < SelfLev - 5 orelse MateLev > SelfLev + 5]
                        of
                        [#mate_data{name = MateName} | _] ->
                            {false,
                             notice:format(lang:get("~ts与队长等级差距超过~ts级，无法参与"),
                                           [{role_2, MateName},
                                            {string_2, 5, 5}])};
                        [] ->
                            endless_challenge_combat:start_combat(Role,
                                                                  ExtArgs1)
                    end;
                [] ->
                    endless_challenge_combat:start_combat(Role, ExtArgs1),
                    ok;
                [RoleName | _] ->
                    Msg = notice:format(lang:get("~ts未准备完成，所有队员准备完成才能开启挑战"),
                                        [{role_2, RoleName}]),
                    {false, Msg}
            end;
        false -> {false, lang:get("不在活动时间内不能进行挑战")}
    end.

make_combat_buff([], Data) -> Data;
make_combat_buff([{RoleId, MaxWave} | T], Data) ->
    case endless_challenge_data:get_buff(MaxWave) of
        {Buffs = [_ | _], DelWave} ->
            Buffs1 = combat_script_buff:convert_buff(Buffs),
            make_combat_buff(T, [{RoleId, Buffs1, DelWave} | Data]);
        _ -> make_combat_buff(T, Data)
    end.

rpc_unlock_skill(Role = #role{m_endless_challenge =
                                  MEndlessChallenge =
                                      #m_endless_challenge{skill_list =
                                                               SkillList}},
                 SkillId) ->
    case check_unlock_skill([lev, glory, skill],
                            SkillId,
                            Role)
        of
        true ->
            case endless_challenge_data:get_skill_data(SkillId) of
                #{cost := Cost} ->
                    Loss = format:val_to_loss(Cost),
                    case role_gain:do_notice(Loss, Role) of
                        {ok, LossRole} ->
                            NewRole = LossRole#role{m_endless_challenge =
                                                        MEndlessChallenge#m_endless_challenge{skill_list
                                                                                                  =
                                                                                                  [SkillId
                                                                                                   | SkillList]}},
                            push_17212(NewRole),
                            SkillName = case
                                            skill_data:get_endless_challenge(SkillId)
                                            of
                                            #{name := _SName} -> _SName;
                                            _ -> lang:get("无名技能")
                                        end,
                            NoticeMsg = notice:format(lang:get("恭喜你，成功解锁了~ts"),
                                                      [{string_2,
                                                        5,
                                                        SkillName}]),
                            {ok, NewRole, NoticeMsg};
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        _ -> {false, lang:get("材料不足，无法解锁该技能")}
                    end;
                _ -> {false, lang:get("配置错误，不存在的技能")}
            end;
        {false, Reason} -> {false, Reason}
    end.

rpc_query_skill_list(Role) ->
    push_17212(Role),
    ok.

rpc_turn_card(#role{m_endless_challenge =
                        #m_endless_challenge{free_count = FreeCount}},
              _Index)
    when FreeCount =< 0 ->
    {false, lang:get("您没有获得翻牌机会")};
rpc_turn_card(Role = #role{m_endless_challenge =
                               #m_endless_challenge{turn_count = TurnCount,
                                                    free_count = FreeCount}},
              Index) ->
    case TurnCount < 5 of
        true ->
            logger:debug("进行翻牌:~w",
                         [Index],
                         endless_challenge,
                         452),
            DelTimerRole = role_timer:del(endless_challenge_card,
                                          Role),
            TimerRole = case TurnCount + 1 < FreeCount of
                            true ->
                                Timer = #timer{id = endless_challenge_card,
                                               timeout = 60 * 1000, times = 1,
                                               m = endless_challenge,
                                               f = apply_turn_card, a = []},
                                role_timer:set(Timer, DelTimerRole);
                            false -> DelTimerRole
                        end,
            TriggerRole =
                role_trigger:fire(#endless_challenge_card{}, TimerRole),
            case TurnCount >= FreeCount of
                true ->
                    case endless_challenge_data:get_card_info(TurnCount + 1)
                        of
                        #{cost := Cost} ->
                            Loss = format:val_to_loss(Cost),
                            case role_gain:do_notice(Loss, TriggerRole) of
                                {ok, LossRole} ->
                                    turn_round_card(LossRole, Index);
                                {false, #loss{msg = Msg}} -> {false, Msg};
                                _ -> {false, lang:get("翻牌所需资源不足，无法进行翻牌")}
                            end;
                        _ -> {false, lang:get("您已经将牌翻完了")}
                    end;
                false -> turn_round_card(TriggerRole, Index)
            end;
        false -> {false, lang:get("您已经将牌翻完了")}
    end.

enter_check(Role = #role{id = RoleId,
                         m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    case team_check(Role) of
        {true, TeamList} ->
            TeamList1 = lists:keydelete(RoleId,
                                        #team_mate.id,
                                        TeamList),
            TeamList2 = [Role | TeamList1],
            case do_enter_check(TeamList2) of
                true -> {true, TeamList2};
                {false, Reason} -> {false, Reason}
            end;
        false -> {false, lang:get("归队状态下，无法操作")}
    end;
enter_check(Role) ->
    case do_enter_check([Role]) of
        true -> {true, [Role]};
        {false, Reason} -> {false, Reason}
    end.

do_enter_check([]) -> true;
do_enter_check([Role = #role{} | T]) ->
    case do_check_enter_hall(Role) of
        {ok, true} -> do_enter_check(T);
        {ok, {false, Reason}} -> {false, Reason}
    end;
do_enter_check([#team_mate{pid = Pid} | T])
    when is_pid(Pid) ->
    case role:apply(sync,
                    Pid,
                    {endless_challenge, do_check_enter_hall, []})
        of
        true -> do_enter_check(T);
        {false, Reason} -> {false, Reason}
    end;
do_enter_check(_) -> {false, lang:get("请求不到队伍状态")}.

team_check(Role) ->
    case team:get_status(Role) of
        {true, 1} ->
            case team:get_members(Role) of
                [] -> {true, []};
                TeamList = [_ | _] ->
                    NewTeamList = [M
                                   || M = #team_mate{status = 2} <- TeamList],
                    {true, NewTeamList};
                _ -> false
            end;
        {true, 3} -> {true, []};
        {true, _} -> false;
        false -> {true, []}
    end.

do_check_enter_hall(Role = #role{name = Name}) ->
    case role_misc:check_event(Role) of
        {false, Reason} ->
            Msg = util:flist("~ts~ts", [Name, Reason]),
            {ok, {false, Msg}};
        true ->
            case check_pass(Role) of
                true -> {ok, true};
                {false, Reason} -> {ok, {false, Reason}}
            end
    end.

check_pass(#role{lev = Lev, name = RoleName})
    when Lev < 70 ->
    Reason =
        notice:format(lang:get("队员~ts等级不足~ts级，无法参加无尽挑战"),
                      [{role_2, RoleName}, {string_2, 1, 70}]),
    {false, Reason};
check_pass(#role{name = RoleName,
                 m_glory = #m_glory{id = GloryLev}})
    when GloryLev < 30 ->
    Reason =
        notice:format(lang:get("~ts还未通过爵位挑战~ts关,无法参加无尽挑战"),
                      [{role_2, RoleName}, {string_2, 1, 30}]),
    {false, Reason};
check_pass(_Role = #role{}) ->
    OpenTime = date:unixtime() - 18000,
    Week = date:day_of_the_week(OpenTime),
    case lists:member(Week, [1, 2, 3, 4, 5, 6, 7]) of
        true -> true;
        false ->
            Msg = notice:format(lang:get("无尽挑战只在~ts开放"),
                                [{string_2, 5, lang:get("周日")}]),
            {false, Msg}
    end;
check_pass(_) -> {false, lang:get("未知地图，无法操作")}.

check_team_start(Role = #role{m_team =
                                  #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    Members = team:get_members(Role),
    Fun = fun (#team_mate{status = Status}) -> Status =/= 2
          end,
    case do_enter_check([Role | Members]) of
        true ->
            case lists:partition(Fun, Members) of
                {[#team_mate{name = AwayName} | _], _Follows} ->
                    NoticeMsg =
                        notice:format(lang:get("~ts未归队，请召唤其归队后再进行挑战"),
                                      [{role_2, AwayName}]),
                    {false, NoticeMsg};
                {[], Follows} ->
                    case length(Follows) < 2 of
                        true ->
                            NoticeMsg =
                                notice:format(lang:get("敌方实力太强，请先组满~ts人之后再来"),
                                              [{string_2, 1, 2 + 1}]),
                            {false, NoticeMsg};
                        false -> {ok, Follows}
                    end;
                _Err ->
                    logger:error("队伍检查出错:~w",
                                 [_Err],
                                 endless_challenge,
                                 594),
                    {false, lang:get("队伍人数不足")}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_team_start(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("您不是队长，无法操作")};
check_team_start(_Role) ->
    {false, lang:get("对方实力太强，请组队后再来")}.

apply_mate_data(Members) ->
    Fun = fun (#team_mate{id = MateId, name = Name,
                          sex = Sex, classes = Classes, lev = Lev,
                          status = Status},
               Rlt) ->
                  case role_query:attr(by_id,
                                       MateId,
                                       [#role.m_endless_challenge, #role.m_var])
                      of
                      {ok,
                       [#m_endless_challenge{best_wave = Best,
                                             choose_skills = ChooseSkills,
                                             is_prepare = IsPrepare},
                        #m_var{other_vars = OtherVars}]} ->
                          PrepareStatus = case Status of
                                              1 -> 2;
                                              _ -> IsPrepare
                                          end,
                          MaxWave = case lists:keyfind(2056, 1, OtherVars) of
                                        {_, GetMaxWave} -> GetMaxWave;
                                        _ -> 0
                                    end,
                          MateData = #mate_data{id = MateId, name = Name,
                                                sex = Sex, classes = Classes,
                                                lev = Lev, best_wave = Best,
                                                is_prepare = PrepareStatus,
                                                choose_skills = ChooseSkills,
                                                max_wave = MaxWave},
                          [MateData | Rlt];
                      _Else -> Rlt
                  end;
              (#fighter{rid = Rid, platform = Plat, zone_id = ZoneId,
                        name = Name, sex = Sex, classes = Classes, lev = Lev},
               Rlt) ->
                  case role_query:attr(by_id,
                                       Rid,
                                       Plat,
                                       ZoneId,
                                       [#role.m_endless_challenge, #role.m_var])
                      of
                      {ok,
                       [#m_endless_challenge{best_wave = Best,
                                             choose_skills = ChooseSkills},
                        #m_var{other_vars = OtherVars}]} ->
                          MaxWave = case lists:keyfind(2056, 1, OtherVars) of
                                        {_, GetMaxWave} -> GetMaxWave;
                                        _ -> 0
                                    end,
                          MateData = #mate_data{id = {Rid, Plat, ZoneId},
                                                name = Name, sex = Sex,
                                                classes = Classes, lev = Lev,
                                                best_wave = Best,
                                                choose_skills = ChooseSkills,
                                                max_wave = MaxWave},
                          [MateData | Rlt];
                      _Else -> Rlt
                  end;
              (_, Rlt) -> Rlt
          end,
    lists:foldl(Fun, [], Members).

apply_turn_card(#role{m_endless_challenge =
                          #m_endless_challenge{turn_count = TurnCount,
                                               free_count = FreeCount}})
    when TurnCount >= FreeCount ->
    logger:debug("没有翻牌次数", [], endless_challenge, 641),
    ok;
apply_turn_card(Role = #role{m_endless_challenge =
                                 #m_endless_challenge{turn_count = TurnCount,
                                                      free_count =
                                                          FreeCount}}) ->
    logger:debug("进行定时翻牌", [], endless_challenge, 644),
    DelTimerRole = role_timer:del(endless_challenge_card,
                                  Role),
    TimerRole = case TurnCount + 1 < FreeCount of
                    true ->
                        Timer = #timer{id = endless_challenge_card,
                                       timeout = 60 * 1000, times = 1,
                                       m = endless_challenge,
                                       f = apply_turn_card, a = []},
                        role_timer:set(Timer, DelTimerRole);
                    false -> DelTimerRole
                end,
    turn_round_card(TimerRole, util:rand(1, 5)).

rpc_query_reward_info(Role) ->
    endless_challenge_combat:query_reward_info(Role),
    ok.

rpc_reset_endless_challenge(#role{m_combat =
                                      #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("您正在战斗中，不能进行重置")};
rpc_reset_endless_challenge(#role{m_endless_challenge =
                                      #m_endless_challenge{fighter_times =
                                                               FightTimes}})
    when FightTimes =< 0 ->
    {false, lang:get("您没有重置次数了")};
rpc_reset_endless_challenge(Role =
                                #role{m_endless_challenge =
                                          MEndlessChallenge =
                                              #m_endless_challenge{fighter_times
                                                                       =
                                                                       FightTimes}}) ->
    NewRole = Role#role{m_endless_challenge =
                            MEndlessChallenge#m_endless_challenge{best_wave = 0,
                                                                  reward_list =
                                                                      [],
                                                                  turn_count =
                                                                      0,
                                                                  free_count =
                                                                      0,
                                                                  fighter_times
                                                                      =
                                                                      FightTimes
                                                                          - 1}},
    push_17215(NewRole),
    NoticeMsg = lang:get("重置成功，重新挑战可再次获得奖励！"),
    notice:return(NoticeMsg),
    {ok, NewRole}.

check_unlock_skill([], _SkillId, _Role) -> true;
check_unlock_skill([T | L], SkillId, Role) ->
    case check_unlock_skill(T, SkillId, Role) of
        true -> check_unlock_skill(L, SkillId, Role);
        {false, Reason} -> {false, Reason}
    end;
check_unlock_skill(lev, SkillId, #role{lev = Lev}) ->
    case endless_challenge_data:get_skill_data(SkillId) of
        #{lev := NeedLev} when Lev >= NeedLev -> true;
        _ -> {false, lang:get("您的等级不足，不能学习此技能")}
    end;
check_unlock_skill(glory, SkillId,
                   #role{m_glory = #m_glory{id = GloryLev}}) ->
    case endless_challenge_data:get_skill_data(SkillId) of
        #{glory := NeedGlory} when GloryLev >= NeedGlory ->
            true;
        #{glory := NeedGlory} ->
            Msg = notice:format(lang:get("通关爵位挑战~ts关才能解锁该技能"),
                                [{string_2, 1, NeedGlory}]),
            {false, Msg};
        _ -> {false, lang:get("技能配置错误，不存在的技能")}
    end;
check_unlock_skill(skill, SkillId,
                   #role{m_endless_challenge =
                             #m_endless_challenge{skill_list = SkillList}}) ->
    case lists:member(SkillId, SkillList) of
        true -> {false, lang:get("您已经解锁了该技能，不需要重复解锁")};
        false -> true
    end.

calc_reward_info(CurWave, Wave, _GloryLev, _Classes,
                 _Lev, RewardList)
    when CurWave >= Wave ->
    RewardList;
calc_reward_info(CurWave, Wave, GloryLev, Classes, Lev,
                 RewardList) ->
    case endless_challenge_data:get_reward_info({CurWave,
                                                 GloryLev})
        of
        {BaseReward, DropId} ->
            DropList = case drop:produce(DropId, Classes, Lev) of
                           {true, _RuleType, SuperGain, NormalGain} ->
                               Gain = SuperGain ++ NormalGain,
                               format:gain_to_val(Gain);
                           null -> [];
                           {false, Reason} ->
                               logger:error("无尽试炼生成掉落失败:~w",
                                            [Reason],
                                            endless_challenge,
                                            729),
                               []
                       end,
            logger:debug("玩家等级[~w]波数[~w]掉落信息: 普通掉落:~w, 高级掉落:~w",
                         [CurWave, Lev, BaseReward, DropList],
                         endless_challenge,
                         732),
            RewardCfg = format:merge_val(BaseReward ++ DropList,
                                         RewardList),
            calc_reward_info(CurWave + 1,
                             Wave,
                             GloryLev,
                             Classes,
                             Lev,
                             RewardCfg);
        _ -> RewardList
    end.

turn_round_card(Role = #role{name = Name,
                             classes = Classes, lev = Lev,
                             m_endless_challenge =
                                 MEndlessChallenge =
                                     #m_endless_challenge{turn_count =
                                                              TurnCount,
                                                          best_wave = BestWave,
                                                          free_count =
                                                              FreeCount}},
                Index) ->
    case endless_challenge_data:get_card_info(TurnCount + 1)
        of
        #{drop_id := DropId} ->
            case drop:produce(DropId, Classes, Lev) of
                {true, _RuleType, SuperGain, _NormalGain} ->
                    Items = format:gain_to_val(SuperGain),
                    GainRole = case role_gain:do_notice(SuperGain, Role) of
                                   {ok, _GainRole} -> _GainRole;
                                   _ ->
                                       Title = lang:get("无尽挑战翻牌"),
                                       Content = lang:get("这是您无尽挑战翻牌奖励，祝您游戏愉快"),
                                       MailItems = [{BaseId, 0, Num}
                                                    || {BaseId, Num} <- Items],
                                       mail:send(Role,
                                                 #{title => Title,
                                                   content => Content,
                                                   items => MailItems}),
                                       Role
                               end,
                    role:link_send(Role,
                                   17213,
                                   {Index,
                                    BestWave,
                                    FreeCount,
                                    TurnCount + 1,
                                    Items}),
                    Fun = fun (#gain{val = Val, notice = 1}, Rtn) ->
                                  format:merge_val(Val, Rtn);
                              (_, Rtn) -> Rtn
                          end,
                    logger:debug("掉落:~w, 传闻内容:~w",
                                 [SuperGain, lists:foldl(Fun, [], SuperGain)],
                                 endless_challenge,
                                 764),
                    case lists:foldl(Fun, [], SuperGain) of
                        HearsayItems = [_ | _] ->
                            HearsayMsg =
                                notice:format(lang:get("会心一抽！~ts在无尽挑战中抽了一张无尽卡牌，翻开一看竟是~ts{face_1, "
                                                       "20}"),
                                              [{role_2, Name},
                                               {item_2, HearsayItems}]),
                            notice:cast(all, 5, HearsayMsg);
                        _ -> ok
                    end,
                    TurnRole = GainRole#role{m_endless_challenge =
                                                 MEndlessChallenge#m_endless_challenge{turn_count
                                                                                           =
                                                                                           TurnCount
                                                                                               +
                                                                                               1}},
                    {ok, TurnRole};
                null ->
                    logger:error("无尽试炼生成掉落失败:无掉落",
                                 [],
                                 endless_challenge,
                                 777),
                    {false, lang:get("生成翻牌奖励失败")};
                {false, Reason} ->
                    logger:error("无尽试炼生成掉落失败:~w",
                                 [Reason],
                                 endless_challenge,
                                 780),
                    {false, lang:get("生成翻牌奖励失败")}
            end;
        _ -> {false, lang:get("您已经将牌翻完了")}
    end.

calc_card_num(RewardWave, CurrentWave, CardNum)
    when RewardWave > CurrentWave ->
    CardNum;
calc_card_num(RewardWave, CurrentWave, CardNum) ->
    case endless_challenge_data:get_wave_info(RewardWave) of
        #{is_card := 1} ->
            calc_card_num(RewardWave + 1, CurrentWave, CardNum + 1);
        _ -> calc_card_num(RewardWave + 1, CurrentWave, CardNum)
    end.

