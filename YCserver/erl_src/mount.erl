-file("src/mod/mount/mount.erl", 1).

-module(mount).

-export([init/0,
         create_mount/1,
         get_look/1,
         check_active_mount/2,
         login/1,
         apply_evt/2,
         apply_cost_spirit/2,
         calc_ride_status/1,
         daily_reset/2,
         add_mount_spirit/2,
         add_mount_spirit/3,
         levup/3,
         add_mount_appearance/3,
         get_mount_skills/1,
         get_mount_combat_skills/1,
         free_pet/2,
         mount_count/2,
         fly_notice/1,
         set_mount_lev/3,
         mount_classes_modify/2,
         fix_elk_appearance/1,
         do_fix_elk_appearance/1,
         check_manger/2,
         calc_collect_val/1,
         push_double_ride_look/1,
         apply_invite/3,
         apply_exit/1,
         exit_double_ride/1,
         get_double_look/1,
         reset_double_ride/1,
         away_exit_ride/1,
         check_passager/1,
         check_driver/1,
         check_driver_ride/1,
         check_transfrom/2,
         fix_mount/0,
         fix_mount/1,
         gm_expire/1,
         gm_levelUp/3,
         delay_login/1,
         expire_sprog/1,
         mount_decorate_appearance/1]).

-export([rpc_get_egg/1,
         rpc_hatch/1,
         rpc_ride/2,
         rpc_levup_mount/3,
         rpc_break_through/2,
         rpc_aaptitude/2,
         rpc_train/2,
         rpc_use_decorate/3,
         rpc_upgrade_skill/3,
         rpc_rand_skill/4,
         rpc_init_skill_point/3,
         rpc_managet_pet/3,
         rpc_free_pet/3,
         rpc_transfrom_appearance/3,
         rpc_synthetise_appearance/2,
         rpc_set_decorate_hide/4,
         rpc_get_sprog_mount/2,
         rpc_convert_sprog/2,
         rpc_sprog_expire/1,
         push_mount/1,
         mount_dye/2,
         mount_dye_confirm/4,
         mount_dye_cancel/2,
         mount_dye_reset/2,
         rpc_buy_mount_evolution/2,
         rpc_mount_evolution/2,
         rpc_invite_rode/2,
         rpc_is_join_rode/3,
         rpc_exit_rode/1,
         batch_login/0]).

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

-file("src/mod/mount/mount.erl", 94).

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

-file("src/mod/mount/mount.erl", 95).

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

-file("src/mod/mount/mount.erl", 96).

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

-file("src/mod/mount/mount.erl", 97).

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

-file("src/mod/mount/mount.erl", 98).

-file("inc/looks.hrl", 1).

-file("src/mod/mount/mount.erl", 99).

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

-file("src/mod/mount/mount.erl", 100).

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

-file("src/mod/mount/mount.erl", 101).

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

-file("src/mod/mount/mount.erl", 102).

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

-file("src/mod/mount/mount.erl", 103).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/mount/mount.erl", 104).

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

-file("src/mod/mount/mount.erl", 105).

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

-file("src/mod/mount/mount.erl", 106).

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

-file("src/mod/mount/mount.erl", 107).

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

-file("src/mod/mount/mount.erl", 108).

-file("inc/query.hrl", 1).

-record(name_index,
        {name = "" :: list(),
         id = 0 :: non_neg_integer(),
         acc = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(id_index,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         acc = "" :: list(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(acc_index,
        {acc = {"", "", 0} ::
             {list(), list(), non_neg_integer()},
         id = 0 :: non_neg_integer(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/mod/mount/mount.erl", 109).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/mod/mount/mount.erl", 110).

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

-file("src/mod/mount/mount.erl", 111).

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

-file("src/mod/mount/mount.erl", 112).

-file("inc/trial.hrl", 1).

-record(trial_unit,
        {battle_id = 0,
         unit_id = 0,
         unit_baseid = 0,
         unit_name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         dir = 0,
         looks = [],
         map_id = 0,
         x = 0,
         y = 0}).

-record(m_trial,
        {ver = 3,
         mode = 0,
         order = 0,
         fighter,
         unit = #trial_unit{},
         direct_order = 0,
         clear_normal = 0,
         round = 0,
         times = 2,
         coin = 0,
         reset = 2,
         max_order_easy = 0,
         max_order_hard = 0,
         has_match = [],
         is_helped = "",
         gain_items = []}).

-record(trial_help,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         unit_id = 0,
         battle_id = 0,
         unit_name = "",
         time = 0}).

-file("src/mod/mount/mount.erl", 113).

init() -> #m_mount{}.

login(Role = #role{lev = RoleLev}) when RoleLev < 7 ->
    {ok, Role};
login(Role = #role{m_mount = #m_mount{mounts = Mounts},
                   m_pet = #m_pet{pets = Pets}}) ->
    TriggerEgg = case lists:keymember(1,
                                      #mount.live_status,
                                      Mounts)
                     of
                     true ->
                         [#trigger{label = evt_mount_combat, a = [], m = mount,
                                   f = apply_evt},
                          #trigger{label = evt_commit_quest, a = [], m = mount,
                                   f = apply_evt}];
                     false -> []
                 end,
    TriggerSpirit = [#trigger{label = evt_mount_combat,
                              a = [], m = mount, f = apply_cost_spirit}],
    L = TriggerEgg ++ TriggerSpirit,
    {_, TrgRole} = role_trigger:add(L, Role),
    Fun = fun (#mount{manger_pets = ManagerPets}, Rtl) ->
                  InvalidPetIds = [PetId
                                   || PetId <- ManagerPets,
                                      lists:keymember(PetId, #pet.id, Pets) =:=
                                          false],
                  InvalidPetIds ++ Rtl;
              (_, Rtl) -> Rtl
          end,
    InvalidPetIds = lists:foldl(Fun, [], Mounts),
    FreePetFun = fun (PetId, FreeRole) ->
                         free_pet(FreeRole, PetId)
                 end,
    FreePetRole = lists:foldl(FreePetFun,
                              TrgRole,
                              InvalidPetIds),
    ScoreMountRole =
        mount_attr:update_mount_score(FreePetRole),
    AppearanceRole =
        convert_appearence_list(ScoreMountRole),
    ExpireAppanceRole = expire_appance(AppearanceRole),
    PetRole = mount_attr:batch_calc_pet(ExpireAppanceRole),
    NewPetRole = repair_mount_decorate_appearance(PetRole),
    mount_goal:login(NewPetRole).

delay_login(Role = #role{charge = Charge})
    when Charge >= 2000 ->
    logger:debug("补发充值坐骑奖励", [], mount, 171),
    {ok, Role1} = expire_sprog(Role),
    Flag = var:get_var(Role1, other, 2102, 0),
    case Flag =:= 0 of
        true ->
            Role2 = var:set_var(Role1, other, 2102, 1),
            Title = lang:get("Q萌小兔坐骑"),
            Content =
                lang:get("亲爱的玩家：\n Q萌的小兔坐骑降临星辰啦！{face_1, 117}\n "
                         "您已达到获取条件，特为你发放小兔坐骑，快去和她见面吧！{face_1, "
                         "3}"),
            mail:send(Role2,
                      #{title => Title, content => Content,
                        items => [{23676, 1, 1}]}),
            Role3 =
                mount_goal:calc_can_do(mount_data:list_goal(100),
                                       Role2,
                                       push),
            {ok, Role3};
        false ->
            logger:debug("已经发放过坐骑奖励", [], mount, 184),
            {ok, Role1}
    end;
delay_login(Role = #role{lev = RoleLev})
    when RoleLev >= 30 ->
    logger:debug("补发充值坐骑奖励", [], mount, 188),
    {ok, Role1} = expire_sprog(Role),
    Flag = var:get_var(Role1, other, 2102, 0),
    case Flag =:= 0 of
        true ->
            Role2 = var:set_var(Role1, other, 2102, 1),
            Role3 =
                mount_goal:calc_can_do(mount_data:list_goal(100),
                                       Role2,
                                       push),
            {ok, Role3};
        false ->
            logger:debug("已经发放过坐骑奖励", [], mount, 198),
            {ok, Role1}
    end;
delay_login(Role = #role{charge = Charge,
                         lev = RoleLev})
    when Charge < 2000 andalso RoleLev < 30 ->
    logger:debug("补发充值坐骑奖励", [], mount, 202),
    {ok, Role1} = expire_sprog(Role),
    Flag = var:get_var(Role1, other, 2102, 0),
    case Flag =:= 0 of
        true ->
            Role2 = var:set_var(Role1, other, 2102, 1),
            {ok, Role2};
        false ->
            logger:debug("已经发放过坐骑奖励", [], mount, 211),
            {ok, Role1}
    end;
delay_login(Role) ->
    {ok, Role1} = expire_sprog(Role),
    Role2 = var:set_var(Role1, other, 2102, 1),
    Role3 =
        mount_goal:calc_can_do(mount_data:list_goal(100),
                               Role2,
                               push),
    {ok, Role3}.

levup(Role, _L, NewLev) ->
    mount_goal:levup(Role, NewLev).

fix_elk_appearance(RoleId) ->
    case role_query:pid(by_id, RoleId) of
        {ok, RolePid} ->
            role:apply(async,
                       RolePid,
                       {mount, do_fix_elk_appearance, []}),
            ok;
        _ ->
            logger:info("玩家不在线", [], mount, 233),
            ok
    end.

do_fix_elk_appearance(Role = #role{name = RoleName,
                                   m_mount =
                                       MMount = #m_mount{appearance_list =
                                                             AppearanceList,
                                                         mounts = Mounts}}) ->
    case lists:keymember(2018, 1, AppearanceList) of
        true ->
            NewMounts = [Mount#mount{transformation_id = 0}
                         || Mount <- Mounts],
            NewAppearanceList = lists:keydelete(2018,
                                                1,
                                                AppearanceList),
            NewMMount = MMount#m_mount{appearance_list =
                                           NewAppearanceList,
                                       mounts = NewMounts},
            MountRole = Role#role{m_mount = NewMMount},
            NewRole = attr:calc_and_push(MountRole),
            LookRole = looks:calc(NewRole),
            looks:update_looks(Role, LookRole),
            push_mount(LookRole),
            Title = lang:get("金勾贝贝幻化"),
            Content =
                lang:get("亲爱的玩家朋友，金勾贝贝属于一级保护坐骑，无法使用万能元神兑换，系统现已经修复该问题，并需"
                         "要召回您使用万能元神兑换的金勾贝贝，为此我们返还您所有消耗的万能元神并额外附上金勾贝贝元神"
                         "1个，助您更快与贝贝重逢！"),
            Items = [{23660, 0, 5}, {23670, 0, 1}],
            mail:send(LookRole,
                      #{title => Title, content => Content, items => Items}),
            logger:info("删除[~ts]的金勾贝贝,并返回~w",
                        [RoleName, Items],
                        mount,
                        252),
            {ok, LookRole};
        _ ->
            logger:info("玩家身上没有2018的幻化", [], mount, 255),
            ok
    end.

add_mount_appearance(Role, AppearanceId) ->
    add_mount_appearance(Role, AppearanceId, 0).

add_mount_appearance(Role = #role{m_mount =
                                      MMount = #m_mount{appearance_list =
                                                            AppearanceList}},
                     AppearanceId, ExpireTime) ->
    case lists:keyfind(AppearanceId, 1, AppearanceList) of
        {_, 0} -> {false, lang:get("您已经拥有了此幻化，不需要重复使用")};
        {_, OldExpireTime} ->
            Now = date:unixtime(),
            NewExpireTime = case ExpireTime of
                                0 -> 0;
                                _ -> max(OldExpireTime, Now) + ExpireTime
                            end,
            NewAppearanceList = lists:keyreplace(AppearanceId,
                                                 1,
                                                 AppearanceList,
                                                 {AppearanceId, NewExpireTime}),
            NewMMount = MMount#m_mount{appearance_list =
                                           NewAppearanceList},
            MountRole = Role#role{m_mount = NewMMount},
            AchieveRole =
                role_trigger:fire(#evt_mount_appearand{count =
                                                           length(AppearanceList)
                                                               + 1},
                                  MountRole),
            NewRole = attr:calc_and_push(AchieveRole),
            push_mount(NewRole),
            {ok, NewRole};
        false ->
            Now = date:unixtime(),
            SetExpireTime = case ExpireTime of
                                0 -> 0;
                                _ -> Now + ExpireTime
                            end,
            NewMMount = MMount#m_mount{appearance_list =
                                           [{AppearanceId, SetExpireTime}
                                            | AppearanceList]},
            MountRole = Role#role{m_mount = NewMMount},
            CollectValRole = case
                                 mount_data:get_appearance_collect_val(AppearanceId)
                                 of
                                 Val when Val =/= 0 andalso ExpireTime =:= 0 ->
                                     fashion:add_mount_appearance_collect_val(MountRole,
                                                                              Val);
                                 _ -> MountRole
                             end,
            AchieveRole =
                role_trigger:fire(#evt_mount_appearand{count =
                                                           length(AppearanceList)
                                                               + 1},
                                  CollectValRole),
            NewRole = attr:calc_and_push(AchieveRole),
            push_mount(NewRole),
            {ok, NewRole}
    end.

get_mount_skills(#role{m_mount =
                           #m_mount{mounts = Mounts}}) ->
    MountFun = fun (#mount{live_status = 3,
                           skill_list = SkillList},
                    R) ->
                       Fun = fun (#mount_skill{skill_id = SkillId,
                                               skill_lev = SkillLev}) ->
                                     case skill_data:get_mount({SkillId,
                                                                SkillLev})
                                         of
                                         #{effect_type := 1} -> true;
                                         _ -> false
                                     end
                             end,
                       MSkList = lists:filter(Fun, SkillList),
                       MSkList ++ R;
                   (_, R) -> R
               end,
    lists:foldl(MountFun, [], Mounts).

get_mount_combat_skills(#role{m_mount =
                                  #m_mount{mounts = Mounts}}) ->
    MountFun = fun (#mount{live_status = 3,
                           skill_list = SkillList},
                    R) ->
                       Fun = fun (#mount_skill{skill_id = SkillId,
                                               skill_lev = SkillLev},
                                  List) ->
                                     case skill_data:get_mount({SkillId,
                                                                SkillLev})
                                         of
                                         #{effect_type := 1} ->
                                             [{SkillId, SkillLev} | List];
                                         _ -> List
                                     end
                             end,
                       MSkList = lists:foldl(Fun, [], SkillList),
                       MSkList ++ R;
                   (_, R) -> R
               end,
    lists:foldl(MountFun, [], Mounts).

free_pet(Role = #role{m_mount =
                          #m_mount{mounts = Mounts}},
         PetId) ->
    Fun = fun (#mount{manger_pets = ElmMngPets}) ->
                  lists:member(PetId, ElmMngPets);
              (_) -> false
          end,
    MngPetMount = lists:filter(Fun, Mounts),
    case MngPetMount of
        [#mount{index = MountIndex}] ->
            case do_free_pet(Role, MountIndex, PetId) of
                {ok, NewRole} ->
                    push_mount(NewRole, MountIndex),
                    NewRole;
                {false, Reason} ->
                    logger:error("解除羁绊时出错:~w", [Reason], mount, 352),
                    Role
            end;
        _ -> Role
    end.

daily_reset(Role, _) ->
    CombatActiveTimeRole = reset_combat_active_times(Role),
    restore_spirit(CombatActiveTimeRole).

create_mount(#role{lev = RoleLev}) when RoleLev < 75 ->
    {false, lang:get("您的等级未达到坐骑开放等级，继续努力哦!")};
create_mount(Role = #role{classes = Classes,
                          m_mount =
                              MMount = #m_mount{next_mount_id = NextId,
                                                mounts = Mounts}}) ->
    case do_create_mount(NextId, Classes) of
        {ok, Mount = #mount{}} ->
            MountRole = Role#role{m_mount =
                                      MMount#m_mount{next_mount_id = NextId + 1,
                                                     mounts =
                                                         [Mount | Mounts]}},
            MountCount = mount_count(MountRole, 1),
            AchieveRole = role_trigger:fire(#evt_own_mount{status =
                                                               1,
                                                           count = MountCount},
                                            MountRole),
            EvtList = [#trigger{label = evt_mount_combat, a = [],
                                m = mount, f = apply_evt},
                       #trigger{label = evt_commit_quest, a = [], m = mount,
                                f = apply_evt}],
            {_, NewRole} = role_trigger:add(EvtList, AchieveRole),
            push_mount(NewRole),
            log:log_mount(NewRole, "创建", NextId),
            {ok, NewRole};
        {false, Reason} ->
            logger:error("创建坐骑失败:~w", [Reason], mount, 386),
            {false, Reason}
    end.

create_sprog_mount(_KeyId, #role{lev = RoleLev})
    when RoleLev < 7 ->
    {false, 0, lang:get("您的等级未达到坐骑开放等级，继续努力哦!")};
create_sprog_mount(KeyId,
                   Role = #role{classes = Classes,
                                m_mount =
                                    MMount = #m_mount{mounts = Mounts}}) ->
    case do_create_sprog_mount(Classes, KeyId) of
        {ok,
         Mount = #mount{mount_base_id = BaseId,
                        expire_time = ExpireTime}} ->
            MRole = Role#role{m_mount =
                                  MMount#m_mount{mounts = [Mount | Mounts],
                                                 pre_mount_status = 1}},
            Timer = #timer{id = mount_expire,
                           timeout = 1000 * (ExpireTime - date:unixtime()),
                           m = mount, f = expire_sprog, a = []},
            MountRole = role_timer:add(Timer, MRole),
            NewRole = role_trigger:fire(#evt_sprog_mount{},
                                        MountRole),
            push_mount(NewRole),
            log:log_mount(NewRole, "限时新手坐骑", 100),
            {ok, BaseId, NewRole};
        {false, Reason} ->
            logger:error("创建新手坐骑失败:~w", [Reason], mount, 404),
            {false, 0, Reason}
    end.

