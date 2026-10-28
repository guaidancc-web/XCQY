-file("src/mod/family/family_logic.erl", 1).

-module(family_logic).

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

-file("src/mod/family/family_logic.erl", 12).

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

-file("src/mod/family/family_logic.erl", 13).

-file("inc/family.hrl", 1).

-record(beans_reward,
        {id = 0,
         giver_id = {0, "", 0},
         giver_name = "",
         belong_id = {0, "", 0},
         pos = {0, 0},
         give_time = 0}).

-record(magic_beans,
        {ver = 2,
         growth = 0 :: non_neg_integer(),
         flower_num = 0 :: non_neg_integer(),
         wake_time = 0 :: non_neg_integer(),
         event_record = [],
         fosters = [],
         inviters = [],
         beans_rewards = [],
         next_beanrw_id = 0}).

-record(family_info,
        {ver = 5 :: pos_integer(),
         id = {0, "", 0},
         master_id = {0, "", 0},
         master_name = "",
         master_classes = 0 :: pos_integer(),
         master_lev = 1 :: pos_integer(),
         master_sex = 0 :: 0..2,
         lover_id = {0, "", 0},
         lover_name = "",
         pid :: undefined | pid(),
         house_info = undefined,
         yard_info = undefined,
         visitor = [],
         last_visit_time = 0,
         visit_lock = 1,
         last_rf_time = 0,
         magic_beans = #magic_beans{},
         battle_id}).

-record(furnishing,
        {id = 0 :: non_neg_integer(),
         base_id = 0,
         num = 1,
         status = 1,
         belong = {0, "", 0},
         pos = {1, 1, 1, 1} :: tuple(),
         dir = 0 :: 0..1}).

-record(house_info,
        {ver = 3 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         env_val = 0,
         lev = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer(),
         bdg_info = [] :: list(),
         furishing_max_lev_info = [] :: list(),
         next_fur_id = 1,
         cleanness = 100,
         last_clean_time = 0,
         housekeeper_action_times = 0,
         is_upgrade_bdg = []}).

-record(building_info, {type = 1, lev = 0, exp = 0}).

-record(yard_info,
        {ver = 1 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         levl = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer()}).

-record(family_store,
        {ver = 1,
         next_time = 0 :: non_neg_integer(),
         goods_list = []}).

-record(m_family,
        {ver = 1,
         cur_id = {0, "", 0},
         pid :: undefined | pid(),
         idle_family = {0, "", 0},
         family_store = #family_store{},
         family_effect = [],
         effect_use_info = []}).

-record(family_pet_train_info,
        {id = 1, pet_id = 0, end_time = 0}).

-record(fshop_item,
        {id = 0,
         store_type = 1,
         base_id = 0,
         type = 90000,
         val = 0,
         count = 1}).

-record(family_child,
        {id = {0, "", 0},
         name = "",
         classes = 0 :: pos_integer(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         stage = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         unit_id = {0, 0},
         unit_base_id = 0}).

-file("src/mod/family/family_logic.erl", 14).

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

-file("src/mod/family/family_logic.erl", 15).

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

-file("src/mod/family/family_logic.erl", 16).

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

-file("src/mod/family/family_logic.erl", 17).

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

-file("src/mod/family/family_logic.erl", 18).

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

-file("src/mod/family/family_logic.erl", 19).

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

-file("src/mod/family/family_logic.erl", 20).

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

-file("src/mod/family/family_logic.erl", 21).

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

-file("src/mod/family/family_logic.erl", 22).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/family/family_logic.erl", 23).

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

-file("src/mod/family/family_logic.erl", 24).

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

-file("src/mod/family/family_logic.erl", 25).

-file("inc/guild.hrl", 1).

-type guild_id() :: {non_neg_integer(),
                     list(),
                     non_neg_integer()}.

-record(guild_apply,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 1,
         time = 0,
         type = 0,
         looks = [],
         cup = 0 :: non_neg_integer(),
         donation = 0 :: non_neg_integer(),
         tag = 0 :: non_neg_integer(),
         msg = "" :: string()}).

-record(guild_envelop,
        {ver = 1,
         title = "" :: string(),
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list()}).

-record(guild_role,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..4,
         lev = 1 :: pos_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         fc = 1 :: pos_integer(),
         synth_fc = 1 :: pos_integer(),
         post = 0 :: 0..5,
         status = 0 :: 0 | 1,
         last_login = 1 :: pos_integer(),
         last_logout = 1 :: pos_integer(),
         enter_time = 0 :: non_neg_integer(),
         signature = "" :: list(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         cup = 0 :: non_neg_integer(),
         looks = [],
         envelope = #guild_envelop{},
         requirement = [],
         signed = 0 :: non_neg_integer(),
         last_signed = 0 :: non_neg_integer(),
         mails = [],
         active = 0,
         ability = 0,
         chat_num = 0,
         doing = 0,
         chat_num_list = [],
         doing_list = [],
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list()}).

-record(guild_leaver,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         guild_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         value = 0,
         total_value = 0 :: non_neg_integer(),
         time = 0 :: integer()}).

-record(guild_boss,
        {lev = 1 :: non_neg_integer(),
         step = 1 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         name = "",
         hp = 0 :: non_neg_integer(),
         hp_max = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         called = 0 :: integer(),
         log = [] :: list(),
         last_renamed = 0 :: non_neg_integer()}).

-record(guild_mercenary,
        {id = {0, "", 0},
         key :: undefined | tuple(),
         lev = 0 :: non_neg_integer(),
         name = "" :: string(),
         dispatched = 0 :: non_neg_integer(),
         recruited = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         gain = [],
         guard :: undefined | tuple()}).

-record(guild_totem,
        {ver = 0 :: non_neg_integer(),
         id = util:rand_list([101, 102, 103, 104, 105]) ::
             non_neg_integer(),
         changeable = 1 :: non_neg_integer(),
         last_changed = 0 :: non_neg_integer()}).

-record(guild_question_answer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         guild_name = "" :: string(),
         option = 0 :: 0..4,
         result = 0 :: 0 | 1,
         score = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         totem_id = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(guild_question,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: [#guild_question_answer{}],
         cheat_off = [],
         asked_num = 0 :: non_neg_integer(),
         cheat_nums = []}).

-record(guild_robber,
        {ver = 0 :: non_neg_integer(),
         id :: undefined | tuple(),
         today_generated = 0 :: non_neg_integer(),
         gen_hour = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         fighters = [],
         picker = []}).

-record(guild_treasure,
        {ver = 1 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         setting_chance = 0 :: non_neg_integer(),
         setting_time = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         generated = 0 :: non_neg_integer(),
         unit_num = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         can_open = 0 :: 0,
         fighters = [],
         picker = [],
         type = win}).

-record(guild_loot,
        {ver = 0, items = [], log = [], allocated = []}).

-record(guild_usurper,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_invitation,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 0,
         ctime = 0 :: integer(),
         guild_id :: undefined | tuple(),
         guild_name = "" :: string()}).

-record(guild_plant_irrigator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_plant,
        {ver = 0,
         pos = {0, 0},
         owner_rid = {0, "", 0},
         owner_name = "",
         irrigations = [],
         phase = 0,
         sowed = 0,
         matured = 0,
         fired = 0 :: 0 | 1,
         unit_id = {0, 0},
         unit_base_id = 0}).

-record(guild_union_apply,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         leader_id = {0, "", 0},
         leader_name = "" :: string(),
         ctime = 0 :: integer()}).

-record(guild_campaign,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list()}).

-record(guild_camp_web,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list()}).

-record(element_info,
        {ver = 1, build_type = 0, lev = 1, time = 0}).

