-file("src/mod/chat/chat_mgr.erl", 1).

-module(chat_mgr).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         add_item_cache/3,
         get_item_cache/3,
         do_get_item_cache/3,
         add_pet_cache/3,
         get_pet_cache/3,
         do_get_pet_cache/3,
         add_child_cache/3,
         get_child_cache/3,
         do_get_child_cache/3,
         do_get_wing_cache/3,
         do_get_mount_cache/3,
         add_guard_cache/3,
         get_guard_cache/3,
         do_get_guard_cache/3,
         add_voice_cache/6,
         get_voice_cache/3,
         do_get_voice_cache/3,
         get_voice_id/1,
         add_sns_voice_cache/6,
         send_offline/3,
         do_send_offline/3,
         get_offline/1,
         add_wing_cache/3,
         get_wing_cache/3,
         add_mount_cache/3,
         get_mount_cache/3,
         add_talisman_cache/3,
         get_talisman_cache/3,
         check_silence/3,
         add_silence_cache/3,
         get_silence_cache/2,
         clear_silence_cache/1,
         do_get_talisman_cache/3,
         gm_clear/1]).

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

-file("src/mod/chat/chat_mgr.erl", 53).

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

-file("src/mod/chat/chat_mgr.erl", 54).

-file("inc/chat.hrl", 1).

-record(chat_msg,
        {rid = {0, "", 0} :: non_neg_integer(),
         platform = "" :: binary(),
         zone_id = 0 :: non_neg_integer(),
         channel = 0 :: non_neg_integer(),
         name = "" :: binary(),
         sex = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         msg = "" :: binary(),
         guild_name = "",
         special = [] :: [tuple()]}).

-record(chat_voice,
        {role_id,
         voice = <<>>,
         text = "",
         time = 0,
         channel,
         group_id}).

-record(chat_offline, {id = {0, "", 0}, msgs = []}).

-file("src/mod/chat/chat_mgr.erl", 55).

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

-file("src/mod/chat/chat_mgr.erl", 56).

-file("inc/wing.hrl", 1).

-record(m_wing,
        {ver = 11 :: pos_integer(),
         grade = 0 :: non_neg_integer(),
         growth = 0,
         enhance_num = 0,
         wing_id = 0,
         plot_wing_id = 0,
         expiry = [],
         tmp_grade = 0 :: non_neg_integer(),
         tmp_growth = 0,
         tmp_wing_id = 0,
         star_lev = 1 :: non_neg_integer(),
         valid_plan = 1,
         plan_data = [] :: list(),
         change_times = 0,
         reset_times = 0,
         lev_break_skill = [],
         wing_ids = [],
         exp = 0,
         old_grade = 0,
         old_star = 0,
         appearance_list = [],
         speed = 1,
         wing_group_list = [],
         wing_power = 100}).

-record(wing_skill_plan,
        {index = 1,
         plan_name = [] :: list(),
         skills = [],
         tmp_skills = []}).

-record(wing_lev_break_skill,
        {ver = 1,
         skill_grade = 0,
         skill_id = 0,
         skill_lev = 0,
         skill_val = 0}).

-record(wing_skill,
        {ver = 1, key = {0, 0}, id = 0, lev = 0, is_lock = 0}).

-record(wing_lock_data,
        {grade = 0, max = 0, item_list = []}).

-record(wing_appearance,
        {id = 0,
         time = 0,
         timeout = 0,
         grade = 0,
         star_lev = 0}).

-record(wing_base_group,
        {group_id = 0,
         need_grade = 0,
         wing_ids = [],
         grades = [],
         loss_item = []}).

-record(wing_group,
        {ver = 1,
         group_id = 0,
         wing_ids = [],
         wing_times = 0,
         rewarded = 0}).

-file("src/mod/chat/chat_mgr.erl", 57).

-file("inc/friend.hrl", 1).

-record(friendship,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         type = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_role,
        {id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         ver = 6,
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         signature = "" :: string(),
         city = "" :: string(),
         online = 0 :: 0 | 1,
         online_time = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         guild = "" :: string(),
         qualifying,
         arena,
         pet,
         guard,
         skill_prac = 0,
         achievement = 0,
         received_num = 0,
         given_num = 0,
         update_time = 0,
         looks = [] :: list(),
         offline_push = 0,
         glory_max_id = 0,
         glory_time = 0}).

-record(friend_request,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_present,
        {ver = 0,
         giver = {0, "", 0},
         recipient = {0, "", 0},
         time = 0 :: integer(),
         num = 0 :: integer()}).

-record(m_friend,
        {ver = 2,
         signature = "星辰奇缘真好玩！" :: string(),
         num = 0 :: non_neg_integer(),
         fans = 0 :: non_neg_integer(),
         log_next_id = 1 :: pos_integer(),
         flower = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         city = "" :: string(),
         set_num = 0 :: non_neg_integer(),
         cond_city = 1 :: 0..1,
         cond_sex = 1 :: 0..1,
         cond_fc = 1 :: 0..1,
         received_presents = [] :: [],
         given_presents = [] :: [],
         received_num = 0 :: non_neg_integer(),
         given_num = 0 :: non_neg_integer(),
         popularity_rewarded = [] :: list(),
         offline_push = 0}).

