-file("src/mod/child/child_skill.erl", 1).

-module(child_skill).

-export([skill_name/1,
         attr_to_skill/2,
         use_item/4,
         calc_attr/2,
         all_skill/1,
         recalc_classes_skill/1]).

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

-file("src/mod/child/child_skill.erl", 19).

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

-file("src/mod/child/child_skill.erl", 20).

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

-file("src/mod/child/child_skill.erl", 21).

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

-file("src/mod/child/child_skill.erl", 22).

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

-file("src/mod/child/child_skill.erl", 23).

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

-file("src/mod/child/child_skill.erl", 24).

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

-file("src/mod/child/child_skill.erl", 25).

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

-file("src/mod/child/child_skill.erl", 26).

use_item(Role = #role{id = RoleId}, Item, SkillId,
         ChildId) ->
    case child_util:find_child(Role, ChildId, [3]) of
        {true,
         Child = #child{skills = Skills, name = ChildName,
                        parents = Parents}} ->
            case check_skill(Item, SkillId, Skills, Role) of
                {true, NewRole, Skill, BaseSkills, RestSkills} ->
                    {NewBaseSkills, ReMsg, _RepleaceFlag} =
                        study_skill(Skill, BaseSkills, ChildName),
                    NewSkills = NewBaseSkills ++ RestSkills,
                    NewParents = case lists:keyfind(RoleId,
                                                    #child_parent.id,
                                                    Parents)
                                     of
                                     CP = #child_parent{intimacy = Intimacy} ->
                                         lists:keyreplace(RoleId,
                                                          #child_parent.id,
                                                          Parents,
                                                          CP#child_parent{intimacy
                                                                              =
                                                                              Intimacy
                                                                                  +
                                                                                  child_data:get_skill_intimacy(SkillId)});
                                     _ -> Parents
                                 end,
                    Child1 = child_attr:calc(Child#child{skills = NewSkills,
                                                         parents = NewParents},
                                             Role),
                    NewRole1 = child:update_kids(NewRole, Child1),
                    case child_util:update_child(NewRole1, Child1) of
                        true ->
                            notice:send(NewRole1, 3, ReMsg),
                            child_util:push(NewRole1, 18603, Child1),
                            child_util:push(NewRole1, 18604, Child1),
                            NewRole2 = child_util:evt_child(NewRole1, Child1),
                            child_util:notice_code(RoleId,
                                                   Child1,
                                                   18603,
                                                   {[Child1]}),
                            child_util:notice_code(RoleId,
                                                   Child1,
                                                   18604,
                                                   {[Child1]}),
                            child_util:notice_update(RoleId, Child1),
                            log:child(NewRole2, "打书", Child, Child1),
                            {ok, NewRole2};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

recalc_classes_skill(Child = #child{base_id = BaseId,
                                    skills = Skills, grade = Grade}) ->
    {BaseSkill, _ClassesSkill, StoneSkill} =
        split_skill(Skills),
    case child_data:get_base(BaseId) of
        #child_base{classes_skills = AllClassesSkill} ->
            NewClassesSkill =
                do_recalc_classes_skill(AllClassesSkill, Grade),
            NewSkills = BaseSkill ++ NewClassesSkill ++ StoneSkill,
            Child#child{skills = NewSkills};
        _ -> Child
    end.

split_skill(Skills) -> split_skill(Skills, [], [], []).

split_skill([], BaseSkill, ClassesSkill, StoneSkill) ->
    {lists:reverse(BaseSkill),
     lists:reverse(ClassesSkill),
     lists:reverse(StoneSkill)};
split_skill([ChildSkill = #child_skill{source = Source}
             | T],
            BaseSkill, ClassesSkill, StoneSkill) ->
    case Source of
        1 ->
            split_skill(T,
                        [ChildSkill | BaseSkill],
                        ClassesSkill,
                        StoneSkill);
        2 ->
            split_skill(T,
                        BaseSkill,
                        [ChildSkill | ClassesSkill],
                        StoneSkill);
        3 ->
            split_skill(T,
                        BaseSkill,
                        ClassesSkill,
                        [ChildSkill | StoneSkill]);
        _ -> split_skill(T, BaseSkill, ClassesSkill, StoneSkill)
    end.

do_recalc_classes_skill(AllClassesSkill, Grade) ->
    do_recalc_classes_skill(AllClassesSkill, Grade, []).

do_recalc_classes_skill([], _ChildLev, Skills) ->
    lists:reverse(Skills);
