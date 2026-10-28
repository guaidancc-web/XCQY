-file("src/mod/maze/maze.erl", 1).

-module(maze).

-export([init/0,
         init/1,
         login/1,
         push/1,
         reset/1,
         dig/2,
         change/3,
         grab/3,
         grab_over/2,
         get/2,
         get_final/1,
         apperceive/1,
         double/1,
         reward_dragon/1,
         reward_event/2,
         apply_point/1,
         monster_reward/2,
         clean_monster/2,
         combat_start/2,
         combat_over/1,
         combat_over/2,
         apply_evt/2,
         fix_data/1,
         gm/7,
         gm_reset/1,
         gm_data/1,
         gm_test/2]).

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

-file("src/mod/maze/maze.erl", 45).

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

-file("src/mod/maze/maze.erl", 46).

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

-file("src/mod/maze/maze.erl", 47).

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

-file("src/mod/maze/maze.erl", 48).

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

-file("src/mod/maze/maze.erl", 49).

-file("inc/maze.hrl", 1).

-record(m_maze,
        {ver = 4,
         status = 0,
         dungeon = 0,
         double = 0,
         emptys = [],
         opens = [],
         datas = [],
         times = 0,
         piece = [],
         time = 0,
         others = [],
         pass = [],
         piece_other = [],
         events = []}).

-record(maze_open,
        {pos = {0, 0},
         ver = 1,
         x = 0,
         y = 0,
         unique = 0,
         type = 0,
         id = 0,
         hard = 0,
         times = 0,
         flag = 0,
         special_id = 0,
         reward = [],
         show = 0}).

-record(maze_event,
        {e_pos = {0, 0},
         e_x = 0,
         e_y = 0,
         e_id = 0,
         e_type = 0,
         e_unique = 0,
         e_reward = [],
         e_flag = 0,
         e_list = []}).

-file("src/mod/maze/maze.erl", 50).

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

-file("src/mod/maze/maze.erl", 51).

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

-file("src/mod/maze/maze.erl", 52).

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

-file("src/mod/maze/maze.erl", 53).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/maze/maze.erl", 54).

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

-file("src/mod/maze/maze.erl", 55).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
        {ver = 4,
         dun_id = 0,
         battle_id = 0,
         cards = [],
         unit_rewards = [],
         unit_rewarded = 0}).

-record(dungeon_base,
        {id = 0,
         name = "",
         type = 2,
         need_num = 1,
         cond_enter = [],
         cond_loss = [],
         cross_cond_enter = [],
         cross_cond_loss = [],
         exit_pos = last ::
             last |
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         battle_name_list = [],
         lev_interval = 0,
         unit_list = [],
         lev_max = 0,
         team_dungeon = 0}).

-record(dungeon_role_info,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         score_list = [] :: [tuple()]}).

-record(dungeon_unit_count, {id = 0, num = 0}).

-record(dungeon_score,
        {id = 0,
         score = 0 :: non_neg_integer(),
         grade = 1 :: pos_integer()}).

-record(dungeon_lord_data,
        {unit_id = 0,
         id = 0,
         floor = 0,
         map_id = 0,
         is_lord = 0,
         msg = ""}).

-record(dungeon_lord,
        {key = {0, 0},
         dun_id = 0,
         floor = 0,
         lords = [],
         ranks = []}).

-record(dungeon_lord_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         looks = []}).

-record(dungeon_rank_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         looks = [],
         up = 1,
         rank = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0,
         msg1 = "",
         msg2 = "",
         msg3 = ""}).

-record(dungeon_first,
        {key = {0, 0}, dun_id = 0, floor = 0, roles = []}).

-record(dungeon_first_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer()}).

-record(dungeon_reward_data,
        {id = 0,
         floor = 0,
         type = 0,
         item_list = [],
         title = "",
         msg = "",
         cast_msg = ""}).

-record(dungeon_team,
        {id = {0, "", 0} :: tuple(),
         leader :: undefined | tuple(),
         members = [] :: list(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         kicked = [] :: list()}).

-record(dungeon_enlistment,
        {id = {0, "", 0} :: tuple(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         leader :: undefined | tuple()}).

-record(dungeon_mate,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         team_id = {0, "", 0} :: tuple(),
         matched = 0 :: non_neg_integer(),
         join_time = 0 :: non_neg_integer(),
         origin_ids = [] :: list()}).

-record(dungeon_invitation,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         team_id = {0, "", 0},
         dun_id = 0,
         dun_name = "",
         time = 0}).

-record(dungeon_card,
        {item_id = 0,
         item_num = 0,
         announce = 0,
         selected = 0}).

-file("src/mod/maze/maze.erl", 56).

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

-file("src/mod/maze/maze.erl", 57).

init() ->
    {WorldLev, _Time} = world_lev:get_world_lev(),
    init(#{lev => 1, break_times => 0,
           world_lev => WorldLev, m_maze => #m_maze{}},
         10135).

init(#role{lev = Lev,
           m_lev_break = #m_lev_break{times = BreakTimes},
           m_maze =
               MMaze = #m_maze{pass = Pass,
                               dungeon = LastDungeonId}}) ->
    DungeonId = get_dungeon(Pass, LastDungeonId),
    {WorldLev, _Time} = world_lev:get_world_lev(),
    init(#{lev => Lev, break_times => BreakTimes,
           world_lev => WorldLev, m_maze => MMaze},
         DungeonId);
init(Lev) when is_integer(Lev) ->
    Pass = lists:foldl(fun (DungeonId, Acc) ->
                               case dungeon_data:get(DungeonId) of
                                   #dungeon_base{lev_max = LevMax,
                                                 team_dungeon = TeamDungeon}
                                       when TeamDungeon =:= 1 andalso
                                                Lev >= LevMax ->
                                       [DungeonId | Acc];
                                   _ -> Acc
                               end
                       end,
                       [],
                       dungeon_data:list()),
    DungeonId1 = get_dungeon(Pass, 10135),
    {WorldLev, _Time} = world_lev:get_world_lev(),
    init(#{lev => Lev, break_times => 0,
           world_lev => WorldLev, m_maze => #m_maze{pass = Pass}},
         DungeonId1).

get_dungeon([], _) -> 10135;
get_dungeon(Pass, LastDungeonId) ->
    List = lists:foldl(fun ({DungeonId, _Odds}, Acc) ->
                               case lists:member(DungeonId, Pass) of
                                   true -> [DungeonId | Acc];
                                   _ -> Acc
                               end
                       end,
                       [],
                       maze_data:list_dungeon()),
    List1 = lists:sort(List),
    case List1 of
        [] -> 10135;
        [First | _] ->
            case lists:member(LastDungeonId, List1) of
                true -> get_dungeon_next(List1, LastDungeonId, First);
                _ -> First
            end
    end.

get_dungeon_next([], _LastDungeonId, First) -> First;
get_dungeon_next([LastDungeonId, DungeonId | _T],
                 LastDungeonId, _First) ->
    DungeonId;
get_dungeon_next([_ | T], LastDungeonId, First) ->
    get_dungeon_next(T, LastDungeonId, First).

init(Args = #{m_maze := MMaze}, Dungeon) ->
    Datas = maze_util:make_data(Args, Dungeon),
    {Events1, HelpOpen, Emptps1, LastList1, Datas1} = case
                                                          lists:keyfind(9,
                                                                        3,
                                                                        Datas)
                                                          of
                                                          false ->
                                                              Emptys =
                                                                  maze_util:get_empty(5),
                                                              AllList = [{X, Y}
                                                                         || X
                                                                                <- lists:seq(1,
                                                                                             5),
                                                                            Y
                                                                                <- lists:seq(1,
                                                                                             5)],
                                                              LastList = AllList
                                                                             --
                                                                             [{1,
                                                                               1},
                                                                              {5,
                                                                               5}
                                                                              | Emptys],
                                                              {[],
                                                               [],
                                                               Emptys,
                                                               LastList,
                                                               Datas};
                                                          {Unique,
                                                           Type,
                                                           Id,
                                                           _Num,
                                                           _Hard} ->
                                                              Emptys =
                                                                  maze_util:get_empty(6),
                                                              AllList = [{X, Y}
                                                                         || X
                                                                                <- lists:seq(1,
                                                                                             5),
                                                                            Y
                                                                                <- lists:seq(1,
                                                                                             5)],
                                                              LastList = AllList
                                                                             --
                                                                             [{1,
                                                                               1},
                                                                              {5,
                                                                               5}
                                                                              | Emptys],
                                                              HelpPos = {HelpX,
                                                                         HelpY} =
                                                                            util:rand_list(Emptys),
                                                              {[#maze_event{e_x
                                                                                =
                                                                                HelpX,
                                                                            e_y
                                                                                =
                                                                                HelpY,
                                                                            e_unique
                                                                                =
                                                                                Unique,
                                                                            e_type
                                                                                =
                                                                                Type,
                                                                            e_id
                                                                                =
                                                                                Id,
                                                                            e_pos
                                                                                =
                                                                                HelpPos}],
                                                               [#maze_open{x =
                                                                               HelpX,
                                                                           y =
                                                                               HelpY,
                                                                           pos =
                                                                               HelpPos,
                                                                           unique
                                                                               =
                                                                               Unique,
                                                                           type
                                                                               =
                                                                               2,
                                                                           id =
                                                                               9,
                                                                           hard
                                                                               =
                                                                               1,
                                                                           times
                                                                               =
                                                                               0}],
                                                               lists:delete(HelpPos,
                                                                            Emptys),
                                                               LastList,
                                                               lists:keydelete(Id,
                                                                               3,
                                                                               Datas)}
                                                      end,
    {Events2, Emptps2, LastList2, Datas2, DragonData} = case
                                                            lists:keyfind(11,
                                                                          3,
                                                                          Datas1)
                                                            of
                                                            false ->
                                                                {Events1,
                                                                 Emptps1,
                                                                 LastList1,
                                                                 Datas1,
                                                                 []};
                                                            {Unique1,
                                                             Type1,
                                                             Id1,
                                                             _Num1,
                                                             _Hard1} ->
                                                                DragonPos = {X1,
                                                                             Y1} =
                                                                                util:rand_list(LastList),
                                                                MazeEvent =
                                                                    #maze_event{e_x
                                                                                    =
                                                                                    X1,
                                                                                e_y
                                                                                    =
                                                                                    Y1,
                                                                                e_unique
                                                                                    =
                                                                                    Unique1,
                                                                                e_type
                                                                                    =
                                                                                    Type1,
                                                                                e_id
                                                                                    =
                                                                                    2,
                                                                                e_pos
                                                                                    =
                                                                                    DragonPos},
                                                                {[MazeEvent
                                                                  | Events1],
                                                                 Emptps1,
                                                                 lists:delete(DragonPos,
                                                                              LastList1),
                                                                 lists:keydelete(Id1,
                                                                                 3,
                                                                                 lists:keydelete(2,
                                                                                                 3,
                                                                                                 Datas1)),
                                                                 [{DragonPos,
                                                                   Unique1,
                                                                   2,
                                                                   2,
                                                                   1,
                                                                   1}]}
                                                        end,
    {Events3, Emptys3, LastList3, Datas3} = case
                                                lists:keyfind(12, 3, Datas2)
                                                of
                                                false ->
                                                    {Events2,
                                                     Emptps2,
                                                     LastList2,
                                                     Datas2};
                                                {Unique2,
                                                 Type2,
                                                 Id2,
                                                 _Num2,
                                                 _Hard2} ->
                                                    MonkeyReward1 = case
                                                                        maze_data:get_data_other({Dungeon,
                                                                                                  Unique2})
                                                                        of
                                                                        #{other
                                                                              :=
                                                                              MonkeyReward} ->
                                                                            {ItemId1,
                                                                             Num1,
                                                                             _Odds1,
                                                                             _IsCast1} =
                                                                                util:rand_list(MonkeyReward,
                                                                                               3),
                                                                            [{ItemId1,
                                                                              0,
                                                                              Num1}];
                                                                        _ -> []
                                                                    end,
                                                    MonkeyPos = {MonkeyX,
                                                                 MonkeyY} =
                                                                    util:rand_list([{X,
                                                                                     Y}
                                                                                    || X
                                                                                           <- lists:seq(1,
                                                                                                        5),
                                                                                       Y
                                                                                           <- lists:seq(1,
                                                                                                        5)]
                                                                                       --
                                                                                       [{1,
                                                                                         1},
                                                                                        {5,
                                                                                         5}]),
                                                    MonkeyEvent =
                                                        #maze_event{e_x =
                                                                        MonkeyX,
                                                                    e_y =
                                                                        MonkeyY,
                                                                    e_unique =
                                                                        Unique2,
                                                                    e_type =
                                                                        Type2,
                                                                    e_id = Id2,
                                                                    e_pos =
                                                                        MonkeyPos,
                                                                    e_reward =
                                                                        item_type:special_id(MonkeyReward1)},
                                                    {[MonkeyEvent | Events2],
                                                     Emptps2,
                                                     LastList1,
                                                     lists:keydelete(12,
                                                                     3,
                                                                     Datas2)}
                                            end,
    Datas4 = util:shuffle(Datas3),
    NewDatas = init_data_pos(Datas4, LastList3, []),
    Data = maze_util:get_item_date(Args, Dungeon),
    MMaze#m_maze{status = 0, emptys = Emptys3,
                 datas = DragonData ++ [Data | NewDatas], times = 0,
                 dungeon = Dungeon, piece = [], piece_other = [],
                 events = Events3,
                 opens =
                     HelpOpen ++
                         [#maze_open{pos = {1, 1}, x = 1, y = 1, type = 3,
                                     id = 2},
                          #maze_open{pos = {5, 5}, x = 5, y = 5, type = 3,
                                     id = 1}]}.

