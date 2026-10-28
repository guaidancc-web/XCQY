-file("src/mod/provocation/provocation_role.erl", 1).

-module(provocation_role).

-export([rpc_enter/1,
         rpc_exit/1,
         rpc_create_room/2,
         rpc_join_room/2,
         rpc_exit_room/1,
         rpc_kick_rival/2,
         rpc_change_roominfo/2,
         rpc_team_ready/1,
         rpc_get_roomlist/2,
         rpc_get_roominfo/1,
         rpc_get_checkflag/1,
         rpc_combat_start/1,
         rpc_replay_result/2,
         rpc_change_check/2,
         rpc_cancel_ready/1,
         rpc_invite_friend/2,
         rpc_agree_invite/2,
         rpc_get_booklist/2,
         rpc_fast_join/1,
         rpc_recommend_rival/1,
         rpc_get_result_role/1,
         rpc_create_book/2,
         rpc_change_bookinfo/2,
         rpc_revoke_bookinfo/2,
         rpc_preview_roominfo/2,
         rpc_get_vedioroom/2,
         rpc_publish_help/3,
         rpc_watch/2,
         rpc_answer_publish/5,
         rpc_use_horn/2]).

-export([apply_team_mate_enter/4,
         apply_team_mate_leave/3,
         async_enter_provocation/2,
         init/0,
         login/1,
         logout/1,
         push_room/1,
         evt_callback/2,
         role_callback/2,
         async_create_room/2,
         async_join_room/2,
         async_take_over_room/1,
         async_leave_room/1,
         create_team/1,
         push_to_provocation/1,
         publish_timeout/2,
         check_pick/2,
         pick_gain/2,
         make_red_packet/2,
         zero_flush/2]).

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

-file("src/mod/provocation/provocation_role.erl", 68).

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

-file("src/mod/provocation/provocation_role.erl", 69).

-file("inc/provocation.hrl", 1).

-record(m_provocation,
        {ver = 3,
         room_id = 0,
         book_id = 0,
         identity = 0,
         triggers = [],
         map_id = 0,
         room_check = 1,
         book_check = 0,
         video_check = 0,
         invited_list = [],
         published_list = [],
         pick_batch_list = [],
         pick_box_num = 0,
         pick_packet_num = 0}).

-record(provocation_room,
        {ver = 1,
         id = 0,
         pid = undefined :: pid(),
         name = [],
         room_lev_min = 0,
         min_lev_break = 0,
         room_lev_max = 200,
         max_lev_break = 1,
         master_fc = 0,
         mode = 1,
         password = [],
         status = 0,
         master_id = {0, "", 0},
         master_lev = 0,
         master_break = 0,
         master_name = [],
         master_sex = 0,
         master_class = 0,
         master_head = 0,
         customer_id = {0, "", 0},
         master_team_pid = undefined :: pid(),
         customer_team_pid = undefined :: pid(),
         last_vedio_id = {0, "", 0},
         provocation_type = 0,
         target_rival = {0, "", 0},
         target_name = [],
         make_horn_role = {0, "", 0},
         horn_name = [],
         horn_start_time = 0}).

-record(provocation_team,
        {ver = 1,
         team_formation = 0,
         team_formation_lev = 0,
         order = [],
         guards = [],
         team_mate = []}).

-record(provocation_fight_team,
        {leader_id = {0, "", 0}, fighters = []}).

-record(provocation_profile,
        {ver = 2,
         id = {0, "", 0},
         pid = undefined :: pid(),
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         head = 0,
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         guards = [],
         join_time = 0}).

-record(provocation_book,
        {ver = 1,
         id = 0,
         name = [],
         book_lev_min = 0,
         min_lev_break = 0,
         book_lev_max = 200,
         max_lev_break = 0,
         master_fc = 0,
         mode = 1,
         master_id = {0, "", 0},
         master_lev = 0,
         master_name = [],
         master_sex = 0,
         master_class = 0,
         master_head = 0,
         master_break = 0,
         live_status = 1,
         time_stamp = 0,
         provocation_type = 0}).

-record(provocation_fighter,
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

-record(provocation_result,
        {id = {0, "", 0},
         ver = 1,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0}).

-record(provocation_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(provocation_slices,
        {key = {0, 0}, role_list = []}).

-record(provocation_publish,
        {help_id = 0,
         msg_id = 0,
         record_id = 0,
         channel = 0,
         map_id = 0}).

-record(provocation_box,
        {map_id = 0,
         type = 0,
         batch_id = 0,
         time_stamp = 0,
         boxlist = []}).

-file("src/mod/provocation/provocation_role.erl", 70).

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

-file("src/mod/provocation/provocation_role.erl", 71).

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

-file("src/mod/provocation/provocation_role.erl", 72).

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

-file("src/mod/provocation/provocation_role.erl", 73).

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

-file("src/mod/provocation/provocation_role.erl", 74).

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

-file("src/mod/provocation/provocation_role.erl", 75).

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

-file("src/mod/provocation/provocation_role.erl", 76).

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

-file("src/mod/provocation/provocation_role.erl", 77).

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

-file("src/mod/provocation/provocation_role.erl", 78).

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

-file("src/mod/provocation/provocation_role.erl", 79).

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

-file("src/mod/provocation/provocation_role.erl", 80).

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

-file("src/mod/provocation/provocation_role.erl", 81).

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

-file("src/mod/provocation/provocation_role.erl", 82).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/provocation/provocation_role.erl", 83).

-file("inc/head.hrl", 1).

-record(m_head,
        {ver = 2 :: pos_integer(),
         id_now = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         head = [] :: list(),
         frame_id_now = 0 :: non_neg_integer(),
         frame_time_buy = 0 :: non_neg_integer(),
         frame_day = 0 :: non_neg_integer(),
         head_frame = [] :: list()}).

-record(head,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-record(head_frame,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-file("src/mod/provocation/provocation_role.erl", 84).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/provocation/provocation_role.erl", 85).

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

-file("src/mod/provocation/provocation_role.erl", 87).

-file("inc/chat.hrl", 1).

-record(chat_msg,
        {rid = {0, "", 0} :: non_neg_integer(),
         platform = "" :: binary(),
         zone_id = 0 :: non_neg_integer(),
         channel = 0 :: non_neg_integer(),
         name = "" :: binary(),
         sex = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         msg = "" :: binary(),
         guild_name = "",
         special = [] :: [tuple()]}).

-record(chat_voice,
        {role_id,
         voice = <<>>,
         text = "",
         time = 0,
         channel,
         group_id}).

-record(chat_offline, {id = {0, "", 0}, msgs = []}).

-file("src/mod/provocation/provocation_role.erl", 88).

-file("inc/help.hrl", 1).

-record(m_help,
        {ver = 1,
         next_id = 1,
         free_ids = [],
         send_msg = [],
         recv_msg = [],
         ext = []}).

-record(help_state,
        {next_record_id = 1, free_record_ids = []}).

-record(help_msg,
        {id = 0,
         help_rid,
         help_id = 0,
         record_id = 0,
         time = 0,
         digit_array = [],
         str_array = [],
         ext = []}).

-record(help_record, {record_id = 0, rid}).

-record(help_data,
        {id = 0 :: pos_integer(),
         title = "",
         fun_type = 0,
         type = 0,
         help_args :: undefined | term()}).

-file("src/mod/provocation/provocation_role.erl", 89).

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

-file("src/mod/provocation/provocation_role.erl", 90).

-file("inc/query.hrl", 1).

-record(name_index,
        {name = "" :: list(),
         id = 0 :: non_neg_integer(),
         acc = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(id_index,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         acc = "" :: list(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(acc_index,
        {acc = {"", "", 0} ::
             {list(), list(), non_neg_integer()},
         id = 0 :: non_neg_integer(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/mod/provocation/provocation_role.erl", 91).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/mod/provocation/provocation_role.erl", 92).

rpc_enter(Role) ->
    Args = #{members => []},
    case check_enter([lev,
                      combat,
                      event,
                      crosstype,
                      team_members],
                     Role,
                     Args)
        of
        {true, CheckRole, #{members := Members}} ->
            transe_map(CheckRole, Members);
        {false, Reason} ->
            logger:debug("进入失败:~ts",
                         [Reason],
                         provocation_role,
                         102),
            {false, Reason};
        {_, _, _Args} ->
            logger:debug("=======:~w",
                         [_Args],
                         provocation_role,
                         105),
            {false, lang:get("进入地图失败")}
    end.

rpc_exit(#role{m_team = #m_team{status = 2}}) ->
    {false, lang:get("您正在跟随队伍，无法操作")};
rpc_exit(#role{m_team =
                   #m_team{pid = TPid, status = 3}})
    when is_pid(TPid) ->
    {false, lang:get("请离开队伍后再退出")};
rpc_exit(#role{s_event = 66}) ->
    {false, lang:get("您正在房间中，无法离开场景")};
rpc_exit(Role = #role{m_team =
                          #m_team{member_num = Num},
                      m_provocation = #m_provocation{map_id = MapId}}) ->
    TeamEvt = make_team_evt(Role#role{s_event = 0}, 0),
    NewNum = case Num =:= 0 of
                 true -> 1;
                 _ -> Num
             end,
    case cross:call(provocation_mgr,
                    call,
                    [{exit, MapId, NewNum}])
        of
        {ok, ToPos} -> exit_normal(ToPos, TeamEvt, Role);
        _ ->
            {NMapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                             {10001, 2583, 3848},
                                             {10001, 4957, 3680},
                                             {10001, 445, 2565},
                                             {10001, 4646, 704},
                                             {10001, 841, 1033},
                                             {10001, 2098, 1834},
                                             {10001, 3617, 1816}]),
            case env:get(center) of
                #center{ready = 1, center_platform = Platform,
                        center_zone_id = ZoneId} ->
                    ToPos = {Platform, ZoneId, NMapId, X, Y},
                    exit_normal(ToPos, TeamEvt, Role);
                _ ->
                    exit_normal({env:get(platform),
                                 env:get(zone_id),
                                 NMapId,
                                 X,
                                 Y},
                                TeamEvt,
                                Role)
            end
    end.

rpc_create_room(#role{m_provocation =
                          #m_provocation{room_id = ORoomId}},
                _)
    when ORoomId =/= 0 ->
    {false, lang:get("你已经有房了，不能再开了")};
rpc_create_room(Role = #role{id = Id, lev = Lev,
                             name = Name, sex = Sex, classes = Classes,
                             attr = #attr{fc = Fc},
                             m_head = #m_head{id_now = HeadId},
                             m_lev_break = #m_lev_break{times = BreakTimes},
                             m_team = #m_team{status = 1, pid = MTeamPid},
                             m_provocation =
                                 MProvocation = #m_provocation{triggers =
                                                                   Triggers}},
                {RoomName,
                 RoomMode,
                 MinLev,
                 MinBreak,
                 MaxLev,
                 MaxBreak,
                 PassWord,
                 RoomType})
    when is_pid(MTeamPid) ->
    case check_room_mode(Role, RoomMode) of
        ok ->
            provocation_agent:update_role_profile(Role, false),
            PetFc = pet_attr:calc_fc(Role),
            case cross:call(provocation_mgr,
                            call,
                            [{create_room,
                              #{room_name => RoomName, room_mode => RoomMode,
                                room_lev_min => MinLev,
                                min_lev_break => MinBreak,
                                room_lev_max => MaxLev,
                                max_lev_break => MaxBreak,
                                break_times => BreakTimes,
                                master_fc => Fc + PetFc, pass_word => PassWord,
                                master_team_pid => MTeamPid, master_id => Id,
                                master_lev => Lev, master_name => Name,
                                master_sex => Sex, master_class => Classes,
                                master_head => HeadId, room_type => RoomType}}])
                of
                {ok, RoomId} ->
                    Members = team:get_members(Role),
                    [role:apply(async,
                                MatePid,
                                {provocation_role, async_create_room, [RoomId]})
                     || #team_mate{pid = MatePid} <- Members,
                        is_pid(MatePid)],
                    {Role1, NewTriggers} = add_trigger([evt_team_join,
                                                        evt_team_appoint,
                                                        evt_team_leave,
                                                        evt_team_away,
                                                        evt_team_follow],
                                                       Role,
                                                       Triggers),
                    NRole = Role1#role{s_event = 66,
                                       m_provocation =
                                           MProvocation#m_provocation{room_id =
                                                                          RoomId,
                                                                      identity =
                                                                          1,
                                                                      triggers =
                                                                          NewTriggers}},
                    map:role_update(NRole),
                    {ok, NRole};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} ->
            logger:debug("进入房间出错:~w",
                         [Reason],
                         provocation_role,
                         171),
            {false, Reason}
    end;
rpc_create_room(#role{m_team =
                          #m_team{status = _, pid = TeamPid}},
                _)
    when is_pid(TeamPid) ->
    {false, lang:get("队员不能建房间")};
rpc_create_room(Role, Args) ->
    case team_mgr:create(Role) of
        {ok, NRole} -> rpc_create_room(NRole, Args);
        {false, Reason} ->
            logger:error("创建队伍失败 ~w",
                         [Reason],
                         provocation_role,
                         182),
            {false, Reason};
        Else ->
            logger:error("创建队伍失败 ~w",
                         [Else],
                         provocation_role,
                         185),
            {false, Else}
    end.

rpc_join_room(#role{m_provocation =
                        #m_provocation{room_id = ORoomId}},
              _)
    when ORoomId =/= 0 ->
    {false, lang:get("已经在房间里了，不能再进房间")};
rpc_join_room(Role = #role{id = CRid, name = Name,
                           lev = Lev,
                           m_team =
                               #m_team{status = 1, pid = CTeamPid,
                                       member_num = Num},
                           attr = #attr{fc = Fc},
                           m_lev_break = #m_lev_break{times = BreakTimes},
                           m_provocation =
                               MProvocation = #m_provocation{triggers =
                                                                 Triggers}},
              {RoomId, PassWord})
    when is_pid(CTeamPid) ->
    provocation_agent:update_role_profile(Role, false),
    PetFc = pet_attr:calc_fc(Role),
    case cross:call(provocation_mgr,
                    call,
                    [{join_room,
                      RoomId,
                      #{password => PassWord, customer_teamid => CTeamPid,
                        customer_id => CRid, customer_lev => Lev,
                        customer_break => BreakTimes, customer_fc => Fc + PetFc,
                        team_number => Num}}])
        of
        {ok, RoomInfo = #provocation_room{id = RoomId}} ->
            Members = team:get_members(Role),
            logger:debug("~w", [Members], provocation_role, 216),
            [role:apply(async,
                        MatePid,
                        {provocation_role, async_join_room, [RoomInfo]})
             || #team_mate{pid = MatePid} <- Members,
                is_pid(MatePid)],
            {Role1, NewTriggers} = add_trigger([evt_team_join,
                                                evt_team_appoint,
                                                evt_team_leave,
                                                evt_team_away,
                                                evt_team_follow],
                                               Role,
                                               Triggers),
            NRole = Role1#role{s_event = 66,
                               m_provocation =
                                   MProvocation#m_provocation{room_id = RoomId,
                                                              identity = 2,
                                                              triggers =
                                                                  NewTriggers}},
            notice_room(RoomInfo,
                        notice:format(lang:get("~ts带着队伍加入本房间{face_1,1}"),
                                      [{role_2, Name}])),
            map:role_update(NRole),
            {ok, NRole};
        {false, Reason} ->
            push_room(Role),
            {false, Reason}
    end;
rpc_join_room(#role{m_team =
                        #m_team{status = _, pid = TeamPid}},
              _)
    when is_pid(TeamPid) ->
    {false, lang:get("在跟随队伍中，不能进房间")};
rpc_join_room(Role, Args) ->
    case team_mgr:create(Role) of
        {ok, NRole} -> rpc_join_room(NRole, Args);
        {false, Reason} ->
            logger:error("创建队伍失败 ~w",
                         [Reason],
                         provocation_role,
                         235),
            {false, Reason};
        Else ->
            logger:error("创建队伍失败 ~w",
                         [Else],
                         provocation_role,
                         238),
            {false, Else}
    end.

rpc_exit_room(#role{m_provocation =
                        #m_provocation{room_id = ORoomId}})
    when ORoomId =:= 0 ->
    {false, lang:get("你已经离开房间了")};
rpc_exit_room(Role = #role{s_event = 66, id = Rid,
                           name = Name,
                           m_team = #m_team{pid = TPid, status = 1},
                           m_provocation =
                               MProvocation = #m_provocation{room_id = RoomId,
                                                             triggers =
                                                                 Triggers,
                                                             identity =
                                                                 Identity}})
    when is_pid(TPid) ->
    cross:cast(provocation_mgr,
               cast,
               [{team_leave_room, RoomId, Rid, Identity}]),
    [role:apply(async,
                MatePid,
                {provocation_role, async_leave_room, []})
     || #team_mate{pid = MatePid} <- team:get_members(Role),
        is_pid(MatePid)],
    {Role1, _} = remove_trigger(all, Triggers, Role),
    Role2 = Role1#role{s_event = 65,
                       m_provocation =
                           MProvocation#m_provocation{room_id = 0, identity = 0,
                                                      triggers = []}},
    notice_room(RoomId,
                notice:format(lang:get("~ts带队离开本房间"),
                              [{role_2, Name}])),
    NRole = recover_publish(Role2),
    map:role_update(NRole),
    push_room(NRole),
    {ok, NRole};
