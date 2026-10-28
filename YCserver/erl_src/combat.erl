-file("src/mod/combat/combat.erl", 1).

-module(combat).

-behaviour(gen_fsm).

-export([start/3,
         start/4,
         init_m_combat/0,
         login/1,
         role_disconnect/1,
         role_switch/1,
         apply_observe/3,
         combat_over/1,
         pack_10722/1,
         pack_10722/2,
         pack_10722_ob/2,
         pack_10723/2,
         pack_10733/2,
         pack_10733_ob/3,
         pack_10732/3,
         pack_10771/2,
         pack_10773/2,
         pack_10740/1,
         preside/2,
         add_next_wave/3,
         append_infos/1,
         chat/2,
         choose_targets/5,
         for_attack_start/7,
         system_joined_play/1]).

-export([first_round/2,
         fight_wait/2,
         fight_playing/2,
         fight_playing_idle/2,
         play_calc/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

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

-file("src/mod/combat/combat.erl", 73).

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

-file("src/mod/combat/combat.erl", 74).

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

-file("src/mod/combat/combat.erl", 75).

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

-file("src/mod/combat/combat.erl", 76).

-file("inc/skill.hrl", 1).

-record(m_skill,
        {ver = 6 :: pos_integer(),
         skills = [] :: [{non_neg_integer(), non_neg_integer()}],
         is_open_skl_prac = 0 :: 0 | 1,
         selected_skl_prac = 0 :: non_neg_integer(),
         skill_prac = [] :: list(),
         skill_couple = [] :: list(),
         skill_sworn = [] :: list(),
         speed = [] :: list(),
         skill_unique = [],
         skill_clsld_done = [],
         unique_coolddown_time = 0,
         skl_unique_point = 100,
         sq_double = 0,
         is_open_sq_double = 0,
         sq_exp_statistics = []}).

-record(role_base_skill,
        {id = 0,
         lev = 0,
         type :: undefined | non_neg_integer(),
         sub_type :: undefined | non_neg_integer(),
         max_lev = 0,
         name = "",
         way = 1,
         study_lev = 1,
         cost = [],
         attr = []}).

-record(skill,
        {id = 0,
         lev = 0,
         type = 0 :: non_neg_integer(),
         sub_type = 0 :: non_neg_integer(),
         speed = 1,
         name = "",
         acc_ratio = 1000,
         acc_low = 0,
         acc_high = 1000,
         attack_type = 0 :: non_neg_integer(),
         elem_type = 0 :: non_neg_integer(),
         target_type = 1 :: non_neg_integer(),
         attack_times = 1 :: non_neg_integer(),
         target_list = [],
         self_cond = [],
         self_loss = [],
         target_cond = [],
         dmg_addt = 0 :: non_neg_integer(),
         dmg_ratio = [1000] :: non_neg_integer(),
         pre_cooldown = 0,
         cooldown = 0 :: non_neg_integer(),
         cost_mp = 0 :: non_neg_integer(),
         cost_anger = 0,
         cost_other = [] :: [{atom(), non_neg_integer()}],
         buff_self = [] :: [tuple()],
         buff_target = [] :: [tuple()],
         script_id = 0 :: non_neg_integer(),
         script_args = [] :: [integer()],
         addt_scripts = [] ::
             [{non_neg_integer(), non_neg_integer(), list()}],
         play_time = 0 :: non_neg_integer()}).

-record(chief_classes,
        {leader_id = 0,
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         looks = []}).

-record(sq_exp_statistics,
        {combat_type = 0, times = 0, gain = 0, real_gain = 0}).

-file("src/mod/combat/combat.erl", 77).

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

-file("src/mod/combat/combat.erl", 78).

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

-file("src/mod/combat/combat.erl", 79).

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

-file("src/mod/combat/combat.erl", 80).

-file("inc/camp_pet_egg.hrl", 1).

-author("Lith").

-file("src/mod/combat/combat.erl", 81).

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

-file("src/mod/combat/combat.erl", 82).

-spec init_m_combat() -> #m_combat{}.

init_m_combat() -> #m_combat{}.

-spec login(Role) -> {ok, NewRole :: #role{}} |
                     ok when Role :: #role{}.

login(Role = #role{status = 2,
                   m_combat = MC = #m_combat{pid = CombatPid}}) ->
    case is_pid(CombatPid) andalso
             util:is_process_alive(CombatPid)
        of
        true -> ok;
        false ->
            {ok,
             Role#role{status = 0,
                       m_combat = MC#m_combat{pid = undefined}}}
    end;
login(Role = #role{status = Status,
                   m_combat = MC = #m_combat{pid = CombatPid}}) ->
    case is_pid(CombatPid) andalso
             util:is_process_alive(CombatPid)
        of
        true -> ok;
        false ->
            {ok,
             Role#role{status = Status,
                       m_combat = MC#m_combat{pid = undefined}}}
    end;
login(_) -> ok.

-spec role_disconnect(Role) -> ok when Role :: #role{}.

role_disconnect(#role{id = RoleId, pid = Pid,
                      name = _Name,
                      m_combat =
                          #m_combat{pid = CombatPid,
                                    observe_pid = ObCombatPid}}) ->
    case is_pid(CombatPid) of
        true -> CombatPid ! {role_online, Pid, 0};
        false ->
            case is_pid(ObCombatPid) of
                true -> ObCombatPid ! {observer_leave, RoleId};
                false -> skip
            end
    end,
    ok.

-spec role_switch(Role) -> NewRole ::
                               #role{} when Role :: #role{}.

role_switch(Role = #role{pid = Pid,
                         m_combat = Mc = #m_combat{pid = CombatPid}}) ->
    case is_pid(CombatPid) andalso
             util:is_process_alive(CombatPid)
        of
        true ->
            CombatPid ! {role_online, Pid, 1},
            Role;
        false ->
            Role#role{status = 0,
                      m_combat = Mc#m_combat{pid = undefined}}
    end.

chat(CombatPid, {Label, RoleId, Msg}) ->
    CombatPid ! {chat, Label, RoleId, Msg}.

pack_10710(F, Combat, EnterType, StateName) ->
    pack_10710(F, Combat, EnterType, StateName, 0).

pack_10775(Pid,
           #combat{type = CombatType, round = Round}) ->
    case skill_combat_data:get_observer_skill(CombatType) of
        [_ | _] ->
            Reply = case get(observe_help_info) of
                        {SkillInfo, _ObserHelpCd, _SysEffectCd} ->
                            {SkillInfo, Round};
                        _ -> {[], Round}
                    end,
            logger:debug("进入观战, 返回数据:~w", [Reply], combat, 153),
            role:pack_send(Pid, 10775, Reply);
        _ -> ok
    end.

pack_10776(Pid, RoleId, #combat{type = CombatType}) ->
    case skill_combat_data:get_observer_skill(CombatType) of
        ObserveSkill = [_ | _] ->
            Reply = case get(observe_help_info) of
                        {SkillInfo, ObserHelpCd, _SysEffectCd} ->
                            Now = case CombatType of
                                      71 -> get(gods_challenge_wave);
                                      _ -> date:unixtime()
                                  end,
                            ReplyData = case lists:keyfind(RoleId,
                                                           1,
                                                           ObserHelpCd)
                                            of
                                            {RoleId, UseData} ->
                                                [begin
                                                     {Count, SkillStatus} = case
                                                                                lists:keyfind(SkillId,
                                                                                              1,
                                                                                              SkillInfo)
                                                                                of
                                                                                {_,
                                                                                 SkillCount,
                                                                                 _Status} ->
                                                                                    {SkillCount,
                                                                                     _Status};
                                                                                _ERR ->
                                                                                    {0,
                                                                                     0}
                                                                            end,
                                                     Status1 = case
                                                                   lists:keyfind(SkillId,
                                                                                 1,
                                                                                 ObserveSkill)
                                                                   of
                                                                   {_Id,
                                                                    _Lev,
                                                                    _Target,
                                                                    CfgCount,
                                                                    _Cd,
                                                                    CfgTime} ->
                                                                       Now -
                                                                           UseTime
                                                                           >=
                                                                           CfgTime
                                                                           andalso
                                                                           Count
                                                                               <
                                                                               CfgCount
                                                                               andalso
                                                                               SkillStatus
                                                                                   =:=
                                                                                   1;
                                                                   _ -> false
                                                               end,
                                                     Status = case Status1 of
                                                                  true -> 1;
                                                                  _ -> 0
                                                              end,
                                                     {SkillId, Status}
                                                 end
                                                 || {SkillId, UseTime}
                                                        <- UseData];
                                            _ ->
                                                [{SkillId, 0}
                                                 || {SkillId, _, _, _, _, _}
                                                        <- ObserveSkill]
                                        end,
                            {ReplyData};
                        _ -> {[]}
                    end,
            logger:debug("进入观战, 返回数据:~w", [Reply], combat, 216),
            role:pack_send(Pid, 10776, Reply);
        _ -> ok
    end.

pack_10710(#fighter{id = Fid, pid = Pid,
                    skill_infos = SkillInfos,
                    pet_skill_infos = PetSkillInfos,
                    child_skill_infos = ChildSkillInofs,
                    has_use_item = HasUseItem,
                    has_summon_pet = HasSummonPet, backup_pets = BackUpPets,
                    backup_childs = BackUpChilds, anger = Anger,
                    combat_init_attr =
                        #combat_init_attr{use_anger_ratio = UseAngerRatio}},
           Combat = #combat{type = CombatType,
                            start_time = StartTime,
                            atk_formation = AtkFormationId,
                            atk_formation_lev = AtkFormationLev,
                            dfd_formation = DfdFormationId,
                            dfd_formation_lev = DfdFormationLev, round = Round,
                            cur_plot = CurPlot},
           EnterType, StateName, WatcherView)
    when is_pid(Pid) ->
    {Status, WaitTime, Time} = get_wait_time(Combat,
                                             StateName),
    GuideId1 = case CurPlot of
                   {_, _, GuideId} -> GuideId;
                   _ -> 0
               end,
    SkillCd = combat_skill:get_skill_cooldown_info(Fid),
    SummonSkillCd =
        combat_skill:get_summon_skill_cooldown_info(Fid),
    Data = {CombatType,
            EnterType,
            WatcherView,
            StartTime,
            AtkFormationId,
            AtkFormationLev,
            DfdFormationId,
            DfdFormationLev,
            Round,
            GuideId1,
            Status,
            WaitTime,
            Time,
            append_infos(combat_cache:all_living()),
            HasSummonPet,
            HasUseItem,
            Anger,
            UseAngerRatio,
            SkillInfos,
            PetSkillInfos,
            ChildSkillInofs,
            SkillCd,
            SummonSkillCd,
            BackUpPets,
            BackUpChilds},
    role:pack_send(Pid, 10710, Data),
    ok;
pack_10710(Pid,
           Combat = #combat{type = CombatType,
                            start_time = StartTime,
                            atk_formation = AtkFormationId,
                            atk_formation_lev = AtkFormationLev,
                            dfd_formation = DfdFormationId,
                            dfd_formation_lev = DfdFormationLev, round = Round,
                            cur_plot = CurPlot},
           EnterType, StateName, WatcherView)
    when is_pid(Pid) ->
    {Status, WaitTime, Time} = get_wait_time(Combat,
                                             StateName),
    GuideId1 = case CurPlot of
                   {_, _, GuideId} -> GuideId;
                   _ -> 0
               end,
    role:pack_send(Pid,
                   10710,
                   {CombatType,
                    EnterType,
                    WatcherView,
                    StartTime,
                    AtkFormationId,
                    AtkFormationLev,
                    DfdFormationId,
                    DfdFormationLev,
                    Round,
                    GuideId1,
                    Status,
                    WaitTime,
                    Time,
                    append_infos(combat_cache:all_living()),
                    0,
                    0,
                    0,
                    0,
                    [],
                    [],
                    [],
                    [],
                    [],
                    [],
                    []}),
    ok;
pack_10710(_, _, _, _, _) -> ok.

pack_10710(Combat = #combat{type = CombatType,
                            start_time = StartTime,
                            atk_formation = AtkFormationId,
                            atk_formation_lev = AtkFormationLev,
                            dfd_formation = DfdFormationId,
                            dfd_formation_lev = DfdFormationLev, round = Round,
                            cur_plot = CurPlot},
           EnterType, StateName) ->
    {Status, WaitTime, Time} = get_wait_time(Combat,
                                             StateName),
    GuideId1 = case CurPlot of
                   {_, _, GuideId} -> GuideId;
                   _ -> 0
               end,
    lists:foreach(fun (#fighter{id = Fid, type = 1,
                                pid = Pid, skill_infos = SkillInfos,
                                pet_skill_infos = PetSkillInfos,
                                child_skill_infos = ChildSkillInofs,
                                has_use_item = HasUseItem,
                                has_summon_pet = HasSummonPet, anger = Anger,
                                backup_pets = BackUpPets,
                                backup_childs = BackUpChilds,
                                combat_init_attr =
                                    #combat_init_attr{use_anger_ratio =
                                                          UseAngerRatio}})
                          when is_pid(Pid) ->
                          SkillCd = combat_skill:get_skill_cooldown_info(Fid),
                          SummonSkillCd =
                              combat_skill:get_summon_skill_cooldown_info(Fid),
                          Data = {CombatType,
                                  EnterType,
                                  0,
                                  StartTime,
                                  AtkFormationId,
                                  AtkFormationLev,
                                  DfdFormationId,
                                  DfdFormationLev,
                                  Round,
                                  GuideId1,
                                  Status,
                                  WaitTime,
                                  Time,
                                  append_infos(combat_cache:all_living()),
                                  HasSummonPet,
                                  HasUseItem,
                                  Anger,
                                  UseAngerRatio,
                                  SkillInfos,
                                  PetSkillInfos,
                                  ChildSkillInofs,
                                  SkillCd,
                                  SummonSkillCd,
                                  BackUpPets,
                                  BackUpChilds},
                          role:pack_send(Pid, 10710, Data),
                          ok;
                      (_) -> skip
                  end,
                  combat_cache:all()),
    ok.

pack_10710_record(Combat = #combat{type = CombatType,
                                   start_time = StartTime,
                                   atk_formation = AtkFormationId,
                                   atk_formation_lev = AtkFormationLev,
                                   dfd_formation = DfdFormationId,
                                   dfd_formation_lev = DfdFormationLev,
                                   round = Round, cur_plot = CurPlot},
                  StateName) ->
    EnterType = 3,
    {Status, WaitTime, Time} = get_wait_time(Combat,
                                             StateName),
    GuideId1 = case CurPlot of
                   {_, _, GuideId} -> GuideId;
                   _ -> 0
               end,
    combat_record:add_buffer(10710,
                             {CombatType,
                              EnterType,
                              0,
                              StartTime,
                              AtkFormationId,
                              AtkFormationLev,
                              DfdFormationId,
                              DfdFormationLev,
                              Round,
                              GuideId1,
                              Status,
                              WaitTime,
                              Time,
                              append_infos(combat_cache:all_living()),
                              0,
                              0,
                              0,
                              0,
                              [],
                              [],
                              [],
                              [],
                              [],
                              [],
                              []}),
    ok.

pack_10720(Data) ->
    combat_util:pack_cast(combat_cache:all(), 10720, Data),
    ok.

pack_10720(Pid, Data) ->
    role:pack_send(Pid, 10720, Data),
    ok.

pack_10720_ob(Observers, Data) ->
    combat_record:add_buffer(10720, Data),
    combat_util:pack_cast(Observers, 10720, Data),
    ok.

pack_10722({StartTime, Data = [_ | _]}) ->
    combat_util:pack_cast(combat_cache:all(),
                          10722,
                          {StartTime, Data}),
    ok;
pack_10722(_) -> ok.

pack_10722(Group, {StartTime, Data = [_ | _]}) ->
    combat_util:pack_cast(combat_cache:all(Group),
                          10722,
                          {StartTime, Data}),
    ok;
pack_10722(_, _) -> ok.

pack_10722_ob({StartTime, Data = [_ | _]}, Observers) ->
    combat_record:add_buffer(10722, {StartTime, Data}),
    combat_util:pack_cast(Observers,
                          10722,
                          {StartTime, Data}),
    ok;
pack_10722_ob(_, _) -> ok.

pack_10723(Group, {StartTime, Data = [_ | _]}) ->
    combat_record:add_buffer(10723, {StartTime, Data}),
    combat_util:pack_cast(combat_cache:all(Group),
                          10723,
                          {StartTime, Data}),
    ok;
pack_10723(_, _) -> ok.

pack_10733(Pid, Data) ->
    role:pack_send(Pid, 10733, Data),
    ok.

pack_10733(auto, Fid, Flag) ->
    combat_util:pack_cast(combat_cache:all(),
                          10733,
                          {Fid, Flag, 0, 0, 0}),
    ok.

pack_10732(Pid, Flag, Reason) ->
    role:pack_send(Pid, 10732, {Flag, Reason}),
    ok.

pack_10771(Pid, Data) ->
    role:pack_send(Pid, 10771, Data),
    ok.

pack_10773(Pid, Data) ->
    role:pack_send(Pid, 10773, Data),
    ok.

pack_10733_ob(Observers, Fid, Flag) ->
    combat_util:pack_cast(Observers,
                          10733,
                          {Fid, Flag, 0, 0, 0}),
    ok.

pack_10740(#fighter{type = 1, is_escape = 0, pid = Pid,
                    is_auto = IsAuto}) ->
    role:pack_send(Pid, 10740, {IsAuto, 1, ""}),
    ok;
pack_10740(_) -> ok.

get_wait_time(#combat{t_play = Tplay, t_idle = Tidle,
                      ts = Ts},
              StateName) ->
    Fun = fun (first_round) -> {0, 0, 30000 div 1000};
              (fight_wait) -> {0, 0, 30000 div 1000};
              (fight_playing) ->
                  {1,
                   (util:time_left(Tplay, Ts) + 30000) div 1000,
                   30000 div 1000};
              (fight_playing_idle) ->
                  {1, util:time_left(30000, Ts) div 1000, 30000 div 1000};
              (play_calc) ->
                  {2, util:time_left(Tidle, Ts) div 1000, 0}
          end,
    Fun(StateName).

