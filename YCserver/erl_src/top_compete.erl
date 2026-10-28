-file("src/mod/top_compete/top_compete.erl", 1).

-module(top_compete).

-behaviour(gen_server).

-export([apply_enter/4,
         async_enter_zone/5,
         apply_exit_zone/2,
         async_exit_zone/4,
         find_role/1,
         do_check_enter/1,
         combat_over/1,
         enter/1,
         enter/2,
         exit/1,
         exit_zone/1,
         die_exit_zone/1,
         do_die_exit_zone/1,
         cast/2,
         get_team_mem/1,
         check_status/1,
         calc_team_lev/1,
         get_self/1,
         async_combat_over/5,
         apply_gain_exp/1]).

-export([start_link/1]).

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

-file("src/mod/top_compete/top_compete.erl", 40).

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

-file("src/mod/top_compete/top_compete.erl", 41).

-file("inc/top_compete.hrl", 1).

-record(top_compete_role,
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
         has_mail = 0}).

-file("src/mod/top_compete/top_compete.erl", 42).

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

-file("src/mod/top_compete/top_compete.erl", 43).

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

-file("src/mod/top_compete/top_compete.erl", 44).

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

-file("src/mod/top_compete/top_compete.erl", 45).

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

-file("src/mod/top_compete/top_compete.erl", 46).

-file("inc/battle.hrl", 1).

-record(battle_base,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         global = [] :: list(),
         map = [] :: list(),
         unit = [] :: list(),
         point = [] :: list(),
         trigger = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(battle,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         map = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         ext = [],
         role_id = {0, "", 0}}).

-record(battle_context,
        {grade = 1 :: pos_integer(),
         score = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         hurt = 0 :: non_neg_integer(),
         ratio_val = 0,
         die_num = 0}).

