-file("src/mod/pet/pet_skill.erl", 1).

-module(pet_skill).

-export([use_item/4,
         attr_to_skill/2,
         calc_attr/2,
         all_skill/1,
         gm_study/2,
         skill_name/1,
         comprehend/2,
         combat_comprehend/3,
         lock_skill/3,
         rpc_choose_exchange_skill/3]).

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

-file("src/mod/pet/pet_skill.erl", 21).

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

-file("src/mod/pet/pet_skill.erl", 22).

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

-file("src/mod/pet/pet_skill.erl", 23).

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

-file("src/mod/pet/pet_skill.erl", 24).

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

-file("src/mod/pet/pet_skill.erl", 25).

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

-file("src/mod/pet/pet_skill.erl", 26).

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

-file("src/mod/pet/pet_skill.erl", 27).

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

-file("src/mod/pet/pet_skill.erl", 28).

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

-file("src/mod/pet/pet_skill.erl", 29).

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

-file("src/mod/pet/pet_skill.erl", 30).

-file("inc/mount.hrl", 1).

-record(mount_goal,
        {ver = 1 :: non_neg_integer(),
         finish = [] :: list(),
         doing = [] :: list(),
         day_reward = [] :: list()}).

-record(m_mount,
        {ver = 10 :: pos_integer(),
         mounts = [] :: list(),
         mount_goal = #mount_goal{},
         next_mount_id = 1 :: non_neg_integer(),
         ride_mount = 0,
         appearance_list = [],
         combat_active_times = [],
         dye_list = [],
         dye_diff_list = [],
         pre_mount_status = 0 :: non_neg_integer(),
         evolution_list = [],
         double_ride_role = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         is_driver = 0}).

-record(mount,
        {ver = 4 :: pos_integer(),
         index = 0 :: non_neg_integer(),
         mount_base_id = 0 :: non_neg_integer(),
         transformation_id = 0 :: non_neg_integer(),
         lev = 1 :: pos_integer(),
         skill_point = 1 :: pos_integer(),
         fail_times = 0 :: non_neg_integer(),
         upgrade_lev = 0 :: non_neg_integer(),
         live_status = 0,
         skill_list = [],
         fight_times = 0 :: non_neg_integer(),
         spirit = 0 :: non_neg_integer(),
         growth = 1 :: pos_integer(),
         growth_item_num = 0 :: non_neg_integer(),
         speed_lev = 1 :: pos_integer(),
         manger_pets = [],
         tmp_growth = 1 :: pos_integer(),
         tmp_skill_list = [],
         decorate_list = [],
         score = 0,
         expire_time = 0}).

-record(mount_skill,
        {skill_index = 1 :: pos_integer(),
         skill_id = 1 :: non_neg_integer(),
         skill_lev = 0 :: non_neg_integer()}).

-record(mount_decorate,
        {decorate_index = 1 :: pos_integer(),
         decorate_base_id = 0 :: non_neg_integer(),
         is_hide = 0 :: non_neg_integer()}).

-record(mount_dye,
        {trans_id = 0, dye_id = 0, cache_dye_list = []}).

-record(mount_evolution,
        {trans_id = 0, evolution_id = 0}).

-file("src/mod/pet/pet_skill.erl", 31).

-file("inc/camp_pet_egg.hrl", 1).

-author("Lith").

-file("src/mod/pet/pet_skill.erl", 32).