-spec start(CombatType, AtkList, DfdList) -> {ok,
                                              pid()} |
                                             ignore |
                                             {error, term()} when CombatType ::
                                                                      non_neg_integer(),
                                                                  AtkList ::
                                                                      [#fighter{}],
                                                                  DfdList ::
                                                                      [#fighter{}].

start(Type, AtkList, DfdList) ->
    start(Type, AtkList, DfdList, #combat_start_args{}).

start(_, [], _, _) -> {error, lang:get("没有进攻方")};
start(_, _, [], _) -> {error, lang:get("没有防守方")};
start(Type, AtkList, DfdList, StartArgs)
    when is_record(StartArgs, combat_start_args) ->
    case gen_fsm:start(combat,
                       [Type, AtkList, DfdList, StartArgs],
                       [])
        of
        {ok, Pid} -> {ok, Pid};
        {error, Reason} ->
            {error, util:term_to_bitstring(Reason)}
    end;
start(Type, AtkList, DfdList, _) ->
    start(Type, AtkList, DfdList, #combat_start_args{}).

preside(CombatPid,
        {RolePid, Fid, PresideType, SelfPreside, TargetPreside})
    when is_pid(CombatPid) andalso is_pid(RolePid) ->
    CombatPid !
        {preside,
         {RolePid,
          Fid,
          PresideType,
          SelfPreside,
          TargetPreside}};
preside(_, _) -> ok.

init([_, [], _, _]) -> {stop, normal};
init([_, _, [], _]) -> {stop, normal};
init([CombatType,
      OriginAtkList,
      OriginDfdList,
      StartArgs]) ->
    put({combat_guards, 0}, []),
    put({combat_guards, 1}, []),
    Combat = #combat{type = CombatType, pid = self(),
                     start_time = date:unixtime(), start_args = StartArgs},
    combat_cache:init(Combat, OriginAtkList, OriginDfdList),
    {OriginAtkList1,
     OriginDfdList1,
     AtkForMation,
     AtkForMationLev,
     DfdForMation,
     DfdForMationLev} =
        combat_fighter:add_slave(CombatType,
                                 OriginAtkList,
                                 OriginDfdList),
    {OriginAtkList2, OriginDfdList2} =
        combat_plot:plot_fighter_init(OriginAtkList1,
                                      OriginDfdList1),
    put(init_fighter, {OriginAtkList2, OriginDfdList2}),
    OriginAtkList3 = combat_fighter:fighter_init(0,
                                                 CombatType,
                                                 OriginAtkList2),
    OriginDfdList3 = combat_fighter:fighter_init(1,
                                                 CombatType,
                                                 OriginDfdList2),
    OriginAtkList4 = combat_fighter:formation_init(0,
                                                   AtkForMation,
                                                   AtkForMationLev,
                                                   OriginAtkList3,
                                                   CombatType,
                                                   DfdForMation,
                                                   DfdForMationLev),
    OriginDfdList4 = combat_fighter:formation_init(1,
                                                   DfdForMation,
                                                   DfdForMationLev,
                                                   OriginDfdList3,
                                                   CombatType,
                                                   AtkForMation,
                                                   AtkForMationLev),
    OriginAtkList5 =
        combat_fighter:modify_cost_mp_ratio(CombatType,
                                            OriginAtkList4),
    OriginDfdList5 =
        combat_fighter:modify_cost_mp_ratio(CombatType,
                                            OriginDfdList4),
    {OriginAtkList6, OriginDfdList6} =
        combat_fighter:special_init(CombatType,
                                    StartArgs,
                                    OriginAtkList5,
                                    OriginDfdList5),
    LastOriginAtkList =
        combat_fighter:disturb_action_order(OriginAtkList6),
    LastOriginDfdList =
        combat_fighter:disturb_action_order(OriginDfdList6),
    put(0, LastOriginAtkList),
    put(1, LastOriginDfdList),
    put(init_fighter,
        {LastOriginAtkList, LastOriginDfdList}),
    init_type(Combat),
    Context = #combat_context{type = CombatType,
                              start_time = date:unixtime(), pos_num = 13,
                              origin_atk = LastOriginAtkList,
                              origin_dfd = LastOriginDfdList, round = 1},
    put(context, Context),
    combat_play:init(),
    combat_buff:buff_init(0),
    combat_buff:buff_init(1),
    combat_buff:init_special(Combat),
    add_observe_attack(Combat),
    ok,
    self() ! init,
    Combat1 = Combat#combat{ts = erlang:now(),
                            atk_formation = AtkForMation,
                            atk_formation_lev = AtkForMationLev,
                            dfd_formation = DfdForMation,
                            dfd_formation_lev = DfdForMationLev},
    [logger:debug("防守方：~ts 血量:~w 物理攻击：~w， 魔攻：~w, Id: ~w",
                  [_Name, _HpMax, _PhyDmg, _MagicDmg, _Id],
                  combat,
                  489)
     || #fighter{id = _Id, name = _Name,
                 attr =
                     #attr{hp_max = _HpMax, phy_dmg = _PhyDmg,
                           magic_dmg = _MagicDmg}}
            <- combat_cache:dfd()],
    [logger:debug("攻击方：~ts 血量:~w 物理攻击：~w， 魔攻：~w, Id: ~w",
                  [_Name, _HpMax, _PhyDmg, _MagicDmg, _Id],
                  combat,
                  490)
     || #fighter{id = _Id, name = _Name,
                 attr =
                     #attr{hp_max = _HpMax, phy_dmg = _PhyDmg,
                           magic_dmg = _MagicDmg}}
            <- combat_cache:atk()],
    {ok, first_round, Combat1}.

handle_event(_Event, StateName, Combat) ->
    continue(StateName, Combat).

handle_sync_event(_Event, _From, StateName, Combat) ->
    {reply, ok, StateName, Combat}.