init_data_pos([], _, NewDatas) -> NewDatas;
init_data_pos([{Unique, Type, Id, Num, Hard} | Datas],
              [], NewDatas) ->
    init_data_pos(Datas,
                  [],
                  [{{0, 0}, Unique, Type, Id, Num, Hard} | NewDatas]);
init_data_pos([{Unique, Type, Id, Num, Hard} | Datas],
              [Pos | PosList], NewDatas) ->
    init_data_pos(Datas,
                  PosList,
                  [{Pos, Unique, Type, Id, Num, Hard} | NewDatas]).

login(Role = #role{m_maze =
                       MMaze = #m_maze{opens = Opens, time = Time}}) ->
    L = [#trigger{label = evt_dungeon_pass, a = [],
                  m = maze, f = apply_evt}],
    logger:debug("珍宝石板登陆处理", [], maze, 170),
    Now = date:unixtime(),
    do_login(Opens, Now, Time),
    NewTref = erlang:send_after(2 * 1000,
                                self(),
                                {apply_async, {maze, reset, []}}),
    put(final_ref, NewTref),
    {_, NewRole} = role_trigger:add(L,
                                    Role#role{m_maze =
                                                  MMaze#m_maze{status = 0}}),
    {ok, NewRole}.

do_login([], _Now, _StartTime) -> ok;
do_login([#maze_open{type = 2, id = 2, flag = 0} | T],
         Now, Time) ->
    Time1 = case Time + 3 > Now of
                true -> Time + 3 - Now;
                _ -> 1
            end,
    logger:debug("处理炎龙未处理事件 ~w", [Time1], maze, 185),
    case get(ref) of
        Tref when is_reference(Tref) ->
            erlang:cancel_timer(Tref);
        _ -> skip
    end,
    erlang:send_after(Time1 * 1000,
                      self(),
                      {apply_async, {maze, reward_dragon, []}}),
    do_login(T, Now, Time);
do_login([#maze_open{pos = Pos, type = 2, id = 5,
                     flag = 0}
          | T],
         Now, Time) ->
    Time1 = case Time + 5 > Now of
                true -> Time + 5 - Now;
                _ -> 1
            end,
    logger:debug("处理放妖未处理事件 ~w", [Time1], maze, 198),
    case get(ref) of
        Tref when is_reference(Tref) ->
            erlang:cancel_timer(Tref);
        _ -> skip
    end,
    erlang:send_after(Time1 * 1000,
                      self(),
                      {apply_async, {maze, grab_over, [Pos]}}),
    do_login(T, Now, Time);
do_login([_ | T], Now, Time) -> do_login(T, Now, Time).

push(#role{pid = Pid, m_maze = MMaze} = Role) ->
    NewMMaze = check_maze(Pid, MMaze),
    role:link_send(Role, 18800, {NewMMaze}),
    ok.

reset(Role = #role{m_maze =
                       #m_maze{events = Events, opens = Opens}}) ->
    case get(final_ref) of
        Tref when is_reference(Tref) ->
            erlang:cancel_timer(Tref);
        _ -> skip
    end,
    case lists:keyfind({1, 1}, #maze_open.pos, Opens) of
        #maze_open{flag = 1} ->
            send_mail(Role, Events),
            MMaze1 = init(Role),
            Role1 = Role#role{m_maze = MMaze1},
            role:link_send(Role1, 18811, {1, ""}),
            push(Role1),
            logger:debug("触发事件 ~w", [Events], maze, 230),
            FireRole = fire(Events, Role1),
            {ok, FireRole};
        _R -> ok
    end.

dig(Role, {X, Y}) when X =:= 5 andalso Y =:= 5 ->
    {ok, Role};
dig(Role = #role{name = RoleName,
                 m_maze =
                     MMaze = #m_maze{times = OpenTimes, double = Double,
                                     emptys = Emptys, opens = Opens,
                                     datas = Datas, piece = Piece,
                                     status = Status, dungeon = Dungeon}},
    Pos = {X, Y})
    when X =< 5 andalso Y =< 5 andalso Status =:= 0 ->
    Result = case lists:keyfind(Pos, #maze_open.pos, Opens)
                 of
                 false ->
                     case check([monster, open], Pos, Opens) of
                         ok ->
                             Loss = format:val_to_loss([{21220, 1}]),
                             {MazeOpen = #maze_open{type = Type,
                                                    reward = Reward},
                              NewDatas} =
                                 get_maze_open(Pos, Emptys, Datas),
                             {Double1, Reward1, Flag} = case Double =:= 1
                                                                 andalso
                                                                 Type =:= 1
                                                            of
                                                            true ->
                                                                {0,
                                                                 [{ItemId,
                                                                   Bind,
                                                                   Num * 2}
                                                                  || {ItemId,
                                                                      Bind,
                                                                      Num}
                                                                         <- Reward],
                                                                 1};
                                                            _ ->
                                                                {Double,
                                                                 Reward,
                                                                 0}
                                                        end,
                             Reward2 = item_type:special_id(Reward1),
                             {ok,
                              role_trigger:fire(#evt_maze{},
                                                Role#role{m_maze =
                                                              MMaze#m_maze{double
                                                                               =
                                                                               Double1,
                                                                           datas
                                                                               =
                                                                               NewDatas,
                                                                           opens
                                                                               =
                                                                               lists:keystore(Pos,
                                                                                              #maze_open.pos,
                                                                                              Opens,
                                                                                              MazeOpen#maze_open{reward
                                                                                                                     =
                                                                                                                     Reward2,
                                                                                                                 flag
                                                                                                                     =
                                                                                                                     Flag})}}),
                              Loss};
                         {false, Reason} -> {false, Reason}
                     end;
                 MazeOpen = #maze_open{times = Times, hard = Hard}
                     when Times < Hard ->
                     {ok,
                      Role#role{m_maze =
                                    MMaze#m_maze{opens =
                                                     lists:keystore(Pos,
                                                                    #maze_open.pos,
                                                                    Opens,
                                                                    MazeOpen)}},
                      []};
                 _R ->
                     logger:debug("已经打开位置信息 ~w", [_R], maze, 265),
                     {false, lang:get("该位置已经打开")}
             end,
    case Result of
        {ok,
         Role2 = #role{m_maze =
                           MMaze1 = #m_maze{opens = Opens1, events = Events,
                                            piece_other = PieceOther}},
         Loss1} ->
            MazeeOpen1 = #maze_open{times = Times1, hard = Hard1} =
                             lists:keyfind(Pos, #maze_open.pos, Opens1),
            {MMaze3, Args1} = case Times1 + 1 >= Hard1 of
                                  true ->
                                      {OtherMMaze, OtherArgs} =
                                          do_other_dig(Events,
                                                       MMaze1,
                                                       #{pos => Pos}),
                                      MazeOpen2 = #maze_open{pos = Pos,
                                                             unique = Unique,
                                                             reward = Reward3,
                                                             type = Type1} =
                                                      lists:keyfind(Pos,
                                                                    #maze_open.pos,
                                                                    OtherMMaze#m_maze.opens),
                                      logger:debug("新open ~w",
                                                   [MazeOpen2],
                                                   maze,
                                                   276),
                                      {NewPiece, NewPieceOther} = case
                                                                      cal_piece(MazeOpen2,
                                                                                OpenTimes,
                                                                                Piece,
                                                                                PieceOther)
                                                                      of
                                                                      {Piece1,
                                                                       PieceOther1} ->
                                                                          {Piece1,
                                                                           PieceOther1};
                                                                      Piece1 ->
                                                                          {Piece1,
                                                                           PieceOther}
                                                                  end,
                                      logger:debug("==============~w",
                                                   [{OpenTimes,
                                                     Piece,
                                                     NewPiece,
                                                     maze_data:get_piece(OpenTimes)}],
                                                   maze,
                                                   282),
                                      AddPiece = case length(NewPiece) =:=
                                                          length(Piece)
                                                     of
                                                     true -> undefined;
                                                     _ ->
                                                         notice:format(lang:get("意外获得~ts，秘钥进度（~ts/3）"),
                                                                       [{string_2,
                                                                         5,
                                                                         lang:get("水晶能量")},
                                                                        {string_2,
                                                                         1,
                                                                         length(NewPiece)}])
                                                 end,
                                      RewardNotice = case
                                                         maze_data:get_data_other({Dungeon,
                                                                                   Unique})
                                                         of
                                                         #{is_cast := IsCast}
                                                             when IsCast =:= 1
                                                                      andalso
                                                                      Reward3
                                                                          =/=
                                                                          [] ->
                                                             notice:format(lang:get("~ts在~ts小锤子一挥，惊喜地砸出~ts{face_1, 18}"),
                                                                           [{role_2,
                                                                             RoleName},
                                                                            {string_2,
                                                                             1,
                                                                             lang:get("宝藏迷城")},
                                                                            {item_2,
                                                                             Reward3}]);
                                                         _ -> undefined
                                                     end,
                                      HoleNotice = case Type1 of
                                                       0 ->
                                                           lang:get("出现大坑，此路不通{face_1, 19}");
                                                       _ -> undefined
                                                   end,
                                      case do_dig(MazeOpen2, OtherMMaze) of
                                          {MMaze2} ->
                                              {MMaze2#m_maze{piece = NewPiece,
                                                             piece_other =
                                                                 NewPieceOther,
                                                             times =
                                                                 OpenTimes + 1},
                                               OtherArgs#{piece => AddPiece,
                                                          reward_notice =>
                                                              RewardNotice,
                                                          hole_notice =>
                                                              HoleNotice}};
                                          {MMaze2, Args} ->
                                              MergeArgs = maps:merge(OtherArgs,
                                                                     Args),
                                              {MMaze2#m_maze{piece = NewPiece,
                                                             piece_other =
                                                                 NewPieceOther,
                                                             times =
                                                                 OpenTimes + 1},
                                               MergeArgs#{piece => AddPiece,
                                                          reward_notice =>
                                                              RewardNotice,
                                                          hole_notice =>
                                                              HoleNotice}}
                                      end;
                                  _ ->
                                      {MMaze1#m_maze{opens =
                                                         lists:keystore(Pos,
                                                                        #maze_open.pos,
                                                                        Opens1,
                                                                        MazeeOpen1#maze_open{times
                                                                                                 =
                                                                                                 Times1
                                                                                                     +
                                                                                                     1})},
                                       #{notice =>
                                             lang:get("{face_1, 42}好像有好东西，快敲开他（不消耗秘宝锤）")}}
                              end,
            case role_gain:do(Loss1, Role2) of
                {ok, Role3} ->
                    do_notice(Role3, Args1),
                    Role4 = do_evt(Role3, Args1),
                    Role5 = Role4#role{m_maze = MMaze3},
                    {ok, Role5};
                {false, #loss{msg = _Msg}} ->
                    case get(ref) of
                        Tref when is_reference(Tref) ->
                            erlang:cancel_timer(Tref);
                        _ -> skip
                    end,
                    {false, lang:get("道具不足，快去获取秘宝锤吧！")}
            end;
        {false, Reason1} -> {false, Reason1}
    end;
dig(Role = #role{m_maze =
                     MMaze = #m_maze{status = Status, opens = Opens}},
    _Pos) ->
    NewStatus = case length(Opens) of
                    2 -> 0;
                    _ -> Status
                end,
    {ok,
     Role#role{m_maze = MMaze#m_maze{status = NewStatus}}}.

do_other_dig([], MMaze, Args) -> {MMaze, Args};
do_other_dig([MazeEvent = #maze_event{e_pos = Pos,
                                      e_type = 2, e_id = 7, e_unique = Unique,
                                      e_flag = 0}
              | T],
             MMaze = #m_maze{dungeon = Dungeon, events = Events,
                             opens = Opens},
             Args) ->
    Reward1 = case maze_data:get_data_other({Dungeon,
                                             Unique})
                  of
                  #{other := Other} ->
                      case util:rand_list(Other) of
                          {ItemId, Num, _Odds, _IsCast} -> [{ItemId, 0, Num}];
                          _ -> [{90000, 0, 10000}]
                      end;
                  _ -> [{90000, 0, 10000}]
              end,
    MazeOpen = lists:keyfind(Pos, #maze_open.pos, Opens),
    Reward2 = item_type:special_id(Reward1),
    do_other_dig(T,
                 MMaze#m_maze{events =
                                  lists:keystore(Unique,
                                                 #maze_event.e_unique,
                                                 Events,
                                                 MazeEvent#maze_event{e_reward =
                                                                          Reward2}),
                              opens =
                                  lists:keystore(Pos,
                                                 #maze_open.pos,
                                                 Opens,
                                                 MazeOpen#maze_open{reward =
                                                                        Reward2})},
                 Args);