-record(battle_role,
        {id,
         status = 1,
         pid,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         is_kill_boss = 0 :: 0..1,
         sub_id = 0 :: non_neg_integer(),
         flip_cards = [] :: [],
         has_reward_floor = [],
         context = #battle_context{}}).

-record(battle_combat_info,
        {sub_id = 0, sub_type = 0, gains = []}).

-record(battle_trigger,
        {name :: undefined | bitstring(),
         status = open :: open | close,
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         condition = [] :: [tuple()],
         action = [] :: list()}).

-record(tri_timer,
        {mode :: undefined | cycle | count,
         times = 0 :: integer(),
         timeout = 1000 :: pos_integer()}).

-record(cfg_act,
        {tpl :: undefined | atom(), cfg = [] :: list()}).

-record(tpl_act,
        {name = "" :: string(),
         type :: undefined | atom(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_cond,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_cond,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_evt,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_evt,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_val,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_val,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_unit,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_unit,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(point,
        {map = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(tpl_fun,
        {name :: undefined | atom(),
         return :: undefined | unit | point,
         args = [] :: [atom()],
         code = "" :: string(),
         mfa_code = "" :: string(),
         label = "" :: string(),
         desc = "" :: string()}).

-file("src/mod/top_compete/top_compete.erl", 47).

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

-file("src/mod/top_compete/top_compete.erl", 48).

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

-file("src/mod/top_compete/top_compete.erl", 49).

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

-file("src/mod/top_compete/top_compete.erl", 50).

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

-file("src/mod/top_compete/top_compete.erl", 51).

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

-file("src/mod/top_compete/top_compete.erl", 52).

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

-file("src/mod/top_compete/top_compete.erl", 53).

-record(state,
        {map_id = 0,
         map_pid,
         zone_id = 0,
         status = 1,
         combat_pid = [],
         first_sword,
         first_mage,
         first_archer,
         first_orc,
         first_devine,
         first_moon,
         first_templar,
         next_unit_id = 2,
         make_unit_order = 1,
         is_start = 0}).

start_link(ZoneId) ->
    gen_server:start_link({local,
                           list_to_atom(lists:concat([top_compete,
                                                      "_",
                                                      ZoneId]))},
                          top_compete,
                          [ZoneId],
                          []).

cast(ZonePid, Info) when is_pid(ZonePid) ->
    gen_server:cast(ZonePid, Info);
cast(_, Info) ->
    logger:error("错误的准备区请求:~w", [Info], top_compete, 99),
    ok.

exit(Role = #role{id = RoleId, pid = RolePid,
                  s_event_pid = ZonePid}) ->
    case team_check(exit, Role) of
        {false, Reason} -> {false, Reason};
        {true, TeamList} ->
            case util:is_process_alive(ZonePid) of
                true ->
                    cast(ZonePid, {leave, RoleId, RolePid}),
                    ok;
                false ->
                    case exit_zone(Role, TeamList, ZonePid) of
                        {false, _Reason} -> ok;
                        {ok, NewRole} -> {ok, NewRole}
                    end
            end
    end.

enter(Role) -> enter(Role, normal).

enter(#role{cross_type = 1}, _Flag) ->
    {false, lang:get("跨服状态不能参与")};
enter(Role = #role{id = RoleId, pid = RolePid}, Flag) ->
    case team_check(enter, Role) of
        false -> {false, lang:get("归队状态下只能由队长操作")};
        {true, TeamList, _} ->
            case check_has_enter(Role, TeamList, Flag) of
                true ->
                    top_compete_mgr:cast({enter, RoleId, RolePid, Flag});
                {false, Reason} -> {false, Reason}
            end
    end.

push_15103(Role,
           #top_compete_role{win = Win, times = Times,
                             score = Score, exp = Exp, die = Die}) ->
    role:link_send(Role,
                   15103,
                   {Win, Times, Die, Score, Exp}),
    ok;
push_15103(_, _) -> ok.

get_self(Role = #role{id = RoleId}) ->
    case find_role(RoleId) of
        {true,
         #top_compete_role{win = Win, times = Times,
                           score = Score, exp = Exp, die = Die}} ->
            role:link_send(Role,
                           15103,
                           {Win, Times, Die, Score, Exp});
        _ -> ok
    end.

combat_over(#combat{type = 104, winner = Winner,
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
            cast(Referee,
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
                    cast(Referee, {combat_fail, CombatPid, LoseMate});
                _ -> ok
            end
    end;
combat_over(_) -> ok.

init([ZoneId]) ->
    process_flag(trap_exit, true),
    logger:info("[~w] 正在启动...",
                [top_compete],
                top_compete,
                176),
    case map_mgr:create(30004) of
        {error, Err} ->
            logger:error("启动巅峰对决战区地图失败:~w:~w",
                         [ZoneId, Err],
                         top_compete,
                         179),
            {stop, normal};
        {ok, MapPid, MapId} ->
            _Result = unit_mgr:create({18, 1},
                                      20060,
                                      {MapId, 2044, 1511}),
            State = #state{zone_id = ZoneId, map_id = MapId,
                           map_pid = MapPid},
            logger:info("[~w] 启动完成...",
                        [top_compete],
                        top_compete,
                        184),
            erlang:send_after(60 * 1000, self(), gain_exp),
            {ok, State}
    end.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({leave, _RoleId, RolePid}, State) ->
    role:apply(async,
               RolePid,
               {top_compete, apply_exit_zone, [self()]}),
    {noreply, State};
handle_cast({enter, _RoleId, RolePid, Flag},
            State = #state{map_id = MapId}) ->
    role:apply(async,
               RolePid,
               {top_compete, apply_enter, [self(), MapId, Flag]}),
    {noreply, State};
handle_cast({update_team_status,
             TeamLev,
             TeamLen,
             ChangeList},
            State) ->
    Fun = fun ({Flag, RoleId}) ->
                  case find_role(RoleId) of
                      {true,
                       Tc = #top_compete_role{name = _RoleName,
                                              lev = RoleLev}} ->
                          NewTc = case Flag of
                                      leader ->
                                          Tc#top_compete_role{team_status = 1,
                                                              team_lev =
                                                                  TeamLev,
                                                              team_len =
                                                                  TeamLen,
                                                              match =
                                                                  util:rand(1,
                                                                            3)};
                                      away ->
                                          Tc#top_compete_role{team_status = 3,
                                                              team_lev =
                                                                  RoleLev,
                                                              team_len = 1,
                                                              match = 0};
                                      none ->
                                          Tc#top_compete_role{team_status = 0,
                                                              team_lev =
                                                                  RoleLev,
                                                              team_len = 1,
                                                              match = 0};
                                      follow ->
                                          Tc#top_compete_role{team_status = 2,
                                                              team_lev =
                                                                  RoleLev,
                                                              team_len = 1,
                                                              match = 0};
                                      _ -> Tc
                                  end,
                          update_role(NewTc);
                      _ -> skip
                  end;
              (_) -> skip
          end,
    lists:foreach(Fun, ChangeList),
    {noreply, State};
handle_cast({has_enter,
             RoleId,
             RoleName,
             RolePid,
             Sex,
             Classes,
             Lev,
             RankPoint,
             TeamStatus,
             TeamLev,
             TeamLen,
             Looks},
            State = #state{zone_id = ZoneId, is_start = IsStart}) ->
    HasEnter = IsStart,
    NewTc = case find_role(RoleId) of
                {true, OldTc = #top_compete_role{}} ->
                    OldTc#top_compete_role{name = RoleName, pid = RolePid,
                                           status = 1, zone_id = ZoneId,
                                           zone_pid = self(), sex = Sex,
                                           classes = Classes, lev = Lev,
                                           rank_point = RankPoint,
                                           team_status = TeamStatus,
                                           team_lev = TeamLev,
                                           team_len = TeamLen, match = 0,
                                           has_enter = HasEnter, looks = Looks};
                _ ->
                    #top_compete_role{id = RoleId, name = RoleName,
                                      pid = RolePid, status = 1,
                                      zone_id = ZoneId, zone_pid = self(),
                                      sex = Sex, classes = Classes, lev = Lev,
                                      rank_point = RankPoint,
                                      team_status = TeamStatus,
                                      team_lev = TeamLev, team_len = TeamLen,
                                      has_enter = HasEnter, looks = Looks,
                                      match = util:rand(0, 3)}
            end,
    update_role(NewTc),
    NewState = update_first(NewTc, State),
    {noreply, NewState};
handle_cast({has_exit, RoleId},
            State = #state{is_start = IsStart}) ->
    HasEnter = IsStart,
    case find_role(RoleId) of
        {true, OldTc = #top_compete_role{name = _RoleName}} ->
            NewTc = OldTc#top_compete_role{status = 2,
                                           has_enter = HasEnter, match = 0},
            update_role(NewTc);
        _ -> skip
    end,
    {noreply, State};
handle_cast({logout, RoleId}, State) ->
    case find_role(RoleId) of
        {true, Tc = #top_compete_role{name = _RoleName}} ->
            NewTc = Tc#top_compete_role{status = 3},
            update_role(NewTc);
        _ -> skip
    end,
    {noreply, State};
handle_cast({login, RoleId, RolePid}, State) ->
    case find_role(RoleId) of
        {true, Tc = #top_compete_role{name = _RoleName}} ->
            NewTc = Tc#top_compete_role{pid = RolePid, status = 1},
            update_role(NewTc);
        _ -> skip
    end,
    {noreply, State};
handle_cast({combat_over, CombatPid, WinMate, LoseMate},
            State = #state{combat_pid = CombatPidList,
                           status = 1}) ->
    Now = date:unixtime(),
    RandTime1 = util:rand(0, 1),
    RandTime2 = util:rand(0, 1),
    WinNum = length(WinMate),
    LoseNum = length(LoseMate),
    State1 = deal_combat_result(win,
                                WinMate,
                                RandTime1,
                                Now,
                                WinNum,
                                State),
    State2 = deal_combat_result(lose,
                                LoseMate,
                                RandTime2,
                                Now,
                                LoseNum,
                                State1),
    NewCombatPidList = lists:delete(CombatPid,
                                    CombatPidList),
    {noreply, State2#state{combat_pid = NewCombatPidList}};
handle_cast({combat_over, CombatPid, WinMate, LoseMate},
            State = #state{combat_pid = CombatPidList}) ->
    Now = date:unixtime(),
    RandTime1 = util:rand(0, 1),
    RandTime2 = util:rand(0, 1),
    WinNum = length(WinMate),
    LoseNum = length(LoseMate),
    State1 = deal_combat_result(fail,
                                WinMate,
                                RandTime1,
                                Now,
                                WinNum,
                                State),
    State2 = deal_combat_result(fail,
                                LoseMate,
                                RandTime2,
                                Now,
                                LoseNum,
                                State1),
    NewCombatPidList = lists:delete(CombatPid,
                                    CombatPidList),
    {noreply, State2#state{combat_pid = NewCombatPidList}};
handle_cast({combat_fail, CombatPid, LoseMate},
            State = #state{combat_pid = CombatPidList}) ->
    Now = date:unixtime(),
    RandTime = util:rand(0, 1),
    LoseNum = length(LoseMate),
    State1 = deal_combat_result(fail,
                                LoseMate,
                                RandTime,
                                Now,
                                LoseNum,
                                State),
    NewCombatPidList = lists:delete(CombatPid,
                                    CombatPidList),
    {noreply, State1#state{combat_pid = NewCombatPidList}};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(start_match,
            State = #state{status = 1, map_id = MapId}) ->
    Msg = notice:format(lang:get("~ts正式开始"),
                        [{string_2, 1, lang:get("巅峰对决")}]),
    notice:cast({map, MapId}, 3, Msg),
    NewState = match(State),
    erlang:send_after(10000, self(), match),
    {noreply, NewState#state{is_start = 1}};
handle_info(match, State = #state{status = 1}) ->
    NewState = match(State),
    erlang:send_after(10000, self(), match),
    {noreply, NewState#state{is_start = 1}};
handle_info(match, State) -> {noreply, State};
handle_info(ending,
            State = #state{combat_pid = CombatPids}) ->
    lists:foreach(fun (CombatPid) when is_pid(CombatPid) ->
                          CombatPid ! stop;
                      (_) -> skip
                  end,
                  CombatPids),
    FirstRankList = cast_rank(State),
    cast_first(FirstRankList),
    {noreply, State#state{status = 0, combat_pid = []}};
handle_info(make_unit_pre,
            State = #state{map_id = MapId}) ->
    Msg =
        notice:format(lang:get("~ts中的宝箱即将刷出，诸位英雄们眼睛一定要放亮一点哦{face_1,25}"),
                      [{string_2, 1, lang:get("巅峰对决")}]),
    notice:cast({map, MapId}, 8, Msg),
    erlang:send_after(50000, self(), make_unit),
    {noreply, State};
handle_info(make_unit,
            State = #state{map_id = MapId,
                           next_unit_id = NextUnitId,
                           make_unit_order = MakeOrder}) ->
    unit_mgr:remove_map_all(MapId, {fun_type, 25}),
    Fun = fun (#top_compete_role{status = 1}, Num) ->
                  Num + 1;
              (_, Num) -> Num
          end,
    Size = ets:foldl(Fun, 0, top_compete_role),
    NewNextUnitId = make_unit(NextUnitId,
                              Size,
                              MakeOrder,
                              MapId),
    erlang:send_after(60000, self(), make_unit),
    {noreply,
     State#state{next_unit_id = NewNextUnitId,
                 make_unit_order = MakeOrder + 1}};
handle_info(time_out, State = #state{}) ->
    async_role(all, {top_compete, exit_zone, []}),
    {stop, normal, State};
handle_info(gain_exp, State = #state{status = 1}) ->
    async_role(all, {top_compete, apply_gain_exp, []}),
    erlang:send_after(60 * 1000, self(), gain_exp),
    {noreply, State};
handle_info(gain_exp, State) -> {noreply, State};
handle_info(_Info, State) ->
    logger:debug("收到未知消息:~w", [_Info], top_compete, 404),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [top_compete],
                top_compete,
                408),
    logger:info("[~w] 关闭完成",
                [top_compete],
                top_compete,
                409),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

make_unit(UnitId, Size, Times, MapId) ->
    Ratio = top_compete_data:get_box_ratio(Times),
    Num = round(Size * 2 / 5 * Ratio / 1000),
    Num1 = util:check_range(Num, 5, 40),
    Box4Num = util:ceil(Num1 * 400 / 1000),
    Box1Num = util:ceil(Num1 * 200 / 1000),
    Box2Num = util:ceil(Num1 * 200 / 1000),
    Box3Num = Num1 - Box4Num - Box1Num - Box2Num,
    logger:debug("Size:~w, Num:~w, Num1:~w, Box1Num:~w, "
                 "Box2Num:~w, Box3Num:~w, Box4Num:~w",
                 [Size, Num, Num1, Box1Num, Box2Num, Box3Num, Box4Num],
                 top_compete,
                 430),
    do_make_unit(UnitId,
                 [{79660, Box1Num},
                  {79661, Box2Num},
                  {79662, Box3Num},
                  {79663, Box4Num}],
                 MapId).

do_make_unit(UnitId, [], _MapId) -> UnitId;
do_make_unit(UnitId, [{BaseId, Num} | T], MapId)
    when Num > 0 ->
    NewUnitId = do_make_unit(UnitId, BaseId, Num, MapId),
    do_make_unit(NewUnitId, T, MapId);
do_make_unit(UnitId, [_ | T], MapId) ->
    do_make_unit(UnitId, T, MapId).

do_make_unit(UnitId, _BaseId, Num, _MapId)
    when Num =< 0 ->
    UnitId;
do_make_unit(UnitId, BaseId, Num, MapId) ->
    {X, Y} = rand_pos(),
    unit_mgr:create({18, UnitId}, BaseId, {MapId, X, Y}),
    do_make_unit(UnitId + 1, BaseId, Num - 1, MapId).

rand_pos() ->
    case map:rand_pos(30004) of
        {X, Y} -> {X, Y};
        _ ->
            util:rand_list([{3470, 1401},
                            {1102, 1487},
                            {866, 777},
                            {3276, 759},
                            {3200, 1966},
                            {886, 1949},
                            {2047, 1871},
                            {2056, 869},
                            {1533, 1286},
                            {2536, 1302},
                            {2530, 1789},
                            {1559, 1788}])
    end.

apply_gain_exp(Role = #role{s_event = 16, lev = Lev}) ->
    Gain1 = case top_compete_data:get_normal_exp(Lev) of
                {Exp, _} when Exp > 0 ->
                    [#gain{label = exp, val = Exp}];
                _ -> []
            end,
    Gain2 = case pet:get_war_pet(Role) of
                {ok, #pet{lev = PetLev}} ->
                    case top_compete_data:get_normal_exp(PetLev) of
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
apply_gain_exp(_Role) -> ok.

match(State = #state{combat_pid = CombatList}) ->
    L = ets:tab2list(top_compete_role),
    L1 = lists:keysort(#top_compete_role.match, L),
    L2 = lists:reverse(L1),
    MatchPair = do_match(L2, L2, []),
    Referee = self(),
    {CombatList1, UpdateIds, ResetIds} = combat(MatchPair,
                                                Referee,
                                                [],
                                                [],
                                                []),
    update_combat(L2, UpdateIds, ResetIds),
    State#state{combat_pid = CombatList ++ CombatList1}.

do_match([], _, MatchPair) -> MatchPair;
do_match([ARole = #top_compete_role{} | T], Other,
         MatchPair) ->
    case match_role(ARole, Other) of
        {true, BRole = #top_compete_role{name = _OtherName}} ->
            do_match(T -- [ARole, BRole],
                     Other -- [ARole, BRole],
                     [{ARole, BRole} | MatchPair]);
        {false, _Reason} ->
            do_match(T, Other -- [ARole], MatchPair)
    end.

match_role(_ARole, []) -> {false, null};
match_role(ARole, [ARole | T]) -> match_role(ARole, T);
match_role(#top_compete_role{is_combat = 1,
                             name = _Name},
           _) ->
    {false, combat};
match_role(#top_compete_role{die = Die, name = _Name},
           _)
    when Die =< 0 ->
    {false, die};
match_role(#top_compete_role{team_len = Len,
                             name = _Name},
           _)
    when Len < 3 ->
    {false, len};
match_role(#top_compete_role{status = 2, name = _Name},
           _) ->
    {false, leave};
match_role(#top_compete_role{status = 3, name = _Name},
           _) ->
    {false, offline};
match_role(#top_compete_role{team_status = 2,
                             name = _Name},
           _) ->
    {false, follow};
match_role(#top_compete_role{team_status = 3,
                             name = _Name},
           _) ->
    {false, away};
match_role(#top_compete_role{match = Match,
                             name = _Name},
           _)
    when Match =< 6 ->
    {false, six};
match_role(ARole,
           [#top_compete_role{is_combat = 1, name = _Name} | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#top_compete_role{die = Die, name = _Name} | T])
    when Die =< 0 ->
    match_role(ARole, T);
match_role(ARole,
           [#top_compete_role{team_len = Len, name = _Name} | T])
    when Len < 3 ->
    match_role(ARole, T);
match_role(ARole,
           [#top_compete_role{status = 2, name = _Name} | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#top_compete_role{status = 3, name = _Name} | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#top_compete_role{team_status = 2, name = _Name}
            | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#top_compete_role{team_status = 3, name = _Name}
            | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#top_compete_role{match = Match, name = _Name} | T])
    when Match =< 6 ->
    match_role(ARole, T);
match_role(ARole = #top_compete_role{id = Aid,
                                     last_role_id = Bid, match = Match,
                                     name = _Name1},
           [#top_compete_role{id = Bid, last_role_id = Aid,
                              name = _Name2}
            | T])
    when Match =< 11 ->
    match_role(ARole, T);
match_role(ARole = #top_compete_role{match = Match,
                                     name = AName},
           [BRole = #top_compete_role{name = BName} | T]) ->
    case {get_info(ARole), get_info(BRole)} of
        {{ALev, ALen}, {BLev, BLen}} ->
            {LevRange, LenRange} = case Match of
                                       0 -> {0, 4};
                                       1 -> {0, 4};
                                       2 -> {0, 4};
                                       3 -> {0, 4};
                                       4 -> {1, 4};
                                       5 -> {2, 4};
                                       6 -> {3, 4};
                                       7 -> {5, 4};
                                       8 -> {10, 4};
                                       _ -> {100, 4}
                                   end,
            MinLev = ALev - LevRange,
            MaxLev = ALev + LevRange,
            MinLen = ALen - LenRange,
            MaxLen = ALen + LenRange,
            case BLev >= MinLev andalso
                     BLev =< MaxLev andalso
                         BLen >= MinLen andalso BLen =< MaxLen
                of
                true -> {true, BRole};
                false ->
                    case Match > 10 of
                        true ->
                            logger:info("[~ts]匹配大于10次也无法匹配到[~ts][~w][~w][~w][~w]",
                                        [AName,
                                         BName,
                                         MinLev,
                                         MaxLev,
                                         MinLen,
                                         MaxLen],
                                        top_compete,
                                        613);
                        _ -> skip
                    end,
                    match_role(ARole, T)
            end;
        _Err ->
            logger:error("无法获取[~ts]和[~ts]对应状态,原因:~w",
                         [AName, BName, _Err],
                         top_compete,
                         619),
            match_role(ARole, T)
    end.

get_info(#top_compete_role{team_status = 3,
                           lev = Lev}) ->
    {Lev, 1};
get_info(#top_compete_role{team_status = 0,
                           lev = Lev}) ->
    {Lev, 1};
get_info(#top_compete_role{team_status = 1,
                           team_lev = TeamLev, team_len = TeamLen}) ->
    {TeamLev, TeamLen};
get_info(_Err) ->
    logger:error("无法获取个人信息:~w", [_Err], top_compete, 631),
    false.

update_combat([], _, _) -> ok;
update_combat([Tc = #top_compete_role{id = RoleId,
                                      status = 1, is_combat = 0, match = Match}
               | T],
              IdList, ResetIds) ->
    NewTc = case lists:keyfind(RoleId, 2, IdList) of
                {LastRoleId, _} ->
                    Tc#top_compete_role{is_combat = 1, match = 0,
                                        last_role_id = LastRoleId};
                false ->
                    case lists:member(RoleId, ResetIds) of
                        true -> Tc#top_compete_role{match = 0};
                        _ -> Tc#top_compete_role{match = Match + 1}
                    end
            end,
    update_role(NewTc),
    update_combat(T, IdList, ResetIds);
update_combat([_ | T], IdList, ResetIds) ->
    update_combat(T, IdList, ResetIds).

combat([], _, CombatPids, UpdateIds, ResetIds) ->
    {CombatPids, UpdateIds, ResetIds};
combat([{A = #top_compete_role{name = AName},
         B = #top_compete_role{name = BName}}
        | T],
       Referee, CombatPids, UpdateIds, ResetIds) ->
    case do_combat(A, B, Referee, UpdateIds) of
        {true, CombatPid, AddUpdateIds} ->
            combat(T,
                   Referee,
                   [CombatPid | CombatPids],
                   AddUpdateIds ++ UpdateIds,
                   ResetIds);
        {false, AddResetIds} ->
            logger:error("[~ts]和[~ts]匹配却发起战斗失败",
                         [AName, BName],
                         top_compete,
                         662),
            combat(T,
                   Referee,
                   CombatPids,
                   UpdateIds,
                   AddResetIds ++ ResetIds)
    end.

do_combat(#top_compete_role{id = Aid, pid = APid,
                            name = AName},
          #top_compete_role{id = Bid, pid = BPid, name = BName},
          Referee, UpdateIds) ->
    Args = #combat_start_args{common_referee = Referee},
    case get_mem(APid, UpdateIds) of
        {true, ATeamPid, ATeam, IdList1, FailNames1} ->
            case get_mem(BPid, UpdateIds ++ IdList1) of
                {true, BTeamPid, BTeam, IdList2, FailNames2} ->
                    case combat_mgr:start_combat(104, ATeam, BTeam, Args) of
                        {ok, CombatPid} ->
                            NewIdList1 = [{Bid, Rid} || Rid <- IdList1],
                            NewIdList2 = [{Aid, Rid} || Rid <- IdList2],
                            combat_fail(ATeamPid, FailNames1),
                            combat_fail(BTeamPid, FailNames2),
                            {true, CombatPid, NewIdList1 ++ NewIdList2};
                        {false, _Reason} ->
                            logger:error("[~ts]和[~ts]发起战斗失败[~w]",
                                         [AName, BName, _Reason],
                                         top_compete,
                                         691),
                            {false, [Aid, Bid]}
                    end;
                false -> {false, [Bid]}
            end;
        false -> {false, [Aid]}
    end.

combat_fail(TeamPid, FailNames = [_ | _])
    when is_pid(TeamPid) ->
    NameArgs = string:join(FailNames, "、"),
    Msg = notice:format(lang:get("~ts不在活动中，请退出后重新进入活动"),
                        [{string_2, 2, NameArgs}]),
    team:notice_up(TeamPid, Msg);
combat_fail(_, _) -> ok.

check_id([], _UpdateIds, IdList) -> {true, IdList};
check_id([{leader, RoleId, _} | T], UpdateIds,
         IdList) ->
    case lists:keymember(RoleId, 2, UpdateIds) of
        false -> check_id(T, UpdateIds, [RoleId | IdList]);
        _Err ->
            logger:error("[~w]已经存在匹配列表[~w]",
                         [RoleId, _Err],
                         top_compete,
                         714),
            false
    end;
check_id([#team_mate{id = RoleId} | T], UpdateIds,
         IdList) ->
    case lists:keymember(RoleId, 2, UpdateIds) of
        false -> check_id(T, UpdateIds, [RoleId | IdList]);
        _Err ->
            logger:error("[~w]已经存在匹配列表[~w]",
                         [RoleId, _Err],
                         top_compete,
                         721),
            false
    end;
check_id([RoleId = {_, _, _} | T], UpdateIds, IdList) ->
    case lists:keymember(RoleId, 2, UpdateIds) of
        false -> check_id(T, UpdateIds, [RoleId | IdList]);
        _Err ->
            logger:error("[~w]已经存在匹配列表[~w]",
                         [RoleId, _Err],
                         top_compete,
                         728),
            false
    end;
check_id([_Err | _T], _UpdateIds, _IdList) ->
    logger:error("未知成员列表[~w]", [_Err], top_compete, 732),
    false.

get_mem(RolePid, IdList) ->
    case role:apply(sync,
                    RolePid,
                    {top_compete, get_team_mem, []})
        of
        {true, TeamPid, TeamMate, FailNames} ->
            case check_id(TeamMate, IdList, []) of
                {true, List1} ->
                    {true, TeamPid, TeamMate, List1, FailNames};
                false -> false
            end;
        false -> false;
        _Err ->
            logger:error("获取角色状态失败:~w", [_Err], top_compete, 745),
            false
    end.

get_team_mem(Role = #role{name = RoleName,
                          m_team = #m_team{pid = TeamPid}}) ->
    case check_status(Role) of
        {ok, true} ->
            case team:get_fighters(Role) of
                {ok, TeamMate} ->
                    NewTeamMate = case TeamMate of
                                      [{leader, #role{id = RoleId}, GuardPos}
                                       | T] ->
                                          [{leader, RoleId, GuardPos} | T];
                                      [#role{id = RoleId} | T] -> [RoleId | T];
                                      _ -> TeamMate
                                  end,
                    {FailMate, FailNames} = check_mate(NewTeamMate,
                                                       {[], []}),
                    NewTeamMate1 = NewTeamMate -- FailMate,
                    case NewTeamMate1 of
                        [] -> {ok, false};
                        _ -> {ok, {true, TeamPid, NewTeamMate1, FailNames}}
                    end;
                _Err ->
                    logger:error("无法获取[~ts]的队伍信息[~w]",
                                 [RoleName, _Err],
                                 top_compete,
                                 771),
                    {ok, false}
            end;
        _ -> {ok, false}
    end.

check_mate([], {FailMate, FailNames}) ->
    {FailMate, FailNames};
check_mate([Mate = #team_mate{pid = Pid, name = Name}
            | T],
           {FailMate, FailNames}) ->
    case role:apply(sync,
                    Pid,
                    {top_compete, check_status, []})
        of
        true -> check_mate(T, {FailMate, FailNames});
        false ->
            check_mate(T, {[Mate | FailMate], [Name | FailNames]});
        _Err ->
            logger:error("请求队员状态失败[~w]", [_Err], top_compete, 787),
            check_mate(T, {[Mate | FailMate], [Name | FailNames]})
    end;
check_mate([{_, _, _} | T], {FailMate, FailNames}) ->
    check_mate(T, {FailMate, FailNames});
check_mate([_Err | T], {FailMate, FailNames}) ->
    logger:error("未知队员无法检测[~w]", [_Err], top_compete, 793),
    check_mate(T, {FailMate, FailNames}).

check_status(#role{name = Name, status = 2}) ->
    logger:error("[~ts]战斗中，无法进入战斗",
                 [Name],
                 top_compete,
                 798),
    {ok, false};
check_status(#role{name = Name,
                   m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    logger:error("[~ts]战斗中，无法进入战斗",
                 [Name],
                 top_compete,
                 801),
    {ok, false};
check_status(#role{s_event = 16}) -> {ok, true};
check_status(#role{name = Name, s_event = Event}) ->
    logger:error("[~ts]状态异常[~w]，无法进入战斗",
                 [Name, Event],
                 top_compete,
                 806),
    {ok, false};
check_status(_) -> {ok, false}.

calc_team_lev(AllLev) ->
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 5.0e-1 + Max * 5.0e-1),
            Val;
        _ -> 40
    end.

die_exit_zone(Role = #role{}) ->
    Timer = #timer{id = top_compete_exit,
                   timeout = 3 * 1000, m = top_compete,
                   f = do_die_exit_zone, a = []},
    Role1 = role_timer:set(Timer, Role),
    {ok, Role1}.

do_die_exit_zone(Role = #role{s_event_pid = ZonePid,
                              name = Name}) ->
    ExitRole = case exit_zone(Role, [], ZonePid) of
                   {false, _Reason} -> Role;
                   {ok, NewRole} -> NewRole;
                   _ -> Role
               end,
    AwayRole = case team:sync_away(ExitRole) of
                   {ok, NewRole1} -> NewRole1;
                   _ -> ExitRole
               end,
    NoticeMsg =
        notice:format(lang:get("巅峰对决复活次数已用完，系统自动传送出场，可在~ts结算奖励"),
                      [{string_2, 1, lang:get("邮件领取")}]),
    notice:send(AwayRole, 3, NoticeMsg),
    Msg = notice:format(lang:get("~ts已用完所有死亡次数，系统自动将其传送出场"),
                        [{role_2, Name}]),
    team:notice(Role, Msg),
    {ok, AwayRole}.

async_combat_over(Role = #role{lev = Lev,
                               name = RoleName},
                  IsWin, AddScore,
                  Tz = #top_compete_role{times = Times, die = Die},
                  SendMail) ->
    push_15103(Role, Tz),
    Msg = case IsWin of
              1 ->
                  notice:format(lang:get("战斗胜利，获得~ts点巅峰积分"),
                                [{string_2, 1, AddScore}]);
              _ -> lang:get("战斗失败，无法获得巅峰积分")
          end,
    notice:send(Role, 3, Msg),
    Role1 = case Die =< 0 of
                true ->
                    {ok, ExitRole} = die_exit_zone(Role),
                    ExitRole;
                _ -> Role
            end,
    case SendMail of
        true -> send_mail(Tz);
        _ -> skip
    end,
    StarScore = if Times > 12 -> [];
                   Times >= 7 ->
                       case IsWin of
                           1 -> [{90020, 2}];
                           _ -> [{90020, 1}]
                       end;
                   true ->
                       case IsWin of
                           1 -> [{90020, 4}];
                           _ -> [{90020, 1}]
                       end
                end,
    ExpRatio = case IsWin of
                   1 -> 1;
                   _ -> 5.99999999999999977796e-1
               end,
    RoleExp = case top_compete_data:get_exp(Lev) of
                  Lev1 when Lev1 > 0 -> [{90010, round(Lev1 * ExpRatio)}];
                  _ -> []
              end,
    PetExp = case pet:get_war_pet(Role) of
                 {ok, #pet{lev = PetLev}} ->
                     case top_compete_data:get_pet_exp(PetLev) of
                         Lev2 when is_integer(Lev2) ->
                             [{90005, round(Lev2 * ExpRatio)}];
                         _ -> []
                     end;
                 _ -> []
             end,
    {RoleExp1, PetExp1} = if Times > 20 -> {[], []};
                             Times >= 11 ->
                                 {[{AssetsId, round(AssetsVal * 5.0e-1)}
                                   || {AssetsId, AssetsVal} <- RoleExp],
                                  [{AssetsId, round(AssetsVal * 5.0e-1)}
                                   || {AssetsId, AssetsVal} <- PetExp]};
                             true -> {RoleExp, PetExp}
                          end,
    {CastGain, ItemGain} = case Times =< 12 of
                               true -> item_gain(Role);
                               _ -> {[], []}
                           end,
    Gain = StarScore ++ RoleExp1 ++ PetExp1 ++ ItemGain,
    GainList = format:val_to_gain(Gain),
    case role_gain:do_notice(GainList, Role1) of
        {ok, NewRole} ->
            cast_item_gain(NewRole, IsWin, CastGain),
            {ok, NewRole};
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("巅峰对决奖励"),
            Content = lang:get("巅峰对决战斗奖励时，背包已满"),
            mail:send(Role,
                      #{title => Title, content => Content, items => Gain}),
            cast_item_gain(Role, IsWin, CastGain),
            {ok, Role};
        {false, _Reason} ->
            logger:error("[~ts]巅峰对决结算时无法增加[~w]",
                         [RoleName, _Reason],
                         top_compete,
                         937),
            ok
    end.

send_mail(#top_compete_role{id = RoleId, die = Die,
                            lev = Lev}) ->
    Title = lang:get("巅峰对决结算"),
    {ExpRatio, Content} = case Die > 0 of
                              true -> {1, lang:get("你在巅峰对决中表现优异，额外获得了以下奖励")};
                              _ ->
                                  {5.99999999999999977796e-1,
                                   lang:get("你在巅峰对决中的积极表现被星辰学院注意到，额外获得了以下奖励")}
                          end,
    ItemGain = mail_item(Die),
    ExpGain = case top_compete_data:get_exp(Lev) of
                  Exp when Exp > 0 ->
                      [{90010, round(Exp * 25 * ExpRatio)}];
                  _ -> []
              end,
    Gain = ItemGain ++ ExpGain,
    mail:send(RoleId,
              #{title => Title, content => Content, items => Gain}),
    ok;
send_mail(_) -> ok.

mail_item(Die) ->
    ItemId = case Die > 0 of
                 true -> 23015;
                 _ -> 23016
             end,
    [{ItemId, 0, 1}].

deal_combat_result(_Flag, [], _, _, _, State) -> State;
deal_combat_result(win,
                   [#{id := RoleId, pid := Pid, is_leader := IsLeader}
                    | T],
                   RandTime, LastTime, MateNum, State) ->
    AddScore = case IsLeader =:= 1 andalso MateNum >= 3 of
                   true -> round(50 * 1.5);
                   _ -> 50
               end,
    case find_role(RoleId) of
        {true, #top_compete_role{die = Die}} when Die =< 0 ->
            role:apply(async,
                       Pid,
                       {top_compete, die_exit_zone, []}),
            deal_combat_result(win,
                               T,
                               RandTime,
                               LastTime,
                               MateNum,
                               State);
        {true,
         Tz = #top_compete_role{score = Score, win = Win,
                                times = Times, win_streak = WinStreak}} ->
            NewTimes = Times + 1,
            NewWin = Win + 1,
            NewWinStreak = WinStreak + 1,
            NewScore = calc_score(win, NewTimes, AddScore, Score),
            NewTz = Tz#top_compete_role{score = NewScore,
                                        win = NewWin, times = NewTimes,
                                        is_combat = 0,
                                        last_combat_over_time = LastTime,
                                        match = RandTime,
                                        win_streak = NewWinStreak},
            update_role(NewTz),
            role:apply(async,
                       Pid,
                       {top_compete,
                        async_combat_over,
                        [1, AddScore, NewTz, false]}),
            NewState = update_first(NewTz, State),
            case IsLeader of
                1 -> cast_win_streak(NewTz);
                _ -> ok
            end,
            deal_combat_result(win,
                               T,
                               RandTime,
                               LastTime,
                               MateNum,
                               NewState);
        _ ->
            deal_combat_result(win,
                               T,
                               RandTime,
                               LastTime,
                               MateNum,
                               State)
    end;
deal_combat_result(lose,
                   [#{id := RoleId, pid := Pid, is_leader := IsLeader}
                    | T],
                   RandTime, LastTime, MateNum, State) ->
    AddScore = case IsLeader =:= 1 andalso MateNum >= 3 of
                   true -> round(20 * 1.5);
                   _ -> 20
               end,
    case find_role(RoleId) of
        {true, #top_compete_role{die = Die}} when Die =< 0 ->
            role:apply(async,
                       Pid,
                       {top_compete, die_exit_zone, []}),
            deal_combat_result(lose,
                               T,
                               RandTime,
                               LastTime,
                               MateNum,
                               State);
        {true,
         Tz = #top_compete_role{score = Score, times = Times,
                                die = Die, has_mail = OldHasMail}} ->
            NewTimes = Times + 1,
            NewDie = max(Die - 1, 0),
            NewScore = calc_score(lose, NewTimes, AddScore, Score),
            {SendMail, NewHasMail} = case OldHasMail of
                                         1 -> {false, OldHasMail};
                                         _ ->
                                             case NewDie =< 0 of
                                                 true -> {true, 1};
                                                 _ -> {false, 0}
                                             end
                                     end,
            NewTz = Tz#top_compete_role{score = NewScore,
                                        times = NewTimes, is_combat = 0,
                                        last_combat_over_time = LastTime,
                                        die = NewDie, match = RandTime,
                                        has_mail = NewHasMail, win_streak = 0},
            update_role(NewTz),
            role:apply(async,
                       Pid,
                       {top_compete,
                        async_combat_over,
                        [0, AddScore, NewTz, SendMail]}),
            NewState = update_first(NewTz, State),
            deal_combat_result(lose,
                               T,
                               RandTime,
                               LastTime,
                               MateNum,
                               NewState);
        _ ->
            deal_combat_result(lose,
                               T,
                               RandTime,
                               LastTime,
                               MateNum,
                               State)
    end;
deal_combat_result(fail, [#{id := RoleId} | T],
                   RandTime, LastTime, MateNum, State) ->
    case find_role(RoleId) of
        {true, Tz = #top_compete_role{}} ->
            NewTz = Tz#top_compete_role{is_combat = 0},
            update_role(NewTz);
        _ -> skip
    end,
    deal_combat_result(fail,
                       T,
                       RandTime,
                       LastTime,
                       MateNum,
                       State);
deal_combat_result(Flag, [_ | T], RandTime, LastTime,
                   MateNum, State) ->
    deal_combat_result(Flag,
                       T,
                       RandTime,
                       LastTime,
                       MateNum,
                       State).

calc_score(win, _Time, AddScore, Score) ->
    Score + AddScore;
calc_score(lose, _Times, _AddScore, Score) -> Score.

find_role(RoleId) ->
    case catch ets:lookup(top_compete_role, RoleId) of
        [Tz = #top_compete_role{}] -> {true, Tz};
        _ -> false
    end.

update_role(Tz = #top_compete_role{}) ->
    ets:insert(top_compete_role, Tz),
    ok.

team_check(enter, Role = #role{lev = Lev}) ->
    case team:get_status(Role) of
        {true, 1} ->
            case team:get_members(Role) of
                [] -> {true, [], {1, Lev, 1}};
                TeamList = [_ | _] ->
                    NewTeamList = [M
                                   || M = #team_mate{status = 2} <- TeamList],
                    TeamLen = length(NewTeamList) + 1,
                    TeamLev = [MateLev
                               || #team_mate{lev = MateLev} <- NewTeamList],
                    NewTeamLev = calc_team_lev([Lev | TeamLev]),
                    {true, NewTeamList, {1, NewTeamLev, TeamLen}};
                _ -> false
            end;
        {true, 3} -> {true, [], {3, Lev, 1}};
        {true, _} -> false;
        false -> {true, [], {0, Lev, 1}}
    end;
team_check(exit, Role) ->
    case team:get_status(Role) of
        false -> {true, []};
        {true, 3} -> {true, []};
        {true, 1} ->
            case team:get_members(Role) of
                [] -> {true, []};
                TeamList = [_ | _] ->
                    case [M
                          || M = #team_mate{status = Status} <- TeamList,
                             Status =:= 2]
                        of
                        [] -> {true, []};
                        _ -> {false, lang:get("有跟随队员时无法退出战区")}
                    end;
                _ -> {false, lang:get("请先退出队伍才能离开战区")}
            end;
        {true, _} -> {false, lang:get("请先退出队伍才能离开战区")}
    end.

async_role(all, Mfa) ->
    Fun = fun (#top_compete_role{pid = Pid}, _) ->
                  role:apply(async, Pid, Mfa)
          end,
    ets:foldl(Fun, 1, top_compete_role),
    ok.

exit_zone(Role) -> exit_zone(Role, [], undefined).

apply_exit_zone(Role = #role{pid = RolePid}, ZonePid) ->
    case team_check(exit, Role) of
        {true, TeamList} ->
            case check_role_exit(Role) of
                {false, Reason} ->
                    role:pack_send(RolePid, 15102, {0, Reason}),
                    ok;
                true ->
                    case exit_zone(Role, TeamList, ZonePid) of
                        {false, _Reason} -> ok;
                        {ok, NewRole} -> {ok, NewRole}
                    end
            end;
        {false, Reason} ->
            role:pack_send(RolePid, 15102, {0, Reason}),
            ok
    end.

check_role_exit(#role{s_event = Event})
    when Event =/= 16 ->
    {false, lang:get("当前状态下无需退出战区")};
check_role_exit(#role{m_combat =
                          #m_combat{pid = CombatPid}})
    when is_pid(CombatPid) ->
    {false, lang:get("战斗中不能退出战区")};
check_role_exit(#role{status = Status})
    when Status =/= 0 ->
    {false, lang:get("当前状态下不能退出战区")};
check_role_exit(_) -> true.

exit_zone(Role = #role{id = RoleId, s_event = 16,
                       pos =
                           #pos{last =
                                    #pos_history{map = OldMap, x = OldX,
                                                 y = OldY,
                                                 platform = OldPlatform,
                                                 zone_id = OldZoneId}}},
          TeamList, ZonePid) ->
    Role1 = Role#role{s_event = 0, s_event_pid = undefined},
    TeamEvt = make_team_exit_evt(TeamList, ZonePid),
    case map:role_enter({OldPlatform,
                         OldZoneId,
                         OldMap,
                         OldX,
                         OldY},
                        TeamEvt,
                        Role1)
        of
        {error, Reason} -> {false, Reason};
        {ok, NewRole} ->
            case is_pid(ZonePid) of
                true -> cast(ZonePid, {has_exit, RoleId});
                false -> skip
            end,
            {ok, NewRole}
    end;
exit_zone(_Role, _TeamList, _ZonePid) -> ok.

async_exit_zone(_OldRole = #role{},
                Role = #role{id = RoleId}, _ExitPos, ZonePid) ->
    Role1 = Role#role{s_event = 0, s_event_pid = undefined},
    case is_pid(ZonePid) of
        true -> cast(ZonePid, {has_exit, RoleId});
        false -> skip
    end,
    {ok, Role1}.

apply_enter(Role = #role{id = RoleId, pid = RolePid},
            ZonePid, MapId, Flag) ->
    case team_check(enter, Role) of
        {true, TeamList, TeamArgs} ->
            TeamList1 = lists:keydelete(RoleId,
                                        #team_mate.id,
                                        TeamList),
            case role_enter_check(Role, [Role | TeamList1]) of
                true ->
                    enter_zone(Role,
                               TeamList1,
                               ZonePid,
                               MapId,
                               Flag,
                               TeamArgs);
                {false, Reason} ->
                    role:pack_send(RolePid, 13512, {0, Reason}),
                    ok
            end;
        false ->
            role:pack_send(RolePid,
                           13512,
                           {0, lang:get("归队状态下，无法进行此操作")}),
            ok
    end.

enter_zone(Role = #role{s_event = 0, id = RoleId,
                        name = RoleName, pid = RolePid, pos = OldPos, lev = Lev,
                        sex = Sex, classes = Classes, s_looks = Looks},
           TeamList, ZonePid, MapId, Flag,
           {TeamStatus, TeamLev, TeamLen}) ->
    Role1 = Role#role{s_event = 16, s_event_pid = ZonePid},
    TeamEvt = make_team_enter_evt(TeamList, ZonePid, MapId),
    #pos{platform = Lp, zone_id = Lz, map = LMapId, x = Lx,
         y = Ly} =
        OldPos,
    {X, Y} = util:rand_list([{3470, 1401},
                             {1102, 1487},
                             {866, 777},
                             {3276, 759},
                             {3200, 1966},
                             {886, 1949},
                             {2047, 1871},
                             {2056, 869},
                             {1533, 1286},
                             {2536, 1302},
                             {2530, 1789},
                             {1559, 1788}]),
    case map:role_enter({MapId,
                         X + util:rand(-100, 100),
                         Y + util:rand(-100, 100)},
                        TeamEvt,
                        Role1)
        of
        {error, Reason} -> {false, Reason};
        {ok, NewRole = #role{pos = Pos}} ->
            NewPos = Pos#pos{last =
                                 #pos_history{platform = Lp, zone_id = Lz,
                                              map = LMapId, x = Lx, y = Ly}},
            NewRole1 = NewRole#role{pos = NewPos},
            case Flag of
                follow -> team:follow(NewRole1);
                _ -> ok
            end,
            RankPoint = qualifying_mgr:get_week_rank_point(RoleId),
            cast(ZonePid,
                 {has_enter,
                  RoleId,
                  RoleName,
                  RolePid,
                  Sex,
                  Classes,
                  Lev,
                  RankPoint,
                  TeamStatus,
                  TeamLev,
                  TeamLen,
                  Looks}),
            {ok, NewRole1}
    end;
enter_zone(_Role, _TeamList, _ZonePid, _MapId, _Flag,
           _TeamArgs) ->
    ok.

async_enter_zone(_OldRole = #role{pos = OldPos},
                 Role = #role{id = RoleId, name = RoleName,
                              pid = RolePid, pos = Pos, sex = Sex,
                              classes = Classes, lev = Lev, s_looks = Looks},
                 _EnterPos, ZonePid, _MapId) ->
    #pos{platform = Lp, zone_id = Lz, map = LMapId, x = Lx,
         y = Ly} =
        OldPos,
    Role1 = Role#role{s_event = 16, s_event_pid = ZonePid},
    NewPos = Pos#pos{last =
                         #pos_history{platform = Lp, zone_id = Lz, map = LMapId,
                                      x = Lx, y = Ly}},
    NewRole = Role1#role{pos = NewPos},
    RankPoint = qualifying_mgr:get_week_rank_point(RoleId),
    cast(ZonePid,
         {has_enter,
          RoleId,
          RoleName,
          RolePid,
          Sex,
          Classes,
          Lev,
          RankPoint,
          2,
          Lev,
          1,
          Looks}),
    {ok, NewRole};
async_enter_zone(_, _, _, _, _) ->
    {false, lang:get("队员进入巅峰对决战区参数错误")}.

make_team_enter_evt([], _, _) -> self;
make_team_enter_evt(TeamList, ZonePid, MapId) ->
    RoleIds = [Id
               || #team_mate{id = Id, status = 2} <- TeamList],
    #{label => enter_event, role_ids => RoleIds,
      mfa =>
          {top_compete, async_enter_zone, [ZonePid, MapId]},
      event => 16}.

make_team_exit_evt([], _) -> self;
make_team_exit_evt(TeamList, ZonePid) ->
    RoleIds = [Id
               || #team_mate{id = Id, status = 2} <- TeamList],
    #{label => exit_event, role_ids => RoleIds,
      mfa => {top_compete, async_exit_zone, [ZonePid]},
      event => 0}.

role_enter_check(_Role, []) -> true;
role_enter_check(Role = #role{id = RoleId},
                 [#role{id = RoleId} | T]) ->
    case do_check_enter(Role) of
        {ok, {false, Reason}} -> {false, Reason};
        {ok, true} -> role_enter_check(Role, T)
    end;
role_enter_check(Role,
                 [#team_mate{pid = RolePid} | T]) ->
    case role:apply(sync,
                    RolePid,
                    {top_compete, do_check_enter, []})
        of
        {false, Reason} -> {false, Reason};
        true -> role_enter_check(Role, T);
        _Err ->
            logger:error("组队进入巅峰对决战区时发生异常:~w",
                         [_Err],
                         top_compete,
                         1250),
            {false, lang:get("系统繁忙, 请稍后尝试")}
    end.

do_check_enter(Role = #role{name = RoleName}) ->
    case role_misc:check_event(Role) of
        {false, Reason} ->
            Msg = util:flist(lang:get("[~ts]~ts"),
                             [RoleName, Reason]),
            {ok, {false, Msg}};
        true -> {ok, true}
    end.

check_has_enter(_Role = #role{id = RoleId}, TeamList,
                normal) ->
    TeamIdList = [Id || #team_mate{id = Id} <- TeamList],
    do_check_has_enter([RoleId | TeamIdList]);
check_has_enter(_Role = #role{id = RoleId}, _TeamList,
                _) ->
    do_check_has_enter([RoleId]).

do_check_has_enter([]) -> true;
do_check_has_enter([RoleId | T]) ->
    case find_role(RoleId) of
        {true, #top_compete_role{die = Die}} when Die =< 0 ->
            {false, lang:get("巅峰对决没有复活次数无法进入")};
        _ -> do_check_has_enter(T)
    end.

item_gain(_Role = #role{}) ->
    List = top_compete_data:get_combat(),
    case util:rand_list(List, ratio) of
        #{item_id := 0} -> {[], []};
        #{item_id := ItemId, num := Num, is_cast := IsCast} ->
            NewItemId = item_type:special_id(ItemId),
            case IsCast of
                1 -> {[{NewItemId, Num}], [{NewItemId, 0, Num}]};
                _ -> {[], [{NewItemId, 0, Num}]}
            end;
        _ -> {[], []}
    end.

cast_item_gain(#role{name = RoleName}, IsWin,
               CastGain = [_ | _]) ->
    Msg = case IsWin of
              1 ->
                  notice:format(lang:get("~ts在~ts中一拳揍趴对手，突然发现一个~ts{face_1,18}"),
                                [{role_2, RoleName},
                                 {string_2, 1, lang:get("巅峰对决")},
                                 {item_2, CastGain}]);
              _ ->
                  notice:format(lang:get("~ts在~ts中不小心被打倒，爬起来的时候竟发现~ts{face_1,15}"),
                                [{role_2, RoleName},
                                 {string_2, 1, lang:get("巅峰对决")},
                                 {item_2, CastGain}])
          end,
    notice:cast(all, 5, Msg),
    ok;
cast_item_gain(_Role, _, _) -> ok.

update_first(Tz = #top_compete_role{classes = 1},
             State = #state{first_sword = FirstSword}) ->
    NewFirstSword = check_first(Tz, FirstSword),
    State#state{first_sword = NewFirstSword};
update_first(Tz = #top_compete_role{classes = 2},
             State = #state{first_mage = FirstMage}) ->
    NewFirstMage = check_first(Tz, FirstMage),
    State#state{first_mage = NewFirstMage};
update_first(Tz = #top_compete_role{classes = 3},
             State = #state{first_archer = FirstArcher}) ->
    NewFirstArcher = check_first(Tz, FirstArcher),
    State#state{first_archer = NewFirstArcher};
update_first(Tz = #top_compete_role{classes = 4},
             State = #state{first_orc = FirstOrc}) ->
    NewFirstOrc = check_first(Tz, FirstOrc),
    State#state{first_orc = NewFirstOrc};
update_first(Tz = #top_compete_role{classes = 5},
             State = #state{first_devine = FirstDevine}) ->
    NewFirstDevine = check_first(Tz, FirstDevine),
    State#state{first_devine = NewFirstDevine};
update_first(Tz = #top_compete_role{classes = 6},
             State = #state{first_moon = FirstMoon}) ->
    NewFirstMoon = check_first(Tz, FirstMoon),
    State#state{first_moon = NewFirstMoon};
update_first(Tz = #top_compete_role{classes = 7},
             State = #state{first_templar = FirstTemplar}) ->
    NewFirstTemplar = check_first(Tz, FirstTemplar),
    State#state{first_templar = NewFirstTemplar};
update_first(_, State) -> State.

check_first(Tz = #top_compete_role{}, undefined) -> Tz;
check_first(Tz1 = #top_compete_role{score = Score1,
                                    rank_point = RankPoint1},
            Tz2 = #top_compete_role{score = Score2,
                                    rank_point = RankPoint2}) ->
    AllScore1 = Score1 + round(RankPoint1 * 5.0e-2),
    AllScore2 = Score2 + round(RankPoint2 * 5.0e-2),
    case AllScore2 >= AllScore1 of
        true -> Tz2;
        false -> Tz1
    end.

cast_rank(State) ->
    case env:get(top_fashion1) of
        ToFashion1 when is_list(ToFashion1) ->
            env:save(top_fashion2, ToFashion1);
        _ -> ignore
    end,
    case env:get(top_fashion) of
        ToFashion when is_list(ToFashion) ->
            env:save(top_fashion1, ToFashion);
        _ -> ignore
    end,
    env:del(top_fashion),
    FirstRankList = make_first_list(State),
    RoleList = ets:tab2list(top_compete_role),
    Now = date:unixtime(),
    RankList = do_calc_role(RoleList,
                            FirstRankList,
                            Now,
                            []),
    RankList1 = util:keys_sort([#rank_rc.val2,
                                #rank_rc.val1],
                               RankList),
    RankList2 = lists:sublist(RankList1, 100),
    rank_zone:cast(41,
                   {replace, 41, RankList2, #{reward => 0}}),
    FirstRankList.

do_calc_role([], _FirstRankList, _Now, RankList) ->
    RankList;
do_calc_role([Tz = #top_compete_role{id = RoleId,
                                     pid = Pid, status = Status, score = Score,
                                     rank_point = RankPoint, has_mail = HasMail}
              | T],
             FirstRankList, Now, RankList) ->
    case Status of
        1 ->
            case is_pid(Pid) of
                true ->
                    role:pack_send(Pid,
                                   15104,
                                   {Score, RankPoint, FirstRankList});
                _ -> ok
            end;
        _ -> ok
    end,
    case HasMail of
        0 -> send_mail(Tz);
        _ -> ok
    end,
    RankRc = to_rank_list(Tz, Now),
    RankRc1 = case lists:keymember(RoleId,
                                   #top_compete_role.id,
                                   FirstRankList)
                  of
                  true -> RankRc#rank_rc{val3 = 1};
                  _ -> RankRc
              end,
    do_calc_role(T,
                 FirstRankList,
                 Now,
                 [RankRc1 | RankList]);
do_calc_role([_Err | T], FirstRankList, Now,
             RankList) ->
    logger:error("错误的巅峰对决数据:~w", [_Err], top_compete, 1402),
    do_calc_role(T, FirstRankList, Now, RankList).

to_rank_list(#top_compete_role{id =
                                   {RoleId, Platform, ZoneId},
                               name = Name, sex = Sex, classes = Classes,
                               lev = Lev, score = Score,
                               rank_point = RankPoint},
             Now) ->
    AllScore = Score + round(RankPoint * 5.0e-2),
    RankRc = #rank_rc{id = {RoleId, Platform, ZoneId},
                      role_id = RoleId, platform = Platform, zone_id = ZoneId,
                      name = Name, sex = Sex, classes = Classes, lev = Lev,
                      time = Now, val1 = AllScore, val2 = Score},
    RankRc.

cast_first(FirstRankList) ->
    Fun = fun (#top_compete_role{id = RoleId,
                                 classes = Classes},
               HonorList) ->
                  case Classes of
                      1 -> [{RoleId, 11062} | HonorList];
                      2 -> [{RoleId, 11063} | HonorList];
                      3 -> [{RoleId, 11064} | HonorList];
                      4 -> [{RoleId, 11065} | HonorList];
                      5 -> [{RoleId, 11066} | HonorList];
                      6 -> [{RoleId, 11079} | HonorList];
                      7 -> [{RoleId, 11087} | HonorList];
                      _ -> HonorList
                  end
          end,
    AddHonorList = lists:foldl(Fun, [], FirstRankList),
    honor_mgr:replace(top_compete_rank, AddHonorList, 0),
    Fun2 = fun (#top_compete_role{id = RoleId, name = Name,
                                  lev = Lev, classes = Classes, sex = Sex,
                                  looks = Looks}) ->
                   StatueFlag = case Classes of
                                    1 -> {true, 20};
                                    2 -> {true, 21};
                                    3 -> {true, 22};
                                    4 -> {true, 23};
                                    5 -> {true, 24};
                                    6 -> {true, 66};
                                    7 -> {true, 85};
                                    _ -> false
                                end,
                   case get_fashion({Classes}) of
                       Fashion = [{ItemId, _} | _] ->
                           ClassName = util:flist(lang:get("~ts首席弟子"),
                                                  [format:classes_name(Classes)]),
                           ItemName = util:flist(lang:get("首席专属·~ts"),
                                                 [item:attr(name, ItemId)]),
                           Content =
                               notice:format(lang:get("恭喜你在巅峰对决中过关斩将，一战到底，赢得了~ts的荣誉！获得了~ts传奇武饰一周的使用权！"),
                                             [{string_2, 5, ClassName},
                                              {string_2, 1, ItemName}]),
                           mail:send(RoleId,
                                     lang:get("职业首席武饰"),
                                     Content,
                                     Fashion),
                           NTopFashion = case env:get(top_fashion) of
                                             TopFashion
                                                 when is_list(TopFashion) ->
                                                 TopFashion;
                                             _ -> []
                                         end,
                           NewTopFashion = NTopFashion ++
                                               [{RoleId, Name, Classes}],
                           env:save(top_fashion, NewTopFashion);
                       _ -> ignore
                   end,
                   case StatueFlag of
                       {true, StatueType} ->
                           unit_mgr:update_statue(StatueType,
                                                  {RoleId,
                                                   Name,
                                                   Lev,
                                                   Classes,
                                                   Sex,
                                                   Looks});
                       _ -> ok
                   end
           end,
    lists:foreach(Fun2, FirstRankList),
    NameList = [RoleName
                || #top_compete_role{name = RoleName} <- FirstRankList],
    Msg = case NameList of
              [_ | _] ->
                  NameArgs = string:join(NameList, "、"),
                  notice:format(lang:get("~ts已经结束，~ts成为了本届首席，恭喜他们{face_1, 38}"),
                                [{string_2, 1, lang:get("巅峰对决")},
                                 {string_2, 2, NameArgs}]);
              _ ->
                  notice:format(lang:get("~ts已经结束，很遗憾没有人参赛！"),
                                [{string_2, 1, lang:get("巅峰对决")}])
          end,
    notice:cast(all, 5, Msg),
    ok.

make_first_list(#state{first_sword = FirstSword,
                       first_mage = FirstMage, first_archer = FirstArcher,
                       first_orc = FirstOrc, first_devine = FirstDevine,
                       first_moon = FirstMoon,
                       first_templar = FirstTemplar}) ->
    FirstSword1 = case FirstSword of
                      #top_compete_role{} -> [FirstSword];
                      _ -> []
                  end,
    FirstMage1 = case FirstMage of
                     #top_compete_role{} -> [FirstMage];
                     _ -> []
                 end,
    FirstArcher1 = case FirstArcher of
                       #top_compete_role{} -> [FirstArcher];
                       _ -> []
                   end,
    FirstOrc1 = case FirstOrc of
                    #top_compete_role{} -> [FirstOrc];
                    _ -> []
                end,
    FirstDevine1 = case FirstDevine of
                       #top_compete_role{} -> [FirstDevine];
                       _ -> []
                   end,
    FirstMoon1 = case FirstMoon of
                     #top_compete_role{} -> [FirstMoon];
                     _ -> []
                 end,
    FirstTemplar1 = case FirstTemplar of
                        #top_compete_role{} -> [FirstTemplar];
                        _ -> []
                    end,
    FirstSword1 ++
        FirstMage1 ++
            FirstArcher1 ++
                FirstOrc1 ++
                    FirstDevine1 ++ FirstMoon1 ++ FirstTemplar1.

cast_win_streak(#top_compete_role{name = RoleName,
                                  win_streak = WinStreak})
    when WinStreak =:= 5 ->
    Msg =
        notice:format(lang:get("~ts带领的队伍在~ts中连挫强敌，获得5连胜{face_1,18}"),
                      [{role_2, RoleName}, {string_2, 1, lang:get("巅峰对决")}]),
    notice:cast(all, 5, Msg);
cast_win_streak(#top_compete_role{name = RoleName,
                                  win_streak = WinStreak})
    when WinStreak =:= 8 ->
    Msg =
        notice:format(lang:get("~ts带领的队伍在~ts中表现突出，获得8连胜{face_1,18}"),
                      [{role_2, RoleName}, {string_2, 1, lang:get("巅峰对决")}]),
    notice:cast(all, 5, Msg);
cast_win_streak(#top_compete_role{name = RoleName,
                                  win_streak = WinStreak})
    when WinStreak =:= 10 ->
    Msg =
        notice:format(lang:get("惊天动地，~ts带领的队伍在~ts中表现突出，获得10连胜{face_1,7}"),
                      [{role_2, RoleName}, {string_2, 1, lang:get("巅峰对决")}]),
    notice:cast(all, 5, Msg);
cast_win_streak(_) -> ok.

get_fashion({1}) -> [{29701, 1}];
get_fashion({2}) -> [{29704, 1}];
get_fashion({3}) -> [{29707, 1}];
get_fashion({4}) -> [{29710, 1}];
get_fashion({5}) -> [{29713, 1}];
get_fashion({6}) -> [{29716, 1}];
get_fashion({7}) -> [{29738, 1}];
get_fashion({_Classes}) -> [].