rpc_exit_room(#role{s_event = 66,
                    m_team = #m_team{pid = TPid}})
    when is_pid(TPid) ->
    {false, lang:get("只有队长可以离开房间")};
rpc_exit_room(Role = #role{s_event = 66, id = Rid,
                           name = Name,
                           m_provocation =
                               MProvocation = #m_provocation{room_id = RoomId,
                                                             triggers =
                                                                 Triggers,
                                                             identity =
                                                                 Identity}}) ->
    logger:debug("====", [], provocation_role, 275),
    cross:cast(provocation_mgr,
               cast,
               [{team_leave_room, RoomId, Rid, Identity}]),
    {Role1, _} = remove_trigger(all, Triggers, Role),
    Role2 = Role1#role{s_event = 65,
                       m_provocation =
                           MProvocation#m_provocation{room_id = 0, identity = 0,
                                                      triggers = []}},
    notice_room(RoomId,
                notice:format(lang:get("~ts离开本房间"), [{role_2, Name}])),
    NRole = recover_publish(Role2),
    map:role_update(NRole),
    push_room(NRole),
    {ok, NRole};
rpc_exit_room(Role = #role{m_provocation =
                               MProvocation = #m_provocation{triggers =
                                                                 Triggers}}) ->
    {Role1, _} = remove_trigger(all, Triggers, Role),
    Role2 = Role1#role{s_event = 65,
                       m_provocation =
                           MProvocation#m_provocation{room_id = 0, identity = 0,
                                                      triggers = []}},
    NRole = recover_publish(Role2),
    {ok, NRole}.

rpc_change_roominfo(#role{s_event = 66, id = Rid},
                    {RoomId,
                     RoomName,
                     RoomMode,
                     MinLev,
                     MinBreak,
                     MaxLev,
                     MaxBreak,
                     PassWord,
                     RoomType}) ->
    case cross:call(provocation_mgr,
                    call,
                    [{change_roominfo,
                      Rid,
                      RoomId,
                      RoomName,
                      RoomMode,
                      MinLev,
                      MinBreak,
                      MaxLev,
                      MaxBreak,
                      PassWord,
                      RoomType}])
        of
        {ok, _RoomInfo} -> ok;
        {false, Reason} -> {false, Reason}
    end;
rpc_change_roominfo(_Role, _) ->
    {false, lang:get("不在房间里，无法修改房间信息")}.

rpc_fast_join(Role = #role{s_event = 65,
                           m_team = #m_team{member_num = MemNum},
                           attr = #attr{fc = RFc}, lev = Lev,
                           m_lev_break = #m_lev_break{times = BreakTimes}}) ->
    Fc = pet_attr:calc_fc(Role) + RFc,
    case cross:call(provocation_mgr, call, [refresh_rooms])
        of
        {ok, RoomList} when RoomList =:= [] ->
            {false, lang:get("当前没有房间，可以自己建房")};
        {ok, RoomList} ->
            CalcList = [calc_room(R, {Lev, BreakTimes, Fc, MemNum})
                        || R = #provocation_room{status = Status, password = PW,
                                                 provocation_type = Type}
                               <- RoomList,
                           Status =:= 1 andalso PW =:= [] andalso Type =:= 0],
            case CalcList of
                [] -> {false, lang:get("当前没有合适的房间，可以自己建房")};
                _ ->
                    {FindId, _P} = lists:last(lists:reverse(lists:keysort(2,
                                                                          CalcList))),
                    logger:debug("~w", [_P], provocation_role, 321),
                    rpc_join_room(Role, {FindId, ""})
            end;
        _ -> {false, lang:get("请稍后尝试")}
    end;
rpc_fast_join(_Role) -> {false, lang:get("不在活动中")}.

rpc_kick_rival(#role{id = Rid, name = Name,
                     s_event = 66,
                     m_provocation = #m_provocation{room_id = RoomId}},
               KickRoleId) ->
    case cross:call(provocation_mgr,
                    call,
                    [{kick_rival, RoomId, KickRoleId, Rid}])
        of
        {ok, RoomInfo} ->
            role:apply(async,
                       KickRoleId,
                       {provocation_role, role_callback, [leave_room]}),
            CName = case ets:lookup(provocation_profile, KickRoleId)
                        of
                        [#provocation_profile{name = Name1}] -> Name1;
                        _ -> []
                    end,
            notice_room(RoomInfo,
                        notice:format(lang:get("~ts被房主~ts请离房间"),
                                      [{role_2, CName}, {role_2, Name}])),
            ok;
        {false, Reason} -> {false, Reason}
    end;
rpc_kick_rival(_Role, _) ->
    {false, lang:get("不在房间里，无法踢人")}.

rpc_publish_help(Role = #role{s_event = 66,
                              m_provocation = #m_provocation{room_id = RoomId}},
                 Channel, Flag) ->
    case cross:call(provocation_mgr,
                    call,
                    [{quest_roominfo, RoomId, 0}])
        of
        {ok,
         #provocation_room{name = RoomName, master_id = MRid,
                           customer_id = CRid}} ->
            case check_publish(Role, MRid, CRid, Flag, Channel) of
                ok ->
                    case Flag of
                        1 -> make_publish_data(Role, Channel, RoomName, 1000);
                        _ -> make_publish_data(Role, Channel, RoomName, 1001)
                    end;
                {false, Msg} -> {false, Msg}
            end;
        _ -> {false, lang:get("没查到房间信息")}
    end;
rpc_publish_help(_Role, _, _) ->
    {false, lang:get("不在房间里，无法发布招募")}.

rpc_team_ready(Role = #role{id = Rid,
                            assets = #assets{gold = Gold},
                            m_team = #m_team{pid = TPid}, s_event = 66,
                            m_provocation =
                                #m_provocation{room_id = RoomId}}) ->
    case cross:call(provocation_mgr,
                    call,
                    [{quest_roominfo, RoomId, 0}])
        of
        {ok,
         #provocation_room{provocation_type = Type,
                           target_rival = TargetId,
                           target_name = TargetName}} ->
            case Type of
                1 ->
                    case Gold >= 300 of
                        false -> {false, lang:get("钻石不足，不能准备")};
                        _ ->
                            Result = target_rival_check(Rid,
                                                        TargetId,
                                                        TPid,
                                                        TargetName),
                            case Result of
                                ok ->
                                    case cross:call(provocation_mgr,
                                                    call,
                                                    [{team_ready, RoomId, Rid}])
                                        of
                                        {ok, #provocation_room{}} ->
                                            convert_fighter_team(Role),
                                            ok;
                                        _ -> {false, lang:get("没查到房间信息")}
                                    end;
                                {false, Reason} -> {false, Reason}
                            end
                    end;
                _ ->
                    case cross:call(provocation_mgr,
                                    call,
                                    [{team_ready, RoomId, Rid}])
                        of
                        {ok, #provocation_room{}} ->
                            convert_fighter_team(Role),
                            ok;
                        _ -> {false, lang:get("没查到房间信息")}
                    end
            end;
        _ -> {false, lang:get("没查到房间信息")}
    end;
rpc_team_ready(_Role) ->
    {false, lang:get("不在房间里，无法准备")}.

rpc_get_roomlist(Role = #role{pid = RolePid, lev = Lev,
                              m_provocation =
                                  MProvocation = #m_provocation{room_check =
                                                                    Flag1,
                                                                book_check =
                                                                    Flag2,
                                                                video_check =
                                                                    Flag3},
                              m_team = #m_team{member_num = Num},
                              attr = #attr{fc = Fc},
                              m_lev_break = #m_lev_break{times = BreakTimes}},
                 InitFlag) ->
    case cross:call(provocation_mgr, call, [refresh_rooms])
        of
        {false, Reason} ->
            logger:error("请求房间列表出错:~w",
                         [Reason],
                         provocation_role,
                         404),
            {ok, [], Role};
        {ok, RoomList} when RoomList =:= [] ->
            logger:debug("当前房间列表为空", [], provocation_role, 407),
            {ok, [], Role};
        {ok, RoomList} ->
            NList = case Flag1 of
                        1 ->
                            PetFc = pet_attr:calc_fc(Role),
                            Mode = case Num > 1 of
                                       true -> 3;
                                       false -> 2
                                   end,
                            Args = #{lev => Lev, break_times => BreakTimes,
                                     fc => PetFc + Fc, mod => Mode},
                            check_room_list({1, 1, 0}, RoomList, Args);
                        _ -> RoomList
                    end,
            case InitFlag of
                1 ->
                    case NList of
                        [] ->
                            NRole = Role#role{m_provocation =
                                                  MProvocation#m_provocation{room_check
                                                                                 =
                                                                                 0}},
                            role:pack_send(RolePid, 20712, {2, Flag2, Flag3}),
                            {ok, RoomList, NRole};
                        _ -> {ok, NList, Role}
                    end;
                _ -> {ok, NList, Role}
            end
    end.

rpc_get_booklist(Role = #role{pid = RolePid, lev = Lev,
                              m_provocation =
                                  MProvocation = #m_provocation{room_check =
                                                                    Flag1,
                                                                book_check =
                                                                    Flag2,
                                                                video_check =
                                                                    Flag3},
                              m_team = #m_team{member_num = Num},
                              attr = #attr{fc = Fc},
                              m_lev_break = #m_lev_break{times = BreakTimes}},
                 InitFlag) ->
    case cross:call(provocation_mgr, call, [refresh_books])
        of
        {false, Reason} ->
            logger:error("请求战书列表出错:~w",
                         [Reason],
                         provocation_role,
                         437),
            {ok, [], Role};
        {ok, BookList} when BookList =:= [] ->
            logger:debug("当前战书列表为空", [], provocation_role, 440),
            {ok, [], Role};
        {ok, BookList} ->
            NList = case Flag2 of
                        1 ->
                            PetFc = pet_attr:calc_fc(Role),
                            Mode = case Num > 1 of
                                       true -> 3;
                                       false -> 2
                                   end,
                            Args = #{lev => Lev, break_times => BreakTimes,
                                     fc => PetFc + Fc, mod => Mode},
                            check_book_list({1, 1, 0}, BookList, Args);
                        _ -> BookList
                    end,
            case InitFlag of
                1 ->
                    case NList of
                        [] ->
                            NRole = Role#role{m_provocation =
                                                  MProvocation#m_provocation{book_check
                                                                                 =
                                                                                 0}},
                            role:pack_send(RolePid, 20712, {Flag1, 2, Flag3}),
                            {ok, BookList, NRole};
                        _ -> {ok, NList, Role}
                    end;
                _ -> {ok, NList, Role}
            end
    end.

rpc_get_vedioroom(Role = #role{pid = RolePid, lev = Lev,
                               m_provocation =
                                   MProvocation = #m_provocation{room_check =
                                                                     Flag1,
                                                                 book_check =
                                                                     Flag2,
                                                                 video_check =
                                                                     Flag3},
                               m_team = #m_team{member_num = Num},
                               attr = #attr{fc = Fc},
                               m_lev_break = #m_lev_break{times = BreakTimes}},
                  InitFlag) ->
    case cross:call(provocation_mgr, call, [refresh_rooms])
        of
        {false, Reason} ->
            logger:error("请求房间列表出错:~w",
                         [Reason],
                         provocation_role,
                         470),
            {ok, [], Role};
        {ok, RoomList} when RoomList =:= [] ->
            logger:debug("当前房间列表为空", [], provocation_role, 473),
            {ok, [], Role};
        {ok, RoomList} ->
            NRoomList = [R
                         || R = #provocation_room{status = 4} <- RoomList],
            NList = case Flag3 of
                        1 ->
                            PetFc = pet_attr:calc_fc(Role),
                            Mode = case Num > 1 of
                                       true -> 3;
                                       false -> 2
                                   end,
                            Args = #{lev => Lev, break_times => BreakTimes,
                                     fc => PetFc + Fc, mod => Mode},
                            check_room_list({1, 0, 0}, NRoomList, Args);
                        _ -> NRoomList
                    end,
            case InitFlag of
                1 ->
                    case NList of
                        [] ->
                            NRole = Role#role{m_provocation =
                                                  MProvocation#m_provocation{video_check
                                                                                 =
                                                                                 1}},
                            role:pack_send(RolePid, 20712, {Flag1, Flag2, 2}),
                            {ok, NRoomList, NRole};
                        _ -> {ok, NList, Role}
                    end;
                _ -> {ok, NList, Role}
            end
    end.

rpc_get_roominfo(Role = #role{id = Rid,
                              m_provocation =
                                  #m_provocation{room_id = RoomId}}) ->
    case cross:call(provocation_mgr,
                    call,
                    [{quest_roominfo, RoomId, Rid}])
        of
        {ok, _RoomInfo} -> ok;
        _ ->
            logger:error("没查到房间信息~w",
                         [RoomId],
                         provocation_role,
                         506),
            rpc_exit_room(Role)
    end.

rpc_get_checkflag(#role{m_provocation =
                            #m_provocation{room_check = Flag1,
                                           book_check = Flag2,
                                           video_check = Flag3}}) ->
    {ok, {Flag1, Flag2, Flag3}}.

