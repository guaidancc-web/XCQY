-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      1).

-module(exquisite_shelf_role).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      10).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      11).

-file("inc/exquisite_shelf.hrl", 1).

-record(m_exquisite_shelf,
        {ver = 2,
         wave = 0,
         shelf_id = 0,
         shelf_pid,
         pos_wave = 0,
         card_info = [],
         help_times = 0,
         is_get_help = 0}).

-record(exquisite_shelf_util,
        {id = 0,
         cross_type = 0,
         pid = 0,
         battle_id = 0,
         wave_info = [],
         wave = 1,
         lev = 1,
         challenges = [],
         create_time = 0}).

-record(exquisite_shelf_wave_info,
        {wave = 0,
         map_base_id = 0,
         map_id = 0,
         map_pid,
         units = [],
         status = 0}).

-record(exquisite_shelf_card_info,
        {wave = 1,
         shelf_lev = 1,
         type = 2,
         normal_card = [],
         gold_card = []}).

-record(exquisite_shelf_card_item,
        {index = 1,
         item_id = 0,
         num = 0,
         is_get = 0,
         is_notice = 0,
         is_show = 0}).

-record(exquisite_shelf_fast_combat_record,
        {shelf_wave = {0, 0},
         use_time = 0,
         record_id = {0, {0, "", 0}}}).

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      12).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      13).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      14).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      15).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      16).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      17).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      18).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      19).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      20).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      21).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      22).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      23).

-file("inc/agenda.hrl", 1).

-record(m_agenda,
        {ver = 1 :: non_neg_integer(),
         progress = [],
         activity = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer(),
         rewarded = [] :: [non_neg_integer()],
         last_rewarded = 0 :: non_neg_integer(),
         recommends = [] :: list(),
         last_recommended = 0 :: non_neg_integer()}).

-record(agenda_prog,
        {ver = 1,
         id = 0 :: non_neg_integer(),
         joined = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer()}).

-record(agenda_stat,
        {id = 0 :: non_neg_integer(), joined = 0, finised = 0}).

-record(agenda_stat_role,
        {id = {0, "", 0},
         lev = 0,
         date = {0, 0, 0},
         logs = []}).

-record(m_agenda_week,
        {ver = 1,
         id = 0,
         week_activity = 0 :: non_neg_integer(),
         rewards = [],
         last_add_activity_time = 0}).

-file("src/mod/exquisite_shelf/exquisite_shelf_role.erl",
      24).

-export([rpc_pre_start/1,
         rpc_start_challenge/3,
         rpc_challenge_next/1,
         rpc_stop_challenge/1,
         rpc_next_card/1,
         rpc_open_card/3,
         rpc_view_combat_record/1,
         rpc_start_combat/2,
         push/2]).

-export([callback/4,
         callback/2,
         apply_evt/2,
         five_reset/2,
         init/0,
         login/1,
         logout/1,
         check_gain/3,
         get_agenda_id/1]).

callback(_,
         Role = #role{m_exquisite_shelf = MExquisiteShelf}, _,
         {start_challenge,
          #{shelf_id := ShelfId, shelf_pid := Pid,
            wave := PosWave}}) ->
    NewRole = Role#role{s_event = 57,
                        m_exquisite_shelf =
                            MExquisiteShelf#m_exquisite_shelf{shelf_id =
                                                                  ShelfId,
                                                              pos_wave =
                                                                  PosWave,
                                                              shelf_pid = Pid}},
    push(NewRole, 20306),
    {ok, NewRole};
callback(_,
         Role = #role{m_exquisite_shelf = MExquisiteShelf}, _,
         {challenge_next,
          #{shelf_id := ShelfId, shelf_pid := Pid,
            wave := PosWave}}) ->
    NewRole = Role#role{s_event = 57,
                        m_exquisite_shelf =
                            MExquisiteShelf#m_exquisite_shelf{shelf_id =
                                                                  ShelfId,
                                                              pos_wave =
                                                                  PosWave,
                                                              shelf_pid = Pid}},
    {ok, NewRole};
callback(_, Role, _, leave_pre_area) ->
    {ok, Role#role{s_event = 0}};
callback(_, Role, _, _) -> {ok, Role}.

callback(Role = #role{id = RoleId,
                      m_exquisite_shelf =
                          MExquisiteShelf = #m_exquisite_shelf{shelf_pid =
                                                                   ShelfPid}},
         stop_challenge) ->
    logger:debug("退出副本回调:", [], exquisite_shelf_role, 70),
    exquisite_shelf:cast(ShelfPid, {role_exit, RoleId}),
    NewRole = Role#role{s_event = 0,
                        m_exquisite_shelf =
                            MExquisiteShelf#m_exquisite_shelf{shelf_id = 0}},
    {ok, NewRole};
callback(Role, apply_stop_challenge) ->
    logger:debug("退出副本回调:", [], exquisite_shelf_role, 75),
    case rpc_stop_challenge(Role) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> ok
    end;
callback(Role, open_card) ->
    Type = 2,
    Order = util:rand(1, 3),
    case rpc_open_card(Role, Order, Type) of
        {ok, NewRole} ->
            logger:debug("完成自动翻牌", [], exquisite_shelf_role, 86),
            {ok, NewRole};
        {ok, NewRole, _Msg} -> {ok, NewRole};
        _Err -> ok
    end;
callback(_Role, _Args) ->
    logger:debug("未知的:~w回调函数:~w",
                 [_Role, _Args],
                 exquisite_shelf_role,
                 94),
    ok.

init() -> #m_exquisite_shelf{}.

five_reset(Role = #role{s_event = Event, pos = Pos,
                        m_exquisite_shelf =
                            MExquisiteShelf = #m_exquisite_shelf{card_info =
                                                                     CardInfo,
                                                                 wave =
                                                                     RoleWave}},
           _) ->
    CardFun = fun (#exquisite_shelf_card_info{wave = Wave,
                                              normal_card =
                                                  NormalCard = [_ | _]},
                   Rtn)
                      when Wave >= 7 ->
                      CanGetCount = get_can_card_num(RoleWave),
                      PartFun = fun (#exquisite_shelf_card_item{is_get =
                                                                    IsGet}) ->
                                        IsGet =:= 1;
                                    (_) -> false
                                end,
                      {GetList, UnGetList} = lists:partition(PartFun,
                                                             NormalCard),
                      GetCount = length(GetList),
                      Items = case CanGetCount - GetCount of
                                  MailCount when MailCount > 0 ->
                                      case util:rand_list_n(UnGetList,
                                                            MailCount)
                                          of
                                          MailItems = [_ | _] ->
                                              [{ItemId, 0, Num}
                                               || #exquisite_shelf_card_item{item_id
                                                                                 =
                                                                                 ItemId,
                                                                             num
                                                                                 =
                                                                                 Num}
                                                      <- MailItems];
                                          _ -> []
                                      end;
                                  _ -> []
                              end,
                      Items ++ Rtn;
                  (#exquisite_shelf_card_info{normal_card =
                                                  NormalCard = [_ | _]},
                   Rtn) ->
                      case lists:keymember(1,
                                           #exquisite_shelf_card_item.is_get,
                                           NormalCard)
                          of
                          true -> Rtn;
                          _ ->
                              PartFun = fun (#exquisite_shelf_card_item{is_get =
                                                                            IsGet}) ->
                                                IsGet =:= 1
                                        end,
                              {_GetList, UnGetList} = lists:partition(PartFun,
                                                                      NormalCard),
                              case util:rand_list(UnGetList) of
                                  #exquisite_shelf_card_item{item_id = ItemId,
                                                             num = Num} ->
                                      [{ItemId, 0, Num} | Rtn];
                                  _ -> Rtn
                              end
                      end;
                  (_, Rtn) -> Rtn
              end,
    case lists:foldl(CardFun, [], CardInfo) of
        CardItems = [_ | _] ->
            Title = lang:get("玲珑宝阁翻牌奖励"),
            Content = lang:get("您有未领取的玲珑宝阁翻牌，请查收:"),
            mail:send(Role, Title, Content, CardItems);
        _ -> ok
    end,
    NewRole = Role#role{m_exquisite_shelf =
                            MExquisiteShelf#m_exquisite_shelf{wave = 0,
                                                              help_times = 0,
                                                              is_get_help = 0,
                                                              card_info = []}},
    push(NewRole, 20300),
    NRole = case Event =:= 57 of
                true ->
                    {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                                    {10001, 2583, 3848},
                                                    {10001, 4957, 3680},
                                                    {10001, 445, 2565},
                                                    {10001, 4646, 704},
                                                    {10001, 841, 1033},
                                                    {10001, 2098, 1834},
                                                    {10001, 3617, 1816}]),
                    NewRole#role{s_event = 0,
                                 pos = Pos#pos{map = MapId, x = X, y = Y}};
                _ -> NewRole
            end,
    {ok, NRole}.

