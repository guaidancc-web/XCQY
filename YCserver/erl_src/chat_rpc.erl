-file("src/mod/chat/chat_rpc.erl", 1).

-module(chat_rpc).

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

-file("src/mod/chat/chat_rpc.erl", 13).

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

-file("src/mod/chat/chat_rpc.erl", 14).

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

-file("src/mod/chat/chat_rpc.erl", 15).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/chat/chat_rpc.erl", 16).

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

-file("src/mod/chat/chat_rpc.erl", 17).

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

-file("src/mod/chat/chat_rpc.erl", 18).

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

-file("src/mod/chat/chat_rpc.erl", 19).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/chat/chat_rpc.erl", 20).

-file("inc/adm.hrl", 1).

-record(m_adm, {last_feedback = 0}).

-record(adm_report_info,
        {id, time, classes, lev, name, report = []}).

-record(adm_report,
        {id,
         order,
         name,
         lev,
         time,
         type,
         reason,
         msg = [],
         flag = 0}).

-record(adm_device_info,
        {id, type = 1 :: non_neg_integer()}).

-record(auth_sfz_cfg,
        {plat_channel = {"", 0},
         platform = "",
         channel_reg = 0,
         name = "",
         can_charge = 1,
         is_nonage = 0,
         charge_limit = 5000,
         is_wallow = 0,
         down_sec = 10800,
         is_show_phone = 0,
         show_info = "gm.3k.com",
         is_mail = 0,
         is_mid_exp = 0,
         is_lev_60 = 0,
         is_need_check = 0}).

-record(role_charge_cfg, {id = {0, "", 0}, label = ""}).

-file("src/mod/chat/chat_rpc.erl", 21).

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

-file("src/mod/chat/chat_rpc.erl", 22).

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

-file("src/mod/chat/chat_rpc.erl", 23).

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

-file("src/mod/chat/chat_rpc.erl", 24).

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

-file("src/mod/chat/chat_rpc.erl", 25).

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

-file("src/mod/chat/chat_rpc.erl", 26).

-file("inc/talisman.hrl", 1).

-record(m_talisman,
        {ver = 5,
         next_id = 1,
         use_plan = 1,
         plan_1 = [],
         plan_2 = [],
         items = [],
         fusion_lev = 0,
         fusion_val = 0,
         skills = [],
         fc = 0,
         remold_formula = [],
         last_gain_id = 0,
         volume = 48}).

-record(talisman,
        {ver = 3,
         id = 1,
         base_id = 0,
         type = 0,
         quality = 0,
         lev = 0,
         attr = [],
         num = 1,
         fc = 0}).

-record(talisman_base,
        {base_id = 0,
         name = "",
         type = 0,
         quality = 0,
         lev = 0,
         need_lev = 0,
         need_lev_break = 0,
         set_id = 0,
         fusion_val = 0,
         base_attr = [],
         grade = 0}).

-file("src/mod/chat/chat_rpc.erl", 27).

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

-file("src/mod/chat/chat_rpc.erl", 28).

-export([handle/3]).

handle(10400, {_, Msg}, _) when length(Msg) > 100 ->
    logger:debug("聊天信息长度不符合要求", [], chat_rpc, 34),
    ok;
