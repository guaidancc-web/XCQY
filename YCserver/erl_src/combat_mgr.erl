-file("src/mod/combat/combat_mgr.erl", 1).

-module(combat_mgr).

-behaviour(gen_server).

-export([start_link/1,
         init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_combat/3,
         start_combat/4,
         stop_combat/1,
         stop_combat/2,
         stop_combat/4,
         kill_npc/3,
         kill_npc/4,
         kill_npc/5,
         check_self/2,
         check_self/3,
         check_target/2,
         check/3,
         add_challenge/2,
         agree_challenge/4,
         do_sync_check/3,
         start_trans/1,
         end_trans/2,
         to_fighters/2,
         cast/1]).

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

-file("src/mod/combat/combat_mgr.erl", 40).

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

-file("src/mod/combat/combat_mgr.erl", 41).

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

-file("src/mod/combat/combat_mgr.erl", 42).

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

-file("src/mod/combat/combat_mgr.erl", 43).

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

-file("src/mod/combat/combat_mgr.erl", 44).

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

-file("src/mod/combat/combat_mgr.erl", 45).

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

-file("src/mod/combat/combat_mgr.erl", 46).

-file("inc/formation.hrl", 1).

-record(m_formation,
        {id = 1, lev = 1, pos = 1, forms = [], team_form = []}).

-record(formation, {id = 0, lev = 0, exp = 0}).

-record(formation_data,
        {id = 0,
         type = 1,
         lev = 0,
         max_lev = 1,
         name = "",
         pos_desc = [],
         attr_1 = [],
         attr_2 = [],
         attr_3 = [],
         attr_4 = [],
         attr_5 = [],
         pet_attr = [],
         strong_restrain = [],
         weak_restrain = [],
         next_exp = 0,
         need_item = [],
         item_id = 0}).

-file("src/mod/combat/combat_mgr.erl", 47).

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

-file("src/mod/combat/combat_mgr.erl", 48).

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

-file("src/mod/combat/combat_mgr.erl", 49).

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

-file("src/mod/combat/combat_mgr.erl", 50).

-record(state, {challenge = [], type = normal}).

cast(Msg) -> gen_server:cast(combat_mgr, Msg).

-spec start_combat(CombatType, Attacker,
                   Defender) -> {ok, pid()} |
                                {false, term()} when CombatType ::
                                                         non_neg_integer(),
                                                     Attacker :: #role{} |
                                                                 #unit{} |
                                                                 #fighter_wrap{} |
                                                                 {non_neg_integer(),
                                                                  list(),
                                                                  non_neg_integer()} |
                                                                 [{non_neg_integer(),
                                                                   list(),
                                                                   non_neg_integer()}] |
                                                                 {unit_baseid,
                                                                  non_neg_integer()},
                                                     Defender :: #role{} |
                                                                 #unit{} |
                                                                 #fighter_wrap{} |
                                                                 {non_neg_integer(),
                                                                  list(),
                                                                  non_neg_integer()} |
                                                                 [{non_neg_integer(),
                                                                   list(),
                                                                   non_neg_integer()}] |
                                                                 {unit_baseid,
                                                                  non_neg_integer()}.

