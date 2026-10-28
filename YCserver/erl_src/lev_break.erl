-file("src/mod/lev_break/lev_break.erl", 1).

-module(lev_break).

-behaviour(gen_server).

-export([start_link/0,
         init/0,
         login/1,
         get_contribution/0,
         get_boss_killed/0,
         get_boss_killed_time/0,
         get_boss_active_day/0,
         is_finish_contribution/0,
         filter_gain/1,
         get_trial/1,
         push/2,
         fight/2,
         break/1,
         exchange/2,
         combat_over/1,
         check_gain/3,
         get_max_lev/1,
         get_max_exp/1,
         contribute/1,
         check_pick/2,
         pick_gain/2,
         buy_trial/1,
         get_times/1,
         apply_evt/2,
         get_looks/1,
         get_qualified_ids/1,
         treat_unit_attr/2,
         treat_slave_attr/2,
         gm/2,
         lev/1,
         help/2,
         guild_role_apply_help/2,
         assist/3]).

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

-file("src/mod/lev_break/lev_break.erl", 47).

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

-file("src/mod/lev_break/lev_break.erl", 48).

-file("inc/quest.hrl", 1).

-file("inc/quest_king.hrl", 1).

-record(quest_king,
        {ver = 1,
         stage = 1,
         finish = [],
         doing = [],
         rf_times = 0}).

-file("inc/quest.hrl", 36).

-record(quest_data,
        {id = 1 :: pos_integer(),
         phase = 1 :: pos_integer(),
         quest_line = 1,
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         name = "" :: list(),
         mode = 1 :: pos_integer(),
         leader_cond = [] :: [tuple()],
         is_leader_quest = 0 :: 0 | 1,
         can_giveup = 0 :: 0..1,
         lev = 1 :: pos_integer(),
         lev_break_min_times = 0 :: non_neg_integer(),
         lev_break_max_times = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         auto_finished_lev = 0 :: non_neg_integer(),
         classes = 0 :: 0..4,
         pre_quest ::
             undefined | non_neg_integer() | [non_neg_integer()],
         check_distance = 0 :: 0..1,
         npc_accept_battle = 0 :: non_neg_integer(),
         npc_accept_id = 0 :: non_neg_integer(),
         npc_accept = 0 :: non_neg_integer(),
         npc_commit_battle = 0 :: non_neg_integer(),
         npc_commit_id = 0 :: non_neg_integer(),
         npc_commit = 0 :: non_neg_integer(),
         start_time = 0 ::
             tuple() | non_neg_integer() | undefined,
         end_time = 0 :: tuple() | non_neg_integer() | undefined,
         condition = [] :: [tuple()],
         progress = [] :: [tuple()],
         rewards_accept = [] :: [tuple()],
         rewards_commit = [] :: [tuple()],
         commit_loss = [] :: [tuple()],
         rewards_vip = [] :: [tuple()],
         action_accept = [] :: [tuple()],
         action_commit = [] :: [tuple()],
         times = 1 :: non_neg_integer(),
         desc = "" :: list(),
         auto_accept = 0 :: 0..1,
         is_auto_finished_gain = 0 :: 0..1,
         weekdays = [] :: [pos_integer()],
         white_list = [] :: list(),
         black_list = [] :: list(),
         notice_msg = "" :: list(),
         val_from_prev = 0 :: 0..1,
         honor = 0 :: non_neg_integer(),
         ach_num = 0 :: non_neg_integer(),
         rewards_badge = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         extra = []}).

-record(quest_extra_data,
        {name = 0, classes = 0, val1 = 0, val2 = 0, list = []}).

-record(quest_classes,
        {quest_id = 0,
         first_time = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_offer,
        {quest_id = 0,
         day_count = 0,
         leader_count = 0,
         leader_quest_count = 0,
         round = 0,
         total_count = 0,
         team_args = []}).

-record(quest_treasure,
        {quest_id = 0, round = 0, total_count = 0}).

-record(quest_guild,
        {quest_id = 0,
         last_accepted = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_chain,
        {quest_id = 0,
         accept_time = 0,
         type = 0,
         ext_data = [],
         round = 0,
         total_count = 0,
         commit_npc}).

-record(quest_marriage,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         ext_data = quest_marriage:quest_ext_data()}).

-record(quest_couple,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         partner_id,
         ext_data = quest_couple:quest_ext_data()}).

-record(quest_prac,
        {part = 1, chapter = 2, section = 0}).

-record(quest_plant,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         unit_id = 0,
         phase = 0,
         pos = {0, 0, 0},
         done_list = []}).

-record(quest_teacher,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         partner_id,
         round = 0,
         total_count = 0,
         stats = [],
         ext_data = quest_teacher:quest_ext_data()}).

-record(quest_shipping, {list = []}).

-record(quest_pursue,
        {quest_id = 0,
         last_accepted = 0,
         round_started = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_child,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         unit_id = 0,
         done_list = []}).

-record(quest_pregnancy,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         done_list = []}).

-record(quest_acquaintance,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         partner_id = 0,
         partner_name = "",
         done_list = [],
         ring = 0,
         rpc_accepted = 0}).

-record(quest_summer,
        {ver = 1,
         finish = [],
         doing = [],
         score = 0,
         rewarded = []}).