-record(friend_zone,
        {ver = 14 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         photo = [] :: non_neg_integer(),
         birth = "" :: non_neg_integer(),
         constellation = 0 :: non_neg_integer(),
         abo = 0 :: non_neg_integer(),
         signature = "" :: string(),
         spouse_id = {0, "", 0} :: tuple(),
         spouse_name = "" :: string(),
         region = "" :: string(),
         online_time = 0 :: non_neg_integer(),
         guild = "" :: string(),
         subscribed = [],
         fans = [],
         visitors = [],
         visited = 0 :: non_neg_integer(),
         tags = [],
         liked = 0 :: non_neg_integer(),
         likes = [],
         privacy = 0 :: 0 | 1,
         prize_num = 0 :: non_neg_integer(),
         own_trends = [] :: [non_neg_integer()],
         subscribed_trends = [] :: [non_neg_integer()],
         photo_auditing = 0 :: non_neg_integer(),
         photo_audited = 0 :: non_neg_integer(),
         present_num = 0 :: non_neg_integer(),
         name_used = "" :: string(),
         week_liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         theme = 401 :: non_neg_integer(),
         badges = [] :: list(),
         photo_frame = 0 :: non_neg_integer(),
         teacher_name = "" :: string(),
         own_trend_num = 0,
         city = "" :: string(),
         is_shared_region = 1 :: 0 | 1,
         sworn_name = "" :: string(),
         show_honor = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer(),
         privacy_zone = 0 :: 0 | 1,
         privacy_moments = 0 :: 0 | 1}).

-record(friend_trend,
        {ver = 0 :: non_neg_integer(),
         zone_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         photo = 1 :: pos_integer(),
         id = 0 :: non_neg_integer(),
         type = 0 :: 0 | 1,
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         presents = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_visitor,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(friend_subscription,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         cared = 0 :: non_neg_integer(),
         interacted = 0 :: non_neg_integer()}).

-record(friend_zone_rank,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_zone_rank_week,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_like,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         got_prize = 0 :: 0 | 1,
         time = 0 :: non_neg_integer()}).

-record(friend_zone_photo,
        {id = 1,
         ver = 0,
         uploaded = 0,
         auditing = 0,
         audited = 0,
         default = 0}).

-record(friend_circle,
        {ver = 3 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list(),
         subscriptions = [] :: list(),
         block = [] :: list(),
         unsubscribed = [] :: list(),
         notifications = [] :: list(),
         is_shared_region = 1 :: 0 | 1,
         unread_num = 0 :: non_neg_integer(),
         privacy_moments = 0 :: 0 | 1}).

-record(friend_moment,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         mentions = [],
         ctime = 0 :: non_neg_integer(),
         type = 1}).

-record(friend_comment,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0},
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         msg = "" :: string(),
         mentions = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_like,
        {ver = 0 :: non_neg_integer(),
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_photo,
        {id = 1,
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         ver = 0,
         uploaded = 0,
         auditing = 1,
         audited = 0}).

-record(friend_circle_report,
        {id = {{0, "", 0}, 0, 0},
         rid = {0, "", 0},
         moment_id = {0, "", 0},
         spec_id = 0,
         type = 0,
         name = "",
         lev = 1,
         time = 0,
         content = "",
         reporter_id = {0, "", 0},
         reporter_name = "",
         reporter_lev = 0}).

-record(friend_circle_region,
        {ver = 0 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list()}).

-record(friend_recall,
        {role_id = {0, "", 0},
         role_name = "",
         id = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         role_id_bind = {0, "", 0},
         role_name_bind = "",
         lists = [] :: list(),
         rewards = [] :: list(),
         lists_time = [] :: list(),
         time_return = 0 :: non_neg_integer()}).

-record(friend_recalled,
        {role_id = {0, "", 0},
         status = 0 :: non_neg_integer(),
         bind = 0 :: non_neg_integer(),
         time_return = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         rewards = [] :: list(),
         lists = [] :: list(),
         recall_list = [] :: list(),
         role_id_recall = {0, "", 0},
         role_name_recall = "" :: string(),
         login = 0 :: non_neg_integer(),
         activity_id = 0 :: non_neg_integer()}).

-record(friend_group,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         owner_lev = 1,
         owner_fc = 0,
         owner_face = 1,
         time = 0,
         members = [],
         trends = [],
         historys = [],
         invites = []}).

-record(friend_group_role,
        {ver = 1,
         id = {0, "", 0},
         groups = [],
         inviteds = [],
         create = 0,
         join = 0,
         unlock = 0,
         applys = []}).

-record(friend_group_trend,
        {type = 0, string1 = "", string2 = "", time = 0}).

-record(friend_group_chat,
        {role_id = 0, msgs = "", time = 0}).

-record(friend_group_data,
        {group_id = {0, "", 0},
         group_name = "",
         group_content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         time = 0}).

-record(friend_group_role_data,
        {role_id = {0, "", 0},
         role_name = "",
         role_classes = 0,
         role_lev = 0,
         role_sex = 0,
         online = 0,
         online_time = 0,
         post = 0,
         notice = 1,
         pid = undefined}).

-record(friend_moment_wish_audit,
        {ver = 1,
         moment_id = {0, "", 0},
         role_id = {0, "", 0},
         audit_time = 0,
         reward_title = 0,
         camp_id = 0}).

-file("src/mod/chat/chat_mgr.erl", 58).

