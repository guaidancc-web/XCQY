-file("src/mod/skill/skill_prac.erl", 1).

-module(skill_prac).

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

-file("src/mod/skill/skill_prac.erl", 19).

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

-file("src/mod/skill/skill_prac.erl", 20).

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

-file("src/mod/skill/skill_prac.erl", 21).

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

-file("src/mod/skill/skill_prac.erl", 22).

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

-file("src/mod/skill/skill_prac.erl", 23).

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

-file("src/mod/skill/skill_prac.erl", 24).

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

-file("src/mod/skill/skill_prac.erl", 25).

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

-file("src/mod/skill/skill_prac.erl", 26).

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

-file("src/mod/skill/skill_prac.erl", 27).

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

-file("src/mod/skill/skill_prac.erl", 28).

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

-file("src/mod/skill/skill_prac.erl", 29).

-file("inc/skill_prac.hrl", 1).

-record(skl_prac_meta_data,
        {id :: undefined | pos_integer(),
         name :: undefined | string(),
         obj :: undefined | pos_integer(),
         day_max_times :: undefined | pos_integer()}).

-record(skill_prac_data,
        {id :: undefined | pos_integer(),
         role_lev :: undefined | non_neg_integer(),
         skill_lev :: undefined | non_neg_integer(),
         top_lev :: undefined | non_neg_integer(),
         exp :: undefined | non_neg_integer(),
         attrs :: undefined | list(),
         lev_break_times :: undefined | non_neg_integer()}).

-record(skl_prac,
        {id = 0 :: pos_integer(),
         obj = 0 :: pos_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         enhance = [] :: list()}).

-record(skl_prac_enhance,
        {source = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer()}).

-record(skill_prac_box,
        {id :: undefined | tuple(), exps = []}).

-file("src/mod/skill/skill_prac.erl", 30).

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

-file("src/mod/skill/skill_prac.erl", 31).

-file("inc/privilege.hrl", 1).

-record(m_privilege,
        {ver = 2,
         lev = 0,
         list = [],
         new_list = [],
         new_prilist = []}).

-record(privilege_data,
        {lev = 0,
         min = 0,
         max = 0,
         title = "",
         content = "",
         item = []}).

-record(privilege_type_data,
        {lev = 0, type = 0, val = 0, args = [], old_item = []}).

-record(privilege_role,
        {id = {0, "", 0},
         ver = 2,
         lev = 0,
         privilege_lev = 0,
         buy_list = [],
         pri_list = []}).

-record(privilege_item,
        {id = 0,
         item_id = 0,
         is_self = 0,
         bind = 0,
         num = 0,
         weigth = 0,
         is_cast = 0}).

-record(privilege_gift,
        {id = 0,
         need_val = 0,
         reward = [],
         privileges = [],
         title = "",
         content = "",
         client_show = [],
         mail_title = "",
         mail_content = ""}).

-file("src/mod/skill/skill_prac.erl", 32).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/skill/skill_prac.erl", 33).

-record(calc_prac,
        {id = 0,
         exp = 0,
         lev = 0,
         loss = 0,
         acc = 0,
         extra_acc = 0,
         is_world_extra = false,
         is_top = 0,
         actv_lev = 0,
         op = multi,
         percent = 1,
         msg = lang:get(""),
         reason = undefined,
         source = 0}).

-export([add_exp/3,
         add_cycle_exp/3,
         add_cycle_exp/5,
         calc_cycle_exp/3,
         calc_diff_exp/5,
         level_up/1,
         login/1,
         practice/3,
         set_skill_prac/2,
         get/1,
         use_note/2,
         note_addition/2,
         note_var/2,
         upgrade/4,
         calc_all_lev/1,
         push_skl_prac/1,
         push_prac_note_limit/1,
         to_combat_skill_prac/1,
         adm_show/1,
         get_skill_prac_times/1,
         zero_flush/2,
         get_note_use_times/1,
         push_note_times/1]).

-type op_exp() :: add | multi.

login(Role) -> login(actv, Role).

login(actv,
      Role = #role{m_skill =
                       MSkill = #m_skill{is_open_skl_prac = 1,
                                         skill_prac = SkillPrac},
                   lev = Lev})
    when Lev >= 0 ->
    AllSklPrac = skill_prac_data:get_all_skls_prac(),
    NewSklPrac = add_skl_prac(AllSklPrac, Role, SkillPrac),
    Role#role{m_skill =
                  MSkill#m_skill{skill_prac = NewSklPrac}};
login(actv,
      Role = #role{m_skill =
                       MSkill = #m_skill{is_open_skl_prac = 0},
                   lev = Lev})
    when Lev >= 0 ->
    AllSklPrac = skill_prac_data:get_all_skls_prac(),
    DefSklId = skill_prac_data:get_min_skl_id(),
    InitSklPrac = init_skl_prac(AllSklPrac, Role, []),
    Role#role{m_skill =
                  MSkill#m_skill{is_open_skl_prac = 1,
                                 selected_skl_prac = DefSklId,
                                 skill_prac = InitSklPrac}};
login(_, Role) -> Role.