rpc_combat_start(Role = #role{id = Rid = {_, P, Z},
                              name = Name, s_event = 66,
                              m_provocation =
                                  #m_provocation{room_id = RoomId}}) ->
    case cross:call(provocation_mgr,
                    call,
                    [{quest_roominfo, RoomId, 0}])
        of
        {ok,
         #provocation_room{provocation_type = Type,
                           status = Status, customer_id = CRid = {_, CP, CZ},
                           target_rival = TargetId,
                           target_name = TargetName}} ->
            convert_fighter_team(Role),
            case Type =:= 1 andalso Status =:= 3 of
                true ->
                    Result = case role_query:attr(by_id,
                                                  CRid,
                                                  [#role.m_team])
                                 of
                                 {ok, [#m_team{pid = TPid}]} ->
                                     target_rival_check(CRid,
                                                        TargetId,
                                                        TPid,
                                                        TargetName);
                                 _ -> {false, lang:get("未找到参赛者信息")}
                             end,
                    case Result of
                        ok ->
                            Loss = format:val_to_loss([{90002, 300}]),
                            role:send_buff_begin(),
                            case role_gain:do_notice(Loss, Role) of
                                {false, #loss{msg = Msg}} ->
                                    role:send_buff_clean(),
                                    {false, Msg};
                                {ok, Role2} ->
                                    role:send_buff_flush(),
                                    case role:apply(sync,
                                                    CRid,
                                                    {provocation_role,
                                                     role_callback,
                                                     [loss_idel_cost]})
                                        of
                                        {false, Reason} -> {false, Reason};
                                        {true, CName} ->
                                            case cross:call(provocation_mgr,
                                                            call,
                                                            [{start_combat,
                                                              Rid,
                                                              RoomId}])
                                                of
                                                ok ->
                                                    Msg1 =
                                                        notice:format(lang:get("东风吹战鼓擂！~ts与~ts的擂台决斗正式开始，吃瓜围观还能捡宝箱哟{face_1,112"
                                                                               "}{face_1,112}{face_1,112}"),
                                                                      [{role_2,
                                                                        Name},
                                                                       {role_2,
                                                                        CName}]),
                                                    notice:cast(all, 11, Msg1),
                                                    Msg2 =
                                                        notice:format(lang:get("东风吹战鼓擂！~ts与~ts的擂台决斗正式开始，吃瓜围观还能捡宝箱哟{face_1,112"
                                                                               "}{face_1,112}{face_1,112} ~ts"),
                                                                      [{role_2,
                                                                        Name},
                                                                       {role_2,
                                                                        CName},
                                                                       {action_1,
                                                                        lang:get("点击观战"),
                                                                        1,
                                                                        1}]),
                                                    notice:cast(all, 5, Msg2),
                                                    case
                                                        c_mirror:get_zone_mapping(P,
                                                                                  Z)
                                                            =:=
                                                            c_mirror:get_zone_mapping(CP,
                                                                                      CZ)
                                                        of
                                                        true -> ok;
                                                        _ ->
                                                            cross:cast(CP,
                                                                       CZ,
                                                                       notice,
                                                                       cast,
                                                                       [all,
                                                                        11,
                                                                        Msg1]),
                                                            cross:cast(CP,
                                                                       CZ,
                                                                       notice,
                                                                       cast,
                                                                       [all,
                                                                        5,
                                                                        Msg2])
                                                    end,
                                                    {ok, Role2};
                                                {false, Reason} ->
                                                    logger:debug("~ts",
                                                                 [Reason],
                                                                 provocation_role,
                                                                 555),
                                                    {false, Reason}
                                            end
                                    end
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                _ ->
                    case cross:call(provocation_mgr,
                                    call,
                                    [{start_combat, Rid, RoomId}])
                        of
                        ok -> ok;
                        {false, Reason} ->
                            logger:debug("~ts",
                                         [Reason],
                                         provocation_role,
                                         568),
                            {false, Reason}
                    end
            end;
        _ -> {false, lang:get("未找到该房间")}
    end;
rpc_combat_start(_Role) -> {false, lang:get("不在房间里")}.

rpc_change_check(Role = #role{m_provocation =
                                  MProvocation = #m_provocation{room_check =
                                                                    ORoomCheck,
                                                                book_check =
                                                                    OBookCheck,
                                                                video_check =
                                                                    OVideoCheck}},
                 {RoomCheck, BookCheck, VideoCheck}) ->
    NRole = Role#role{m_provocation =
                          MProvocation#m_provocation{room_check = RoomCheck,
                                                     book_check = BookCheck,
                                                     video_check = VideoCheck}},
    case ORoomCheck =/= RoomCheck of
        true -> push_room(NRole);
        _ -> ok
    end,
    case OBookCheck =/= BookCheck of
        true -> push_book(NRole);
        _ -> ok
    end,
    case OVideoCheck =/= VideoCheck of
        true -> push_vedio(NRole);
        _ -> ok
    end,
    {ok, NRole}.

rpc_cancel_ready(#role{s_event = 66, id = Rid,
                       m_provocation = #m_provocation{room_id = RoomId}}) ->
    case cross:call(provocation_mgr,
                    call,
                    [{cancel_ready, RoomId, Rid}])
        of
        {ok, _RoomInfo} -> ok;
        {false, Reason} -> {false, Reason}
    end;
rpc_cancel_ready(_Role) -> {false, lang:get("不在房间里")}.

rpc_replay_result(#role{m_combat =
                            #m_combat{pid = Pid}},
                  _Id)
    when is_pid(Pid) ->
    {false, lang:get("战斗中不能看录像")};
rpc_replay_result(#role{link =
                            #link{conn_pid = ConnPid}},
                  Id) ->
    logger:debug("录像", [], provocation_role, 609),
    case provocation_agent:get_result(Id) of
        #provocation_result{match_id = MatchId,
                            record_pz = {P, Z}}
            when MatchId =/= 0 ->
            logger:debug("录像~w", [MatchId], provocation_role, 612),
            case big_world:call(P,
                                Z,
                                combat_record,
                                fetch,
                                [{21, {MatchId, P, Z}}])
                of
                Record = #combat_record{} ->
                    logger:debug("录像", [], provocation_role, 615),
                    combat_record:replay(ConnPid, Record);
                _ -> {false, lang:get("录像已过期")}
            end;
        #provocation_result{match_id = MatchId, id = {_, P, Z}}
            when MatchId =/= 0 ->
            logger:debug("录像~w", [MatchId], provocation_role, 621),
            case big_world:call(P,
                                Z,
                                combat_record,
                                fetch,
                                [{21, MatchId}])
                of
                Record = #combat_record{} ->
                    combat_record:replay(ConnPid, Record);
                _ -> {false, lang:get("录像已过期")}
            end;
        _ -> {false, lang:get("找不到记录")}
    end.

rpc_invite_friend(Role = #role{id = Rid, name = Name,
                               lev = Lev, pid = Pid, s_event = 66,
                               m_provocation =
                                   MProvocation = #m_provocation{room_id =
                                                                     RoomId,
                                                                 invited_list =
                                                                     InvitedList}},
                  {InvitedId, Type}) ->
    logger:debug("====invite", [], provocation_role, 634),
    case check_invite(Role, InvitedId, Type) of
        {true, TRoleId} ->
            logger:debug("====invite", [], provocation_role, 637),
            Now = date:unixtime(),
            RoomType = case cross:call(provocation_mgr,
                                       call,
                                       [{quest_roominfo, RoomId, 0}])
                           of
                           {ok,
                            #provocation_room{provocation_type =
                                                  ProvocationType}} ->
                               ProvocationType;
                           _ -> 0
                       end,
            Data = {Rid, Name, Lev, Type, RoomType},
            NewInvitedList = case lists:keyfind(TRoleId,
                                                1,
                                                InvitedList)
                                 of
                                 {TRoleId, OTime} ->
                                     case Now - OTime < 10 of
                                         true ->
                                             notice:send({pid, Pid},
                                                         1,
                                                         util:flist("请勿给同一个人频繁发起邀请，~w秒后再尝试邀请",
                                                                    [OTime + 10
                                                                         -
                                                                         Now])),
                                             InvitedList;
                                         _ ->
                                             notice:send({pid, Pid},
                                                         1,
                                                         lang:get("发起邀请成功，请等待对方回应")),
                                             role:pack_send(TRoleId,
                                                            20721,
                                                            Data),
                                             lists:keyreplace(TRoleId,
                                                              1,
                                                              InvitedList,
                                                              {TRoleId, Now})
                                     end;
                                 _ ->
                                     notice:send({pid, Pid},
                                                 1,
                                                 lang:get("发起邀请成功，请等待对方回应")),
                                     role:pack_send(TRoleId, 20721, Data),
                                     [{TRoleId, Now} | InvitedList]
                             end,
            {ok,
             Role#role{m_provocation =
                           MProvocation#m_provocation{invited_list =
                                                          NewInvitedList}}};
        {false, Reason} ->
            logger:debug("~ts", [Reason], provocation_role, 664),
            {false, Reason}
    end;
rpc_invite_friend(_Role, _) ->
    {false, lang:get("不在房间里")}.

rpc_agree_invite(#role{name = Name},
                 {FRid, 0, _Type}) ->
    notice:send(FRid,
                1,
                util:flist("~ts暂时拒绝了您的邀请{face_1,2}", [Name]));
rpc_agree_invite(#role{m_team = #m_team{pid = Pid}},
                 {_, 1, 1})
    when is_pid(Pid) ->
    {false, lang:get("请先退队再加入")};
