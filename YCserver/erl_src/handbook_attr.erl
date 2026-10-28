-file("src/mod/handbook/handbook_attr.erl", 1).

-module(handbook_attr).

-export([login/1,
         calc_attr/2,
         calc_book/2,
         calc_pet/3,
         calc_child/3,
         calc_guard/3,
         update_book/2,
         calc_point/1,
         calc_set_fc/1,
         calc_handbook_show/2,
         calc_child_handbook_show/2]).

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

-file("src/mod/handbook/handbook_attr.erl", 24).

-file("inc/handbook.hrl", 1).

-record(m_handbook,
        {ver = 4,
         book_list = [],
         set_list = [],
         auto_book_id = 0,
         store_items = [],
         next_time = 0,
         need_list = [],
         ban_speed_set_list = []}).

-record(handbook_item,
        {idx = 0, id = 0, num = 1, val = 0, flag = 0}).

-record(handbook,
        {ver = 4,
         id = 0,
         status = 0,
         active_step = 0,
         star_step = 0,
         star_val = 0,
         transform_point = 0,
         active_effect_type = 3,
         active_attr = [],
         star_effect_type = 1,
         star_effect_list = [],
         star_attr = [],
         add_point = 0}).

-record(handbook_base,
        {id,
         name = "",
         level_limit = 0,
         lev = 0,
         grade_lev = 1,
         grade_type = 1,
         effect_type = 1,
         active_reward = [],
         set_id = [],
         allow_item = [],
         active_loss = [],
         star_loss = [],
         transform_point = 1,
         max_active_step = 2,
         max_star_step = 2,
         fc = 0,
         fc1 = 0,
         fc2 = 0,
         fuse_flag = 0,
         fuse_id = 0,
         times = 0,
         illusion_id = 0,
         fuse_num1 = 0,
         lev_num1 = 0,
         fuse_num2 = 0,
         lev_num2 = 0,
         fuse_num3 = 0,
         lev_num3 = 0,
         target_id = 0,
         universal = 0,
         bind = 1}).

-file("src/mod/handbook/handbook_attr.erl", 25).

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

-file("src/mod/handbook/handbook_attr.erl", 26).

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

-file("src/mod/handbook/handbook_attr.erl", 27).

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

-file("src/mod/handbook/handbook_attr.erl", 28).

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

-file("src/mod/handbook/handbook_attr.erl", 29).

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

-file("src/mod/handbook/handbook_attr.erl", 30).

login(#role{m_handbook =
                #m_handbook{book_list = []}}) ->
    ok;
login(Role = #role{m_attr_point =
                       Mattr = #m_attr_point{ext_point = ExtPoint},
                   m_handbook =
                       MhandBook = #m_handbook{book_list = BookList},
                   lev = Level}) ->
    NewBookList = [calc_book(Book, Role)
                   || Book = #handbook{} <- BookList],
    NewMhandBook = MhandBook#m_handbook{book_list =
                                            NewBookList},
    Role1 = Role#role{m_handbook = NewMhandBook},
    NewBookList2 = do_remove_nouse_book(NewBookList, Level),
    AllPoint = get_all_point(NewBookList2),
    OldPoint1 = case lists:keyfind(3, 1, ExtPoint) of
                    {_, OldPoint} -> OldPoint;
                    _ -> 0
                end,
    NewMattr = case AllPoint >= OldPoint1 of
                   true ->
                       NewExtPoint = lists:keystore(3,
                                                    1,
                                                    ExtPoint,
                                                    {3, AllPoint}),
                       Mattr#m_attr_point{ext_point = NewExtPoint};
                   false -> reset_point(OldPoint1, AllPoint, Role1)
               end,
    NewRole = Role1#role{m_attr_point = NewMattr},
    {ok, NewRole}.