calc_all_lev(#role{m_skill =
                       #m_skill{skill_prac = SkillPrac}}) ->
    do_calc_all_lev(SkillPrac, 0).

do_calc_all_lev([], Sum) -> Sum;
do_calc_all_lev([#skl_prac{lev = Lev, enhance = Enhance}
                 | T],
                Sum) ->
    EnhanceSum = lists:sum([EnhanceLev
                            || #skl_prac_enhance{lev = EnhanceLev} <- Enhance]),
    do_calc_all_lev(T, Sum + Lev + EnhanceSum);
do_calc_all_lev([_ | T], Sum) ->
    do_calc_all_lev(T, Sum).

to_combat_skill_prac(#role{m_skill =
                               #m_skill{skill_prac = SkillPrac}}) ->
    to_combat_skill_prac(SkillPrac, {0, 0, 0}).

to_combat_skill_prac([],
                     {SkillPracAtk, SkillPracPhyDef, SkillPracMagicDef}) ->
    {SkillPracAtk, SkillPracPhyDef, SkillPracMagicDef};
to_combat_skill_prac([#skl_prac{id = 62000, lev = Lev,
                                enhance = Enhance}
                      | T],
                     {SkillPracAtk, SkillPracPhyDef, SkillPracMagicDef}) ->
    EnhanceSum = lists:sum([EnhanceLev
                            || #skl_prac_enhance{lev = EnhanceLev} <- Enhance]),
    to_combat_skill_prac(T,
                         {SkillPracAtk + Lev + EnhanceSum,
                          SkillPracPhyDef,
                          SkillPracMagicDef});
to_combat_skill_prac([#skl_prac{id = 62100, lev = Lev,
                                enhance = Enhance}
                      | T],
                     {SkillPracAtk, SkillPracPhyDef, SkillPracMagicDef}) ->
    EnhanceSum = lists:sum([EnhanceLev
                            || #skl_prac_enhance{lev = EnhanceLev} <- Enhance]),
    to_combat_skill_prac(T,
                         {SkillPracAtk,
                          SkillPracPhyDef + Lev + EnhanceSum,
                          SkillPracMagicDef});
to_combat_skill_prac([#skl_prac{id = 62200, lev = Lev,
                                enhance = Enhance}
                      | T],
                     {SkillPracAtk, SkillPracPhyDef, SkillPracMagicDef}) ->
    EnhanceSum = lists:sum([EnhanceLev
                            || #skl_prac_enhance{lev = EnhanceLev} <- Enhance]),
    to_combat_skill_prac(T,
                         {SkillPracAtk,
                          SkillPracPhyDef,
                          SkillPracMagicDef + Lev + EnhanceSum});
to_combat_skill_prac([_ | T],
                     {SkillPracAtk, SkillPracPhyDef, SkillPracMagicDef}) ->
    to_combat_skill_prac(T,
                         {SkillPracAtk, SkillPracPhyDef, SkillPracMagicDef}).

level_up(Role) -> level_up(actv, Role).

level_up(actv,
         Role = #role{m_skill =
                          Mskill = #m_skill{is_open_skl_prac = 1,
                                            skill_prac = SkillPrac},
                      lev = Lev})
    when Lev >= 0 ->
    AllSklPrac = skill_prac_data:get_all_skls_prac(),
    NewSkillPrac = add_skl_prac(AllSklPrac,
                                Role,
                                SkillPrac),
    NewRole = Role#role{m_skill =
                            Mskill#m_skill{skill_prac = NewSkillPrac}},
    push_skl_prac(NewRole),
    NewRole;
level_up(actv,
         Role = #role{m_skill =
                          Mskill = #m_skill{is_open_skl_prac = 0},
                      lev = Lev})
    when Lev >= 0 ->
    AllSklPrac = skill_prac_data:get_all_skls_prac(),
    DefSklId = skill_prac_data:get_min_skl_id(),
    InitSklPrac = init_skl_prac(AllSklPrac, Role, []),
    NewRole = Role#role{m_skill =
                            Mskill#m_skill{is_open_skl_prac = 1,
                                           selected_skl_prac = DefSklId,
                                           skill_prac = InitSklPrac}},
    push_skl_prac(NewRole),
    NewRole;
level_up(_, Role) -> Role.

use_note(Id,
         Role = #role{m_skill =
                          #m_skill{is_open_skl_prac = 1}}) ->
    Loss = [#loss{label = item_base_id,
                  val = [{20025, 1}]}],
    case role_gain:do(Loss, Role) of
        {ok, LossRole} ->
            case item_data:get(20025) of
                #item_base{effect = Effect} ->
                    case lists:keyfind(7, 1, Effect) of
                        {_, Val} -> add_note_exp(Id, Val, LossRole);
                        _False -> {false, lang:get("无法使用冒险笔记")}
                    end;
                _False -> {false, lang:get("无法使用冒险笔记")}
            end;
        {false, _} -> {false, lang:get("没有冒险笔记可以使用")};
        _False -> {false, lang:get("无法使用冒险笔记")}
    end;
use_note(_Id, _Role) -> {false, lang:get("无法使用冒险笔记")}.

add_note_exp(Id, Value, Role) ->
    case note_addition(Value, Role) of
        {true, {Op, NewVal, Percent}, Text} ->
            G = #gain{label = prac_exp, val = NewVal, source = 102},
            case add_exp(Role, Id, 1, G, Op, Percent) of
                {ok, NRole} ->
                    {ok, NewRole} = note_var(NRole, Text),
                    push_note_times(NewRole),
                    push_prac_note_limit(NewRole),
                    {ok, NewRole};
                Rtn = {false, _Msg} -> Rtn;
                _False -> {false, lang:get("无法使用冒险笔记")}
            end;
        Rtn = {false, _Msg} -> Rtn;
        _ -> {false, lang:get("无法使用冒险笔记")}
    end.

note_addition(Value, Role) ->
    DayVar = var:get_var(Role, day, 25, 0),
    PrivilegeVal = privilege:get_val(Role, {109, 20025}),
    case DayVar < 15 + PrivilegeVal of
        true ->
            case DayVar < 6 of
                true ->
                    Fmt = lang:get("每天前~ts本额外加成~ts, 今天还能使用~ts本"),
                    Args = [{string_2, 5, 6},
                            {string_2, 5, "30%"},
                            {string_2, 5, 15 + PrivilegeVal - DayVar - 1}],
                    Text = notice:format(Fmt, Args),
                    {true, {add, Value, 2.99999999999999988898e-1}, Text};
                false ->
                    case DayVar + 1 < 15 + PrivilegeVal of
                        true ->
                            Fmt = lang:get("今天还能使用~ts本"),
                            Args = [{string_2,
                                     5,
                                     15 + PrivilegeVal - DayVar - 1}],
                            Text = notice:format(Fmt, Args),
                            {true, {add, Value, 0}, Text};
                        false ->
                            Fmt = lang:get("今天已经使用了~ts本冒险笔记，无法继续使用"),
                            Args = [{string_2, 5, 15 + PrivilegeVal}],
                            Text = notice:format(Fmt, Args),
                            {true, {add, Value, 0}, Text}
                    end
            end;
        false ->
            Fmt = lang:get("今天已经使用了~ts本冒险笔记，无法继续使用"),
            Args = [{string_2, 5, 15 + PrivilegeVal}],
            Text = notice:format(Fmt, Args),
            {false, Text}
    end.

note_var(Role, Text) ->
    VarRole = var:add_var(Role, day, 25, 1),
    notice:send(VarRole, 1, Text),
    {ok, VarRole}.

set_skill_prac(Id,
               #role{m_skill = #m_skill{selected_skl_prac = Id}}) ->
    false;
set_skill_prac(Id, Role = #role{m_skill = MSkill}) ->
    case get_skl_prac(Id, Role) of
        false -> false;
        #skl_prac{} ->
            NewRole = Role#role{m_skill =
                                    MSkill#m_skill{selected_skl_prac = Id}},
            push_skl_prac(NewRole),
            notice:return(lang:get("成功设置当前为升级技能")),
            {ok, NewRole}
    end.

practice(Id, Num,
         Role = #role{m_skill =
                          #m_skill{is_open_skl_prac = 1,
                                   skill_prac = SkillPrac}}) ->
    case lists:keyfind(Id, #skl_prac.id, SkillPrac) of
        SklPrac = #skl_prac{lev = SklLev, exp = SklExp} ->
            CurTimes = var:get_list_var(Role,
                                        day,
                                        622,
                                        {Id, SklLev},
                                        0),
            MaxTimes = case skill_prac_data:get_max_times({Id,
                                                           SklLev})
                           of
                           Times when is_integer(Times) -> Times;
                           _ -> 0
                       end,
            case CurTimes < MaxTimes orelse MaxTimes =:= 0 of
                true ->
                    NewNum = case MaxTimes - CurTimes > Num orelse
                                      MaxTimes =:= 0
                                 of
                                 true -> Num;
                                 _ -> MaxTimes - CurTimes
                             end,
                    CalcPrac = #calc_prac{id = Id, lev = SklLev,
                                          exp = SklExp, source = 101},
                    case calc_prac(NewNum, Role, CalcPrac) of
                        NewCalcPrac = #calc_prac{lev = SklLev, exp = SklExp,
                                                 is_top = 1} ->
                            case skill_prac_data:get(Id) of
                                SklData = #skl_prac_meta_data{} ->
                                    {ok, Msg} = top_notice(NewCalcPrac,
                                                           SklData,
                                                           Role,
                                                           false),
                                    {false, Msg};
                                _False -> false
                            end;
                        #calc_prac{lev = SklLev, exp = SklExp} ->
                            {false, lang:get("当前冒险技能已达最高开放等级，无法继续学习")};
                        #calc_prac{loss = 0} ->
                            {false, lang:get("当前冒险技能已达最高开放等级，无法继续学习")};
                        NewCalcPrac = #calc_prac{loss = Loss} ->
                            case role_gain:do_notice([#loss{label = coin,
                                                            val = Loss}],
                                                     Role)
                                of
                                {ok, LossRole} ->
                                    NLossRole = var:set_list_var(LossRole,
                                                                 day,
                                                                 622,
                                                                 {Id, SklLev},
                                                                 CurTimes +
                                                                     NewNum),
                                    update_same_skl(NLossRole,
                                                    SklPrac,
                                                    NewCalcPrac);
                                _ ->
                                    case skill_prac_data:get(Id) of
                                        #skl_prac_meta_data{name = Name} ->
                                            Fmt = lang:get("您的~ts不足~w，学习~ts失败"),
                                            Args = [{assets_2, 90000},
                                                    Loss,
                                                    {string_2, 5, Name}],
                                            Msg = notice:format(Fmt, Args),
                                            {false, Msg};
                                        none -> false
                                    end
                            end
                    end;
                _ ->
                    SkillName = case skill_prac_data:get(Id) of
                                    #skl_prac_meta_data{name = Name} -> Name;
                                    _ -> lang:get("冒险技能")
                                end,
                    Msg = notice:format("~ts今日银币学习已达到上限",
                                        [{string_2, 5, SkillName}]),
                    {false, Msg}
            end;
        false -> false
    end;