convert_sprog_mount(_KeyId, #role{lev = RoleLev})
    when RoleLev < 7 ->
    {false, 0, lang:get("您的等级未达到坐骑开放等级，继续努力哦!")};
convert_sprog_mount(KeyId,
                    Role = #role{classes = Classes,
                                 m_mount =
                                     MMount = #m_mount{mounts = Mounts}}) ->
    case do_convert_sprog_mount(Classes, KeyId) of
        {ok, Mount = #mount{mount_base_id = BaseId}} ->
            MRole = Role#role{m_mount =
                                  MMount#m_mount{mounts = [Mount | Mounts],
                                                 pre_mount_status = 2}},
            push_mount(MRole),
            log:log_mount(MRole, "永久新手坐骑", 100),
            {ok, BaseId, MRole};
        {false, Reason} ->
            logger:error("兑换永久新手坐骑失败:~w", [Reason], mount, 419),
            {false, 0, Reason}
    end.

apply_evt(#evt_mount_combat{combat_type = CombatType,
                            is_win = 1},
          Role) ->
    case mount_data:get_combat_egg_val(CombatType) of
        false -> ok;
        {Val, Ratio, _} when is_integer(Val) ->
            case util:rand(0, 1000) < Ratio of
                true -> check_active_mount(Role, CombatType, Val);
                false -> ok
            end;
        _ -> ok
    end;
apply_evt(#evt_commit_quest{sec_type = QuestType},
          Role) ->
    logger:debug("收到任务的监听=========收到任务的监听=========收到任务的监听======"
                 "===收到任务的监听=========",
                 [],
                 mount,
                 435),
    CombatType = case QuestType of
                     4 -> 10000;
                     12 -> 10001;
                     _ -> false
                 end,
    case CombatType =/= false of
        true ->
            case mount_data:get_combat_egg_val(CombatType) of
                false -> ok;
                {Val, Ratio, _} when is_integer(Val) ->
                    case util:rand(0, 1000) < Ratio of
                        true -> check_active_mount(Role, CombatType, Val);
                        false -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end;
apply_evt(_, _Role) -> ok.

add_mount_spirit(Role = #role{m_mount =
                                  MMount = #m_mount{mounts = Mounts}},
                 AddVal) ->
    {NewMounts, IsCalc} = opt_mount_spirit(Mounts, AddVal),
    MountRole = Role#role{m_mount =
                              MMount#m_mount{mounts = NewMounts}},
    NewRole = case IsCalc of
                  true ->
                      AttrRole = attr:calc_and_push(MountRole),
                      mount_attr:batch_calc_pet(AttrRole);
                  _ -> MountRole
              end,
    push_mount(NewRole),
    {ok, NewRole}.

add_mount_spirit(Role = #role{m_mount =
                                  MMount = #m_mount{mounts = Mounts}},
                 Index, AddVal) ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{live_status = 3, spirit = Spirit,
                       mount_base_id = BaseId,
                       transformation_id = TransformationId} ->
            NewSpirit = max(min(Spirit + AddVal, 500), 0),
            NewMount = Mount#mount{spirit = NewSpirit},
            NewMounts = lists:keystore(Index,
                                       #mount.index,
                                       Mounts,
                                       NewMount),
            MountRole = Role#role{m_mount =
                                      MMount#m_mount{mounts = NewMounts}},
            AttrRole = case is_need_calc_attr(Spirit, AddVal) of
                           2 ->
                               attr:calc_and_push(MountRole),
                               mount_attr:batch_calc_pet(MountRole);
                           1 ->
                               attr:calc_and_push(MountRole),
                               mount_attr:batch_calc_pet(MountRole);
                           _ ->
                               logger:debug("=======:", [], mount, 490),
                               MountRole
                       end,
            push_mount(AttrRole, Index),
            UseMountId = case TransformationId =:= 0 of
                             true -> BaseId;
                             false -> TransformationId
                         end,
            MountName = case mount_data:get(UseMountId) of
                            #{name := _MountName} -> _MountName;
                            _ -> lang:get("无名坐骑")
                        end,
            NoticeMsg =
                notice:format(lang:get("您的~ts坐骑食用了坐骑口粮，恢复了~ts精力值"),
                              [{string_2, 1, MountName},
                               {string_2, 1, AddVal}]),
            notice:send(AttrRole, 3, NoticeMsg),
            {ok, AttrRole};
        _ -> {false, lang:get("您还未获得该坐骑，继续努力哦")}
    end.

opt_mount_spirit(Mounts, AddVal) ->
    opt_mount_spirit(Mounts, AddVal, [], false).

opt_mount_spirit([], _AddVal, NewMounts, IsCalc) ->
    {NewMounts, IsCalc};
opt_mount_spirit([Mount = #mount{spirit = Spirit,
                                 live_status = 3, index = Index}
                  | Rest],
                 AddVal, NewMounts, _IsCalc)
    when Index =/= 100 ->
    NewSpirit = max(min(Spirit + AddVal, 500), 0),
    IsNeedCalc = case is_need_calc_attr(Spirit, AddVal) of
                     2 -> true;
                     1 -> true;
                     _ -> false
                 end,
    NewMount = Mount#mount{spirit = NewSpirit},
    opt_mount_spirit(Rest,
                     AddVal,
                     [NewMount | NewMounts],
                     IsNeedCalc);
opt_mount_spirit([_Mount = #mount{} | Rest], AddVal,
                 NewMounts, _IsCalc) ->
    NewMount = _Mount#mount{},
    opt_mount_spirit(Rest,
                     AddVal,
                     [NewMount | NewMounts],
                     _IsCalc).

apply_cost_spirit(#evt_mount_combat{combat_type =
                                        CombatType},
                  Role) ->
    logger:debug("战斗扣除精力值判断:~w", [CombatType], mount, 528),
    case mount_data:get_combat_cost_spirit(CombatType) of
        {RatioCfg, Val} ->
            case util:rand(0, 1000) < RatioCfg of
                true -> add_mount_spirit(Role, -Val);
                false -> ok
            end;
        _ -> ok
    end.

check_active_mount(Role = #role{id = RoleId,
                                m_mount =
                                    MMount = #m_mount{mounts = Mounts,
                                                      combat_active_times =
                                                          CombatActiveTimes}},
                   CombatType, Val) ->
    case lists:keyfind(1, #mount.live_status, Mounts) of
        Mount = #mount{index = Index} ->
            logger:debug("加坐骑灵犀值:~w", [Val], mount, 543),
            Result = case lists:keyfind(CombatType,
                                        1,
                                        CombatActiveTimes)
                         of
                         {_, Times} ->
                             case mount_data:get_combat_egg_val(CombatType) of
                                 {_, _, TimesCfg} when Times >= TimesCfg ->
                                     false;
                                 _ -> {true, Times}
                             end;
                         _ -> {true, 0}
                     end,
            case Result of
                false -> {ok, Role};
                {true, ActiveTimes} ->
                    NewMount = do_active_mount(RoleId, Mount, Val),
                    NewCombatActiveTimes = lists:keystore(CombatType,
                                                          1,
                                                          CombatActiveTimes,
                                                          {CombatType,
                                                           ActiveTimes + 1}),
                    NewMounts = lists:keystore(Index,
                                               #mount.index,
                                               Mounts,
                                               NewMount),
                    NewRole = Role#role{m_mount =
                                            MMount#m_mount{mounts = NewMounts,
                                                           combat_active_times =
                                                               NewCombatActiveTimes}},
                    push_mount(NewRole),
                    {ok, NewRole};
                _Err -> logger:error("匹配错误:~w", [_Err], mount, 568)
            end;
        _ -> {ok, Role}
    end.

check_active_mount(Role = #role{id = RoleId,
                                m_mount = MMount = #m_mount{mounts = Mounts}},
                   Val) ->
    case lists:keyfind(1, #mount.live_status, Mounts) of
        Mount = #mount{index = Index} ->
            NewMount = do_active_mount(RoleId, Mount, Val),
            NewMounts = lists:keystore(Index,
                                       #mount.index,
                                       Mounts,
                                       NewMount),
            NewRole = Role#role{m_mount =
                                    MMount#m_mount{mounts = NewMounts}},
            push_mount(NewRole),
            {ok, NewRole};
        _ -> {ok, Role}
    end.

mount_classes_modify(Role = #role{classes = OldClasses,
                                  m_mount =
                                      MMount = #m_mount{mounts = Mounts,
                                                        appearance_list =
                                                            AppearanceList}},
                     TargetClass) ->
    NewMounts = mount_classes_modify(OldClasses,
                                     TargetClass,
                                     Mounts,
                                     []),
    NewAppearanceList =
        mount_appearance_classes_modify(Mounts,
                                        NewMounts,
                                        AppearanceList,
                                        []),
    logger:debug("转职前:~w, 转职后:~w",
                 [AppearanceList, NewAppearanceList],
                 mount,
                 594),
    NewMounts1 = check_appearance(NewMounts,
                                  NewAppearanceList,
                                  []),
    NewRole = Role#role{m_mount =
                            MMount#m_mount{mounts = NewMounts1,
                                           appearance_list =
                                               NewAppearanceList}},
    push_mount(NewRole),
    NewRole.

rpc_get_egg(Role = #role{m_mount =
                             #m_mount{next_mount_id = MountIndex}}) ->
    GoalList = mount_data:list_goal(MountIndex),
    case mount_goal:check_complete_goal(Role, GoalList) of
        true ->
            Loss = case mount_data:get_lev({0, MountIndex}) of
                       #{lev_cost := Cost} -> format:val_to_loss(Cost);
                       _ -> []
                   end,
            case role_gain:do(Loss, Role) of
                {ok, LossRole} -> create_mount(LossRole);
                {false, #loss{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("扣除资源失败")}
            end;
        false -> {false, lang:get("您还未完成所有目标呢，不能进行孵化")}
    end.

rpc_get_sprog_mount(KeyId,
                    Role = #role{m_mount =
                                     #m_mount{pre_mount_status = Status,
                                              mounts = Mounts}}) ->
    case Status of
        0 -> create_sprog_mount(KeyId, Role);
        1 -> {false, 0, lang:get("已经领取过新手坐骑，不能重复领取")};
        2 ->
            case lists:keyfind(100, #mount.index, Mounts) of
                #mount{mount_base_id = BaseId} ->
                    NewRole = role_trigger:fire(#evt_sprog_mount{}, Role),
                    {ok, BaseId, NewRole};
                _ -> {false, 0, lang:get("坐骑信息出错")}
            end
    end.

rpc_convert_sprog(KeyId,
                  Role = #role{m_mount =
                                   MMount = #m_mount{pre_mount_status = Status,
                                                     mounts = Mounts,
                                                     ride_mount =
                                                         RideMount}}) ->
    GoalList = mount_data:list_goal(100),
    case mount_goal:check_complete_goal(Role, GoalList) of
        true ->
            case Status of
                0 ->
                    Loss = case mount_data:get_lev({0, 100}) of
                               #{lev_cost := Cost} -> format:val_to_loss(Cost);
                               _ -> []
                           end,
                    case role_gain:do(Loss, Role) of
                        {ok, LossRole} -> convert_sprog_mount(KeyId, LossRole);
                        {false, #loss{msg = Msg}} -> {false, 0, Msg};
                        _ -> {false, 0, lang:get("扣除资源失败")}
                    end;
                1 ->
                    case lists:keyfind(100, #mount.index, Mounts) of
                        M = #mount{} ->
                            NewMounts = delete_expmount([M], Mounts),
                            MountRole = case RideMount of
                                            100 ->
                                                Role#role{m_mount =
                                                              MMount#m_mount{mounts
                                                                                 =
                                                                                 NewMounts,
                                                                             pre_mount_status
                                                                                 =
                                                                                 0,
                                                                             ride_mount
                                                                                 =
                                                                                 0},
                                                          s_ride = 0};
                                            _ ->
                                                Role#role{m_mount =
                                                              MMount#m_mount{mounts
                                                                                 =
                                                                                 NewMounts,
                                                                             pre_mount_status
                                                                                 =
                                                                                 0}}
                                        end,
                            TimerRole = role_timer:del(mount_expire, MountRole),
                            AttrRole = attr:calc_and_push(TimerRole),
                            LookRole = looks:calc(AttrRole),
                            looks:update_looks(Role, LookRole),
                            Loss = case mount_data:get_lev({0, 100}) of
                                       #{lev_cost := Cost} ->
                                           format:val_to_loss(Cost);
                                       _ -> []
                                   end,
                            case role_gain:do(Loss, LookRole) of
                                {ok, LossRole} ->
                                    convert_sprog_mount(KeyId, LossRole);
                                {false, #loss{msg = Msg}} -> {false, 0, Msg};
                                _ -> {false, 0, lang:get("扣除资源失败")}
                            end;
                        _ -> {false, 0, lang:get("坐骑信息出错")}
                    end;
                2 -> {false, 0, lang:get("你已经激活了永久新手坐骑，不用领取了")}
            end;
        false -> {false, 0, lang:get("您还未完成所有目标呢，不能进行孵化")}
    end.

rpc_sprog_expire(#role{m_mount =
                           #m_mount{mounts = Mounts,
                                    pre_mount_status = Status}}) ->
    case Status of
        0 ->
            logger:debug("===", [], mount, 713),
            {0, 0, 0};
        1 ->
            case check_sprog_expire(Mounts, []) of
                [H = {_F, _B, _T} | _] -> H;
                [] -> {2, 0, 0};
                _ -> {false, lang:get("新手坐骑时间配置出错")}
            end;
        2 -> {2, 0, 0};
        _ -> {false, lang:get("新手坐骑状态出错")}
    end.

rpc_hatch(Role = #role{m_mount =
                           MMount = #m_mount{mounts = Mounts}}) ->
    case lists:keyfind(2, #mount.live_status, Mounts) of
        Mount = #mount{index = Index, mount_base_id = BaseId} ->
            ActiveMount = Mount#mount{live_status = 3},
            ScoreMount = mount_attr:update_mount_score(ActiveMount),
            NewMount = ScoreMount,
            NewMounts = lists:keyreplace(Index,
                                         #mount.index,
                                         Mounts,
                                         NewMount),
            MountRole = Role#role{m_mount =
                                      MMount#m_mount{mounts = NewMounts}},
            MountCount = mount_count(MountRole, 3),
            AchieveRole = role_trigger:fire(#evt_own_mount{status =
                                                               3,
                                                           count = MountCount},
                                            MountRole),
            push_mount(AchieveRole, Index),
            log:log_mount(AchieveRole, "孵化", Index),
            {ok, AchieveRole, BaseId};
        _ -> {false, lang:get("您的坐骑未达到孵化条件，请继续努力")}
    end.

rpc_ride(Role = #role{m_mount =
                          MMount = #m_mount{mounts = Mounts,
                                            ride_mount = RideMount}},
         Index) ->
    case RideMount =/= Index of
        true ->
            case Index of
                0 ->
                    MountRole = Role#role{m_mount =
                                              MMount#m_mount{ride_mount =
                                                                 Index}},
                    {ok, NRole} = exit_double_ride(MountRole),
                    NewRole = calc_ride_status(NRole),
                    push_mount(NewRole),
                    {ok, NewRole};
                100 ->
                    logger:debug("===", [], mount, 769),
                    case lists:keyfind(100, #mount.index, Mounts) of
                        #mount{live_status = 3, mount_base_id = BaseId,
                               transformation_id = TransformationId} ->
                            MountRole = Role#role{m_mount =
                                                      MMount#m_mount{ride_mount
                                                                         =
                                                                         100}},
                            MountName = case TransformationId =:= 0 of
                                            true ->
                                                case
                                                    mount_data:get_sprog_mount_name(BaseId)
                                                    of
                                                    false -> lang:get("无名坐骑");
                                                    _Name -> _Name
                                                end;
                                            false ->
                                                case
                                                    mount_data:get(TransformationId)
                                                    of
                                                    #{name := _Name} -> _Name;
                                                    _ -> lang:get("无名坐骑")
                                                end
                                        end,
                            NoticeMsg =
                                notice:format(lang:get("骑乘~ts，威风凛凛{face_1,18}"),
                                              [{string_2, 5, MountName}]),
                            notice:return(NoticeMsg),
                            RideRole = calc_ride_status(MountRole),
                            push_mount(RideRole),
                            {ok, RideRole};
                        _Err ->
                            logger:debug("查询坐骑匹配错误:~w", [_Err], mount, 791),
                            {false, lang:get("您的坐骑未激活，不能骑乘")}
                    end;
                _ ->
                    case lists:keyfind(Index, #mount.index, Mounts) of
                        #mount{live_status = 1} ->
                            {false, lang:get("您的坐骑未孵化，不能骑乘")};
                        #mount{live_status = 2} ->
                            {false, lang:get("您的坐骑未孵化，不能骑乘")};
                        #mount{live_status = 3, mount_base_id = BaseId,
                               transformation_id = TransformationId} ->
                            MountRole = Role#role{m_mount =
                                                      MMount#m_mount{ride_mount
                                                                         =
                                                                         Index}},
                            UseMountId = case TransformationId =:= 0 of
                                             true -> BaseId;
                                             false -> TransformationId
                                         end,
                            MountName = case mount_data:get(UseMountId) of
                                            #{name := _Name} -> _Name;
                                            _ -> lang:get("无名坐骑")
                                        end,
                            NoticeMsg =
                                notice:format(lang:get("骑乘~ts，威风凛凛{face_1,18}"),
                                              [{string_2, 5, MountName}]),
                            notice:return(NoticeMsg),
                            RideRole = calc_ride_status(MountRole),
                            push_mount(RideRole),
                            {ok, RideRole};
                        _Err ->
                            logger:debug("查询坐骑匹配错误:~w", [_Err], mount, 818),
                            {false, lang:get("您的坐骑未激活，不能骑乘")}
                    end
            end;
        false -> {false, lang:get("")}
    end.

rpc_levup_mount(Role, Index, IsSureSuccess) ->
    case Index =:= 100 of
        true -> {false, lang:get("新手坐骑不能升级")};
        false ->
            case check_mount_levup(Role, Index) of
                true -> mount_levup(Role, Index, IsSureSuccess);
                {false, Reason} -> {false, Reason};
                _Err -> logger:error("升级坐骑错误:~w", [_Err], mount, 837)
            end
    end.

