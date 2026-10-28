-file("src/mod/child/child_stone.erl", 1).

-module(child_stone).

-export([upgrade/2,
         calc_attr/2,
         use_stone/4,
         remove_stone/3,
         reset_stone/2,
         save_stone/2,
         rand_attr/2]).

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

-file("src/mod/child/child_stone.erl", 20).

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

-file("src/mod/child/child_stone.erl", 21).

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

-file("src/mod/child/child_stone.erl", 22).

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

-file("src/mod/child/child_stone.erl", 23).

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

-file("src/mod/child/child_stone.erl", 24).

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

-file("src/mod/child/child_stone.erl", 25).

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

-file("src/mod/child/child_stone.erl", 26).

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

-file("src/mod/child/child_stone.erl", 27).

upgrade(Role = #role{id = RoleId}, ChildId) ->
    case child_util:find_child(Role, ChildId, [3]) of
        {true,
         Child = #child{name = ChildName, base_id = ChildBaseId,
                        growth_type = GrowthType, lev = ChildLev, grade = Grade,
                        grade_attr = GradeAttr, child_attr = ChildAttr,
                        ext_growth = ExtGrowth}} ->
            case check_upgrade(Child, Grade + 1) of
                {true, AddAptitude, Loss, StoneAttr, BaseSkills} ->
                    case role_gain:do_notice(Loss, Role, lang:get("孩子进阶"))
                        of
                        {ok, LossRole} ->
                            {NewGradeAttr, NewSkills, AddSkills} =
                                merge_upgrade(GradeAttr,
                                              BaseSkills,
                                              StoneAttr,
                                              []),
                            NewChildAttr = upgrade_aptitude(ChildAttr,
                                                            AddAptitude),
                            NewExtGrowth = ExtGrowth,
                            GrowthVal = child_util:get_growth_val(ChildBaseId,
                                                                  Grade + 1,
                                                                  GrowthType,
                                                                  ChildLev,
                                                                  NewExtGrowth),
                            Child1 = Child#child{grade = Grade + 1,
                                                 grade_attr = NewGradeAttr,
                                                 growth = GrowthVal,
                                                 stones = [],
                                                 skills = NewSkills,
                                                 child_attr = NewChildAttr},
                            Child2 = child_talent:recalc_talent_skill(Child1),
                            Child3 = child_skill:recalc_classes_skill(Child2),
                            NewChild = child_attr:calc(Child3, LossRole),
                            NewRole = child:update_kids(LossRole, NewChild),
                            case child_util:update_child(NewRole, NewChild) of
                                true ->
                                    cast_upgrade(NewRole,
                                                 ChildName,
                                                 AddSkills,
                                                 AddAptitude),
                                    child_util:push(NewRole, 18603, NewChild),
                                    child_util:push(NewRole, 18604, NewChild),
                                    child_util:push(NewRole, 18605, NewChild),
                                    child_util:push(NewRole, 18607, NewChild),
                                    NewRole1 = child_util:evt_child(NewRole,
                                                                    NewChild),
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
                                                           18607,
                                                           {[NewChild]}),
                                    child_util:notice_update(RoleId, NewChild),
                                    log:child(NewRole1, "进阶", Child, NewChild),
                                    {ok, NewRole1, Grade + 1};
                                {false, Reason} -> {false, Reason}
                            end;
                        {false, #loss{val = [{ItemBaseId, ItemNum}]}} ->
                            ItemName = item:attr(name, ItemBaseId),
                            Msg = util:flist(lang:get("~ts不足~w个, 无法升阶! "),
                                             [ItemName, ItemNum]),
                            {false, Msg};
                        _Other -> {false, lang:get("材料不足, 无法进阶")}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

check_upgrade(#child{base_id = ChildBaseId,
                     name = ChildName, stones = Stones, lev = ChildLev,
                     skills = Skills, grade = Grade},
              UpGrade) ->
    NeedLev = case UpGrade of
                  1 -> 85;
                  2 -> 95;
                  _ -> 100
              end,
    case child_data:get_grade({ChildBaseId, UpGrade}) of
        #{add_apt := AddApt, hole_num := HoleNum} ->
            case ChildLev >= NeedLev of
                true ->
                    case check_all_hole(ChildBaseId,
                                        Grade,
                                        Stones,
                                        HoleNum,
                                        ChildLev)
                        of
                        {false, Reason} -> {false, Reason};
                        true ->
                            case check_upgrade_skill(ChildName, Stones, Skills)
                                of
                                {true, StoneAttr, NewSkills} ->
                                    case child_data:get_grade_loss({ChildBaseId,
                                                                    UpGrade})
                                        of
                                        [] -> {false, lang:get("材料不足, 无法进阶")};
                                        Loss ->
                                            NLoss = [LT#loss{auto_scene =
                                                                 lang:get("子女进阶")}
                                                     || LT <- Loss],
                                            {true,
                                             AddApt,
                                             NLoss,
                                             StoneAttr,
                                             NewSkills}
                                    end;
                                {false, Reason} -> {false, Reason}
                            end
                    end;
                _ ->
                    {false,
                     util:flist(lang:get("孩子等级不足~w级，无法进阶"), [NeedLev])}
            end;
        _ -> {false, lang:get("进阶已经达到顶级, 无法继续进阶")}
    end.