handle_info(print_stat, StateName, Combat) ->
    Fighters = combat_cache:all(),
    _Stars = [Stat
              || #fighter{combat_statistics = Stat} <- Fighters],
    logger:debug("==========:~w", [_Stars], combat, 505),
    continue(StateName, Combat);
handle_info(init, StateName,
            Combat = #combat{type = CombatType, round = Round}) ->
    case combat_fighter:all_enter(combat_cache:all(),
                                  [],
                                  [],
                                  Combat)
        of
        true ->
            combat_util:cast_enemy(Combat,
                                   combat_cache:atk(),
                                   combat_cache:dfd()),
            Combat1 = case combat_plot:has_plot(1, Combat) of
                          false -> Combat;
                          {true, GuideId, NewF = #fighter{id = Fid}} ->
                              combat_cache:u(NewF),
                              Combat#combat{cur_plot = {Fid, Round, GuideId}}
                      end,
            combat_fighter:sort_action(),
            pack_10710(Combat1, 0, StateName),
            pack_10710_record(Combat1, StateName),
            ok,
            ok,
            ok,
            NewCombat = Combat1#combat{ts = erlang:now()},
            NewCombat1 = case NewCombat#combat.cur_plot of
                             {FinishFid, FinishRound, _GuideId}
                                 when Round >= FinishRound ->
                                 F = combat_cache:f(by_id, FinishFid),
                                 NF = #fighter{plot = _Plot} =
                                          plot_combat:finish(F),
                                 combat_cache:u(NF),
                                 NewCombat#combat{cur_plot = 0};
                             _ -> NewCombat
                         end,
            {next_state, first_round, NewCombat1, 3000};
        {false, Reason, NeedExitRoleList, NeedExitUnitList} ->
            lists:foreach(fun (#fighter{pid = Pid}) ->
                                  role:apply(async,
                                             Pid,
                                             {combat_fighter,
                                              enter_combat_failed,
                                              [self(), CombatType]})
                          end,
                          NeedExitRoleList),
            lists:foreach(fun (#fighter{pid = Pid}) ->
                                  unit:combat_info(Pid, {fail, self(), [], []})
                          end,
                          NeedExitUnitList),
            {stop,
             normal,
             Combat#combat{start_failed_reason = Reason}}
    end;
handle_info({ready, _, _}, play_calc, Combat) ->
    continue(play_calc, Combat);
handle_info({ready, Pid, Round}, StateName,
            Combat = #combat{round = Round}) ->
    case combat_cache:f(by_pid, Pid) of
        false -> continue(StateName, Combat);
        F = #fighter{id = Fid, name = _Name} ->
            ok,
            NewF = F#fighter{is_ready = 1},
            combat_cache:u(NewF),
            Flag = case StateName of
                       first_round -> is_all_action(ready_mode) =:= true;
                       fight_wait -> is_all_action(auto_mode) =:= true;
                       fight_playing -> false;
                       fight_playing_idle -> is_all_action(auto_mode) =:= true;
                       play_calc -> false
                   end,
            case Flag of
                false ->
                    ok,
                    pack_10733(auto, Fid, 1),
                    continue(StateName, Combat);
                true ->
                    ok,
                    round_calc(Combat)
            end;
        _ -> continue(StateName, Combat)
    end;
handle_info({ready, _, _}, StateName, Combat) ->
    continue(StateName, Combat);
handle_info({set_auto, Pid, IsAuto}, play_calc,
            Combat) ->
    role:pack_send(Pid,
                   10740,
                   {IsAuto, 0, lang:get("无需更改战斗状态")}),
    continue(play_calc, Combat);
handle_info({set_auto, Pid, IsAuto}, StateName,
            Combat = #combat{}) ->
    case combat_cache:f(by_pid, Pid) of
        false -> continue(StateName, Combat);
        #fighter{force_is_auto = 1} ->
            continue(StateName, Combat);
        F = #fighter{id = Fid, name = _Name} ->
            ok,
            role:pack_send(Pid, 10740, {IsAuto, 1, ""}),
            IsReady = case StateName of
                          first_round -> 0;
                          fight_wait -> IsAuto;
                          fight_playing -> 0;
                          fight_playing_idle -> IsAuto;
                          play_calc -> IsAuto
                      end,
            NewF = F#fighter{is_auto = IsAuto, is_ready = IsReady},
            combat_cache:u(NewF),
            Flag = case StateName of
                       first_round -> is_all_action(ready_mode) =:= true;
                       fight_wait -> is_all_action(auto_mode) =:= true;
                       fight_playing -> false;
                       fight_playing_idle -> is_all_action(auto_mode) =:= true;
                       play_calc -> false
                   end,
            case Flag of
                false ->
                    ok,
                    pack_10733(auto, Fid, IsAuto),
                    continue(StateName, Combat);
                true ->
                    ok,
                    round_calc(Combat)
            end;
        _ -> continue(StateName, Combat)
    end;
handle_info({role_online, Pid, 1}, StateName, Combat) ->
    case combat_cache:f(by_pid, Pid) of
        false -> ignore;
        F -> combat_cache:u(F#fighter{is_hosted = 0})
    end,
    continue(StateName, Combat);
handle_info({role_online, Pid, 0}, StateName, Combat) ->
    case combat_cache:f(by_pid, Pid) of
        false -> ignore;
        F -> combat_cache:u(F#fighter{is_hosted = 1})
    end,
    Flag = case StateName of
               first_round -> is_all_action(ready_mode) =:= true;
               fight_wait -> is_all_action(auto_mode) =:= true;
               fight_playing -> false;
               fight_playing_idle -> is_all_action(auto_mode) =:= true;
               play_calc -> false
           end,
    case Flag of
        false ->
            ok,
            continue(StateName, Combat);
        true ->
            ok,
            round_calc(Combat)
    end;
handle_info({role_online_in_combat, _Pid}, play_calc,
            Combat) ->
    continue(play_calc, Combat);
handle_info({role_online_in_combat, Pid}, StateName,
            Combat = #combat{}) ->
    case combat_cache:f(by_pid, Pid) of
        F = #fighter{} ->
            endless_challenge_combat:push_combat_info(Combat, Pid),
            glory_combat:push_combat_info(Combat, Pid),
            spirit_treasure_combat:push_combat_info(Combat, Pid),
            pack_10710(F, Combat, 1, StateName),
            ok;
        _ -> ignore
    end,
    continue(StateName, Combat);
handle_info({cancel_skill, Pid}, StateName, Combat)
    when StateName =:= first_round orelse
             StateName =:= fight_playing orelse
                 StateName =:= fight_playing_idle orelse
                     StateName =:= fight_wait ->
    case combat_cache:f(by_pid, Pid) of
        #fighter{action = undefined} -> false;
        Atk = #fighter{id = Fid, is_escape = 0} ->
            logger:debug("=========", [], combat, 695),
            case combat_cache:f(by_master_pid, Pid) of
                PFighter = #fighter{id = PFid, is_die = 0,
                                    is_escape = 0, action = Action}
                    when Action =/= undefined ->
                    logger:debug("=========", [], combat, 700),
                    NPFighter = PFighter#fighter{action = undefined,
                                                 is_auto = 0},
                    combat_cache:u(NPFighter),
                    lists:foreach(fun (#fighter{type = 1, pid = RPid})
                                          when is_pid(RPid) ->
                                          Data = {PFid, 0},
                                          role:pack_send(RPid, 10735, Data),
                                          ok;
                                      (_) -> ignore
                                  end,
                                  combat_cache:all()),
                    true;
                _ ->
                    NewAtk = Atk#fighter{action = undefined,
                                         pre_action = undefined, is_auto = 0},
                    combat_cache:u(NewAtk),
                    lists:foreach(fun (#fighter{type = 1, pid = RPid})
                                          when is_pid(RPid) ->
                                          Data = {Fid, 0},
                                          role:pack_send(RPid, 10735, Data),
                                          ok;
                                      (_) -> ignore
                                  end,
                                  combat_cache:all()),
                    true
            end;
        _ -> false
    end,
    logger:debug("~w", [StateName], combat, 727),
    continue(StateName, Combat);
handle_info({cancel_skill, _}, StateName, Combat) ->
    continue(StateName, Combat);
handle_info({cancel_pre_skill, Pid}, StateName, Combat)
    when StateName =:= first_round orelse
             StateName =:= fight_playing orelse
                 StateName =:= fight_playing_idle orelse
                     StateName =:= fight_wait ->
    case combat_cache:f(by_pid, Pid) of
        #fighter{action = Action} when Action =/= undefined ->
            false;
        #fighter{pre_action = undefined} -> false;
        Atk = #fighter{id = Fid, action = undefined,
                       is_escape = 0,
                       pre_action =
                           {#c_skill{skill =
                                         #skill{id = SkillId, lev = SkillLev}},
                            _}} ->
            NewAtk = Atk#fighter{pre_action = undefined,
                                 is_auto = 0},
            combat_cache:u(NewAtk),
            Data = {Fid, 0, 0, SkillId, SkillLev},
            pack_10733(Pid, Data);
        _ -> false
    end,
    continue(StateName, Combat);
handle_info({cancel_pre_skill, _}, StateName, Combat) ->
    continue(StateName, Combat);
handle_info({choose_skill,
             Pid,
             SkillId,
             TargetId,
             OtherId},
            StateName, Combat)
    when StateName =:= first_round orelse
             StateName =:= fight_playing orelse
                 StateName =:= fight_playing_idle orelse
                     StateName =:= fight_wait ->
    case combat_skill:choose_skill(Pid,
                                   SkillId,
                                   TargetId,
                                   OtherId,
                                   Combat)
        of
        false -> continue(StateName, Combat);
        true ->
            Flag = case StateName of
                       first_round -> is_all_action(ready_mode) =:= true;
                       fight_wait -> is_all_action(auto_mode) =:= true;
                       fight_playing -> false;
                       fight_playing_idle -> is_all_action(auto_mode) =:= true
                   end,
            case Flag of
                false ->
                    ok,
                    continue(StateName, Combat);
                true ->
                    ok,
                    round_calc(Combat)
            end
    end;
handle_info({choose_skill, _, _SkillId, _, _},
            StateName, Combat) ->
    continue(StateName, Combat);
handle_info({choose_pre_skill,
             Pid,
             SkillId,
             TargetId,
             OtherId},
            StateName, Combat)
    when StateName =:= first_round orelse
             StateName =:= fight_playing orelse
                 StateName =:= fight_playing_idle orelse
                     StateName =:= fight_wait ->
    case combat_skill:choose_pre_skill(Pid,
                                       SkillId,
                                       TargetId,
                                       OtherId,
                                       Combat)
        of
        false -> continue(StateName, Combat);
        true -> continue(StateName, Combat)
    end;
handle_info({choose_pre_skill, _, _SkillId, _, _},
            StateName, Combat) ->
    continue(StateName, Combat);
handle_info({choose_pet_skill,
             Pid,
             SkillId,
             TargetId,
             OtherId},
            StateName, Combat)
    when StateName =:= first_round orelse
             StateName =:= fight_playing orelse
                 StateName =:= fight_playing_idle orelse
                     StateName =:= fight_wait ->
    case combat_skill:choose_pet_skill(Pid,
                                       SkillId,
                                       TargetId,
                                       OtherId,
                                       Combat)
        of
        false -> continue(fight_wait, Combat);
        true ->
            Flag = case StateName of
                       first_round -> is_all_action(ready_mode);
                       fight_wait -> is_all_action(auto_mode);
                       fight_playing -> false;
                       fight_playing_idle -> is_all_action(auto_mode)
                   end,
            case Flag of
                false ->
                    ok,
                    continue(StateName, Combat);
                true ->
                    ok,
                    round_calc(Combat)
            end
    end;
handle_info({choose_pet_skill, _, _SkillId, _, _},
            StateName, Combat) ->
    continue(StateName, Combat);
handle_info({pet_cancel_pre_skill, Pid}, StateName,
            Combat)
    when StateName =:= first_round orelse
             StateName =:= fight_playing orelse
                 StateName =:= fight_playing_idle orelse
                     StateName =:= fight_wait ->
    case combat_cache:f(by_master_pid, Pid) of
        #fighter{action = Action} when Action =/= undefined ->
            false;
        #fighter{pre_action = undefined} -> false;
        Atk = #fighter{id = Fid, action = undefined,
                       is_escape = 0,
                       pre_action =
                           {#c_skill{skill =
                                         #skill{id = SkillId, lev = SkillLev}},
                            _}} ->
            NewAtk = Atk#fighter{pre_action = undefined,
                                 is_auto = 0},
            combat_cache:u(NewAtk),
            Data = {Fid, 0, 0, SkillId, SkillLev},
            pack_10733(Pid, Data);
        _ -> false
    end,
    continue(StateName, Combat);
handle_info({pet_cancel_pre_skill, _}, StateName,
            Combat) ->
    continue(StateName, Combat);
handle_info({pet_choose_pre_skill,
             Pid,
             SkillId,
             TargetId,
             OtherId},
            StateName, Combat)
    when StateName =:= first_round orelse
             StateName =:= fight_playing orelse
                 StateName =:= fight_playing_idle orelse
                     StateName =:= fight_wait ->
    case combat_skill:pet_choose_pre_skill(Pid,
                                           SkillId,
                                           TargetId,
                                           OtherId,
                                           Combat)
        of
        false -> continue(fight_wait, Combat);
        true -> continue(StateName, Combat)
    end;
handle_info({pet_choose_pre_skill, _, _SkillId, _, _},
            StateName, Combat) ->
    continue(StateName, Combat);
handle_info({preside, _}, play_calc, Combat) ->
    continue(play_calc, Combat);
handle_info({preside,
             {RolePid,
              Fid,
              PresideType,
              SelfPreside,
              TargetPreside}},
            StateName, Combat = #combat{start_time = StartTime}) ->
    Result = case combat_cache:f(by_pid, RolePid) of
                 #fighter{id = Sid, group = Group} ->
                     case combat_cache:f(by_id, Fid) of
                         #fighter{is_escape = 1} ->
                             {false, lang:get("只能对场上目标添加指挥标识")};
                         #fighter{group = Group} ->
                             {NewPresideType, NewPresideText} =
                                 combat_util:check_preside(PresideType,
                                                           SelfPreside),
                             case combat_fighter:preside(1,
                                                         Group,
                                                         Sid,
                                                         Fid,
                                                         NewPresideType,
                                                         NewPresideText)
                                 of
                                 {true, UpdateData} ->
                                     {true, Group, UpdateData};
                                 {false, Reason} -> {false, Reason}
                             end;
                         #fighter{group = Tgroup} ->
                             {NewPresideType, NewPresideText} =
                                 combat_util:check_preside(PresideType,
                                                           TargetPreside),
                             case combat_fighter:preside(0,
                                                         Tgroup,
                                                         Sid,
                                                         Fid,
                                                         NewPresideType,
                                                         NewPresideText)
                                 of
                                 {true, UpdateData} ->
                                     {true, Group, UpdateData};
                                 {false, Reason} -> {false, Reason}
                             end;
                         _ -> {false, ""}
                     end;
                 _ -> {false, ""}
             end,
    case Result of
        {true, GetGroup, GetData} ->
            pack_10723(GetGroup, {StartTime, GetData});
        {false, Rtn} -> role:pack_send(RolePid, 10741, {0, Rtn})
    end,
    continue(StateName, Combat);
handle_info(stop, play_calc, Combat) ->
    continue(play_calc, Combat);
handle_info(stop, _StateName,
            Combat = #combat{observers = Observers}) ->
    Combat1 = Combat#combat{result = 3, winner = [],
                            loser = combat_cache:all()},
    combat_util:pack_cast(Observers, 10789, {3}),
    Combat2 = combat_end:combat_over(Combat1),
    combat_end:combat_over_leave(Combat2),
    {stop, normal, Combat2};
handle_info(stop_result, play_calc, Combat) ->
    continue(play_calc, Combat);
handle_info(stop_result, _StateName,
            Combat = #combat{type = CombatType,
                             observers = Observers, round = CurRound}) ->
    Result =
        combat_util:stop_check_combat_result(CombatType,
                                             CurRound),
    NewCombat = case Result of
                    10 ->
                        Combat#combat{result = 10, winner = combat_cache:atk(),
                                      loser = combat_cache:dfd()};
                    11 ->
                        Combat#combat{result = 11, winner = combat_cache:dfd(),
                                      loser = combat_cache:atk()}
                end,
    lists:foreach(fun (#fighter{type = 1, pid = Pid})
                          when is_pid(Pid) ->
                          CombatResult = case Result of
                                             3 -> 3;
                                             2 -> 2;
                                             _ -> 0
                                         end,
                          role:pack_send(Pid, 10789, {CombatResult});
                      (_) -> skip
                  end,
                  NewCombat#combat.loser),
    lists:foreach(fun (#fighter{type = 1, pid = Pid})
                          when is_pid(Pid) ->
                          CombatResult = case Result of
                                             3 -> 3;
                                             2 -> 2;
                                             _ -> 1
                                         end,
                          role:pack_send(Pid, 10789, {CombatResult});
                      (_) -> skip
                  end,
                  NewCombat#combat.winner),
    combat_util:pack_cast(Observers, 10789, {3}),
    Combat1 = combat_end:combat_over(NewCombat),
    Combat2 = combat_over_statistics(Combat1),
    combat_end:combat_over_leave(Combat2),
    {stop, normal, Combat2};
handle_info({observer_enter, #c_observer{pid = Pid}},
            play_calc, Combat) ->
    role:pack_send(Pid, 10705, {0, lang:get("战斗已经结束")}),
    continue(play_calc, Combat);
handle_info({observer_enter,
             Ob = #c_observer{role_id = {_, Platform, ZoneId},
                              pid = Pid},
             WatchArgs},
            StateName,
            Combat = #combat{type = CombatType,
                             observers = Observers,
                             start_args =
                                 #combat_start_args{ext_args = ExtArgs}}) ->
    case get_attack_and_dfd(CombatType, ExtArgs, WatchArgs)
        of
        {ok, _BeWatcher, Group} ->
            case lists:keyfind(Ob#c_observer.role_id,
                               #c_observer.role_id,
                               Observers)
                of
                false ->
                    case CombatType of
                        71 ->
                            big_world:cast(Platform,
                                           ZoneId,
                                           gods_challenge_agent,
                                           info,
                                           [{observer_enter, Ob}]);
                        _ -> skip
                    end,
                    NewOb = Ob#c_observer{group = Group},
                    role:apply(async,
                               Pid,
                               {combat, apply_observe, [self(), NewOb]}),
                    continue(StateName, Combat);
                #c_observer{} -> continue(StateName, Combat)
            end;
        {false, Reason} ->
            role:pack_send(Pid, 10705, {0, Reason}),
            continue(StateName, Combat)
    end;
handle_info({send_screen_msg, _}, play_calc, Combat) ->
    logger:debug("战斗已经结束...", [], combat, 993),
    continue(play_calc, Combat);
handle_info({send_screen_msg,
             ScreenMsg = #combat_record_chat_mgr{msg = Msg}},
            StateName,
            Combat = #combat{type = CombatType, round = Round,
                             observers = Observers}) ->
    logger:debug("战斗进程收到弹幕信息:~w", [ScreenMsg], combat, 996),
    case check_can_send_screen_msg(CombatType) of
        true ->
            ObserversPids = [{pid, ObPid}
                             || #c_observer{pid = ObPid} <- Observers],
            logger:debug("广播的观战者:~w",
                         [ObserversPids],
                         combat,
                         1001),
            notice:send(ObserversPids, 13, Msg),
            case get(combat_record_screen_msg) of
                MsgList when is_list(MsgList) ->
                    case lists:keyfind(Round, 1, MsgList) of
                        {_, RoundMsgList} ->
                            NewRoundMsgList = lists:sublist([ScreenMsg
                                                             | RoundMsgList],
                                                            30),
                            NewMsgList = lists:keystore(Round,
                                                        1,
                                                        MsgList,
                                                        {Round,
                                                         NewRoundMsgList}),
                            put(combat_record_screen_msg, NewMsgList);
                        _ ->
                            put(combat_record_screen_msg,
                                [{Round, [ScreenMsg]} | MsgList])
                    end;
                _ ->
                    put(combat_record_screen_msg, [{Round, [ScreenMsg]}])
            end,
            continue(StateName, Combat);
        false -> continue(StateName, Combat)
    end;
handle_info({observer_enter_result,
             #c_observer{pid = Pid}},
            play_calc, Combat) ->
    role:pack_send(Pid, 10705, {0, lang:get("战斗已经结束")}),
    continue(play_calc, Combat);
handle_info({observer_enter_result,
             Ob = #c_observer{role_id = RoleId, pid = Pid,
                              group = Group}},
            StateName, Combat = #combat{observers = Observers}) ->
    handle_observer_enter_help_info(Ob, Combat),
    pack_10710(Pid, Combat, 2, StateName, Group),
    pack_10775(Pid, Combat),
    pack_10776(Pid, RoleId, Combat),
    continue(StateName,
             Combat#combat{observers = [Ob | Observers]});
handle_info({observer_leave, RoleId = {_, P, Z}},
            StateName,
            Combat = #combat{type = CombatType,
                             observers = Observers}) ->
    case lists:keyfind(RoleId,
                       #c_observer.role_id,
                       Observers)
        of
        false -> continue(StateName, Combat);
        Ob ->
            case CombatType of
                71 ->
                    big_world:cast(P,
                                   Z,
                                   gods_challenge_agent,
                                   info,
                                   [{observer_leave, RoleId}]);
                _ -> ok
            end,
            continue(StateName,
                     Combat#combat{observers = Observers -- [Ob]})
    end;
handle_info(print_pos, StateName, Combat = #combat{}) ->
    AtkPos = get({pos, 0}),
    DfdPos = get({pos, 1}),
    logger:info("进攻方站位:~w", [AtkPos], combat, 1053),
    logger:info("防守方站位:~w", [DfdPos], combat, 1054),
    continue(StateName, Combat);
handle_info({chat, all, _RoleId, Msg}, StateName,
            Combat) ->
    combat_util:pack_cast(combat_cache:all(), 10400, Msg),
    continue(StateName, Combat);
handle_info({chat, self, RoleId, Msg}, StateName,
            Combat) ->
    case lists:keyfind(RoleId,
                       #fighter.origin_id,
                       combat_cache:all(0))
        of
        #fighter{} ->
            combat_util:pack_cast(combat_cache:all(0), 10400, Msg);
        _ ->
            combat_util:pack_cast(combat_cache:all(1), 10400, Msg)
    end,
    continue(StateName, Combat);
handle_info({use_observe_skill, RoleId, Pid, SkillId},
            StateName,
            Combat = #combat{type = CombatType,
                             observers = Observers, round = Round}) ->
    case skill_combat_data:get_observer_skill(CombatType) of
        ObserveSkill = [_ | _] ->
            Flag = case lists:keyfind(SkillId, 1, ObserveSkill) of
                       {_Id, _Lev, _Target, CfgCount, _Cd, CfgTime} ->
                           case get(observe_help_info) of
                               {SkillInfo, ObserHelpCd1, _SysEffectCd} ->
                                   case lists:keyfind(SkillId, 1, SkillInfo) of
                                       {_SkillId, Count, Status} ->
                                           case Status of
                                               1 ->
                                                   case lists:keyfind(RoleId,
                                                                      1,
                                                                      ObserHelpCd1)
                                                       of
                                                       {_, UseData} ->
                                                           case
                                                               lists:keyfind(SkillId,
                                                                             1,
                                                                             UseData)
                                                               of
                                                               {_, UseTime} ->
                                                                   Now = case
                                                                             CombatType
                                                                             of
                                                                             71 ->
                                                                                 get(gods_challenge_wave);
                                                                             _ ->
                                                                                 date:unixtime()
                                                                         end,
                                                                   Now - UseTime
                                                                       >=
                                                                       CfgTime
                                                                       andalso
                                                                       Count <
                                                                           CfgCount;
                                                               _ -> true
                                                           end;
                                                       _ -> true
                                                   end;
                                               _ -> false
                                           end;
                                       _ -> false
                                   end;
                               _ -> false
                           end;
                       _ -> false
                   end,
            logger:debug("check timecd:~w", [Flag], combat, 1126),
            MaxCount = case lists:keyfind(SkillId, 1, ObserveSkill)
                           of
                           {_, _, _, CfgCount1, _, _} -> CfgCount1;
                           _ -> 0
                       end,
            case Flag of
                true ->
                    SkillProgressInfo = case get(observe_help_info) of
                                            {SkillInfo1,
                                             ObserHelpCd,
                                             _SysEffectCd1} ->
                                                case lists:keyfind(SkillId,
                                                                   1,
                                                                   SkillInfo1)
                                                    of
                                                    {SkillId,
                                                     Count1,
                                                     _Status} ->
                                                        NewSkillInfo =
                                                            lists:keystore(SkillId,
                                                                           1,
                                                                           SkillInfo1,
                                                                           {SkillId,
                                                                            min(MaxCount,
                                                                                Count1
                                                                                    +
                                                                                    1),
                                                                            _Status}),
                                                        Now1 = case CombatType
                                                                   of
                                                                   71 ->
                                                                       get(gods_challenge_wave);
                                                                   _ ->
                                                                       date:unixtime()
                                                               end,
                                                        NewObserHelpCd = case
                                                                             lists:keyfind(RoleId,
                                                                                           1,
                                                                                           ObserHelpCd)
                                                                             of
                                                                             {RoleId,
                                                                              RoleUseData} ->
                                                                                 NewRoleUseData =
                                                                                     lists:keystore(SkillId,
                                                                                                    1,
                                                                                                    RoleUseData,
                                                                                                    {SkillId,
                                                                                                     Now1}),
                                                                                 lists:keystore(RoleId,
                                                                                                1,
                                                                                                ObserHelpCd,
                                                                                                {RoleId,
                                                                                                 NewRoleUseData});
                                                                             _ ->
                                                                                 [{RoleId,
                                                                                   [{SkillId,
                                                                                     Now1}]}
                                                                                  | ObserHelpCd]
                                                                         end,
                                                        put(observe_help_info,
                                                            {NewSkillInfo,
                                                             NewObserHelpCd,
                                                             _SysEffectCd1}),
                                                        NewSkillInfo;
                                                    _ -> SkillInfo1
                                                end;
                                            _ ->
                                                SkillInfo2 = [{SkillId, 1, 1}],
                                                Now2 = case CombatType of
                                                           71 ->
                                                               get(gods_challenge_wave);
                                                           _ -> date:unixtime()
                                                       end,
                                                ObserHelpCd = [{RoleId,
                                                                [{SkillId,
                                                                  Now2}]}],
                                                put(observe_help_info,
                                                    {SkillInfo2,
                                                     ObserHelpCd,
                                                     []}),
                                                SkillInfo2
                                        end,
                    case lists:keyfind(SkillId, 1, ObserveSkill) of
                        {_, _, _, _, _, _CfgCdTime1} ->
                            pack_10776(Pid, RoleId, Combat);
                        _ -> ok
                    end,
                    case lists:keyfind(SkillId, 1, SkillProgressInfo) of
                        {_, NewCount, _} ->
                            case NewCount =:= MaxCount of
                                true ->
                                    big_world:cast(all,
                                                   notice,
                                                   cast,
                                                   [all,
                                                    11,
                                                    lang:get("全服玩家众志成城，在大家的齐心下<color='#00ff00'>天雷</color>已蓄"
                                                             "能完成，正准备向诸神方劈去，挑战者们顿时气势大涨，离胜利又近一步！")]),
                                    big_world:cast(all,
                                                   notice,
                                                   cast,
                                                   [all,
                                                    4,
                                                    lang:get("全服玩家众志成城，在大家的齐心下<color='#00ff00'>天雷</color>已蓄"
                                                             "能完成，正准备向诸神方劈去，挑战者们顿时气势大涨，离胜利又近一步！")]);
                                _ -> ok
                            end;
                        _ -> ok
                    end,
                    role:pack_send(Pid,
                                   10777,
                                   {1, lang:get("天雷蓄能成功，感谢你的参与{face_1,2}")}),
                    combat_observer_reward:use_observer_skill_reward(Pid,
                                                                     CombatType,
                                                                     SkillId),
                    combat_util:pack_cast(Observers,
                                          10775,
                                          {SkillProgressInfo, Round});
                _ ->
                    Msg = lang:get("技能cd冷却中"),
                    role:pack_send(Pid, 10777, {0, Msg})
            end;
        _ -> ok
    end,
    continue(StateName, Combat);
handle_info({get_base_id_hp, Type, QueryBaseId},
            StateName, Combat = #combat{type = CombatType}) ->
    case CombatType =:= Type of
        true ->
            case CombatType of
                71 ->
                    [big_world:cast(gods_challenge_mgr,
                                    info,
                                    [{update_boss_hp, Hp, MaxHp}])
                     || #fighter{hp = Hp, hp_max = MaxHp, base_id = BaseId}
                            <- combat_cache:dfd(),
                        QueryBaseId =:= BaseId],
                    ok;
                _ -> ok
            end;
        _ -> ok
    end,
    continue(StateName, Combat);
handle_info({observer_skill_guarantee, SkillId, Time},
            StateName,
            Combat = #combat{type = CombatType,
                             observers = Observers, round = Round}) ->
    MaxCount = case
                   skill_combat_data:get_observer_skill(CombatType)
                   of
                   ObserverSkill = [_ | _] ->
                       case lists:keyfind(SkillId, 1, ObserverSkill) of
                           {_, _, _, CfgProgress, _, _} -> CfgProgress;
                           _ -> 0
                       end;
                   _ -> 0
               end,
    case get(observe_help_info) of
        {SkillInfo, ObserHelpCd, SysEffectCd} ->
            NewSkillInfo = case lists:keyfind(SkillId, 1, SkillInfo)
                               of
                               {_, Count, Status} ->
                                   case Status =:= 1 of
                                       true ->
                                           case Count < 25 * min(120, Time) of
                                               true ->
                                                   NewCount = min(25 * Time +
                                                                      util:rand(1,
                                                                                20),
                                                                  MaxCount),
                                                   combat_util:pack_cast(Observers,
                                                                         10775,
                                                                         {[{SkillId,
                                                                            NewCount,
                                                                            Status}],
                                                                          Round}),
                                                   case NewCount >= MaxCount of
                                                       true ->
                                                           combat_util:pack_cast(Observers,
                                                                                 10776,
                                                                                 {[{SkillId,
                                                                                    0}]});
                                                       _ -> ok
                                                   end,
                                                   case NewCount >= MaxCount of
                                                       true ->
                                                           big_world:cast(all,
                                                                          notice,
                                                                          cast,
                                                                          [all,
                                                                           11,
                                                                           lang:get("全服玩家众志成城，在大家的齐心下<color='#00ff00'>天雷</color>已蓄"
                                                                                    "能完成，正准备向诸神方劈去，挑战者们顿时气势大涨，离胜利又近一步！")]),
                                                           big_world:cast(all,
                                                                          notice,
                                                                          cast,
                                                                          [all,
                                                                           4,
                                                                           lang:get("全服玩家众志成城，在大家的齐心下<color='#00ff00'>天雷</color>已蓄"
                                                                                    "能完成，正准备向诸神方劈去，挑战者们顿时气势大涨，离胜利又近一步！")]);
                                                       _ -> ok
                                                   end,
                                                   erlang:send_after(10000,
                                                                     self(),
                                                                     {observer_skill_guarantee,
                                                                      SkillId,
                                                                      Time +
                                                                          10}),
                                                   lists:keystore(SkillId,
                                                                  1,
                                                                  SkillInfo,
                                                                  {SkillId,
                                                                   NewCount,
                                                                   Status});
                                               _ ->
                                                   erlang:send_after(10000,
                                                                     self(),
                                                                     {observer_skill_guarantee,
                                                                      SkillId,
                                                                      Time +
                                                                          10}),
                                                   SkillInfo
                                           end;
                                       _ -> SkillInfo
                                   end;
                               _ -> SkillInfo
                           end,
            put(observe_help_info,
                {NewSkillInfo, ObserHelpCd, SysEffectCd});
        _ -> ok
    end,
    continue(StateName, Combat);
handle_info(_Info, StateName, Combat) ->
    continue(StateName, Combat).

terminate(normal, _StateName,
          #combat{start_failed_reason = Reason})
    when Reason =:= undefined orelse Reason =:= "" ->
    ok;
terminate(normal, _StateName,
          Combat = #combat{type = CombatType,
                           start_failed_reason = _Reason}) ->
    logger:error("战斗[~w]发起失败:~ts",
                 [CombatType, _Reason],
                 combat,
                 1287),
    combat_end:enter_combat_failed(Combat,
                                   combat_cache:atk(),
                                   combat_cache:dfd()),
    ok;
terminate(_Reason, _StateName, Combat) ->
    logger:error("战斗进程异常挂掉:~w", [_Reason], combat, 1291),
    combat_end:combat_over_error(Combat,
                                 combat_cache:atk(),
                                 combat_cache:dfd()),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

apply_observe(Role = #role{m_combat = MC}, CombatPid,
              Ob) ->
    Role1 = Role#role{m_combat =
                          MC#m_combat{observe_pid = CombatPid}},
    CombatPid ! {observer_enter_result, Ob},
    {ok, Role1}.

handle_escape(F = #fighter{id = Id, name = _Name,
                           type = 1, group = Group, is_escape = 1},
              Combat) ->
    ok,
    RemainingRoles = [Fid
                      || #fighter{id = Fid, type = 1}
                             <- combat_cache:all(Group)],
    case length(RemainingRoles) > 1 of
        true ->
            L = combat_cache:all(Group),
            L1 = lists:keydelete(Id, #fighter.id, L),
            L2 = case combat_cache:f(by_master_id, Id) of
                     false -> L1;
                     #fighter{id = PetFid} ->
                         lists:keydelete(PetFid, #fighter.id, L1)
                 end,
            EscapeGuard = combat_cache:f(by_guard_id, Id),
            Fun = fun (#fighter{id = GuardFid}, AllList) ->
                          NewAllList = lists:keydelete(GuardFid,
                                                       #fighter.id,
                                                       AllList),
                          NewAllList;
                      (_, AllList) -> AllList
                  end,
            L3 = lists:foldl(Fun, L2, EscapeGuard),
            put(Group, L3),
            CombatResult = case Group of
                               0 -> 11;
                               1 -> 10
                           end,
            Combat1 = Combat#combat{result = CombatResult,
                                    winner = [], loser = [F]},
            combat_over_for_escape(Combat1);
        false -> ignore
    end;
handle_escape(_, _) -> ok.

append_infos(FighterList) ->
    append_infos(FighterList, []).

append_infos([], Result) -> lists:reverse(Result);
append_infos([F = #fighter{} | T], Result) ->
    BuffInfos = combat_buff:gen_buff_infos(F),
    append_infos(T,
                 [F#fighter{buff_infos = BuffInfos} | Result]).

round_calc(Combat = #combat{round = Round}) ->
    ok,
    NeedActionFids = need_action(),
    case combat_plot:has_plot(1,
                              Combat#combat{round = Round + 1})
        of
        false ->
            case combat_util:special_add_fighter(Combat) of
                {true, JoinGroup, UnitBaseIds} ->
                    NewCombat = add_wait_wave(Combat,
                                              UnitBaseIds,
                                              JoinGroup),
                    action_calc(NeedActionFids, NewCombat);
                false -> action_calc(NeedActionFids, Combat)
            end;
        {true, GuideId, NewF = #fighter{id = Fid}} ->
            combat_cache:u(NewF),
            action_calc(NeedActionFids,
                        Combat#combat{cur_plot = {Fid, Round + 1, GuideId}});
        {true, add_fighter, JoinGroup, UnitBaseIds, NewF} ->
            combat_cache:u(NewF),
            NewCombat = add_wait_wave(Combat,
                                      UnitBaseIds,
                                      JoinGroup),
            action_calc(NeedActionFids, NewCombat)
    end.

need_action() ->
    need_action(combat_cache:all_living(), []).

need_action([], Result1) -> lists:reverse(Result1);
need_action([#fighter{name = _Name, is_escape = 1} | T],
            Result1) ->
    ok,
    need_action(T, Result1);
need_action([#fighter{id = Fid} | T], Result1) ->
    need_action(T, [Fid | Result1]).

action_calc([], Combat) ->
    put(base_10720, {[], [], []}),
    action_end_calc(Combat);
action_calc(NeedActionFids,
            Combat = #combat{type = CombatType, round = Round}) ->
    combat_skill:auto_action(combat_util:id_to_f(NeedActionFids)),
    {NeedActionFids1, _NeedActionF} =
        get_action_list(NeedActionFids),
    ok,
    combat_util:pre_action_calc(NeedActionFids1),
    combat_pet:round_calc(NeedActionFids1),
    AllFids = combat_util:f_to_id(combat_cache:all()),
    [combat_buff:buff_eff_pre(Fid) || Fid <- AllFids],
    combat_play:commit_play(),
    {NeedActionFids2, _NeedActionF2} =
        get_action_list(NeedActionFids),
    ok,
    do_action_calc(NeedActionFids2, {CombatType, Round}),
    lists:foreach(fun (#fighter{name = _Name,
                                pid = MasterPid, type = TType}) ->
                          case TType of
                              1 -> combat_pet:flash_pet(MasterPid, true);
                              4 -> combat_pet:flash_pet(MasterPid, true);
                              _ -> ok
                          end
                  end,
                  combat_cache:all()),
    system_attack(Combat),
    observe_attack(Combat),
    add_observe_attack(Combat),
    case get(combat_result) of
        end_action -> skip;
        _ -> boom_check()
    end,
    put(play_order_action_end, combat_play:get_order()),
    combat_play:reset_play_id(),
    {L1, L2, L3} = combat_play:gen_action_play(),
    put(base_10720, {L1, L2, L3}),
    action_end_calc(Combat).

action_end_calc(Combat = #combat{type = CombatType}) ->
    [combat_script_skill_calc:passive_activate(buff_calc,
                                               F,
                                               F)
     || F = #fighter{} <- combat_cache:all()],
    AllFids = combat_util:f_to_id(combat_cache:all()),
    case get(combat_result) of
        end_action ->
            case lists:member(CombatType, [52]) of
                true -> skip;
                _ -> combat_buff:buff_calc(AllFids, Combat)
            end;
        _ -> combat_buff:buff_calc(AllFids, Combat)
    end,
    lists:foreach(fun (AFid) ->
                          combat_skill:skill_cooldown_reduce(AFid)
                  end,
                  AllFids),
    lists:foreach(fun (AFid) ->
                          combat_pet:action_end_pet_status(AFid)
                  end,
                  AllFids),
    continue_fighting(Combat).

system_attack(#combat{type = CombatType,
                      start_args = _CombatStartArgs, round = Round}) ->
    CombatResult = get(combat_result),
    Args = case CombatType of
               103 -> get(warrior_combat_mode);
               _ when CombatResult =/= end_action -> 0;
               _ -> undefined
           end,
    case combat_util_data:get_system_attack({CombatType,
                                             Round,
                                             Args})
        of
        {SkillId, HpLine, LossHpRatio, LossHpBase} ->
            do_system_attack(CombatType,
                             Args,
                             {SkillId, HpLine, LossHpRatio, LossHpBase});
        _ -> ok
    end.

do_system_attack(60, _,
                 {SkillId, HpLine, LossHpRatio, LossHpBase}) ->
    Fun = fun (Target = #fighter{id = Tid, hp = Hp,
                                 hp_max = HpMax, is_die = 0, is_escape = 0}) ->
                  case Hp / HpMax > HpLine / 1000 of
                      false -> skip;
                      true ->
                          Dmg = round(HpMax * LossHpRatio / 1000 + LossHpBase),
                          Thp = max(0, Hp - Dmg),
                          Dmg1 = Hp - Thp,
                          Tvc = [{hp, 0, Thp}],
                          Tc = [{0, -Dmg1, 0}],
                          combat_cache:u(Tid, Tvc),
                          DmgStr = util:flist(lang:get("损失~w%生命值"),
                                              [round(LossHpRatio / 10)]),
                          ActionMsg =
                              notice:format(lang:get("由于战场环境影响，本方战斗单位~ts{face_1,58}"),
                                            [{string_2, 5, DmgStr}]),
                          combat_play:add_sub_play(combat_play:gen_sub_skill_play(system_attack,
                                                                                  {Target,
                                                                                   {SkillId,
                                                                                    1},
                                                                                   Tc,
                                                                                   ActionMsg}))
                  end;
              (_) -> ok
          end,
    lists:foreach(Fun, combat_cache:atk()),
    combat_play:commit_play(),
    ok;
do_system_attack(_, _,
                 {SkillId, HpLine, LossHpRatio, LossHpBase}) ->
    Fun = fun (Target = #fighter{id = Tid, hp = Hp,
                                 hp_max = HpMax, is_die = 0, is_escape = 0}) ->
                  case Hp / HpMax > HpLine / 1000 of
                      false -> skip;
                      true ->
                          Dmg = round(Hp * LossHpRatio / 1000 + LossHpBase),
                          Thp = max(1, Hp - Dmg),
                          Dmg1 = Hp - Thp,
                          Tvc = [{hp, 0, Thp}],
                          Tc = [{0, -Dmg1, 0}],
                          combat_cache:u(Tid, Tvc),
                          DmgStr = util:flist(lang:get("损失~w%生命值"),
                                              [round(LossHpRatio / 10)]),
                          ActionMsg =
                              notice:format(lang:get("由于战场环境影响，所有战斗单位~ts{face_1,58}"),
                                            [{string_2, 5, DmgStr}]),
                          combat_play:add_sub_play(combat_play:gen_sub_skill_play(system_attack,
                                                                                  {Target,
                                                                                   {SkillId,
                                                                                    1},
                                                                                   Tc,
                                                                                   ActionMsg}))
                  end;
              (_) -> ok
          end,
    lists:foreach(Fun, combat_cache:all()),
    combat_play:commit_play(),
    ok.

observe_attack(#combat{type = Type,
                       observers = Observers, round = Round}) ->
    case skill_combat_data:get_observer_skill(Type) of
        [_ | _] ->
            case get(observe_help_info) of
                {SkillInfo, FighterUseCd, SysEffectCd1} ->
                    Result = check_observe_attack(Type,
                                                  SkillInfo,
                                                  Observers,
                                                  [],
                                                  FighterUseCd,
                                                  SysEffectCd1,
                                                  Round),
                    logger:debug("写入数据:~w", [Result], combat, 1549),
                    put(observe_help_info, Result);
                _ -> ok
            end;
        _ -> ok
    end.

check_observe_attack(_Type, [], _Observers,
                     SkillProgress, FighterUseCd, SysEffectCd, _Round) ->
    {SkillProgress, FighterUseCd, SysEffectCd};
check_observe_attack(Type,
                     [{SkillId, Progress, Status} | Rest], Observers,
                     SkillProgress, FighterUseCd, SysEffectCd, Round) ->
    case skill_combat_data:get_observer_skill(Type) of
        ObserveSkill = [_ | _] ->
            case Status of
                1 ->
                    case lists:keyfind(SkillId, 1, ObserveSkill) of
                        {Id,
                         Lev,
                         TargetGroup,
                         CfgProgress,
                         CfgCdRound,
                         CfgCdTime} ->
                            [CombatRound] =
                                combat_cache:get_context_elem([#combat_context.round]),
                            CdFlag = case Type of
                                         71 ->
                                             case lists:keyfind(SkillId,
                                                                1,
                                                                SysEffectCd)
                                                 of
                                                 {_, UseSkillWave} ->
                                                     Wave =
                                                         get(gods_challenge_wave),
                                                     Wave - UseSkillWave >=
                                                         CfgCdTime;
                                                 _ -> true
                                             end;
                                         _ ->
                                             case lists:keyfind(SkillId,
                                                                1,
                                                                SysEffectCd)
                                                 of
                                                 {_, UseSkillRound} ->
                                                     CombatRound - UseSkillRound
                                                         > CfgCdRound;
                                                 _ -> true
                                             end
                                     end,
                            ProgressFlag = Progress >= CfgProgress,
                            case CdFlag andalso ProgressFlag of
                                true ->
                                    NewSysEffectCd = case Type of
                                                         71 ->
                                                             Wave1 =
                                                                 get(gods_challenge_wave),
                                                             lists:keystore(SkillId,
                                                                            1,
                                                                            SysEffectCd,
                                                                            {SkillId,
                                                                             Wave1});
                                                         _ ->
                                                             lists:keystore(SkillId,
                                                                            1,
                                                                            SysEffectCd,
                                                                            {SkillId,
                                                                             CombatRound})
                                                     end,
                                    do_observe_attack(Id, Lev, TargetGroup),
                                    combat_util:pack_cast(Observers,
                                                          10776,
                                                          {[{SkillId, 0}]}),
                                    combat_util:pack_cast(Observers,
                                                          10775,
                                                          {[{SkillId, 0, 3}],
                                                           Round}),
                                    check_observe_attack(Type,
                                                         Rest,
                                                         Observers,
                                                         [{SkillId, 0, 2}
                                                          | SkillProgress],
                                                         FighterUseCd,
                                                         NewSysEffectCd,
                                                         Round);
                                _ ->
                                    check_observe_attack(Type,
                                                         Rest,
                                                         Observers,
                                                         [{SkillId,
                                                           Progress,
                                                           Status}
                                                          | SkillProgress],
                                                         FighterUseCd,
                                                         SysEffectCd,
                                                         Round)
                            end;
                        _ ->
                            check_observe_attack(Type,
                                                 Rest,
                                                 Observers,
                                                 [{SkillId, Progress, Status}
                                                  | SkillProgress],
                                                 FighterUseCd,
                                                 SysEffectCd,
                                                 Round)
                    end;
                _ ->
                    check_observe_attack(Type,
                                         Rest,
                                         Observers,
                                         [{SkillId, Progress, Status}
                                          | SkillProgress],
                                         FighterUseCd,
                                         SysEffectCd,
                                         Round)
            end;
        _ ->
            check_observe_attack(Type,
                                 Rest,
                                 Observers,
                                 [{SkillId, Progress, Status} | SkillProgress],
                                 FighterUseCd,
                                 SysEffectCd,
                                 Round)
    end.

do_observe_attack(SkillId, SkillLev, TargetGroup) ->
    Fun = fun (Target = #fighter{lev = Lev, id = Tid,
                                 hp = Hp, is_die = 0, is_escape = 0}) ->
                  Dmg = round((Lev * 892 / 10 - 2449) * 3 *
                                  util:rand(95, 100)
                                  / 100),
                  Thp = max(1, Hp - Dmg),
                  Dmg1 = Hp - Thp,
                  Tvc = [{hp, 0, Thp}],
                  Tc = [{0, -Dmg1, 0}],
                  combat_cache:u(Tid, Tvc),
                  ActionMsg = lang:get("观战"),
                  combat_play:add_sub_play(combat_play:gen_sub_skill_play(system_attack,
                                                                          {Target,
                                                                           {SkillId,
                                                                            SkillLev},
                                                                           Tc,
                                                                           ActionMsg})),
                  ok;
              (_) -> ok
          end,
    lists:foreach(Fun, combat_cache:all(TargetGroup)),
    combat_play:commit_play(),
    ok.

add_observe_attack(Combat = #combat{type = CombatType,
                                    observers = Observers, round = Round}) ->
    case skill_combat_data:get_observer_skill(CombatType) of
        ObserveSkill = [_ | _] ->
            case get(observe_help_info) of
                {SkillInfo, ObserHelpCd, SysEffectCd} ->
                    Flag = length([true
                                   || #fighter{hp = Hp, hp_max = HpMax,
                                               is_die = IsDie,
                                               is_die_disappear =
                                                   IsDieDisappear}
                                          <- combat_cache:dfd(),
                                      round(Hp * 100 / HpMax) < 50 andalso
                                          (IsDie =:= 0 orelse
                                               IsDie =:= 1 andalso
                                                   IsDieDisappear =:= 0)])
                               >= 3,
                    case Flag of
                        true ->
                            Wave = get(gods_challenge_wave),
                            {NewSkillInfo, SkillList} =
                                update_observe_help_info(SysEffectCd,
                                                         Wave,
                                                         SkillInfo,
                                                         []),
                            put(observe_help_info,
                                {NewSkillInfo, ObserHelpCd, SysEffectCd}),
                            case SkillList of
                                [] -> ok;
                                _ ->
                                    combat_util:pack_cast(Observers,
                                                          10775,
                                                          {NewSkillInfo,
                                                           Round}),
                                    handle_pack_10776(SkillList,
                                                      Observers,
                                                      Combat)
                            end;
                        _ -> ok
                    end;
                _ ->
                    SkillInfo = [{SkillId, 0, 0}
                                 || {SkillId, _, _, _, _, _} <- ObserveSkill],
                    SysEffectCd = [{SkillId, 0}
                                   || {SkillId, _, _, _, _, _} <- ObserveSkill],
                    put(observe_help_info, {SkillInfo, [], SysEffectCd})
            end;
        _ -> ok
    end.

handle_pack_10776([], _, _Combat) -> ok;
handle_pack_10776(_, Observers, Combat) ->
    [pack_10776(Pid, RoleId, Combat)
     || #c_observer{role_id = RoleId, pid = Pid}
            <- Observers].

update_observe_help_info([], _, SkillInfo, SkillList) ->
    {SkillInfo, SkillList};
update_observe_help_info([{SkillId, UseSkillWave}
                          | Rest],
                         Wave, SkillInfo, SkillList) ->
    {NewSkillInfo, NewSkillList} = case UseSkillWave < Wave
                                       of
                                       true ->
                                           case lists:keyfind(SkillId,
                                                              1,
                                                              SkillInfo)
                                               of
                                               {_, _, 1} ->
                                                   {SkillInfo, SkillList};
                                               _ ->
                                                   erlang:send_after(10000,
                                                                     self(),
                                                                     {observer_skill_guarantee,
                                                                      SkillId,
                                                                      10}),
                                                   {lists:keystore(SkillId,
                                                                   1,
                                                                   SkillInfo,
                                                                   {SkillId,
                                                                    0,
                                                                    1}),
                                                    [SkillId | SkillList]}
                                           end;
                                       _ -> {SkillInfo, SkillList}
                                   end,
    update_observe_help_info(Rest,
                             Wave,
                             NewSkillInfo,
                             NewSkillList).

handle_observer_enter_help_info(#c_observer{role_id =
                                                RoleId},
                                #combat{type = CombatType}) ->
    case skill_combat_data:get_observer_skill(CombatType) of
        _ObserverSkill = [_ | _] ->
            case get(observe_help_info) of
                {SkillInfo, ObserHelpCd, SysEffectCd} ->
                    case lists:keyfind(RoleId, 1, ObserHelpCd) of
                        {_, _} -> ok;
                        _ ->
                            NewRoleUseData = [{SkillId, 0}
                                              || {SkillId, _, _} <- SkillInfo],
                            NewObserHelpCd = lists:keystore(RoleId,
                                                            1,
                                                            ObserHelpCd,
                                                            {RoleId,
                                                             NewRoleUseData}),
                            put(observe_help_info,
                                {SkillInfo, NewObserHelpCd, SysEffectCd})
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

boom_check() ->
    Fun = fun (Target = #fighter{id = Tid, name = Name,
                                 hp = Hp, hp_max = HpMax, buffs = Buffs,
                                 is_escape = 0, is_die = IsDie}) ->
                  case lists:keyfind(boom, #c_buff.sec_type, Buffs) of
                      Buff = #c_buff{args =
                                         [SkillId,
                                          MaxRatio,
                                          Val,
                                          RatioList,
                                          MaxVal],
                                     duration_left = DurationLeft}
                          when IsDie =:= 0 ->
                          Flag = case lists:keyfind(DurationLeft, 1, RatioList)
                                     of
                                     {_, Ratio} -> util:rand(1, 1000) =< Ratio;
                                     _ -> true
                                 end,
                          case Flag of
                              true ->
                                  Dmg = min(MaxVal,
                                            round(Val +
                                                      HpMax * MaxRatio / 1000)),
                                  Thp = Hp - Dmg,
                                  Thp1 = max(0, Thp),
                                  Tvc = [{hp, 0, Thp1}],
                                  Tc = [{0, -Dmg, 0}],
                                  combat_cache:u(Tid, Tvc),
                                  combat_buff:buff_del(Tid, Tid, Buff),
                                  SkillName = case
                                                  skill_combat_data:get_combat({SkillId,
                                                                                1})
                                                  of
                                                  #skill{name = _SkillName} ->
                                                      _SkillName;
                                                  _ -> lang:get("炸弹")
                                              end,
                                  ActionMsg =
                                      notice:format(lang:get("~ts身上的~ts爆炸了"),
                                                    [{string_2, 1, Name},
                                                     {string_2, 1, SkillName}]),
                                  combat_play:add_sub_play(combat_play:gen_sub_skill_play(system_attack,
                                                                                          {Target,
                                                                                           {SkillId,
                                                                                            1},
                                                                                           Tc,
                                                                                           ActionMsg})),
                                  combat_play:commit_play();
                              _ -> ok
                          end;
                      Buff = #c_buff{args =
                                         [SkillId,
                                          _MaxRatio,
                                          _Val,
                                          RatioList,
                                          _],
                                     duration_left = DurationLeft} ->
                          Flag = case lists:keyfind(DurationLeft, 1, RatioList)
                                     of
                                     {_, Ratio} -> util:rand(1, 1000) =< Ratio;
                                     _ -> true
                                 end,
                          case Flag of
                              true ->
                                  combat_buff:buff_del(Tid, Tid, Buff),
                                  SkillName = case
                                                  skill_combat_data:get_combat({SkillId,
                                                                                1})
                                                  of
                                                  #skill{name = _SkillName} ->
                                                      _SkillName;
                                                  _ -> lang:get("炸弹")
                                              end,
                                  ActionMsg =
                                      notice:format(lang:get("~ts身上的~ts爆炸了"),
                                                    [{string_2, 1, Name},
                                                     {string_2, 1, SkillName}]),
                                  combat_play:add_sub_play(combat_play:gen_sub_skill_play(system_attack,
                                                                                          {Target,
                                                                                           {SkillId,
                                                                                            1},
                                                                                           [],
                                                                                           ActionMsg})),
                                  combat_play:commit_play();
                              _ -> ok
                          end;
                      _ -> ok
                  end;
              (_) -> ok
          end,
    lists:foreach(Fun, combat_cache:all()),
    combat_play:commit_play(),
    ok.

round_end_calc(Combat = #combat{round = Round}) ->
    next_wave(Combat),
    Result =
        combat_util:check_combat_result(Combat#combat{round =
                                                          Round + 1}),
    combat_observer_reward:round_end_ob_reward(Combat,
                                               Result),
    round_trigger(Combat),
    case Result of
        2 ->
            combat_over(Combat#combat{result = 2, winner = [],
                                      loser = combat_cache:all()});
        10 ->
            combat_over(Combat#combat{result = 10,
                                      winner = combat_cache:atk(),
                                      loser = combat_cache:dfd()});
        11 ->
            combat_over(Combat#combat{result = 11,
                                      winner = combat_cache:dfd(),
                                      loser = combat_cache:atk()});
        99 ->
            NewCombat = update_waiting_wave(Combat),
            combat_round_cal(NewCombat),
            reset_all(NewCombat),
            next_round(NewCombat#combat{result = 99});
        98 ->
            NewCombat = update_waiting_wave(Combat),
            case combat_util:has_next_wave(NewCombat) of
                {true, NextWave, NewAllWaitingNextWave} ->
                    NewCombat1 = NewCombat#combat{result = 98, round = 0,
                                                  waiting_next_wave = NextWave,
                                                  all_waiting_next_wave =
                                                      NewAllWaitingNextWave},
                    reset_all(NewCombat1),
                    next_round(NewCombat1);
                _ ->
                    combat_over(Combat#combat{result = 10,
                                              winner = combat_cache:atk(),
                                              loser = combat_cache:dfd()})
            end;
        _Err ->
            logger:error("错误的战斗回合结果:~w", [_Err], combat, 1796),
            combat_over(Combat#combat{result = 2, winner = [],
                                      loser = combat_cache:all()})
    end.

update_waiting_wave(Combat =
                        #combat{all_waiting_next_wave = AllWaitingNextWave}) ->
    [AllWaitingNextWave1] =
        combat_cache:get_context_elem([#combat_context.all_waiting_next_wave]),
    combat_cache:save_context([{#combat_context.all_waiting_next_wave,
                                []}]),
    Combat#combat{all_waiting_next_wave =
                      AllWaitingNextWave ++ AllWaitingNextWave1}.

combat_round_cal(Combat = #combat{type = 56}) ->
    guild_dungeon:combat_round(Combat#combat{winner =
                                                 combat_cache:atk(),
                                             loser = combat_cache:dfd()});
combat_round_cal(#combat{round = Round, type = 40}) ->
    combat_stat:update_auto_round(combat_cache:all(),
                                  Round);
combat_round_cal(#combat{round = Round, type = 58}) ->
    combat_stat:update_auto_round(combat_cache:all(),
                                  Round);
combat_round_cal(_) -> ok.

reset_all(Combat = #combat{result = Result,
                           observers = Observers,
                           waiting_next_wave = WaitingNextWave}) ->
    combat_stat:clear_round_dmg(combat_cache:all()),
    combat_cache:save_context([{#combat_context.playing,
                                []}]),
    combat_cache:save_context([{#combat_context.round_die,
                                []}]),
    combat_play:clear_all_play(),
    combat_fighter:revoke_dead_pos(),
    reset_some_status(),
    case Result of
        98 ->
            put(changes_10720, []),
            ok;
        _ -> combat_fighter:ghost_and_revive_check(Observers)
    end,
    combat_fighter:passive_round(combat_cache:all(), []),
    case WaitingNextWave of
        [_ | _] -> combat_fighter:wave_next_calc(Combat);
        _ -> ok
    end,
    case combat_fighter:handle_join(all,
                                    Combat#combat{waiting_join =
                                                      WaitingNextWave,
                                                  waiting_next_wave = []})
        of
        Joined = [_ | _] -> system_joined_play(Joined);
        _ -> skip
    end,
    ok.

reset_some_status() ->
    reset_some_status(combat_cache:all()).

reset_some_status([]) -> ok;
reset_some_status([F = #fighter{special_attr =
                                    SpecialAttr,
                                special_status = SpecialStatus}
                   | T]) ->
    NewSpecialAttr = SpecialAttr#special_attr{protector =
                                                  undefined,
                                              control_num = 0, absorb_order = 0,
                                              model_order = 0, has_immunity = 0,
                                              is_sworn_protect = 0,
                                              is_sworn_heal = 0, round_hurt = 0,
                                              multi_atk_num = 0,
                                              has_multi_atk = 0, suck_times = 1,
                                              be_dmg_mp_times = 0,
                                              save_life_times = 0,
                                              wheel_dmg = 0, wheel_skill = 0,
                                              be_attack_times = undefined,
                                              first_target_id = 0,
                                              iron_body_times = 0},
    NewSpecialStatus =
        SpecialStatus#special_status{be_attack_skills = []},
    NewF = F#fighter{is_defence = 0, action = undefined,
                     pre_action = undefined, is_ai_action = 0, is_ready = 0,
                     talk = "", special_attr = NewSpecialAttr,
                     special_status = NewSpecialStatus},
    combat_cache:u(NewF),
    reset_some_status(T).

next_round(Combat = #combat{start_time = StartTime,
                            round = CurRound, observers = Observers,
                            cur_plot = CurPlot}) ->
    {ActionPlayList, BuffPlayList, SummonPlayList} =
        get(base_10720),
    {AllBuffList, BuffEffectList} = get(buff_10720),
    FighterStatus = combat_fighter:format_fighter_status(),
    CombatResult = case CurRound =:= 0 of
                       true -> 2;
                       false -> 0
                   end,
    FighterChanges = get(changes_10720),
    Tplay = combat_play:calc_play_time(ActionPlayList),
    RoleL = combat_util:filter_fighter(combat_cache:all(),
                                       [1]),
    GuideId1 = case CurPlot of
                   {_, _, GuideId} -> GuideId;
                   _ -> 0
               end,
    lists:foreach(fun (#fighter{id = Fid, pid = Pid,
                                backup_pets = BackUpPets,
                                has_use_item = HasUseItem,
                                has_summon_pet = HasSummonPet,
                                backup_childs = BackUpChilds}) ->
                          SkillCd = combat_skill:get_skill_cooldown_info(Fid),
                          SummonSkillCd =
                              combat_skill:get_summon_skill_cooldown_info(Fid),
                          Data = {CurRound,
                                  StartTime,
                                  ActionPlayList,
                                  BuffPlayList,
                                  SummonPlayList,
                                  AllBuffList,
                                  BuffEffectList,
                                  FighterStatus,
                                  CombatResult,
                                  GuideId1,
                                  30000 div 1000,
                                  FighterChanges,
                                  HasSummonPet,
                                  HasUseItem,
                                  SkillCd,
                                  SummonSkillCd,
                                  BackUpPets,
                                  BackUpChilds},
                          pack_10720(Pid, Data)
                  end,
                  RoleL),
    ObData = {CurRound,
              StartTime,
              ActionPlayList,
              BuffPlayList,
              SummonPlayList,
              AllBuffList,
              BuffEffectList,
              FighterStatus,
              CombatResult,
              0,
              30000 div 1000,
              FighterChanges,
              0,
              0,
              [],
              [],
              [],
              []},
    pack_10720_ob(Observers, ObData),
    calc_wave_reward(Combat),
    NewRound = CurRound + 1,
    combat_cache:save_context([{#combat_context.round,
                                NewRound}]),
    ok,
    lists:foreach(fun (F = #fighter{}) ->
                          combat_cache:u(F#fighter{action_num = NewRound})
                  end,
                  combat_cache:all()),
    NewCombat = Combat#combat{ts = erlang:now(),
                              t_play = Tplay, round = NewRound,
                              waiting_join = [], waiting_next_wave = []},
    {next_state, fight_playing, NewCombat, Tplay}.

do_action_calc(NeedActionFids, {CombatType, Round}) ->
    do_action_calc(NeedActionFids,
                   {CombatType, Round},
                   0,
                   0,
                   []).

do_action_calc([], _, 1, _SomeAct, _Back) -> ok;
do_action_calc([], _, _EndCombat, _SomeAct, []) -> ok;
do_action_calc([], _, _EndCombat, 0, _Back) -> ok;
do_action_calc([], {CombatType, Round}, _EndCombat, 1,
               Back) ->
    do_action_calc(lists:reverse(Back),
                   {CombatType, Round},
                   0,
                   0,
                   []);
do_action_calc([], _, _EndCombat, _SomeAct, _Back) ->
    ok;
do_action_calc([Fid | T], {CombatType, Round},
               _EndCombat, SomeAct, BackList) ->
    HasAct = case can_action(Fid) of
                 {true,
                  Self = #fighter{type = 5, group = Sgroup,
                                  action = undefined}} ->
                     logger:debug("守护出招", [], combat, 1929),
                     Context = combat_cache:get_context(),
                     NewContext = Context#combat_context{self_side =
                                                             combat_cache:all(Sgroup),
                                                         op_side =
                                                             combat_cache:all(combat_cache:op(Sgroup))},
                     NewSelf = ai:act(Self, NewContext),
                     combat_cache:u(NewSelf),
                     do_do_action_calc([action_check,
                                        validate,
                                        action_do,
                                        action_after],
                                       NewSelf,
                                       #{});
                 {true,
                  Self = #fighter{type = 2, group = Sgroup,
                                  action = undefined}}
                     when CombatType =:= 68 orelse
                              CombatType =:= 69 orelse
                                  CombatType =:= 70 orelse CombatType =:= 72 ->
                     Context = combat_cache:get_context(),
                     NewContext = Context#combat_context{self_side =
                                                             combat_cache:all(Sgroup),
                                                         op_side =
                                                             combat_cache:all(combat_cache:op(Sgroup))},
                     NewSelf = ai:act(Self, NewContext),
                     combat_cache:u(NewSelf),
                     do_do_action_calc([action_check,
                                        validate,
                                        action_do,
                                        action_after],
                                       NewSelf,
                                       #{});
                 {true, Self} ->
                     do_do_action_calc([action_check,
                                        validate,
                                        action_do,
                                        action_after],
                                       Self,
                                       #{});
                 false -> 0
             end,
    Flag = case
               combat_util:common_check_combat_result({CombatType,
                                                       Round})
               of
               2 -> end_action;
               10 -> end_action;
               11 -> end_action;
               _ -> next_action
           end,
    {BackList1, SomeAct1} = case HasAct of
                                0 -> {[Fid | BackList], SomeAct};
                                _ -> {BackList, 1}
                            end,
    case Flag of
        end_action ->
            put(combat_result, end_action),
            do_action_calc([],
                           {CombatType, Round},
                           1,
                           SomeAct1,
                           BackList1);
        next_action ->
            put(combat_result, next_action),
            do_action_calc(T,
                           {CombatType, Round},
                           0,
                           SomeAct1,
                           BackList1)
    end.

can_action(#fighter{base_id = 20013}) -> false;
can_action(F = #fighter{is_die = 0, is_escape = 0}) ->
    {true, F};
can_action(Fid) ->
    case combat_cache:f(by_id, Fid) of
        #fighter{base_id = 20013} -> false;
        F = #fighter{is_die = 0, is_escape = 0} -> {true, F};
        _ -> false
    end.

can_action_do(Fid, Target, Skill = #c_skill{}) ->
    case combat_cache:f(by_id, Fid) of
        F = #fighter{is_die = 0, is_escape = 0} ->
            case combat_skill:can_use_skill(Skill, F, Target) of
                1 -> {true, F};
                0 -> {false, lang:get("无法对目标使用该技能")}
            end;
        _ -> {false, lang:get("死亡状态下，无法使用技能")}
    end.

do_do_action_calc([], _Self, _) -> 1;
do_do_action_calc([action_check | T],
                  Self = #fighter{id = Sid, action = Action,
                                  group = Sgroup},
                  Args) ->
    {ActFlag, Skill, TargetId} = case Action of
                                     undefined ->
                                         AutoSkill =
                                             combat_skill:get_default_skill(Self),
                                         case combat_util:get_not_die(Sid,
                                                                      combat_cache:op(Sgroup),
                                                                      [],
                                                                      [{is_stealth,
                                                                        0}])
                                             of
                                             #fighter{id = AutoTargetId} ->
                                                 {true,
                                                  AutoSkill,
                                                  AutoTargetId};
                                             _ -> {false, AutoSkill, 0}
                                         end;
                                     {OldSkill, OldTargetId} ->
                                         {true, OldSkill, OldTargetId}
                                 end,
    do_do_action_calc(T,
                      Self,
                      Args#{act_flag => ActFlag, skill => Skill,
                            target_id => TargetId});
do_do_action_calc([validate | T], Self,
                  Args = #{act_flag := false}) ->
    do_do_action_calc(T, Self, Args#{target => undefined});
do_do_action_calc([validate | T],
                  Self = #fighter{id = Sid},
                  Args = #{act_flag := true, skill := Skill,
                           target_id := TargetId}) ->
    {Skill1, TargetId1} = case
                              combat_skill:validate_skill(Skill, Self)
                              of
                              {Vskill, Vtarget} -> {Vskill, Vtarget};
                              Vskill -> {Vskill, TargetId}
                          end,
    {LastTarget, ChooseSkill} = case
                                    combat_skill:validate_target(Skill1,
                                                                 Sid,
                                                                 TargetId1)
                                    of
                                    Target = #fighter{} -> {Target, Skill1};
                                    {Skill2, Target = #fighter{}} ->
                                        {Target, Skill2};
                                    undefined -> {undefined, Skill1}
                                end,
    do_do_action_calc(T,
                      Self,
                      Args#{target => LastTarget, skill => ChooseSkill});
do_do_action_calc([action_do | T],
                  Self = #fighter{id = Sid, name = _Sname},
                  Args = #{skill :=
                               ChooseSkill = #c_skill{skill =
                                                          #skill{name =
                                                                     _SkillName}},
                           target :=
                               #fighter{id = Tid, base_id = _TBaseId,
                                        name = _Tname}}) ->
    LastTarget = combat_cache:f(by_id, Tid),
    case can_action_do(Sid, LastTarget, ChooseSkill) of
        {true, NSelf} ->
            Self1 = NSelf#fighter{action = {ChooseSkill, Tid}},
            combat_cache:u(Self1),
            ok,
            NSkill = #c_skill{skill =
                                  #skill{attack_times = AttackTimes,
                                         target_list = TargetList,
                                         buff_self = BuffSelf}} =
                         combat_script_skill_ext:exec_trigger_before(ChooseSkill,
                                                                     Self1,
                                                                     LastTarget),
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self)
                          end,
                          BuffSelf),
            Self2 = #fighter{action = {_, Tid2}} =
                        combat_cache:f(by_id, Sid),
            NewSelf = Self2#fighter{action = {NSkill, Tid2}},
            combat_cache:u(NewSelf),
            AddtArg = #c_skill_addt_arg{},
            combat_cache:save_context([{#combat_context.multi_pursue_num,
                                        0}]),
            combat_cache:save_context([{#combat_context.is_skill_range,
                                        false}]),
            combat_cache:save_context([{#combat_context.action_dmg,
                                        0}]),
            for_attack_start(1,
                             AttackTimes,
                             NSkill,
                             NewSelf,
                             LastTarget,
                             AddtArg,
                             TargetList),
            NewSelf2 = combat_cache:f(by_id, Sid),
            combat_script_skill_calc:passive_activate(action_end,
                                                      NewSelf2,
                                                      #fighter{}),
            [IsSkillHurt] =
                combat_cache:get_context_elem([#combat_context.skill_hurt]),
            combat_script_skill_ext:exec_trigger_after(NSkill,
                                                       NewSelf2,
                                                       LastTarget),
            combat_play:commit_play(),
            save_last_skill(NewSelf2),
            do_do_action_calc(T,
                              NewSelf2,
                              Args#{target => LastTarget,
                                    is_hurt_skill => IsSkillHurt});
        {false, Reason} ->
            NewSelf = combat_cache:f(by_id, Sid),
            combat_script_skill_calc:passive_activate(action_end,
                                                      NewSelf,
                                                      #fighter{}),
            NewSkill = combat_script_skill:to_combat_skill({1005,
                                                            1}),
            NewSkill1 = NewSkill#c_skill{action_msg = Reason},
            combat_play:add_sub_play(combat_play:gen_sub_skill_play(wait,
                                                                    {Self,
                                                                     NewSkill1})),
            do_do_action_calc(T, Self, Args)
    end;
do_do_action_calc([action_do | T], Self, Args) ->
    do_do_action_calc(T, Self, Args);
do_do_action_calc([action_after | T], Self,
                  Args = #{action := 0}) ->
    do_do_action_calc(T, Self, Args);
do_do_action_calc([action_after | T],
                  Self = #fighter{pid = Spid},
                  Args = #{skill := ChooseSkill,
                           is_hurt_skill := IsSkillHurt,
                           target := Target = #fighter{group = Tgroup}}) ->
    combat_buff:buff_clear_escape(),
    lists:foreach(fun (#fighter{name = _Name,
                                pid = MasterPid, type = TType}) ->
                          case TType of
                              1 ->
                                  combat_pet:flash_pet(MasterPid),
                                  combat_pet:revive_master(MasterPid);
                              4 ->
                                  combat_pet:flash_pet(MasterPid),
                                  combat_pet:revive_master(MasterPid);
                              _ -> ok
                          end
                  end,
                  combat_cache:all(Tgroup)),
    combat_pet:flash_pet(Spid),
    combat_pet:revive_master(Spid),
    case IsSkillHurt of
        true ->
            combat_script_skill_calc:assist_attack_play(ChooseSkill,
                                                        Self,
                                                        Target,
                                                        #action_effect{},
                                                        #passive_effect{});
        _ -> skip
    end,
    lists:foreach(fun (F = #fighter{name = _Name,
                                    is_die = 1, is_escape = 0,
                                    is_die_disappear = 0,
                                    special_attr =
                                        #special_attr{ghosting = 0,
                                                      reviving = 0}}) ->
                          combat_script_skill_calc:passive_activate(die,
                                                                    F,
                                                                    #fighter{});
                      (#fighter{name = _Name}) -> skip
                  end,
                  combat_cache:all(Tgroup)),
    case combat_cache:f(by_pid, Spid) of
        Self = #fighter{is_die = 1, is_escape = 0,
                        is_die_disappear = 0,
                        special_attr =
                            #special_attr{ghosting = 0, reviving = 0}} ->
            combat_script_skill_calc:passive_activate(die,
                                                      Self,
                                                      #fighter{});
        _ -> skip
    end,
    combat_buff:halo_check(),
    do_do_action_calc(T, Self, Args);
do_do_action_calc([_ | T], Self, Args) ->
    do_do_action_calc(T, Self, Args).

for_attack_start(I, Max, #c_skill{id = SkillId},
                 #fighter{name = Name}, _Target, _AddtArg, _TargetList)
    when Max =< 0 ->
    logger:error("[~ts]的技能[~w]的出手次数有错误[~w:~w]",
                 [Name, SkillId, I, Max],
                 combat,
                 2144),
    skip;
for_attack_start(I, Max, Skill, Self, Target, AddtArg,
                 TargetList) ->
    combat_cache:save_context([{#combat_context.passive_attack,
                                []}]),
    combat_cache:save_context([{#combat_context.passive_skill_attack,
                                []}]),
    combat_cache:save_context([{#combat_context.mate_suck_list,
                                []}]),
    combat_cache:save_context([{#combat_context.pursue_attack,
                                false}]),
    combat_cache:save_context([{#combat_context.skill_pursue_crit,
                                false}]),
    NewI = min(I, Max),
    for_attack(NewI,
               Max,
               Skill,
               Self,
               Target,
               AddtArg,
               TargetList).

for_attack(MaxNum, MaxNum, Skill,
           Self = #fighter{id = Sid, is_die = IsDie,
                           is_escape = IsEscape},
           Target = #fighter{id = Tid}, AddtArg,
           [{_Idx, TargetMode, TargetNum} | _RestTargetList]) ->
    case IsDie =:= 0 andalso IsEscape =:= 0 of
        true ->
            fun_attack({MaxNum, 1},
                       Skill,
                       {TargetMode, TargetNum},
                       Self,
                       Target,
                       AddtArg);
        false -> skip
    end,
    Self1 = combat_cache:f(by_id, Sid),
    Target1 = combat_cache:f(by_id, Tid),
    for_attack_end(Skill, Self1, Target1, AddtArg);
for_attack(I, MaxNum, Skill,
           Self = #fighter{id = Sid, is_die = IsDie,
                           is_escape = IsEscape},
           Target = #fighter{id = Tid}, AddtArg,
           [{_Idx, TargetMode, TargetNum} | RestTargetList])
    when I < MaxNum ->
    case IsDie =:= 0 andalso IsEscape =:= 0 of
        true ->
            fun_attack({I, 1},
                       Skill,
                       {TargetMode, TargetNum},
                       Self,
                       Target,
                       AddtArg),
            Self1 = combat_cache:f(by_id, Sid),
            Target1 = combat_cache:f(by_id, Tid),
            for_attack(I + 1,
                       MaxNum,
                       Skill,
                       Self1,
                       Target1,
                       AddtArg,
                       RestTargetList);
        false -> for_attack_end(Skill, Self, Target, AddtArg)
    end;
for_attack(_I, _MaxNum, Skill = #c_skill{id = SkillId},
           Self = #fighter{name = Name}, Target, AddtArg,
           TargetList) ->
    logger:error("[~ts]的技能[~w]的目标列表有错误[~w], [~w], [~w]",
                 [Name,
                  SkillId,
                  TargetList,
                  {_I, _MaxNum},
                  util:get_stacktrace()],
                 combat,
                 2195),
    for_attack_end(Skill, Self, Target, AddtArg).

for_attack_end(Skill = #c_skill{skill = S,
                                pursue_attack = IsPursue,
                                pursue_skill_attack = IsSkillPursue,
                                passive_args = PassiveArgs},
               Self, Target, AddtArg) ->
    case IsPursue of
        1 -> skip;
        0 -> passive_attack(Self, Target, AddtArg)
    end,
    case IsSkillPursue of
        1 -> skip;
        0 -> pursue_skill_attack(Self, Target, AddtArg)
    end,
    Skill1 = case PassiveArgs of
                 {PassiveDmgRatio = [_ | _], PassiveDmgAddt} ->
                     Skill#c_skill{skill =
                                       S#skill{dmg_ratio = PassiveDmgRatio,
                                               dmg_addt = PassiveDmgAddt},
                                   passive_args = undefined};
                 _ -> Skill
             end,
    pursue_attack(Skill1, Self, Target, AddtArg),
    combat_cache:save_context([{#combat_context.is_passive_attack,
                                false}]),
    clean_shiled(),
    clean_rebound(),
    ok.

passive_attack(_Self = #fighter{id = Sid, name = _Name},
               #fighter{id = Tid, group = Tgroup},
               AddtArg = #c_skill_addt_arg{show_passive_skills =
                                               Show}) ->
    case
        combat_cache:get_context_elem([#combat_context.passive_attack])
        of
        [PassiveAttackSkills = [_ | _]] ->
            logger:debug("战斗技能:~w",
                         [PassiveAttackSkills],
                         combat,
                         2238),
            lists:foreach(fun ({NeedCheck,
                                AttackTimes,
                                AttackSkill = #c_skill{skill =
                                                           #skill{target_list =
                                                                      TargetList}}}) ->
                                  Target1 = combat_cache:f(by_id, Tid),
                                  {TargetMode, TargetNum} = case
                                                                lists:keyfind(1,
                                                                              1,
                                                                              TargetList)
                                                                of
                                                                {_,
                                                                 Tmode,
                                                                 Tnum} ->
                                                                    {Tmode,
                                                                     Tnum};
                                                                _ -> {2, 1}
                                                            end,
                                  NewTargetList = [{At, TargetMode, TargetNum}
                                                   || At
                                                          <- lists:seq(1,
                                                                       AttackTimes)],
                                  NewSelf = combat_cache:f(by_id, Sid),
                                  case NeedCheck =:= 1 andalso
                                           Target1#fighter.is_die =:= 1
                                      of
                                      true ->
                                          case combat_util:get_not_die(Sid,
                                                                       Tgroup,
                                                                       [],
                                                                       [{is_stealth,
                                                                         0}])
                                              of
                                              undefined -> skip;
                                              NextTarget ->
                                                  combat_cache:save_context([{#combat_context.is_passive_attack,
                                                                              true}]),
                                                  for_attack_start(1,
                                                                   AttackTimes,
                                                                   AttackSkill,
                                                                   NewSelf,
                                                                   NextTarget,
                                                                   AddtArg,
                                                                   NewTargetList)
                                          end;
                                      _ ->
                                          combat_cache:save_context([{#combat_context.is_passive_attack,
                                                                      true}]),
                                          for_attack_start(1,
                                                           AttackTimes,
                                                           AttackSkill,
                                                           NewSelf,
                                                           Target1,
                                                           AddtArg,
                                                           NewTargetList)
                                  end;
                              ({NeedCheck,
                                AttackTimes,
                                AddShow,
                                AttackSkill = #c_skill{skill =
                                                           #skill{target_list =
                                                                      TargetList}}}) ->
                                  Target1 = combat_cache:f(by_id, Tid),
                                  {TargetMode, TargetNum} = case
                                                                lists:keyfind(1,
                                                                              1,
                                                                              TargetList)
                                                                of
                                                                {_,
                                                                 Tmode,
                                                                 Tnum} ->
                                                                    {Tmode,
                                                                     Tnum};
                                                                _ -> {2, 1}
                                                            end,
                                  NewTargetList = [{At, TargetMode, TargetNum}
                                                   || At
                                                          <- lists:seq(1,
                                                                       AttackTimes)],
                                  NewAddtArg =
                                      AddtArg#c_skill_addt_arg{show_passive_skills
                                                                   =
                                                                   AddShow ++
                                                                       Show},
                                  NewSelf = combat_cache:f(by_id, Sid),
                                  case NeedCheck =:= 1 andalso
                                           Target1#fighter.is_die =:= 1
                                      of
                                      true ->
                                          case combat_util:get_not_die(Sid,
                                                                       Tgroup,
                                                                       [],
                                                                       [{is_stealth,
                                                                         0}])
                                              of
                                              undefined -> skip;
                                              NextTarget ->
                                                  combat_cache:save_context([{#combat_context.is_passive_attack,
                                                                              true}]),
                                                  for_attack_start(1,
                                                                   AttackTimes,
                                                                   AttackSkill,
                                                                   NewSelf,
                                                                   NextTarget,
                                                                   NewAddtArg,
                                                                   NewTargetList)
                                          end;
                                      _ ->
                                          combat_cache:save_context([{#combat_context.is_passive_attack,
                                                                      true}]),
                                          for_attack_start(1,
                                                           AttackTimes,
                                                           AttackSkill,
                                                           NewSelf,
                                                           Target1,
                                                           NewAddtArg,
                                                           NewTargetList)
                                  end
                          end,
                          PassiveAttackSkills);
        _ -> skip
    end.

pursue_attack(Skill = #c_skill{skill =
                                   S = #skill{dmg_ratio = DmgRatio,
                                              dmg_addt = DmgAddt}},
              _Self = #fighter{id = Sid},
              #fighter{id = Tid, group = Tgroup}, AddtArg) ->
    NewSelf = combat_cache:f(by_id, Sid),
    case
        combat_cache:get_context_elem([#combat_context.pursue_attack,
                                       #combat_context.pursue_attack_list])
        of
        [{true, ReduceDmgRatio}, PursueAttack] ->
            PursueAttack1 = [Tid | PursueAttack],
            combat_cache:save_context([{#combat_context.pursue_attack_list,
                                        PursueAttack1}]),
            case combat_util:get_not_die(Sid,
                                         Tgroup,
                                         [Sid | PursueAttack1],
                                         [{is_stealth, 0}])
                of
                undefined -> skip;
                NextTarget ->
                    NewDmgRatio = [round(D * ReduceDmgRatio / 1000)
                                   || D <- DmgRatio],
                    NewDmgAddt = round(DmgAddt * ReduceDmgRatio / 1000),
                    ok,
                    NewSkill = Skill#c_skill{skill =
                                                 S#skill{dmg_ratio =
                                                             NewDmgRatio,
                                                         dmg_addt = NewDmgAddt},
                                             pursue_attack = 1},
                    for_attack_start(1,
                                     1,
                                     NewSkill,
                                     NewSelf,
                                     NextTarget,
                                     AddtArg,
                                     [{1, 2, 1}])
            end;
        [{true, passive, ReduceDmgRatio}, PursueAttack] ->
            PursueAttack1 = [Tid | PursueAttack],
            combat_cache:save_context([{#combat_context.pursue_attack_list,
                                        PursueAttack1}]),
            case combat_util:get_not_die(Sid,
                                         Tgroup,
                                         [Sid | PursueAttack1],
                                         [{is_stealth, 0}])
                of
                undefined -> skip;
                NextTarget ->
                    NewSkill = #c_skill{skill = NewS} =
                                   combat_skill:get_default_skill(NewSelf),
                    NewDmgRatio = [round(D * ReduceDmgRatio / 1000)
                                   || D <- DmgRatio],
                    NewDmgAddt = round(DmgAddt * ReduceDmgRatio / 1000),
                    NewSkill1 = NewSkill#c_skill{skill =
                                                     NewS#skill{dmg_ratio =
                                                                    NewDmgRatio,
                                                                dmg_addt =
                                                                    NewDmgAddt},
                                                 pursue_attack = 1},
                    for_attack_start(1,
                                     1,
                                     NewSkill1,
                                     NewSelf,
                                     NextTarget,
                                     AddtArg,
                                     [{1, 2, 1}])
            end;
        _Else -> skip
    end.

pursue_skill_attack(_Self = #fighter{id = Sid},
                    #fighter{id = Tid, group = Tgroup}, AddtArg) ->
    NewSelf = combat_cache:f(by_id, Sid),
    case
        combat_cache:get_context_elem([#combat_context.passive_skill_attack,
                                       #combat_context.pursue_attack_list])
        of
        [PassiveAttackSkills = [_ | _], PursueAttackList] ->
            logger:debug("法术追击技能:~w， 已经追击的列表:~w",
                         [PassiveAttackSkills, PursueAttackList],
                         combat,
                         2329),
            NewPursueAttackList = [Tid | PursueAttackList],
            combat_cache:save_context([{#combat_context.pursue_attack_list,
                                        NewPursueAttackList}]),
            lists:foreach(fun ({_NeedCheck,
                                AttackTimes,
                                AttackSkill = #c_skill{skill =
                                                           #skill{target_list =
                                                                      TargetList}}}) ->
                                  {TargetMode, TargetNum} = case
                                                                lists:keyfind(1,
                                                                              1,
                                                                              TargetList)
                                                                of
                                                                {_,
                                                                 Tmode,
                                                                 Tnum} ->
                                                                    {Tmode,
                                                                     Tnum};
                                                                _ -> {2, 1}
                                                            end,
                                  NewTargetList = [{At, TargetMode, TargetNum}
                                                   || At
                                                          <- lists:seq(1,
                                                                       AttackTimes)],
                                  case combat_util:get_not_die(Sid,
                                                               Tgroup,
                                                               [Sid
                                                                | NewPursueAttackList],
                                                               [{is_stealth,
                                                                 0}])
                                      of
                                      undefined -> skip;
                                      NextTarget ->
                                          NewAttackSkill =
                                              AttackSkill#c_skill{pursue_attack
                                                                      = 1},
                                          combat_cache:save_context([{#combat_context.is_passive_attack,
                                                                      true}]),
                                          for_attack_start(1,
                                                           AttackTimes,
                                                           NewAttackSkill,
                                                           NewSelf,
                                                           NextTarget,
                                                           AddtArg,
                                                           NewTargetList)
                                  end
                          end,
                          PassiveAttackSkills);
        _Else -> skip
    end.

clean_shiled() ->
    lists:foreach(fun (#fighter{id = Sid, buffs = Buffs,
                                special_attr =
                                    #special_attr{absorb_dmg = AbsorbDmg,
                                                  magic_absorb_dmg =
                                                      MagicAbsorbDmg,
                                                  absorb_shield =
                                                      AbsorbShield}}) ->
                          case AbsorbShield =< 0 of
                              true ->
                                  case lists:keyfind(shield_atk,
                                                     #c_buff.sec_type,
                                                     Buffs)
                                      of
                                      AbsorbBuff1 = #c_buff{} ->
                                          combat_buff:buff_del(Sid,
                                                               Sid,
                                                               AbsorbBuff1);
                                      _ -> skip
                                  end;
                              false -> skip
                          end,
                          case AbsorbDmg =< 0 andalso MagicAbsorbDmg =< 0 of
                              true ->
                                  case lists:keyfind(shield_dmg,
                                                     #c_buff.sec_type,
                                                     Buffs)
                                      of
                                      AbsorbBuff2 = #c_buff{} ->
                                          combat_buff:buff_del(Sid,
                                                               Sid,
                                                               AbsorbBuff2);
                                      _ -> skip
                                  end;
                              false -> skip
                          end
                  end,
                  combat_cache:all()).

