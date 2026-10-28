-file("src/mod/campaign/camp_national_wisdom.erl", 1).

-module(camp_national_wisdom).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

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

-file("src/mod/campaign/camp_national_wisdom.erl", 14).

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

-file("src/mod/campaign/camp_national_wisdom.erl", 15).

-file("inc/camp_national_wisdom.hrl", 1).

-record(national_wisdom_joiner,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         pid = undefinded,
         looks = [],
         done_answer = 0,
         rank = 0}).

-file("src/mod/campaign/camp_national_wisdom.erl", 16).

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

-file("src/mod/campaign/camp_national_wisdom.erl", 17).

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

-file("src/mod/campaign/camp_national_wisdom.erl", 18).

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

-file("src/mod/campaign/camp_national_wisdom.erl", 19).

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

-file("src/mod/campaign/camp_national_wisdom.erl", 20).

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

-file("src/mod/campaign/camp_national_wisdom.erl", 21).

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

-file("src/mod/campaign/camp_national_wisdom.erl", 22).

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

-file("src/mod/campaign/camp_national_wisdom.erl", 23).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         ask_id = 0,
         joins = [],
         winner = [],
         luckyer_list = [],
         right_count = 0,
         timer_ref}).

-export([idle/2,
         active/2,
         prepare/2,
         respond/2,
         reward/2]).

-export([start_link/0,
         info/1,
         call/1,
         cast/1,
         next/0,
         apply_get_wisdom_reward/4]).

-export([push_14070/1,
         rpc_join_national_wisdom/1,
         rpc_answer_national_wisdom/3]).

start_link() ->
    gen_fsm:start_link({local, camp_national_wisdom},
                       camp_national_wisdom,
                       [],
                       []).