-record(guild,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         ver = 21 :: non_neg_integer(),
         name = "" :: list(),
         assets = 5000000,
         max_assets = 5000000,
         upkeep = 0,
         pid :: undefined | pid(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         leader_sex = 0 :: 0 | 1,
         leader_classes = 0 :: 0..6,
         leader_lev = 0 :: non_neg_integer(),
         members = [] :: [#guild_role{}],
         mem_num = 0 :: non_neg_integer(),
         fresh_num = 0 :: non_neg_integer(),
         max_mem_num = 90,
         max_fresh_num = 100,
         board = "" :: list(),
         health = 100,
         join_type = 2,
         join_condition = [],
         apply_list = [],
         event_list = [],
         lev = 1 :: pos_integer(),
         lev_time = 0 :: non_neg_integer(),
         academy_lev = 0 :: non_neg_integer(),
         academy_time = 0 :: non_neg_integer(),
         store_lev = 0 :: non_neg_integer(),
         store_time = 0 :: non_neg_integer(),
         exchequer_lev = 0 :: non_neg_integer(),
         exchequer_time = 0 :: non_neg_integer(),
         lev_ref :: undefined | reference(),
         welfare_time = 0,
         welfare_list = [],
         store_tick_time = 0,
         store_list = [],
         create_time = 0,
         flag = 0,
         map_pid = 0,
         map_id = 0,
         boss = #guild_boss{},
         mercenarys = [] :: [#guild_mercenary{}],
         totem = #guild_totem{} :: #guild_totem{},
         question = #guild_question{},
         robber_num = 0 :: non_neg_integer(),
         robber_total_num = 0 :: non_neg_integer(),
         usurpers = [],
         activity = 0,
         plants = [],
         announcement = "" :: string(),
         union_applys = [] :: list(),
         union_applied = [] :: list(),
         today_used_medal = 0 :: integer(),
         last_medal_used = 0 :: integer(),
         today_upgraded_build = 0 :: integer(),
         last_build_upgraded = 0 :: integer(),
         today_destory_build = 0 :: integer(),
         last_build_destory = 0 :: integer(),
         treasure = #guild_treasure{},
         loot = #guild_loot{},
         week_assets = 0 :: integer(),
         formalizing_lev = 35 :: integer(),
         name_used = "" :: string(),
         create_id = {0, "", 0},
         create_name = "",
         guild_camp = #guild_campaign{},
         guild_camp_web = #guild_camp_web{},
         max_chat_num = 0,
         max_doing = 0,
         max_fc = 0,
         max_synth_fc = 0,
         element_info = [],
         uplev_element_times = 0,
         last_uplev_element = 0,
         upgrade_element_time = 0,
         mail_list = [],
         limit_mode = 0,
         is_lock_board = 0,
         board_id = {0, "", 0},
         announce_id = {0, "", 0}}).

-record(guild_element_attr,
        {ver = 1,
         effect_obj = 1,
         attr = [],
         attr_snd = [],
         add_skill_list = [],
         high_attr = [],
         end_time = 0}).

-record(m_guild,
        {ver = 3 :: pos_integer(),
         id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         pid :: undefined | pid(),
         enter_time = 0,
         guild_lev = 1,
         post = 0 :: non_neg_integer(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         signature = "" :: list(),
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list(),
         build_speed_num = 0 :: non_neg_integer()}).

-record(guild_emblem,
        {ver = 0, id = 0, type = 0, lev = 0}).

-record(m_guild_emblem,
        {ver = 0 :: non_neg_integer(),
         remain_point = 0 :: non_neg_integer(),
         total_point = 0 :: non_neg_integer(),
         emblems = []}).

-file("src/mod/family/family_logic.erl", 26).

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

-file("src/mod/family/family_logic.erl", 27).

-export([init/0,
         login/1,
         logout/1,
         delay_login/1,
         push_11200/1,
         push_11213/1,
         push_11217/1,
         push_11220/1,
         push_11221/1,
         push_11225/1,
         push_11206/1,
         create/1,
         enter/2,
         leave/1,
         enter_callback/4,
         leave_callback/3,
         set_out_furnishing/4,
         get_back_furnishing/2,
         get_back_all_furnishing/1,
         add_frunishing/3,
         upgrade_bdg/2,
         destory_building/2,
         update_family_effect_push/3,
         edit_furnishing/2,
         train_pet/3,
         clean_train_cd/2,
         family_sleep/1,
         family_eat/1,
         get_medicine_skill/1,
         set_family_lock/2,
         is_can_visit/2,
         query_family_info/2,
         house_keeper_clean/1,
         foster_magic_bean/2,
         get_magic_beans_reward/1,
         invite_beans_reward/2,
         house_keeper_foster/1,
         get_beans_invite_reward/2,
         join_to_follow/2,
         up_lev_house/1,
         get_env_effect/2,
         go_home/1,
         visit_role_family/2,
         check_map_blocked/2,
         apply_enter/2,
         sell_furnishing/3,
         check_can_sell/4]).

init() -> #m_family{}.

login(Role = #role{lev = Lev,
                   m_family = #m_family{cur_id = FamilyId}})
    when FamilyId =/= {0, "", 0} ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{furishing_max_lev_info = FurMaxLevInfo,
                                     bdg_info = BdgInfo}} ->
            family_mgr:update_role(Role, Lev),
            update_family_effect(Role, FurMaxLevInfo, BdgInfo);
        _ -> ok
    end;
login(_) -> ok.

logout(Role = #role{s_event = 28}) -> leave(Role);
logout(_Role) -> ok.

delay_login(#role{id = RoleId}) ->
    case family_mgr:info(by_master, RoleId) of
        FamilyInfo = #family_info{house_info =
                                      #house_info{bdg_info = BdgInfo}} ->
            family:sync_trigger(evt_family, FamilyInfo, #{}),
            family:sync_trigger(evt_family_env, FamilyInfo, #{}),
            [family:sync_trigger(evt_family_update,
                                 FamilyInfo,
                                 #{type => BdgType})
             || #building_info{type = BdgType} <- BdgInfo],
            family:sync_trigger(evt_family_furnishing,
                                FamilyInfo,
                                #{}),
            ok;
        _ -> ok
    end;
delay_login(_) -> ok.

push_11200(Role = #role{id = RoleId}) ->
    case family_mgr:visit_family(RoleId) of
        FamilyInfo = #family_info{} ->
            logger:debug("========:~w",
                         [FamilyInfo],
                         family_logic,
                         112),
            push_11200(Role, FamilyInfo);
        false -> ok
    end.

push_11200(Role, FamilyInfo) ->
    role:link_send(Role, 11200, {FamilyInfo}),
    ok.

push_11206(Role = #role{m_family =
                            #m_family{cur_id = FamilyId}}) ->
    role:link_send(Role, 11206, {FamilyId}).

push_11213(Role = #role{m_family =
                            #m_family{cur_id = FamilyId}}) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{bdg_info = BdgInfo}} ->
            role:link_send(Role, 11213, {BdgInfo});
        _ -> ok
    end.

push_11217(Role = #role{m_family =
                            #m_family{family_effect = EffectInfo}}) ->
    role:link_send(Role, 11217, {EffectInfo}),
    ok.

push_11220(Role = #role{m_family =
                            #m_family{effect_use_info = UseInfo}}) ->
    TrainInfo = case lists:keyfind(1, 1, UseInfo) of
                    {_, UseTrainInfo} -> UseTrainInfo;
                    false -> []
                end,
    role:link_send(Role, 11220, {TrainInfo}),
    ok.

push_11221(Role) ->
    TrainPetTimes = var:get_var(Role, day, 53, 0),
    EatTimes = var:get_var(Role, day, 54, 0),
    SleepTimes = var:get_var(Role, day, 55, 0),
    UseInfo = [{53, TrainPetTimes},
               {54, EatTimes},
               {55, SleepTimes}],
    role:link_send(Role, 11221, {UseInfo}),
    ok.

push_11225(Role = #role{m_family =
                            #m_family{cur_id = FamilyId}}) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{magic_beans = MagicBeans} ->
            role:link_send(Role, 11225, {MagicBeans}),
            ok;
        _ -> ok
    end.

create(#role{lev = Lev}) when Lev < 55 ->
    {false, lang:get("您的等级未达到55级,不能建造家园")};
create(Role = #role{id = Rid, name = Name,
                    classes = Classes, sex = Sex, lev = Lev,
                    m_family = MFamily}) ->
    case family_mgr:query_role_family_id(Rid) of
        false ->
            BdgLevInfo = case family_data:get_init_space() of
                             InitBdgInfo when is_list(InitBdgInfo) ->
                                 init_bdg_info(InitBdgInfo);
                             false -> []
                         end,
            case check_space_use(BdgLevInfo, 1) of
                true ->
                    Cost = family_data:get_create_cost(),
                    CreateLoss = format:val_to_loss(Cost),
                    case role_gain:do_notice(CreateLoss, Role) of
                        {ok, LossRole} ->
                            case case catch gen_server:call(family_mgr,
                                                            {create,
                                                             Rid,
                                                             Name,
                                                             Classes,
                                                             Lev,
                                                             Sex,
                                                             BdgLevInfo},
                                                            10000)
                                     of
                                     {'EXIT', {timeout, _}} -> {error, timeout};
                                     {'EXIT', {noproc, _}} -> {error, noproc};
                                     {'EXIT', {normal, _}} -> {error, exit};
                                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                                     _Call_Return -> _Call_Return
                                 end
                                of
                                {true, FamilyId, FamilyPid} ->
                                    log:family(Role, lang:get("创建"), FamilyId),
                                    FamilyRole = LossRole#role{m_family =
                                                                   MFamily#m_family{cur_id
                                                                                        =
                                                                                        FamilyId,
                                                                                    pid
                                                                                        =
                                                                                        FamilyPid}},
                                    StoreRole =
                                        family_shop:open_store(FamilyRole),
                                    push_11206(FamilyRole),
                                    case wedding:lover(Rid) of
                                        {ok,
                                         #lover{lover_id = LoverId,
                                                status = 3}} ->
                                            case role_query:pid(by_id, LoverId)
                                                of
                                                {ok, LoverPid}
                                                    when is_pid(LoverPid) ->
                                                    role:apply(async,
                                                               LoverPid,
                                                               {wedding,
                                                                update_family,
                                                                [FamilyId]}),
                                                    ok;
                                                _ -> skip
                                            end;
                                        _ -> skip
                                    end,
                                    NoticeMsg =
                                        notice:format(lang:get("~ts在管家小暖处购置了~ts一座，开启了温馨的游戏居住生活{face_1,18}"),
                                                      [{role_2, Name},
                                                       {string_2,
                                                        1,
                                                        lang:get("家园房屋")}]),
                                    notice:cast(all, 5, NoticeMsg),
                                    {ok, StoreRole};
                                {false, ReaSon} -> {false, ReaSon}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        _ -> {false, lang:get("您的资源不足，不能进行建造")}
                    end;
                false -> {false, lang:get("您设定的建造计划超出房间最大空间，不能进行建造")}
            end;
        OldFamilyId ->
            {ok,
             Role#role{m_family =
                           MFamily#m_family{cur_id = OldFamilyId}}}
    end.

go_home(Role = #role{id = RoleId,
                     m_family = #m_family{cur_id = FamilyId}}) ->
    case family_mgr:query_role_family_id(RoleId) of
        false -> {false, lang:get("您还未拥有家园，请继续努力哦")};
        FamilyId -> enter(Role, FamilyId);
        RealFamilyId ->
            case enter(Role, RealFamilyId) of
                {false, Reason} -> {false, Reason};
                {ok, EnterRole = #role{m_family = MFamily}} ->
                    NewRole = EnterRole#role{m_family =
                                                 MFamily#m_family{cur_id =
                                                                      RealFamilyId}},
                    push_11206(NewRole),
                    {ok, NewRole}
            end
    end.

enter(Role = #role{s_event = SelfEvent, id = RoleId,
                   pid = RolePid, name = Name},
      FamilyId) ->
    case check_enter_area(Role, FamilyId) of
        {true, ToPos} ->
            logger:debug("玩家的状态为:~w",
                         [SelfEvent],
                         family_logic,
                         241),
            case SelfEvent of
                28 -> family_mgr ! {leave, RoleId};
                _ -> skip
            end,
            EnterRole = Role#role{s_event = 28},
            TeamEvt = make_team_evt(EnterRole, FamilyId),
            case map:role_enter(ToPos, TeamEvt, EnterRole) of
                {error, Reason} ->
                    logger:error("[~w]进入家园失败:~w, 进入坐标:~w",
                                 [Name, Reason, ToPos],
                                 family_logic,
                                 251),
                    {false, lang:get("进入家园失败")};
                {ok, NewRole} ->
                    family_mgr ! {enter, RoleId, RolePid, FamilyId},
                    {ok, NewRole}
            end;
        {false, Reason} -> {false, Reason}
    end.

apply_enter(Role = #role{s_event = SelfEvent,
                         id = RoleId, pid = RolePid},
            FamilyId) ->
    case check_enter_area(Role, FamilyId) of
        {true, ToPos} ->
            logger:debug("玩家的状态为:~w",
                         [SelfEvent],
                         family_logic,
                         266),
            case SelfEvent of
                28 -> family_mgr ! {leave, RoleId};
                _ -> skip
            end,
            EnterRole = Role#role{s_event = 28},
            TeamEvt = make_team_evt(EnterRole, FamilyId),
            case map:role_enter(ToPos, TeamEvt, EnterRole) of
                {ok, NewRole} ->
                    family_mgr ! {enter, RoleId, RolePid, FamilyId},
                    {ok, NewRole};
                _ -> ok
            end;
        _ -> ok
    end.

visit_role_family(Role = #role{}, VisitRoleId) ->
    case family_mgr:query_role_family_id(VisitRoleId) of
        false -> {false, lang:get("您的好友目前暂时未建造家园")};
        FamilyId -> enter(Role, FamilyId)
    end.

join_to_follow(Role = #role{s_event = SelfEvent,
                            id = RoleId, pid = RolePid},
               LeaderId) ->
    case family_mgr:where(LeaderId) of
        false -> ok;
        FamilyId ->
            case SelfEvent of
                28 -> family_mgr ! {leave, RoleId};
                _ -> skip
            end,
            family_mgr ! {enter, RoleId, RolePid, FamilyId},
            {ok, Role#role{s_event = 28}}
    end;
join_to_follow(_, _) -> ok.

up_lev_house(Role = #role{m_family =
                              #m_family{cur_id = FamilyId}}) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{env_val = Env, lev = HouseLev}} ->
            case family_data:get_house_lev(Env) of
                CanLev when is_integer(CanLev) ->
                    case HouseLev < CanLev of
                        true ->
                            case family_data:get_upgrade_house_cost(HouseLev +
                                                                        1)
                                of
                                Cost = [_ | _] ->
                                    Loss = format:val_to_loss(Cost),
                                    case role_gain:do_notice(Loss, Role) of
                                        {ok, LossRole} ->
                                            case case catch
                                                          gen_server:call(family_mgr,
                                                                          {up_lev_house,
                                                                           FamilyId},
                                                                          10000)
                                                     of
                                                     {'EXIT', {timeout, _}} ->
                                                         {error, timeout};
                                                     {'EXIT', {noproc, _}} ->
                                                         {error, noproc};
                                                     {'EXIT', {normal, _}} ->
                                                         {error, exit};
                                                     {'EXIT', _Call_Err} ->
                                                         {error, _Call_Err};
                                                     _Call_Return ->
                                                         _Call_Return
                                                 end
                                                of
                                                true ->
                                                    log:family(Role,
                                                               lang:get("扩建"),
                                                               FamilyId),
                                                    {ok, LossRole};
                                                {false, Reason} ->
                                                    {false, Reason};
                                                _Else ->
                                                    logger:error("升级家园失败:~w",
                                                                 [_Else],
                                                                 family_logic,
                                                                 328),
                                                    {false, lang:get("升级家园失败")}
                                            end;
                                        {false, #loss{msg = Msg}} ->
                                            {false, Msg};
                                        _ -> {false, lang:get("资源不足")}
                                    end;
                                _ ->
                                    case case catch gen_server:call(family_mgr,
                                                                    {up_lev_house,
                                                                     FamilyId},
                                                                    10000)
                                             of
                                             {'EXIT', {timeout, _}} ->
                                                 {error, timeout};
                                             {'EXIT', {noproc, _}} ->
                                                 {error, noproc};
                                             {'EXIT', {normal, _}} ->
                                                 {error, exit};
                                             {'EXIT', _Call_Err} ->
                                                 {error, _Call_Err};
                                             _Call_Return -> _Call_Return
                                         end
                                        of
                                        true ->
                                            log:family(Role,
                                                       lang:get("扩建"),
                                                       FamilyId),
                                            ok;
                                        {false, Reason} -> {false, Reason};
                                        _Else ->
                                            logger:error("升级家园失败:~w",
                                                         [_Else],
                                                         family_logic,
                                                         341),
                                            {false, lang:get("升级家园失败")}
                                    end
                            end;
                        false -> {false, lang:get("繁华度未达到要求哦，置购更多的家具能提升繁华度")}
                    end;
                false -> {false, lang:get("您的家园已经达到了最大等级，无法进行升级了")}
            end;
        _ -> {false, lang:get("您还未拥有家园呢，继续努力哦")}
    end.

-spec leave(#role{}) -> {ok, NewRole :: #role{}} |
                        {false, Reason :: bitstring()}.

leave(Role = #role{id = RoleId, s_event = 28}) ->
    case team:get_status(Role) of
        {true, 2} -> ok;
        _ ->
            LeaveRole = Role#role{s_event = 0},
            TeamEvt = make_team_evt(LeaveRole, RoleId),
            logger:debug("离开家园事件:~w", [TeamEvt], family_logic, 360),
            case map:role_enter({10001, 3020, 1580},
                                TeamEvt,
                                LeaveRole)
                of
                {ok, NewRole} ->
                    family_mgr ! {leave, RoleId},
                    {ok, NewRole};
                _Err ->
                    logger:error("退出家园失败:~w", [_Err], family_logic, 366),
                    {false, lang:get("退出失败")}
            end
    end;
leave(_Role) -> ok.

enter_callback(_,
               Role = #role{s_event = Event, id = RoleId,
                            pid = RolePid},
               _, FamilyId) ->
    case Event of
        28 -> family_mgr ! {leave, RoleId};
        _ -> skip
    end,
    family_mgr ! {enter, RoleId, RolePid, FamilyId},
    {ok, Role}.

leave_callback(_, Role = #role{id = RoleId}, _) ->
    family_mgr ! {leave, RoleId},
    {ok, Role}.

set_out_furnishing(#role{s_event = 28,
                         m_family = #m_family{cur_id = FamilyId},
                         pos = #pos{map = MapId}},
                   FurnishingId, ToPos, Dir) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{map_id = MapId,
                                     furnishings = Furnishings}} ->
            case lists:keyfind(FurnishingId,
                               #furnishing.id,
                               Furnishings)
                of
                #furnishing{base_id = BaseId} ->
                    case family_data:get_furnishing(BaseId) of
                        #{type := Type}
                            when Type =/= 15 andalso
                                     Dir =/= 1 andalso
                                         Dir =/= 3 andalso
                                             Dir =/= 5 andalso Dir =/= 7 ->
                            {false, lang:get("非法的摆放位置")};
                        _ ->
                            case family:get_furnishing_block(BaseId, ToPos, Dir)
                                of
                                RegionBlocks = [_ | _] ->
                                    logger:debug("家具占地点:~w",
                                                 [RegionBlocks],
                                                 family_logic,
                                                 401),
                                    case check_map_blocked(MapId, RegionBlocks)
                                        of
                                        true -> {false, lang:get("非法的摆放位置")};
                                        false ->
                                            case case catch
                                                          gen_server:call(family_mgr,
                                                                          {set_out_furnishing,
                                                                           FamilyId,
                                                                           FurnishingId,
                                                                           ToPos,
                                                                           Dir},
                                                                          10000)
                                                     of
                                                     {'EXIT', {timeout, _}} ->
                                                         {error, timeout};
                                                     {'EXIT', {noproc, _}} ->
                                                         {error, noproc};
                                                     {'EXIT', {normal, _}} ->
                                                         {error, exit};
                                                     {'EXIT', _Call_Err} ->
                                                         {error, _Call_Err};
                                                     _Call_Return ->
                                                         _Call_Return
                                                 end
                                                of
                                                {false, Reason} ->
                                                    {false, Reason};
                                                {true, NoticeMsg} ->
                                                    notice:return(NoticeMsg);
                                                _Err ->
                                                    logger:error("摆放家具错误:~w",
                                                                 [_Err],
                                                                 family_logic,
                                                                 410),
                                                    ok
                                            end
                                    end;
                                _ ->
                                    case case catch gen_server:call(family_mgr,
                                                                    {set_out_furnishing,
                                                                     FamilyId,
                                                                     FurnishingId,
                                                                     ToPos,
                                                                     Dir},
                                                                    10000)
                                             of
                                             {'EXIT', {timeout, _}} ->
                                                 {error, timeout};
                                             {'EXIT', {noproc, _}} ->
                                                 {error, noproc};
                                             {'EXIT', {normal, _}} ->
                                                 {error, exit};
                                             {'EXIT', _Call_Err} ->
                                                 {error, _Call_Err};
                                             _Call_Return -> _Call_Return
                                         end
                                        of
                                        {false, Reason} -> {false, Reason};
                                        {true, NoticeMsg} ->
                                            notice:return(NoticeMsg);
                                        _Err ->
                                            logger:error("摆放家具错误:~w",
                                                         [_Err],
                                                         family_logic,
                                                         419),
                                            ok
                                    end
                            end
                    end;
                _ -> {false, lang:get("错误的家具，不能进行摆放")}
            end;
        _ -> {false, lang:get("不能远程进行摆放")}
    end;
set_out_furnishing(_, _, _, _) ->
    {false, lang:get("不能远程进行摆放")}.

edit_furnishing(#role{s_event = 28,
                      m_family = #m_family{cur_id = FamilyId}},
                FurnishingId) ->
    family_mgr ! {edit_furnishing, FamilyId, FurnishingId};
edit_furnishing(_, _) -> {false, lang:get("不能远程进行摆放")}.

get_back_furnishing(#role{s_event = 28,
                          m_family = #m_family{cur_id = FamilyId},
                          pos = #pos{map = CurMapId}},
                    FurnishingId) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{map_id = CurMapId,
                                     furnishings = Furnishings}} ->
            case lists:keyfind(FurnishingId,
                               #furnishing.id,
                               Furnishings)
                of
                #furnishing{base_id = BaseId} ->
                    case family_data:get_furnishing(BaseId) of
                        #{name := FurName} ->
                            Msg = notice:format(lang:get("收回了一个~ts"),
                                                [{string_2, 5, FurName}]),
                            notice:return(Msg),
                            family_mgr !
                                {get_back_furnishing, FamilyId, FurnishingId},
                            ok;
                        _ -> {false, lang:get("家具配置不存在")}
                    end;
                _ -> {false, lang:get("不存在的家具，无法收回")}
            end;
        _ -> {false, lang:get("您不在家园中，不能进行收回家具")}
    end;
get_back_furnishing(_, _) -> ok.

get_back_all_furnishing(#role{s_event = 28,
                              m_family = #m_family{cur_id = FamilyId},
                              pos = #pos{map = CurMapId}}) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{map_id = CurMapId}} ->
            family_mgr ! {get_back_all_furnishing, FamilyId},
            ok;
        _ -> {false, lang:get("您不在家园中，不能进行收回家具")}
    end;
get_back_all_furnishing(_) -> ok.

train_pet(Role = #role{m_family =
                           MFamily = #m_family{effect_use_info = UseInfo,
                                               family_effect = EffectInfo},
                       m_pet = #m_pet{pets = Pets}},
          PetId, TrainId) ->
    case do_train_check([cleanness,
                         open,
                         is_use,
                         training,
                         pet_lev],
                        Role,
                        PetId,
                        TrainId)
        of
        true ->
            case lists:keyfind(11, 1, EffectInfo) of
                {_, Times} ->
                    TrainTimes = var:get_var(Role, day, 53, 0),
                    case TrainTimes < Times of
                        true ->
                            case calc_train_pet_exp(Role, PetId) of
                                {false, ReaSon} -> {false, ReaSon};
                                {true, AddExpVal} ->
                                    VarRole = var:add_var(Role, day, 53, 1),
                                    case lists:keyfind(PetId, #pet.id, Pets) of
                                        GetPet = #pet{} ->
                                            case pet:add_exp(VarRole,
                                                             #{mode => GetPet,
                                                               val => AddExpVal,
                                                               limit => 1})
                                                of
                                                {ok, PetRole} ->
                                                    Now = date:unixtime(),
                                                    TrainInfo =
                                                        #family_pet_train_info{id
                                                                                   =
                                                                                   TrainId,
                                                                               pet_id
                                                                                   =
                                                                                   PetId,
                                                                               end_time
                                                                                   =
                                                                                   Now
                                                                                       +
                                                                                       1200},
                                                    NewTrainInfo = case
                                                                       lists:keyfind(1,
                                                                                     1,
                                                                                     UseInfo)
                                                                       of
                                                                       {_,
                                                                        TrainInfoList} ->
                                                                           lists:keystore(TrainId,
                                                                                          #family_pet_train_info.id,
                                                                                          TrainInfoList,
                                                                                          TrainInfo);
                                                                       false ->
                                                                           [TrainInfo]
                                                                   end,
                                                    NewUseInfo =
                                                        lists:keystore(1,
                                                                       1,
                                                                       UseInfo,
                                                                       {1,
                                                                        NewTrainInfo}),
                                                    NewRole =
                                                        PetRole#role{m_family =
                                                                         MFamily#m_family{effect_use_info
                                                                                              =
                                                                                              NewUseInfo}},
                                                    push_11220(NewRole),
                                                    push_11221(NewRole),
                                                    {ok, NewRole};
                                                _Else -> _Else
                                            end;
                                        _ -> {false, lang:get("未找到宠物，不能进行训练")}
                                    end
                            end;
                        false ->
                            case calc_train_pet_exp(Role, PetId) of
                                {false, ReaSon} -> {false, ReaSon};
                                {true, AddExpVal} ->
                                    case lists:keyfind(PetId, #pet.id, Pets) of
                                        GetPet = #pet{lev = PetLev} ->
                                            CostEnergy =
                                                family_data:get_train_cost_energy({1,
                                                                                   PetLev}),
                                            Loss = format:val_to_loss([{90006,
                                                                        CostEnergy}]),
                                            case role_gain:do_notice(Loss, Role)
                                                of
                                                {ok, LossRole} ->
                                                    case pet:add_exp(LossRole,
                                                                     #{mode =>
                                                                           GetPet,
                                                                       val =>
                                                                           AddExpVal,
                                                                       limit =>
                                                                           1})
                                                        of
                                                        {ok, PetRole} ->
                                                            Now =
                                                                date:unixtime(),
                                                            TrainInfo =
                                                                #family_pet_train_info{id
                                                                                           =
                                                                                           TrainId,
                                                                                       pet_id
                                                                                           =
                                                                                           PetId,
                                                                                       end_time
                                                                                           =
                                                                                           Now
                                                                                               +
                                                                                               1200},
                                                            NewTrainInfo = case
                                                                               lists:keyfind(1,
                                                                                             1,
                                                                                             UseInfo)
                                                                               of
                                                                               {_,
                                                                                TrainInfoList} ->
                                                                                   lists:keystore(TrainId,
                                                                                                  #family_pet_train_info.id,
                                                                                                  TrainInfoList,
                                                                                                  TrainInfo);
                                                                               false ->
                                                                                   [TrainInfo]
                                                                           end,
                                                            NewUseInfo =
                                                                lists:keystore(1,
                                                                               1,
                                                                               UseInfo,
                                                                               {1,
                                                                                NewTrainInfo}),
                                                            NewRole =
                                                                PetRole#role{m_family
                                                                                 =
                                                                                 MFamily#m_family{effect_use_info
                                                                                                      =
                                                                                                      NewUseInfo}},
                                                            push_11220(NewRole),
                                                            push_11221(NewRole),
                                                            {ok, NewRole};
                                                        _Else -> _Else
                                                    end;
                                                _ ->
                                                    NoticeMsg =
                                                        notice:format(lang:get("您的活力值不足，需要~ts活力值"),
                                                                      [{string_2,
                                                                        1,
                                                                        CostEnergy}]),
                                                    {false, NoticeMsg}
                                            end;
                                        _ -> {false, lang:get("未找到宠物，不能进行训练")}
                                    end
                            end
                    end;
                false -> {false, lang:get("建造宠物室才能进行宠物训练")}
            end;
        _Else ->
            logger:debug("宠物训练出错：~w", [_Else], family_logic, 559),
            _Else
    end.

clean_train_cd(Role = #role{m_family =
                                MFamily = #m_family{effect_use_info = UseInfo}},
               TrainId) ->
    CostEnergy = family_data:get_train_cost_energy({2, 0}),
    case is_integer(CostEnergy) andalso CostEnergy =/= 0 of
        true ->
            Loss = format:val_to_loss([{90006, CostEnergy}]),
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    case lists:keyfind(1, 1, UseInfo) of
                        {_, TrainInfoList} ->
                            NewTrainInfo = lists:keydelete(TrainId,
                                                           #family_pet_train_info.id,
                                                           TrainInfoList),
                            NewUseInfo = lists:keystore(1,
                                                        1,
                                                        UseInfo,
                                                        {1, NewTrainInfo}),
                            NewRole = LossRole#role{m_family =
                                                        MFamily#m_family{effect_use_info
                                                                             =
                                                                             NewUseInfo}},
                            push_11220(NewRole),
                            push_11221(NewRole),
                            {ok, NewRole};
                        false -> {false, lang:get("空闲中，不需要进行加速")}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("活力值不足")}
            end;
        false ->
            case lists:keyfind(1, 1, UseInfo) of
                {_, TrainInfoList} ->
                    NewTrainInfo = lists:keydelete(TrainId,
                                                   #family_pet_train_info.id,
                                                   TrainInfoList),
                    NewUseInfo = lists:keystore(1,
                                                1,
                                                UseInfo,
                                                {1, NewTrainInfo}),
                    NewRole = Role#role{m_family =
                                            MFamily#m_family{effect_use_info =
                                                                 NewUseInfo}},
                    push_11220(NewRole),
                    {ok, NewRole};
                false -> {false, lang:get("空闲中，不需要进行加速")}
            end
    end.

family_sleep(Role = #role{m_family =
                              #m_family{cur_id = FamilyId,
                                        family_effect = EffectInfo}}) ->
    SleepTimes = var:get_var(Role, day, 55, 0),
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{cleanness = Cleanness}}
            when Cleanness >= 20 ->
            case lists:keyfind(12, 1, EffectInfo) of
                {_, Times} ->
                    case SleepTimes < Times of
                        true ->
                            VarRole = var:add_var(Role, day, 55, 1),
                            case lists:keyfind(7, 1, EffectInfo) of
                                {_, EnergyCfgVal} ->
                                    case lists:keyfind(8, 1, EffectInfo) of
                                        {_, SatietyCfgVal} ->
                                            EnvEnergyP = get_env_effect(energy,
                                                                        FamilyId),
                                            EnvSatietyP =
                                                get_env_effect(satiety,
                                                               FamilyId),
                                            EnergyVal = util:floor(EnergyCfgVal
                                                                       *
                                                                       (1000 +
                                                                            EnvEnergyP)
                                                                       / 1000),
                                            SatietyVal =
                                                util:floor(SatietyCfgVal *
                                                               (1000 +
                                                                    EnvSatietyP)
                                                               / 1000),
                                            Gain = format:val_to_gain([{90006,
                                                                        EnergyVal},
                                                                       {90014,
                                                                        SatietyVal}]),
                                            case role_gain:do_notice(Gain,
                                                                     VarRole)
                                                of
                                                {ok, NewRole} ->
                                                    Msg = case Times -
                                                                   SleepTimes
                                                                   - 1
                                                              of
                                                              LeftTimes
                                                                  when LeftTimes
                                                                           =:=
                                                                           0 ->
                                                                  lang:get("今日的休息次数用完了");
                                                              LeftTimes ->
                                                                  notice:format(lang:get("今日还能休息~ts次"),
                                                                                [{string_2,
                                                                                  1,
                                                                                  LeftTimes}])
                                                          end,
                                                    notice:send(NewRole,
                                                                3,
                                                                Msg),
                                                    push_11221(NewRole),
                                                    {ok, NewRole};
                                                _ -> {ok, VarRole}
                                            end;
                                        false -> {false, lang:get("当前不能进行休息")}
                                    end;
                                false -> {false, lang:get("当前不能进行休息")}
                            end;
                        false -> {false, lang:get("今日休息次数用完了")}
                    end;
                _ -> {false, lang:get("不能进行休息，请建筑您的卧室")}
            end;
        #family_info{} ->
            Msg = lang:get("清洁度过低于，请先找管家打扫房屋哦{face_1, 7}"),
            {false, Msg};
        _ -> {false, lang:get("您还未拥有家园，请继续努力哦")}
    end.

family_eat(Role = #role{m_family =
                            #m_family{family_effect = EffectInfo}}) ->
    EatTimes = var:get_var(Role, day, 54, 0),
    case lists:keyfind(13, 1, EffectInfo) of
        {_, Times} ->
            case EatTimes < Times of
                true ->
                    VarRole = var:add_var(Role, day, 54, 1),
                    case lists:keyfind(14, 1, EffectInfo) of
                        {_, SatietyVal} ->
                            Gain = format:val_to_gain([{90014, SatietyVal}]),
                            case role_gain:do_notice(Gain, VarRole) of
                                {ok, NewRole} ->
                                    Msg = case Times - EatTimes - 1 of
                                              LeftTimes when LeftTimes =< 0 ->
                                                  lang:get("今日进餐次数用完了");
                                              LeftTimes ->
                                                  notice:format("今日还能进餐~ts次",
                                                                [{string_2,
                                                                  1,
                                                                  LeftTimes}])
                                          end,
                                    notice:send(NewRole, 3, Msg),
                                    push_11221(NewRole),
                                    {ok, NewRole};
                                _ -> {false, lang:get("增加饱食度失败")}
                            end;
                        _ -> {false, lang:get("当前不能进行进餐")}
                    end;
                false -> {false, lang:get("今日进餐次数用完了")}
            end;
        _ -> {false, lang:get("您的卧室未建造，不能进行进餐")}
    end.

get_medicine_skill(#role{m_family =
                             #m_family{family_effect = EffectInfo}}) ->
    case lists:keyfind(5, 1, EffectInfo) of
        {_, SkillId} -> [{SkillId, 1}];
        _ -> []
    end;
get_medicine_skill(_) -> [].

set_family_lock(#role{id = RoleId,
                      m_family = #m_family{cur_id = FamilyId}},
                LockLev) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{master_id = RoleId} ->
            family_mgr ! {set_family_lock, FamilyId, LockLev},
            ok;
        #family_info{} -> {false, lang:get("您不是家园的主人，不能进行设置")};
        _ -> {false, lang:get("您还未拥有家园")}
    end.

query_family_info(Role, Type) ->
    FamilyInfoList = case Type of
                         1 ->
                             FriendList = friend:list_id(Role),
                             query_family_info_by_ids(FriendList);
                         2 ->
                             case Role of
                                 #role{m_guild = #m_guild{id = Gid}} ->
                                     case guild_mgr:members(Gid) of
                                         {ok, Members} ->
                                             GuildIds = [Id
                                                         || #guild_role{id = Id}
                                                                <- Members],
                                             query_family_info_by_ids(GuildIds);
                                         _ -> []
                                     end;
                                 _ -> []
                             end;
                         _ -> []
                     end,
    role:link_send(Role, 11223, {Type, FamilyInfoList}),
    ok.

house_keeper_clean(Role = #role{m_family =
                                    #m_family{cur_id = FamilyId}}) ->
    logger:debug("进行了打扫：~w", [FamilyId], family_logic, 734),
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{housekeeper_action_times = ActionTimes}}
            when ActionTimes >= 1 ->
            {false, lang:get("管家今天已经够累了，让她休息一下吧")};
        _ ->
            AddExtra = month_card:get_privilege(Role,
                                                family_cleanness),
            case AddExtra > 0 of
                true ->
                    notice:send(Role,
                                3,
                                {lang:get("月度礼包特权效果使清洁度额外增加~ts点"),
                                 [{string_2, 5, AddExtra}]});
                _ -> ok
            end,
            AddCleanness = util:rand(30, 45) + AddExtra,
            family_mgr !
                {house_keeper_clean, FamilyId, AddCleanness},
            {ok, AddCleanness}
    end.

foster_magic_bean(Role = #role{id = RoleId,
                               name = RoleName,
                               m_family = #m_family{cur_id = CurId}},
                  FamilyId) ->
    FosterTimes = var:get_var(Role, day, 56, 0),
    case FosterTimes < 20 of
        true ->
            case family_mgr:info(by_id, FamilyId) of
                #family_info{master_id = MasterId, lover_id = LoverId,
                             magic_beans =
                                 #magic_beans{growth = Growth,
                                              wake_time = WakeTime,
                                              fosters = Fosters}} ->
                    Now = date:unixtime(),
                    case Now > WakeTime of
                        true ->
                            case Growth < 10 of
                                true ->
                                    case lists:member(RoleId, Fosters) of
                                        true ->
                                            {false, lang:get("您今天已经进行过一次许愿了")};
                                        false ->
                                            VarRole = var:add_var(Role,
                                                                  day,
                                                                  56,
                                                                  1),
                                            {VarRole2, Reward, _} = case CurId
                                                                             =:=
                                                                             FamilyId
                                                                        of
                                                                        true ->
                                                                            get_magic_beans_reward([exp,
                                                                                                    pet_exp,
                                                                                                    reward],
                                                                                                   VarRole,
                                                                                                   4,
                                                                                                   [],
                                                                                                   false);
                                                                        false ->
                                                                            get_magic_beans_reward([exp,
                                                                                                    pet_exp,
                                                                                                    reward],
                                                                                                   VarRole,
                                                                                                   5,
                                                                                                   [],
                                                                                                   false)
                                                                    end,
                                            case Reward of
                                                [_ | _] ->
                                                    Gain =
                                                        format:val_to_gain(Reward),
                                                    case
                                                        role_gain:do_notice(Gain,
                                                                            VarRole2)
                                                        of
                                                        {ok, GainRole} ->
                                                            case CurId =:=
                                                                     FamilyId
                                                                of
                                                                true -> skip;
                                                                false ->
                                                                    Msg1 =
                                                                        notice:format(lang:get("~ts帮助您向星月宝树许愿成功，许愿值~ts"),
                                                                                      [{role_2,
                                                                                        RoleName},
                                                                                       {string_2,
                                                                                        1,
                                                                                        "+1"}]),
                                                                    case
                                                                        role_query:pid(by_id,
                                                                                       MasterId)
                                                                        of
                                                                        {ok,
                                                                         Pid1} ->
                                                                            notice:send({pid,
                                                                                         Pid1},
                                                                                        3,
                                                                                        Msg1);
                                                                        _ ->
                                                                            skip
                                                                    end,
                                                                    case
                                                                        role_query:pid(by_id,
                                                                                       LoverId)
                                                                        of
                                                                        {ok,
                                                                         Pid2} ->
                                                                            notice:send({pid,
                                                                                         Pid2},
                                                                                        3,
                                                                                        Msg1);
                                                                        _ ->
                                                                            skip
                                                                    end
                                                            end,
                                                            family_mgr !
                                                                {foster_magic_bean,
                                                                 FamilyId,
                                                                 RoleId,
                                                                 RoleName},
                                                            EvtRole = case CurId
                                                                               =:=
                                                                               FamilyId
                                                                          of
                                                                          true ->
                                                                              role_trigger:fire(#evt_family_self_magic_beans{},
                                                                                                GainRole);
                                                                          false ->
                                                                              role_trigger:fire(#evt_family_help_magic_beans{},
                                                                                                GainRole)
                                                                      end,
                                                            {ok, EvtRole};
                                                        {false,
                                                         #gain{msg = Msg}} ->
                                                            {false, Msg};
                                                        _ ->
                                                            {false,
                                                             lang:get("奖励配置错误")}
                                                    end;
                                                [] ->
                                                    {false, lang:get("奖励配置错误")}
                                            end
                                    end;
                                false ->
                                    {false, lang:get("许愿树已经达成了愿望，不需要继续许愿了")}
                            end;
                        false -> {false, lang:get("许愿树正在休眠，不能进行许愿")}
                    end;
                _ ->
                    logger:debug("错误的家园许愿树:~w",
                                 [FamilyId],
                                 family_logic,
                                 819),
                    {false, lang:get("错误的家园许愿树")}
            end;
        false -> {false, lang:get("您今天已经累了，不能进行培育了")}
    end.

get_magic_beans_reward(Role = #role{id = RoleId,
                                    m_family = #m_family{cur_id = FamilyId}}) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{master_id = MasterId, lover_id = LoverId,
                     magic_beans =
                         #magic_beans{growth = Growth,
                                      flower_num = FlowerNum}} ->
            case Growth >= 10 of
                true ->
                    family_mgr !
                        RewardType = case FlowerNum < 5 of
                                         true -> 1;
                                         false -> 2
                                     end,
                    {Role2, Reward, _} = get_magic_beans_reward([exp,
                                                                 pet_exp,
                                                                 reward],
                                                                Role,
                                                                RewardType,
                                                                [],
                                                                false),
                    Gain = format:val_to_gain(Reward),
                    case case catch gen_server:call(family_mgr,
                                                    {get_magic_beans_reward,
                                                     FamilyId},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        true ->
                            case role_gain:do_notice(Gain, Role2) of
                                {ok, GainRole} ->
                                    case MasterId =:= RoleId of
                                        true ->
                                            Title = lang:get("许愿树奖励"),
                                            ReContent =
                                                notice:format(lang:get("您家园中的许愿树已经绽放了第~ts朵鲜花，您的伴侣领取了宝藏奖励，有福同享，这是您的奖励："),
                                                              [{string_2,
                                                                1,
                                                                FlowerNum}]),
                                            mail:send(LoverId,
                                                      #{title => Title,
                                                        content => ReContent,
                                                        items => Reward});
                                        false ->
                                            Title = lang:get("许愿树奖励"),
                                            ReContent =
                                                notice:format(lang:get("您家园中的许愿树已经绽放了第~ts朵鲜花，您的伴侣领取了宝藏奖励，有福同享，这是您的奖励："),
                                                              [{string_2,
                                                                1,
                                                                FlowerNum}]),
                                            mail:send(MasterId,
                                                      #{title => Title,
                                                        content => ReContent,
                                                        items => Reward})
                                    end,
                                    {ok, GainRole};
                                {false, _} ->
                                    case MasterId =:= RoleId of
                                        true ->
                                            Title = lang:get("许愿树奖励"),
                                            ReContent =
                                                notice:format(lang:get("您家园中的许愿树已经绽放了第~ts朵鲜花，您的伴侣领取了宝藏奖励，有福同享，这是您的奖励："),
                                                              [{string_2,
                                                                1,
                                                                FlowerNum}]),
                                            mail:send(LoverId,
                                                      #{title => Title,
                                                        content => ReContent,
                                                        items => Reward});
                                        false ->
                                            Title = lang:get("许愿树奖励"),
                                            ReContent =
                                                notice:format(lang:get("您家园中的许愿树已经绽放了第~ts朵鲜花，您的伴侣领取了宝藏奖励，有福同享，这是您的奖励："),
                                                              [{string_2,
                                                                1,
                                                                FlowerNum}]),
                                            mail:send(MasterId,
                                                      #{title => Title,
                                                        content => ReContent,
                                                        items => Reward})
                                    end,
                                    SelfTitle = lang:get("许愿树奖励"),
                                    SelfReContent =
                                        notice:format(lang:get("您家园中的许愿树已经绽放了第~ts朵鲜花，，这是您的奖励："),
                                                      [{string_2,
                                                        1,
                                                        FlowerNum}]),
                                    mail:send(LoverId,
                                              #{title => SelfTitle,
                                                content => SelfReContent,
                                                items => Reward}),
                                    {ok, Role2};
                                _Err ->
                                    logger:error("领取许愿树奖励失败:~w",
                                                 [_Err],
                                                 family_logic,
                                                 879),
                                    {false, lang:get("领取许愿树奖励失败")}
                            end;
                        false -> {false, lang:get("您已经领取过奖励了，请等下许愿树下次成熟")}
                    end;
                false -> {false, lang:get("您的许愿树还未成熟，邀请您的好友进行培育吧")}
            end;
        _ -> {false, lang:get("您还未拥有家园，不能进行领取")}
    end.

