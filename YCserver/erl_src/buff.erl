-file("src/mod/buff/buff.erl", 1).

-module(buff).

-export([add/2,
         add_and_calc/2,
         async_add/2,
         del/2,
         replace/3,
         async_del/2,
         check_buff/2,
         cancel/2,
         show/2,
         pre_check/2,
         attr/2,
         login/1,
         logout/1,
         init/0,
         pack_list/1,
         push_show/1,
         gm_clean/1,
         calc_looks/1,
         is_hidding/1,
         lookup/2,
         buff_skill/1,
         guard_buff_skill/1,
         calc_pvp/2,
         is_special_effect_exists/2,
         is_special_effect_exists_one_param/2,
         is_special_effect_exists_two_param/2,
         get_info_by_special_effect/2,
         get_ext_param/3,
         add_ext_param/4,
         del_looks_buff/1]).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/mod/buff/buff.erl", 43).

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

-file("src/mod/buff/buff.erl", 44).

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

-file("src/mod/buff/buff.erl", 45).

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

-file("src/mod/buff/buff.erl", 46).

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

-file("src/mod/buff/buff.erl", 47).

-file("inc/looks.hrl", 1).

-file("src/mod/buff/buff.erl", 48).

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

-file("src/mod/buff/buff.erl", 49).

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

-file("src/mod/buff/buff.erl", 50).

-file("inc/guard.hrl", 1).

-record(m_guard,
        {ver = 1 :: pos_integer(),
         free_war_ids = [] :: [pos_integer()],
         tactics_fields = [] :: list(),
         tactics_attr = [] :: list(),
         guards = [] :: list()}).

-record(guard_eqm,
        {ver = 5,
         base_id :: undefined | non_neg_integer(),
         type :: undefined | non_neg_integer(),
         lev,
         eqm_attrs = [] :: list(),
         reset_base_id = 0,
         reset_attrs = [] :: list(),
         gem = [] :: list(),
         is_init = 1,
         timeout = 0,
         back_effect_timeout = 0,
         back_effect_attr = []}).

-record(guard_astroid,
        {ver = 2 :: non_neg_integer(),
         aroused = [] :: non_neg_integer(),
         skills = [] :: list(),
         attrs = [] :: list(),
         growth = 0 :: non_neg_integer(),
         active = 0 :: non_neg_integer()}).

-record(guard_astroid_star,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         attrs = [] :: list()}).