call(Msg) ->
    case catch
             gen_fsm:sync_send_all_state_event(camp_national_wisdom,
                                               Msg,
                                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

cast(Msg) ->
    gen_fsm:send_all_state_event(camp_national_wisdom, Msg).

info(Msg) -> camp_national_wisdom ! Msg.

next() ->
    gen_fsm:send_event(camp_national_wisdom, timeout),
    camp_national_wisdom ! print.

push_14070(#role{pid = RolePid}) ->
    cast({open_info, RolePid}).

rpc_join_national_wisdom(#role{lev = Lev})
    when Lev < 30 ->
    {false, lang:get("等级不足30级，无法参加超级智多星活动")};
rpc_join_national_wisdom(#role{id = RoleId, name = Name,
                               pid = RolePid, lev = Lev, classes = Classes,
                               sex = Sex, s_looks = Looks}) ->
    case case catch
                  gen_fsm:sync_send_all_state_event(camp_national_wisdom,
                                                    {join,
                                                     RoleId,
                                                     RolePid,
                                                     Name,
                                                     Lev,
                                                     Classes,
                                                     Sex,
                                                     Looks},
                                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {ok, AskId, DoneAnswer, LuckyerList} ->
            {ok, AskId, DoneAnswer, LuckyerList};
        {false, Reason} -> {false, Reason};
        _Err ->
            logger:error("参与国庆智多星失败:~w",
                         [_Err],
                         camp_national_wisdom,
                         107),
            {false, lang:get("智慧之神已经离开了，请期待下次到来！")}
    end.

rpc_answer_national_wisdom(#role{lev = Lev}, _, _)
    when Lev < 30 ->
    {false, lang:get("等级不足30级，无法参加超级智多星活动")};
rpc_answer_national_wisdom(Role = #role{id = RoleId},
                           Answer, IsWorld) ->
    case case catch
                  gen_fsm:sync_send_all_state_event(camp_national_wisdom,
                                                    {answer, RoleId, Answer},
                                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {true, RightAnswer} ->
            case IsWorld of
                0 ->
                    StrAnswer = case Answer of
                                    1 -> lang:get("A");
                                    2 -> lang:get("B");
                                    3 -> lang:get("C");
                                    4 -> lang:get("D");
                                    _ -> lang:get("A")
                                end,
                    chat:send_chat_msg(world, StrAnswer, Role);
                _ -> ok
            end,
            {ok, RightAnswer};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("智慧之神已经离开了，请期待下次到来！")}
    end.

init([]) ->
    process_flag(trap_exit, true),
    {StateName, TimeOut} = next_state(),
    logger:debug("启动智多星答题进程:~w, 超时时间:~w",
                 [StateName, TimeOut],
                 camp_national_wisdom,
                 143),
    State = #state{ts = now(), timeout = TimeOut,
                   ask_id = 0, joins = [], right_count = 0},
    NewState = case StateName of
                   active -> start_timer(State);
                   _ -> State
               end,
    {ok, StateName, NewState}.

handle_event({open_info, RolePid}, StateName,
             State = #state{timeout = TimeOut, ask_id = AskId,
                            ts = Ts}) ->
    {_, BegSec, _} = Ts,
    {_, Sec, _} = now(),
    Data = case StateName of
               prepare -> {0, AskId, 0};
               respond ->
                   LeftTime = TimeOut div 1000 - (Sec - BegSec),
                   {1, AskId, LeftTime};
               _ -> {0, AskId, 0}
           end,
    role:pack_send(RolePid, 14070, Data),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    logger:error("未知消息 ~w",
                 [_Event],
                 camp_national_wisdom,
                 174),
    continue(StateName, State).

handle_sync_event({join,
                   RoleId,
                   RolePid,
                   Name,
                   Lev,
                   Classes,
                   Sex,
                   Looks},
                  _From, StateName,
                  State = #state{joins = Joins, ask_id = AskId,
                                 luckyer_list = LuckyerList}) ->
    case StateName of
        respond ->
            case lists:keyfind(RoleId,
                               #national_wisdom_joiner.id,
                               Joins)
                of
                #national_wisdom_joiner{done_answer = DoneAnswer} ->
                    Reply = {ok, AskId, DoneAnswer, LuckyerList},
                    continue(Reply, StateName, State);
                _ ->
                    JoinInfo = #national_wisdom_joiner{id = RoleId,
                                                       pid = RolePid,
                                                       name = Name,
                                                       classes = Classes,
                                                       lev = Lev, sex = Sex,
                                                       looks = Looks},
                    NewJoins = lists:keystore(RoleId,
                                              #national_wisdom_joiner.id,
                                              Joins,
                                              JoinInfo),
                    NewState = State#state{joins = NewJoins},
                    Reply = {ok, AskId, 0, LuckyerList},
                    continue(Reply, StateName, NewState)
            end;
        _ ->
            Reply = {false, lang:get("智慧之神已经离开了，请期待下次到来！")},
            continue(Reply, StateName, State)
    end;
handle_sync_event({answer, RoleId, Answer}, _From,
                  StateName = respond,
                  State = #state{ask_id = AskId, joins = Joins,
                                 winner = Winner, right_count = RightCount}) ->
    case lists:keyfind(RoleId,
                       #national_wisdom_joiner.id,
                       Joins)
        of
        WisdomInfo = #national_wisdom_joiner{id = RoleId,
                                             done_answer = 0} ->
            RightAnswer =
                question_data:get_national_wisdom_answer(AskId),
            {SelectAnswer, _, _, _, _} = RightAnswer,
            case SelectAnswer =:= Answer of
                true ->
                    case RightCount < 20 of
                        true ->
                            case lists:keymember(RoleId,
                                                 #national_wisdom_joiner.id,
                                                 Winner)
                                of
                                true ->
                                    Reply = {false,
                                             lang:get("您已经回答过问题了，无需重复作答")},
                                    continue(Reply, StateName, State);
                                false ->
                                    NewWinnerInfo =
                                        WisdomInfo#national_wisdom_joiner{rank =
                                                                              RightCount
                                                                                  +
                                                                                  1},
                                    NewWinner = [NewWinnerInfo | Winner],
                                    Reply = {true, RightAnswer},
                                    NewWisdomInfo =
                                        WisdomInfo#national_wisdom_joiner{done_answer
                                                                              =
                                                                              Answer},
                                    NewJoins = lists:keystore(RoleId,
                                                              #national_wisdom_joiner.id,
                                                              Joins,
                                                              NewWisdomInfo),
                                    NewState = State#state{joins = NewJoins,
                                                           winner = NewWinner,
                                                           right_count =
                                                               RightCount + 1},
                                    continue(Reply, StateName, NewState)
                            end;
                        false ->
                            Reply = {true, RightAnswer},
                            NewWisdomInfo =
                                WisdomInfo#national_wisdom_joiner{done_answer =
                                                                      Answer},
                            NewJoins = lists:keystore(RoleId,
                                                      #national_wisdom_joiner.id,
                                                      Joins,
                                                      NewWisdomInfo),
                            NewState = State#state{joins = NewJoins},
                            continue(Reply, StateName, NewState)
                    end;
                false ->
                    Reply = {true, RightAnswer},
                    NewWisdomInfo =
                        WisdomInfo#national_wisdom_joiner{done_answer = Answer},
                    NewJoins = lists:keystore(RoleId,
                                              #national_wisdom_joiner.id,
                                              Joins,
                                              NewWisdomInfo),
                    NewState = State#state{joins = NewJoins},
                    continue(Reply, StateName, NewState)
            end;
        #national_wisdom_joiner{done_answer = DoneAnswer}
            when DoneAnswer =/= 0 ->
            Reply = {false, lang:get("您已经回答过问题，无需重复作答")},
            continue(Reply, StateName, State);
        _ ->
            Reply = {false, lang:get("请您先查阅智慧之神的题目吧")},
            continue(Reply, StateName, State)
    end;