practice(_Id, _Num, _Role) -> false.

-spec calc_cycle_exp(Role, Num, ConsExp) -> {ok, Exp} |
                                            false |
                                            {false, Msg} when Num ::
                                                                  non_neg_integer(),
                                                              ConsExp ::
                                                                  non_neg_integer(),
                                                              Exp ::
                                                                  non_neg_integer(),
                                                              Role :: #role{},
                                                              Msg :: string().

calc_cycle_exp(Role = #role{name = _Name,
                            m_skill =
                                #m_skill{is_open_skl_prac = 1,
                                         selected_skl_prac = Id,
                                         skill_prac = SkillPrac}},
               Num, ConsExp) ->
    RestSkls = [PracSkl
                || PracSkl = #skl_prac{id = PracId} <- SkillPrac,
                   PracId =/= Id],
    case get_skl_prac(Id, Role) of
        SklPrac = #skl_prac{} ->
            Skls = [SklPrac | lists:keysort(#skl_prac.id,
                                            RestSkls)],
            G = #gain{label = prac_exp, val = ConsExp},
            case do_add_cycle_exp(Skls, Num, multi, G, 1, Role) of
                #calc_prac{acc = 0} -> {ok, 0};
                #calc_prac{acc = AccExp} -> {ok, AccExp};
                {false, Msg} -> {false, Msg};
                {false, Msg, _} -> {false, Msg};
                _False ->
                    logger:error("[~ts]冒险技能错误的计算返回值~w",
                                 [_Name, _False],
                                 skill_prac,
                                 350),
                    false
            end;
        _False ->
            logger:error("[~ts]冒险技能没有默认的技能~w",
                         [_Name, _False],
                         skill_prac,
                         354),
            false
    end;
calc_cycle_exp(_Role, _Num, _ConsExp) ->
    {false, lang:get("您当前没有开放冒险技能，无法增加冒险经验")}.

calc_diff_exp(OldLev, NewLev, OldExp, NewExp, Id) ->
    case skill_prac_data:get_skl_prac({Id, OldLev}) of
        #skill_prac_data{exp = TopExp} ->
            case OldLev =:= NewLev of
                false ->
                    do_calc_diff_exp(OldLev + 1,
                                     NewLev,
                                     NewExp,
                                     Id,
                                     erlang:max(TopExp - OldExp, 0));
                true -> erlang:max(NewExp - OldExp, 0)
            end;
        _False ->
            logger:error("冒险技能[~w]错误的计算返回值~w",
                         [{Id, OldLev}, _False],
                         skill_prac,
                         371),
            0
    end.

do_calc_diff_exp(Lev, Lev, Exp, _Id, AccExp) ->
    AccExp + Exp;
do_calc_diff_exp(Lev, NewLev, Exp, Id, AccExp) ->
    case skill_prac_data:get_skl_prac({Id, Lev}) of
        #skill_prac_data{exp = TopExp} ->
            do_calc_diff_exp(Lev + 1,
                             NewLev,
                             Exp,
                             Id,
                             AccExp + TopExp);
        _False ->
            logger:error("冒险技能[~w]错误的计算返回值~w",
                         [{Id, Lev}, _False],
                         skill_prac,
                         382),
            0
    end.