login(Role = #role{s_event = 57, pos = Pos}) ->
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
    L = [#trigger{label = evt_levup, a = [],
                  m = exquisite_shelf_role, f = apply_evt}],
    {_, NRole} = role_trigger:add(L, NewRole),
    {ok, NRole};
login(Role) ->
    L = [#trigger{label = evt_levup, a = [],
                  m = exquisite_shelf_role, f = apply_evt}],
    {_, NRole} = role_trigger:add(L, Role),
    {ok, NRole}.

logout(Role = #role{id = RoleId, s_event = 57,
                    m_exquisite_shelf =
                        MExquisiteShelf = #m_exquisite_shelf{shelf_pid =
                                                                 ShelfPid}}) ->
    exquisite_shelf:cast(ShelfPid, {role_exit, RoleId}),
    NewRole = Role#role{m_exquisite_shelf =
                            MExquisiteShelf#m_exquisite_shelf{shelf_id = 0,
                                                              shelf_pid =
                                                                  undefined}},
    {ok, NewRole};
logout(_Role) -> ok.

apply_evt(#evt_levup{}, Role = #role{lev = 65}) ->
    mail:send(Role,
              lang:get("玲珑宝阁邀请函"),
              lang:get("恭喜您升至65级！\n学院注意到你的成长，现邀请你前往接受<color='#ffff00'"
                       ">玲珑宝阁</color>的守门人的考验！击败守门人，成功挑战古代王者，就能获得珍贵的宝物"
                       "！\n 请注意：<color='#00ff00'>65</color>级之后，每周<col"
                       "or='#00ff00'>一、三、五、日</color>可挑战<color='#ffff0"
                       "0'>玲珑宝阁</color>，每周<color='#00ff00'>二、四、六</col"
                       "or>可挑战<color='#ffff00'>天空之塔</color>。"),
              [{21243, 1}]),
    ok;
apply_evt(_, _Role) -> ok.

check_gain(Role = #role{name = Name, classes = Classes,
                        m_team = MTeam, lev = Lev,
                        m_exquisite_shelf =
                            MExquisiteShelf = #m_exquisite_shelf{wave =
                                                                     RoleWave,
                                                                 card_info =
                                                                     CardInfo,
                                                                 pos_wave =
                                                                     PosWave}},
           win, [_, {shelf_wave, {CurWave, ShelfLev}} | _])
    when CurWave > RoleWave ->
    logger:debug("战斗胜利=========",
                 [],
                 exquisite_shelf_role,
                 192),
    RewardWave = case CurWave >= 7 of
                     true -> 7;
                     _ -> CurWave
                 end,
    RewardCfg = exquisite_shelf_data:get_reward({RewardWave,
                                                 ShelfLev}),
    {CardType, ItemReward} = case RewardCfg of
                                 #{type := 1, drop_id := DropId} ->
                                     case drop:produce(DropId, Classes, Lev) of
                                         {true,
                                          _RuleType,
                                          SuperGain,
                                          NormalGain} ->
                                             Gain = SuperGain ++ NormalGain,
                                             Fun = fun (#gain{val = Val,
                                                              notice = 1},
                                                        Rtn) ->
                                                           format:merge_val(Val,
                                                                            Rtn);
                                                       (_, Rtn) -> Rtn
                                                   end,
                                             case lists:foldl(Fun,
                                                              [],
                                                              SuperGain)
                                                 of
                                                 HearsayItems = [_ | _] ->
                                                     HearsayMsg =
                                                         notice:format(lang:get("战力爆表，~ts在玲珑宝阁里击败内阁王者获得了~ts"),
                                                                       [{role_2,
                                                                         Name},
                                                                        {item_2,
                                                                         HearsayItems}]),
                                                     notice:cast(all,
                                                                 5,
                                                                 HearsayMsg);
                                                 _ -> ok
                                             end,
                                             RewardVal =
                                                 format:gain_to_val(Gain),
                                             Items = [{Assets, 0, Val}
                                                      || {Assets, Val}
                                                             <- RewardVal],
                                             {1, Items};
                                         null -> {1, []};
                                         {false, Reason} ->
                                             logger:error("玲珑宝阁生成掉落~w失败:~w",
                                                          [DropId, Reason],
                                                          exquisite_shelf_role,
                                                          228),
                                             {1, []}
                                     end;
                                 #{type := 2} -> {2, []};
                                 #{type := 3} -> {3, []};
                                 _ -> {1, []}
                             end,
    ExpReward = case RewardCfg of
                    #{exp_mod := ExpMod} ->
                        case levup_data:get_exp({ExpMod, Lev}) of
                            #{exp := Exp, pet_exp := PetExp} ->
                                [{90010, Exp}, {90005, PetExp}];
                            _ -> []
                        end;
                    _ -> []
                end,
    NewCard = create_card(Role,
                          CardType,
                          RewardWave,
                          ShelfLev),
    NewCardInfo = case lists:keymember(RewardWave,
                                       #exquisite_shelf_card_info.wave,
                                       CardInfo)
                      of
                      false when CardType =/= 1 -> [NewCard | CardInfo];
                      _ -> CardInfo
                  end,
    NewWave = min(CurWave, 9),
    NewPosWave = case PosWave + 1 < 6 of
                     true -> PosWave + 1;
                     _ -> PosWave
                 end,
    ShelfRole = Role#role{m_exquisite_shelf =
                              MExquisiteShelf#m_exquisite_shelf{wave = NewWave,
                                                                pos_wave =
                                                                    NewPosWave,
                                                                card_info =
                                                                    NewCardInfo}},
    TimerRole = case CardType of
                    2 ->
                        Timer = #timer{id = exquisite_shelf_card,
                                       timeout = 60000, times = 1,
                                       m = exquisite_shelf_role, f = callback,
                                       a = [open_card]},
                        role_timer:add(Timer, ShelfRole);
                    3 -> ShelfRole;
                    _ -> ShelfRole
                end,
    case CardType of
        1 -> ok;
        _ ->
            case RewardWave >= 7 of
                true ->
                    case lists:keyfind(RewardWave,
                                       #exquisite_shelf_card_info.wave,
                                       NewCardInfo)
                        of
                        #exquisite_shelf_card_info{normal_card = NormalCard,
                                                   gold_card = GoldCard} ->
                            role:link_send(ShelfRole,
                                           20308,
                                           {CardType,
                                            CurWave,
                                            NormalCard,
                                            GoldCard});
                        _ ->
                            role:link_send(ShelfRole,
                                           20308,
                                           {CardType, CurWave, [], []})
                    end;
                _ ->
                    role:link_send(ShelfRole,
                                   20308,
                                   {CardType, CurWave, [], []})
            end
    end,
    case MTeam of
        #m_team{status = 1} when CurWave =:= 9 ->
            Msg =
                notice:format(lang:get("~ts带领的队伍击败了所有守护者~ts，获得了大量宝物{face_1,36}"),
                              [{role_2, Name},
                               {string_2, 1, lang:get("通关了玲珑宝阁")}]),
            notice:cast(all, 5, Msg);
        _ -> ok
    end,
    TriggerRole =
        role_trigger:fire(#evt_exquisite_shelf_wave{wave =
                                                        NewWave},
                          TimerRole),
    TeacherRole = teacher:get_teacher_gain(TriggerRole, 63),
    Star = case CurWave of
               7 -> 1;
               8 -> 2;
               9 -> 3;
               _ -> 0
           end,
    case Star of
        0 -> ok;
        _ ->
            Msg1 =
                notice:format(lang:get("恭喜通过~ts星难度挑战，挑战更高难度可开启更多箱子"),
                              [{string_2, 1, Star}]),
            team:notice(Role, Msg1)
    end,
    Reward = ItemReward ++ ExpReward,
    case format:val_to_gain(Reward) of
        GainReward = [_ | _] ->
            case role_gain:do_notice(GainReward, TeacherRole) of
                {ok, NewRole} -> {NewRole, []};
                _ ->
                    Title = lang:get("玲珑宝阁奖励"),
                    Content = lang:get("由于您的背包已满，玲珑宝阁掉落奖励通过邮件下发给您，请查收"),
                    mail:send(TeacherRole, Title, Content, Reward),
                    {TeacherRole, []}
            end;
        _ -> {TeacherRole, []}
    end;