handle_sync_event({answer, _, _}, _From, StateName,
                  State) ->
    Reply = {false, lang:get("智慧之神已经离开了，请期待下次到来！")},
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:error("未知消息 ~w",
                 [_Event],
                 camp_national_wisdom,
                 248),
    Reply = false,
    continue(Reply, StateName, State).

handle_info(gm_start, StateName, State)
    when StateName =:= idle orelse StateName =:= active ->
    enter_prepare(State);
handle_info(gm_start, StateName, State) ->
    continue(StateName, State);
handle_info(print, StateName, State) ->
    logger:info("状态名：~w 活动状态:~w",
                [StateName, State],
                camp_national_wisdom,
                260),
    continue(StateName, State);
handle_info(check_start, active, State) ->
    {_, Time} = date:seconds_to_datetime(date:unixtime()),
    case camp_national_data:get_time(Time) of
        Ratio when is_integer(Ratio) ->
            case util:rand(1, 1000) =< Ratio of
                true -> enter_prepare(State);
                _ ->
                    State1 = start_timer(State),
                    continue(active, State1)
            end;
        _ ->
            State1 = start_timer(State),
            continue(active, State1)
    end;
handle_info(check_start, StateName, State) ->
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:error("未知消息 ~w",
                 [_Info],
                 camp_national_wisdom,
                 285),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = TimeOut}) ->
    {next_state,
     StateName,
     State,
     util:time_left(TimeOut, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = TimeOut}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(TimeOut, Ts)}.

start_timer(State = #state{timer_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    {EndH, _, _} = {22, 0, 0},
    {_, Time} = date:seconds_to_datetime(date:unixtime()),
    case Time of
        {H, M, _} when H < EndH andalso H =/= 23 ->
            NextSec = if M < 20 -> date:next_diff(H, 20, 0);
                         M < 40 -> date:next_diff(H, 40, 0);
                         true -> date:next_diff(H + 1, 0, 0)
                      end,
            Ref = erlang:send_after(NextSec * 1000,
                                    self(),
                                    check_start),
            logger:info("下次答题判断时间[~w]",
                        [NextSec],
                        camp_national_wisdom,
                        330),
            State#state{timer_ref = Ref};
        _Else -> State
    end.

enter_prepare(State) ->
    NoticeMsg =
        notice:format(lang:get("~ts活动即将开启，勇士们做好准备，接受智慧考验，获得幸运奖励吧{face_1,18}"),
                      [{string_2, 1, lang:get("[超级智多星]")}]),
    notice:cast(all, 5, NoticeMsg),
    NewState = State#state{ts = now(), timeout = 60000,
                           joins = []},
    continue(prepare, NewState).