calc_book(Book = #handbook{id = BookId,
                           star_step = StarStep, status = Status},
          _Role) ->
    case Status of
        0 ->
            Book#handbook{active_attr = [], star_effect_list = [],
                          star_attr = []};
        _ ->
            case handbook_data:get_attr({BookId, StarStep}) of
                #{active_effect_type := ActiveType,
                  active_attr := ActiveAttr,
                  star_effect_type := StarEffctType,
                  star_effect_list := StarEffectList,
                  star_attr := StarAttr, add_point := AddPoint} ->
                    Book#handbook{active_effect_type = ActiveType,
                                  active_attr = ActiveAttr,
                                  star_effect_type = StarEffctType,
                                  star_effect_list = StarEffectList,
                                  star_attr = StarAttr, add_point = AddPoint};
                _ ->
                    Book#handbook{active_attr = [], star_effect_list = [],
                                  star_attr = [], add_point = 0}
            end
    end.

calc_point(Role = #role{m_attr_point =
                            Mattr = #m_attr_point{ext_point = ExtPoint},
                        m_handbook = #m_handbook{book_list = BookList},
                        lev = Level}) ->
    BookList2 = do_remove_nouse_book(BookList, Level),
    AllPoint = get_all_point(BookList2),
    case lists:keyfind(3, 1, ExtPoint) of
        {_, NowPoint} ->
            case AllPoint >= NowPoint of
                true ->
                    NewExtPoint = lists:keystore(3,
                                                 1,
                                                 ExtPoint,
                                                 {3, AllPoint}),
                    NewMattr = Mattr#m_attr_point{ext_point = NewExtPoint},
                    Role1 = Role#role{m_attr_point = NewMattr},
                    attr:push_10007(Role1),
                    attr:push_10023(Role1),
                    {0, Role1};
                false ->
                    NewMattr = reset_point(NowPoint, AllPoint, Role),
                    Role1 = Role#role{m_attr_point = NewMattr},
                    {1, Role1}
            end;
        _ ->
            NewExtPoint = lists:keystore(3,
                                         1,
                                         ExtPoint,
                                         {3, AllPoint}),
            NewMattr = Mattr#m_attr_point{ext_point = NewExtPoint},
            Role1 = Role#role{m_attr_point = NewMattr},
            attr:push_10007(Role1),
            attr:push_10023(Role1),
            {0, Role1}
    end.

reset_point(OldAllPoint, NewAllPoint,
            #role{m_attr_point =
                      Mattr = #m_attr_point{plan_data = PlanData,
                                            ext_point = ExtPoint}}) ->
    NewPlanData = do_reset_point(OldAllPoint, PlanData),
    NewExtPoint = lists:keystore(3,
                                 1,
                                 ExtPoint,
                                 {3, NewAllPoint}),
    Mattr#m_attr_point{ext_point = NewExtPoint,
                       plan_data = NewPlanData}.

do_reset_point(OldAllPoint, PlanData) ->
    logger:debug("进行属性重新计算:~w",
                 [{OldAllPoint, PlanData}],
                 handbook_attr,
                 115),
    do_reset_point(OldAllPoint, PlanData, []).

do_reset_point(_OldAllPoint, [], NewPlanData) ->
    NewPlanData;
do_reset_point(OldAllPoint, [PL | Rest], NewPlanData) ->
    case PL of
        #attr_point_plan{strength = 0, constitution = 0,
                         magic = 0, agility = 0} ->
            do_reset_point(OldAllPoint, Rest, [PL | NewPlanData]);
        #attr_point_plan{strength = Str, constitution = Con,
                         magic = Mag, agility = Agi} ->
            All = Str + Con + Mag + Agi,
            DecStr = round(Str / All * OldAllPoint),
            DecCon = round(Con / All * OldAllPoint),
            DecMag = round(Mag / All * OldAllPoint),
            DecAgi = OldAllPoint - (DecStr + DecCon + DecMag),
            Str1 = Str - DecStr,
            Con1 = Con - DecCon,
            Mag1 = Mag - DecMag,
            Agi1 = Agi - DecAgi,
            NewPL = PL#attr_point_plan{strength = Str1,
                                       constitution = Con1, magic = Mag1,
                                       agility = Agi1},
            do_reset_point(OldAllPoint,
                           Rest,
                           [NewPL | NewPlanData]);
        false -> do_reset_point(OldAllPoint, Rest, NewPlanData)
    end.