rpc_agree_invite(#role{id = Rid}, {Rid, _, _}) ->
    {false, lang:get("不能响应自己的邀请")};
rpc_agree_invite(Role = #role{id = Rid},
                 {FRid, 1, 1}) ->
    case role_query:attr(by_id,
                         FRid,
                         [#role.s_event, #role.m_team, #role.m_provocation])
        of
        {ok, [SEvent, _, _]} when SEvent =/= 66 ->
            {false, lang:get("对方已经离开房间，房间邀请已过期{face_1,2}")};
        {ok, [_, #m_team{member_num = Num}, _]} when Num >= 5 ->
            {false, lang:get("队伍人数已满，不能加入")};
        {ok,
         [_,
          #m_team{pid = Pid},
          #m_provocation{room_id = RoomId,
                         invited_list = InvitedList}]} ->
            case lists:keyfind(Rid, 1, InvitedList) of
                {Rid, _InvitedTime} ->
                    case cross:call(provocation_mgr,
                                    call,
                                    [{quest_roominfo, RoomId, 0}])
                        of
                        {ok, #provocation_room{status = Status}}
                            when Status =:= 4 ->
                            {false, lang:get("房间已经开战，请稍后再申请加入")};
                        {ok, _} ->
                            case erlang:is_pid(Pid) of
                                true -> do_invite_join(Role, Pid);
                                _ ->
                                    case role:apply(sync,
                                                    FRid,
                                                    {provocation_role,
                                                     role_callback,
                                                     [invite_creat_team]})
                                        of
                                        {ok, TeamPid} ->
                                            do_invite_join(Role, TeamPid);
                                        {false, _Reason} ->
                                            logger:debug("~ts",
                                                         _Reason,
                                                         provocation_role,
                                                         700),
                                            notice:send(FRid,
                                                        1,
                                                        lang:get("自动创建队伍失败，请创建队伍后再邀请")),
                                            {false, lang:get("对方建队异常，请稍后尝试")}
                                    end
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("房间邀请已过期{face_1,2}")}
            end;
        {error, not_found} -> {false, lang:get("邀请已失效，对方已经下线")};
        _ -> {false, lang:get("数据暂未支持互通，请下次更新后重试{face_1,3}")}
    end;
rpc_agree_invite(Role = #role{id = Rid,
                              s_event = Event},
                 {FRid, 1, 2}) ->
    case role_query:attr(by_id,
                         FRid,
                         [#role.s_event, #role.m_provocation])
        of
        {ok, [SEvent, _]} when SEvent =/= 66 ->
            {false, lang:get("对方已经离开房间，房间邀请已过期{face_1,2}")};
        {ok,
         [_,
          #m_provocation{room_id = RoomId,
                         invited_list = InvitedList}]} ->
            case lists:keyfind(Rid, 1, InvitedList) of
                {Rid, _InvitedTime} ->
                    case cross:call(provocation_mgr,
                                    call,
                                    [{quest_roominfo, RoomId, 0}])
                        of
                        {ok, #provocation_room{customer_id = CRid}}
                            when CRid =/= {0, "", 0} ->
                            {false, lang:get("房间人数已满")};
                        {ok, #provocation_room{password = PS}} ->
                            case Event of
                                65 -> rpc_join_room(Role, {RoomId, PS});
                                66 ->
                                    case rpc_exit_room(Role) of
                                        {ok, NRole} ->
                                            rpc_join_room(NRole, {RoomId, PS});
                                        {false, Reason} -> {false, Reason}
                                    end;
                                0 ->
                                    case rpc_enter(Role) of
                                        {ok, NRole} ->
                                            rpc_join_room(NRole, {RoomId, PS});
                                        {false, Reason} -> {false, Reason}
                                    end;
                                _ -> {false, lang:get("当前状态不能参加跨服约战")}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("房间邀请已过期{face_1,2}")}
            end;
        {error, not_found} -> {false, lang:get("邀请已失效，对方已经下线")};
        _ -> {false, lang:get("数据暂未支持互通，请下次更新后重试{face_1,3}")}
    end.

rpc_recommend_rival(Role = #role{id = MyId,
                                 attr = #attr{fc = Fc}, lev = Lev,
                                 m_lev_break =
                                     #m_lev_break{times = BreakTimes}}) ->
    TotalFc = Fc + pet_attr:calc_fc(Role),
    GroupLev = provocation_util:get_lev_group(Lev,
                                              BreakTimes),
    FcGroup = TotalFc div 1000 + 1,
    logger:debug("===", [], provocation_role, 759),
    case cross:call(provocation_mgr,
                    call,
                    [{recommend_rival, GroupLev, FcGroup, MyId}])
        of
        FList when is_list(FList) -> FList;
        _E ->
            logger:debug("~w", [_E], provocation_role, 763),
            false
    end.

rpc_get_result_role(#role{id = Rid}) ->
    case provocation_agent:get_result_role(Rid) of
        false -> [];
        #provocation_result_role{last_recent = LastRecent} ->
            LastRecent
    end.

rpc_create_book(#role{m_provocation =
                          #m_provocation{book_id = BookId}},
                _)
    when BookId =/= 0 ->
    {false, lang:get("你已经有战书了，不能再下了")};
rpc_create_book(Role = #role{id = Id, lev = Lev,
                             name = Name, sex = Sex, classes = Classes,
                             attr = #attr{fc = Fc},
                             m_head = #m_head{id_now = HeadId},
                             m_lev_break = #m_lev_break{times = BreakTimes},
                             m_provocation = MProvocation},
                {BookName,
                 BookMode,
                 MinLev,
                 MinBreak,
                 MaxLev,
                 MaxBreak,
                 IsSend,
                 ProvocationType}) ->
    PetFc = pet_attr:calc_fc(Role),
    case cross:call(provocation_mgr,
                    call,
                    [{create_book,
                      #{book_name => BookName, book_mode => BookMode,
                        book_lev_min => MinLev, min_lev_break => MinBreak,
                        book_lev_max => MaxLev, max_lev_break => MaxBreak,
                        break_times => BreakTimes, master_fc => Fc + PetFc,
                        master_id => Id, master_lev => Lev, master_name => Name,
                        master_sex => Sex, master_class => Classes,
                        master_head => HeadId,
                        provocation_type => ProvocationType}}])
        of
        {ok, #provocation_book{id = BookId}} ->
            NRole = Role#role{m_provocation =
                                  MProvocation#m_provocation{book_id = BookId}},
            push_book(NRole),
            case IsSend of
                1 -> send_book(NRole, BookName);
                _ -> {ok, NRole}
            end;
        {false, Reason} ->
            push_book(Role),
            {false, Reason}
    end.

rpc_change_bookinfo(#role{m_provocation =
                              #m_provocation{book_id = BookId2}},
                    {BookId1, _, _, _, _, _, _, _})
    when BookId1 =/= BookId2 ->
    {false, lang:get("不是自己的战书，不能修改")};
rpc_change_bookinfo(Role = #role{lev = Lev, name = Name,
                                 classes = Classes, attr = #attr{fc = Fc},
                                 m_head = #m_head{id_now = HeadId},
                                 m_lev_break =
                                     #m_lev_break{times = BreakTimes}},
                    {BookId,
                     BookName,
                     BookMode,
                     MinLev,
                     MinBreak,
                     MaxLev,
                     MaxBreak,
                     IsSend,
                     ProvocationType}) ->
    PetFc = pet_attr:calc_fc(Role),
    case cross:call(provocation_mgr,
                    call,
                    [{change_bookinfo,
                      #{id => BookId, book_name => BookName,
                        book_mode => BookMode, book_lev_min => MinLev,
                        min_lev_break => MinBreak, book_lev_max => MaxLev,
                        max_lev_break => MaxBreak, break_times => BreakTimes,
                        master_fc => Fc + PetFc, master_lev => Lev,
                        master_name => Name, master_class => Classes,
                        master_head => HeadId,
                        provocation_type => ProvocationType}}])
        of
        {ok, #provocation_book{}} ->
            push_book(Role),
            case IsSend of
                1 -> send_book(Role, BookName);
                _ -> {ok, Role}
            end;
        {false, Reason} ->
            push_book(Role),
            {false, Reason}
    end.

rpc_revoke_bookinfo(#role{m_provocation =
                              #m_provocation{book_id = BookId2}},
                    BookId1)
    when BookId1 =/= BookId2 ->
    {false, lang:get("不是自己的战书，不能撤销")};
rpc_revoke_bookinfo(Role = #role{m_provocation =
                                     MProvocation},
                    BookId) ->
    cross:cast(provocation_mgr,
               cast,
               [{revoke_bookinfo, BookId}]),
    NRole = Role#role{m_provocation =
                          MProvocation#m_provocation{book_id = 0}},
    {ok, NRole}.

rpc_preview_roominfo(#role{pid = RolePid}, RoomId) ->
    Data = case cross:call(provocation_mgr,
                           call,
                           [{quest_roominfo, RoomId, 0}])
               of
               {ok,
                RoomInfo = #provocation_room{customer_id = CRid}} ->
                   case CRid =/= {0, "", 0} of
                       true ->
                           case cross:call(provocation_mgr,
                                           call,
                                           [{get_provocation_profile, CRid}])
                               of
                               #provocation_profile{name = Name,
                                                    classes = Classes,
                                                    lev = Lev, sex = Sex,
                                                    head = HeadId} ->
                                   {RoomInfo, Lev, Name, Sex, Classes, HeadId};
                               _ ->
                                   logger:error("取信息出错",
                                                [],
                                                provocation_role,
                                                841),
                                   {RoomInfo, 0, "", 0, 0, 0}
                           end;
                       _ -> {RoomInfo, 0, "", 0, 0, 0}
                   end;
               _ -> {#provocation_room{}, 0, "", 0, 0, 0}
           end,
    logger:debug("~w", [Data], provocation_role, 849),
    role:pack_send(RolePid, 20729, Data).

rpc_watch(Role, RoomId) ->
    case cross:call(provocation_mgr,
                    call,
                    [{quest_roominfo, RoomId, 0}])
        of
        {ok, #provocation_room{pid = CombatPid}}
            when is_pid(CombatPid) ->
            {ok, Ob} = role_convert:to(c_observer, Role),
            CombatPid ! {observer_enter, Ob, #{}},
            combat_util:member_enter_ob(Role, CombatPid, false),
            ok;
        {ok, _} ->
            push_vedio(Role),
            {false, lang:get("战斗已结束")};
        _ ->
            push_vedio(Role),
            {false, lang:get("该房间已关闭")}
    end.

rpc_answer_publish(#role{m_provocation =
                             #m_provocation{room_id = RoomId}},
                   RoomId, _Type, _PassWord, _RecId) ->
    {false, lang:get("您已经在房间了，无需响应招募")};
rpc_answer_publish(Role = #role{link =
                                    #link{conn_pid = ConnPid},
                                s_event = Event,
                                m_team = #m_team{status = Status, pid = TPid},
                                m_combat = #m_combat{pid = Pid}},
                   RoomId, Type, _PassWord, RecId) ->
    case Type of
        1 ->
            case cross:call(provocation_mgr,
                            call,
                            [{quest_roominfo, RoomId, 0}])
                of
                {ok, #provocation_room{pid = CombatPid}}
                    when is_pid(CombatPid) ->
                    {ok, Ob} = role_convert:to(c_observer, Role),
                    CombatPid ! {observer_enter, Ob, #{}},
                    combat_util:member_enter_ob(Role, CombatPid, false),
                    ok;
                {ok, _} -> {false, lang:get("战斗已结束，稍后可查看录像{face_1,2}")};
                _ -> {false, lang:get("该房间已关闭")}
            end;
        2 ->
            case Status =:= 1 orelse erlang:is_pid(TPid) =:= false
                of
                true ->
                    case cross:call(provocation_mgr,
                                    call,
                                    [{quest_roominfo, RoomId, 0}])
                        of
                        {ok, #provocation_room{customer_id = CRid}}
                            when CRid =/= {0, "", 0} ->
                            {false, lang:get("被人抢先一步应战，稍后可观战{face_1,4}")};
                        {ok, #provocation_room{password = PS}} ->
                            case Event of
                                65 -> rpc_join_room(Role, {RoomId, PS});
                                66 ->
                                    case rpc_exit_room(Role) of
                                        {ok, NRole} ->
                                            rpc_join_room(NRole, {RoomId, PS});
                                        {false, Reason} -> {false, Reason}
                                    end;
                                0 ->
                                    case rpc_enter(Role) of
                                        {ok, NRole} ->
                                            rpc_join_room(NRole, {RoomId, PS});
                                        {false, Reason} -> {false, Reason}
                                    end;
                                _ -> {false, lang:get("当前状态不能参加跨服约战")}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("正在跟随队伍中，不能应战")}
            end;
        3 ->
            case is_pid(Pid) of
                true -> {false, lang:get("战斗中不能看录像")};
                _ ->
                    {_, P, Z} = RecId,
                    case big_world:call(P,
                                        Z,
                                        combat_record,
                                        fetch,
                                        [{21, RecId}])
                        of
                        Record = #combat_record{} ->
                            logger:debug("录像", [], provocation_role, 927),
                            combat_record:replay(ConnPid, Record),
                            ok;
                        _ -> {false, lang:get("录像已过期")}
                    end
            end;
        4 -> {false, lang:get("双方准备中，稍后可观战{face_1,25}")}
    end.

rpc_use_horn(Role = #role{id = Rid = {_, P, Z},
                          lev = Lev, name = Name,
                          m_provocation =
                              MProvocation = #m_provocation{room_id = RoomId,
                                                            invited_list =
                                                                InvitedList}},
             Target) ->
    logger:debug("=====~w,~w",
                 [Target, RoomId],
                 provocation_role,
                 941),
    TResult = case check_room(RoomId, Rid) of
                  ok ->
                      case Target of
                          TRid = {_, _, _} ->
                              case role_query:attr(by_id, Target, [#role.name])
                                  of
                                  {ok, [TName]} -> {ok, TName, TRid};
                                  _ -> {false, lang:get("角色不在线")}
                              end;
                          TName when is_list(TName) ->
                              case TName =:= Name of
                                  true -> {false, lang:get("不能对自己使用")};
                                  _ ->
                                      case ets:match_object(role_id_index,
                                                            #id_index{name =
                                                                          TName,
                                                                      _ = '_'})
                                          of
                                          [#id_index{id = TRid}] ->
                                              {ok, TName, TRid};
                                          _ ->
                                              case ets:lookup(friend_role_index,
                                                              {TName, P, Z})
                                                  of
                                                  [{_, _Id}] ->
                                                      {false,
                                                       lang:get("角色不在线")};
                                                  _ ->
                                                      {false,
                                                       lang:get("不存在的角色名")}
                                              end
                                      end
                              end;
                          _ -> {false, lang:get("请输入正确名字")}
                      end;
                  {false, Reason} -> {false, Reason}
              end,
    case TResult of
        {ok,
         TargetName,
         TargetRid = {_, TargetPlat, TargetZone}} ->
            case do_cost(Role, 500) of
                {ok, Role2} ->
                    Data = {Rid, Name, Lev, 2, 2},
                    Msg1 =
                        notice:format(lang:get("东风吹战鼓擂，~ts对你发起了[擂台决斗]，TA已创建好房间，可在30分钟内前往应战，否则"
                                               "对方将不战而胜\n ~ts"),
                                      [{role_2, Name},
                                       {action_1, lang:get("点击前往应战"), 1, 1}]),
                    Msg2 =
                        notice:format(lang:get("擂台战书：~ts对~ts发起了擂台决斗，~ts可在一小时内前往跨服擂台迎战{face_1,"
                                               "7}{face_1,7}{face_1,7}"),
                                      [{role_2, Name},
                                       {role_2, TargetName},
                                       {role_2, TargetName}]),
                    mail:send(TargetRid,
                              #{title => lang:get("擂台决战邀请函！"), content => Msg1,
                                items => []}),
                    make_cast(Msg2, P, Z, TargetPlat, TargetZone),
                    cross:cast(provocation_mgr,
                               cast,
                               [{target,
                                 Rid,
                                 TargetRid,
                                 Name,
                                 TargetName,
                                 RoomId}]),
                    NewInvitedList = case lists:keyfind(TargetRid,
                                                        1,
                                                        InvitedList)
                                         of
                                         {TargetRid, _} ->
                                             lists:keyreplace(TargetRid,
                                                              1,
                                                              InvitedList,
                                                              {TargetRid,
                                                               date:unixtime2()});
                                         _ ->
                                             [{TargetRid, date:unixtime2()}
                                              | InvitedList]
                                     end,
                    NMProvocation = MProvocation#m_provocation{invited_list
                                                                   =
                                                                   NewInvitedList},
                    Role3 = Role2#role{m_provocation = NMProvocation},
                    Role4 = role_trigger:fire(#evt_provocation_use_horn{},
                                              Role3),
                    role:pack_send(TargetRid, 20721, Data),
                    {ok, Role4};
                {false, Msg} -> {false, Msg}
            end;
        {false, Msg} -> {false, Msg}
    end.

async_create_room(Role = #role{m_provocation =
                                   MProvocation = #m_provocation{triggers =
                                                                     Triggers}},
                  RoomId) ->
    provocation_agent:update_role_profile(Role, false),
    {Role1, NewTriggers} = add_trigger([evt_team_appoint,
                                        evt_team_leave,
                                        evt_team_away],
                                       Role,
                                       Triggers),
    NRole = Role1#role{s_event = 66,
                       m_provocation =
                           MProvocation#m_provocation{room_id = RoomId,
                                                      identity = 1,
                                                      triggers = NewTriggers}},
    map:role_update(NRole),
    {ok, NRole}.

async_join_room(Role = #role{m_provocation =
                                 MProvocation = #m_provocation{triggers =
                                                                   Triggers}},
                #provocation_room{id = RoomId}) ->
    logger:debug("=======", [], provocation_role, 1013),
    provocation_agent:update_role_profile(Role, false),
    {Role1, NewTriggers} = add_trigger([evt_team_appoint,
                                        evt_team_leave,
                                        evt_team_away],
                                       Role,
                                       Triggers),
    NRole = Role1#role{s_event = 66,
                       m_provocation =
                           MProvocation#m_provocation{room_id = RoomId,
                                                      identity = 2,
                                                      triggers = NewTriggers}},
    map:role_update(NRole),
    {ok, NRole}.

async_take_over_room(Role = #role{m_provocation =
                                      MProvocation}) ->
    NRole = Role#role{m_provocation =
                          MProvocation#m_provocation{identity = 1}},
    {ok, NRole}.

async_leave_room(Role = #role{m_provocation =
                                  #m_provocation{triggers = Triggers}}) ->
    {Role1, _NewTriggers} = remove_trigger(all,
                                           Triggers,
                                           Role),
    NRole = Role1#role{s_event = 65,
                       m_provocation =
                           #m_provocation{room_id = 0, identity = 0,
                                          triggers = []}},
    map:role_update(NRole),
    {ok, NRole}.

evt_callback(#evt_team_leave{},
             Role = #role{id = Rid, m_team = #m_team{pid = _Pid},
                          s_event = 66,
                          m_provocation =
                              MProvocation = #m_provocation{room_id = RoomId,
                                                            triggers =
                                                                Triggers}}) ->
    logger:debug("===~w", [_Pid], provocation_role, 1034),
    case cross:call(provocation_mgr,
                    call,
                    [{quest_roominfo, RoomId, 0}])
        of
        {ok,
         #provocation_room{master_id = MId,
                           master_team_pid = MTid}}
            when MTid =/= undefined andalso Rid =:= MId ->
            logger:debug("===", [], provocation_role, 1038),
            do_leader_leave(Role, MTid);
        {ok,
         #provocation_room{customer_id = CId,
                           customer_team_pid = CTid}}
            when CTid =/= undefined andalso Rid =:= CId ->
            logger:debug("===", [], provocation_role, 1042),
            do_leader_leave(Role, CTid);
        {ok, #provocation_room{make_horn_role = HornRole}} ->
            logger:debug("===", [], provocation_role, 1046),
            {Role1, NewTriggers} = remove_trigger(all,
                                                  Triggers,
                                                  Role),
            NRole = Role1#role{s_event = 65,
                               m_provocation =
                                   MProvocation#m_provocation{room_id = 0,
                                                              identity = 0,
                                                              triggers =
                                                                  NewTriggers}},
            map:role_update(NRole),
            case HornRole =:= Rid of
                true ->
                    cross:cast(provocation_mgr,
                               cast,
                               [{cancle_room_horn, RoomId}]);
                _ ->
                    cross:cast(provocation_mgr,
                               cast,
                               [{cancle_room_ready, RoomId}])
            end,
            {ok, NRole};
        _ ->
            {Role1, NewTriggers} = remove_trigger(all,
                                                  Triggers,
                                                  Role),
            NRole = Role1#role{s_event = 65,
                               m_provocation =
                                   MProvocation#m_provocation{room_id = 0,
                                                              identity = 0,
                                                              triggers =
                                                                  NewTriggers}},
            map:role_update(NRole),
            {ok, NRole}
    end;
evt_callback(#evt_team_appoint{status = 1},
             Role = #role{id = Rid, s_event = 66,
                          m_team = #m_team{pid = TPid},
                          m_provocation =
                              MProvocation = #m_provocation{room_id = RoomId,
                                                            identity = Identity,
                                                            triggers =
                                                                Triggers}}) ->
    logger:debug("===", [], provocation_role, 1066),
    cross:cast(provocation_mgr,
               cast,
               [{take_over_team, RoomId, Rid, TPid, Identity}]),
    {Role1, NewTriggers} = add_trigger([evt_team_join,
                                        evt_team_follow],
                                       Role,
                                       Triggers),
    NRole = Role1#role{s_event = 66,
                       m_provocation =
                           MProvocation#m_provocation{triggers = NewTriggers}},
    {ok, NRole};