start_combat(CombatType, Attacker, Defender) ->
    start_combat(CombatType,
                 Attacker,
                 Defender,
                 #combat_start_args{}).

start_combat(CombatType, Attacker, Defender,
             StartArgs) ->
    Attackers = to_fighters([CombatType], Attacker),
    Defenders = to_fighters([CombatType], Defender),
    case combat:start(CombatType,
                      Attackers,
                      Defenders,
                      StartArgs)
        of
        {ok, CombatPid} ->
            ok,
            {ok, CombatPid};
        {error, Reason} ->
            logger:error("发起[Type=~w]的战斗失败:~ts",
                         [CombatType, Reason],
                         combat_mgr,
                         86),
            {false, lang:get("发起战斗失败")}
    end.

kill_npc(Role, AtkList, {BattleId, UnitId}) ->
    case unit_mgr:info({BattleId, UnitId}) of
        {ok, Unit} -> kill_npc(Role, AtkList, Unit);
        _ -> {false, lang:get("找不到目标")}
    end;
kill_npc(Role = #role{m_combat = #m_combat{}}, AtkList,
         Unit = #unit_data{id = UnitBaseId}) ->
    CombatType = combat_util:unit_to_combat_type(Unit),
    case check_self(CombatType, Role) of
        true ->
            CombatArgs = #combat_start_args{},
            case start_combat(CombatType,
                              AtkList,
                              {unit_baseid, UnitBaseId},
                              CombatArgs)
                of
                {ok, _CombatPid} -> {ok};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
kill_npc(Role = #role{m_combat = #m_combat{}}, AtkList,
         Unit = #unit{}) ->
    CombatType = combat_util:unit_to_combat_type(Unit),
    case check_self(CombatType, Role, Unit) of
        true ->
            case check_target(CombatType, Unit) of
                true ->
                    CombatArgs = #combat_start_args{},
                    case start_combat(CombatType, AtkList, Unit, CombatArgs)
                        of
                        {ok, _CombatPid} -> {ok};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

kill_npc(Role = #role{m_combat = #m_combat{}}, AtkList,
         Unit = #unit{}, CombatArgs) ->
    CombatType = combat_util:unit_to_combat_type(Unit),
    case check_self(CombatType, Role, Unit) of
        true ->
            case check_target(CombatType, Unit) of
                true ->
                    case start_combat(CombatType, AtkList, Unit, CombatArgs)
                        of
                        {ok, _CombatPid} -> {ok};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
kill_npc(Role = #role{m_combat = #m_combat{}}, AtkList,
         Unit = #unit_data{id = UnitBaseId}, CombatArgs) ->
    CombatType = combat_util:unit_to_combat_type(Unit),
    case check_self(CombatType, Role) of
        true ->
            case start_combat(CombatType,
                              AtkList,
                              {unit_baseid, UnitBaseId},
                              CombatArgs)
                of
                {ok, _CombatPid} -> {ok};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

kill_npc(Role = #role{m_combat = #m_combat{}}, AtkList,
         #unit_data{id = UnitBaseId}, CombatType, CombatArgs) ->
    case check_self(CombatType, Role) of
        true ->
            case start_combat(CombatType,
                              AtkList,
                              {unit_baseid, UnitBaseId},
                              CombatArgs)
                of
                {ok, _CombatPid} -> {ok};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
kill_npc(Role = #role{m_combat = #m_combat{}}, AtkList,
         Unit = #unit{}, CombatType, CombatArgs) ->
    case check_self(CombatType, Role, Unit) of
        true ->
            case check_target(CombatType, Unit) of
                true ->
                    case start_combat(CombatType, AtkList, Unit, CombatArgs)
                        of
                        {ok, _CombatPid} -> {ok};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

stop_combat(CombatPid) -> stop_combat(CombatPid, stop).

stop_combat(CombatPid, stop) when is_pid(CombatPid) ->
    CombatPid ! stop;
stop_combat(CombatPid, stop_result)
    when is_pid(CombatPid) ->
    CombatPid ! stop_result;
stop_combat(_, _) -> ok.

stop_combat(by_id, Rid, Platform, ZoneId) ->
    case role_query:attr(by_id,
                         Rid,
                         Platform,
                         ZoneId,
                         [#role.m_combat])
        of
        {ok, [#m_combat{pid = CombatPid}]}
            when is_pid(CombatPid) ->
            CombatPid ! stop;
        {ok, _} ->
            logger:info("不在战斗中，无法停止", [], combat_mgr, 204);
        _ -> logger:info("查找不到角色", [], combat_mgr, 206)
    end;
stop_combat(by_name, RoleName, Platform, ZoneId) ->
    case role_query:attr(by_name,
                         RoleName,
                         Platform,
                         ZoneId,
                         [#role.m_combat])
        of
        {ok, [#m_combat{pid = CombatPid}]}
            when is_pid(CombatPid) ->
            CombatPid ! stop;
        {ok, _} ->
            logger:info("不在战斗中，无法停止", [], combat_mgr, 213);
        _ -> logger:info("查找不到角色", [], combat_mgr, 215)
    end.

start_link(Mod) ->
    gen_server:start_link({local, combat_mgr},
                          combat_mgr,
                          [Mod],
                          []).

add_challenge(Role = #role{id = SroleId, pid = Spid,
                           name = Sname, cross_type = CrossType},
              TroleId) ->
    case check_challenge(Role, TroleId) of
        {true, TargetId, TargetPid} ->
            case CrossType of
                0 ->
                    cast({add_challenge,
                          SroleId,
                          Spid,
                          Sname,
                          TargetId,
                          TargetPid}),
                    {true, lang:get("")};
                1 ->
                    cross:cast(combat_mgr,
                               cast,
                               [{add_challenge,
                                 SroleId,
                                 Spid,
                                 Sname,
                                 TargetId,
                                 TargetPid}]),
                    {true, lang:get("")};
                _ -> {false, lang:get("当前状态不能发起切磋")}
            end;
        {false, Reason} -> {false, Reason}
    end.

agree_challenge(#role{id = Tid, pid = Tpid,
                      name = Tname},
                0, IsCross, Sid) ->
    case IsCross of
        1 ->
            cross:cast(combat_mgr,
                       cast,
                       [{agree_challenge, 0, Sid, Tid, Tpid, Tname}]);
        0 -> cast({agree_challenge, 0, Sid, Tid, Tpid, Tname})
    end,
    ok;
agree_challenge(Role = #role{id = Tid, pid = Tpid,
                             name = Tname, cross_type = CrossType},
                1, IsCross, Sid) ->
    case team:get_status(Role) of
        {true, 2} -> {false, lang:get("跟随状态下, 无法切磋")};
        _ ->
            case check_self(6, Role) of
                true ->
                    case IsCross of
                        0 ->
                            cast({agree_challenge, 1, Sid, Tid, Tpid, Tname}),
                            ok;
                        1 ->
                            Result = case CrossType of
                                         0 ->
                                             case c_trip_mgr:enter(Role) of
                                                 {ok, NewRole} -> {ok, NewRole};
                                                 {false, Reason} ->
                                                     {false, Reason}
                                             end;
                                         1 -> {ok, Role}
                                     end,
                            case Result of
                                {ok, Role1} ->
                                    case check_self(6, Role1) of
                                        true ->
                                            cross:cast(combat_mgr,
                                                       cast,
                                                       [{agree_challenge,
                                                         1,
                                                         Sid,
                                                         Tid,
                                                         Tpid,
                                                         Tname}]),
                                            {ok, Role1};
                                        {false, Reason1} -> {false, Reason1}
                                    end;
                                {false, Reason2} -> {false, Reason2}
                            end
                    end;
                {false, Reason} -> {false, Reason}
            end
    end.

init([Mod]) ->
    logger:info("[~w] 正在启动...",
                [combat_mgr],
                combat_mgr,
                297),
    process_flag(trap_exit, true),
    erlang:send_after(60 * 1000, self(), check_expire),
    Type = case Mod of
               center -> center;
               big_world -> big_world;
               _ -> normal
           end,
    State = #state{type = Type},
    logger:info("[~w] 启动完成", [combat_mgr], combat_mgr, 306),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({add_challenge,
             Sid,
             Spid,
             Sname,
             Tid,
             Tpid},
            State = #state{challenge = Challenge, type = Type}) ->
    Now = date:unixtime(),
    Key = {Sid, Tid},
    IsCross = case Type of
                  normal -> 0;
                  _ -> 1
              end,
    case lists:keyfind(Key, 1, Challenge) of
        false ->
            NewChallenge = [{Key, Now} | Challenge],
            notice:send({pid, Spid}, 1, lang:get("发起切磋成功，请等待对方回应")),
            challenge_info(Sid, Sname, Tid, Tpid, IsCross),
            {noreply, State#state{challenge = NewChallenge}};
        _ ->
            NewChallenge = lists:keystore(Key,
                                          1,
                                          Challenge,
                                          {Key, Now}),
            notice:send({pid, Spid}, 1, lang:get("发起切磋成功，请等待对方回应")),
            challenge_info(Sid, Sname, Tid, Tpid, IsCross),
            {noreply, State#state{challenge = NewChallenge}}
    end;
handle_cast({agree_challenge,
             0,
             Sid,
             Tid,
             _Tpid,
             Tname},
            State = #state{challenge = Challenge}) ->
    Key = {Sid, Tid},
    NewChallenge = lists:keydelete(Key, 1, Challenge),
    case role_query:pid(by_id, Sid) of
        {ok, Spid} ->
            Msg = notice:format(lang:get("~ts拒绝了与你进行切磋"),
                                [{role_2, Tname}]),
            notice:send({pid, Spid}, 1, Msg);
        _ -> skip
    end,
    {noreply, State#state{challenge = NewChallenge}};
handle_cast({agree_challenge,
             1,
             Sid,
             Tid,
             Tpid,
             _Tname},
            State = #state{challenge = Challenge,
                           type = ChallengeType}) ->
    Key = {Sid, Tid},
    Now = date:unixtime(),
    case lists:keyfind(Key, 1, Challenge) of
        {_, Time} when Now =< Time + 60 ->
            CombatType = 6,
            case sync_check(CombatType, Sid, ChallengeType) of
                {true, STeamPid} ->
                    case sync_check(CombatType, Tid, ChallengeType) of
                        {true, TTeamPid} ->
                            {Flag1, AtkList} = team:get_fighters(Sid, STeamPid),
                            {Flag2, DfdList} = team:get_fighters(Tid, TTeamPid),
                            case Flag1 =:= ok andalso Flag2 =:= ok of
                                true ->
                                    case start_combat(CombatType,
                                                      AtkList,
                                                      DfdList)
                                        of
                                        {ok, _Pid} -> ok;
                                        _ ->
                                            notice:send({pid, Tpid},
                                                        1,
                                                        lang:get("对方正忙，发起战斗失败"))
                                    end;
                                false ->
                                    notice:send({pid, Tpid},
                                                1,
                                                lang:get("切磋信息发生变化, 无法继续"))
                            end;
                        {false, Reason} -> notice:send({pid, Tpid}, 1, Reason)
                    end;
                {false, Reason} -> notice:send({pid, Tpid}, 1, Reason)
            end;
        _ -> notice:send({pid, Tpid}, 1, lang:get("切磋已过期"))
    end,
    NewChallenge = lists:keydelete(Key, 1, Challenge),
    {noreply, State#state{challenge = NewChallenge}};
handle_cast(Msg, State) ->
    logger:error("收到未知消息:~w", [Msg], combat_mgr, 390),
    {noreply, State}.

handle_info(check_expire,
            State = #state{challenge = Challenge}) ->
    Now = date:unixtime(),
    NewChallenge = [{Key, Time}
                    || {Key, Time} <- Challenge, Time + 60 > Now],
    erlang:send_after(60 * 1000, self(), check_expire),
    {noreply, State#state{challenge = NewChallenge}};
handle_info(Info, State) ->
    logger:error("收到未知消息:~w", [Info], combat_mgr, 400),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [combat_mgr],
                combat_mgr,
                404),
    logger:info("[~w] 关闭完成", [combat_mgr], combat_mgr, 405),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

to_fighters(_, {Id, Platform, ZoneId}) ->
    do_to_fighters([{Id, Platform, ZoneId}], []);
to_fighters(_, {unit_baseid, UnitBaseId}) ->
    do_to_fighters([{unit_baseid, UnitBaseId}], []);
to_fighters(_CombatType,
            Role = #role{s_event = Event}) ->
    case Event of
        25 when _CombatType =/= [40] ->
            logger:error("在武道会中~w发起其他战斗 ~w",
                         [Event, _CombatType],
                         combat_mgr,
                         422);
        24 when _CombatType =/= [40] ->
            logger:error("在武道会中~w发起其他战斗 ~w",
                         [Event, _CombatType],
                         combat_mgr,
                         424);
        _ -> ok
    end,
    do_to_fighters([Role], []);
to_fighters(_, Unit = #unit{}) ->
    Members = [],
    do_to_fighters([Unit | Members], []);
to_fighters([_CombatType = 58],
            [FighterWrap = #fighter_wrap{fighter =
                                             #fighter{active_guard =
                                                          ActiveGuard},
                                         s_event = _Event}
             | T]) ->
    List1 = case do_to_fighters([FighterWrap], []) of
                [NF] -> [NF#fighter{active_guard = ActiveGuard}];
                List -> List
            end,
    List1 ++ do_to_fighters(T, []);
to_fighters(_CombatType,
            FighterWrap = #fighter_wrap{s_event = Event}) ->
    case Event of
        25 when _CombatType =/= [40] ->
            logger:error("在武道会中~w发起其他战斗 ~w",
                         [Event, _CombatType],
                         combat_mgr,
                         442);
        24 when _CombatType =/= [40] ->
            logger:error("在武道会中~w发起其他战斗 ~w",
                         [Event, _CombatType],
                         combat_mgr,
                         444);
        _ -> ok
    end,
    do_to_fighters([FighterWrap], []);
to_fighters(_, L) when is_list(L) ->
    do_to_fighters(L, []);
to_fighters(_, F = #fighter{}) -> [F];
to_fighters(_, _) -> [].

do_to_fighters([], Result) -> lists:reverse(Result);
do_to_fighters([{leader, Role = #role{}, GuardPosList}
                | T],
               Result) ->
    case role_convert:to(fighter, Role) of
        {ok, F} ->
            NewF = combat_guard:update_fighter_guard(F,
                                                     GuardPosList),
            do_to_fighters(T, [NewF | Result]);
        _Err ->
            logger:error("转换参战者失败:~w", [_Err], combat_mgr, 463),
            do_to_fighters(T, Result)
    end;
do_to_fighters([{leader,
                 #fighter_wrap{fighter = F},
                 GuardPosList}
                | T],
               Result) ->
    NewF = combat_guard:update_fighter_guard(F,
                                             GuardPosList),
    do_to_fighters(T, [NewF | Result]);
do_to_fighters([{leader,
                 {Rid, Plat, ZoneId},
                 GuardPosList}
                | T],
               Result) ->
    case big_world:call(Plat,
                        ZoneId,
                        role_query,
                        rec,
                        [by_id, Rid, Plat, ZoneId, fighter])
        of
        {ok, F} ->
            NewF = combat_guard:update_fighter_guard(F,
                                                     GuardPosList),
            do_to_fighters(T, [NewF | Result]);
        _Err ->
            logger:error("转换参战者失败:~w", [_Err], combat_mgr, 475),
            do_to_fighters(T, Result)
    end;
do_to_fighters([#team_mate{id = {Rid, Platform, ZoneId}}
                | T],
               Result) ->
    ModuleName = case env:get(is_center) of
                     true -> cross;
                     _ -> big_world
                 end,
    case ModuleName:call(Platform,
                         ZoneId,
                         role_query,
                         rec,
                         [by_id, Rid, Platform, ZoneId, fighter_wrap])
        of
        {ok, #fighter_wrap{fighter = F}} ->
            NewF = combat_guard:update_fighter_guard(F),
            do_to_fighters(T, [NewF | Result]);
        _ ->
            logger:error("根据[~w, ~ts, ~w]查找不到角色信息",
                         [Rid, Platform, ZoneId],
                         combat_mgr,
                         489),
            do_to_fighters(T, Result)
    end;
do_to_fighters([Role = #role{m_formation =
                                 #m_formation{pos = Pos}}
                | T],
               Result) ->
    case role_convert:to(fighter, Role) of
        {ok, F} ->
            NewF = combat_guard:update_fighter_guard(F),
            do_to_fighters(T, [NewF#fighter{pos = Pos} | Result]);
        _Err ->
            logger:error("转换参战者失败:~w", [_Err], combat_mgr, 498),
            do_to_fighters(T, Result)
    end;
do_to_fighters([Role = #robot_role{m_formation =
                                       #m_formation{pos = Pos}}
                | T],
               Result) ->
    case role_convert:to(fighter, Role) of
        {ok, F} ->
            NewF = combat_guard:update_fighter_guard(F),
            do_to_fighters(T, [NewF#fighter{pos = Pos} | Result]);
        _Err ->
            logger:error("转换参战者失败:~w", [_Err], combat_mgr, 507),
            do_to_fighters(T, Result)
    end;
do_to_fighters([Role = #robot_role{} | T], Result) ->
    case role_convert:to(fighter, Role) of
        {ok, F} ->
            NewF = combat_guard:update_fighter_guard(F),
            do_to_fighters(T, [NewF | Result]);
        _Err ->
            logger:error("转换参战者失败:~w", [_Err], combat_mgr, 516),
            do_to_fighters(T, Result)
    end;
do_to_fighters([{BaseID,
                 Role = #robot_role{m_formation =
                                        #m_formation{pos = Pos}}}
                | T],
               Result) ->
    case role_convert:to(fighter, Role) of
        {ok, F} ->
            NewF = combat_guard:update_fighter_guard(F),
            do_to_fighters(T,
                           [NewF#fighter{base_id = BaseID, pos = Pos}
                            | Result]);
        _Err ->
            logger:error("转换参战者失败:~w", [_Err], combat_mgr, 525),
            do_to_fighters(T, Result)
    end;
do_to_fighters([{unit_baseid, UnitBaseId} | T],
               Result) ->
    case unit_convert:to(unit_base_id_to_fighter,
                         UnitBaseId)
        of
        {ok, F} -> do_to_fighters(T, [F | Result]);
        _Err ->
            logger:error("转换参战者失败[~w:~w]",
                         [UnitBaseId, _Err],
                         combat_mgr,
                         534),
            do_to_fighters(T, Result)
    end;
do_to_fighters([{unit_baseid, UnitBaseId, Pos} | T],
               Result) ->
    case unit_convert:to(unit_base_id_to_fighter,
                         UnitBaseId)
        of
        {ok, F} ->
            do_to_fighters(T, [F#fighter{pos = Pos} | Result]);
        _Err ->
            logger:error("转换参战者失败:~w", [_Err], combat_mgr, 542),
            do_to_fighters(T, Result)
    end;
do_to_fighters([Unit = #unit{} | T], Result) ->
    case unit_convert:to(fighter, Unit) of
        {ok, F} -> do_to_fighters(T, [F | Result]);
        _Err ->
            logger:error("转换参战者失败:~w", [_Err], combat_mgr, 551),
            do_to_fighters(T, Result)
    end;
do_to_fighters([{BaseID, Unit = #unit{}} | T],
               Result) ->
    case unit_convert:to(fighter, Unit) of
        {ok, F} ->
            do_to_fighters(T,
                           [F#fighter{base_id = BaseID} | Result]);
        _Err ->
            logger:error("转换参战者失败:~w", [_Err], combat_mgr, 560),
            do_to_fighters(T, Result)
    end;
do_to_fighters([{Rid, Platform, ZoneId} | T], Result) ->
    case role_query:rec(by_id,
                        Rid,
                        Platform,
                        ZoneId,
                        fighter_wrap)
        of
        {ok, #fighter_wrap{fighter = F}} ->
            NewF = combat_guard:update_fighter_guard(F),
            do_to_fighters(T, [NewF | Result]);
        _ ->
            logger:error("根据[~w, ~ts, ~w]查找不到角色信息",
                         [Rid, Platform, ZoneId],
                         combat_mgr,
                         569),
            do_to_fighters(T, Result)
    end;
do_to_fighters([{{Rid, Platform, ZoneId}, Pos} | T],
               Result) ->
    case role_query:rec(by_id,
                        Rid,
                        Platform,
                        ZoneId,
                        fighter_wrap)
        of
        {ok, #fighter_wrap{fighter = F}} ->
            NewF = combat_guard:update_fighter_guard(F),
            do_to_fighters(T, [NewF#fighter{pos = Pos} | Result]);
        _ ->
            logger:error("根据[~w, ~ts, ~w]查找不到角色信息",
                         [Rid, Platform, ZoneId],
                         combat_mgr,
                         578),
            do_to_fighters(T, Result)
    end;
do_to_fighters([#fighter_wrap{fighter = F} | T],
               Result) ->
    NewF = combat_guard:update_fighter_guard(F),
    do_to_fighters(T, [NewF | Result]);
do_to_fighters([F = #fighter{} | T], Result) ->
    NewF = combat_guard:update_fighter_guard(F),
    do_to_fighters(T, [NewF | Result]);
do_to_fighters([UnitBaseId | T], Result) ->
    case unit_convert:to(fighter, UnitBaseId) of
        {ok, F} -> do_to_fighters(T, [F | Result]);
        _Err ->
            logger:error("转换参战者失败:~w", [_Err], combat_mgr, 593),
            do_to_fighters(T, Result)
    end.

check_challenge(Role, TRoleId) ->
    check_challenge(Role,
                    TRoleId,
                    [self_status, is_local, target_status]).

check_challenge(Role, TRoleId, [self_status | T]) ->
    case role_misc:check_event(Role, [2]) of
        {false, Reason} -> {false, Reason};
        true ->
            case team:get_status(Role) of
                {true, 2} -> {false, lang:get("你在跟随队伍中, 无法发起切磋请求")};
                _ -> check_challenge(Role, TRoleId, T)
            end
    end;
check_challenge(Role = #role{cross_type = CrossType},
                TRoleId, [is_local | T]) ->
    case role_misc:is_cross_role(TRoleId) of
        true ->
            case role_misc:is_local_role(TRoleId) of
                true -> check_challenge(Role, TRoleId, T);
                false when CrossType =:= 1 ->
                    check_challenge(Role, TRoleId, T);
                _ -> {false, lang:get("请先进入跨服再发起跨服切磋")}
            end;
        _ -> {false, lang:get("非同服跨服玩家，无法发起切磋请求")}
    end;
check_challenge(#role{m_team = #m_team{pid = Pid},
                      cross_type = CrossType},
                TRoleId, [target_status]) ->
    case role_query:attr(by_id,
                         TRoleId,
                         [#role.m_team, #role.pid, #role.lev, #role.cross_type])
        of
        {ok, [#m_team{pid = Pid}, _, _ | _]} when is_pid(Pid) ->
            {false, lang:get("不能给同组队员发起切磋")};
        {ok, [_, _, _, 1]} when CrossType =:= 0 ->
            {false, lang:get("对方在跨服区域，请先进入跨服再发起跨服切磋")};
        {ok, [_, _, Lev | _]} when Lev =< 40 ->
            {false, lang:get("无法对低于40级的玩家发起切磋")};
        {ok, [#m_team{pid = TeamPid, status = 2}, _, _ | _]}
            when is_pid(TeamPid) ->
            case team:get_leader(TeamPid) of
                {true, #team_mate{id = LeaderId, pid = LeaderPid}} ->
                    {true, LeaderId, LeaderPid};
                _ -> {false, lang:get("对方队长正在繁忙中, 无法发起请求")}
            end;
        {ok, [#m_team{}, TRpid, _ | _]} ->
            {true, TRoleId, TRpid};
        {error, not_found} -> {false, lang:get("对方不在线，无法发起切磋")};
        _ -> {false, lang:get("系统繁忙, 请稍后尝试")}
    end.

challenge_info(Sid, Sname, _Tid, Tpid, IsCross)
    when is_pid(Tpid) ->
    Data = {Sid, Sname, IsCross},
    role:pack_send(Tpid, 10761, Data),
    ok;
challenge_info(_SroleId, _Sname, _Tid, _Tpid,
               _IsCross) ->
    ok.

start_trans(Role = #role{pos =
                             #pos{map = MapId, x = X, y = Y},
                         s_event = Event})
    when Event =:= 0 orelse Event =:= 2 ->
    case X >= 3180 andalso
             X =< 4205 andalso
                 Y >= 3100 andalso Y =< 3608 andalso MapId =:= 10001
        of
        true -> ok;
        false ->
            case map_trans:trans(Role,
                                 {10001,
                                  util:rand(3180, 4205),
                                  util:rand(3100, 3608)})
                of
                {ok, NewRole} -> {ok, NewRole};
                _Err -> ok
            end
    end;
start_trans(_Role) -> ok.

end_trans(Role = #role{pos =
                           #pos{map = MapId, x = X, y = Y},
                       s_event = 0},
          lose) ->
    case X >= 3180 andalso
             X =< 4205 andalso
                 Y >= 3100 andalso Y =< 3608 andalso MapId =:= 10001
        of
        true ->
            {X1, Y1} = util:rand_list([{3000, 3100},
                                       {4300, 3100},
                                       {3050, 3760}]),
            case map_trans:trans(Role, {10001, X1, Y1}) of
                {ok, NewRole} -> NewRole;
                _Err -> Role
            end;
        false -> Role
    end;
end_trans(Role, _) -> Role.

sync_check(CombatType, RoleId, ChallengeType) ->
    case catch role:apply(sync,
                          RoleId,
                          {combat_mgr,
                           do_sync_check,
                           [CombatType, ChallengeType]})
        of
        {true, TeamPid} -> {true, TeamPid};
        {false, Reason} -> {false, Reason};
        _ -> {false, ""}
    end.

do_sync_check(#role{name = Name,
                    m_combat = #m_combat{pid = CombatPid}},
              _CombatType, _ChallengeType)
    when is_pid(CombatPid) ->
    {ok,
     {false, util:flist(lang:get("~ts在战斗中, 无法发起"), [Name])}};
do_sync_check(#role{name = Name, hp = Hp}, _CombatType,
              _ChallengeType)
    when Hp < 1 ->
    {ok,
     {false,
      util:flist(lang:get("~ts处于死亡状态, 无法发起"), [Name])}};
do_sync_check(#role{name = Name, status = Status},
              _CombatType, _ChallengeType)
    when Status =/= 0 ->
    {ok,
     {false, util:flist(lang:get("~ts当前状态不能发起战斗"), [Name])}};
do_sync_check(#role{name = Name,
                    cross_type = CrossType},
              _CombatType, _ChallengeType = center)
    when CrossType =/= 1 ->
    {ok,
     {false, util:flist(lang:get("~ts不在跨服不能发起战斗"), [Name])}};
do_sync_check(#role{name = Name,
                    cross_type = CrossType},
              _CombatType, _ChallengeType = normal)
    when CrossType =/= 0 ->
    {ok,
     {false, util:flist(lang:get("~ts在跨服不能发起战斗"), [Name])}};
do_sync_check(Role = #role{m_team =
                               #m_team{pid = TeamPid, status = 1},
                           s_event = Event},
              _CombatType, _ChallengeType)
    when is_pid(TeamPid) andalso
             (Event =:= 0 orelse Event =:= 2) ->
    case start_trans(Role) of
        {ok, NewRole} -> {ok, {true, TeamPid}, NewRole};
        _ -> {ok, {true, TeamPid}}
    end;
do_sync_check(Role = #role{s_event = Event},
              _CombatType, _ChallengeType)
    when Event =:= 0 orelse Event =:= 2 ->
    case start_trans(Role) of
        {ok, NewRole} -> {ok, {true, undefined}, NewRole};
        _Err -> {ok, {true, undefined}}
    end;
do_sync_check(#role{name = Name}, _CombatType,
              _ChallengeType) ->
    {ok,
     {false, util:flist(lang:get("~ts当前状态不能发起战斗"), [Name])}}.

check_self(CombatType, Role) ->
    check_self(CombatType, Role, undefined).

check_self(_CombatType, _Role, #unit{status = 2}) ->
    {false, lang:get("目标已在战斗中，无法发起战斗")};
check_self(_CombatType,
           #role{m_combat = #m_combat{pid = CombatPid}}, _)
    when is_pid(CombatPid) ->
    {false, lang:get("目标已在战斗中，无法发起战斗")};
check_self(_CombatType, #role{hp = Hp}, _)
    when Hp < 1 ->
    {false, lang:get("死亡状态下不能发起战斗")};
check_self(_CombatType, #role{status = Status}, _)
    when Status =/= 0 ->
    {false, lang:get("当前状态下不能发起战斗")};
check_self(_CombatType,
           #fighter_wrap{combat_pid = CombatPid}, _)
    when is_pid(CombatPid) ->
    {false, ""};
check_self(_CombatType, #fighter_wrap{status = Status},
           _)
    when Status =/= 0 ->
    {false, lang:get("当前状态下不能发起战斗")};
check_self(_CombatType, _, _) -> true.

check_target(_CombatType,
             #role{m_combat = #m_combat{pid = CombatPid}})
    when is_pid(CombatPid) ->
    {false, lang:get("对方正在战斗中，无法发起战斗")};
check_target(_CombatType,
             #role{s_event = Event, status = Status})
    when Event =/= 0 orelse Status =/= 0 ->
    {false, lang:get("对方当前状态无法对其发起战斗")};
check_target(_CombatType, #role{hp = Hp}) when Hp < 1 ->
    {false, lang:get("不能对死亡目标发起战斗")};
check_target(_CombatType, #role{s_action = 4}) ->
    {false, lang:get("对方当前正在剧情中，不能发起战斗")};
check_target(_CombatType,
             #fighter_wrap{s_action = 4}) ->
    {false, lang:get("对方当前正在剧情中，不能发起战斗")};
check_target(_CombatType,
             #fighter_wrap{combat_pid = CombatPid})
    when is_pid(CombatPid) ->
    {false, lang:get("对方正在战斗中，无法发起战斗")};
check_target(103, #fighter_wrap{}) -> true;
check_target(_CombatType,
             #fighter_wrap{s_event = Event, status = Status})
    when Event =/= 0 orelse Status =/= 0 ->
    {false, lang:get("对方当前状态下无法对其发起战斗")};
check_target(_CombatType, #unit{status = 2}) ->
    {false, lang:get("目标已在战斗中，无法发起战斗")};
check_target(1, #unit{type = UnitType})
    when UnitType =:= 1 orelse
             UnitType =:= 2 orelse UnitType =:= 3 ->
    true;
check_target(_, _) -> true.

check(CombatType, Attacker, Defender) ->
    case check_self(CombatType, Attacker) of
        true ->
            case check_target(CombatType, Defender) of
                true -> true;
                Err -> Err
            end;
        Err -> Err
    end.