-record(guard,
        {ver = 2,
         base_id = 0 :: non_neg_integer(),
         war_id = 0 :: non_neg_integer(),
         name = "" :: string(),
         alias = "" :: string(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         tac_pos = 0 :: non_neg_integer(),
         skills = [] :: list(),
         eqm = [] :: list(),
         attr :: undefined | tuple(),
         score = 0 :: non_neg_integer(),
         astroid = #guard_astroid{} :: #guard_astroid{}}).

-record(guard_data,
        {base_id = 0 :: non_neg_integer(),
         name = "" :: binary(),
         alias = "" :: binary(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss = [] :: tuple(),
         recruit_lev = 1 :: non_neg_integer(),
         desc = "" :: list(),
         normal_atk_id = 0 :: integer(),
         ai_id = 0 :: integer(),
         base_score = 0,
         growth = 0 :: non_neg_integer()}).

-record(guard_eqm_data,
        {base_id = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss_coin = 0 :: [tuple()],
         reset_coin = 0 :: [tuple()],
         gem_list = [] :: list()}).

-record(guard_lev_data,
        {base_id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         lev_up_exp :: undefined | non_neg_integer(),
         attrs = [] :: non_neg_integer()}).

-record(guard_eqm_gem,
        {id = 0, base_id = 0, type = 0, lev = 0}).

-record(guard_eqm_gem_data,
        {base_id = 0,
         next_base_id = 0,
         name = "",
         lev = 0,
         type = 0,
         need_lev = 0,
         loss_coin = [],
         attrs = []}).

-file("src/mod/buff/buff.erl", 51).

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

-file("src/mod/buff/buff.erl", 52).

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

-file("src/mod/buff/buff.erl", 53).

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

-file("src/mod/buff/buff.erl", 54).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/buff/buff.erl", 55).

-spec init() -> #m_buff{}.

init() -> #m_buff{}.

-spec calc_looks(#role{}) -> list().

calc_looks(#role{m_buff =
                     #m_buff{r_list = RList, show = Show}}) ->
    do_calc_looks(RList, Show, []).

-spec is_hidding(#role{}) -> true | false.

is_hidding(#role{m_buff = #m_buff{r_list = RList}}) ->
    do_is_hidding(RList).

-spec get_ext_param(#role{},
                    BuffId :: non_neg_integer(),
                    ParamName :: non_neg_integer()) -> term().

get_ext_param(Role, BuffId, ParamName) ->
    case lookup(Role, BuffId) of
        #buff{ext_param = ExtParam} ->
            case lists:keyfind(ParamName, 1, ExtParam) of
                {ParamName, Count} -> {true, Count};
                _ -> false
            end;
        _ -> false
    end.

-spec add_ext_param(#role{},
                    BuffId :: non_neg_integer(),
                    ParamName :: non_neg_integer(),
                    Value :: non_neg_integer()) -> {ok, #role{}}.

add_ext_param(Role = #role{m_buff =
                               Buff = #m_buff{r_list = RList}},
              BuffId, ParamName, Value) ->
    NewBuffList = modify_ext_param(RList,
                                   BuffId,
                                   ParamName,
                                   Value,
                                   []),
    {ok,
     Role#role{m_buff = Buff#m_buff{r_list = NewBuffList}}}.

modify_ext_param([], _BuffId, _ParamName, _Value,
                 NewBuffList) ->
    NewBuffList;
modify_ext_param([BuffData = #buff{id = BuffId,
                                   ext_param = ExtParam}
                  | Rest],
                 BuffId, ParamName, Value, NewBuffList) ->
    NewExtParam = modify_ext_param(ExtParam,
                                   ParamName,
                                   Value,
                                   []),
    NewBuffData = BuffData#buff{ext_param = NewExtParam},
    modify_ext_param(Rest,
                     BuffId,
                     ParamName,
                     Value,
                     [NewBuffData | NewBuffList]);
modify_ext_param([Any | Rest], BuffId, ParamName, Value,
                 NewBuffList) ->
    modify_ext_param(Rest,
                     BuffId,
                     ParamName,
                     Value,
                     [Any | NewBuffList]).

modify_ext_param([], ParamName, ValueAdd, _) ->
    [{ParamName, ValueAdd}];
modify_ext_param([{ParamName, Value} | Rest], ParamName,
                 ValueAdd, NewExtParam) ->
    [{ParamName, Value + ValueAdd} | NewExtParam] ++ Rest;
modify_ext_param([Any | Rest], ParamName, ValueAdd,
                 NewExtParam) ->
    modify_ext_param(Rest,
                     ParamName,
                     ValueAdd,
                     [Any | NewExtParam]).

-spec is_special_effect_exists(#role{},
                               _EffectType) -> true | false.

is_special_effect_exists(#role{m_buff =
                                   #m_buff{r_list = RList}},
                         EffectType) ->
    do_is_special_effect_exists(EffectType, RList).

-spec is_special_effect_exists_one_param(#role{},
                                         _EffectType) -> {false,
                                                          non_neg_integer()} |
                                                         {true,
                                                          non_neg_integer()}.

is_special_effect_exists_one_param(#role{m_buff =
                                             #m_buff{r_list = RList}},
                                   EffectType) ->
    do_is_special_effect_exists_one_param(EffectType,
                                          RList).

-spec get_info_by_special_effect(#role{},
                                 _EffectType) -> {true,
                                                  non_neg_integer(),
                                                  string()} |
                                                 {false, term()}.

get_info_by_special_effect(#role{m_buff =
                                     #m_buff{r_list = RList}},
                           EffectType) ->
    do_get_info_by_special_effect(EffectType, RList).

-spec is_special_effect_exists_two_param(#role{},
                                         _EffectType) -> {false,
                                                          non_neg_integer(),
                                                          non_neg_integer()} |
                                                         {true,
                                                          non_neg_integer(),
                                                          non_neg_integer()}.

is_special_effect_exists_two_param(#role{m_buff =
                                             #m_buff{r_list = RList}},
                                   EffectType) ->
    do_is_special_effect_exists_two_param(EffectType,
                                          RList).

-spec pack_list(#role{}) -> ok.

pack_list(Role = #role{m_buff =
                           #m_buff{r_list = RList}}) ->
    role:link_send(Role, 12800, {RList}),
    ok.

push_show(Role = #role{m_buff =
                           #m_buff{show = Show}}) ->
    role:link_send(Role, 12803, {Show}),
    ok.

-spec async_add(RolePid :: pid(),
                BuffId :: pos_integer()) -> ok.

async_add(RolePid, BuffId) when is_pid(RolePid) ->
    role:apply(async,
               RolePid,
               {fun add_and_calc/2, [BuffId]}),
    ok;
async_add(_, _BuffId) ->
    logger:error("无法异步角色增加buff:~w", [_BuffId], buff, 210),
    ok.

-spec add_and_calc(#role{},
                   pos_integer() | #buff_base{} | [pos_integer()]) -> {ok,
                                                                       #role{}}.

add_and_calc(Role, BuffId) when is_integer(BuffId) ->
    add_and_calc(Role, [BuffId]);
add_and_calc(Role, BuffList) ->
    add_and_calc(Role, BuffList, []).

add_and_calc(Role, [], []) -> {ok, Role};
add_and_calc(Role = #role{m_guard =
                              #m_guard{guards = Guards},
                          m_pet = #m_pet{pets = Pets}},
             [], FlagList) ->
    NewRole = case lists:member(role, FlagList) of
                  true -> attr:calc_and_push(Role);
                  false -> Role
              end,
    NewRole2 = case lists:member(guard, FlagList) of
                   true ->
                       NewRole1 = guard_attr:batch_calc(Guards, NewRole),
                       guard_api:push_guards(NewRole1),
                       NewRole1;
                   false -> NewRole
               end,
    NewRole3 = #role{s_looks = _SLooks} = case
                                              lists:member(pet, FlagList)
                                              of
                                              true ->
                                                  PetRole =
                                                      pet_attr:batch_calc(Pets,
                                                                          NewRole2),
                                                  pet_util:push_client_pets(PetRole),
                                                  PetRole;
                                              false -> NewRole
                                          end,
    logger:debug("===============================:~w",
                 [_SLooks],
                 buff,
                 242),
    NewRole4 = #role{s_looks = _SLooks2} =
                   looks:calc(NewRole3),
    map:role_update(NewRole4),
    logger:debug("===============================:~w",
                 [_SLooks2],
                 buff,
                 245),
    pack_list(NewRole4),
    {ok, NewRole4};
add_and_calc(Role, [BuffId | T], FlagList) ->
    case add(Role, BuffId) of
        {ok, NewRole} ->
            Flag = calc_buff_flag(BuffId),
            add_and_calc(NewRole, T, [Flag | FlagList]);
        {false, _Reason} -> add_and_calc(Role, T, FlagList)
    end.

calc_buff_flag(BuffId) when is_integer(BuffId) ->
    case buff_data:get(BuffId) of
        BuffBase = #buff_base{} -> calc_buff_flag(BuffBase);
        _ -> false
    end;
calc_buff_flag(#buff_base{guard_attr = [_ | _]}) ->
    guard;
calc_buff_flag(#buff_base{}) -> role;
calc_buff_flag(_) -> false.

-spec add(Role :: #role{}, Buff) -> {ok, #role{}} |
                                    {false, bitstring()} when Buff ::
                                                                  pos_integer() |
                                                                  #buff_base{}.

add(Role, BuffId) when is_integer(BuffId) ->
    case buff_data:get(BuffId) of
        BuffBase = #buff_base{} -> add(Role, BuffBase);
        false -> {false, lang:get("不存在的Buff，无法增加")}
    end;
add(Role = #role{lev = Lev,
                 m_lev_break = #m_lev_break{times = Times},
                 m_buff = _Mbuff = #m_buff{r_list = RList}},
    BuffBase = #buff_base{class = Class}) ->
    Buff = #buff{dynamic_attr = DynamicAttr} =
               make_buff(BuffBase),
    NewBuff = #buff{dynamic_attr = NewDynamicAttr} = case
                                                         buff_data:get_glyph({Class,
                                                                              Lev,
                                                                              Times})
                                                         of
                                                         BuffId
                                                             when
                                                               is_integer(BuffId) ->
                                                             case
                                                                 buff_data:get(BuffId)
                                                                 of
                                                                 #buff_base{dynamic_attr
                                                                                =
                                                                                Dynamic} ->
                                                                     MaxDynamicAttr =
                                                                         get_base_max_dynamic_attr(BuffId,
                                                                                                   Dynamic),
                                                                     NewDynamicAttr1 =
                                                                         get_max_dynamic_attr(MaxDynamicAttr,
                                                                                              DynamicAttr),
                                                                     Buff#buff{dynamic_attr
                                                                                   =
                                                                                   NewDynamicAttr1};
                                                                 _ -> Buff
                                                             end;
                                                         _ -> Buff
                                                     end,
    case run_check_buff(RList, NewBuff, Role) of
        {ok, NewRole} ->
            pack_list(NewRole),
            notice:attr_all(NewRole, "", "", NewDynamicAttr),
            {ok, NewRole};
        {skip, NewRole} ->
            pack_list(NewRole),
            Tail = notice:format(lang:get("，~ts当前效果，~ts"),
                                 [{string_2, 1, lang:get("低于")},
                                  {string_2, 6, lang:get("不覆盖")}]),
            notice:attr_all(NewRole, "", Tail, NewDynamicAttr),
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
add(_Role, _BuffId) ->
    {false, lang:get("不存在的Buff，无法增加")}.

-spec check_buff(#role{},
                 BuffId :: non_neg_integer()) -> true | false.

check_buff(#role{m_buff = #m_buff{r_list = List}},
           BuffId) ->
    lists:keyfind(BuffId, #buff.id, List) =/= false.

async_del(RolePid, Buff) when is_pid(RolePid) ->
    role:apply(async, RolePid, {fun del/2, [Buff]}),
    ok;
async_del(_, Buff) ->
    logger:error("无法异步删除角色buff[~w]", [Buff], buff, 317),
    ok.

-spec replace(#role{}, DelL :: [pos_integer()],
              AddL :: [pos_integer()]) -> {ok, #role{}}.

replace(Role, DelL, AddL) ->
    {ok, Role1} = del(Role, DelL -- AddL),
    add_and_calc(Role1, AddL).

-spec del(Role :: #role{},
          Buff :: pos_integer() | list()) -> {ok,
                                              NewRole :: #role{}}.

del(Role, BuffList = [_ | _]) ->
    del(Role, BuffList, []);
del(Role = #role{m_buff =
                     Mbuff = #m_buff{r_list = Rlist}},
    BuffId) ->
    case lists:keyfind(BuffId, #buff.id, Rlist) of
        Buff = #buff{class = Class} ->
            case Class of
                10000 ->
                    Name = attr(name, Buff),
                    Msg = notice:format(lang:get("变身效果~ts已失效，是否前往变身？"),
                                        [{string_2, 5, Name}]),
                    role:link_send(Role, 12804, {Msg, BuffId});
                _ -> ok
            end,
            NewMbuff = Mbuff#m_buff{r_list =
                                        lists:keydelete(BuffId,
                                                        #buff.id,
                                                        Rlist)},
            Role1 = cancel_timer(Buff,
                                 Role#role{m_buff = NewMbuff}),
            {ok, Role1};
        false -> {ok, Role}
    end;
del(Role, _) -> {ok, Role}.

del(Role = #role{m_guard = #m_guard{guards = Guards}},
    [], FlagList) ->
    NewRole = case lists:member(role, FlagList) of
                  true -> attr:calc_and_push(Role);
                  false -> Role
              end,
    NewRole2 = case lists:member(guard, FlagList) of
                   true ->
                       NewRole1 = guard_attr:batch_calc(Guards, NewRole),
                       guard_api:push_guards(NewRole1),
                       NewRole1;
                   false -> NewRole
               end,
    NewRole3 = looks:calc(NewRole2),
    map:role_update(NewRole3),
    pack_list(NewRole3),
    {ok, NewRole3};
del(Role, [BuffId | T], FlagList) ->
    {ok, NewRole} = del(Role, BuffId),
    Flag = calc_buff_flag(BuffId),
    del(NewRole, T, [Flag | FlagList]).

del_looks_buff(Role = #role{m_buff =
                                Mbuff = #m_buff{r_list = Rlist}}) ->
    case lists:keyfind(10000, #buff.class, Rlist) of
        Buff = #buff{id = BuffId} ->
            NewMbuff = Mbuff#m_buff{r_list =
                                        lists:keydelete(BuffId,
                                                        #buff.id,
                                                        Rlist)},
            Role1 = cancel_timer(Buff,
                                 Role#role{m_buff = NewMbuff}),
            AttrRole = attr:calc_and_push(Role1),
            NewRole = looks:calc(AttrRole),
            map:role_update(NewRole),
            {ok, NewRole};
        _ -> ok
    end.

calc_pvp(Role = #role{m_buff =
                          Mbuff = #m_buff{r_list = RList}},
         CombatType) ->
    case lists:member(CombatType,
                      [103,
                       114,
                       104,
                       107,
                       102,
                       105,
                       40,
                       108,
                       110,
                       111,
                       113,
                       58,
                       116])
        of
        true ->
            case do_calc_pvp(RList, [], Role, false) of
                {false, _} -> Role;
                {Flag, NewRList} ->
                    Role1 = Role#role{m_buff =
                                          Mbuff#m_buff{r_list = NewRList}},
                    case Flag of
                        {push,
                         BuffName,
                         CleanBuff = #buff{id = BuffId},
                         Limit} ->
                            Name = attr(name, CleanBuff),
                            CleanMsg =
                                notice:format(lang:get("变身效果~ts已失效，是否前往变身？"),
                                              [{string_2, 5, Name}]),
                            role:link_send(Role, 12804, {CleanMsg, BuffId}),
                            Msg =
                                notice:format(lang:get("经过~ts次PVP战斗，~ts的能量耗尽了"),
                                              [{string_1, Limit},
                                               {string_2, 1, BuffName}]),
                            notice:send(Role1, 7, Msg),
                            Role2 = cancel_timer(CleanBuff, Role1),
                            Role4 = Role2,
                            NewRole = looks:calc(Role4),
                            pack_list(NewRole),
                            looks:update_looks(Role, NewRole),
                            attr:calc_and_push(NewRole);
                        _ ->
                            logger:debug("减少次数", [], buff, 410),
                            pack_list(Role1),
                            Role1
                    end;
                _ -> Role
            end;
        _ -> Role
    end.

cancel(Role = #role{m_buff =
                        Mbuff = #m_buff{r_list = RList}},
       BuffId) ->
    case lists:keyfind(BuffId, #buff.id, RList) of
        Buff = #buff{} ->
            case buff_data:get(BuffId) of
                #buff_base{cancel = 0} ->
                    {false, lang:get("该buff不可以主动取消")};
                _ ->
                    NewMbuff = Mbuff#m_buff{r_list =
                                                lists:keydelete(BuffId,
                                                                #buff.id,
                                                                RList)},
                    NewRole = cancel_timer(Buff,
                                           Role#role{m_buff = NewMbuff}),
                    pack_list(NewRole),
                    case BuffId of
                        10091 ->
                            Msg = notice:format(lang:get("成功取消，在挂机地图将会~ts"),
                                                [{string_2,
                                                  5,
                                                  lang:get("遭遇暗雷怪")}]),
                            notice:send(NewRole, 3, Msg);
                        _ -> ok
                    end,
                    {ok, attr:calc_and_push(NewRole)}
            end;
        _ -> {false, lang:get("不存在该buff，无法取消")}
    end;
cancel(_Role, _) -> {false, lang:get("不存在该buff，无法取消")}.

show(Role = #role{m_buff = Mbuff}, Flag) ->
    logger:debug("buff数据 buff_sub_type_fruit ~w",
                 [Flag],
                 buff,
                 446),
    Role1 = Role#role{m_buff = Mbuff#m_buff{show = Flag}},
    NewRole = looks:calc(Role1),
    guard_api:push_guards(NewRole),
    map:role_update(NewRole),
    {ok, NewRole}.

-spec make_buff(#buff_base{}) -> #buff{}.

make_buff(#buff_base{id = Id, cancel = Cancel,
                     class = Class, lev = Lev, type = Type,
                     time_mode = TimeMode, duration = Duration,
                     max_time_num = MaxTimeNum, same_buff_mode = SameMode,
                     end_date = EndDate, looks = Looks0,
                     dynamic_attr = Dynamic}) ->
    MaxDuration = case TimeMode of
                      0 -> Duration;
                      1 -> Duration;
                      2 -> Duration * MaxTimeNum;
                      _ -> Duration
                  end,
    Looks = do_add_looks(Looks0, Id, []),
    DynamicAttr = do_dynamic_attr(Id, Dynamic),
    #buff{id = Id, cancel = Cancel, class = Class,
          lev = Lev, type = Type, same_buff_mode = SameMode,
          time_mode = TimeMode, duration = Duration,
          max_duration = MaxDuration, effect_lev = 1,
          end_date = EndDate, looks = Looks,
          dynamic_attr = DynamicAttr}.

-spec attr(Flag, Buff :: #buff{}) -> bitstring() |
                                     non_neg_integer() |
                                     list() when Flag :: max_effect_lev |
                                                         name |
                                                         effect.

attr(max_effect_lev, #buff{id = Id}) ->
    case buff_data:get(Id) of
        #buff_base{max_effect_lev = MaxLev} -> MaxLev;
        _ -> 1
    end;
attr(attr, #buff{id = Id}) ->
    case buff_data:get(Id) of
        #buff_base{attr = Attr} -> Attr;
        _ -> []
    end;
attr(guard_attr, #buff{id = Id}) ->
    case buff_data:get(Id) of
        #buff_base{guard_attr = Attr} -> Attr;
        _ -> []
    end;
attr(Label = pet_attr, #buff{id = Id}) ->
    attr(Label, Id);
attr(pet_attr, Id) ->
    case buff_data:get(Id) of
        #buff_base{pet_attr = Attr} -> Attr;
        _ -> []
    end;
attr(Label = name, #buff{id = Id}) -> attr(Label, Id);
attr(name, Id) ->
    case buff_data:get(Id) of
        #buff_base{name = Name} -> Name;
        _ -> ""
    end.

pre_check(Item,
          #role{m_buff = #m_buff{r_list = RList},
                classes = Classes}) ->
    Effect = item:attr(effect, Item),
    case lists:keyfind(item_effect_buff, 1, Effect) of
        {10, BuffInfo} ->
            BuffId = case BuffInfo of
                         [BuffId1 | _] -> BuffId1;
                         _ -> BuffInfo
                     end,
            case buff_data:get(BuffId) of
                BuffBase = #buff_base{} ->
                    Buff = make_buff(BuffBase),
                    check_buff_same(RList, Buff, Classes);
                false -> {false, lang:get("不存在的Buff，无法增加")}
            end;
        _ -> {false, lang:get("不存在的buff，无法使用")}
    end.

-spec login(Role :: #role{}) -> {ok,
                                 NewRole :: #role{}}.

login(Role = #role{m_buff = #m_buff{r_list = []}}) ->
    {ok, Role};
login(Role) -> do_login(Role).

-spec logout(Role :: #role{}) -> {ok,
                                  NewRole :: #role{}}.

logout(Role = #role{m_buff = #m_buff{r_list = []}}) ->
    {ok, Role};
logout(Role) -> do_logout(Role).

lookup(#role{m_buff = #m_buff{r_list = Rlist}}, Id) ->
    lists:keyfind(Id, #buff.id, Rlist).

-spec gm_clean(Role :: #role{}) -> {ok,
                                    NewRole :: #role{}}.

gm_clean(Role = #role{m_guard =
                          #m_guard{guards = Guards},
                      m_buff = #m_buff{r_list = Rlist}}) ->
    Role1 = do_gm_clean(Role, Rlist),
    Role2 = Role1#role{m_buff = #m_buff{r_list = []}},
    Role3 = attr:calc_and_push(Role2),
    Role4 = guard_attr:batch_calc(Guards, Role3),
    NewRole = looks:calc(Role4),
    guard_api:push_guards(NewRole),
    map:role_update(NewRole),
    pack_list(NewRole),
    {ok, NewRole}.

do_gm_clean(Role, []) -> Role;
do_gm_clean(Role, [#buff{id = Id, type = Type} | T]) ->
    case Type of
        1 -> do_gm_clean(role_timer:del(Id, Role), T);
        2 -> do_gm_clean(Role, T);
        3 -> do_gm_clean(role_timer:del(Id, Role), T);
        4 -> do_gm_clean(Role, T)
    end.

do_calc_looks([], _Show, L) -> L;
do_calc_looks([#buff{looks = Looks} | T], Show, L)
    when Show =:= 1 ->
    L1 = case lists:keyfind(53, 1, Looks) of
             {_Type, Mode, Val, Str} ->
                 lists:keystore(74, 1, L, {74, Mode, Val, Str});
             _ -> L
         end,
    do_calc_looks(T, Show, Looks ++ L1);
do_calc_looks([#buff{looks = Looks} | T], Show, L) ->
    L1 = case lists:keyfind(53, 1, Looks) of
             {_Type, Mode, Val, Str} ->
                 lists:keystore(74, 1, L, {74, Mode, Val, Str});
             _ -> L
         end,
    Looks1 = case lists:keyfind(53, 1, Looks) of
                 {_Type1, _Mode1, Val1, _Str1} ->
                     case transform_data:get_hard_show(Val1) of
                         #{hard_show := 1} -> Looks;
                         _ -> lists:keydelete(53, 1, Looks)
                     end;
                 _ -> Looks
             end,
    logger:debug("bbbbbbbbbbbbbb ~w", [Looks1], buff, 583),
    do_calc_looks(T, Show, Looks1 ++ L1).

do_add_looks([], _BuffId, L) -> L;
do_add_looks([{5, Id} | T], BuffId, L) ->
    do_add_looks(T, BuffId, [{52, 2, Id, ""} | L]);
do_add_looks([{1, Id} | T], BuffId, L) ->
    do_add_looks(T, BuffId, [{53, 0, Id, ""} | L]);
do_add_looks([{2, Group} | T], BuffId, L) ->
    case buff_data:get_looks(Group) of
        [] -> do_add_looks(T, BuffId, L);
        G ->
            {Id, _} = util:rand_list(G, 2),
            do_add_looks(T, BuffId, [{53, 0, Id, ""} | L])
    end;
do_add_looks([{4, Group} | T], BuffId, L) ->
    case buff_data:get_looks(Group) of
        [] -> do_add_looks(T, BuffId, L);
        G ->
            {Id, _} = util:rand_list(G, 2),
            do_add_looks(T, BuffId, [{62, 0, Id, ""} | L])
    end;
do_add_looks([{3, _} | T], BuffId, L) ->
    do_add_looks(T, BuffId, [{58, 0, BuffId, ""} | L]).

do_is_hidding([]) -> false;
do_is_hidding([#buff{id = Id} | T]) ->
    case buff_data:get(Id) of
        #buff_base{effect = Effect} ->
            case lists:keyfind(2, 1, Effect) of
                {2, _, _} -> true;
                _ -> do_is_hidding(T)
            end;
        _ -> do_is_hidding(T)
    end.

buff_skill(#role{m_buff =
                     #m_buff{r_list = BuffList}}) ->
    buff_skill(BuffList, []);
buff_skill(_) -> [].

buff_skill([], SkillList) -> SkillList;
buff_skill([#buff{id = Id} | T], SkillList) ->
    case buff_data:get(Id) of
        #buff_base{effect = Effect} ->
            Skills = [{SkillId, SkillLev}
                      || {1, SkillId, SkillLev} <- Effect],
            buff_skill(T, Skills ++ SkillList);
        _ -> buff_skill(T, SkillList)
    end;
buff_skill([_ | T], SkillList) ->
    buff_skill(T, SkillList).

guard_buff_skill(#role{m_buff =
                           #m_buff{r_list = BuffList}}) ->
    guard_buff_skill(BuffList, []);
guard_buff_skill(_) -> [].

guard_buff_skill([], SkillList) -> SkillList;
guard_buff_skill([#buff{id = Id} | T], SkillList) ->
    case buff_data:get(Id) of
        #buff_base{effect = Effect} ->
            Skills = [SkillId
                      || {27, SkillId, _SkillLev} <- Effect],
            guard_buff_skill(T, Skills ++ SkillList);
        _ -> guard_buff_skill(T, SkillList)
    end;
guard_buff_skill([_ | T], SkillList) ->
    guard_buff_skill(T, SkillList).

do_login(Role = #role{time_info =
                          {LoginTime, LogoutTime},
                      m_buff = Mbuff = #m_buff{r_list = RList}}) ->
    NewRList = check_time_out(RList, LoginTime, LogoutTime),
    do_restart(Role#role{m_buff =
                             Mbuff#m_buff{r_list = NewRList}}).

check_time_out(Rlist, LoginTime, LogoutTime) ->
    NewRlist = date_time_out(Rlist),
    check_time_out(NewRlist, LoginTime, LogoutTime, []).

date_time_out(List) -> date_time_out(List, []).

date_time_out([], NewList) -> NewList;
date_time_out([Buff = #buff{end_date = 0} | T],
              NewList) ->
    date_time_out(T, [Buff | NewList]);
date_time_out([Buff = #buff{end_date = EndDate} | T],
              NewList) ->
    Now = date:unixtime(),
    case date:datetime_to_seconds(EndDate) of
        Time when is_integer(Time) andalso Time > Now ->
            date_time_out(T, [Buff | NewList]);
        _ -> date_time_out(T, NewList)
    end.

check_time_out([], _, _, NewRList) -> NewRList;
check_time_out([Buff | T], LoginTime, LogoutTime,
               NewRList) ->
    case do_check_time(Buff, LoginTime, LogoutTime) of
        false ->
            check_time_out(T, LoginTime, LogoutTime, NewRList);
        {ok, NewBuff} ->
            check_time_out(T,
                           LoginTime,
                           LogoutTime,
                           [NewBuff | NewRList])
    end.

do_check_time(Buff = #buff{duration = Duration,
                           type = 1, start_time = StartTime},
              _LoginTime, _LogoutTime) ->
    Now = date:unixtime(),
    NewDuration = Duration - (Now - StartTime),
    case NewDuration =< 0 of
        true -> false;
        false -> {ok, Buff#buff{duration = NewDuration}}
    end;
do_check_time(Buff = #buff{type = 2}, _, _) ->
    {ok, Buff};
do_check_time(Buff = #buff{type = 3,
                           duration = Duration},
              _LoginTime, _LogoutTime)
    when Duration > 0 ->
    {ok, Buff};
do_check_time(Buff = #buff{type = 4}, _LoginTime, 0) ->
    {ok, Buff};
do_check_time(Buff = #buff{type = 4,
                           duration = Duration},
              _LoginTime, LogoutTime) ->
    Now = date:unixtime(),
    NewDuration = Duration - (Now - LogoutTime),
    case NewDuration =< 0 of
        true -> false;
        false -> {ok, Buff#buff{duration = NewDuration}}
    end;
do_check_time(#buff{type = Type, id = Id}, _LoginTime,
              _LogoutTime) ->
    logger:error("错误的buff数据:[~w, ~w]",
                 [Type, Id],
                 buff,
                 714),
    false.

do_restart(Role = #role{m_buff =
                            #m_buff{r_list = RList}}) ->
    Now = date:unixtime(),
    do_restart(Role, Now, RList, []).

do_restart(Role = #role{m_buff = Mbuff}, _Now, [],
           NewRList) ->
    {ok,
     Role#role{m_buff = Mbuff#m_buff{r_list = NewRList}}};
do_restart(Role, Now,
           [Buff = #buff{id = Id, type = 1, duration = Duration}
            | T],
           NewRList) ->
    NewDuration = util:check_min(Duration, 1),
    Timer = #timer{id = Id, timeout = NewDuration * 1000,
                   times = 1, m = buff, f = del, a = [[Id]]},
    NewRole = role_timer:set(Timer, Role),
    do_restart(NewRole,
               Now,
               T,
               [Buff#buff{start_time = Now} | NewRList]);
do_restart(Role, Now,
           [Buff = #buff{id = Id, type = 3, duration = Duration}
            | T],
           NewRList) ->
    NewDuration = util:check_min(Duration, 1),
    Timer = #timer{id = Id, timeout = NewDuration * 1000,
                   times = 1, m = buff, f = del, a = [[Id]]},
    NewRole = role_timer:set(Timer, Role),
    do_restart(NewRole,
               Now,
               T,
               [Buff#buff{start_time = Now} | NewRList]);
do_restart(Role, Now, [Buff | T], NewRList) ->
    do_restart(Role, Now, T, [Buff | NewRList]).

do_logout(Role = #role{time_info =
                           {LoginTime, LogoutTime},
                       m_buff = Mbuff = #m_buff{r_list = RList}}) ->
    NewRList = do_recalc_time(RList, LoginTime, LogoutTime),
    {ok,
     Role#role{m_buff = Mbuff#m_buff{r_list = NewRList}}}.

do_recalc_time(RList, LoginTime, LogoutTime) ->
    do_recalc_time(RList, LoginTime, LogoutTime, []).

do_recalc_time([], _LoginTime, _LogoutTime, NewRList) ->
    NewRList;
do_recalc_time([Buff | T], LoginTime, LogoutTime,
               NewRList) ->
    case recalc_buff(Buff, LoginTime, LogoutTime) of
        false ->
            do_recalc_time(T, LoginTime, LogoutTime, NewRList);
        {ok, NewBuff} ->
            do_recalc_time(T,
                           LoginTime,
                           LogoutTime,
                           [NewBuff | NewRList])
    end.

recalc_buff(Buff = #buff{type = 1}, _LoginTime,
            _LogoutTime) ->
    {ok, Buff};
recalc_buff(Buff = #buff{type = 2}, _, _) -> {ok, Buff};
recalc_buff(Buff = #buff{type = 3, duration = Duration,
                         start_time = StartTime},
            _LoginTime, _LogoutTime) ->
    Now = date:unixtime(),
    NewDuration = Duration - (Now - StartTime),
    case NewDuration =< 0 of
        true -> false;
        false -> {ok, Buff#buff{duration = NewDuration}}
    end;
recalc_buff(Buff = #buff{type = 4}, _LoginTime,
            _LogoutTime) ->
    {ok, Buff};
recalc_buff(#buff{type = Type, id = Id}, _LoginTime,
            _LogoutTime) ->
    logger:error("错误的buff数据:[~w, ~w]",
                 [Type, Id],
                 buff,
                 773),
    false.

run_check_buff(TargetList, Buff,
               Role = #role{m_buff = Mbuff, classes = Classes}) ->
    case check_buff_same(TargetList, Buff, Classes) of
        {false, Reason} -> {false, Reason};
        {true, NewTargetList} ->
            NewMbuff = Mbuff#m_buff{r_list = NewTargetList},
            add_buff(Buff, Role#role{m_buff = NewMbuff});
        {not_full, NewBuff, NewTargetList} ->
            NewMbuff = Mbuff#m_buff{r_list = NewTargetList},
            add_buff(NewBuff, Role#role{m_buff = NewMbuff});
        {full, NewBuff, NewTargetList} ->
            NewMbuff = Mbuff#m_buff{r_list = NewTargetList},
            add_buff(NewBuff, Role#role{m_buff = NewMbuff});
        {same_cover, CoverBuff, NewTargetList} ->
            NewMbuff = Mbuff#m_buff{r_list = NewTargetList},
            NewRole = cancel_timer(CoverBuff,
                                   Role#role{m_buff = NewMbuff}),
            add_buff(Buff, NewRole);
        skip -> {skip, Role};
        {cover, CoverBuff, NewTargetList} ->
            NewMbuff = Mbuff#m_buff{r_list = NewTargetList},
            NewRole = cancel_timer(CoverBuff,
                                   Role#role{m_buff = NewMbuff}),
            add_buff(Buff, NewRole)
    end.

cancel_timer(#buff{id = Id, type = Type}, Role) ->
    case Type of
        1 -> role_timer:del(Id, Role);
        2 -> Role;
        3 -> role_timer:del(Id, Role);
        4 -> Role
    end.

add_buff(Buff = #buff{id = Id, type = Type},
         Role = #role{m_buff =
                          Mbuff = #m_buff{r_list = Rlist}}) ->
    Now = date:unixtime(),
    Duration = modify_duration(Buff),
    case Type of
        1 ->
            NewBuff = Buff#buff{start_time = Now},
            Timer = #timer{id = Id, timeout = Duration * 1000,
                           times = 1, m = buff, f = del, a = [[Id]]},
            {ok,
             role_timer:set(Timer,
                            Role#role{m_buff =
                                          Mbuff#m_buff{r_list =
                                                           [NewBuff
                                                            | Rlist]}})};
        2 ->
            NewBuff = Buff#buff{start_time = Now},
            {ok,
             Role#role{m_buff =
                           Mbuff#m_buff{r_list = [NewBuff | Rlist]}}};
        3 ->
            NewBuff = Buff#buff{start_time = Now},
            Timer = #timer{id = Id, timeout = Duration * 1000,
                           times = 1, m = buff, f = del, a = [[Id]]},
            {ok,
             role_timer:set(Timer,
                            Role#role{m_buff =
                                          Mbuff#m_buff{r_list =
                                                           [NewBuff
                                                            | Rlist]}})};
        4 ->
            NewBuff = Buff#buff{start_time = Now},
            {ok,
             Role#role{m_buff =
                           Mbuff#m_buff{r_list = [NewBuff | Rlist]}}}
    end.

modify_duration(#buff{duration = Duration,
                      end_date = 0}) ->
    Duration;
modify_duration(#buff{duration = Duration,
                      end_date = EndDate}) ->
    case date:datetime_to_seconds(EndDate) of
        EndTime when EndTime =/= 0 ->
            Now = date:unixtime(),
            EndNow = Duration + Now,
            case EndNow > EndTime of
                true -> util:check_min(EndTime - Now, 2);
                false -> Duration
            end;
        _ -> Duration
    end.

check_buff_same(TargetList,
                Buff = #buff{same_buff_mode = 0}, Classes) ->
    case do_check_same(TargetList, Buff) of
        {false, Reason} -> {false, Reason};
        true -> check_buff_timeout(Classes, TargetList, Buff)
    end;
check_buff_same(TargetList,
                Buff = #buff{same_buff_mode = 1}, Classes) ->
    check_buff_timeout(Classes, TargetList, Buff);
check_buff_same(TargetList,
                Buff = #buff{same_buff_mode = 2}, Classes) ->
    check_buff_timeout(Classes, TargetList, Buff).

check_buff_timeout(Classes, TargetList,
                   Buff = #buff{end_date = 0}) ->
    check_buff_class(Classes, TargetList, Buff);
check_buff_timeout(Classes, TargetList,
                   Buff = #buff{end_date = EndDate}) ->
    Now = date:unixtime(),
    case date:datetime_to_seconds(EndDate) of
        EndTime when EndTime < Now ->
            {false, lang:get("该效果道具过期，无法使用")};
        _ -> check_buff_class(Classes, TargetList, Buff)
    end.

check_buff_class(Classes, TargetList,
                 Buff = #buff{class = Class}) ->
    ConflictList = buff_data:get_class_conflict(Class),
    case do_check_class(ConflictList, TargetList) of
        {false, Reason} -> {false, Reason};
        true -> check_buff_lev(Classes, TargetList, Buff)
    end.

check_buff_lev(Classes, TargetList,
               Buff = #buff{id = Id, class = Class, lev = Lev,
                            dynamic_attr = DynamicAttr}) ->
    GetSubType = case buff_data:get(Id) of
                     #buff_base{sub_type = SubType} -> SubType;
                     _ -> 0
                 end,
    case do_check_lev(Classes,
                      TargetList,
                      Id,
                      Class,
                      Lev,
                      {GetSubType, DynamicAttr})
        of
        {false, Reason} -> {false, Reason};
        {cover, CoverBuff} ->
            check_buff_add(TargetList, Buff, {cover, CoverBuff});
        {same_cover, CoverBuff} ->
            check_buff_add(TargetList,
                           Buff,
                           {same_cover, CoverBuff});
        {same, SameBuff} ->
            check_buff_add(TargetList, Buff, {same, SameBuff});
        null -> check_buff_add(TargetList, Buff, null);
        skip -> skip
    end.

check_buff_add(TargetList, _Buff, null) ->
    {true, TargetList};
check_buff_add(TargetList,
               Buff = #buff{dynamic_attr = DynamicAttr},
               {same, SameBuff}) ->
    NewTargetList = TargetList -- [SameBuff],
    case merge_buff(SameBuff#buff{dynamic_attr =
                                      DynamicAttr},
                    Buff)
        of
        {not_full, NewBuff} ->
            {not_full, NewBuff, NewTargetList};
        {full, NewBuff} -> {full, NewBuff, NewTargetList};
        {false, Reason} -> {false, Reason}
    end;
check_buff_add(TargetList, _Buff,
               {same_cover, CoverBuff}) ->
    NewTargetList = TargetList -- [CoverBuff],
    {same_cover, CoverBuff, NewTargetList};
check_buff_add(TargetList, _Buff, {cover, CoverBuff}) ->
    NewTargetList = TargetList -- [CoverBuff],
    {cover, CoverBuff, NewTargetList}.

do_check_same([], _Buff) -> true;
do_check_same([#buff{id = Id} | _T], #buff{id = Id}) ->
    {false, lang:get("该buff效果不能重复叠加")};
do_check_same([_ | T], Buff) -> do_check_same(T, Buff).

merge_buff(SameBuff = #buff{effect_lev = EffectLev,
                            start_time = StartTime, type = 1,
                            duration = Duration1, time_mode = TimeMode,
                            max_duration = MaxDuration},
           _Buff = #buff{duration = Duration}) ->
    Now = date:unixtime(),
    MaxEffectLev = attr(max_effect_lev, SameBuff),
    LastDuration = util:check_min(Duration1 -
                                      (Now - StartTime),
                                  2),
    NewDuration = case TimeMode of
                      0 -> LastDuration;
                      1 -> Duration;
                      2 -> LastDuration + Duration
                  end,
    NowEffectLev = EffectLev + 1,
    NewEffectLev = util:check_max(NowEffectLev,
                                  MaxEffectLev),
    case MaxEffectLev =:= 1 of
        true ->
            case NewDuration > MaxDuration of
                true ->
                    {full,
                     SameBuff#buff{effect_lev = NewEffectLev,
                                   duration = MaxDuration}};
                false ->
                    {not_full,
                     SameBuff#buff{effect_lev = NewEffectLev,
                                   duration = NewDuration}}
            end;
        false ->
            case NowEffectLev > MaxEffectLev of
                true -> {false, lang:get("该buff效果已经达到最高层次，无法再次使用")};
                false ->
                    case NewDuration > MaxDuration of
                        true ->
                            {full,
                             SameBuff#buff{effect_lev = NewEffectLev,
                                           duration = MaxDuration}};
                        false ->
                            {not_full,
                             SameBuff#buff{effect_lev = NewEffectLev,
                                           duration = NewDuration}}
                    end
            end
    end;
merge_buff(SameBuff = #buff{effect_lev = EffectLev,
                            start_time = StartTime, type = 3,
                            duration = Duration1, time_mode = TimeMode,
                            max_duration = MaxDuration},
           _Buff = #buff{duration = Duration}) ->
    Now = date:unixtime(),
    MaxEffectLev = attr(max_effect_lev, SameBuff),
    LastDuration = util:check_min(Duration1 -
                                      (Now - StartTime),
                                  2),
    NewDuration = case TimeMode of
                      0 -> LastDuration;
                      1 -> Duration;
                      2 -> LastDuration + Duration
                  end,
    NowEffectLev = EffectLev + 1,
    NewEffectLev = util:check_max(NowEffectLev,
                                  MaxEffectLev),
    case MaxEffectLev =:= 1 of
        true ->
            case NewDuration > MaxDuration of
                true ->
                    {full,
                     SameBuff#buff{effect_lev = NewEffectLev,
                                   duration = MaxDuration}};
                false ->
                    {not_full,
                     SameBuff#buff{effect_lev = NewEffectLev,
                                   duration = NewDuration}}
            end;
        false ->
            case NowEffectLev > MaxEffectLev of
                true -> {false, lang:get("该buff效果已经达到最高层次，无法再次使用")};
                false ->
                    case NewDuration > MaxDuration of
                        true ->
                            {full,
                             SameBuff#buff{effect_lev = NewEffectLev,
                                           duration = MaxDuration}};
                        false ->
                            {not_full,
                             SameBuff#buff{effect_lev = NewEffectLev,
                                           duration = NewDuration}}
                    end
            end
    end;
merge_buff(SameBuff = #buff{effect_lev = EffectLev,
                            type = 4, duration = Duration1,
                            time_mode = TimeMode, max_duration = MaxDuration},
           _Buff = #buff{duration = Duration}) ->
    MaxEffectLev = attr(max_effect_lev, SameBuff),
    LastDuration = Duration1,
    NewDuration = case TimeMode of
                      0 -> LastDuration;
                      1 -> Duration;
                      2 -> LastDuration + Duration
                  end,
    NowEffectLev = EffectLev + 1,
    NewEffectLev = util:check_max(NowEffectLev,
                                  MaxEffectLev),
    case MaxEffectLev =:= 1 of
        true ->
            case NewDuration > MaxDuration of
                true ->
                    {full,
                     SameBuff#buff{effect_lev = NewEffectLev,
                                   duration = MaxDuration}};
                false ->
                    {not_full,
                     SameBuff#buff{effect_lev = NewEffectLev,
                                   duration = NewDuration}}
            end;
        false ->
            case NowEffectLev > MaxEffectLev of
                true -> {false, lang:get("该buff效果已经达到最高层次，无法再次使用")};
                false ->
                    case NewDuration > MaxDuration of
                        true ->
                            {full,
                             SameBuff#buff{effect_lev = NewEffectLev,
                                           duration = MaxDuration}};
                        false ->
                            {not_full,
                             SameBuff#buff{effect_lev = NewEffectLev,
                                           duration = NewDuration}}
                    end
            end
    end;
merge_buff(SameBuff = #buff{effect_lev = EffectLev,
                            type = 2},
           _Buff = #buff{}) ->
    MaxEffectLev = attr(max_effect_lev, SameBuff),
    NowEffectLev = EffectLev + 1,
    NewEffectLev = util:check_max(NowEffectLev,
                                  MaxEffectLev),
    case MaxEffectLev =:= 1 of
        true ->
            {not_full, SameBuff#buff{effect_lev = NewEffectLev}};
        false ->
            case NowEffectLev > MaxEffectLev of
                true -> {false, lang:get("该buff效果已经达到最高层次，无法再次使用")};
                false ->
                    {not_full, SameBuff#buff{effect_lev = NewEffectLev}}
            end
    end.

do_check_lev(_Classes, [], _Id, _Class, _Lev, _) ->
    null;
do_check_lev(_Classes,
             [Buff = #buff{id = Id, class = Class, lev = Lev,
                           same_buff_mode = 2}
              | _T],
             Id, Class, Lev, _) ->
    {cover, Buff};
do_check_lev(Classes,
             [Buff = #buff{id = Id, class = Class, lev = Lev} | _T],
             Id, Class, Lev, {SubType, DynamicAttr}) ->
    case SubType of
        3 ->
            case check_cover_glyph(DynamicAttr, Buff, Classes) of
                true -> {same, Buff};
                _ -> skip
            end;
        _ -> {same, Buff}
    end;
do_check_lev(Classes,
             [Buff = #buff{class = Class, lev = Lev} | _T], _Id,
             Class, Lev, {SubType, DynamicAttr}) ->
    case SubType of
        3 ->
            case check_cover_glyph(DynamicAttr, Buff, Classes) of
                true -> {same_cover, Buff};
                _ -> skip
            end;
        _ -> {same_cover, Buff}
    end;
do_check_lev(_Classes,
             [Buff = #buff{class = Class, lev = Lev1} | _T], _Id,
             Class, Lev, _)
    when Lev1 > Lev ->
    Name = attr(name, Buff),
    {false,
     util:fbin(lang:get("身上有高级的~ts效果，无法覆盖"), [Name])};
do_check_lev(_Classes,
             [CoverBuff = #buff{class = Class, lev = Lev1} | _T],
             _Id, Class, Lev, _)
    when Lev1 < Lev ->
    {cover, CoverBuff};
do_check_lev(Classes, [_ | T], Id, Class, Lev, Data) ->
    do_check_lev(Classes, T, Id, Class, Lev, Data).

do_check_class(_Conflict, []) -> true;
do_check_class(Conflict, [#buff{class = Class} | T]) ->
    case lists:member(Class, Conflict) of
        true -> {false, lang:get("已经有互斥的buff效果，无法使用")};
        false -> do_check_class(Conflict, T)
    end.

do_dynamic_attr(_Id, []) -> [];
do_dynamic_attr(Id, [{Type, Val} | T]) ->
    case lists:member(Id, buff_data:fruit_buff_ids()) of
        true -> [{Type, Val} | do_dynamic_attr(Id, T)];
        _ ->
            case util:rand_list(buff_data:get_dynamic_attr({Id,
                                                            Type}),
                                2)
                of
                {Ratio, _} ->
                    [{Type, round(Val * Ratio / 100)} | do_dynamic_attr(Id,
                                                                        T)];
                _ -> do_dynamic_attr(Id, T)
            end
    end.

check_cover_glyph(DynamicAttr1,
                  #buff{class = Class, dynamic_attr = DynamicAttr2,
                        duration = Duration, start_time = StartTime, type = 1},
                  Classes) ->
    Now = date:unixtime(),
    NewDuration = Duration - (Now - StartTime),
    case NewDuration < 3600 * 5 of
        true -> true;
        _ ->
            case Class =:= 10102 of
                true when Classes =:= 2 orelse Classes =:= 6 ->
                    NewDynamicAttr1 = [{N, V}
                                       || {N, V} <- DynamicAttr1, N =:= 5],
                    NewDynamicAttr2 = [{N, V}
                                       || {N, V} <- DynamicAttr2, N =:= 5],
                    do_check_cover_glyph(NewDynamicAttr1, NewDynamicAttr2);
                true ->
                    NewDynamicAttr1 = [{N, V}
                                       || {N, V} <- DynamicAttr1, N =:= 2],
                    NewDynamicAttr2 = [{N, V}
                                       || {N, V} <- DynamicAttr2, N =:= 2],
                    do_check_cover_glyph(NewDynamicAttr1, NewDynamicAttr2);
                _ -> do_check_cover_glyph(DynamicAttr1, DynamicAttr2)
            end
    end;
check_cover_glyph(_, _, _) -> true.

do_check_cover_glyph([], _) -> true;
do_check_cover_glyph([{Name, Val1} | T], OldAttrList) ->
    case lists:keyfind(Name, 1, OldAttrList) of
        {_, Val2} when Val1 >= Val2 ->
            do_check_cover_glyph(T, OldAttrList);
        _ -> skip
    end.

do_calc_pvp([], BuffList, _Role, Flag) ->
    {Flag, lists:reverse(BuffList)};
do_calc_pvp([H = #buff{pvped = Pvped, id = Id} | T],
            BuffList,
            Role = #role{m_family =
                             #m_family{family_effect = EffectInfo}},
            Flag) ->
    case buff_data:get(Id) of
        #buff_base{pvp_limit = 0} ->
            do_calc_pvp(T, [H | BuffList], Role, Flag);
        #buff_base{pvp_limit = Limit, name = BuffName} ->
            FamilyPvpAdd = case lists:keyfind(15, 1, EffectInfo) of
                               {_, Count} -> Count;
                               _ -> 0
                           end,
            NewLimit = Limit + FamilyPvpAdd,
            case Pvped + 1 >= NewLimit of
                true ->
                    do_calc_pvp(T,
                                BuffList,
                                Role,
                                {push, BuffName, H, NewLimit});
                false ->
                    NewFlag = case Flag of
                                  false -> not_push;
                                  _ -> Flag
                              end,
                    do_calc_pvp(T,
                                [H#buff{pvped = Pvped + 1} | BuffList],
                                Role,
                                NewFlag)
            end;
        _ ->
            do_calc_pvp(T,
                        BuffList,
                        Role,
                        {push, lang:get("未知效果"), H, 3})
    end.

do_is_special_effect_exists_one_param(EffectType,
                                      BuffList) ->
    do_is_special_effect_exists_one_param(EffectType,
                                          BuffList,
                                          0).

do_is_special_effect_exists_one_param(_EffectType, [],
                                      ValueAdd) ->
    case ValueAdd of
        0 -> {false, 0};
        _ -> {true, ValueAdd}
    end;
do_is_special_effect_exists_one_param(EffectType,
                                      [#buff{id = Id} | T], ValueAdd) ->
    case buff_data:get(Id) of
        #buff_base{effect = Effect} ->
            case lists:keyfind(EffectType, 1, Effect) of
                {EffectType, Value, _} ->
                    do_is_special_effect_exists_one_param(EffectType,
                                                          T,
                                                          ValueAdd + Value);
                _ ->
                    do_is_special_effect_exists_one_param(EffectType,
                                                          T,
                                                          ValueAdd)
            end;
        _ ->
            do_is_special_effect_exists_one_param(EffectType,
                                                  T,
                                                  ValueAdd)
    end.

do_is_special_effect_exists(_EffectType, []) -> false;
do_is_special_effect_exists(EffectType,
                            [#buff{id = Id} | T]) ->
    case buff_data:get(Id) of
        #buff_base{effect = Effect} ->
            case lists:keyfind(EffectType, 1, Effect) of
                {EffectType, _, _} -> true;
                _ -> do_is_special_effect_exists(EffectType, T)
            end;
        _ -> do_is_special_effect_exists(EffectType, T)
    end.

do_get_info_by_special_effect(_, []) ->
    {false, lang:get("没有此类特殊buff")};
do_get_info_by_special_effect(EffectType,
                              [#buff{id = Id} | T]) ->
    case buff_data:get(Id) of
        #buff_base{effect = Effect, name = BuffName} ->
            case lists:keyfind(EffectType, 1, Effect) of
                {EffectType, _, _} -> {true, Id, BuffName};
                _ -> do_get_info_by_special_effect(EffectType, T)
            end;
        _ -> do_get_info_by_special_effect(EffectType, T)
    end.

do_is_special_effect_exists_two_param(_EffectType,
                                      []) ->
    {false, 0, 0};
do_is_special_effect_exists_two_param(EffectType,
                                      [#buff{id = Id} | BuffList]) ->
    case buff_data:get(Id) of
        #buff_base{effect = Effect} ->
            case lists:keyfind(EffectType, 1, Effect) of
                {EffectType, Value1, Value2} -> {true, Value1, Value2};
                _ ->
                    do_is_special_effect_exists_two_param(EffectType,
                                                          BuffList)
            end;
        _ -> do_is_special_effect_exists(EffectType, BuffList)
    end.

get_base_max_dynamic_attr(_Id, []) -> [];
get_base_max_dynamic_attr(Id, [{Type, Val} | T]) ->
    DynamicAttrList = buff_data:get_dynamic_attr({Id,
                                                  Type}),
    RatioList = [Ratio
                 || {Ratio, Weight} <- DynamicAttrList, Weight =/= 0],
    case RatioList of
        [] -> get_base_max_dynamic_attr(Id, T);
        _ ->
            Ratio = lists:max(RatioList),
            [{Type, round(Val * Ratio / 100)}
             | get_base_max_dynamic_attr(Id, T)]
    end.

get_max_dynamic_attr([], DynamicAttr) -> DynamicAttr;
get_max_dynamic_attr([{Type, Val} | T], DynamicAttr) ->
    case lists:keyfind(Type, 1, DynamicAttr) of
        {_, OldVal} ->
            NewVal = case OldVal > Val of
                         true -> Val;
                         _ -> OldVal
                     end,
            NewDynamicAttr = lists:keystore(Type,
                                            1,
                                            DynamicAttr,
                                            {Type, NewVal}),
            get_max_dynamic_attr(T, NewDynamicAttr);
        _ -> get_max_dynamic_attr(T, DynamicAttr)
    end.