evt_callback(#evt_team_appoint{},
             Role = #role{s_event = 66,
                          m_provocation =
                              MProvocation = #m_provocation{triggers =
                                                                Triggers}}) ->
    logger:debug("===", [], provocation_role, 1074),
    {Role1, NewTriggers} = remove_trigger([evt_team_join,
                                           evt_team_follow],
                                          Triggers,
                                          Role),
    NRole = Role1#role{s_event = 66,
                       m_provocation =
                           MProvocation#m_provocation{triggers = NewTriggers}},
    {ok, NRole};
evt_callback(#evt_team_away{},
             #role{s_event = 66,
                   m_provocation = #m_provocation{room_id = RoomId}}) ->
    logger:debug("检查到队员暂离", [], provocation_role, 1081),
    cross:cast(provocation_mgr,
               cast,
               [{push_room_info, RoomId}]),
    ok;
evt_callback(#evt_team_follow{},
             #role{s_event = 66,
                   m_provocation = #m_provocation{room_id = RoomId}}) ->
    logger:debug("检查到归队", [], provocation_role, 1087),
    cross:cast(provocation_mgr,
               cast,
               [{push_room_info, RoomId}]),
    ok;
evt_callback(#evt_team_join{pid = Pid},
             #role{s_event = 66,
                   m_provocation =
                       #m_provocation{room_id = RoomId,
                                      identity = Identity}}) ->
    role:apply(async,
               Pid,
               {provocation_role,
                role_callback,
                [{join_team, RoomId, Identity}]}),
    ok;
evt_callback(_Event, _Role) ->
    logger:error("未知事件~w",
                 [_Event],
                 provocation_role,
                 1097),
    ok.

role_callback(Role = #role{m_provocation =
                               MProvocation = #m_provocation{triggers =
                                                                 Triggers}},
              {join_team, RoomId, Identity}) ->
    cross:cast(provocation_mgr,
               cast,
               [{cancle_room_ready, RoomId}]),
    {Role1, NewTriggers} = add_trigger([evt_team_appoint,
                                        evt_team_leave,
                                        evt_team_away],
                                       Role,
                                       Triggers),
    NRole = Role1#role{s_event = 66,
                       m_provocation =
                           MProvocation#m_provocation{room_id = RoomId,
                                                      identity = Identity,
                                                      triggers = NewTriggers}},
    map:role_update(NRole),
    {ok, NRole};
role_callback(Role = #role{s_event = 66,
                           m_team = #m_team{pid = TPid},
                           m_provocation = MProvocation},
              take_over_room) ->
    Role1 = Role#role{m_provocation =
                          MProvocation#m_provocation{identity = 1}},
    case is_pid(TPid) of
        false ->
            case team_mgr:create(Role1) of
                {ok, NRole} -> {ok, NRole};
                _Else ->
                    logger:error("创建队伍失败 ~w",
                                 [_Else],
                                 provocation_role,
                                 1117),
                    case rpc_exit_room(Role1) of
                        {ok, NewRole} -> {ok, NewRole};
                        {false, Reason} ->
                            logger:error("离开房间失败 ~w",
                                         [Reason],
                                         provocation_role,
                                         1121),
                            {ok, Role1}
                    end
            end;
        true ->
            Members = team:get_members(Role1),
            [role:apply(async,
                        MatePid,
                        {provocation_role, async_take_over_room, []})
             || #team_mate{pid = MatePid} <- Members,
                is_pid(MatePid)],
            {ok, Role1}
    end;
role_callback(Role = #role{s_event = 66,
                           m_provocation = #m_provocation{triggers = Triggers}},
              leave_room) ->
    Members = team:get_members(Role),
    [role:apply(async,
                MatePid,
                {provocation_role, async_leave_room, []})
     || #team_mate{pid = MatePid} <- Members,
        is_pid(MatePid)],
    {Role1, _NewTriggers} = remove_trigger(all,
                                           Triggers,
                                           Role),
    NRole = Role1#role{s_event = 65,
                       m_provocation =
                           #m_provocation{room_id = 0, identity = 0,
                                          triggers = []}},
    map:role_update(NRole),
    {ok, NRole};
role_callback(Role = #role{id = Rid, name = Name,
                           sex = Sex, classes = Classes,
                           m_head = #m_head{id_now = HeadId}, pid = RolePid},
              {combat_over,
               #{type := Type, mates := Mates, rival := Rival,
                 match_id := MatchId, best := Best,
                 record_pz := {RP, RZ}, pk_type := PkType}}) ->
    logger:debug("~w", [Name], provocation_role, 1142),
    Result = case Type of
                 win -> 1;
                 _ -> 0
             end,
    ProResult = #provocation_result{is_win = Result,
                                    mates = Mates, rival = Rival,
                                    match_id = MatchId, record_pz = {RP, RZ},
                                    time = date:unixtime()},
    save_result(Rid,
                {Name, Sex, Classes, HeadId, Best},
                ProResult),
    role:pack_send(RolePid,
                   20714,
                   {Result, 21, MatchId, RP, RZ, Mates, Rival}),
    Role2 = role_trigger:fire(#evt_provocation_times{},
                              Role),
    Role3 = case PkType =:= 1 andalso Result =:= 1 of
                true ->
                    logger:debug("========", [], provocation_role, 1153),
                    role_trigger:fire(#evt_provocation_duel_win{}, Role2);
                _ -> Role2
            end,
    NRole = case length([M
                         || M = #provocation_fighter{id = {_, _P1, _Z1}}
                                <- Mates,
                            _P1 =/= "" andalso _Z1 =/= 0])
                     >= 5
                     andalso
                     length([R
                             || R = #provocation_fighter{id = {_, _P2, _Z2}}
                                    <- Rival,
                                _P2 =/= "" andalso _Z2 =/= 0])
                         >= 5
                of
                true ->
                    Role4 = role_trigger:fire(#evt_provocation_5v5{},
                                              Role3),
                    case PkType =:= 1 andalso Result =:= 1 of
                        true ->
                            logger:debug("========",
                                         [],
                                         provocation_role,
                                         1163),
                            role_trigger:fire(#evt_provocation_duel_5v5_win{},
                                              Role4);
                        _ -> Role4
                    end;
                _ -> Role3
            end,
    {ok, NRole};
role_callback(Role, invite_creat_team) ->
    case team_mgr:create(Role) of
        {ok, NRole = #role{m_team = #m_team{pid = Pid}}} ->
            {ok, {ok, Pid}, NRole};
        {false, Reason} ->
            logger:error("创建队伍失败 ~w",
                         [Reason],
                         provocation_role,
                         1179),
            {ok, {false, Reason}};
        Else ->
            logger:error("创建队伍失败 ~w",
                         [Else],
                         provocation_role,
                         1182),
            {ok, {false, Else}}
    end;
role_callback(#role{s_event = Event}, join_to_follow)
    when Event =:= 66 orelse Event =:= 65 ->
    logger:debug("===", [], provocation_role, 1188),
    ok;
role_callback(Role, join_to_follow) ->
    logger:debug("====", [], provocation_role, 1191),
    case role_misc:check_event(Role) of
        {false, Reason} ->
            logger:debug("~w", [Reason], provocation_role, 1194),
            notice:send(Role, 3, Reason),
            ok;
        true ->
            case rpc_enter(Role) of
                {false, Reason} ->
                    logger:debug("~w", [Reason], provocation_role, 1200),
                    notice:send(Role, 3, Reason),
                    ok;
                {ok, NRole} -> {ok, NRole}
            end
    end;
role_callback(Role = #role{name = Name, s_event = 66},
              loss_idel_cost) ->
    Loss = format:val_to_loss([{90002, 300}]),
    role:send_buff_begin(),
    case role_gain:do_notice(Loss, Role) of
        {false, #loss{msg = Msg}} ->
            role:send_buff_clean(),
            {ok, {false, Msg}, Role};
        {ok, Role2} ->
            role:send_buff_flush(),
            {ok, {true, Name}, Role2}
    end;
role_callback(Role, loss_idel_cost) ->
    {ok, {false, lang:get("状态错误")}, Role};
role_callback(Role = #role{}, {duel_win, LossRid}) ->
    case cross_arena_data:get_gift(1) of
        {GiftId, Bind, GiftNum} ->
            Gain = [#gain{label = item_base_id,
                          val =
                              [#{base_id => 70150, bind => 1, quantity => 1,
                                 data => [LossRid]}]},
                    #gain{label = item_base_id,
                          val = [{GiftId, Bind, GiftNum}]}],
            case role_gain:do_notice(Gain, Role) of
                {false, #gain{msg = _Msg}} ->
                    role:send_buff_clean(),
                    NewItem = case item:make(70150, 1, 1) of
                                  {ok, [Item]} ->
                                      Item2 = Item#item{data = [LossRid]},
                                      [{GiftId, Bind, GiftNum}, Item2];
                                  _ -> [{GiftId, Bind, GiftNum}]
                              end,
                    mail:send(Role,
                              #{title => lang:get("决斗获胜奖励"),
                                content =>
                                    lang:get("恭喜您在决斗中大获全胜，全服玩家都目睹了您的风采，作为胜方队长，您获得了以下奖励"),
                                items => NewItem}),
                    {ok, Role};
                {ok, Role2} ->
                    role:send_buff_flush(),
                    {ok, Role2}
            end;
        _ -> ok
    end;
role_callback(Role, horn_reward) ->
    case cross_arena_data:get_gift(2) of
        {GiftId, Bind, GiftNum} ->
            Gain = format:val_to_gain([{GiftId, Bind, GiftNum}]),
            case role_gain:do_notice(Gain, Role) of
                {false, #gain{msg = _Msg}} ->
                    role:send_buff_clean(),
                    Items = [{GiftId, Bind, GiftNum}],
                    mail:send(Role,
                              #{title => lang:get("决斗挑战成功"),
                                content =>
                                    lang:get("恭喜您在自己发起的决斗中获胜，作为决斗发起者，您额外获得了以下奖励"),
                                items => Items}),
                    {ok, Role};
                {ok, Role2} ->
                    role:send_buff_flush(),
                    {ok, Role2}
            end;
        _ -> ok
    end;
role_callback(Role, expire_horn) ->
    case cross_arena_data:get_gift(3) of
        {GiftId, Bind, GiftNum} ->
            Gain = format:val_to_gain([{GiftId, Bind, GiftNum}]),
            case role_gain:do_notice(Gain, Role) of
                {false, #gain{msg = _Msg}} ->
                    role:send_buff_clean(),
                    Items = [{GiftId, Bind, GiftNum}],
                    mail:send(Role,
                              #{title => lang:get("战书喇叭自动胜利宝箱"),
                                content => lang:get("背包已满，奖励通过邮件发放"),
                                items => Items}),
                    {ok, Role};
                {ok, Role2} ->
                    role:send_buff_flush(),
                    {ok, Role2}
            end;
        _ -> ok
    end;
role_callback(_Role, _ERR) ->
    logger:error("未知回调~w", [_ERR], provocation_role, 1286),
    ok.

async_enter_provocation(Role = #role{cross_type = 0},
                        #{pos := ToPos, team_pid := TeamPid,
                          cross_type := CrossType, status := Status}) ->
    logger:debug("==========", [], provocation_role, 1291),
    case Status of
        2 ->
            logger:debug("========", [], provocation_role, 1294),
            case map:role_enter({_, _, MapId, _, _} = ToPos,
                                self,
                                Role#role{s_event = 65, cross_type = CrossType})
                of
                {error, Reason} ->
                    logger:debug("==========", [], provocation_role, 1297),
                    {false, Reason};
                {ok, MapRole} ->
                    logger:debug("===========", [], provocation_role, 1300),
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
                                                        provocation_role,
                                                        1309),
                                           LeaveTeamRole#role{m_team =
                                                                  #m_team{pid =
                                                                              TeamPid}};
                                       {ok, _JoinTeamRole} ->
                                           logger:debug("加入队伍成功",
                                                        [],
                                                        provocation_role,
                                                        1312),
                                           _JoinTeamRole#role{m_team =
                                                                  #m_team{pid =
                                                                              TeamPid}};
                                       _Err ->
                                           logger:debug("加入队伍失败:~w",
                                                        [_Err],
                                                        provocation_role,
                                                        1315),
                                           LeaveTeamRole
                                   end,
                    FlyRole = case role_fly:force_landing(JoinTeamRole) of
                                  {ok, _Role} -> _Role;
                                  _ -> JoinTeamRole
                              end,
                    NewRole = FlyRole#role{m_provocation =
                                               #m_provocation{map_id = MapId}},
                    role_misc:push_cross(NewRole),
                    {ok, MemberInfo} = role_convert:to(member, NewRole),
                    cross:cast(role_group,
                               join,
                               [center_world, MemberInfo]),
                    {ok, NewRole}
            end;
        _ ->
            logger:debug("=====", [], provocation_role, 1329),
            Msg = lang:get("由于队长进入了跨服约战，你离开了队伍"),
            LeaveTeamRole = case team:async_leave(Role, Msg) of
                                {ok, _LeaveTeamRole} -> _LeaveTeamRole;
                                _Else -> Role
                            end,
            {ok, LeaveTeamRole}
    end.

init() -> #m_provocation{}.

login(Role = #role{id = Rid,
                   m_provocation =
                       MProvocation = #m_provocation{book_id = BookId}})
    when BookId =/= 0 ->
    NMProvocation = case cross:call(provocation_mgr,
                                    call,
                                    [{login_book, Rid, BookId}])
                        of
                        ok -> MProvocation;
                        false -> MProvocation#m_provocation{book_id = 0};
                        _ -> MProvocation
                    end,
    {ok, Role#role{m_provocation = NMProvocation}};
login(Role) ->
    Flag = var:get_var(Role, other, 2118, 0),
    case Flag =:= 0 of
        true ->
            Role2 = var:set_var(Role, other, 2118, 1),
            provocation_agent:update_role_profile(Role, false),
            {ok, Role2};
        false -> ok
    end.

logout(Role = #role{s_event = 66}) ->
    Role1 = do_logout_room(Role),
    Role2 = do_logout_book(Role1),
    Role3 = do_logout_map(Role2),
    {ok, Role3};
logout(Role = #role{s_event = 65}) ->
    Role1 = do_logout_book(Role),
    Role2 = do_logout_map(Role1),
    {ok, Role2};
logout(Role) ->
    Role1 = do_logout_book(Role),
    {ok, Role1}.

zero_flush(Role = #role{m_provocation = MProvocation},
           _) ->
    NMProvocation =
        MProvocation#m_provocation{pick_batch_list = [],
                                   pick_box_num = 0, pick_packet_num = 0,
                                   book_check = 0, video_check = 0},
    {ok, Role#role{m_provocation = NMProvocation}};
zero_flush(_, _) -> ok.

make_red_packet(#role{id = WinRid, name = Name},
                Data) ->
    LossRid = case Data of
                  [_LossRid = {_, _, _}] -> _LossRid;
                  _ -> {0, "", 0}
              end,
    case cross:call(provocation_mgr,
                    call,
                    [{make_red_packet, WinRid, Name, LossRid}])
        of
        true -> ok;
        false -> ok
    end.

create_team(Role = #role{id = Rid, s_event = 66,
                         m_team = #m_team{pid = TPid},
                         m_provocation =
                             MProvocation = #m_provocation{identity = Identity,
                                                           room_id = RoomId,
                                                           triggers =
                                                               Triggers}})
    when is_pid(TPid) ->
    cross:cast(provocation_mgr,
               cast,
               [{change_room_mod, RoomId, Rid, Identity, 3, TPid}]),
    {Role1, NewTriggers} = add_trigger([evt_team_join,
                                        evt_team_appoint,
                                        evt_team_leave,
                                        evt_team_away,
                                        evt_team_follow],
                                       Role,
                                       Triggers),
    Role1#role{m_provocation =
                   MProvocation#m_provocation{triggers = NewTriggers}};
create_team(Role) ->
    logger:debug("不是在房间里建队", [], provocation_role, 1408),
    Role.

check_pick(Role = #role{m_provocation =
                            #m_provocation{map_id = MapId,
                                           pick_batch_list = PickedList,
                                           pick_box_num = BoxNum,
                                           pick_packet_num = PacketNum}},
           PickArgs = #{uid := UnitId, base_id := BaseId}) ->
    case cross:call(provocation_mgr,
                    call,
                    [{check_box, MapId, UnitId}])
        of
        {true, Type, BatchId} ->
            Check1 = case Type of
                         1 ->
                             case BoxNum >= 5 of
                                 true ->
                                     {false,
                                      lang:get("今天已领取5次奖励，明天再来吧{face_1,112}")};
                                 _ -> ok
                             end;
                         _ ->
                             case PacketNum >= 5 of
                                 true ->
                                     {false,
                                      lang:get("今天已领取5次奖励，明天再来吧{face_1,112}")};
                                 _ -> ok
                             end
                     end,
            case Check1 of
                ok ->
                    case lists:member(BatchId, PickedList) of
                        true -> {false, lang:get("已领取一次奖励，给别人留点吧{face_1,3}")};
                        _ ->
                            GainList = cross_arena_data:get_gain(BaseId),
                            GainList1 = check_role_cond(Role, GainList),
                            case util:rand_list(GainList1, 5) of
                                {GainBaseId, Bind, Num, IsCast, _, _} ->
                                    GainBaseId1 =
                                        item_type:special_id(GainBaseId),
                                    {true,
                                     PickArgs#{get_base_id => GainBaseId1,
                                               get_bind => Bind, get_num => Num,
                                               is_cast => IsCast,
                                               box_type => Type,
                                               batch_id => BatchId}};
                                _ -> {false, lang:get("没有找到可以拾取的道具")}
                            end
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