rpc_break_through(Role = #role{classes = Classes,
                               m_mount = MMount = #m_mount{mounts = Mounts}},
                  Index)
    when Index =/= 100 ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{lev = Lev, upgrade_lev = UpLev} ->
            case mount_data:get_lev({Lev, Index}) of
                #{is_up_lev := IsUpLev, upgrade_cost := Cost,
                  skill_cnt := SkillCnt} ->
                    case IsUpLev =/= 0 of
                        true ->
                            case Lev =/= UpLev of
                                true ->
                                    Loss = format:val_to_loss(Cost),
                                    case role_gain:do_notice(Loss, Role) of
                                        {ok, LossRole} ->
                                            OldSkillCnt = case
                                                              mount_data:get_lev({UpLev,
                                                                                  Index})
                                                              of
                                                              #{skill_cnt :=
                                                                    TmpOldSkillCnt} ->
                                                                  TmpOldSkillCnt;
                                                              _ -> SkillCnt
                                                          end,
                                            SkillMount = #mount{skill_list =
                                                                    NewSkillList} =
                                                             case OldSkillCnt <
                                                                      SkillCnt
                                                                 of
                                                                 true ->
                                                                     produce_mount_skill(Mount,
                                                                                         Classes,
                                                                                         OldSkillCnt
                                                                                             +
                                                                                             1,
                                                                                         SkillCnt);
                                                                 false -> Mount
                                                             end,
                                            UpgradeMount =
                                                SkillMount#mount{upgrade_lev =
                                                                     Lev},
                                            ScoreMount =
                                                mount_attr:update_mount_score(UpgradeMount),
                                            NewMount = ScoreMount,
                                            NewMounts = lists:keyreplace(Index,
                                                                         #mount.index,
                                                                         Mounts,
                                                                         NewMount),
                                            MountRole = LossRole#role{m_mount =
                                                                          MMount#m_mount{mounts
                                                                                             =
                                                                                             NewMounts}},
                                            MountRole1 =
                                                mount_attr:calc_skill_prac(MountRole),
                                            AttrRole =
                                                attr:calc_and_push(MountRole1),
                                            NewRole =
                                                mount_attr:batch_calc_pet(AttrRole),
                                            UpdateSkillList = case OldSkillCnt <
                                                                       SkillCnt
                                                                  of
                                                                  true ->
                                                                      [MSKill
                                                                       || MSKill =
                                                                              #mount_skill{skill_index
                                                                                               =
                                                                                               SkillIndex}
                                                                              <- NewSkillList,
                                                                          SkillIndex
                                                                              >
                                                                              OldSkillCnt,
                                                                          SkillIndex
                                                                              =<
                                                                              SkillCnt];
                                                                  false -> []
                                                              end,
                                            push_mount(NewRole, Index),
                                            log:log_mount(NewRole, "突破", Index),
                                            {ok, NewRole, UpdateSkillList};
                                        {false, #loss{msg = Msg}} ->
                                            {false, Msg};
                                        _ -> {false, lang:get("资源不足，不能进行突破")}
                                    end;
                                false -> {false, lang:get("您已经突破该等级，不需要重复突破哦")}
                            end;
                        false -> {false, lang:get("当前等级不需要进行突破")}
                    end;
                _ -> {false, lang:get("您的坐骑已经达到了最大等级，不需要进突破")}
            end;
        _ -> {false, lang:get("您还未拥有该坐骑，请继续努力哦")}
    end;
rpc_break_through(_Role, Index) when Index =:= 100 ->
    {false, lang:get("新手坐骑不需要进行突破")}.

rpc_aaptitude(Role = #role{m_mount =
                               MMount = #m_mount{mounts = Mounts}},
              Index)
    when Index =/= 100 ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{growth = CurGrowth,
                       tmp_growth = HisMaxGrowth} ->
            case mount_data:get_aptitude_cost({Index, CurGrowth}) of
                Cost = [_ | _] ->
                    Loss = format:val_to_loss(Cost,
                                              #{item_base_id_auto_buy => 1,
                                                auto_scene =>
                                                    lang:get("坐骑洗髓")}),
                    case role_gain:do(Loss, Role) of
                        {ok, LossRole} ->
                            case do_mount_aaptitude(Index,
                                                    CurGrowth,
                                                    HisMaxGrowth)
                                of
                                {ok, Growth} ->
                                    MaxGrowth = max(Growth, HisMaxGrowth),
                                    AptMount = Mount#mount{tmp_growth =
                                                               MaxGrowth,
                                                           growth = Growth},
                                    ScoreMount =
                                        mount_attr:update_mount_score(AptMount),
                                    NewMount = ScoreMount,
                                    NewMounts = lists:keyreplace(Index,
                                                                 #mount.index,
                                                                 Mounts,
                                                                 NewMount),
                                    MountRole = LossRole#role{m_mount =
                                                                  MMount#m_mount{mounts
                                                                                     =
                                                                                     NewMounts}},
                                    AchieveRole =
                                        role_trigger:fire(#evt_mount_growth{growth
                                                                                =
                                                                                Growth},
                                                          MountRole),
                                    NewRole = attr:calc_and_push(AchieveRole),
                                    push_mount(NewRole, Index),
                                    log:log_mount(NewRole, "洗髓", Index),
                                    GrowthName = case Growth of
                                                     1 ->
                                                         {string_2,
                                                          0,
                                                          lang:get("白色")};
                                                     2 ->
                                                         {string_2,
                                                          1,
                                                          lang:get("绿色")};
                                                     3 ->
                                                         {string_2,
                                                          2,
                                                          lang:get("蓝色")};
                                                     4 ->
                                                         {string_2,
                                                          3,
                                                          lang:get("紫色")};
                                                     5 ->
                                                         {string_2,
                                                          4,
                                                          lang:get("橙色")};
                                                     6 ->
                                                         {string_2,
                                                          6,
                                                          lang:get("红色")};
                                                     _ ->
                                                         {string_2,
                                                          1,
                                                          lang:get("绿色")}
                                                 end,
                                    RtMsg = case CurGrowth =< Growth of
                                                true ->
                                                    notice:format(lang:get("洗髓成功，成长升为~ts"),
                                                                  [GrowthName]);
                                                false ->
                                                    notice:format(lang:get("洗髓失败，成长降为~ts"),
                                                                  [GrowthName])
                                            end,
                                    {ok, NewRole, RtMsg};
                                {false, Reason} -> {false, Reason};
                                _Err ->
                                    logger:error("坐骑洗髓出现未知错误:~w",
                                                 [_Err],
                                                 mount,
                                                 958),
                                    {false, lang:get("坐骑洗髓出现未知错误")}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        _ -> {false, lang:get("材料不足，不能进行洗髓")}
                    end;
                false -> {false, lang:get("您的坐骑已经达到了最高成长了，不需要进行洗髓了")}
            end;
        false -> {false, lang:get("您还未获得该坐骑，继续努力哦")}
    end;
rpc_aaptitude(_Role, Index) when Index =:= 100 ->
    {false, lang:get("新手坐骑不能洗髓")}.

rpc_train(Role, Index) -> use_spirit_item(Role, Index).

rpc_use_decorate(Role = #role{m_mount =
                                  #m_mount{ride_mount = RideMount,
                                           mounts = Mounts},
                              lev = Lev},
                 Index, DecorateId)
    when Lev >= 50 ->
    logger:debug("穿戴饰品:~w", [DecorateId], mount, 981),
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{mount_base_id = MountBaseId,
                       decorate_list = DecorateList} ->
            case lists:keyfind(DecorateId,
                               #mount_decorate.decorate_index,
                               DecorateList)
                of
                #mount_decorate{} ->
                    {false, lang:get("您的坐骑已经拥有了饰品，不需要重复穿戴")};
                _ ->
                    case mount_data:get_decorate_need_item({DecorateId,
                                                            MountBaseId})
                        of
                        {NeedItemId, DecorateBaseId} ->
                            Cost = [{NeedItemId, 1}],
                            Loss = format:val_to_loss(Cost,
                                                      #{item_base_id_auto_buy =>
                                                            1,
                                                        auto_scene =>
                                                            lang:get("坐骑使用装饰")}),
                            case role_gain:do_notice(Loss, Role) of
                                {ok, LossRole} ->
                                    NewDecorate = #mount_decorate{decorate_index
                                                                      =
                                                                      DecorateId,
                                                                  decorate_base_id
                                                                      =
                                                                      DecorateBaseId},
                                    AppearanceRole = #role{m_mount =
                                                               NewMMount} =
                                                         case
                                                             mount_data:get_decorate(DecorateBaseId)
                                                             of
                                                             #{appearance :=
                                                                   AppearanceId} ->
                                                                 case
                                                                     add_mount_appearance(LossRole,
                                                                                          AppearanceId)
                                                                     of
                                                                     {ok,
                                                                      _AppearanceRole} ->
                                                                         fashion:push(_AppearanceRole),
                                                                         _AppearanceRole;
                                                                     _ ->
                                                                         LossRole
                                                                 end;
                                                             _ -> LossRole
                                                         end,
                                    NewMount = Mount#mount{decorate_list =
                                                               [NewDecorate
                                                                | DecorateList]},
                                    NewMounts = lists:keystore(Index,
                                                               #mount.index,
                                                               Mounts,
                                                               NewMount),
                                    MountRole = AppearanceRole#role{m_mount =
                                                                        NewMMount#m_mount{mounts
                                                                                              =
                                                                                              NewMounts}},
                                    CalcRole = case RideMount =:= Index of
                                                   true ->
                                                       case DecorateId of
                                                           2 ->
                                                               attr:calc_and_push(MountRole);
                                                           _ -> MountRole
                                                       end;
                                                   false -> MountRole
                                               end,
                                    log:log_mount(MountRole, "使用饰品", Index),
                                    Msg = case DecorateId of
                                              2 ->
                                                  lang:get("激活云彩成功,坐骑足力大增{face_1, 38}");
                                              1 ->
                                                  lang:get("激活饰品成功,坐骑焕然一新{face_1, 3}");
                                              _ -> ""
                                          end,
                                    push_mount(CalcRole),
                                    {ok, CalcRole, Msg};
                                _Err ->
                                    logger:debug("自动购买失败:~w",
                                                 [_Err],
                                                 mount,
                                                 1033),
                                    {false, lang:get("没有饰品可以使用")}
                            end;
                        false -> {false, lang:get("配置错误，没有符合要求的道具")}
                    end
            end;
        _ -> {false, lang:get("您还未获得该坐骑，继续努力哦")}
    end;
rpc_use_decorate(#role{lev = Lev}, _Index, _DecorateId)
    when Lev < 50 ->
    {false, lang:get("50级后才可以使用坐骑饰品哦")}.

rpc_upgrade_skill(Role = #role{m_mount =
                                   MMount = #m_mount{mounts = Mounts}},
                  Index, SkillIndex) ->
    case Index =:= 100 of
        false ->
            case lists:keyfind(Index, #mount.index, Mounts) of
                Mount = #mount{lev = MountLev, skill_point = LeftPoint,
                               skill_list = SkillList} ->
                    case lists:keyfind(SkillIndex,
                                       #mount_skill.skill_index,
                                       SkillList)
                        of
                        Skill = #mount_skill{skill_id = SkillId,
                                             skill_lev = SkillLev} ->
                            case mount_data:get_skill_info(SkillLev) of
                                #{mount_lev := NeedLev}
                                    when NeedLev > MountLev ->
                                    {false,
                                     lang:get("该技能已经达到上限了，继续升级坐骑可以提升技能等级")};
                                #{point := NeedPoint}
                                    when NeedPoint > LeftPoint ->
                                    ErrMsg =
                                        notice:format(lang:get("技能点数不足，升级此技能需要~ts点"),
                                                      [{string_2,
                                                        1,
                                                        NeedPoint}]),
                                    {false, ErrMsg};
                                #{point := NeedPoint, cost := Cost} ->
                                    Loss = format:val_to_loss(Cost,
                                                              #{item_base_id_auto_buy
                                                                    => 1,
                                                                auto_scene =>
                                                                    lang:get("坐骑技能升级")}),
                                    case role_gain:do_notice(Loss, Role) of
                                        {ok, LossRole} ->
                                            UpSkill =
                                                Skill#mount_skill{skill_lev =
                                                                      SkillLev +
                                                                          1},
                                            UpSkillList =
                                                lists:keyreplace(SkillIndex,
                                                                 #mount_skill.skill_index,
                                                                 SkillList,
                                                                 UpSkill),
                                            SkillMount = Mount#mount{skill_list
                                                                         =
                                                                         UpSkillList,
                                                                     skill_point
                                                                         =
                                                                         LeftPoint
                                                                             -
                                                                             NeedPoint},
                                            ScoreMount =
                                                mount_attr:update_mount_score(SkillMount),
                                            NewMount = ScoreMount,
                                            NewMounts = lists:keystore(Index,
                                                                       #mount.index,
                                                                       Mounts,
                                                                       NewMount),
                                            MountRole = LossRole#role{m_mount =
                                                                          MMount#m_mount{mounts
                                                                                             =
                                                                                             NewMounts}},
                                            MountRole1 =
                                                mount_attr:calc_skill_prac(MountRole),
                                            NewRole =
                                                mount_attr:batch_calc_pet(MountRole1),
                                            {OldSkillName, OldSkillColor} = case
                                                                                skill_data:get_mount({SkillId,
                                                                                                      SkillLev})
                                                                                of
                                                                                #{name
                                                                                      :=
                                                                                      _OSklName,
                                                                                  lev
                                                                                      :=
                                                                                      _OLev} ->
                                                                                    OSkillColor =
                                                                                        get_skill_color(_OLev),
                                                                                    {_OSklName,
                                                                                     OSkillColor};
                                                                                _ ->
                                                                                    {lang:get("无名技能"),
                                                                                     0}
                                                                            end,
                                            {NewSkillName, NewSkillColor} = case
                                                                                skill_data:get_mount({SkillId,
                                                                                                      SkillLev
                                                                                                          +
                                                                                                          1})
                                                                                of
                                                                                #{name
                                                                                      :=
                                                                                      _NSklName,
                                                                                  lev
                                                                                      :=
                                                                                      _NLev} ->
                                                                                    NSkillColor =
                                                                                        get_skill_color(_NLev),
                                                                                    {_NSklName,
                                                                                     NSkillColor};
                                                                                _ ->
                                                                                    {lang:get("无名技能"),
                                                                                     0}
                                                                            end,
                                            NoticeMsg =
                                                notice:format("~ts成功升级为~ts{face_1, 18}",
                                                              [{string_2,
                                                                OldSkillColor,
                                                                OldSkillName},
                                                               {string_2,
                                                                NewSkillColor,
                                                                NewSkillName}]),
                                            notice:return(NoticeMsg),
                                            log:log_mount(NewRole,
                                                          "技能升级",
                                                          Index),
                                            {ok, NewRole};
                                        {false, #loss{msg = Msg}} ->
                                            {false, Msg};
                                        _ ->
                                            {false, lang:get("升级所需资源不足，不能进行升级")}
                                    end;
                                _ -> {false, lang:get("坐骑技能升级配置错误")}
                            end;
                        _ -> {false, lang:get("您的技能还未开启，突破坐骑可以开启新的技能")}
                    end;
                _ -> {false, lang:get("您还未获得该坐骑，继续努力哦")}
            end;
        true -> {false, lang:get("新手坐骑不能升级技能")}
    end.

rpc_rand_skill(Role, Index, SkillIndex,
               TargetSkillId) ->
    case TargetSkillId of
        0 -> do_rand_skill(Role, Index, SkillIndex);
        _ ->
            do_change_skill(Role, Index, SkillIndex, TargetSkillId)
    end.

rpc_init_skill_point(Role = #role{m_mount =
                                      MMount = #m_mount{mounts = Mounts}},
                     Index, SkillIndex) ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{skill_list = SkillList,
                       skill_point = SkillPoint} ->
            case calc_skill_total_point(Mount, SkillIndex) of
                TotalPoint when TotalPoint =/= 0 ->
                    logger:debug("坐骑总技能点数:~w", [TotalPoint], mount, 1122),
                    Fun = fun (MountSkill = #mount_skill{skill_index =
                                                             SklIndex,
                                                         skill_lev = SkillLev},
                               R)
                                  when SklIndex =:= SkillIndex ->
                                  NM = MountSkill#mount_skill{skill_lev =
                                                                  SkillLev - 1},
                                  [NM | R];
                              (OM = #mount_skill{}, R) -> [OM | R];
                              (_, R) -> R
                          end,
                    NewSkillList = lists:foldl(Fun, [], SkillList),
                    SkillMount = Mount#mount{skill_list = NewSkillList,
                                             skill_point =
                                                 SkillPoint + TotalPoint},
                    ScoreMount = mount_attr:update_mount_score(SkillMount),
                    NewMount = ScoreMount,
                    NewMounts = lists:keyreplace(Index,
                                                 #mount.index,
                                                 Mounts,
                                                 NewMount),
                    MountRole = Role#role{m_mount =
                                              MMount#m_mount{mounts =
                                                                 NewMounts}},
                    AttrRole = attr:calc_and_push(MountRole),
                    NewRole = mount_attr:batch_calc_pet(AttrRole),
                    SkillName = case lists:keyfind(SkillIndex,
                                                   #mount_skill.skill_index,
                                                   SkillList)
                                    of
                                    #mount_skill{skill_id = SkillId,
                                                 skill_lev = SkillLev} ->
                                        case skill_data:get_mount({SkillId,
                                                                   SkillLev})
                                            of
                                            #{name := _Name} -> _Name;
                                            _ -> lang:get("无名技能")
                                        end;
                                    _ -> lang:get("无名技能")
                                end,
                    Msg = notice:format(lang:get("重置了~ts的等级，技能点数增加了~ts点"),
                                        [{string_2, 5, SkillName},
                                         {string_2, 1, TotalPoint}]),
                    {ok, NewRole, Msg};
                _ -> {false, lang:get("您的技能已经是最低级了，不需要重置")}
            end;
        _ -> {false, lang:get("您还未获得该坐骑，继续努力哦")}
    end.