add_cycle_exp(Role, Num, G = #gain{label = prac_exp}) ->
    add_cycle_exp(Role, Num, G, multi, 1);
add_cycle_exp(Role, _Num, _G) ->
    logger:error("[~ts]未知的来源:~w",
                 [Role#role.name, {_Num, _G}],
                 skill_prac,
                 400),
    {false, lang:get("未知来源的冒险经验")}.

-spec add_cycle_exp(Role, Num, ConsExp, Op,
                    Percent) -> {ok, NRole} |
                                false |
                                {false, Msg} when Role :: #role{},
                                                  NRole :: #role{},
                                                  Num :: non_neg_integer(),
                                                  ConsExp :: non_neg_integer(),
                                                  Percent :: non_neg_integer(),
                                                  Op :: op_exp(),
                                                  Msg :: string().

add_cycle_exp(Role = #role{m_skill =
                               #m_skill{is_open_skl_prac = 1,
                                        selected_skl_prac = Id,
                                        skill_prac = SkillPrac}},
              Num, G = #gain{label = prac_exp}, Op, Percent) ->
    RestSkls = [PracSkl
                || PracSkl = #skl_prac{id = PracId} <- SkillPrac,
                   PracId =/= Id],
    case get_skl_prac(Id, Role) of
        SklPrac = #skl_prac{lev = Lev, exp = Exp} ->
            Skls = [SklPrac | lists:keysort(#skl_prac.id,
                                            RestSkls)],
            case do_add_cycle_exp(Skls, Num, Op, G, Percent, Role)
                of
                #calc_prac{id = Id, lev = Lev, exp = Exp, msg = Msg,
                           reason = Reason} ->
                    {false, Msg, Reason};
                NewCalcPrac = #calc_prac{id = Id} ->
                    update_same_skl(Role, SklPrac, NewCalcPrac);
                NewCalcPrac = #calc_prac{} ->
                    update_diff_skl(Role, NewCalcPrac);
                {false, Msg} -> {false, Msg};
                {false, Msg, Reason} -> {false, Msg, Reason};
                _False -> false
            end;
        _False ->
            logger:error("[~ts]冒险技能没有默认的技能~w",
                         [Role#role.name, _False],
                         skill_prac,
                         429),
            {false, lang:get("没有设置默认的冒险技能")}
    end;
add_cycle_exp(_Role, _Num, _G, _Op, _Percent) ->
    {false, lang:get("您当前没有开放冒险技能，无法增加冒险经验")}.

add_exp(Role = #role{m_skill =
                         #m_skill{selected_skl_prac = Id}},
        Num, G = #gain{label = prac_exp}) ->
    add_exp(Role, Id, Num, G, add, 0);
add_exp(_Role, _Num, _G) ->
    {false, lang:get("您当前没有开放冒险技能，无法增加冒险经验")}.

-spec add_exp(Role, Id, Num, ConsExp, Op,
              Percent) -> {ok, NRole} |
                          false |
                          {false, Msg} when Role :: #role{}, NRole :: #role{},
                                            Id :: non_neg_integer(),
                                            Num :: non_neg_integer(),
                                            ConsExp :: non_neg_integer(),
                                            Percent :: non_neg_integer(),
                                            Op :: op_exp(), Msg :: string().

add_exp(Role = #role{m_skill =
                         #m_skill{is_open_skl_prac = 1,
                                  skill_prac = SkillPrac}},
        Id, Num,
        #gain{label = prac_exp, val = ConsExp, source = Source},
        Op, Percent) ->
    case lists:keyfind(Id, #skl_prac.id, SkillPrac) of
        SklPrac = #skl_prac{lev = SklLev, exp = SklExp} ->
            CalcPrac = #calc_prac{id = Id, lev = SklLev,
                                  exp = SklExp, op = Op, percent = Percent,
                                  source = Source},
            case do_add_exp(Num, Role, ConsExp, CalcPrac) of
                #calc_prac{lev = SklLev, exp = SklExp, msg = Msg} ->
                    {false, Msg};
                NewCalcPrac = #calc_prac{lev = Lev}
                    when Lev >= SklLev ->
                    update_same_skl(Role, SklPrac, NewCalcPrac);
                _False -> false
            end;
        false -> false
    end;
add_exp(_Role, _Id, _Num, _G, _Op, _Percent) ->
    {false, lang:get("您当前没有开放冒险技能，无法增加冒险经验")}.

update_same_skl(Role = #role{m_skill =
                                 MSkill = #m_skill{skill_prac = SkillPrac}},
                SklPrac = #skl_prac{lev = Lev, obj = Obj},
                CalcPrac = #calc_prac{id = Id, lev = NewLev,
                                      exp = NewExp}) ->
    NewSklPrac = SklPrac#skl_prac{lev = NewLev,
                                  exp = NewExp},
    NewSkillPrac = lists:keystore(Id,
                                  #skl_prac.id,
                                  SkillPrac,
                                  NewSklPrac),
    SklRole = Role#role{m_skill =
                            MSkill#m_skill{skill_prac = NewSkillPrac}},
    NewRole = case NewLev > Lev of
                  true ->
                      CalcRole = skill_prac_attr:calc_obj(Obj, SklRole),
                      role_trigger:fire(#evt_skill_prac_levup{id = Id,
                                                              lev = NewLev},
                                        CalcRole);
                  false -> SklRole
              end,
    case skill_prac_data:get(Id) of
        SklData = #skl_prac_meta_data{} ->
            add_exp_notice(SklPrac, CalcPrac, SklData, NewRole),
            push_update_skl(NewRole, Id, NewLev, NewExp),
            log(NewRole,
                Role,
                NewSklPrac,
                SklPrac,
                SklData,
                CalcPrac),
            {ok, NewRole};
        _False ->
            logger:error("[~ts]没有冒险技能[Id:~w]数据:~w",
                         [Role#role.name, Id, _False],
                         skill_prac,
                         491),
            {false, lang:get("无法增加冒险经验")}
    end.

update_diff_skl(Role = #role{m_skill =
                                 MSkill = #m_skill{selected_skl_prac =
                                                       SelectedId,
                                                   skill_prac = SkillPrac}},
                CalcPrac = #calc_prac{id = NewId, lev = NewLev,
                                      exp = NewExp}) ->
    case lists:keyfind(NewId, #skl_prac.id, SkillPrac) of
        OldSklPrac = #skl_prac{lev = OldLev} ->
            NewSklPrac = OldSklPrac#skl_prac{lev = NewLev,
                                             exp = NewExp},
            NewSkillPrac = lists:keystore(NewId,
                                          #skl_prac.id,
                                          SkillPrac,
                                          NewSklPrac),
            NewMSkill = MSkill#m_skill{selected_skl_prac = NewId,
                                       skill_prac = NewSkillPrac},
            SklRole = Role#role{m_skill = NewMSkill},
            case skill_prac_data:get(NewId) of
                SklData = #skl_prac_meta_data{obj = NewObj} ->
                    NewRole = case OldLev < NewLev of
                                  false -> SklRole;
                                  true ->
                                      CalcRole =
                                          skill_prac_attr:calc_obj(NewObj,
                                                                   SklRole),
                                      LevupEvt = #evt_skill_prac_levup{id =
                                                                           NewId,
                                                                       lev =
                                                                           NewLev},
                                      role_trigger:fire(LevupEvt, CalcRole)
                              end,
                    switch_notice(SelectedId, SklData, NewRole),
                    push_set_skl(NewRole, NewId),
                    add_exp_notice(NewSklPrac, CalcPrac, SklData, NewRole),
                    push_update_skl(NewRole, NewId, NewLev, NewExp),
                    log(NewRole,
                        Role,
                        NewSklPrac,
                        OldSklPrac,
                        SklData,
                        CalcPrac),
                    {ok, NewRole};
                _False ->
                    logger:error("[~ts]没有冒险技能[~w]配置数据~w",
                                 [Role#role.name, NewId, _False],
                                 skill_prac,
                                 525),
                    false
            end;
        _False ->
            logger:error("[~ts]没有冒险技能数据~w",
                         [Role#role.name, _False],
                         skill_prac,
                         529),
            false
    end.

get(Role = #role{m_skill =
                     #m_skill{is_open_skl_prac = 1,
                              selected_skl_prac = Id}}) ->
    case get_skl_prac(Id, Role) of
        SklPrac = #skl_prac{} -> {ok, SklPrac};
        false -> {false, #skl_prac{}}
    end;
get(_Role) -> {false, #skl_prac{}}.

upgrade(Role = #role{m_skill =
                         MSkill = #m_skill{skill_prac = PracList}},
        Source, UpgradeList, Push) ->
    OldUpgradeList = get_old_upgrade(PracList, Source),
    case merge_upgrade(OldUpgradeList, UpgradeList) of
        {0, _} -> Role;
        {1, NewUpgradeList} ->
            Fun = fun ({SkillId, Lev}, {SklList, Plist}) ->
                          case lists:keyfind(SkillId, #skl_prac.id, Plist) of
                              Skl = #skl_prac{enhance = EnhanceList} ->
                                  Enhance = #skl_prac_enhance{lev = Lev,
                                                              source = Source},
                                  NewEnhanceList = lists:keystore(Source,
                                                                  #skl_prac_enhance.source,
                                                                  EnhanceList,
                                                                  Enhance),
                                  NewSkl = Skl#skl_prac{enhance =
                                                            NewEnhanceList},
                                  NewPlist = lists:keystore(SkillId,
                                                            #skl_prac.id,
                                                            Plist,
                                                            NewSkl),
                                  NewSklList = lists:keystore(SkillId,
                                                              #skl_prac.id,
                                                              SklList,
                                                              NewSkl),
                                  {NewSklList, NewPlist};
                              _ ->
                                  logger:error("无法找到附加冒险技能[~w,~w,~w]",
                                               [Source, SkillId, Lev],
                                               skill_prac,
                                               564),
                                  {SklList, Plist}
                          end;
                      (_, {SklList, Plist}) -> {SklList, Plist}
                  end,
            {UpdateSkl, NewPracList} = lists:foldl(Fun,
                                                   {[], PracList},
                                                   NewUpgradeList),
            NewMSkill = MSkill#m_skill{skill_prac = NewPracList},
            Role1 = Role#role{m_skill = NewMSkill},
            Role2 = calc_upgrade(Role1, UpdateSkl, Push),
            Role2
    end.

get_old_upgrade(PracList, Source) ->
    get_old_upgrade(PracList, Source, []).

get_old_upgrade([], _Source, UpgradeList) ->
    UpgradeList;
get_old_upgrade([#skl_prac{id = SkillId,
                           enhance = EnhanceList}
                 | T],
                Source, UpgradeList) ->
    case lists:keyfind(Source,
                       #skl_prac_enhance.source,
                       EnhanceList)
        of
        #skl_prac_enhance{lev = Lev} ->
            get_old_upgrade(T,
                            Source,
                            [{SkillId, Lev} | UpgradeList]);
        _ -> get_old_upgrade(T, Source, UpgradeList)
    end.