pick_gain(Role = #role{name = RoleName,
                       m_provocation =
                           MProvocation = #m_provocation{map_id = MapId,
                                                         pick_batch_list =
                                                             PickedList,
                                                         pick_box_num = BoxNum,
                                                         pick_packet_num =
                                                             PacketNum}},
          #{uid := UnitId, get_base_id := GainBaseId,
            get_bind := Bind, get_num := Num, is_cast := IsCast,
            box_type := Type, batch_id := BatchId}) ->
    cross:cast(provocation_mgr,
               cast,
               [{pick_box, MapId, UnitId}]),
    NRole = case Type of
                1 ->
                    NMProvocation = MProvocation#m_provocation{pick_box_num
                                                                   = BoxNum + 1,
                                                               pick_batch_list =
                                                                   [BatchId
                                                                    | PickedList]},
                    Role#role{m_provocation = NMProvocation};
                _ ->
                    NMProvocation =
                        MProvocation#m_provocation{pick_packet_num =
                                                       PacketNum + 1,
                                                   pick_batch_list =
                                                       [BatchId | PickedList]},
                    Role#role{m_provocation = NMProvocation}
            end,
    Gain = format:val_to_gain([{GainBaseId, Bind, Num}]),
    case role_gain:do_notice(Gain, NRole) of
        {ok, Role1} ->
            cast_gain(RoleName, GainBaseId, Num, IsCast, Type),
            {ok, Role1};
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("跨服约战宝箱"),
            Content = lang:get("采集宝箱时，背包空间已满"),
            Items = [{GainBaseId, Bind, Num}],
            mail:send(NRole,
                      #{title => Title, content => Content, items => Items}),
            cast_gain(RoleName, GainBaseId, Num, IsCast, Type),
            {ok, NRole};
        _ -> {ok, Role}
    end;
pick_gain(Role, _) -> {ok, Role}.

apply_team_mate_enter(_,
                      Role = #role{m_provocation = MProvocation}, _, MapId) ->
    NewRole = Role#role{s_event = 65, cross_type = 1,
                        m_provocation =
                            MProvocation#m_provocation{map_id = MapId}},
    map:role_update(NewRole),
    {ok, NewRole}.

apply_team_mate_leave(_, Role, _) ->
    logger:debug("离开地图=======", [], provocation_role, 1490),
    NewRole = Role#role{s_event = 0,
                        m_provocation =
                            #m_provocation{room_id = 0, identity = 0,
                                           triggers = [], map_id = 0,
                                           room_check = 1, book_check = 1,
                                           video_check = 1, invited_list = []}},
    map:role_update(NewRole),
    {ok, NewRole}.

push_room(Role = #role{pid = RolePid,
                       m_provocation = #m_provocation{room_check = Flag},
                       lev = Lev, m_team = #m_team{member_num = Num},
                       attr = #attr{fc = Fc},
                       m_lev_break = #m_lev_break{times = BreakTimes}}) ->
    case cross:call(provocation_mgr, call, [refresh_rooms])
        of
        {false, Reason} ->
            logger:error("请求房间列表出错:~w",
                         [Reason],
                         provocation_role,
                         1513),
            role:pack_send(RolePid, 20700, {[]});
        {ok, RoomList} when RoomList =:= [] ->
            logger:debug("当前房间列表为空", [], provocation_role, 1516),
            role:pack_send(RolePid, 20700, {[]});
        {ok, RoomList} ->
            NList = case Flag of
                        1 ->
                            PetFc = pet_attr:calc_fc(Role),
                            Mode = case Num > 1 of
                                       true -> 3;
                                       false -> 2
                                   end,
                            Args = #{lev => Lev, break_times => BreakTimes,
                                     fc => PetFc + Fc, mod => Mode},
                            check_room_list({1, 1, 0}, RoomList, Args);
                        _ -> RoomList
                    end,
            role:pack_send(RolePid, 20700, {NList})
    end.

push_book(Role = #role{pid = RolePid,
                       m_provocation = #m_provocation{book_check = Flag},
                       lev = Lev, m_team = #m_team{member_num = Num},
                       attr = #attr{fc = Fc},
                       m_lev_break = #m_lev_break{times = BreakTimes}}) ->
    case cross:call(provocation_mgr, call, [refresh_books])
        of
        {false, Reason} ->
            logger:error("请求战书列表出错:~w",
                         [Reason],
                         provocation_role,
                         1533),
            role:pack_send(RolePid, 20725, {[]});
        {ok, BookList} when BookList =:= [] ->
            logger:debug("当前战书列表为空", [], provocation_role, 1536),
            role:pack_send(RolePid, 20725, {[]});
        {ok, BookList} ->
            NList = case Flag of
                        1 ->
                            PetFc = pet_attr:calc_fc(Role),
                            Mode = case Num > 1 of
                                       true -> 3;
                                       false -> 2
                                   end,
                            Args = #{lev => Lev, break_times => BreakTimes,
                                     fc => PetFc + Fc, mod => Mode},
                            check_book_list({1, 1, 0}, BookList, Args);
                        _ -> BookList
                    end,
            role:pack_send(RolePid, 20725, {NList})
    end.

push_vedio(Role = #role{pid = RolePid,
                        m_provocation = #m_provocation{video_check = Flag},
                        lev = Lev, m_team = #m_team{member_num = Num},
                        attr = #attr{fc = Fc},
                        m_lev_break = #m_lev_break{times = BreakTimes}}) ->
    case cross:call(provocation_mgr, call, [refresh_rooms])
        of
        {false, Reason} ->
            logger:error("请求房间列表出错:~w",
                         [Reason],
                         provocation_role,
                         1553),
            role:pack_send(RolePid, 20730, {[]});
        {ok, RoomList} when RoomList =:= [] ->
            logger:debug("当前房间列表为空", [], provocation_role, 1556),
            role:pack_send(RolePid, 20730, {[]});
        {ok, RoomList} ->
            NRoomList = [R
                         || R = #provocation_room{status = 4} <- RoomList],
            NList = case Flag of
                        1 ->
                            PetFc = pet_attr:calc_fc(Role),
                            Mode = case Num > 1 of
                                       true -> 3;
                                       false -> 2
                                   end,
                            Args = #{lev => Lev, break_times => BreakTimes,
                                     fc => PetFc + Fc, mod => Mode},
                            check_room_list({1, 0, 0}, NRoomList, Args);
                        _ -> NRoomList
                    end,
            role:pack_send(RolePid, 20730, {NList})
    end.

push_to_provocation(Role = #role{m_team =
                                     #m_team{status = Status, pid = Pid},
                                 s_event = 66,
                                 m_provocation =
                                     #m_provocation{room_id = RoomId}}) ->
    logger:debug("===", [], provocation_role, 1572),
    case Status =:= 1 orelse erlang:is_pid(Pid) =:= false of
        true ->
            provocation_agent:update_role_profile(Role,
                                                  {push, RoomId});
        _ -> provocation_agent:update_role_profile(Role, false)
    end;
push_to_provocation(_Role) -> ok.

publish_timeout(Role = #role{m_provocation =
                                 MProvocation = #m_provocation{published_list =
                                                                   PublishList},
                             m_help = MHelp},
                MsgId) ->
    case lists:keyfind(MsgId,
                       #provocation_publish.msg_id,
                       PublishList)
        of
        #provocation_publish{record_id = RecordId,
                             channel = Channel, map_id = MapId} ->
            help_mgr:free_record_id(RecordId),
            {ok, NewMHelp} = help:free_id(MHelp, MsgId),
            NewPublish = lists:keydelete(MsgId,
                                         #provocation_publish.msg_id,
                                         PublishList),
            TimerId = {help_msg_valid_timer, MsgId},
            NewRole = role_timer:del(TimerId, Role),
            Gid = case Role#role.m_guild of
                      #m_guild{id = _Gid} -> _Gid;
                      _ -> 0
                  end,
            push_16002(Channel,
                       MapId,
                       Gid,
                       [],
                       [#help_msg{id = MsgId}]),
            {remove,
             NewRole#role{m_help = NewMHelp,
                          m_provocation =
                              MProvocation#m_provocation{published_list =
                                                             NewPublish}}};
        _ -> remove
    end.

notice_team(TPid, LRid, Msg) ->
    case team:info(TPid) of
        {ok, #team{members = Members}} when Members =/= [] ->
            [notice:send({pid, Pid}, 1, Msg)
             || #team_mate{pid = Pid} <- Members];
        _ when LRid =/= {0, "", 0} -> notice:send(LRid, 1, Msg);
        _ -> ok
    end.

notice_room(#provocation_room{master_team_pid = MTPid,
                              customer_team_pid = CTPid, master_id = MRid,
                              customer_id = CRid},
            Msg) ->
    case MTPid =:= undefined of
        true -> notice:send(MRid, 1, Msg);
        false -> notice_team(MTPid, MRid, Msg)
    end,
    case CTPid =:= undefined of
        true -> notice:send(CRid, 1, Msg);
        false -> notice_team(CTPid, CRid, Msg)
    end;
notice_room(RoomId, Msg) ->
    case cross:call(provocation_mgr,
                    call,
                    [{quest_roominfo, RoomId, 0}])
        of
        {ok,
         #provocation_room{master_team_pid = MTPid,
                           customer_team_pid = CTPid, master_id = MRid,
                           customer_id = CRid}} ->
            case MTPid =:= undefined of
                true -> notice:send(MRid, 1, Msg);
                false -> notice_team(MTPid, MRid, Msg)
            end,
            case CTPid =:= undefined of
                true -> notice:send(CRid, 1, Msg);
                false -> notice_team(CTPid, CRid, Msg)
            end;
        _ -> ok
    end.

check_enter([], Role, Args) -> {true, Role, Args};
check_enter([lev | _Rest], #role{lev = Lev}, _Args)
    when Lev < 30 ->
    Msg = notice:format(lang:get("您的等级不足~ts级"),
                        [{string_2, 1, 30}]),
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
check_enter([crosstype | Rest], Role, _Args) ->
    case cross:is_ready() of
        1 -> check_enter(Rest, Role, _Args);
        0 -> {false, lang:get("没有连接跨服，不能进入跨服约战")}
    end;
check_enter([team_members | _Rest],
            #role{m_team = #m_team{status = 2}}, _Args) ->
    {false, lang:get("您正在跟随队伍中，无法进行传送")};
check_enter([team_members | Rest],
            Role = #role{m_team = #m_team{status = 3}}, Args) ->
    check_enter(Rest, Role, Args);
check_enter([team_members | Rest], Role, Args) ->
    case team:get_members(Role) of
        [] -> check_enter(Rest, Role, Args);
        Members ->
            case [M || M = #team_mate{status = 2} <- Members] of
                Members ->
                    case check_team_members(lev, Members) of
                        true ->
                            check_enter(Rest, Role, Args#{members => Members});
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("请召回队员之后再进行跨服约战")}
            end
    end;
check_enter([_Other | Rest], Role, Args) ->
    check_enter(Rest, Role, Args).

check_team_members(lev,
                   [#team_mate{name = Name, lev = Lev} | _Rest])
    when Lev < 30 ->
    Msg = notice:format(lang:get("队伍中~ts的等级不足~ts级，无法进入"),
                        [{role_2, Name}, {string_2, 1, 30}]),
    {false, Msg};
check_team_members(lev, [#team_mate{} | Rest]) ->
    check_team_members(lev, Rest);
check_team_members(lev, []) -> true.

transe_map(Role = #role{cross_type = RoleCrossType},
           FollowMembers) ->
    MemNum = length(FollowMembers) + 1,
    case RoleCrossType of
        0 ->
            case MemNum =< 1 of
                true -> do_trans_map(Role);
                _ ->
                    NRole = Role#role{s_event = 65, cross_type = 1},
                    Members = team:get_members(NRole),
                    case cross:call(provocation_mgr,
                                    call,
                                    [{enter, MemNum}])
                        of
                        {false, Reason} -> {false, Reason};
                        {ok, ToPos = {_, _, MapId, _, _}} ->
                            EnterRole = NRole#role{m_provocation =
                                                       #m_provocation{map_id =
                                                                          MapId}},
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
                                                                                               provocation_role,
                                                                                               1698),
                                                                                  LeaveTeamRole
                                                                          end;
                                                                      _LeaveFalse ->
                                                                          EnterRole
                                                                  end,
                            case map:role_enter(ToPos, self, NewTeamRole) of
                                {ok, MapRole} ->
                                    TeamPid = case MTeam of
                                                  #m_team{pid = Tpid}
                                                      when is_pid(Tpid) ->
                                                      Tpid;
                                                  _ -> 0
                                              end,
                                    [role:apply(async,
                                                MatePid,
                                                {provocation_role,
                                                 async_enter_provocation,
                                                 [#{pos => ToPos,
                                                    team_pid => TeamPid,
                                                    cross_type => 1,
                                                    status => Status}]})
                                     || #team_mate{pid = MatePid,
                                                   status = Status}
                                            <- Members,
                                        is_pid(MatePid)],
                                    NewRole = case
                                                  role_fly:force_landing(MapRole)
                                                  of
                                                  {ok, _Role} -> _Role;
                                                  _ -> MapRole
                                              end,
                                    map:role_update(NewRole),
                                    role_misc:push_cross(NewRole),
                                    team:stop_recruiting(NewRole),
                                    {ok, Ginfo} = role_convert:to(member,
                                                                  NewRole),
                                    cross:cast(role_group,
                                               join,
                                               [center_world, Ginfo]),
                                    {ok, NewRole};
                                {error, Reason} -> {false, Reason}
                            end
                    end
            end;
        1 ->
            EnterRole = Role#role{s_event = 65, cross_type = 1},
            case MemNum =< 1 of
                true -> do_trans_map(EnterRole);
                _ -> do_trans_map2(EnterRole)
            end;
        _Else ->
            logger:error("进入跨服约战地图失败:",
                         [_Else],
                         provocation_role,
                         1733),
            {false, lang:get("传送失败")}
    end.

do_trans_map(Role = #role{name = Name,
                          cross_type = RoleCrossType}) ->
    logger:debug("=====", [], provocation_role, 1739),
    EnterRole = Role#role{s_event = 65, cross_type = 1},
    case cross:call(provocation_mgr, call, [{enter, 1}]) of
        {false, Reason} -> {false, Reason};
        {ok, ToPos = {_, _, MapId, _, _}} ->
            case map:role_enter(ToPos, self, EnterRole) of
                {ok, MapRole} ->
                    case role_fly:force_landing(MapRole#role{m_provocation =
                                                                 #m_provocation{map_id
                                                                                    =
                                                                                    MapId}})
                        of
                        {ok, NewRole} ->
                            map:role_update(NewRole),
                            case RoleCrossType =:= 0 of
                                true ->
                                    role_misc:push_cross(NewRole),
                                    {ok, Ginfo} = role_convert:to(member,
                                                                  NewRole),
                                    cross:cast(role_group,
                                               join,
                                               [center_world, Ginfo]);
                                _ -> ok
                            end,
                            team:stop_recruiting(NewRole),
                            {ok, NewRole};
                        _ -> {false, lang:get("传送失败")}
                    end;
                _Err ->
                    logger:error("[~ts]传送跨服约战失败[~w]",
                                 [Name, _Err],
                                 provocation_role,
                                 1763),
                    {false, lang:get("传送失败")}
            end
    end.