get_all_point(BookList) -> get_all_point(BookList, 0).

get_all_point([], Point) -> Point;
get_all_point([#handbook{status = 1,
                         add_point = AddPoint}
               | T],
              Point) ->
    get_all_point(T, AddPoint + Point);
get_all_point([_ | T], Point) ->
    get_all_point(T, Point).

update_book(#handbook{status = 0}, Role) -> Role;
update_book(HandBook = #handbook{active_effect_type =
                                     ActiveEffectType,
                                 star_effect_type = StarEffectType,
                                 star_effect_list = StarEffectList},
            Role = #role{id = RoleId, m_pet = #m_pet{pets = Pets},
                         m_guard = #m_guard{guards = Guards},
                         m_child = #m_child{kids = Kids}, lev = Level}) ->
    case check_book_level_limit(HandBook, Level) of
        true ->
            NewRole1 = case ActiveEffectType =:= 1 of
                           true ->
                               Role1 = do_update_pet(Pets, Role, []),
                               do_update_child(Kids, Role1, []);
                           false ->
                               case StarEffectType =:= 1 of
                                   true ->
                                       EffPetList = [Pet
                                                     || Pet = #pet{base_id =
                                                                       BaseId}
                                                            <- Pets,
                                                        StarEffectList =:= [0]
                                                            orelse
                                                            lists:member(BaseId,
                                                                         StarEffectList)
                                                                =:= true],
                                       Role1 = do_update_pet(EffPetList,
                                                             Role,
                                                             []),
                                       EffChildList = [Child
                                                       || Child = #child{base_id
                                                                             =
                                                                             BaseId,
                                                                         stage =
                                                                             Stage,
                                                                         status
                                                                             =
                                                                             Status,
                                                                         follow
                                                                             =
                                                                             Follow}
                                                              <- Kids,
                                                          Stage =:= 3 andalso
                                                              Status =:= 1
                                                                  andalso
                                                                  Follow =:=
                                                                      RoleId
                                                                      andalso
                                                                      (StarEffectList
                                                                           =:=
                                                                           [0]
                                                                           orelse
                                                                           lists:member(BaseId,
                                                                                        StarEffectList)
                                                                               =:=
                                                                               true)],
                                       do_update_child(EffChildList, Role1, []);
                                   false -> Role
                               end
                       end,
            NewRole3 = case ActiveEffectType =:= 2 orelse
                                StarEffectType =:= 2
                           of
                           true ->
                               NewRole2 = guard_attr:batch_calc(Guards,
                                                                NewRole1),
                               guard_api:push_guards(NewRole2),
                               NewRole2;
                           false -> NewRole1
                       end,
            NewRole3;
        false -> Role
    end;
update_book(Data, Role) ->
    logger:info("===============~w",
                [Data],
                handbook_attr,
                194),
    Role.