merge_upgrade(GradeList1, GradeList2) ->
    merge_upgrade(GradeList1, GradeList2, 0, []).

merge_upgrade([], [], Flag, GradeList) ->
    {Flag, GradeList};
merge_upgrade([], GradeList2, _Flag, GradeList) ->
    {1, GradeList2 ++ GradeList};
merge_upgrade([{SkillId, Lev} | T], GradeList2, Flag,
              GradeList) ->
    case lists:keyfind(SkillId, 1, GradeList2) of
        {_, Lev} ->
            NewGardeList2 = lists:keydelete(SkillId, 1, GradeList2),
            merge_upgrade(T,
                          NewGardeList2,
                          Flag,
                          [{SkillId, Lev} | GradeList]);
        {_, NewLev} ->
            NewGardeList2 = lists:keydelete(SkillId, 1, GradeList2),
            merge_upgrade(T,
                          NewGardeList2,
                          1,
                          [{SkillId, NewLev} | GradeList]);
        _ ->
            merge_upgrade(T,
                          GradeList2,
                          1,
                          [{SkillId, 0} | GradeList])
    end.

calc_upgrade(Role, UpdateSkl, Push) ->
    UpdateFlag = lists:usort([Obj
                              || #skl_prac{obj = Obj} <- UpdateSkl]),
    push_single_skl(Role, UpdateSkl),
    Fun = fun (UpdateObj,
               Role1 = #role{m_pet = #m_pet{pets = Pets},
                             m_guard = #m_guard{guards = Guards}}) ->
                  case UpdateObj of
                      1 ->
                          case Push of
                              1 -> skill_prac_attr:calc_obj(1, Role1);
                              _ -> attr:calc(Role)
                          end;
                      2 ->
                          case Push of
                              1 -> skill_prac_attr:calc_obj(2, Role1);
                              _ -> pet_attr:batch_calc(Pets, Role)
                          end;
                      3 ->
                          case Push of
                              1 -> skill_prac_attr:calc_obj(3, Role1);
                              _ -> guard_attr:batch_calc(Guards, Role)
                          end;
                      4 ->
                          case Push of
                              1 -> skill_prac_attr:calc_obj(4, Role1);
                              _ ->
                                  Role2 = guard_attr:batch_calc(Guards, Role1),
                                  pet_attr:batch_calc(Pets, Role2)
                          end;
                      _ -> Role1
                  end
          end,
    NewRole = lists:foldl(Fun, Role, UpdateFlag),
    NewRole.

push_prac_note_limit(Role = #role{link = Link}) ->
    case note_addition(1, Role) of
        {true, _, _} ->
            Result = case is_all_skill_max_lev(Role) of
                         true -> 1;
                         false -> 0
                     end,
            role:link_send(Link, 10819, {Result});
        _R -> role:link_send(Link, 10819, {1})
    end.

calc_addition_exp(Role, _SklId, SklLev, Op, ConsExp,
                  Percent) ->
    {WorldLev, _NextTime} = world_lev:get_world_lev(Role),
    CheckFlag = case skill_prac_data:get_max_lev(WorldLev)
                    of
                    MaxLev when is_integer(MaxLev) ->
                        case SklLev =< MaxLev - 6 of
                            true -> {true, 50};
                            false ->
                                case SklLev =< MaxLev - 4 of
                                    true -> {true, 30};
                                    false -> false
                                end
                        end;
                    _ -> false
                end,
    NewPercent = case CheckFlag of
                     {true, Ratio} ->
                         case Op of
                             add -> (100 + Ratio) / 100 + Percent;
                             multi -> (100 + Ratio) / 100 * Percent;
                             Op -> 1.3
                         end;
                     false ->
                         case Op of
                             add -> 1 + Percent;
                             multi -> Percent;
                             Op -> 1
                         end
                 end,
    Exp = erlang:round(ConsExp * NewPercent),
    {CheckFlag, Exp}.

init_skl_prac([], _, Acc) -> Acc;
init_skl_prac([#skl_prac_meta_data{id = Id, obj = Obj}
               | Rest],
              Role, Acc) ->
    case check_skl_prac(actv, Role, Id, 0) of
        true ->
            init_skl_prac(Rest,
                          Role,
                          [#skl_prac{id = Id, obj = Obj, lev = 0, exp = 0}
                           | Acc]);
        false -> init_skl_prac(Rest, Role, Acc)
    end.

add_skl_prac([], _, SkillPrac) -> SkillPrac;
add_skl_prac([#skl_prac_meta_data{id = Id, obj = Obj}
              | Rest],
             Role, SkillPrac) ->
    case lists:keytake(Id, #skl_prac.id, SkillPrac) of
        false ->
            case check_skl_prac(actv, Role, Id, 0) of
                true ->
                    add_skl_prac(Rest,
                                 Role,
                                 [#skl_prac{id = Id, obj = Obj, lev = 0,
                                            exp = 0}
                                  | SkillPrac]);
                false -> add_skl_prac(Rest, Role, SkillPrac)
            end;
        {value,
         SklPrac = #skl_prac{lev = SklLev, exp = CurExp},
         RestSkillPrac} ->
            case skill_prac_data:get_skl_prac({Id, SklLev}) of
                #skill_prac_data{exp = LevelUpExp, top_lev = TopLev}
                    when CurExp >= LevelUpExp andalso TopLev > SklLev ->
                    case check_next_lev(SklPrac, Role) of
                        true ->
                            add_skl_prac(Rest,
                                         Role,
                                         [SklPrac#skl_prac{lev = SklLev + 1,
                                                           exp = 0}
                                          | RestSkillPrac]);
                        false -> add_skl_prac(Rest, Role, SkillPrac)
                    end;
                _ -> add_skl_prac(Rest, Role, SkillPrac)
            end
    end.

-spec get_skl_prac(Id, Role) -> false |
                                #skl_prac{} when Id :: non_neg_integer(),
                                                 Role :: #role{}.

get_skl_prac(Id,
             #role{m_skill = #m_skill{skill_prac = SkillPrac}}) ->
    case lists:keyfind(Id, #skl_prac.id, SkillPrac) of
        false -> false;
        SklPrac = #skl_prac{} -> SklPrac
    end.

check_skl_prac(actv,
               #role{lev = RoleLev,
                     m_lev_break = #m_lev_break{times = Times}},
               Id, SklLev) ->
    case skill_prac_data:get_skl_prac({Id, SklLev}) of
        #skill_prac_data{role_lev = ActvLev,
                         lev_break_times = NeedTimes} ->
            RoleLev >= ActvLev andalso Times >= NeedTimes;
        false -> false
    end.

calc_prac(0, _Role, CalcPrac) -> CalcPrac;
calc_prac(Num,
          Role = #role{m_skill = #m_skill{is_open_skl_prac = 1},
                       lev = Lev, m_lev_break = #m_lev_break{times = Times}},
          CalcPrac = #calc_prac{id = SklPracId, lev = CalcLev,
                                loss = CalcLoss}) ->
    case skill_prac_data:get_skl_prac({SklPracId, CalcLev})
        of
        SklPracData = #skill_prac_data{top_lev = TopLev,
                                       role_lev = ActvLev,
                                       lev_break_times = NeedTimes}
            when CalcLev < TopLev andalso
                     ActvLev =< Lev andalso NeedTimes =< Times ->
            NewCalcLoss = CalcLoss + 20000,
            case calc_exp_and_lev(Role, SklPracData, 20, CalcPrac)
                of
                {final, NewCalcPrac} ->
                    NewCalcPrac#calc_prac{loss = NewCalcLoss};
                {continue, NewCalcPrac} ->
                    calc_prac(Num - 1,
                              Role,
                              NewCalcPrac#calc_prac{loss = NewCalcLoss})
            end;
        #skill_prac_data{} -> CalcPrac;
        _Else -> calc_prac(Num - 1, Role, CalcPrac)
    end;
calc_prac(_Num, _Role, CalcPrac) -> CalcPrac.

do_add_exp(0, _Role, _, CalcPrac) -> CalcPrac;
do_add_exp(Num,
           Role = #role{lev = Lev,
                        m_lev_break = #m_lev_break{times = Times}},
           ConsExp,
           CalcPrac = #calc_prac{id = SklPracId, lev = CalcLev}) ->
    case skill_prac_data:get_skl_prac({SklPracId, CalcLev})
        of
        SklPracData = #skill_prac_data{top_lev = TopLev,
                                       role_lev = ActvLev,
                                       lev_break_times = NeedTimes}
            when CalcLev < TopLev andalso
                     Lev >= ActvLev andalso Times >= NeedTimes ->
            case calc_exp_and_lev(Role,
                                  SklPracData,
                                  ConsExp,
                                  CalcPrac)
                of
                {final, NewCalcPrac} -> NewCalcPrac;
                {continue, NewCalcPrac} ->
                    do_add_exp(Num - 1, Role, ConsExp, NewCalcPrac)
            end;
        #skill_prac_data{role_lev = ActvLev}
            when ActvLev > Lev ->
            CalcPrac#calc_prac{msg = lang:get("角色等级已达到学习当前技能等级的上限"),
                               reason = exp_full};
        #skill_prac_data{lev_break_times = NeedTimes}
            when NeedTimes > Times ->
            Msg = util:flist(lang:get("需要等级突破~w次才可以继续升级"),
                             [NeedTimes]),
            CalcPrac#calc_prac{msg = Msg, reason = exp_full};
        #skill_prac_data{top_lev = TopLev}
            when TopLev >= CalcLev ->
            CalcPrac#calc_prac{msg =
                                   lang:get("当前冒险技能已达最高开放等级，无法继续学习"),
                               reason = exp_full};
        _ -> CalcPrac#calc_prac{msg = lang:get("无法继续学习当前冒险技能")}
    end;
do_add_exp(_Num, _Role, _ConsExp, CalcPrac) -> CalcPrac.

do_add_cycle_exp([], _Num, _Op, _G, _Percent, _Role) ->
    {false, lang:get("当前所有冒险技能经验已达上限"), exp_full};
do_add_cycle_exp([#skl_prac{id = Id, lev = SklLev,
                            exp = SklExp}
                  | Rest],
                 Num, Op, G = #gain{val = ConsExp, source = Source},
                 Percent, Role) ->
    CalcPrac = #calc_prac{id = Id, lev = SklLev,
                          exp = SklExp, op = Op, percent = Percent,
                          source = Source},
    case do_add_exp(Num, Role, ConsExp, CalcPrac) of
        #calc_prac{lev = SklLev, exp = SklExp} ->
            do_add_cycle_exp(Rest, Num, Op, G, Percent, Role);
        NewCalcPrac = #calc_prac{} -> NewCalcPrac;
        _False ->
            CalcPrac#calc_prac{msg = lang:get("无法继续学习当前冒险技能")}
    end.