clean_rebound() ->
    lists:foreach(fun (#fighter{id = Sid, buffs = Buffs,
                                special_attr =
                                    #special_attr{rebound_times =
                                                      ReboundTimes}}) ->
                          case ReboundTimes =< 0 of
                              true ->
                                  case lists:keyfind(rebound_atk,
                                                     #c_buff.sec_type,
                                                     Buffs)
                                      of
                                      AbsorbBuff1 = #c_buff{} ->
                                          combat_buff:buff_del(Sid,
                                                               Sid,
                                                               AbsorbBuff1);
                                      _ -> skip
                                  end;
                              false -> skip
                          end
                  end,
                  combat_cache:all()).

fun_attack({ActionNo, _TargetNo},
           Skill = #c_skill{skill =
                                S = #skill{buff_target = BuffTarget},
                            act_flag = ActFlag},
           {TargetMode, TargetNum}, Self = #fighter{id = Sid},
           Target = #fighter{pos = Tpos, group = Tgroup,
                             formation = Tformation,
                             formation_lev = TformationLev},
           AddtArg) ->
    combat_cache:save_context([{#combat_context.revive_self,
                                []}]),
    BuffTargetLen = length(BuffTarget),
    NewBuffTarget = case ActionNo =< BuffTargetLen of
                        true -> lists:nth(ActionNo, BuffTarget);
                        false -> []
                    end,
    S1 = S#skill{buff_target = NewBuffTarget},
    Skill1 = Skill#c_skill{action_no = ActionNo,
                           target_no = 1, skill = S1},
    TargetNum1 = calc_target_num(Self, ActFlag, TargetNum),
    logger:debug("技能目标数目:~w", [TargetNum1], combat, 2414),
    Flag = if TargetNum1 > 1 ->
                  Targets = choose_targets(Skill,
                                           Self,
                                           Tgroup,
                                           {Tpos, TargetMode, TargetNum1},
                                           {Tformation, TformationLev}),
                  TargetsLen = length(Targets),
                  {NewReduceDmg, NewReduceHeal} =
                      calc_reduce_dmgandheal(Skill, TargetNum1, TargetsLen),
                  Skill2 = Skill1#c_skill{reduce_dmg = NewReduceDmg,
                                          reduce_heal = NewReduceHeal,
                                          skill = S1},
                  range_attack(TargetsLen,
                               1,
                               Targets,
                               Sid,
                               Skill2,
                               AddtArg),
                  true;
              TargetNum1 =:= 1 ->
                  skill_exec(Skill1, Self, Target, AddtArg),
                  true;
              true ->
                  logger:error("技能[~w]作用个数设置错误:~w",
                               [Skill#c_skill.id, TargetNum1],
                               combat,
                               2429),
                  false
           end,
    case
        combat_cache:get_context_elem([#combat_context.kill_someone])
        of
        [true] ->
            combat_cache:save_context([{#combat_context.kill_someone,
                                        []}]),
            kill_passive(Self);
        _ -> ok
    end,
    case Flag of
        true -> combat_play:commit_sub_play();
        false -> skip
    end,
    case
        combat_cache:get_context_elem([#combat_context.revive_self])
        of
        [ReviveSelf = [_ | _]] ->
            combat_cache:save_context([{#combat_context.revive_self,
                                        []}]),
            revive_self(ReviveSelf);
        _ -> skip
    end,
    ok.

range_attack(_, _, [], _Sid, _Skill, _AddtArg) -> ok;
range_attack(0, _, _, _Sid, _Skill, _AddtArg) -> ok;
range_attack(N, TargetNo,
             [#fighter{id = Tid, name = _Name} | T], Sid, Skill,
             AddtArg) ->
    Self = combat_cache:f(by_id, Sid),
    case combat_cache:f(by_id, Tid) of
        Target = #fighter{is_escape = 0} ->
            skill_exec(Skill#c_skill{target_no = TargetNo},
                       Self,
                       Target,
                       AddtArg);
        _ -> ok
    end,
    range_attack(N - 1,
                 TargetNo + 1,
                 T,
                 Sid,
                 Skill,
                 AddtArg).

choose_targets(Skill = #c_skill{id = SkillId,
                                skill = #skill{target_type = TargetType}},
               Self = #fighter{pos = SelfPos,
                               is_ai_action = IsAiAction},
               Tgroup, {Tpos, TargetMode, TargetNum},
               {ForMation, ForMationLev}) ->
    PosList = get_choose_pos(Tpos,
                             TargetMode,
                             {ForMation, ForMationLev}),
    PosList1 = case TargetType of
                   5 -> PosList -- [SelfPos];
                   _ -> PosList
               end,
    TargetList = do_choose_targets(1,
                                   PosList1,
                                   Self,
                                   lists:reverse(combat_cache:all(Tgroup)),
                                   Skill,
                                   []),
    SortTargetList = sort_target_list(Skill,
                                      TargetList,
                                      IsAiAction),
    Len = length(SortTargetList),
    case Len =< TargetNum of
        true ->
            case SkillId =:= 60555 andalso
                     TargetMode =:= 1 andalso Len < TargetNum
                of
                true ->
                    choose_targets(Skill,
                                   Self,
                                   Tgroup,
                                   {Tpos, 2, TargetNum},
                                   {ForMation, ForMationLev});
                _ -> SortTargetList
            end;
        false -> lists:sublist(SortTargetList, TargetNum)
    end.

sort_target_list(#c_skill{id = _SkillId,
                          type_flag = TypeFlag,
                          skill =
                              #skill{script_id = ScriptId, script_args = Args}},
                 TargetList, IsAiAction) ->
    ok,
    logger:debug("技能[~w]的特殊标志[~w],脚本:[~w]",
                 [_SkillId, TypeFlag, ScriptId],
                 combat,
                 2504),
    case TypeFlag of
        heal ->
            do_sort_target_list(heal, TargetList, IsAiAction);
        revive ->
            do_sort_target_list(revive, TargetList, IsAiAction);
        clear_buff ->
            case ScriptId of
                20014 ->
                    CleanType = lists:nth(3, Args),
                    case CleanType of
                        4 ->
                            do_sort_target_list(control,
                                                TargetList,
                                                IsAiAction);
                        _ -> do_sort_target_list(normal, TargetList, IsAiAction)
                    end;
                50021 ->
                    CleanType = lists:nth(1, Args),
                    case CleanType of
                        2 ->
                            do_sort_target_list(debuff, TargetList, IsAiAction);
                        _ -> do_sort_target_list(normal, TargetList, IsAiAction)
                    end;
                _ -> do_sort_target_list(normal, TargetList, IsAiAction)
            end;
        hp_low ->
            logger:debug("技能[~w]的特殊标志[~w],脚本:[~w]",
                         [_SkillId, TypeFlag, IsAiAction],
                         combat,
                         2533),
            do_sort_target_list(heal, TargetList, IsAiAction);
        _ -> do_sort_target_list(normal, TargetList, IsAiAction)
    end.

do_sort_target_list(heal,
                    AllTargetList = [{1, F} | TargetList], IsAiAction) ->
    case IsAiAction of
        0 ->
            TargetList1 = [{Hp / max(1, HpMax), Tf}
                           || {_, Tf = #fighter{hp = Hp, hp_max = HpMax}}
                                  <- TargetList],
            TargetList2 = lists:keysort(1, TargetList1),
            TargetList3 = [Tf1 || {_, Tf1} <- TargetList2],
            [F | TargetList3];
        1 ->
            TargetList1 = [{Hp / max(1, HpMax), Tf}
                           || {_, Tf = #fighter{hp = Hp, hp_max = HpMax}}
                                  <- AllTargetList],
            TargetList2 = lists:keysort(1, TargetList1),
            TargetList3 = [Tf1 || {_, Tf1} <- TargetList2],
            TargetList3
    end;
do_sort_target_list(control,
                    AllTargetList = [{1,
                                      F = #fighter{hp = Hp1, hp_max = HpMax1,
                                                   special_status =
                                                       SpecialStatus1}}
                                     | TargetList],
                    IsAiAction) ->
    case IsAiAction of
        0 ->
            TargetList1 = [{not_control(SpecialStatus),
                            Hp / max(1, HpMax),
                            Tf}
                           || {_,
                               Tf = #fighter{hp = Hp, hp_max = HpMax,
                                             special_status = SpecialStatus}}
                                  <- TargetList],
            TargetList2 = util:keys_sort([{asc, 2}, {asc, 1}],
                                         TargetList1),
            TargetList3 = [{not_control(SpecialStatus1),
                            Hp1 / max(1, HpMax1),
                            F}
                           | TargetList2],
            TargetList4 = [Tf1 || {_, _, Tf1} <- TargetList3],
            TargetList4;
        1 ->
            TargetList1 = [{not_control(SpecialStatus),
                            Hp / max(1, HpMax),
                            Tf}
                           || {_,
                               Tf = #fighter{hp = Hp, hp_max = HpMax,
                                             special_status = SpecialStatus}}
                                  <- AllTargetList],
            TargetList2 = util:keys_sort([{asc, 2}, {asc, 1}],
                                         TargetList1),
            TargetList3 = [Tf1 || {_, _, Tf1} <- TargetList2],
            TargetList3
    end;
do_sort_target_list(debuff,
                    AllTargetList = [{1,
                                      F = #fighter{hp = Hp1, hp_max = HpMax1,
                                                   buffs = Buffs}}
                                     | TargetList],
                    IsAiAction) ->
    case IsAiAction of
        0 ->
            TargetList1 = [{not_debuff(TBuffs),
                            Hp / max(1, HpMax),
                            Tf}
                           || {_,
                               Tf = #fighter{hp = Hp, hp_max = HpMax,
                                             buffs = TBuffs}}
                                  <- TargetList],
            TargetList2 = util:keys_sort([{asc, 2}, {asc, 1}],
                                         TargetList1),
            TargetList3 = [{not_debuff(Buffs),
                            Hp1 / max(1, HpMax1),
                            F}
                           | TargetList2],
            TargetList4 = [Tf1 || {_, _, Tf1} <- TargetList3],
            TargetList4;
        1 ->
            TargetList1 = [{not_debuff(TBuffs),
                            Hp / max(1, HpMax),
                            Tf}
                           || {_,
                               Tf = #fighter{hp = Hp, hp_max = HpMax,
                                             buffs = TBuffs}}
                                  <- AllTargetList],
            TargetList2 = util:keys_sort([{asc, 2}, {asc, 1}],
                                         TargetList1),
            TargetList3 = [Tf1 || {_, _, Tf1} <- TargetList2],
            TargetList3
    end;
do_sort_target_list(revive,
                    AllTargetList = [{1,
                                      F = #fighter{hp = Hp1, hp_max = HpMax1}}
                                     | TargetList],
                    IsAiAction) ->
    case IsAiAction of
        0 ->
            TargetList1 = [{Hp / max(1, HpMax), Tf}
                           || {_, Tf = #fighter{hp = Hp, hp_max = HpMax}}
                                  <- TargetList],
            TargetList2 = lists:keysort(1, TargetList1),
            TargetList3 = [{Hp1 / max(1, HpMax1), F} | TargetList2],
            TargetList4 = choose_revive(TargetList3, [], [], 1),
            TargetList5 = [Tf1 || {_, Tf1} <- TargetList4],
            TargetList5;
        1 ->
            TargetList1 = [{Hp / max(1, HpMax), Tf}
                           || {_, Tf = #fighter{hp = Hp, hp_max = HpMax}}
                                  <- AllTargetList],
            TargetList2 = lists:keysort(1, TargetList1),
            TargetList3 = choose_revive(TargetList2, [], [], 1),
            TargetList4 = [Tf1 || {_, Tf1} <- TargetList3],
            TargetList4
    end;
do_sort_target_list(_, TargetList, _IsAiAction) ->
    [F || {_, F} <- TargetList].

not_control(#special_status{is_taunt = IsTaunt,
                            is_chaos = IsChaos, is_stun = IsStun,
                            is_seal = IsSeal, is_sleep = IsSleep,
                            is_stone = IsStone}) ->
    case IsTaunt + IsChaos + IsStun + IsSeal + IsSleep +
             IsStone
             =:= 0
        of
        true -> 1;
        _ -> 0
    end.

not_debuff(Buffs) ->
    case lists:keyfind(debuff, #c_buff.eff_type, Buffs) of
        #c_buff{} -> 0;
        _ -> 1
    end.

choose_revive([], TargetList, BackUpList, _Flag) ->
    lists:reverse(TargetList) ++ lists:reverse(BackUpList);
choose_revive([{HpRatio, F} | T], TargetList,
              BackUpList, 1)
    when HpRatio == 0 ->
    choose_revive(T, [{0, F} | TargetList], BackUpList, 0);
choose_revive([{HpRatio, F} | T], TargetList,
              BackUpList, 0)
    when HpRatio == 0 ->
    choose_revive(T, TargetList, [{0, F} | BackUpList], 0);
choose_revive([H | T], TargetList, BackUpList, Flag) ->
    choose_revive(T, [H | TargetList], BackUpList, Flag).

do_choose_targets(_Flag, [], _Self, _TargetList, _Skill,
                  Result) ->
    lists:reverse(Result);
do_choose_targets(Flag, [Pos | T], Self, AllFighter,
                  Skill, Result) ->
    case lists:keyfind(Pos, #fighter.pos, AllFighter) of
        F = #fighter{name = _Name, is_escape = 0} ->
            ok,
            case combat_skill:can_use_skill(Skill, Self, F) of
                1 ->
                    ok,
                    case combat_util:can_choose_stealth(Self, F) of
                        true ->
                            ok,
                            do_choose_targets(Flag + 1,
                                              T,
                                              Self,
                                              AllFighter,
                                              Skill,
                                              [{Flag, F} | Result]);
                        false ->
                            ok,
                            do_choose_targets(Flag,
                                              T,
                                              Self,
                                              AllFighter,
                                              Skill,
                                              Result)
                    end;
                0 ->
                    ok,
                    do_choose_targets(Flag,
                                      T,
                                      Self,
                                      AllFighter,
                                      Skill,
                                      Result)
            end;
        _ ->
            do_choose_targets(Flag,
                              T,
                              Self,
                              AllFighter,
                              Skill,
                              Result)
    end.

pos_to_ui_pos(Pos, PosDesc) ->
    case lists:keyfind(Pos, 1, PosDesc) of
        {_, P} -> P;
        _ -> Pos
    end.

ui_pos_to_pos(UiPos, PosDesc) ->
    case lists:keyfind(UiPos, 2, PosDesc) of
        {P, _} -> P;
        _ -> UiPos
    end.

get_choose_pos(Pos, 0, {ForMationId, ForMationLev}) ->
    PosDesc = case formation_data:get({ForMationId,
                                       ForMationLev})
                  of
                  #formation_data{pos_desc = Pd} -> Pd;
                  _ -> []
              end,
    TUiPos = pos_to_ui_pos(Pos, PosDesc),
    UiList = case TUiPos of
                 1 -> [1, 2, 3, 4, 5];
                 2 -> [2, 1, 3, 4, 5];
                 3 -> [3, 1, 2, 4, 5];
                 4 -> [4, 1, 2, 3, 5];
                 5 -> [5, 1, 2, 3, 4];
                 6 -> [6, 7, 8, 9, 10];
                 7 -> [7, 6, 8, 9, 10];
                 8 -> [8, 6, 7, 9, 10];
                 9 -> [9, 6, 7, 8, 10];
                 10 -> [10, 6, 7, 8, 9];
                 11 -> [11, 12, 13];
                 12 -> [12, 11, 13];
                 13 -> [13, 11, 12];
                 _ -> [1, 2, 3, 4, 5]
             end,
    [ui_pos_to_pos(U, PosDesc) || U <- UiList];
get_choose_pos(Pos, 4, {ForMationId, ForMationLev}) ->
    PosDesc = case formation_data:get({ForMationId,
                                       ForMationLev})
                  of
                  #formation_data{pos_desc = Pd} -> Pd;
                  _ -> []
              end,
    TUiPos = pos_to_ui_pos(Pos, PosDesc),
    UiList = case TUiPos of
                 1 -> [1, 2, 3, 4, 5];
                 2 -> [2, 1, 3, 4, 5];
                 3 -> [3, 2, 4, 1, 5];
                 4 -> [4, 3, 5, 2, 1];
                 5 -> [5, 4, 3, 2, 1];
                 6 -> [6, 7, 8, 9, 10];
                 7 -> [7, 6, 8, 9, 10];
                 8 -> [8, 7, 9, 6, 10];
                 9 -> [9, 8, 10, 7, 6];
                 10 -> [10, 9, 8, 7, 6];
                 11 -> [11, 12, 13];
                 12 -> [12, 11, 13];
                 13 -> [13, 12, 11];
                 _ -> [3, 2, 4, 1, 5]
             end,
    [ui_pos_to_pos(U, PosDesc) || U <- UiList];
get_choose_pos(Pos, 1, {ForMationId, ForMationLev}) ->
    PosDesc = case formation_data:get({ForMationId,
                                       ForMationLev})
                  of
                  #formation_data{pos_desc = Pd} -> Pd;
                  _ -> []
              end,
    TUiPos = pos_to_ui_pos(Pos, PosDesc),
    UiList = case TUiPos of
                 1 -> [1, 6];
                 6 -> [6, 1];
                 2 -> [2, 7, 11];
                 7 -> [7, 2, 11];
                 11 -> [11, 2, 7];
                 3 -> [3, 8, 12];
                 8 -> [8, 3, 12];
                 12 -> [12, 3, 8];
                 4 -> [4, 9, 13];
                 9 -> [9, 4, 13];
                 13 -> [13, 4, 9];
                 5 -> [5, 10];
                 10 -> [10, 5];
                 _ -> [1, 6]
             end,
    [ui_pos_to_pos(U, PosDesc) || U <- UiList];
get_choose_pos(Pos, 3, {ForMationId, ForMationLev}) ->
    PosDesc = case formation_data:get({ForMationId,
                                       ForMationLev})
                  of
                  #formation_data{pos_desc = Pd} -> Pd;
                  _ -> []
              end,
    TUiPos = pos_to_ui_pos(Pos, PosDesc),
    UiList = case TUiPos of
                 1 -> [1 | util:shuffle([6, 7, 2, 11])];
                 2 -> [2 | util:shuffle([1, 6, 7, 8, 3, 12, 11])];
                 3 -> [3 | util:shuffle([2, 7, 8, 9, 4, 13, 12, 11])];
                 4 -> [4 | util:shuffle([3, 8, 9, 10, 5, 13, 12])];
                 5 -> [5 | util:shuffle([4, 9, 10, 13])];
                 6 -> [6 | util:shuffle([7, 2, 1])];
                 7 -> [7 | util:shuffle([8, 3, 2, 1, 6])];
                 8 -> [8 | util:shuffle([9, 4, 3, 2, 7])];
                 9 -> [9 | util:shuffle([10, 5, 4, 3, 8])];
                 10 -> [10 | util:shuffle([5, 4, 9])];
                 11 -> [11 | util:shuffle([1, 2, 3, 12])];
                 12 -> [12 | util:shuffle([11, 2, 3, 4, 13])];
                 13 -> [13 | util:shuffle([12, 3, 4, 5])];
                 _ -> [1 | util:shuffle([6, 7, 2, 11])]
             end,
    [ui_pos_to_pos(U, PosDesc) || U <- UiList];
get_choose_pos(Pos, 2, _) ->
    if Pos =:= 1 ->
           [1 | util:shuffle([2,
                              3,
                              4,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13])];
       Pos =:= 2 ->
           [2 | util:shuffle([1,
                              3,
                              4,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13])];
       Pos =:= 3 ->
           [3 | util:shuffle([1,
                              2,
                              4,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13])];
       Pos =:= 4 ->
           [4 | util:shuffle([1,
                              2,
                              3,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13])];
       Pos =:= 5 ->
           [5 | util:shuffle([1,
                              2,
                              3,
                              4,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13])];
       Pos =:= 6 ->
           [6 | util:shuffle([1,
                              2,
                              3,
                              4,
                              5,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13])];
       Pos =:= 7 ->
           [7 | util:shuffle([1,
                              2,
                              3,
                              4,
                              5,
                              6,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13])];
       Pos =:= 8 ->
           [8 | util:shuffle([1,
                              2,
                              3,
                              4,
                              5,
                              6,
                              7,
                              9,
                              10,
                              11,
                              12,
                              13])];
       Pos =:= 9 ->
           [9 | util:shuffle([1,
                              2,
                              3,
                              4,
                              5,
                              6,
                              7,
                              8,
                              10,
                              11,
                              12,
                              13])];
       Pos =:= 10 ->
           [10 | util:shuffle([1,
                               2,
                               3,
                               4,
                               5,
                               6,
                               7,
                               8,
                               9,
                               11,
                               12,
                               13])];
       Pos =:= 11 ->
           [11 | util:shuffle([1,
                               2,
                               3,
                               4,
                               5,
                               6,
                               7,
                               8,
                               9,
                               10,
                               12,
                               13])];
       Pos =:= 12 ->
           [12 | util:shuffle([1,
                               2,
                               3,
                               4,
                               5,
                               6,
                               7,
                               8,
                               9,
                               10,
                               11,
                               13])];
       Pos =:= 13 ->
           [13 | util:shuffle([1,
                               2,
                               3,
                               4,
                               5,
                               6,
                               7,
                               8,
                               9,
                               10,
                               11,
                               12])];
       true ->
           [1 | util:shuffle([2,
                              3,
                              4,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13])]
    end;
get_choose_pos(Pos, 5, _Args) ->
    L = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13],
    if Pos =:= 1 ->
           [1 | util:shuffle([2,
                              3,
                              4,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13]
                                 ++ L)];
       Pos =:= 2 ->
           [2 | util:shuffle([1,
                              3,
                              4,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13]
                                 ++ L)];
       Pos =:= 3 ->
           [3 | util:shuffle([1,
                              2,
                              4,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13]
                                 ++ L)];
       Pos =:= 4 ->
           [4 | util:shuffle([1,
                              2,
                              3,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13]
                                 ++ L)];
       Pos =:= 5 ->
           [5 | util:shuffle([1,
                              2,
                              3,
                              4,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13]
                                 ++ L)];
       Pos =:= 6 ->
           [6 | util:shuffle([1,
                              2,
                              3,
                              4,
                              5,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13]
                                 ++ L)];
       Pos =:= 7 ->
           [7 | util:shuffle([1,
                              2,
                              3,
                              4,
                              5,
                              6,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13]
                                 ++ L)];
       Pos =:= 8 ->
           [8 | util:shuffle([1,
                              2,
                              3,
                              4,
                              5,
                              6,
                              7,
                              9,
                              10,
                              11,
                              12,
                              13]
                                 ++ L)];
       Pos =:= 9 ->
           [9 | util:shuffle([1,
                              2,
                              3,
                              4,
                              5,
                              6,
                              7,
                              8,
                              10,
                              11,
                              12,
                              13]
                                 ++ L)];
       Pos =:= 10 ->
           [10 | util:shuffle([1,
                               2,
                               3,
                               4,
                               5,
                               6,
                               7,
                               8,
                               9,
                               11,
                               12,
                               13]
                                  ++ L)];
       Pos =:= 11 ->
           [11 | util:shuffle([1,
                               2,
                               3,
                               4,
                               5,
                               6,
                               7,
                               8,
                               9,
                               10,
                               12,
                               13]
                                  ++ L)];
       Pos =:= 12 ->
           [12 | util:shuffle([1,
                               2,
                               3,
                               4,
                               5,
                               6,
                               7,
                               8,
                               9,
                               10,
                               11,
                               13]
                                  ++ L)];
       Pos =:= 13 ->
           [13 | util:shuffle([1,
                               2,
                               3,
                               4,
                               5,
                               6,
                               7,
                               8,
                               9,
                               10,
                               11,
                               12]
                                  ++ L)];
       true ->
           [1 | util:shuffle([2,
                              3,
                              4,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13]
                                 ++ L)]
    end.

skill_exec(#c_skill{skill = #skill{name = _Name},
                    action = undefined},
           _Self, _Target, _AddtArg) ->
    logger:error("技能[~ts]没有配置行动脚本", [_Name], combat, 2822),
    ignore;
skill_exec(_Skill,
           #fighter{name = _Name, is_die = IsDie,
                    is_escape = IsEscape},
           _Target, _AddtArg)
    when IsDie =:= 1 orelse IsEscape =:= 1 ->
    ok,
    ignore;
skill_exec(_Skill, _Self,
           #fighter{name = _Name, is_escape = 1}, _AddtArg) ->
    ok,
    ignore;
skill_exec(Skill = #c_skill{skill = #skill{id = _Id},
                            action = Action},
           Self = #fighter{id = Sid, name = _SName,
                           group = _Sgroup},
           Target = #fighter{id = Tid, name = _TName,
                             group = _Tgroup},
           AddtArg) ->
    case combat_skill:can_use_skill(Skill, Self, Target) of
        1 ->
            combat_stat:update_use_skill(Self, _Id),
            combat_skill:add_skill_cooldown(Sid, Skill),
            case immunity_skill(Self, Target, Skill) of
                {true, TargetValChanges, TargetChanges, NeedNext} ->
                    {SelfValChanges, SelfChanges} =
                        combat_script_skill_calc:calc_cost(Skill, Self),
                    {SpecialSelfValChanges, SpecialSelfChanges} =
                        combat_script_skill:calc_special_self_changes(Skill,
                                                                      Self),
                    combat_cache:u(Sid,
                                   SelfValChanges ++ SpecialSelfValChanges),
                    combat_cache:u(Tid, TargetValChanges),
                    combat_play:add_sub_play(combat_play:gen_sub_skill_play(attack,
                                                                            {Self,
                                                                             Target,
                                                                             Skill,
                                                                             SelfChanges
                                                                                 ++
                                                                                 SpecialSelfChanges,
                                                                             TargetChanges,
                                                                             1,
                                                                             0,
                                                                             0,
                                                                             0,
                                                                             [],
                                                                             0})),
                    case NeedNext of
                        1 ->
                            AddtArg1 = AddtArg#c_skill_addt_arg{skip_exec = 1},
                            combat_util:run(Action,
                                            [Skill, Self, Target, AddtArg1]);
                        _ -> skip
                    end;
                _ ->
                    combat_util:run(Action, [Skill, Self, Target, AddtArg])
            end;
        0 -> ignore
    end.

