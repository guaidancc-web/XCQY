-file("src/mod/unit/unit.erl", 1).

-module(unit).

-behaviour(gen_fsm).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([freeze/2,
         combat/2,
         trace/2,
         loaf/2,
         patrol/2,
         move/2,
         guard/2,
         attack/2,
         defense/2]).

-export([create/2,
         stop/1,
         sync_stop/1,
         order/2,
         combat_info/2,
         combat_call/2,
         pause/1,
         pause/2,
         resume/1,
         enable/1,
         disable/2,
         set_element/2,
         talk/2,
         talk/3,
         name/1]).

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

-file("src/mod/unit/unit.erl", 45).

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

-file("src/mod/unit/unit.erl", 46).

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

-file("src/mod/unit/unit.erl", 47).

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

-file("src/mod/unit/unit.erl", 48).

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

-file("src/mod/unit/unit.erl", 49).

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

-file("src/mod/unit/unit.erl", 50).

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

-file("src/mod/unit/unit.erl", 51).

create({BattleId, Id}, Unit = #unit{name = Name}) ->
    case unit_mgr:info({BattleId, Id}) of
        {ok, _U} ->
            logger:error("战场[~w]创建单位[~ts]ID[~w]重复的错误",
                         [BattleId, Name, Id],
                         unit,
                         60),
            {error, repeat};
        _ ->
            U = Unit#unit{id = {BattleId, Id}},
            case gen_fsm:start_link(unit, [U], []) of
                {ok, Pid} -> {ok, U#unit{pid = Pid}};
                _ -> {error, wrong}
            end
    end.

stop(UnitId = {_BattleId, _Id}) ->
    case unit_mgr:info(UnitId) of
        {ok, #unit{pid = Pid}} when is_pid(Pid) -> stop(Pid);
        _ -> ok
    end;
stop(Pid) when is_pid(Pid) ->
    Pid ! stop,
    ok;
stop(_P) ->
    logger:error("不支持的终止类型:~w", [_P], unit, 83),
    ok.

sync_stop(UnitId = {_BattleId, _Id}) ->
    case unit_mgr:info(UnitId) of
        {ok, #unit{pid = Pid}} when is_pid(Pid) ->
            sync_stop(Pid);
        _ -> {error, null_unit}
    end;
sync_stop(Pid) when is_pid(Pid) ->
    case catch case catch
                        gen_fsm:sync_send_all_state_event(Pid, sync_stop, 10000)
                   of
                   {'EXIT', {timeout, _}} -> {error, timeout};
                   {'EXIT', {noproc, _}} -> {error, noproc};
                   {'EXIT', {normal, _}} -> {error, exit};
                   {'EXIT', _Call_Err} -> {error, _Call_Err};
                   _Call_Return -> _Call_Return
               end
        of
        ok -> ok;
        _ -> {error, sync_fail}
    end;
sync_stop(_P) ->
    logger:error("不支持的终止类型:~w", [_P], unit, 98),
    {error, error_type}.

talk(#unit{id = UnitId,
           pos = #pos{map = MapId, x = _X, y = _Y}},
     TalkMsg) ->
    logger:debug("~ts", [TalkMsg], unit, 107),
    map:pack_send_to_all(MapId, 10165, {UnitId, TalkMsg});
talk(UnitId, TalkMsg) ->
    case unit_mgr:info(UnitId) of
        {ok, Unit = #unit{}} ->
            talk(Unit, TalkMsg),
            ok;
        _ -> ok
    end.

talk(UnitId, MapId, TalkMsg) ->
    map:pack_send_to_all(MapId, 10165, {UnitId, TalkMsg}),
    ok.

enable(#unit{pid = UnitPid}) when is_pid(UnitPid) ->
    UnitPid ! enable,
    ok;
enable(Unit = #unit{}) ->
    NewUnit = Unit#unit{disabled = ""},
    sync(NewUnit),
    ok;
enable(_U) ->
    logger:error("对非单位类型进行激活[~w]", [_U], unit, 130),
    ok.

disable(#unit{pid = UnitPid}, Reason)
    when is_pid(UnitPid) ->
    UnitPid ! {disable, Reason},
    ok;
disable(Unit = #unit{}, Reason) ->
    NewUnit = Unit#unit{disabled = Reason},
    sync(NewUnit),
    ok;
disable(_U, _Reason) ->
    logger:error("对非单位类型进行禁用[~w,~w]",
                 [_U, _Reason],
                 unit,
                 142),
    ok.

-spec order(UnitId, Order) -> ok |
                              {error, bitstring()} when UnitId :: pid() |
                                                                  {pos_integer(),
                                                                   pos_integer()},
                                                        Order :: #unit_order{}.

order(UnitPid, Order) when is_pid(UnitPid) ->
    UnitPid ! {order, Order},
    ok;
order({BattleId, Id}, Order) ->
    case unit_mgr:info({BattleId, Id}) of
        {error, _} -> {error, not_found};
        {ok, #unit{pid = UnitPid}} when not is_pid(UnitPid) ->
            {error, lang:get("暂时无法操作该单位")};
        {ok, #unit{pid = UnitPid}} ->
            UnitPid ! {order, Order},
            ok
    end;
order(_Unit, _Order) ->
    logger:error("未知的单位命令[~w][~w]",
                 [_Unit, _Order],
                 unit,
                 163),
    ok.

-spec pause(pid() | tuple()) -> ok |
                                {error, bitstring()}.

pause(UnitPid) when is_pid(UnitPid) ->
    UnitPid ! pause,
    ok;
pause({BattleId, Id}) ->
    case unit_mgr:info({BattleId, Id}) of
        {ok, #unit{pid = Pid}} when is_pid(Pid) ->
            Pid ! pause,
            ok;
        _ -> {error, lang:get("单位不存在")}
    end.

-spec pause(pid() | tuple(), pos_integer()) -> ok.

pause(UnitPid, Sec) when is_pid(UnitPid) ->
    UnitPid ! {pause, Sec},
    ok;
pause({BattleId, Id}, Sec) ->
    case unit_mgr:info({BattleId, Id}) of
        {ok, #unit{pid = Pid}} when is_pid(Pid) ->
            Pid ! {pause, Sec},
            ok;
        _ -> {error, lang:get("单位不存在")}
    end.

-spec resume(pid()) -> ok.

resume({BattleId, Id}) ->
    case unit_mgr:info({BattleId, Id}) of
        {ok, #unit{pid = Pid}} when is_pid(Pid) -> resume(Pid);
        _ -> {error, lang:get("单位不存在")}
    end;
resume(UnitPid) ->
    UnitPid ! resume,
    ok.

-spec set_element(Unit :: #unit{} | unit_id(),
                  ElemVal :: [{ElemName :: atom(),
                               Val :: term()}]) -> NewUnit :: #unit{}.

set_element({BattleId, Id}, ElemVal) ->
    case unit_mgr:info({BattleId, Id}) of
        {ok, #unit{pid = Pid}} when is_pid(Pid) ->
            Pid ! {set_element, ElemVal},
            ok;
        _ -> ok
    end;
set_element(U = #unit{pos = #pos{map_pid = MapPid}},
            []) ->
    {ok, MapUnit} = unit_convert:to(map_unit, U),
    map:unit_update(MapPid, MapUnit),
    U;
set_element(U = #unit{},
            [{#unit.looks, Val} | ElemVal]) ->
    set_element(U#unit{looks = Val}, ElemVal);
set_element(U = #unit{},
            [{#unit.guide_lev, Val} | ElemVal]) ->
    set_element(U#unit{guide_lev = Val}, ElemVal);
set_element(U = #unit{},
            [{#unit.name, Val} | ElemVal]) ->
    set_element(U#unit{name = Val}, ElemVal);
set_element(U = #unit{},
            [{#unit.sex, Val} | ElemVal]) ->
    set_element(U#unit{sex = Val}, ElemVal);
set_element(U = #unit{},
            [{#unit.classes, Val} | ElemVal]) ->
    set_element(U#unit{classes = Val}, ElemVal);
set_element(U = #unit{},
            [{#unit.lev, Val} | ElemVal]) ->
    set_element(U#unit{lev = Val}, ElemVal);
set_element(U = #unit{},
            [{#unit.base_id, Val} | ElemVal]) ->
    set_element(U#unit{base_id = Val}, ElemVal);
set_element(U = #unit{}, [_ | ElemVal]) ->
    set_element(U, ElemVal).

-spec combat_call(UnitPid, Arg) -> ok |
                                   {error, term()} when UnitPid :: pid(),
                                                        Arg :: {start, pid()}.

combat_call(UnitPid, Arg) when is_pid(UnitPid) ->
    case case catch
                  gen_fsm:sync_send_all_state_event(UnitPid,
                                                    {combat_call, Arg},
                                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        ok -> ok;
        _ -> {error, combat_call_fail}
    end;
combat_call(_, _) -> ok.

combat_info(UnitPid, Arg) when is_pid(UnitPid) ->
    UnitPid ! {combat_info, Arg},
    ok;
combat_info(_, _Arg) -> ok.

name(BaseId) when is_integer(BaseId) ->
    case unit_data:get(BaseId) of
        #unit_data{name = Name} -> Name;
        _ -> ""
    end;
name(#unit{name = Name}) -> Name;
name(_) -> "".

init([Unit = #unit{name = Name,
                   pos = Pos = #pos{map = MapId}, t_move = Tmove,
                   def_status = DefStatus}]) ->
    Ts = now(),
    State = Unit#unit{pid = self(), ts = Ts},
    {ok, MapUnit} = unit_convert:to(map_unit, State),
    case map:unit_enter(MapId, MapUnit) of
        {ok, MapBaseId, MapPid, GridPid} ->
            process_flag(trap_exit, true),
            N = State#unit{pos =
                               Pos#pos{map_pid = MapPid,
                                       map_base_id = MapBaseId,
                                       map_grid_pid = GridPid}},
            sync(N),
            erlang:send_after(util:rand(15000, 30000),
                              self(),
                              talk),
            case DefStatus of
                loaf -> {ok, DefStatus, N, util:time_left(Tmove, Ts)};
                patrol -> {ok, DefStatus, N, util:time_left(Tmove, Ts)};
                _ -> {ok, DefStatus, N}
            end;
        error ->
            logger:error("单位[~ts]尝试进入不存在的地图: ~w",
                         [Name, MapId],
                         unit,
                         302),
            {stop, normal, State}
    end.

handle_event(_Event, StateName, State) ->
    {next_state, StateName, State}.

handle_sync_event(sync_stop, _From, _StateName,
                  State = #unit{id = {_BattleId, _Id}}) ->
    logger:debug("单位同步退出[~w:~w]",
                 [_BattleId, _Id],
                 unit,
                 310),
    {stop, normal, ok, State};
handle_sync_event({combat_call, {start, _CombatPid}},
                  _From, StateName, State = #unit{disabled = Disabled})
    when Disabled =/= "" ->
    continue(StateName, {false, disabled}, State);
handle_sync_event({combat_call, {start, _CombatPid}},
                  _From, StateName, State = #unit{lock = 0}) ->
    logger:debug("非独占单位收到战斗开始信息，不进入战斗状态", [], unit, 319),
    continue(StateName, ok, State);
handle_sync_event({combat_call, {start, CombatPid}},
                  _From, combat,
                  State = #unit{base_id = _BaseId, status = Status}) ->
    if Status =:= 2 ->
           logger:debug("独占单位收到战斗开始信息，已经战斗状态，无法发起", [], unit, 325),
           continue(combat, {false, combat}, State);
       Status =:= 0 ->
           logger:debug("独占单位[~w]战斗“等待状态”收到开始信息，允许进入战斗",
                        [_BaseId],
                        unit,
                        328),
           NewS = State#unit{status = 2, combat_pid = CombatPid,
                             ts = now()},
           sync(NewS),
           continue(combat, ok, NewS);
       true ->
           logger:error("独占单位收到战斗开始信息，状态异常[~w]，无法发起",
                        [Status],
                        unit,
                        333),
           next_order(combat, {false, combat}, State)
    end;
handle_sync_event({combat_call, {start, CombatPid}},
                  _From, _StateName, State) ->
    logger:debug("独占单位[~w]进程收到战斗开始信息，进入战斗状态",
                 [State#unit.base_id],
                 unit,
                 337),
    NewS = State#unit{status = 2, combat_pid = CombatPid,
                      ts = now()},
    map:unit_update(NewS),
    sync(NewS),
    continue(combat, ok, NewS);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = {false, error},
    {reply, Reply, StateName, State}.

handle_info(talk, StateName,
            State = #unit{talk = []}) ->
    continue(StateName, State);
handle_info(talk, StateName,
            State = #unit{talk = Talks = [_ | _]}) ->
    erlang:send_after(util:rand(15000, 25000),
                      self(),
                      talk),
    talk(State, util:rand_list(Talks)),
    continue(StateName, State);
handle_info({set_element, ElemVal}, StateName, State) ->
    NewState = set_element(State, ElemVal),
    sync(NewState),
    continue(StateName, NewState);
handle_info(pause, _StateName, State) ->
    {next_state, freeze, State};
handle_info({pause, Sec}, _StateName, State)
    when Sec > 0 ->
    {next_state, freeze, State, Sec * 1000};
handle_info(resume, freeze,
            State = #unit{order = [], def_status = DefStatus}) ->
    logger:debug("地图单位恢复默认状态", [], unit, 370),
    continue(DefStatus, State#unit{ts = now()});
handle_info(resume, freeze, State) ->
    next_order(defense, State);
handle_info(stop, _StateName,
            State = #unit{id = {_BattleId, _Id}}) ->
    logger:debug("单位进程主动退出[~w:~w]",
                 [_BattleId, _Id],
                 unit,
                 377),
    {stop, normal, State};
handle_info(enable, StateName, State) ->
    NewState = State#unit{disabled = ""},
    sync(NewState),
    continue(StateName, NewState);
handle_info({disable, Reason}, StateName, State) ->
    NewState = State#unit{disabled = Reason},
    sync(NewState),
    continue(StateName, NewState);
handle_info({combat_info,
             {fail, CombatPid, _Winner, _Loser}},
            combat,
            State = #unit{combat_pid = CombatPid,
                          base_id = _BaseId}) ->
    logger:debug("单位[~w]收到发起战斗失败信息，修改战斗状态",
                 [_BaseId],
                 unit,
                 398),
    NewS = State#unit{status = 0, combat_pid = 0},
    map:unit_update(NewS),
    sync(NewS),
    next_order(combat, NewS);
handle_info({combat_info, {fail, _, _Winner, _Loser}},
            combat, State = #unit{base_id = _BaseId}) ->
    logger:debug("单位[~w]收到发起战斗失败信息，但这是后来发起者发来的，忽略",
                 [_BaseId],
                 unit,
                 404),
    continue(combat, State);
handle_info({combat_info, {fail, _, _Winner, _Loser}},
            StateName, State) ->
    continue(StateName, State);
handle_info({combat_info, {win, _, _Winner, _Loser}},
            combat, State = #unit{fun_type = 23}) ->
    logger:debug("星座[~w]战斗胜利也消失",
                 [State#unit.base_id],
                 unit,
                 412),
    NewS = State#unit{status = 0, combat_pid = 0},
    {stop, normal, NewS};
handle_info({combat_info, {win, _, _Winner, _Loser}},
            combat, State) ->
    logger:debug("独占单位[~w]收到战斗结束的胜利消息，正常退出",
                 [State#unit.base_id],
                 unit,
                 417),
    NewS = State#unit{status = 0, combat_pid = 0},
    map:unit_update(NewS),
    sync(NewS),
    next_order(combat, NewS);
handle_info({combat_info, {win, _, _Winner, _Loser}},
            StateName, State = #unit{lock = 0}) ->
    continue(StateName, State);
handle_info({combat_info, {win, _, _Winner, _Loser}},
            StateName, State) ->
    logger:error("独占单位[~w]收到战斗结束的胜利消息，异常退出",
                 [State#unit.base_id],
                 unit,
                 427),
    NewS = State#unit{status = 0, combat_pid = 0},
    map:unit_update(NewS),
    sync(NewS),
    continue(StateName, NewS);
handle_info({combat_info, {lost, _, Winner, _}},
            StateName, State = #unit{lock = 0}) ->
    send_event(kill, {Winner, State}),
    continue(StateName, State);
handle_info({combat_info, {_Arg, _, _, _}}, StateName,
            State = #unit{lock = 0, base_id = _BaseId}) ->
    logger:debug("非独占单位怪[~w]收到战斗信息[~w]，忽略",
                 [_BaseId, _Arg],
                 unit,
                 440),
    continue(StateName, State);
handle_info({combat_info, {lost, _, Winner, Loser}},
            combat, State = #unit{id = UnitId}) ->
    case lists:keyfind(UnitId, #fighter.origin_id, Loser) of
        false ->
            logger:error("独占单位[~ts]收到战斗打输信息，但是失败队列中找不到",
                         [State#unit.name],
                         unit,
                         447),
            continue(combat, State);
        #fighter{} ->
            logger:debug("普通独占怪[~w]战斗输了，处理死亡",
                         [State#unit.base_id],
                         unit,
                         450),
            send_event(kill, {Winner, State}),
            NewS = State#unit{status = 0, combat_pid = 0},
            {stop, normal, NewS}
    end;
handle_info({combat_info, {lost, _, _Winner, _Loser}},
            StateName, State) ->
    logger:error("单位怪[~w]收到战斗输了信息发现异常：单位进程不处于战斗中，直接返回普通状态",
                 [State#unit.base_id],
                 unit,
                 457),
    continue(StateName, State);
handle_info({order, Order}, freeze, State) ->
    logger:debug("单位在暂停的状态收到动作指令:~w", [Order], unit, 466),
    continue(freeze, add_order(Order, State));
handle_info({order, Order}, combat, State) ->
    logger:debug("单位在战斗的状态收到动作指令:~w", [Order], unit, 469),
    continue(combat, add_order(Order, State));
handle_info({order, Order = #unit_order{type = 0}},
            StateName, State) ->
    case catch unit_type:order(Order, StateName, State) of
        {ok, NewOrder, NewStateName, NewS} ->
            NewState = add_order(NewOrder, NewS),
            sync(NewState),
            continue(NewStateName, NewState);
        _E ->
            logger:error("执行指令动作返回错误：~w", [_E], unit, 480),
            continue(StateName, State)
    end;
handle_info({order, Order = #unit_order{type = 1}},
            StateName, State) ->
    case catch unit_type:order(Order, StateName, State) of
        {ok, NewOrder, NewStateName, NewS} ->
            NewState = add_order(NewOrder, NewS),
            sync(NewState),
            continue(NewStateName, NewState);
        _E ->
            logger:error("执行指令动作返回错误：~w", [_E], unit, 491),
            continue(StateName, State)
    end;
handle_info({order, Order = #unit_order{type = 2}},
            StateName, State = #unit{order = []}) ->
    case catch unit_type:order(Order, StateName, State) of
        {ok, NewOrder, NewStateName, NewS} ->
            NewState = add_order(NewOrder, NewS),
            sync(NewState),
            continue(NewStateName, NewState);
        _E ->
            logger:error("执行指令动作返回错误：~w", [_E], unit, 502),
            continue(StateName, State)
    end;
handle_info({order, Order = #unit_order{type = 2}},
            StateName = defense,
            State = #unit{order = [Order | T]}) ->
    case catch unit_type:order(Order, StateName, State) of
        {ok, NewOrder, NewStateName, NewS} ->
            NewState = add_order(NewOrder,
                                 NewS#unit{order = [NewOrder | T]}),
            sync(NewState),
            continue(NewStateName, NewState);
        _E ->
            logger:error("执行指令动作返回错误：~w", [_E], unit, 514),
            continue(StateName, State)
    end;
handle_info({order, Order = #unit_order{type = 2}},
            StateName, State) ->
    NewState = add_order(Order, State),
    sync(NewState),
    continue(StateName, NewState);
handle_info({order, Order}, StateName, State) ->
    logger:error("单位[~w]无法接受外部指令:~w",
                 [State#unit.base_id, Order],
                 unit,
                 523),
    continue(StateName, State);
handle_info(_Info, StateName,
            State = #unit{name = _Name}) ->
    logger:debug("单位[~ts]在状态[~w]收到无效的外部消息：~w",
                 [_Name, StateName, _Info],
                 unit,
                 527),
    continue(StateName, State).

terminate(_Reason, _StateName,
          #unit{id = UnitId, name = _Name,
                pos = #pos{map_pid = MapPid}}) ->
    map:unit_leave(MapPid, UnitId),
    catch ets:delete(unit_info, UnitId),
    logger:debug("单位[~ts]进程退出", [_Name], unit, 533),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

send_event(kill,
           {_Roles,
            #unit{id = UnitId, fun_type = 13,
                  pos = #pos{map_base_id = MapBaseId}}}) ->
    treasure:kill_ghost_box(MapBaseId, UnitId),
    ok;
send_event(kill,
           {Roles,
            #unit{id = UnitId = {Bid, _}, base_id = BaseId,
                  type = Type, evt = Evt, fun_type = FunType}}) ->
    RoleList = [{Orid, Name, Pid}
                || #fighter{origin_id = Orid, name = Name, pid = Pid,
                            type = 1}
                       <- Roles],
    Events = #evt_battle_unit_killed{unit_id = UnitId,
                                     base_id = BaseId, type = Type,
                                     role_list = RoleList},
    battle_mgr:evt(Bid, Events, Evt),
    case FunType of
        21 -> campaign_unit:cast({kill_unit, UnitId});
        22 -> campaign_unit:cast({kill_unit, UnitId});
        38 -> campaign_unit:cast({kill_unit, UnitId});
        39 -> campaign_unit:cast({kill_unit, UnitId});
        32 -> campaign_unit:cast({kill_unit, UnitId});
        33 -> campaign_unit:cast({kill_unit, UnitId});
        37 -> campaign_unit:cast({kill_unit, UnitId});
        42 -> campaign_unit:cast({kill_unit, UnitId});
        55 -> campaign_unit:cast({kill_unit, UnitId});
        59 -> campaign_unit:cast({kill_unit, UnitId});
        57 -> treasure:kill_unit(UnitId);
        64 -> campaign_unit:cast({kill_unit, UnitId});
        _ -> skip
    end,
    ok;
send_event(_Mod, _Data) -> ok.

combat(timeout,
       State = #unit{id = UnitId, base_id = BaseId,
                     combat_pid = CombatPid, order = Orders}) ->
    case is_pid(CombatPid) andalso
             util:is_process_alive(CombatPid)
        of
        false ->
            logger:error("单位[ID:~w BASE:~w]检测战斗进程发现异常，自动返回正常状态，进入下个指令",
                         [UnitId, BaseId],
                         unit,
                         588),
            NewS = State#unit{status = 0, combat_pid = 0,
                              order = Orders, ts = now()},
            map:unit_update(NewS),
            sync(NewS),
            next_order(combat, NewS);
        true -> continue(combat, State#unit{ts = now()})
    end;
combat(_Any, State = #unit{name = _Name}) ->
    logger:debug("单位[~ts]在战斗状态下收到无效消息: ~w",
                 [_Name, _Any],
                 unit,
                 597),
    continue(combat, State).

attack(timeout,
       State = #unit{name = _Name, lock = Lock,
                     pos = #pos{map = _MapId, x = _X, y = _Y}, path = []}) ->
    case unit_type:search_attack(State) of
        false ->
            logger:debug("单位[~ts]到达攻击区域，未搜索到可攻击对象继续搜索",
                         [_Name],
                         unit,
                         605),
            continue(attack, State#unit{ts = now()});
        {ok,
         _MapRole = #map_role{rid = _Rid, platform = _Plat,
                              zone_id = _Zone}}
            when Lock =:= 1 ->
            logger:debug("单位[独占怪：~ts]到达攻击区域，搜索到可攻击对象[~w]，发起战斗",
                         [_Name, {_Rid, _Plat, _Zone}],
                         unit,
                         608),
            continue(combat, State#unit{ts = now()});
        {ok,
         _MapRole = #map_role{rid = _Rid, platform = _Plat,
                              zone_id = _Zone}} ->
            logger:debug("单位[~ts]到达攻击区域，搜索到可攻击对象[~w]，发起战斗",
                         [_Name, {_Rid, _Plat, _Zone}],
                         unit,
                         612),
            continue(attack, State#unit{ts = now()})
    end;
attack(timeout,
       State = #unit{name = _Name, lock = Lock,
                     pos = Pos = #pos{map_pid = MapPid},
                     path = [{Px, Py} | Path], evt = _Evts}) ->
    case unit_type:search_attack(State) of
        false ->
            logger:debug("单位[~ts]前往攻击区域，未搜索到可攻击对象继续前进",
                         [_Name],
                         unit,
                         620),
            NewState = State#unit{pos = Pos#pos{x = Px, y = Py},
                                  path = Path, ts = now()},
            map:unit_move(MapPid, State, Px, Py),
            sync(NewState),
            continue(attack, NewState);
        {ok,
         _MapRole = #map_role{rid = _Rid, platform = _Plat,
                              zone_id = _Zone}}
            when Lock =:= 1 ->
            logger:debug("单位[独占怪：~ts]前往攻击区域，搜索到可攻击对象[~w]，发起战斗",
                         [_Name, {_Rid, _Plat, _Zone}],
                         unit,
                         626),
            continue(combat, State#unit{ts = now()});
        {ok,
         _MapRole = #map_role{rid = _Rid, platform = _Plat,
                              zone_id = _Zone}} ->
            logger:debug("单位[~ts]前往攻击区域，搜索到可攻击对象[~w]，发起战斗",
                         [_Name, {_Rid, _Plat, _Zone}],
                         unit,
                         630),
            NewState = State#unit{pos = Pos#pos{x = Px, y = Py},
                                  path = Path, ts = now()},
            map:unit_move(MapPid, State, Px, Py),
            continue(attack, NewState)
    end;
attack(_Any, State = #unit{name = _Name}) ->
    logger:debug("单位[~ts]在进攻状态下收到无效消息: ~w",
                 [_Name, _Any],
                 unit,
                 637),
    continue(attack, State).

defense(_Any, State = #unit{name = _Name}) ->
    logger:debug("单位[~ts]在防御状态下收到无效消息: ~w",
                 [_Name, _Any],
                 unit,
                 641),
    continue(defense, State).

freeze(timeout, State) -> next_order(defense, State);
freeze(_Any, State = #unit{name = _Name}) ->
    logger:debug("单位[~ts]在定住状态下收到无效消息: ~w",
                 [_Name, _Any],
                 unit,
                 648),
    continue(freeze, State).

guard(timeout,
      State = #unit{path = [], name = _Name,
                    order =
                        [#unit_order{order = guard, arg = _Arg} | _]}) ->
    logger:debug("单位[~ts]守卫[~w]路径走完，继续守卫",
                 [_Name, _Arg],
                 unit,
                 652),
    next_order(guard, State);
guard(timeout,
      State = #unit{path = [], name = _Name,
                    order = [_Order | Orders]}) ->
    logger:error("单位[~ts]守卫路径走完，未匹配到正确的指令[~w]",
                 [_Name, _Order],
                 unit,
                 655),
    next_order(guard, State#unit{order = Orders});
guard(timeout,
      State = #unit{name = _Name, pos = #pos{map = MapId},
                    order =
                        [#unit_order{order = guard, arg = {unit, TargetId}}
                         | Orders]}) ->
    case unit_mgr:info(TargetId) of
        {error, _} ->
            logger:debug("单位[~ts]的守卫目标[~w]未找到",
                         [_Name, TargetId],
                         unit,
                         660),
            next_order(guard, State#unit{order = Orders});
        {ok,
         #unit{range_trace = RangeTrace,
               pos = #pos{map = Map, x = Tx, y = Ty}}}
            when Map =:= MapId ->
            do_guard({RangeTrace, MapId, Tx, Ty}, State);
        {ok, #unit{name = _Name, base_id = _BaseId}} ->
            logger:debug("单位[~ts]的守卫目标已经不在当前地图[~w]",
                         [_Name, _BaseId],
                         unit,
                         665),
            next_order(guard, State#unit{path = [], order = Orders})
    end;
guard(timeout,
      State = #unit{name = _Name, pos = #pos{map = MapId},
                    order =
                        [#unit_order{order = guard, arg = {unit, TargetId, _}}
                         | Orders]}) ->
    case unit_mgr:info(TargetId) of
        {error, _} ->
            logger:debug("单位[~ts]的守卫目标[~w]未找到，执行下个指令",
                         [_Name, TargetId],
                         unit,
                         671),
            next_order(guard, State#unit{order = Orders});
        {ok,
         #unit{range_trace = RangeTrace,
               pos = #pos{map = Map, x = Tx, y = Ty}}}
            when Map =:= MapId ->
            do_guard({RangeTrace, MapId, Tx, Ty}, State);
        {ok, #unit{name = _Name, base_id = _BaseId}} ->
            logger:debug("单位[~ts]的守卫目标已经不在当前地图[~w]",
                         [_Name, _BaseId],
                         unit,
                         676),
            next_order(guard, State#unit{path = [], order = Orders})
    end;
guard(_Any,
      State = #unit{name = _Name, order = _Orders}) ->
    logger:debug("单位[Name:~ts, Order:~w]在守护状态下收到无效消息: ~w",
                 [_Name, _Orders, _Any],
                 unit,
                 680),
    continue(guard, State).

move(timeout,
     State = #unit{path = [],
                   order =
                       [#unit_order{order = move, over = OverDo, arg = _Arg}
                        | Orders],
                   pos = #pos{map = _MapId, x = _X, y = _Y}}) ->
    logger:debug("单位[~ts]已移动到终点[~w]",
                 [State#unit.name, {_MapId, _X, _Y, _Arg}],
                 unit,
                 685),
    if OverDo =:= stop -> {stop, normal, State};
       true -> next_order(move, State#unit{order = Orders})
    end;
move(timeout,
     State = #unit{path = [],
                   order =
                       [#unit_order{order = direct_move, over = OverDo,
                                    arg = _Arg}
                        | Orders],
                   pos = #pos{map = _MapId, x = _X, y = _Y}}) ->
    logger:debug("单位[~ts]已移动到终点[~w]",
                 [State#unit.name, {_MapId, _X, _Y, _Arg}],
                 unit,
                 693),
    if OverDo =:= stop -> {stop, normal, State};
       true -> next_order(move, State#unit{order = Orders})
    end;
move(timeout,
     State = #unit{pos = Pos = #pos{map_pid = MapPid},
                   path = [{Dx, Dy} | Path]}) ->
    map:unit_move(MapPid, State, Dx, Dy),
    NewUnit = State#unit{pos = Pos#pos{x = Dx, y = Dy},
                         path = Path, ts = now()},
    sync(NewUnit),
    continue(move, NewUnit);
move(_Any, State = #unit{name = _Name}) ->
    logger:debug("单位[~ts]在移动状态下收到无效消息: ~w",
                 [_Name, _Any],
                 unit,
                 706),
    continue(move, State#unit{ts = now()}).

loaf(timeout,
     State = #unit{path = [], base_id = _BaseId,
                   name = _Name}) ->
    Path = unit_type:loaf_path(State),
    continue(loaf, State#unit{path = Path, ts = now()});
loaf(timeout,
     State = #unit{base_id = _BaseId,
                   pos =
                       Pos = #pos{map = MapId, map_pid = MapPid,
                                  map_base_id = MapBaseId, x = X, y = Y},
                   path = [{Dx, Dy} | T]}) ->
    case map_mgr:path(MapId, MapBaseId, {X, Y}, {Dx, Dy}) of
        blocked ->
            logger:debug("地图[~w]单位[~w]游荡点遇到阻挡:~w, ~w",
                         [MapBaseId, _BaseId, {X, Y}, {Dx, Dy}],
                         unit,
                         717),
            NewState = State#unit{path = T, ts = now()},
            sync(NewState),
            continue(loaf, NewState);
        {Tx, Ty} ->
            NewState = State#unit{path = T,
                                  pos = Pos#pos{x = Tx, y = Ty}, ts = now()},
            map:unit_move(MapPid, State, Tx, Ty),
            sync(NewState),
            continue(loaf, NewState)
    end;
loaf(_Any,
     State = #unit{name = _Name, path = _Path,
                   order = _Orders}) ->
    logger:debug("单位[名称：~ts，路径：~w， 指令：~w]在游荡状态下收到无效消息: ~w",
                 [_Name, _Path, _Orders, _Any],
                 unit,
                 729),
    continue(loaf, State).

patrol(timeout,
       State = #unit{path = [], base_id = _BaseId,
                     name = _Name, defxy = {_, X, Y},
                     pos = #pos{map_base_id = MapBaseId}}) ->
    Path = unit_type:rand_path_in_range(MapBaseId, X, Y),
    continue(patrol, State#unit{path = Path, ts = now()});
patrol(timeout,
       State = #unit{base_id = _BaseId, lock = Lock,
                     order = Orders,
                     pos =
                         Pos = #pos{map = _MapId, map_pid = MapPid,
                                    map_base_id = _MapBaseId, x = _X, y = _Y},
                     path = [{Dx, Dy} | T]}) ->
    case unit_type:search_trace(State) of
        false ->
            NewState = State#unit{path = T,
                                  pos = Pos#pos{x = Dx, y = Dy}, ts = now()},
            map:unit_move(MapPid, State, Dx, Dy),
            sync(NewState),
            continue(patrol, NewState);
        {ok, MapRole} when Lock =:= 1 ->
            logger:debug("单位[~w]巡逻找到角色可追踪：~w",
                         [_BaseId, MapRole],
                         unit,
                         745),
            NewState = State#unit{order =
                                      [#unit_order{order = trace, arg = MapRole}
                                       | Orders],
                                  ts = now()},
            sync(NewState),
            {next_state, trace, NewState, 0};
        {ok, MapRole} ->
            logger:debug("非独占单位[~w]巡逻找到角色可追踪：~w",
                         [_BaseId, MapRole],
                         unit,
                         750),
            NewState = State#unit{order =
                                      [#unit_order{order = trace, arg = MapRole}
                                       | Orders],
                                  ts = now()},
            sync(NewState),
            {next_state, trace, NewState, 0}
    end;
patrol(_Any,
       State = #unit{name = _Name, path = _Path,
                     order = _Orders}) ->
    logger:debug("单位[名称：~ts，路径：~w， 指令：~w]在巡逻状态下收到无效消息: ~w",
                 [_Name, _Path, _Orders, _Any],
                 unit,
                 756),
    continue(patrol, State).

trace(timeout,
      State = #unit{id = _UnitId, base_id = _BaseId,
                    pos =
                        Pos = #pos{map = MapId, map_pid = MapPid, x = X, y = Y},
                    range_trace = RangeTrace, range_atk = RangeAtk,
                    order =
                        [#unit_order{order = trace,
                                     arg =
                                         #map_role{rid = Rid, platform = Plat,
                                                   zone_id = Zone}}
                         | Orders]}) ->
    case role_query:attr(by_id,
                         Rid,
                         Plat,
                         Zone,
                         [#role.status, #role.pos])
        of
        {ok, [2, _]} ->
            logger:debug("单位[ID:~w BASE:~w]追踪对象战斗中，放弃追踪",
                         [_UnitId, _BaseId],
                         unit,
                         763),
            next_order(trace, State#unit{order = Orders});
        {ok, [0, #pos{map = MapId, x = Tx, y = Ty}]} ->
            Dx = math:pow(X - Tx, 2),
            Dy = math:pow(Y - Ty, 2),
            Rt = math:pow(RangeTrace, 2),
            Ra = math:pow(RangeAtk, 2),
            if Dx + Dy =< Ra ->
                   logger:debug("单位[ID:~w BASE:~w]追踪发现可以攻击的对象[~w][~w, "
                                "~w, ~w]",
                                [_UnitId,
                                 _BaseId,
                                 {Rid, Plat, Zone},
                                 Dx,
                                 Dy,
                                 Ra],
                                unit,
                                773),
                   continue(combat,
                            State#unit{order = Orders, ts = now()});
               Dx + Dy =< Rt ->
                   logger:debug("单位[ID:~w BASE:~w]追踪对象，无法发起战斗，继续追踪[~w, "
                                "~w, ~w]",
                                [_UnitId, _BaseId, {Dx, Dy}, Rt, Ra],
                                unit,
                                778),
                   NewState = State#unit{pos = Pos#pos{x = Tx, y = Ty},
                                         ts = now()},
                   map:unit_move(MapPid, State, Tx, Ty),
                   continue(trace, NewState);
               Dx + Dy > Rt ->
                   logger:debug("单位[ID:~w BASE:~w]脱离对象，放弃追踪",
                                [_UnitId, _BaseId],
                                unit,
                                783),
                   next_order(trace, State#unit{order = Orders});
               true -> next_order(trace, State#unit{order = Orders})
            end;
        {ok, [0, _]} ->
            logger:debug("单位[~w]和追踪对象不在同一张地图，放弃追踪", [], unit, 789),
            next_order(trace, State#unit{order = Orders});
        _E ->
            logger:error("单位[~w]追踪对象出现异常，放弃追踪", [], unit, 792),
            next_order(trace, State#unit{order = Orders})
    end;
trace(_Any, State = #unit{name = _Name}) ->
    logger:debug("单位[~ts]在追踪状态下收到无效消息: ~w",
                 [_Name, _Any],
                 unit,
                 796),
    continue(trace, State).

sync(State) -> catch ets:insert(unit_info, State).

add_order(Order = #unit_order{type = 0},
          Unit = #unit{order = []}) ->
    Unit#unit{order = [Order]};
add_order(Order = #unit_order{type = 0},
          Unit = #unit{order = [_ | Orders]}) ->
    Unit#unit{order = [Order | Orders]};
add_order(Order = #unit_order{type = 1},
          Unit = #unit{order = Orders}) ->
    Unit#unit{order = [Order | Orders]};
add_order(Order = #unit_order{type = 2},
          Unit = #unit{order = Orders}) ->
    Unit#unit{order = Orders ++ [Order]};
add_order(_Order, Unit) -> Unit.

next_order(_StateName,
           State = #unit{order = [], def_status = DefStatus}) ->
    continue(DefStatus, State#unit{ts = now()});
next_order(StateName,
           State = #unit{order = [Order = #unit_order{} | T]}) ->
    case catch unit_type:order(Order, StateName, State) of
        {ok, NewOrder, NewStateName, NewS} ->
            NewState = NewS#unit{order = [NewOrder | T]},
            sync(NewState),
            continue(NewStateName, NewState);
        _E ->
            logger:error("执行指令动作返回错误：~w", [_E], unit, 829),
            continue(StateName, State)
    end;
next_order(StateName, State = #unit{order = [_ | T]}) ->
    next_order(StateName, State#unit{order = T}).

next_order(_StateName, Reply,
           State = #unit{order = [], def_status = DefStatus}) ->
    continue(DefStatus, Reply, State#unit{ts = now()});
next_order(StateName, Reply,
           State = #unit{order = [Order = #unit_order{} | T]}) ->
    case catch unit_type:order(Order, StateName, State) of
        {ok, NewOrder, NewStateName, NewS} ->
            NewState = NewS#unit{order = [NewOrder | T]},
            sync(NewState),
            continue(NewStateName, Reply, NewState);
        _E ->
            logger:error("执行指令动作返回错误：~w", [_E], unit, 846),
            continue(StateName, Reply, State)
    end;
next_order(StateName, Reply,
           State = #unit{order = [_ | T]}) ->
    next_order(StateName, Reply, State#unit{order = T}).

continue(patrol,
         State = #unit{ts = Ts, t_move = Tmove}) ->
    {next_state, patrol, State, util:time_left(Tmove, Ts)};
continue(loaf,
         State = #unit{ts = Ts, t_move = Tmove}) ->
    {next_state, loaf, State, util:time_left(Tmove, Ts)};
continue(trace, State = #unit{t_atk = Tatk}) ->
    {next_state, trace, State, Tatk};
continue(move,
         State = #unit{ts = Ts, t_move = Tmove}) ->
    {next_state, move, State, util:time_left(Tmove, Ts)};
continue(attack,
         State = #unit{ts = Ts, t_move = Tmove}) ->
    {next_state, attack, State, util:time_left(Tmove, Ts)};
continue(guard,
         State = #unit{ts = Ts, t_move = Tmove}) ->
    {next_state, guard, State, util:time_left(Tmove, Ts)};
continue(combat, State = #unit{ts = Ts}) ->
    {next_state, combat, State, util:time_left(60000, Ts)};
continue(defense, State) ->
    {next_state, defense, State};
continue(freeze, State) -> {next_state, freeze, State}.

continue(patrol, Reply,
         State = #unit{ts = Ts, t_move = Tmove}) ->
    {reply,
     Reply,
     patrol,
     State,
     util:time_left(Tmove, Ts)};
continue(loaf, Reply,
         State = #unit{ts = Ts, t_move = Tmove}) ->
    {reply, Reply, loaf, State, util:time_left(Tmove, Ts)};
continue(trace, Reply, State = #unit{t_atk = Tatk}) ->
    {reply, Reply, trace, State, Tatk};
continue(move, Reply,
         State = #unit{ts = Ts, t_move = Tmove}) ->
    {reply, Reply, move, State, util:time_left(Tmove, Ts)};
continue(attack, Reply,
         State = #unit{ts = Ts, t_move = Tmove}) ->
    {reply,
     Reply,
     attack,
     State,
     util:time_left(Tmove, Ts)};
continue(guard, Reply,
         State = #unit{ts = Ts, t_move = Tmove}) ->
    {reply, Reply, guard, State, util:time_left(Tmove, Ts)};
continue(combat, Reply, State = #unit{ts = Ts}) ->
    {reply,
     Reply,
     combat,
     State,
     util:time_left(60000, Ts)};
continue(defense, Reply, State) ->
    {reply, Reply, defense, State};
continue(freeze, Reply, State) ->
    {reply, Reply, freeze, State}.

do_guard({RangeTrace, Map, Tx, Ty},
         State = #unit{lock = Lock,
                       pos =
                           Pos = #pos{map = MapId, map_pid = MapPid, x = X,
                                      y = Y},
                       path = [{Dx, Dy} | Path], disabled = Disabled})
    when Map =:= MapId ->
    DetX = math:pow(X - Tx, 2),
    DetY = math:pow(Y - Ty, 2),
    Rt = math:pow(RangeTrace, 2),
    if DetX + DetY =< Rt ->
           case unit_type:search_attack(State) of
               {ok, _} when Disabled =/= "" ->
                   map:unit_move(MapPid, State, Dx, Dy),
                   NewState = State#unit{pos = Pos#pos{x = Dx, y = Dy},
                                         path = Path, ts = now()},
                   sync(NewState),
                   continue(guard, NewState);
               {ok,
                #map_role{rid = _Rid, platform = _Plat,
                          zone_id = _Zone}}
                   when Lock =:= 1 ->
                   continue(combat, State#unit{ts = now()});
               {ok,
                #map_role{rid = _Rid, platform = _Plat,
                          zone_id = _Zone}} ->
                   map:unit_move(MapPid, State, Dx, Dy),
                   NewState = State#unit{pos = Pos#pos{x = Dx, y = Dy},
                                         path = Path, ts = now()},
                   sync(NewState),
                   continue(guard, NewState);
               false ->
                   map:unit_move(MapPid, State, Dx, Dy),
                   NewState = State#unit{pos = Pos#pos{x = Dx, y = Dy},
                                         path = Path, ts = now()},
                   sync(NewState),
                   continue(guard, NewState)
           end;
       true ->
           logger:debug("单位[~w]守卫偏离目标[~w]",
                        [State#unit.base_id, {RangeTrace, Map, Tx, Ty}],
                        unit,
                        936),
           NewState = State#unit{pos = Pos#pos{x = Tx, y = Ty},
                                 path = [], ts = now()},
           map:unit_move(MapPid, State, Tx, Ty),
           sync(NewState),
           continue(guard, NewState)
    end.

