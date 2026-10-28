-file("src/mod/pet/pet_stone.erl", 1).

-module(pet_stone).

-export([use_stone/4,
         upgrade/2,
         remove_stone/3,
         calc_attr/2,
         reset_stone/2,
         save_stone/2,
         calc_stone_skill/2,
         polish/3,
         save_polish/3,
         marking_stone/5,
         learn_lev_break_skill/1,
         lev_break/2,
         auto_use_stone/4,
         do_calc_stone_attr/1]).

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

-file("src/mod/pet/pet_stone.erl", 25).

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

-file("src/mod/pet/pet_stone.erl", 26).

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

-file("src/mod/pet/pet_stone.erl", 27).

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

-file("src/mod/pet/pet_stone.erl", 28).

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

-file("src/mod/pet/pet_stone.erl", 29).

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

-file("src/mod/pet/pet_stone.erl", 30).

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

-file("src/mod/pet/pet_stone.erl", 31).

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

-file("src/mod/pet/pet_stone.erl", 32).

-file("inc/camp_pet_egg.hrl", 1).

-author("Lith").

-file("src/mod/pet/pet_stone.erl", 33).

use_stone(Item = #item{base_id = BaseId}, PetId, HoleId,
          Role = #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{genre = 3} -> {false, lang:get("野生宠物不能装备符石")};
        #pet{spirit_attached_id = SpiritAttachedId,
             spirit_child_flag = SpiritChildFlag}
            when SpiritAttachedId =/= 0 orelse
                     SpiritChildFlag =/= 0 ->
            Msg = notice:format(lang:get("请先~ts{face_1,3}"),
                                [{string_2, 5, lang:get("卸下附灵")}]),
            {false, Msg};
        Pet = #pet{base_id = PetBaseId, grade = Grade} ->
            case check_stone(PetBaseId, Grade, HoleId, BaseId) of
                true -> do_use_stone(Item, Pet, HoleId, Role);
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

do_use_stone(Item = #item{id = ItemId, type = Type},
             Pet = #pet{id = PetId, stones = Stones, skills = Skills,
                        base_id = BaseId, grade = Grade},
             HoleId,
             Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    IsMaxGrade = case pet_data:get_grade({BaseId,
                                          Grade + 1})
                     of
                     {_AddAptitude, _HoleNum} -> 0;
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
            NewItem = Item#item{id = HoleId, quantity = 1},
            NewStones = lists:keystore(HoleId,
                                       #item.id,
                                       Stones,
                                       NewItem),
            {Flag, NewSkills} = case Type =:= 102 of
                                    true ->
                                        {true,
                                         calc_stone_skill(Skills, NewItem)};
                                    false -> {false, Skills}
                                end,
            Pet1 = Pet#pet{stones = NewStones, skills = NewSkills},
            {ok, NewPet, NewRole1} = pet_attr:calc(Pet1, NewRole),
            NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
            NewRole2 = NewRole1#role{m_pet =
                                         Mpet#m_pet{pets = NewPets}},
            Nr = NewRole2,
            pet:push_10503(Nr, NewPet),
            case Flag of
                true -> pet:push_10511(Nr, NewPet);
                false -> skip
            end,
            pet:push_10512(Nr, NewPet),
            log:pet(Nr, "宠物使用符石", Pet, NewPet),
            {ok, Nr, ReplyMsg}
    end.