do_other_dig([#maze_event{e_pos = {X, Y} = Pos,
                          e_reward = Reward, e_type = 2, e_id = 8,
                          e_unique = Unique}
              | T],
             MMaze = #m_maze{opens = Opens, events = Events},
             Args = #{pos := Pos}) ->
    MazeOpen = #maze_open{pos = Pos, x = X, y = Y, type = 2,
                          id = 8, times = 0, hard = 1, special_id = 1,
                          reward = Reward},
    CatOpen = lists:keyfind(Unique,
                            #maze_open.unique,
                            Opens),
    Opens1 = lists:keystore(Unique,
                            #maze_open.unique,
                            Opens,
                            CatOpen#maze_open{flag = 1}),
    Opens2 = lists:keystore(Pos,
                            #maze_open.pos,
                            Opens1,
                            MazeOpen),
    logger:debug("龙猫的家 ~w", [Pos], maze, 351),
    do_other_dig(T,
                 MMaze#m_maze{events =
                                  lists:keydelete(Unique,
                                                  #maze_open.unique,
                                                  Events),
                              opens = Opens2},
                 Args);
do_other_dig([MazeEvent = #maze_event{e_pos = Pos,
                                      e_type = 2, e_id = 10, e_unique = Unique,
                                      e_reward = Reward = [{_, 0, Num}],
                                      e_flag = 0}
              | T],
             MMaze = #m_maze{dungeon = Dungeon, events = Events,
                             opens = Opens},
             Args) ->
    Reward1 = case maze_data:get_data_other({Dungeon,
                                             Unique})
                  of
                  #{other := [_BaseNum | OddList]} ->
                      case util:rand_list(OddList, 2) of
                          {AddNum, _Odds} when is_integer(AddNum) ->
                              [{90003, 0, Num + AddNum}];
                          _ ->
                              logger:error("宝藏迷城错误数据 ~w",
                                           [{Dungeon, Unique}],
                                           maze,
                                           361),
                              [{90003, 0, Num + 100}]
                      end;
                  _ -> Reward
              end,
    MazeOpen = lists:keyfind(Pos, #maze_open.pos, Opens),
    do_other_dig(T,
                 MMaze#m_maze{events =
                                  lists:keystore(Unique,
                                                 #maze_event.e_unique,
                                                 Events,
                                                 MazeEvent#maze_event{e_reward =
                                                                          Reward1}),
                              opens =
                                  lists:keystore(Pos,
                                                 #maze_open.pos,
                                                 Opens,
                                                 MazeOpen#maze_open{reward =
                                                                        Reward1})},
                 Args);
do_other_dig([MazeEvent = #maze_event{e_pos = Pos,
                                      e_type = 2, e_id = 12, e_unique = Unique}
              | T],
             MMaze = #m_maze{dungeon = _Dungeon, events = Events,
                             opens = Opens},
             Args = #{pos := DigPos}) ->
    case maze_util:get_next_pos(Pos, Opens, Events, DigPos)
        of
        false ->
            logger:debug("猴子被困住了 ~w", [{Pos, DigPos}], maze, 372),
            do_other_dig(T, MMaze, Args);
        {X, Y} ->
            logger:debug("抓猴子下一个位置 ~w", [{X, Y}], maze, 375),
            do_other_dig(T,
                         MMaze#m_maze{events =
                                          lists:keystore(Unique,
                                                         #maze_event.e_unique,
                                                         Events,
                                                         MazeEvent#maze_event{e_pos
                                                                                  =
                                                                                  {X,
                                                                                   Y},
                                                                              e_x
                                                                                  =
                                                                                  X,
                                                                              e_y
                                                                                  =
                                                                                  Y})},
                         Args)
    end;
do_other_dig([_R | T], MMaze, Args) ->
    logger:debug("未处理事件 ~w", [{_R, Args}], maze, 380),
    do_other_dig(T, MMaze, Args).

do_dig(MazeOpen = #maze_open{type = Type, pos = Pos,
                             times = Times},
       MMaze = #m_maze{opens = Opens})
    when Type =:= 0 ->
    {MMaze#m_maze{opens =
                      lists:keystore(Pos,
                                     #maze_open.pos,
                                     Opens,
                                     MazeOpen#maze_open{times = Times + 1})}};
do_dig(MazeOpen = #maze_open{type = Type, id = Id,
                             times = Times, pos = Pos, reward = Reward},
       MMaze = #m_maze{opens = Opens})
    when Type =:= 1 ->
    {MMaze#m_maze{opens =
                      lists:keystore(Pos,
                                     #maze_open.pos,
                                     Opens,
                                     MazeOpen#maze_open{times = Times + 1,
                                                        special_id = Id})},
     #{gain => Reward}};
do_dig(MazeOpen = #maze_open{type = Type, id = Id,
                             times = Times, pos = Pos},
       MMaze = #m_maze{opens = Opens})
    when Type =:= 2 andalso Id =:= 1 ->
    {MMaze#m_maze{opens =
                      lists:keystore(Pos,
                                     #maze_open.pos,
                                     Opens,
                                     MazeOpen#maze_open{times = Times + 1})},
     #{monster_notice =>
           lang:get("地上突然冒出了一只妖怪{face_1, 46}")}};
do_dig(MazeOpen = #maze_open{x = X, y = Y, type = Type,
                             id = Id, times = Times, pos = Pos,
                             unique = Unique},
       MMaze = #m_maze{dungeon = Dungeon, opens = Opens})
    when Type =:= 2 andalso Id =:= 2 ->
    Dragon = case maze_data:get_data_other({Dungeon,
                                            Unique})
                 of
                 #{other := Other} ->
                     case util:rand_list(Other, 2) of
                         {Dragon0, _Odds} -> Dragon0;
                         _ -> 2
                     end;
                 _ -> 2
             end,
    NewList = do_dragon(MazeOpen, Opens, Dragon),
    case get(ref) of
        Tref when is_reference(Tref) ->
            erlang:cancel_timer(Tref);
        _ -> skip
    end,
    erlang:send_after(3 * 1000,
                      self(),
                      {apply_async, {maze, reward_dragon, []}}),
    logger:debug("新的位置 ~w", [NewList], maze, 413),
    {MMaze#m_maze{status = 2,
                  opens =
                      lists:keystore(Pos,
                                     #maze_open.pos,
                                     Opens,
                                     MazeOpen#maze_open{times = Times + 1,
                                                        special_id = Dragon}),
                  others = NewList},
     #{dragon => {X, Y, NewList},
       dragon_notice =>
           lang:get("人品爆炸，挖到龙脉{face_1, 11}{face_1, 11}{face_1, "
                    "11}"),
       dragon_notice_all => 1}};