idle(timeout, State) ->
    Timeout = date:next_diff({22, 0, 0}) * 1000,
    NewState = State#state{ts = now(), timeout = Timeout},
    NewState1 = start_timer(NewState),
    continue(active, NewState1);
idle(_Any, State) -> continue(idle, State).

active(timeout, State) ->
    Timeout = date:next_diff({9, 0, 0}) * 1000,
    NewState = State#state{ts = now(), timeout = Timeout},
    continue(idle, NewState);
active(_Any, State) -> continue(active, State).

prepare(timeout, State) ->
    NoticeMsg =
        notice:format(lang:get("~ts活动开始啦，勇士们抓紧时间快速答对题目，赢取奖励吧{face_1,18}"),
                      [{string_2, 1, lang:get("[超级智多星]")}]),
    notice:cast(all, 5, NoticeMsg),
    Qustions = question_data:national_wisdom_list(),
    AskId = util:rand_list(Qustions),
    role_group:pack_send(world,
                         14070,
                         {1, AskId, 60000 div 1000}),
    case question_data:get_national_wisdom_desc(AskId) of
        {QuestionDesc, OpnA, null, null, null} ->
            ScrollMsg = notice:format(lang:get("~ts A:~ts~ts"),
                                      [{string_2, 1, QuestionDesc},
                                       {string_2, 1, OpnA},
                                       {string_2,
                                        5,
                                        lang:get("(可在智多星图标中选择答案或在世界频道直接输入选项)")}]),
            notice:cast(all, 11, ScrollMsg),
            WorldMsg = notice:format(lang:get("~ts\nA:~ts\n~ts"),
                                     [{string_2, 1, QuestionDesc},
                                      {string_2, 1, OpnA},
                                      {string_2,
                                       5,
                                       lang:get("(可在智多星图标中选择答案或在世界频道直接输入选项)")}]),
            notice:cast(all, 14, WorldMsg);
        {QuestionDesc, OpnA, OpnB, null, null} ->
            ScrollMsg =
                notice:format(lang:get("~ts A:~ts B:~ts~ts"),
                              [{string_2, 1, QuestionDesc},
                               {string_2, 1, OpnA},
                               {string_2, 1, OpnB},
                               {string_2,
                                5,
                                lang:get("(可在智多星图标中选择答案或在世界频道直接输入选项)")}]),
            notice:cast(all, 14, ScrollMsg),
            WorldMsg =
                notice:format(lang:get("~ts\nA:~ts B:~ts\n~ts"),
                              [{string_2, 1, QuestionDesc},
                               {string_2, 1, OpnA},
                               {string_2, 1, OpnB},
                               {string_2,
                                5,
                                lang:get("(可在智多星图标中选择答案或在世界频道直接输入选项)")}]),
            notice:cast(all, 14, WorldMsg);
        {QuestionDesc, OpnA, OpnB, OpnC, null} ->
            ScrollMsg =
                notice:format(lang:get("~ts A:~ts B:~ts C:~ts~ts"),
                              [{string_2, 1, QuestionDesc},
                               {string_2, 1, OpnA},
                               {string_2, 1, OpnB},
                               {string_2, 1, OpnC},
                               {string_2,
                                5,
                                lang:get("(可在智多星图标中选择答案或在世界频道直接输入选项)")}]),
            notice:cast(all, 11, ScrollMsg),
            WorldMsg =
                notice:format(lang:get("~ts\nA:~ts B:~ts C:~ts\n~ts"),
                              [{string_2, 1, QuestionDesc},
                               {string_2, 1, OpnA},
                               {string_2, 1, OpnB},
                               {string_2, 1, OpnC},
                               {string_2,
                                5,
                                lang:get("(可在智多星图标中选择答案或在世界频道直接输入选项)")}]),
            notice:cast(all, 14, WorldMsg);
        {QuestionDesc, OpnA, OpnB, OpnC, OpnD} ->
            ScrollMsg =
                notice:format(lang:get("~ts A:~ts B:~ts C:~ts D:~ts~ts"),
                              [{string_2, 1, QuestionDesc},
                               {string_2, 1, OpnA},
                               {string_2, 1, OpnB},
                               {string_2, 1, OpnC},
                               {string_2, 1, OpnD},
                               {string_2,
                                5,
                                lang:get("(可在智多星图标中选择答案或在世界频道直接输入选项)")}]),
            notice:cast(all, 11, ScrollMsg),
            WorldMsg =
                notice:format(lang:get("~ts\nA:~ts B:~ts C:~ts D:~ts\n~ts"),
                              [{string_2, 1, QuestionDesc},
                               {string_2, 1, OpnA},
                               {string_2, 1, OpnB},
                               {string_2, 1, OpnC},
                               {string_2, 1, OpnD},
                               {string_2,
                                5,
                                lang:get("(可在智多星图标中选择答案或在世界频道直接输入选项)")}]),
            notice:cast(all, 14, WorldMsg);
        _ -> skip
    end,
    NewState = State#state{ts = now(), timeout = 50000,
                           ask_id = AskId, joins = [], right_count = 0},
    continue(respond, NewState);