rpc_managet_pet(Role0, Index, PetId) ->
    Role = #role{m_mount = #m_mount{mounts = Mounts}} =
               calc_new_managet_pet(Role0),
    case lists:keyfind(Index, #mount.index, Mounts) of
        #mount{manger_pets = ManagerPets,
               tmp_growth = MaxGrowth} ->
            case lists:member(PetId, ManagerPets) of
                true -> ok;
                false ->
                    PetNum = get_pet_num(Index, MaxGrowth),
                    case length(ManagerPets) >= PetNum of
                        true ->
                            Msg = notice:format(lang:get("每一只坐骑只能与~ts只宠物签订契约"),
                                                [{string_2, 1, PetNum}]),
                            {false, Msg};
                        false ->
                            Fun = fun (#mount{manger_pets = ElmMngPets,
                                              index = ElmIndex}) ->
                                          check_manger(Index, ElmIndex) andalso
                                              lists:member(PetId, ElmMngPets);
                                      (_) -> false
                                  end,
                            MngPetMount = lists:filter(Fun, Mounts),
                            case MngPetMount of
                                [#mount{index = MountIndex}] ->
                                    case do_free_pet(Role, MountIndex, PetId) of
                                        {ok, FreePetRole} ->
                                            do_manager_pet(FreePetRole,
                                                           Index,
                                                           PetId);
                                        {false, Reason} -> {false, Reason}
                                    end;
                                [] -> do_manager_pet(Role, Index, PetId);
                                _ ->
                                    logger:error("玩家数据存在异常, 宠物[~w]与坐骑列表[MngPetMount]存在羁绊",
                                                 [PetId, MngPetMount],
                                                 mount,
                                                 1184),
                                    {ok, Role}
                            end
                    end
            end;
        _ -> {false, lang:get("您还未获得该坐骑，继续加油哦")}
    end.

rpc_free_pet(Role = #role{m_pet = #m_pet{pets = Pets}},
             Index, PetId) ->
    case do_free_pet(Role, Index, PetId) of
        {ok, NewRole} ->
            PetName = case lists:keyfind(PetId, #pet.id, Pets) of
                          #pet{name = _PetName} -> _PetName;
                          _ -> lang:get("无名宠物")
                      end,
            Msg = notice:format(lang:get("解除契约成功，~ts的契约技能消失了"),
                                [{string_2, 2, PetName}]),
            notice:return(Msg),
            push_mount(NewRole, Index),
            {ok, NewRole};
        {false, Reason} ->
            logger:error("解除羁绊时出错:~w", [Reason], mount, 1206),
            {ok, Role}
    end.

rpc_transfrom_appearance(Role = #role{m_mount =
                                          MMount = #m_mount{mounts = Mounts,
                                                            appearance_list =
                                                                AppearanceList,
                                                            double_ride_role =
                                                                DRideRole,
                                                            is_driver =
                                                                IsDriver}},
                         Index, AppearanceId) ->
    case check_transfrom(DRideRole, IsDriver) of
        true ->
            Now = date:unixtime(),
            case lists:keyfind(AppearanceId, 1, AppearanceList) of
                {_, ExpireTime}
                    when ExpireTime =:= 0 orelse Now < ExpireTime ->
                    case lists:keyfind(Index, #mount.index, Mounts) of
                        Mount = #mount{} ->
                            NewMount = Mount#mount{transformation_id =
                                                       AppearanceId},
                            NewMounts = lists:keyreplace(Index,
                                                         #mount.index,
                                                         Mounts,
                                                         NewMount),
                            MountRole = Role#role{m_mount =
                                                      MMount#m_mount{mounts =
                                                                         NewMounts}},
                            NewRole = attr:calc_and_push(MountRole),
                            push_mount(NewRole, Index),
                            MountName = case mount_data:get(AppearanceId) of
                                            #{name := _Name} -> _Name;
                                            _ -> lang:get("无名坐骑")
                                        end,
                            NoticeMsg =
                                notice:format(lang:get("您的坐骑幻化成了~ts，威风凛凛{face_1,18}"),
                                              [{string_2, 5, MountName}]),
                            notice:return(NoticeMsg),
                            {ok, NewRole};
                        _ -> {false, lang:get("您还未获得该坐骑，继续加油哦")}
                    end;
                false when AppearanceId =:= 0 ->
                    case lists:keyfind(Index, #mount.index, Mounts) of
                        Mount = #mount{mount_base_id = BaseId} ->
                            NewMount = Mount#mount{transformation_id =
                                                       AppearanceId},
                            NewMounts = lists:keyreplace(Index,
                                                         #mount.index,
                                                         Mounts,
                                                         NewMount),
                            MountRole = Role#role{m_mount =
                                                      MMount#m_mount{mounts =
                                                                         NewMounts}},
                            MountName = case mount_data:get(BaseId) of
                                            #{name := _Name} -> _Name;
                                            _ -> lang:get("无名坐骑")
                                        end,
                            NoticeMsg =
                                notice:format(lang:get("您的坐骑幻化成了~ts，威风凛凛{face_1,18}"),
                                              [{string_2, 5, MountName}]),
                            notice:return(NoticeMsg),
                            NewRole = attr:calc_and_push(MountRole),
                            push_mount(NewRole, Index),
                            {ok, NewRole};
                        _ -> {false, lang:get("您还未获得该坐骑，继续加油哦")}
                    end;
                {_, ExpireTime} when Now >= ExpireTime ->
                    {false, lang:get("该幻化已经过期了，无法进行幻化")};
                _ -> {false, lang:get("您还未拥有该图鉴，不能进行幻化")}
            end;
        false -> {false, lang:get("共乘状态下无法幻化，请取消共乘后再试")}
    end.

rpc_synthetise_appearance(Role = #role{m_mount =
                                           #m_mount{appearance_list =
                                                        AppearanceList},
                                       p_bag = PBag},
                          AppearanceId) ->
    case lists:keyfind(AppearanceId, 1, AppearanceList) of
        {_, 0} -> {false, lang:get("您已经拥有了此幻化，不需要再合成了")};
        _ ->
            case mount_data:get_synthetise_cost(AppearanceId) of
                {[{NeedItemId, Val}], ReplaceItemList} ->
                    case synthetise_appearance_replace_cost(PBag,
                                                            Val,
                                                            [NeedItemId
                                                             | ReplaceItemList],
                                                            [])
                        of
                        {ok, Cost2} ->
                            Loss = format:val_to_loss(Cost2),
                            logger:debug("消耗道具数量:~w, 消耗:~w",
                                         [Val, Loss],
                                         mount,
                                         1274),
                            rpc_synthetise_appearance2(Loss,
                                                       Role,
                                                       AppearanceId);
                        _ -> {false, lang:get("您没有足够的合成道具，攒够了再来吧")}
                    end;
                _ -> {false, lang:get("配置错误，不能合成")}
            end
    end.

rpc_synthetise_appearance2(Loss, Role, AppearanceId) ->
    case role_gain:do_notice(Loss, Role) of
        {ok, LossRole} ->
            case add_mount_appearance(LossRole, AppearanceId) of
                {ok,
                 AppearanceRole = #role{m_mount =
                                            MMount = #m_mount{dye_diff_list =
                                                                  DyeDiffList}}} ->
                    NAppearanceRole = case lists:member(AppearanceId,
                                                        [2023, 2031])
                                          of
                                          true ->
                                              case lists:member(AppearanceId,
                                                                DyeDiffList)
                                                  of
                                                  false ->
                                                      NDyeDiffList =
                                                          [AppearanceId
                                                           | DyeDiffList],
                                                      AppearanceRole1 =
                                                          AppearanceRole#role{m_mount
                                                                                  =
                                                                                  MMount#m_mount{dye_diff_list
                                                                                                     =
                                                                                                     NDyeDiffList}},
                                                      DyeTmpList = case
                                                                       mount_data:get_mount_dye(AppearanceId)
                                                                       of
                                                                       {_,
                                                                        TmpList,
                                                                        _} ->
                                                                           TmpList;
                                                                       _ -> []
                                                                   end,
                                                      EvtDyeDiffList =
                                                          NDyeDiffList --
                                                              NDyeDiffList --
                                                                  DyeTmpList,
                                                      Evt =
                                                          [#evt_mount_dye_diff{val
                                                                                   =
                                                                                   length(EvtDyeDiffList),
                                                                               dye_id
                                                                                   =
                                                                                   AppearanceId}],
                                                      role_trigger:fire(Evt,
                                                                        AppearanceRole1);
                                                  _ -> AppearanceRole
                                              end;
                                          _ -> AppearanceRole
                                      end,
                    fashion:push(NAppearanceRole),
                    {ok, NAppearanceRole};
                _Else -> _Else
            end;
        _ -> {false, lang:get("您没有足够的合成道具，攒够了再来吧")}
    end.

synthetise_appearance_replace_cost(_PBag, 0,
                                   _ReplaceItemList, Cost) ->
    {ok, Cost};
synthetise_appearance_replace_cost(_PBag, _, [],
                                   _Cost) ->
    {false, lang:get("您没有足够的合成道具，攒够了再来吧")};
synthetise_appearance_replace_cost(PBag, Val,
                                   [ItemID | ReplaceItemList], Cost) ->
    {_, ItemCount} = package:count(by_base_id,
                                   ItemID,
                                   PBag),
    case ItemCount >= Val of
        true ->
            synthetise_appearance_replace_cost(PBag,
                                               0,
                                               ReplaceItemList,
                                               [{ItemID, Val} | Cost]);
        _ ->
            case ItemCount =/= 0 of
                true ->
                    synthetise_appearance_replace_cost(PBag,
                                                       Val - ItemCount,
                                                       ReplaceItemList,
                                                       [{ItemID, ItemCount}
                                                        | Cost]);
                _ ->
                    synthetise_appearance_replace_cost(PBag,
                                                       Val - ItemCount,
                                                       ReplaceItemList,
                                                       Cost)
            end
    end.

rpc_set_decorate_hide(Role = #role{m_mount =
                                       MMount = #m_mount{mounts = Mounts}},
                      Index, DecorateId, Hide) ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{decorate_list = DecorateList} ->
            case lists:keyfind(DecorateId,
                               #mount_decorate.decorate_index,
                               DecorateList)
                of
                #mount_decorate{is_hide = Hide} -> {ok, Role};
                Decorate = #mount_decorate{}
                    when Hide =:= 1 orelse Hide =:= 0 ->
                    NewDecorate = Decorate#mount_decorate{is_hide = Hide},
                    NewDecorateList = lists:keyreplace(DecorateId,
                                                       #mount_decorate.decorate_index,
                                                       DecorateList,
                                                       NewDecorate),
                    NewMount = Mount#mount{decorate_list = NewDecorateList},
                    NewMounts = lists:keyreplace(Index,
                                                 #mount.index,
                                                 Mounts,
                                                 NewMount),
                    MountRole = Role#role{m_mount =
                                              MMount#m_mount{mounts =
                                                                 NewMounts}},
                    push_mount(MountRole, Index),
                    NewRole = MountRole,
                    {ok, NewRole};
                _ -> {ok, Role}
            end;
        _ -> {false, lang:get("您还未获得该坐骑，继续加油哦")}
    end.

rpc_buy_mount_evolution(AppearanceId,
                        Role = #role{m_mount =
                                         MMount = #m_mount{appearance_list =
                                                               AList,
                                                           evolution_list =
                                                               EList,
                                                           double_ride_role =
                                                               DRideRole,
                                                           is_driver =
                                                               IsDriver}}) ->
    case check_transfrom(DRideRole, IsDriver) of
        true ->
            case check_evolution(AppearanceId, AList) of
                {ok, EvolutionId, Loss, EvoluName} ->
                    case Loss of
                        Loss2 when is_list(Loss2) ->
                            Loss3 = format:val_to_loss(Loss2),
                            role:send_buff_begin(),
                            case role_gain:do(Loss3, Role) of
                                {ok, NRole1} ->
                                    case lists:keyfind(AppearanceId,
                                                       #mount_evolution.trans_id,
                                                       EList)
                                        of
                                        #mount_evolution{} ->
                                            role:send_buff_clean(),
                                            {false,
                                             lang:get("您已经获得该坐骑变形形态，不用再购买了")};
                                        _ ->
                                            EvolutionInfo =
                                                #mount_evolution{trans_id =
                                                                     AppearanceId,
                                                                 evolution_id =
                                                                     EvolutionId},
                                            NEList = [EvolutionInfo | EList],
                                            NMMount =
                                                MMount#m_mount{evolution_list =
                                                                   NEList},
                                            NRole2 = NRole1#role{m_mount =
                                                                     NMMount},
                                            LookRole = looks:calc(NRole2),
                                            looks:update_looks(Role, LookRole),
                                            push_mount(LookRole),
                                            role:send_buff_flush(),
                                            NoticeMsg =
                                                notice:format(lang:get("您的坐骑幻化成了~ts，威风凛凛{face_1,18}"),
                                                              [{string_2,
                                                                5,
                                                                EvoluName}]),
                                            notice:return(NoticeMsg),
                                            {ok, LookRole, EvolutionId}
                                    end;
                                {false, #loss{msg = Msg}} ->
                                    role:send_buff_clean(),
                                    {false, Msg};
                                _ ->
                                    role:send_buff_clean(),
                                    {false, lang:get("系统错误")}
                            end;
                        _ -> {false, lang:get("配表错误")}
                    end;
                {false, Reason} -> {false, Reason};
                _ -> {false, lang:get("系统错误")}
            end;
        false -> {false, lang:get("共乘状态下无法幻化，请取消共乘后再试")}
    end.

rpc_mount_evolution(AppearanceId,
                    Role = #role{m_mount =
                                     MMount = #m_mount{appearance_list = AList,
                                                       evolution_list = EList,
                                                       double_ride_role =
                                                           DRideRole,
                                                       is_driver =
                                                           IsDriver}}) ->
    case check_transfrom(DRideRole, IsDriver) of
        true ->
            case check_evolution(AppearanceId, AList) of
                {ok, EvolutionId, _, EvoluName} ->
                    case lists:keytake(AppearanceId,
                                       #mount_evolution.trans_id,
                                       EList)
                        of
                        {value,
                         #mount_evolution{evolution_id = PresentId},
                         Rest} ->
                            case PresentId of
                                0 -> {false, lang:get("您还没有拥有该坐骑变形形态，不能切换")};
                                AppearanceId ->
                                    NEvolution = #mount_evolution{trans_id =
                                                                      AppearanceId,
                                                                  evolution_id =
                                                                      EvolutionId},
                                    NEList = [NEvolution | Rest],
                                    NMMount = MMount#m_mount{evolution_list =
                                                                 NEList},
                                    NRole = Role#role{m_mount = NMMount},
                                    LookRole = looks:calc(NRole),
                                    looks:update_looks(Role, LookRole),
                                    push_mount(LookRole),
                                    NoticeMsg =
                                        notice:format(lang:get("您的坐骑幻化成了~ts，威风凛凛{face_1,18}"),
                                                      [{string_2,
                                                        5,
                                                        EvoluName}]),
                                    notice:return(NoticeMsg),
                                    {ok, LookRole, EvolutionId};
                                EvolutionId ->
                                    NEvolution = #mount_evolution{trans_id =
                                                                      AppearanceId,
                                                                  evolution_id =
                                                                      AppearanceId},
                                    NEList = [NEvolution | Rest],
                                    NMMount = MMount#m_mount{evolution_list =
                                                                 NEList},
                                    NRole = Role#role{m_mount = NMMount},
                                    LookRole = looks:calc(NRole),
                                    looks:update_looks(Role, LookRole),
                                    push_mount(LookRole),
                                    MountName = case
                                                    mount_data:get(AppearanceId)
                                                    of
                                                    #{name := _Name} -> _Name;
                                                    _ -> lang:get("无名坐骑")
                                                end,
                                    NoticeMsg =
                                        notice:format(lang:get("您的坐骑幻化成了~ts，威风凛凛{face_1,18}"),
                                                      [{string_2,
                                                        5,
                                                        MountName}]),
                                    notice:return(NoticeMsg),
                                    {ok, LookRole, AppearanceId}
                            end;
                        _ -> {false, lang:get("您还没有拥有该坐骑变形形态，不能切换")}
                    end;
                {false, Reason} -> {false, Reason};
                _ -> {false, lang:get("系统错误")}
            end;
        false -> {false, lang:get("共乘状态下无法幻化，请取消共乘后再试")}
    end.

rpc_invite_rode(Role = #role{m_mount =
                                 #m_mount{ride_mount = RideMount,
                                          mounts = Mounts,
                                          double_ride_role = DoubleRideRole},
                             name = Name, lev = Lev,
                             id = {Rid, PPlat, PZoneId}},
                {Pid, Plat, ZoneId}) ->
    logger:debug("邀请共骑 ~w", [DoubleRideRole], mount, 1486),
    case check_ride_transformation(Mounts, RideMount) of
        ok ->
            case DoubleRideRole of
                {1, "", 0} ->
                    role:pack_send({Pid, Plat, ZoneId},
                                   17032,
                                   {Rid, PPlat, PZoneId, Name, Lev}),
                    {ok, Role};
                _ -> {false, lang:get("正在共骑中")}
            end;
        false -> {false, lang:get("您还没有拥有双人坐骑，邀请共骑失败")}
    end.

rpc_is_join_rode(Role = #role{m_mount = MMount,
                              id = {PRid, PPlat, PZoneId}, name = Name,
                              lev = Lev},
                 Flag, {Rid, Plat, ZoneId}) ->
    case Flag of
        0 ->
            logger:debug("拒绝共骑", [], mount, 1503),
            role:pack_send({Rid, Plat, ZoneId},
                           17033,
                           {Flag, Name, Lev}),
            {false, lang:get("您拒接了共骑"), Role};
        1 ->
            case check_passager(Role) of
                {ok} ->
                    case check_driver({Rid, Plat, ZoneId}) of
                        {false, Mag} -> {false, Mag, Role};
                        {ok, _Mag} ->
                            logger:debug("接受共骑", [], mount, 1513),
                            NMMount = MMount#m_mount{double_ride_role =
                                                         {Rid, Plat, ZoneId},
                                                     is_driver = 1},
                            NRole = Role#role{m_mount = NMMount},
                            role:apply(async,
                                       {Rid, Plat, ZoneId},
                                       {mount,
                                        apply_invite,
                                        [Flag, {PRid, PPlat, PZoneId}]}),
                            {ok, NNRole} = push_double_ride_look(NRole),
                            role:link_send(NNRole, 17033, {Flag, Name, Lev}),
                            {ok, NNRole}
                    end;
                {false, Mag} -> {false, Mag, Role}
            end
    end.