check_gain(Role = #role{m_exquisite_shelf =
                            MExquisiteShelf = #m_exquisite_shelf{pos_wave =
                                                                     PosWave}},
           win, [_, {shelf_wave, {CurWave, _}} | _]) ->
    logger:debug("==============:~w",
                 [CurWave],
                 exquisite_shelf_role,
                 337),
    NewPosWave = case PosWave of
                     6 -> PosWave;
                     _ -> CurWave + 1
                 end,
    NewRole = Role#role{m_exquisite_shelf =
                            MExquisiteShelf#m_exquisite_shelf{pos_wave =
                                                                  NewPosWave}},
    Msg = case CurWave > 6 of
              true -> lang:get("本日已挑战过该难度，不再获得奖励");
              _ -> lang:get("您今日已经击杀过该BOSS，不再获得奖励")
          end,
    notice:return(Msg),
    {NewRole, []};
check_gain(Role, _WinOrLose, _ExtArgs) ->
    logger:debug("=========:~w ",
                 [_WinOrLose],
                 exquisite_shelf_role,
                 378),
    {Role, []}.

get_agenda_id(#role{lev = Lev}) ->
    case agenda_data:get(2061) of
        #{max_leve := MaxLev} when MaxLev >= Lev -> 2061;
        _ -> 2062
    end.

push(Role = #role{m_exquisite_shelf =
                      #m_exquisite_shelf{wave = Wave, card_info = CardInfo}},
     _Cmd = 20300) ->
    Fun = fun (Card = #exquisite_shelf_card_info{type = 3},
               0) ->
                  case check_skip(Card, Wave) of
                      skip -> 0;
                      put_last -> 0;
                      open -> 1
                  end;
              (_, Rtn) -> Rtn
          end,
    Flag = lists:foldl(Fun, 0, CardInfo),
    role:link_send(Role, 20300, {Wave, Flag}),
    ok;
push(#role{lev = Lev}, 20302) ->
    ShelfLev = exquisite_shelf_data:get_shelf_lev(Lev),
    case ets:tab2list(ets_exquisite_shelf_unit) of
        L = [_ | _] ->
            case lists:keyfind({7, ShelfLev}, 1, L) of
                {_, UnitBaseId} ->
                    Reply = [{7, UnitBaseId}],
                    logger:debug("推送今日挑战boss:~w",
                                 [Reply],
                                 exquisite_shelf_role,
                                 415),
                    role:link_send(20302, {Reply});
                _ -> ok
            end;
        _ -> ok
    end;
push(Role = #role{cross_type = CrossType,
                  m_exquisite_shelf =
                      #m_exquisite_shelf{pos_wave = PosWave,
                                         shelf_id = ShelfId}},
     _Cmd = 20306) ->
    case exquisite_shelf_mgr:lookup_shelf_util(ShelfId,
                                               CrossType)
        of
        {ok, #exquisite_shelf_util{wave_info = WaveInfo}} ->
            case lists:keyfind(PosWave,
                               #exquisite_shelf_wave_info.wave,
                               WaveInfo)
                of
                #exquisite_shelf_wave_info{status = Status,
                                           units = Units} ->
                    {BattleId, UnitBaseId} = case lists:keyfind(PosWave,
                                                                1,
                                                                Units)
                                                 of
                                                 {_,
                                                  {_BattleId, _UnitBaseId}} ->
                                                     {_BattleId, _UnitBaseId};
                                                 _ -> {0, 0}
                                             end,
                    Reply = {PosWave, BattleId, UnitBaseId, Status},
                    logger:debug("推送20306:~w",
                                 [Reply],
                                 exquisite_shelf_role,
                                 433),
                    role:link_send(Role, 20306, Reply);
                _ -> ok
            end;
        _ -> ok
    end,
    ok;
push(_Role, _Cmd) -> ok.

rpc_pre_start(Role) ->
    case get_join_wave(Role) of
        {false, Reason} ->
            notice:pop(Role, 2, Reason),
            ok;
        Wave ->
            Msg = notice:format(lang:get("本次挑战将从第~ts层开始"),
                                [{string_2, 1, Wave}]),
            role:link_send(Role, 20303, {Wave, Msg})
    end.

rpc_start_challenge(Role = #role{id = RoleId,
                                 name = Name,
                                 m_exquisite_shelf = MExquisiteShelf,
                                 cross_type = CrossType},
                    IsReStart, IsPlot) ->
    logger:debug("开始挑战玲珑宝阁:~w",
                 [{IsReStart, IsPlot}],
                 exquisite_shelf_role,
                 502),
    case check_start([time,
                      lev,
                      combat,
                      event,
                      team,
                      team_members],
                     Role,
                     #{is_restart => IsReStart})
        of
        {true,
         CheckRole,
         #{wave := Wave, follows := Members,
           shelf_lev := ShelfLev}} ->
            case start_challenge(CrossType, Wave, ShelfLev) of
                {ok,
                 #exquisite_shelf_util{id = ShelfId,
                                       wave_info = WaveInfo, pid = Pid}} ->
                    MapBaseId = exquisite_shelf_data:get_map(Wave),
                    case lists:keyfind(Wave,
                                       #exquisite_shelf_wave_info.wave,
                                       WaveInfo)
                        of
                        #exquisite_shelf_wave_info{map_id = MapId} ->
                            ToPos = get_challenge_pos(Role, MapId, MapBaseId),
                            EventRole = CheckRole#role{s_event = 57,
                                                       m_exquisite_shelf =
                                                           MExquisiteShelf#m_exquisite_shelf{shelf_id
                                                                                                 =
                                                                                                 ShelfId,
                                                                                             shelf_pid
                                                                                                 =
                                                                                                 Pid,
                                                                                             pos_wave
                                                                                                 =
                                                                                                 Wave}},
                            TeamEvt = make_team_evt(EventRole,
                                                    Members,
                                                    #{shelf_id => ShelfId,
                                                      shelf_pid => Pid,
                                                      wave => Wave}),
                            case map:role_enter(ToPos, TeamEvt, EventRole) of
                                {ok, NewRole} ->
                                    Ids = [MateId
                                           || #team_mate{id = MateId}
                                                  <- Members],
                                    EnterIds = [RoleId | Ids],
                                    exquisite_shelf:cast(Pid,
                                                         {enter,
                                                          EnterIds,
                                                          IsPlot}),
                                    {ok, NewRole};
                                _Err ->
                                    logger:error("[~ts]传送玲珑宝阁挑战场景失败[~w]",
                                                 [Name, _Err],
                                                 exquisite_shelf_role,
                                                 525),
                                    {false, lang:get("传送失败")}
                            end;
                        _ -> {false, lang:get("无法进行传送，地图创建失败")}
                    end;
                {false, Reason} ->
                    logger:error("开启副本出错:~w",
                                 [Reason],
                                 exquisite_shelf_role,
                                 532),
                    {false, lang:get("当前无法进行挑战")};
                _Else ->
                    logger:debug("开启挑战失败:~w",
                                 [_Else],
                                 exquisite_shelf_role,
                                 535),
                    {false, lang:get("当前无法进行挑战")}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("当前无法进行挑战")}
    end;