invite_beans_reward(#role{id = RoleId, name = RoleName,
                          m_family = #m_family{cur_id = FamilyId}},
                    FriendIdList) ->
    Now = date:unixtime(),
    case family_mgr:info(by_id, FamilyId) of
        #family_info{magic_beans =
                         #magic_beans{flower_num = 0, wake_time = WakeTime,
                                      inviters = Inviters, growth = 0}}
            when Now < WakeTime ->
            case length(Inviters) < 10 of
                true ->
                    case check_can_invite(FriendIdList) of
                        ValidFriendList = [_ | _] ->
                            case case catch gen_server:call(family_mgr,
                                                            {set_invite_list,
                                                             FamilyId,
                                                             ValidFriendList},
                                                            10000)
                                     of
                                     {'EXIT', {timeout, _}} -> {error, timeout};
                                     {'EXIT', {noproc, _}} -> {error, noproc};
                                     {'EXIT', {normal, _}} -> {error, exit};
                                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                                     _Call_Return -> _Call_Return
                                 end
                                of
                                {true, Msg} ->
                                    notice:return(Msg),
                                    family_mgr !
                                        {invite_beans_reward,
                                         RoleId,
                                         RoleName,
                                         ValidFriendList},
                                    ok;
                                {false, Reason} -> {false, Reason};
                                _Err ->
                                    logger:error("分享许愿箱子时发生异常:~w",
                                                 [_Err],
                                                 family_logic,
                                                 907),
                                    {false, lang:get("分享许愿箱子时发生异常")}
                            end;
                        _ -> {false, lang:get("您的好友不符合接受奖励的条件，分给其他培育吧")}
                    end;
                false -> {false, lang:get("您的许愿奖励已经分发完毕了")}
            end;
        _ -> {false, lang:get("您的许愿树还没结果呢，请继续培育哦")}
    end.