apply_invite(Role = #role{m_mount = MMount, name = Name,
                          lev = Lev},
             Flag, {PRid, PPlat, PZoneId}) ->
    logger:debug("接受共骑回调", [], mount, 1528),
    NMMount = MMount#m_mount{double_ride_role =
                                 {PRid, PPlat, PZoneId},
                             is_driver = 0},
    NRole = Role#role{m_mount = NMMount},
    {ok, NNRole} = push_double_ride_look(NRole),
    role:link_send(NNRole, 17033, {Flag, Name, Lev}),
    {ok, NNRole}.

rpc_exit_rode(Role) ->
    {ok, NRole} = exit_double_ride(Role),
    {ok, NRole}.

exit_double_ride(Role = #role{m_mount =
                                  MMount = #m_mount{double_ride_role =
                                                        DoubleRideRole,
                                                    is_driver = IsDriver}}) ->
    logger:debug("退出共骑~w", [DoubleRideRole], mount, 1540),
    case DoubleRideRole of
        {1, "", 0} -> {ok, Role};
        {Rid, Plat, ZoneId} ->
            NMMount = MMount#m_mount{double_ride_role = {1, "", 0},
                                     is_driver = 0},
            NRole = Role#role{m_mount = NMMount},
            LookRole = looks:calc(NRole),
            case IsDriver of
                1 ->
                    role:apply(async,
                               {Rid, Plat, ZoneId},
                               {mount, apply_exit, []}),
                    looks:update_looks(NRole, LookRole);
                0 ->
                    looks:update_looks(NRole, LookRole),
                    role:apply(async,
                               {Rid, Plat, ZoneId},
                               {mount, apply_exit, []})
            end,
            notice:send(LookRole, 1, lang:get("您已经退出双人共乘")),
            {ok, LookRole};
        _ ->
            NMMount = MMount#m_mount{double_ride_role = {1, "", 0},
                                     is_driver = 0},
            NRole = Role#role{m_mount = NMMount},
            {ok, NRole}
    end.

reset_double_ride(Role = #role{m_mount = MMount}) ->
    NMMount = MMount#m_mount{double_ride_role = {1, "", 0},
                             is_driver = 0},
    NRole = Role#role{m_mount = NMMount},
    {ok, NRole}.

away_exit_ride(Role = #role{m_mount =
                                MMount = #m_mount{double_ride_role =
                                                      DoubleRideRole}}) ->
    logger:debug("暂离并退出共骑~w",
                 [DoubleRideRole],
                 mount,
                 1570),
    case DoubleRideRole of
        {1, "", 0} -> {ok, Role};
        {Rid, Plat, ZoneId} ->
            NMMount = MMount#m_mount{double_ride_role = {1, "", 0},
                                     is_driver = 0},
            NRole = Role#role{m_mount = NMMount},
            LookRole = looks:calc(NRole),
            looks:update_looks(NRole, LookRole),
            role:apply(async,
                       {Rid, Plat, ZoneId},
                       {mount, apply_exit, []}),
            notice:send(Role, 1, lang:get("您已经退出共乘")),
            {ok, NRole};
        _ -> {ok, Role}
    end.

apply_exit(Role = #role{m_mount = MMount}) ->
    logger:debug("退出共骑回调", [], mount, 1588),
    NMMount = MMount#m_mount{double_ride_role = {1, "", 0},
                             is_driver = 0},
    NRole = Role#role{m_mount = NMMount},
    LookRole = looks:calc(NRole),
    looks:update_looks(NRole, LookRole),
    notice:send(Role, 1, lang:get("您已经退出双人共乘")),
    {ok, LookRole}.

push_double_ride_look(Role) ->
    LookRole = looks:calc(Role),
    looks:update_looks(Role, LookRole),
    {ok, LookRole}.

get_double_look(#role{m_mount =
                          #m_mount{double_ride_role = DoubleRideRole,
                                   is_driver = IsDriver}}) ->
    case DoubleRideRole of
        {1, "", 0} -> [{80, 0, 0, ""}];
        {Rid, Plat, ZoneId} ->
            DoubleRideLooks = lists:concat([Rid,
                                            ",",
                                            Plat,
                                            ",",
                                            ZoneId]),
            logger:debug("计算looks输出~ts",
                         [DoubleRideLooks],
                         mount,
                         1607),
            case IsDriver of
                0 -> [{80, 0, 0, DoubleRideLooks}];
                1 -> [{81, 0, 0, DoubleRideLooks}]
            end;
        _ -> [{80, 0, 0, ""}]
    end.

push_mount(#role{link = Link,
                 m_mount =
                     #m_mount{ride_mount = RideMount, mounts = Mounts,
                              appearance_list = AL, next_mount_id = NextIndex,
                              combat_active_times = CombatActiveTimes,
                              dye_list = DyeList, pre_mount_status = PreMount,
                              evolution_list = EvolutionList}}) ->
    role:link_send(Link,
                   17000,
                   {RideMount,
                    Mounts,
                    AL,
                    PreMount,
                    NextIndex,
                    CombatActiveTimes,
                    DyeList,
                    EvolutionList}),
    ok;
push_mount(_) -> ok.

push_mount(#role{link = Link,
                 m_mount = #m_mount{mounts = Mounts}},
           Index) ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{} ->
            role:link_send(Link, 17012, {Mount}),
            ok;
        _ -> ok
    end.

do_create_mount(Index, Classes) ->
    case mount_data:get_init_appearance({Index, Classes}) of
        AppearanceList = [_ | _] ->
            case util:rand_list(AppearanceList, 2) of
                {BaseId, _} ->
                    GrowthMOunt = #mount{index = Index,
                                         mount_base_id = BaseId,
                                         live_status = 1, growth = 1,
                                         spirit = 300},
                    SkillCount = case mount_data:get_lev({1, Index}) of
                                     #{skill_cnt := _Scnt} -> _Scnt;
                                     _ -> 0
                                 end,
                    logger:debug("创建坐骑生成技能数:~w", [SkillCount], mount, 1648),
                    SkillMount = produce_mount_skill(GrowthMOunt,
                                                     Classes,
                                                     1,
                                                     SkillCount),
                    ScoreMount = mount_attr:update_mount_score(SkillMount),
                    {ok, ScoreMount};
                _ -> {false, lang:get("当前状态无法创建坐骑，配置错误")}
            end;
        false -> {false, lang:get("当前状态无法创建坐骑，孵化列表为空")}
    end.

do_create_sprog_mount(Classes, KeyId) ->
    case mount_data:get_sprog_mount({100, Classes, KeyId})
        of
        {BaseId, ExpireTime} ->
            Now = date:unixtime(),
            Mount = #mount{index = 100, mount_base_id = BaseId,
                           live_status = 3, growth = 1, spirit = 300,
                           expire_time = Now + ExpireTime},
            ScoreMount = mount_attr:update_mount_score(Mount),
            {ok, ScoreMount};
        false -> {false, lang:get("当前状态无法创建坐骑，孵化列表为空")}
    end.

do_convert_sprog_mount(Classes, KeyId) ->
    case mount_data:get_sprog_mount({100, Classes, KeyId})
        of
        {BaseId, _} ->
            GrowthMount = #mount{index = 100,
                                 mount_base_id = BaseId, live_status = 3,
                                 growth = 1, spirit = 300},
            ScoreMount = mount_attr:update_mount_score(GrowthMount),
            {ok, ScoreMount};
        false -> {false, lang:get("当前状态无法创建坐骑，孵化列表为空")}
    end.

rand_mount_skill(Index, Classes, SkillIndex,
                 IngoreSkillIdList) ->
    ClassRandList = mount_data:get_rand_skill({Index,
                                               Classes,
                                               SkillIndex}),
    AllRandList = mount_data:get_rand_skill({Index,
                                             0,
                                             SkillIndex}),
    case ClassRandList ++ AllRandList of
        RandList = [_ | _] ->
            Fun = fun (SkillId, RL) ->
                          lists:keydelete(SkillId, 1, RL)
                  end,
            ResultRandList = lists:foldl(Fun,
                                         RandList,
                                         IngoreSkillIdList),
            case util:rand_list(ResultRandList, 2) of
                {BaseId, _} -> {ok, BaseId};
                _ -> {false, lang:get("配置错误，随机技能列表")}
            end;
        _ -> {false, lang:get("配置错误，没有随机技能列表")}
    end.

produce_mount_skill(Mount, _Classes, FromSkillIndex,
                    ToIndex)
    when FromSkillIndex > ToIndex ->
    Mount;
produce_mount_skill(Mount = #mount{index = Index,
                                   skill_list = SkillList},
                    Classes, FromSkillIndex, ToIndex) ->
    case lists:keymember(FromSkillIndex,
                         #mount_skill.skill_index,
                         SkillList)
        of
        true ->
            produce_mount_skill(Mount,
                                Classes,
                                FromSkillIndex + 1,
                                ToIndex);
        false ->
            case rand_mount_skill(Index,
                                  Classes,
                                  FromSkillIndex,
                                  [])
                of
                {ok, SkillId} ->
                    MountSkill = #mount_skill{skill_index = FromSkillIndex,
                                              skill_id = SkillId,
                                              skill_lev = 1},
                    NewMount = Mount#mount{skill_list =
                                               [MountSkill | SkillList]},
                    produce_mount_skill(NewMount,
                                        Classes,
                                        FromSkillIndex + 1,
                                        ToIndex);
                {false, Reason} ->
                    logger:error("随机坐骑技能失败:~w", [Reason], mount, 1710),
                    produce_mount_skill(Mount,
                                        Classes,
                                        FromSkillIndex + 1,
                                        ToIndex)
            end
    end.

get_look(#role{m_mount =
                   #m_mount{ride_mount = RideMount, mounts = Mounts,
                            dye_list = DyeList,
                            evolution_list = EvolutionList}})
    when RideMount =/= 0 ->
    case lists:keyfind(RideMount, #mount.index, Mounts) of
        #mount{transformation_id = TransBaseId,
               decorate_list = DecorateList}
            when TransBaseId =/= 0 ->
            calculate_Looks([decorate, dye, evolution],
                            #{decorate => DecorateList, dye => DyeList,
                              evolution => EvolutionList,
                              transformation_id => TransBaseId},
                            []);
        #mount{mount_base_id = BaseId,
               decorate_list = DecorateList} ->
            BaseLook = [{20, 0, BaseId, ""}],
            SpeedLook = case lists:keyfind(2,
                                           #mount_decorate.decorate_index,
                                           DecorateList)
                            of
                            #mount_decorate{decorate_base_id = SpeedDcoBaseId,
                                            is_hide = 0} ->
                                [{22, 0, SpeedDcoBaseId, ""}];
                            _ -> []
                        end,
            SpeedLook ++ BaseLook;
        false -> []
    end;
get_look(_) -> [].

do_active_mount(RoleId,
                Mount = #mount{fight_times = Times}, EggVal) ->
    Ratio = mount_data:get_incubate(Times + EggVal),
    case Ratio > util:rand(0, 1000) of
        true ->
            NoticeMsg =
                lang:get("您的坐骑蛋已经孵化啦，快去看看吧{face_1,38}{face_1,38}"),
            notice:return(NoticeMsg),
            Titile = lang:get("坐骑孵化"),
            MountPanelId = 17050,
            Content =
                notice:format(lang:get("刚刚剧烈的战斗触动了你怀里的~ts，这个沉睡的小家伙终于要醒啦！快去~ts孵化它吧{fac"
                                       "e_1,38}{face_1,38}"),
                              [{string_2, 5, lang:get("坐骑蛋")},
                               {panel_2, MountPanelId, 5, lang:get("坐骑面板")}]),
            mail:send(RoleId, Titile, Content),
            Mount#mount{live_status = 2};
        false ->
            logger:debug("未激活成功:~w", [Times], mount, 1769),
            NoticeMsg =
                notice:format(lang:get("坐骑蛋获得了~ts点灵犀值{face_1,3}"),
                              [{string_2, 1, EggVal}]),
            notice:send(conn_pid, 3, NoticeMsg),
            Mount#mount{fight_times = Times + EggVal}
    end.

calc_ride_status(Role = #role{s_ride = 0,
                              m_mount = #m_mount{ride_mount = RideMount}}) ->
    case RideMount =:= 0 of
        true -> Role;
        false -> Role#role{s_ride = 2}
    end;
calc_ride_status(Role = #role{s_ride = 1}) -> Role;
calc_ride_status(Role = #role{s_ride = 2,
                              m_mount = #m_mount{ride_mount = RideMount}}) ->
    case RideMount =:= 0 of
        true -> Role#role{s_ride = 0};
        false -> Role
    end.

do_mount_aaptitude(Index, CurGrowth, HisMaxGrowth) ->
    RandGrowthListCfg = mount_data:get_aptitude({Index,
                                                 CurGrowth}),
    MergeRandList = case HisMaxGrowth =/= CurGrowth of
                        true ->
                            RandHisMaxListCfg = mount_data:get_aptitude({Index,
                                                                         HisMaxGrowth}),
                            logger:debug("当前成长随机列表:~w, 历史最高成长列表:~w",
                                         [RandGrowthListCfg, RandHisMaxListCfg],
                                         mount,
                                         1804),
                            [{G, R}
                             || {G, R} <- RandGrowthListCfg,
                                lists:keymember(G, 1, RandHisMaxListCfg)];
                        false -> RandGrowthListCfg
                    end,
    RandList = lists:keydelete(CurGrowth, 1, MergeRandList),
    logger:debug("洗髓列表:~w", [RandList], mount, 1811),
    case util:rand_list(RandList, 2) of
        {Growth, _} -> {ok, Growth};
        _ -> {false, lang:get("您的坐骑已经达到了最大品质")}
    end.

is_need_calc_attr(Spirit, AddVal) ->
    Result = max(min(Spirit + AddVal, 500), 0),
    if Result < 10 andalso Spirit >= 10 -> 2;
       Result >= 10 andalso Spirit < 10 -> 2;
       Result < 100 andalso Spirit >= 100 -> 2;
       Result >= 100 andalso Spirit < 100 -> 2;
       Result < 10 andalso Spirit >= 100 -> 2;
       Result >= 100 andalso Spirit < 10 -> 2;
       true -> 0
    end.

restore_spirit(Role = #role{m_mount =
                                MMount = #m_mount{mounts = Mounts}}) ->
    NewMounts = do_restore_spirit(Mounts, []),
    NewRole = Role#role{m_mount =
                            MMount#m_mount{mounts = NewMounts}},
    push_mount(NewRole),
    {ok, NewRole}.

do_restore_spirit([], NewMounts) -> NewMounts;
do_restore_spirit([Mount = #mount{decorate_list =
                                      Decorates,
                                  spirit = Spirit}
                   | Rest],
                  NewMounts) ->
    Fun = fun (#mount_decorate{decorate_base_id =
                                   DecorateBaseId},
               Rst) ->
                  case mount_data:get_decorate(DecorateBaseId) of
                      #{day_spirit := DaySpirit} -> Rst + DaySpirit;
                      false -> Rst
                  end
          end,
    TotalSpirit = lists:foldl(Fun, 0, Decorates),
    NewSpirit = max(min(Spirit + TotalSpirit, 500), 0),
    NewMount = Mount#mount{spirit = NewSpirit},
    do_restore_spirit(Rest, [NewMount | NewMounts]).

check_mount_levup(Role = #role{lev = RoleLev,
                               m_mount = #m_mount{mounts = Mounts}},
                  Index) ->
    BreakTimes = lev_break:get_times(Role),
    case lists:keyfind(Index, #mount.index, Mounts) of
        #mount{lev = Lev, upgrade_lev = UpLev} ->
            case mount_data:get_lev({Lev, Index}) of
                #{role_lev := NeedRoleLev, is_up_lev := IsUpLev,
                  break_times := CfgBreakTimes, lev_cost := _} ->
                    case RoleLev of
                        _
                            when BreakTimes =:= CfgBreakTimes andalso
                                     RoleLev >= NeedRoleLev
                                     orelse BreakTimes > CfgBreakTimes ->
                            case IsUpLev =:= 1 of
                                true ->
                                    case Lev =:= UpLev of
                                        true -> true;
                                        false ->
                                            {false,
                                             lang:get("您的坐骑已经达到当前阶段最高等级，请突破后再进行升级")}
                                    end;
                                false -> true
                            end;
                        _ ->
                            Msg = case CfgBreakTimes > 0 of
                                      true ->
                                          notice:format(lang:get("角色等级达到突破后~ts级，才能继续升级坐骑哦"),
                                                        [{string_2,
                                                          1,
                                                          NeedRoleLev}]);
                                      false ->
                                          notice:format(lang:get("角色等级达到~ts级，才能继续升级坐骑哦"),
                                                        [{string_2,
                                                          1,
                                                          NeedRoleLev}])
                                  end,
                            {false, Msg}
                    end;
                #{} -> {false, lang:get("您的坐骑已经达到最高级了，无需进行升级")};
                _ -> {false, lang:get("配置错误")}
            end;
        _ -> {false, lang:get("您还未拥有该坐骑，请继续努力哦")}
    end.

mount_levup(Role, Index, IsSureSuccess) ->
    case IsSureSuccess of
        0 -> do_mount_levup(Role, Index);
        1 -> do_success_mount_levup(Role, Index);
        _ -> {false, lang:get("参数错误")}
    end.

do_mount_levup(Role = #role{m_mount =
                                MMount = #m_mount{mounts = Mounts}},
               Index) ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{lev = Lev, fail_times = FailTimes,
                       skill_point = SkillPoint} ->
            case mount_data:get_lev({Lev, Index}) of
                #{ratio := Ratio, lev_cost := Cost, fail_add := Failadd,
                  skill_point := PointAdd} ->
                    Loss = format:val_to_loss(Cost),
                    case role_gain:do(Loss, Role) of
                        {ok, LossRole} ->
                            RandRatio = util:rand(1, 1000),
                            SuccessRatio = Ratio + FailTimes * Failadd,
                            logger:debug("坐骑升级的成功率：~w, 随机到概率:~w",
                                         [SuccessRatio, RandRatio],
                                         mount,
                                         2004),
                            case RandRatio =< SuccessRatio of
                                true ->
                                    LevupMount = Mount#mount{fail_times = 0,
                                                             lev = Lev + 1,
                                                             skill_point =
                                                                 SkillPoint +
                                                                     PointAdd},
                                    ScoreMount =
                                        mount_attr:update_mount_score(LevupMount),
                                    NewMount = ScoreMount,
                                    NewMounts = lists:keyreplace(Index,
                                                                 #mount.index,
                                                                 Mounts,
                                                                 NewMount),
                                    MountRole = LossRole#role{m_mount =
                                                                  MMount#m_mount{mounts
                                                                                     =
                                                                                     NewMounts}},
                                    PetRole =
                                        mount_attr:batch_calc_pet(MountRole),
                                    push_mount(PetRole, Index),
                                    log:log_mount(PetRole, "升级", Index),
                                    AchieveRole =
                                        role_trigger:fire(#evt_mount_lev{lev =
                                                                             Lev
                                                                                 +
                                                                                 1},
                                                          PetRole),
                                    NewRole = attr:calc_and_push(AchieveRole),
                                    {ok, 1, NewRole};
                                false ->
                                    NewMount = Mount#mount{fail_times =
                                                               FailTimes + 1},
                                    NewMounts = lists:keyreplace(Index,
                                                                 #mount.index,
                                                                 Mounts,
                                                                 NewMount),
                                    NewRole = LossRole#role{m_mount =
                                                                MMount#m_mount{mounts
                                                                                   =
                                                                                   NewMounts}},
                                    push_mount(NewRole, Index),
                                    log:log_mount(NewRole, "升级失败", Index),
                                    NoticeMsg =
                                        notice:format(lang:get("提升坐骑失败，额外增加了~ts~ts的成功率"),
                                                      [{string_2,
                                                        1,
                                                        round(Failadd / 10)},
                                                       {string_2, 1, "%"}]),
                                    notice:return(NoticeMsg),
                                    {ok, 0, NewRole}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        _ -> {false, lang:get("资源不足，无法进行升级")}
                    end;
                _ -> {false, lang:get("您的坐骑已经达到最高级了，无需进行升级")}
            end;
        _ -> {false, lang:get("您还未拥有该坐骑，请继续努力哦")}
    end.