rpc_choose_exchange_skill(Role = #role{m_pet =
                                           MPet = #m_pet{pets = Pets}},
                          PetId, SkillId) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{skills = Skills, base_id = BaseId} ->
            case lists:keyfind(5, #pet_skill.source, Skills) of
                PetSkill = #pet_skill{id = OldSkillId} ->
                    case pet_data:get_exchange_skill_info(BaseId) of
                        #{skill_id := CfgSkillId, skills := CanChooseSkills,
                          cost := Cost} ->
                            case lists:keymember(SkillId, 1, CanChooseSkills) of
                                true when SkillId =/= OldSkillId ->
                                    Loss = case OldSkillId =:= CfgSkillId of
                                               false ->
                                                   format:val_to_loss(Cost);
                                               _ -> []
                                           end,
                                    case role_gain:do_notice(Loss, Role) of
                                        {ok, LossRole} ->
                                            NewPetSkill = PetSkill#pet_skill{id
                                                                                 =
                                                                                 SkillId},
                                            NewSkills = lists:keystore(5,
                                                                       #pet_skill.source,
                                                                       Skills,
                                                                       NewPetSkill),
                                            NewPet = Pet#pet{skills =
                                                                 NewSkills},
                                            NewPets = lists:keyreplace(PetId,
                                                                       #pet.id,
                                                                       Pets,
                                                                       NewPet),
                                            NewRole = LossRole#role{m_pet =
                                                                        MPet#m_pet{pets
                                                                                       =
                                                                                       NewPets}},
                                            pet:push_10511(NewRole, NewPet),
                                            log:pet(NewRole,
                                                    "选择主动技能",
                                                    Pet,
                                                    NewPet),
                                            {ok, NewRole};
                                        {false, #loss{msg = Msg}} ->
                                            {false, Msg};
                                        _ -> {false, lang:get("资源不足")}
                                    end;
                                _ -> {false, lang:get("您无法选择此技能")}
                            end;
                        _ -> {false, lang:get("您的宠物不存在可转化技能")}
                    end;
                _ -> {false, lang:get("您的宠物不存在可转化技能")}
            end;
        _ -> {false, lang:get("不存在的宠物")}
    end.

use_item(Item, 0, PetId,
         Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{genre = 6} -> {false, lang:get("宠物无法学习技能")};
        #pet{lock = 1} -> {false, lang:get("宠物处于锁定状态，请先解除锁定")};
        #pet{genre = 3} -> {false, lang:get("野生宠物无法学习技能")};
        #pet{spirit_attached_id = SpiritAttachedId,
             spirit_child_flag = SpiritChildFlag}
            when SpiritAttachedId =/= 0 orelse
                     SpiritChildFlag =/= 0 ->
            Msg = notice:format(lang:get("请先~ts{face_1,3}"),
                                [{string_2, 5, lang:get("卸下附灵")}]),
            {false, Msg};
        Pet = #pet{} ->
            logger:debug("宠物信息:~w", [Pet], pet_skill, 91),
            case check_auto_skill(Item, Pet, Role) of
                {true, NewSkills, ReMsg, NewRole} ->
                    Pet1 = Pet#pet{skills = NewSkills},
                    {ok, NewPet, NewRole1} = pet_attr:calc(Pet1, NewRole),
                    NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
                    Nr = NewRole1#role{m_pet = Mpet#m_pet{pets = NewPets}},
                    pet:push_10511(Nr, NewPet),
                    pet:push_10503(Nr, NewPet),
                    notice:send(Nr, 3, ReMsg),
                    log:pet(Nr, "宠物天赋异禀", Pet, NewPet),
                    {ok, Nr};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end;
use_item(Item, 1, PetId,
         Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{genre = 6} -> {false, lang:get("宠物无法学习技能")};
        #pet{lock = 1} -> {false, lang:get("宠物处于锁定状态，请先解除锁定")};
        #pet{genre = 3} -> {false, lang:get("野生宠物无法学习技能")};
        #pet{spirit_attached_id = SpiritAttachedId,
             spirit_child_flag = SpiritChildFlag}
            when SpiritAttachedId =/= 0 orelse
                     SpiritChildFlag =/= 0 ->
            Msg = notice:format(lang:get("请先~ts{face_1,3}"),
                                [{string_2, 5, lang:get("卸下附灵")}]),
            {false, Msg};
        Pet = #pet{} ->
            case check_special_skill(Item, Pet, Role) of
                {true, NewSkills, ReMsg, NewRole} ->
                    Pet1 = Pet#pet{skills = NewSkills},
                    {ok, NewPet, NewRole1} = pet_attr:calc(Pet1, NewRole),
                    NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
                    Nr = NewRole1#role{m_pet = Mpet#m_pet{pets = NewPets}},
                    pet:push_10511(Nr, NewPet),
                    pet:push_10503(Nr, NewPet),
                    notice:send(Nr, 3, ReMsg),
                    log:pet(Nr, "宠物天赋异禀", Pet, NewPet),
                    {ok, Nr};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end;
use_item(Item, 2, PetId,
         Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{genre = 6} -> {false, lang:get("宠物无法学习技能")};
        #pet{lock = 1} -> {false, lang:get("宠物处于锁定状态，请先解除锁定")};
        #pet{genre = 3} -> {false, lang:get("野生宠物无法学习技能")};
        #pet{spirit_attached_id = SpiritAttachedId,
             spirit_child_flag = SpiritChildFlag}
            when SpiritAttachedId =/= 0 orelse
                     SpiritChildFlag =/= 0 ->
            Msg = notice:format(lang:get("请先~ts{face_1,3}"),
                                [{string_2, 5, lang:get("卸下附灵")}]),
            {false, Msg};
        Pet = #pet{} ->
            case check_low_special_skill(Item, Pet, Role) of
                {true, NewSkills, ReMsg, NewRole} ->
                    Pet1 = Pet#pet{skills = NewSkills},
                    {ok, NewPet, NewRole1} = pet_attr:calc(Pet1, NewRole),
                    NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
                    Nr = NewRole1#role{m_pet = Mpet#m_pet{pets = NewPets}},
                    pet:push_10511(Nr, NewPet),
                    pet:push_10503(Nr, NewPet),
                    notice:send(Nr, 3, ReMsg),
                    log:pet(Nr, "宠物天赋异禀", Pet, NewPet),
                    {ok, Nr};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end;
use_item(Item, SkillId, PetId,
         Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{genre = 6} -> {false, lang:get("宠物无法学习技能")};
        #pet{lock = 1} -> {false, lang:get("宠物处于锁定状态，请先解除锁定")};
        #pet{genre = 3} -> {false, lang:get("野生宠物无法学习技能")};
        #pet{spirit_attached_id = SpiritAttachedId,
             spirit_child_flag = SpiritChildFlag}
            when SpiritAttachedId =/= 0 orelse
                     SpiritChildFlag =/= 0 ->
            Msg = notice:format(lang:get("请先~ts{face_1,3}"),
                                [{string_2, 5, lang:get("卸下附灵")}]),
            {false, Msg};
        Pet = #pet{skills = Skills, name = PetName,
                   base_id = BaseId} ->
            case check_skill(Item, SkillId, Skills, Role) of
                {true, NewRole, Skill, BaseSkills, ExtSkills} ->
                    {NewBaseSkills, ReMsg, RepleaceFlag} =
                        study_skill(Skill, BaseSkills, PetName, BaseId),
                    NewSkills = NewBaseSkills ++ ExtSkills,
                    Pet1 = Pet#pet{skills = NewSkills},
                    {ok, NewPet, NewRole1} = pet_attr:calc(Pet1, NewRole),
                    NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
                    Nr = NewRole1#role{m_pet = Mpet#m_pet{pets = NewPets}},
                    pet:push_10511(Nr, NewPet),
                    pet:push_10503(Nr, NewPet),
                    notice:send(Nr, 3, ReMsg),
                    log:pet(Nr, "宠物学技能", Pet, NewPet),
                    Nr1 = case RepleaceFlag of
                              false ->
                                  role_trigger:fire(#evt_pet_repleace_skill{},
                                                    Nr);
                              _ -> Nr
                          end,
                    {ok, Nr1};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