-record(state,
        {item_cache_next_id = 1 :: pos_integer(),
         pet_cache_next_id = 1 :: pos_integer(),
         voice_cache_next_id = 1,
         guard_cache_next_id = 1 :: pos_integer(),
         wing_cache_next_id = 1,
         mount_cache_next_id = 1,
         child_cache_next_id = 1 :: pos_integer(),
         talisman_cache_next_id = 1,
         voice_queue = queue:new(),
         offline_notices = [],
         offline_ref :: undefined | reference()}).

add_item_cache(Platform, ZoneId, Item) ->
    case case catch gen_server:call(chat_mgr,
                                    item_cache_fetch_id,
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {error, Err} ->
            logger:error("查询物品信息缓存ID失败: ~w", [Err], chat_mgr, 118),
            {error, item_cache_failure};
        Id ->
            ets:insert(chat_item_cache,
                       {{Platform, ZoneId, Id}, Item}),
            {ok, {Platform, ZoneId, Id}}
    end.

get_item_cache(Platform, ZoneId, Id) ->
    case big_world:is_connect() of
        {true, _} ->
            case big_world:call(Platform,
                                ZoneId,
                                chat_mgr,
                                do_get_item_cache,
                                [Platform, ZoneId, Id])
                of
                {ok, Item} -> {ok, Item};
                _ -> {error, call_error}
            end;
        false ->
            case cross:call(Platform,
                            ZoneId,
                            chat_mgr,
                            do_get_item_cache,
                            [Platform, ZoneId, Id])
                of
                {ok, Item} -> {ok, Item};
                _ -> {error, call_error}
            end
    end.

add_pet_cache(Platform, ZoneId, Pet) ->
    case case catch gen_server:call(chat_mgr,
                                    pet_cache_fetch_id,
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {error, Err} ->
            logger:error("查询宠物信息缓存ID失败: ~w", [Err], chat_mgr, 144),
            {error, pet_cache_failure};
        Id ->
            ets:insert(chat_pet_cache,
                       {{Platform, ZoneId, Id}, Pet}),
            {ok, {Platform, ZoneId, Id}}
    end.

get_pet_cache(Platform, ZoneId, Id) ->
    case big_world:is_connect() of
        {true, _} ->
            case big_world:call(Platform,
                                ZoneId,
                                chat_mgr,
                                do_get_pet_cache,
                                [Platform, ZoneId, Id])
                of
                {ok, Pet} -> {ok, Pet};
                _ -> {error, call_error}
            end;
        false ->
            case cross:call(Platform,
                            ZoneId,
                            chat_mgr,
                            do_get_pet_cache,
                            [Platform, ZoneId, Id])
                of
                {ok, Pet} -> {ok, Pet};
                _ -> {error, call_error}
            end
    end.

add_child_cache(Platform, ZoneId, Child) ->
    case case catch gen_server:call(chat_mgr,
                                    child_cache_fetch_id,
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {error, Err} ->
            logger:error("查询宠物信息缓存ID失败: ~w", [Err], chat_mgr, 170),
            {error, child_cache_failure};
        Id ->
            ets:insert(chat_child_cache,
                       {{Platform, ZoneId, Id}, Child}),
            {ok, {Platform, ZoneId, Id}}
    end.

get_child_cache(Platform, ZoneId, Id) ->
    case big_world:is_connect() of
        {true, _} ->
            case big_world:call(Platform,
                                ZoneId,
                                chat_mgr,
                                do_get_child_cache,
                                [Platform, ZoneId, Id])
                of
                {ok, Pet} -> {ok, Pet};
                _ -> {error, call_error}
            end;
        false ->
            case cross:call(Platform,
                            ZoneId,
                            chat_mgr,
                            do_get_child_cache,
                            [Platform, ZoneId, Id])
                of
                {ok, Pet} -> {ok, Pet};
                _ -> {error, call_error}
            end
    end.

do_get_child_cache(Platform, ZoneId, Id) ->
    case catch ets:lookup(chat_child_cache,
                          {Platform, ZoneId, Id})
        of
        [{_, Child}] -> {ok, Child};
        [] -> {error, node_not_exists};
        {'EXIT', {badarg, _}} -> {error, chat_not_running};
        Err -> {error, Err}
    end.

add_wing_cache(Platform, ZoneId, Pet) ->
    case case catch gen_server:call(chat_mgr,
                                    wing_cache_fetch_id,
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {error, Err} ->
            logger:error("查询宠物信息缓存ID失败: ~w", [Err], chat_mgr, 205),
            {error, wing_cache_failure};
        Id ->
            ets:insert(chat_wing_cache,
                       {{Platform, ZoneId, Id}, Pet}),
            {ok, {Platform, ZoneId, Id}}
    end.

get_wing_cache(Platform, ZoneId, Id) ->
    case big_world:is_connect() of
        {true, _} ->
            case big_world:call(Platform,
                                ZoneId,
                                chat_mgr,
                                do_get_wing_cache,
                                [Platform, ZoneId, Id])
                of
                {ok, Wing} -> {ok, Wing};
                _ -> {error, call_error}
            end;
        false ->
            case cross:call(Platform,
                            ZoneId,
                            chat_mgr,
                            do_get_wing_cache,
                            [Platform, ZoneId, Id])
                of
                {ok, Wing} -> {ok, Wing};
                _ -> {error, call_error}
            end
    end.

add_mount_cache(Platform, ZoneId, MountInfo) ->
    case case catch gen_server:call(chat_mgr,
                                    mount_cache_fetch_id,
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {error, Err} ->
            logger:error("生成坐骑分享序列失败: ~w", [Err], chat_mgr, 230),
            {error, mount_cache_failure};
        Id ->
            ets:insert(chat_mount_cache,
                       {{Platform, ZoneId, Id}, MountInfo}),
            {ok, {Platform, ZoneId, Id}}
    end.

get_mount_cache(Platform, ZoneId, Id) ->
    case big_world:is_connect() of
        {true, _} ->
            case big_world:call(Platform,
                                ZoneId,
                                chat_mgr,
                                do_get_mount_cache,
                                [Platform, ZoneId, Id])
                of
                {ok, Mount} -> {ok, Mount};
                _ -> {error, call_error}
            end;
        false ->
            case cross:call(Platform,
                            ZoneId,
                            chat_mgr,
                            do_get_mount_cache,
                            [Platform, ZoneId, Id])
                of
                {ok, Mount} -> {ok, Mount};
                _ -> {error, call_error}
            end
    end.

add_talisman_cache(Platform, ZoneId, Talisman) ->
    case case catch gen_server:call(chat_mgr,
                                    talisman_cache_fetch_id,
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {error, Err} ->
            logger:error("生成法宝分享序列失败: ~w", [Err], chat_mgr, 255),
            {error, talisman_cache_failure};
        Id ->
            ets:insert(chat_talisman_cache,
                       {{Platform, ZoneId, Id}, Talisman}),
            {ok, {Platform, ZoneId, Id}}
    end.

get_talisman_cache(Platform, ZoneId, Id) ->
    case big_world:is_connect() of
        {true, _} ->
            case big_world:call(Platform,
                                ZoneId,
                                chat_mgr,
                                do_get_talisman_cache,
                                [Platform, ZoneId, Id])
                of
                {ok, Talisman} -> {ok, Talisman};
                _ -> {error, call_error}
            end;
        false ->
            case cross:call(Platform,
                            ZoneId,
                            chat_mgr,
                            do_get_talisman_cache,
                            [Platform, ZoneId, Id])
                of
                {ok, Talisman} -> {ok, Talisman};
                _ -> {error, call_error}
            end
    end.

add_guard_cache(Platform, ZoneId, Guard) ->
    case case catch gen_server:call(chat_mgr,
                                    guard_cache_fetch_id,
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {error, Err} ->
            logger:error("查询守护信息缓存ID失败: ~w", [Err], chat_mgr, 281),
            {error, guard_cache_failure};
        Id ->
            ets:insert(chat_guard_cache,
                       {{Platform, ZoneId, Id}, Guard}),
            {ok, {Platform, ZoneId, Id}}
    end.

get_guard_cache(Platform, ZoneId, Id) ->
    case big_world:is_connect() of
        {true, _} ->
            case big_world:call(Platform,
                                ZoneId,
                                chat_mgr,
                                do_get_guard_cache,
                                [Platform, ZoneId, Id])
                of
                {ok, Guard} -> {ok, Guard};
                _ -> {error, call_error}
            end;
        false ->
            case cross:call(Platform,
                            ZoneId,
                            chat_mgr,
                            do_get_guard_cache,
                            [Platform, ZoneId, Id])
                of
                {ok, Guard} -> {ok, Guard};
                _ -> {error, call_error}
            end
    end.

add_voice_cache(Channel, Voice, VoiceTime, VoiceText,
                CacheId, Role = #role{id = RoleId = {_, Plat, Zone}}) ->
    Result = case CacheId of
                 0 ->
                     case case catch gen_server:call(chat_mgr,
                                                     voice_cache_fetch_id,
                                                     10000)
                              of
                              {'EXIT', {timeout, _}} -> {error, timeout};
                              {'EXIT', {noproc, _}} -> {error, noproc};
                              {'EXIT', {normal, _}} -> {error, exit};
                              {'EXIT', _Call_Err} -> {error, _Call_Err};
                              _Call_Return -> _Call_Return
                          end
                         of
                         Id when is_integer(Id) -> {true, Id};
                         _ -> {error, voice_cache_failure}
                     end;
                 Id -> {true, Id}
             end,
    NewVoiceText = case
                       util:word_is_sensitive_kernel(VoiceText)
                       of
                       false -> VoiceText;
                       _ -> lang:get("       ")
                   end,
    case Result of
        {true, NewCacheId} ->
            VoiceMsg = chat:voice_msg(Channel,
                                      NewCacheId,
                                      VoiceTime,
                                      NewVoiceText,
                                      Role),
            case chat:send_chat_voice(Channel, VoiceMsg, Role) of
                {true, _ChannelPid} ->
                    {Channel1, GroupId1} = case Channel of
                                               {9, GroupId} -> {9, GroupId};
                                               Channel -> {Channel, {0, "", 0}}
                                           end,
                    ChatVoice = #chat_voice{role_id = RoleId, voice = Voice,
                                            time = VoiceTime,
                                            channel = Channel1,
                                            group_id = GroupId1,
                                            text = NewVoiceText},
                    ets:insert(chat_voice_cache,
                               {{Plat, Zone, NewCacheId}, ChatVoice}),
                    true;
                false -> {error, voice_cast_failure}
            end;
        _Err ->
            logger:error("查询语音缓存ID失败: ~w", [_Err], chat_mgr, 338),
            {error, voice_cache_failure}
    end.

add_sns_voice_cache(TargetInfo, Voice, VoiceTime,
                    VoiceText, CacheId,
                    Role = #role{id = RoleId = {_, Plat, Zone}}) ->
    Result = case CacheId of
                 0 ->
                     case case catch gen_server:call(chat_mgr,
                                                     voice_cache_fetch_id,
                                                     10000)
                              of
                              {'EXIT', {timeout, _}} -> {error, timeout};
                              {'EXIT', {noproc, _}} -> {error, noproc};
                              {'EXIT', {normal, _}} -> {error, exit};
                              {'EXIT', _Call_Err} -> {error, _Call_Err};
                              _Call_Return -> _Call_Return
                          end
                         of
                         Id when is_integer(Id) -> {true, Id};
                         _ -> {error, voice_cache_failure}
                     end;
                 Id -> {true, Id}
             end,
    case Result of
        {true, NewCacheId} ->
            VoiceMsg = chat:sns_voice_msg(Role,
                                          NewCacheId,
                                          VoiceTime,
                                          VoiceText),
            ChatVoice = #chat_voice{role_id = RoleId, voice = Voice,
                                    time = VoiceTime, text = VoiceText},
            ets:insert(chat_voice_cache,
                       {{Plat, Zone, NewCacheId}, ChatVoice}),
            case is_pid(TargetInfo) of
                true -> sys_conn:pack_send(TargetInfo, 10411, VoiceMsg);
                _ ->
                    case send_offline(TargetInfo, 10411, VoiceMsg) of
                        {false, Why} -> notice:return(Why);
                        _ -> ok
                    end
            end;
        _Err ->
            logger:error("查询语音缓存id失败:~w", [_Err], chat_mgr, 371),
            {error, voice_cache_failure}
    end.

get_voice_id(#role{id = {_, P, Z}}) ->
    case case catch gen_server:call(chat_mgr,
                                    voice_cache_fetch_id,
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        Id when is_integer(Id) -> {true, P, Z, Id};
        _ -> {error, voice_cache_failure}
    end.

get_voice_cache(Platform, ZoneId, Id) ->
    case big_world:is_connect() of
        {true, _} ->
            case big_world:call(Platform,
                                ZoneId,
                                chat_mgr,
                                do_get_voice_cache,
                                [Platform, ZoneId, Id])
                of
                {ok, Voice} -> {ok, Voice};
                _ -> {error, call_error}
            end;
        false ->
            case cross:call(Platform,
                            ZoneId,
                            chat_mgr,
                            do_get_voice_cache,
                            [Platform, ZoneId, Id])
                of
                {ok, Voice} -> {ok, Voice};
                _ -> {error, call_error}
            end
    end.

check_silence(Lev, Charge, Type) ->
    Flag = case silent_data:get_open_cfg(env:get(platform))
               of
               {ZoneList, OpenDay} ->
                   case date:open_srv_day() =< OpenDay of
                       true when ZoneList =:= [] -> true;
                       true -> lists:member(env:get(zone_id), ZoneList);
                       _ -> false
                   end;
               _ -> false
           end,
    case silent_data:get_check_term(Type) of
        {SCharge, SLev}
            when (SCharge >= Charge) and (SLev >= Lev) and
                     (Flag == true) ->
            true;
        _ -> false
    end.

add_silence_cache(RoleId, Type, Msg) ->
    Now = date:seconds_of_the_day(),
    Msg1 = re:replace(Msg,
                      "{face_1,\\d}",
                      "",
                      [global, unicode, {return, list}]),
    NMsg = re:replace(Msg1,
                      "{prefix_1,.*}",
                      "",
                      [global, unicode, {return, list}]),
    case catch ets:lookup(chat_silence_cache,
                          {RoleId, Type})
        of
        [{_, ChatMsg}] ->
            logger:debug("~ts:~ts", [Msg, NMsg], chat_mgr, 426),
            ets:insert(chat_silence_cache,
                       {{RoleId, Type},
                        [{Now, unicode:characters_to_binary(NMsg)} | ChatMsg]});
        [] ->
            logger:debug("~ts:~ts", [Msg, NMsg], chat_mgr, 429),
            ets:insert(chat_silence_cache,
                       {{RoleId, Type},
                        [{Now, unicode:characters_to_binary(NMsg)}]});
        _ -> ok
    end.

clear_silence_cache(RoleId) ->
    [ets:delete(chat_silence_cache, {RoleId, Type})
     || Type <- silent_data:get_all_type()],
    ok.

get_silence_cache(RoleId, Type) ->
    case silent_data:get_silent_cfg(Type) of
        {SayNum, SayLength, SaySimil, SayTime} ->
            Now = date:seconds_of_the_day(),
            case catch ets:lookup(chat_silence_cache,
                                  {RoleId, Type})
                of
                [{_, ChatMsg}] ->
                    L = [unicode:characters_to_list(Msg)
                         || {_Time, Msg} <- ChatMsg, size(Msg) >= SayLength],
                    ets:delete(chat_silence_cache, {RoleId, Type}),
                    case length(L) of
                        Num when Num >= SayNum ->
                            NL = util:rand_list_n(L, SayNum),
                            case do_compare(NL, [], SaySimil) of
                                true ->
                                    logger:info("角色ID:~w时间：~w触发自动禁言",
                                                [RoleId, Now],
                                                chat_mgr,
                                                455),
                                    {true, SayTime * 60};
                                _ ->
                                    logger:debug("=============",
                                                 [],
                                                 chat_mgr,
                                                 458),
                                    ok
                            end;
                        _ -> ok
                    end;
                [] -> ok;
                _ ->
                    logger:error("自动禁言系统没有正常开启", [], chat_mgr, 466),
                    ok
            end;
        _ -> ok
    end.

do_compare([], _, _) -> true;
do_compare([H], TempH, SaySimil)
    when is_integer(SaySimil) ->
    case do_compare(H, TempH) of
        Simil when Simil >= SaySimil -> true;
        _S ->
            logger:debug("~w", [_S], chat_mgr, 479),
            false
    end;
do_compare([H1, H2 | T], _TempH, SaySimil)
    when is_integer(SaySimil) ->
    case do_compare(H1, H2) of
        Simil when Simil >= SaySimil ->
            do_compare(T, H1, SaySimil);
        _S ->
            logger:debug("~w", [_S], chat_mgr, 487),
            false
    end.

do_compare(H1, H2) ->
    logger:debug("===========", [], chat_mgr, 491),
    Fun = fun (I, Temp) ->
                  case lists:member(I, H2) of
                      true ->
                          WL = lists:flatten(silent_data:get_whitechars()),
                          case lists:member(I, WL) of
                              true -> Temp;
                              _ -> Temp + 1
                          end;
                      _ -> Temp
                  end
          end,
    Num = lists:foldl(Fun, 0, H1),
    L = max(length(H1), length(H2)),
    Num / L * 100.

send_offline(Id = {_, P, Z}, Cmd, Msg) ->
    case role_misc:is_local_role(Id) of
        true -> do_send_offline(Id, Cmd, Msg);
        false ->
            case big_world:cast(P,
                                Z,
                                chat_mgr,
                                do_send_offline,
                                [Id, Cmd, Msg])
                of
                ok -> ok;
                {false, Reason} -> {false, Reason};
                {error, _} -> {false, lang:get("跨服世界暂未联通，无法发送消息")};
                _ -> {false, lang:get("跨服世界暂未开启，无法发送消息")}
            end
    end;
send_offline(_, _, _) -> {false, lang:get("无法识别的消息")}.

do_send_offline(Id = {Rid, _, _}, Cmd, Msg) ->
    case env:get(role_max_next_id) of
        MaxId when is_integer(MaxId) andalso Rid =< MaxId ->
            case ets:lookup(chat_offline, Id) of
                [#chat_offline{msgs = L}] when length(L) >= 100 ->
                    {false, lang:get("对方离线信箱已满")};
                _ ->
                    chat_mgr ! {send_offline, Id, Cmd, Msg},
                    ok
            end;
        _ -> ok
    end;
do_send_offline(_, _, _) -> ok.

gm_clear(Rid) -> chat_mgr ! {gm_clear, Rid}.

do_clear([], _) -> ok;
do_clear([O = #chat_offline{id = Id, msgs = Msgs} | T],
         Rid) ->
    case catch dets:member(robot_role, Id) of
        true ->
            O1 = O#chat_offline{msgs = do_clear_msg(Msgs, Rid)},
            ets:insert(chat_offline, O1),
            dets:insert(chat_offline, O1);
        _ ->
            ets:delete(chat_offline, Id),
            dets:delete(chat_offline, Id)
    end,
    do_clear(T, Rid).

do_clear_msg([], _) -> [];
do_clear_msg([{Cmd, Msg} | T], Rid = {R, P, Z}) ->
    case chat_ver:do_sns_msg(Msg) of
        false -> do_clear_msg(T, Rid);
        {_TRid,
         _TP,
         _TZ,
         R,
         P,
         Z,
         _Name,
         _Face,
         _Sex,
         _Lev,
         _Classes,
         _GuildName,
         _Msg,
         _Special} ->
            do_clear_msg(T, Rid);
        NewMsg -> [{Cmd, NewMsg} | do_clear_msg(T, Rid)]
    end.

get_offline(#role{id = Id, pid = Pid}) ->
    chat_mgr ! {get_offline, Id, Pid}.

start_link() ->
    gen_server:start_link({local, chat_mgr},
                          chat_mgr,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...", [chat_mgr], chat_mgr, 580),
    process_flag(trap_exit, true),
    ets:new(chat_item_cache,
            [set, named_table, public, {keypos, 1}]),
    ets:new(chat_pet_cache,
            [set, named_table, public, {keypos, 1}]),
    ets:new(chat_guard_cache,
            [set, named_table, public, {keypos, 1}]),
    ets:new(chat_voice_cache,
            [set, named_table, public, {keypos, 1}]),
    ets:new(chat_wing_cache,
            [set, named_table, public, {keypos, 1}]),
    ets:new(chat_mount_cache,
            [set, named_table, public, {keypos, 1}]),
    ets:new(chat_child_cache,
            [set, named_table, public, {keypos, 1}]),
    ets:new(chat_talisman_cache,
            [set, named_table, public, {keypos, 1}]),
    ets:new(chat_silence_cache,
            [set, named_table, public, {keypos, 1}]),
    dets:open_file(chat_offline,
                   [{file, "./dets/chat_offline.dets"},
                    {keypos, #chat_offline.id},
                    {type, set}]),
    ets:new(chat_offline,
            [set, named_table, public, {keypos, #chat_offline.id}]),
    dets:to_ets(chat_offline, chat_offline),
    OffRef = erlang:send_after(300000,
                               self(),
                               offline_push),
    State = #state{offline_ref = OffRef},
    logger:info("[~w] 启动完成", [chat_mgr], chat_mgr, 598),
    {ok, State}.

handle_call(item_cache_fetch_id, _From,
            State = #state{item_cache_next_id = Id}) ->
    case Id >= 10000 of
        true -> {reply, 1, State#state{item_cache_next_id = 1}};
        false ->
            {reply, Id, State#state{item_cache_next_id = Id + 1}}
    end;
handle_call(pet_cache_fetch_id, _From,
            State = #state{pet_cache_next_id = Id}) ->
    case Id >= 1000 of
        true -> {reply, 1, State#state{pet_cache_next_id = 1}};
        false ->
            {reply, Id, State#state{pet_cache_next_id = Id + 1}}
    end;
handle_call(child_cache_fetch_id, _From,
            State = #state{child_cache_next_id = Id}) ->
    case Id >= 1000 of
        true ->
            {reply, 1, State#state{child_cache_next_id = 1}};
        false ->
            {reply, Id, State#state{child_cache_next_id = Id + 1}}
    end;
handle_call(talisman_cache_fetch_id, _From,
            State = #state{talisman_cache_next_id = Id}) ->
    case Id >= 500 of
        true ->
            {reply, 1, State#state{talisman_cache_next_id = 1}};
        false ->
            {reply,
             Id,
             State#state{talisman_cache_next_id = Id + 1}}
    end;
handle_call(wing_cache_fetch_id, _From,
            State = #state{wing_cache_next_id = Id}) ->
    case Id >= 500 of
        true -> {reply, 1, State#state{wing_cache_next_id = 1}};
        false ->
            {reply, Id, State#state{wing_cache_next_id = Id + 1}}
    end;
handle_call(mount_cache_fetch_id, _From,
            State = #state{mount_cache_next_id = Id}) ->
    case Id >= 500 of
        true ->
            {reply, 1, State#state{mount_cache_next_id = 1}};
        false ->
            {reply, Id, State#state{mount_cache_next_id = Id + 1}}
    end;
handle_call(guard_cache_fetch_id, _From,
            State = #state{guard_cache_next_id = Id}) ->
    case Id >= 500 of
        true ->
            {reply, 1, State#state{guard_cache_next_id = 1}};
        false ->
            {reply, Id, State#state{guard_cache_next_id = Id + 1}}
    end;
handle_call(voice_cache_fetch_id, _From,
            State = #state{voice_cache_next_id = Id}) ->
    case Id >= 3500 of
        true ->
            {reply, 1, State#state{voice_cache_next_id = 1}};
        false ->
            {reply, Id, State#state{voice_cache_next_id = Id + 1}}
    end;
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({send_offline, Id, Cmd, Msg},
            State = #state{offline_notices = OffNotice}) ->
    NewOff = case ets:lookup(chat_offline, Id) of
                 [Off = #chat_offline{msgs = L}] ->
                     Off#chat_offline{msgs = [{Cmd, Msg} | L]};
                 _ -> #chat_offline{id = Id, msgs = [{Cmd, Msg}]}
             end,
    dets:insert(chat_offline, NewOff),
    ets:insert(chat_offline, NewOff),
    {noreply,
     State#state{offline_notices =
                     [Id | OffNotice -- [Id]]}};
handle_info({get_offline, Id, Pid}, State) ->
    case ets:lookup(chat_offline, Id) of
        [#chat_offline{msgs = L}] ->
            dets:delete(chat_offline, Id),
            ets:delete(chat_offline, Id),
            lists:foreach(fun ({Cmd, Msg}) ->
                                  case Cmd of
                                      10402 ->
                                          case chat_ver:do_sns_msg(Msg) of
                                              false -> ok;
                                              NewMsg ->
                                                  role:pack_send(Pid,
                                                                 Cmd,
                                                                 NewMsg)
                                          end;
                                      10411 ->
                                          case chat_ver:do_sns_voice(Msg) of
                                              false -> ok;
                                              NewMsg ->
                                                  role:pack_send(Pid,
                                                                 Cmd,
                                                                 NewMsg)
                                          end;
                                      _ -> role:pack_send(Pid, Cmd, Msg)
                                  end
                          end,
                          lists:reverse(L));
        _ -> ok
    end,
    {noreply, State};
handle_info({gm_clear, Rid}, State) ->
    L = ets:tab2list(chat_offline),
    do_clear(L, Rid),
    {noreply, State};
handle_info(offline_push,
            State = #state{offline_ref = OldRef,
                           offline_notices = Notices}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    OffRef = erlang:send_after(300000,
                               self(),
                               offline_push),
    do_offline_push(Notices),
    {noreply,
     State#state{offline_ref = OffRef,
                 offline_notices = []}};
handle_info({http, {RequestId, Res}}, State) ->
    _Rid = erlang:get({http_request, RequestId}),
    case Res of
        {{_, 200, _}, _, _Reply} ->
            logger:debug("http 请求返回 ~w ~ts",
                         [_Rid, _Reply],
                         chat_mgr,
                         724);
        _ ->
            logger:debug("http 请求返回 ~w ~w",
                         [_Rid, Res],
                         chat_mgr,
                         726)
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...", [chat_mgr], chat_mgr, 734),
    logger:info("[~w] 关闭完成", [chat_mgr], chat_mgr, 735),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_get_item_cache(Platform, ZoneId, Id) ->
    case catch ets:lookup(chat_item_cache,
                          {Platform, ZoneId, Id})
        of
        [{_, Item}] -> {ok, Item};
        [] -> {error, node_not_exists};
        {'EXIT', {badarg, _}} -> {error, chat_not_running};
        Err -> {error, Err}
    end.

do_get_pet_cache(Platform, ZoneId, Id) ->
    case catch ets:lookup(chat_pet_cache,
                          {Platform, ZoneId, Id})
        of
        [{_, Pet}] -> {ok, Pet};
        [] -> {error, node_not_exists};
        {'EXIT', {badarg, _}} -> {error, chat_not_running};
        Err -> {error, Err}
    end.

do_get_wing_cache(Platform, ZoneId, Id) ->
    case catch ets:lookup(chat_wing_cache,
                          {Platform, ZoneId, Id})
        of
        [{_, Wing}] -> {ok, Wing};
        [] -> {error, node_not_exists};
        {'EXIT', {badarg, _}} -> {error, chat_not_running};
        Err -> {error, Err}
    end.

do_get_mount_cache(Platform, ZoneId, Id) ->
    case catch ets:lookup(chat_mount_cache,
                          {Platform, ZoneId, Id})
        of
        [{_, MountInfo}] -> {ok, MountInfo};
        [] -> {error, node_not_exists};
        {'EXIT', {badarg, _}} -> {error, chat_not_running};
        Err -> {error, Err}
    end.

do_get_talisman_cache(Platform, ZoneId, Id) ->
    case catch ets:lookup(chat_talisman_cache,
                          {Platform, ZoneId, Id})
        of
        [{_, Talisman}] -> {ok, Talisman};
        [] -> {error, node_not_exists};
        {'EXIT', {badarg, _}} -> {error, chat_not_running};
        Err -> {error, Err}
    end.

do_get_guard_cache(Platform, ZoneId, Id) ->
    case catch ets:lookup(chat_guard_cache,
                          {Platform, ZoneId, Id})
        of
        [{_, Guard}] -> {ok, Guard};
        [] -> {error, node_not_exists};
        {'EXIT', {badarg, _}} -> {error, chat_not_running};
        Err -> {error, Err}
    end.

do_get_voice_cache(Platform, ZoneId, Id) ->
    case catch ets:lookup(chat_voice_cache,
                          {Platform, ZoneId, Id})
        of
        [{_, Voice}] -> {ok, Voice};
        [] -> {error, node_not_exists};
        {'EXIT', {badarg, _}} -> {error, chat_not_running};
        Err -> {error, Err}
    end.

do_offline_push([]) -> ok;
do_offline_push([Rid = {_, Platfrom, ZoneId} | T]) ->
    case friend:fetch(by_id, Rid) of
        #friend_role{name = RoleName, offline_push = 1} ->
            IsOnline = case role_query:local_conn_pid(by_id, Rid) of
                           {ok, Pid} when is_pid(Pid) -> is_process_alive(Pid);
                           _ -> false
                       end,
            case IsOnline of
                true -> ok;
                _ ->
                    SrvId = util:flist("~ts~ts~ts",
                                       [Platfrom, "_", util:to_list(ZoneId)]),
                    Sign = util:md5(util:flist("~ts~ts~ts",
                                               [SrvId,
                                                util:to_list(util:fbin(RoleName)),
                                                "daDDsd*34_34Rjsdd2lhj"])),
                    Title = lang:get("有人找你哦"),
                    Content = lang:get("有好友在游戏中找你~快上来看看吧~"),
                    S =
                        util:flist("srv_id=~ts&role_name=~ts&title=~ts&content=~t"
                                   "s&sign=~ts",
                                   [SrvId, RoleName, Title, Content, Sign]),
                    logger:debug("http 请求 url ~ts 内容 ~ts",
                                 ["http://smp.xcqy12.shiyuegame.com/api.php/pf/p"
                                  "ushmessage/push/",
                                  S],
                                 chat_mgr,
                                 826),
                    case httpc:request(post,
                                       {"http://smp.xcqy12.shiyuegame.com/api.php/pf/p"
                                        "ushmessage/push/",
                                        [],
                                        "application/x-www-form-urlencoded",
                                        unicode:characters_to_binary(S)},
                                       [{timeout, 5000}],
                                       [{sync, false}, {full_result, false}])
                        of
                        {ok, RequestId} ->
                            logger:debug("离线请求id ~w",
                                         [RequestId],
                                         chat_mgr,
                                         829),
                            erlang:put({http_request, RequestId}, Rid);
                        _Err ->
                            logger:error("角色[~ts]~w 离线消息推送失败 ~w",
                                         [RoleName, Rid, _Err],
                                         chat_mgr,
                                         832)
                    end
            end;
        _ -> ok
    end,
    do_offline_push(T).