calc_exp_and_lev(Role = #role{lev = RoleLev,
                              m_lev_break = #m_lev_break{times = Times}},
                 #skill_prac_data{top_lev = TopLev, exp = LevelUpExp},
                 ConsExp,
                 CalcPrac = #calc_prac{id = SklPracId, exp = CalcExp,
                                       lev = CalcLev, acc = Acc,
                                       extra_acc = ExtraAcc, op = Op,
                                       percent = Percent,
                                       is_world_extra = WorldLevFlag})
    when CalcLev < TopLev ->
    NextLev = CalcLev + 1,
    case skill_prac_data:get_skl_prac({SklPracId, NextLev})
        of
        #skill_prac_data{role_lev = ActvLev,
                         exp = NextLevelUpExp, lev_break_times = NeedTimes}
            when RoleLev >= ActvLev andalso Times >= NeedTimes ->
            {IsWorldLevExtra, AddExp} = calc_addition_exp(Role,
                                                          SklPracId,
                                                          CalcLev,
                                                          Op,
                                                          ConsExp,
                                                          Percent),
            NewWorldLevFlag = case WorldLevFlag of
                                  {true, _Ratio} -> {true, _Ratio};
                                  _ -> IsWorldLevExtra
                              end,
            TotalExp = CalcExp + AddExp,
            ExtraAddExp = erlang:max(AddExp - ConsExp, 0),
            case TotalExp >= LevelUpExp of
                true ->
                    NewSklExp = TotalExp - LevelUpExp,
                    NCalcPrac = CalcPrac#calc_prac{exp = NewSklExp,
                                                   lev = NextLev,
                                                   acc = Acc + AddExp,
                                                   extra_acc =
                                                       ExtraAcc + ExtraAddExp,
                                                   is_world_extra =
                                                       NewWorldLevFlag},
                    NewCalcPrac = unify_exp(NCalcPrac,
                                            NextLevelUpExp,
                                            Role),
                    {continue, NewCalcPrac};
                false ->
                    NewCalcPrac = CalcPrac#calc_prac{exp = TotalExp,
                                                     acc = Acc + AddExp,
                                                     extra_acc =
                                                         ExtraAcc + ExtraAddExp,
                                                     is_world_extra =
                                                         NewWorldLevFlag},
                    {continue, NewCalcPrac}
            end;
        #skill_prac_data{lev_break_times = NeedTimes}
            when NeedTimes > Times ->
            {final,
             CalcPrac#calc_prac{msg =
                                    util:flist(lang:get("需要等级突破~w次才可以继续升级"),
                                               [NeedTimes])}};
        #skill_prac_data{role_lev = ActvLev} ->
            Msg = lang:get("当前冒险技能已达最高开放等级，无法继续学习"),
            {final,
             CalcPrac#calc_prac{is_top = 1, actv_lev = ActvLev,
                                msg = Msg}};
        false ->
            logger:error("无法找到相应配置[id:~w][lev:~w]",
                         [SklPracId, NextLev],
                         skill_prac,
                         857),
            {final, CalcPrac}
    end;