gm_study(SkillIds,
         Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(1, #pet.status, Pets) of
        Pet = #pet{skills = Skills} ->
            ExtSkills = [S
                         || S = #pet_skill{source = Source} <- Skills,
                            lists:member(Source, [2, 4]) =:= true],
            Fun = fun (SkillId, SkillList) ->
                          case skill_data:get_pet({SkillId, 1}) of
                              #pet_base_skill{type = SkillType, step = Step} ->
                                  Skill = #pet_skill{id = SkillId, step = Step,
                                                     type = SkillType,
                                                     source = 1},
                                  [Skill | SkillList];
                              _ -> SkillList
                          end
                  end,
            NewSkills = lists:foldl(Fun, [], SkillIds) ++ ExtSkills,
            Pet1 = Pet#pet{skills = NewSkills},
            {ok, NewPet, Role1} = pet_attr:calc(Pet1, Role),
            NewPets = lists:keystore(1, #pet.status, Pets, NewPet),
            Nr = Role1#role{m_pet = Mpet#m_pet{pets = NewPets}},
            pet:push_10511(Nr, NewPet),
            pet:push_10503(Nr, NewPet),
            {ok, role_trigger:fire(#evt_pet_skill{}, Nr)};
        _ -> {false, lang:get("没有找到出战宠物")}
    end.

attr_to_skill(A, Source) when is_list(A) ->
    attr_to_skill(A, Source, []);
attr_to_skill(#attr_base{val = SkillId}, Source) ->
    case skill_data:get_pet({SkillId, 1}) of
        #pet_base_skill{type = SkillType, step = Step} ->
            #pet_skill{id = SkillId, step = Step, type = SkillType,
                       source = Source};
        _ -> false
    end.

attr_to_skill([], _Source, Skills) -> Skills;
attr_to_skill([A = #attr_base{name = 100} | T], Source,
              Skills) ->
    case attr_to_skill(A, Source) of
        PetSkill = #pet_skill{} ->
            attr_to_skill(T, Source, [PetSkill | Skills]);
        _ -> attr_to_skill(T, Source, Skills)
    end;
attr_to_skill([_ | T], Source, Skills) ->
    attr_to_skill(T, Source, Skills).

combat_comprehend(win, CombatType,
                  Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(1, #pet.status, Pets) of
        Pet = #pet{id = PetId} ->
            {Role1, Pet1} = case pet_rune:do_combat_grasp(Role,
                                                          CombatType,
                                                          Pet)
                                of
                                {ok, _Role1, _Pet1} -> {_Role1, _Pet1};
                                _ -> {Role, Pet}
                            end,
            {NRole, NPet} = case lists:member(CombatType,
                                              [3, 8, 13])
                                of
                                true ->
                                    case pet_skill:comprehend(combat, Pet1) of
                                        {true, ComprehendPet, Msg} ->
                                            {ok, NewPet, Role2} =
                                                pet_attr:calc(ComprehendPet,
                                                              Role1),
                                            notice:pop(Role2, 1, Msg),
                                            log:pet(Role2,
                                                    "宠物领悟(战斗)",
                                                    Pet,
                                                    NewPet),
                                            pet:push_10511(Role2, NewPet),
                                            {Role2, NewPet};
                                        _ -> {Role1, Pet1}
                                    end;
                                _ -> {Role1, Pet1}
                            end,
            case NPet of
                Pet -> Role;
                _ ->
                    NewPets = lists:keyreplace(PetId, #pet.id, Pets, NPet),
                    NRole#role{m_pet = Mpet#m_pet{pets = NewPets}}
            end;
        _ -> Role
    end;
combat_comprehend(_, _, Role) -> Role.

comprehend(Mode,
           Pet = #pet{name = PetName, skills = Skills,
                      lev = PetLev}) ->
    Result = case Mode of
                 levup -> util:rand(1, 60) =< 1;
                 combat -> util:rand(1, 5000) =< 1;
                 _ -> false
             end,
    case Result of
        true ->
            case check_comprehend(Pet) of
                {true, AllBaseSkills} ->
                    Fun = fun (#pet_skill{source = Source}) -> Source =:= 1
                          end,
                    {BaseSkills, _} = lists:partition(Fun, Skills),
                    LastAllBaseSkills = filter_comprehend(AllBaseSkills,
                                                          BaseSkills),
                    case LastAllBaseSkills of
                        [_ | _] ->
                            {SkillId, _} = util:rand_list(LastAllBaseSkills, 2),
                            AddSkills = pet:learn_normal_skill([SkillId]),
                            NewSkills = AddSkills ++ Skills,
                            Pet1 = Pet#pet{skills = NewSkills,
                                           comprehend_lev = PetLev},
                            SkillName = skill_name(SkillId),
                            Msg = case Mode of
                                      levup ->
                                          notice:format(lang:get("~ts被主人敲了下脑袋，灵光一闪领悟了技能[~ts]"),
                                                        [{string_2, 5, PetName},
                                                         {string_2,
                                                          5,
                                                          SkillName}]);
                                      combat ->
                                          notice:format(lang:get("~ts在战斗中被怪物敲了下脑袋，灵光一闪领悟了技能[~ts]"),
                                                        [{string_2, 5, PetName},
                                                         {string_2,
                                                          5,
                                                          SkillName}])
                                  end,
                            {true, Pet1, Msg};
                        _ -> false
                    end;
                false -> false
            end;
        false -> false
    end.

check_comprehend(#pet{comprehend_lev = ComprehendLev,
                      lev = Lev})
    when Lev =< ComprehendLev + 3 ->
    false;
check_comprehend(#pet{lev = Lev}) when Lev >= 60 ->
    false;
check_comprehend(#pet{skills = Skills})
    when length(Skills) >= 4 ->
    false;
check_comprehend(#pet{base_id = BaseId}) ->
    case pet_data:get_base(BaseId) of
        #pet_base{base_skills = AllBaseSkills} ->
            {true, AllBaseSkills};
        _ -> false
    end.

filter_comprehend(AllBaseSkills, BaseSkills) ->
    filter_comprehend(AllBaseSkills, BaseSkills, []).

filter_comprehend([], _, AllBaseSkills) ->
    AllBaseSkills;
filter_comprehend([{SkillId, Ratio} | T], BaseSkills,
                  AllBaseSkills) ->
    case lists:keyfind(SkillId, #pet_skill.id, BaseSkills)
        of
        false ->
            filter_comprehend(T,
                              BaseSkills,
                              [{SkillId, Ratio} | AllBaseSkills]);
        _ -> filter_comprehend(T, BaseSkills, AllBaseSkills)
    end.

lock_skill(Role = #role{m_pet =
                            Mpet = #m_pet{pets = Pets}},
           Pet = #pet{id = PetId, base_id = BaseId,
                      skills = Skills},
           SkillId) ->
    Fun = fun (#pet_skill{source = Source}) -> Source =:= 1
          end,
    {BaseSkills, RestSkills} = lists:partition(Fun, Skills),
    Len = length(BaseSkills),
    case lists:keyfind(SkillId, #pet_skill.id, BaseSkills)
        of
        #pet_skill{is_lock = 1} ->
            NewBaseSkills = [S#pet_skill{is_lock = 0}
                             || S = #pet_skill{} <- BaseSkills],
            NewSkills = NewBaseSkills ++ RestSkills,
            NewPet = Pet#pet{skills = NewSkills},
            NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
            NewMpet = Mpet#m_pet{pets = NewPets},
            NewRole = Role#role{m_pet = NewMpet},
            pet:push_10511(NewRole, NewPet),
            {ok, NewRole, lang:get("解锁成功")};
        PetSkill = #pet_skill{is_lock = 0} ->
            case pet_data:get_pet_special_skill(BaseId) of
                AllBaseSkills = [_ | _] ->
                    case lists:keymember(SkillId, 1, AllBaseSkills) of
                        true ->
                            case Len > 1 of
                                true ->
                                    NewBaseSkills = [S#pet_skill{is_lock = 0}
                                                     || S = #pet_skill{}
                                                            <- BaseSkills],
                                    NewBaseSkills1 = lists:keystore(SkillId,
                                                                    #pet_skill.id,
                                                                    NewBaseSkills,
                                                                    PetSkill#pet_skill{is_lock
                                                                                           =
                                                                                           1}),
                                    NewSkills = NewBaseSkills1 ++ RestSkills,
                                    NewPet = Pet#pet{skills = NewSkills},
                                    NewPets = lists:keystore(PetId,
                                                             #pet.id,
                                                             Pets,
                                                             NewPet),
                                    NewMpet = Mpet#m_pet{pets = NewPets},
                                    NewRole = Role#role{m_pet = NewMpet},
                                    pet:push_10511(NewRole, NewPet),
                                    {ok, NewRole, lang:get("锁定成功")};
                                _ -> {false, lang:get("仅有一个技能时无法锁定")}
                            end;
                        false -> {false, lang:get("仅可以锁定天赋技能")}
                    end;
                _ -> {false, lang:get("仅可以锁定天赋技能")}
            end;
        _ -> {false, lang:get("找不到技能")}
    end.

lock_loss(Skills) ->
    Fun = fun (#pet_skill{source = Source}) -> Source =:= 1
          end,
    {BaseSkills, _} = lists:partition(Fun, Skills),
    Len = length(BaseSkills),
    case lists:keyfind(1, #pet_skill.is_lock, BaseSkills) of
        false -> [];
        _ ->
            Num = case Len >= 8 of
                      true -> 2;
                      _ -> 1
                  end,
            [#loss{label = item_base_id_auto_buy,
                   val = [{21132, Num}], msg = lang:get("技能认证书不存在，无法操作"),
                   auto_scene = lang:get("宠物锁技能")}]
    end.

check_skill(Item, SkillId, Skills, Role) ->
    {Loss, LossFun} = case Item of
                          {id, ItemId} ->
                              {[#loss{label = item_id, val = [{ItemId, 1}],
                                      msg = lang:get("技能书不存在，无法使用")}],
                               do};
                          {base_id, ItemBaseId} ->
                              {[#loss{label = item_base_id_auto_buy,
                                      val = [{ItemBaseId, 1}],
                                      msg = lang:get("技能书不存在，无法使用"),
                                      auto_scene = lang:get("快捷学习技能")}],
                               do_notice}
                      end,
    LockLoss = lock_loss(Skills),
    case role_gain:LossFun(Loss ++ LockLoss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, NewRole} ->
            case skill_data:get_pet({SkillId, 1}) of
                #pet_base_skill{type = SkillType, step = Step} ->
                    Fun = fun (#pet_skill{source = Source}) -> Source =:= 1
                          end,
                    {BaseSkills, ExtSkills} = lists:partition(Fun, Skills),
                    case lists:keyfind(SkillId, #pet_skill.id, BaseSkills)
                        of
                        false ->
                            Skill = #pet_skill{id = SkillId, step = Step,
                                               type = SkillType, source = 1},
                            {true, NewRole, Skill, BaseSkills, ExtSkills};
                        _ -> {false, lang:get("已有相同技能, 无法使用")}
                    end;
                _ -> {false, lang:get("不存在该技能, 无法使用该技能书")}
            end
    end.

check_auto_skill(Item,
                 #pet{skills = Skills, base_id = BaseId, name = PetName},
                 Role) ->
    {Loss, LossFun} = case Item of
                          {id, ItemId} ->
                              {[#loss{label = item_id, val = [{ItemId, 1}],
                                      msg = lang:get("天赋异禀不存在，无法使用")}],
                               do};
                          {base_id, ItemBaseId} ->
                              {[#loss{label = item_base_id_auto_buy,
                                      val = [{ItemBaseId, 1}],
                                      msg = lang:get("天赋异禀不存在，无法使用"),
                                      auto_scene = lang:get("快捷学习技能")}],
                               do_notice}
                      end,
    LockLoss = lock_loss(Skills),
    case role_gain:LossFun(Loss ++ LockLoss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, NewRole} ->
            case pet_data:get_comprehend_skill(BaseId) of
                AllBaseSkills = [_ | _] ->
                    Fun = fun (#pet_skill{source = Source}) -> Source =:= 1
                          end,
                    {BaseSkills, ExtSkills} = lists:partition(Fun, Skills),
                    LastAllBaseSkills = filter_comprehend(AllBaseSkills,
                                                          BaseSkills),
                    case LastAllBaseSkills of
                        [_ | _] ->
                            {SkillId, _} = util:rand_list(LastAllBaseSkills, 2),
                            [AddSkills] = pet:learn_normal_skill([SkillId]),
                            {NewBaseSkills, ReMsg, RepleaceFlag} =
                                study_skill(AddSkills,
                                            BaseSkills,
                                            PetName,
                                            BaseId),
                            NewSkills = NewBaseSkills ++ ExtSkills,
                            case RepleaceFlag of
                                false ->
                                    {true,
                                     NewSkills,
                                     ReMsg,
                                     role_trigger:fire(#evt_pet_repleace_skill{},
                                                       NewRole)};
                                _ -> {true, NewSkills, ReMsg, NewRole}
                            end;
                        _ ->
                            Msg =
                                notice:format(lang:get("这只宠物已经学会了所有天生技能，无法使用「~ts」"),
                                              [{string_2,
                                                5,
                                                lang:get("天赋异禀")}]),
                            {false, Msg}
                    end;
                _ ->
                    Msg =
                        notice:format(lang:get("这只宠物已经学会了所有天生技能，无法使用「~ts」"),
                                      [{string_2, 5, lang:get("天赋异禀")}]),
                    {false, Msg}
            end
    end.

check_special_skill(Item,
                    #pet{skills = Skills, base_id = BaseId, name = PetName},
                    Role) ->
    {Loss, LossFun} = case Item of
                          {id, ItemId} ->
                              {[#loss{label = item_id, val = [{ItemId, 1}],
                                      msg = lang:get("真·天赋觉醒不存在，无法使用")}],
                               do};
                          {base_id, ItemBaseId} ->
                              {[#loss{label = item_base_id_auto_buy,
                                      val = [{ItemBaseId, 1}],
                                      msg = lang:get("真·天赋觉醒不存在，无法使用"),
                                      auto_scene = lang:get("快捷学习技能")}],
                               do_notice}
                      end,
    LockLoss = lock_loss(Skills),
    case role_gain:LossFun(Loss ++ LockLoss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, NewRole} ->
            case pet_data:get_pet_special_skill(BaseId) of
                AllBaseSkills = [_ | _] ->
                    Fun = fun (#pet_skill{source = Source}) -> Source =:= 1
                          end,
                    {BaseSkills, ExtSkills} = lists:partition(Fun, Skills),
                    LastAllBaseSkills = filter_comprehend(AllBaseSkills,
                                                          BaseSkills),
                    case LastAllBaseSkills of
                        [_ | _] ->
                            {SkillId, _} = util:rand_list(LastAllBaseSkills, 2),
                            [AddSkills] = pet:learn_normal_skill([SkillId]),
                            {NewBaseSkills, ReMsg, RepleaceFlag} =
                                study_skill(AddSkills,
                                            BaseSkills,
                                            PetName,
                                            BaseId),
                            NewSkills = NewBaseSkills ++ ExtSkills,
                            case RepleaceFlag of
                                false ->
                                    {true,
                                     NewSkills,
                                     ReMsg,
                                     role_trigger:fire(#evt_pet_repleace_skill{},
                                                       NewRole)};
                                _ -> {true, NewSkills, ReMsg, NewRole}
                            end;
                        _ ->
                            Msg =
                                notice:format(lang:get("这只宠物已经学会了所有天赋技能，无法使用「~ts」"),
                                              [{string_2,
                                                5,
                                                lang:get("真·天赋觉醒")}]),
                            {false, Msg}
                    end;
                _ ->
                    Msg =
                        notice:format(lang:get("这只宠物已经学会了所有天赋技能，无法使用「~ts」"),
                                      [{string_2, 5, lang:get("真·天赋觉醒")}]),
                    {false, Msg}
            end
    end.

check_low_special_skill(Item,
                        #pet{skills = Skills, base_id = BaseId, name = PetName},
                        Role) ->
    {Loss, LossFun} = case Item of
                          {id, ItemId} ->
                              {[#loss{label = item_id, val = [{ItemId, 1}],
                                      msg = lang:get("天赋觉醒不存在，无法使用")}],
                               do};
                          {base_id, ItemBaseId} ->
                              {[#loss{label = item_base_id_auto_buy,
                                      val = [{ItemBaseId, 1}],
                                      msg = lang:get("天赋觉醒不存在，无法使用"),
                                      auto_scene = lang:get("快捷学习技能")}],
                               do_notice}
                      end,
    LockLoss = lock_loss(Skills),
    case role_gain:LossFun(Loss ++ LockLoss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, NewRole} ->
            case pet_data:get_pet_low_special_skill(BaseId) of
                AllBaseSkills = [_ | _] ->
                    Fun = fun (#pet_skill{source = Source}) -> Source =:= 1
                          end,
                    {BaseSkills, ExtSkills} = lists:partition(Fun, Skills),
                    LastAllBaseSkills = filter_comprehend(AllBaseSkills,
                                                          BaseSkills),
                    case LastAllBaseSkills of
                        [_ | _] ->
                            {SkillId, _} = util:rand_list(LastAllBaseSkills, 2),
                            [AddSkills] = pet:learn_normal_skill([SkillId]),
                            {NewBaseSkills, ReMsg, RepleaceFlag} =
                                study_skill(AddSkills,
                                            BaseSkills,
                                            PetName,
                                            BaseId),
                            NewSkills = NewBaseSkills ++ ExtSkills,
                            case RepleaceFlag of
                                false ->
                                    {true,
                                     NewSkills,
                                     ReMsg,
                                     role_trigger:fire(#evt_pet_repleace_skill{},
                                                       NewRole)};
                                _ -> {true, NewSkills, ReMsg, NewRole}
                            end;
                        _ ->
                            Msg =
                                notice:format(lang:get("这只宠物已经学会了所有天赋技能，无法使用「~ts」"),
                                              [{string_2,
                                                5,
                                                lang:get("天赋领悟")}]),
                            {false, Msg}
                    end;
                _ ->
                    Msg = notice:format(lang:get("这只宠物等级太高无法使用「~ts」"),
                                        [{string_2, 5, lang:get("天赋领悟")}]),
                    {false, Msg}
            end
    end.

skill_name(#pet_skill{id = SkillId}) ->
    skill_name(SkillId);
skill_name(SkillId) ->
    case skill_data:get_pet({SkillId, 1}) of
        #pet_base_skill{name = SkillName} -> SkillName;
        _ -> lang:get("未知技能")
    end.

study_skill(Skill, BaseSkills, PetName, PetBaseId) ->
    Length = length(BaseSkills),
    TalentSkillLength = case pet_data:get_base(PetBaseId) of
                            #pet_base{base_skills = TalentBaseSkills} ->
                                length(TalentBaseSkills);
                            _ -> 4
                        end,
    Flag = if Length =:= 4 andalso TalentSkillLength > 4 ->
                  util:rand(1, 1000) =< 50;
              Length =:= 3 -> util:rand(1, 1000) =< 150;
              Length =:= 2 -> util:rand(1, 1000) =< 250;
              Length =:= 1 -> util:rand(1, 1000) =< 800;
              Length =:= 0 -> true;
              true -> false
           end,
    case Flag of
        true ->
            Name = skill_name(Skill),
            BaseSkills1 = [S#pet_skill{is_last_study = 0}
                           || S <- BaseSkills],
            {[Skill#pet_skill{is_last_study = 1} | BaseSkills1],
             notice:format(lang:get("您的~ts学会了~ts"),
                           [{string_2, 5, PetName}, {string_2, 1, Name}]),
             Flag};
        false ->
            BaseSkills1 = [S
                           || S = #pet_skill{is_lock = 0} <- BaseSkills],
            BaseSkills2 = [S
                           || S = #pet_skill{is_last_study = 0} <- BaseSkills1],
            BaseSkills3 = case length(BaseSkills2) >= 1 of
                              true -> BaseSkills2;
                              _ -> BaseSkills1
                          end,
            DelSkill = util:rand_list(BaseSkills3),
            Name1 = skill_name(Skill),
            Name2 = skill_name(DelSkill),
            UpdateBaseSkills = [S#pet_skill{is_last_study = 0}
                                || S <- BaseSkills],
            NewBaseSkills = update_base_skill(UpdateBaseSkills,
                                              DelSkill#pet_skill{is_last_study =
                                                                     0},
                                              Skill#pet_skill{is_last_study =
                                                                  1}),
            {NewBaseSkills,
             notice:format(lang:get("您的~ts学会了~ts，可惜~ts被遗忘掉了"),
                           [{string_2, 5, PetName},
                            {string_2, 1, Name1},
                            {string_2, 6, Name2}]),
             Flag}
    end.

update_base_skill(BaseSkills, DelSkill, Skill) ->
    update_base_skill(BaseSkills, DelSkill, Skill, []).

update_base_skill([], _DelSkill, Skill, Head) ->
    lists:reverse(Head) ++ [Skill];
update_base_skill([DelSkill | T], DelSkill, Skill,
                  Head) ->
    lists:reverse(Head) ++ [Skill] ++ T;
update_base_skill([H | T], DelSkill, Skill, Head) ->
    update_base_skill(T, DelSkill, Skill, [H | Head]).

all_skill(Pet = #pet{skills = Skills, stones = Stones,
                     mount_skills = MountSkills,
                     spirit_skills = SpiritSkills}) ->
    Fun = fun (#pet_skill{id = SkillId, step = Step,
                          type = Type},
               SkillList) ->
                  case lists:keyfind(Type, 1, SkillList) of
                      {Type, Step1, _} when Step > Step1 ->
                          lists:keystore(Type,
                                         1,
                                         SkillList,
                                         {Type, Step, SkillId});
                      {Type, _, _} -> SkillList;
                      false -> [{Type, Step, SkillId} | SkillList]
                  end;
              (_, SkillList) -> SkillList
          end,
    Skills1 = lists:foldl(Fun, [], Skills),
    BaseSkill = case lists:keyfind(29, 1, Skills1) of
                    false -> [{SkId, 1} || {_, _, SkId} <- Skills1];
                    _ ->
                        [{SkId, 1} || {Type, _, SkId} <- Skills1, Type =/= 30]
                end,
    Fun2 = fun (#item{attr = Attr}, StoneSkillList) ->
                   stone_to_skill(Attr, StoneSkillList)
           end,
    StoneSkill = lists:foldl(Fun2, [], Stones),
    MountSkillList = [{MountSklId, MountSkillLev}
                      || #mount_skill{skill_id = MountSklId,
                                      skill_lev = MountSkillLev}
                             <- MountSkills],
    UnRealSkill = unreal_skill(Pet),
    RuneSkill = rune_skill(Pet),
    logger:debug("~w", [RuneSkill], pet_skill, 647),
    {BaseSkill,
     StoneSkill,
     MountSkillList,
     [{Ssid, Sslv} || {Ssid, Sslv} <- SpiritSkills],
     UnRealSkill,
     RuneSkill}.

unreal_skill(#pet{unreal = []}) -> [];
unreal_skill(#pet{unreal = UnReal}) ->
    unreal_skill(UnReal, []).

unreal_skill([], List) -> List;
unreal_skill([#pet_unreal{item_id = ItemId} | T],
             List) ->
    case pet_data:get_unreal(ItemId) of
        #pet_unreal_data{skills = Skills} ->
            unreal_skill(T, List ++ Skills);
        _ -> unreal_skill(T, List)
    end.

stone_to_skill([], SkillList) -> SkillList;
stone_to_skill([#attr_base{name = 100,
                           val = StoneSkillId}
                | T],
               SkillList) ->
    case skill_data:get_pet_stone(StoneSkillId) of
        #{can_repeat := 1} ->
            stone_to_skill(T, [{StoneSkillId, 1} | SkillList]);
        #{} ->
            stone_to_skill(T,
                           lists:keystore(StoneSkillId,
                                          1,
                                          SkillList,
                                          {StoneSkillId, 1}));
        _ -> stone_to_skill(T, SkillList)
    end;
stone_to_skill([_ | T], SkillList) ->
    stone_to_skill(T, SkillList).

rune_skill(#pet{pet_rune = []}) -> [];
rune_skill(#pet{pet_rune = PetRune}) ->
    NPetRune = [Rune
                || Rune = #pet_rune{rune_status = Status} <- PetRune,
                   Status =/= 0],
    Fun = fun (Rune = #pet_rune{rune_id = RuneId,
                                rune_lev = RuneLev},
               Temp) ->
                  case lists:keyfind(RuneId, #pet_rune.rune_id, Temp) of
                      #pet_rune{rune_lev = OLev} when OLev < RuneLev ->
                          lists:keyreplace(RuneId,
                                           #pet_rune.rune_id,
                                           Temp,
                                           Rune);
                      #pet_rune{} -> Temp;
                      false -> [Rune | Temp]
                  end;
              (_, Temp) -> Temp
          end,
    NRunes = lists:foldl(Fun, [], NPetRune),
    ConflictL = [{23924, 23916}],
    NewRunes = do_conflict(NRunes, ConflictL),
    rune_skill(NewRunes, []).

rune_skill([#pet_rune{rune_status = 0} | T], List) ->
    rune_skill(T, List);
rune_skill([PetRune = #pet_rune{rune_lev = _RuneLev}
            | T],
           List) ->
    case pet_rune:rune_skill(PetRune) of
        false -> rune_skill(T, List);
        SkillId ->
            case skill_data:get_pet({SkillId, 1}) of
                #pet_base_skill{id = NSkillId, lev = _SkillLev} ->
                    rune_skill(T, [{NSkillId, 1} | List]);
                _ -> rune_skill(T, List)
            end
    end;
rune_skill([], List) -> List.

do_conflict(Runes, [{K1, K2} | T]) ->
    NRunes = case lists:keymember(K1,
                                  #pet_rune.rune_id,
                                  Runes)
                 of
                 true -> lists:keydelete(K2, #pet_rune.rune_id, Runes);
                 _ -> Runes
             end,
    do_conflict(NRunes, T);
do_conflict(L, []) -> L.

calc_attr(Ac = #attr_calc{},
          Pet = #pet{lev = PetLev}) ->
    {Skills,
     StoneSkills,
     MountSkills,
     SpiritSkills,
     UnRealSkill,
     RuneSkill} =
        all_skill(Pet),
    Ac1 = do_calc(Ac, Skills, PetLev, []),
    Ac2 = do_calc(Ac1, StoneSkills, []),
    Ac3 = do_calc_mount(Ac2, MountSkills, Pet, []),
    Ac4 = do_calc(Ac3, SpiritSkills, PetLev, []),
    Ac5 = do_calc(Ac4, UnRealSkill, PetLev, []),
    Ac6 = do_calc(Ac5, RuneSkill, PetLev, []),
    NewAc = Ac6,
    NewAc;
calc_attr(Ac = #attr_calc{}, _Role) -> Ac.

do_calc(Ac, [], PetLev, Result) ->
    AttrList1 = skill:dynamic_skill_attr(Result, PetLev),
    AttrList2 = attr_type:to_attr(base, AttrList1),
    case attr_type:do_attr(AttrList2, Ac) of
        {false, Reason} ->
            logger:error("宠物技能属性计算错误[~w]",
                         [Reason],
                         pet_skill,
                         750),
            Ac;
        {ok, NewAc} -> NewAc
    end;
do_calc(Ac, [{Id, Lev} | T], PetLev, Result) ->
    case skill_data:get_pet({Id, Lev}) of
        #pet_base_skill{attr = Attr = [_ | _]} ->
            do_calc(Ac, T, PetLev, Attr ++ Result);
        _ -> do_calc(Ac, T, PetLev, Result)
    end.

do_calc_mount(Ac, [], #pet{lev = PetLev}, Result) ->
    logger:debug("坐骑生效技能属性:~w", [Result], pet_skill, 766),
    AttrList1 = skill:dynamic_skill_attr(Result, PetLev),
    AttrList2 = attr_type:to_attr(base, AttrList1),
    case attr_type:do_attr(AttrList2, Ac) of
        {false, Reason} ->
            logger:error("宠物技能属性计算错误[~w]",
                         [Reason],
                         pet_skill,
                         771),
            Ac;
        {ok, NewAc} -> NewAc
    end;
do_calc_mount(Ac, [{Id, Lev} | T], Pet, Result) ->
    case skill_data:get_mount({Id, Lev}) of
        #{attr := Attr = [_ | _]} ->
            {Attr1, Attr2} = lists:partition(fun ({Type, _, _}) ->
                                                     lists:member(Type,
                                                                  [4, 5, 6])
                                                         =:= true
                                             end,
                                             Attr),
            Attr3 = calc_point_attr(Attr1, Ac, []),
            {Attr4, Attr5} = lists:partition(fun ({Type, _, _}) ->
                                                     lists:member(Type, [7]) =:=
                                                         true
                                             end,
                                             Attr2),
            Attr6 = calc_lev_raion_attr(Attr4, Pet, []),
            do_calc_mount(Ac,
                          T,
                          Pet,
                          Attr3 ++ Attr5 ++ Attr6 ++ Result);
        _ -> do_calc_mount(Ac, T, Pet, Result)
    end.

calc_point_attr([], _Ac, Attr) -> Attr;
calc_point_attr([{4, Name, Val} | T],
                Ac = #attr_calc{attr = #attr{strength = Str}}, Attr) ->
    Val1 = round(Str * Val / 100),
    A = {1, Name, Val1},
    calc_point_attr(T, Ac, [A | Attr]);
calc_point_attr([{5, Name, Val} | T],
                Ac = #attr_calc{attr = #attr{constitution = Con}},
                Attr) ->
    Val1 = round(Con * Val / 100),
    A = {1, Name, Val1},
    calc_point_attr(T, Ac, [A | Attr]);
calc_point_attr([{6, Name, Val} | T],
                Ac = #attr_calc{attr = #attr{endurance = End}}, Attr) ->
    Val1 = round(End * Val / 100),
    logger:debug("耐力点数:~w, 加成值:~w",
                 [End, Val1],
                 pet_skill,
                 803),
    A = {1, Name, Val1},
    calc_point_attr(T, Ac, [A | Attr]);
calc_point_attr([_ | T], Ac, Attr) ->
    calc_point_attr(T, Ac, Attr).

calc_lev_raion_attr([], _Pet, Attr) -> Attr;
calc_lev_raion_attr([{7,
                      Name,
                      {LevAdd, Add, AttrType, PointRatio, DampRatio}}
                     | T],
                    Pet, Attr) ->
    PetPointRatio = pet:calc_point_ratio(Pet, AttrType),
    {NewLevAdd, NewAdd} = case PetPointRatio > PointRatio of
                              true ->
                                  {round(LevAdd * DampRatio / 1000),
                                   round(Add * DampRatio / 1000)};
                              false -> {LevAdd, Add}
                          end,
    A = {3, Name, {NewLevAdd, NewAdd}},
    calc_lev_raion_attr(T, Pet, [A | Attr]);
calc_lev_raion_attr([Other | T], Pet, Attr) ->
    calc_lev_raion_attr(T, Pet, [Other | Attr]).

do_calc(Ac, [], Result) ->
    AttrList1 = attr_type:to_attr(base, Result),
    case attr_type:do_attr(AttrList1, Ac) of
        {false, Reason} ->
            logger:error("宠物护符技能计算错误[~w]",
                         [Reason],
                         pet_skill,
                         831),
            Ac;
        {ok, NewAc} -> NewAc
    end;
do_calc(Ac, [{Id, _Lev} | T], Result) ->
    case skill_data:get_pet_stone(Id) of
        #{attr := Attr = [_ | _]} ->
            do_calc(Ac, T, Attr ++ Result);
        _Err -> do_calc(Ac, T, Result)
    end.