do_dig(MazeOpen = #maze_open{type = Type, id = Id,
                             times = Times, pos = Pos},
       MMaze)
    when Type =:= 2 andalso Id =:= 3 ->
    #m_maze{opens = Opens} = NewMMaze = linkage(Pos, MMaze),
    {NewMMaze#m_maze{opens =
                         lists:keystore(Pos,
                                        #maze_open.pos,
                                        Opens,
                                        MazeOpen#maze_open{times =
                                                               Times + 1})}};
do_dig(MazeOpen = #maze_open{type = Type, id = Id,
                             times = Times, pos = Pos, unique = Unique},
       MMaze = #m_maze{opens = Opens, dungeon = Dungeon})
    when Type =:= 2 andalso Id =:= 4 ->
    SpecialId1 = case maze_data:get_data_other({Dungeon,
                                                Unique})
                     of
                     #{other := Other} ->
                         {SpecialId, _Odds} = util:rand_list(Other, 2),
                         SpecialId;
                     _ -> 1
                 end,
    {MMaze#m_maze{opens =
                      lists:keystore(Pos,
                                     #maze_open.pos,
                                     Opens,
                                     MazeOpen#maze_open{times = Times + 1,
                                                        special_id =
                                                            SpecialId1})}};
do_dig(MazeOpen = #maze_open{type = Type, id = Id,
                             times = Times, pos = Pos},
       MMaze = #m_maze{opens = Opens})
    when Type =:= 2 andalso Id =:= 5 ->
    case get(ref) of
        Tref when is_reference(Tref) ->
            erlang:cancel_timer(Tref);
        _ -> skip
    end,
    erlang:send_after(5 * 1000,
                      self(),
                      {apply_async, {maze, grab_over, [Pos]}}),
    {MMaze#m_maze{status = 5, time = date:unixtime(),
                  opens =
                      lists:keystore(Pos,
                                     #maze_open.pos,
                                     Opens,
                                     MazeOpen#maze_open{times = Times + 1})},
     #{grab_notice => lang:get("妖气四散，快点击屏幕抓妖！{face_1, 46}"),
       grab => 1}};
do_dig(MazeOpen = #maze_open{type = Type, id = Id,
                             times = Times, pos = Pos, x = X, y = Y},
       MMaze = #m_maze{opens = Opens, piece = Piece,
                       datas = Datas})
    when Type =:= 2 andalso Id =:= 6 ->
    case length(Piece) >= 3 of
        true ->
            {{_Pos1, Unique1, Type1, Id1, Num1, _Hard1}, Datas1} =
                maze_util:get_remain_data(Datas),
            MazeOpen1 = MazeOpen#maze_open{type = Type1, id = Id1,
                                           unique = Unique1,
                                           reward = [{Id1, 0, Num1}]},
            {MMaze#m_maze{datas = Datas1,
                          opens =
                              lists:keystore(Pos,
                                             #maze_open.pos,
                                             Opens,
                                             MazeOpen1#maze_open{times =
                                                                     Times +
                                                                         1})}};
        _ ->
            PosList = maze_util:get_remain_pos(MMaze, Pos),
            Piece1 = [1, 2, 3] -- Piece,
            PieceOther = maze_util:make_piece_other(Piece1,
                                                    PosList,
                                                    []),
            case get(ref) of
                Tref when is_reference(Tref) ->
                    erlang:cancel_timer(Tref);
                _ -> skip
            end,
            erlang:send_after(3 * 1000,
                              self(),
                              {apply_async, {maze, apply_point, []}}),
            {MMaze#m_maze{status = 7, others = PieceOther,
                          opens =
                              lists:keystore(Pos,
                                             #maze_open.pos,
                                             Opens,
                                             MazeOpen#maze_open{times =
                                                                    Times +
                                                                        1})},
             #{point => {X, Y, PieceOther}}}
    end;
do_dig(MazeOpen = #maze_open{type = Type, id = Id,
                             times = Times, pos = Pos, unique = Unique},
       MMaze = #m_maze{dungeon = Dungeon, opens = Opens,
                       events = Events})
    when Type =:= 2 andalso Id =:= 7 ->
    Reward1 = case maze_data:get_data_other({Dungeon,
                                             Unique})
                  of
                  #{other := Other} ->
                      case util:rand_list(Other, 3) of
                          {ItemId, Num, _Odds, _IsCast} -> [{ItemId, 0, Num}];
                          _ -> [{90000, 0, 10000}]
                      end;
                  _ -> [{90000, 0, 10000}]
              end,
    Reward2 = item_type:special_id(Reward1),
    MazeEvent = #maze_event{e_pos = Pos, e_type = Type,
                            e_id = Id, e_unique = Unique, e_flag = 0,
                            e_reward = Reward2},
    {MMaze#m_maze{events = [MazeEvent | Events],
                  opens =
                      lists:keystore(Pos,
                                     #maze_open.pos,
                                     Opens,
                                     MazeOpen#maze_open{times = Times + 1,
                                                        reward = Reward2})}};
do_dig(MazeOpen = #maze_open{type = Type, id = Id,
                             times = Times, pos = Pos, unique = Unique,
                             special_id = SpecialId},
       MMaze = #m_maze{dungeon = Dungeon, opens = Opens,
                       events = Events, datas = Datas})
    when Type =:= 2 andalso
             Id =:= 8 andalso SpecialId =:= 0 ->
    Result = case maze_data:get_data_other({Dungeon,
                                            Unique})
                 of
                 #{other := [MaxStep | OddList]} ->
                     NowStep = length([Times1
                                       || #maze_open{times = Times1,
                                                     hard = HardTimes}
                                              <- Opens,
                                          Times1 =:= HardTimes])
                                   - 2,
                     case NowStep < MaxStep of
                         true ->
                             PosList = maze_util:get_remain_pos_event(MMaze,
                                                                      Pos),
                             case PosList of
                                 [] -> false;
                                 _ ->
                                     {ItemId, Num, _Odds, _IsCast} =
                                         util:rand_list(OddList, 3),
                                     {ok,
                                      util:rand_list(PosList),
                                      item_type:special_id([{ItemId, 0, Num}])}
                             end;
                         _ -> false
                     end;
                 _ -> false
             end,
    case Result of
        {ok, Pos1 = {X, Y}, Reward} ->
            logger:debug("======================龙猫的家==================="
                         "=====~w",
                         [Pos1],
                         maze,
                         495),
            Reward1 = item_type:special_id(Reward),
            MazeEvent = #maze_event{e_pos = Pos1, e_type = Type,
                                    e_id = Id, e_unique = Unique, e_flag = 0,
                                    e_x = X, e_y = Y, e_reward = Reward1},
            {MMaze#m_maze{events = [MazeEvent | Events],
                          opens =
                              lists:keystore(Pos,
                                             #maze_open.pos,
                                             Opens,
                                             MazeOpen#maze_open{times =
                                                                    Times + 1,
                                                                reward =
                                                                    Reward1})}};
        _ ->
            {{_Pos1, Unique1, Type1, Id1, Num1, _Hard1}, Datas1} =
                maze_util:get_remain_data(Datas),
            MazeOpen1 = MazeOpen#maze_open{type = Type1, id = Id1,
                                           unique = Unique1,
                                           reward = [{Id1, 0, Num1}]},
            {MMaze#m_maze{datas = Datas1,
                          opens =
                              lists:keystore(Pos,
                                             #maze_open.pos,
                                             Opens,
                                             MazeOpen1#maze_open{times =
                                                                     Times +
                                                                         1})}}
    end;
do_dig(MazeOpen = #maze_open{type = Type, id = Id,
                             times = Times, pos = Pos, unique = Unique},
       MMaze = #m_maze{dungeon = Dungeon, opens = Opens,
                       events = Events})
    when Type =:= 2 andalso Id =:= 10 ->
    Reward1 = case maze_data:get_data_other({Dungeon,
                                             Unique})
                  of
                  #{other := [BaseNum | _OddList]} ->
                      [{90003, 0, BaseNum}];
                  _ -> [{90003, 0, 100}]
              end,
    MazeEvent = #maze_event{e_pos = Pos, e_type = Type,
                            e_id = Id, e_unique = Unique, e_flag = 0,
                            e_reward = Reward1},
    {MMaze#m_maze{events = [MazeEvent | Events],
                  opens =
                      lists:keystore(Pos,
                                     #maze_open.pos,
                                     Opens,
                                     MazeOpen#maze_open{times = Times + 1,
                                                        reward = Reward1})}};