get_beans_invite_reward(Role = #role{id = RoleId,
                                     m_family = #m_family{cur_id = FamilyId}},
                        Id) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{magic_beans =
                         #magic_beans{beans_rewards = BeansRewards}} ->
            case lists:keyfind(Id, #beans_reward.id, BeansRewards)
                of
                #beans_reward{belong_id = RoleId} ->
                    case case catch gen_server:call(family_mgr,
                                                    {get_beans_invite_reward,
                                                     FamilyId,
                                                     Id},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        true ->
                            case get_magic_beans_reward([exp, pet_exp, reward],
                                                        Role,
                                                        3,
                                                        [],
                                                        false)
                                of
                                {Role2, Reward = [_ | _], CastMsg} ->
                                    Gain = format:val_to_gain(Reward),
                                    case role_gain:do_notice(Gain, Role2) of
                                        {ok, GainRole} ->
                                            case CastMsg =/= false of
                                                true ->
                                                    notice:cast(all,
                                                                5,
                                                                CastMsg);
                                                _ -> skip
                                            end,
                                            {ok, GainRole};
                                        {false, #gain{msg = Msg}} ->
                                            Title = lang:get("许愿宝箱奖励"),
                                            Content =
                                                notice:format(lang:get("由于~ts，许愿宝箱领取失败，奖励通过邮件发送"),
                                                              [{string_2,
                                                                6,
                                                                Msg}]),
                                            notice:return(lang:get("奖励将通过邮件发送")),
                                            mail:send(Role2,
                                                      #{title => Title,
                                                        content => Content,
                                                        items => Reward}),
                                            {false, Msg};
                                        _ -> {false, lang:get("领取许愿宝箱奖励失败")}
                                    end;
                                _ -> {false, lang:get("许愿宝箱奖励配置错误，无法领取")}
                            end;
                        false -> {false, lang:get("您已经领取了该奖励，请不要重复领取")}
                    end;
                #beans_reward{} ->
                    {false, lang:get("这份奖励属于您的伴侣，您无法领取")};
                _ -> {false, lang:get("您已经领取了该奖励，请不要重复领取")}
            end;
        _ -> {false, lang:get("您还未拥有家园呢，继续努力哦")}
    end.

house_keeper_foster(Role = #role{id = RoleId,
                                 s_event = 28,
                                 m_family = #m_family{cur_id = FamilyId}}) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{magic_beans =
                         #magic_beans{growth = Growth, wake_time = WakeTime}}
            when Growth < 10 ->
            Now = date:unixtime(),
            case Now > WakeTime of
                true ->
                    case get_magic_beans_reward([exp, pet_exp, reward],
                                                Role,
                                                4,
                                                [],
                                                false)
                        of
                        {Role2, Reward = [_ | _], CastMsg} ->
                            Gain = format:val_to_gain(Reward),
                            case role_gain:do_notice(Gain, Role2) of
                                {ok, GainRole} ->
                                    case CastMsg =/= false of
                                        true -> notice:cast(all, 5, CastMsg);
                                        _ -> skip
                                    end,
                                    family_mgr !
                                        {house_keeper_foster, FamilyId, RoleId},
                                    {ok, GainRole};
                                {false, #gain{msg = Msg}} -> {false, Msg};
                                _ -> {false, lang:get("领取许愿奖励失败")}
                            end;
                        _ -> {false, lang:get("许愿奖励配置错误，无法领取")}
                    end;
                false -> {false, lang:get("您的许愿树正在努力生长呢")}
            end;
        _ -> {false, lang:get("您的许愿树已经成熟了，请领取您的奖励后再进行培育")}
    end;
house_keeper_foster(_) ->
    {false, lang:get("只能在家园中进行培育")}.

add_frunishing(Role = #role{id = RoleId,
                            m_family = #m_family{cur_id = FamilyId}},
               FurnishingId, Num) ->
    case family_data:get_furnishing(FurnishingId) of
        #{id := FurnishingId} ->
            log:add_furnishing(Role, FamilyId, FurnishingId),
            family_mgr !
                {add_frunishing, FamilyId, Num, FurnishingId, RoleId},
            ok;
        _ -> {false, lang:get("不存在的家具")}
    end.

upgrade_bdg(Role = #role{id = RoleId, s_event = 28,
                         m_family = #m_family{cur_id = FamilyId},
                         pos = #pos{map = CurMapId}},
            BdgType) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{lev = Lev, map_id = CurMapId,
                                     bdg_info = BdgInfo,
                                     is_upgrade_bdg = IsUpgradeBdg}} ->
            case check_upgrade_bdg_space(BdgInfo, BdgType, Lev) of
                true ->
                    CurBdgLev = case lists:keyfind(BdgType,
                                                   #building_info.type,
                                                   BdgInfo)
                                    of
                                    #building_info{lev = BdgLev} -> BdgLev;
                                    false -> 0
                                end,
                    case family_data:get_upgrade_bdg_cost({BdgType,
                                                           CurBdgLev})
                        of
                        Cost when is_list(Cost) ->
                            Loss = format:val_to_loss(Cost),
                            case role_gain:do_notice(Loss, Role) of
                                {ok, LossRole} ->
                                    NeedGive = case lists:keyfind(BdgType,
                                                                  1,
                                                                  IsUpgradeBdg)
                                                   of
                                                   {_, 1} -> true;
                                                   false -> false
                                               end,
                                    GiveFlag = case CurBdgLev =:= 0 andalso
                                                        NeedGive =:= false
                                                   of
                                                   true ->
                                                       case
                                                           lists:keyfind(BdgType,
                                                                         1,
                                                                         [{1,
                                                                           22},
                                                                          {2,
                                                                           24},
                                                                          {3,
                                                                           19},
                                                                          {4,
                                                                           18}])
                                                           of
                                                           {_, FurBaseId} ->
                                                               case
                                                                   family_data:get_furnishing(FurBaseId)
                                                                   of
                                                                   #{name :=
                                                                         FurName} ->
                                                                       BdgName =
                                                                           case
                                                                               BdgType
                                                                               of
                                                                               1 ->
                                                                                   lang:get("卧室");
                                                                               2 ->
                                                                                   lang:get("宠物室");
                                                                               3 ->
                                                                                   lang:get("生产室");
                                                                               4 ->
                                                                                   lang:get("存储间")
                                                                           end,
                                                                       Title =
                                                                           lang:get("小暖的问候"),
                                                                       ReContent =
                                                                           notice:format(lang:get("恭喜您完成了第一次建造~ts，为了纪念这一值得铭记的时刻，管家小暖特意寻来~ts"),
                                                                                         [{string_2,
                                                                                           5,
                                                                                           BdgName},
                                                                                          {string_2,
                                                                                           5,
                                                                                           FurName}]),
                                                                       mail:send(RoleId,
                                                                                 #{title
                                                                                       =>
                                                                                       Title,
                                                                                   content
                                                                                       =>
                                                                                       ReContent,
                                                                                   items
                                                                                       =>
                                                                                       []}),
                                                                       true;
                                                                   _ -> false
                                                               end;
                                                           _ -> false
                                                       end;
                                                   false -> false
                                               end,
                                    family_mgr !
                                        {upgrade_bdg,
                                         FamilyId,
                                         BdgType,
                                         GiveFlag,
                                         RoleId},
                                    {ok, LossRole};
                                _ -> {false, lang:get("您的资源不足，不能进行升级")}
                            end;
                        false -> {false, lang:get("您的建筑空间已经达到最高级，不能进行提升了")}
                    end;
                {false, Reason} ->
                    logger:debug("升级建筑失败:~w", [Reason], family_logic, 1061),
                    {false, Reason};
                false -> {false, lang:get("建筑空间不足")}
            end;
        _ -> {false, lang:get("您不在家园中，不能进行升级")}
    end;
upgrade_bdg(_, _) ->
    logger:error("当前状态不能提升建筑", [], family_logic, 1069),
    ok.

destory_building(#role{s_event = 28,
                       m_family = #m_family{cur_id = FamilyId},
                       p_family_store =
                           #package{volume = Volume, free_cell = FreeCell},
                       pos = #pos{map = CurMapId}},
                 BdgType) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{map_id = CurMapId, bdg_info = BdgInfo}} ->
            case lists:keyfind(BdgType,
                               #building_info.type,
                               BdgInfo)
                of
                #building_info{lev = BuildLev} when BuildLev > 0 ->
                    case BdgType =:= 4 of
                        true ->
                            AfterLev = BuildLev - 1,
                            BeforeVol = case
                                            family_data:get_building_effect({BdgType,
                                                                             BuildLev})
                                            of
                                            BeforeEff = [_ | _] ->
                                                case lists:keyfind(2,
                                                                   1,
                                                                   BeforeEff)
                                                    of
                                                    {_, Val1} -> Val1;
                                                    _ -> 0
                                                end;
                                            false -> 0
                                        end,
                            AfterVol = case
                                           family_data:get_building_effect({BdgType,
                                                                            AfterLev})
                                           of
                                           AfterEff = [_ | _] ->
                                               case lists:keyfind(2,
                                                                  1,
                                                                  AfterEff)
                                                   of
                                                   {_, Val2} -> Val2;
                                                   _ -> 0
                                               end;
                                           false -> 0
                                       end,
                            DescVal = case AfterLev =:= 0 of
                                          false -> max(BeforeVol - AfterVol, 0);
                                          true -> Volume
                                      end,
                            logger:debug("玩家的背包:~w",
                                         [FreeCell],
                                         family_logic,
                                         1103),
                            logger:debug("玩家的扣减容量:~w",
                                         [DescVal],
                                         family_logic,
                                         1104),
                            case [false
                                  || Pos
                                         <- lists:seq(Volume - DescVal + 1,
                                                      Volume),
                                     lists:member(Pos, FreeCell) =:= false]
                                of
                                [] ->
                                    family_mgr !
                                        {destory_building, FamilyId, BdgType},
                                    ok;
                                _ -> {false, lang:get("请先把仓库中要拆除部分的道具移动到你的背包中")}
                            end;
                        false ->
                            family_mgr ! {destory_building, FamilyId, BdgType},
                            ok
                    end;
                _E -> {false, lang:get("您的建筑已经达到最低等级了，不能进行拆除了")}
            end;
        _ -> {false, lang:get("您不在家园中，不能进行拆除")}
    end;
destory_building(_, _) ->
    {false, lang:get("您不在家园中，不能进行拆除")}.

check_space_use(InitBdgInfo, HouseLev) ->
    TotalUseSpace = calc_use_space(InitBdgInfo),
    case family_data:get_family(HouseLev) of
        #{total_space := TotalSpace} ->
            TotalUseSpace =< TotalSpace;
        false -> TotalUseSpace =< 10
    end.

init_bdg_info(BdgInfo) -> init_bdg_info(BdgInfo, []).

init_bdg_info([], ResultBdgInfo) -> ResultBdgInfo;
init_bdg_info([{BdgType, Lev} | Rest], ResultBdgInfo) ->
    BdgInfo = #building_info{type = BdgType, lev = Lev,
                             exp = 0},
    init_bdg_info(Rest, [BdgInfo | ResultBdgInfo]).