do_recalc_classes_skill([{SkillId, NeedGrade} | T],
                        Grade, Skills) ->
    case skill_data:get_child({SkillId, 1}) of
        #child_base_skill{type = SkillType, step = Step} ->
            Skill = #child_skill{id = SkillId, step = Step,
                                 type = SkillType, source = 2},
            NewSkill = case Grade >= NeedGrade of
                           true -> Skill;
                           _ -> Skill#child_skill{is_open = 0}
                       end,
            do_recalc_classes_skill(T, Grade, [NewSkill | Skills]);
        _ -> do_recalc_classes_skill(T, Grade, Skills)
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
    case role_gain:LossFun(Loss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, NewRole} ->
            Fun = fun (#child_skill{source = Source}) ->
                          Source =:= 1
                  end,
            {BaseSkills, RestSkills} = lists:partition(Fun, Skills),
            case lists:keyfind(SkillId, #child_skill.id, BaseSkills)
                of
                false ->
                    case learn_normal_skill([SkillId]) of
                        [AddSkill] ->
                            {true, NewRole, AddSkill, BaseSkills, RestSkills};
                        _ -> {false, lang:get("不存在该技能, 无法使用该技能书")}
                    end;
                _ -> {false, lang:get("已有相同技能, 无法使用")}
            end
    end.

learn_normal_skill(Skills) ->
    learn_normal_skill(Skills, []).

learn_normal_skill([], Skills) -> Skills;
learn_normal_skill([S | T], Skills) ->
    case skill_data:get_child({S, 1}) of
        #child_base_skill{type = Type, step = Step} ->
            Skill = #child_skill{id = S, type = Type, source = 1,
                                 step = Step},
            learn_normal_skill(T, [Skill | Skills]);
        _ -> learn_normal_skill(T, Skills)
    end.

study_skill(Skill, BaseSkills, ChildName) ->
    Length = length(BaseSkills),
    Flag = if Length =:= 1 -> true;
              Length =:= 0 -> true;
              true -> false
           end,
    case Flag of
        true ->
            Name = skill_name(Skill),
            {[Skill | BaseSkills],
             notice:format(lang:get("您的~ts学会了~ts"),
                           [{string_2, 5, ChildName}, {string_2, 1, Name}]),
             Flag};
        false ->
            DelSkill = util:rand_list(BaseSkills),
            Name1 = skill_name(Skill),
            Name2 = skill_name(DelSkill),
            NewBaseSkills = update_base_skill(BaseSkills,
                                              DelSkill,
                                              Skill),
            {NewBaseSkills,
             notice:format(lang:get("您的~ts学会了~ts，可惜~ts被遗忘掉了"),
                           [{string_2, 5, ChildName},
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

calc_attr(Ac = #attr_calc{},
          Child = #child{lev = ChildLev}) ->
    {Skills, TalentSkills, SpiritSkills} = all_skill(Child),
    Ac1 = do_calc(Ac, Skills, ChildLev, []),
    Ac2 = do_calc(Ac1, TalentSkills, ChildLev, []),
    Ac3 = do_calc(Ac2, SpiritSkills, ChildLev, []),
    NewAc = Ac3,
    NewAc;
calc_attr(Ac = #attr_calc{}, _Role) -> Ac.

do_calc(Ac, [], ChildLev, Result) ->
    AttrList1 = skill:dynamic_skill_attr(Result, ChildLev),
    AttrList2 = attr_type:to_attr(base, AttrList1),
    case attr_type:do_attr(AttrList2, Ac) of
        {false, Reason} ->
            logger:error("子女技能属性计算错误[~w]",
                         [Reason],
                         child_skill,
                         209),
            Ac;
        {ok, NewAc} -> NewAc
    end;
do_calc(Ac, [{Id, Lev} | T], ChildLev, Result) ->
    case skill_data:get_child({Id, Lev}) of
        #child_base_skill{attr = Attr = [_ | _]} ->
            {Attr1, Attr2} = lists:partition(fun ({Type, _, _}) ->
                                                     lists:member(Type, [4, 5])
                                                         =:= true
                                             end,
                                             Attr),
            Attr3 = calc_point_attr(Attr1, Ac, []),
            do_calc(Ac, T, ChildLev, Attr3 ++ Attr2 ++ Result);
        _ -> do_calc(Ac, T, ChildLev, Result)
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
calc_point_attr([_ | T], Ac, Attr) ->
    calc_point_attr(T, Ac, Attr).

all_skill(#child{skills = Skills,
                 talent_skills = TalentSkills,
                 spirit_skills = SpiritSkills}) ->
    Fun = fun (#child_skill{id = SkillId, step = Step,
                            type = Type, is_open = 1},
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
    TalentFightSkills = [{TalentSkillId, Lev}
                         || #child_talent_skill{id = TalentSkillId, lev = Lev}
                                <- TalentSkills],
    {lists:reverse(BaseSkill),
     TalentFightSkills,
     [{Ssid, Sslv} || {Ssid, Sslv} <- SpiritSkills]}.

skill_name(#child_skill{id = SkillId}) ->
    skill_name(SkillId);
skill_name(SkillId) ->
    case skill_data:get_child({SkillId, 1}) of
        #child_base_skill{name = SkillName} -> SkillName;
        _ -> lang:get("未知技能")
    end.

attr_to_skill(A, Source) when is_list(A) ->
    attr_to_skill(A, Source, []);
attr_to_skill(#attr_base{val = SkillId}, Source) ->
    case skill_data:get_child({SkillId, 1}) of
        #child_base_skill{type = SkillType, step = Step} ->
            #child_skill{id = SkillId, step = Step,
                         type = SkillType, source = Source};
        _ -> false
    end.

attr_to_skill([], _Source, Skills) -> Skills;
attr_to_skill([A = #attr_base{name = 100} | T], Source,
              Skills) ->
    case attr_to_skill(A, Source) of
        ChildSkill = #child_skill{} ->
            attr_to_skill(T, Source, [ChildSkill | Skills]);
        _ -> attr_to_skill(T, Source, Skills)
    end;
attr_to_skill([_ | T], Source, Skills) ->
    attr_to_skill(T, Source, Skills).