rpc_start_challenge(_Role, _, _) ->
    {false, lang:get("请先进入准备区")}.

rpc_challenge_next(Role = #role{name = Name,
                                cross_type = CrossType, s_event = 57,
                                m_exquisite_shelf =
                                    MExquisiteShelf =
                                        #m_exquisite_shelf{shelf_id =
                                                               ShelfId}}) ->
    case check_start([time, combat, team, team_members],
                     Role,
                     #{is_restart => 0})
        of
        {true, CheckRole, _Args = #{follows := Members}} ->
            case exquisite_shelf_mgr:lookup_shelf_util(ShelfId,
                                                       CrossType)
                of
                {ok,
                 #exquisite_shelf_util{wave_info = WaveInfo, pid = Pid,
                                       wave = CurWave}} ->
                    case CurWave > 6 of
                        true ->
                            MapBaseId = exquisite_shelf_data:get_map(CurWave),
                            case lists:keyfind(CurWave,
                                               #exquisite_shelf_wave_info.wave,
                                               WaveInfo)
                                of
                                #exquisite_shelf_wave_info{map_id = MapId} ->
                                    logger:debug("挑战下一层地图:~w",
                                                 [MapId],
                                                 exquisite_shelf_role,
                                                 558),
                                    ToPos = get_challenge_pos(Role,
                                                              MapId,
                                                              MapBaseId),
                                    TeamEvt = make_team_evt(Role,
                                                            Members,
                                                            #{shelf_id =>
                                                                  ShelfId,
                                                              shelf_pid => Pid,
                                                              wave => CurWave,
                                                              is_next => true}),
                                    case map:role_enter(ToPos,
                                                        TeamEvt,
                                                        CheckRole)
                                        of
                                        {ok, MapRole} ->
                                            NewRole =
                                                MapRole#role{m_exquisite_shelf =
                                                                 MExquisiteShelf#m_exquisite_shelf{pos_wave
                                                                                                       =
                                                                                                       CurWave}},
                                            exquisite_shelf:info(Pid,
                                                                 create_next_unit),
                                            {ok, NewRole};
                                        _Err ->
                                            logger:error("[~ts]传送玲珑宝阁挑战场景失败[~w]",
                                                         [Name, _Err],
                                                         exquisite_shelf_role,
                                                         568),
                                            {false, lang:get("传送失败")}
                                    end;
                                _ -> {false, lang:get("无法进行传送，地图创建失败")}
                            end;
                        _ ->
                            exquisite_shelf:info(Pid, create_next_unit),
                            ok
                    end;
                _ -> {false, lang:get("您没有在副本中，无法进入下一层")}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("暂时无法进入下一层")}
    end;
rpc_challenge_next(_) ->
    {false, lang:get("您没有在副本中，无法进入下一层")}.

rpc_stop_challenge(#role{m_team =
                             #m_team{pid = Pid, status = 2}})
    when is_pid(Pid) ->
    {false, lang:get("您正在跟随队伍中，无法操作")};
rpc_stop_challenge(Role = #role{id = RoleId,
                                m_team = MTeam,
                                m_exquisite_shelf =
                                    MExquisiteShelf =
                                        #m_exquisite_shelf{shelf_pid = Pid}}) ->
    ToPos = get_enter_pos(Role),
    logger:debug("传送地图:~w, 退出副本:~w",
                 [ToPos, Pid],
                 exquisite_shelf_role,
                 594),
    case map:role_enter(ToPos, Role) of
        {ok, MapRole} ->
            exquisite_shelf:cast(Pid, {role_exit, RoleId}),
            NewRole = MapRole#role{s_event = 0,
                                   m_exquisite_shelf =
                                       MExquisiteShelf#m_exquisite_shelf{shelf_id
                                                                             =
                                                                             0,
                                                                         shelf_pid
                                                                             =
                                                                             undefined}},
            case MTeam of
                #m_team{status = 1, pid = TeamPid}
                    when is_pid(TeamPid) ->
                    team:async_teammate(NewRole,
                                        {exquisite_shelf_role,
                                         callback,
                                         [stop_challenge]});
                _ -> ok
            end,
            {ok, NewRole};
        _Err -> {false, lang:get("传送失败")}
    end.

rpc_next_card(Role = #role{m_exquisite_shelf =
                               MExquisiteShelf = #m_exquisite_shelf{card_info =
                                                                        CardInfo,
                                                                    wave =
                                                                        RoleWave}}) ->
    case get_next_card(CardInfo, [], RoleWave) of
        {ok,
         LeftCard = [#exquisite_shelf_card_info{type = Type,
                                                wave = CardWave,
                                                normal_card = NormalCard,
                                                gold_card = GoldCard}
                     | _]}
            when CardWave >= 7 ->
            role:link_send(Role,
                           20308,
                           {Type, CardWave, NormalCard, GoldCard}),
            NewRole = Role#role{m_exquisite_shelf =
                                    MExquisiteShelf#m_exquisite_shelf{card_info
                                                                          =
                                                                          LeftCard}},
            {ok, NewRole};
        {ok,
         LeftCard = [#exquisite_shelf_card_info{type = Type,
                                                wave = CardWave}
                     | _]} ->
            role:link_send(Role, 20308, {Type, CardWave, [], []}),
            NewRole = Role#role{m_exquisite_shelf =
                                    MExquisiteShelf#m_exquisite_shelf{card_info
                                                                          =
                                                                          LeftCard}},
            {ok, NewRole};
        {false, LeftCard} ->
            NewRole = Role#role{m_exquisite_shelf =
                                    MExquisiteShelf#m_exquisite_shelf{card_info
                                                                          =
                                                                          LeftCard}},
            {ok, NewRole}
    end.

get_next_card(CardInfo, PustLast, RoleWave) ->
    case pop_card(CardInfo) of
        {ok, Card, LeftCard} ->
            case check_skip(Card, RoleWave) of
                skip -> get_next_card(LeftCard, PustLast, RoleWave);
                put_last ->
                    NewPustLast = [Card | PustLast],
                    get_next_card(LeftCard, NewPustLast, RoleWave);
                open -> {ok, [Card | LeftCard] ++ PustLast}
            end;
        {false, LeftCard, _Msg} -> {false, LeftCard};
        _ -> {false, [] ++ PustLast}
    end.