calc_use_space(SpaceUseInfo) ->
    calc_use_space(SpaceUseInfo, 0).

calc_use_space([], Total) -> Total;
calc_use_space([#building_info{type = BdgType,
                               lev = Lev}
                | Rest],
               Total) ->
    case family_data:get_space_use({BdgType, Lev}) of
        S when is_integer(S) -> calc_use_space(Rest, S + Total);
        _ -> calc_use_space(Rest, Total)
    end.

check_enter_area(#role{cross_type = 1}, _FamilyId) ->
    {false, lang:get("跨服状态无法进入回到家园")};
check_enter_area(#role{m_team =
                           #m_team{pid = Pid, status = 2}},
                 _FamilyId)
    when is_pid(Pid) ->
    {false, lang:get("您正在跟随队伍")};
check_enter_area(#role{m_combat = #m_combat{pid = Pid}},
                 _FamilyId)
    when is_pid(Pid) ->
    {false, lang:get("战斗中无法回到家园")};
check_enter_area(Role = #role{id = RoleId}, FamilyId) ->
    case role_misc:check_event_map(Role) of
        true ->
            case case catch gen_server:call(family_mgr,
                                            {check_family, FamilyId},
                                            10000)
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                {true, FamilyId, _} ->
                    case family_mgr:info(by_id, FamilyId) of
                        FamilyInfo = #family_info{house_info =
                                                      #house_info{lev = Lev,
                                                                  map_id =
                                                                      MapId}} ->
                            case check_visit_lock(FamilyInfo, RoleId) of
                                true ->
                                    case family_data:get_init_map(Lev) of
                                        #{map_id := MapBaseId} ->
                                            case map_data:get(MapBaseId) of
                                                {ok,
                                                 #map_data{revive =
                                                               [{X, Y} | _]}} ->
                                                    {true, {MapId, X, Y}};
                                                _ -> false
                                            end;
                                        _ -> {false, lang:get("您要进入的家园无地图信息")}
                                    end;
                                false -> {false, lang:get("您要访问的家园设置了访问权限")};
                                {false, Reason} -> {false, Reason}
                            end;
                        _ -> {false, lang:get("您要访问的家园不存在")}
                    end;
                _ -> {false, lang:get("您要访问的家园不存在")}
            end;
        Else -> Else
    end.