loss_stone(ItemId, HoleId, Stones, IsMaxGrade, Role) ->
    Loss = [#loss{label = item_id, val = [{ItemId, 1}]}],
    case role_gain:do(Loss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, Role1} ->
            case lists:keyfind(HoleId, #item.id, Stones) of
                OldItem = #item{base_id = BaseId} ->
                    case IsMaxGrade of
                        1 ->
                            Msg = notice:format(lang:get("符石替换成功，原有的~ts被覆盖了"),
                                                [{item_2, BaseId}]),
                            {ok, Role1, Msg};
                        _ ->
                            Gain = [#gain{label = items, val = [OldItem]}],
                            case role_gain:do(Gain, Role1) of
                                {false, #loss{msg = Msg}} -> {false, Msg};
                                {ok, Role2} -> {ok, Role2, lang:get("符石替换成功")}
                            end
                    end;
                false -> {ok, Role1, lang:get("符石装备成功")}
            end
    end.

lev_break(PetId,
          Role = #role{m_pet = #m_pet{pets = Pets}}) ->
    RoleBreakTimes = lev_break:get_times(Role),
    case RoleBreakTimes > 0 of
        true ->
            case lists:keyfind(PetId, #pet.id, Pets) of
                #pet{break_times = BreakTimes} when BreakTimes > 0 ->
                    {false, lang:get("当前宠物已经突破，无需再次突破")};
                Pet = #pet{base_id = BaseId, grade = Grade} ->
                    IsMaxGrade = case pet_data:get_grade({BaseId,
                                                          Grade + 1})
                                     of
                                     {_AddAptitude, _HoleNum} -> 0;
                                     _ -> 1
                                 end,
                    case IsMaxGrade of
                        1 ->
                            LevBreak = lev_break:get_times(Role),
                            case pet_data:get_base(BaseId) of
                                #pet_base{has_break_skill = HasBreakSkill,
                                          lev_break_skills = LevBreakSkill,
                                          lev_break_cost =
                                              LevBreakCost = [_ | _]}
                                    when HasBreakSkill > 0 andalso
                                             LevBreak >= HasBreakSkill ->
                                    do_lev_break(Role,
                                                 Pet,
                                                 LevBreakCost,
                                                 LevBreakSkill);
                                _ -> {false, lang:get("不可以突破的宠物，无法操作")}
                            end;
                        _ -> {false, lang:get("进阶到顶阶才可以突破宠物")}
                    end;
                _ -> {false, lang:get("不存在的宠物，无法操作")}
            end;
        false -> {false, lang:get("您还未进行角色突破，不能进行宠物突破")}
    end.

do_lev_break(Role = #role{m_pet =
                              Mpet = #m_pet{pets = Pets}},
             Pet = #pet{id = PetId, break_times = BreakTimes,
                        skills = Skills},
             LevBreakCost, LevBreakSkill) ->
    Loss = format:val_to_loss(LevBreakCost,
                              #{item_base_id_auto_buy => 1,
                                auto_scene => lang:get("宠物突破")}),
    case role_gain:do_notice(Loss, Role, lang:get("宠物突破"))
        of
        {ok, LossRole} ->
            Skills1 = [S
                       || S = #pet_skill{source = Source} <- Skills,
                          Source =/= 4],
            NewSkills = Skills1 ++
                            learn_lev_break_skill(LevBreakSkill),
            {ok, NewPet, Role1} = pet_attr:calc(Pet#pet{skills =
                                                            NewSkills,
                                                        break_times =
                                                            BreakTimes + 1},
                                                LossRole),
            NewPet2 = pet_rune:do_break(NewPet),
            NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet2),
            NewRole = Role1#role{m_pet =
                                     Mpet#m_pet{pets = NewPets}},
            pet:push_10503(NewRole, NewPet2),
            pet:push_10511(NewRole, NewPet2),
            pet_rune:push(NewRole, NewPet2),
            log:pet(NewRole, "宠物突破", Pet, NewPet),
            {ok, NewRole};
        {false, #loss{val = [{ItemBaseId, ItemNum}]}} ->
            ItemName = item:attr(name, ItemBaseId),
            Msg = util:flist(lang:get("~ts不足~w个, 无法突破! "),
                             [ItemName, ItemNum]),
            {false, Msg};
        _Other -> {false, lang:get("材料不足, 无法突破")}
    end.

learn_lev_break_skill(Skills) ->
    learn_lev_break_skill(Skills, []).

learn_lev_break_skill([], Skills) -> Skills;
learn_lev_break_skill([S | T], Skills) ->
    case skill_data:get_pet({S, 1}) of
        #pet_base_skill{type = Type, step = Step} ->
            Skill = #pet_skill{id = S, type = Type, source = 4,
                               step = Step},
            learn_lev_break_skill(T, [Skill | Skills]);
        _ -> learn_lev_break_skill(T, Skills)
    end.

remove_stone(PetId, HoleId,
             Role = #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{spirit_attached_id = SpiritAttachedId,
             spirit_child_flag = SpiritChildFlag}
            when SpiritAttachedId =/= 0 orelse
                     SpiritChildFlag =/= 0 ->
            Msg = notice:format(lang:get("请先~ts{face_1,3}"),
                                [{string_2, 5, lang:get("卸下附灵")}]),
            {false, Msg};
        Pet = #pet{base_id = BaseId, grade = Grade} ->
            IsMaxGrade = case pet_data:get_grade({BaseId,
                                                  Grade + 1})
                             of
                             {_AddAptitude, _HoleNum} -> 0;
                             _ -> 1
                         end,
            case IsMaxGrade =:= 1 of
                true -> {false, lang:get("当前进阶阶段无法卸下符石，只能替换")};
                false -> do_remove_stone(Pet, HoleId, Role)
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

do_remove_stone(Pet = #pet{id = PetId, stones = Stones,
                           skills = Skills},
                HoleId,
                Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(HoleId, #item.id, Stones) of
        OldItem = #item{type = Type} ->
            Gain = [#gain{label = items, val = [OldItem]}],
            case role_gain:do(Gain, Role) of
                {false, #gain{msg = Msg}} -> {false, Msg};
                {ok, Role1} ->
                    NewStones = lists:keydelete(HoleId, #item.id, Stones),
                    {Flag, NewSkills} = case Type =:= 102 of
                                            true ->
                                                {true,
                                                 calc_stone_skill(Skills)};
                                            false -> {false, Skills}
                                        end,
                    Pet1 = Pet#pet{stones = NewStones, skills = NewSkills},
                    {ok, NewPet, Role2} = pet_attr:calc(Pet1, Role1),
                    NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
                    NewRole = Role2#role{m_pet =
                                             Mpet#m_pet{pets = NewPets}},
                    Nr = NewRole,
                    pet:push_10503(Nr, NewPet),
                    case Flag of
                        true -> pet:push_10511(Nr, NewPet);
                        false -> skip
                    end,
                    pet:push_10512(Nr, NewPet),
                    log:pet(Nr, "宠物替换符石", Pet, NewPet),
                    {ok, role_trigger:fire(#evt_pet_skill{}, Nr)}
            end;
        false -> {false, lang:get("当前孔没有可卸下的符石")}
    end.

reset_stone(Stone = #item{id = Id, base_id = BaseId,
                          type = 102, attr = Attr, data = Data},
            Role = #role{}) ->
    case pet_data:get_reset(BaseId) of
        #{loss := LossVal} ->
            Loss = format:val_to_loss(LossVal,
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("重置技能符石")}),
            case role_gain:do(Loss, Role) of
                {false, _} -> {false, lang:get("道具不足，无法重置")};
                {ok, NewRole = #role{p_bag = Pbag}} ->
                    case do_reset_stone(BaseId, Attr) of
                        {true, NewAttr} ->
                            NewData = lists:keystore(7, 1, Data, {7, NewAttr}),
                            NewStone = Stone#item{data = NewData},
                            logger:debug("新的技能属性 ~w",
                                         [NewAttr],
                                         pet_stone,
                                         262),
                            {ok, NewPbag, _} = package:fresh_item(Stone,
                                                                  NewStone,
                                                                  Pbag,
                                                                  NewRole),
                            NewRole1 = NewRole#role{p_bag = NewPbag},
                            role:link_send(Role, 10563, {Id, NewAttr}),
                            log:eqm(NewRole1,
                                    "护符重置",
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
        {0, _} -> {false, lang:get("当前符石不能重置")};
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
                false -> {false, lang:get("只有拥有技能的符石才能重置")}
            end;
        _ -> {false, lang:get("只有拥有技能的符石才能重置")}
    end.

find_skill(1, List1, List2) ->
    List = case util:rand(1, 100) =< 40 of
               true -> List2;
               false -> List1
           end,
    {true, [util:rand_list(List, 2)]};
find_skill(Len, List1, List2) when Len >= 2 ->
    {SkillId1, _} = S1 = util:rand_list(List1, 2),
    NewList2 = lists:keydelete(SkillId1, 1, List2),
    S2 = util:rand_list(NewList2, 2),
    {true, [S1, S2]};
find_skill(_, _, _) ->
    {false, lang:get("只有拥有技能的符石才能重置")}.

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
                         pet_stone,
                         325),
            {ok, NewPbag, _} = package:fresh_item(Stone,
                                                  NewStone,
                                                  Pbag,
                                                  Role),
            NewRole = Role#role{p_bag = NewPbag},
            role:link_send(Role, 10563, {Id, []}),
            log:eqm(NewRole, "护符重置保存", Stone, NewStone),
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
                 pet_stone,
                 340),
    case skill_data:get_pet({Val, 1}) of
        #pet_base_skill{name = Name} -> Name;
        _ -> ""
    end.

calc_attr(Ac = #attr_calc{},
          #pet{stones = Stones, grade_attr = GradeAttr}) ->
    Ac1 = do_calc_stone(Ac, Stones),
    case attr_type:do_attr(GradeAttr, Ac1) of
        {false, Reason} ->
            logger:error("宠物进阶属性无法计算:~w,~w",
                         [GradeAttr, Reason],
                         pet_stone,
                         353),
            Ac1;
        {ok, NewAc} -> NewAc
    end.

do_calc_stone(Ac, []) -> Ac;
do_calc_stone(Ac,
              [#item{base_id = BaseId, attr = TAttr} | T]) ->
    Attr = get_recalc_attr(BaseId, TAttr, []),
    case attr_type:do_attr(Attr, Ac) of
        {false, Reason} ->
            logger:error("宠物宝石属性计算出错[~w]:[~w]",
                         [Attr, Reason],
                         pet_stone,
                         363),
            do_calc_stone(Ac, T);
        {ok, NewAc} -> do_calc_stone(NewAc, T)
    end.

calc_stone_skill(Skills) ->
    BaseSkills = [S
                  || S = #pet_skill{source = Source} <- Skills,
                     lists:member(Source, [1, 5, 4]) =:= true],
    BaseSkills.

calc_stone_skill(Skills,
                 #item{attr = Attr, type = 102}) ->
    BaseSkills = [S
                  || S = #pet_skill{source = Source} <- Skills,
                     lists:member(Source, [1, 5, 4]) =:= true],
    ExtSkills = pet_skill:attr_to_skill(Attr, 2),
    BaseSkills ++ ExtSkills;
calc_stone_skill(Skills, []) -> Skills;
calc_stone_skill(Skills,
                 [#item{attr = Attr, type = 102} | T]) ->
    ExtSkills = pet_skill:attr_to_skill(Attr, 2),
    calc_stone_skill(Skills ++ ExtSkills, T);
calc_stone_skill(Skills, [_ | T]) ->
    calc_stone_skill(Skills, T).

upgrade(PetId,
        Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{genre = 6} -> {false, lang:get("该宠物无法进阶")};
        Pet = #pet{grade = Grade, pet_attr = PetAttr,
                   grade_attr = Attr, name = PetName, genre = GenreType} ->
            case check_upgrade(Pet, Grade + 1) of
                {true, AddAptitude, Loss, StoneAttr, BaseSkills} ->
                    case role_gain:do_notice(Loss, Role, lang:get("宠物进阶"))
                        of
                        {ok, LossRole} ->
                            {NewAttr, NewSkills, AddSkills} =
                                merge_upgrade(Attr, BaseSkills, StoneAttr, []),
                            NewPetAttr = upgrade_aptitude(PetAttr, AddAptitude),
                            {ok, NewPet, Role1} = pet_attr:calc(Pet#pet{grade =
                                                                            Grade
                                                                                +
                                                                                1,
                                                                        grade_attr
                                                                            =
                                                                            NewAttr,
                                                                        stones =
                                                                            [],
                                                                        skills =
                                                                            NewSkills,
                                                                        pet_attr
                                                                            =
                                                                            NewPetAttr},
                                                                LossRole),
                            NewPets = lists:keystore(PetId,
                                                     #pet.id,
                                                     Pets,
                                                     NewPet),
                            Nr = role_trigger:fire(#evt_pet_stone_upgrade{grade
                                                                              =
                                                                              Grade
                                                                                  +
                                                                                  1},
                                                   Role1#role{m_pet =
                                                                  Mpet#m_pet{pets
                                                                                 =
                                                                                 NewPets}}),
                            pet:push_10503(Nr, NewPet),
                            pet:push_10511(Nr, NewPet),
                            pet:push_10512(Nr, NewPet),
                            cast_upgrade(Nr, PetName, AddSkills, GenreType),
                            upgrade_trigger(Role, Pet, NewPet),
                            log:pet(Nr, "宠物进阶", Pet, NewPet),
                            {ok, Nr, Grade + 1};
                        {false, #loss{val = [{ItemBaseId, ItemNum}]}} ->
                            ItemName = item:attr(name, ItemBaseId),
                            Msg = util:flist(lang:get("~ts不足~w个, 无法升阶! "),
                                             [ItemName, ItemNum]),
                            {false, Msg};
                        _Other -> {false, lang:get("材料不足, 无法进阶")}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

upgrade_trigger(_, _, _) -> ok.

polish(Role = #role{m_pet = Mpet = #m_pet{pets = Pets}},
       PetId, StoneId) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{grade = Grade, base_id = PetBaseId,
                   stones = Stones} ->
            case pet_data:get_grade({PetBaseId, Grade + 1}) of
                false ->
                    case pet_data:get_polish(PetBaseId) of
                        LossItem = [_ | _] ->
                            {ok, Loss} =
                                format:loss_to_auto_buy(format:val_to_loss(LossItem)),
                            case role_gain:do_notice(Loss,
                                                     Role,
                                                     lang:get("符石洗练"))
                                of
                                {ok, NRole} ->
                                    case lists:keyfind(StoneId,
                                                       #item.id,
                                                       Stones)
                                        of
                                        Stone = #item{base_id = BaseId,
                                                      attr = Attr,
                                                      reset_attr = OldResetAttr,
                                                      extra = Extra} ->
                                            case pet_data:get_stone(BaseId) of
                                                #pet_stone_polish_data{attr_name
                                                                           =
                                                                           0} ->
                                                    {false,
                                                     lang:get("该物品不支持洗练")};
                                                #pet_stone_polish_data{attr_name
                                                                           =
                                                                           AttrName,
                                                                       val_list
                                                                           =
                                                                           ValList =
                                                                               [_
                                                                                | _],
                                                                       skill_list
                                                                           =
                                                                           SkillList} ->
                                                    OldFlag = case OldResetAttr
                                                                  of
                                                                  [] ->
                                                                      case
                                                                          lists:keyfind(AttrName,
                                                                                        #attr_base.name,
                                                                                        Attr)
                                                                          of
                                                                          #attr_base{flag
                                                                                         =
                                                                                         OldFlag1} ->
                                                                              OldFlag1
                                                                                  div
                                                                                  10;
                                                                          _ -> 0
                                                                      end;
                                                                  _ ->
                                                                      case
                                                                          lists:keyfind(AttrName,
                                                                                        #attr_base.name,
                                                                                        OldResetAttr)
                                                                          of
                                                                          #attr_base{flag
                                                                                         =
                                                                                         OldFlag1} ->
                                                                              OldFlag1
                                                                                  div
                                                                                  10;
                                                                          _ -> 0
                                                                      end
                                                              end,
                                                    {Flag, _} =
                                                        util:rand_list(lists:keydelete(OldFlag,
                                                                                       1,
                                                                                       ValList),
                                                                       2),
                                                    Val =
                                                        pet_data:get_stone_attr({BaseId,
                                                                                 AttrName,
                                                                                 Flag}),
                                                    Add =
                                                        attr_type:to_attr(base,
                                                                          Flag *
                                                                              10,
                                                                          [{AttrName,
                                                                            Val}]),
                                                    ResetAttr = case
                                                                    util:rand_list(SkillList,
                                                                                   2)
                                                                    of
                                                                    {0, _} ->
                                                                        Add;
                                                                    {SkillId,
                                                                     _} ->
                                                                        [#attr_base{type
                                                                                        =
                                                                                        0,
                                                                                    name
                                                                                        =
                                                                                        100,
                                                                                    val
                                                                                        =
                                                                                        SkillId,
                                                                                    flag
                                                                                        =
                                                                                        20
                                                                                            *
                                                                                            10}]
                                                                            ++
                                                                            Add
                                                                end,
                                                    NewExtra = lists:keystore(8,
                                                                              1,
                                                                              Extra,
                                                                              {8,
                                                                               1,
                                                                               ""}),
                                                    NewStone =
                                                        Stone#item{reset_attr =
                                                                       ResetAttr,
                                                                   extra =
                                                                       NewExtra},
                                                    NewStones =
                                                        lists:keystore(StoneId,
                                                                       #item.id,
                                                                       Stones,
                                                                       NewStone),
                                                    NewPet = Pet#pet{stones =
                                                                         NewStones},
                                                    NewPets =
                                                        lists:keystore(PetId,
                                                                       #pet.id,
                                                                       Pets,
                                                                       NewPet),
                                                    NewRole = NRole#role{m_pet =
                                                                             Mpet#m_pet{pets
                                                                                            =
                                                                                            NewPets}},
                                                    Nr = NewRole,
                                                    pet:push_10512(Nr, NewPet),
                                                    log:pet(Nr,
                                                            "宠物洗练符石",
                                                            Pet,
                                                            NewPet),
                                                    {ok, Nr};
                                                _ ->
                                                    {false, lang:get("该物品不能洗练")}
                                            end;
                                        false -> {false, lang:get("没有找到该符石")}
                                    end;
                                {false, #loss{label = stars_score}} ->
                                    {false, lang:get("星辰积分不足")};
                                _ -> {false, lang:get("材料不足")}
                            end;
                        _ -> {false, lang:get("该宠物不支持洗练")}
                    end;
                _ -> {false, lang:get("最高阶阶的宠物才能洗练")}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

save_polish(Role = #role{m_pet =
                             Mpet = #m_pet{pets = Pets}},
            PetId, StoneId) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{stones = Stones} ->
            case lists:keyfind(StoneId, #item.id, Stones) of
                #item{reset_attr = []} ->
                    {false, lang:get("没有洗练属性可以保存")};
                Stone = #item{reset_attr = ResetAttr} ->
                    NewStone = Stone#item{reset_attr = [],
                                          attr = ResetAttr},
                    NewStones = lists:keystore(StoneId,
                                               #item.id,
                                               Stones,
                                               NewStone),
                    Pet1 = Pet#pet{stones = NewStones},
                    {ok, NewPet, NRole1} = pet_attr:calc(Pet1, Role),
                    NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
                    NewRole = NRole1#role{m_pet =
                                              Mpet#m_pet{pets = NewPets}},
                    Nr = NewRole,
                    pet:push_10503(Nr, NewPet),
                    pet:push_10511(Nr, NewPet),
                    pet:push_10512(Nr, NewPet),
                    log:pet(Nr, "宠物保存洗练符石", Pet, NewPet),
                    {ok, Nr};
                _ -> {false, lang:get("没有找到对应的符石")}
            end;
        _ -> {false, lang:get("没有找到对应的宠物")}
    end.

get_recalc_attr(_, [], List) -> lists:reverse(List);
get_recalc_attr(BaseId,
                [A = #attr_base{name = 100} | T], List) ->
    get_recalc_attr(BaseId, T, [A | List]);
get_recalc_attr(BaseId, [A = #attr_base{flag = 0} | T],
                List) ->
    get_recalc_attr(BaseId, T, [A | List]);
get_recalc_attr(BaseId,
                [A = #attr_base{name = Name, flag = Flag} | T], List) ->
    Val = pet_data:get_stone_attr({BaseId,
                                   Name,
                                   util:ceil(Flag / 10)}),
    get_recalc_attr(BaseId,
                    T,
                    [A#attr_base{val = Val} | List]).

marking_stone(Role = #role{m_pet = #m_pet{pets = Pets}},
              PetId, StoneId, Item, SkillId) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{} ->
            case check_marking_stone(Pet, StoneId, SkillId) of
                {false, Reason} -> {false, Reason};
                {true, Stone} ->
                    case marking_loss(Item, Role) of
                        {ok, NewRole} -> make_marking(NewRole, Pet, Stone);
                        {false, Reason} -> {false, Reason}
                    end
            end;
        _ -> {false, lang:get("没有找到对应宠物，无法操作")}
    end.

marking_loss(#item{id = ItemId}, Role) ->
    Loss = [#loss{label = item_id, val = [{ItemId, 1}]}],
    case role_gain:do_notice(Loss, Role, lang:get("符石刻印"))
        of
        {ok, NewRole} -> {ok, NewRole};
        _ -> {false, lang:get("道具不足，无法刻印")}
    end.

make_marking(Role = #role{m_pet =
                              Mpet = #m_pet{pets = Pets}},
             Pet = #pet{id = PetId, stones = Stones},
             Stone = #item{id = StoneId}) ->
    NewStones = lists:keystore(StoneId,
                               #item.id,
                               Stones,
                               Stone),
    Pet1 = Pet#pet{stones = NewStones},
    {ok, NewPet, NewRole} = pet_attr:calc(Pet1, Role),
    NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
    NewRole1 = NewRole#role{m_pet =
                                Mpet#m_pet{pets = NewPets}},
    pet:push_10503(NewRole1, NewPet),
    pet:push_10511(NewRole1, NewPet),
    pet:push_10512(NewRole1, NewPet),
    log:pet(NewRole1, "宠物刻印符石", Pet, NewPet),
    Msg = lang:get("刻印成功"),
    {ok, NewRole1, Msg}.

check_marking_stone(#pet{grade = Grade,
                         base_id = PetBaseId, stones = Stones},
                    StoneId, SkillId) ->
    case pet_data:get_grade({PetBaseId, Grade + 1}) of
        false ->
            case lists:keyfind(StoneId, #item.id, Stones) of
                Stone = #item{base_id = StoneBaseId, attr = Attr} ->
                    case pet_data:get_stone(StoneBaseId) of
                        #pet_stone_polish_data{attr_name = 0} ->
                            {false, lang:get("该符石不能支持刻印")};
                        #pet_stone_polish_data{attr_name = AttrName,
                                               val_list = ValList = [_ | _]} ->
                            OldFlag = case lists:keyfind(AttrName,
                                                         #attr_base.name,
                                                         Attr)
                                          of
                                          #attr_base{flag = OldFlag1} ->
                                              OldFlag1 div 10;
                                          _ -> 0
                                      end,
                            {Flag, _} = util:rand_list(lists:keydelete(OldFlag,
                                                                       1,
                                                                       ValList),
                                                       2),
                            Val = pet_data:get_stone_attr({StoneBaseId,
                                                           AttrName,
                                                           Flag}),
                            NewAdd = attr_type:to_attr(base,
                                                       Flag * 10,
                                                       [{AttrName, Val}]),
                            Skill = #attr_base{type = 0, name = 100,
                                               val = SkillId, flag = 20 * 10},
                            NewAdd1 = [Skill | NewAdd],
                            {true, Stone#item{attr = NewAdd1}};
                        _ -> {false, lang:get("该符石不能支持刻印")}
                    end;
                _ -> {false, lang:get("找不到对应符石，无法刻印")}
            end;
        _ -> {false, lang:get("最高阶宠物才能进行宠物刻印")}
    end.

check_upgrade(#pet{lev = Lev}, UpGrade)
    when UpGrade >= 3 andalso Lev < 85 ->
    {false, lang:get("宠物等级不足85级，无法进阶")};
check_upgrade(#pet{base_id = PetBaseId, stones = Stones,
                   skills = Skills, grade = Grade},
              UpGrade) ->
    case pet_data:get_grade({PetBaseId, UpGrade}) of
        {AddAptitude, HoleNum} ->
            case check_all_hole(PetBaseId, Grade, Stones, HoleNum)
                of
                {false, Reason} -> {false, Reason};
                true ->
                    case check_upgrade_skill(Stones, Skills) of
                        {true, StoneAttr, NewSkills} ->
                            case pet_data:get_grade_loss({PetBaseId, UpGrade})
                                of
                                [] -> {false, lang:get("材料不足, 无法进阶")};
                                Loss ->
                                    NLoss = [LT#loss{auto_scene =
                                                         lang:get("宠物进阶")}
                                             || LT <- Loss],
                                    {true,
                                     AddAptitude,
                                     NLoss,
                                     StoneAttr,
                                     NewSkills}
                            end;
                        {false, Reason} -> {false, Reason}
                    end
            end;
        _ -> {false, lang:get("进阶已经达到顶级, 无法继续进阶")}
    end.

check_upgrade_skill(Stones, Skills) ->
    StonesAttr = lists:flatten([Attr
                                || #item{attr = Attr} <- Stones]),
    Skills1 = [PetSkill
               || PetSkill = #pet_skill{source = Source} <- Skills,
                  Source =:= 1 orelse Source =:= 5],
    Fun = fun (Attr = #attr_base{name = 100, val = Val},
               {SkillList, AttrList, NowSkills}) ->
                  case lists:keyfind(Val, #pet_skill.id, NowSkills) of
                      false -> {[Attr | SkillList], AttrList, NowSkills};
                      _ -> {SkillList, AttrList, NowSkills}
                  end;
              (Attr, {SkillList, AttrList, NowSkills}) ->
                  {SkillList, [Attr | AttrList], NowSkills}
          end,
    case lists:foldl(Fun, {[], [], Skills1}, StonesAttr) of
        {AddSkills = [_ | _], AddAttrList, _} ->
            AddSkill = util:rand_list(AddSkills),
            {true, [AddSkill | AddAttrList], Skills1};
        {[], _, _} -> {false, lang:get("护符技能与宠物自身技能重合，无法进阶")}
    end.

cast_upgrade(Role, PetName, AddSkills, GenreType) ->
    Msg1 = notice:format(lang:get("恭喜！~ts进阶成功，获得了新形象"),
                         [{string_2, 5, PetName}]),
    Msg2 = case lists:member(GenreType, [2, 4]) of
               true ->
                   notice:format(lang:get("~ts5项资质~ts"),
                                 [{string_2, 5, PetName},
                                  {string_2, 1, "+30"}]);
               _ ->
                   notice:format(lang:get("~ts5项资质~ts"),
                                 [{string_2, 5, PetName}, {string_2, 1, "+20"}])
           end,
    notice:send(Role, 3, Msg1),
    notice:send(Role, 3, Msg2),
    case AddSkills of
        [] -> skip;
        _ ->
            SkillNameList = to_skill_name(AddSkills, ""),
            Msg3 = notice:format(lang:get("符石技能~ts转化为固化技能"),
                                 [{string_2, 5, SkillNameList}]),
            notice:send(Role, 3, Msg3)
    end,
    ok.

to_skill_name([], SkillName) -> SkillName;
to_skill_name([SkillId | T], SkillName) ->
    SkillName1 = case SkillName of
                     "" ->
                         util:flist("~ts", [pet_skill:skill_name(SkillId)]);
                     _ ->
                         util:flist("~ts、~ts",
                                    [SkillName, pet_skill:skill_name(SkillId)])
                 end,
    to_skill_name(T, SkillName1).

upgrade_aptitude(PetAttr = #pet_attr{max_hp_aptitude =
                                         MaxHpA,
                                     max_phy_aptitude = MaxPhyA,
                                     max_pdef_aptitude = MaxPdefA,
                                     max_magic_aptitude = MaxMagicA,
                                     max_aspd_aptitude = MaxAspdA},
                 AddAptitude) ->
    PetAttr#pet_attr{max_hp_aptitude = MaxHpA + AddAptitude,
                     max_phy_aptitude = MaxPhyA + AddAptitude,
                     max_pdef_aptitude = MaxPdefA + AddAptitude,
                     max_magic_aptitude = MaxMagicA + AddAptitude,
                     max_aspd_aptitude = MaxAspdA + AddAptitude}.

merge_upgrade(Attr, Skills, [], AddSkills) ->
    {Attr, Skills, AddSkills};
merge_upgrade(Attr, Skills,
              [A = #attr_base{name = 100} | T], AddSkills) ->
    case pet_skill:attr_to_skill(A, 1) of
        Skill = #pet_skill{id = SkillId} ->
            NewSkills = lists:keystore(SkillId,
                                       #pet_skill.id,
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

check_all_hole(_PetBaseId, _Grade, _Stones, HoleNum)
    when HoleNum =< 0 ->
    true;
check_all_hole(PetBaseId, Grade, Stones, HoleNum) ->
    case lists:keyfind(HoleNum, #item.id, Stones) of
        #item{base_id = BaseId} ->
            case check_stone(PetBaseId, Grade, HoleNum, BaseId) of
                true ->
                    check_all_hole(PetBaseId, Grade, Stones, HoleNum - 1);
                {false, _Reason} ->
                    Msg = notice:format(lang:get("~ts才能进阶哦"),
                                        [{string_2, 5, lang:get("集齐全部符石")}]),
                    {false, Msg}
            end;
        false ->
            Msg = notice:format(lang:get("~ts才能进阶哦"),
                                [{string_2, 5, lang:get("集齐全部符石")}]),
            {false, Msg}
    end.

check_stone(PetBaseId, Grade, HoleId, StoneId) ->
    case pet_data:allow_stone({PetBaseId, Grade, HoleId}) of
        AllowStone = [_ | _] ->
            case lists:member(StoneId, AllowStone) of
                true -> true;
                false -> {false, lang:get("当前宠物阶段不可装备此符石")}
            end;
        _ -> {false, lang:get("当前宠物不存在该符石孔数据")}
    end.

auto_use_stone(BaseID, PetId, HoleId,
               Role = #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{genre = 3} -> {false, lang:get("野生宠物不能装备符石")};
        Pet = #pet{base_id = PetBaseId, grade = Grade} ->
            case check_stone(PetBaseId, Grade, HoleId, BaseID) of
                true -> do_auto_use_stone(BaseID, Pet, HoleId, Role);
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

do_auto_use_stone(BaseID, #pet{id = PetId}, HoleId,
                  Role) ->
    case auto_fuse_pet_stone(BaseID, Role) of
        {ok, Role1 = #role{p_bag = Bag2}} ->
            case package:find_bind_unbind(BaseID, Bag2) of
                {[Item | _], _UnBindItems, BindNum, _UnBindNum}
                    when BindNum >= 1 ->
                    use_stone(Item, PetId, HoleId, Role1);
                {_BindItems, [Item | _], _BindNum, UnBindNum}
                    when UnBindNum >= 1 ->
                    use_stone(Item, PetId, HoleId, Role1);
                _ -> {false, lang:get("合成失败，无法自动镶嵌")}
            end;
        {ok, Msg, Role1} -> {ok, Msg, Role1};
        {false, Reason} -> {false, Reason}
    end.

auto_fuse_pet_stone(BaseID,
                    Role = #role{p_bag = Bag}) ->
    case fuse_data:get_fuse_by_base_id(BaseID) of
        [{_FuseID,
          PreBaseID,
          NeedNum,
          BaseID,
          CostAssets,
          Odds,
          Bind}
         | _] ->
            case get_fuse_loss(Bag, PreBaseID, NeedNum) of
                Lost1 = [_ | _] ->
                    Loss2 = [{IItemId, INum}
                             || {IItemId, INum} <- CostAssets],
                    Loss3 = Lost1 ++ Loss2,
                    Loss = format:val_to_loss(Loss3),
                    Items = [{BaseID, Bind, 1}],
                    Gain = format:val_to_gain(Items),
                    case role_gain:do(Loss, Role) of
                        {ok, Role1} ->
                            case util:rand(1, 100) =< Odds of
                                true ->
                                    case role_gain:auto_overlap(Gain, Role1) of
                                        {ok, Role2, _SucL, _FailL} ->
                                            Role3 =
                                                role_trigger:fire(#evt_fuse{base_id
                                                                                =
                                                                                BaseID},
                                                                  Role2),
                                            {ok, Role3};
                                        {false, #gain{msg = Msg}} ->
                                            {false, Msg};
                                        _Err ->
                                            logger:error("合成失败，无法自动镶嵌:~w",
                                                         [_Err],
                                                         pet_stone,
                                                         817),
                                            {false, lang:get("合成失败，无法自动镶嵌")}
                                    end;
                                _ -> {false, Role1, lang:get("合成失败，无法自动镶嵌")}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("合成材料不足，无法自动镶嵌")}
    end.

get_fuse_loss(Bag, BaseID, Num) ->
    case package:find_bind_unbind(BaseID, Bag) of
        {_BindItems, _UnBindItems, BindNum, _UnBindNum}
            when BindNum >= Num ->
            [{BaseID, Num}];
        {_BindItems, _UnBindItems, BindNum, UnBindNum} ->
            LossBind = case BindNum > 0 of
                           true -> [{BaseID, BindNum}];
                           _ -> []
                       end,
            LossUnBind = case UnBindNum > 0 of
                             true ->
                                 LossNum = case Num - BindNum > UnBindNum of
                                               true -> UnBindNum;
                                               _ -> Num - BindNum
                                           end,
                                 [{BaseID, LossNum}];
                             _ -> []
                         end,
            Loss = LossBind ++ LossUnBind,
            OffNum = Num - BindNum - UnBindNum,
            case OffNum > 0 of
                true ->
                    case fuse_data:get_fuse_by_base_id(BaseID) of
                        [{_FuseID,
                          PreBaseID,
                          NeedNum1,
                          BaseID,
                          CostAssets,
                          _,
                          _}
                         | _] ->
                            NeedNum = OffNum * NeedNum1,
                            case get_fuse_loss(Bag, PreBaseID, NeedNum) of
                                Loss1 = [_ | _] -> Loss1 ++ Loss ++ CostAssets;
                                {false, Reason} -> {false, Reason}
                            end;
                        _ -> {false, lang:get("合成材料不足，无法自动镶嵌")}
                    end;
                _ -> Loss
            end
    end.

do_calc_stone_attr(Pet = #pet{name = _Name, lev = Lev,
                              grade = _Grade, grade_attr = GradeAttr,
                              stones = Stones, feed_point = FeedPoint,
                              pet_attr =
                                  PetAttr = #pet_attr{point = Point,
                                                      p_str = Str1,
                                                      p_con = Con1,
                                                      p_mag = Mag1,
                                                      p_agi = Agi1,
                                                      p_end = End1}}) ->
    PetAllPoint = get_all_point(Pet),
    PetTotal = Lev * 10 + FeedPoint,
    case PetTotal =/= PetAllPoint orelse Point < 0 of
        true ->
            case Point < 0 of
                true ->
                    NPet = #pet{pet_attr =
                                    NPetAttr = #pet_attr{point = OldPoint}} =
                               case GradeAttr of
                                   [#attr_base{name = 101} | _] ->
                                       NewPetAttr = PetAttr#pet_attr{p_str =
                                                                         Str1 +
                                                                             Point,
                                                                     point = 0},
                                       NewPet = Pet#pet{pet_attr = NewPetAttr},
                                       NewPet;
                                   [#attr_base{name = 102} | _] ->
                                       NewPetAttr = PetAttr#pet_attr{p_con =
                                                                         Con1 +
                                                                             Point,
                                                                     point = 0},
                                       NewPet = Pet#pet{pet_attr = NewPetAttr},
                                       NewPet;
                                   [#attr_base{name = 103} | _] ->
                                       NewPetAttr = PetAttr#pet_attr{p_mag =
                                                                         Mag1 +
                                                                             Point,
                                                                     point = 0},
                                       NewPet = Pet#pet{pet_attr = NewPetAttr},
                                       NewPet;
                                   [#attr_base{name = 104} | _] ->
                                       NewPetAttr = PetAttr#pet_attr{p_agi =
                                                                         Agi1 +
                                                                             Point,
                                                                     point = 0},
                                       NewPet = Pet#pet{pet_attr = NewPetAttr},
                                       NewPet;
                                   _ ->
                                       NewPetAttr = PetAttr#pet_attr{p_end =
                                                                         End1 +
                                                                             Point,
                                                                     point = 0},
                                       NewPet = Pet#pet{pet_attr = NewPetAttr},
                                       NewPet
                               end,
                    NewAllPoint = get_all_point(NPet),
                    LeftPoint = PetTotal - NewAllPoint,
                    NPet#pet{pet_attr =
                                 NPetAttr#pet_attr{point =
                                                       OldPoint + LeftPoint}};
                _ ->
                    AttrList = do_calc_pet_point(Stones, GradeAttr),
                    NewPetAttr = #pet_attr{point = FreePoint, p_str = Str,
                                           p_con = Con, p_mag = Mag,
                                           p_agi = Agi} =
                                     del_pet_attr_point(AttrList, PetAttr),
                    logger:debug("重新计算后的属性:~w",
                                 [NewPetAttr],
                                 pet_stone,
                                 917),
                    Pet1 = Pet#pet{pet_attr = NewPetAttr},
                    NewAllPoint = get_all_point(Pet1),
                    case PetTotal =:= NewAllPoint of
                        true -> Pet1;
                        _ ->
                            LeftPoint = PetTotal - NewAllPoint,
                            case LeftPoint < 0 of
                                true ->
                                    case GradeAttr of
                                        [#attr_base{name = 101} | _] ->
                                            NewPetAttr1 =
                                                NewPetAttr#pet_attr{p_str =
                                                                        Str +
                                                                            LeftPoint},
                                            NewPet = Pet1#pet{pet_attr =
                                                                  NewPetAttr1},
                                            NewPet;
                                        [#attr_base{name = 102} | _] ->
                                            NewPetAttr1 =
                                                NewPetAttr#pet_attr{p_con =
                                                                        Con +
                                                                            LeftPoint},
                                            NewPet = Pet1#pet{pet_attr =
                                                                  NewPetAttr1},
                                            NewPet;
                                        [#attr_base{name = 103} | _] ->
                                            NewPetAttr1 =
                                                NewPetAttr#pet_attr{p_mag =
                                                                        Mag +
                                                                            LeftPoint},
                                            NewPet = Pet1#pet{pet_attr =
                                                                  NewPetAttr1},
                                            NewPet;
                                        [#attr_base{name = 104} | _] ->
                                            NewPetAttr1 =
                                                NewPetAttr#pet_attr{p_agi =
                                                                        Agi +
                                                                            LeftPoint},
                                            NewPet = Pet1#pet{pet_attr =
                                                                  NewPetAttr1},
                                            NewPet;
                                        _ ->
                                            NewPetAttr1 =
                                                NewPetAttr#pet_attr{point =
                                                                        FreePoint
                                                                            +
                                                                            LeftPoint},
                                            NewPet = Pet1#pet{pet_attr =
                                                                  NewPetAttr1},
                                            NewPet
                                    end;
                                _ ->
                                    NewPetAttr1 = NewPetAttr#pet_attr{point =
                                                                          FreePoint
                                                                              +
                                                                              LeftPoint},
                                    NewPet = Pet1#pet{pet_attr = NewPetAttr1},
                                    NewPet
                            end
                    end
            end;
        _ -> Pet
    end.

get_all_point(#pet{pet_attr =
                       #pet_attr{point = Point, p_str = Str, p_con = Con,
                                 p_mag = Mag, p_agi = Agi, p_end = End}}) ->
    Point + Str + Con + Mag + Agi + End.

del_pet_attr_point([], Pet) -> Pet;
del_pet_attr_point([#attr_base{name = 101, val = Val}
                    | T],
                   PettAttr = #pet_attr{p_str = Str}) ->
    NewPetAttr = PettAttr#pet_attr{p_str = Str - Val},
    del_pet_attr_point(T, NewPetAttr);
del_pet_attr_point([#attr_base{name = 102, val = Val}
                    | T],
                   PettAttr = #pet_attr{p_con = Con}) ->
    NewPetAttr = PettAttr#pet_attr{p_con = Con - Val},
    del_pet_attr_point(T, NewPetAttr);
del_pet_attr_point([#attr_base{name = 103, val = Val}
                    | T],
                   PettAttr = #pet_attr{p_mag = Mag}) ->
    NewPetAttr = PettAttr#pet_attr{p_mag = Mag - Val},
    del_pet_attr_point(T, NewPetAttr);
del_pet_attr_point([#attr_base{name = 104, val = Val}
                    | T],
                   PettAttr = #pet_attr{p_agi = Agi}) ->
    NewPetAttr = PettAttr#pet_attr{p_agi = Agi - Val},
    del_pet_attr_point(T, NewPetAttr);
del_pet_attr_point([#attr_base{name = 105, val = Val}
                    | T],
                   PettAttr = #pet_attr{p_end = End}) ->
    NewPetAttr = PettAttr#pet_attr{p_end = End - Val},
    del_pet_attr_point(T, NewPetAttr).

do_calc_pet_point(Stones, GradeAttr) ->
    StonePoint = do_calc_pet_stone(Stones, []),
    GradePoint = do_calc_pet_grade(GradeAttr, []),
    merge_attr(StonePoint, GradePoint).

do_calc_pet_stone([], Point) -> Point;
do_calc_pet_stone([#item{attr = Attr} | T], Point) ->
    AttrPoint = do_calc_pet_grade(Attr, []),
    NewPoint = merge_attr(AttrPoint, Point),
    do_calc_pet_stone(T, NewPoint);
do_calc_pet_stone([_ | T], Point) ->
    do_calc_pet_stone(T, Point).

do_calc_pet_grade([], Point) -> Point;
do_calc_pet_grade([Attr = #attr_base{name = AttrName}
                   | T],
                  Point) ->
    case lists:member(AttrName, [101, 102, 103, 104, 105])
        of
        true ->
            NewPoint = merge_attr(Attr, Point),
            do_calc_pet_grade(T, NewPoint);
        _ -> do_calc_pet_grade(T, Point)
    end;
do_calc_pet_grade([_Attr | T], Point) ->
    do_calc_pet_grade(T, Point).

merge_attr(AddAttr = #attr_base{name = AttrName,
                                val = Val},
           Attrs) ->
    case lists:keyfind(AttrName, #attr_base.name, Attrs) of
        Attr = #attr_base{val = OldVal} ->
            NewAttr = Attr#attr_base{val = OldVal + Val},
            lists:keystore(AttrName,
                           #attr_base.name,
                           Attrs,
                           NewAttr);
        _ -> [AddAttr | Attrs]
    end;
merge_attr([], Attrs) -> Attrs;
merge_attr([AddAttr = #attr_base{} | T], Attrs) ->
    NewAttrs = merge_attr(AddAttr, Attrs),
    merge_attr(T, NewAttrs);
merge_attr([_ | T], Attrs) -> merge_attr(T, Attrs).