calc_exp_and_lev(Role,
                 #skill_prac_data{exp = LevelUpExp}, ConsExp,
                 CalcPrac = #calc_prac{id = SklPracId, lev = CalcLev,
                                       exp = CalcExp, acc = Acc,
                                       extra_acc = ExtraAcc, op = Op,
                                       percent = Percent,
                                       is_world_extra = WorldLevFlag}) ->
    {IsWorldLevExtra, AddExp} = calc_addition_exp(Role,
                                                  SklPracId,
                                                  CalcLev,
                                                  Op,
                                                  ConsExp,
                                                  Percent),
    NewWorldLevFlag = case WorldLevFlag of
                          {true, _Ratio} -> {true, _Ratio};
                          _ -> IsWorldLevExtra
                      end,
    TotalExp = CalcExp + AddExp,
    ExtraAddExp = erlang:max(AddExp - ConsExp, 0),
    case TotalExp >= LevelUpExp of
        true ->
            DiffExp = LevelUpExp - CalcExp,
            NewCalcPrac = CalcPrac#calc_prac{exp = LevelUpExp,
                                             acc = Acc + DiffExp,
                                             extra_acc = ExtraAcc + ExtraAddExp,
                                             is_world_extra = NewWorldLevFlag},
            {final, NewCalcPrac};
        false ->
            NewCalcPrac = CalcPrac#calc_prac{exp = TotalExp,
                                             acc = Acc + AddExp,
                                             extra_acc = ExtraAcc + ExtraAddExp,
                                             is_world_extra = NewWorldLevFlag},
            {continue, NewCalcPrac}
    end.

check_next_lev(#skl_prac{id = SklPracId,
                         lev = CurSklLev},
               #role{lev = RoleLev,
                     m_lev_break = #m_lev_break{times = Times}}) ->
    case skill_prac_data:get_skl_prac({SklPracId,
                                       CurSklLev + 1})
        of
        #skill_prac_data{role_lev = ActvLev,
                         lev_break_times = NeedTimes}
            when RoleLev >= ActvLev andalso Times >= NeedTimes ->
            true;
        _ -> false
    end.

push_skl_prac(Role = #role{m_skill =
                               #m_skill{selected_skl_prac = SklPracId,
                                        skill_prac = SklPrac}}) ->
    SkillPracTimes = skill_prac:get_skill_prac_times(Role),
    role:link_send(Role,
                   10805,
                   {SklPracId, SklPrac, SkillPracTimes}).

push_update_skl(Role, Id, Lev, Exp) ->
    DayVar = case get_skill_prac_times(Role, Id) of
                 {ok, {Id, CurTimes}} -> CurTimes;
                 _ -> 0
             end,
    role:link_send(Role, 10807, {Id, Lev, Exp, DayVar}).

push_single_skl(Role, SklList) ->
    SkillPracTimes = skill_prac:get_skill_prac_times(Role),
    role:link_send(Role, 10818, {SklList, SkillPracTimes}).

push_set_skl(Role, Id) ->
    role:link_send(Role, 10806, {1, Id}).

push_note_times(Role) ->
    DayVar = get_note_use_times(Role),
    role:link_send(Role, 10817, {DayVar}).

add_exp_notice(#skl_prac{lev = OldLev},
               #calc_prac{lev = NewLev, acc = Acc, extra_acc = Extra,
                          is_world_extra = WorldLevFlag},
               #skl_prac_meta_data{name = Name}, Role) ->
    TextExp = case Extra of
                  0 ->
                      case NewLev > OldLev of
                          true ->
                              Fmt = lang:get("~ts技能增加~ts，升级到~ts级"),
                              Args = [{string_2, 5, Name},
                                      {assets_1, 90013, Acc},
                                      {string_2, 5, NewLev}],
                              notice:format(Fmt, Args);
                          false ->
                              Fmt = lang:get("~ts技能增加~ts"),
                              Args = [{string_2, 5, Name},
                                      {assets_1, 90013, Acc}],
                              notice:format(Fmt, Args)
                      end;
                  _ ->
                      case WorldLevFlag of
                          {true, Ratio} ->
                              notice:format(lang:get("~ts技能增加~ts（低于世界等级额外获得~ts%加成）"),
                                            [{string_2, 5, Name},
                                             {assets_1, 90013, Acc},
                                             {string_1, Ratio}]);
                          _ ->
                              notice:format(lang:get("~ts技能增加~ts"),
                                            [{string_2, 5, Name},
                                             {assets_1, 90013, Acc}])
                      end
              end,
    notice:send(Role, 3, TextExp),
    case NewLev > OldLev of
        true ->
            LevFmt = lang:get("~ts技能升级到~ts级"),
            LevArgs = [{string_2, 5, Name}, {string_2, 5, NewLev}],
            TextLev = notice:format(LevFmt, LevArgs),
            notice:send(Role, 3, TextLev);
        false -> false
    end,
    ok.