check_upgrade_bdg_space(BdgInfo, BdgType, HouseLev) ->
    logger:debug("建筑信息:~w",
                 [{BdgInfo, BdgType, HouseLev}],
                 family_logic,
                 1194),
    case family_data:get_max_build_lev(HouseLev, BdgType) of
        MaxLev when is_integer(MaxLev) ->
            case lists:keyfind(BdgType,
                               #building_info.type,
                               BdgInfo)
                of
                Bdg = #building_info{lev = Lev} ->
                    case Lev < MaxLev of
                        true ->
                            NewBdgInfo = lists:keystore(BdgType,
                                                        #building_info.type,
                                                        BdgInfo,
                                                        Bdg#building_info{lev =
                                                                              Lev
                                                                                  +
                                                                                  1}),
                            check_space_use(NewBdgInfo, HouseLev);
                        false -> {false, lang:get("您的建筑已经达到满级，不能继续提升了")}
                    end;
                false ->
                    NewBdgInfo = [#building_info{type = BdgType, lev = 1}
                                  | BdgInfo],
                    check_space_use(NewBdgInfo, HouseLev)
            end;
        false -> {false, lang:get("当前状态不能进升级")}
    end.

update_family_effect(Role = #role{m_family =
                                      MFamily = #m_family{},
                                  p_family_store =
                                      FamilyPack = #package{volume = OldVol,
                                                            free_cell =
                                                                OldFreeCell}},
                     FurMaxLevInfo, BdgInfo) ->
    FurnishingEffect = get_furnishing_effect(FurMaxLevInfo),
    BuildingEffect = get_building_effect(BdgInfo),
    EffectList = combine_family_effect(FurnishingEffect,
                                       BuildingEffect),
    logger:debug("计算后的家具效果:~w",
                 [EffectList],
                 family_logic,
                 1218),
    NewFamilyPack = case lists:keyfind(2, 1, EffectList) of
                        {_, Volume} ->
                            FreeCell = case Volume > OldVol of
                                           true ->
                                               OldFreeCell ++
                                                   lists:seq(OldVol + 1,
                                                             Volume);
                                           false ->
                                               OldFreeCell --
                                                   lists:seq(Volume + 1, OldVol)
                                       end,
                            FamilyPack#package{volume = Volume,
                                               free_cell = FreeCell};
                        _ -> FamilyPack#package{volume = 0, free_cell = []}
                    end,
    NewRole = Role#role{m_family =
                            MFamily#m_family{family_effect = EffectList},
                        p_family_store = NewFamilyPack},
    push_11217(NewRole),
    {ok, NewRole};