do_success_mount_levup(Role = #role{m_mount =
                                        MMount = #m_mount{mounts = Mounts}},
                       Index) ->
    logger:debug("11111", [], mount, 2047),
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{lev = Lev, skill_point = SkillPoint} ->
            case mount_data:get_lev({Lev, Index}) of
                #{is_can_sure_success_levup := Flag} ->
                    case Flag of
                        1 ->
                            #{sure_success_cost := SureSuccessCost,
                              skill_point := PointAdd} =
                                mount_data:get_lev({Lev, Index}),
                            Loss = format:val_to_loss(SureSuccessCost),
                            case role_gain:do(Loss, Role) of
                                {ok, LossRole} ->
                                    LevupMount = Mount#mount{fail_times = 0,
                                                             lev = Lev + 1,
                                                             skill_point =
                                                                 SkillPoint +
                                                                     PointAdd},
                                    ScoreMount =
                                        mount_attr:update_mount_score(LevupMount),
                                    NewMount = ScoreMount,
                                    NewMounts = lists:keyreplace(Index,
                                                                 #mount.index,
                                                                 Mounts,
                                                                 NewMount),
                                    MountRole = LossRole#role{m_mount =
                                                                  MMount#m_mount{mounts
                                                                                     =
                                                                                     NewMounts}},
                                    PetRole =
                                        mount_attr:batch_calc_pet(MountRole),
                                    push_mount(PetRole, Index),
                                    log:log_mount(PetRole, "升级", Index),
                                    AchieveRole =
                                        role_trigger:fire(#evt_mount_lev{lev =
                                                                             Lev
                                                                                 +
                                                                                 1},
                                                          PetRole),
                                    NewRole = attr:calc_and_push(AchieveRole),
                                    {ok, 1, NewRole};
                                {false, #loss{msg = Msg}} -> {false, Msg};
                                _ -> {false, lang:get("资源不足，无法进行升级")}
                            end;
                        _ -> {false, lang:get("当前不允许采用保底")}
                    end;
                _ -> {false, lang:get("您的坐骑已经达到最高级了，无需进行升级")}
            end;
        _ -> {false, lang:get("您还未拥有该坐骑，请继续努力哦")}
    end.

do_free_pet(Role = #role{m_mount =
                             MMount = #m_mount{mounts = Mounts}},
            Index, PetId) ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{manger_pets = ManagerPets} ->
            NewManagerPets = lists:delete(PetId, ManagerPets),
            NewMount = Mount#mount{manger_pets = NewManagerPets},
            NewMounts = lists:keyreplace(Index,
                                         #mount.index,
                                         Mounts,
                                         NewMount),
            MountRole = Role#role{m_mount =
                                      MMount#m_mount{mounts = NewMounts}},
            CalcRole = mount_attr:batch_calc_pet(MountRole),
            NewRole = case pet:find_pet(PetId, CalcRole) of
                          {ok, FreeMountPet} ->
                              {ok, NewFreeMountPet, PetRole} =
                                  pet_attr:calc(FreeMountPet, CalcRole),
                              pet:push_10503(PetRole, NewFreeMountPet),
                              PetRole;
                          _ -> CalcRole
                      end,
            {ok, NewRole};
        false -> {false, lang:get("您还未拥有该坐骑，继续努力哦")}
    end.

do_manager_pet(Role = #role{m_mount =
                                MMount = #m_mount{mounts = Mounts},
                            m_pet = #m_pet{pets = Pets}},
               Index, PetId) ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{index = Index,
                       manger_pets = ManagerPets} ->
            NewMount = Mount#mount{manger_pets =
                                       [PetId | ManagerPets]},
            NewMounts = lists:keyreplace(Index,
                                         #mount.index,
                                         Mounts,
                                         NewMount),
            MountRole = Role#role{m_mount =
                                      MMount#m_mount{mounts = NewMounts}},
            AchieveRole = role_trigger:fire(#evt_mount_mange_pet{},
                                            MountRole),
            NewRole = mount_attr:batch_calc_pet(AchieveRole),
            PetName = case lists:keyfind(PetId, #pet.id, Pets) of
                          #pet{name = _PetName} -> _PetName;
                          _ -> lang:get("无名宠物")
                      end,
            Msg = notice:format(lang:get("签订契约成功，~ts获得了坐骑契约技能"),
                                [{string_2, 2, PetName}]),
            notice:return(Msg),
            {ok, NewRole};
        false -> {false, lang:get("您还未拥有该坐骑，继续努力哦")}
    end.

reset_combat_active_times(Role = #role{m_mount =
                                           MMount = #m_mount{}}) ->
    Role#role{m_mount =
                  MMount#m_mount{combat_active_times = []}}.

get_skill_color(Lev) ->
    case Lev of
        1 -> 0;
        2 -> 0;
        3 -> 1;
        4 -> 2;
        5 -> 3;
        6 -> 4;
        _ -> 6
    end.

fly_notice(#role{pid = Pid,
                 m_mount =
                     #m_mount{ride_mount = RideMount, mounts = Mounts}}) ->
    case lists:keyfind(RideMount, #mount.index, Mounts) of
        #mount{decorate_list = DecorateList} ->
            case lists:keyfind(2,
                               #mount_decorate.decorate_index,
                               DecorateList)
                of
                #mount_decorate{} -> ok;
                _ ->
                    role:apply(async, Pid, {mount, exit_double_ride, []}),
                    Msg = notice:format(lang:get("佩戴~ts可使坐骑获得飞行能力！"),
                                        [{string_2, 5, lang:get("逐风彩云")}]),
                    notice:return(Msg)
            end;
        _ -> ok
    end;
fly_notice(_) -> ok.

set_mount_lev(Role = #role{m_mount =
                               MMount = #m_mount{mounts = Mounts}},
              Index, Lev) ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{} ->
            NewMount = Mount#mount{lev = Lev},
            NewMounts = lists:keystore(Index,
                                       #mount.index,
                                       Mounts,
                                       NewMount),
            MountRole = Role#role{m_mount =
                                      MMount#m_mount{mounts = NewMounts}},
            NewRole = attr:calc_and_push(MountRole),
            push_mount(NewRole),
            {ok, NewRole};
        _ -> ok
    end.

mount_count(#role{m_mount = #m_mount{mounts = Mounts}},
            Status1) ->
    Fun = fun (#mount{live_status = Status2}, R)
                  when Status2 =:= Status1 ->
                  R + 1;
              (_, R) -> R
          end,
    lists:foldl(Fun, 0, Mounts).

use_spirit_item(Role = #role{m_mount =
                                 #m_mount{mounts = Mounts}},
                Index)
    when Index =/= 100 ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        #mount{spirit = Spirit} when Spirit > 450 ->
            {false, lang:get("您的坐骑现在生龙活虎的，不需喂养坐骑口粮")};
        _ ->
            Cost = [{23555, 1}],
            Loss = format:val_to_loss(Cost,
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("坐骑进食精力丹")}),
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    add_mount_spirit(LossRole, Index, 100);
                {false, #loss{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("道具不足")}
            end
    end;
use_spirit_item(_Role, Index) when Index =:= 100 ->
    {false, lang:get("新手坐骑不需喂养坐骑口粮")}.

calc_skill_total_point(#mount{skill_list = SkillList},
                       SkillIndex) ->
    case lists:keyfind(SkillIndex,
                       #mount_skill.skill_index,
                       SkillList)
        of
        #mount_skill{skill_lev = Lev} ->
            Fun = fun (SLev, R) ->
                          case mount_data:get_skill_info(SLev) of
                              #{point := P} -> R + P;
                              _ -> R
                          end
                  end,
            lists:foldl(Fun, 0, lists:seq(Lev - 1, Lev - 1));
        _ -> 0
    end.

mount_classes_modify(_OldClasses, _TargetClasses, [],
                     NewMounts) ->
    NewMounts;
mount_classes_modify(OldClasses, TargetClasses,
                     [Mount = #mount{index = Index} | Rest], NewMounts)
    when Index =:= 100 ->
    mount_classes_modify(OldClasses,
                         TargetClasses,
                         Rest,
                         [Mount | NewMounts]);
mount_classes_modify(OldClasses, TargetClasses,
                     [Mount = #mount{index = Index, skill_list = SkillList,
                                     decorate_list = DecorateList}
                      | Rest],
                     NewMounts) ->
    case mount_data:get_init_appearance({Index,
                                         TargetClasses})
        of
        AppearanceList = [_ | _] ->
            case util:rand_list(AppearanceList, 2) of
                {NewBaseId, _} ->
                    NewSkillList = mount_skill_classes_modify(OldClasses,
                                                              TargetClasses,
                                                              SkillList,
                                                              []),
                    NewDecorateList =
                        mount_decorate_classes_modify(TargetClasses,
                                                      DecorateList,
                                                      NewBaseId,
                                                      []),
                    NewMount = Mount#mount{mount_base_id = NewBaseId,
                                           skill_list = NewSkillList,
                                           decorate_list = NewDecorateList},
                    mount_classes_modify(OldClasses,
                                         TargetClasses,
                                         Rest,
                                         [NewMount | NewMounts]);
                _ ->
                    mount_classes_modify(OldClasses,
                                         TargetClasses,
                                         Rest,
                                         [Mount | NewMounts])
            end;
        _ ->
            mount_classes_modify(OldClasses,
                                 TargetClasses,
                                 Rest,
                                 [Mount | NewMounts])
    end.

mount_appearance_classes_modify([], [], AppearanceList,
                                AddAL) ->
    [{AddAppId, 0} || AddAppId <- AddAL] ++ AppearanceList;
mount_appearance_classes_modify(OldM, NewM,
                                AppearanceList, _)
    when length(OldM) =/= length(NewM) ->
    AppearanceList;
mount_appearance_classes_modify([#mount{decorate_list =
                                            OldMountDecorateList}
                                 | OldT],
                                [#mount{decorate_list = NewMountDecorateList}
                                 | NewT],
                                AppearanceList, AddAL) ->
    Fun = fun (#mount_decorate{decorate_base_id = DctId},
               Rtn) ->
                  case mount_data:get_decorate(DctId) of
                      #{appearance := AId} -> [AId | Rtn];
                      _ -> Rtn
                  end
          end,
    RemoveAL = lists:foldl(Fun, [], OldMountDecorateList),
    AddAL1 = lists:foldl(Fun, [], NewMountDecorateList),
    AppearanceList1 = [{AppId, ExpireTime}
                       || {AppId, ExpireTime} <- AppearanceList,
                          lists:member(AppId, RemoveAL) =:= false],
    NewAddAL = AddAL ++ AddAL1,
    mount_appearance_classes_modify(OldT,
                                    NewT,
                                    AppearanceList1,
                                    NewAddAL).

check_appearance([], _, NewMounts) -> NewMounts;
check_appearance([Mount = #mount{transformation_id =
                                     TfId}
                  | T],
                 ApList, NewMounts) ->
    case lists:member(TfId, ApList) of
        true ->
            check_appearance(T, ApList, [Mount | NewMounts]);
        false ->
            NewMount = Mount#mount{transformation_id = 0},
            check_appearance(T, ApList, [NewMount | NewMounts])
    end.

convert_appearence_list(Role = #role{classes = Classes,
                                     m_mount =
                                         MMount = #m_mount{mounts = Mounts,
                                                           appearance_list =
                                                               AppearanceList}}) ->
    ApFun = fun ({ApId, _}) ->
                    case mount_data:get(ApId) of
                        #{classes := ApClasses} ->
                            ApClasses =/= Classes andalso ApClasses =/= 0;
                        _ -> false
                    end
            end,
    NewApList = lists:dropwhile(ApFun, AppearanceList),
    logger:debug("玩家删除的:~w", [NewApList], mount, 2275),
    DecFun = fun (#mount_decorate{decorate_base_id = DctId},
                  Rtn) ->
                     case mount_data:get_decorate(DctId) of
                         #{appearance := AId} ->
                             case lists:keymember(AId, 1, Rtn) of
                                 true -> Rtn;
                                 _ -> [{AId, 0} | Rtn]
                             end;
                         _ -> Rtn
                     end
             end,
    MountFun = fun (#mount{decorate_list = DecList}, Rtn) ->
                       lists:foldl(DecFun, Rtn, DecList)
               end,
    NewAppearanceList = lists:foldl(MountFun,
                                    NewApList,
                                    Mounts),
    logger:debug("玩家新幻化列表:~w",
                 [NewAppearanceList],
                 mount,
                 2292),
    Role#role{m_mount =
                  MMount#m_mount{appearance_list = NewAppearanceList}}.

mount_skill_classes_modify(_OldClasses, _TargetClasses,
                           [], NewSkillList) ->
    NewSkillList;
mount_skill_classes_modify(OldClasses, TargetClasses,
                           [Skill = #mount_skill{skill_index = SkillIndex,
                                                 skill_id = SkillId}
                            | Rest],
                           NewSkillList) ->
    case mount_data:get_mount_skill({OldClasses, SkillId})
        of
        #{index := Index, classes := SkillClasses}
            when SkillClasses =/= 0 ->
            RandList = mount_data:get_rand_skill({Index,
                                                  TargetClasses,
                                                  SkillIndex}),
            case util:rand_list(RandList, 2) of
                {NewSkillId, _} ->
                    NewSkill = Skill#mount_skill{skill_id = NewSkillId},
                    mount_skill_classes_modify(OldClasses,
                                               TargetClasses,
                                               Rest,
                                               [NewSkill | NewSkillList]);
                _ ->
                    mount_skill_classes_modify(OldClasses,
                                               TargetClasses,
                                               Rest,
                                               [Skill | NewSkillList])
            end;
        _ ->
            mount_skill_classes_modify(OldClasses,
                                       TargetClasses,
                                       Rest,
                                       [Skill | NewSkillList])
    end.

mount_decorate_classes_modify(_Classes, [], _NewBaseId,
                              NewDecorateList) ->
    NewDecorateList;
mount_decorate_classes_modify(Classes,
                              [Decorate = #mount_decorate{decorate_index =
                                                              Index}
                               | Rest],
                              NewBaseId, NewDecorateList) ->
    case mount_data:get_decorate_need_item({Index,
                                            NewBaseId})
        of
        {_, DecorateBaseId} ->
            NewDecorate = Decorate#mount_decorate{decorate_base_id =
                                                      DecorateBaseId},
            mount_decorate_classes_modify(Classes,
                                          Rest,
                                          NewBaseId,
                                          [NewDecorate | NewDecorateList]);
        _ ->
            mount_decorate_classes_modify(Classes,
                                          Rest,
                                          NewBaseId,
                                          NewDecorateList)
    end.

get_pet_num(Index, Growth) ->
    case mount_data:get_mount_manger({Index, Growth}) of
        #{num := Num} -> Num;
        _ ->
            case Growth > 1 of
                true -> get_pet_num(Index, Growth - 1);
                _ -> 0
            end
    end.

check_manger(Index, ElmIndex) ->
    case mount_data:get_mount_manger({Index, 1}) of
        #{class := Class} ->
            case mount_data:get_mount_manger({ElmIndex, 1}) of
                #{class := ElmClass} -> Class =:= ElmClass;
                _ -> false
            end;
        _ -> false
    end.