handle(10400, {Type, Msg},
       Role = #role{lock_status = LockStatus, lev = Lev})
    when (LockStatus =:= 1 orelse
              LockStatus =:= 3 orelse LockStatus =:= 4)
             andalso
             Lev >= 20 andalso
                 (Type =:= 1 orelse
                      Type =:= 3 orelse
                          Type =:= 8 orelse
                              Type =:= 10 orelse
                                  Type =:= 11 orelse Type =:= 4) ->
    case chat:check_send_cond(Type, 1, Msg, Role) of
        ok when Type == 1 ->
            case adm_api:check_role_silent(Role) of
                callback ->
                    chat:send_self_msg(Type, Msg, Role),
                    ok;
                ok ->
                    notice:send(Role, 1, lang:get("你已经被禁言, 无法发言")),
                    ok;
                {ok, NewRole} ->
                    chat:send_chat_msg(type_to_labal(Type), Msg, Role),
                    {ok, NewRole};
                false ->
                    notice:send(Role, 1, lang:get("你已经被禁言, 无法发言")),
                    ok;
                {false, Min} ->
                    notice:send(Role,
                                1,
                                util:flist(lang:get("你已经被禁言, 还剩 ~w 分钟解禁"),
                                           [Min])),
                    ok;
                {callback, _Min} ->
                    chat:send_self_msg(Type, Msg, Role),
                    ok
            end;
        _False when Type == 1 -> ok;
        _ ->
            case adm_api:check_role_silent(Role) of
                callback ->
                    chat:send_self_msg(Type, Msg, Role),
                    ok;
                ok ->
                    notice:send(Role, 1, lang:get("你已经被禁言, 无法发言")),
                    ok;
                {ok, NewRole} ->
                    chat:send_chat_msg(type_to_labal(Type), Msg, Role),
                    {ok, NewRole};
                false ->
                    notice:send(Role, 1, lang:get("你已经被禁言, 无法发言")),
                    ok;
                {false, Min} ->
                    notice:send(Role,
                                1,
                                util:flist(lang:get("你已经被禁言, 还剩 ~w 分钟解禁"),
                                           [Min])),
                    ok;
                {callback, _Min} ->
                    chat:send_self_msg(Type, Msg, Role),
                    ok
            end
    end;
handle(10400, {Type = 1, Msg},
       Role = #role{id = RoleId, name = RoleName, lev = Lev})
    when Lev >= 20 ->
    case chat:check_send_cond(Type, 1, Msg, Role) of
        ok ->
            case chat:check_can_say(Lev, Msg) of
                true -> chat:send_chat_msg(world, Msg, Role);
                false ->
                    logger:info("~ts输入广告:~w",
                                [RoleName, Msg],
                                chat_rpc,
                                97),
                    spawn(fun () ->
                                  adm:silent([RoleId],
                                             1000,
                                             1,
                                             lang:get("广告"),
                                             "admin")
                          end),
                    chat:send_self_msg(Type, Msg, Role),
                    ok;
                skip -> ok
            end;
        _False -> ok
    end;
handle(10400, {1, _}, Role) ->
    notice:send(Role,
                1,
                util:flist(lang:get("等级不足~w级，无法发送此频道"), [20])),
    ok;
handle(10400, {Type = 8, Msg},
       Role = #role{id = RoleId, name = RoleName, lev = Lev,
                    cross_type = 1})
    when Lev >= 40 ->
    case chat:check_send_cond(Type, 1, Msg, Role) of
        ok ->
            case chat:check_can_say(Lev, Msg) of
                true -> chat:send_chat_msg(center_world, Msg, Role);
                false ->
                    logger:info("~ts输入广告:~w",
                                [RoleName, Msg],
                                chat_rpc,
                                119),
                    spawn(fun () ->
                                  adm:silent([RoleId],
                                             1000,
                                             1,
                                             lang:get("广告"),
                                             "admin")
                          end),
                    chat:send_self_msg(Type, Msg, Role),
                    ok;
                skip -> ok
            end;
        _False -> ok
    end;
handle(10400, {8, _}, Role = #role{cross_type = 0}) ->
    notice:send(Role, 1, lang:get("不在跨服状态，无法发送此频道")),
    ok;
handle(10400, {8, _}, Role) ->
    notice:send(Role,
                1,
                util:flist(lang:get("等级不足~w级，"), [40])),
    ok;
handle(10400, {3, Msg},
       Role = #role{lev = Lev, cross_type = 0})
    when Lev >= 20 ->
    case role_misc:check_cd(rpc_10400_map) of
        true ->
            chat:send_chat_msg(map, Msg, Role),
            ok;
        false -> ok
    end;
handle(10400, {3, Msg},
       Role = #role{id = RoleId, lev = Lev, name = RoleName,
                    s_event = 72})
    when Lev >= 20 ->
    case role_misc:check_cd(rpc_10400_canyon) of
        true ->
            case chat:check_can_say(Lev, Msg) of
                true ->
                    chat:send_chat_msg(map, Msg, Role),
                    ok;
                false ->
                    logger:info("~ts输入广告:~w",
                                [RoleName, Msg],
                                chat_rpc,
                                156),
                    spawn(fun () ->
                                  adm:silent([RoleId],
                                             1000,
                                             1,
                                             lang:get("广告"),
                                             "admin")
                          end),
                    chat:send_self_msg(3, Msg, Role),
                    ok;
                skip -> ok
            end;
        false -> ok
    end;
handle(10400, {3, Msg}, Role = #role{lev = Lev})
    when Lev >= 40 ->
    case role_misc:check_cd(rpc_10400_map) of
        true ->
            chat:send_chat_msg(map, Msg, Role),
            ok;
        false -> ok
    end;
handle(10400, {3, _}, Role = #role{cross_type = 0}) ->
    notice:send(Role,
                1,
                util:flist(lang:get("等级不足~w级，无法发送此频道"), [20])),
    ok;
handle(10400, {3, _}, Role) ->
    notice:send(Role,
                1,
                util:flist(lang:get("等级不足~w级，无法发送此频道"), [40])),
    ok;
handle(10400, {4, _}, #role{m_guild = undefined}) -> ok;
handle(10400, {4, Msg}, Role = #role{lev = _}) ->
    case role_misc:check_cd(rpc_10400_guild) of
        true ->
            chat:send_chat_msg(guild, Msg, Role),
            ok;
        false -> ok
    end;
handle(10400, {2, Msg}, Role = #role{lev = _}) ->
    case role_misc:check_cd(rpc_10400_team) of
        true ->
            chat:send_chat_msg(team, Msg, Role),
            ok;
        false -> ok
    end;
handle(10400, {Type = 10, Msg},
       Role = #role{id = RoleId, lev = Lev, name = RoleName,
                    s_event = 56}) ->
    logger:debug("龙王试炼发言:", [], chat_rpc, 207),
    case chat:check_send_cond(1, 1, Msg, Role) of
        ok ->
            case chat:check_can_say(Lev, Msg) of
                true -> chat:send_chat_msg(spirit_treasure, Msg, Role);
                false ->
                    logger:info("~ts输入广告:~w",
                                [RoleName, Msg],
                                chat_rpc,
                                215),
                    spawn(fun () ->
                                  adm:silent([RoleId],
                                             1000,
                                             1,
                                             lang:get("广告"),
                                             "admin")
                          end),
                    chat:send_self_msg(Type, Msg, Role),
                    ok;
                skip -> ok
            end;
        _False ->
            logger:debug("龙王试炼发言:~w", [_False], chat_rpc, 223),
            ok
    end;
handle(10400, {10, _}, Role) ->
    notice:send(Role,
                1,
                notice:format(lang:get("只有参与~ts时才能使用此频道"),
                              [{string_2, 1, lang:get("龙王试炼")}])),
    ok;
handle(10400, {Type = 11, Msg},
       Role = #role{id = RoleId, lev = Lev, name = RoleName,
                    s_event = 67}) ->
    logger:debug("天启试炼发言:", [], chat_rpc, 231),
    case chat:check_send_cond(1, 1, Msg, Role) of
        ok ->
            case chat:check_can_say(Lev, Msg) of
                true -> chat:send_chat_msg(oracle_treasure, Msg, Role);
                false ->
                    logger:info("~ts输入广告:~w",
                                [RoleName, Msg],
                                chat_rpc,
                                239),
                    spawn(fun () ->
                                  adm:silent([RoleId],
                                             1000,
                                             1,
                                             lang:get("广告"),
                                             "admin")
                          end),
                    chat:send_self_msg(Type, Msg, Role),
                    ok;
                skip -> ok
            end;
        _False ->
            logger:debug("天启试炼发言:~w", [_False], chat_rpc, 247),
            ok
    end;
handle(10400, {11, _}, Role) ->
    notice:send(Role,
                1,
                notice:format(lang:get("只有参与~ts时才能使用此频道"),
                              [{string_2, 1, lang:get("天启试炼")}])),
    ok;
handle(10400, {Type = 12, Msg},
       Role = #role{id = RoleId, lev = Lev, name = RoleName,
                    s_event = 73}) ->
    logger:debug("峡谷之巅阵营发言:", [], chat_rpc, 255),
    case role_misc:check_cd(rpc_10400_canyon) of
        true ->
            case chat:check_can_say(Lev, Msg) of
                true -> chat:send_chat_msg(canyon_side, Msg, Role);
                false ->
                    logger:info("~ts输入广告:~w",
                                [RoleName, Msg],
                                chat_rpc,
                                262),
                    spawn(fun () ->
                                  adm:silent([RoleId],
                                             1000,
                                             1,
                                             lang:get("广告"),
                                             "admin")
                          end),
                    chat:send_self_msg(Type, Msg, Role),
                    ok;
                skip -> ok
            end;
        _ -> ok
    end;
handle(10400, {12, _}, Role) ->
    notice:send(Role,
                1,
                notice:format(lang:get("只有参与~ts时才能使用此频道"),
                              [{string_2, 1, lang:get("峡谷之巅")}])),
    ok;
handle(10402, {Rid, P, Z, _Msg},
       #role{id = {Rid, P, Z}}) ->
    notice:return(lang:get("不能给自己发信息")),
    ok;
handle(10402, {Rid, P, Z, Msg},
       Role = #role{lev = Lev, lock_status = LockStatus})
    when Lev =< 14 ->
    TargetRoleId = {Rid, P, Z},
    case friend:is_blacklist(Role, TargetRoleId) of
        false ->
            case util:check_text(Msg, 100) of
                ok ->
                    TargetRoleId = {Rid, P, Z},
                    Info = chat:sns_msg(Role, TargetRoleId, Msg),
                    case LockStatus of
                        4 ->
                            sys_conn:pack_send(10432, {1, 0, 10400}),
                            sys_conn:pack_send(10402, Info),
                            ok;
                        _ ->
                            sys_conn:pack_send(10432, {1, 0, 10400}),
                            sys_conn:pack_send(10402, Info),
                            ok
                    end;
                {false, _Reason} ->
                    notice:send(Role, 1, lang:get("发言中含有不恰当词语，请文明聊天")),
                    sys_conn:pack_send(10432, {0, 0, 10402})
            end;
        _True ->
            notice:return(lang:get("双方都解除黑名单后才可私聊{face_1,5}")),
            ok
    end,
    ok;
handle(10402, {Rid, P, Z, Msg},
       Role = #role{lev = Lev, lock_status = LockStatus}) ->
    NLockStatus = case chat:do_silent_count(Role, 5, Msg) of
                      false -> 4;
                      ok -> LockStatus
                  end,
    TargetRoleId = {Rid, P, Z},
    {WorldLev, _} = world_lev:get_world_lev(),
    DayChatted = var:get_var(Role, day, 65, []),
    ChechRes = case Lev >= 60 orelse
                        Lev >= WorldLev - 5 orelse
                            friend:is_friend(Role, TargetRoleId)
                   of
                   true -> true;
                   _ ->
                       case lists:member(TargetRoleId, DayChatted) of
                           false when length(DayChatted) >= 5 -> false;
                           false -> new;
                           _ -> true
                       end
               end,
    ChatRes = case friend:is_blacklist(Role, TargetRoleId)
                  of
                  _ when ChechRes =:= false -> ok;
                  false ->
                      case util:check_text(Msg, 100) of
                          ok ->
                              sys_conn:pack_send(10432, {1, 0, 10402}),
                              SecFlag = case
                                            role_misc:check_conn_pid(TargetRoleId)
                                            of
                                            {true, _IsLocal, ConnPid} ->
                                                catch log:chat(Role,
                                                               friend,
                                                               TargetRoleId,
                                                               Msg),
                                                Info = chat:sns_msg(Role,
                                                                    TargetRoleId,
                                                                    Msg),
                                                case NLockStatus of
                                                    4 ->
                                                        sys_conn:pack_send(10402,
                                                                           Info),
                                                        true;
                                                    _ ->
                                                        sys_conn:pack_send(10402,
                                                                           Info),
                                                        sys_conn:pack_send(ConnPid,
                                                                           10402,
                                                                           Info),
                                                        true
                                                end;
                                            {false, _IsLocal} ->
                                                catch log:chat(Role,
                                                               friend,
                                                               TargetRoleId,
                                                               Msg),
                                                Info = chat:sns_msg(Role,
                                                                    TargetRoleId,
                                                                    Msg),
                                                case NLockStatus of
                                                    4 ->
                                                        sys_conn:pack_send(10402,
                                                                           Info),
                                                        true;
                                                    _ ->
                                                        sys_conn:pack_send(10402,
                                                                           Info),
                                                        case
                                                            chat_mgr:send_offline(TargetRoleId,
                                                                                  10402,
                                                                                  Info)
                                                            of
                                                            {false, Why} ->
                                                                notice:return(Why),
                                                                false;
                                                            _ -> true
                                                        end
                                                end;
                                            big_world_not_ready ->
                                                notice:return(lang:get("跨服暂未联通，无法发送跨服消息")),
                                                false
                                        end,
                              {SecFlag, ChechRes};
                          _ ->
                              sys_conn:pack_send(10432, {0, 0, 10402}),
                              notice:send(Role, 1, lang:get("发言中含有不恰当词语，请文明聊天"))
                      end;
                  _True ->
                      notice:return(lang:get("双方都解除黑名单后才可私聊{face_1,5}")),
                      ok
              end,
    case ChatRes of
        {true, new} ->
            Role1 = var:set_var(Role,
                                day,
                                65,
                                [TargetRoleId | DayChatted]),
            {ok, Role1};
        _ -> ok
    end;
handle(10403,
       {Type, Voice, VoiceTime, VoiceText, CacheId},
       Role = #role{lock_status = LockStatus})
    when LockStatus =:= 1 orelse
             LockStatus =:= 3 orelse LockStatus =:= 4 ->
    case lists:member(Type, [1, 2, 3, 4, 8]) of
        false -> ok;
        true ->
            case chat:check_send_cond(Type, 2, "", Role) of
                ok when Type == 1 ->
                    case adm_api:check_role_silent(Role) of
                        callback -> ok;
                        ok ->
                            notice:send(Role, 1, lang:get("你已经被禁言, 无法发言")),
                            ok;
                        {ok, NewRole} ->
                            chat_mgr:add_voice_cache(Type,
                                                     Voice,
                                                     VoiceTime,
                                                     VoiceText,
                                                     CacheId,
                                                     Role),
                            {ok, NewRole};
                        false ->
                            notice:send(Role, 1, lang:get("你已经被禁言, 无法发言")),
                            ok;
                        {false, Min} ->
                            notice:send(Role,
                                        1,
                                        util:flist(lang:get("你已经被禁言, 还剩 ~w 分钟解禁"),
                                                   [Min])),
                            ok;
                        {callback, _Min} -> ok
                    end;
                _False when Type == 1 -> ok;
                _ ->
                    case adm_api:check_role_silent(Role) of
                        callback -> ok;
                        ok ->
                            notice:send(Role, 1, lang:get("你已经被禁言, 无法发言")),
                            ok;
                        {ok, NewRole} ->
                            chat_mgr:add_voice_cache(Type,
                                                     Voice,
                                                     VoiceTime,
                                                     VoiceText,
                                                     CacheId,
                                                     Role),
                            {ok, NewRole};
                        false ->
                            notice:send(Role, 1, lang:get("你已经被禁言, 无法发言")),
                            ok;
                        {false, Min} ->
                            notice:send(Role,
                                        1,
                                        util:flist(lang:get("你已经被禁言, 还剩 ~w 分钟解禁"),
                                                   [Min])),
                            ok;
                        {callback, _Min} -> ok
                    end
            end
    end;
handle(10403,
       {Type = 8, Voice, VoiceTime, VoiceText, CacheId},
       Role = #role{lev = Lev, cross_type = 1})
    when Lev >= 40 ->
    case chat:check_send_cond(Type, 2, "", Role) of
        ok ->
            case chat_mgr:add_voice_cache(8,
                                          Voice,
                                          VoiceTime,
                                          VoiceText,
                                          CacheId,
                                          Role)
                of
                true -> ok;
                _ -> ok
            end;
        _False -> ok
    end;
handle(10403, {8, _, _, _, _}, Role) ->
    notice:send(Role,
                1,
                {util:flist(lang:get("等级不足~w级，无法发送此频道"), [40])}),
    ok;
handle(10403,
       {Type = 1, Voice, VoiceTime, VoiceText, CacheId},
       Role = #role{lev = Lev})
    when Lev >= 20 ->
    case chat:check_send_cond(Type, 2, "", Role) of
        ok ->
            case chat_mgr:add_voice_cache(1,
                                          Voice,
                                          VoiceTime,
                                          VoiceText,
                                          CacheId,
                                          Role)
                of
                true -> ok;
                _ -> ok
            end;
        _False -> ok
    end;
handle(10403, {1, _, _, _, _}, Role) ->
    notice:send(Role,
                1,
                util:flist(lang:get("等级不足~w级，无法发送此频道"), [20])),
    ok;
handle(10403, {4, _, _, _, _},
       Role = #role{m_guild = undefined}) ->
    role:link_send(Role,
                   10401,
                   {0, 4, lang:get("您当前未加入任何公会，无法在公会频道发言")}),
    ok;
handle(10403, {4, Voice, VoiceTime, VoiceText, CacheId},
       Role) ->
    case role_misc:check_cd(rpc_10400_guild) of
        true ->
            case chat_mgr:add_voice_cache(4,
                                          Voice,
                                          VoiceTime,
                                          VoiceText,
                                          CacheId,
                                          Role)
                of
                true -> ok;
                _ -> ok
            end;
        false -> ok
    end;
handle(10403, {2, Voice, VoiceTime, VoiceText, CacheId},
       Role) ->
    case role_misc:check_cd(rpc_10400_team) of
        true ->
            case chat_mgr:add_voice_cache(2,
                                          Voice,
                                          VoiceTime,
                                          VoiceText,
                                          CacheId,
                                          Role)
                of
                true -> ok;
                _ -> ok
            end;
        false -> ok
    end;
handle(10403, {3, Voice, VoiceTime, VoiceText, CacheId},
       Role = #role{lev = Lev})
    when Lev >= 20 ->
    case role_misc:check_cd(rpc_10400_map) of
        true ->
            case chat_mgr:add_voice_cache(3,
                                          Voice,
                                          VoiceTime,
                                          VoiceText,
                                          CacheId,
                                          Role)
                of
                true -> ok;
                _ -> ok
            end;
        false -> ok
    end;
handle(10403, {3, _, _, _, _}, Role) ->
    notice:send(Role,
                1,
                util:flist(lang:get("等级不足~w级，无法发送此频道"), [20])),
    ok;
handle(10403,
       {10, Voice, VoiceTime, VoiceText, CacheId}, Role) ->
    logger:debug("==============", [], chat_rpc, 497),
    case chat:check_send_cond(1, 2, "", Role) of
        ok ->
            logger:debug("==============", [], chat_rpc, 500),
            case chat_mgr:add_voice_cache(10,
                                          Voice,
                                          VoiceTime,
                                          VoiceText,
                                          CacheId,
                                          Role)
                of
                true ->
                    logger:debug("==============", [], chat_rpc, 503),
                    ok;
                _ -> ok
            end;
        _False -> ok
    end;
handle(10403, _, _Role) ->
    notice:return(lang:get("此频道暂不支持语音消息")),
    ok;
handle(10404, {Platform, ZoneId, Id}, _Role) ->
    case chat_mgr:get_voice_cache(Platform, ZoneId, Id) of
        {error, Reason} ->
            logger:error("查询语音信息缓存失败: ~w", [Reason], chat_rpc, 517),
            ok;
        {ok, Voice} -> {reply, {Platform, ZoneId, Id, Voice}}
    end;
handle(10405, {}, Role) ->
    case chat_mgr:get_voice_id(Role) of
        {error, Reason} ->
            logger:error("查询语音信息缓存id失败: ~w",
                         [Reason],
                         chat_rpc,
                         527),
            ok;
        {true, Plat, ZoneId, Cache} ->
            {reply, {Plat, ZoneId, Cache}}
    end;
handle(10406, {CacheType, Id},
       #role{id = {_, P, Z}, p_bag = #package{items = Items},
             p_eqm = #package{items = Eqms},
             m_pet = #m_pet{pets = Pets},
             m_guard = #m_guard{guards = Guards}, m_wing = MWing,
             m_mount =
                 #m_mount{mounts = Mounts,
                          appearance_list = AppearanceList, dye_list = DyeList},
             m_talisman = #m_talisman{items = Talismans}}) ->
    case CacheType of
        1 ->
            case lists:keyfind(Id, #item.id, Items) of
                Item = #item{} ->
                    case chat_mgr:add_item_cache(P, Z, Item) of
                        {ok, {_, _, CacheId}} ->
                            {reply, {1, CacheType, Id, CacheId}};
                        _ -> {reply, {0, CacheType, 0, 0}}
                    end;
                _ -> {reply, {0, CacheType, 0, 0}}
            end;
        2 ->
            case lists:keyfind(Id, #pet.id, Pets) of
                Pet = #pet{} ->
                    case chat_mgr:add_pet_cache(P, Z, Pet) of
                        {ok, {_, _, CacheId}} ->
                            {reply, {1, CacheType, Id, CacheId}};
                        _ -> {reply, {0, CacheType, 0, 0}}
                    end;
                _ -> {reply, {0, CacheType, 0, 0}}
            end;
        3 ->
            case lists:keyfind(Id, #item.id, Eqms) of
                Item = #item{} ->
                    case chat_mgr:add_item_cache(P, Z, Item) of
                        {ok, {_, _, CacheId}} ->
                            {reply, {1, CacheType, Id, CacheId}};
                        _ -> {reply, {0, CacheType, 0, 0}}
                    end;
                _ -> {reply, {0, CacheType, 0, 0}}
            end;
        4 ->
            case lists:keyfind(Id, #guard.base_id, Guards) of
                Guard = #guard{} ->
                    case chat_mgr:add_guard_cache(P, Z, Guard) of
                        {ok, {_, _, CacheId}} ->
                            {reply, {1, CacheType, Id, CacheId}};
                        _ -> {reply, {0, CacheType, 0, 0}}
                    end;
                _ -> {reply, {0, CacheType, 0, 0}}
            end;
        5 ->
            case chat_mgr:add_wing_cache(P, Z, MWing) of
                {ok, {_, _, CacheId}} ->
                    {reply, {1, CacheType, Id, CacheId}};
                _ -> {reply, {0, CacheType, 0, 0}}
            end;
        6 ->
            case lists:keyfind(Id, #mount.index, Mounts) of
                Mount = #mount{transformation_id = TransID} ->
                    NDyeID = case lists:keyfind(TransID,
                                                #mount_dye.trans_id,
                                                DyeList)
                                 of
                                 #mount_dye{dye_id = DyeID} -> DyeID;
                                 _ -> 0
                             end,
                    MountInfo = {Mount, AppearanceList, NDyeID},
                    case chat_mgr:add_mount_cache(P, Z, MountInfo) of
                        {ok, {_, _, CacheId}} ->
                            {reply, {1, CacheType, Id, CacheId}};
                        _ -> {reply, {0, CacheType, 0, 0}}
                    end;
                _ -> {reply, {0, CacheType, 0, 0}}
            end;
        10 ->
            case lists:keyfind(Id, #talisman.id, Talismans) of
                Talisman = #talisman{} ->
                    case chat_mgr:add_talisman_cache(P, Z, Talisman) of
                        {ok, {_, _, CacheId}} ->
                            {reply, {1, CacheType, Id, CacheId}};
                        _ -> {reply, {0, CacheType, 0, 0}}
                    end;
                _ -> {reply, {0, CacheType, 0, 0}}
            end;
        _ -> {reply, {0, CacheType, 0, 0}}
    end;
handle(10407, {Platform, ZoneId, Id}, _Role) ->
    case chat_mgr:get_item_cache(Platform, ZoneId, Id) of
        {error, _Reason} -> ok;
        {ok, Item} -> {reply, {Platform, ZoneId, Id, Item}}
    end;
handle(10408, {Platform, ZoneId, Id}, _Role) ->
    case chat_mgr:get_pet_cache(Platform, ZoneId, Id) of
        {error, _Reason} -> ok;
        {ok, Pet} -> {reply, {Platform, ZoneId, Id, Pet}}
    end;
handle(10409, {Platform, ZoneId, Id}, _Role) ->
    case chat_mgr:get_item_cache(Platform, ZoneId, Id) of
        {error, _Reason} -> ok;
        {ok, Eqm} -> {reply, {Platform, ZoneId, Id, Eqm}}
    end;
handle(10410, {Platform, ZoneId, Id}, _Role) ->
    case chat_mgr:get_guard_cache(Platform, ZoneId, Id) of
        {error, _Reason} -> ok;
        {ok, Guard} -> {reply, {Platform, ZoneId, Id, Guard}}
    end;
handle(10411,
       {Rid, P, Z, _Voice, _VoiceTime, _VoiceText, _CacheId},
       #role{id = {Rid, P, Z}}) ->
    notice:return(lang:get("不能给自己发信息")),
    ok;
handle(10411,
       {Rid, P, Z, Voice, VoiceTime, VoiceText, CacheId},
       Role = #role{lev = Lev}) ->
    TargetRoleId = {Rid, P, Z},
    {WorldLev, _} = world_lev:get_world_lev(),
    DayChatted = var:get_var(Role, day, 65, []),
    ChechRes = case Lev >= 60 orelse
                        Lev >= WorldLev - 5 orelse
                            friend:is_friend(Role, TargetRoleId)
                   of
                   true -> true;
                   _ ->
                       case lists:member(TargetRoleId, DayChatted) of
                           false when length(DayChatted) >= 5 -> false;
                           false -> new;
                           _ -> true
                       end
               end,
    ChatRes = case friend:is_blacklist(Role, TargetRoleId)
                  of
                  _ when ChechRes =:= false -> ok;
                  false ->
                      SecFlag = case role_misc:check_conn_pid(TargetRoleId) of
                                    {true, _IsLocal, ConnPid} ->
                                        chat_mgr:add_sns_voice_cache(ConnPid,
                                                                     Voice,
                                                                     VoiceTime,
                                                                     VoiceText,
                                                                     CacheId,
                                                                     Role),
                                        true;
                                    {false, _IsLocal} ->
                                        chat_mgr:add_sns_voice_cache({Rid,
                                                                      P,
                                                                      Z},
                                                                     Voice,
                                                                     VoiceTime,
                                                                     VoiceText,
                                                                     CacheId,
                                                                     Role),
                                        true;
                                    big_world_not_ready ->
                                        notice:return(lang:get("跨服暂未联通，无法发送跨服消息")),
                                        false
                                end,
                      {SecFlag, ChechRes};
                  _True ->
                      notice:return(lang:get("双方都解除黑名单后才可私聊{face_1,5}"))
              end,
    case ChatRes of
        {true, new} ->
            Role1 = var:set_var(Role,
                                day,
                                65,
                                [TargetRoleId | DayChatted]),
            {ok, Role1};
        _ -> ok
    end;
handle(10414, {}, Role) ->
    chat:push_face(Role),
    ok;
handle(10412, {}, Role) ->
    chat_mgr:get_offline(Role),
    friend_group:get_offline(Role),
    ok;
handle(10415, {Bubble}, Role) ->
    role:send_buff_begin(),
    case chat:set_chat_bubble(Role, Bubble) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            achieve_shop:push_bubble(NewRole),
            {reply,
             {1, lang:get("设置成功, 战斗中说话可见{face_1, 25}")},
             NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            logger:debug("设置聊天气泡错误:~w", [Reason], chat_rpc, 727),
            {reply, {0, Reason}}
    end;
handle(10416, {}, Role) ->
    achieve_shop:push_bubble(Role),
    ok;
handle(10417, {Platform, ZoneId, Id}, _Role) ->
    case chat_mgr:get_wing_cache(Platform, ZoneId, Id) of
        {error, Reason} ->
            logger:error("查询翅膀信息缓存失败:~w", [Reason], chat_rpc, 739),
            ok;
        {ok,
         #m_wing{grade = Grade, wing_id = WingId,
                 growth = Growth, enhance_num = EnhanceNum,
                 tmp_wing_id = TmpWingId, tmp_grade = TmpGrade,
                 tmp_growth = TmpGrowth, star_lev = Star,
                 valid_plan = VL, plan_data = PlanData,
                 lev_break_skill = LevBreakSkill}} ->
            {Skills, TmpSkills} = case lists:keyfind(VL,
                                                     #wing_skill_plan.index,
                                                     PlanData)
                                      of
                                      #wing_skill_plan{skills = TSkills,
                                                       tmp_skills =
                                                           TTmpSkills} ->
                                          {[{TId, Lev}
                                            || #wing_skill{id = TId, lev = Lev}
                                                   <- TSkills],
                                           [{TId, Lev}
                                            || #wing_skill{id = TId, lev = Lev}
                                                   <- TTmpSkills]};
                                      false -> {[], []}
                                  end,
            Msg = {Platform,
                   ZoneId,
                   Id,
                   Grade,
                   WingId,
                   Growth,
                   EnhanceNum,
                   TmpGrade,
                   TmpWingId,
                   TmpGrowth,
                   Star,
                   Skills,
                   TmpSkills,
                   LevBreakSkill},
            {reply, Msg}
    end;
handle(10418, {Platform, ZoneId, Id}, _Role) ->
    case chat_mgr:get_mount_cache(Platform, ZoneId, Id) of
        {error, Reason} ->
            logger:error("查询坐骑信息缓存失败:~w", [Reason], chat_rpc, 754),
            ok;
        {ok, {Mount, AppearanceList, DyeID}} ->
            logger:debug("坐骑信息：~w",
                         [{Mount, AppearanceList, DyeID}],
                         chat_rpc,
                         757),
            {reply,
             {Platform, ZoneId, Id, Mount, AppearanceList, DyeID}}
    end;
handle(10419, {MatchId},
       Role = #role{id = _RoleId, name = _RoleName,
                    s_event = Event}) ->
    logger:debug("同步招募信息:~w", [MatchId], chat_rpc, 762),
    case role_misc:check_cd(rpc_10419) of
        true ->
            MatchType = case team_data:get(MatchId) of
                            #{type := _MatchType} -> _MatchType;
                            _ -> 0
                        end,
            case lists:member(MatchType,
                              [29,
                               30,
                               31,
                               32,
                               33,
                               34,
                               35,
                               36,
                               37,
                               38,
                               39,
                               40,
                               41,
                               42,
                               43,
                               44,
                               45,
                               30,
                               46,
                               47,
                               48,
                               49,
                               50,
                               51,
                               52,
                               53,
                               54,
                               55,
                               56,
                               57,
                               58,
                               59])
                of
                true when Event =:= 56 ->
                    Msg =
                        lang:get("龙王试练好多英雄宝石，差一个实力担当开车啦{face_1,7}{face_1,7}"),
                    chat:send_chat_msg(spirit_treasure, Msg, Role);
                _ ->
                    case lists:member(MatchType,
                                      [100,
                                       101,
                                       102,
                                       103,
                                       104,
                                       105,
                                       106,
                                       107,
                                       108,
                                       109,
                                       110,
                                       111,
                                       112,
                                       113,
                                       114,
                                       115,
                                       116,
                                       101,
                                       117,
                                       118,
                                       119,
                                       120,
                                       121,
                                       122,
                                       123,
                                       124,
                                       125,
                                       126,
                                       127,
                                       128,
                                       129,
                                       130])
                        of
                        true when Event =:= 67 ->
                            Msg =
                                lang:get("天启试练好多英雄宝石，差一个实力担当开车啦{face_1,7}{face_1,7}"),
                            chat:send_chat_msg(oracle_treasure, Msg, Role);
                        _ ->
                            case MatchType of
                                60 ->
                                    Msg =
                                        lang:get("缘定星辰来个有缘人，一起领同心锁{face_1,1}"),
                                    chat:send_chat_msg(world, Msg, Role),
                                    ok;
                                _ ->
                                    case team_data:get_type_name(MatchId) of
                                        #{name := MatchName} ->
                                            Msg = case util:rand(1, 5) of
                                                      1 ->
                                                          notice:format(lang:get("我在~ts中需要你的帮助，快来吧{face_1,7}"),
                                                                        [{string_1,
                                                                          MatchName}]);
                                                      2 ->
                                                          notice:format(lang:get("~ts有人做吗，队伍缺个实力担当{face_1,1}"),
                                                                        [{string_1,
                                                                          MatchName}]);
                                                      3 ->
                                                          notice:format(lang:get("~ts再来一个，准备开车{face_1,7}{face_1,7}"),
                                                                        [{string_1,
                                                                          MatchName}]);
                                                      4 ->
                                                          notice:format(lang:get("~ts马上开车，速来速来{face_1,16}{face_1,16}"),
                                                                        [{string_1,
                                                                          MatchName}]);
                                                      _ ->
                                                          notice:format(lang:get("~ts特快专线，来的速度进组{face_1,15}"),
                                                                        [{string_1,
                                                                          MatchName}])
                                                  end,
                                            chat:send_chat_msg(world,
                                                               Msg,
                                                               Role),
                                            ok;
                                        _ -> ok
                                    end
                            end
                    end
            end;
        false -> ok
    end;
handle(10420, {CI, CP, CZ},
       Role = #role{id = {_, P, Z},
                    m_child = #m_child{kids = Kids}}) ->
    case lists:keyfind({CI, CP, CZ}, #child.id, Kids) of
        Child = #child{} ->
            NewChild1 = child_attr:calc(Child, Role),
            NewChild2 = child_skin:add_skin_attr(NewChild1),
            case chat_mgr:add_child_cache(P, Z, NewChild2) of
                {ok, {_, _, CacheId}} -> {reply, {1, CacheId}};
                _ -> {reply, {0, 0}}
            end;
        _ -> {reply, {0, 0}}
    end;
handle(10421, {Platform, ZoneId, Id}, _Role) ->
    case chat_mgr:get_child_cache(Platform, ZoneId, Id) of
        {error, _Reason} -> ok;
        {ok, Child} -> {reply, {Platform, ZoneId, Id, Child}}
    end;
handle(10422, {Id}, Role) ->
    role:send_buff_begin(),
    case achieve_shop:set_goods(Role, Id) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NewRole};
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            logger:debug("设置错误:~w", [Reason], chat_rpc, 849),
            {reply, {0, Reason}}
    end;
handle(10423, {Type}, Role) ->
    achieve_shop:push_use(Role, Type),
    ok;
handle(10424, {Channel, GroupId, Platform, ZoneId, Msg},
       Role = #role{lev = _})
    when Channel =:= 9 ->
    case friend_group:chat_check(Role,
                                 {GroupId, Platform, ZoneId})
        of
        ok ->
            chat:send_chat_msg({group, {GroupId, Platform, ZoneId}},
                               Msg,
                               Role),
            ok;
        _ -> ok
    end;
handle(10425,
       {Channel,
        GroupId,
        Platform,
        ZoneId,
        Voice,
        VoiceTime,
        VoiceText,
        CacheId},
       Role = #role{lev = _})
    when Channel =:= 9 ->
    case friend_group:chat_check(Role,
                                 {GroupId, Platform, ZoneId})
        of
        ok ->
            case chat_mgr:add_voice_cache({Channel,
                                           {GroupId, Platform, ZoneId}},
                                          Voice,
                                          VoiceTime,
                                          VoiceText,
                                          CacheId,
                                          Role)
                of
                true -> ok;
                _ -> ok
            end;
        _ -> ok
    end;
handle(10426, {Msg}, Role) ->
    case role_misc:check_cd(rpc_10426) of
        true ->
            case chat:rpc_send_screen_msg(Role, Msg) of
                ok -> {reply, {1, ""}};
                {false, Reason} -> {reply, {0, Reason}}
            end;
        false -> ok
    end;
handle(10427, {Platform, ZoneId, Id}, _Role) ->
    case chat_mgr:get_talisman_cache(Platform, ZoneId, Id)
        of
        {error, _Reason} -> ok;
        {ok, Talisman} ->
            {reply, {Platform, ZoneId, Id, Talisman}}
    end;
handle(10428, {}, Role) ->
    case chat_expression:get_new_expression(Role) of
        {error, Reason} ->
            logger:error("获取新表情出错:~w", [Reason], chat_rpc, 900),
            ok;
        {ok, Expression} -> {reply, Expression}
    end;
handle(10430, {Id}, Role) ->
    role:send_buff_begin(),
    case chat_expression:design_exchange(Id, Role) of
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, NRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NRole};
        {error, Err} ->
            role:send_buff_clean(),
            logger:error("指定兑换大表情出错:~w", [Err], chat_rpc, 917),
            ok
    end;
handle(10431, {Type}, Role) ->
    role:send_buff_begin(),
    case chat_expression:compound_expression(Type, Role) of
        {ok, NRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NRole};
        {false, Why} ->
            logger:error("合成表情失败：~ts", [Why], chat_rpc, 929),
            role:send_buff_clean(),
            {reply, {0, Why}};
        {error, Err} ->
            role:send_buff_clean(),
            logger:error("合成表情失败：~w", [Err], chat_rpc, 934),
            ok
    end;
handle(_Code, _Args, _) ->
    logger:debug("收到无效的RPC调用[Code:~w][Args:~w]",
                 [_Code, _Args],
                 chat_rpc,
                 939),
    ok.

type_to_labal(1) -> world;
type_to_labal(3) -> map;
type_to_labal(2) -> team;
type_to_labal(4) -> guild.