update_family_effect(Role = #role{m_family = MFamily,
                                  p_family_store = Store},
                     FurList, BdgInfo) ->
    logger:error("计算家园功能数据出错: 家园【~w】  仓库【~w】 家具信息[~w], "
                 "建筑信息[~w]",
                 [MFamily, Store, FurList, BdgInfo],
                 family_logic,
                 1235),
    {ok, Role}.

update_family_effect_push(Role, FurMaxLevInfo,
                          BdgInfo) ->
    {ok,
     NewRole = #role{p_family_store =
                         #package{volume = Volume, items = Items}}} =
        update_family_effect(Role, FurMaxLevInfo, BdgInfo),
    role:link_send(NewRole, 10330, {Volume, Items}),
    role:link_send(NewRole, 10332, {Volume}),
    {ok, NewRole}.

get_furnishing_effect(FurMaxLevInfo) ->
    get_furnishing_effect(FurMaxLevInfo, []).

get_furnishing_effect([], EffectInfo) -> EffectInfo;
get_furnishing_effect([{FurType, LevList} | Rest],
                      EffectInfo) ->
    case get_furnishing_effect_by_levlist(FurType, LevList)
        of
        L = [_ | _] ->
            NewEffectInfo = effect_combine(L, EffectInfo),
            get_furnishing_effect(Rest, NewEffectInfo);
        _ -> get_furnishing_effect(Rest, EffectInfo)
    end.

get_furnishing_effect_by_levlist(FurType, LevList) ->
    get_furnishing_effect_by_levlist(FurType, LevList, []).

get_furnishing_effect_by_levlist(_FurType, [],
                                 EffectList) ->
    EffectList;
get_furnishing_effect_by_levlist(FurType, [Lev | R],
                                 EffectList) ->
    case family_data:get_furnishing_effect({FurType, Lev})
        of
        L = [_ | _] ->
            NewEffectList = effect_combine(L, EffectList),
            get_furnishing_effect_by_levlist(FurType,
                                             R,
                                             NewEffectList);
        _ ->
            get_furnishing_effect_by_levlist(FurType, R, EffectList)
    end.

get_building_effect(FurMaxLevInfo) ->
    get_building_effect(FurMaxLevInfo, []).

get_building_effect([], EffectInfo) -> EffectInfo;
get_building_effect([#building_info{type = Type,
                                    lev = Lev}
                     | Rest],
                    EffectInfo) ->
    case family_data:get_building_effect({Type, Lev}) of
        L = [_ | _] ->
            get_building_effect(Rest, L ++ EffectInfo);
        _ -> get_building_effect(Rest, EffectInfo)
    end.

combine_family_effect([], BdgEffectList) ->
    BdgEffectList;
combine_family_effect([{EffectType, Val} | Rest],
                      BdgEffectList) ->
    case EffectType of
        1 -> combine_family_effect(Rest, BdgEffectList);
        10 ->
            combine_family_effect(Rest,
                                  [{EffectType, Val} | BdgEffectList]);
        _ ->
            case lists:keyfind(EffectType, 1, BdgEffectList) of
                {EffectType, BdgVal} ->
                    NewEffectList = lists:keyreplace(EffectType,
                                                     1,
                                                     BdgEffectList,
                                                     {EffectType,
                                                      BdgVal + Val}),
                    combine_family_effect(Rest, NewEffectList);
                _ -> combine_family_effect(Rest, BdgEffectList)
            end
    end.

do_train_check([], _Role, _PetId, _TrainId) -> true;
do_train_check([Check | Rest], Role, PetId, TrainId) ->
    case do_train_check(Check, Role, PetId, TrainId) of
        true -> do_train_check(Rest, Role, PetId, TrainId);
        {false, Reason} -> {false, Reason};
        _Err ->
            logger:error("检查是否能训练时出错:~w",
                         [_Err],
                         family_logic,
                         1309),
            _Err
    end;
do_train_check(cleanness,
               #role{m_family = #m_family{cur_id = FamilyId}}, _PetId,
               _TrainId) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{cleanness = Cleanness}}
            when Cleanness < 20 ->
            Msg = lang:get("清洁度过低于，请先找管家打扫房屋哦{face_1, 7}"),
            {false, Msg};
        _ -> true
    end;
do_train_check(open,
               #role{m_family = #m_family{family_effect = EffectInfo}},
               _PetId, TrainId) ->
    case lists:keyfind(6, 1, EffectInfo) of
        {_, TrainVal} ->
            case TrainId =< TrainVal of
                true -> true;
                false -> {false, lang:get("该宠物训练位没有开启，请建造您的宠物室")}
            end;
        false -> {false, lang:get("您的宠物室未开启，请升级您的宠物室")}
    end;
do_train_check(is_use,
               #role{m_family = #m_family{effect_use_info = UseInfo}},
               _PetId, TrainId) ->
    case lists:keyfind(1, 1, UseInfo) of
        {_, TrainInfo} ->
            case lists:keyfind(TrainId,
                               #family_pet_train_info.id,
                               TrainInfo)
                of
                #family_pet_train_info{end_time = EndTime} ->
                    Now = date:unixtime(),
                    case Now < EndTime of
                        true -> {false, lang:get("该训练位正在使用中，不能进行训练")};
                        false -> true
                    end;
                false -> true
            end;
        false -> true
    end;
do_train_check(times,
               Role = #role{m_family =
                                #m_family{family_effect = EffectInfo}},
               _PetId, _TrainId) ->
    case lists:keyfind(11, 1, EffectInfo) of
        {_, Times} ->
            TrainTimes = var:get_var(Role, day, 53, 0),
            case TrainTimes < Times of
                true -> true;
                false -> {false, lang:get("训练次数不足，明天再来吧")}
            end;
        false -> {false, lang:get("训练次数不足，明天再来吧")}
    end;
do_train_check(training,
               #role{m_family = #m_family{effect_use_info = UseInfo}},
               PetId, _TrainId) ->
    case lists:keyfind(1, 1, UseInfo) of
        {_, TrainInfo} ->
            case lists:keyfind(PetId,
                               #family_pet_train_info.pet_id,
                               TrainInfo)
                of
                #family_pet_train_info{end_time = EndTime} ->
                    Now = date:unixtime(),
                    case Now > EndTime of
                        true -> true;
                        false -> {false, lang:get("该宠物正在训练中")}
                    end;
                false -> true
            end;
        false -> true
    end;
do_train_check(pet_lev,
               #role{lev = RoleLev, m_pet = #m_pet{pets = Pets}},
               PetId, _TrainId) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{lev = PetLev} when PetLev < 40 ->
            {false, lang:get("该宠物太过弱小，还是等40级再来训练吧！")};
        #pet{lev = PetLev} when PetLev >= RoleLev + 6 ->
            {false, lang:get("宠物已经超过角色等级6级，不能再进行训练了")};
        #pet{} -> true;
        _ -> {false, lang:get("不存在的宠物")}
    end.

is_can_visit(FamilyId, RoleId) ->
    FamilyInfo = family_mgr:info(by_id, FamilyId),
    check_visit_lock(FamilyInfo, RoleId).

check_visit_lock(#family_info{master_id = RoleId},
                 RoleId) ->
    true;
check_visit_lock(#family_info{lover_id = RoleId},
                 RoleId) ->
    true;
check_visit_lock(#family_info{visit_lock = 1},
                 _RoleId) ->
    true;
check_visit_lock(#family_info{master_id = MasterId,
                              visit_lock = 2},
                 RoleId) ->
    friend:is_friend(MasterId, RoleId);
check_visit_lock(#family_info{master_id = MasterId,
                              visit_lock = 3},
                 RoleId) ->
    guild_util:is_in_same(MasterId, RoleId);
check_visit_lock(#family_info{master_id = MasterId,
                              visit_lock = 4},
                 RoleId) ->
    friend:is_friend(MasterId, RoleId) orelse
        guild_util:is_in_same(MasterId, RoleId);
check_visit_lock(_, _RoleId) -> false.

check_team(Role = #role{m_team =
                            #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    case team:get_members(Role) of
        TeamList = [_ | _] ->
            [Id || #team_mate{id = Id, status = 2} <- TeamList];
        _ -> []
    end;
check_team(_) -> [].

make_team_evt(Role = #role{s_event = Event},
              FamilyId) ->
    case check_team(Role) of
        [] -> self;
        MateIds when Event =:= 28 ->
            FollowMateIds = [Id
                             || Id <- MateIds, is_can_visit(FamilyId, Id)],
            #{label => enter_event, event => Event,
              role_ids => FollowMateIds,
              mfa => {family_logic, enter_callback, [FamilyId]}};
        MateIds ->
            #{label => exit_event, event => Event,
              role_ids => MateIds,
              mfa => {family_logic, leave_callback, []}}
    end.

query_family_info_by_ids(Ids) ->
    query_family_info_by_ids(Ids, []).

query_family_info_by_ids([], FamilyInfoList) ->
    FamilyInfoList;
query_family_info_by_ids([Id | Rest], FamilyInfoList) ->
    case family_mgr:info(by_master, Id) of
        FamilyInfo = #family_info{} ->
            query_family_info_by_ids(Rest,
                                     [FamilyInfo | FamilyInfoList]);
        false -> query_family_info_by_ids(Rest, FamilyInfoList)
    end.