prepare(_Any, State) -> continue(prepare, State).

respond(timeout, State) ->
    role_group:pack_send(world, 14070, {0, 0, 0}),
    NewState = State#state{ts = now(), timeout = 1000},
    continue(reward, NewState);
respond(_Any, State) -> continue(respond, State).

reward(timeout,
       State = #state{winner = Winner, joins = Joins,
                      ask_id = AskId}) ->
    RightAnswer =
        question_data:get_national_wisdom_answer(AskId),
    LuckyerList = case util:rand_list_n(Winner, 3) of
                      L when is_list(L) -> L;
                      _ -> []
                  end,
    {RightSelect, _, _, _, _} = RightAnswer,
    send_winner_reward(LuckyerList, Joins, RightSelect),
    Answer = get_national_wisdom_answer(AskId),
    case length(Winner) > 0 of
        true ->
            LuckyerCount = length(LuckyerList),
            JoinStr = [{string_2, 4, Name}
                       || #national_wisdom_joiner{name = Name} <- LuckyerList],
            JoinNames = string:join(lists:duplicate(LuckyerCount,
                                                    "~ts"),
                                    "、"),
            Fmt1 =
                notice:format(lang:get("本轮智多星抢答正确答案是~ts, ~ts成为本轮~ts的幸运玩家，获得了额外的幸运大奖{f"
                                       "ace_1, 29}"),
                              [{string_2, 1, Answer},
                               {string_1, JoinNames},
                               {string_2, 1, lang:get("[智多星抢答]")}]),
            Msg = notice:format(Fmt1, JoinStr),
            notice:cast(all, 11, Msg),
            notice:cast(all, 14, Msg);
        false ->
            Msg =
                notice:format(lang:get("本轮智多星抢答正确答案是~ts, 居然没有任何一个人答对，太菜了{face_1,10}"),
                              [{string_2, 1, Answer}]),
            notice:cast(all, 11, Msg),
            notice:cast(all, 14, Msg)
    end,
    {StateName, TimeOut} = next_state(),
    NewState = State#state{ts = now(), timeout = TimeOut,
                           joins = [], winner = [], luckyer_list = LuckyerList},
    NewState1 = case StateName of
                    active -> start_timer(NewState);
                    _ -> NewState
                end,
    logger:info("本轮答题完毕,进入[~w],超时时间[~w]",
                [StateName, TimeOut],
                camp_national_wisdom,
                459),
    continue(StateName, NewState1);
reward(_Any, State) -> continue(reward, State).

next_state() ->
    {EndH, _, _} = {22, 0, 0},
    {StartH, _, _} = {9, 0, 0},
    {_, Time} = date:seconds_to_datetime(date:unixtime()),
    case Time of
        {H, _, _} when H < StartH orelse H >= EndH ->
            {idle, date:next_diff({9, 0, 0}) * 1000};
        _ -> {active, date:next_diff({22, 0, 0}) * 1000}
    end.

send_winner_reward([], [], _) -> ok;
send_winner_reward(LuckyerList, Joins, RightAnswer) ->
    send_wisdom_reward(2, LuckyerList, RightAnswer),
    send_wisdom_reward(1, Joins, RightAnswer).

