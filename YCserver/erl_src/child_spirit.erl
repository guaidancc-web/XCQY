-file("src/mod/child/child_spirit.erl", 1).

-module(child_spirit).

-export([attach/3,
         unattach/2,
         calc/3,
         calc_skills/2,
         divorce_unattach/2,
         follow_attach/2]).

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

-file("src/mod/child/child_spirit.erl", 19).

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

-file("src/mod/child/child_spirit.erl", 20).

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

-file("src/mod/child/child_spirit.erl", 21).

-file("inc/child.hrl", 1).

-record(m_child,
        {ver = 1,
         kids = [] :: list(),
         fertility = 0 :: non_neg_integer(),
         tonic = 0 :: non_neg_integer(),
         hungry_notice_lev = []}).

-record(child_attr,
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
         max_aspd_aptitude = 0,
         study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(child_study_plan,
        {ver = 1,
         is_init = 1,
         study_str_easy = 0,
         study_con_easy = 0,
         study_mag_easy = 0,
         study_agi_easy = 0,
         study_end_easy = 0,
         study_str_hard = 0,
         study_con_hard = 0,
         study_mag_hard = 0,
         study_agi_hard = 0,
         study_end_hard = 0,
         study_str_plan_easy = 0,
         study_con_plan_easy = 0,
         study_mag_plan_easy = 0,
         study_agi_plan_easy = 0,
         study_end_plan_easy = 0,
         study_str_plan_hard = 0,
         study_con_plan_hard = 0,
         study_mag_plan_hard = 0,
         study_agi_plan_hard = 0,
         study_end_plan_hard = 0}).

-record(child_base,
        {id = 0,
         name = "",
         classes,
         sex,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
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
         unit_id = 0,
         unit_id_1 = 0,
         unit_id_2 = 0,
         unit_id_3 = 0,
         classes_skills = []}).

-record(child,
        {id = {0, "", 0} :: tuple(),
         ver = 5,
         parents = [] :: list(),
         custody = {0, "", 0} :: tuple(),
         name = "" :: string(),
         base_id = 0,
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         classes_type = 1,
         embryo = 1 :: non_neg_integer(),
         pregnant_time = 0 :: non_neg_integer(),
         birth_time = 0 :: non_neg_integer(),
         stage = 1 :: non_neg_integer(),
         status = 0,
         follow = {0, "", 0} :: tuple(),
         maturity = 0 :: non_neg_integer(),
         growth = 0 :: non_neg_integer(),
         ext_growth = 0,
         growth_type = 5 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         skills = [] :: list(),
         talent_skills = [],
         hungry = 100,
         add_point = 0,
         add_point_item = [],
         grade = 0,
         grade_attr = [],
         hp = 0,
         mp = 0,
         attr,
         looks = [],
         stones = [] :: list(),
         use_growth = 0,
         study_easy = 0,
         study_hard = 0,
         day_easy = 0,
         day_hard = 0,
         study_easy_time = 0,
         study_hard_time = 0,
         talent = 0,
         child_attr = #child_attr{},
         name_changed = 0 :: non_neg_integer(),
         last_name_changed = 0 :: non_neg_integer(),
         maturity_added_log = [] :: list(),
         last_added_maturity = 0 :: non_neg_integer(),
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         combat_talk = [],
         free_study = 0,
         study_plan = #child_study_plan{},
         spirit_attached = 0 :: 0 | 1,
         spirit_skills = [],
         spirit_info = [],
         child_skin = []}).

-record(child_parent,
        {id = {0, "", 0} :: tuple(),
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         account = "",
         lev = 1,
         classes = 0 :: non_neg_integer(),
         looks = [] :: list(),
         intimacy = 0 :: non_neg_integer()}).

-record(child_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(child_skill,
        {id = 0,
         lev = 1,
         step = 0,
         type = 0,
         source = 1,
         is_open = 1,
         exp = 1}).

-record(child_stone,
        {id = 0,
         type = 0,
         base_id = 0,
         role_id = {0, "", 0},
         attr = [],
         extra = [],
         reset_attr = []}).

-record(child_talent_skill,
        {id = 0, grade = 0, lev = 1, exp = 0}).

-record(child_rank, {type = 1, list = []}).

-record(child_rank_rc,
        {id = {0, "", 0} :: tuple(),
         rank = 1,
         ver = 0,
         father_id = {0, "", 0},
         father_name = "",
         father_classes = 0,
         father_sex = 0,
         mother_id = {0, "", 0},
         mother_name = "",
         mother_classes = 0,
         mother_sex = 0,
         custody = {0, "", 0} :: tuple(),
         name = "" :: string(),
         base_id = 0,
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         classes_type = 1,
         lev = 1 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         time = 0}).

-record(child_skin,
        {ver = 2,
         skin_id = 0,
         skin_active_flag = 0,
         expire_time = 0,
         timer_flag = 0}).

-file("src/mod/child/child_spirit.erl", 22).

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

-file("src/mod/child/child_spirit.erl", 23).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/child/child_spirit.erl", 24).

attach(Role = #role{lev = Lev,
                    m_lev_break = #m_lev_break{times = Times}},
       ChildId, SubId) ->
    case child_data:get_child_spirit() of
        {MinLev, IsBreak}
            when Lev >= MinLev andalso Times >= IsBreak ->
            attach2(Role, ChildId, SubId);
        _ -> {false, lang:get("还没有达到给子女附灵的条件哦")}
    end.

attach2(Role = #role{id = RoleId, lev = Lev,
                     m_child = #m_child{kids = Kids},
                     m_pet = #m_pet{pets = Pets}},
        ChildId, SubId) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        #child{follow = FollowId, name = Name}
            when FollowId =/= RoleId ->
            {false,
             notice:format(lang:get("~ts没有被携带，不能进行附灵"),
                           [{string_2, 1, Name}])};
        Child = #child{name = ChildName} ->
            case lists:keyfind(SubId, #pet.id, Pets) of
                #pet{lev = SubPetLev, name = Name}
                    when SubPetLev < Lev - 15 ->
                    {false,
                     notice:format(lang:get("~ts等级不足~ts级，无法进行附灵"),
                                   [{string_2, 1, Name},
                                    {string_2, 5, Lev - 15}])};
                #pet{spirit_attached_id = SpiritAttachedId, name = Name}
                    when SpiritAttachedId =/= 0 ->
                    {false,
                     notice:format(lang:get("~ts在附灵中，不能作为附灵宠"),
                                   [{string_2, 1, Name}])};
                #pet{spirit_child_flag = SpiritChildFlag, name = Name}
                    when SpiritChildFlag =/= 0 ->
                    {false,
                     notice:format(lang:get("~ts在给子女附灵中，不能作为附灵宠"),
                                   [{string_2, 1, Name}])};
                #pet{spirit_attached = SpiritAttached, name = Name}
                    when SpiritAttached =/= 0 ->
                    {false,
                     notice:format(lang:get("~ts在附灵中，不能作为附灵宠"),
                                   [{string_2, 1, Name}])};
                #pet{talent = SubTalent, name = Name}
                    when SubTalent < 3300 ->
                    {false,
                     notice:format(lang:get("~ts评分低于于~ts，不能附灵"),
                                   [{string_2, 1, Name}, {string_2, 5, 3300}])};
                #pet{status = 1, name = Name} ->
                    {false,
                     notice:format(lang:get("~ts在出战中，不能作为附灵宠"),
                                   [{string_2, 1, Name}])};
                SubPet = #pet{base_id = SubBaseId, lev = SubPetLev,
                              name = Name} ->
                    case pet_data:get_base(SubBaseId) of
                        #pet_base{genre = Genre}
                            when Genre =:= 4 orelse Genre =:= 2 ->
                            do_attach(Role, Child, SubPet);
                        #pet_base{manual_level = SubLev} when SubLev < 75 ->
                            {false,
                             notice:format(lang:get("~ts携带等级低于可附灵等级，无法进行附灵"),
                                           [{string_2, 1, Name}])};
                        _ when Lev - SubPetLev =< 15 ->
                            do_attach(Role, Child, SubPet);
                        _ ->
                            {false,
                             notice:format(lang:get("~ts等级低于子女~ts~ts级，无法进行附灵"),
                                           [{string_2, 1, Name},
                                            {string_2, 1, ChildName},
                                            {string_2, 5, 15 + 5}])}
                    end;
                _ -> {false, lang:get("找不到附灵宠")}
            end;
        _ -> {false, lang:get("找不到孩子")}
    end.

unattach(Role = #role{m_pet = #m_pet{pets = Pets}},
         SubId) ->
    case lists:keyfind(SubId, #pet.id, Pets) of
        #pet{spirit_child_flag = 0, name = Name} ->
            {false,
             notice:format(lang:get("~ts不在附灵中，不用取消"),
                           [{string_2, 1, Name}])};
        SubPet = #pet{} ->
            case pet:check_nums(Role) of
                true -> do_unattach(Role, SubPet);
                _Else -> {false, lang:get("当前宠物栏已满，无法卸下附灵宠")}
            end;
        _ -> {false, lang:get("找不到宠物")}
    end.

divorce_unattach(Role = #role{m_pet =
                                  Mpet = #m_pet{pets = Pets}},
                 [#child{id = ChildId, spirit_attached = 1} | T]) ->
    logger:debug("=====", [], child_spirit, 103),
    case pet:check_nums(Role) of
        true ->
            logger:debug("=====", [], child_spirit, 106),
            Pets1 = case lists:keytake(ChildId,
                                       #pet.spirit_child_id,
                                       Pets)
                        of
                        {value, Record, RestList} ->
                            logger:debug("=====", [], child_spirit, 109),
                            NewRecord = Record#pet{spirit_child_id = {0, "", 0},
                                                   spirit_child_flag = 0},
                            [NewRecord | RestList];
                        _ ->
                            logger:debug("孩子未被附灵", [], child_spirit, 113),
                            Pets
                    end,
            Role1 = Role#role{m_pet = Mpet#m_pet{pets = Pets1}},
            divorce_unattach(Role1, T);
        {false, Msg} -> {false, Msg}
    end;
divorce_unattach(Role, [_H | T]) ->
    logger:debug("=====", [], child_spirit, 126),
    divorce_unattach(Role, T);
divorce_unattach(Role, []) ->
    logger:debug("=====", [], child_spirit, 129),
    pet_util:push_client_pets(Role),
    {ok, Role}.

follow_attach(Child = #child{id = ChildId, stage = 3},
              #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(ChildId, #pet.spirit_child_id, Pets)
        of
        #pet{} ->
            logger:debug("=====", [], child_spirit, 137),
            calc_skills(Child, Pets);
        _ -> Child#child{spirit_skills = [], spirit_info = []}
    end;
follow_attach(Child, _) -> Child.

calc(Ac = #attr_calc{},
     #child{id = Id, spirit_attached = SpiritAttached},
     #role{m_pet = #m_pet{pets = Pets}})
    when SpiritAttached =/= 0 ->
    do_calc(Pets, Id, Ac);
calc(Ac, _, _) -> Ac.

calc_skills(Child = #child{spirit_attached = 0},
            _Pets) ->
    Child#child{spirit_skills = [], spirit_info = []};
calc_skills(Child = #child{id = ChildId}, Pets) ->
    Skills = do_calc_skills(Pets, ChildId),
    Info = do_calc_info(Pets, ChildId),
    Child#child{spirit_skills = Skills, spirit_info = Info}.

do_attach(Role = #role{m_pet =
                           MPet = #m_pet{pets = Pets}},
          Child = #child{id = ChildId},
          SubPet = #pet{id = SubId}) ->
    SubPet1 = SubPet#pet{spirit_child_id = ChildId,
                         spirit_child_flag = 1},
    PetsFilter = case lists:keyfind(ChildId,
                                    #pet.spirit_child_id,
                                    Pets)
                     of
                     OldSub = #pet{id = OldSubId} ->
                         OldSub1 = OldSub#pet{spirit_child_id = {0, "", 0},
                                              spirit_child_flag = 0},
                         pet:push_10503(Role, OldSub1),
                         lists:keyreplace(OldSubId, #pet.id, Pets, OldSub1);
                     _ -> Pets
                 end,
    Pets1 = lists:keyreplace(SubId,
                             #pet.id,
                             PetsFilter,
                             SubPet1),
    Child1 = calc_skills(Child#child{spirit_attached = 1},
                         Pets1),
    Role1 = Role#role{m_pet = MPet#m_pet{pets = Pets1}},
    Child2 = child_attr:lev_change(Child1, Role1),
    Role2 = child:update_kids(Role1, Child2),
    child:update(Child2),
    child_rank:in(Child2),
    Role3 = child_util:evt_child(Role2, Child2),
    child_util:push(Role3, 18603, Child2),
    child_util:push(Role3, 18604, Child2),
    child_util:push(Role3, 18605, Child2),
    child_util:push(Role3, 18606, Child2),
    child_util:push(Role3, 18607, Child2),
    pet:push_10503(Role3, SubPet1),
    {ok, lang:get("成功附灵"), Role3}.

do_unattach(Role = #role{m_pet =
                             Mpet = #m_pet{pets = Pets},
                         m_child = #m_child{kids = Kids}},
            SubPet = #pet{spirit_child_id = ChildId, id = SubId}) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        Child = #child{} ->
            SubPet1 = SubPet#pet{spirit_child_id = {0, "", 0},
                                 spirit_child_flag = 0},
            Pets1 = lists:keyreplace(SubId, #pet.id, Pets, SubPet1),
            Child1 = case lists:keyfind(ChildId,
                                        #pet.spirit_child_id,
                                        Pets1)
                         of
                         #pet{} -> calc_skills(Child, Pets1);
                         _ ->
                             Child#child{spirit_attached = 0,
                                         spirit_skills = [], spirit_info = []}
                     end,
            Role1 = Role#role{m_pet = Mpet#m_pet{pets = Pets1}},
            Child2 = child_attr:lev_change(Child1, Role1),
            Role2 = child:update_kids(Role1, Child2),
            child:update(Child2),
            child_rank:in(Child2),
            Role3 = child_util:evt_child(Role2, Child2),
            child_util:push(Role3, 18603, Child2),
            child_util:push(Role3, 18604, Child2),
            child_util:push(Role3, 18605, Child2),
            child_util:push(Role3, 18606, Child2),
            child_util:push(Role3, 18607, Child2),
            pet:push_10503(Role3, SubPet1),
            {ok, lang:get("取消附灵成功"), Role3};
        _ ->
            SubPet1 = SubPet#pet{spirit_child_id = {0, "", 0},
                                 spirit_child_flag = 0},
            Pets1 = lists:keyreplace(SubId, #pet.id, Pets, SubPet1),
            Role1 = Role#role{m_pet = Mpet#m_pet{pets = Pets1}},
            pet:push_10503(Role1, SubPet1),
            {ok, lang:get("取消附灵成功"), Role1}
    end.

do_calc([], _, Ac) -> Ac;
do_calc([#pet{spirit_child_flag = 1, lev = Lev,
              talent = Talent, base_id = BaseId, spirit_child_id = Id}
         | T],
        Id, Ac) ->
    case pet_data:get_attach_child_ratio(BaseId, Talent) of
        {Ratio, _} when Ratio > 0 ->
            case pet_data:get_attach_child_attr(Lev) of
                #{hp_max := HpMax, mp_max := MpMax, phy_dmg := PhyDmg,
                  magic_dmg := MagicDmg, phy_def := PhyDef,
                  magic_def := MagicDef, atk_speed := AtkSpeed} ->
                    L1 = [{1, HpMax},
                          {2, MpMax},
                          {4, PhyDmg},
                          {5, MagicDmg},
                          {6, PhyDef},
                          {7, MagicDef},
                          {3, AtkSpeed}],
                    L2 = [{K, round(V * Ratio / 1000)}
                          || {K, V} <- L1, V > 0],
                    Attr = attr_type:to_attr(fixed, L2),
                    case attr_type:do_attr(Attr, Ac) of
                        {false, Reason} ->
                            logger:error("附灵属性计算失败:~w",
                                         [Reason],
                                         child_spirit,
                                         270),
                            do_calc(T, Id, Ac);
                        {ok, NewAc} -> do_calc(T, Id, NewAc)
                    end;
                Else ->
                    logger:error("附灵属性获取失败:~w", [Else], child_spirit, 276),
                    do_calc(T, Id, Ac)
            end;
        Else ->
            logger:error("附灵属性获取失败:~w", [Else], child_spirit, 280),
            do_calc(T, Id, Ac)
    end;
do_calc([_ | T], Id, Ac) -> do_calc(T, Id, Ac).

do_calc_skills([], _) -> [];
do_calc_skills([#pet{spirit_child_flag = 1,
                     base_id = BaseId, talent = Talent, spirit_child_id = Id}
                | T],
               Id) ->
    case pet_data:get_attach_child_ratio(BaseId, Talent) of
        {_, Ss = [_ | _]} -> Ss ++ do_calc_skills(T, Id);
        _ -> do_calc_skills(T, Id)
    end;
do_calc_skills([_ | T], Id) -> do_calc_skills(T, Id).

do_calc_info([], _) -> [];
do_calc_info([#pet{spirit_child_flag = 1,
                   base_id = BaseId, talent = Talent, lev = Lev,
                   spirit_child_id = Id}
              | T],
             Id) ->
    [{BaseId, Talent, Lev} | do_calc_info(T, Id)];
do_calc_info([_ | T], Id) -> do_calc_info(T, Id).