do_dig(MazeOpen = #maze_open{type = _Type, id = _Id,
                             times = Times, pos = Pos},
       MMaze = #m_maze{opens = Opens}) ->
    logger:debug("珍宝石板默认处理 类型  ~w ID ~w",
                 [_Type, _Id],
                 maze,
                 515),
    {MMaze#m_maze{opens =
                      lists:keystore(Pos,
                                     #maze_open.pos,
                                     Opens,
                                     MazeOpen#maze_open{times = Times + 1})}}.

do_notice(Role = #role{id = RoleId, name = RoleName},
          Args1) ->
    case maps:get(dragon, Args1, undefined) of
        undefined -> ok;
        Dragon -> role:link_send(Role, 18802, Dragon)
    end,
    case maps:get(point, Args1, undefined) of
        undefined -> ok;
        Point -> role:link_send(Role, 18812, Point)
    end,
    case maps:get(notice, Args1, undefined) of
        undefined -> ok;
        Notice -> notice:send(Role, 1, Notice)
    end,
    case maps:get(piece, Args1, undefined) of
        undefined -> ok;
        PieceNotice -> notice:send(Role, 1, PieceNotice)
    end,
    case maps:get(dragon_notice, Args1, undefined) of
        undefined -> ok;
        DragonNotice -> notice:send(Role, 1, DragonNotice)
    end,
    case maps:get(monster_notice, Args1, undefined) of
        undefined -> ok;
        MonsterNotice -> notice:send(Role, 1, MonsterNotice)
    end,
    case maps:get(reward_notice, Args1, undefined) of
        undefined -> ok;
        RewardNotice -> notice:cast(all, 5, RewardNotice)
    end,
    case maps:get(grab_notice, Args1, undefined) of
        undefined -> ok;
        GrabNotice -> notice:send(Role, 1, GrabNotice)
    end,
    case maps:get(hole_notice, Args1, undefined) of
        undefined -> ok;
        HoleNotice -> notice:send(Role, 1, HoleNotice)
    end,
    case maps:get(grab, Args1, undefined) of
        1 ->
            gen_server:cast(treasure,
                            {ghost_box_maze, RoleId, RoleName});
        _ -> ok
    end.

do_evt(Role, Args) ->
    RoleMonster = case maps:get(grab, Args, undefined) of
                      1 -> role_trigger:fire(#evt_maze_monster{}, Role);
                      _ -> Role
                  end,
    case maps:get(hole_notice, Args, undefined) of
        undefined -> RoleMonster;
        _HoleNotice ->
            role_trigger:fire(#evt_maze_sweep{}, RoleMonster)
    end.

change(Role = #role{name = RoleName,
                    m_maze = MMaze = #m_maze{opens = Opens}},
       Pos, BaseId) ->
    logger:debug("========== ~w", [BaseId], maze, 578),
    case lists:keyfind(Pos, #maze_open.pos, Opens) of
        #maze_open{type = Type, id = Id}
            when Type =/= 2 orelse Id =/= 4 ->
            {false, lang:get("不能交换")};
        #maze_open{times = Times, hard = Hard}
            when Times < Hard ->
            {false, lang:get("该位置还未打开")};
        #maze_open{flag = Status} when Status > 0 ->
            {false, lang:get("该土拨鼠已交换")};
        #maze_open{special_id = SpecialId} = MazeOpen ->
            Lists = maze_data:list(SpecialId),
            logger:debug("===== ~w",
                         [{SpecialId, Lists}],
                         maze,
                         588),
            case lists:keytake(BaseId, 1, Lists) of
                {value, {BaseId, Price, Items}, Lists1} ->
                    NewList = [{ItemId, Odds + Price}
                               || {ItemId, Odds} <- Items]
                                  ++
                                  [Items1
                                   || {_BaseId1, _Price1, Items1} <- Lists1],
                    {ItemId1, _Odds} = util:rand_list(util:flist(NewList),
                                                      2),
                    Loss = format:val_to_loss([{BaseId, 1}]),
                    Gain = format:val_to_gain([{ItemId1, 0, 1}]),
                    NewMazeOpen = MazeOpen#maze_open{flag = 1},
                    NewMMaze = MMaze#m_maze{opens =
                                                lists:keystore(Pos,
                                                               #maze_open.pos,
                                                               Opens,
                                                               NewMazeOpen)},
                    Role1 = Role#role{m_maze = NewMMaze},
                    case role_gain:do_notice(Loss ++ Gain, Role1) of
                        {ok, NewRole} ->
                            Content =
                                notice:format(lang:get("~ts在宝藏迷城里发现了~ts，给它一件~ts后，它竟举爪奉上一件~ts作为交换"),
                                              [{role_2, RoleName},
                                               {string_1,
                                                get_marmot_name(SpecialId)},
                                               {item_2, BaseId},
                                               {item_2, ItemId1}]),
                            notice:cast(all, 5, Content),
                            push(NewRole),
                            {ok, NewRole};
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("该道具不可交换")}
            end;
        _ -> {false, lang:get("数据出错")}
    end.

grab(#role{m_maze = _MMaze = #m_maze{status = Status}},
     _Pos, _VerifyId)
    when Status =/= 5 ->
    {false, lang:get(""), 0};
grab(Role = #role{name = RoleName,
                  m_maze =
                      MMaze = #m_maze{opens = Opens, time = _Time,
                                      dungeon = Dungeon}},
     Pos, VerifyId) ->
    case var:get_var(Role, other, 2079, 0) of
        GrabTimes when GrabTimes < 10 ->
            case lists:keyfind(Pos, #maze_open.pos, Opens) of
                #maze_open{special_id = SpeId, type = Type, id = Id,
                           unique = Unique} =
                    MazeOpen
                    when Type =:= 2 andalso
                             Id =:= 5 andalso SpeId =:= VerifyId ->
                    case maze_data:get_data_other({Dungeon, Unique}) of
                        #{other := Other} ->
                            {Items, IsCast1} = case util:rand_list(Other, 3) of
                                                   {ItemId,
                                                    Num,
                                                    _Odds,
                                                    IsCast} ->
                                                       {[{ItemId, 0, Num}],
                                                        IsCast};
                                                   _ -> {[{90000, 0, 5000}], 0}
                                               end,
                            NewVerifyId = util:rand(1000, 9999),
                            Role1 = Role#role{m_maze =
                                                  MMaze#m_maze{opens =
                                                                   lists:keystore(Pos,
                                                                                  #maze_open.pos,
                                                                                  Opens,
                                                                                  MazeOpen#maze_open{special_id
                                                                                                         =
                                                                                                         NewVerifyId})}},
                            Role2 = var:acc_var(Role1, other, 2079),
                            case IsCast1 of
                                1 ->
                                    Notice =
                                        notice:format(lang:get("~ts出手迅速，拦截了大量逃逸的妖魂并获得了~ts{face_1, 31}"),
                                                      [{role_2, RoleName},
                                                       {item_2, Items}]),
                                    notice:send(Role, 1, Notice);
                                _ -> skip
                            end,
                            log:maze(Role, Items, lang:get("抓妖领取道具")),
                            case role_gain:do_notice(format:val_to_gain(Items),
                                                     Role2)
                                of
                                {ok, NewRole} -> {ok, NewRole, NewVerifyId};
                                _ ->
                                    Content =
                                        notice:format(lang:get("你在宝藏迷城抓取奖励时背包已满,以下是你获得的奖励\n~ts"),
                                                      [{string_2,
                                                        5,
                                                        lang:get("（温馨提醒：邮件数量有一定上限，超出上限后最早的邮件将被删除，请及时领取邮件奖励哟）")}]),
                                    mail:send(Role,
                                              #{title => lang:get("宝藏迷城奖励"),
                                                content => Content,
                                                items => Items}),
                                    {ok, Role2, NewVerifyId}
                            end;
                        _ ->
                            logger:debug("未配置数据 唯一Id ~w",
                                         [{Unique,
                                           maze_data:get_data_other({Unique,
                                                                     Type})}],
                                         maze,
                                         650),
                            {false, lang:get("数据配置出错")}
                    end;
                _R ->
                    logger:debug("========抓妖出错了====== ~w", [_R], maze, 654),
                    {false, lang:get("位置错误")}
            end;
        _ -> {ok, Role, 0}
    end.

grab_over(Role = #role{m_maze =
                           MMaze = #m_maze{opens = Opens}},
          Pos) ->
    case lists:keyfind(Pos, #maze_open.pos, Opens) of
        #maze_open{type = 2, id = 5, flag = 0} = MazeOpen ->
            NewMazeOpen = MazeOpen#maze_open{flag = 1},
            Role1 = Role#role{m_maze =
                                  MMaze#m_maze{status = 0,
                                               opens =
                                                   lists:keystore(Pos,
                                                                  #maze_open.pos,
                                                                  Opens,
                                                                  NewMazeOpen)}},
            NewRole = var:set_var(Role1, other, 2079, 0),
            push(NewRole),
            {ok, NewRole};
        _ -> ok
    end.