immunity_skill(#fighter{group = Group},
               #fighter{group = Group}, _) ->
    false;
immunity_skill(_Self,
               _Target = #fighter{special_attr =
                                      #special_attr{immunity = 1,
                                                    has_immunity = 0}},
               _Skill = #c_skill{special_type = SpecialType}) ->
    TargetValChanges = [{has_immunity, 0, 1}],
    TargetChanges = [{8, 1, 0}],
    NeedNext = case lists:member(immunity_next, SpecialType)
                   of
                   true -> 1;
                   _ -> 0
               end,
    {true, TargetValChanges, TargetChanges, NeedNext};
immunity_skill(_Self, _Target, _Skill) -> false.

kill_passive(Self) ->
    combat_script_skill_calc:passive_activate(kill,
                                              Self,
                                              Self),
    ok.

revive_self([]) -> ok;
revive_self([{Fid, Skill, Ae, BuffList} | T]) ->
    F = #fighter{name = _Name} = combat_cache:f(by_id, Fid),
    Tvc = [{is_die, 0, 0}],
    Tc = [{2, 0, 0}],
    ok,
    SkillAddtArg = #c_skill_addt_arg{target_val_changed =
                                         Tvc,
                                     target_changed = Tc,
                                     target_buff = BuffList,
                                     ext_args = [{anti_heal_ratio, 1}]},
    combat_script_skill_calc:heal(Skill,
                                  F,
                                  F,
                                  SkillAddtArg,
                                  Ae),
    combat_play:commit_sub_play(),
    revive_self(T).