-record(quest_single_dog,
        {ver = 1, finish = [], round = 1, extra = #{}}).

-record(quest_sign_draw, {finish = [], doing = []}).

-record(quest_score_exchange,
        {finish = [], doing = []}).

-record(quest_long_active, {finish = [], doing = []}).

-record(m_quest,
        {ver = 19,
         quest = [] :: list(),
         acceptable = [] :: list(),
         finished = [] :: list(),
         day_finished = [],
         quest_classes = #quest_classes{} :: #quest_classes{},
         quest_offer = #quest_offer{} :: #quest_offer{},
         quest_prac = #quest_prac{} :: #quest_prac{},
         quest_treasure = #quest_treasure{},
         quest_guild = #quest_guild{},
         quest_chain = #quest_chain{},
         quest_marriage = #quest_marriage{},
         quest_couple = #quest_couple{},
         quest_plant = #quest_plant{},
         quest_teacher = #quest_teacher{},
         quest_shipping = #quest_shipping{},
         quest_pursue = #quest_pursue{},
         quest_line = 2,
         quest_child = #quest_child{},
         quest_pregnancy = #quest_pregnancy{},
         quest_acquaintance = #quest_acquaintance{},
         quest_king = #quest_king{},
         quest_summer = #quest_summer{},
         quest_single_dog = #quest_single_dog{},
         quest_sign_draw = #quest_sign_draw{},
         quest_score_exchange = #quest_score_exchange{},
         quest_long_active = #quest_long_active{}}).

-record(quest,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         quality = 0 :: 0..4,
         progress = [] :: [tuple()],
         accept_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         finish_time = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer()}).

-record(quest_progress,
        {id = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         target = 0 :: non_neg_integer(),
         param = [] :: list(),
         finish = 0 :: 0..1,
         trigger :: undefined | tuple(),
         target_val = 1 :: pos_integer(),
         value = 0 :: non_neg_integer(),
         msg = "" :: bitstring() | string(),
         ext_data = [] :: [tuple()],
         dyn_ext_data = [] :: [tuple()]}).

-record(quest_rewards,
        {prob = 1000 :: pos_integer(),
         classes = 0 :: 0..4,
         gain :: undefined | tuple(),
         action :: undefined | function()}).

-record(quest_stats,
        {sec_type = 1, stats = [], desc = []}).

-file("src/mod/lev_break/lev_break.erl", 49).

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

-file("src/mod/lev_break/lev_break.erl", 50).

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

-file("src/mod/lev_break/lev_break.erl", 51).

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

-file("src/mod/lev_break/lev_break.erl", 52).

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

-file("src/mod/lev_break/lev_break.erl", 53).

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

-file("src/mod/lev_break/lev_break.erl", 54).

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

-file("src/mod/lev_break/lev_break.erl", 55).

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

-file("src/mod/lev_break/lev_break.erl", 56).

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

-file("src/mod/lev_break/lev_break.erl", 57).

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

-file("src/mod/lev_break/lev_break.erl", 58).

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

-file("src/mod/lev_break/lev_break.erl", 59).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/lev_break/lev_break.erl", 60).

-file("inc/looks.hrl", 1).

-file("src/mod/lev_break/lev_break.erl", 61).

-file("inc/robot.hrl", 1).

-record(robot_role,
        {ver = 4,
         id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         face = 0,
         ai_id = 0,
         skills = [],
         talents = [],
         pet,
         backup_pets = [],
         guard,
         slave = [],
         attr :: undefined | tuple(),
         looks = [],
         time = 0,
         m_formation,
         pet_fc = 0,
         all_fc = 0,
         cup = 1000,
         m_lev_break}).

-record(robot_role_index,
        {id = {0, "", 0} :: tuple(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         pet_fc = 0,
         cup = 1000,
         all_fc = 0,
         time = 0}).

-file("src/mod/lev_break/lev_break.erl", 62).

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

-file("src/mod/lev_break/lev_break.erl", 63).

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

-file("src/mod/lev_break/lev_break.erl", 64).

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

-file("src/mod/lev_break/lev_break.erl", 65).

-record(state,
        {contribution = 0 :: non_neg_integer(),
         boss_killed = 0 :: non_neg_integer(),
         boss_id = {0, 0},
         active = 0,
         refresh_ref :: undefined | reference()}).

init() -> #m_lev_break{}.

login(Role = #role{lev = Lev}) ->
    L = [#trigger{label = evt_accept_quest, a = [],
                  m = lev_break, f = apply_evt}],
    case env:get(lev_break_active) =:= 0 andalso Lev >= 95
        of
        true ->
            {_, NewRole} = role_trigger:add(L, Role),
            {ok, NewRole};
        _ -> ok
    end.

lev(#role{m_lev_break = #m_lev_break{times = 0},
          lev = Lev}) ->
    Lev;
lev(#role{lev = Lev}) -> max(100, Lev);
lev(#fighter{m_lev_break = #m_lev_break{times = 0},
             lev = Lev}) ->
    Lev;
lev(#fighter{lev = Lev}) -> max(100, Lev);
lev(#team_mate{lev = Lev, lev_break_times = 0}) -> Lev;
lev(#team_mate{lev = Lev}) -> max(100, Lev);
lev(_) -> 1.

get_times(#role{m_lev_break =
                    #m_lev_break{times = Times}}) ->
    Times;
get_times(#fighter{m_lev_break =
                       #m_lev_break{times = Times}}) ->
    Times;
get_times(_) -> 0.

get_looks(#role{m_lev_break =
                    #m_lev_break{times = Times}})
    when Times >= 1 ->
    [{67, 0, Times, ""}];
get_looks(_) -> [].

get_contribution() -> env:get(lev_break_contribution).

is_finish_contribution() ->
    Need = get_contribution_need(),
    case get_boss_killed() of
        1 -> true;
        _ -> get_contribution() >= Need
    end.

is_active() ->
    case env:get(lev_break_active) of
        1 -> true;
        _ -> false
    end.

filter_gain(Reward) ->
    filter_gain(Reward, [], undefined).

filter_gain([], Reward, _) -> Reward;
filter_gain([Gain = #gain{label = item_base_id,
                          val = [{23700, _, _}]}
             | T],
            Reward, undefined) ->
    Flag = lev_break:is_finish_contribution(),
    case is_active() =:= false orelse Flag of
        true -> filter_gain(T, Reward, Flag);
        false -> filter_gain(T, [Gain | Reward], Flag)
    end;
filter_gain([#gain{label = item_base_id,
                   val = [{23700, _, _}]}
             | T],
            Reward, true) ->
    filter_gain(T, Reward, true);
filter_gain([G | T], Reward, Flag) ->
    filter_gain(T, [G | Reward], Flag).

get_boss_killed() -> env:get(lev_break_boss_killed).

get_boss_killed_time() ->
    case env:get(lev_break_boss_killed_time) of
        Time when is_integer(Time) -> Time;
        _ -> 0
    end.

get_boss_active_day() ->
    case env:get(lev_break_boss_active_time) of
        T when is_integer(T) ->
            Now = date:unixtime(),
            date:day_diff(T, Now);
        _ -> 0
    end.

get_trial(#role{m_lev_break =
                    #m_lev_break{trial = Trial}}) ->
    Trial.

push(Role = #role{m_lev_break = MLB}, Cmd = 17400) ->
    Goals = list_goal(Role),
    sys_conn:pack_send(Cmd, {MLB, Goals}),
    ok;
push(_Role, Cmd = 17404) ->
    Need = get_contribution_need(),
    Data = case get_boss_killed() of
               1 -> {Need, Need};
               _ -> {get_contribution(), Need}
           end,
    sys_conn:pack_send(Cmd, Data),
    ok.

fight(Role = #role{m_lev_break =
                       #m_lev_break{trial = 0}},
      #unit{base_id = BaseId = 73030}) ->
    case check_fight([goals, team_trial, combat_self],
                     Role,
                     #{})
        of
        {ok, #{mates := Mates}} ->
            case combat_mgr:start_combat(45,
                                         Mates,
                                         [{unit_baseid, BaseId}],
                                         #combat_start_args{ext_args = BaseId})
                of
                {ok, _} ->
                    case help:del_help_info_by_fun_type(Role, 7) of
                        {ok, NewRole} -> {ok, NewRole};
                        _ -> ok
                    end;
                _Err ->
                    logger:debug("战斗发起失败:~w", [_Err], lev_break, 236),
                    ok
            end;
        Else -> Else
    end;
fight(_, 73030) -> {false, lang:get("你已经突破过了")};
fight(Role = #role{},
      U = #unit{base_id = BaseId = 73020}) ->
    case check_fight([combat_self, team], Role, #{}) of
        {ok, #{mates := Mates}} ->
            Unit = get_difficulty(U),
            case combat_mgr:start_combat(45,
                                         Mates,
                                         Unit,
                                         #combat_start_args{ext_args = BaseId})
                of
                {ok, _} -> ok;
                _Err ->
                    logger:debug("战斗发起失败:~w", [_Err], lev_break, 251),
                    ok
            end;
        Else -> Else
    end;
fight(_, _) -> {false, lang:get("不能开打了")}.

combat_over(#combat{start_args =
                        #combat_start_args{ext_args = BaseId = 73020},
                    winner = Winner, loser = Loser}) ->
    case [F || #fighter{id = F, type = 1} <- Winner] of
        [] ->
            case [#{name => Name}
                  || #fighter{name = Name, is_leader = 1, type = 1}
                         <- Loser]
                of
                [#{name := RoleName} | _] ->
                    lev_break ! {kill_boss_fail, BaseId, RoleName};
                _ -> ok
            end;
        _ -> lev_break ! {kill_boss, BaseId, Winner}
    end,
    ok;
combat_over(_) -> ok.

check_gain(Role = #role{m_lev_break =
                            MLB = #m_lev_break{trial = OldTrial}},
           win, BaseId = 73030) ->
    NewMLB = #m_lev_break{trial = NewTrial} = case [Id
                                                    || {Id, _, 0}
                                                           <- list_goal(Role),
                                                       Id =/= 1008]
                                                  of
                                                  [_Id | _] -> MLB;
                                                  _ ->
                                                      MLB#m_lev_break{trial = 1}
                                              end,
    Role1 = case NewTrial > OldTrial of
                true ->
                    notice:send(Role, 3, lang:get("恭喜成功挑战了心魔，快去进行突破吧")),
                    Role#role{m_lev_break = NewMLB};
                _ ->
                    HelpReward = case var:get_var(Role, day, 84, 0) of
                                     0 -> [{23211, 0, 1}];
                                     Helped when Helped < 3 -> [{90020, 5}];
                                     _ -> [{90020, 2}]
                                 end,
                    Title = lang:get("帮助净化心魔奖励"),
                    Content = lang:get("为感谢你在心魔挑战中对其他玩家的帮助，星辰学院送来了对你的奖励！"),
                    mail:send(Role,
                              #{title => Title, content => Content,
                                items => HelpReward}),
                    var:acc_var(Role, day, 84)
            end,
    Rewards = case lev_break_data:get_boss(BaseId) of
                  #{rewards := [H | T]} ->
                      {ItemId1, Num, _} = util:rand_list([H | T], 3),
                      ItemId = item_type:special_id(ItemId1),
                      format:val_to_gain([{ItemId, 0, Num}]);
                  _ -> []
              end,
    {Role1, Rewards};
check_gain(Role, win, BaseId = 73020) ->
    Rewards = case lev_break_data:get_boss(BaseId) of
                  #{rewards := [H | T]} ->
                      {ItemId1, Num, _} = util:rand_list([H | T], 3),
                      ItemId = item_type:special_id(ItemId1),
                      format:val_to_gain([{ItemId, 0, Num}]);
                  _ -> []
              end,
    {Role, Rewards};
check_gain(Role, _, _) -> {Role, []}.

buy_trial(Role = #role{m_lev_break =
                           MLB = #m_lev_break{trial = 0}}) ->
    case [Id || {Id, _, 0} <- list_goal(Role), Id =/= 1008]
        of
        [Id | _] ->
            {false,
             notice:format(lang:get("目标~ts还没完成"),
                           [{string_2, 5, get_goal_name(Id)}])};
        _ ->
            Role1 = Role#role{m_lev_break =
                                  MLB#m_lev_break{trial = 1}},
            Loss = format:val_to_loss([{90000, 10000000}]),
            case role_gain:do_notice(Loss, Role1) of
                {ok, NewRole} ->
                    Msg = lang:get("恭喜成功挑战了心魔，快去进行突破吧"),
                    {ok, Msg, NewRole};
                {false, #loss{msg = Msg}} -> {false, Msg}
            end
    end;
buy_trial(_) -> {false, lang:get("你已经通关心魔了")}.

break(Role = #role{m_lev_break =
                       MLB = #m_lev_break{times = Times},
                   assets = Assets = #assets{exp = Exp},
                   m_attr_point =
                       Mattr = #m_attr_point{ext_point = ExtPoint},
                   classes = Classes, name = Name}) ->
    NewTimes = Times + 1,
    case lev_break_data:get_times(NewTimes) of
        #{lev_back := LevBack, loss := Loss} ->
            case [Id || {Id, _, 0} <- list_goal(Role)] of
                [Id | _] ->
                    {false,
                     notice:format(lang:get("目标~ts还没完成"),
                                   [{string_2, 5, get_goal_name(Id)}])};
                _ ->
                    NewExtPoint = lists:keystore(4,
                                                 1,
                                                 ExtPoint,
                                                 {4, get_add_point(NewTimes)}),
                    Role1 = Role#role{m_lev_break =
                                          MLB#m_lev_break{times = NewTimes},
                                      assets = Assets#assets{exp = 0},
                                      lev = LevBack,
                                      m_attr_point =
                                          Mattr#m_attr_point{ext_point =
                                                                 NewExtPoint}},
                    Loss1 = format:val_to_loss([{I, N}
                                                || {C, I, N} <- Loss,
                                                   C =:= 0 orelse
                                                       C =:= Classes]),
                    Gain = format:val_to_gain([{90010, Exp}]),
                    case role_gain:do(Loss1 ++ Gain, Role1) of
                        {ok, Role2} ->
                            Role3 = attr:calc_and_push(Role2),
                            Role4 = role_trigger:fire(#evt_lev_break{}, Role3),
                            Role5 = looks:calc(Role4),
                            NewRole = Role5,
                            looks:update_looks(Role, NewRole),
                            Msg = lang:get("等级突破成功"),
                            AnnStr =
                                notice:format(lang:get("天地变色！~ts历经万难，终于成功突破百级限制，绯月大陆即将诞生一个超级强者！"),
                                              [{role_2, Name}]),
                            notice:cast(all, 5, AnnStr),
                            push(NewRole, 17400),
                            attr:push_10007(NewRole),
                            role_gain:push_exp(NewRole),
                            Title = lang:get("恭喜突破成功"),
                            Content =
                                notice:format(lang:get("恭喜你成功~ts限制，达到了极少人能够达到的境界！等级突破之后你暂时~ts了等级且回收了~"
                                                       "ts属性点。但是不要着急，这些跟突破后的好处比起来微不足道。突破后你可以\n~ts\n~t"
                                                       "s\n~ts\n~ts\n~ts\n突破后的你焕然新生，带着新的目标和新的希望，一鼓作气，"
                                                       "冲上100级吧！"),
                                              [{string_2, 1, lang:get("突破等级")},
                                               {string_2, 5, lang:get("回退")},
                                               {string_2, 5, lang:get("25点")},
                                               {string_2,
                                                5,
                                                lang:get("1、冒险等级提升至21级")},
                                               {string_2,
                                                5,
                                                lang:get("2、到达100级时可铸造100级装备")},
                                               {string_2,
                                                5,
                                                lang:get("3、强壮精通可提升至100级")},
                                               {string_2,
                                                5,
                                                lang:get("4、开放属性点兑换，连本带利要回来！")},
                                               {string_2,
                                                5,
                                                lang:get("5、更多新功能和新挑战")}]),
                            mail:send(Role,
                                      #{title => Title, content => Content,
                                        items => []}),
                            {ok, Msg, NewRole};
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end
            end;
        _ -> {false, lang:get("当前不能突破")}
    end.

exchange(#role{m_lev_break = #m_lev_break{times = 0}},
         _Point) ->
    {false, lang:get("需要等级突破后才能兑换")};
exchange(Role = #role{m_lev_break =
                          MLB = #m_lev_break{attr_point = Have, times = Times},
                      m_attr_point =
                          Mattr = #m_attr_point{ext_point = ExtPoint}},
         Point)
    when Point > 0 ->
    Max = get_max_exchange(Times),
    case lev_break_data:get_exchange(Have + Point) of
        _ when Have + Point > Max ->
            {false,
             notice:format(lang:get("最大可兑换~ts点"),
                           [{string_2, 5, Max}])};
        [_ | _] ->
            NewPoint = Point + Have,
            NewExtPoint = lists:keystore(5,
                                         1,
                                         ExtPoint,
                                         {5, NewPoint}),
            Role1 = Role#role{m_lev_break =
                                  MLB#m_lev_break{attr_point = NewPoint},
                              m_attr_point =
                                  Mattr#m_attr_point{ext_point = NewExtPoint}},
            Loss = acc_loss(NewPoint, Have, []),
            logger:debug("消耗 ~w", [Loss], lev_break, 413),
            case role_gain:do(Loss, Role1) of
                {ok, Role2} ->
                    NewRole = Role2,
                    Msg = notice:format(lang:get("成功兑换~ts点属性点"),
                                        [{string_2, 5, Point}]),
                    attr:push_10007(NewRole),
                    {ok,
                     Msg,
                     NewPoint,
                     role_trigger:fire(#evt_lev_break_exch{val = Point},
                                       NewRole)};
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("兑换点数超了")}
    end;
exchange(_, _) -> {false, lang:get("不能兑换")}.

get_max_lev(#role{m_lev_break =
                      #m_lev_break{times = Times}}) ->
    case lev_break_data:get_times(Times) of
        #{lev_break_max := Max} -> Max;
        _ -> 100
    end.

get_max_exp(Role = #role{m_lev_break =
                             #m_lev_break{times = Times},
                         lev = Lev})
    when Times > 0 ->
    MaxLev = get_max_lev(Role),
    logger:debug("最大等级 ~w", [MaxLev], lev_break, 438),
    case Lev of
        109 ->
            lists:sum([levup_data:get(I)
                       || I <- lists:seq(110, 113)]);
        99 ->
            lists:sum([levup_data:get(I)
                       || I <- lists:seq(99, 108)]);
        _ -> levup_data:get(MaxLev) * 2
    end;
get_max_exp(#role{lev = Lev}) ->
    case Lev of
        89 ->
            lists:sum([levup_data:get(I)
                       || I <- lists:seq(89, 98)]);
        99 ->
            lists:sum([levup_data:get(I)
                       || I <- lists:seq(96, 99)]);
        _ ->
            lists:sum([levup_data:get(I) || I <- lists:seq(95, 99)])
    end.

contribute(Role) ->
    Contributed = var:get_var(Role, day, 72, 0),
    Available = max(0, 8 - Contributed),
    case package:count(by_base_id, 23700, Role#role.p_bag)
        of
        _ when Available =:= 0 ->
            {false,
             notice:format(lang:get("每人每天只能提交~ts个~ts，快去号召更多的百级强者共同来重筑星途吧。超越百级的大门正向"
                                    "我们敞开！"),
                           [{string_2, 5, 8}, {item_2, 23700}])};
        {_, 0} ->
            {false,
             notice:format(lang:get("你还没收集到~ts哦。每天 ~ts，三个时段都将会有星光碎片降落在此地，准时过来收集吧！"),
                           [{item_2, 23700},
                            {string_2,
                             1,
                             "11：30-12：30，15：30-16：30，22：30-23：30"}])};
        {_, HadNum} ->
            CostNum = min(Available, HadNum),
            Loss = format:val_to_loss([{23700, CostNum}]),
            Gain = format:val_to_gain([{90010, 23773 * CostNum}]),
            Role1 = var:set_var(Role,
                                day,
                                72,
                                Contributed + CostNum),
            case role_gain:do_notice(Loss ++ Gain, Role1) of
                {ok, NewRole} ->
                    lev_break ! {contribute, CostNum},
                    Msg = lang:get("提交成功"),
                    {ok, Msg, NewRole};
                {false, #loss{msg = Msg}} -> {false, Msg}
            end
    end.

check_pick(#role{lev = Lev}, _) when Lev < 100 ->
    {false,
     notice:format(lang:get("等级~ts级以上才可以采集哦"),
                   [{string_2, 5, 100}])};
check_pick(Role, PickArgs = #{}) ->
    case var:get_var(Role, day, 71, 0) >= 8 of
        true ->
            {false,
             notice:format(lang:get("每天最多只能采集 ~ts个哦"),
                           [{string_2, 5, 8}])};
        _ -> {true, PickArgs}
    end.

pick_gain(Role = #role{pid = _Pid}, _) ->
    Gain = [{23700, 1}],
    Gain1 = format:val_to_gain(Gain),
    Role1 = var:acc_var(Role, day, 71),
    case role_gain:do_notice(Gain1, Role1) of
        {ok, Role2} -> {ok, Role2};
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("等级突破采集"),
            Content = lang:get("背包已满，奖励通过邮件发送，请查收。"),
            mail:send(Role,
                      #{title => Title, content => Content, items => Gain}),
            {ok, Role1};
        {false, #gain{msg = Msg}} ->
            notice:return(Msg),
            ok;
        _R ->
            logger:debug("未知返回 ~w", [_R], lev_break, 509),
            ok
    end.

treat_unit_attr(Attr, Attr0) -> do_attr(Attr0, Attr).

treat_slave_attr(Fighter, Attr0) ->
    Fighter#fighter{attr =
                        {lev_break, treat_unit_attr, [Attr0]}}.

help(HelpData = #help_data{type = HelpType},
     Role = #role{m_lev_break = #m_lev_break{trial = 0}}) ->
    case HelpType of
        1 ->
            case create_help_team(Role) of
                {ok, NRole} ->
                    case help_guild(HelpData, NRole) of
                        {ok, NewRole} -> {ok, NewRole};
                        _ -> {ok, NRole}
                    end;
                Rtn -> Rtn
            end;
        _ -> {false, lang:get("未知的任务求助")}
    end;
help(_HelpData, _Role) -> {false, lang:get("你已经突破心魔了")}.

guild_role_apply_help(Role, HelpMsg) ->
    NewRole = help:ack_recv(HelpMsg, Role),
    {ok, NewRole}.

assist(_HelpData, #help_msg{help_rid = HelpRid},
       Role) ->
    case check_join_team(Role) of
        true -> team_mgr:accept_recruitment(Role, HelpRid);
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("不能加入求助队伍")}
    end.

help_guild(HelpData = #help_data{id = HelpId},
           Role = #role{id = SelfId, name = Name,
                        m_guild = #m_guild{pid = GuildPid, id = GuildId}})
    when is_pid(GuildPid) ->
    case guild_mgr:members(GuildId) of
        {ok, Members} ->
            Fmt =
                lang:get("~ts在突破任务中突然发狂，一只强大的~ts从TA内心显现，大家快来帮忙吧！（帮助可获得心"
                         "魔宝箱和王者积分）"),
            Args = [{role_2, Name}, {unit_1, 73030}],
            NoticeMsg = notice:format(Fmt, Args),
            StrArr = [{1000, NoticeMsg}],
            HelpMsg = #help_msg{help_rid = SelfId, help_id = HelpId,
                                str_array = StrArr},
            case help:add(HelpData, HelpMsg, Role) of
                {ok, NewHelpMsg, NewRole} ->
                    MFA = {lev_break, guild_role_apply_help, [NewHelpMsg]},
                    guild_role:async_apply_role([M
                                                 || M = #guild_role{lev = Lev,
                                                                    lev_break_times
                                                                        =
                                                                        BreakTimes}
                                                        <- Members,
                                                    Lev + 6 * BreakTimes > 98],
                                                MFA),
                    {ok, NewRole};
                Rtn -> Rtn
            end;
        _ -> {false, lang:get("无法发起公会求助")}
    end;
help_guild(_HelpData, _Role) ->
    {false, lang:get("请先加入一个公会")}.

apply_evt(#evt_accept_quest{id = 44020},
          _Role = #role{name = Name, pid = Pid}) ->
    lev_break ! {active, Pid, Name},
    ok;
apply_evt(_, _) -> ok.

gm(Role, reset) ->
    {ok, Role#role{m_lev_break = init()}};
gm(boss_day, Day) ->
    env:save(lev_break_boss_active_time,
             date:unixtime() - 86400 * Day);
gm(_, unactive) -> lev_break ! unactive;
gm(_, {contribute, N}) when N > 0 ->
    lev_break ! {contribute, N}.

start_link() ->
    gen_server:start_link({local, lev_break},
                          lev_break,
                          [],
                          []).

init([]) ->
    logger:info("开始启动...", [], lev_break, 607),
    Contribution = case env:get(lev_break_contribution) of
                       N when is_integer(N) -> N;
                       _ ->
                           env:save(lev_break_contribution, 0),
                           0
                   end,
    BossKiled = case env:get(lev_break_boss_killed) of
                    T when is_integer(T) -> T;
                    _ ->
                        env:save(lev_break_boss_killed, 0),
                        0
                end,
    Active = case env:get(lev_break_active) of
                 A when is_integer(A) -> A;
                 _ ->
                     env:save(lev_break_active, 0),
                     0
             end,
    case env:get(lev_break_boss_killed_time) of
        BT when is_integer(BT) -> ok;
        _ -> env:save(lev_break_boss_killed_time, 0)
    end,
    Need = get_contribution_need(),
    case env:get(lev_break_boss_killed) of
        0 when Contribution >= Need ->
            case env:get(lev_break_boss_active_time) of
                BAT when is_integer(BAT) -> ok;
                _ ->
                    env:save(lev_break_boss_active_time, date:unixtime())
            end,
            erlang:send_after(5000, self(), {create_boss, 73020});
        1 ->
            erlang:send_after(5000, self(), {create_boss, 73030});
        _ -> ok
    end,
    State = next_refreshing(#state{contribution =
                                       Contribution,
                                   boss_killed = BossKiled, active = Active}),
    logger:info("启动完成", [], lev_break, 645),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({contribute, AddNum},
            State = #state{contribution = Num,
                           boss_id = OldBossId = {0, 0}, active = 1}) ->
    NewNum = Num + AddNum,
    env:save(lev_break_contribution, NewNum),
    role_group:apply(world, {lev_break, push, [17404]}),
    BossId = case NewNum >= get_contribution_need() andalso
                      env:get(lev_break_boss_killed) =:= 0
                 of
                 true ->
                     MailInfo = #{items => [], title => lang:get("边界恶魔求援"),
                                  content =>
                                      notice:format(lang:get("感谢所有100级强者的努力，链接星界的星途已经成功重筑！但是重筑的星途引来了强大的~ts，"
                                                             "他们就是封锁世界等级，制造突破壁障的罪魁祸首！现在向所有100级强者发出求援，请尽快组织队"
                                                             "伍向他们发起进攻，只要有~ts击败边界恶魔，就可以彻底驱逐他们，~ts世界等级！谁能铲除恶"
                                                             "魔，获得~ts的救世殊荣，让我们拭目以待！"),
                                                    [{string_2,
                                                      6,
                                                      lang:get("边界恶魔")},
                                                     {string_2,
                                                      5,
                                                      lang:get("一个队伍")},
                                                     {string_2,
                                                      5,
                                                      lang:get("开放100级")},
                                                     {string_2,
                                                      5,
                                                      lang:get("独一无二")}])},
                     mail:send(get_qualified_ids(95), MailInfo),
                     clear_units(),
                     Msg =
                         notice:format(lang:get("异变骤生！重筑的星途引来了~ts的入侵，他们就是封锁等级的罪魁祸首！圣心城擂台处，看看哪队"
                                                "强者可以抢先击杀他们，获得这独一无二的~ts！"),
                                       [{string_2, 1, lang:get("边界恶魔")},
                                        {string_2, 1, lang:get("救世殊荣")}]),
                     notice:cast(all, 10, Msg),
                     env:save(lev_break_boss_active_time, date:unixtime()),
                     create_boss(73020);
                 _ -> OldBossId
             end,
    {noreply,
     State#state{contribution = NewNum, boss_id = BossId}};
handle_info({contribute, _}, State) -> {noreply, State};
handle_info({active, Pid, Name},
            State = #state{active = 0}) ->
    env:save(lev_break_active, 1),
    MailInfo = #{items => [], title => lang:get("重筑星途计划启动"),
                 content =>
                     notice:format(lang:get("~ts在剑圣指引下正式启动了“重筑星途”任务，所有~ts级强者可参与~ts收集活动。据推算"
                                            "：每天~ts，三个时段都将会有星光碎片降落于穹顶通道。只有~ts级强者能够捕获。"),
                                   [{role_2, Name},
                                    {string_2, 1, lang:get("100")},
                                    {item_2, 23700},
                                    {string_2,
                                     1,
                                     lang:get("11：30-12：30，15：30-16：30，22：30-23：30")},
                                    {string_2, 1, lang:get("100")}])},
    mail:send(get_qualified_ids(95), MailInfo),
    Msg =
        notice:format(lang:get("~ts在剑圣指引下正式启动“重筑星途”，敲响新世界的大门！所有~ts级勇士可参与~ts收集"
                               "活动，请留意刷新公告！"),
                      [{role_2, Name},
                       {string_2, 1, lang:get("100")},
                       {item_2, 23700}]),
    notice:cast(all, 10, Msg),
    State1 = next_refreshing(State#state{active = 1}),
    role_trigger:async_fire(Pid, #evt_lev_break_active{}),
    {noreply, State1};
handle_info({active, _, _}, State) -> {noreply, State};
handle_info(unactive,
            State = #state{boss_id = BossId}) ->
    unit_mgr:remove(BossId),
    env:save(lev_break_active, 0),
    env:save(lev_break_boss_killed, 0),
    env:save(lev_break_contribution, 0),
    State1 = next_refreshing(State#state{active = 0,
                                         boss_killed = 0, contribution = 0,
                                         boss_id = {0, 0}}),
    role_group:apply(world, {lev_break, push, [17404]}),
    {noreply, State1};
handle_info(unactive, State) -> {noreply, State};
handle_info(refresh_unit,
            State = #state{active = 1, boss_id = {0, 0},
                           refresh_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    refresh_unit(),
    State1 = next_refreshing(State),
    {noreply, State1};
handle_info(refresh_unit, State) -> {noreply, State};
handle_info(start_refresh,
            State = #state{active = 1, boss_id = {0, 0},
                           refresh_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    refresh_unit(),
    Msg =
        notice:format(lang:get("流星闪耀，穹顶通道降下了大量~ts，请100级勇士速速前往收集，重筑星途！"),
                      [{item_2, 23700}]),
    notice:cast(all, 5, Msg),
    State1 = next_refreshing(State),
    {noreply, State1};
handle_info(start_refresh, State) -> {noreply, State};
handle_info({create_boss, BaseId},
            State = #state{boss_id = {0, 0}}) ->
    BossId = create_boss(BaseId),
    {noreply, State#state{boss_id = BossId}};
handle_info({create_boss, _}, State) ->
    {noreply, State};
handle_info({kill_boss_fail, 73020, RoleName},
            State = #state{boss_killed = 0}) ->
    Msg =
        notice:format(lang:get("边界恶魔：~ts，再练100年也别想打败我！这个世界只有蝼蚁吗！"),
                      [{role_2, RoleName}]),
    notice:cast(all, 5, Msg),
    {noreply, State};
handle_info({kill_boss_fail, _, _}, State) ->
    {noreply, State};
handle_info({kill_boss, 73020, Winner},
            State = #state{boss_id = OldBossId, boss_killed = 0}) ->
    unit_mgr:remove(OldBossId),
    env:save(lev_break_boss_killed, 1),
    env:save(lev_break_boss_killed_time, date:unixtime()),
    world_lev:reset(),
    [begin
         Msg =
             notice:format(lang:get("~ts与队友殊死拼搏，终于战胜恐怖的边界恶魔，使世界等级提升至100级，获得了终生成就！"),
                           [{role_2, Name0}]),
         notice:cast(all, 5, Msg)
     end
     || #fighter{name = Name0, type = 1} <- Winner],
    Msg1 =
        notice:format(lang:get("~ts成功重筑，~ts被消灭，满级强者联手打破了等级壁垒。从此以后，强者们可~ts，向更高"
                               "的等级进发！"),
                      [{string_2, 1, lang:get("星途")},
                       {string_2, 6, lang:get("边界恶魔")},
                       {string_2, 1, lang:get("突破100级")}]),
    notice:cast(all, 10, Msg1),
    Content = case [{role_2, Name}
                    || #fighter{name = Name, type = 1} <- Winner]
                  of
                  Names = [_, _, _] ->
                      notice:format(lang:get("~ts、~ts、~ts穷尽所有，拼上性命地战斗，终于在全世界的瞩目与支持下战胜了~ts。成"
                                             "功打破了封锁世界等级的壁障，世界等级自此达到了100级！自此以后，所有100级强者都可以通"
                                             "过自身努力，突破实力限制，超越~ts通往更高的境界！"),
                                    Names ++
                                        [{string_2, 6, lang:get("边界恶魔")},
                                         {string_2, 5, lang:get("100级")}]);
                  Names = [_, _, _, _] ->
                      notice:format(lang:get("~ts、~ts、~ts、~ts穷尽所有，拼上性命地战斗，终于在全世界的瞩目与支持下战胜了~"
                                             "ts。成功打破了封锁世界等级的壁障，世界等级自此达到了100级！自此以后，所有100级强者"
                                             "都可以通过自身努力，突破实力限制，超越~ts通往更高的境界！"),
                                    Names ++
                                        [{string_2, 6, lang:get("边界恶魔")},
                                         {string_2, 5, lang:get("100级")}]);
                  Names = [_, _, _, _, _] ->
                      notice:format(lang:get("~ts、~ts、~ts、~ts、~ts穷尽所有，拼上性命地战斗，终于在全世界的瞩目与支持下"
                                             "战胜了~ts。成功打破了封锁世界等级的壁障，世界等级自此达到了100级！自此以后，所有10"
                                             "0级强者都可以通过自身努力，突破实力限制，超越~ts通往更高的境界！"),
                                    Names ++
                                        [{string_2, 6, lang:get("边界恶魔")},
                                         {string_2, 5, lang:get("100级")}]);
                  _ ->
                      notice:format(lang:get("~ts穷尽所有，拼上性命地战斗，终于在全世界的瞩目与支持下战胜了~ts。成功打破了封锁世界"
                                             "等级的壁障，世界等级自此达到了100级！自此以后，所有100级强者都可以通过自身努力，突破"
                                             "实力限制，超越~ts通往更高的境界！"),
                                    [{role_2, lang:get("神秘人")},
                                     {string_2, 6, lang:get("边界恶魔")},
                                     {string_2, 5, lang:get("100级")}])
              end,
    MailInfo = #{items => [], title => lang:get("世界等级突破"),
                 content => Content},
    mail:send(get_qualified_ids(95), MailInfo),
    BossId = create_boss(73030),
    {noreply,
     State#state{boss_id = BossId, boss_killed = 1}};
handle_info(world_notice,
            State = #state{boss_killed = 1}) ->
    {noreply, State};
handle_info(world_notice,
            State = #state{boss_killed = 0}) ->
    Msg =
        notice:format(lang:get("~ts：卑微的生物，就眼睁睁看着我蹂躏你们的世界吧！~ts"),
                      [{string_2, 1, lang:get("边界恶魔")},
                       {string_2,
                        1,
                        lang:get("（击杀圣心城擂台处的边界恶魔，可推进世界等级到100级）")}]),
    notice:cast(all, 5, Msg),
    erlang:send_after(3600 * 1000, self(), world_notice),
    {noreply, State};
handle_info({kill_boss, _, _}, State) ->
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

list_goal(Role = #role{m_lev_break =
                           #m_lev_break{times = Times}}) ->
    list_goal(lev_break_data:list_goal(Times + 1), Role).

list_goal([], _) -> [];
list_goal([Id | T], Role) ->
    case lev_break_data:get_goal(Id) of
        #{progress := Progress} ->
            Progress1 = quest_prog_init:do(Role, Progress, Id),
            Finish = case [false
                           || #quest_progress{finish = 0} <- Progress1]
                         of
                         [] -> 1;
                         _ -> 0
                     end,
            [{Id, Progress1, Finish} | list_goal(T, Role)];
        _ ->
            logger:error("缺少配置 ~w", [Id], lev_break, 814),
            list_goal(T, Role)
    end.

check_fight([], _, Args) -> {ok, Args};
check_fight([goals | T], Role, Args) ->
    case [Id || {Id, _, 0} <- list_goal(Role), Id =/= 1008]
        of
        [Id | _] ->
            {false,
             notice:format(lang:get("~ts还没完成"),
                           [{string_2, 5, get_goal_name(Id)}])};
        _ -> check_fight(T, Role, Args)
    end;
check_fight([team_trial | T], Role, Args) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            case [N
                  || #team_mate{lev_break_times = BreakTimes, lev = Lev,
                                name = N}
                         <- Mates,
                     Lev + 6 * BreakTimes < 98]
                of
                Names = [_ | _] ->
                    {false,
                     notice:format(lang:get("~ts等级不足~ts级不能发起战斗"),
                                   [{role_2, Names}, {string_2, 5, 98}])};
                _ -> check_fight(T, Role, Args#{mates => Mates})
            end;
        _ -> {false, lang:get("不能发起战斗")}
    end;
check_fight([team | T], Role, Args) ->
    case team:get_fighters(Role) of
        {ok, Mates} when Mates > 2 ->
            check_fight(T, Role, Args#{mates => Mates});
        _ -> {false, lang:get("要三人以上才可以挑战哦")}
    end;
check_fight([combat_self | T], Role, Args) ->
    case combat_mgr:check_self(45, Role) of
        true -> check_fight(T, Role, Args);
        {false, Reason} -> {false, Reason}
    end.

get_goal_name(Id) ->
    case lev_break_data:get_goal(Id) of
        #{name := Name} -> Name;
        _ -> ""
    end.

next_refreshing(State = #state{active = 1,
                               boss_id = {0, 0}}) ->
    {RefreshType, Timeout} = get_next_time(),
    Ref = erlang:send_after(Timeout * 1000,
                            self(),
                            RefreshType),
    State#state{refresh_ref = Ref};
next_refreshing(State) -> State.

get_next_time() ->
    {_, Time} = date:seconds_to_datetime(date:unixtime()),
    Secs = calendar:time_to_seconds(Time),
    case lev_break_data:get_refreshing(Secs) of
        #{frequence := Timeout} -> {refresh_unit, Timeout};
        _ ->
            Hs = [calendar:seconds_to_time(S)
                  || S <- lev_break_data:get_hours()],
            {start_refresh, date:next_diff(Hs)}
    end.

refresh_unit() ->
    {_, Time} = date:seconds_to_datetime(date:unixtime()),
    Secs = calendar:time_to_seconds(Time),
    case lev_break_data:get_refreshing(Secs) of
        #{maps := Maps, units := Units} ->
            Num = count_units_remain(Maps, Units, 0),
            Map = util:rand_list(Maps),
            create_units(10 - Num, Map, Units);
        _ -> logger:debug("没有配置 ~w", [Secs], lev_break, 891)
    end.

count_units_remain([], _, Num) -> Num;
count_units_remain([MapId | T], Units, Num) ->
    Remain = case map_mgr:pid(MapId) of
                 {ok, MapPid} ->
                     case map:unit_list(MapPid) of
                         {ok, L} ->
                             length([Uid
                                     || #map_unit{id = Uid, base_id = BaseId}
                                            <- L,
                                        lists:member(BaseId, Units)]);
                         _ -> 0
                     end;
                 _ -> 0
             end,
    count_units_remain(T, Units, Remain + Num).

create_units(Num, _, _) when Num < 1 -> ok;
create_units(Num, MapId, Units) ->
    BaseId = util:rand_list(Units),
    {X, Y} = map:rand_pos(MapId),
    unit_mgr:create(37, BaseId, {MapId, X, Y}),
    create_units(Num - 1, MapId, Units).

create_boss(BaseId) ->
    case lev_break_data:get_boss(BaseId) of
        #{map := MapId, x := X, y := Y} ->
            case unit_mgr:create({36, BaseId},
                                 BaseId,
                                 {MapId, X, Y})
                of
                {ok, _} ->
                    case BaseId of
                        73020 ->
                            erlang:send_after(3600 * 1000,
                                              self(),
                                              world_notice);
                        _ -> ignore
                    end,
                    {36, BaseId};
                _ -> {0, 0}
            end;
        _ ->
            logger:error("找不到boss数据 ~w", [BaseId], lev_break, 932),
            {0, 0}
    end.

get_contribution_need() ->
    case lev_break_data:get_goal(1001) of
        #{progress := Progress} ->
            case lists:keyfind(evt_lev_break_contribution,
                               #quest_progress.label,
                               Progress)
                of
                #quest_progress{target_val = TargetVal} -> TargetVal;
                _ -> 100000000
            end;
        _ -> 100000000
    end.

get_add_point(Times) ->
    case lev_break_data:get_times(Times) of
        #{attr_point := AttrPoint} -> AttrPoint;
        _ -> 0
    end.

acc_loss(Point, Have, Loss) when Point =< Have ->
    format:val_to_loss(Loss);
acc_loss(Point, Have, Loss) ->
    case lev_break_data:get_exchange(Point) of
        [H | T] ->
            Loss1 = do_acc_loss([H | T], Loss),
            acc_loss(Point - 1, Have, Loss1);
        _ ->
            logger:error("点数没有配置消耗 ~w", [Point], lev_break, 963),
            acc_loss(Point - 1, Have, Loss)
    end.

do_acc_loss([], Loss) -> Loss;
do_acc_loss([{I, N} | T], Loss) ->
    case lists:keyfind(I, 1, Loss) of
        {I, V} ->
            do_acc_loss(T,
                        lists:keyreplace(I, 1, Loss, {I, N + V}));
        _ -> do_acc_loss(T, [{I, N} | Loss])
    end.

get_max_exchange(Times) ->
    case lev_break_data:get_times(Times) of
        #{max_exchange := Max} -> Max;
        _ -> 0
    end.

clear_units() ->
    Clears = lev_break_data:get_clears(),
    clear_units(Clears).

clear_units([]) -> ok;
clear_units([#{maps := Maps, units := Units} | T]) ->
    clear_units(Maps, Units),
    clear_units(T).

clear_units([], _) -> ok;
clear_units([MapId | T], Units) ->
    case map_mgr:pid(MapId) of
        {ok, MapPid} ->
            case map:unit_list(MapPid) of
                {ok, L} ->
                    [unit_mgr:remove(Uid)
                     || #map_unit{id = Uid, base_id = BaseId} <- L,
                        lists:member(BaseId, Units)];
                _ -> ok
            end;
        _ -> ok
    end,
    clear_units(T, Units).

get_qualified_ids(MailLev) ->
    Conds = [{'>=', '$2', MailLev}],
    MatchSpec = [{#robot_role{id = '$1', lev = '$2',
                              _ = '_'},
                  Conds,
                  ['$1']}],
    ets:select(robot_role, MatchSpec).

get_difficulty(U) ->
    Day = get_boss_active_day(),
    case lev_break_data:get_difficulty(Day) of
        #{attr := Attr0} ->
            case unit_convert:to(fighter, U) of
                {ok, Fighter = #fighter{slave = Slave}} ->
                    NewSlave = [{P,
                                 I,
                                 N,
                                 O,
                                 {lev_break, treat_slave_attr, [Attr0]}}
                                || {P, I, N, O} <- Slave],
                    [Fighter#fighter{attr =
                                         {lev_break, treat_unit_attr, [Attr0]},
                                     slave = NewSlave}];
                _R ->
                    logger:error("单位转换失败 ~w", [_R], lev_break, 1019),
                    []
            end;
        _Else ->
            logger:debug("获取难度失败 ~w ~w",
                         [Day, _Else],
                         lev_break,
                         1023),
            [U]
    end.

do_attr([], Attr) -> Attr;
do_attr([{51, Rate} | T], Attr = #attr{hp_max = Val}) ->
    do_attr(T, Attr#attr{hp_max = round(Val * Rate / 100)});
do_attr([{52, Rate} | T], Attr = #attr{mp_max = Val}) ->
    do_attr(T, Attr#attr{mp_max = round(Val * Rate / 100)});
do_attr([{53, Rate} | T],
        Attr = #attr{atk_speed = Val}) ->
    do_attr(T,
            Attr#attr{atk_speed = round(Val * Rate / 100)});
do_attr([{54, Rate} | T],
        Attr = #attr{phy_dmg = Val}) ->
    do_attr(T,
            Attr#attr{phy_dmg = round(Val * Rate / 100)});
do_attr([{55, Rate} | T],
        Attr = #attr{magic_dmg = Val}) ->
    do_attr(T,
            Attr#attr{magic_dmg = round(Val * Rate / 100)});
do_attr([{56, Rate} | T],
        Attr = #attr{phy_def = Val}) ->
    do_attr(T,
            Attr#attr{phy_def = round(Val * Rate / 100)});
do_attr([{57, Rate} | T],
        Attr = #attr{magic_def = Val}) ->
    do_attr(T,
            Attr#attr{magic_def = round(Val * Rate / 100)});
do_attr([{58, Rate} | T], Attr = #attr{crit = Val}) ->
    do_attr(T, Attr#attr{crit = round(Val * Rate / 100)});
do_attr([{59, Rate} | T],
        Attr = #attr{tenacity = Val}) ->
    do_attr(T,
            Attr#attr{tenacity = round(Val * Rate / 100)});
do_attr([{23, Rate} | T],
        Attr = #attr{dmg_ratio = Val}) ->
    do_attr(T, Attr#attr{dmg_ratio = Val + Rate});
do_attr([{24, Rate} | T],
        Attr = #attr{def_ratio = Val}) ->
    do_attr(T, Attr#attr{def_ratio = Val + Rate});
do_attr([{25, Rate} | T],
        Attr = #attr{enhance_control = Val}) ->
    do_attr(T, Attr#attr{enhance_control = Val + Rate});
do_attr([{26, Rate} | T],
        Attr = #attr{anti_control = Val}) ->
    do_attr(T, Attr#attr{anti_control = Val + Rate});
do_attr([{Type, Rate} | T], Attr) ->
    logger:error("未知属性 ~w, ~w",
                 [Type, Rate],
                 lev_break,
                 1068),
    do_attr(T, Attr).

create_help_team(Role = #role{m_team =
                                  #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    case team_mgr:lookup_recruit(Pid) of
        {ok, _} -> ok;
        _ -> create_team_recruit(Role)
    end,
    {ok, Role};
create_help_team(Role) ->
    case team_mgr:create(Role) of
        {ok, TeamRole} ->
            create_team_recruit(TeamRole),
            {ok, TeamRole};
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("公会求助失败，未能创建队伍")}
    end.

create_team_recruit(Role) ->
    case team_data:recruit_type_list(26) of
        [#{id := Id,
           lev_recruit :=
               [#team_recruit_lev_range{flag = Flag} | _]}] ->
            team:recruit(Role, Id, Flag);
        _ -> ok
    end.

check_join_team(#role{lev = Lev, s_event = Event,
                      m_lev_break = #m_lev_break{times = Times}})
    when Lev + 6 * Times >= 98 andalso
             (Event =:= 0 orelse Event =:= 2) ->
    true;
check_join_team(_Role) ->
    {false,
     notice:format(lang:get("等级不足~ts级，不能加入队伍"),
                   [{string_2, 5, 98}])}.