effect_combine([], RightList) -> RightList;
effect_combine([{EffectType, Val} | Rest], RightList) ->
    case EffectType of
        1 -> effect_combine(Rest, RightList);
        10 ->
            effect_combine(Rest, [{EffectType, Val} | RightList]);
        _ ->
            case lists:keyfind(EffectType, 1, RightList) of
                {EffectType, BdgVal} ->
                    NewEffectList = lists:keyreplace(EffectType,
                                                     1,
                                                     RightList,
                                                     {EffectType,
                                                      BdgVal + Val}),
                    effect_combine(Rest, NewEffectList);
                _ ->
                    effect_combine(Rest, [{EffectType, Val} | RightList])
            end
    end.

check_map_blocked(MapId, RegionBlocks) ->
    logger:debug("摆放家具占地类型:~w",
                 [{MapId, RegionBlocks}],
                 family_logic,
                 1458),
    case map_mgr:info(MapId) of
        {ok, #map{base_id = MapBaseId}} ->
            case RegionBlocks of
                [_ | _] ->
                    map_mgr:is_blocked(MapId, MapBaseId, RegionBlocks);
                _ -> false
            end;
        _ -> false
    end.

check_can_invite(FriendIdList) ->
    check_can_invite(FriendIdList, []).

check_can_invite([], ValidFriednList) ->
    ValidFriednList;
check_can_invite([FriendId | Rest], ValidFriednList) ->
    case family_mgr:query_role_family_id(FriendId) of
        false -> check_can_invite(Rest, ValidFriednList);
        _ ->
            check_can_invite(Rest, [FriendId | ValidFriednList])
    end.

get_magic_beans_reward([], Role, _Type, Reward,
                       CastMsg) ->
    {Role, Reward, CastMsg};
get_magic_beans_reward([GainType | L], Role, Type,
                       Reward, CastMsg) ->
    case get_magic_beans_reward(GainType, Role, Type) of
        RwList when is_list(RwList) ->
            get_magic_beans_reward(L,
                                   Role,
                                   Type,
                                   RwList ++ Reward,
                                   CastMsg);
        {Role2, GainAdd, NoticeMsg} ->
            get_magic_beans_reward(L,
                                   Role2,
                                   Type,
                                   GainAdd ++ Reward,
                                   NoticeMsg);
        _ ->
            get_magic_beans_reward(L, Role, Type, Reward, CastMsg)
    end.

get_magic_beans_reward(exp, #role{lev = Lev}, Type) ->
    case family_data:get_magic_beans_reward(Type) of
        {ExpMod, _Rerward} when ExpMod =/= 0 ->
            case levup_data:get_exp({ExpMod, Lev}) of
                #{exp := Exp} -> [{90010, Exp}];
                _ -> []
            end;
        _ -> []
    end;
get_magic_beans_reward(pet_exp,
                       #role{m_pet = #m_pet{pets = Pets}}, Type) ->
    case lists:keyfind(1, #pet.status, Pets) of
        #pet{lev = Lev} ->
            case family_data:get_magic_beans_reward(Type) of
                {ExpMod, _Rerward} when ExpMod =/= 0 ->
                    case levup_data:get_exp({ExpMod, Lev}) of
                        #{pet_exp := Exp} -> [{90005, Exp}];
                        _ -> []
                    end;
                _ -> []
            end;
        _ -> []
    end;
get_magic_beans_reward(reward,
                       #role{name = Name} = Role, Type) ->
    case family_data:get_magic_beans_reward(Type) of
        {_, RwCfg} ->
            {StartTime, EndTime, RewardLimit} =
                family_data:get_magic_beans_reward_limit(Type),
            Now = date:unixtime2(),
            case StartTime =:= val_not_exist orelse
                     Now >= StartTime andalso EndTime >= Now
                of
                true ->
                    case util:rand_list(RwCfg, 3) of
                        {AssestType, Val, _, IsCast} ->
                            {Role2, NewVal} =
                                get_new_magic_beans_val_num(AssestType,
                                                            Val,
                                                            RewardLimit,
                                                            Role),
                            CastMsg = case IsCast of
                                          1 ->
                                              notice:format(lang:get("~ts在拆开~ts金光一现，获得了一个~ts{face_1,20}"),
                                                            [{role_2, Name},
                                                             {string_2,
                                                              5,
                                                              lang:get("许愿月亮")},
                                                             {item_2,
                                                              AssestType,
                                                              NewVal}]);
                                          _ -> false
                                      end,
                            {Role2, [{AssestType, 0, NewVal}], CastMsg};
                        _ -> []
                    end;
                _ -> []
            end;
        _ -> []
    end;
get_magic_beans_reward(_, _, _) -> [].

get_new_magic_beans_val_num(ItemID, Num, LimitCfg,
                            Role) ->
    NewVal = item_type:special_id(Num),
    case lists:keyfind(ItemID, 1, LimitCfg) of
        {ItemID, LimitNum} ->
            case var:get_list_var(Role, day, 623, ItemID, 0) of
                Count when Count >= LimitNum ->
                    notice:send(Role,
                                3,
                                lang:get("今天万圣糖果已经派完了哟，万圣节快乐~{face_1,57}")),
                    {Role, 0};
                Count when Count + NewVal >= LimitNum ->
                    Role2 = var:set_list_var(Role,
                                             day,
                                             623,
                                             ItemID,
                                             LimitNum),
                    {Role2, LimitNum - Count};
                Count ->
                    Role2 = var:set_list_var(Role,
                                             day,
                                             623,
                                             ItemID,
                                             Count + NewVal),
                    {Role2, NewVal}
            end;
        _ -> {Role, NewVal}
    end.

calc_train_pet_exp(#role{m_family =
                             #m_family{cur_id = FamilyId,
                                       family_effect = EffectInfo},
                         m_pet = #m_pet{pets = Pets}},
                   PetId) ->
    case lists:keyfind(1, 1, EffectInfo) of
        {_, ExpMod} ->
            case lists:keyfind(PetId, #pet.id, Pets) of
                #pet{lev = Lev} ->
                    case levup_data:get_exp({ExpMod, Lev}) of
                        #{pet_exp := AddExp} ->
                            EffectPrecent = case lists:keyfind(10,
                                                               1,
                                                               EffectInfo)
                                                of
                                                {_, PrecentVal} -> PrecentVal;
                                                _ -> 0
                                            end,
                            FamilyEnvPrecent = get_env_effect(exp, FamilyId),
                            Val = util:floor(AddExp *
                                                 (1000 + EffectPrecent +
                                                      FamilyEnvPrecent)
                                                 / 1000),
                            {true, Val};
                        _ ->
                            logger:error("宠物训练错误的经验模型:~w",
                                         [{ExpMod, Lev}],
                                         family_logic,
                                         1578),
                            {false, lang:get("当前状态不能进行训练")}
                    end;
                _ -> {false, lang:get("您的宠物不存在，不能进行训练")}
            end;
        _ -> {false, lang:get("您的宠物室未开放，努力升级建筑哦")}
    end.

get_env_effect(Type, FamilyId) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info = #house_info{env_val = Env}} ->
            case family_data:get_env_effect_add(Env) of
                #{exp := Exp, energy := Energy, satiety := Satiety,
                  produce := Produce} ->
                    case Type of
                        exp -> Exp;
                        energy -> Energy;
                        satiety -> Satiety;
                        produce -> Produce;
                        _ -> 0
                    end;
                _ -> 0
            end;
        _ -> 0
    end.

sell_furnishing(Role = #role{id = RoleID, s_event = 28,
                             m_family = #m_family{cur_id = FamilyId}},
                ID, SellNum) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{furnishings = Furnishings}} ->
            case lists:keyfind(ID, #furnishing.id, Furnishings) of
                Furnishing = #furnishing{base_id = BaseID} ->
                    case check_can_sell([base_id, sell_num, belong, status],
                                        RoleID,
                                        Furnishing,
                                        SellNum)
                        of
                        ok ->
                            case family_data:get_furnishing(BaseID) of
                                #{id := BaseID, sell_type := SellType,
                                  sell_val := SellVal, name := Name} ->
                                    Gain = format:val_to_gain([{SellType,
                                                                SellVal}]),
                                    Title = notice:format(lang:get("出售~ts成功"),
                                                          [{string_2,
                                                            5,
                                                            Name}]),
                                    case role_gain:do_notice(Gain, Role, Title)
                                        of
                                        {ok, NewRole} ->
                                            case case catch
                                                          gen_server:call(family_mgr,
                                                                          {sell_furnishing,
                                                                           FamilyId,
                                                                           ID,
                                                                           RoleID,
                                                                           SellNum},
                                                                          10000)
                                                     of
                                                     {'EXIT', {timeout, _}} ->
                                                         {error, timeout};
                                                     {'EXIT', {noproc, _}} ->
                                                         {error, noproc};
                                                     {'EXIT', {normal, _}} ->
                                                         {error, exit};
                                                     {'EXIT', _Call_Err} ->
                                                         {error, _Call_Err};
                                                     _Call_Return ->
                                                         _Call_Return
                                                 end
                                                of
                                                ok -> {ok, NewRole};
                                                {false, Reason} ->
                                                    {false, Reason}
                                            end;
                                        {false, #gain{msg = Msg}} ->
                                            {false, Msg};
                                        _ ->
                                            logger:error("出售家具错误",
                                                         [],
                                                         family_logic,
                                                         1626),
                                            {false, lang:get("出售家具错误")}
                                    end;
                                _R -> {false, lang:get("该家具不能出售")}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("尚未拥有该家具")}
            end;
        _ -> {false, lang:get("您还未拥有家园呢，继续努力哦")}
    end;
sell_furnishing(_Role, _ID, _Num) ->
    {false, lang:get("在家园中才能出售家具哟~")}.

check_can_sell([base_id | T], RoleID,
               Furnishing = #furnishing{base_id = BaseID}, SellNum) ->
    case BaseID =:= 12 of
        true -> {false, lang:get("地板是家园的基础，不能出售哟{face_1,3}")};
        _ -> check_can_sell(T, RoleID, Furnishing, SellNum)
    end;
check_can_sell([sell_num | T], RoleID,
               Furnishing = #furnishing{num = Num}, SellNum) ->
    case Num > 0 of
        true ->
            case SellNum > Num of
                true -> {false, lang:get("出售数量超出已拥有数量")};
                _ -> check_can_sell(T, RoleID, Furnishing, SellNum)
            end;
        _ -> {false, lang:get("尚未拥有该家具")}
    end;
check_can_sell([belong | T], RoleID,
               Furnishing = #furnishing{belong = BelongID, id = ID},
               SellNum) ->
    case BelongID =:= RoleID of
        true -> check_can_sell(T, RoleID, Furnishing, SellNum);
        _ ->
            Name = case family_data:get_furnishing(ID) of
                       #{id := ID, name := _Name} -> _Name;
                       _ -> lang:get("该家具")
                   end,
            Msg =
                notice:format(lang:get("~ts是您的伴侣购买，不能出售{face_1,3}"),
                              [{string_2, 5, Name}]),
            {false, Msg}
    end;
check_can_sell([status | T], RoleID,
               Furnishing = #furnishing{status = Status}, SellNum) ->
    case Status =:= 1 of
        true -> check_can_sell(T, RoleID, Furnishing, SellNum);
        _ -> {false, lang:get("正在使用的家具，不能出售哟{face_1,3}")}
    end;
check_can_sell([], _, _, _) -> ok.