rpc_open_card(Role = #role{name = Name,
                           m_exquisite_shelf =
                               MExquisiteShelf = #m_exquisite_shelf{card_info =
                                                                        CardInfo,
                                                                    wave =
                                                                        RoleWave}},
              Order, Type) ->
    case pop_card(CardInfo) of
        {ok,
         Card = #exquisite_shelf_card_info{wave = CardWave},
         LefeCardInfo} ->
            case check_card([card_type, is_get, order_get],
                            Card,
                            #{order => Order, get_type => Type,
                              role_wave => RoleWave})
                of
                {true, _Args} ->
                    {GainItems,
                     IsNotice,
                     NewCard = #exquisite_shelf_card_info{normal_card =
                                                              NormalCard,
                                                          gold_card =
                                                              GoldCard}} =
                        get_card_gain(Card, Type, Order),
                    logger:debug("翻牌后:~w, 剩余牌:~w",
                                 [GainItems, LefeCardInfo],
                                 exquisite_shelf_role,
                                 654),
                    UnbindGainItems = [{Assets, 0, Val}
                                       || {Assets, Val} <- GainItems],
                    Gain = format:val_to_gain(UnbindGainItems),
                    Loss = case Type of
                               3 ->
                                   Cost =
                                       exquisite_shelf_data:get_card_cost(CardWave),
                                   format:val_to_loss(Cost);
                               _ -> []
                           end,
                    case role_gain:do_notice(Loss, Role) of
                        {ok, LossRole} ->
                            NewCardInfo = case is_complete_card(NewCard) of
                                              true -> LefeCardInfo;
                                              _ ->
                                                  lists:keyreplace(CardWave,
                                                                   #exquisite_shelf_card_info.wave,
                                                                   CardInfo,
                                                                   NewCard)
                                          end,
                            logger:debug("===========:~w",
                                         [NewCardInfo],
                                         exquisite_shelf_role,
                                         672),
                            role:link_send(Role,
                                           20308,
                                           {Type,
                                            CardWave,
                                            NormalCard,
                                            GoldCard}),
                            CardRole = LossRole#role{m_exquisite_shelf =
                                                         MExquisiteShelf#m_exquisite_shelf{card_info
                                                                                               =
                                                                                               NewCardInfo}},
                            case IsNotice of
                                1 ->
                                    Msg =
                                        notice:format(lang:get("战力爆表，~ts在玲珑宝阁里击败内阁王者获得了~ts"),
                                                      [{role_2, Name},
                                                       {item_2, GainItems}]),
                                    notice:cast(all, 5, Msg);
                                _ -> ok
                            end,
                            TeamMsg = notice:format(lang:get("~ts开启宝箱获得~ts"),
                                                    [{role_2, Name},
                                                     {item_2, GainItems}]),
                            logger:debug("=============:~w",
                                         [TeamMsg],
                                         exquisite_shelf_role,
                                         683),
                            team:notice(CardRole, TeamMsg),
                            DelTimerRole = role_timer:del(exquisite_shelf_card,
                                                          CardRole),
                            case role_gain:do(Gain, DelTimerRole) of
                                {ok, GainRole} -> {ok, GainRole};
                                _ ->
                                    Title = lang:get("玲珑宝阁翻牌奖励"),
                                    Content =
                                        lang:get("由于您的背包已满，玲珑宝阁翻牌奖励通过邮件下发给您，请查收"),
                                    mail:send(LossRole,
                                              Title,
                                              Content,
                                              UnbindGainItems),
                                    {ok, DelTimerRole}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg, 2};
                        _ -> {false, lang:get("钻石不足，无法进行翻牌")}
                    end;
                {false, Reason} ->
                    NewCardInfo = [Card | LefeCardInfo],
                    NewRole = Role#role{m_exquisite_shelf =
                                            MExquisiteShelf#m_exquisite_shelf{card_info
                                                                                  =
                                                                                  NewCardInfo}},
                    {ok, NewRole, Reason};
                {false, Reason, ErrCode} -> {false, Reason, ErrCode};
                _ -> {false, lang:get("您翻完了所有的牌")}
            end;
        {false, LeftCardInfo, Msg} ->
            NewRole = Role#role{m_exquisite_shelf =
                                    MExquisiteShelf#m_exquisite_shelf{card_info
                                                                          =
                                                                          LeftCardInfo}},
            {ok, NewRole, Msg};
        _ -> {false, lang:get("当前无法进行翻牌，请稍后再试")}
    end.

rpc_view_combat_record(#role{link =
                                 #link{conn_pid = ConnPid},
                             m_exquisite_shelf =
                                 #m_exquisite_shelf{shelf_id = ShelfId}}) ->
    case exquisite_shelf_mgr:lookup_shelf_util(ShelfId) of
        {ok,
         #exquisite_shelf_util{wave = ShelfWave,
                               lev = ShelfLev}} ->
            case ets:lookup(exquisite_shelf_fast_combat_record,
                            {ShelfWave, ShelfLev})
                of
                [#exquisite_shelf_fast_combat_record{record_id =
                                                         RecId}] ->
                    case combat_record:fetch(RecId) of
                        R = #combat_record{} ->
                            combat_record:replay(ConnPid, R);
                        _ -> {false, lang:get("暂无人通关此层，没有录像可观看")}
                    end;
                _ -> {false, lang:get("暂无人通关此层，没有录像可观看")}
            end;
        _ -> {false, lang:get("暂无人通关此层，没有录像可观看")}
    end.