top_notice(#calc_prac{is_top = 1, actv_lev = ActvLev},
           #skl_prac_meta_data{name = SklName}, Role, IsNotice) ->
    Fmt = lang:get("您需要升至~ts级，才能继续学习~ts"),
    Args = [{string_2, 5, ActvLev}, {string_2, 5, SklName}],
    Msg = notice:format(Fmt, Args),
    case IsNotice of
        true -> notice:send(Role, 1, Msg);
        _ -> skip
    end,
    {ok, Msg};
top_notice(_Calc, _SklData, _Role, _IsNotice) ->
    {ok, ""}.

switch_notice(OldId,
              #skl_prac_meta_data{name = NewName}, Role) ->
    Msg = case skill_prac_data:get(OldId) of
              #skl_prac_meta_data{name = OldName} ->
                  Fmt = lang:get("当前冒险技能~ts已达到世界等级上限，自动切换至~ts"),
                  Args = [{string_2, 5, OldName}, {string_2, 5, NewName}],
                  notice:format(Fmt, Args);
              _False ->
                  Fmt = lang:get("当前冒险技能已达到世界等级上限，自动切换至~ts"),
                  Args = [{string_2, 5, NewName}],
                  notice:format(Fmt, Args)
          end,
    notice:send(Role, 1, Msg),
    ok.

unify_exp(CalcPrac = #calc_prac{id = SklPracId,
                                lev = CalcLev, exp = CalcExp},
          LevelUpExp,
          Role = #role{lev = CurRoleLev,
                       m_lev_break = #m_lev_break{times = Times}}) ->
    case CalcExp > LevelUpExp of
        true ->
            case skill_prac_data:get_skl_prac({SklPracId,
                                               CalcLev + 1})
                of
                #skill_prac_data{exp = NextLevelUpExp, top_lev = TopLev,
                                 role_lev = ActvLev,
                                 lev_break_times = NeedTimes} ->
                    case CurRoleLev >= ActvLev andalso
                             TopLev >= CalcLev andalso Times >= NeedTimes
                        of
                        true ->
                            case CalcExp > NextLevelUpExp of
                                true ->
                                    NewCalcPrac = CalcPrac#calc_prac{lev =
                                                                         CalcLev
                                                                             +
                                                                             1,
                                                                     exp =
                                                                         CalcExp
                                                                             -
                                                                             LevelUpExp},
                                    unify_exp(NewCalcPrac,
                                              NextLevelUpExp,
                                              Role);
                                false ->
                                    CalcPrac#calc_prac{lev = CalcLev + 1,
                                                       exp =
                                                           CalcExp - LevelUpExp}
                            end;
                        false ->
                            case CalcExp > NextLevelUpExp of
                                true ->
                                    CalcPrac#calc_prac{exp = NextLevelUpExp};
                                false ->
                                    CalcPrac#calc_prac{exp =
                                                           CalcExp - LevelUpExp}
                            end
                    end;
                _False ->
                    logger:error("没有找到冒险技能~w配置~w",
                                 [{SklPracId, CalcLev + 1}, _False],
                                 skill_prac,
                                 1027),
                    CalcPrac
            end;
        false -> CalcPrac
    end.

log(NRole, OldRole,
    #skl_prac{id = Id, lev = NLev, exp = NExp},
    #skl_prac{lev = OLev, exp = OExp},
    #skl_prac_meta_data{name = SklName},
    #calc_prac{acc = Acc, source = Source}) ->
    Fmt = "~w$$~ts$$~w$$~w$$~w$$~w$$~w$$~w",
    Args = [Id,
            SklName,
            Source,
            Acc,
            NLev,
            NExp,
            OLev,
            OExp],
    Msg = util:flist(Fmt, Args),
    log:skill_prac(NRole, lang:get("增加冒险经验"), Msg, OldRole),
    ok.

is_all_skill_max_lev(#role{m_skill =
                               #m_skill{is_open_skl_prac = 1,
                                        skill_prac = Skills},
                           lev = RoleLev,
                           m_lev_break = #m_lev_break{times = Times}}) ->
    is_all_skill_max_lev(Skills, RoleLev, Times);
is_all_skill_max_lev(_) -> true.

is_all_skill_max_lev([], _, _) -> true;
is_all_skill_max_lev([#skl_prac{id = Id, lev = Lev}
                      | Rest],
                     RoleLev, Times) ->
    case skill_prac_data:get_skl_prac({Id, Lev + 1}) of
        #skill_prac_data{role_lev = NeedLev,
                         lev_break_times = NeedTimes}
            when RoleLev >= NeedLev andalso Times >= NeedTimes ->
            false;
        _ -> is_all_skill_max_lev(Rest, RoleLev, Times)
    end.

adm_show(_Role = #role{m_skill =
                           #m_skill{skill_prac = SkillPrac}}) ->
    Skills = adm_show(skill, SkillPrac, []),
    {ok, Skills}.

adm_show(skill, [], List) -> List;
adm_show(Label = skill,
         [#skl_prac{id = Id, lev = Lev} | T], List) ->
    NName = case skill_prac_data:get(Id) of
                #skl_prac_meta_data{name = Name} -> Name;
                _ -> ""
            end,
    Add = [{skill_id, Id}, {lev, Lev}, {name, NName}],
    adm_show(Label, T, [Add | List]);
adm_show(Label, [_ | T], List) ->
    adm_show(Label, T, List).

get_skill_prac_times(Role = #role{m_skill =
                                      #m_skill{skill_prac = SklPrac}}) ->
    get_skill_prac_times(Role, SklPrac, []).

get_skill_prac_times(_Role, [], List) ->
    lists:reverse(List);
get_skill_prac_times(Role, [H | T], List) ->
    case get_skill_prac_times(Role, H) of
        {ok, {ID, Times}} ->
            get_skill_prac_times(Role, T, [{ID, Times} | List]);
        _ -> get_skill_prac_times(Role, T, List)
    end.

get_skill_prac_times(Role = #role{m_skill =
                                      #m_skill{skill_prac = SkillPrac}},
                     ID)
    when is_integer(ID) ->
    case lists:keyfind(ID, #skl_prac.id, SkillPrac) of
        #skl_prac{lev = Lev} ->
            CurTimes = var:get_list_var(Role,
                                        day,
                                        622,
                                        {ID, Lev},
                                        0),
            case CurTimes > 0 of
                true -> {ok, {ID, CurTimes}};
                _ -> false
            end;
        _ -> false
    end;
get_skill_prac_times(Role,
                     #skl_prac{id = ID, lev = Lev}) ->
    CurTimes = var:get_list_var(Role,
                                day,
                                622,
                                {ID, Lev},
                                0),
    case CurTimes > 0 of
        true -> {ok, {ID, CurTimes}};
        _ -> false
    end;
get_skill_prac_times(_Role, _) -> false.

zero_flush(Role, _) ->
    push_skl_prac(Role),
    push_note_times(Role),
    ok.

get_note_use_times(Role) ->
    var:get_var(Role, day, 25, 0).