apperceive(Role = #role{m_maze =
                            MMaze = #m_maze{emptys = Emptys, opens = Opens,
                                            times = OpenTimes, piece = Piece,
                                            piece_other = PieceOther,
                                            events = Events}}) ->
    Loss = format:val_to_loss([{21221, 1}]),
    case role_gain:do(Loss, Role) of
        {ok, Role1} ->
            case do_apperceive(Emptys, Opens) of
                {ok, Pos = {X, Y}} ->
                    {NewPiece, NewPieceOther} = case
                                                    cal_piece(#maze_open{pos =
                                                                             Pos},
                                                              OpenTimes,
                                                              Piece,
                                                              PieceOther)
                                                    of
                                                    {Piece1, PieceOther1} ->
                                                        {Piece1, PieceOther1};
                                                    Piece1 ->
                                                        {Piece1, PieceOther}
                                                end,
                    {OtherMMaze, _OtherArgs} = do_other_dig(Events,
                                                            MMaze,
                                                            #{pos => Pos}),
                    NewRole = Role1#role{m_maze =
                                             OtherMMaze#m_maze{times =
                                                                   OpenTimes +
                                                                       1,
                                                               piece = NewPiece,
                                                               piece_other =
                                                                   NewPieceOther,
                                                               opens =
                                                                   lists:keystore(Pos,
                                                                                  #maze_open.pos,
                                                                                  Opens,
                                                                                  #maze_open{pos
                                                                                                 =
                                                                                                 Pos,
                                                                                             x
                                                                                                 =
                                                                                                 X,
                                                                                             y
                                                                                                 =
                                                                                                 Y,
                                                                                             times
                                                                                                 =
                                                                                                 1,
                                                                                             hard
                                                                                                 =
                                                                                                 1})}},
                    push(NewRole),
                    {ok,
                     role_trigger:fire(#evt_maze_sweep{}, NewRole),
                     lang:get("地穴感知成功，排除一个大坑{face_1, 18}")};
                _ -> {false, lang:get("场上已经没有大坑啦{face_1, 38}")}
            end;
        {false, #loss{msg = Msg}} -> {false, Msg}
    end.

do_apperceive([], _Opens) -> false;
do_apperceive([Pos | T], Opens) ->
    case lists:keyfind(Pos, #maze_open.pos, Opens) of
        false -> {ok, Pos};
        _ -> do_apperceive(T, Opens)
    end.

double(Role = #role{m_maze =
                        MMaze = #m_maze{double = Double}})
    when Double =:= 0 ->
    Loss = format:val_to_loss([{21222, 1}]),
    Role1 = Role#role{m_maze = MMaze#m_maze{double = 1}},
    case role_gain:do(Loss, Role1) of
        {ok, NewRole} ->
            push(NewRole),
            {ok, NewRole};
        {false, #loss{msg = Msg}} -> {false, Msg}
    end;
double(_) -> {false, lang:get("已使用双倍卡,不能重复使用")}.

monster_reward(Role, _Pos) ->
    {Exp, PetExp} = get_exp(Role),
    {Exp, PetExp}.

clean_monster(Role = #role{m_maze =
                               MMaze = #m_maze{opens = Opens}},
              Pos) ->
    Fighting = get(maze_fighting_monster),
    logger:debug("当前正在挑战怪物 ~w ~w",
                 [Fighting, Pos],
                 maze,
                 734),
    case lists:keyfind(Pos, #maze_open.pos, Opens) of
        _ when Fighting =:= Pos ->
            {false, lang:get("正在与该妖怪战斗")};
        #maze_open{type = 2, id = 1, flag = 0} = MazeOpen ->
            {Exp, PetExp} = get_exp(Role),
            Gain = format:val_to_gain([{90010, Exp},
                                       {90005, PetExp}]),
            Loss = format:val_to_loss([{21220, 1}]),
            case role_gain:do_notice(Loss ++ Gain, Role) of
                {ok, GainRole} ->
                    NewRole = GainRole#role{m_maze =
                                                MMaze#m_maze{opens =
                                                                 lists:keystore(Pos,
                                                                                #maze_open.pos,
                                                                                Opens,
                                                                                MazeOpen#maze_open{flag
                                                                                                       =
                                                                                                       1})}},
                    push(NewRole),
                    NewRole1 = role_trigger:fire(#evt_treasure{base_id =
                                                                   21220},
                                                 NewRole),
                    {ok, NewRole1};
                {false, #loss{msg = Msg}} -> {false, Msg};
                {false, #gain{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("没怪物可清除")}
    end.

combat_start(#role{m_team =
                       #m_team{pid = Pid, status = Status}},
             _Pos)
    when is_pid(Pid) andalso Status =:= 2 ->
    {false, lang:get("只能单人除妖，请先离开队伍或者暂离")};
combat_start(#role{m_team =
                       #m_team{pid = Pid, status = Status, member_num = Num}},
             _Pos)
    when is_pid(Pid) andalso Status =/= 3 andalso Num > 1 ->
    {false, lang:get("只能单人除妖，请先离开队伍或者暂离")};
combat_start(Role = #role{m_maze =
                              #m_maze{opens = Opens}},
             Pos) ->
    case role_misc:check_event(Role) of
        true ->
            case lists:keyfind(Pos, #maze_open.pos, Opens) of
                #maze_open{type = 2, id = 1, flag = 0} ->
                    put(maze_fighting_monster, Pos),
                    {ok, Unit} = unit_convert:to(unit, 73050),
                    _Res = combat_mgr:start_combat(55,
                                                   [Role],
                                                   Unit,
                                                   #combat_start_args{ext_args =
                                                                          Pos}),
                    ok;
                _ -> {false, lang:get("没怪物可挑战")}
            end;
        {false, Reason} -> {false, Reason}
    end;
combat_start(_Role, _Pos) ->
    {false, lang:get("当前没有怪物可挑战")}.

combat_over(#combat{start_args =
                        #combat_start_args{ext_args = Pos},
                    winner = Winner, loser = Loser}) ->
    logger:debug("战斗结束 ~w",
                 [[Rid || #fighter{rid = Rid, type = 2} <- Winner]],
                 maze,
                 783),
    logger:debug("战斗结束 ~w",
                 [[Rid || #fighter{attr = Rid, type = 2} <- Loser]],
                 maze,
                 784),
    [role:apply(async,
                {Rid, Platform, ZoneId},
                {maze, combat_over, [lose]})
     || #fighter{rid = Rid, platform = Platform,
                 zone_id = ZoneId, type = 1}
            <- Loser],
    [role:apply(async,
                {Rid, Platform, ZoneId},
                {maze, combat_over, [Pos]})
     || #fighter{rid = Rid, platform = Platform,
                 zone_id = ZoneId, type = 1}
            <- Winner].

combat_over(_Role, lose) ->
    erlang:erase(maze_fighting_monster),
    ok;
combat_over(Role = #role{m_maze =
                             MMaze = #m_maze{opens = Opens}},
            Pos) ->
    erlang:erase(maze_fighting_monster),
    logger:debug("战斗结束 玩家进程 ~w", [Role#role.id], maze, 793),
    case lists:keyfind(Pos, #maze_open.pos, Opens) of
        #maze_open{type = 2, id = 1, flag = 0} = MazeOpen ->
            NewRole = Role#role{m_maze =
                                    MMaze#m_maze{opens =
                                                     lists:keystore(Pos,
                                                                    #maze_open.pos,
                                                                    Opens,
                                                                    MazeOpen#maze_open{flag
                                                                                           =
                                                                                           1})}},
            push(NewRole),
            notice:send(Role, 1, lang:get("成功消灭怪物")),
            {ok, NewRole};
        _R -> ok
    end.

get(Role = #role{m_maze =
                     MMaze = #m_maze{opens = Opens}},
    Pos) ->
    case lists:keyfind(Pos, #maze_open.pos, Opens) of
        #maze_open{times = Times, hard = Hard, reward = Reward,
                   type = Type} =
            MazeOpen
            when Times =:= Hard andalso
                     Type =:= 1 andalso Reward =/= [] ->
            log:maze(Role, Reward, lang:get("领取道具")),
            Role1 = Role#role{m_maze =
                                  MMaze#m_maze{opens =
                                                   lists:keystore(Pos,
                                                                  #maze_open.pos,
                                                                  Opens,
                                                                  MazeOpen#maze_open{reward
                                                                                         =
                                                                                         []})}},
            case role_gain:do_notice(format:val_to_gain(Reward),
                                     Role1)
                of
                {ok, NewRole} ->
                    push(NewRole),
                    {ok, NewRole};
                _ ->
                    push(Role1),
                    Content =
                        notice:format(lang:get("你在宝藏迷城里获得奖励时背包已满，以下是你的奖励\n~ts"),
                                      [{string_2,
                                        5,
                                        lang:get("（温馨提醒：邮件数量有一定上限，超出上限后最早的邮件将被删除，请及时领取邮件奖励哟）")}]),
                    mail:send(Role1,
                              #{title => lang:get("宝藏迷城"), content => Content,
                                items => Reward}),
                    notice:send(Role,
                                1,
                                notice:format(lang:get("获得~ts"),
                                              [{item_2, Reward}])),
                    {ok, Role1}
            end;
        #maze_open{times = Times, hard = Hard, reward = Reward,
                   type = Type}
            when Times =:= Hard andalso
                     Type =:= 1 andalso Reward =:= [] ->
            {false, lang:get("该奖励已领取")};
        #maze_open{times = Times, hard = Hard, type = Type}
            when Times < Hard andalso Type =:= 1 ->
            {false, lang:get("未达到可领取条件")};
        _R -> {false, lang:get("没有道具可领取")}
    end.

get_final(Role = #role{name = Name,
                       m_maze =
                           MMaze = #m_maze{dungeon = Dungeon, piece = Times,
                                           opens = Opens}}) ->
    case check([monster, open], {1, 1}, Opens) of
        ok ->
            case lists:keyfind({1, 1}, #maze_open.pos, Opens) of
                #maze_open{flag = Flag} = MazeOpen when Flag =:= 0 ->
                    case length(Times) >= 2 of
                        true ->
                            {Reward, IsCast} = get_final_reward(Role, Dungeon),
                            Reward1 = item_type:special_id(Reward),
                            Gain = format:val_to_gain(Reward1),
                            Role1 = Role#role{m_maze =
                                                  MMaze#m_maze{times = 0,
                                                               piece = [],
                                                               opens =
                                                                   lists:keystore({1,
                                                                                   1},
                                                                                  #maze_open.pos,
                                                                                  Opens,
                                                                                  MazeOpen#maze_open{flag
                                                                                                         =
                                                                                                         1})}},
                            case IsCast of
                                1 ->
                                    Notice =
                                        notice:format(lang:get("~ts福至心灵，解开~ts的最终珍宝时，获得了一件~ts{face_1, "
                                                               "18}"),
                                                      [{role_2, Name},
                                                       {string_2,
                                                        1,
                                                        util:flist(["[",
                                                                    lang:get("宝藏迷城"),
                                                                    "]"])},
                                                       {item_2, Reward1}]),
                                    notice:cast(all, 5, Notice);
                                _ -> false
                            end,
                            log:maze(Role, Reward1, lang:get("领取终极道具")),
                            case get(final_ref) of
                                Tref when is_reference(Tref) ->
                                    erlang:cancel_timer(Tref);
                                _ -> skip
                            end,
                            NewTref = erlang:send_after(10 * 1000,
                                                        self(),
                                                        {apply_async,
                                                         {maze, reset, []}}),
                            put(final_ref, NewTref),
                            notice:send(Role,
                                        7,
                                        notice:format(lang:get("获得~ts"),
                                                      [{item_2, Reward1}])),
                            case role_gain:do(Gain, Role1) of
                                {ok, NewRole} ->
                                    push(NewRole),
                                    {ok,
                                     NewRole,
                                     [{ItemId1, Num1}
                                      || {ItemId1, _Bind, Num1} <- Reward1]};
                                {false, #gain{msg = _Msg}} ->
                                    mail:send(Role,
                                              #{title => lang:get("宝藏迷城"),
                                                content =>
                                                    lang:get("你在获得最终秘宝时背包已满，以下是你获得的奖励"),
                                                items => Reward1}),
                                    {ok,
                                     Role1,
                                     [{ItemId1, Num1}
                                      || {ItemId1, _Bind, Num1} <- Reward1]}
                            end;
                        _ ->
                            {false,
                             notice:format(lang:get("~ts尚未激活，无法开启~ts"),
                                           [{string_2, 5, lang:get("秘宝钥匙")},
                                            {string_2, 5, lang:get("神秘宝藏")}])}
                    end;
                _ -> {false, lang:get("该奖励已领取")}
            end;
        {false, Reason} -> {false, Reason}
    end.

get_final_reward(#role{lev = Lev,
                       m_lev_break = #m_lev_break{times = BreakTimes}},
                 Dungeon) ->
    Datas = maze_data:get_dungeon_data(Dungeon),
    {WorldLev, _Time} = world_lev:get_world_lev(),
    NewDatas = maze_util:select_data(#{lev => Lev,
                                       break_times => BreakTimes,
                                       world_lev => WorldLev},
                                     Datas,
                                     []),
    {_Odds, Reward, Cast} = util:rand_list(NewDatas, 1),
    {Reward, Cast}.

apply_point(Role = #role{m_maze =
                             MMaze = #m_maze{status = 7, others = Others}}) ->
    case get(tref) of
        TRef when is_reference(TRef) ->
            erlang:cancel_timer(TRef);
        _ -> skip
    end,
    logger:debug("精灵指引播放特效完成", [], maze, 891),
    NewMMaze = MMaze#m_maze{piece_other = Others,
                            status = 0, others = []},
    NewRole = Role#role{m_maze = NewMMaze},
    push(NewRole),
    {ok, NewRole};
apply_point(_) ->
    logger:debug("精灵指引播放特效已完成", [], maze, 897),
    ok.

reward_dragon(Role = #role{m_maze =
                               MMaze = #m_maze{others = Others, datas = Datas,
                                               opens = Opens,
                                               emptys = Emptys}}) ->
    case get(tref) of
        TRef when is_reference(TRef) ->
            erlang:cancel_timer(TRef);
        _ -> skip
    end,
    {NewDatas, NewOpens} = get_datas_opens_by_pos(Datas,
                                                  Opens,
                                                  Emptys,
                                                  Others),
    logger:debug("=====炎龙爆发撞击位置===== ~w",
                 [Others],
                 maze,
                 907),
    NewMMaze = MMaze#m_maze{opens = NewOpens,
                            datas = NewDatas, others = [], status = 0},
    NewRole = Role#role{m_maze = NewMMaze},
    push(NewRole),
    {ok, NewRole}.

get_datas_opens_by_pos(Datas, Opens, Emptys, Poss) ->
    Fun = fun (Pos, {DatasAcc, OpensAcc}) ->
                  case lists:keyfind(Pos, #maze_open.pos, OpensAcc) of
                      false ->
                          {MazeOpen = #maze_open{times = Times, hard = Hard},
                           DataAcc1} =
                              get_maze_open(Pos, Emptys, DatasAcc),
                          Hard1 = case Hard >= 2 of
                                      true -> Hard;
                                      _ -> 2
                                  end,
                          {DataAcc1,
                           lists:keystore(Pos,
                                          #maze_open.pos,
                                          OpensAcc,
                                          MazeOpen#maze_open{times = Times + 1,
                                                             hard = Hard1})};
                      _ -> {DatasAcc, OpensAcc}
                  end
          end,
    {NewDatas, NewOpens} = lists:foldl(Fun,
                                       {Datas, Opens},
                                       Poss),
    {NewDatas, NewOpens}.

