-file("src/mod/misc/format.erl", 1).

-module(format).

-export([sec_to_text/1,
         check_val/2,
         gain_text/2,
         gain_text/3,
         gain_to_val/1,
         gain_to_val/2,
         gain_to_unbind_val/1,
         merge_gl/1,
         to_attr_msg/2,
         to_point_msg/2,
         to_assets_msg/1,
         to_assets_msg/2,
         attr_text/1,
         to_attr_type/1,
         val_to_gain/1,
         val_to_loss/1,
         val_to_loss/2,
         merge_val/2,
         loss_to_auto_buy/1,
         classes_name/1]).

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

-file("src/mod/misc/format.erl", 33).

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

-file("src/mod/misc/format.erl", 34).

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

-file("src/mod/misc/format.erl", 35).

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

-file("src/mod/misc/format.erl", 36).

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

-file("src/mod/misc/format.erl", 37).

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

-file("src/mod/misc/format.erl", 38).

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

-file("src/mod/misc/format.erl", 39).

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

-file("src/mod/misc/format.erl", 40).

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

-file("src/mod/misc/format.erl", 41).

-spec sec_to_text(non_neg_integer()) -> bitstring().

sec_to_text(Sec) ->
    Day = Sec div 86400,
    Sec0 = Sec rem 86400,
    Hour = Sec0 div 3600,
    Sec1 = Sec0 rem 3600,
    Min = Sec1 div 60,
    Sec2 = Sec1 rem 60,
    DayBin = case Day > 0 of
                 true -> util:fbin(lang:get("~w天"), [Day]);
                 false -> <<>>
             end,
    HourBin = case Hour > 0 of
                  true -> util:fbin(lang:get("~w小时"), [Hour]);
                  false -> <<>>
              end,
    MinBin = case Min > 0 of
                 true -> util:fbin(lang:get("~w分"), [Min]);
                 false -> <<>>
             end,
    SecBin = case Sec2 > 0 orelse
                      Day =:= 0 andalso Hour =:= 0 andalso Min =:= 0
                 of
                 true -> util:fbin(lang:get("~w秒"), [Sec2]);
                 false -> <<>>
             end,
    <<DayBin/binary, HourBin/binary, MinBin/binary,
      SecBin/binary>>.

classes_name(1) -> lang:get("狂剑");
classes_name(2) -> lang:get("魔导");
classes_name(3) -> lang:get("战弓");
classes_name(4) -> lang:get("兽灵");
classes_name(5) -> lang:get("秘言");
classes_name(6) -> lang:get("月魂");
classes_name(7) -> lang:get("圣骑");
classes_name(_) -> lang:get("未知").

check_val(Name, Val) when Val =< 0 ->
    logger:error("低于0的奖励,不予发放[~w:~w], 调用堆栈:[~w]",
                 [Name, Val, util:get_stacktrace()],
                 format,
                 92),
    false;
check_val(90000, _Val) -> true;
check_val(90001, _Val) -> true;
check_val(90002, _Val) -> true;
check_val(90003, _Val) -> true;
check_val(90007, _Val) -> true;
check_val(90011, _Val) -> true;
check_val(90010, _Val) -> true;
check_val(90005, _Val) -> true;
check_val(90015, _Val) -> true;
check_val(90013, _Val) -> true;
check_val(90012, _Val) -> true;
check_val(90018, _Val) -> true;
check_val(90036, _Val) -> true;
check_val(90019, _Val) -> true;
check_val(90020, _Val) -> true;
check_val(90024, _Val) -> true;
check_val(90026, _Val) -> true;
check_val(90021, _Val) -> true;
check_val(90016, _Val) -> true;
check_val(90022, _Val) -> true;
check_val(90023, _Val) -> true;
check_val(90025, _Val) -> true;
check_val(90027, _Val) -> true;
check_val(90028, _Val) -> true;
check_val(90029, _Val) -> true;
check_val(90033, _Val) -> true;
check_val(90034, _Val) -> true;
check_val(90041, _Val) -> true;
check_val(90035, _Val) -> true;
check_val(90037, _Val) -> true;
check_val(90038, _Val) -> true;
check_val(90040, _Val) -> true;
check_val(90039, _Val) -> true;
check_val(90042, _Val) -> true;
check_val(90044, _Val) -> true;
check_val(90045, _Val) -> true;
check_val(90046, _Val) -> true;
check_val(90047, _Val) -> true;
check_val(90048, _Val) -> true;
check_val(90049, _Val) -> true;
check_val(90050, _Val) -> true;
check_val(90051, _Val) -> true;
check_val(90052, _Val) -> true;
check_val(90056, _Val) -> true;
check_val(90055, _Val) -> true;
check_val(90057, _Val) -> true;
check_val(90061, _Val) -> true;
check_val(90062, _Val) -> true;
check_val(90063, _Val) -> true;
check_val(90066, _Val) -> true;
check_val(90067, _Val) -> true;
check_val(90068, _Val) -> true;
check_val(90069, _Val) -> true;
check_val(90071, _Val) -> true;
check_val(Name, _Val) when Name < 90000 ->
    case item_data:get(Name) of
        #item_base{} -> true;
        _ ->
            logger:error("不存在的物品不予发放[~w:~w]",
                         [Name, _Val],
                         format,
                         156),
            false
    end;
check_val(_Name, _Val) ->
    logger:error("不存在的奖励不予发放[~w:~w]",
                 [_Name, _Val],
                 format,
                 161),
    false.

to_attr_msg(1, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("生命")}, {string_2, 5, Val}]);
to_attr_msg(2, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("魔法")}, {string_2, 5, Val}]);
to_attr_msg(3, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("攻速")}, {string_2, 5, Val}]);
to_attr_msg(4, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("物攻")}, {string_2, 5, Val}]);
to_attr_msg(5, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("魔攻")}, {string_2, 5, Val}]);
to_attr_msg(6, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("物防")}, {string_2, 5, Val}]);
to_attr_msg(7, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("魔防")}, {string_2, 5, Val}]);
to_attr_msg(8, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("暴击")}, {string_2, 5, Val}]);
to_attr_msg(9, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("坚韧")}, {string_2, 5, Val}]);
to_attr_msg(10, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("命中")}, {string_2, 5, Val}]);
to_attr_msg(11, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("闪避")}, {string_2, 5, Val}]);
to_attr_msg(12, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("移速")}, {string_2, 5, Val}]);
to_attr_msg(21, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("神圣伤害")}, {string_2, 5, Val}]);
to_attr_msg(22, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("暴击伤害")}, {string_2, 5, Val}]);
to_attr_msg(47, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("暴伤减免")}, {string_2, 5, Val}]);
to_attr_msg(25, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("控制加强")}, {string_2, 5, Val}]);
to_attr_msg(26, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("控制抵抗")}, {string_2, 5, Val}]);
to_attr_msg(51, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("生命")},
                   {string_2, 5, Val / 10}]);
to_attr_msg(52, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("魔法")},
                   {string_2, 5, Val / 10}]);