do_trans_map2(Role = #role{name = Name}) ->
    logger:debug("=====", [], provocation_role, 1769),
    Members = team:get_members(Role),
    FMem = [MatePid
            || #team_mate{pid = MatePid, status = Status}
                   <- Members,
               is_pid(MatePid) andalso Status =:= 2],
    case length(Members) > length(FMem) of
        true -> {false, lang:get("有队员未归队，不能参加约战")};
        _ ->
            case cross:call(provocation_mgr,
                            call,
                            [{enter, length(FMem) + 1}])
                of
                {false, Reason} -> {false, Reason};
                {ok, ToPos = {_, _, MapId, _, _}} ->
                    TeamEvt = make_team_evt(Role, MapId),
                    case map:role_enter(ToPos, TeamEvt, Role) of
                        {ok, MapRole} ->
                            case
                                role_fly:force_landing(MapRole#role{m_provocation
                                                                        =
                                                                        #m_provocation{map_id
                                                                                           =
                                                                                           MapId}})
                                of
                                {ok, NewRole} ->
                                    map:role_update(NewRole),
                                    team:stop_recruiting(NewRole),
                                    {ok, NewRole};
                                _ -> {false, lang:get("传送失败")}
                            end;
                        _Err ->
                            logger:error("[~ts]传送跨服约战失败[~w]",
                                         [Name, _Err],
                                         provocation_role,
                                         1791),
                            {false, lang:get("传送失败")}
                    end
            end
    end.

make_team_evt(Role, MapId) ->
    Members = team:get_members(Role),
    make_team_evt(Role, Members, MapId).

make_team_evt(#role{s_event = Event,
                    m_team = #m_team{pid = Pid}},
              Members, MapId) ->
    case Members of
        [] when not is_pid(Pid) -> self;
        MateIds when Event =:= 65 ->
            FollowMateIds = [MateId
                             || #team_mate{id = MateId, status = 2} <- MateIds],
            #{label => enter_event, event => Event,
              role_ids => FollowMateIds,
              mfa =>
                  {provocation_role, apply_team_mate_enter, [MapId]}};
        MateIds ->
            FollowMateIds = [MateId
                             || #team_mate{id = MateId, status = 2} <- MateIds],
            #{label => exit_event, event => Event,
              role_ids => FollowMateIds,
              mfa => {provocation_role, apply_team_mate_leave, []}}
    end.

exit_normal(ToPos, TeamEvt,
            Role = #role{name = Name,
                         m_provocation = MProvocation}) ->
    ExitRole = Role#role{s_event = 0, cross_type = 1,
                         m_provocation =
                             MProvocation#m_provocation{map_id = 0,
                                                        room_check = 1,
                                                        book_check = 1,
                                                        video_check = 1}},
    case map:role_enter(ToPos, TeamEvt, ExitRole) of
        {ok, MapRole} ->
            logger:debug("成功推出地图", [], provocation_role, 1816),
            NewRole = MapRole,
            map:role_update(NewRole),
            cross:cast(role_group,
                       leave,
                       [center_world, Role#role.pid]),
            {ok, NewRole};
        _Err ->
            logger:error("[~ts]退出跨服约战失败[~w]",
                         [Name, _Err],
                         provocation_role,
                         1822),
            {false, lang:get("退出失败")}
    end.

check_room_mode(Role, RoomMode) ->
    TeamMats = team:get_members(Role),
    Len = length(TeamMats) + 1,
    LimitNum = get_limit_num(RoomMode),
    case Len =< LimitNum of
        true -> ok;
        false ->
            {false, util:flist(lang:get("队伍人数不能大于~w人"), [LimitNum])}
    end.

check_room_list({CheckLev, CheckFc, CheckMod}, RoomList,
                #{lev := Lev, fc := Fc, mod := Mod,
                  break_times := BreakTimes}) ->
    LevRooms = case CheckLev =/= 0 of
                   true ->
                       [Info
                        || Info = #provocation_room{master_lev = MLev,
                                                    master_break = MBreak}
                               <- RoomList,
                           MBreak =:= BreakTimes andalso
                               MLev + 10 >= Lev andalso Lev >= MLev - 10];
                   _ -> RoomList
               end,
    FcRooms = case CheckFc =/= 0 of
                  true ->
                      [Info
                       || Info = #provocation_room{master_fc = MFc}
                              <- LevRooms,
                          round(9.0e-1 * MFc) =< Fc andalso
                              Fc =< round(1.1 * MFc)];
                  _ -> LevRooms
              end,
    ModRooms = case CheckMod =/= 0 of
                   true ->
                       [Info
                        || Info = #provocation_room{mode = Mode} <- FcRooms,
                           Mode =:= Mod orelse Mode =:= 1];
                   _ -> FcRooms
               end,
    ModRooms.

check_book_list({CheckLev, CheckFc, CheckMod}, BookList,
                #{lev := Lev, fc := Fc, mod := Mod,
                  break_times := BreakTimes}) ->
    LevBooks = case CheckLev =/= 0 of
                   true ->
                       [Info
                        || Info = #provocation_book{master_lev = MLev,
                                                    master_break = MBreak}
                               <- BookList,
                           MBreak =:= BreakTimes andalso
                               MLev + 9 >= Lev andalso Lev >= MLev - 9];
                   _ -> BookList
               end,
    FcBooks = case CheckFc =/= 0 of
                  true ->
                      [Info
                       || Info = #provocation_book{master_fc = MFc}
                              <- LevBooks,
                          round(9.49999999999999955591e-1 * MFc) =< Fc andalso
                              Fc =< round(1.05 * MFc)];
                  _ -> LevBooks
              end,
    ModBooks = case CheckMod =/= 0 of
                   true ->
                       [Info
                        || Info = #provocation_book{mode = Mode} <- FcBooks,
                           Mode =:= Mod orelse Mode =:= 1];
                   _ -> FcBooks
               end,
    ModBooks.

get_limit_num(RoomMode) ->
    case RoomMode of
        2 -> 1;
        3 -> 5;
        _ -> 5
    end.

check_invite(Role, TRoleId, Type) ->
    check_invite(Role,
                 TRoleId,
                 Type,
                 [type, target_status]).

check_invite(Role = #role{id = Rid,
                          m_provocation = #m_provocation{room_id = RoomId}},
             TRoleId, Type, [type | T]) ->
    case cross:call(provocation_mgr,
                    call,
                    [{quest_roominfo, RoomId, 0}])
        of
        {ok, #provocation_room{master_id = MasterId}} ->
            case MasterId =:= Rid of
                true -> check_invite(Role, TRoleId, Type, T);
                _ ->
                    case Type of
                        2 -> {false, lang:get("不是房主，不能邀请对手")};
                        _ -> check_invite(Role, TRoleId, Type, T)
                    end
            end;
        _ -> {false, lang:get("没找到房间信息")}
    end;
check_invite(#role{m_provocation =
                       #m_provocation{room_id = RoomId}},
             TRoleId, _Type, [target_status]) ->
    logger:debug("check_invite",
                 [],
                 provocation_role,
                 1902),
    case role_query:attr(by_id,
                         TRoleId,
                         [#role.m_provocation])
        of
        {ok, [#m_provocation{room_id = RoomId}]} ->
            {false, lang:get("对方已经在房间了，不用邀请了")};
        {ok, _} -> {true, TRoleId};
        {error, not_found} -> {false, lang:get("对方不在线，无法发起邀请")};
        _ -> {false, lang:get("数据暂未支持互通，请下次更新后重试{face_1,3}")}
    end.

remove_trigger(all, Triggers, Role) ->
    Role0 = role_trigger:del(Triggers, Role),
    {Role0, []};
remove_trigger(Label, Triggers, Role) ->
    TriIds = [Tid
              || Tid = {Lb, _} <- Triggers, Lb =:= Label],
    Role0 = role_trigger:del(TriIds, Role),
    {Role0,
     [One || One = {OLb, _} <- Triggers, OLb =/= Label]}.

add_trigger([], Role, Triggers) -> {Role, Triggers};
add_trigger([Label | T], Role, Triggers) ->
    case lists:keyfind(Label, 1, Triggers) of
        {Label, _} -> add_trigger(T, Role, Triggers);
        _ ->
            {TriId, Role1} = role_trigger:add(#trigger{label =
                                                           Label,
                                                       m = provocation_role,
                                                       f = evt_callback,
                                                       a = []},
                                              Role),
            add_trigger(T, Role1, [TriId | Triggers])
    end.

save_result(Id = {_, P, Z}, Args,
            Result = #provocation_result{match_id = MatchId,
                                         record_pz = {RP, RZ}}) ->
    logger:debug("===", [], provocation_role, 1946),
    RsId = env:update_counter(provocation_result_id, 1),
    RecId = {RsId, P, Z},
    ProResult2 = Result#provocation_result{id = RecId},
    combat_record:cite({21, {MatchId, RP, RZ}}),
    ets:insert(provocation_result, ProResult2),
    dets:insert(provocation_result, ProResult2),
    case make_last_result(Args, Result, RecId) of
        ok -> ok;
        Lr ->
            case ets:lookup(provocation_result_role, Id) of
                [R = #provocation_result_role{recent = Recent,
                                              last_recent = LastRecent}] ->
                    NewRecent = lists:sublist([RecId | Recent], 50),
                    NewLastRecent = lists:sublist([Lr | LastRecent], 10),
                    Minus = Recent -- NewRecent,
                    [delete_post(DelId) || DelId <- Minus],
                    R1 = R#provocation_result_role{recent = NewRecent,
                                                   last_recent = NewLastRecent},
                    ets:insert(provocation_result_role, R1),
                    dets:insert(provocation_result_role, R1);
                _ ->
                    R1 = #provocation_result_role{id = Id, recent = [RecId],
                                                  last_recent = [Lr]},
                    ets:insert(provocation_result_role, R1),
                    dets:insert(provocation_result_role, R1)
            end
    end.

make_last_result({Name, Sex, Classes, HeadId, Best},
                 #provocation_result{rival = Rival, time = Time},
                 RecId) ->
    case Rival of
        [#provocation_fighter{id = Rid, name = RName,
                              sex = RSex, classes = RClasses}
         | _] ->
            case ets:lookup(provocation_profile, Rid) of
                [#provocation_profile{head = RHeadId}] ->
                    {Time,
                     Name,
                     RName,
                     Sex,
                     Classes,
                     HeadId,
                     RSex,
                     RClasses,
                     RHeadId,
                     Best,
                     RecId};
                _ ->
                    {Time,
                     Name,
                     RName,
                     Sex,
                     Classes,
                     HeadId,
                     RSex,
                     RClasses,
                     0,
                     Best,
                     RecId}
            end;
        _ -> ok
    end.

delete_post(Id) ->
    case ets:lookup(provocation_result, Id) of
        [#provocation_result{match_id = MatchId,
                             record_pz = {P, Z}}] ->
            combat_record:uncite([{{21, {MatchId, P, Z}}, 1}]);
        _ -> ok
    end,
    ets:delete(provocation_result, Id),
    dets:delete(provocation_result, Id).

do_invite_join(Role = #role{s_event = Event}, Pid) ->
    case Event of
        65 -> do_enter_invite(Role, Pid);
        66 ->
            case rpc_exit_room(Role) of
                {ok, NRole} -> do_enter_invite(NRole, Pid);
                {false, Reason} -> {false, Reason}
            end;
        0 ->
            case rpc_enter(Role) of
                {ok, NRole} -> do_enter_invite(NRole, Pid);
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("当前状态不能参加跨服约战")}
    end.

do_enter_invite(Role, TeamPid) ->
    {ok, Mate} = role_convert:to(team_mate, Role),
    case team:join(TeamPid, Mate, Role) of
        ok ->
            logger:debug("加入队伍成功~w",
                         [TeamPid],
                         provocation_role,
                         2022),
            Role2 = Role#role{m_team = #m_team{pid = TeamPid}},
            {ok, Role2};
        {ok, _Role1} ->
            logger:debug("加入队伍成功~w",
                         [TeamPid],
                         provocation_role,
                         2026),
            Role2 = _Role1#role{m_team = #m_team{pid = TeamPid}},
            {ok, Role2};
        _Err ->
            logger:debug("加入队伍失败:~w",
                         [_Err],
                         provocation_role,
                         2030),
            {false, _Err}
    end.