do_update_pet([],
              Role = #role{m_pet = Mpet = #m_pet{pets = Pets}},
              PetList) ->
    Fun = fun (Pet = #pet{id = PetId}, AllPets) ->
                  lists:keystore(PetId, #pet.id, AllPets, Pet)
          end,
    NewPets = lists:foldl(Fun, Pets, PetList),
    NewMpet = Mpet#m_pet{pets = NewPets},
    NewRole = Role#role{m_pet = NewMpet},
    NewRole;
do_update_pet([Pet = #pet{} | T], Role, PetList) ->
    {ok, NewPet, Role1} = pet_attr:calc(Pet, Role),
    pet:push_10503(Role1, NewPet),
    do_update_pet(T, Role1, [NewPet | PetList]).

do_update_child([], Role = #role{}, ChildList) ->
    Fun = fun (Child, Role1) ->
                  Role2 = child:update_kids(Role1, Child),
                  child:update(Child),
                  Role2
          end,
    NewRole = lists:foldl(Fun, Role, ChildList),
    NewRole;
do_update_child([Child = #child{stage = 3, status = 1,
                                follow = RoleId}
                 | T],
                Role = #role{id = RoleId}, ChildList) ->
    NewChild = child_attr:calc(Child, Role),
    child_util:push(Role, 18603, NewChild),
    do_update_child(T, Role, [NewChild | ChildList]);
do_update_child([_ | T], Role, ChildList) ->
    do_update_child(T, Role, ChildList).

calc_attr(Ac = #attr_calc{},
          _Role = #role{m_handbook =
                            #m_handbook{book_list = BookList,
                                        ban_speed_set_list = BanSpeedList},
                        lev = Level}) ->
    BookList2 = do_remove_nouse_book(BookList, Level),
    Ac1 = calc_role_attr(Ac, BookList2),
    Ac2 = calc_set_attr(Ac1,
                        BookList2,
                        Level,
                        BanSpeedList),
    Ac2.

calc_pet(Ac = #attr_calc{}, #pet{base_id = BaseId},
         _Role = #role{m_handbook =
                           #m_handbook{book_list = BookList},
                       lev = Level}) ->
    Fun = fun (#handbook{status = 1,
                         active_effect_type = ActiveEffectType,
                         active_attr = ActiveAttr,
                         star_effect_type = StarEffctType,
                         star_effect_list = StarEffectList,
                         star_attr = StarAttr},
               AttrList) ->
                  Attr1 = case ActiveEffectType =:= 1 of
                              true -> ActiveAttr;
                              false -> []
                          end,
                  Attr2 = case StarEffctType =:= 1 of
                              true ->
                                  case StarEffectList =:= [0] of
                                      true -> StarAttr;
                                      false ->
                                          case lists:keyfind(BaseId,
                                                             1,
                                                             StarEffectList)
                                              of
                                              {_, S, E} ->
                                                  lists:sublist(StarAttr,
                                                                S,
                                                                max(E - S + 1,
                                                                    0));
                                              _ ->
                                                  case lists:keyfind(0,
                                                                     1,
                                                                     StarEffectList)
                                                      of
                                                      {_, S, E} ->
                                                          lists:sublist(StarAttr,
                                                                        S,
                                                                        max(E -
                                                                                S
                                                                                +
                                                                                1,
                                                                            0));
                                                      _ -> []
                                                  end
                                          end
                                  end;
                              false -> []
                          end,
                  Attr1 ++ Attr2 ++ AttrList;
              (_, AttrList) -> AttrList
          end,
    BookList2 = do_remove_nouse_book(BookList, Level),
    BookAttrList = lists:foldl(Fun, [], BookList2),
    BookAttrList1 = attr_type:to_attr(fixed, BookAttrList),
    case attr_type:do_attr(BookAttrList1, Ac) of
        {false, Reason} ->
            logger:error("宠物[~w]属性计算失败:~w",
                         [BaseId, Reason],
                         handbook_attr,
                         275),
            Ac;
        {ok, NewAc} -> NewAc
    end.

calc_child(Ac = #attr_calc{}, #child{base_id = BaseId},
           _Role = #role{m_handbook =
                             #m_handbook{book_list = BookList},
                         lev = Level}) ->
    Fun = fun (#handbook{status = 1,
                         active_effect_type = ActiveEffectType,
                         active_attr = ActiveAttr,
                         star_effect_type = StarEffctType,
                         star_effect_list = StarEffectList,
                         star_attr = StarAttr},
               AttrList) ->
                  Attr1 = case ActiveEffectType =:= 1 of
                              true -> ActiveAttr;
                              false -> []
                          end,
                  Attr2 = case StarEffctType =:= 1 of
                              true ->
                                  case StarEffectList =:= [0] of
                                      true -> StarAttr;
                                      false ->
                                          case lists:keyfind(BaseId,
                                                             1,
                                                             StarEffectList)
                                              of
                                              {_, S, E} ->
                                                  lists:sublist(StarAttr,
                                                                S,
                                                                max(E - S + 1,
                                                                    0));
                                              _ ->
                                                  case lists:keyfind(0,
                                                                     1,
                                                                     StarEffectList)
                                                      of
                                                      {_, S, E} ->
                                                          lists:sublist(StarAttr,
                                                                        S,
                                                                        max(E -
                                                                                S
                                                                                +
                                                                                1,
                                                                            0));
                                                      _ -> []
                                                  end
                                          end
                                  end;
                              false -> []
                          end,
                  logger:debug("~w:激活属性:~w,星属性:~w",
                               [BaseId, Attr1, Attr2],
                               handbook_attr,
                               309),
                  Attr1 ++ Attr2 ++ AttrList;
              (_, AttrList) -> AttrList
          end,
    BookList2 = do_remove_nouse_book(BookList, Level),
    BookAttrList = lists:foldl(Fun, [], BookList2),
    BookAttrList1 = attr_type:to_attr(fixed, BookAttrList),
    case attr_type:do_attr(BookAttrList1, Ac) of
        {false, Reason} ->
            logger:error("孩子[~w]属性计算失败:~w",
                         [BaseId, Reason],
                         handbook_attr,
                         319),
            Ac;
        {ok, NewAc} -> NewAc
    end.