combat_over(Combat = #combat{start_time = StartTime,
                             observers = Observers, round = Round}) ->
    ok,
    {ActionPlayList, BuffPlayList, SummonPlayList} =
        get(base_10720),
    FighterStatus = combat_fighter:format_fighter_status(),
    CombatResult = 1,
    Data = {Round,
            StartTime,
            ActionPlayList,
            BuffPlayList,
            SummonPlayList,
            [],
            [],
            FighterStatus,
            CombatResult,
            0,
            30000 div 1000,
            [],
            0,
            0,
            [],
            [],
            [],
            []},
    Tplay = combat_play:calc_end_time(ActionPlayList),
    pack_10720(Data),
    pack_10720_ob(Observers, Data),
    calc_wave_reward(Combat),
    Combat1 = Combat#combat{ts = erlang:now(),
                            t_idle = Tplay},
    {next_state, play_calc, Combat1, Tplay}.

combat_over_for_escape(Combat) ->
    ok,
    Combat1 = combat_end:combat_over(Combat),
    Combat2 = combat_over_statistics(Combat1),
    combat_end:combat_over_leave(Combat2).

combat_over_statistics(Combat = #combat{type =
                                            _CombatType}) ->
    Combat1 = combat_stat:combat_over_statistics(Combat),
    Combat1.