calc_collect_val(#role{m_mount =
                           #m_mount{appearance_list = AppearanceList}}) ->
    Fun = fun ({ApId, _}, Rtn) ->
                  mount_data:get_appearance_collect_val(ApId) + Rtn
          end,
    lists:foldl(Fun, 0, AppearanceList).

calc_new_managet_pet(Role = #role{m_mount =
                                      MMount = #m_mount{mounts = Mounts},
                                  m_pet = #m_pet{pets = Pets}}) ->
    Fun = fun (Mount = #mount{manger_pets = ManagerPets},
               Acc) ->
                  NewManagerPets = [PetId
                                    || PetId <- ManagerPets,
                                       lists:keyfind(PetId, #pet.id, Pets) =/=
                                           false],
                  logger:debug("重算之前契约宠数量 ~w之后 ~w",
                               [length(ManagerPets), length(NewManagerPets)],
                               mount,
                               2357),
                  [Mount#mount{manger_pets = NewManagerPets} | Acc]
          end,
    NewMounts = lists:foldl(Fun, [], Mounts),
    Role#role{m_mount = MMount#m_mount{mounts = NewMounts}}.

fix_mount() ->
    List = ets:tab2list(role_id_index),
    [role:apply(async, Pid, {mount, fix_mount, []})
     || #id_index{pid = Pid} <- List].

fix_mount(Role) ->
    logger:debug("开始修复", [], mount, 2369),
    NewRole = mount_attr:batch_calc_pet(Role),
    {ok, NewRole}.

expire_appance(Role = #role{m_mount =
                                MMount = #m_mount{mounts = Mounts,
                                                  appearance_list =
                                                      AppearanceList}}) ->
    Now = date:unixtime(),
    ExpireAppIdList = [AppId
                       || {AppId, ExpireTime} <- AppearanceList,
                          ExpireTime =< Now andalso ExpireTime =/= 0],
    Fun = fun (Mount = #mount{transformation_id = TRid},
               Rtn) ->
                  case lists:member(TRid, ExpireAppIdList) of
                      true ->
                          NewMount = Mount#mount{transformation_id = 0},
                          [NewMount | Rtn];
                      _ -> [Mount | Rtn]
                  end
          end,
    NewMounts = lists:foldl(Fun, [], Mounts),
    NewAppearanceList = [{AppId, ExpireTime}
                         || {AppId, ExpireTime} <- AppearanceList,
                            ExpireTime > Now orelse ExpireTime =:= 0],
    case ExpireAppIdList of
        [_ | _] ->
            NameFun = fun (AppId, Rtn) ->
                              case mount_data:get(AppId) of
                                  #{name := _Name} -> [_Name | Rtn];
                                  _ -> Rtn
                              end
                      end,
            Names = lists:foldl(NameFun, [], ExpireAppIdList),
            StrNameFmt = string:join(lists:duplicate(length(Names),
                                                     "~ts"),
                                     "、"),
            Fmt1 = notice:format(lang:get("您的坐骑幻化~ts过期了,请知悉"),
                                 [{string_1, StrNameFmt}]),
            StrNames = [{string_2, 1, Name} || Name <- Names],
            Title = lang:get("坐骑幻化过期"),
            Content = notice:format(Fmt1, StrNames),
            mail:send(Role, Title, Content);
        _ -> ok
    end,
    Role#role{m_mount =
                  MMount#m_mount{mounts = NewMounts,
                                 appearance_list = NewAppearanceList}}.

mount_dye(AppearanceId, Role) ->
    case check_mount_dye(AppearanceId, Role) of
        {ok, ConfigDyeList} ->
            Loss = case mount_data:get_mount_dye(AppearanceId) of
                       {_, _, Cost} -> Cost;
                       _ -> {false, lang:get("该坐骑无法染色")}
                   end,
            case Loss of
                Loss2 when is_list(Loss2) ->
                    Loss3 = format:val_to_loss(Loss2),
                    case role_gain:do(Loss3, Role) of
                        {ok,
                         NRole1 = #role{m_mount =
                                            MMount = #m_mount{dye_list =
                                                                  DyeList,
                                                              dye_diff_list =
                                                                  DyeDiffList}}} ->
                            DyeInfo = #mount_dye{dye_id = DyeID,
                                                 cache_dye_list = LastList} =
                                          case lists:keyfind(AppearanceId,
                                                             #mount_dye.trans_id,
                                                             DyeList)
                                              of
                                              DyeInfo1 = #mount_dye{} ->
                                                  DyeInfo1;
                                              false ->
                                                  #mount_dye{trans_id =
                                                                 AppearanceId,
                                                             dye_id = 0}
                                          end,
                            DyeID2 = case DyeID =:= 0 of
                                         true -> AppearanceId;
                                         false -> DyeID
                                     end,
                            ConfigDyeList1 = lists:delete(DyeID2,
                                                          ConfigDyeList),
                            NConfigDyeList = case length(LastList) > 0 of
                                                 true ->
                                                     lists:foldl(fun (LastID,
                                                                      DoList) ->
                                                                         lists:delete(LastID,
                                                                                      DoList)
                                                                 end,
                                                                 ConfigDyeList1,
                                                                 LastList);
                                                 _ -> ConfigDyeList1
                                             end,
                            DyeList1 = util:rand_list_n(NConfigDyeList, 1),
                            NDyeInfo = DyeInfo#mount_dye{cache_dye_list =
                                                             DyeList1},
                            DyeList2 = lists:keystore(AppearanceId,
                                                      #mount_dye.trans_id,
                                                      DyeList,
                                                      NDyeInfo),
                            NMMount = MMount#m_mount{dye_list = DyeList2},
                            NRole2 = NRole1#role{m_mount = NMMount},
                            NDyeDiffList = lists:umerge([DyeDiffList,
                                                         DyeList1]),
                            NRole4 = case length(NDyeDiffList) =:=
                                              length(DyeDiffList)
                                         of
                                         false ->
                                             NRole3 = NRole2#role{m_mount =
                                                                      NMMount#m_mount{dye_diff_list
                                                                                          =
                                                                                          NDyeDiffList}},
                                             DyeTmpList = case
                                                              mount_data:get_mount_dye(AppearanceId)
                                                              of
                                                              {_, TmpList, _} ->
                                                                  TmpList;
                                                              _ -> []
                                                          end,
                                             EvtDyeDiffList = NDyeDiffList --
                                                                  NDyeDiffList
                                                                      --
                                                                      DyeTmpList,
                                             Evt = [#evt_mount_dye_diff{val =
                                                                            length(EvtDyeDiffList),
                                                                        dye_id =
                                                                            AppearanceId}],
                                             role_trigger:fire(Evt, NRole3);
                                         _ -> NRole2
                                     end,
                            push_mount(NRole4),
                            {ok, NRole4, DyeList1};
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        _ -> {false, lang:get("云彩不足")}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统错误")}
    end.

mount_dye_confirm(AppearanceId, DyeID, Index,
                  Role = #role{m_mount =
                                   MMount = #m_mount{dye_list = DyeList}}) ->
    case check_mount_dye(AppearanceId, Role) of
        {ok, _} ->
            case lists:keyfind(AppearanceId,
                               #mount_dye.trans_id,
                               DyeList)
                of
                DyeInfo = #mount_dye{cache_dye_list = CacheList} ->
                    case lists:member(DyeID, CacheList) of
                        true ->
                            DyeInfo1 = DyeInfo#mount_dye{cache_dye_list = [],
                                                         dye_id = DyeID},
                            DyeList2 = lists:keystore(AppearanceId,
                                                      #mount_dye.trans_id,
                                                      DyeList,
                                                      DyeInfo1),
                            NRole1 = Role#role{m_mount =
                                                   MMount#m_mount{dye_list =
                                                                      DyeList2}},
                            NRole2 = case rpc_transfrom_appearance(NRole1,
                                                                   Index,
                                                                   AppearanceId)
                                         of
                                         {ok, NRole3} -> NRole3;
                                         _ -> NRole1
                                     end,
                            push_mount(NRole2),
                            {ok, NRole2};
                        _ -> {false, lang:get("坐骑暂未获得该染色")}
                    end;
                false -> {false, lang:get("坐骑还未染色")}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统错误")}
    end.

mount_dye_cancel(AppearanceId,
                 Role = #role{m_mount =
                                  MMount = #m_mount{dye_list = DyeList}}) ->
    case check_mount_dye(AppearanceId, Role) of
        {ok, _} ->
            case lists:keyfind(AppearanceId,
                               #mount_dye.trans_id,
                               DyeList)
                of
                DyeInfo = #mount_dye{} ->
                    DyeInfo1 = DyeInfo#mount_dye{cache_dye_list = []},
                    DyeList1 = lists:keystore(AppearanceId,
                                              #mount_dye.trans_id,
                                              DyeList,
                                              DyeInfo1),
                    NRole = Role#role{m_mount =
                                          MMount#m_mount{dye_list = DyeList1}},
                    push_mount(NRole),
                    {ok, NRole};
                false -> {false, lang:get("坐骑还未染色")}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统错误")}
    end.

mount_dye_reset(AppearanceId,
                Role = #role{m_mount =
                                 MMount = #m_mount{dye_list = DyeList}}) ->
    DyeList1 = lists:keydelete(AppearanceId,
                               #mount_dye.trans_id,
                               DyeList),
    NRole = Role#role{m_mount =
                          MMount#m_mount{dye_list = DyeList1}},
    push_mount(NRole),
    {ok, NRole}.

check_mount_dye(AppearanceId,
                #role{m_mount =
                          #m_mount{appearance_list = AppearanceList}}) ->
    Now = date:unixtime(),
    case lists:keyfind(AppearanceId, 1, AppearanceList) of
        {_, ExpireTime}
            when ExpireTime =:= 0 orelse Now < ExpireTime ->
            case mount_data:get_mount_dye(AppearanceId) of
                {_, DyeList, _}
                    when is_list(DyeList) andalso length(DyeList) >= 1 ->
                    {ok, DyeList};
                _ -> {false, lang:get("该坐骑无法染色")}
            end;
        false -> {false, lang:get("暂未获得该幻化坐骑")};
        _ -> {false, lang:get("该幻化坐骑已过期")}
    end.

check_sprog_expire([#mount{mount_base_id = BaseId,
                           expire_time = ExpireTime}
                    | T],
                   List)
    when ExpireTime =/= 0 ->
    Now = date:unixtime(),
    case Now < ExpireTime of
        true ->
            NewList = [{0, BaseId, ExpireTime - Now} | List];
        _ -> NewList = [{1, BaseId, 0} | List]
    end,
    check_sprog_expire(T, NewList);
check_sprog_expire([_ | T], List) ->
    check_sprog_expire(T, List);
check_sprog_expire([], List) -> List.

expire_sprog(Role = #role{link = Link,
                          m_mount =
                              MMount = #m_mount{mounts = Mounts,
                                                ride_mount = RideMount}}) ->
    Now = date:unixtime(),
    TimeMountList = [Mount
                     || Mount = #mount{expire_time = ExpireTime} <- Mounts,
                        ExpireTime =/= 0],
    case TimeMountList of
        [_ | _] ->
            ExpireMountList = [Mount
                               || Mount = #mount{expire_time = ExpireTime}
                                      <- TimeMountList,
                                  ExpireTime =< Now],
            MinExpire = case lists:keysort(#mount.expire_time,
                                           TimeMountList)
                            of
                            [#mount{expire_time = Expire} | _] -> Expire - Now;
                            _ -> 0
                        end,
            NewRole = case MinExpire > 0 of
                          true ->
                              Timer = #timer{id = mount_expire,
                                             timeout = 1000 * MinExpire,
                                             m = mount, f = expire_sprog,
                                             a = []},
                              role_timer:add(Timer, Role);
                          _ -> Role
                      end,
            case ExpireMountList of
                [_ | _] ->
                    NewMounts = delete_expmount(ExpireMountList, Mounts),
                    MountRole = case RideMount of
                                    100 ->
                                        Role#role{m_mount =
                                                      MMount#m_mount{mounts =
                                                                         NewMounts,
                                                                     pre_mount_status
                                                                         = 0,
                                                                     ride_mount
                                                                         = 0},
                                                  s_ride = 0};
                                    _ ->
                                        Role#role{m_mount =
                                                      MMount#m_mount{mounts =
                                                                         NewMounts,
                                                                     pre_mount_status
                                                                         = 0}}
                                end,
                    ExpireIdList = [BaseId
                                    || #mount{mount_base_id = BaseId}
                                           <- ExpireMountList],
                    [H | _] = ExpireIdList,
                    Title = lang:get("坐骑到期提醒"),
                    Content =
                        util:flist(lang:get("您在爱丽儿处借用的坐骑已经到期了，可爱的小兔即将离开你{panel_2, "
                                            "13707, ~w,带她回家,1,3}"),
                                   [5]),
                    mail:send(MountRole,
                              #{title => Title, content => Content,
                                items => []}),
                    role:link_send(Link, 17028, {1, H, 0}),
                    AttrRole = attr:calc_and_push(MountRole),
                    LookRole = looks:calc(AttrRole),
                    looks:update_looks(Role, LookRole),
                    push_mount(LookRole),
                    {ok, LookRole};
                _ -> {ok, NewRole}
            end;
        [] -> {ok, Role}
    end.

delete_expmount([#mount{index = Index} | T], List) ->
    NewMounts = lists:keydelete(Index, #mount.index, List),
    delete_expmount(T, NewMounts);
delete_expmount([], NewList) -> NewList.

check_evolution(AppearanceId, AList) ->
    Now = date:unixtime(),
    case lists:keyfind(AppearanceId, 1, AList) of
        {_, ExpireTime}
            when ExpireTime =:= 0 orelse Now < ExpireTime ->
            case mount_data:get_mount_evolution(AppearanceId) of
                {_, EvolutionId, Cost, EvoluName} ->
                    {ok, EvolutionId, Cost, EvoluName};
                _ -> {false, lang:get("该坐骑无法变身")}
            end;
        false -> {false, lang:get("暂未获得该幻化坐骑")};
        _ -> {false, lang:get("该幻化坐骑已过期")}
    end.

calculate_Looks([decorate | T],
                Arg = #{decorate := DecorateList}, List) ->
    NList = case lists:keyfind(2,
                               #mount_decorate.decorate_index,
                               DecorateList)
                of
                #mount_decorate{decorate_base_id = DecorateBaseId,
                                is_hide = 0} ->
                    [{22, 0, DecorateBaseId, ""} | List];
                _ -> List
            end,
    calculate_Looks(T, Arg, NList);
calculate_Looks([dye | T],
                Arg = #{dye := DyeList,
                        transformation_id := TransBaseId},
                List) ->
    case lists:keyfind(TransBaseId,
                       #mount_dye.trans_id,
                       DyeList)
        of
        #mount_dye{dye_id = DyeID} when DyeID =/= 0 ->
            NList = [{20, 0, DyeID, ""} | List],
            calculate_Looks([], Arg, NList);
        _ -> calculate_Looks(T, Arg, List)
    end;
calculate_Looks([evolution | T],
                Arg = #{evolution := EvolutionList,
                        transformation_id := TransBaseId},
                List) ->
    NList = case lists:keyfind(TransBaseId,
                               #mount_evolution.trans_id,
                               EvolutionList)
                of
                #mount_evolution{evolution_id = EvolutionID}
                    when EvolutionID =/= 0 ->
                    [{20, 0, EvolutionID, ""} | List];
                _ -> [{20, 0, TransBaseId, ""} | List]
            end,
    calculate_Looks(T, Arg, NList);
calculate_Looks([], _, List) -> List.

gm_expire(Role = #role{link = Link,
                       m_mount =
                           MMount = #m_mount{mounts = Mounts,
                                             ride_mount = RideMount}}) ->
    Now = date:unixtime(),
    TimeMountList = [Mount
                     || Mount = #mount{expire_time = ExpireTime} <- Mounts,
                        ExpireTime =/= 0],
    case TimeMountList of
        [_ | _] ->
            MinExpire = case lists:keysort(#mount.expire_time,
                                           TimeMountList)
                            of
                            [#mount{expire_time = Expire} | _] -> Expire - Now;
                            _ -> 0
                        end,
            NewRole = case MinExpire > 0 of
                          true ->
                              Timer = #timer{id = mount_expire,
                                             timeout = 1000 * MinExpire,
                                             m = mount, f = expire_sprog,
                                             a = []},
                              role_timer:add(Timer, Role);
                          _ -> Role
                      end,
            NewMounts = delete_expmount(TimeMountList, Mounts),
            MountRole = case RideMount of
                            100 ->
                                NewRole#role{m_mount =
                                                 MMount#m_mount{mounts =
                                                                    NewMounts,
                                                                pre_mount_status
                                                                    = 0,
                                                                ride_mount = 0},
                                             s_ride = 0};
                            _ ->
                                NewRole#role{m_mount =
                                                 MMount#m_mount{mounts =
                                                                    NewMounts,
                                                                pre_mount_status
                                                                    = 0}}
                        end,
            logger:debug("-====~w==", [TimeMountList], mount, 2706),
            ExpireIdList = [BaseId
                            || #mount{mount_base_id = BaseId} <- TimeMountList],
            [H | _] = ExpireIdList,
            Title = lang:get("坐骑到期提醒"),
            Content =
                util:flist(lang:get("您在爱丽儿处借用的坐骑已经到期了，可爱的小兔即将离开你{panel_2, "
                                    "13707, ~w,带她回家,1,3}"),
                           [5]),
            mail:send(MountRole,
                      #{title => Title, content => Content, items => []}),
            role:link_send(Link, 17028, {1, H, 0}),
            AttrRole = attr:calc_and_push(MountRole),
            LookRole = looks:calc(AttrRole),
            looks:update_looks(Role, LookRole),
            push_mount(LookRole),
            {ok, LookRole};
        [] -> {ok, Role}
    end.

gm_levelUp(Index, UpLev,
           Role = #role{classes = Classes,
                        m_mount = MMount = #m_mount{mounts = MountList}}) ->
    case lists:keyfind(Index, #mount.index, MountList) of
        Mount = #mount{lev = Lev, skill_point = SkillPoint} ->
            case mount_data:get_lev({Lev + UpLev - 1, Index}) of
                false ->
                    io:format("不能升级~n"),
                    ok;
                #{skill_cnt := NewSkillCnt} ->
                    io:format("可以升级~n"),
                    LevelUpMount = Mount#mount{fail_times = 0,
                                               lev = Lev + UpLev,
                                               skill_point =
                                                   SkillPoint +
                                                       getSkillPoint(Lev,
                                                                     Lev +
                                                                         UpLev,
                                                                     Index)},
                    io:format("领悟技能~n"),
                    NewSkillMount = case mount_data:get_lev({Lev, Index}) of
                                        #{skill_cnt := OldSkillCnt}
                                            when OldSkillCnt < NewSkillCnt ->
                                            io:format("开始领悟技能~n"),
                                            produce_mount_skill(LevelUpMount,
                                                                Classes,
                                                                OldSkillCnt,
                                                                NewSkillCnt);
                                        _Oth ->
                                            io:format("不需要领悟技能~n"),
                                            LevelUpMount
                                    end,
                    io:format("开始计算分数~n"),
                    ScoreMount =
                        mount_attr:update_mount_score(NewSkillMount),
                    NewMount = ScoreMount,
                    io:format("开始更新数据~n"),
                    NewMounts = lists:keyreplace(Index,
                                                 #mount.index,
                                                 MountList,
                                                 NewMount),
                    MountRole = Role#role{m_mount =
                                              MMount#m_mount{mounts =
                                                                 NewMounts}},
                    PetRole = mount_attr:batch_calc_pet(MountRole),
                    io:format("成就相关~n"),
                    AchieveRole = loopForTrigerFile(Lev,
                                                    Lev + UpLev,
                                                    PetRole),
                    NewRole = attr:calc_and_push(AchieveRole),
                    io:format("这里结束了~n"),
                    push_mount(NewRole, Index),
                    {ok, NewRole}
            end;
        _ -> ok
    end.

getSkillPoint(Lev, EndLev, Index) ->
    getSkillPoint(Lev, EndLev, Index, 0).

getSkillPoint(Lev, EndLev, Index, Num) ->
    if Lev >= EndLev -> Num;
       true ->
           case mount_data:get_lev({Lev, Index}) of
               #{skill_point := Cnt} ->
                   getSkillPoint(Lev + 1, EndLev, Index, Num + Cnt);
               _Oth -> Num
           end
    end.

loopForTrigerFile(Lev, EndLev, Role) ->
    if Lev >= EndLev -> Role;
       true ->
           NewRole = role_trigger:fire(#evt_mount_lev{lev =
                                                          Lev + 1},
                                       Role),
           loopForTrigerFile(Lev + 1, EndLev, NewRole)
    end.