calc_handbook_show(_Pet = #pet{base_id = BaseId},
                   #role{m_handbook = #m_handbook{book_list = BookList},
                         lev = Level}) ->
    Fun = fun (#handbook{status = 1, star_step = StarStep,
                         active_effect_type = ActiveEffectType,
                         active_attr = ActiveAttr,
                         star_effect_type = StarEffctType,
                         star_effect_list = StarEffectList,
                         star_attr = StarAttr},
               {Hnum, SHnum, AttrList}) ->
                  {Attr1, Add} = case ActiveEffectType =:= 1 of
                                     true -> {ActiveAttr, 1};
                                     false -> {[], 0}
                                 end,
                  Attr2 = case StarEffctType =:= 1 of
                              true ->
                                  case StarEffectList =:= [0] of
                                      true -> StarAttr;
                                      false ->
                                          case lists:keyfind(BaseId,
                                                             1,
                                                             StarEffectList)
                                              of
                                              {_, S, E} ->
                                                  lists:sublist(StarAttr,
                                                                S,
                                                                max(E - S + 1,
                                                                    0));
                                              _ ->
                                                  case lists:keyfind(0,
                                                                     1,
                                                                     StarEffectList)
                                                      of
                                                      {_, S, E} ->
                                                          lists:sublist(StarAttr,
                                                                        S,
                                                                        max(E -
                                                                                S
                                                                                +
                                                                                1,
                                                                            0));
                                                      _ -> []
                                                  end
                                          end
                                  end;
                              false -> []
                          end,
                  AddS = case StarEffctType =:= 1 andalso StarStep >= 1 of
                             true -> 1;
                             _ -> 0
                         end,
                  logger:debug("~w:激活属性:~w,星属性:~w",
                               [BaseId, Attr1, Attr2],
                               handbook_attr,
                               356),
                  {Hnum + Add, SHnum + AddS, Attr1 ++ Attr2 ++ AttrList};
              (_, {Hnum, SHnum, AttrList}) -> {Hnum, SHnum, AttrList}
          end,
    BookList2 = do_remove_nouse_book(BookList, Level),
    {HandbookNum, StarHandBookNum, BookAttrList} =
        lists:foldl(Fun, {0, 0, []}, BookList2),
    BookAttrList1 = merge_handbook_attr(BookAttrList, []),
    {HandbookNum, StarHandBookNum, BookAttrList1}.