to_attr_msg(53, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("攻速")},
                   {string_2, 5, Val / 10}]);
to_attr_msg(54, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("物攻")},
                   {string_2, 5, Val / 10}]);
to_attr_msg(55, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("魔攻")},
                   {string_2, 5, Val / 10}]);
to_attr_msg(56, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("物防")},
                   {string_2, 5, Val / 10}]);
to_attr_msg(57, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("魔防")},
                   {string_2, 5, Val / 10}]);
to_attr_msg(58, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("暴击")},
                   {string_2, 5, Val / 10}]);
to_attr_msg(59, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("坚韧")},
                   {string_2, 5, Val / 10}]);
to_attr_msg(60, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("命中")},
                   {string_2, 5, Val / 10}]);
to_attr_msg(61, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("闪避")},
                   {string_2, 5, Val / 10}]);
to_attr_msg(62, Val) ->
    notice:format(lang:get("~ts+~ts"),
                  [{string_2, 1, lang:get("移动速度")},
                   {string_2, 5, Val / 10}]);
to_attr_msg(101, Val) ->
    notice:format(lang:get("~ts+~ts点"),
                  [{string_2, 1, lang:get("力量")}, {string_2, 5, Val}]);
to_attr_msg(102, Val) ->
    notice:format(lang:get("~ts+~ts点"),
                  [{string_2, 1, lang:get("体质")}, {string_2, 5, Val}]);
to_attr_msg(103, Val) ->
    notice:format(lang:get("~ts+~ts点"),
                  [{string_2, 1, lang:get("智力")}, {string_2, 5, Val}]);
to_attr_msg(104, Val) ->
    notice:format(lang:get("~ts+~ts点"),
                  [{string_2, 1, lang:get("敏捷")}, {string_2, 5, Val}]);
to_attr_msg(105, Val) ->
    notice:format(lang:get("~ts+~ts点"),
                  [{string_2, 1, lang:get("耐力")}, {string_2, 5, Val}]);
to_attr_msg(_, _Val) -> "".

to_point_msg(101, Val) ->
    notice:format(lang:get("~ts+~ts点"),
                  [{string_2, 1, lang:get("力量")}, {string_2, 5, Val}]);
to_point_msg(102, Val) ->
    notice:format(lang:get("~ts+~ts点"),
                  [{string_2, 1, lang:get("体质")}, {string_2, 5, Val}]);
to_point_msg(103, Val) ->
    notice:format(lang:get("~ts+~ts点"),
                  [{string_2, 1, lang:get("智力")}, {string_2, 5, Val}]);
to_point_msg(104, Val) ->
    notice:format(lang:get("~ts+~ts点"),
                  [{string_2, 1, lang:get("敏捷")}, {string_2, 5, Val}]);
to_point_msg(105, Val) ->
    notice:format(lang:get("~ts+~ts点"),
                  [{string_2, 1, lang:get("耐力")}, {string_2, 5, Val}]);
to_point_msg(_, _Val) -> "".

to_attr_type(0) -> lang:get("普通");
to_attr_type(_) -> lang:get("未知").

to_assets_msg(List) -> to_assets_msg(List, "").

to_assets_msg([], Msg) -> Msg;
to_assets_msg([{Name, Val} | T], Msg) ->
    Bin = to_assets_msg(Name, Val),
    case Msg of
        "" -> to_assets_msg(T, util:flist("~ts", [Bin]));
        _ ->
            to_assets_msg(T, util:flist("~ts, ~ts", [Msg, Bin]))
    end;
to_assets_msg(90000, Val) ->
    util:flist(lang:get("银币X~w"), [Val]);
to_assets_msg(90001, Val) ->
    util:flist(lang:get("绑定银币X~w"), [Val]);
to_assets_msg(90002, Val) ->
    util:flist(lang:get("钻石X~w"), [Val]);
to_assets_msg(90003, Val) ->
    util:flist(lang:get("金币X~w"), [Val]);
to_assets_msg(_, _Val) -> <<"">>.

attr_text(L) -> attr_text(L, []).