mount_decorate_appearance(Role) ->
    NewRole = repair_mount_decorate_appearance(Role),
    push_mount(NewRole),
    {ok, NewRole}.

repair_mount_decorate_appearance(Role = #role{m_mount =
                                                  MMounts = #m_mount{mounts =
                                                                         Mounts,
                                                                     appearance_list
                                                                         =
                                                                         AppLists}})
    when length(AppLists) > 0 ->
    Result1 = case lists:keyfind(1108, 1, AppLists) of
                  {1108, _} -> true;
                  _ -> false
              end,
    Result2 = case lists:keyfind(1118, 1, AppLists) of
                  {1118, _} -> true;
                  _ -> false
              end,
    case Result1 orelse Result2 of
        true ->
            AppLists1 = lists:keydelete(1108, 1, AppLists),
            AppLists2 = lists:keydelete(1118, 1, AppLists1),
            AppLists3 = repair_mount_decorate_appearance(Mounts,
                                                         AppLists2),
            Role#role{m_mount =
                          MMounts#m_mount{appearance_list = AppLists3}};
        _ -> Role
    end;
repair_mount_decorate_appearance(Role) -> Role.

repair_mount_decorate_appearance([], AppLists) ->
    AppLists;
repair_mount_decorate_appearance([#mount{decorate_list =
                                             DecorateList}
                                  | T],
                                 AppLists) ->
    Fun = fun (#mount_decorate{decorate_base_id = DctId},
               Rtn) ->
                  case mount_data:get_decorate(DctId) of
                      #{appearance := AId} -> [{AId, 0} | Rtn];
                      _ -> Rtn
                  end
          end,
    AppLists1 = lists:foldl(Fun, [], DecorateList),
    AppLists2 = [{AppId, ExpireTime}
                 || {AppId, ExpireTime} <- AppLists1,
                    lists:keymember(AppId, 1, AppLists) =:= false],
    NewAppLists = AppLists ++ AppLists2,
    repair_mount_decorate_appearance(T, NewAppLists).

do_rand_skill(Role = #role{classes = Classes,
                           m_mount = MMount = #m_mount{mounts = Mounts}},
              Index, SkillIndex) ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{upgrade_lev = UpLev,
                       skill_list = SkillList} ->
            case mount_data:get_lev({UpLev, Index}) of
                #{skill_cnt := SkillCnt} when SkillIndex =< SkillCnt ->
                    case mount_data:get_rand_skill_cost({Index, SkillIndex})
                        of
                        Cost = [_ | _] ->
                            Loss = format:val_to_loss(Cost,
                                                      #{item_base_id_auto_buy =>
                                                            1,
                                                        auto_scene =>
                                                            lang:get("坐骑技能重置")}),
                            case role_gain:do_notice(Loss, Role) of
                                {ok, LossRole} ->
                                    IngoreSkillId = case
                                                        lists:keyfind(SkillIndex,
                                                                      #mount_skill.skill_index,
                                                                      SkillList)
                                                        of
                                                        #mount_skill{skill_id =
                                                                         _SKillId} ->
                                                            _SKillId;
                                                        _ -> 0
                                                    end,
                                    case rand_mount_skill(Index,
                                                          Classes,
                                                          SkillIndex,
                                                          [IngoreSkillId])
                                        of
                                        {ok, SkillId} ->
                                            NewMountSkill =
                                                #mount_skill{skill_lev =
                                                                 SkillLev} =
                                                    case
                                                        lists:keyfind(SkillIndex,
                                                                      #mount_skill.skill_index,
                                                                      SkillList)
                                                        of
                                                        MountSkill =
                                                            #mount_skill{} ->
                                                            MountSkill#mount_skill{skill_id
                                                                                       =
                                                                                       SkillId};
                                                        _ ->
                                                            #mount_skill{skill_id
                                                                             =
                                                                             SkillId,
                                                                         skill_index
                                                                             =
                                                                             SkillIndex}
                                                    end,
                                            NSkillList =
                                                lists:keyreplace(SkillIndex,
                                                                 #mount_skill.skill_index,
                                                                 SkillList,
                                                                 NewMountSkill),
                                            SkillMount = Mount#mount{skill_list
                                                                         =
                                                                         NSkillList},
                                            ScoreMount =
                                                mount_attr:update_mount_score(SkillMount),
                                            NewMount = ScoreMount,
                                            NewMounts = lists:keyreplace(Index,
                                                                         #mount.index,
                                                                         Mounts,
                                                                         NewMount),
                                            MountRole = LossRole#role{m_mount =
                                                                          MMount#m_mount{mounts
                                                                                             =
                                                                                             NewMounts}},
                                            MountRole1 =
                                                mount_attr:calc_skill_prac(MountRole),
                                            AttrRole =
                                                attr:calc_and_push(MountRole1),
                                            NewRole =
                                                mount_attr:batch_calc_pet(AttrRole),
                                            push_mount(NewRole, Index),
                                            log:log_mount(NewRole,
                                                          "技能洗练",
                                                          Index),
                                            {OldSkillName, OldSkillColor} = case
                                                                                skill_data:get_mount({IngoreSkillId,
                                                                                                      SkillLev})
                                                                                of
                                                                                #{name
                                                                                      :=
                                                                                      _OSklName} ->
                                                                                    {_OSklName,
                                                                                     5};
                                                                                _ ->
                                                                                    {lang:get("无名技能"),
                                                                                     0}
                                                                            end,
                                            {NewSkillName, NewSkillColor} = case
                                                                                skill_data:get_mount({SkillId,
                                                                                                      SkillLev})
                                                                                of
                                                                                #{name
                                                                                      :=
                                                                                      _NSklName} ->
                                                                                    {_NSklName,
                                                                                     5};
                                                                                _ ->
                                                                                    {lang:get("无名技能"),
                                                                                     0}
                                                                            end,
                                            NoticeMsg =
                                                notice:format("~ts成功洗炼为~ts",
                                                              [{string_2,
                                                                OldSkillColor,
                                                                OldSkillName},
                                                               {string_2,
                                                                NewSkillColor,
                                                                NewSkillName}]),
                                            notice:return(NoticeMsg),
                                            {ok, NewRole};
                                        {false, Reason} -> {false, Reason}
                                    end;
                                {false, #loss{msg = Msg}} -> {false, Msg};
                                _ -> {false, lang:get("资源不足，无法进行坐骑技能洗练")}
                            end;
                        _ -> {false, lang:get("洗练消耗配置错误")}
                    end;
                _ -> {false, lang:get("您的坐骑还未开启该技能槽")}
            end;
        _ -> {false, lang:get("您还未获得该坐骑，继续努力哦")}
    end.

do_change_skill(Role = #role{classes = Classes,
                             m_mount = MMount = #m_mount{mounts = Mounts}},
                Index, SkillIndex, TargetSkillId) ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        Mount = #mount{skill_list = SkillList,
                       upgrade_lev = Lev} ->
            case mount_data:get_lev({Lev, Index}) of
                #{skill_cnt := Cnt} when Cnt >= SkillIndex ->
                    case check_target_skillId(Index,
                                              Classes,
                                              SkillIndex,
                                              TargetSkillId)
                        of
                        1 ->
                            case check_diff_skill(SkillList,
                                                  SkillIndex,
                                                  TargetSkillId)
                                of
                                1 ->
                                    case
                                        mount_data:get_select_skill_cost({Index,
                                                                          SkillIndex})
                                        of
                                        CostList = [_ | _] ->
                                            LossList =
                                                format:val_to_loss(CostList),
                                            case role_gain:do_notice(LossList,
                                                                     Role)
                                                of
                                                {ok, LossRole} ->
                                                    NewMountSkill =
                                                        #mount_skill{skill_lev =
                                                                         SkillLev} =
                                                            case
                                                                lists:keyfind(SkillIndex,
                                                                              #mount_skill.skill_index,
                                                                              SkillList)
                                                                of
                                                                MountSkill =
                                                                    #mount_skill{} ->
                                                                    MountSkill#mount_skill{skill_id
                                                                                               =
                                                                                               TargetSkillId};
                                                                _ ->
                                                                    #mount_skill{skill_id
                                                                                     =
                                                                                     TargetSkillId,
                                                                                 skill_index
                                                                                     =
                                                                                     SkillIndex}
                                                            end,
                                                    NSkillList =
                                                        lists:keyreplace(SkillIndex,
                                                                         #mount_skill.skill_index,
                                                                         SkillList,
                                                                         NewMountSkill),
                                                    SkillMount =
                                                        Mount#mount{skill_list =
                                                                        NSkillList},
                                                    ScoreMount =
                                                        mount_attr:update_mount_score(SkillMount),
                                                    NewMount = ScoreMount,
                                                    NewMounts =
                                                        lists:keyreplace(Index,
                                                                         #mount.index,
                                                                         Mounts,
                                                                         NewMount),
                                                    MountRole =
                                                        LossRole#role{m_mount =
                                                                          MMount#m_mount{mounts
                                                                                             =
                                                                                             NewMounts}},
                                                    MountRole1 =
                                                        mount_attr:calc_skill_prac(MountRole),
                                                    AttrRole =
                                                        attr:calc_and_push(MountRole1),
                                                    NewRole =
                                                        mount_attr:batch_calc_pet(AttrRole),
                                                    push_mount(NewRole, Index),
                                                    log:log_mount(NewRole,
                                                                  "技能洗练",
                                                                  Index),
                                                    #mount_skill{skill_id =
                                                                     OldSkillId} =
                                                        lists:keyfind(SkillIndex,
                                                                      #mount_skill.skill_index,
                                                                      SkillList),
                                                    {OldSkillName,
                                                     OldSkillColor} =
                                                        case
                                                            skill_data:get_mount({OldSkillId,
                                                                                  SkillLev})
                                                            of
                                                            #{name :=
                                                                  _OSklName} ->
                                                                {_OSklName, 5};
                                                            _ ->
                                                                {lang:get("无名技能"),
                                                                 0}
                                                        end,
                                                    {NewSkillName,
                                                     NewSkillColor} =
                                                        case
                                                            skill_data:get_mount({TargetSkillId,
                                                                                  SkillLev})
                                                            of
                                                            #{name :=
                                                                  _NSklName} ->
                                                                {_NSklName, 5};
                                                            _ ->
                                                                {lang:get("无名技能"),
                                                                 0}
                                                        end,
                                                    NoticeMsg =
                                                        notice:format("~ts成功洗炼为~ts",
                                                                      [{string_2,
                                                                        OldSkillColor,
                                                                        OldSkillName},
                                                                       {string_2,
                                                                        NewSkillColor,
                                                                        NewSkillName}]),
                                                    notice:return(NoticeMsg),
                                                    {ok, NewRole};
                                                _ ->
                                                    {false,
                                                     lang:get("资源不足，无法进行坐骑技能洗练")}
                                            end;
                                        _ ->
                                            {false, lang:get("配置错误,获取不到指定洗练资源")}
                                    end;
                                _ -> {false, lang:get("选中技能为当前技能，无需洗练")}
                            end;
                        _ -> {false, lang:get("选中技能不在可选技能范围内")}
                    end;
                _ -> {false, lang:get("该技能槽未开放")}
            end;
        _ -> {false, lang:get("尚未获得该坐骑")}
    end.

check_target_skillId(Index, Classes, SkillIndex,
                     TargetSkillId) ->
    ClassesRandList = mount_data:get_rand_skill({Index,
                                                 Classes,
                                                 SkillIndex}),
    AllRandList = mount_data:get_rand_skill({Index,
                                             0,
                                             SkillIndex}),
    AllSkillList = ClassesRandList ++ AllRandList,
    loopforPrintSkillId(AllSkillList),
    logger:debug("~w",
                 [lists:keyfind(TargetSkillId, 1, AllSkillList)],
                 mount,
                 2987),
    case lists:keyfind(TargetSkillId, 1, AllSkillList) of
        T when is_tuple(T) -> 1;
        _ -> 0
    end.

check_diff_skill(SkillList, SkillIndex,
                 TargetSkillId) ->
    case lists:keyfind(SkillIndex,
                       #mount_skill.skill_index,
                       SkillList)
        of
        #mount_skill{skill_id = TargetSkillId} -> 0;
        _ -> 1
    end.

loopforPrintSkillId([]) -> ok;
loopforPrintSkillId([{_A, _} | T]) ->
    logger:debug("mount can learn skill id :~w",
                 [_A],
                 mount,
                 3006),
    loopforPrintSkillId(T).

check_ride_transformation(Mounts, RideMount) ->
    case lists:keyfind(RideMount, #mount.index, Mounts) of
        #mount{transformation_id = TransformatId} ->
            is_doubleride_id(TransformatId);
        _ -> false
    end.

is_doubleride_id(TransformatId) ->
    case mount_data:get_double_riders() of
        MountList when is_list(MountList) ->
            Ids = [Id || {Id, Flag} <- MountList, Flag =:= 1],
            case lists:member(TransformatId, Ids) of
                true -> ok;
                false -> false
            end;
        _ -> false
    end.

check_passager(Role = #role{m_mount =
                                #m_mount{double_ride_role = DRideRole},
                            m_combat = #m_combat{pid = CombatPid},
                            m_team = #m_team{status = Status}}) ->
    case DRideRole of
        {1, "", 0} ->
            case Status of
                3 ->
                    case is_pid(CombatPid) of
                        true -> {false, lang:get("战斗中无法共乘")};
                        _ ->
                            team:follow(Role),
                            {ok}
                    end;
                2 -> {ok};
                _ -> {false, lang:get("无法共乘")}
            end;
        _ -> {false, lang:get("你已在共乘中")}
    end.

check_driver({Rid, Plat, ZoneId}) ->
    logger:debug("检查司机状态是否正常", [], mount, 3059),
    case role:apply(sync,
                    {Rid, Plat, ZoneId},
                    {mount, check_driver_ride, []})
        of
        {ok, Mag} -> {ok, Mag};
        {false, Why} -> {false, Why}
    end.

check_driver_ride(#role{pos = #pos{map = Map},
                        s_ride = SRide,
                        m_mount =
                            #m_mount{ride_mount = RideMount, mounts = Mounts,
                                     double_ride_role = DRideRole}}) ->
    case Map of
        60001 -> {ok, {false, ""}};
        _ ->
            case DRideRole of
                {1, "", 0} ->
                    case check_ride_transformation(Mounts, RideMount) of
                        ok ->
                            case lists:keyfind(RideMount, #mount.index, Mounts)
                                of
                                #mount{decorate_list = DecorateList} ->
                                    case SRide of
                                        1 ->
                                            case lists:keyfind(2,
                                                               #mount_decorate.decorate_index,
                                                               DecorateList)
                                                of
                                                #mount_decorate{} ->
                                                    {ok, {ok, ""}};
                                                _ ->
                                                    {ok,
                                                     {false, "对方的坐骑已发生变化，无法共乘"}}
                                            end;
                                        _ -> {ok, {ok, ""}}
                                    end;
                                _ -> {ok, {false, "对方的坐骑已发生变化，无法共乘"}}
                            end;
                        false -> {ok, {false, "对方的坐骑已发生变化，无法共乘"}}
                    end;
                _ -> {ok, {false, "对方正在多人共乘中"}}
            end
    end.

check_transfrom(DRideRole, IsDriver) ->
    case DRideRole of
        {1, "", 0} -> true;
        _ ->
            case IsDriver of
                0 -> false;
                1 -> true
            end
    end.

batch_login() ->
    role_group:apply(world, {mount, login, []}),
    ok.