calc_child_handbook_show(#child{base_id = BaseId,
                                stage = 3},
                         #role{m_handbook = #m_handbook{book_list = BookList},
                               lev = Level}) ->
    Fun = fun (#handbook{status = 1, star_step = StarStep,
                         active_effect_type = ActiveEffectType,
                         active_attr = ActiveAttr,
                         star_effect_type = StarEffctType,
                         star_effect_list = StarEffectList,
                         star_attr = StarAttr},
               {Hnum, SHnum, AttrList}) ->
                  {Attr1, Add} = case ActiveEffectType =:= 1 of
                                     true -> {ActiveAttr, 1};
                                     false -> {[], 0}
                                 end,
                  Attr2 = case StarEffctType =:= 1 of
                              true ->
                                  case StarEffectList =:= [0] of
                                      true -> StarAttr;
                                      false ->
                                          case lists:keyfind(BaseId,
                                                             1,
                                                             StarEffectList)
                                              of
                                              {_, S, E} ->
                                                  lists:sublist(StarAttr,
                                                                S,
                                                                max(E - S + 1,
                                                                    0));
                                              _ ->
                                                  case lists:keyfind(0,
                                                                     1,
                                                                     StarEffectList)
                                                      of
                                                      {_, S, E} ->
                                                          lists:sublist(StarAttr,
                                                                        S,
                                                                        max(E -
                                                                                S
                                                                                +
                                                                                1,
                                                                            0));
                                                      _ -> []
                                                  end
                                          end
                                  end;
                              false -> []
                          end,
                  AddS = case StarEffctType =:= 1 andalso StarStep >= 1 of
                             true -> 1;
                             _ -> 0
                         end,
                  logger:debug("~w:激活属性:~w,星属性:~w",
                               [BaseId, Attr1, Attr2],
                               handbook_attr,
                               397),
                  {Hnum + Add, SHnum + AddS, Attr1 ++ Attr2 ++ AttrList};
              (_, {Hnum, SHnum, AttrList}) -> {Hnum, SHnum, AttrList}
          end,
    BookList2 = do_remove_nouse_book(BookList, Level),
    {HandbookNum, StarHandBookNum, BookAttrList} =
        lists:foldl(Fun, {0, 0, []}, BookList2),
    BookAttrList1 = merge_handbook_attr(BookAttrList, []),
    {HandbookNum, StarHandBookNum, BookAttrList1};
calc_child_handbook_show(_, _) -> {0, 0, []}.

merge_handbook_attr([], AttrList) -> AttrList;
merge_handbook_attr([{AttrName, AttrVal} | T],
                    AttrList) ->
    case lists:keyfind(AttrName, 1, AttrList) of
        {_, AttrVal2} ->
            merge_handbook_attr(T,
                                lists:keystore(AttrName,
                                               1,
                                               AttrList,
                                               {AttrName, AttrVal + AttrVal2}));
        _ ->
            merge_handbook_attr(T, [{AttrName, AttrVal} | AttrList])
    end;
merge_handbook_attr([_ | T], AttrList) ->
    merge_handbook_attr(T, AttrList).

calc_guard(Ac = #attr_calc{}, #guard{},
           _Role = #role{m_handbook =
                             #m_handbook{book_list = []}}) ->
    Ac;
calc_guard(Ac = #attr_calc{}, #guard{base_id = BaseId},
           _Role = #role{m_handbook =
                             #m_handbook{book_list = BookList},
                         lev = Level}) ->
    Fun = fun (#handbook{status = 1,
                         active_effect_type = ActiveEffectType,
                         active_attr = ActiveAttr,
                         star_effect_type = StarEffctType,
                         star_effect_list = StarEffectList,
                         star_attr = StarAttr},
               AttrList) ->
                  Attr1 = case ActiveEffectType =:= 2 of
                              true -> ActiveAttr;
                              false -> []
                          end,
                  Attr2 = case StarEffctType =:= 2 of
                              true ->
                                  case StarEffectList =:= [0] of
                                      true -> StarAttr;
                                      false ->
                                          case lists:member(BaseId,
                                                            StarEffectList)
                                              of
                                              true -> StarAttr;
                                              false -> []
                                          end
                                  end;
                              false -> []
                          end,
                  Attr1 ++ Attr2 ++ AttrList;
              (_, AttrList) -> AttrList
          end,
    BookList2 = do_remove_nouse_book(BookList, Level),
    BookAttrList = lists:foldl(Fun, [], BookList2),
    BookAttrList1 = attr_type:to_attr(fixed, BookAttrList),
    case attr_type:do_attr(BookAttrList1, Ac) of
        {false, Reason} ->
            logger:error("守护[~w]属性计算失败:~w",
                         [BaseId, Reason],
                         handbook_attr,
                         453),
            Ac;
        {ok, NewAc} -> NewAc
    end.