save_last_skill(#fighter{id = Sid, type = 1,
                         last_skill = LastSkill, action = Action,
                         is_auto = IsAuto}) ->
    NewLastSkill = case Action of
                       {#c_skill{id = LastSkill2}, _} ->
                           case IsAuto of
                               1 -> LastSkill;
                               0 ->
                                   case
                                       combat_skill:is_illegal_auto_skill(LastSkill2)
                                       of
                                       true -> LastSkill;
                                       false -> LastSkill2
                                   end
                           end;
                       _ -> LastSkill
                   end,
    combat_cache:u(Sid, [{last_skill, 0, NewLastSkill}]),
    ok;
save_last_skill(_) -> ok.

is_all_action(Mode) ->
    {List1, List2} =
        combat_util:filter_fighter(combat_cache:all(),
                                   [1],
                                   [3, 6]),
    NewList2 = filter_clone_pet(List2, List1, []),
    is_all_action(Mode, List1 ++ NewList2).

is_all_action(_Mode, []) -> true;
is_all_action(Mode,
              [#fighter{name = _Name, is_escape = IsEscape,
                        is_die = IsDie, type = Type}
               | T])
    when IsEscape =:= 1 orelse
             IsDie =:= 1 andalso Type =/= 1 ->
    is_all_action(Mode, T);
is_all_action(Mode,
              [#fighter{id = Sid, name = _Name, is_hosted = 1,
                        type = Type}
               | T]) ->
    case Type of
        1 ->
            NewT = [F
                    || F = #fighter{master_fid = MasterFid} <- T,
                       MasterFid =/= Sid],
            is_all_action(Mode, NewT);
        _ -> is_all_action(Mode, T)
    end;
is_all_action(Mode,
              [#fighter{name = _Name, id = Sid, type = Type,
                        is_auto = IsAuto, is_ready = IsReady, action = Action}
               | T]) ->
    Flag = case Mode of
               ready_mode -> IsReady =:= 1;
               auto_mode -> IsAuto =:= 1
           end,
    case Flag of
        true when Type =:= 1 ->
            NewT = [F
                    || F = #fighter{master_fid = MasterFid} <- T,
                       MasterFid =/= Sid],
            is_all_action(Mode, NewT);
        true -> is_all_action(Mode, T);
        false ->
            case Action =:= undefined of
                true -> false;
                false -> is_all_action(Mode, T)
            end
    end.