send_wisdom_reward(_, [], _RightAnswer) -> ok;
send_wisdom_reward(1,
                   [#national_wisdom_joiner{pid = RolePid,
                                            done_answer = DoneAnswer}
                    | Rest],
                   RightAnswer)
    when DoneAnswer =/= 0 ->
    role:apply(async,
               RolePid,
               {camp_national_wisdom,
                apply_get_wisdom_reward,
                [1, DoneAnswer, RightAnswer]}),
    send_wisdom_reward(1, Rest, RightAnswer);
send_wisdom_reward(2,
                   [#national_wisdom_joiner{pid = RolePid,
                                            done_answer = DoneAnswer}
                    | Rest],
                   RightAnswer) ->
    role:apply(async,
               RolePid,
               {camp_national_wisdom,
                apply_get_wisdom_reward,
                [2, DoneAnswer, RightAnswer]}),
    send_wisdom_reward(2, Rest, RightAnswer);
send_wisdom_reward(RewardType, [_ | Rest],
                   RightAnswer) ->
    send_wisdom_reward(RewardType, Rest, RightAnswer).

calc_rewards_by_type(Role = #role{classes = Classes,
                                  lev = Lev},
                     1, Result) ->
    JoinsTimes = var:get_var(Role, day, 75, 0),
    logger:debug("参加答题次数:~w",
                 [JoinsTimes],
                 camp_national_wisdom,
                 501),
    case camp_national_data:get_wisdom_reward(1) of
        #{exp_mod := ExpMod, drop := DropId} ->
            ExpReward1 = case levup_data:get_exp({ExpMod, Lev}) of
                             #{exp := Exp} -> [{90010, Exp}];
                             _ -> []
                         end,
            PetExpReward = case pet:get_war_pet(Role) of
                               {ok, #pet{lev = PetLev}} ->
                                   case levup_data:get_exp({ExpMod, PetLev}) of
                                       #{pet_exp := PetExp} ->
                                           [{90005, PetExp}];
                                       _ -> []
                                   end;
                               _ -> []
                           end,
            ExpReward2 = case JoinsTimes of
                             _ when JoinsTimes < 9 ->
                                 logger:debug("1-8次答题正常奖励",
                                              [],
                                              camp_national_wisdom,
                                              522),
                                 ExpReward1 ++ PetExpReward;
                             _ when JoinsTimes < 17 ->
                                 logger:debug("9-16次答题经验为60%",
                                              [],
                                              camp_national_wisdom,
                                              525),
                                 [{Assets,
                                   round(Val * 5.99999999999999977796e-1)}
                                  || {Assets, Val}
                                         <- ExpReward1 ++ PetExpReward];
                             _ ->
                                 logger:debug("大于16次答题经验为30%",
                                              [],
                                              camp_national_wisdom,
                                              528),
                                 [{Assets,
                                   round(Val * 2.99999999999999988898e-1)}
                                  || {Assets, Val}
                                         <- ExpReward1 ++ PetExpReward]
                         end,
            ExpReward = case Result of
                            true -> ExpReward2;
                            false ->
                                [{Assets,
                                  round(Val * 5.99999999999999977796e-1)}
                                 || {Assets, Val} <- ExpReward2]
                        end,
            DropReward = case Result of
                             true ->
                                 case JoinsTimes of
                                     _ when JoinsTimes < 7 ->
                                         logger:debug("1-6次答题道具概率为100%",
                                                      [],
                                                      camp_national_wisdom,
                                                      544),
                                         drop_produce(DropId, Classes, Lev);
                                     _ when JoinsTimes < 13 ->
                                         logger:debug("8-12次答题道具概率为10%",
                                                      [],
                                                      camp_national_wisdom,
                                                      548),
                                         case util:rand(1, 1000) =< 100 of
                                             true ->
                                                 drop_produce(DropId,
                                                              Classes,
                                                              Lev);
                                             _ -> []
                                         end;
                                     _ -> []
                                 end;
                             false -> []
                         end,
            ExpReward ++ DropReward;
        _ -> []
    end;
calc_rewards_by_type(Role = #role{classes = Classes,
                                  lev = Lev},
                     2, _) ->
    JoinsTimes = var:get_var(Role, day, 76, 0),
    case JoinsTimes >= 5 of
        true -> [{90020, 3}];
        false ->
            case camp_national_data:get_wisdom_reward(2) of
                #{drop := DropId} -> drop_produce(DropId, Classes, Lev);
                _ -> []
            end
    end.