calc_role_attr(Ac, []) -> Ac;
calc_role_attr(Ac,
               [#handbook{id = BookId, status = 1,
                          active_effect_type = 3, active_attr = Attr = [_ | _]}
                | T]) ->
    Attr1 = attr_type:to_attr(fixed, Attr),
    NewAc = case attr_type:do_attr(Attr1, Ac) of
                {false, Reason} ->
                    logger:error("图鉴[~w]属性计算失败:~w",
                                 [BookId, Reason],
                                 handbook_attr,
                                 467),
                    Ac;
                {ok, Ac1} -> Ac1
            end,
    calc_role_attr(NewAc, T);
calc_role_attr(Ac, [_ | T]) -> calc_role_attr(Ac, T).

calc_set_fc(BookList) -> calc_set_fc(BookList, []).

calc_set_fc([], SetList) ->
    Fun = fun ({Sid, Num, StarStep}, AllFc) ->
                  case handbook_data:get_set(Sid) of
                      #{max_num := MaxNum, star_fc := Fc}
                          when Num >= MaxNum andalso StarStep >= 1 ->
                          logger:debug("==========================================:套装"
                                       ":~w:星战力s:~w",
                                       [Sid, Fc],
                                       handbook_attr,
                                       488),
                          Fc + AllFc;
                      #{max_num := MaxNum, fc := Fc} when Num >= MaxNum ->
                          logger:debug("==========================================:套装"
                                       ":~w:战力s:~w",
                                       [Sid, Fc],
                                       handbook_attr,
                                       491),
                          Fc + AllFc;
                      _ -> AllFc
                  end
          end,
    lists:foldl(Fun, 0, SetList);
calc_set_fc([#handbook{status = 1, id = BookId,
                       star_step = StarStep}
             | T],
            AllSetList) ->
    case handbook_data:get(BookId) of
        #handbook_base{set_id = SetIds} ->
            Fun = fun (Sid, SetList) ->
                          case lists:keytake(Sid, 1, SetList) of
                              {value, {_, Num, OldStarStep}, RestSetList} ->
                                  [{Sid, Num + 1, min(OldStarStep, StarStep)}
                                   | RestSetList];
                              _ -> [{Sid, 1, StarStep} | SetList]
                          end
                  end,
            NewAllSetList = lists:foldl(Fun, AllSetList, SetIds),
            calc_set_fc(T, NewAllSetList);
        _ -> calc_set_fc(T, AllSetList)
    end;
calc_set_fc([_ | T], SetList) ->
    calc_set_fc(T, SetList).

calc_set_attr(Ac, BookList, Level, BanSpeedList) ->
    SetAttrList = get_set_list(BookList,
                               [],
                               Level,
                               BanSpeedList),
    SetAttr = attr_type:to_attr(fixed, SetAttrList),
    case attr_type:do_attr(SetAttr, Ac) of
        {false, Reason} ->
            logger:error("图鉴套装属性计算失败:~w",
                         [Reason],
                         handbook_attr,
                         527),
            Ac;
        {ok, NewAc} -> NewAc
    end.

