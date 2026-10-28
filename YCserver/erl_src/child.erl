-file("src/mod/child/child.erl", 1).

-module(child).

-behaviour(gen_server).

-export([start_link/0,
         init/0,
         login/1,
         logout/1,
         fetch/1,
         get_custody/1,
         role_list/1,
         family_list/1,
         fertilize/2,
         intake_tonic/2,
         fetus_grow/2,
         fetus_grow/3,
         deliver/1,
         rename/3,
         abandon/2,
         reply_abandon/2,
         divorce/2,
         wed/2,
         can_fertilize/1,
         is_pregnant/1,
         role_callback/2,
         update/1,
         update_kids/2,
         apply/2,
         apply_evt/2,
         follow/2,
         unfollow/2,
         parent_rename/1,
         set_hungry_notice_lev/3,
         gm_custody/2,
         gm_custody/3]).

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

-file("src/mod/child/child.erl", 45).

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

-file("src/mod/child/child.erl", 46).

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

-file("src/mod/child/child.erl", 47).

-file("inc/wedding.hrl", 1).

-record(m_wedding,
        {ver = 1,
         lover_id = {0, "", 0},
         lover_name = "",
         status = 0,
         honor_ids = [],
         reward = [],
         mail = []}).

-record(lover,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         lover_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         lover_name = "" :: bitstring(),
         type = 1 :: 1..2,
         status = 1 :: 0..2,
         ring_lev = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         order_index = 0 :: non_neg_integer(),
         order_time = 0 :: non_neg_integer(),
         atmosp = 0 :: non_neg_integer(),
         index = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lover_sex = 2 :: 0..2,
         lover_classes = 0,
         lover_lev = 0,
         lover_fc = 0,
         lover_pet_fc = 0,
         lover_face = 0}).

-record(guest,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid = 0 :: 0 | pid(),
         act_list = [],
         unit_list = [],
         classes = 0,
         sex = 0,
         lev = 0,
         face = 0}).

-record(wedding_atmosp_data,
        {type = 0 :: non_neg_integer(),
         min_val = 0 :: non_neg_integer(),
         max_val = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         scene_reward = [] :: list(),
         scene_msg = "" :: string(),
         male_reward = [] :: list(),
         famale_reward = [] :: list(),
         title = "" :: string(),
         content = "" :: string()}).

-record(wedding_act_data,
        {id = 0,
         type = 0,
         target = 1,
         free_num = 0,
         max_num = 0,
         cost = [],
         msg = "",
         log_msg = "",
         atmosp = 0,
         gain = [],
         main_gain = [],
         effect_type = 0,
         effect_id = 1,
         effect_num = 1,
         cd = 0}).

-record(wedding_rank, {type = 0, list = []}).

-record(wedding_rank_rc,
        {id = {{0, "", 0}, {0, "", 0}},
         male_id = {0, "", 0},
         male_name = "",
         rank = 1,
         time = 0 :: non_neg_integer(),
         male_sex = 0 :: 0..2,
         male_classes = 0 :: 0..4,
         male_lev = 0 :: non_neg_integer(),
         female_id = {0, "", 0},
         female_name = "",
         female_sex = 0 :: 0..2,
         female_classes = 0 :: 0..4,
         female_lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(wedding_rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys =
             [#wedding_rank_rc.val3,
              #wedding_rank_rc.val2,
              #wedding_rank_rc.val1]
             :: [pos_integer()],
         min_val = 1 :: pos_integer()}).

-record(wedding_unit_data,
        {id = 0, target = 0, rand = [], limit = 0}).

-record(wedding_rank_honor_data,
        {type = 0,
         rank = 0,
         male_honor = 0,
         female_honor = 0,
         reward = [],
         title = "",
         content = ""}).

-record(wedding_rank_honor_type_data,
        {type = 0, day = day}).

-file("src/mod/child/child.erl", 48).

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

-file("src/mod/child/child.erl", 49).

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

-file("src/mod/child/child.erl", 50).

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

-file("src/mod/child/child.erl", 51).

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

-file("src/mod/child/child.erl", 52).

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

-file("src/mod/child/child.erl", 53).

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

-file("src/mod/child/child.erl", 54).

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

-file("src/mod/child/child.erl", 55).

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

-file("src/mod/child/child.erl", 56).

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

-file("src/mod/child/child.erl", 57).

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

-file("src/mod/child/child.erl", 58).

-record(state, {}).

init() -> #m_child{}.

login(Role = #role{id = Rid, m_child = MC}) ->
    TL = [#trigger{label = evt_child_combat, a = [],
                   m = child, f = apply_evt},
          #trigger{label = evt_commit_quest, a = [], m = child,
                   f = apply_evt},
          #trigger{label = evt_levup, a = [], m = child,
                   f = apply_evt},
          #trigger{label = evt_use_item, a = [], m = child,
                   f = apply_evt}],
    {Kids, CoupleIds} = do_login(role_list(Rid), Role),
    case CoupleIds of
        [] -> ok;
        _ ->
            gen_server:call(child, {add_follow, Rid, CoupleIds})
    end,
    Kids1 = do_add_kids(CoupleIds, Kids, Role),
    NewKids = child_util:update_parent(Kids1,
                                       to_parent(Role)),
    Role1 = Role#role{m_child = MC#m_child{kids = NewKids}},
    Role2 = child_skin:check_expire_time(Role1),
    Role3 = child_attr:batch_calc(Role2),
    {_, TrgRole} = role_trigger:add(TL, Role3),
    NewRole = update_buff(TrgRole, no_push),
    child_rank:best_in(NewKids),
    {ok, NewRole}.

logout(#role{m_child = #m_child{kids = Kids},
             id = Rid}) ->
    case [Id
          || #child{custody = Custody, id = Id, follow = Follow}
                 <- Kids,
             Follow =:= Rid andalso Custody =/= Rid]
        of
        [] -> ok;
        Offlines -> child ! {logout, Rid, Offlines}
    end,
    ok.

parent_rename(Role = #role{m_child =
                               MC = #m_child{kids = Kids}}) ->
    NewKids = child_util:update_parent(Kids,
                                       to_parent(Role)),
    Role#role{m_child = MC#m_child{kids = NewKids}}.

set_hungry_notice_lev(Role = #role{m_child =
                                       MChild = #m_child{hungry_notice_lev =
                                                             HNLev}},
                      ChildId, Lev) ->
    NewHNLev = lists:keystore(ChildId,
                              1,
                              HNLev,
                              {ChildId, Lev}),
    NewRole = Role#role{m_child =
                            MChild#m_child{hungry_notice_lev = NewHNLev}},
    {ok, NewRole}.