reward_event(Role = #role{id = _RoleId,
                          m_maze =
                              MMaze = #m_maze{opens = Opens, events = Events,
                                              dungeon = Dungeon}},
             Pos) ->
    Result = case lists:keyfind(12,
                                #maze_event.e_id,
                                Events)
                 of
                 #maze_event{e_pos = EPos, e_flag = 0} = MonkeyEvent
                     when EPos =:= Pos ->
                     {ok, MonkeyEvent};
                 _ ->
                     case lists:keyfind(Pos, #maze_event.e_pos, Events) of
                         #maze_event{e_flag = 0} = NornalEvent ->
                             {ok, NornalEvent};
                         _ -> {false, lang:get("已领取奖励,不能重复领取")}
                     end
             end,
    case Result of
        {ok,
         #maze_event{e_reward = Reward, e_id = EId} = Event} ->
            case check_event(Event, Opens, Events) of
                ok ->
                    EventReward = get_event_reward(Event, Dungeon),
                    logger:debug("领取奖励 ~w",
                                 [{Pos,
                                   Event,
                                   Reward,
                                   EventReward,
                                   lists:keyfind(Pos, #maze_open.pos, Opens),
                                   Opens}],
                                 maze,
                                 948),
                    Reward1 = item_type:special_id(Reward ++ EventReward),
                    Gain = format:val_to_gain(Reward1),
                    case role_gain:do_notice(Gain, Role) of
                        {ok, Role1} ->
                            Events1 = case EId of
                                          12 ->
                                              lists:keystore(EId,
                                                             #maze_event.e_id,
                                                             Events,
                                                             Event#maze_event{e_flag
                                                                                  =
                                                                                  1});
                                          _ ->
                                              lists:keystore(Pos,
                                                             #maze_event.e_pos,
                                                             Events,
                                                             Event#maze_event{e_flag
                                                                                  =
                                                                                  1})
                                      end,
                            Role2 = case lists:keyfind(Pos,
                                                       #maze_open.pos,
                                                       Opens)
                                        of
                                        false ->
                                            Role1#role{m_maze =
                                                           MMaze#m_maze{events =
                                                                            Events1}};
                                        Open ->
                                            logger:debug("===========~w",
                                                         [Open],
                                                         maze,
                                                         961),
                                            Opens1 = lists:keystore(Pos,
                                                                    #maze_open.pos,
                                                                    Opens,
                                                                    Open#maze_open{flag
                                                                                       =
                                                                                       1,
                                                                                   reward
                                                                                       =
                                                                                       [],
                                                                                   times
                                                                                       =
                                                                                       1,
                                                                                   hard
                                                                                       =
                                                                                       1}),
                                            Role1#role{m_maze =
                                                           MMaze#m_maze{events =
                                                                            Events1,
                                                                        opens =
                                                                            Opens1}}
                                    end,
                            NewRole = fire([Event], Role2),
                            push(NewRole),
                            {ok, lang:get("领取成功"), NewRole};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

