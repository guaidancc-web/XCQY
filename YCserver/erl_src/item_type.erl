-file("src/mod/item/item_type.erl", 1).

-module(item_type).

-export([recalc/1,
         special_id/1,
         fuse_skill_stone/3,
         effect_skill_stone/2,
         adm_skill_stone/3,
         adm_eqm_skill/5,
         is_good_pet/1,
         merge_fruit/2,
         choose_pet_skill_stone/3,
         merge_lev_fruit/2]).

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

-file("src/mod/item/item_type.erl", 22).

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

-file("src/mod/item/item_type.erl", 23).

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

-file("src/mod/item/item_type.erl", 24).

-file("inc/blacksmith.hrl", 1).

-record(enchant_fail_reward,
        {val = 0,
         item_list = [],
         title = "",
         msg = "",
         is_break = 0}).

-file("src/mod/item/item_type.erl", 25).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/mod/item/item_type.erl", 26).

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

-file("src/mod/item/item_type.erl", 27).

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

-file("src/mod/item/item_type.erl", 28).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/item/item_type.erl", 29).

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

-file("src/mod/item/item_type.erl", 30).

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

-file("src/mod/item/item_type.erl", 31).

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

-file("src/mod/item/item_type.erl", 32).

recalc(Item = #item{type = Type}) ->
    Atom = if Type =:= 102 -> pet_skill_stone;
              Type =:= 101 -> pet_attr_stone;
              Type =:= 104 -> child_skill_stone;
              Type =:= 103 -> child_attr_stone;
              Type =:= 119 -> treasure;
              Type =:= 127 -> wedding_treasure;
              Type =:= 128 -> fruit_limit;
              Type =:= 145 -> wedding_treasure;
              true -> normal
           end,
    Item1 = case lists:member(Type,
                              [1, 4, 2, 3, 5, 21, 22, 6, 7, 9, 10, 11, 12, 14])
                of
                true -> eqm_attr:init_eqm(Item);
                false -> Item
            end,
    do_recalc(Atom, Item1).

do_recalc(treasure,
          Item = #item{base_id = BaseId, extra = OldExtra}) ->
    {GetM, GetX, GetY} = case treasure_data:get_list(BaseId)
                             of
                             {{_, MapList}, _} ->
                                 {MapId, _} = util:rand_list(MapList, 2),
                                 case map:rand_pos(MapId) of
                                     {X, Y} -> {MapId, X, Y};
                                     _ ->
                                         util:rand_list([{10001, 306, 3507},
                                                         {10001, 2583, 3848},
                                                         {10001, 4957, 3680},
                                                         {10001, 445, 2565},
                                                         {10001, 4646, 704},
                                                         {10001, 841, 1033},
                                                         {10001, 2098, 1834},
                                                         {10001, 3617, 1816}])
                                 end;
                             false ->
                                 logger:error("无法找到宝图:~w的坐标",
                                              [BaseId],
                                              item_type,
                                              69),
                                 util:rand_list([{10001, 306, 3507},
                                                 {10001, 2583, 3848},
                                                 {10001, 4957, 3680},
                                                 {10001, 445, 2565},
                                                 {10001, 4646, 704},
                                                 {10001, 841, 1033},
                                                 {10001, 2098, 1834},
                                                 {10001, 3617, 1816}])
                         end,
    Extra = [{4, GetM, ""}, {5, GetX, ""}, {6, GetY, ""}],
    Item#item{extra = Extra ++ OldExtra};
do_recalc(fruit_limit,
          Item = #item{base_id = BaseId, extra = OldExtra}) ->
    Add = case item_data:get_fruit(BaseId) of
              0 -> [];
              Num -> [{7, Num, ""}]
          end,
    Item#item{extra = Add ++ OldExtra};
do_recalc(wedding_treasure,
          Item = #item{extra = OldExtra}) ->
    MapId = util:rand_list([10001,
                            10002,
                            10003,
                            10004,
                            10007]),
    {GetM, GetX, GetY} = case map:rand_pos(MapId) of
                             {X, Y} -> {MapId, X, Y};
                             _ ->
                                 util:rand_list([{10001, 306, 3507},
                                                 {10001, 2583, 3848},
                                                 {10001, 4957, 3680},
                                                 {10001, 445, 2565},
                                                 {10001, 4646, 704},
                                                 {10001, 841, 1033},
                                                 {10001, 2098, 1834},
                                                 {10001, 3617, 1816}])
                         end,
    Extra = [{4, GetM, ""}, {5, GetX, ""}, {6, GetY, ""}],
    Item#item{extra = Extra ++ OldExtra};
do_recalc(pet_attr_stone,
          Item = #item{base_id = BaseId}) ->
    Attr = case pet_data:get_stone(BaseId) of
               #pet_stone_polish_data{attr = V = [_ | _]} ->
                   attr_type:to_attr(base, V);
               _ -> []
           end,
    Item#item{attr = Attr};
do_recalc(child_attr_stone,
          Item = #item{base_id = BaseId}) ->
    Attr = child_stone:rand_attr(BaseId, 1),
    Item#item{attr = Attr};
do_recalc(pet_skill_stone,
          Item = #item{base_id = BaseId}) ->
    Skills = case pet_data:get_stone_skill(BaseId) of
                 {0, _List} -> [];
                 {1, List1, _} -> [util:rand_list(List1, 2)];
                 {2, List1, List2} ->
                     {FList, SList} = case util:rand(1, 10) =< 5 of
                                          true -> {List1, List2};
                                          false -> {List2, List1}
                                      end,
                     {SkillId1, _} = S1 = util:rand_list(FList, 2),
                     SList1 = lists:keydelete(SkillId1, 1, SList),
                     S2 = case util:rand(1, 1000) =< 100 of
                              true -> util:rand_list(SList1, 2);
                              false -> []
                          end,
                     [S1, S2];
                 {_, _} ->
                     logger:error("宝石技能无法产生, 暂不支持该技能数量", [], item_type, 115),
                     [];
                 false -> []
             end,
    Attr = [#attr_base{type = 0, name = 100, val = SkillId}
            || {SkillId, _} <- Skills],
    Item#item{attr = Attr};
do_recalc(child_skill_stone,
          Item = #item{base_id = BaseId}) ->
    Skills = case pet_data:get_stone_skill(BaseId) of
                 {0, _List} -> [];
                 {1, List1, _} -> [util:rand_list(List1, 2)];
                 {2, List1, List2} ->
                     case util:rand(1, 1000) =< 100 of
                         true ->
                             {FList, SList} = case util:rand(1, 10) =< 5 of
                                                  true -> {List1, List2};
                                                  false -> {List2, List1}
                                              end,
                             {SkillId1, _} = S1 = util:rand_list(FList, 2),
                             SList1 = lists:keydelete(SkillId1, 1, SList),
                             S2 = util:rand_list(SList1, 2),
                             [S1, S2];
                         _ -> [util:rand_list(List1, 2)]
                     end;
                 {3, List1, _} -> [util:rand_list(List1, 2)];
                 {_, _} ->
                     logger:error("孩子技能无法产生, 暂不支持该技能数量", [], item_type, 141),
                     [];
                 false -> []
             end,
    Attr = [#attr_base{type = 0, name = 100, val = SkillId}
            || {SkillId, _} <- Skills],
    Item#item{attr = Attr};
do_recalc(normal, Item) -> Item.

merge_fruit(BaseId, Role = #role{p_bag = Pbag}) ->
    case item_data:get(BaseId) of
        #item_base{type = 128} ->
            Flag = case package:count(by_base_id_fruit,
                                      BaseId,
                                      Pbag)
                       of
                       {Items = [_ | _], Num} when Num > 0 ->
                           case do_merge_fruit(Items, 0, []) of
                               {true, AllTimes, DelIds} when AllTimes > 0 ->
                                   {true, AllTimes, DelIds};
                               _ -> {false, lang:get("没有找到可以合并的幻化果实")}
                           end;
                       _ -> {false, lang:get("没有找到可以合并的幻化果实")}
                   end,
            case Flag of
                {true, AddTimes, NeedDels} ->
                    Loss = [#loss{label = item_id, val = NeedDels}],
                    case role_gain:do(Loss, Role) of
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        {ok, NewRole} ->
                            case item:make(BaseId, 1, 1) of
                                {ok, [NewItem = #item{}]} ->
                                    Extra = [{7, AddTimes, ""}],
                                    NewItem1 = NewItem#item{extra = Extra},
                                    Gain = [#gain{label = items,
                                                  val = [NewItem1]}],
                                    case role_gain:do(Gain, NewRole) of
                                        {ok, NewRole1} ->
                                            Msg =
                                                notice:format(lang:get("合并获得~ts，剩余次数~ts次"),
                                                              [{item_2, BaseId},
                                                               {string_2,
                                                                1,
                                                                AddTimes}]),
                                            {ok, NewRole1, Msg};
                                        {false, _} ->
                                            {false, lang:get("没有增加幻化果实")}
                                    end;
                                _ -> {false, lang:get("无法生成幻化果实")}
                            end
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("无法合并的道具")}
    end.

merge_lev_fruit(Id, Role = #role{p_bag = Pbag}) ->
    case package:fetch(1, Id, Role) of
        {ok, #item{base_id = BaseId, extra = ExtraList}} ->
            case item_data:get(BaseId) of
                #item_base{type = 128} ->
                    case lists:keyfind(32, 1, ExtraList) of
                        {32, Lev, ""} when Lev >= 1 ->
                            Flag = case package:count(by_id_lev_fruit, Id, Pbag)
                                       of
                                       {Items = [_ | _], Num} when Num > 0 ->
                                           case do_merge_fruit(Items, 0, []) of
                                               {true, AllTimes, DelIds}
                                                   when AllTimes > 0 ->
                                                   {true, AllTimes, DelIds};
                                               _ ->
                                                   {false,
                                                    lang:get("没有找到可以合并的幻化果实")}
                                           end;
                                       _ -> {false, lang:get("没有找到可以合并的幻化果实")}
                                   end,
                            case Flag of
                                {true, AddTimes, NeedDels} ->
                                    Loss = [#loss{label = item_id,
                                                  val = NeedDels}],
                                    case role_gain:do(Loss, Role) of
                                        {false, #loss{msg = Msg}} ->
                                            {false, Msg};
                                        {ok, NewRole} ->
                                            case item:make(BaseId, 1, 1) of
                                                {ok, [NewItem = #item{}]} ->
                                                    NExtra = lists:keystore(7,
                                                                            1,
                                                                            ExtraList,
                                                                            {7,
                                                                             AddTimes,
                                                                             ""}),
                                                    NewItem1 =
                                                        NewItem#item{extra =
                                                                         NExtra},
                                                    Gain = [#gain{label = items,
                                                                  val =
                                                                      [NewItem1]}],
                                                    case role_gain:do(Gain,
                                                                      NewRole)
                                                        of
                                                        {ok, NewRole1} ->
                                                            Msg =
                                                                notice:format(lang:get("合并获得~ts，剩余次数~ts次"),
                                                                              [{item_2,
                                                                                BaseId},
                                                                               {string_2,
                                                                                1,
                                                                                AddTimes}]),
                                                            {ok, NewRole1, Msg};
                                                        {false, _} ->
                                                            {false,
                                                             lang:get("没有增加幻化果实")}
                                                    end;
                                                _ ->
                                                    {false,
                                                     lang:get("无法生成幻化果实")}
                                            end
                                    end;
                                {false, Reason} -> {false, Reason}
                            end;
                        _ -> merge_fruit(BaseId, Role)
                    end;
                _ -> {false, lang:get("无法合并的道具")}
            end;
        _ -> {false, lang:get("没找到该道具")}
    end.

do_merge_fruit([], AllTimes, DelIds) ->
    {true, AllTimes, DelIds};
do_merge_fruit([#item{id = ItemId, quantity = Quantity,
                      extra = Extra}
                | T],
               AllTimes, DelIds) ->
    AddTimes = case lists:keytake(7, 1, Extra) of
                   {value, {_, Times, ""}, _} -> max(1, Times);
                   _ -> 1
               end,
    AddTimes1 = Quantity * AddTimes,
    do_merge_fruit(T,
                   AllTimes + AddTimes1,
                   [{ItemId, Quantity} | DelIds]);
do_merge_fruit([_ | T], AllTimes, DelIds) ->
    do_merge_fruit(T, AllTimes, DelIds).

fuse_skill_stone(Role, ItemBaseId, RoleLev) ->
    case item:make(ItemBaseId, 1, 1) of
        {ok, [Item = #item{type = Type = 102}]} ->
            VarNum = var:get_var(Role, acc, {1017, Type}, 0),
            logger:debug("==========================:~w",
                         [VarNum],
                         item_type,
                         270),
            Flag = case RoleLev >= 10 of
                       true ->
                           case pet_data:get_high_stone(ItemBaseId) of
                               {Ratio, ItemBaseId2, NewItemBaseId}
                                   when Ratio > 0 ->
                                   case util:rand(1, 1000) =< Ratio of
                                       _ when VarNum >= 6 ->
                                           {true, ItemBaseId2, NewItemBaseId};
                                       _ when VarNum < 2 -> false;
                                       true ->
                                           {true, ItemBaseId2, NewItemBaseId};
                                       _ -> false
                                   end;
                               _ -> false
                           end;
                       _ -> false
                   end,
            case Flag of
                {true, GetItemBaseId2, GetNewItemBaseId} ->
                    fuse_high_pet_skill_stone(ItemBaseId,
                                              GetItemBaseId2,
                                              GetNewItemBaseId);
                false ->
                    Skills = fuse_pet_skill(ItemBaseId),
                    Attr = [#attr_base{type = 0, name = 100, val = SkillId}
                            || {SkillId, _} <- Skills],
                    {true, Item#item{attr = Attr}, false}
            end;
        {ok, [Item = #item{type = 104}]} ->
            Skills = case pet_data:get_stone_skill(ItemBaseId) of
                         {0, _List} -> [];
                         {1, List1, _} -> [util:rand_list(List1, 2)];
                         {2, List1, List2} ->
                             case util:rand(1, 1000) =< 230 of
                                 true ->
                                     {FList, SList} = case util:rand(1, 10) =< 5
                                                          of
                                                          true ->
                                                              {List1, List2};
                                                          false ->
                                                              {List2, List1}
                                                      end,
                                     {SkillId1, _} = S1 = util:rand_list(FList,
                                                                         2),
                                     SList1 = lists:keydelete(SkillId1,
                                                              1,
                                                              SList),
                                     S2 = util:rand_list(SList1, 2),
                                     [S1, S2];
                                 _ -> [util:rand_list(List1, 2)]
                             end;
                         {3, List1, List2} ->
                             case util:rand(1, 1000) =< 230 of
                                 true ->
                                     {FList, SList} = case util:rand(1, 10) =< 5
                                                          of
                                                          true ->
                                                              {List1, List2};
                                                          false ->
                                                              {List2, List1}
                                                      end,
                                     {SkillId1, _} = S1 = util:rand_list(FList,
                                                                         2),
                                     SList1 = lists:keydelete(SkillId1,
                                                              1,
                                                              SList),
                                     S2 = util:rand_list(SList1, 2),
                                     [S1, S2];
                                 _ -> [util:rand_list(List1, 2)]
                             end;
                         {_, _} ->
                             logger:error("宝石技能无法产生, 暂不支持该技能数量",
                                          [],
                                          item_type,
                                          329),
                             [];
                         false -> []
                     end,
            Attr = [#attr_base{type = 0, name = 100, val = SkillId}
                    || {SkillId, _} <- Skills],
            {true, Item#item{attr = Attr}};
        {ok, [Item = #item{type = 103, base_id = BaseId}]} ->
            Attr = child_stone:rand_attr(BaseId, 0),
            {true, Item#item{attr = Attr}};
        _ -> false
    end.

fuse_high_pet_skill_stone(ItemBaseId1, ItemBaseId2,
                          NewItemBaseId) ->
    case item:make(NewItemBaseId, 1, 1) of
        {ok, [Item = #item{type = 105}]} ->
            Skills1 = fuse_pet_skill(ItemBaseId1),
            Skills2 = fuse_pet_skill(ItemBaseId2),
            Flag1 = ItemBaseId1 * 10 + 1,
            Flag2 = ItemBaseId2 * 10 + 2,
            Attr1 = [#attr_base{type = 0, name = 100, flag = Flag1,
                                val = SkillId1}
                     || {SkillId1, _} <- Skills1],
            Attr2 = [#attr_base{type = 0, name = 100, flag = Flag2,
                                val = SkillId2}
                     || {SkillId2, _} <- Skills2],
            Attr = Attr1 ++ Attr2,
            {true, Item#item{attr = Attr}};
        _ -> false
    end.

fuse_pet_skill(ItemBaseId) ->
    Skills1 = case pet_data:get_stone_skill(ItemBaseId) of
                  {0, _List} -> [];
                  {1, List1, _} -> [util:rand_list(List1, 2)];
                  {2, List1, List2} ->
                      {FList, SList} = case util:rand(1, 10) =< 5 of
                                           true -> {List1, List2};
                                           false -> {List2, List1}
                                       end,
                      {SkillId1, _} = S1 = util:rand_list(FList, 2),
                      SList1 = lists:keydelete(SkillId1, 1, SList),
                      Ratio = case ItemBaseId =:= 20638 of
                                  true -> 350;
                                  _ -> 230
                              end,
                      S2 = case util:rand(1, 1000) =< Ratio of
                               true -> util:rand_list(SList1, 2);
                               false -> []
                           end,
                      [S1, S2];
                  {_, _} ->
                      logger:error("宝石技能[~w]无法产生, 暂不支持该技能数量",
                                   [ItemBaseId],
                                   item_type,
                                   379),
                      [];
                  false -> []
              end,
    Skills1.

choose_pet_skill_stone(Role = #role{},
                       #item{id = ItemId, type = 105, attr = Attr},
                       ChooseFlag) ->
    Data = [{Flag div 10, A#attr_base{flag = 0}}
            || A = #attr_base{flag = Flag} <- Attr,
               Flag rem 10 =:= ChooseFlag],
    case Data of
        [{BaseId, _} | _] ->
            NewAttr = [D || {_, D} <- Data],
            case item:make(BaseId, 1, 1) of
                {ok, [Item = #item{type = 102}]} ->
                    NewItem = Item#item{attr = NewAttr},
                    Gain = [#gain{label = items, val = [NewItem]}],
                    Loss = [#loss{label = item_id, val = [{ItemId, 1}]}],
                    case role_gain:do(Loss, Role) of
                        {ok, Role1} ->
                            case role_gain:do_notice(Gain, Role1) of
                                {ok, NewRole} -> {ok, NewRole};
                                {false, #gain{msg = Msg}} -> {false, Msg}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                _ ->
                    logger:error("不存在的道具:~w", [BaseId], item_type, 410),
                    {false, lang:get("不存在的道具")}
            end;
        _ -> {false, lang:get("没有可选择的技能")}
    end.

effect_skill_stone(ItemBaseId, SkillList)
    when is_list(SkillList) ->
    case item:make(ItemBaseId, 1, 1) of
        {ok, [Item = #item{type = 102}]} ->
            Attr = [#attr_base{type = 0, name = 100, val = SkillId}
                    || SkillId <- SkillList],
            {true, Item#item{attr = Attr}};
        _ -> false
    end;
effect_skill_stone(_, _) -> false.

adm_skill_stone(Role = #role{p_bag =
                                 Pbag = #package{items = Items}},
                ItemId, SkillList) ->
    case lists:keyfind(ItemId, #item.id, Items) of
        Item = #item{type = 102} ->
            Attr = [#attr_base{type = 0, name = 100, val = SkillId}
                    || SkillId <- SkillList],
            NewItem = Item#item{attr = Attr},
            {ok, NewPbag, _} = package:fresh_item(Item,
                                                  NewItem,
                                                  Pbag,
                                                  Role),
            NewRole = Role#role{p_bag = NewPbag},
            {ok, NewRole};
        _ ->
            logger:error("不是宠物技能符石，无法设定", [], item_type, 443),
            ok
    end.

adm_eqm_skill(Role = #role{p_eqm =
                               Peqm = #package{items = Items}},
              EqmId, AttrType, SkillName, SkillId)
    when AttrType =:= 4 orelse AttrType =:= 10 ->
    case lists:keyfind(EqmId, #item.id, Items) of
        Eqm = #item{attr = Attr} ->
            {_, AttrNormalAttrList} = lists:partition(fun
                                                          (#attr_base{type =
                                                                          Type}) ->
                                                              Type =:= AttrType
                                                      end,
                                                      Attr),
            SpecialAttr = [#attr_base{type = AttrType,
                                      name = SkillName, calc_type = 0,
                                      val = SkillId}],
            AttrList = SpecialAttr ++ AttrNormalAttrList,
            NewEqm = eqm_attr:calc_eqm(Eqm#item{attr = AttrList}),
            {ok, NewPeqm, _} = package:fresh_item(Eqm,
                                                  NewEqm,
                                                  Peqm,
                                                  Role),
            NewRole = attr:calc_and_push(Role#role{p_eqm =
                                                       NewPeqm}),
            {Talents, _, _} = skill:get_effect_skill(NewRole),
            role:link_send(NewRole, 10804, {Talents}),
            {ok, NewRole};
        _ ->
            logger:error("没有找到装备", [], item_type, 464),
            ok
    end;
adm_eqm_skill(_, _, _, _, _) -> ok.

special_id(ItemList) when is_list(ItemList) ->
    special_id(ItemList, []);
special_id(BaseId) when is_integer(BaseId) ->
    case item_data:get_special(BaseId) of
        BaseList = [_ | _] ->
            {NewBaseId, _} = util:rand_list(BaseList, 2),
            NewBaseId;
        _ -> BaseId
    end.

special_id([], ItemList) -> lists:reverse(ItemList);
special_id([{ItemId, Num} | T], ItemList) ->
    NewItemId = special_id(ItemId),
    special_id(T, [{NewItemId, Num} | ItemList]);
special_id([{ItemId, Bind, Num} | T], ItemList) ->
    NewItemId = special_id(ItemId),
    special_id(T, [{NewItemId, Bind, Num} | ItemList]).

is_good_pet(BaseId) ->
    case item_data:get(BaseId) of
        #item_base{effect = [{19, EggId}]} ->
            case pet_data:get_egg(EggId) of
                #{genre := Genre} when Genre =:= 2 orelse Genre =:= 4 ->
                    true;
                _ -> false
            end;
        _ -> false
    end.