role_list(Rid) ->
    L1 = ets:lookup(child_index, Rid),
    L2 = case wedding:lover(Rid) of
             {ok, #lover{status = 3, lover_id = LoverId}} ->
                 ets:lookup(child_index, get_custody(Rid, LoverId)) ++
                     L1;
             _ -> L1
         end,
    do_list(L2).

family_list(Rid) ->
    L1 = ets:lookup(child_index, Rid),
    L2 = case wedding:lover(Rid) of
             {ok, #lover{status = 3, lover_id = LoverId}} ->
                 ets:lookup(child_index, get_custody(Rid, LoverId)) ++
                     L1;
             _ -> L1
         end,
    do_family_list(L2).

fetch(ChildId) -> ets:lookup(child, ChildId).

fertilize(Role = #role{m_child =
                           MC = #m_child{fertility = Fer, tonic = Tonic,
                                         kids = Kids}},
          Val) ->
    case can_fertilize(Role) of
        true ->
            Bingo = case child_data:get_pregnant_rate(Fer + Tonic +
                                                          Val)
                             >= util:rand(1, 100)
                        of
                        true -> true;
                        _ ->
                            round((Fer + Tonic + Val) / 100) >=
                                util:rand(1, 100)
                    end,
            case Bingo of
                true ->
                    Parents = get_parents(Role),
                    case do_fertilize(Parents) of
                        {ok, Child = #child{id = Id}} ->
                            NewKids = [Child | Kids],
                            NewMC = MC#m_child{fertility = 0, tonic = 0,
                                               kids = NewKids},
                            update(Child),
                            NewRole = update_buff(Role#role{m_child = NewMC},
                                                  push),
                            child_util:push(NewRole, 18601, Child),
                            log:child(NewRole, "受孕", [], Child),
                            {ok, Id, NewRole};
                        {ok, Id} ->
                            {NewKids, NewChild} = case fetch(Id) of
                                                      [Child = #child{}] ->
                                                          {[Child | Kids],
                                                           Child};
                                                      _ -> {Kids, false}
                                                  end,
                            NewMC = MC#m_child{fertility = 0, tonic = 0,
                                               kids = NewKids},
                            NewRole = update_buff(Role#role{m_child = NewMC},
                                                  push),
                            child_util:push(NewRole, 18601, NewChild),
                            apply_lover(NewRole, {fertility, Id}),
                            {ok, Id, NewRole};
                        _ ->
                            NewMC = MC#m_child{fertility = Fer + Tonic + Val,
                                               tonic = 0},
                            {ok, 0, Role#role{m_child = NewMC}}
                    end;
                _ ->
                    NewMC = MC#m_child{fertility = Fer + Tonic + Val,
                                       tonic = 0},
                    {ok, 0, Role#role{m_child = NewMC}}
            end;
        Else -> Else
    end.

intake_tonic(Role = #role{m_child =
                              MC = #m_child{tonic = Tonic}},
             Val) ->
    NewMC = MC#m_child{tonic = Tonic + Val},
    {ok, Role#role{m_child = NewMC}}.

abandon(Role = #role{m_child =
                         MC = #m_child{kids = Kids},
                     id = Id},
        ChildId) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        #child{spirit_attached = 1} ->
            {false, lang:get("孩子还在附灵中，请先卸下附灵宠后再托管")};
        Child = #child{custody = Id, name = CName} ->
            delete(Child),
            child_util:family_delete(Child),
            NewKids = lists:keydelete(ChildId, #child.id, Kids),
            NewMC = MC#m_child{kids = NewKids},
            child_util:push(Role, 18602, {[ChildId]}),
            log:child(Role, "抛弃", Child, []),
            Msg = notice:format(lang:get("~ts已成功托管"),
                                [{role_2, CName}]),
            {ok,
             update_buff(Role#role{m_child = NewMC}, push),
             Msg};
        Child = #child{name = ChildName} ->
            case check_abandon([spirit, team], Role, ChildId) of
                {ok, LoverId} ->
                    case role:apply(sync,
                                    LoverId,
                                    {child,
                                     role_callback,
                                     [{abandon_request,
                                       Id,
                                       ChildId,
                                       ChildName}]})
                        of
                        ok -> {wait, lang:get("孩子是夫妻关系枢纽，等待下另一半的决定吧")};
                        divorce ->
                            delete(Child),
                            NewKids = lists:keydelete(ChildId, #child.id, Kids),
                            NewMC = MC#m_child{kids = NewKids},
                            child_util:push(Role, 18602, {[ChildId]}),
                            Msg = notice:format(lang:get("~ts已成功托管"),
                                                [{role_2, ChildName}]),
                            {ok,
                             update_buff(Role#role{m_child = NewMC}, push),
                             Msg};
                        Else -> Else
                    end;
                divorce ->
                    delete(Child),
                    NewKids = lists:keydelete(ChildId, #child.id, Kids),
                    NewMC = MC#m_child{kids = NewKids},
                    child_util:push(Role, 18602, {[ChildId]}),
                    Msg = notice:format(lang:get("~ts已成功托管"),
                                        [{role_2, ChildName}]),
                    {ok,
                     update_buff(Role#role{m_child = NewMC}, push),
                     Msg};
                Fail -> Fail
            end;
        _ -> {false, lang:get("找不到指定孩子")}
    end.

reply_abandon(Role = #role{m_child =
                               MC = #m_child{kids = Kids},
                           m_wedding = #m_wedding{lover_id = LoverId}, id = Rid,
                           name = Name},
              Decision) ->
    case erlang:get(child_abondon_request) of
        {LoverId, ChildId, ChildName} when Decision =:= 1 ->
            child ! {abandon, Rid, ChildId},
            NewKids = lists:keydelete(ChildId, #child.id, Kids),
            NewMC = MC#m_child{kids = NewKids},
            role:apply(async,
                       LoverId,
                       {child, role_callback, [{abandon, ChildId}]}),
            child_util:push(Role, 18602, {[ChildId]}),
            Msg = notice:format(lang:get("~ts已成功托管"),
                                [{role_2, ChildName}]),
            {ok,
             update_buff(Role#role{m_child = NewMC}, push),
             Msg};
        {LoverId, _, ChildName} ->
            erlang:erase(child_abondon_request),
            Msg = notice:format(lang:get("你已拒绝托管~ts"),
                                [{role_2, ChildName}]),
            Msg2 = notice:format(lang:get("~ts拒绝托管~ts"),
                                 [{role_2, Name}, {role_2, ChildName}]),
            notice:send(LoverId, 3, Msg2),
            {ok, Msg};
        _ -> {false, lang:get("没有收到托管孩子的请求哦")}
    end.

divorce(Role = #role{m_child =
                         MC = #m_child{kids = OldKids},
                     id = Id},
        LoverId) ->
    Custody = get_custody(Id, LoverId),
    gen_server:call(child, {divorce, Custody}),
    Kids = role_list(Id),
    role:apply(async,
               LoverId,
               {child, role_callback, [divorce]}),
    NRole = case length(Kids) < length(OldKids) of
                true ->
                    Fun = fun (#child{id = KidId}, Temp) ->
                                  lists:keydelete(KidId, #child.id, Temp)
                          end,
                    LostKids = lists:foldl(Fun, OldKids, Kids),
                    logger:debug("~w", [LostKids], child, 297),
                    case child_spirit:divorce_unattach(Role, LostKids) of
                        {ok, _Role} -> _Role;
                        {false, _} ->
                            Msg =
                                lang:get("亲爱的玩家，因离婚解除子女附灵时您的宠物格子已满，现您可前往附灵宠物页签自行解除子女附灵{"
                                         "panel_2, 10500, 5, 点击前往}"),
                            mail:send(Id, lang:get("孩子附灵提示"), Msg),
                            Role
                    end;
                false -> Role
            end,
    Role1 = NRole#role{m_child = MC#m_child{kids = Kids}},
    child_util:push(Role1, 18600),
    update_buff(Role1, push).

wed(Id, LoverId) ->
    Couple = [Id, LoverId],
    gen_server:call(child, {wed, Couple}),
    role:apply(async, Id, {child, role_callback, [wed]}),
    role:apply(async,
               LoverId,
               {child, role_callback, [wed]}),
    ok.

can_fertilize(#role{m_child = #m_child{kids = Kids},
                    id = Rid}) ->
    Limit = case wedding:lover(Rid) of
                {ok, #lover{status = 3}} -> 4;
                _ -> 3
            end,
    case length(Kids) >= Limit of
        true ->
            {false,
             notice:format(lang:get("最多只能孕育~ts个孩子哦"),
                           [{string_2, 1, Limit}])};
        _ -> can_fertilize(Kids)
    end;
can_fertilize(Kids) ->
    case lists:keyfind(1, #child.stage, Kids) =/= false
             orelse lists:keyfind(2, #child.stage, Kids) =/= false
        of
        true -> {false, lang:get("当前还有娃在培育呢")};
        _ -> true
    end.

is_pregnant(#role{m_child = #m_child{kids = Kids}}) ->
    case lists:keyfind(1, #child.stage, Kids) of
        #child{embryo = Embryo} -> {true, Embryo};
        _ -> {false, lang:get("当前还没怀上")}
    end.

fetus_grow(Role, Val) -> fetus_grow(Role, Val, 10001).

fetus_grow(Role = #role{m_child =
                            MC = #m_child{kids = Kids},
                        id = Id},
           Val, {item, BaseId}) ->
    case lists:keyfind(1, #child.stage, Kids) of
        Child = #child{id = ChildId, embryo = 1} ->
            case check_fetus_grow(Child, 10002) of
                {ok, Child1} ->
                    case do_fetus_grow(Child1, Val) of
                        {ok, NewChild = #child{}} ->
                            update(NewChild),
                            NewKids = lists:keyreplace(ChildId,
                                                       #child.id,
                                                       Kids,
                                                       NewChild),
                            NewMC = MC#m_child{kids = NewKids},
                            NewRole = Role#role{m_child = NewMC},
                            child_util:push(NewRole, 18601, NewChild),
                            log:child(NewRole, "增加孕育值", Child, NewChild),
                            {ok, NewRole};
                        Else -> Else
                    end;
                {max, Max} ->
                    {false,
                     notice:format(lang:get("每天只能服用~ts个~ts哟{face_1,2}"),
                                   [{string_2, 5, Max}, {item_2, BaseId}])};
                _ -> {false, lang:get("不能使用")}
            end;
        #child{id = ChildId} ->
            case gen_server:call(child,
                                 {item_fetus_grow, Id, ChildId, Val, BaseId})
                of
                ok ->
                    {NewKids, NewChild} = case fetch(ChildId) of
                                              [Child = #child{} | _] ->
                                                  {lists:keyreplace(ChildId,
                                                                    #child.id,
                                                                    Kids,
                                                                    Child),
                                                   Child};
                                              _ -> {Kids, false}
                                          end,
                    NewMC = MC#m_child{kids = NewKids},
                    NewRole = Role#role{m_child = NewMC},
                    child_util:push(NewRole, 18601, NewChild),
                    apply_lover(NewRole, {fetus_grow, ChildId}),
                    {ok, NewRole};
                Else -> Else
            end;
        _ -> {false, lang:get("当前没有怀上孩子哦")}
    end;
fetus_grow(Role = #role{m_child =
                            MC = #m_child{kids = Kids},
                        id = Id},
           Val, Type) ->
    case lists:keyfind(1, #child.stage, Kids) of
        Child = #child{id = ChildId, embryo = 1} ->
            case check_fetus_grow(Child, Type) of
                {ok, Child1} ->
                    case do_fetus_grow(Child1, Val) of
                        {ok, NewChild = #child{}} ->
                            update(NewChild),
                            NewKids = lists:keyreplace(ChildId,
                                                       #child.id,
                                                       Kids,
                                                       NewChild),
                            NewMC = MC#m_child{kids = NewKids},
                            NewRole = Role#role{m_child = NewMC},
                            child_util:push(NewRole, 18601, NewChild),
                            log:child(NewRole, "增加孕育值", Child, NewChild),
                            {ok, NewRole};
                        Else -> Else
                    end;
                {max, Max} ->
                    {false,
                     notice:format(lang:get("每天只能加 ~ts"),
                                   [{string_2, 5, Max}])};
                _ -> {false, lang:get("不能增加的类型")}
            end;
        #child{id = ChildId} ->
            case gen_server:call(child,
                                 {fetus_grow, Id, ChildId, Val, Type})
                of
                ok ->
                    {NewKids, NewChild} = case fetch(ChildId) of
                                              [Child = #child{} | _] ->
                                                  {lists:keyreplace(ChildId,
                                                                    #child.id,
                                                                    Kids,
                                                                    Child),
                                                   Child};
                                              _ -> {Kids, false}
                                          end,
                    NewMC = MC#m_child{kids = NewKids},
                    NewRole = Role#role{m_child = NewMC},
                    child_util:push(NewRole, 18601, NewChild),
                    apply_lover(NewRole, {fetus_grow, ChildId}),
                    {ok, NewRole};
                Else -> Else
            end;
        _ -> {false, lang:get("当前没有怀上孩子哦")}
    end.

deliver(Role = #role{m_child =
                         #m_child{kids = Kids}}) ->
    case lists:keyfind(1, #child.stage, Kids) of
        Child = #child{stage = Stage, maturity = Maturity} ->
            case child_data:get_stage(Stage) of
                #{max_maturity := Max} when Max > Maturity ->
                    {false, lang:get("胎儿现在还没发育成熟呢")};
                _ -> do_deliver(Role, Child)
            end;
        _ -> {false, lang:get("没有怀上")}
    end.

rename(Role = #role{m_child = #m_child{kids = Kids}},
       ChildId, NewName) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        #child{stage = 1} ->
            {false, lang:get("请待孩子出生并选择职业后再改名吧{face_1,3}")};
        #child{classes = 0} ->
            {false, lang:get("请选择职业后再改名吧{face_1,3}")};
        Child = #child{name_changed = Changed} ->
            case util:check_name(NewName) of
                ok ->
                    do_rename(rename_loss(Role, Changed), Child, NewName);
                Else -> Else
            end;
        _ -> {false, lang:get("找不到孩子")}
    end.

follow(Role = #role{id = RoleId,
                    m_child = #m_child{kids = Kids}},
       ChildId) ->
    Len = length([1
                  || #child{status = 1, follow = Fid} <- Kids,
                     Fid =:= RoleId]),
    case Len >= 2 of
        true -> {false, lang:get("最多同时携带两名孩子喔")};
        false ->
            case lists:keyfind(ChildId, #child.id, Kids) of
                #child{status = 1, follow = RoleId} ->
                    {false, lang:get("已经在携带中")};
                #child{} ->
                    case case catch gen_server:call(child,
                                                    {follow, RoleId, ChildId},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        {false, Reason} -> {false, Reason};
                        true ->
                            case fetch(ChildId) of
                                [Child = #child{status = 1, follow = RoleId}] ->
                                    NChild = child_spirit:follow_attach(Child,
                                                                        Role),
                                    Child1 = child_attr:lev_change(NChild,
                                                                   Role),
                                    NewRole = update_kids(Role, Child1),
                                    child:update(Child1),
                                    child_rank:in(Child1),
                                    NewRole1 = child_util:evt_child(NewRole,
                                                                    Child1),
                                    Child2 = child_attr:calc(Child1, NewRole1),
                                    child_util:push(NewRole, 18603, Child2),
                                    child_util:push(NewRole, 18604, Child2),
                                    child_util:push(NewRole, 18605, Child2),
                                    child_util:push(NewRole, 18606, Child2),
                                    child_util:push(NewRole, 18607, Child2),
                                    child_util:notice_code(RoleId,
                                                           Child2,
                                                           18603,
                                                           {[Child2]}),
                                    child_util:notice_code(RoleId,
                                                           Child2,
                                                           18604,
                                                           {[Child2]}),
                                    child_util:notice_code(RoleId,
                                                           Child2,
                                                           18605,
                                                           {[Child2]}),
                                    child_util:notice_code(RoleId,
                                                           Child2,
                                                           18606,
                                                           {[Child2]}),
                                    child_util:notice_code(RoleId,
                                                           Child2,
                                                           18607,
                                                           {[Child2]}),
                                    child_util:notice_update(RoleId, Child2),
                                    {ok, NewRole1};
                                [Child = #child{}] ->
                                    NewRole = update_kids(Role, Child),
                                    NewChild = child_attr:calc(Child, NewRole),
                                    child_util:push(NewRole, 18603, NewChild),
                                    child_util:push(NewRole, 18604, NewChild),
                                    child_util:push(NewRole, 18605, NewChild),
                                    child_util:push(NewRole, 18606, NewChild),
                                    child_util:push(NewRole, 18607, NewChild),
                                    child_util:notice_code(RoleId,
                                                           NewChild,
                                                           18603,
                                                           {[NewChild]}),
                                    child_util:notice_code(RoleId,
                                                           NewChild,
                                                           18604,
                                                           {[NewChild]}),
                                    child_util:notice_code(RoleId,
                                                           NewChild,
                                                           18605,
                                                           {[NewChild]}),
                                    child_util:notice_code(RoleId,
                                                           NewChild,
                                                           18606,
                                                           {[NewChild]}),
                                    child_util:notice_code(RoleId,
                                                           NewChild,
                                                           18607,
                                                           {[NewChild]}),
                                    child_util:notice_update(RoleId, NewChild),
                                    {ok, NewRole};
                                _ -> {false, lang:get("系统繁忙，无法更新")}
                            end;
                        _ -> {false, lang:get("系统繁忙，无法携带")}
                    end;
                _ -> {false, lang:get("找不到孩子")}
            end
    end.

unfollow(#role{m_combat = #m_combat{pid = Pid}},
         _ChildId)
    when is_pid(Pid) ->
    {false, lang:get("战斗中不能进行此操作")};
unfollow(Role = #role{id = RoleId,
                      m_child = #m_child{kids = Kids}},
         ChildId) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        #child{status = 1, follow = RoleId} ->
            case case catch gen_server:call(child,
                                            {unfollow, RoleId, ChildId},
                                            10000)
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                {false, Reason} -> {false, Reason};
                true ->
                    case fetch(ChildId) of
                        [Child = #child{}] ->
                            NewRole = update_kids(Role, Child),
                            child_util:push(NewRole, 18606, Child),
                            {ok, NewRole};
                        _ -> {false, lang:get("系统繁忙，无法更新")}
                    end;
                _ -> {false, lang:get("系统繁忙，无法取消携带")}
            end;
        #child{} -> {false, lang:get("没有找到您携带的孩子")};
        _ -> {false, lang:get("找不到孩子")}
    end.

gm_custody(ChildId, From) ->
    case fetch(ChildId) of
        [C = #child{custody = From, name = Name,
                    parents = Parents}] ->
            case lists:keytake(From, #child_parent.id, Parents) of
                {value,
                 #child_parent{name = FromName},
                 [#child_parent{id = To, name = ToName}]} ->
                    C1 = C#child{custody = To, follow = {0, "", 0},
                                 status = 0},
                    ets:match_delete(child_index, {From, ChildId}),
                    update(C1),
                    role:apply(async,
                               From,
                               {child, role_callback, [refresh]}),
                    role:apply(async,
                               To,
                               {child, role_callback, [refresh]}),
                    logger:info("孩子~w[~ts] 监护由~w[~ts]转到~w[~ts]",
                                [ChildId, Name, From, FromName, To, ToName],
                                child,
                                564);
                _ -> ok
            end,
            ok;
        _ -> ok
    end.

gm_custody(ChildId, From, ToId) ->
    case fetch(ChildId) of
        [C = #child{custody = From, name = Name,
                    parents = Parents}] ->
            case lists:keytake(ToId, #child_parent.id, Parents) of
                {value,
                 #child_parent{id = To, name = FromName},
                 [#child_parent{name = FromName2}]} ->
                    C1 = C#child{custody = To, follow = {0, "", 0},
                                 status = 0},
                    ets:match_delete(child_index, {From, ChildId}),
                    update(C1),
                    role:apply(async,
                               From,
                               {child, role_callback, [refresh]}),
                    role:apply(async,
                               To,
                               {child, role_callback, [refresh]}),
                    logger:info("孩子~w[~ts] 监护由~w[~ts],[~ts]转到~w[~ts]",
                                [ChildId,
                                 Name,
                                 From,
                                 FromName,
                                 FromName2,
                                 To,
                                 FromName],
                                child,
                                580);
                _ -> ok
            end,
            ok;
        _ -> ok
    end.

role_callback(Role = #role{m_wedding =
                               #m_wedding{lover_id = LoverId, status = 3}},
              {abandon_request, LoverId, ChildId, ChildName}) ->
    erlang:put(child_abondon_request,
               {LoverId, ChildId, ChildName}),
    child_util:push(Role, 18631, {ChildId, ChildName}),
    {ok, ok};
role_callback(_, {abandon_request, _, _, _}) ->
    {ok, divorce};
role_callback(Role = #role{m_child =
                               MC = #m_child{kids = Kids}},
              {abandon, ChildId}) ->
    NewKids = lists:keydelete(ChildId, #child.id, Kids),
    NewMC = MC#m_child{kids = NewKids},
    child_util:push(Role, 18602, {[ChildId]}),
    {ok, Role#role{m_child = NewMC}};
role_callback(Role = #role{m_child =
                               MC = #m_child{kids = OldKids},
                           id = Id},
              divorce) ->
    Kids = role_list(Id),
    NRole = case length(Kids) < length(OldKids) of
                true ->
                    Fun = fun (#child{id = KidId}, Temp) ->
                                  lists:keydelete(KidId, #child.id, Temp)
                          end,
                    LostKids = lists:foldl(Fun, OldKids, Kids),
                    logger:debug("~w", [LostKids], child, 612),
                    case child_spirit:divorce_unattach(Role, LostKids) of
                        {ok, _Role} -> _Role;
                        {false, _} ->
                            Msg =
                                lang:get("亲爱的玩家，因离婚解除子女附灵时您的宠物格子已满，现您可前往附灵宠物页签自行解除子女附灵{"
                                         "panel_2, 10500, 5, 点击前往}"),
                            mail:send(Id, lang:get("孩子附灵提示"), Msg),
                            Role
                    end;
                false -> Role
            end,
    NewMC = MC#m_child{kids = Kids},
    Role1 = NRole#role{m_child = NewMC},
    child_util:push(Role1, 18600),
    {ok, update_buff(Role1, push)};
role_callback(Role = #role{m_child = MC, id = Id},
              wed) ->
    Kids = role_list(Id),
    NewMC = MC#m_child{kids = Kids},
    Role1 = Role#role{m_child = NewMC},
    child_util:push(Role1, 18600),
    {ok, Role1};
role_callback(Role = #role{m_child = MC, id = Id},
              refresh) ->
    Kids = role_list(Id),
    NewMC = MC#m_child{kids = Kids},
    Role1 = Role#role{m_child = NewMC},
    child_util:push(Role1, 18600),
    {ok, Role1};
role_callback(Role = #role{m_child =
                               MC = #m_child{kids = Kids}},
              {fertility, ChildId}) ->
    case fetch(ChildId) of
        [Child = #child{embryo = 2}] ->
            NewMC = MC#m_child{kids =
                                   lists:keystore(ChildId,
                                                  #child.id,
                                                  Kids,
                                                  Child)},
            Role1 = update_buff(Role#role{m_child = NewMC}, push),
            child_util:push(Role1, 18601, Child),
            {ok, Role1};
        _ -> ok
    end;
role_callback(Role = #role{m_child =
                               MC = #m_child{kids = Kids}},
              {fetus_grow, ChildId}) ->
    case fetch(ChildId) of
        [Child = #child{embryo = 2}] ->
            NewMC = MC#m_child{kids =
                                   lists:keystore(ChildId,
                                                  #child.id,
                                                  Kids,
                                                  Child)},
            Role1 = Role#role{m_child = NewMC},
            child_util:push(Role1, 18601, Child),
            {ok, Role1};
        _ -> ok
    end;
role_callback(Role = #role{m_child =
                               MC = #m_child{kids = Kids}},
              {deliver, ChildId}) ->
    case fetch(ChildId) of
        [Child = #child{embryo = 2}] ->
            NewMC = MC#m_child{kids =
                                   lists:keystore(ChildId,
                                                  #child.id,
                                                  Kids,
                                                  Child)},
            Role1 = update_buff(Role#role{m_child = NewMC}, push),
            Role2 = role_trigger:fire(#evt_child_deliver{}, Role1),
            child_util:push(Role2, 18601, Child),
            {ok, Role2};
        _ -> ok
    end;
role_callback(#role{name = Name}, _Info) ->
    logger:error("[~ts]被无效调用 ~w",
                 [Name, _Info],
                 child,
                 685),
    ok.

apply_evt(#evt_child_combat{combat_type = CombatType,
                            is_win = 1},
          Role) ->
    case child_data:get_combat_maturity(CombatType) of
        false -> ok;
        {Val, Ratio, _Times} when is_integer(Val) ->
            case util:rand(0, 1000) < Ratio of
                true -> fetus_combat_grow(Role, Val, CombatType);
                false -> ok
            end;
        _ -> ok
    end;
apply_evt(#evt_levup{},
          Role = #role{m_child = MC = #m_child{kids = Kids}}) ->
    NewKids = child_util:update_parent(Kids,
                                       to_parent(Role)),
    NewRole = child_attr:batch_calc(Role#role{m_child =
                                                  MC#m_child{kids = NewKids}}),
    {ok, NewRole};
apply_evt(#evt_commit_quest{sec_type = QuestType},
          Role) ->
    logger:debug("收到任务的监听=========收到任务的监听=========收到任务的监听======"
                 "===收到任务的监听=========",
                 [],
                 child,
                 705),
    CombatType = case QuestType of
                     3 -> 10000;
                     _ -> false
                 end,
    case CombatType =/= false of
        true ->
            case child_data:get_combat_maturity(CombatType) of
                false -> ok;
                {Val, Ratio, _Times} when is_integer(Val) ->
                    case util:rand(0, 1000) < Ratio of
                        true -> fetus_combat_grow(Role, Val, CombatType);
                        false -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end;
apply_evt(_, _Role) -> ok.

apply(async, {M, F, A}) ->
    child ! {apply_async, {M, F, A}},
    ok;
apply(sync, {M, F, A}) ->
    case catch gen_server:call(child,
                               {apply_sync, {M, F, A}},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, child}, child, [], []).

init([]) ->
    logger:info("开始启动...", [], child, 745),
    case env:get(child_id) of
        RecId when is_integer(RecId) -> ok;
        _ -> env:save(child_id, 1)
    end,
    dets:open_file(child,
                   [{file, "./dets/child.dets"},
                    {keypos, #child.id},
                    {type, set}]),
    ets:new(child,
            [set, named_table, public, {keypos, #child.id}]),
    ets:new(child_index,
            [bag, named_table, public, {keypos, 1}]),
    child_rank:init(),
    case load_data() of
        [] ->
            State = #state{},
            logger:info("启动完成", [], child, 759),
            {ok, State};
        _Err ->
            logger:error("子女数据文件载入失败:~w", [_Err], child, 762),
            {stop, data_load_err}
    end.

handle_call({implant, []}, _From, State) ->
    {reply, false, State};
handle_call({implant, Parents}, _From, State) ->
    Reply = case do_implant(Parents) of
                {ok, Child = #child{id = Id}} ->
                    update(Child),
                    case Parents of
                        [_, #child_parent{id = ParentId}] ->
                            log:child(ParentId, Child, "受孕", [], Child);
                        [#child_parent{id = ParentId}] ->
                            log:child(ParentId, Child, "受孕", [], Child);
                        _ -> ok
                    end,
                    {ok, Id};
                Else -> Else
            end,
    {reply, Reply, State};
handle_call({deliver, Rid, ChildId}, _From, State) ->
    Reply = case fetch(ChildId) of
                [Child = #child{stage = 1, embryo = 2}] ->
                    case child_util:stage_update(Child,
                                                 Child#child{stage = 2})
                        of
                        {{true, _}, NewChild} ->
                            update(NewChild),
                            child_util:family_update(NewChild),
                            log:child(Rid, Child, "接生", Child, NewChild),
                            ok;
                        Else -> Else
                    end;
                _ -> {false, lang:get("没有待接生的孩子")}
            end,
    {reply, Reply, State};
handle_call({follow, RoleId, ChildId}, _From, State) ->
    Reply = case fetch(ChildId) of
                [Child = #child{}] ->
                    case check_can_follow(Child, RoleId) of
                        {false, Reason} -> {false, Reason};
                        has_follow ->
                            Child1 = Child#child{status = 1, follow = RoleId},
                            update(Child1),
                            child_util:family_delete(Child1),
                            true;
                        true ->
                            Child1 = Child#child{status = 1, follow = RoleId},
                            update(Child1),
                            child_util:family_delete(Child1),
                            true
                    end;
                _ -> {false, lang:get("找不到孩子")}
            end,
    {reply, Reply, State};
handle_call({unfollow, RoleId, ChildId}, _From,
            State) ->
    Reply = case fetch(ChildId) of
                [Child = #child{}] ->
                    case check_can_unfollow(Child, RoleId) of
                        {false, Reason} -> {false, Reason};
                        has_rest ->
                            Child1 = Child#child{status = 0,
                                                 follow = {0, "", 0}},
                            update(Child1),
                            child_util:family_update(Child1),
                            child_util:notice_update(RoleId, Child1),
                            child_util:notice_code(RoleId,
                                                   Child1,
                                                   18606,
                                                   {[Child1]}),
                            true;
                        true ->
                            Child1 = Child#child{status = 0,
                                                 follow = {0, "", 0}},
                            update(Child1),
                            child_util:family_update(Child1),
                            child_util:notice_update(RoleId, Child1),
                            child_util:notice_code(RoleId,
                                                   Child1,
                                                   18606,
                                                   {[Child1]}),
                            true
                    end;
                _ -> {false, lang:get("找不到孩子")}
            end,
    {reply, Reply, State};
handle_call({fetus_grow, Rid, ChildId, Val, Type},
            _From, State) ->
    Reply = case fetch(ChildId) of
                [Child = #child{} | _] ->
                    case check_fetus_grow(Child, Type) of
                        {ok, Child1} ->
                            case do_fetus_grow(Child1, Val) of
                                {ok, NewChild = #child{}} ->
                                    {_, NewChild1} =
                                        child_util:stage_update(Child,
                                                                NewChild),
                                    update(NewChild1),
                                    log:child(Rid,
                                              Child,
                                              "增加孕育值",
                                              Child,
                                              NewChild),
                                    ok;
                                Else -> Else
                            end;
                        {max, Max} ->
                            {false,
                             notice:format(lang:get("夫妻双方每天只能增加~ts次"),
                                           [{string_2, 5, Max}])};
                        _ -> {false, lang:get("不能增加的类型")}
                    end;
                _ -> {false, lang:get("找不到指定孩子")}
            end,
    {reply, Reply, State};
handle_call({item_fetus_grow,
             Rid,
             ChildId,
             Val,
             BaseId},
            _From, State) ->
    Reply = case fetch(ChildId) of
                [Child = #child{} | _] ->
                    case check_fetus_grow(Child, 10002) of
                        {ok, Child1} ->
                            case do_fetus_grow(Child1, Val) of
                                {ok, NewChild = #child{}} ->
                                    {_, NewChild1} =
                                        child_util:stage_update(Child,
                                                                NewChild),
                                    update(NewChild1),
                                    log:child(Rid,
                                              Child,
                                              "增加孕育值",
                                              Child,
                                              NewChild),
                                    ok;
                                Else -> Else
                            end;
                        {max, Max} ->
                            {false,
                             notice:format(lang:get("夫妻双方每天只能服用~ts个~ts哟{face_1,2}"),
                                           [{string_2, 5, Max},
                                            {item_2, BaseId}])};
                        _ -> {false, lang:get("不能使用")}
                    end;
                _ -> {false, lang:get("找不到指定孩子")}
            end,
    {reply, Reply, State};
handle_call({rename, RoleId, ChildId, NewName, Changed},
            _From, State) ->
    Reply = case fetch(ChildId) of
                [Child = #child{name_changed = Changed,
                                status = Status}] ->
                    Child1 = Child#child{name = NewName,
                                         last_name_changed = date:unixtime(),
                                         name_changed = Changed + 1},
                    update(Child1),
                    case Status of
                        0 -> child_util:family_update(Child1);
                        _ -> ok
                    end,
                    child_util:notice_code(RoleId,
                                           Child1,
                                           18606,
                                           {[Child1]}),
                    child_util:notice_update(RoleId, Child1),
                    ok;
                [#child{}] -> {false, lang:get("系统繁忙请稍后再试")};
                _ -> {false, lang:get("找不到孩子")}
            end,
    {reply, Reply, State};
handle_call({divorce, Custody = {Id, LoverId}}, _From,
            State) ->
    CoupleKids = custody_list(Custody),
    KidsA = custody_list(Id),
    KidsB = custody_list(LoverId),
    {Fetus, Borns} = lists:partition(fun (#child{stage =
                                                     Stage}) ->
                                             Stage =:= 1
                                     end,
                                     CoupleKids),
    [delete(F) || F <- Fetus],
    [log:child(Id, F, "离婚", F, []) || F <- Fetus],
    Reply = do_divorce(Borns,
                       #{a => Id, a_num => length(KidsA), b => LoverId,
                         b_num => length(KidsB)}),
    {reply, Reply, State};
handle_call({wed, [Id, LoverId]}, _From, State) ->
    KidsA = custody_list(Id),
    KidsB = custody_list(LoverId),
    do_wed(KidsA, LoverId, length(KidsB)),
    do_wed(KidsB, Id, length(KidsA)),
    Reply = ok,
    {reply, Reply, State};
handle_call({add_follow, Rid, Ids}, _From, State) ->
    do_add_follow(Ids, Rid),
    Reply = ok,
    {reply, Reply, State};
handle_call({apply_sync, {M, F, A}}, _From, State) ->
    handle_apply_sync_return(catch erlang:apply(M, F, A),
                             {M, F, A},
                             State);
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({abandon, Rid, ChildId}, State) ->
    case fetch(ChildId) of
        [Child = #child{} | _] ->
            delete(Child),
            child_util:family_delete(Child),
            log:child(Rid, Child, "抛弃", Child, []),
            ok;
        _ -> ok
    end,
    {noreply, State};
handle_info({logout, Rid, Ids}, State) ->
    do_logout(Ids, Rid),
    {noreply, State};
handle_info({apply_async, {M, F, A}}, State) ->
    handle_apply_async_return(catch erlang:apply(M, F, A),
                              {M, F, A},
                              State);
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_data() ->
    Fun = fun (Data) ->
                  case child_ver:do(Data) of
                      {ok,
                       Child = #child{status = 1, id = Id,
                                      custody = Custody}} ->
                          ets:insert(child_index, {Custody, Id}),
                          ets:insert(child, Child#child{status = 2}),
                          continue;
                      {ok, Child = #child{id = Id, custody = Custody}} ->
                          ets:insert(child_index, {Custody, Id}),
                          ets:insert(child, Child),
                          continue;
                      _ -> {done, false}
                  end
          end,
    case dets:first(child) of
        '$end_of_table' ->
            logger:info("没有好友数据需要加载", [], child, 1012),
            [];
        _ -> dets:traverse(child, Fun)
    end.

get_custody(Role = #role{}) ->
    get_custody(get_parents(Role));
get_custody([#child_parent{id = Id}]) -> Id;
get_custody([#child_parent{id = Id},
             #child_parent{id = LoverId}]) ->
    get_custody(Id, LoverId).

get_custody(Id, LoverId) when Id < LoverId ->
    {Id, LoverId};
get_custody(Id, LoverId) -> {LoverId, Id}.

get_parents(Role = #role{id = Id}) ->
    Parents = [to_parent(Role)],
    case wedding:lover(Id) of
        {ok,
         #lover{status = 3, lover_id = LoverId,
                lover_name = LoverName, lover_sex = LoverSex,
                lover_classes = LoverClasses, lover_lev = LoverLev}} ->
            case role_query:attr(by_id,
                                 LoverId,
                                 [#role.s_looks, #role.account])
                of
                {ok, [LoverLooks, LoverAccount]} ->
                    [#child_parent{id = LoverId, name = LoverName,
                                   sex = LoverSex, classes = LoverClasses,
                                   looks = LoverLooks, lev = LoverLev,
                                   account = LoverAccount}
                     | Parents];
                _ ->
                    [#child_parent{id = LoverId, name = LoverName,
                                   sex = LoverSex, classes = LoverClasses,
                                   lev = LoverLev}
                     | Parents]
            end;
        _ -> Parents
    end.

to_parent(#role{id = Id, name = Name, classes = Classes,
                sex = Sex, s_looks = Looks, lev = Lev,
                account = Account}) ->
    #child_parent{id = Id, name = Name, classes = Classes,
                  sex = Sex, looks = Looks, lev = Lev, account = Account}.

do_implant(Parents) ->
    case check_implant([single, couple], Parents) of
        {ok, Custody, Embryo} ->
            Id = gen_id(),
            Child = #child{id = Id, custody = Custody,
                           embryo = Embryo, parents = Parents,
                           pregnant_time = date:unixtime(), attr = #attr{}},
            update(Child),
            {ok, Child};
        Else -> Else
    end.

gen_id() ->
    {env:save_counter(child_id, 1),
     env:get(platform),
     env:get(zone_id)}.

update(Child = #child{id = Id, custody = Custody}) ->
    ets:insert(child, Child),
    ets:insert(child_index, {Custody, Id}),
    dets:insert(child, Child).

update_kids(Role, Child) ->
    update_kids(Role, Child, not_push).

update_kids(Role = #role{m_child =
                             Mchild = #m_child{kids = Kids}},
            Child = #child{id = ChildId}, _PushFlag) ->
    NewKids = case lists:keyfind(ChildId, #child.id, Kids)
                  of
                  #child{} ->
                      lists:keyreplace(ChildId, #child.id, Kids, Child);
                  _ -> Kids
              end,
    NewRole = Role#role{m_child =
                            Mchild#m_child{kids = NewKids}},
    NewRole;
update_kids(Role = #role{m_child =
                             Mchild = #m_child{kids = Kids}},
            ChildId, _PushFlag)
    when is_integer(ChildId) ->
    NewKids = case fetch(ChildId) of
                  [Child = #child{} | _] ->
                      lists:keyreplace(ChildId, #child.id, Kids, Child);
                  _ -> Kids
              end,
    NewRole = Role#role{m_child =
                            Mchild#m_child{kids = NewKids}},
    NewRole;
update_kids(Role, _, _) -> Role.

delete(#child{id = Id, custody = Custody}) ->
    ets:delete(child, Id),
    dets:delete(child, Id),
    ets:match_delete(child_index, {Custody, Id}).

check_implant([], [#child_parent{id = Id}]) ->
    {ok, Id, 1};
check_implant([], Parents) ->
    {ok, get_custody(Parents), 2};
check_implant([single | T], Parents) ->
    case check_single_implant(Parents) of
        ok -> check_implant(T, Parents);
        Else -> Else
    end;
check_implant([couple | T], Parents) ->
    Kids = custody_list(get_custody(Parents)),
    case can_fertilize(Kids) of
        true -> check_implant(T, Parents);
        {false, Why} ->
            {false,
             notice:format(lang:get("你们夫妻俩~ts"), [{string_1, Why}])}
    end.

custody_list(Custody) ->
    L1 = ets:lookup(child_index, Custody),
    do_list(L1).

check_single_implant([]) -> ok;
check_single_implant([#child_parent{id = Id,
                                    name = Name}
                      | T]) ->
    Kids = role_list(Id),
    case can_fertilize(Kids) of
        _ when length(Kids) >= 4 ->
            {false,
             notice:format(lang:get("~ts最多只能孕育~ts个孩子哦"),
                           [{role_2, Name}, {string_2, 1, 4}])};
        true -> check_single_implant(T);
        {false, Why} ->
            {false,
             notice:format(lang:get("~ts~ts"),
                           [{role_2, Name}, {string_1, Why}])}
    end.

do_fetus_grow(Child = #child{stage = Stage = 1,
                             maturity = Maturity, parents = Parents},
              Val) ->
    case child_data:get_stage(Stage) of
        #{max_maturity := Maturity} -> {ok, Child};
        #{max_maturity := Max} when Maturity + Val >= Max ->
            fetus_grow_mail(Parents),
            {ok, Child#child{maturity = Max}};
        _ -> {ok, Child#child{maturity = Maturity + Val}}
    end.

do_list([]) -> [];
do_list([{_, Id} | T]) ->
    case fetch(Id) of
        [Child] -> [Child | do_list(T)];
        _ -> do_list(T)
    end.

do_family_list([]) -> [];
do_family_list([{_, Id} | T]) ->
    case fetch(Id) of
        [Child = #child{stage = 2}] ->
            FChild = child_util:to_family_child(Child),
            [FChild | do_family_list(T)];
        [Child = #child{stage = 3, status = 0}] ->
            FChild = child_util:to_family_child(Child),
            [FChild | do_family_list(T)];
        _ -> do_family_list(T)
    end.

do_fertilize(Parents = [#child_parent{}]) ->
    do_implant(Parents);
do_fertilize(Parents) ->
    gen_server:call(child, {implant, Parents}).

do_divorce([], _) -> ok;
do_divorce(Kids, Args = #{b := B, a_num := ANum})
    when ANum >= 4 ->
    unbind(Kids),
    [update(Child#child{custody = B, follow = {0, "", 0},
                        status = 0})
     || Child <- Kids],
    [divorce_mail(custody, b, Args, Child)
     || Child <- Kids],
    [divorce_mail(nocustody, a, Args, Child)
     || Child <- Kids],
    [log:child(B,
               Child,
               "离婚",
               Child,
               Child#child{custody = B, follow = {0, "", 0},
                           status = 0})
     || Child <- Kids],
    ok;
do_divorce(Kids, Args = #{a := A, b_num := BNum})
    when BNum >= 4 ->
    unbind(Kids),
    [update(Child#child{custody = A, follow = {0, "", 0},
                        status = 0})
     || Child <- Kids],
    [divorce_mail(custody, a, Args, Child)
     || Child <- Kids],
    [divorce_mail(nocustody, b, Args, Child)
     || Child <- Kids],
    [log:child(A,
               Child,
               "离婚",
               Child,
               Child#child{custody = A, follow = {0, "", 0},
                           status = 0})
     || Child <- Kids],
    ok;
do_divorce([Child = #child{id = ChildId,
                           parents = Parents}
            | Kids],
           Args = #{a := A, a_num := ANum, b := B,
                    b_num := BNum}) ->
    unbind(Child),
    case {lists:keyfind(A, #child_parent.id, Parents),
          lists:keyfind(B, #child_parent.id, Parents)}
        of
        {#child_parent{intimacy = Ia},
         #child_parent{intimacy = Ib}}
            when Ia > Ib ->
            Child1 = Child#child{custody = A, status = 0,
                                 follow = {0, "", 0}},
            update(Child1),
            divorce_mail(custody, a, Args, Child),
            divorce_mail(nocustody, b, Args, Child),
            log:child(A, Child, "离婚", Child, Child1),
            do_divorce(Kids, Args#{a_num := ANum + 1});
        {#child_parent{intimacy = Ia},
         #child_parent{intimacy = Ib}}
            when Ib > Ia ->
            Child1 = Child#child{custody = B, status = 0,
                                 follow = {0, "", 0}},
            update(Child1),
            log:child(B, Child, "离婚", Child, Child1),
            divorce_mail(custody, b, Args, Child),
            divorce_mail(nocustody, a, Args, Child),
            do_divorce(Kids, Args#{b_num := BNum + 1});
        {#child_parent{sex = 0}, #child_parent{}} ->
            Child1 = Child#child{custody = A, status = 0,
                                 follow = {0, "", 0}},
            update(Child1),
            log:child(A, Child, "离婚", Child, Child1),
            divorce_mail(custody, a, Args, Child),
            divorce_mail(nocustody, b, Args, Child),
            do_divorce(Kids, Args#{a_num := ANum + 1});
        {#child_parent{}, #child_parent{sex = 0}} ->
            Child1 = Child#child{custody = B, status = 0,
                                 follow = {0, "", 0}},
            update(Child1),
            log:child(B, Child, "离婚", Child, Child1),
            divorce_mail(custody, b, Args, Child),
            divorce_mail(nocustody, a, Args, Child),
            do_divorce(Kids, Args#{b_num := BNum + 1});
        {#child_parent{}, _} ->
            Child1 = Child#child{custody = A, status = 0,
                                 follow = {0, "", 0}},
            update(Child1),
            log:child(A, Child, "离婚", Child, Child1),
            divorce_mail(custody, a, Args, Child),
            divorce_mail(nocustody, b, Args, Child),
            do_divorce(Kids, Args#{a_num := ANum + 1});
        {_, #child_parent{}} ->
            Child1 = Child#child{custody = B, status = 0,
                                 follow = {0, "", 0}},
            update(Child1),
            log:child(B, Child, "离婚", Child, Child1),
            divorce_mail(custody, b, Args, Child),
            divorce_mail(nocustody, a, Args, Child),
            do_divorce(Kids, Args#{b_num := BNum + 1});
        _ ->
            logger:error("孩子家长错误 ~w", [ChildId], child, 1246),
            do_divorce(Kids, Args)
    end.

unbind(#child{id = Id, custody = Custody}) ->
    ets:match_delete(child_index, {Custody, Id}).

do_wed([], _, _) -> ok;
do_wed(_, _, Num) when Num >= 4 -> ok;
do_wed([Child = #child{embryo = 2, parents = Parents}
        | Kids],
       Id, Num) ->
    case lists:keyfind(Id, #child_parent.id, Parents) of
        #child_parent{} ->
            unbind(Child),
            update(Child#child{custody = get_custody(Parents)}),
            log:child(Id,
                      Child,
                      "复婚",
                      Child,
                      Child#child{custody = get_custody(Parents)}),
            do_wed(Kids, Id, Num + 1);
        _ -> do_wed(Kids, Id, Num)
    end;
do_wed([_ | Kids], Id, Num) -> do_wed(Kids, Id, Num).

handle_apply_async_return(ok, _Mfa, State) ->
    {noreply, State};
handle_apply_async_return(Else, {M, F, A}, State) ->
    logger:error("子女进程执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
                 [M, F, A, Else],
                 child,
                 1275),
    {noreply, State}.

handle_apply_sync_return({ok, Reply}, _Mfa, State) ->
    {reply, Reply, State};
handle_apply_sync_return(Else, {M, F, A}, State) ->
    logger:error("子女进程同步执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
                 [M, F, A, Else],
                 child,
                 1282),
    {reply, Else, State}.

do_deliver(Role = #role{m_child =
                            MC = #m_child{kids = Kids}},
           Child = #child{embryo = 1, id = ChildId}) ->
    case child_util:stage_update(Child,
                                 Child#child{stage = 2})
        of
        {{true, _}, NewChild} ->
            update(NewChild),
            NewKids = lists:keyreplace(ChildId,
                                       #child.id,
                                       Kids,
                                       NewChild),
            NewMC = MC#m_child{kids = NewKids},
            Role1 = update_buff(Role#role{m_child = NewMC}, push),
            child_util:family_update(NewChild),
            NewRole = role_trigger:fire(#evt_child_deliver{},
                                        Role1),
            child_util:push(NewRole, 18601, NewChild),
            log:child(NewRole, "分娩", Child, NewChild),
            {ok, NewRole};
        Else -> Else
    end;
do_deliver(Role = #role{m_wedding =
                            #m_wedding{lover_id = LoverId, status = 3},
                        m_child = MC = #m_child{kids = Kids}, id = Rid},
           #child{id = ChildId}) ->
    case team:is_team(Role) andalso team:is_leader(Role) of
        true ->
            case team:get_members(Role) of
                [#team_mate{id = LoverId, status = 2}] ->
                    case gen_server:call(child, {deliver, Rid, ChildId}) of
                        ok ->
                            {NewKids, NewChild} = case fetch(ChildId) of
                                                      [Child = #child{} | _] ->
                                                          {lists:keyreplace(ChildId,
                                                                            #child.id,
                                                                            Kids,
                                                                            Child),
                                                           Child};
                                                      _ -> {Kids, false}
                                                  end,
                            NewMC = MC#m_child{kids = NewKids},
                            Role1 = update_buff(Role#role{m_child = NewMC},
                                                push),
                            NewRole = role_trigger:fire(#evt_child_deliver{},
                                                        Role1),
                            child_util:push(NewRole, 18601, NewChild),
                            apply_lover(NewRole, {deliver, ChildId}),
                            {ok, NewRole};
                        Else -> Else
                    end;
                _ -> {false, lang:get("请夫妻组队，并由队长来接生")}
            end;
        _ -> {false, lang:get("请夫妻组队，并由队长来接生")}
    end.

fetus_combat_grow(Role = #role{}, Val, CombatType) ->
    case fetus_grow(Role, Val, CombatType) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> ok
    end.

do_login(Kids, Role) ->
    do_login(Kids,
             Role,
             #{kids => [], couple_ids => [], follow_num => 0}).

do_login([], _Role,
         #{kids := Kids, couple_ids := CoupleIds}) ->
    {Kids, CoupleIds};
do_login([Child = #child{custody = Rid} | T],
         Role = #role{id = Rid},
         Args = #{kids := Kids, follow_num := Num})
    when Num >= 2 ->
    do_login(T,
             Role,
             Args#{kids :=
                       [Child#child{status = 0, follow = {0, "", 0}} | Kids]});
do_login([Child = #child{custody = Rid, status = 1,
                         follow = Rid}
          | T],
         Role = #role{id = Rid, lev = Lev},
         Args = #{kids := Kids, follow_num := Num}) ->
    do_login(T,
             Role,
             Args#{kids := [Child#child{lev = Lev} | Kids],
                   follow_num := Num + 1});
do_login([Child = #child{custody = Rid, status = 2,
                         follow = Rid}
          | T],
         Role = #role{id = Rid, lev = Lev},
         Args = #{kids := Kids, follow_num := Num}) ->
    do_login(T,
             Role,
             Args#{kids :=
                       [Child#child{status = 1, lev = Lev} | Kids],
                   follow_num := Num + 1});
do_login([#child{id = ChildId, status = 1, follow = Rid}
          | T],
         Role = #role{id = Rid},
         Args = #{couple_ids := CoupleIds, follow_num := Num}) ->
    do_login(T,
             Role,
             Args#{couple_ids := [ChildId | CoupleIds],
                   follow_num := Num + 1});
do_login([#child{id = ChildId, status = 2, follow = Rid}
          | T],
         Role = #role{id = Rid},
         Args = #{couple_ids := CoupleIds, follow_num := Num}) ->
    do_login(T,
             Role,
             Args#{couple_ids := [ChildId | CoupleIds],
                   follow_num := Num + 1});
do_login([Child = #child{} | T], Role,
         Args = #{kids := Kids}) ->
    do_login(T, Role, Args#{kids := [Child | Kids]}).

do_add_kids([], Kids, _) -> Kids;
do_add_kids([Id | T], Kids, Role = #role{lev = Lev}) ->
    case fetch(Id) of
        [Child = #child{}] ->
            do_add_kids(T, [Child#child{lev = Lev} | Kids], Role);
        _ -> do_add_kids(T, Kids, Role)
    end.

do_add_follow([], _) -> ok;
do_add_follow([Id | T], Rid) ->
    case fetch(Id) of
        [Child = #child{follow = Rid, status = 2}] ->
            Child1 = Child#child{status = 1},
            update(Child1),
            child_util:notice_update(Rid, Child1),
            child_util:notice_code(Rid, Child1, 18606, {[Child1]}),
            child_util:family_delete(Child1),
            ok;
        _ -> ok
    end,
    do_add_follow(T, Rid).

do_logout([], _) -> ok;
do_logout([Id | T], Rid) ->
    case fetch(Id) of
        [Child = #child{follow = Rid, status = 1}] ->
            Child1 = Child#child{status = 2},
            update(Child1),
            child_util:notice_update(Rid, Child1),
            child_util:notice_code(Rid, Child1, 18606, {[Child1]}),
            child_util:family_update(Child1),
            ok;
        _ -> ok
    end,
    do_logout(T, Rid).

check_can_follow(#child{stage = Stage}, _RoleId)
    when Stage =/= 3 ->
    {false, lang:get("成年的孩子才可以携带")};
check_can_follow(#child{status = 1, follow = RoleId},
                 RoleId) ->
    has_follow;
check_can_follow(#child{status = 1}, _RoleId) ->
    {false, lang:get("孩子在另外一方携带中")};
check_can_follow(#child{custody = RoleId}, RoleId) ->
    true;
check_can_follow(#child{custody = {Id1, Id2}}, RoleId)
    when RoleId =:= Id1 orelse RoleId =:= Id2 ->
    true;
check_can_follow(_, _) ->
    {false, lang:get("不是自己的孩子不能携带")}.

check_can_unfollow(#child{stage = Stage}, _RoleId)
    when Stage =/= 3 ->
    {false, lang:get("成年的孩子才可以操作")};
check_can_unfollow(#child{status = 1, follow = RoleId},
                   RoleId) ->
    true;
check_can_unfollow(#child{status = 1}, _RoleId) ->
    {false, lang:get("孩子在另外一方携带中")};
check_can_unfollow(#child{custody = RoleId}, RoleId) ->
    has_rest;
check_can_unfollow(#child{custody = {Id1, Id2}}, RoleId)
    when RoleId =:= Id1 orelse RoleId =:= Id2 ->
    has_rest;
check_can_unfollow(_, _) ->
    {false, lang:get("不是自己的孩子不能操作")}.

update_buff(Role = #role{sex = Sex}, IsPush) ->
    BuffId = case is_pregnant(Role) of
                 {true, 1} -> 23112;
                 {true, 2} when Sex =:= 0 -> 23111;
                 _ -> false
             end,
    Role1 = case buff:del(Role, [23112, 23111]) of
                {ok, NRole} -> NRole;
                _ -> Role
            end,
    Role3 = case buff_data:get(BuffId) of
                B = #buff_base{} ->
                    case buff:add(Role1, B) of
                        {ok, Role2} -> Role2;
                        _ -> Role1
                    end;
                _ -> Role1
            end,
    case IsPush of
        push ->
            Role4 = attr:calc_and_push(Role3),
            NewRole = looks:calc(Role4),
            map:role_update(NewRole),
            NewRole;
        _ -> Role3
    end.

apply_lover(#role{m_wedding =
                      #m_wedding{lover_id = LoverId, status = 3}},
            Args) ->
    role:apply(async,
               LoverId,
               {child, role_callback, [Args]});
apply_lover(_, _) -> ok.

fetus_grow_mail([#child_parent{id = Id}]) ->
    Title = lang:get("欢迎来到这个世界"),
    Content =
        lang:get("天降喜讯，经过您多日来的努力与关爱，灵种的颤动愈发强烈，仿佛揭示着某个可爱小生命的到来，快"
                 "回家园保姆小兰处查看吧，孩子马上就要出生啦{face_1,7}"),
    mail:send(Id,
              #{title => Title, content => Content, items => []});
fetus_grow_mail([#child_parent{id = Id1},
                 #child_parent{id = Id2}]) ->
    Title = lang:get("欢迎来到这个世界"),
    Content =
        lang:get("天降喜讯，经过无微不至的呵护与关爱，贵夫妇的孩子即将出生，赶快叫上你的那个TA前往家园保姆"
                 "小兰处查看吧，爱情的结晶正等着你们{face_1,3}"),
    mail:send(Id1,
              #{title => Title, content => Content, items => []}),
    mail:send(Id2,
              #{title => Title, content => Content, items => []});
fetus_grow_mail(_) -> ok.

check_fetus_grow(Child = #child{last_added_maturity =
                                    Last,
                                maturity_added_log = Log},
                 Type) ->
    case child_data:get_combat_maturity(Type) of
        {_Val, _Ratio, Max} when is_integer(Max) ->
            Now = date:unixtime(),
            Log1 = case date:is_same_five_reset(Now, Last) of
                       true -> Log;
                       _ -> []
                   end,
            case lists:keyfind(Type, 1, Log1) of
                {Type, Done} when Done >= Max andalso Type =:= 10001 ->
                    {ok,
                     Child#child{maturity_added_log =
                                     lists:keyreplace(Type,
                                                      1,
                                                      Log1,
                                                      {Type, Max}),
                                 last_added_maturity = Now}};
                {Type, Done} when Done >= Max -> {max, Max};
                {Type, Done} ->
                    {ok,
                     Child#child{maturity_added_log =
                                     lists:keyreplace(Type,
                                                      1,
                                                      Log1,
                                                      {Type, Done + 1}),
                                 last_added_maturity = Now}};
                _ ->
                    {ok,
                     Child#child{maturity_added_log =
                                     lists:keystore(Type, 1, Log1, {Type, 1}),
                                 last_added_maturity = Now}}
            end;
        _ -> false
    end.

rename_loss(Role, _) ->
    Loss = format:val_to_loss([{90000, 500000}]),
    role_gain:do_notice(Loss, Role).

do_rename({ok, Role = #role{id = Rid}},
          Child = #child{custody = Rid, name_changed = Changed,
                         status = Status},
          NewName) ->
    Now = date:unixtime(),
    NewChild = Child#child{name = NewName,
                           name_changed = Changed + 1, last_name_changed = Now},
    update(NewChild),
    case Status of
        0 -> child_util:family_update(NewChild);
        _ -> ok
    end,
    child_util:push(Role, 18606, NewChild),
    {ok, update_kids(Role, NewChild)};
do_rename({ok, Role = #role{id = Rid}},
          #child{id = ChildId, name_changed = Changed},
          NewName) ->
    case gen_server:call(child,
                         {rename, Rid, ChildId, NewName, Changed})
        of
        ok ->
            NewRole = case fetch(ChildId) of
                          [Child = #child{}] ->
                              Role1 = update_kids(Role, Child),
                              child_util:push(Role1, 18606, Child),
                              Role1;
                          _ -> Role
                      end,
            {ok, NewRole};
        Else -> Else
    end;
do_rename({false, #loss{msg = Msg}}, _, _) ->
    {false, Msg};
do_rename(_, _, _) -> {false, lang:get("不能改名")}.

check_abandon([spirit | T],
              Role = #role{m_wedding =
                               #m_wedding{status = 3, lover_id = LoverId}},
              ChildId) ->
    case role_query:attr(by_id,
                         LoverId,
                         [#role.m_child, #role.name])
        of
        {ok, [#m_child{kids = Kids}, LoverName]} ->
            case lists:keyfind(ChildId, #child.id, Kids) of
                #child{spirit_attached = 1} ->
                    Msg = notice:format(lang:get("~ts对孩子还在附灵，不能操作"),
                                        [{role_2, LoverName}]),
                    notice:send(LoverId,
                                3,
                                lang:get("孩子还在附灵中，请先卸下附灵宠后再托管")),
                    {false, Msg};
                _ -> check_abandon(T, Role, ChildId)
            end;
        _ ->
            logger:info("配偶不在线", [], child, 1545),
            {false, "您的配偶还没上线哦，请夫妻组队再来操作"}
    end;
check_abandon([spirit | T], Role, ChildId) ->
    check_abandon(T, Role, ChildId);
check_abandon([team | _T],
              Role = #role{m_wedding =
                               #m_wedding{status = 3, lover_id = LoverId}},
              _) ->
    case team:get_status(Role) of
        {true, 1} ->
            case team:get_members(Role) of
                [#team_mate{id = LoverId, status = 2}] -> {ok, LoverId};
                _ -> {false, lang:get("请夫妻组队，并由队长来操作")}
            end;
        _ -> {false, lang:get("请夫妻组队，并由队长来操作")}
    end;
check_abandon(_, _, _) -> divorce.

divorce_mail(custody, a, #{a := ToId, b := Id},
             #child{name = Name, parents = Parents}) ->
    ParentName = case lists:keyfind(Id,
                                    #child_parent.id,
                                    Parents)
                     of
                     #child_parent{name = TName} -> TName;
                     _ -> ""
                 end,
    Msg =
        notice:format(lang:get("您已和~ts离婚，~ts为夫妻共同孕育子女，由于您与~ts亲密度比~ts要高，所以您获得了"
                               "~ts抚养权，以后要更加爱护子女哟"),
                      [{string_2, 2, ParentName},
                       {string_2, 5, Name},
                       {string_2, 5, Name},
                       {string_2, 2, ParentName},
                       {string_2, 5, Name}]),
    mail:send(ToId, lang:get("子女归属说明"), Msg);
divorce_mail(custody, b, #{a := Id, b := ToId},
             #child{name = Name, parents = Parents}) ->
    ParentName = case lists:keyfind(Id,
                                    #child_parent.id,
                                    Parents)
                     of
                     #child_parent{name = TName} -> TName;
                     _ -> ""
                 end,
    Msg =
        notice:format(lang:get("您已和~ts离婚，~ts为夫妻共同孕育子女，由于您与~ts亲密度比~ts要高，所以您获得了"
                               "~ts抚养权，以后要更加爱护子女哟"),
                      [{string_2, 2, ParentName},
                       {string_2, 5, Name},
                       {string_2, 5, Name},
                       {string_2, 2, ParentName},
                       {string_2, 5, Name}]),
    mail:send(ToId, lang:get("子女归属说明"), Msg);
divorce_mail(nocustody, a, #{a := ToId, b := Id},
             #child{name = Name, parents = Parents}) ->
    ParentName = case lists:keyfind(Id,
                                    #child_parent.id,
                                    Parents)
                     of
                     #child_parent{name = TName} -> TName;
                     _ -> ""
                 end,
    Msg =
        notice:format(lang:get("您已和~ts离婚，~ts为夫妻共同孕育子女，由于~ts与~ts亲密度比您要高，所以~ts判"
                               "决归属~ts\n（温馨提示：您与~ts的亲密度将会保留，复婚后可恢复与子女的关系）"),
                      [{string_2, 2, ParentName},
                       {string_2, 5, Name},
                       {string_2, 5, Name},
                       {string_2, 2, ParentName},
                       {string_2, 5, Name},
                       {string_2, 2, ParentName},
                       {string_2, 5, Name}]),
    mail:send(ToId, lang:get("子女归属说明"), Msg);
divorce_mail(nocustody, b, #{b := ToId, a := Id},
             #child{name = Name, parents = Parents}) ->
    ParentName = case lists:keyfind(Id,
                                    #child_parent.id,
                                    Parents)
                     of
                     #child_parent{name = TName} -> TName;
                     _ -> ""
                 end,
    Msg =
        notice:format(lang:get("您已和~ts离婚，~ts为夫妻共同孕育子女，由于~ts与~ts亲密度比您要高，所以~ts判"
                               "决归属~ts\n（温馨提示：您与~ts的亲密度将会保留，复婚后可恢复与子女的关系）"),
                      [{string_2, 2, ParentName},
                       {string_2, 5, Name},
                       {string_2, 5, Name},
                       {string_2, 2, ParentName},
                       {string_2, 5, Name},
                       {string_2, 2, ParentName},
                       {string_2, 5, Name}]),
    mail:send(ToId, lang:get("子女归属说明"), Msg);
divorce_mail(_, _, _, _) -> ok.