fire([], Role) -> Role;
fire([#maze_event{e_id = EId, e_flag = 0} | T], Role)
    when EId =:= 8 ->
    fire(T, role_trigger:fire(#evt_maze_cat{}, Role));
fire([#maze_event{e_reward = Reward, e_id = EId,
                  e_flag = 0}
      | T],
     Role)
    when EId =:= 10 ->
    OldGold = var:get_var(Role, other, 2085, 0),
    GoldAdd = case lists:keyfind(90003, 1, Reward) of
                  {_, _, GoldBind} -> GoldBind;
                  _ -> 0
              end,
    NewGold = OldGold + GoldAdd,
    RoleGold = var:set_var(Role, other, 2085, NewGold),
    fire(T,
         role_trigger:fire(#evt_maze_gold{gold = NewGold},
                           RoleGold));
fire([#maze_event{e_id = EId, e_flag = 0} | T], Role)
    when EId =:= 12 ->
    fire(T, role_trigger:fire(#evt_maze_monkey{}, Role));
fire([_ | T], Role) -> fire(T, Role).

get_event_reward(#maze_event{e_type = Type, e_id = Id,
                             e_unique = Unique},
                 Dungeon)
    when Type =:= 2 andalso Id =:= 9 ->
    case maze_data:get_data_other({Dungeon, Unique}) of
        #{other := Other} ->
            Reward = [{ItemId, 0, Num}
                      || {ItemId, Num, Odds, _IsCast} <- Other, Odds =:= 0],
            case util:rand_list(Other, 3) of
                {ItemId1, Num1, _Odds1, _IsCast1} ->
                    [{ItemId1, 0, Num1} | Reward];
                _ -> Reward
            end;
        _ -> []
    end;
get_event_reward(#maze_event{e_type = Type, e_id = Id,
                             e_unique = Unique, e_reward = EReward},
                 Dungeon)
    when Type =:= 2 andalso Id =:= 12 ->
    case EReward of
        [] ->
            case maze_data:get_data_other({Dungeon, Unique}) of
                #{other := Other} ->
                    Reward = [{ItemId, 0, Num}
                              || {ItemId, Num, Odds, _IsCast} <- Other,
                                 Odds =:= 0],
                    case util:rand_list(Other, 3) of
                        {ItemId1, Num1, _Odds1, _IsCast1} ->
                            [{ItemId1, 0, Num1} | Reward];
                        _ -> Reward
                    end;
                _ -> []
            end;
        _ -> []
    end;
get_event_reward(_, _Dungeon) -> [].

do_dragon(#maze_open{x = X0, y = Y0}, Opens, Times) ->
    AllList = [{X, Y}
               || X <- lists:seq(1, 5), Y <- lists:seq(1, 5)],
    OpenList = [{X, Y}
                || #maze_open{x = X, y = Y} <- Opens],
    LastList = AllList -- OpenList,
    do_dragon(LastList -- [{1, 1}, {5, 5}, {X0, Y0}],
              AllList -- [{1, 1}, {5, 5}, {X0, Y0}],
              Times,
              []).

do_dragon(_, _, Times, List) when Times =< 0 -> List;
do_dragon([], AllList, Times, List) ->
    Pos = util:rand_list(AllList),
    AllList1 = lists:delete(Pos, AllList),
    logger:debug("炎龙冲撞  ~w",
                 [{Pos, Times, AllList1, List}],
                 maze,
                 1046),
    do_dragon([], AllList1, Times - 1, [Pos | List]);
do_dragon(LastList, AllList, Times, List) ->
    Pos = util:rand_list(LastList),
    LastList1 = lists:delete(Pos, LastList),
    AllList1 = AllList -- [Pos],
    logger:debug("炎龙冲撞  ~w",
                 [{Pos, Times, List, LastList1, AllList1}],
                 maze,
                 1052),
    do_dragon(LastList1, AllList1, Times - 1, [Pos | List]).

linkage({X, Y},
        MMaze = #m_maze{opens = Opens, datas = Datas,
                        emptys = Emptys}) ->
    Around = [{X - 1, Y},
              {X + 1, Y},
              {X, Y - 1},
              {X, Y + 1}],
    Around1 = [{X1, Y1}
               || {X1, Y1} <- Around,
                  X1 =< 5 andalso X1 > 0 andalso Y1 =< 5 andalso Y1 > 0],
    OpenList = [{X1, Y1}
                || #maze_open{x = X1, y = Y1} <- Opens],
    Around2 = Around1 -- OpenList,
    logger:debug("=======~w",
                 [{Around, Around1, Around2, OpenList}],
                 maze,
                 1061),
    {NewDatas, NewOpens} = get_datas_opens_by_pos(Datas,
                                                  Opens,
                                                  Emptys,
                                                  Around2),
    MMaze#m_maze{opens = NewOpens, datas = NewDatas}.

check([], _Pos, _Opens) -> ok;
check([monster | T], Pos, Opens) ->
    case check_monster(Pos, Opens) of
        ok -> check(T, Pos, Opens);
        Reason -> Reason
    end;
check([open | T], Pos, Opens) ->
    case check_open(Pos, Opens) of
        ok -> check(T, Pos, Opens);
        Reason -> Reason
    end.

check_open([], _Opens) -> {false, lang:get("你尚未到达这里")};
check_open([Pos | T], Opens) ->
    case lists:keyfind(Pos, #maze_open.pos, Opens) of
        #maze_open{type = Type, id = Id}
            when Type =:= 3 andalso Id =:= 2 ->
            check_open(T, Opens);
        #maze_open{type = Type, times = Times, hard = Hard}
            when Type > 0 andalso Times >= Hard ->
            ok;
        _ -> check_open(T, Opens)
    end;
check_open({X, Y}, Opens) ->
    Around = [{X - 1, Y},
              {X + 1, Y},
              {X, Y - 1},
              {X, Y + 1}],
    logger:debug("======= ~w", [Around], maze, 1090),
    check_open(Around, Opens).

check_monster([], _Opens) -> ok;
check_monster([Pos | T], Opens) ->
    case lists:keyfind(Pos, #maze_open.pos, Opens) of
        #maze_open{type = 2, id = 1, flag = 0, times = Times,
                   hard = Hard}
            when Times =:= Hard ->
            {false, lang:get("附近有妖怪，请先除妖")};
        _ -> check_monster(T, Opens)
    end;
check_monster({X, Y}, Opens) ->
    Around = [{X - 1, Y - 1},
              {X - 1, Y},
              {X - 1, Y + 1},
              {X, Y - 1},
              {X, Y + 1},
              {X + 1, Y - 1},
              {X + 1, Y},
              {X + 1, Y + 1}],
    check_monster(Around, Opens).

check_event(#maze_event{e_x = X, e_y = Y, e_id = 12},
            Opens, Events) ->
    case maze_util:get_next_pos({X, Y},
                                Opens,
                                Events,
                                {0, 0})
        of
        false -> ok;
        _ -> {false, lang:get("尚未困住猴子,还不能领取奖励")}
    end;
check_event(#maze_event{e_x = X, e_y = Y, e_id = 9},
            Opens, _Events) ->
    case maze_util:get_remain_pos(Opens, {X, Y}) of
        [] -> ok;
        _R -> {false, lang:get("清除所有石板救我{face_1, 21}")}
    end;
check_event(_, _, _) -> ok.

apply_evt(#evt_dungeon_pass{id = DungeonId},
          Role = #role{m_maze = MMaze = #m_maze{pass = Pass}}) ->
    case lists:member(DungeonId, Pass) of
        true -> ok;
        _ ->
            {ok,
             Role#role{m_maze =
                           MMaze#m_maze{pass = [DungeonId | Pass]}}}
    end.

get_maze_open({X, Y} = Pos, Emptys, Datas) ->
    case lists:member(Pos, Emptys) of
        true ->
            {#maze_open{x = X, y = Y, pos = Pos, hard = 1}, Datas};
        _ ->
            {Pos, Unique, Type, BaseId, Num, Hard} = case
                                                         lists:keyfind(Pos,
                                                                       1,
                                                                       Datas)
                                                         of
                                                         {_Pos0,
                                                          Unique0,
                                                          Type0,
                                                          BaseId0,
                                                          Num0,
                                                          Hard0} ->
                                                             {Pos,
                                                              Unique0,
                                                              Type0,
                                                              BaseId0,
                                                              Num0,
                                                              Hard0};
                                                         {_Pos0,
                                                          Unique0,
                                                          Type0,
                                                          BaseId0,
                                                          Hard0} ->
                                                             logger:debug("啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",
                                                                          [],
                                                                          maze,
                                                                          1142),
                                                             {Pos,
                                                              Unique0,
                                                              Type0,
                                                              BaseId0,
                                                              1,
                                                              Hard0};
                                                         _R ->
                                                             logger:debug("啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊 ~w",
                                                                          [_R],
                                                                          maze,
                                                                          1145),
                                                             {_Pos0,
                                                              Unique0,
                                                              Type0,
                                                              BaseId0,
                                                              Num1,
                                                              Hard0} =
                                                                 lists:keyfind({0,
                                                                                0},
                                                                               1,
                                                                               Datas),
                                                             {Pos,
                                                              Unique0,
                                                              Type0,
                                                              BaseId0,
                                                              Num1,
                                                              Hard0}
                                                     end,
            Reward = case Type of
                         1 -> [{BaseId, 0, Num}];
                         _ -> []
                     end,
            {#maze_open{type = Type, id = BaseId, hard = Hard,
                        x = X, y = Y, pos = Pos, unique = Unique,
                        reward = item_type:special_id(Reward)},
             lists:keydelete(Pos, 1, Datas)}
    end.

cal_piece(_MazeOpen, OpenTimes, _Piece, _PieceOther)
    when OpenTimes >= 21 ->
    lists:seq(1, 3);
cal_piece(_MazeOpen, _OpenTimes, Piece, _PieceOther)
    when length(Piece) >= 3 ->
    Piece;
cal_piece(#maze_open{type = 2, id = 6}, _OpenTimes,
          Piece, _PieceOther) ->
    Piece;
cal_piece(_MazeOpen, OpenTimes, Piece, []) ->
    case maze_data:get_piece(OpenTimes) of
        #{odds := Odds, max := Max} ->
            case length(Piece) >= Max of
                true -> Piece;
                _ ->
                    case util:rand(1, 1000) of
                        Rand when Rand =< Odds ->
                            PieceLast = lists:seq(1, 3) -- Piece,
                            NewPiece = util:rand_list(PieceLast),
                            [NewPiece | Piece];
                        _R -> Piece
                    end
            end;
        _ -> Piece
    end;
cal_piece(#maze_open{pos = Pos}, _OpenTimes, Pieces,
          PieceOther) ->
    case lists:keyfind(Pos, 1, PieceOther) of
        {Pos, Piece} ->
            {[Piece | Pieces], lists:keydelete(Pos, 1, PieceOther)};
        _ -> Pieces
    end.

send_mail(_Role, []) -> ok;
send_mail(Role,
          [#maze_event{e_id = Id, e_flag = Flag,
                       e_reward = Reward}
           | T])
    when Id =:= 7 andalso Flag =:= 0 ->
    mail:send(Role,
              lang:get("浣熊君的献礼"),
              lang:get("浣熊君在宝藏迷城里执意要送你礼物，你未及时领取。浣熊君特定邮寄给了你。请查收。"),
              Reward),
    send_mail(Role, T);
send_mail(Role,
          [#maze_event{e_id = Id, e_flag = Flag,
                       e_reward = Reward}
           | T])
    when Id =:= 8 andalso Flag =:= 0 ->
    mail:send(Role,
              lang:get("龙猫君的谢礼"),
              lang:get("宝藏迷城里迷了路的龙猫君，在你的帮助下找到了自己的小窝。这个是它给你的谢礼，请查收。"),
              Reward),
    send_mail(Role, T);
send_mail(Role = #role{m_maze =
                           #m_maze{dungeon = Dungeon, opens = Opens}},
          [#maze_event{e_id = Id, e_flag = Flag,
                       e_reward = Reward, e_x = X, e_y = Y} =
               Event
           | T])
    when Id =:= 9 andalso Flag =:= 0 ->
    case maze_util:get_remain_pos(Opens, {X, Y}) of
        [] ->
            EventReward = get_event_reward(Event, Dungeon),
            mail:send(Role,
                      lang:get("萌物的谢礼"),
                      lang:get("你在宝藏迷城里解救的小萌物知恩图报，为你送来了它的谢礼，请查收。"),
                      Reward ++ EventReward);
        _ ->
            logger:info("还没全部打开,不发送解救奖励", [], maze, 1203),
            ok
    end,
    send_mail(Role, T);
send_mail(Role,
          [#maze_event{e_id = Id, e_flag = Flag,
                       e_reward = Reward}
           | T])
    when Id =:= 10 andalso Flag =:= 0 ->
    mail:send(Role,
              lang:get("点石成金"),
              lang:get("宝藏迷城里的金钱狐为你点石成金，一共炼化了如下金币，请查收。"),
              Reward),
    send_mail(Role, T);
send_mail(Role, [_R | T]) -> send_mail(Role, T).

get_marmot_name(1) -> lang:get("土拨鼠·啾啾");
get_marmot_name(2) -> lang:get("土拨鼠·丢丢");
get_marmot_name(_) -> lang:get("土拨鼠·溜溜").

get_exp(#role{lev = Lev}) ->
    case unit_data:get(73050) of
        #unit_data{gain = Gain} ->
            ExpId1 = case lists:keyfind(90010, 2, Gain) of
                         {ExpId, _} -> ExpId;
                         _ -> 0
                     end,
            PetExpId1 = case lists:keyfind(90005, 2, Gain) of
                            {PetExpId, _} -> PetExpId;
                            _ -> 0
                        end,
            do_get_exp(Lev, ExpId1, PetExpId1);
        _R -> {0, 0}
    end.

do_get_exp(Lev, ExpId, PetExpId) ->
    Exp1 = case levup_data:get_exp({ExpId, Lev}) of
               #{exp := Exp} -> Exp;
               _ -> 0
           end,
    PetExp1 = case levup_data:get_exp({PetExpId, Lev}) of
                  #{pet_exp := PetExp} -> PetExp;
                  _ -> 0
              end,
    {Exp1, PetExp1}.

check_maze(Pid, MMaze) ->
    {Flag, NewMMaze} = do_check_maze(MMaze),
    case Flag of
        false -> MMaze;
        _ ->
            role:apply(async, Pid, {maze, fix_data, []}),
            NewMMaze
    end.

do_check_maze(MMaze = #m_maze{opens = Opens}) ->
    Fun = fun (Open = #maze_open{x = X, y = Y,
                                 reward = Reward},
               {Args1, Args2})
                  when is_integer(X) andalso is_integer(Y) ->
                  case do_check_maze_reward(Reward) of
                      ok -> {Args1, [Open | Args2]};
                      _ -> {reset, Args2}
                  end;
              (_, {reset, Args2}) -> {reset, Args2};
              (_, {_, Args2}) -> {true, Args2}
          end,
    {Flag, NewOpens} = lists:foldl(Fun, {false, []}, Opens),
    {Flag, MMaze#m_maze{opens = NewOpens}}.

do_check_maze_reward([]) -> ok;
do_check_maze_reward([{ItemId, Bind, Num} | T])
    when is_integer(ItemId) andalso
             is_integer(Bind) andalso is_integer(Num) ->
    do_check_maze_reward(T);
do_check_maze_reward([_H | _T]) ->
    logger:info("错误的奖励数据 ~w ~w", [_H, _T], maze, 1281),
    false.

fix_data(Role = #role{id = RoleId, m_maze = MMaze}) ->
    {Flag, NewMMaze} = do_check_maze(MMaze),
    case Flag of
        true ->
            logger:info("玩家 ~w 珍宝石板出现错误数据 ~w",
                        [RoleId, MMaze],
                        maze,
                        1288),
            role:link_send(Role, 18800, {NewMMaze}),
            {ok, Role#role{m_maze = NewMMaze}};
        reset ->
            logger:info("玩家 ~w 珍宝石板出现错误数据 需要重置 ~w",
                        [RoleId, MMaze],
                        maze,
                        1292),
            NewMMaze1 = init(Role),
            NewRole = Role#role{m_maze = NewMMaze1},
            maze:push(NewRole),
            {ok, NewRole};
        _ -> ok
    end.

gm(Role = #role{m_maze =
                    MMaze = #m_maze{opens = Opens}},
   X, Y, Type, Id, Hard, SpecialId) ->
    Status = case Type =:= 2 andalso Id =:= 1 of
                 true -> 1;
                 _ -> 0
             end,
    NewRole = Role#role{m_maze =
                            MMaze#m_maze{status = Status,
                                         opens =
                                             lists:keystore({X, Y},
                                                            #maze_open.pos,
                                                            Opens,
                                                            #maze_open{pos =
                                                                           {X,
                                                                            Y},
                                                                       x = X,
                                                                       y = Y,
                                                                       type =
                                                                           Type,
                                                                       id = Id,
                                                                       special_id
                                                                           =
                                                                           SpecialId,
                                                                       hard =
                                                                           Hard,
                                                                       times =
                                                                           1})}},
    push(NewRole),
    {ok, NewRole}.

gm_reset(Role) ->
    NewMMaze = init(Role),
    NewRole = Role#role{m_maze =
                            NewMMaze#m_maze{pass =
                                                [10135, 10150, 10165, 10180]}},
    maze:push(NewRole),
    {ok, NewRole}.

gm_data(Role) ->
    Maze = init(Role),
    NewRole = Role#role{m_maze = Maze},
    {ok, NewRole}.

gm_test(Role = #role{m_maze = MMaze}, Times) ->
    Pass = [10135],
    Result = calc_times(lists:seq(1, Times),
                        Role#role{m_maze = MMaze#m_maze{pass = Pass}},
                        []),
    _Result2 = deal_result(Result, []),
    logger:debug("==========~w",
                 [lists:keysort(3, _Result2)],
                 maze,
                 1331),
    ok.

calc_times([], _Role, Result) -> Result;
calc_times([_ | T], Role, Result) ->
    NewMMaze = #m_maze{dungeon = Dungeon, datas = Datas} =
                   init(Role),
    Open = [begin
                #{odds := Odds} = maze_data:get_data_other({Dungeon,
                                                            Unique}),
                {Unique, Odds}
            end
            || {_Pos, Unique, _Type, _Id, _Num, _Hard} <- Datas],
    calc_times(T,
               Role#role{m_maze = NewMMaze},
               Open ++ Result).

deal_result([], Result) -> Result;
deal_result([{Unique, Odds} | T], Result) ->
    Times1 = case lists:keyfind(Unique, 1, Result) of
                 {Unique, _, Times} -> Times;
                 _ -> 0
             end,
    deal_result(T,
                lists:keystore(Unique,
                               1,
                               Result,
                               {Unique, Odds, Times1 + 1})).