get_set_list([], SetList, Level, BanSpeedList) ->
    Fun = fun ({Sid, Num, StarStep}, AttrList) ->
                  case handbook_data:get_set(Sid) of
                      #{max_num := MaxNum, attr := Attr,
                        star_attr := StarAttr, level_limit := LevLimit}
                          when Num >= MaxNum andalso
                                   StarStep >= 1 andalso Level >= LevLimit ->
                          logger:debug("================================================",
                                       [],
                                       handbook_attr,
                                       538),
                          case is_ban_speed(Sid, BanSpeedList) of
                              false -> Attr ++ StarAttr ++ AttrList;
                              true -> ban_speed(Attr, StarAttr) ++ AttrList
                          end;
                      #{max_num := MaxNum, attr := Attr,
                        level_limit := LevLimit}
                          when Num >= MaxNum andalso Level >= LevLimit ->
                          logger:debug("================================================",
                                       [],
                                       handbook_attr,
                                       548),
                          case is_ban_speed(Sid, BanSpeedList) of
                              false -> Attr ++ AttrList;
                              true -> ban_speed(Attr, []) ++ AttrList
                          end;
                      _ -> AttrList
                  end
          end,
    lists:foldl(Fun, [], SetList);
get_set_list([#handbook{status = 1, id = BookId,
                        star_step = StarStep}
              | T],
             AllSetList, Level, BanSpeedList) ->
    case handbook_data:get(BookId) of
        #handbook_base{set_id = SetIds} ->
            Fun = fun (Sid, SetList) ->
                          case lists:keytake(Sid, 1, SetList) of
                              {value, {_, Num, OldStarStep}, RestSetList} ->
                                  [{Sid, Num + 1, min(StarStep, OldStarStep)}
                                   | RestSetList];
                              _ -> [{Sid, 1, StarStep} | SetList]
                          end
                  end,
            NewAllSetList = lists:foldl(Fun, AllSetList, SetIds),
            get_set_list(T, NewAllSetList, Level, BanSpeedList);
        _ -> get_set_list(T, AllSetList, Level, BanSpeedList)
    end;
get_set_list([_ | T], SetList, Level, BanSpeedList) ->
    get_set_list(T, SetList, Level, BanSpeedList).

is_ban_speed(SetId, BanSpeedList) ->
    case lists:keyfind(SetId, 1, BanSpeedList) of
        false -> false;
        {_Id, Flag} ->
            case Flag of
                0 -> false;
                1 -> true
            end
    end.

ban_speed(Attr, []) ->
    NewAttr = case lists:keyfind(3, 1, Attr) of
                  false -> Attr;
                  _ -> lists:keyreplace(3, 1, Attr, {3, 0})
              end,
    NewAttr;
ban_speed(Attr, StarAttr) ->
    NewAttr = ban_speed(Attr, []),
    NewStarAttr = case lists:keyfind(3, 1, StarAttr) of
                      false -> StarAttr;
                      _ -> lists:keyreplace(3, 1, StarAttr, {3, 0})
                  end,
    NewAttr ++ NewStarAttr.

do_remove_nouse_book(List, Level) ->
    do_remove_nouse_book(List, Level, []).

do_remove_nouse_book([], _Level, ResList) ->
    lists:reverse(ResList);
do_remove_nouse_book([HandBook = #handbook{status = 1,
                                           id = BookId}
                      | T],
                     Level, ResList) ->
    #handbook_base{level_limit = LevLimit} =
        handbook_data:get(BookId),
    case Level >= LevLimit of
        true ->
            do_remove_nouse_book(T, Level, [HandBook | ResList]);
        false -> do_remove_nouse_book(T, Level, ResList)
    end;
do_remove_nouse_book([_ | T], Level, ResList) ->
    do_remove_nouse_book(T, Level, ResList).

check_book_level_limit(#handbook{status = 1,
                                 id = BookId},
                       Level) ->
    #handbook_base{level_limit = LevLimit} =
        handbook_data:get(BookId),
    Level >= LevLimit;
check_book_level_limit(_, _Level) ->
    logger:debug("图鉴未激活，检测失败", [], handbook_attr, 636),
    false.