filter_clone_pet([], _, PetList) -> PetList;
filter_clone_pet([P = #fighter{master_fid = Sid} | T],
                 RoleList, PetList) ->
    case lists:keyfind(Sid, #fighter.id, RoleList) of
        false -> filter_clone_pet(T, RoleList, PetList);
        _ -> filter_clone_pet(T, RoleList, [P | PetList])
    end.

init_type(#combat{type = 34}) ->
    put(shipping_wave, 1),
    put(shipping_num, 0),
    ok;
init_type(#combat{type = 60,
                  start_args =
                      #combat_start_args{max_guard = MaxGuard,
                                         ext_args = [Id | _]}}) ->
    put(glory_id, Id),
    put(guard_num, MaxGuard),
    ok;
init_type(#combat{type = 43}) ->
    put(endless_challenge_wave, 1),
    ok;
init_type(#combat{type = 62}) ->
    put(spirit_treasure_wave, 1),
    ok;
init_type(#combat{type = 70}) ->
    put(oracle_treasure_wave, 1),
    ok;
init_type(#combat{type = 71}) ->
    put(gods_challenge_wave, 1),
    ok;
init_type(_) -> ok.

next_wave(Combat = #combat{type = 34}) ->
    shipping_combat:set_num(Combat, combat_cache:dfd(), 0),
    shipping_combat:push_combat_info(Combat, all),
    false;
next_wave(Combat = #combat{type = 43}) ->
    case combat_util:is_all_die(combat_cache:dfd()) of
        true -> endless_challenge_combat:next_wave(Combat);
        _ -> ok
    end;
next_wave(Combat = #combat{type = 60}) ->
    case combat_util:is_all_die(combat_cache:dfd()) andalso
             not combat_util:is_all_die(combat_cache:atk())
        of
        true -> glory_combat:next_wave(Combat);
        _ -> ok
    end;
next_wave(Combat = #combat{type = 62}) ->
    case combat_util:is_all_die(combat_cache:dfd()) of
        true ->
            spirit_treasure_combat:next_wave(Combat),
            spirit_treasure_combat:push_combat_info(Combat, all);
        _ -> ok
    end;
next_wave(Combat = #combat{type = 70}) ->
    case combat_util:is_all_die(combat_cache:dfd()) of
        true ->
            oracle_treasure_combat:next_wave(Combat),
            oracle_treasure_combat:push_combat_info(Combat, all);
        _ -> ok
    end;
next_wave(Combat = #combat{type = 71}) ->
    case combat_util:is_all_die(combat_cache:dfd()) of
        true -> gods_challenge_combat:next_wave(Combat);
        _ -> ok
    end;
next_wave(_Combat) -> false.

add_next_wave(Type, UnitBaseIds, Group) ->
    L = combat_mgr:to_fighters(Type, UnitBaseIds),
    L1 = [F#fighter{group = Group} || F <- L],
    [AllWaitingNextWave] =
        combat_cache:get_context_elem([#combat_context.all_waiting_next_wave]),
    logger:debug("添加下次加入的怪:~w",
                 [UnitBaseIds],
                 combat,
                 3077),
    combat_cache:save_context([{#combat_context.all_waiting_next_wave,
                                [L1 | AllWaitingNextWave]}]).

add_wait_wave(Combat = #combat{type = Type,
                               waiting_next_wave = WaitNextWave},
              UnitBaseIds, JoinGroup) ->
    L = combat_mgr:to_fighters(Type, UnitBaseIds),
    L1 = [F#fighter{group = JoinGroup} || F <- L],
    Combat#combat{waiting_next_wave = L1 ++ WaitNextWave}.

get_action_list(NeedActionIds) ->
    NeedActionF = combat_util:id_to_f(NeedActionIds),
    do_get_sort(NeedActionF).

do_get_sort(NeedActionF) ->
    FinalActionF = special_order(NeedActionF),
    FinalActionIds = [Id
                      || #fighter{id = Id} <- FinalActionF],
    {FinalActionIds, FinalActionF}.

special_order(NeedActionF) ->
    special_order(NeedActionF, [], [], [], []).

special_order([], Def, Catch, Prt, Other) ->
    Def1 = util:keys_sort([{asc, #fighter.order}], Def),
    Catch1 = util:keys_sort([{asc, #fighter.order}], Catch),
    Prt1 = util:keys_sort([{asc, #fighter.order}], Prt),
    Other1 = util:keys_sort([{asc, 2}, 1], Other),
    Other2 = [F || {_, _, F} <- Other1],
    Def1 ++ Catch1 ++ Prt1 ++ Other2;
special_order([F = #fighter{order = Order,
                            action = Action,
                            special_status =
                                #special_status{is_taunt = IsTaunt,
                                                is_chaos = IsChaos}}
               | T],
              Def, Catch, Prt, Other) ->
    case Action of
        {#c_skill{id = 1001}, _}
            when IsTaunt =:= 0 andalso IsChaos =:= 0 ->
            special_order(T, [F | Def], Catch, Prt, Other);
        {#c_skill{id = 1006}, _} ->
            special_order(T, Def, [F | Catch], Prt, Other);
        {#c_skill{id = 1003}, _}
            when IsTaunt =:= 0 andalso IsChaos =:= 0 ->
            special_order(T, Def, Catch, [F | Prt], Other);
        {CSkill = #c_skill{skill = #skill{speed = Speed}}, _} ->
            case special_order_ext(CSkill, F) of
                {true, H} ->
                    special_order(T, Def, Catch, Prt, [H | Other]);
                _ ->
                    special_order(T,
                                  Def,
                                  Catch,
                                  Prt,
                                  [{Speed, Order, F} | Other])
            end;
        _ ->
            special_order(T,
                          Def,
                          Catch,
                          Prt,
                          [{1, Order, F} | Other])
    end.

special_order_ext(#c_skill{skill =
                               #skill{script_id = 20063}},
                  F = #fighter{order = Order, buffs = Buffs}) ->
    case lists:keymember(69506, #c_buff.id, Buffs) of
        true -> {true, {10000, Order, F}};
        _ -> false
    end;
special_order_ext(_CSkill = #c_skill{id = SkillId},
                  F = #fighter{ext_args = _ExtArgs, order = Order}) ->
    Flag = combat_cache:get_ext_val(F, 6, 0),
    IsSkill = lists:member(SkillId,
                           [60011,
                            60012,
                            60013,
                            60014,
                            60015,
                            60016,
                            60017,
                            60019,
                            1000]),
    case Flag of
        1 when IsSkill == true -> {true, {10000, Order, F}};
        _ -> false
    end.

continue_fighting(Combat = #combat{cur_plot = CurPlot,
                                   round = Round}) ->
    Combat1 = case CurPlot of
                  {Fid, Fround, _GuideId} when Round >= Fround ->
                      F = combat_cache:f(by_id, Fid),
                      NF = #fighter{plot = _Plot} = plot_combat:finish(F),
                      combat_cache:u(NF),
                      Combat#combat{cur_plot = 0};
                  _ -> Combat
              end,
    round_end_calc(Combat1).

first_round(timeout, Combat) ->
    endless_challenge_combat:push_combat_info(Combat, all),
    glory_combat:push_combat_info(Combat, all),
    spirit_treasure_combat:push_combat_info(Combat, all),
    case is_all_action(auto_mode) of
        true -> round_calc(Combat);
        false ->
            {next_state,
             fight_wait,
             Combat#combat{ts = erlang:now()},
             30000}
    end;
first_round(_Any, Combat) ->
    continue(first_round, Combat).

fight_wait(timeout, Combat) -> round_calc(Combat);
fight_wait(_Any, Combat) ->
    continue(fight_wait, Combat).

fight_playing(timeout,
              Combat = #combat{t_play = _Tplay}) ->
    lists:foreach(fun (F) -> handle_escape(F, Combat) end,
                  combat_cache:all()),
    case is_all_action(ready_mode) of
        true -> round_calc(Combat);
        false ->
            {next_state,
             fight_playing_idle,
             Combat#combat{ts = erlang:now()},
             30000}
    end;
fight_playing(_Any, Combat) ->
    continue(fight_playing, Combat).

fight_playing_idle(timeout, Combat) ->
    case is_all_action(auto_mode) of
        true ->
            ok,
            round_calc(Combat);
        false ->
            {next_state,
             fight_wait,
             Combat#combat{ts = erlang:now()},
             30000}
    end;
fight_playing_idle(_Any, Combat) ->
    continue(fight_playing_idle, Combat).

play_calc(timeout,
          Combat = #combat{winner = Winner, loser = Loser,
                           result = Result}) ->
    lists:foreach(fun (#fighter{type = 1, pid = Pid})
                          when is_pid(Pid) ->
                          CombatResult = case Result of
                                             3 -> 3;
                                             2 -> 2;
                                             _ -> 0
                                         end,
                          role:pack_send(Pid, 10789, {CombatResult});
                      (_) -> skip
                  end,
                  Loser),
    lists:foreach(fun (#fighter{type = 1, pid = Pid})
                          when is_pid(Pid) ->
                          CombatResult = case Result of
                                             3 -> 3;
                                             2 -> 2;
                                             _ -> 1
                                         end,
                          role:pack_send(Pid, 10789, {CombatResult});
                      (_) -> skip
                  end,
                  Winner),
    Combat1 = combat_end:combat_over(Combat),
    Combat2 = combat_over_statistics(Combat1),
    combat_end:combat_over_leave(Combat2),
    {stop, normal, Combat2};
play_calc(_Any, Combat) -> continue(play_calc, Combat).

continue(first_round, Combat = #combat{ts = Ts}) ->
    logger:debug("~w",
                 [util:time_left(3000, Ts)],
                 combat,
                 3250),
    {next_state,
     first_round,
     Combat,
     util:time_left(3000, Ts)};
continue(fight_wait, Combat = #combat{ts = Ts}) ->
    logger:debug("~w",
                 [util:time_left(30000, Ts)],
                 combat,
                 3253),
    {next_state,
     fight_wait,
     Combat,
     util:time_left(30000, Ts)};
continue(fight_playing,
         Combat = #combat{ts = Ts, t_play = TplayMax}) ->
    {next_state,
     fight_playing,
     Combat,
     util:time_left(TplayMax, Ts)};
continue(fight_playing_idle,
         Combat = #combat{ts = Ts}) ->
    {next_state,
     fight_playing_idle,
     Combat,
     util:time_left(30000, Ts)};
continue(play_calc,
         Combat = #combat{ts = Ts, t_idle = Tidle}) ->
    {next_state,
     play_calc,
     Combat,
     util:time_left(Tidle, Ts)}.

get_attack_and_dfd(107, CombatObserArgs, WatchArgs) ->
    case lists:keyfind(observer_args, 1, CombatObserArgs) of
        {observer_args, ObserverArgs} ->
            case WatchArgs of
                #{hero_camp := HeroCamp} ->
                    case lists:keyfind(HeroCamp, 2, ObserverArgs) of
                        {Group, _TargetHeroCamp} -> {ok, {0, "", 0}, Group};
                        false -> {false, lang:get("对方正在荣耀战场，不能进行观战")}
                    end;
                _ -> {false, lang:get("对方正在荣耀战场，不能进行观战")}
            end;
        false -> get_attack_and_dfd_default(WatchArgs)
    end;
get_attack_and_dfd(103, CombatObserArgs, WatchArgs) ->
    case lists:keyfind(observer_args, 1, CombatObserArgs) of
        {observer_args, ObserverArgs} ->
            case WatchArgs of
                #{warrior_camp := Camp, warrior_seq := SeqId} ->
                    case lists:keyfind({Camp, SeqId}, 2, ObserverArgs) of
                        {Group, _TargetHeroCamp} -> {ok, {0, "", 0}, Group};
                        false -> {false, lang:get("对方正在勇士战场，不能进行观战")}
                    end;
                _ -> {false, lang:get("对方正在勇士战场，不能进行观战")}
            end;
        false -> get_attack_and_dfd_default(WatchArgs)
    end;
get_attack_and_dfd(105, CombatObserArgs, WatchArgs) ->
    case lists:keyfind(observer_args, 1, CombatObserArgs) of
        {observer_args, ObserverArgs} ->
            case WatchArgs of
                #{guild_side := RoleSide, guild_id := GuildId} ->
                    case lists:keyfind({GuildId, RoleSide}, 2, ObserverArgs)
                        of
                        {Group, _TargetHeroCamp} -> {ok, {0, "", 0}, Group};
                        false -> {false, lang:get("您与对方不在同一场公会战中，无法进行观战")}
                    end;
                _ -> {false, lang:get("您与对方不在同一场公会战中，无法进行观战")}
            end;
        false -> get_attack_and_dfd_default(WatchArgs)
    end;
get_attack_and_dfd(106, CombatObserArgs, WatchArgs) ->
    case lists:keyfind(observer_args, 1, CombatObserArgs) of
        {observer_args, ObserverArgs} ->
            case WatchArgs of
                #{guild_id := GuildId} ->
                    case lists:keyfind(GuildId, 2, ObserverArgs) of
                        {Group, _TargetHeroCamp} -> {ok, {0, "", 0}, Group};
                        false -> {false, lang:get("您的公会未参与该场公会英雄战，不能进行观战")}
                    end;
                _ -> {false, lang:get("对方正在公会英雄战，不能进行观战")}
            end;
        false -> get_attack_and_dfd_default(WatchArgs)
    end;
get_attack_and_dfd(108, CombatObserArgs, WatchArgs) ->
    case lists:keyfind(observer_args, 1, CombatObserArgs) of
        {observer_args, ObserverArgs} ->
            case WatchArgs of
                #{guild_side := RoleSide, guild_id := GuildId} ->
                    case lists:keyfind({GuildId, RoleSide}, 2, ObserverArgs)
                        of
                        {Group, _TargetHeroCamp} -> {ok, {0, "", 0}, Group};
                        false -> get_attack_and_dfd_default(WatchArgs)
                    end;
                _ -> get_attack_and_dfd_default(WatchArgs)
            end;
        false -> get_attack_and_dfd_default(WatchArgs)
    end;
get_attack_and_dfd(71, _CombatObServerArgs,
                   _WatchArgs) ->
    {ok, {0, "", 0}, 0};
get_attack_and_dfd(_NormalCombatType, _CombatObserArgs,
                   WatchArgs) ->
    get_attack_and_dfd_default(WatchArgs).

get_attack_and_dfd_default(WatchArgs) ->
    case WatchArgs of
        #{watch_id := {Rid, Plat, Zone}} ->
            case find_observer({Rid, Plat, Zone},
                               combat_cache:all())
                of
                {ok, RoleId, Group} -> {ok, RoleId, Group};
                _ -> {false, lang:get("找不到观战角色")}
            end;
        #{watch_id := {BattleId, Uid}} ->
            case find_observer({BattleId, Uid}, combat_cache:all())
                of
                {ok, UnitId, Group} -> {ok, UnitId, Group};
                _ -> {false, lang:get("找不到观战单位")}
            end;
        _ -> {ok, 0, util:rand(0, 1)}
    end.

find_observer(_, []) -> false;
find_observer(RoleId = {_, _, _},
              [#fighter{origin_id = RoleId, group = Group, type = 1}
               | _]) ->
    {ok, RoleId, Group};
find_observer(UnitId = {_, _},
              [#fighter{origin_id = UnitId, group = Group} | _]) ->
    {ok, UnitId, combat_cache:op(Group)};
find_observer(Id, [_ | T]) -> find_observer(Id, T).

system_joined_play(Joined) ->
    SysSummonPlay = combat_play:gen_sub_summon_play(1,
                                                    0,
                                                    Joined),
    Order = get(play_order_action_end),
    NewSysSummonPlay = SysSummonPlay#summon_play{order =
                                                     Order,
                                                 sub_order = 1},
    SysAction = combat_play:gen_sub_skill_play(wait,
                                               {#fighter{}, #c_skill{}}),
    GloryMsg = get(glory_msg),
    logger:debug("~ts", [GloryMsg], combat, 3404),
    NewSysAction = case get(combat_type) of
                       60 when GloryMsg == undefined ->
                           SysAction#skill_play{order = Order, sub_order = 1};
                       60 ->
                           SysAction#skill_play{order = Order, sub_order = 1,
                                                action_msg = GloryMsg};
                       _ -> SysAction#skill_play{order = Order, sub_order = 1}
                   end,
    erlang:erase(glory_msg),
    {ActionPlayList, BuffPlayList, SummonPlayList} =
        get(base_10720),
    put(base_10720,
        {[{Order, [NewSysAction]} | ActionPlayList],
         BuffPlayList,
         [NewSysSummonPlay | SummonPlayList]}).

calc_wave_reward(Combat = #combat{type = 60,
                                  observers = Observers}) ->
    glory_combat:calc_wave_reward(Combat),
    Wave = get(glory_id),
    combat_util:pack_cast(Observers, 17205, {Wave, []}),
    ok;
calc_wave_reward(Combat = #combat{type = 43,
                                  observers = Observers}) ->
    endless_challenge_combat:calc_wave_reward(Combat),
    Wave = get(endless_challenge_wave),
    combat_util:pack_cast(Observers, 17205, {Wave, []}),
    ok;
calc_wave_reward(Combat = #combat{type = 62,
                                  observers = Observers}) ->
    spirit_treasure_combat:calc_wave_reward(Combat),
    Wave = get(spirit_treasure_wave),
    combat_util:pack_cast(Observers, 20207, {Wave, []}),
    ok;
calc_wave_reward(Combat = #combat{type = 70,
                                  observers = Observers}) ->
    oracle_treasure_combat:calc_wave_reward(Combat),
    Wave = get(oracle_treasure_wave),
    combat_util:pack_cast(Observers, 20807, {Wave, []}),
    ok;
calc_wave_reward(_Combat) -> ok.

check_can_send_screen_msg(CombatType) ->
    case CombatType of
        111 -> true;
        106 -> true;
        71 -> true;
        _ -> false
    end.

calc_target_num(#fighter{buffs = Buffs}, double_target,
                TargetNum) ->
    case lists:keymember(70043, #c_buff.id, Buffs) of
        true -> TargetNum * 2;
        _ -> TargetNum
    end;
calc_target_num(#fighter{buffs = Buffs},
                buff_target_templar, TargetNum) ->
    case lists:keymember(69506, #c_buff.id, Buffs) of
        true ->
            case
                combat_cache:get_context_elem([#combat_context.is_skill_range])
                of
                [true] -> TargetNum;
                _ -> TargetNum + 2
            end;
        _ -> TargetNum
    end;
calc_target_num(_Self, _, TargetNum) -> TargetNum.

calc_reduce_dmgandheal(CSkill = #c_skill{reduce_dmg =
                                             ReduceDmg,
                                         reduce_heal = ReduceHeal,
                                         act_flag = ActFlag},
                       TargetNum, TargetsLen) ->
    if ActFlag =:= double_target ->
           case TargetsLen > TargetNum of
               true ->
                   calc_reduce_dmgandheal(CSkill#c_skill{act_flag =
                                                             undefined},
                                          TargetNum,
                                          TargetsLen div 2);
               _ ->
                   calc_reduce_dmgandheal(CSkill#c_skill{act_flag =
                                                             undefined},
                                          TargetNum,
                                          TargetsLen)
           end;
       ActFlag =:= last_dmg -> {ReduceDmg, ReduceHeal};
       ActFlag =:= revive_all -> {ReduceDmg, ReduceHeal};
       TargetsLen >= 6 ->
           {round(ReduceDmg * 6.19999999999999995559e-1),
            round(ReduceHeal * 6.99999999999999955591e-1)};
       TargetsLen >= 5 ->
           {round(ReduceDmg * 6.7e-1), round(ReduceHeal * 7.5e-1)};
       TargetsLen =:= 4 ->
           {round(ReduceDmg * 7.19999999999999973355e-1),
            round(ReduceHeal * 8.0e-1)};
       TargetsLen =:= 3 ->
           {round(ReduceDmg * 7.7e-1),
            round(ReduceHeal * 8.49999999999999977796e-1)};
       TargetsLen =:= 2 ->
           {round(ReduceDmg * 8.19999999999999951150e-1),
            round(ReduceHeal * 9.0e-1)};
       TargetsLen =:= 1 ->
           {round(ReduceDmg * 1), round(ReduceHeal * 1)};
       true -> {ReduceDmg, ReduceHeal}
    end.

round_trigger(#combat{type = CombatType}) ->
    case CombatType of
        68 ->
            [RoundDie] =
                combat_cache:get_context_elem([#combat_context.round_die]),
            DieBaseId = [BaseId
                         || #fighter{id = Id, base_id = BaseId}
                                <- combat_cache:dfd(),
                            lists:member(Id, RoundDie)],
            Evt = #evt_stars_trial_combat_round{dies = DieBaseId},
            [role_trigger:async_fire(OriginId, Evt)
             || #fighter{origin_id = OriginId, type = 1}
                    <- combat_cache:atk()];
        _ -> ok
    end.