check_all_hole(_ChildBaseId, _Grade, _Stones, HoleNum,
               _ChildLev)
    when HoleNum =< 0 ->
    true;
check_all_hole(ChildBaseId, Grade, Stones, HoleNum,
               ChildLev) ->
    case lists:keyfind(HoleNum, #child_stone.id, Stones) of
        #child_stone{base_id = StoneBaseId} ->
            case check_stone(ChildBaseId,
                             Grade,
                             HoleNum,
                             StoneBaseId,
                             ChildLev)
                of
                true ->
                    check_all_hole(ChildBaseId,
                                   Grade,
                                   Stones,
                                   HoleNum - 1,
                                   ChildLev);
                {false, _Reason} ->
                    Msg = notice:format(lang:get("~ts才能进阶哦"),
                                        [{string_2, 5, lang:get("集齐全部装备")}]),
                    {false, Msg}
            end;
        false ->
            Msg = notice:format(lang:get("~ts才能进阶哦"),
                                [{string_2, 5, lang:get("集齐全部装备")}]),
            {false, Msg}
    end.

check_stone(ChildBaseId, Grade, HoleId, StoneId,
            ChildLev) ->
    case child_data:allow_stone({ChildBaseId,
                                 Grade,
                                 HoleId})
        of
        #{need_lev := NeedLev} when ChildLev < NeedLev ->
            {false, util:flist("等级不足~w，无法装备此装备", [NeedLev])};
        #{allow_stone := AllowStone = [_ | _]} ->
            case lists:member(StoneId, AllowStone) of
                true -> true;
                false -> {false, lang:get("当前孩子阶段不可装备此装备")}
            end;
        _Err ->
            logger:error("找不到孔:~w, ~w, ~w",
                         [ChildBaseId, Grade, HoleId],
                         child_stone,
                         142),
            {false, lang:get("当前孩子不存在该装备孔数据")}
    end.

check_upgrade_skill(ChildName, Stones, Skills) ->
    StonesAttr = lists:flatten([Attr
                                || #child_stone{attr = Attr} <- Stones]),
    Skills1 = [ChildSkill
               || ChildSkill = #child_skill{source = 1} <- Skills],
    case length(Skills1) < 2 of
        true ->
            Msg =
                notice:format(lang:get("~ts需学满两个技能才能进阶哦{face_1,2}"),
                              [{string_2, 5, ChildName}]),
            {false, Msg};
        false ->
            Fun = fun (Attr = #attr_base{name = 100, val = Val},
                       {SkillList, AttrList, NowSkills}) ->
                          case lists:keyfind(Val, #child_skill.id, NowSkills) of
                              false ->
                                  {[Attr | SkillList], AttrList, NowSkills};
                              _ -> {SkillList, AttrList, NowSkills}
                          end;
                      (Attr, {SkillList, AttrList, NowSkills}) ->
                          {SkillList, [Attr | AttrList], NowSkills}
                  end,
            case lists:foldl(Fun, {[], [], Skills1}, StonesAttr) of
                {AddSkills = [_ | _], AddAttrList, _} ->
                    AddSkill = util:rand_list(AddSkills),
                    {true, [AddSkill | AddAttrList], Skills1};
                {[], _, _} -> {false, lang:get("装备技能与孩子自身技能重合，无法进阶")}
            end
    end.

cast_upgrade(Role, ChildName, AddSkills, AddApt) ->
    Msg1 = notice:format(lang:get("恭喜！~ts进阶成功，获得了新形象"),
                         [{string_2, 5, ChildName}]),
    Msg2 = notice:format(lang:get("~ts5项资质+~ts"),
                         [{string_2, 5, ChildName}, {string_2, 1, AddApt}]),
    notice:send(Role, 3, Msg1),
    notice:send(Role, 3, Msg2),
    case AddSkills of
        [] -> skip;
        _ ->
            SkillNameList = to_skill_name(AddSkills, ""),
            Msg3 = notice:format(lang:get("装备技能~ts转化为固化技能"),
                                 [{string_2, 5, SkillNameList}]),
            notice:send(Role, 3, Msg3)
    end,
    ok.

to_skill_name([], SkillName) -> SkillName;
to_skill_name([SkillId | T], SkillName) ->
    SkillName1 = case SkillName of
                     "" ->
                         util:flist("~ts", [child_skill:skill_name(SkillId)]);
                     _ ->
                         util:flist("~ts、~ts",
                                    [SkillName,
                                     child_skill:skill_name(SkillId)])
                 end,
    to_skill_name(T, SkillName1).

upgrade_aptitude(ChildAttr = #child_attr{hp_aptitude =
                                             HpA,
                                         phy_aptitude = PhyA,
                                         pdef_aptitude = PdefA,
                                         magic_aptitude = MagicA,
                                         aspd_aptitude = AspdA,
                                         max_hp_aptitude = MaxHpA,
                                         max_phy_aptitude = MaxPhyA,
                                         max_pdef_aptitude = MaxPdefA,
                                         max_magic_aptitude = MaxMagicA,
                                         max_aspd_aptitude = MaxAspdA},
                 AddAptitude) ->
    ChildAttr#child_attr{hp_aptitude = HpA + AddAptitude,
                         phy_aptitude = PhyA + AddAptitude,
                         pdef_aptitude = PdefA + AddAptitude,
                         magic_aptitude = MagicA + AddAptitude,
                         aspd_aptitude = AspdA + AddAptitude,
                         max_hp_aptitude = MaxHpA + AddAptitude,
                         max_phy_aptitude = MaxPhyA + AddAptitude,
                         max_pdef_aptitude = MaxPdefA + AddAptitude,
                         max_magic_aptitude = MaxMagicA + AddAptitude,
                         max_aspd_aptitude = MaxAspdA + AddAptitude}.

merge_upgrade(Attr, Skills, [], AddSkills) ->
    {Attr, Skills, AddSkills};
merge_upgrade(Attr, Skills,
              [A = #attr_base{name = 100} | T], AddSkills) ->
    case child_skill:attr_to_skill(A, 1) of
        Skill = #child_skill{id = SkillId} ->
            NewSkills = lists:keystore(SkillId,
                                       #child_skill.id,
                                       Skills,
                                       Skill),
            merge_upgrade(Attr,
                          NewSkills,
                          T,
                          [SkillId | AddSkills]);
        _ -> merge_upgrade(Attr, Skills, T, AddSkills)
    end;
merge_upgrade(Attr, Skills,
              [A = #attr_base{name = Name, val = Val} | T],
              AddSkills) ->
    NewA = case lists:keyfind(Name, #attr_base.name, Attr)
               of
               false -> A#attr_base{flag = 0};
               #attr_base{val = Val2} -> A#attr_base{val = Val + Val2}
           end,
    NewAttr = lists:keystore(Name,
                             #attr_base.name,
                             Attr,
                             NewA),
    merge_upgrade(NewAttr, Skills, T, AddSkills).

calc_attr(Ac = #attr_calc{},
          #child{stones = Stones, grade_attr = GradeAttr}) ->
    Ac1 = do_calc_stone(Ac, Stones),
    case attr_type:do_attr(GradeAttr, Ac1) of
        {false, Reason} ->
            logger:error("子女进阶属性无法计算:~w,~w",
                         [GradeAttr, Reason],
                         child_stone,
                         248),
            Ac1;
        {ok, NewAc} -> NewAc
    end.

do_calc_stone(Ac, []) -> Ac;
do_calc_stone(Ac,
              [#child_stone{base_id = BaseId, attr = TAttr} | T]) ->
    Attr = get_recalc_attr(BaseId, TAttr, []),
    case attr_type:do_attr(Attr, Ac) of
        {false, Reason} ->
            logger:error("子女装备属性计算出错[~w]:[~w]",
                         [Attr, Reason],
                         child_stone,
                         259),
            do_calc_stone(Ac, T);
        {ok, NewAc} -> do_calc_stone(NewAc, T)
    end.

get_recalc_attr(_, [], List) -> lists:reverse(List);
get_recalc_attr(BaseId,
                [A = #attr_base{name = 100} | T], List) ->
    get_recalc_attr(BaseId, T, [A | List]);
get_recalc_attr(BaseId, [A = #attr_base{flag = 0} | T],
                List) ->
    get_recalc_attr(BaseId, T, [A | List]);
get_recalc_attr(BaseId, [A | T], List) ->
    get_recalc_attr(BaseId, T, [A | List]).

use_stone(Role, Item = #item{base_id = BaseId}, ChildId,
          HoleId) ->
    case child_util:find_child(Role, ChildId, [3]) of
        {true,
         Child = #child{base_id = ChildBaseId, grade = Grade,
                        lev = ChildLev}} ->
            case check_stone(ChildBaseId,
                             Grade,
                             HoleId,
                             BaseId,
                             ChildLev)
                of
                true -> do_use_stone(Role, Item, Child, HoleId);
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

do_use_stone(Role = #role{id = RoleId, name = PName},
             Item = #item{id = ItemId},
             Child = #child{stones = Stones, skills = Skills,
                            base_id = BaseId, grade = Grade, name = CName},
             HoleId) ->
    IsMaxGrade = case child_data:get_grade({BaseId,
                                            Grade + 1})
                     of
                     #{add_apt := _AddApt} -> 0;
                     _ -> 1
                 end,
    case loss_stone(ItemId,
                    HoleId,
                    Stones,
                    IsMaxGrade,
                    Role)
        of
        {false, Reason} -> {false, Reason};
        {ok, NewRole, ReplyMsg} ->
            Stone1 = item_to_stone(Item#item{id = HoleId,
                                             quantity = 1}),
            NewStone = Stone1#child_stone{role_id = RoleId},
            NewStones = lists:keystore(HoleId,
                                       #child_stone.id,
                                       Stones,
                                       NewStone),
            NewSkills = calc_stone_skill(Skills, NewStones),
            Child1 = child_attr:calc(Child#child{stones = NewStones,
                                                 skills = NewSkills},
                                     NewRole),
            NewRole2 = child:update_kids(NewRole, Child1),
            logger:debug("使用保湿-----", [], child_stone, 310),
            case child_util:update_child(NewRole2, Child1) of
                true ->
                    child_util:push(NewRole2, 18603, Child1),
                    child_util:push(NewRole2, 18604, Child1),
                    child_util:push(NewRole2, 18605, Child1),
                    NewRole3 = child_util:evt_child(NewRole2, Child1),
                    LastMsg = case ReplyMsg of
                                  {Origin, Item = #item{base_id = OldBaseId}} ->
                                      Title = lang:get("子女装备"),
                                      Content =
                                          notice:format(lang:get("你给~ts穿戴的~ts现已被~ts换下并返回给你，请查收"),
                                                        [{role_2, CName},
                                                         {item_2, OldBaseId},
                                                         {role_2, PName}]),
                                      mail:send(Origin,
                                                #{title => Title,
                                                  content => Content,
                                                  items => [Item]}),
                                      lang:get("装备替换成功");
                                  _ -> ReplyMsg
                              end,
                    child_util:notice_code(RoleId,
                                           Child1,
                                           18603,
                                           {[Child1]}),
                    child_util:notice_code(RoleId,
                                           Child1,
                                           18604,
                                           {[Child1]}),
                    child_util:notice_code(RoleId,
                                           Child1,
                                           18605,
                                           {[Child1]}),
                    child_util:notice_update(RoleId, Child1),
                    log:child(NewRole3, "穿装备", Child, Child1),
                    {ok, NewRole3, LastMsg};
                {false, Reason} -> {false, Reason}
            end
    end.

loss_stone(ItemId, HoleId, Stones, IsMaxGrade,
           Role = #role{id = RoleId}) ->
    Loss = [#loss{label = item_id, val = [{ItemId, 1}]}],
    case role_gain:do(Loss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, Role1} ->
            case lists:keyfind(HoleId, #item.id, Stones) of
                OldStone = #child_stone{base_id = BaseId,
                                        role_id = Origin} ->
                    case IsMaxGrade of
                        1 ->
                            Msg = notice:format(lang:get("装备替换成功，原有的~ts被覆盖了"),
                                                [{item_2, BaseId}]),
                            {ok, Role1, Msg};
                        _ ->
                            case stone_to_item(OldStone) of
                                OldItem = #item{} when Origin =:= RoleId ->
                                    Gain = [#gain{label = items,
                                                  val = [OldItem]}],
                                    case role_gain:do(Gain, Role1) of
                                        {false, #gain{msg = Msg}} ->
                                            {false, Msg};
                                        {ok, Role2} ->
                                            {ok, Role2, lang:get("装备替换成功")}
                                    end;
                                OldItem = #item{} ->
                                    {ok, Role1, {Origin, OldItem}};
                                _ -> {false, lang:get("无法获得装备道具")}
                            end
                    end;
                false -> {ok, Role1, lang:get("装备装备成功")}
            end
    end.

stone_to_item(#child_stone{base_id = BaseId,
                           attr = Attr, extra = Extra,
                           reset_attr = ResetAttr}) ->
    case item:make(BaseId, 1, 1) of
        {ok, [Item]} ->
            Item#item{attr = Attr, extra = Extra,
                      reset_attr = ResetAttr};
        _ -> false
    end.

item_to_stone(#item{id = Id, type = Type,
                    base_id = BaseId, attr = Attr, extra = Extra,
                    reset_attr = ResetAttr}) ->
    #child_stone{id = Id, base_id = BaseId, type = Type,
                 attr = Attr, extra = Extra, reset_attr = ResetAttr}.

calc_stone_skill(Skills, Stones) ->
    BaseSkills = [S
                  || S = #child_skill{source = Source} <- Skills,
                     lists:member(Source, [1, 2]) =:= true],
    do_calc_stone_skill(BaseSkills, Stones).

do_calc_stone_skill(Skills, []) -> Skills;
do_calc_stone_skill(Skills,
                    [#child_stone{attr = Attr, type = 104} | T]) ->
    StoneSkills = child_skill:attr_to_skill(Attr, 3),
    do_calc_stone_skill(Skills ++ StoneSkills, T);
do_calc_stone_skill(Skills, [_ | T]) ->
    do_calc_stone_skill(Skills, T).

remove_stone(Role, ChildId, HoleId) ->
    case child_util:find_child(Role, ChildId, [3]) of
        {true,
         Child = #child{base_id = BaseId, grade = Grade}} ->
            IsMaxGrade = case child_data:get_grade({BaseId,
                                                    Grade + 1})
                             of
                             #{add_apt := _AddApt} -> 0;
                             _ -> 1
                         end,
            case IsMaxGrade =:= 1 of
                true -> {false, lang:get("当前进阶阶段无法卸下装备，只能替换")};
                false -> do_remove_stone(Role, Child, HoleId)
            end;
        {false, Reason} -> {false, Reason}
    end.

do_remove_stone(Role = #role{id = RoleId, name = PName},
                Child = #child{stones = Stones, skills = Skills,
                               name = CName},
                HoleId) ->
    case lists:keyfind(HoleId, #child_stone.id, Stones) of
        OldStone = #child_stone{role_id = Origin} ->
            case stone_to_item(OldStone) of
                OldItem = #item{} when Origin =:= RoleId ->
                    Gain = [#gain{label = items, val = [OldItem]}],
                    case role_gain:do(Gain, Role) of
                        {false, #gain{msg = Msg}} -> {false, Msg};
                        {ok, Role1} ->
                            NewStones = lists:keydelete(HoleId,
                                                        #child_stone.id,
                                                        Stones),
                            NewSkills = calc_stone_skill(Skills, NewStones),
                            Child1 = child_attr:calc(Child#child{stones =
                                                                     NewStones,
                                                                 skills =
                                                                     NewSkills},
                                                     Role1),
                            NewRole = child:update_kids(Role1, Child1),
                            case child_util:update_child(NewRole, Child1) of
                                true ->
                                    child_util:push(NewRole, 18603, Child1),
                                    child_util:push(NewRole, 18604, Child1),
                                    child_util:push(NewRole, 18605, Child1),
                                    NewRole1 = child_util:evt_child(NewRole,
                                                                    Child1),
                                    child_util:notice_code(RoleId,
                                                           Child1,
                                                           18603,
                                                           {[Child1]}),
                                    child_util:notice_code(RoleId,
                                                           Child1,
                                                           18604,
                                                           {[Child1]}),
                                    child_util:notice_code(RoleId,
                                                           Child1,
                                                           18605,
                                                           {[Child1]}),
                                    child_util:notice_update(RoleId, Child1),
                                    log:child(NewRole1, "脱装备", Child, Child1),
                                    {ok, NewRole1};
                                {false, Reason} -> {false, Reason}
                            end
                    end;
                OldItem = #item{base_id = OldBaseId} ->
                    NewStones = lists:keydelete(HoleId,
                                                #child_stone.id,
                                                Stones),
                    NewSkills = calc_stone_skill(Skills, NewStones),
                    Child1 = child_attr:calc(Child#child{stones = NewStones,
                                                         skills = NewSkills}),
                    NewRole = child:update_kids(Role, Child1),
                    case child_util:update_child(NewRole, Child1) of
                        true ->
                            child_util:push(NewRole, 18603, Child1),
                            child_util:push(NewRole, 18604, Child1),
                            child_util:push(NewRole, 18605, Child1),
                            NewRole1 = child_util:evt_child(NewRole, Child1),
                            child_util:notice_code(RoleId,
                                                   Child1,
                                                   18603,
                                                   {[Child1]}),
                            child_util:notice_code(RoleId,
                                                   Child1,
                                                   18604,
                                                   {[Child1]}),
                            child_util:notice_code(RoleId,
                                                   Child1,
                                                   18605,
                                                   {[Child1]}),
                            child_util:notice_update(RoleId, Child1),
                            Title = lang:get("子女装备"),
                            Content =
                                notice:format(lang:get("你给~ts穿戴的~ts现已被~ts换下并返回给你，请查收"),
                                              [{role_2, CName},
                                               {item_2, OldBaseId},
                                               {role_2, PName}]),
                            mail:send(Origin,
                                      #{title => Title, content => Content,
                                        items => [OldItem]}),
                            log:child(NewRole1, "脱装备", Child, Child1),
                            {ok, NewRole1};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("当前装备不可卸下")}
            end;
        _ -> {false, lang:get("当前孔没有可卸下的装备")}
    end.

reset_stone(Stone = #item{id = Id, base_id = BaseId,
                          type = 104, attr = Attr, data = Data},
            Role = #role{}) ->
    case pet_data:get_reset(BaseId) of
        #{loss := LossVal} ->
            Loss = format:val_to_loss(LossVal,
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("孩子护符重置")}),
            case role_gain:do(Loss, Role) of
                {false, _} -> {false, lang:get("道具不足，无法重置")};
                {ok, NewRole = #role{p_bag = Pbag}} ->
                    case do_reset_stone(BaseId, Attr) of
                        {true, NewAttr} ->
                            NewData = lists:keystore(7, 1, Data, {7, NewAttr}),
                            NewStone = Stone#item{data = NewData},
                            logger:debug("新的技能属性 ~w",
                                         [NewAttr],
                                         child_stone,
                                         490),
                            {ok, NewPbag, _} = package:fresh_item(Stone,
                                                                  NewStone,
                                                                  Pbag,
                                                                  NewRole),
                            NewRole1 = NewRole#role{p_bag = NewPbag},
                            role:link_send(Role, 10563, {Id, NewAttr}),
                            log:eqm(NewRole1,
                                    "孩子护符重置",
                                    Stone,
                                    NewStone,
                                    {stone_skill, NewAttr}),
                            {ok, NewRole1};
                        {false, Reason} -> {false, Reason}
                    end
            end;
        _ -> {false, lang:get("只有技能符石才能重置")}
    end.

do_reset_stone(BaseId, AttrList) ->
    case pet_data:get_stone_skill(BaseId) of
        {0, _} -> {false, lang:get("当前装备不能重置")};
        {_, List1, List2} ->
            Len = length([S
                          || S = #attr_base{name = 100} <- AttrList]),
            case Len > 0 of
                true ->
                    case find_skill(Len, List1, List2) of
                        {true, SkillList} ->
                            Skills = [SkillId || {SkillId, _} <- SkillList],
                            NewAttrList = [#attr_base{type = 0, name = 100,
                                                      val = SkillId}
                                           || SkillId <- Skills],
                            {true, NewAttrList};
                        {false, Reason} -> {false, Reason}
                    end;
                false -> {false, lang:get("只有拥有技能的装备才能重置")}
            end;
        _ -> {false, lang:get("只有拥有技能的装备才能重置")}
    end.

find_skill(1, List1, _List2) ->
    {true, [util:rand_list(List1, 2)]};
find_skill(Len, List1, List2) when Len >= 2 ->
    {SkillId1, _} = S1 = util:rand_list(List1, 2),
    NewList2 = lists:keydelete(SkillId1, 1, List2),
    S2 = util:rand_list(NewList2, 2),
    {true, [S1, S2]};
find_skill(_, _, _) ->
    {false, lang:get("只有拥有技能的装备才能重置")}.

save_stone(Stone = #item{id = Id, data = Data,
                         attr = OldAttr},
           Role = #role{p_bag = Pbag}) ->
    case lists:keyfind(7, 1, Data) of
        {_, NewAttr = [_ | _]} ->
            OldName = get_pet_skill_name(OldAttr),
            NewName = get_pet_skill_name(NewAttr),
            NewData = lists:keydelete(7, 1, Data),
            NewStone = Stone#item{attr = NewAttr, data = NewData},
            logger:debug("旧技能名字 ~ts, 新技能名字 ~ts 新的技能属性 ~w",
                         [OldName, NewName, NewAttr],
                         child_stone,
                         548),
            {ok, NewPbag, _} = package:fresh_item(Stone,
                                                  NewStone,
                                                  Pbag,
                                                  Role),
            NewRole = Role#role{p_bag = NewPbag},
            role:link_send(Role, 10563, {Id, []}),
            log:eqm(NewRole, "孩子护符重置保存", Stone, NewStone),
            {ok,
             NewRole,
             notice:format(lang:get("护符技能从~ts成功保存为~ts"),
                           [{string_2, 5, OldName}, {string_2, 5, NewName}])};
        _ -> {false, lang:get("没有可保存技能")}
    end.

get_pet_skill_name(Attr) ->
    string:join([io_lib:format("~ts",
                               [do_get_pet_skil_name(Val)])
                 || #attr_base{val = Val} <- Attr],
                "、").

do_get_pet_skil_name(Val) ->
    logger:debug(" ~w ~w",
                 [Val, skill_data:get_pet({Val, 1})],
                 child_stone,
                 563),
    case skill_data:get_pet({Val, 1}) of
        #pet_base_skill{name = Name} -> Name;
        _ -> ""
    end.

rand_attr(BaseId, IsBase) ->
    case child_data:get_stone(BaseId) of
        #{attr_names := AttrNames = [_ | _],
          attr_vals := AttrVals = [_ | _]} ->
            {AttrName, _} = util:rand_list(AttrNames, 2),
            AttrVal = case IsBase of
                          1 -> lists:min([V || {V, _} <- AttrVals]);
                          _ ->
                              {V, _} = util:rand_list(AttrVals, 2),
                              V
                      end,
            Attr = attr_type:to_attr(base, [{AttrName, AttrVal}]),
            Attr;
        _ -> []
    end.