rpc_start_combat(Role, Wave) ->
    logger:debug("玲珑宝塔开始战斗:~w",
                 [Wave],
                 exquisite_shelf_role,
                 732),
    case check_combat([min_lev, start_wave],
                      Role,
                      #{start_wave => Wave})
        of
        {ok, CheckRole, #{min_lev := MinLev}} ->
            start_combat(CheckRole, Wave, MinLev);
        {false, Reason} -> {false, Reason};
        _Err ->
            logger:error("玲珑宝阁进入战斗失败:~w",
                         [_Err],
                         exquisite_shelf_role,
                         740),
            {false, lang:get("进入战斗失败")}
    end.

check_member([], _Args) -> true;
check_member([#team_mate{lev = Lev, name = MateName}
              | Rest],
             Args = #{shelf_lev := ShelfLev, leader_lev := LeaderLev,
                      cross_type := CrossType}) ->
    case Lev < 65 of
        true ->
            Msg =
                notice:format(lang:get("队员~ts的等级不足~ts级，无法参与玲珑珍宝阁"),
                              [{role_2, MateName}, {string_2, 1, 65}]),
            {false, Msg};
        _ ->
            MemShelfLev = exquisite_shelf_data:get_shelf_lev(Lev),
            case MemShelfLev =/= ShelfLev of
                true ->
                    Msg =
                        notice:format(lang:get("队员~ts的等级要求不符合本难度级别，无法进行挑战"),
                                      [{role_2, MateName}]),
                    {false, Msg};
                _ ->
                    case abs(LeaderLev - Lev) > 5 of
                        true when CrossType =:= 1 ->
                            Msg =
                                notice:format(lang:get("队员~ts的等级与您相差超过5级，无法进行挑战"),
                                              [{role_2, MateName}]),
                            {false, Msg};
                        _ -> check_member(Rest, Args)
                    end
            end
    end;
check_member([_Mate | Rest], _Args) ->
    check_member(Rest, _Args).

get_enter_pos(#role{pos =
                        #pos{platform = Platform, zone_id = ZoneId}}) ->
    case map_data:get(53006) of
        {ok, #map_data{revive = Revive}} ->
            case util:rand_list(Revive) of
                {X, Y} -> {Platform, ZoneId, 53006, X, Y};
                _ -> {Platform, ZoneId, 53006, 1167, 723}
            end;
        _ -> {Platform, ZoneId, 53006, 1167, 723}
    end.

get_challenge_pos(#role{pos =
                            #pos{platform = Platform, zone_id = ZoneId}},
                  MapId, MapBaseId) ->
    case map_data:get(MapBaseId) of
        {ok, #map_data{revive = Revive}} ->
            case util:rand_list(Revive) of
                {X, Y} -> {Platform, ZoneId, MapId, X, Y};
                _ -> {Platform, ZoneId, MapId, 1167, 723}
            end;
        _ -> {Platform, ZoneId, MapId, 1167, 723}
    end.

make_team_evt(#role{s_event = Event}, Members, Args) ->
    case Members of
        [] -> self;
        MateIds when Event =:= 57 ->
            FunName = case Args of
                          #{is_next := true} -> challenge_next;
                          _ -> start_challenge
                      end,
            FollowMateIds = [MateId
                             || #team_mate{id = MateId, status = 2} <- MateIds],
            #{label => enter_event, event => Event,
              role_ids => FollowMateIds,
              mfa =>
                  {exquisite_shelf_role, callback, [{FunName, Args}]}};
        MateIds ->
            FollowMateIds = [MateId
                             || #team_mate{id = MateId, status = 2} <- MateIds],
            #{label => exit_event, event => Event,
              role_ids => FollowMateIds,
              mfa =>
                  {exquisite_shelf_role, callback, [leave_pre_area]}}
    end.

get_join_wave(Role = #role{m_exquisite_shelf =
                               #m_exquisite_shelf{wave = SelfWave}}) ->
    case team:get_members(Role) of
        Members = [_ | _] ->
            Fun = fun (#team_mate{id = MateId}, Rtn) ->
                          case role_query:attr(by_id,
                                               MateId,
                                               [#role.m_exquisite_shelf])
                              of
                              {ok, [#m_exquisite_shelf{wave = MateWave}]} ->
                                  min(Rtn, MateWave);
                              _ -> Rtn
                          end
                  end,
            Wave = lists:foldl(Fun, SelfWave, Members) + 1,
            case Wave > 9 of
                true -> 1;
                _ -> Wave
            end;
        _ -> {false, lang:get("玲珑宝阁需要3人队伍进行挑战，请完成组队后再来")}
    end.

check_start([], Role, Args) -> {true, Role, Args};
check_start([time | Rest], Role = #role{lev = Lev},
            Args) ->
    Hour = date:hour(),
    case Hour >= 2 andalso Hour < 5 of
        true ->
            Msg = lang:get("本日宝阁已经关闭，请明天再来"),
            {false, Msg};
        _ ->
            case today_flag(Lev) of
                true -> check_start(Rest, Role, Args);
                _ ->
                    Msg = lang:get("本日宝阁关闭，请明天再来"),
                    {false, Msg}
            end
    end;
check_start([lev | Rest], Role = #role{lev = Lev},
            Args) ->
    case Lev < 65 of
        true ->
            Msg = notice:format(lang:get("您的等级不足~ts级，无法参与玲珑珍宝阁"),
                                [{string_2, 1, 65}]),
            {false, Msg};
        _ ->
            ShelfLev = exquisite_shelf_data:get_shelf_lev(Lev),
            check_start(Rest, Role, Args#{shelf_lev => ShelfLev})
    end;
check_start([combat | _Rest],
            #role{m_combat = #m_combat{pid = Pid}}, _Args)
    when is_pid(Pid) ->
    Msg = lang:get("您正在战斗中，无法进行传送"),
    {false, Msg};
check_start([team | _Rest],
            #role{m_team = #m_team{pid = Pid, status = Status}},
            _Args)
    when is_pid(Pid) andalso Status =/= 1 ->
    Msg = lang:get("您不是队长，无法进行操作"),
    {false, Msg};
check_start([event | Rest], Role = #role{}, Args) ->
    case role_misc:check_event(Role) of
        true -> check_start(Rest, Role, Args);
        {false, Reason} -> {false, Reason}
    end;
check_start([team_members | Rest],
            Role = #role{lev = LeaderLev, cross_type = CrossType},
            Args = #{is_restart := IsReStart}) ->
    case team:get_members(Role) of
        Members = [_ | _] when erlang:length(Members) >= 2 ->
            case check_member(Members,
                              Args#{leader_lev => LeaderLev,
                                    cross_type => CrossType})
                of
                true ->
                    Follows = [Mate
                               || Mate = #team_mate{status = 2} <- Members],
                    case get_join_wave(Role) of
                        {false, Reason} -> {false, Reason};
                        Wave ->
                            StartWave = case IsReStart of
                                            1 -> 1;
                                            _ -> Wave
                                        end,
                            check_start(Rest,
                                        Role,
                                        Args#{follows => Follows,
                                              wave => StartWave})
                    end;
                {false, Reason} -> {false, Reason};
                _ -> {false, lang:get("当前无法组队进入")}
            end;
        _ -> {false, lang:get("玲珑宝阁需要3人队伍进行挑战, 请完成组队后再来")}
    end;
check_start([_ | Rest], Role, Args) ->
    check_start(Rest, Role, Args).

start_challenge(CrossType, Wave, ShelfLev) ->
    logger:debug("玩家通知开启副本:~w",
                 [Wave],
                 exquisite_shelf_role,
                 937),
    case CrossType of
        0 ->
            exquisite_shelf_mgr:call({start_challenge,
                                      #{wave => Wave, shelf_lev => ShelfLev}});
        _ ->
            cross:call(exquisite_shelf_mgr,
                       call,
                       [{start_challenge,
                         #{wave => Wave, shelf_lev => ShelfLev}}])
    end.

check_combat([], Role, Args) -> {ok, Role, Args};
check_combat([min_lev | Rest],
             Role = #role{lev = RoleLev}, Args) ->
    case team:get_members(Role) of
        Members = [_ | _] ->
            Fun = fun (#team_mate{lev = MateLev}, RtnLev) ->
                          min(MateLev, RtnLev)
                  end,
            MinLev = lists:foldl(Fun, RoleLev, Members),
            check_combat(Rest, Role, Args#{min_lev => MinLev});
        _ -> check_combat(Rest, Role, Args#{min_lev => RoleLev})
    end;
check_combat([start_wave | Rest],
             Role = #role{m_exquisite_shelf =
                              #m_exquisite_shelf{wave = RoleWave}},
             Args = #{start_wave := StartWave}) ->
    case StartWave >= 7 of
        true when RoleWave < 6 ->
            {false, lang:get("您没有通过外阁的考验，无法挑战内阁")};
        _ -> check_combat(Rest, Role, Args)
    end;
check_combat([_ | Rest], Role, Args) ->
    check_combat(Rest, Role, Args).

start_combat(Role = #role{cross_type = CrossType,
                          m_exquisite_shelf =
                              #m_exquisite_shelf{shelf_id = ShelfId}},
             StartWave, MinLev) ->
    case team:get_fighters(Role) of
        {ok, Fighters} ->
            case exquisite_shelf_mgr:lookup_shelf_util(ShelfId,
                                                       CrossType)
                of
                {ok,
                 #exquisite_shelf_util{pid = ShelfPid, wave = Wave,
                                       lev = ShelfLev, wave_info = WaveInfo}} ->
                    CombatWave = case StartWave > 6 of
                                     _ when Wave > 6 -> StartWave;
                                     _ -> Wave
                                 end,
                    case lists:keyfind(Wave,
                                       #exquisite_shelf_wave_info.wave,
                                       WaveInfo)
                        of
                        #exquisite_shelf_wave_info{units = Units} ->
                            case lists:keyfind(Wave, 1, Units) of
                                {_, {_, BaseId}} ->
                                    CombatType = 63,
                                    CombatArgs = #combat_start_args{ext_args =
                                                                        [{shelf_id,
                                                                          ShelfId},
                                                                         {shelf_wave,
                                                                          {CombatWave,
                                                                           ShelfLev}},
                                                                         {shelf_pid,
                                                                          ShelfPid}]},
                                    logger:debug("战斗数据转化成功:~w",
                                                 [CombatArgs],
                                                 exquisite_shelf_role,
                                                 985),
                                    AttrArgs =
                                        exquisite_shelf_data:get_attr_ratio({StartWave,
                                                                             ShelfLev}),
                                    AttrArgRatio = case [AttrArg
                                                         || AttrArg = #{lev_min
                                                                            :=
                                                                            LevMin,
                                                                        lev_max
                                                                            :=
                                                                            LevMax}
                                                                <- AttrArgs,
                                                            MinLev >= LevMin
                                                                andalso
                                                                LevMax =<
                                                                    LevMax]
                                                       of
                                                       [_AttrArgRatio | _] ->
                                                           _AttrArgRatio;
                                                       _ -> #{}
                                                   end,
                                    UnitFighters = case
                                                       unit_convert:to(unit_base_id_to_fighter,
                                                                       BaseId)
                                                       of
                                                       {ok,
                                                        Fighter = #fighter{slave
                                                                               =
                                                                               Slave}} ->
                                                           NewSlave = [{I,
                                                                        N,
                                                                        O,
                                                                        R,
                                                                        {combat_fighter,
                                                                         treat_slave_attr,
                                                                         [AttrArgRatio]}}
                                                                       || {I,
                                                                           N,
                                                                           O,
                                                                           R}
                                                                              <- Slave],
                                                           logger:debug("旧随从:~w新随从:~w",
                                                                        [Slave,
                                                                         NewSlave],
                                                                        exquisite_shelf_role,
                                                                        994),
                                                           [Fighter#fighter{attr
                                                                                =
                                                                                {combat_fighter,
                                                                                 treat_unit_attr,
                                                                                 [AttrArgRatio]},
                                                                            slave
                                                                                =
                                                                                NewSlave}];
                                                       _R ->
                                                           logger:error("单位转换失败 [~w] ~w",
                                                                        [BaseId,
                                                                         _R],
                                                                        exquisite_shelf_role,
                                                                        997),
                                                           []
                                                   end,
                                    Star = case StartWave of
                                               7 -> 1;
                                               8 -> 2;
                                               9 -> 3;
                                               _ -> 0
                                           end,
                                    case Star of
                                        0 -> ok;
                                        _ ->
                                            Msg =
                                                notice:format(lang:get("队长选择了~ts星难度的内阁挑战"),
                                                              [{string_2,
                                                                1,
                                                                Star}]),
                                            team:notice(Role, Msg)
                                    end,
                                    combat_mgr:start_combat(CombatType,
                                                            Fighters,
                                                            UnitFighters,
                                                            CombatArgs),
                                    ok;
                                _ -> {false, lang:get("当前无法进行挑战, 错误的挑战层")}
                            end;
                        _ -> {false, lang:get("当前无法进行挑战, 错误的挑战层")}
                    end;
                _ -> {false, lang:get("当前无法进行挑战")}
            end;
        _Err ->
            logger:error("发起战斗失败:~w",
                         [_Err],
                         exquisite_shelf_role,
                         1025),
            {false, lang:get("发起战斗失败")}
    end.

is_complete_card(#exquisite_shelf_card_info{wave = Wave,
                                            type = 2, normal_card = NormalCard})
    when Wave =< 6 ->
    case lists:keymember(1,
                         #exquisite_shelf_card_item.is_get,
                         NormalCard)
        of
        true -> true;
        _ -> false
    end;
is_complete_card(#exquisite_shelf_card_info{wave = Wave,
                                            type = 3, normal_card = NormalCard,
                                            gold_card = GoldCard})
    when Wave =< 6 ->
    case lists:keymember(1,
                         #exquisite_shelf_card_item.is_get,
                         NormalCard)
        of
        true ->
            case lists:keymember(1,
                                 #exquisite_shelf_card_item.is_get,
                                 GoldCard)
                of
                true -> true;
                _ -> false
            end;
        _ -> false
    end;
is_complete_card(#exquisite_shelf_card_info{wave = Wave,
                                            type = 3, normal_card = NormalCard,
                                            gold_card = GoldCard})
    when Wave > 6 ->
    case [true
          || #exquisite_shelf_card_item{is_get = IsGet}
                 <- NormalCard,
             IsGet =:= 1]
        of
        GetFlags = [_ | _] when length(GetFlags) =:= 3 ->
            case lists:keymember(1,
                                 #exquisite_shelf_card_item.is_get,
                                 GoldCard)
                of
                true -> true;
                _ -> false
            end;
        _ -> false
    end;
is_complete_card(_Card) -> false.

today_flag(Lev) ->
    case agenda_data:get(2061) of
        #{max_leve := 0} -> true;
        #{max_leve := MaxLeve, args := Args,
          reset_time := ResetTime}
            when MaxLeve >= Lev ->
            Now = date:unixtime(),
            WeekDay = date:day_of_the_week(Now),
            WeekDayFive = date:day_of_the_week(Now - 5 * 3600),
            case Args of
                [] -> true;
                _ when ResetTime == 1 -> lists:member(WeekDay, Args);
                _ -> lists:member(WeekDayFive, Args)
            end;
        _ ->
            case agenda_data:get(2062) of
                #{args := Args, reset_time := ResetTime} ->
                    Now = date:unixtime(),
                    WeekDay = date:day_of_the_week(Now),
                    WeekDayFive = date:day_of_the_week(Now - 5 * 3600),
                    case Args of
                        [] -> true;
                        _ when ResetTime == 1 -> lists:member(WeekDay, Args);
                        _ -> lists:member(WeekDayFive, Args)
                    end;
                _ -> true
            end
    end.

create_card(Role, CardType, CardWave, ShelfLev) ->
    NormalCard = create_card_items(Role,
                                   2,
                                   CardWave,
                                   ShelfLev),
    GoldCard = create_card_items(Role,
                                 3,
                                 CardWave,
                                 ShelfLev),
    case CardType of
        2 ->
            #exquisite_shelf_card_info{wave = CardWave,
                                       shelf_lev = ShelfLev, type = CardType,
                                       normal_card = NormalCard};
        3 ->
            #exquisite_shelf_card_info{wave = CardWave,
                                       shelf_lev = ShelfLev, type = CardType,
                                       normal_card = NormalCard,
                                       gold_card = GoldCard};
        _ -> #exquisite_shelf_card_info{}
    end.

create_card_items(#role{lev = RoleLev,
                        classes = RoleClasses},
                  CardType = 3, CardWave, ShelfLev) ->
    CardRandList =
        exquisite_shelf_data:get_card_reward({CardWave,
                                              ShelfLev}),
    FilterCardList = [RC
                      || RC = #{type := RType, classes := Classes,
                                lev_min := LevMin, lev_max := LevMax}
                             <- CardRandList,
                         Classes =:= RoleClasses orelse Classes =:= 0,
                         RoleLev >= LevMin, RoleLev =< LevMax,
                         RType =:= CardType],
    RewardItem = case util:rand_list(FilterCardList, rate)
                     of
                     #{base_id := BaseId, num := Num,
                       is_notice := IsNotice} ->
                         [{BaseId, Num, IsNotice, 0}];
                     _ -> []
                 end,
    ShowItems = case util:rand_list_n(FilterCardList,
                                      show_rate,
                                      2)
                    of
                    ShowList = [_ | _] ->
                        [{BaseId, Num, 0, 1}
                         || #{base_id := BaseId, num := Num} <- ShowList];
                    _ -> []
                end,
    Items = util:shuffle(RewardItem ++ ShowItems),
    Fun = fun ({ItemId, Num, IsNotice, IsShow},
               {Index, Rtn}) ->
                  CardItem = #exquisite_shelf_card_item{index = Index,
                                                        item_id = ItemId,
                                                        num = Num,
                                                        is_notice = IsNotice,
                                                        is_show = IsShow},
                  {Index + 1, [CardItem | Rtn]}
          end,
    {_, CardItems} = lists:foldl(Fun, {1, []}, Items),
    CardItems;
create_card_items(#role{lev = RoleLev,
                        classes = RoleClasses},
                  CardType, CardWave, ShelfLev)
    when CardWave < 7 ->
    CardRandList =
        exquisite_shelf_data:get_card_reward({CardWave,
                                              ShelfLev}),
    FilterCardList = [RC
                      || RC = #{type := RType, classes := Classes,
                                lev_min := LevMin, lev_max := LevMax}
                             <- CardRandList,
                         Classes =:= RoleClasses orelse Classes =:= 0,
                         RoleLev >= LevMin, RoleLev =< LevMax,
                         RType =:= CardType],
    RewardItem = case util:rand_list(FilterCardList, rate)
                     of
                     #{base_id := BaseId, num := Num,
                       is_notice := IsNotice} ->
                         [{BaseId, Num, IsNotice, 0}];
                     _ -> []
                 end,
    ShowItems = case util:rand_list_n(FilterCardList,
                                      show_rate,
                                      2)
                    of
                    ShowList = [_ | _] ->
                        [{BaseId, Num, 0, 1}
                         || #{base_id := BaseId, num := Num} <- ShowList];
                    _ -> []
                end,
    Items = util:shuffle(RewardItem ++ ShowItems),
    Fun = fun ({ItemId, Num, IsNotice, IsShow},
               {Index, Rtn}) ->
                  CardItem = #exquisite_shelf_card_item{index = Index,
                                                        item_id = ItemId,
                                                        num = Num,
                                                        is_notice = IsNotice,
                                                        is_show = IsShow},
                  {Index + 1, [CardItem | Rtn]}
          end,
    {_, CardItems} = lists:foldl(Fun, {1, []}, Items),
    CardItems;
create_card_items(#role{lev = RoleLev,
                        classes = RoleClasses},
                  CardType, CardWave, ShelfLev) ->
    CardRandList =
        exquisite_shelf_data:get_card_reward({CardWave,
                                              ShelfLev}),
    FilterCardList = [RC
                      || RC = #{type := RType, classes := Classes,
                                lev_min := LevMin, lev_max := LevMax}
                             <- CardRandList,
                         Classes =:= RoleClasses orelse Classes =:= 0,
                         RoleLev >= LevMin, RoleLev =< LevMax,
                         RType =:= CardType],
    Items = case util:rand_list_n(FilterCardList, rate, 3)
                of
                List = [_ | _] ->
                    [{BaseId, Num, IsNotice, 0}
                     || #{base_id := BaseId, num := Num,
                          is_notice := IsNotice}
                            <- List];
                _ -> []
            end,
    Fun = fun ({ItemId, Num, IsNotice, IsShow},
               {Index, Rtn}) ->
                  CardItem = #exquisite_shelf_card_item{index = Index,
                                                        item_id = ItemId,
                                                        num = Num,
                                                        is_notice = IsNotice,
                                                        is_show = IsShow},
                  {Index + 1, [CardItem | Rtn]}
          end,
    {_, CardItems} = lists:foldl(Fun, {1, []}, Items),
    CardItems.

pop_card([]) -> {false, [], lang:get("您已经翻完了所有牌")};
pop_card([Card | LeftCard]) ->
    case is_complete_card(Card) of
        true -> pop_card(LeftCard);
        _ -> {ok, Card, LeftCard}
    end.

check_card([], _Card, Args) -> {true, Args};
check_card([card_type | T],
           Card = #exquisite_shelf_card_info{type = CardType},
           Args = #{get_type := GetType}) ->
    case CardType of
        2 when GetType =:= 3 ->
            Reason = lang:get("本轮翻牌不能进行钻石翻牌"),
            {false, Reason};
        _ -> check_card(T, Card, Args)
    end;
check_card([is_get | T],
           Card = #exquisite_shelf_card_info{wave = Wave,
                                             normal_card = NormalCard,
                                             gold_card = GoldCard},
           Args = #{get_type := GetType, role_wave := RoleWave}) ->
    case GetType of
        2 ->
            GetCount = length([true
                               || #exquisite_shelf_card_item{is_get = IsGet}
                                      <- NormalCard,
                                  IsGet =:= 1]),
            case Wave of
                _ when Wave =< 6 ->
                    case GetCount >= 1 of
                        true -> {false, lang:get("您已经翻过牌了")};
                        _ -> check_card(T, Card, Args)
                    end;
                _ ->
                    CanGetCount = get_can_card_num(RoleWave),
                    case GetCount of
                        3 -> {false, lang:get("您已经翻完牌了")};
                        _ when GetCount >= CanGetCount ->
                            {false, lang:get("挑战更高的星级难度可以继续翻牌"), 3};
                        _ -> check_card(T, Card, Args)
                    end
            end;
        3 ->
            case lists:keymember(1,
                                 #exquisite_shelf_card_item.is_get,
                                 GoldCard)
                of
                true -> {false, lang:get("您已经翻过牌了")};
                _ -> check_card(T, Card, Args)
            end;
        _ -> check_card(T, Card, Args)
    end;
check_card([order_get | T],
           Card = #exquisite_shelf_card_info{normal_card =
                                                 NormalCard,
                                             gold_card = GoldCard},
           Args = #{order := Order, get_type := GetType}) ->
    CardItems = case GetType of
                    2 -> NormalCard;
                    _ -> GoldCard
                end,
    case lists:keyfind(Order,
                       #exquisite_shelf_card_item.index,
                       CardItems)
        of
        #exquisite_shelf_card_item{is_get = 1} ->
            {false, lang:get("您已经翻过该牌了")};
        _ -> check_card(T, Card, Args)
    end;
check_card([_O | T], Card, Args) ->
    check_card(T, Card, Args).

get_can_card_num(7) -> 1;
get_can_card_num(8) -> 2;
get_can_card_num(9) -> 3;
get_can_card_num(_) -> 0.

get_card_gain(Card = #exquisite_shelf_card_info{wave =
                                                    Wave,
                                                normal_card = NormalCard},
              2, Order)
    when Wave >= 7 ->
    case lists:keyfind(Order,
                       #exquisite_shelf_card_item.index,
                       NormalCard)
        of
        CardItem = #exquisite_shelf_card_item{item_id = ItemId,
                                              is_get = 0, num = Num,
                                              is_notice = IsNotice} ->
            NewCardItem = CardItem#exquisite_shelf_card_item{is_get
                                                                 = 1},
            NewNormalCard = lists:keystore(Order,
                                           #exquisite_shelf_card_item.index,
                                           NormalCard,
                                           NewCardItem),
            NewCard = Card#exquisite_shelf_card_info{normal_card =
                                                         NewNormalCard},
            NewItemId = item_type:special_id(ItemId),
            {[{NewItemId, Num}], IsNotice, NewCard};
        _ -> {[], 0, #exquisite_shelf_card_info{}}
    end;
get_card_gain(Card =
                  #exquisite_shelf_card_info{normal_card = NormalCard},
              2, Order) ->
    case lists:keyfind(0,
                       #exquisite_shelf_card_item.is_show,
                       NormalCard)
        of
        CardItem = #exquisite_shelf_card_item{item_id = ItemId,
                                              is_get = 0, num = Num,
                                              is_notice = IsNotice} ->
            NewCardItem = CardItem#exquisite_shelf_card_item{is_get
                                                                 = 1,
                                                             index = Order},
            NewNormalCard = lists:keystore(0,
                                           #exquisite_shelf_card_item.is_show,
                                           NormalCard,
                                           NewCardItem),
            NewCard = Card#exquisite_shelf_card_info{normal_card =
                                                         NewNormalCard},
            NewItemId = item_type:special_id(ItemId),
            {[{NewItemId, Num}], IsNotice, NewCard};
        _ -> {[], 0, #exquisite_shelf_card_info{}}
    end;
get_card_gain(Card =
                  #exquisite_shelf_card_info{gold_card = GoldCard},
              3, Order) ->
    case lists:keyfind(0,
                       #exquisite_shelf_card_item.is_show,
                       GoldCard)
        of
        CardItem = #exquisite_shelf_card_item{item_id = ItemId,
                                              is_get = 0, num = Num,
                                              is_notice = IsNotice} ->
            NewCardItem = CardItem#exquisite_shelf_card_item{is_get
                                                                 = 1,
                                                             index = Order},
            NewGoldCard = lists:keystore(0,
                                         #exquisite_shelf_card_item.is_show,
                                         GoldCard,
                                         NewCardItem),
            NewCard = Card#exquisite_shelf_card_info{gold_card =
                                                         NewGoldCard},
            NewItemId = item_type:special_id(ItemId),
            {[{NewItemId, Num}], IsNotice, NewCard};
        _ -> {[], 0, #exquisite_shelf_card_info{}}
    end;
get_card_gain(Card, _, _) -> {[], 0, Card}.

check_skip(#exquisite_shelf_card_info{wave = Wave,
                                      normal_card = NormalCard = [_ | _]},
           RoleWave)
    when Wave >= 7 ->
    case length([true
                 || #exquisite_shelf_card_item{is_get = IsGet}
                        <- NormalCard,
                    IsGet =:= 1])
        of
        3 -> skip;
        GetCount ->
            CanGetCount = get_can_card_num(RoleWave),
            case CanGetCount > GetCount of
                true -> open;
                _ -> put_last
            end
    end;
check_skip(#exquisite_shelf_card_info{normal_card =
                                          NormalCard = [_ | _]},
           _RoleWave) ->
    case lists:keymember(1,
                         #exquisite_shelf_card_item.is_get,
                         NormalCard)
        of
        true -> skip;
        _ -> open
    end;
check_skip(_Card, _RoleWave) -> skip.