calc_room(#provocation_room{id = RoomId,
                            master_team_pid = MTeamPid, master_lev = MLev,
                            master_break = MBreak, master_fc = MFc},
          {Lev, BreakTimes, Fc, MemNum}) ->
    MemPoint = case erlang:is_pid(MTeamPid) of
                   true ->
                       case team:info(MTeamPid) of
                           {ok, #team{member_num = Num}} -> 1 * (MemNum - Num);
                           _ -> 0
                       end;
                   _ -> 1 * (MemNum - 1)
               end,
    LevPoint = BreakTimes * 5 + Lev - (MBreak * 5 + MLev),
    FcPoint = (Fc - MFc) div 2000,
    Point = MemPoint + LevPoint + FcPoint,
    {RoomId, abs(Point)}.

do_leader_leave(Role = #role{id = Rid,
                             m_provocation =
                                 MProvocation = #m_provocation{room_id = RoomId,
                                                               identity =
                                                                   Identity,
                                                               triggers =
                                                                   Triggers}},
                Tid) ->
    case team:info(Tid) of
        {ok, #team{members = Members}} when Members =/= [] ->
            logger:debug("~w", [Members], provocation_role, 2055),
            case [false
                  || #team_mate{id = Id, status = Status} <- Members,
                     (Status =:= 2 orelse Status =:= 1) andalso Id =/= Rid]
                of
                [] ->
                    logger:debug("===", [], provocation_role, 2058),
                    cross:cast(provocation_mgr,
                               cast,
                               [{team_leave_room, RoomId, Rid, Identity}]),
                    [role:apply(async,
                                MatePid,
                                {provocation_role, async_leave_room, []})
                     || #team_mate{pid = MatePid} <- Members,
                        is_pid(MatePid)];
                _ ->
                    logger:debug("===", [], provocation_role, 2063),
                    cross:cast(provocation_mgr,
                               cast,
                               [{cancle_room_ready, RoomId}])
            end,
            {Role1, _} = remove_trigger(all, Triggers, Role),
            NRole = Role1#role{s_event = 65,
                               m_provocation =
                                   MProvocation#m_provocation{room_id = 0,
                                                              identity = 0,
                                                              triggers = []}},
            map:role_update(NRole),
            {ok, NRole};
        _ ->
            logger:debug("================",
                         [],
                         provocation_role,
                         2073),
            cross:cast(provocation_mgr,
                       cast,
                       [{change_room_mod,
                         RoomId,
                         Rid,
                         Identity,
                         2,
                         undefined}]),
            {Role1, NewTriggers} = remove_trigger(all,
                                                  Triggers,
                                                  Role),
            NRole = Role1#role{m_provocation =
                                   MProvocation#m_provocation{triggers =
                                                                  NewTriggers}},
            {ok, NRole}
    end.

do_logout_room(Role = #role{id = Rid, s_event = 66,
                            m_provocation =
                                MProvocation = #m_provocation{room_id = RoomId,
                                                              identity =
                                                                  Identity,
                                                              triggers =
                                                                  Triggers}}) ->
    logger:debug("================",
                 [],
                 provocation_role,
                 2082),
    case Identity of
        1 ->
            case cross:call(provocation_mgr,
                            call,
                            [{quest_roominfo, RoomId, 0}])
                of
                {ok,
                 #provocation_room{master_id = MId,
                                   master_team_pid = MTPid}}
                    when Rid =:= MId andalso MTPid =:= undefined ->
                    cross:cast(provocation_mgr,
                               cast,
                               [{team_leave_room, RoomId, Rid, 1}]);
                _ -> ok
            end;
        2 ->
            case cross:call(provocation_mgr,
                            call,
                            [{quest_roominfo, RoomId, 0}])
                of
                {ok,
                 #provocation_room{customer_id = CId,
                                   customer_team_pid = CTid}}
                    when CTid =:= undefined andalso Rid =:= CId ->
                    cross:cast(provocation_mgr,
                               cast,
                               [{team_leave_room, RoomId, Rid, 2}]);
                _ -> ok
            end;
        _ -> ok
    end,
    {Role1, NewTriggers} = remove_trigger(all,
                                          Triggers,
                                          Role),
    Role1#role{s_event = 65,
               m_provocation =
                   MProvocation#m_provocation{room_id = 0, identity = 0,
                                              triggers = NewTriggers}}.

do_logout_book(Role = #role{id = Rid,
                            m_provocation =
                                MProvocation = #m_provocation{book_id =
                                                                  BookId}}) ->
    case BookId =/= 0 of
        true ->
            cross:cast(provocation_mgr,
                       cast,
                       [{logout_book, BookId, Rid}]);
        _ -> ok
    end,
    Role#role{m_provocation =
                  MProvocation#m_provocation{invited_list = []}}.

do_logout_map(Role) ->
    case rpc_exit(Role) of
        {ok, NewRole} -> NewRole;
        _ -> Role
    end.

send_book(Role = #role{id = MyId, name = MyName,
                       lev = Lev, attr = #attr{fc = Fc},
                       m_lev_break = #m_lev_break{times = BreakTimes}},
          BookName) ->
    PetFc = pet_attr:calc_fc(Role),
    Loss = format:val_to_loss([{90003, 1000}]),
    role:send_buff_begin(),
    case role_gain:do_notice(Loss, Role) of
        {false, #loss{msg = Msg}} ->
            role:send_buff_clean(),
            {false, Msg};
        {ok, Role2} ->
            case cross:call(provocation_mgr,
                            call,
                            [{send_book,
                              provocation_util:get_lev_group(Lev, BreakTimes),
                              (Fc + PetFc) div 1000 + 1,
                              MyId}])
                of
                RidList when is_list(RidList) andalso RidList =/= [] ->
                    role:send_buff_flush(),
                    [begin
                         ClientName = util:flist("~ts（点击查看详细信息）", [MyName]),
                         Msg =
                             notice:format(lang:get("久闻~ts你的大名，如今大陆风起云涌，你我实力相近，何不经常切磋、相互促进以提升实力？我在"
                                                    "跨服摆好擂台：\n ~ts期待与您切磋一番\n      ~ts"),
                                           [{role_2, RName},
                                            {role_2, BookName},
                                            {role_1, MyId, ClientName}]),
                         mail:send(Rid, lang:get("跨服约战书"), Msg)
                     end
                     || {Rid, RName} <- RidList],
                    {ok, Role2};
                _ ->
                    role:send_buff_clean(),
                    {false, lang:get("暂时找不到实力相当的对手，故退还飞鸽传书的金额"), Role}
            end
    end.

check_publish(Role = #role{id = Rid}, MRid, CRid, Flag,
              Channel) ->
    case MRid =:= Rid of
        true ->
            case Flag =:= 1 andalso CRid =/= {0, "", 0} of
                true -> {false, lang:get("已经有对手，不能再招募了")};
                _ ->
                    case Channel of
                        4 ->
                            case Role#role.m_guild of
                                #m_guild{} -> ok;
                                _ -> {false, lang:get("没有公会，不能发布公会招募")}
                            end;
                        _ ->
                            case role_misc:check_cd(rpc_16000) of
                                true -> ok;
                                _ -> {false, lang:get("求助频率过快，休息一下吧！")}
                            end
                    end
            end;
        _ -> {false, lang:get("不是房主，不能招募对手")}
    end.

push_16002(Channel, MapId, Gid, AddMsg, DelMsg) ->
    logger:debug("频道:~w,地图:~w,公会：~w,增加:~w,减少:~w",
                 [Channel, MapId, Gid, AddMsg, DelMsg],
                 provocation_role,
                 2164),
    case Channel of
        8 ->
            logger:debug("===", [], provocation_role, 2168),
            cross:cast(role_group,
                       pack_send,
                       [center_world, 16002, {AddMsg, DelMsg}]);
        1 ->
            logger:debug("~w",
                         [{AddMsg, DelMsg}],
                         provocation_role,
                         2172),
            role_group:pack_send(world, 16002, {AddMsg, DelMsg});
        3 ->
            case env:get(center) of
                #center{ready = 1, center_platform = Platform,
                        center_zone_id = ZoneId} ->
                    logger:debug("===", [], provocation_role, 2178),
                    cross:cast(Platform,
                               ZoneId,
                               map,
                               pack_send_to_all,
                               [MapId, 16002, {AddMsg, DelMsg}]);
                _ -> ok
            end;
        4 when Gid =/= 0 ->
            guild:pack_cast(Gid, 16002, {AddMsg, DelMsg});
        _ -> ok
    end.

recover_publish(Role = #role{m_provocation =
                                 #m_provocation{published_list = PublishList}})
    when PublishList =:= [] ->
    Role;
recover_publish(Role = #role{m_provocation =
                                 MProvocation = #m_provocation{published_list =
                                                                   PublishList}}) ->
    NRole = do_recover(Role, PublishList),
    NRole#role{m_provocation =
                   MProvocation#m_provocation{published_list = []}}.

do_recover(Role = #role{m_help = MHelp},
           [#provocation_publish{record_id = RecordId,
                                 msg_id = MsgId, channel = Channel,
                                 map_id = MapId}
            | T]) ->
    help_mgr:free_record_id(RecordId),
    {ok, NewMHelp} = help:free_id(MHelp, MsgId),
    TimerId = {help_msg_valid_timer, MsgId},
    NewRole = role_timer:del(TimerId, Role),
    Gid = case Role#role.m_guild of
              #m_guild{id = _Gid} -> _Gid;
              _ -> 0
          end,
    push_16002(Channel,
               MapId,
               Gid,
               [],
               [#help_msg{id = MsgId}]),
    do_recover(NewRole#role{m_help = NewMHelp}, T);
do_recover(Role, []) -> Role.

make_publish_data(Role = #role{id = Rid, lev = Lev,
                               name = Name, m_help = MHelp,
                               m_provocation =
                                   MProvocation = #m_provocation{room_id =
                                                                     RoomId,
                                                                 map_id = MapId,
                                                                 published_list
                                                                     =
                                                                     PublishList}},
                  Channel, RoomName, HelpId) ->
    Msg = util:flist(lang:get("~tsLv.~w"), [Name, Lev]),
    {NoticeMsg, Flag} = case HelpId of
                            1000 ->
                                {notice:format(lang:get("~ts{string_2, #ffffff, 发起约战：}~ts"),
                                               [{role_2, Msg},
                                                {string_2, 0, RoomName}]),
                                 1};
                            _ ->
                                {notice:format(lang:get("~ts{string_2, #ffffff, 发起约战求助：}~ts"),
                                               [{role_2, Msg},
                                                {string_2, 0, RoomName}]),
                                 2}
                        end,
    StrArr = [{1000, NoticeMsg}],
    HelpMsg = #help_msg{help_rid = Rid, help_id = HelpId,
                        digit_array =
                            [{7, Lev}, {14, RoomId}, {15, Channel}, {16, Flag}],
                        str_array = StrArr},
    Gid = case Role#role.m_guild of
              #m_guild{id = _Gid} -> _Gid;
              _ -> 0
          end,
    case lists:keyfind(HelpId,
                       #provocation_publish.help_id,
                       PublishList)
        of
        PublishInfo = #provocation_publish{msg_id = OldMsgId,
                                           record_id = OldRecordId} ->
            AddHelpMsg = HelpMsg#help_msg{id = OldMsgId,
                                          time = date:unixtime2(),
                                          record_id = OldRecordId},
            Timer = #timer{id = {help_msg_valid_timer, OldMsgId},
                           timeout = 60 * 2 * 1000, m = provocation_role,
                           f = publish_timeout, a = [OldMsgId]},
            NPublishList = lists:keyreplace(HelpId,
                                            #provocation_publish.help_id,
                                            PublishList,
                                            PublishInfo#provocation_publish{channel
                                                                                =
                                                                                Channel,
                                                                            map_id
                                                                                =
                                                                                MapId}),
            TimerRole = role_timer:set(Timer,
                                       Role#role{m_provocation =
                                                     MProvocation#m_provocation{published_list
                                                                                    =
                                                                                    NPublishList}}),
            push_16002(Channel, MapId, Gid, [AddHelpMsg], []),
            {ok, TimerRole};
        _ ->
            case help_mgr:fetch_ids(1) of
                {ok, [RecordId]} ->
                    {ok, NextMsgId, PopMHelp} = help:pop_next_id(MHelp),
                    AddHelpMsg = HelpMsg#help_msg{id = NextMsgId,
                                                  time = date:unixtime2(),
                                                  record_id = RecordId},
                    Timer = #timer{id = {help_msg_valid_timer, NextMsgId},
                                   timeout = 60 * 2 * 1000,
                                   m = provocation_role, f = publish_timeout,
                                   a = [NextMsgId]},
                    PublishInfo = #provocation_publish{help_id = HelpId,
                                                       msg_id = NextMsgId,
                                                       record_id = RecordId,
                                                       channel = Channel,
                                                       map_id = MapId},
                    TimerRole = role_timer:add(Timer,
                                               Role#role{m_provocation =
                                                             MProvocation#m_provocation{published_list
                                                                                            =
                                                                                            [PublishInfo
                                                                                             | PublishList]}}),
                    push_16002(Channel, MapId, Gid, [AddHelpMsg], []),
                    {ok, TimerRole#role{m_help = PopMHelp}};
                _ -> {false, lang:get("暂时不能发起发布")}
            end
    end.

convert_fighter_team(Role = #role{id = Rid}) ->
    case role_convert:to(fighter_wrap, Role) of
        {ok, FighterWarp} ->
            case team:get_fighters(FighterWarp) of
                {ok, Fighters} ->
                    cross:cast(provocation_mgr,
                               cast,
                               [{update_fight_team,
                                 #provocation_fight_team{leader_id = Rid,
                                                         fighters =
                                                             Fighters}}]),
                    ok;
                _Erle ->
                    logger:error("转变战斗信息错误:~w",
                                 [_Erle],
                                 provocation_role,
                                 2255),
                    ok
            end;
        _Err ->
            logger:error("转换失败:~w", [_Err], provocation_role, 2259),
            ok
    end.

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

cast_gain(RoleName, BaseId, Num, 1, Type) ->
    CastMsg = case Type of
                  1 ->
                      notice:format(lang:get("~ts在跨服擂台吃瓜围观，拾取胜利宝箱时竟获得了~ts，笑得合不拢嘴{face_1,10}"),
                                    [{role_2, RoleName},
                                     {item_2, [{BaseId, Num}]}]);
                  _ ->
                      notice:format(lang:get("~ts在跨服擂台吃瓜观战，拾取红包时获得了~ts{face_1,112}"),
                                    [{role_2, RoleName},
                                     {item_2, [{BaseId, Num}]}])
              end,
    notice:cast(all, 4, CastMsg);
cast_gain(_, _, _, _, _) -> ok.

check_room(RoomId, Rid) ->
    case cross:call(provocation_mgr,
                    call,
                    [{quest_roominfo, RoomId, 0}])
        of
        {ok,
         #provocation_room{master_id = MRid,
                           provocation_type = Type}} ->
            case Type =:= 0 of
                true -> {false, lang:get("友谊房不能使用喇叭下挑战书")};
                _ ->
                    case MRid =:= Rid of
                        true -> ok;
                        _ -> {false, lang:get("不是房主，不能使用喇叭战书")}
                    end
            end;
        _Err ->
            logger:debug("~w", [_Err], provocation_role, 2307),
            {false, lang:get("找不到房间信息")}
    end.

do_cost(Role, Value) ->
    Loss = format:val_to_loss([{90002, Value}]),
    case role_gain:do_notice(Loss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, Role2} -> {ok, Role2}
    end.

target_rival_check(Rid, TargetId, TPid, TargetName) ->
    FalseRet = {false,
                notice:format(lang:get("当前房间已发布决斗邀请函，~ts在队伍中才可开战{face_1,7}"),
                              [{role_2, TargetName}])},
    case Rid =:= TargetId orelse TargetId =:= {0, "", 0} of
        true -> ok;
        _ when is_pid(TPid) ->
            case team:info(TPid) of
                {ok, #team{members = Members}} when Members =/= [] ->
                    logger:debug("~w", [Members], provocation_role, 2327),
                    IdList = [Id
                              || #team_mate{id = Id, status = Status}
                                     <- Members,
                                 Status =:= 2 orelse Status =:= 1],
                    case lists:member(TargetId, IdList) of
                        true -> ok;
                        _ -> FalseRet
                    end;
                _ -> FalseRet
            end;
        _ -> FalseRet
    end.

make_cast(Msg, P1, Z1, P2, Z2) ->
    cross:cast(P1, Z1, notice, cast, [all, 11, Msg]),
    case c_mirror:get_zone_mapping(P1, Z1) =:=
             c_mirror:get_zone_mapping(P2, Z2)
        of
        true -> ok;
        _ -> cross:cast(P2, Z2, notice, cast, [all, 11, Msg])
    end.