drop_produce(DropId, Classes, Lev) ->
    case drop:produce(DropId, Classes, Lev) of
        {true, _RuleType, SuperGain, NormalGain} ->
            Gain = SuperGain ++ NormalGain,
            Reward = format:gain_to_val(Gain),
            [{Assets, 0, Val} || {Assets, Val} <- Reward];
        null -> [];
        {false, Reason} ->
            logger:error("智多星生成掉落~w失败:~w",
                         [DropId, Reason],
                         camp_national_wisdom,
                         585),
            []
    end.

apply_get_wisdom_reward(Role, RewardType, DoneAnswer,
                        RightAnswer) ->
    logger:debug("计算奖励:~w",
                 [RewardType],
                 camp_national_wisdom,
                 591),
    Result = DoneAnswer =:= RightAnswer,
    case calc_rewards_by_type(Role, RewardType, Result) of
        Rewards = [_ | _] ->
            logger:debug("奖励内容:~w",
                         [Rewards],
                         camp_national_wisdom,
                         595),
            case RewardType of
                1 ->
                    NoticeMsg = case Result of
                                    true -> lang:get("恭喜您！智多星抢答回答正确");
                                    false -> lang:get("很遗憾！智多星抢答回答错误")
                                end,
                    notice:return(NoticeMsg),
                    TriggerRole2 = Role,
                    VarRole = var:add_var(TriggerRole2, day, 75, 1, 0),
                    Gain = format:val_to_gain(Rewards),
                    RtnResult = case Result of
                                    true -> 1;
                                    false -> 0
                                end,
                    JoinsTimes = var:get_var(Role, day, 75, 0),
                    RtnReward = format:gain_to_val(Gain),
                    role:link_send(Role,
                                   14078,
                                   {RtnResult, JoinsTimes, RtnReward}),
                    case role_gain:do_notice(Gain, VarRole) of
                        {ok, GainRole} -> {ok, GainRole};
                        _ ->
                            Title = lang:get("智多星奖励"),
                            Content =
                                notice:format(lang:get("您在~ts活动中获得如下奖励，谢谢您的参与:"),
                                              [{string_2,
                                                1,
                                                lang:get("智多星抢答")}]),
                            mail:send(Role,
                                      #{title => Title, content => Content,
                                        items => Rewards}),
                            {ok, VarRole}
                    end;
                2 ->
                    JoinsTimes = var:get_var(Role, day, 76, 0),
                    Title = lang:get("智多星奖励"),
                    Content = case JoinsTimes >= 5 of
                                  true ->
                                      notice:format(lang:get("由于您在~ts活动中已经被抽中了5次幸运玩家，奖励转换为:"),
                                                    [{string_2,
                                                      1,
                                                      lang:get("智多星抢答")}]);
                                  false ->
                                      notice:format(lang:get("幸运爆棚！恭喜您在~ts活动中，快速答对题目，被选为幸运玩家，特赠送您以下奖励:"),
                                                    [{string_2,
                                                      1,
                                                      lang:get("智多星抢答")}])
                              end,
                    mail:send(Role,
                              #{title => Title, content => Content,
                                items => Rewards}),
                    TriggerRole = Role,
                    VarRole = var:add_var(TriggerRole, day, 76, 1, 0),
                    {ok, VarRole}
            end;
        _ -> ok
    end.

get_national_wisdom_answer(AskId) ->
    case question_data:get_national_wisdom_answer(AskId) of
        {1, A, _B, _C, _D} ->
            util:flist(lang:get("A:~ts"), [A]);
        {2, _A, B, _C, _D} ->
            util:flist(lang:get("B:~ts"), [B]);
        {3, _A, _B, C, _D} ->
            util:flist(lang:get("C:~ts"), [C]);
        {4, _A, _B, _C, D} ->
            util:flist(lang:get("D:~ts"), [D]);
        _ -> lang:get("A")
    end.