attr_text([], L) -> string:join(lists:reverse(L), ",");
attr_text([#attr_base{name = Name, val = Val} | T], L)
    when Val > 0 ->
    case to_attr_msg(Name, Val) of
        "" -> attr_text(T, L);
        List -> attr_text(T, [List | L])
    end;
attr_text([{Name, Val} | T], L) when Val > 0 ->
    case to_attr_msg(Name, Val) of
        "" -> attr_text(T, L);
        List -> attr_text(T, [List | L])
    end;
attr_text([_ | T], L) -> attr_text(T, L).

gain_text(L, Role) ->
    Opts = #gain_text_opts{gain_tag = lang:get("获得"),
                           loss_tag = lang:get("消耗")},
    gain_text(L, Opts, Role).

gain_text(#gain{val = 0}, _Opts, _Role) -> "";
gain_text(#loss{val = 0}, _Opts, _Role) -> "";
gain_text(#gain{label = talisman,
                val = [{BaseId, Val}]},
          _Opts, _Role) ->
    io_lib:format("{item_2, ~w, 0, ~w}", [BaseId, Val]);
gain_text(#gain{label = coin, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90000, Val]);
gain_text(#loss{label = coin, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90000, Val]);
gain_text(#gain{label = gold, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90002, Val]);
gain_text(#loss{label = gold, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90002, Val]);
gain_text(#gain{label = gold_bind, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90003, Val]);
gain_text(#loss{label = gold_bind, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90003, Val]);
gain_text(#loss{label = teacher_score, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90019, Val]);
gain_text(#loss{label = tournament, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90020, Val]);
gain_text(#loss{label = handbook_point, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90024, Val]);
gain_text(#loss{label = star_gold, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90026, Val]);
gain_text(#loss{label = halloween, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90027, Val]);
gain_text(#loss{label = thanksgiving, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90028, Val]);
gain_text(#loss{label = glue_pudding, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90034, Val]);
gain_text(#loss{label = father, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90041, Val]);
gain_text(#loss{label = lottery_luck, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90022, Val]);
gain_text(#loss{label = new_year, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90029, Val]);
gain_text(#loss{label = firecracker, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90033, Val]);
gain_text(#loss{label = crystal, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90035, Val]);
gain_text(#loss{label = ticket, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90037, Val]);
gain_text(#loss{label = brother, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90036, Val]);
gain_text(#loss{label = egg, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90038, Val]);
gain_text(#loss{label = skl_unique_exp, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90055, Val]);
gain_text(#loss{label = turn, val = Val}, _Opts,
          _Role) ->
    notice:format(lang:get("充值好礼~ts份"),
                  [{string_2, 1, Val}]);
gain_text(#loss{label = exchange, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90039, Val]);
gain_text(#gain{label = exp, val = Val,
                ext_val = ExtVal},
          _Opts, _Role)
    when ExtVal > 0 ->
    io_lib:format("{exp_1, ~w, ~w}", [Val, ExtVal]);
gain_text(#loss{label = exp, val = Val,
                ext_val = ExtVal},
          _Opts, _Role)
    when ExtVal > 0 ->
    io_lib:format("{exp_1, ~w, ~w}", [Val, ExtVal]);
gain_text(#gain{label = exp, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90010, Val]);
gain_text(#gain{label = pet, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{pet_2, ~w}", [Val]);
gain_text(#gain{label = pet_custom,
                val = {PetId, _, _, _, _}},
          _Opts, _Role) ->
    io_lib:format("{pet_2, ~w}", [PetId]);
gain_text(#gain{label = intelligs, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90004, Val]);
gain_text(#loss{label = intelligs, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90004, Val]);
gain_text(#gain{label = energy, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90006, Val]);
gain_text(#loss{label = energy, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90006, Val]);
gain_text(#gain{label = stars_score, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90012, Val]);
gain_text(#loss{label = stars_score, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90012, Val]);
gain_text(#gain{label = lucky_ticket, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90042, Val]);
gain_text(#loss{label = lucky_ticket, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90042, Val]);
gain_text(#gain{label = dollar, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90044, Val]);
gain_text(#loss{label = dollar, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90044, Val]);
gain_text(#gain{label = naughty, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90045, Val]);
gain_text(#loss{label = naughty, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90045, Val]);
gain_text(#gain{label = concentric, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90046, Val]);
gain_text(#loss{label = concentric, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90046, Val]);
gain_text(#gain{label = qixiIntegral, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90047, Val]);
gain_text(#loss{label = qixiIntegral, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90047, Val]);
gain_text(#gain{label = sunshine, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90048, Val]);
gain_text(#loss{label = sunshine, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90048, Val]);
gain_text(#gain{label = cut_price, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90049, Val]);
gain_text(#loss{label = cut_price, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90049, Val]);
gain_text(#gain{label = single_dog, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90050, Val]);
gain_text(#loss{label = single_dog, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90050, Val]);
gain_text(#gain{label = character, val = _Val}, _Opts,
          _Role) ->
    "";
gain_text(#loss{label = character, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90007, Val]);
gain_text(#gain{label = guild, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90011, Val]);
gain_text(#loss{label = guild, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90011, Val]);
gain_text(#gain{label = guild_assets, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90015, Val]);
gain_text(#gain{label = satiety, val = Val}, _Opts,
          _Role) ->
    notice:format(lang:get("~ts"),
                  [{string_2,
                    5,
                    io_lib:format(lang:get("~w饱食度"), [Val])}]);
gain_text(#gain{label = alchemy, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90017, Val]);
gain_text(#loss{label = alchemy, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90017, Val]);
gain_text(#loss{label = satiety, val = _Val}, _Opts,
          _Role) ->
    "";
gain_text(#gain{label = love, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90018, Val]);
gain_text(#loss{label = love, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90018, Val]);
gain_text(#gain{label = brother, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90036, Val]);
gain_text(#gain{label = teacher_score, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90019, Val]);
gain_text(#gain{label = tournament, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90020, Val]);
gain_text(#gain{label = handbook_point, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90024, Val]);
gain_text(#gain{label = star_gold, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90026, Val]);
gain_text(#gain{label = halloween, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90027, Val]);
gain_text(#gain{label = thanksgiving, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90028, Val]);
gain_text(#gain{label = glue_pudding, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90034, Val]);
gain_text(#gain{label = father, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90041, Val]);
gain_text(#gain{label = crystal, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90035, Val]);
gain_text(#gain{label = ticket, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90037, Val]);
gain_text(#gain{label = lottery_luck, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90022, Val]);
gain_text(#gain{label = new_year, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90029, Val]);
gain_text(#gain{label = firecracker, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90033, Val]);
gain_text(#gain{label = egg, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90038, Val]);
gain_text(#gain{label = skl_unique_exp, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90055, Val]);
gain_text(#gain{label = turn, val = Val}, _Opts,
          _Role) ->
    notice:format(lang:get("充值好礼~ts份"),
                  [{string_2, 1, Val}]);
gain_text(#gain{label = exchange, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90039, Val]);
gain_text(#gain{label = mount_spirit, val = Val}, _Opts,
          _Role = #role{m_mount = #m_mount{mounts = Mounts}}) ->
    case lists:keymember(3, #mount.live_status, Mounts) of
        true ->
            io_lib:format("{assets_1, ~w, ~w}", [90021, Val]);
        false -> ""
    end;
gain_text(#loss{label = mount_spirit, val = Val}, _Opts,
          _Role = #role{m_mount = #m_mount{mounts = Mounts}}) ->
    case lists:keymember(3, #mount.live_status, Mounts) of
        true ->
            io_lib:format("{assets_1, ~w, ~w}", [90021, Val]);
        false -> ""
    end;
gain_text(#gain{label = endless_challenge, val = Val},
          _Opts,
          _Role = #role{assets =
                            #assets{endless_challenge =
                                        EndlessChallengeVal}}) ->
    case EndlessChallengeVal < 2000 of
        true ->
            io_lib:format("{assets_1, ~w, ~w}", [90023, Val]);
        false -> ""
    end;
gain_text(#loss{label = endless_challenge, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90023, Val]);
gain_text(#gain{label = autumn_score, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90025, Val]);
gain_text(#loss{label = autumn_score, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90025, Val]);
gain_text(#loss{label = star_gold_or_gold, val = Val,
                ext_val = Gold},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}{assets_1, ~w, ~w}",
                  [90026, abs(Val - Gold), 90002, Gold]);
gain_text(#gain{label = item_base_id, val = []}, _Opts,
          _Role) ->
    "";
gain_text(#gain{label = item_base_id, val = [{_, 0}]},
          _Opts, _Role) ->
    "";
gain_text(#gain{label = item_base_id,
                val = [{_, _, 0}]},
          _Opts, _Role) ->
    "";
gain_text(#gain{label = item_base_id,
                val = [#{base := 0}]},
          _Opts, _Role) ->
    "";
gain_text(#gain{label = flower_says}, _Opts, _Role) ->
    "";
gain_text(#loss{label = flower_says}, _Opts, _Role) ->
    "";
gain_text(#gain{label = item_base_id,
                val = Items = [_ | _]},
          _Opts, _Role) ->
    case notice:make_item_base(Items) of
        false -> "";
        {ok, R} -> [R]
    end;
gain_text(#loss{label = item_base_id,
                val = Items = [_ | _]},
          _Opts, _Role) ->
    case notice:make_item_base([Item
                                || Item = {_, Num} <- Items, Num > 0])
        of
        false -> "";
        {ok, R} -> [R]
    end;
gain_text(#loss{label = item_base_id_auto_buy,
                val = Items = [_ | _]},
          _Opts, _Role) ->
    case notice:make_item_base([Item
                                || Item = {_, Num} <- Items, Num > 0])
        of
        false -> "";
        {ok, R} -> [R]
    end;
gain_text(#gain{label = items, val = []}, _Opts,
          _Role) ->
    "";
gain_text(#gain{label = items, val = Items = [_ | _]},
          _Opts, _Role) ->
    case notice:make_item(Items) of
        false -> "";
        {ok, R} -> [R]
    end;
gain_text(#loss{label = items, val = []}, _Opts,
          _Role) ->
    "";
gain_text(#loss{label = items, val = Items = [_ | _]},
          _Opts, _Role) ->
    case notice:make_item_base(Items) of
        false -> "";
        {ok, R} -> [R]
    end;
gain_text(#loss{label = items_id, val = []}, _Opts,
          _Role) ->
    "";
gain_text(#loss{label = item_id,
                val = ItemIds = [_ | _]},
          _Opts, #role{p_bag = Pbag}) ->
    Items = gain_text_find_item_id(ItemIds, Pbag, []),
    case notice:make_item_base(Items) of
        false -> "";
        {ok, R} -> [R]
    end;
gain_text(#gain{label = classes_sex_item, val = []},
          _Opts, _Role) ->
    "";
gain_text(#gain{label = classes_sex_item,
                val = [{_Classes, _Sex, _BaseId, _IsBind, 0}]},
          _Opts, _Role) ->
    "";
gain_text(#gain{label = classes_sex_item,
                val = Items = [_ | _]},
          _Opts, #role{classes = Classes, sex = Sex}) ->
    NewItems = classes_sex_item(Items, Classes, Sex, []),
    case notice:make_item_base(NewItems) of
        false -> "";
        {ok, R} -> [R]
    end;
gain_text(#gain{label = pet_exp}, _Opts, _Role) -> "";
gain_text(#gain{label = prac_exp}, _Opts, _Role) -> "";
gain_text(#gain{label = tonic}, _Opts, _Role) -> "";
gain_text(#gain{label = pregnancy, val = Val}, _Opts,
          Role) ->
    case child:is_pregnant(Role) of
        {true, _} ->
            io_lib:format("{assets_1, ~w, ~w}", [90032, Val]);
        _ -> ""
    end;
gain_text(#gain{label = fertility}, _Opts, _Role) -> "";
gain_text(#gain{label = achieve_score, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90008, Val]);
gain_text(#loss{label = achieve_score, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90008, Val]);
gain_text(#gain{label = panda_score, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90051, Val]);
gain_text(#loss{label = panda_score, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90051, Val]);
gain_text(#gain{label = joyful_egg, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90052, Val]);
gain_text(#loss{label = joyful_egg, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90052, Val]);
gain_text(#gain{label = godswar, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90056, Val]);
gain_text(#loss{label = godswar, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90056, Val]);
gain_text(#gain{label = happy_score, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90057, Val]);
gain_text(#loss{label = happy_score, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90057, Val]);
gain_text(#gain{label = slot_machine, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90061, Val]);
gain_text(#loss{label = slot_machine, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90061, Val]);
gain_text(#gain{label = reserve_gold, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90062, Val]);
gain_text(#loss{label = reserve_gold, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90062, Val]);
gain_text(#gain{label = zillionaire_sc, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90063, Val]);
gain_text(#loss{label = zillionaire_sc, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90063, Val]);
gain_text(#gain{label = score_exchange, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90066, Val]);
gain_text(#loss{label = score_exchange, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90066, Val]);
gain_text(#gain{label = new_open_turn, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90067, Val]);
gain_text(#loss{label = new_open_turn, val = Val},
          _Opts, _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90067, Val]);
gain_text(#gain{label = long_active, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90068, Val]);
gain_text(#loss{label = long_active, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90068, Val]);
gain_text(#gain{label = long_score, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90069, Val]);
gain_text(#loss{label = long_score, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90069, Val]);
gain_text(#gain{label = camp_pray_sc, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90071, Val]);
gain_text(#loss{label = camp_pray_sc, val = Val}, _Opts,
          _Role) ->
    io_lib:format("{assets_1, ~w, ~w}", [90071, Val]);
gain_text(L,
          Opts = #gain_text_opts{gain_tag = GainTag,
                                 loss_tag = LossTag, order = Order,
                                 split_op_str = SplitOp},
          Role)
    when is_list(L) ->
    GLStr = case split_gl(L, [], []) of
                Empty = {[], []} -> Empty;
                {GAcc, []} -> {gain_text(GAcc, Opts, Role, []), []};
                {[], LAcc} -> {[], gain_text(LAcc, Opts, Role, [])};
                {GAcc, LAcc} ->
                    GStr = gain_text(GAcc, Opts, Role, []),
                    LStr = gain_text(LAcc, Opts, Role, []),
                    {GStr, LStr}
            end,
    case GLStr of
        {[], []} -> "";
        {Str, []} ->
            GainText = {string_1, Str},
            Tag = case GainTag of
                      [] -> lang:get("获得");
                      _ -> GainTag
                  end,
            TagFmt = {string_1, Tag},
            notice:format("~ts~ts", [TagFmt, GainText]);
        {[], Str} ->
            LossText = {string_1, Str},
            Tag = case LossTag of
                      [] -> lang:get("消耗");
                      _ -> LossTag
                  end,
            TagFmt = {string_1, Tag},
            notice:format("~ts~ts", [TagFmt, LossText]);
        {GainStr, LossStr} ->
            GainText = {string_1, GainStr},
            LossText = {string_1, LossStr},
            GTag = case GainTag of
                       [] -> lang:get("获得");
                       _ -> GainTag
                   end,
            LTag = case LossTag of
                       [] -> lang:get("消耗");
                       _ -> LossTag
                   end,
            GTagFmt = {string_1, GTag},
            LTagFmt = {string_1, LTag},
            Args = case Order of
                       gain ->
                           [GTagFmt,
                            GainText,
                            {string_1, SplitOp},
                            LTagFmt,
                            LossText];
                       loss ->
                           [LTagFmt,
                            LossText,
                            {string_1, SplitOp},
                            GTagFmt,
                            GainText]
                   end,
            notice:format("~ts~ts~ts~ts~ts", Args)
    end;
gain_text(Unknow, _Opts, _Role) ->
    logger:error("未知的损益格式[Unknow:~w]",
                 [Unknow],
                 format,
                 658),
    "".

gain_text([], #gain_text_opts{split_str = SplitStr},
          _Role, Acc) ->
    string:join(lists:reverse(Acc), SplitStr);
gain_text([H | T], Opts, Role, Acc) ->
    case gain_text(H, Opts, Role) of
        [] -> gain_text(T, Opts, Role, Acc);
        Str = [_ | _] -> gain_text(T, Opts, Role, [Str | Acc]);
        _False ->
            logger:debug("未知的损益格式[gl:~w][Err:~w]",
                         [H, _False],
                         format,
                         670),
            gain_text(T, Opts, Role, Acc)
    end;
gain_text(Unknow, _Opts, _Role, _Acc) ->
    logger:error("未知的损益格式[Unknow:~w]",
                 [Unknow],
                 format,
                 674),
    "".

split_gl([], GainAcc, LossAcc) ->
    {lists:reverse(GainAcc), lists:reverse(LossAcc)};
split_gl([L = #loss{} | Rest], GainAcc, LossAcc) ->
    split_gl(Rest, GainAcc, [L | LossAcc]);
split_gl([G = #gain{} | Rest], GainAcc, LossAcc) ->
    split_gl(Rest, [G | GainAcc], LossAcc);
split_gl([_ | Rest], GainAcc, LossAcc) ->
    split_gl(Rest, GainAcc, LossAcc).

merge_val([], List) -> List;
merge_val([{K, V} | T], List) ->
    case lists:keyfind(K, 1, List) of
        false -> merge_val(T, [{K, V} | List]);
        {K, V1} ->
            merge_val(T, lists:keyreplace(K, 1, List, {K, V + V1}))
    end;
merge_val([{K, B, V} | T], List) ->
    case lists:keyfind(K, 1, List) of
        {K, B, V1} ->
            merge_val(T,
                      lists:keyreplace(K, 1, List, {K, B, V + V1}));
        _ -> merge_val(T, [{K, B, V} | List])
    end;
merge_val([_Other | T], List) -> merge_val(T, List).

merge_gl(GL) -> merge_gl(GL, [], []).

merge_gl([], GAcc, LAcc) -> GAcc ++ LAcc;
merge_gl([L = #loss{label = Label = coin, val = Val}
          | T],
         GAcc, LAcc) ->
    case lists:keyfind(Label, #loss.label, LAcc) of
        PreL = #loss{val = PreVal} ->
            NewL = PreL#loss{val = Val + PreVal},
            NewLAcc = lists:keystore(Label,
                                     #loss.label,
                                     LAcc,
                                     NewL),
            merge_gl(T, GAcc, NewLAcc);
        _ -> merge_gl(T, GAcc, [L | LAcc])
    end;
merge_gl([L = #loss{label = Label = gold_bind,
                    val = Val}
          | T],
         GAcc, LAcc) ->
    case lists:keyfind(Label, #loss.label, LAcc) of
        PreL = #loss{val = PreVal} ->
            NewL = PreL#loss{val = Val + PreVal},
            NewLAcc = lists:keystore(Label,
                                     #loss.label,
                                     LAcc,
                                     NewL),
            merge_gl(T, GAcc, NewLAcc);
        _ -> merge_gl(T, GAcc, [L | LAcc])
    end;
merge_gl([#loss{label = item_base_id, val = [{_, 0}]}
          | T],
         GAcc, LAcc) ->
    merge_gl(T, GAcc, LAcc);
merge_gl([#loss{label = item_base_id_auto_buy,
                val = [{_, 0}]}
          | T],
         GAcc, LAcc) ->
    merge_gl(T, GAcc, LAcc);
merge_gl([H = #gain{} | T], GAcc, LAcc) ->
    merge_gl(T, [H | GAcc], LAcc);
merge_gl([H = #loss{} | T], GAcc, LAcc) ->
    merge_gl(T, GAcc, [H | LAcc]);
merge_gl([_ | T], GAcc, LAcc) ->
    merge_gl(T, GAcc, LAcc).

-spec val_to_loss(list()) -> [#loss{}].

val_to_loss(ValList) -> val_to_loss(ValList, #{}, []).

val_to_loss(ValList, Opts) when is_map(Opts) ->
    val_to_loss(ValList, Opts, []);
val_to_loss(_ValList, Opts) ->
    logger:error("第二个参数应为Map类型[Opts:~w]",
                 [Opts],
                 format,
                 750),
    [].

val_to_loss([], _Opts, L) -> L;
val_to_loss([{90000, Val} | T], Opts, L) ->
    Loss = #loss{label = coin, val = Val,
                 msg = lang:get("银币不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90002, Val} | T], Opts, L) ->
    Loss = #loss{label = gold, val = Val,
                 msg = lang:get("钻石不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90003, Val} | T], Opts, L) ->
    Loss = #loss{label = gold_bind, val = Val,
                 msg = lang:get("金币不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90001, Val} | T], Opts, L) ->
    Loss = #loss{label = coin_bind, val = Val,
                 msg = lang:get("绑定银币不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90010, Val} | T], Opts, L) ->
    Loss = #loss{label = exp, val = Val,
                 msg = lang:get("经验值不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90011, Val} | T], Opts, L) ->
    Loss = #loss{label = guild, val = Val,
                 msg = lang:get("公会贡献不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90006, Val} | T], Opts, L) ->
    Loss = #loss{label = energy, val = Val,
                 msg = lang:get("活力值不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90014, Val} | T], Opts, L) ->
    Loss = #loss{label = satiety, val = Val,
                 msg = lang:get("饱食度不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90012, Val} | T], Opts, L) ->
    Loss = #loss{label = stars_score, val = Val,
                 msg = lang:get("星辰积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90042, Val} | T], Opts, L) ->
    Loss = #loss{label = lucky_ticket, val = Val,
                 msg = lang:get("幸运宝券不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90044, Val} | T], Opts, L) ->
    Loss = #loss{label = dollar, val = Val,
                 msg = lang:get("充值礼券不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90045, Val} | T], Opts, L) ->
    Loss = #loss{label = naughty, val = Val,
                 msg = lang:get("淘气值不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90046, Val} | T], Opts, L) ->
    Loss = #loss{label = concentric, val = Val,
                 msg = lang:get("同心值不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90047, Val} | T], Opts, L) ->
    Loss = #loss{label = qixiIntegral, val = Val,
                 msg = lang:get("七夕积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90048, Val} | T], Opts, L) ->
    Loss = #loss{label = sunshine, val = Val,
                 msg =
                     notice:format(lang:get("阳光值不足~ts点，可通过活动获取"),
                                   [{string_2, 5, "100"}])},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90049, Val} | T], Opts, L) ->
    Loss = #loss{label = cut_price, val = Val,
                 msg =
                     notice:format(lang:get("积分币不足~ts点，可通过活动获取"),
                                   [{string_2, 5, "100"}])},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90050, Val} | T], Opts, L) ->
    Loss = #loss{label = single_dog, val = Val,
                 msg =
                     notice:format(lang:get("光棍积分不足~ts点，可通过活动获取"),
                                   [{string_2, 5, Val}])},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90007, Val} | T], Opts, L) ->
    Loss = #loss{label = character, val = Val,
                 msg = lang:get("人品值不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90008, Val} | T], Opts, L) ->
    Loss = #loss{label = achieve_score, val = Val,
                 msg = lang:get("成就点数不足，无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90021, Val} | T], Opts, L) ->
    Loss = #loss{label = mount_spirit, val = Val},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90023, Val} | T], Opts, L) ->
    Loss = #loss{label = endless_challenge, val = Val,
                 msg = lang:get("挑战心得不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90025, Val} | T], Opts, L) ->
    Loss = #loss{label = autumn_score, val = Val,
                 msg = lang:get("中秋积分不足，无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90034, Val} | T], Opts, L) ->
    Loss = #loss{label = glue_pudding, val = Val,
                 msg = lang:get("元宵积分不足，无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90041, Val} | T], Opts, L) ->
    Loss = #loss{label = father, val = Val,
                 msg = lang:get("暖心礼券不足，无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90035, Val} | T], Opts, L) ->
    Loss = #loss{label = crystal, val = Val,
                 msg = lang:get("七彩水晶不足，无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90037, Val} | T], Opts, L) ->
    Loss = #loss{label = ticket, val = Val,
                 msg = lang:get("游乐卷不足，无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90017, Val} | T], Opts, L) ->
    Loss = #loss{label = alchemy, val = Val,
                 msg =
                     notice:format(lang:get("能量值不足, 请先~ts"),
                                   [{string_2, 5, lang:get("补充能量")}])},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90018, Val} | T], Opts, L) ->
    Loss = #loss{label = love, val = Val,
                 msg = lang:get("恩爱值不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90036, Val} | T], Opts, L) ->
    Loss = #loss{label = brother, val = Val,
                 msg = lang:get("兄弟币不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90019, Val} | T], Opts, L) ->
    Loss = #loss{label = teacher_score, val = Val,
                 msg = lang:get("师道值不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90020, Val} | T], Opts, L) ->
    Loss = #loss{label = tournament, val = Val,
                 msg = lang:get("武道值不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90024, Val} | T], Opts, L) ->
    Loss = #loss{label = handbook_point, val = Val,
                 msg = lang:get("图鉴积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90026, Val} | T], Opts, L) ->
    Loss = #loss{label = star_gold, val = Val,
                 msg = lang:get("星钻不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90027, Val} | T], Opts, L) ->
    Loss = #loss{label = halloween, val = Val,
                 msg = lang:get("南瓜币不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90028, Val} | T], Opts, L) ->
    Loss = #loss{label = thanksgiving, val = Val,
                 msg = lang:get("感恩积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90022, Val} | T], Opts, L) ->
    Loss = #loss{label = lottery_luck, val = Val,
                 msg = lang:get("幸运值不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90029, Val} | T], Opts, L) ->
    Loss = #loss{label = new_year, val = Val,
                 msg = lang:get("元旦积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90033, Val} | T], Opts, L) ->
    Loss = #loss{label = firecracker, val = Val,
                 msg = lang:get("新春鞭炮不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90038, Val} | T], Opts, L) ->
    Loss = #loss{label = egg, val = Val,
                 msg = lang:get("扭蛋积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90040, Val} | T], Opts, L) ->
    Loss = #loss{label = turn, val = Val,
                 msg = lang:get("充值好礼不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90039, Val} | T], Opts, L) ->
    Loss = #loss{label = exchange, val = Val,
                 msg = lang:get("周年兑换积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90051, Val} | T], Opts, L) ->
    Loss = #loss{label = panda_score, val = Val,
                 msg = lang:get("庆典积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90052, Val} | T], Opts, L) ->
    Loss = #loss{label = joyful_egg, val = Val,
                 msg = lang:get("彩蛋积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90056, Val} | T], Opts, L) ->
    Loss = #loss{label = godswar, val = Val,
                 msg = lang:get("诸神荣誉积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90055, Val} | T], Opts, L) ->
    Loss = #loss{label = skl_unique_exp, val = Val,
                 msg = lang:get("历练点不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90057, Val} | T], Opts, L) ->
    Loss = #loss{label = happy_score, val = Val,
                 msg = lang:get("喜庆积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90061, Val} | T], Opts, L) ->
    Loss = #loss{label = slot_machine, val = Val,
                 msg = lang:get("摇摇乐积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90062, Val} | T], Opts, L) ->
    Loss = #loss{label = reserve_gold, val = Val,
                 msg = lang:get("储备钻石不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90063, Val} | T], Opts, L) ->
    Loss = #loss{label = zillionaire_sc, val = Val,
                 msg = lang:get("储备钻石不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90066, Val} | T], Opts, L) ->
    Loss = #loss{label = score_exchange, val = Val,
                 msg = lang:get("活动积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90067, Val} | T], Opts, L) ->
    Loss = #loss{label = new_open_turn, val = Val,
                 msg = lang:get("活动积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90068, Val} | T], Opts, L) ->
    Loss = #loss{label = long_active, val = Val,
                 msg = lang:get("战令经验积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{90069, Val} | T], Opts, L) ->
    Loss = #loss{label = long_score, val = Val,
                 msg = lang:get("战令活动积分不足, 无法操作")},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{BaseId, Num} | T],
            Opts = #{item_base_id_auto_buy := 1,
                     auto_scene := AutoScene},
            L)
    when BaseId < 90000 ->
    Loss = #loss{label = item_base_id_auto_buy,
                 val = [{BaseId, Num}],
                 msg =
                     notice:format(lang:get("~ts不足, 无法操作"),
                                   [{item_2, BaseId}]),
                 auto_scene = AutoScene},
    val_to_loss(T, Opts, [Loss | L]);
val_to_loss([{BaseId, Num} | T], Opts, L)
    when BaseId < 90000 ->
    case item_data:get(BaseId) of
        #item_base{type = 156} ->
            Loss = #loss{label = flower_says, val = [{BaseId, Num}],
                         msg =
                             notice:format(lang:get("~ts不足, 无法操作"),
                                           [{item_2, BaseId}])};
        _ ->
            Loss = #loss{label = item_base_id,
                         val = [{BaseId, Num}],
                         msg =
                             notice:format(lang:get("~ts不足, 无法操作"),
                                           [{item_2, BaseId}])}
    end,
    val_to_loss(T, Opts, [Loss | L]).

-spec val_to_gain(list()) -> [#gain{}].

val_to_gain(ValList) -> val_to_gain(ValList, []).

val_to_gain([], Gains) -> Gains;
val_to_gain([{_Name, _Bind, 0} | T], Gains) ->
    val_to_gain(T, Gains);
val_to_gain([{_Name, 0} | T], Gains) ->
    val_to_gain(T, Gains);
val_to_gain([{Name, _Bind, Val} | T], Gains)
    when Name >= 90000 ->
    val_to_gain([{Name, Val} | T], Gains);
val_to_gain([{90000, Val} | T], Gains) ->
    G = #gain{label = coin, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90002, Val} | T], Gains) ->
    G = #gain{label = gold, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90003, Val} | T], Gains) ->
    G = #gain{label = gold_bind, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90001, Val} | T], Gains) ->
    G = #gain{label = coin_bind, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90004, Val} | T], Gains) ->
    G = #gain{label = intelligs, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90010, Val} | T], Gains) ->
    G = #gain{label = exp, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90005, Val} | T], Gains) ->
    G = #gain{label = pet_exp, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90011, Val} | T], Gains) ->
    G = #gain{label = guild, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90006, Val} | T], Gains) ->
    G = #gain{label = energy, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90013, Val} | T], Gains) ->
    G = #gain{label = prac_exp, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90014, Val} | T], Gains) ->
    G = #gain{label = satiety, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90017, Val} | T], Gains) ->
    G = #gain{label = alchemy, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90012, Val} | T], Gains) ->
    G = #gain{label = stars_score, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90042, Val} | T], Gains) ->
    G = #gain{label = lucky_ticket, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90044, Val} | T], Gains) ->
    G = #gain{label = dollar, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90045, Val} | T], Gains) ->
    G = #gain{label = naughty, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90046, Val} | T], Gains) ->
    G = #gain{label = concentric, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90047, Val} | T], Gains) ->
    G = #gain{label = qixiIntegral, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90048, Val} | T], Gains) ->
    G = #gain{label = sunshine, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90049, Val} | T], Gains) ->
    G = #gain{label = cut_price, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90050, Val} | T], Gains) ->
    G = #gain{label = single_dog, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90015, Val} | T], Gains) ->
    G = #gain{label = guild_assets, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90007, Val} | T], Gains) ->
    G = #gain{label = character, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90018, Val} | T], Gains) ->
    G = #gain{label = love, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90036, Val} | T], Gains) ->
    G = #gain{label = brother, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90038, Val} | T], Gains) ->
    G = #gain{label = egg, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90040, Val} | T], Gains) ->
    G = #gain{label = turn, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90039, Val} | T], Gains) ->
    G = #gain{label = exchange, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90019, Val} | T], Gains) ->
    G = #gain{label = teacher_score, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90020, Val} | T], Gains) ->
    G = #gain{label = tournament, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90024, Val} | T], Gains) ->
    G = #gain{label = handbook_point, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90026, Val} | T], Gains) ->
    G = #gain{label = star_gold, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90027, Val} | T], Gains) ->
    G = #gain{label = halloween, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90028, Val} | T], Gains) ->
    G = #gain{label = thanksgiving, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90034, Val} | T], Gains) ->
    G = #gain{label = glue_pudding, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90041, Val} | T], Gains) ->
    G = #gain{label = father, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90035, Val} | T], Gains) ->
    G = #gain{label = crystal, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90037, Val} | T], Gains) ->
    G = #gain{label = ticket, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90022, Val} | T], Gains) ->
    G = #gain{label = lottery_luck, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90029, Val} | T], Gains) ->
    G = #gain{label = new_year, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90033, Val} | T], Gains) ->
    G = #gain{label = firecracker, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90008, Val} | T], Gains) ->
    G = #gain{label = achieve_score, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90021, Val} | T], Gains) ->
    G = #gain{label = mount_spirit, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90023, Val} | T], Gains) ->
    G = #gain{label = endless_challenge, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90025, Val} | T], Gains) ->
    G = #gain{label = autumn_score, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90030, Val} | T], Gains) ->
    G = #gain{label = fertility, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90031, Val} | T], Gains) ->
    G = #gain{label = tonic, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90032, Val} | T], Gains) ->
    G = #gain{label = pregnancy, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90051, Val} | T], Gains) ->
    G = #gain{label = panda_score, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90052, Val} | T], Gains) ->
    G = #gain{label = joyful_egg, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90056, Val} | T], Gains) ->
    G = #gain{label = godswar, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90055, Val} | T], Gains) ->
    G = #gain{label = skl_unique_exp, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90057, Val} | T], Gains) ->
    G = #gain{label = happy_score, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90061, Val} | T], Gains) ->
    G = #gain{label = slot_machine, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90062, Val} | T], Gains) ->
    G = #gain{label = reserve_gold, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90063, Val} | T], Gains) ->
    G = #gain{label = zillionaire_sc, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90066, Val} | T], Gains) ->
    G = #gain{label = score_exchange, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90067, Val} | T], Gains) ->
    G = #gain{label = new_open_turn, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90068, Val} | T], Gains) ->
    G = #gain{label = long_active, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90069, Val} | T], Gains) ->
    G = #gain{label = long_score, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{90071, Val} | T], Gains) ->
    G = #gain{label = camp_pray_sc, val = Val},
    val_to_gain(T, [G | Gains]);
val_to_gain([{BaseId, Val} | T], Gains)
    when BaseId < 90000 ->
    val_to_gain([{BaseId, 1, Val} | T], Gains);
val_to_gain([{BaseId, Bind, Val} | T], Gains)
    when BaseId < 90000 ->
    NewBaseId = item_type:special_id(BaseId),
    case item_data:get(NewBaseId) of
        #item_base{type = Type} ->
            case lists:member(Type, [147, 148, 149, 150]) of
                true ->
                    G = #gain{label = talisman, val = [{NewBaseId, Val}]},
                    val_to_gain(T, [G | Gains]);
                _ ->
                    case Type of
                        156 ->
                            G = #gain{label = flower_says,
                                      val = [{NewBaseId, Val}]};
                        _ ->
                            G = #gain{label = item_base_id,
                                      val = [{NewBaseId, Bind, Val}]}
                    end,
                    val_to_gain(T, [G | Gains])
            end;
        _ ->
            logger:error("不存在的道具,不予发放[~w]", [BaseId], format, 1143),
            val_to_gain(T, Gains)
    end;
val_to_gain([_V | T], Gains) ->
    logger:error("错误的数值,无法解析[~w] from:~w",
                 [_V, util:get_stacktrace()],
                 format,
                 1147),
    val_to_gain(T, Gains).

gain_to_val([]) -> [];
gain_to_val(GainList = [#gain{} | _]) ->
    gain_to_val(GainList, []);
gain_to_val(#gain{label = coin, val = Val}) ->
    {90000, Val};
gain_to_val(#gain{label = gold, val = Val}) ->
    {90002, Val};
gain_to_val(#gain{label = gold_bind, val = Val}) ->
    {90003, Val};
gain_to_val(#gain{label = exp, val = Val}) ->
    {90010, Val};
gain_to_val(#gain{label = pet_exp, val = Val}) ->
    {90005, Val};
gain_to_val(#gain{label = prac_exp, val = Val}) ->
    {90013, Val};
gain_to_val(#gain{label = satiety, val = Val}) ->
    {90014, Val};
gain_to_val(#gain{label = stars_score, val = Val}) ->
    {90012, Val};
gain_to_val(#gain{label = lucky_ticket, val = Val}) ->
    {90042, Val};
gain_to_val(#gain{label = dollar, val = Val}) ->
    {90044, Val};
gain_to_val(#gain{label = naughty, val = Val}) ->
    {90045, Val};
gain_to_val(#gain{label = concentric, val = Val}) ->
    {90046, Val};
gain_to_val(#gain{label = qixiIntegral, val = Val}) ->
    {90047, Val};
gain_to_val(#gain{label = sunshine, val = Val}) ->
    {90048, Val};
gain_to_val(#gain{label = cut_price, val = Val}) ->
    {90049, Val};
gain_to_val(#gain{label = single_dog, val = Val}) ->
    {90050, Val};
gain_to_val(#gain{label = character, val = Val}) ->
    {90007, Val};
gain_to_val(#gain{label = guild, val = Val}) ->
    {90011, Val};
gain_to_val(#gain{label = energy, val = Val}) ->
    {90006, Val};
gain_to_val(#gain{label = guild_assets, val = Val}) ->
    {90015, Val};
gain_to_val(#gain{label = love, val = Val}) ->
    {90018, Val};
gain_to_val(#gain{label = brother, val = Val}) ->
    {90036, Val};
gain_to_val(#gain{label = egg, val = Val}) ->
    {90038, Val};
gain_to_val(#gain{label = turn, val = Val}) ->
    {90040, Val};
gain_to_val(#gain{label = exchange, val = Val}) ->
    {90039, Val};
gain_to_val(#gain{label = teacher_score, val = Val}) ->
    {90019, Val};
gain_to_val(#gain{label = tournament, val = Val}) ->
    {90020, Val};
gain_to_val(#gain{label = handbook_point, val = Val}) ->
    {90024, Val};
gain_to_val(#gain{label = star_gold, val = Val}) ->
    {90026, Val};
gain_to_val(#gain{label = halloween, val = Val}) ->
    {90027, Val};
gain_to_val(#gain{label = thanksgiving, val = Val}) ->
    {90028, Val};
gain_to_val(#gain{label = glue_pudding, val = Val}) ->
    {90034, Val};
gain_to_val(#gain{label = father, val = Val}) ->
    {90041, Val};
gain_to_val(#gain{label = lottery_luck, val = Val}) ->
    {90022, Val};
gain_to_val(#gain{label = new_year, val = Val}) ->
    {90029, Val};
gain_to_val(#gain{label = firecracker, val = Val}) ->
    {90033, Val};
gain_to_val(#gain{label = achieve_score, val = Val}) ->
    {90008, Val};
gain_to_val(#gain{label = mount_spirit, val = Val}) ->
    {90021, Val};
gain_to_val(#gain{label = endless_challenge,
                  val = Val}) ->
    {90023, Val};
gain_to_val(#gain{label = autumn_score, val = Val}) ->
    {90025, Val};
gain_to_val(#gain{label = fertility, val = Val}) ->
    {90030, Val};
gain_to_val(#gain{label = tonic, val = Val}) ->
    {90031, Val};
gain_to_val(#gain{label = pregnancy, val = Val}) ->
    {90032, Val};
gain_to_val(#gain{label = crystal, val = Val}) ->
    {90035, Val};
gain_to_val(#gain{label = ticket, val = Val}) ->
    {90037, Val};
gain_to_val(#gain{label = star_gold_or_gold,
                  val = Val}) ->
    {29255, Val};
gain_to_val(#gain{label = panda_score, val = Val}) ->
    {90051, Val};
gain_to_val(#gain{label = joyful_egg, val = Val}) ->
    {90052, Val};
gain_to_val(#gain{label = godswar, val = Val}) ->
    {90056, Val};
gain_to_val(#gain{label = happy_score, val = Val}) ->
    {90057, Val};
gain_to_val(#gain{label = slot_machine, val = Val}) ->
    {90061, Val};
gain_to_val(#gain{label = reserve_gold, val = Val}) ->
    {90062, Val};
gain_to_val(#gain{label = zillionaire_sc, val = Val}) ->
    {90063, Val};
gain_to_val(#gain{label = score_exchange, val = Val}) ->
    {90066, Val};
gain_to_val(#gain{label = new_open_turn, val = Val}) ->
    {90067, Val};
gain_to_val(#gain{label = long_active, val = Val}) ->
    {90068, Val};
gain_to_val(#gain{label = long_score, val = Val}) ->
    {90069, Val};
gain_to_val(#gain{label = camp_pray_sc, val = Val}) ->
    {90071, Val};
gain_to_val(#gain{label = talisman,
                  val = [{BaseId, Val}]}) ->
    {BaseId, Val};
gain_to_val(#gain{label = item_base_id,
                  val = [{BaseId, _, Val}]}) ->
    {BaseId, Val};
gain_to_val(#gain{label = item_base_id,
                  val = [{BaseId, Val}]}) ->
    {BaseId, Val};
gain_to_val(#gain{label = items}) -> false;
gain_to_val(_V) ->
    logger:error("错误的奖励结构,无法解析[~w]: 调用栈：[~w]",
                 [_V, util:get_stacktrace()],
                 format,
                 1282),
    false.

gain_to_val([], Acc) -> Acc;
gain_to_val([Gain | Rest], Acc) ->
    case gain_to_val(Gain) of
        false -> gain_to_val(Rest, Acc);
        New = {_, _} -> gain_to_val(Rest, [New | Acc])
    end.

gain_to_unbind_val(GainList) ->
    R = gain_to_val(GainList),
    [{BaseId, 0, Num} || {BaseId, Num} <- R].

loss_to_auto_buy(List) -> loss_to_auto_buy(List, []).

loss_to_auto_buy([], Acc) -> {ok, Acc};
loss_to_auto_buy([H = #loss{label = item_base_id}
                  | Rest],
                 Acc) ->
    loss_to_auto_buy(Rest,
                     [H#loss{label = item_base_id_auto_buy} | Acc]);
loss_to_auto_buy([H | Rest], Acc) ->
    loss_to_auto_buy(Rest, [H | Acc]).

gain_text_find_item_id([], _PBag, Items) -> Items;
gain_text_find_item_id([{ItemId, Num} | Rest], PBag,
                       Items) ->
    case package:find(by_id, ItemId, PBag) of
        {ok, Item = #item{}} ->
            gain_text_find_item_id(Rest,
                                   PBag,
                                   [Item#item{quantity = Num} | Items]);
        _False -> gain_text_find_item_id(Rest, PBag, Items)
    end.

classes_sex_item([], _Classes, _Sex, Items) -> Items;
classes_sex_item([{0, 2, BaseId, Bind, Num} | Rest],
                 Classes, Sex, Items) ->
    classes_sex_item(Rest,
                     Classes,
                     Sex,
                     [{BaseId, Bind, Num} | Items]);
classes_sex_item([{0, Sex, BaseId, Bind, Num} | Rest],
                 Classes, Sex, Items) ->
    classes_sex_item(Rest,
                     Classes,
                     Sex,
                     [{BaseId, Bind, Num} | Items]);
classes_sex_item([{Classes, 2, BaseId, Bind, Num}
                  | Rest],
                 Classes, Sex, Items) ->
    classes_sex_item(Rest,
                     Classes,
                     Sex,
                     [{BaseId, Bind, Num} | Items]);
classes_sex_item([{Classes, Sex, BaseId, Bind, Num}
                  | Rest],
                 Classes, Sex, Items) ->
    classes_sex_item(Rest,
                     Classes,
                     Sex,
                     [{BaseId, Bind, Num} | Items]);
classes_sex_item([_H | Rest], Classes, Sex, Items) ->
    classes_sex_item(Rest, Classes, Sex, Items).

