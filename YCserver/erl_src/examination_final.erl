-file("src/mod/examination/examination_final.erl", 1).

-module(examination_final).

-behaviour(gen_fsm).

-export([start_link/0,
         get_info/0,
         answer/3,
         peek/2,
         ease/2,
         use_double/2,
         push/2,
         gm/2,
         role_callback/2]).

-export([idle/2, notice/2, active/2]).

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

-file("src/mod/examination/examination_final.erl", 32).

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

-file("src/mod/examination/examination_final.erl", 33).

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

-file("src/mod/examination/examination_final.erl", 34).

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

-file("src/mod/examination/examination_final.erl", 35).

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

-file("src/mod/examination/examination_final.erl", 36).

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

-file("src/mod/examination/examination_final.erl", 37).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/examination/examination_final.erl", 38).

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

-file("src/mod/examination/examination_final.erl", 39).

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

-file("src/mod/examination/examination_final.erl", 40).

-file("inc/examination.hrl", 1).

-record(m_examination,
        {ver = 1,
         question = 0 :: non_neg_integer(),
         started = 0 :: non_neg_integer(),
         expire = 0 :: non_neg_integer(),
         subject = 0 :: non_neg_integer(),
         next_subject = 0 :: non_neg_integer(),
         next_subjects = [],
         finish_ids = [],
         right_num = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         successive_right = 0 :: non_neg_integer(),
         questions = [] :: list(),
         dynamics = [] :: list()}).

-record(examination_testee,
        {id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         elapsed = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         coin = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         pet_exp = 0 :: non_neg_integer()}).

-record(examination_role,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         elapsed = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer(),
         certified = 0 :: 0 | 1,
         results = []}).

-record(examination_question,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         desc = "" :: string(),
         answer = 0 :: non_neg_integer(),
         options = [] :: list()}).

-record(examination_taker,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         last_answered = 0 :: non_neg_integer(),
         double_used = 0 :: non_neg_integer(),
         eased = 0 :: non_neg_integer(),
         peeked = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         pet_exp = 0 :: non_neg_integer(),
         right_num = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer()}).

-record(examination_answer,
        {id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         choice = 0 :: 0..4,
         result = 0 :: 0 | 1,
         time = 0 :: non_neg_integer()}).

-file("src/mod/examination/examination_final.erl", 41).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         q_ref :: undefined | reference(),
         past = [] :: list(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: list(),
         peekers = [],
         asked_num = 0 :: non_neg_integer(),
         easers = [],
         double_users = []}).

get_info() ->
    gen_fsm:sync_send_all_state_event(examination_final,
                                      get_info).

answer(Role = #role{id = Id, name = Name,
                    classes = Classes, sex = Sex, lev = Lev},
       QId, Choice) ->
    case check_certified(Role) of
        true ->
            RightAnswer = question_data:get_final_answer(QId),
            Result = case RightAnswer of
                         Choice -> 1;
                         _ -> 0
                     end,
            A = #examination_answer{id = Id, name = Name,
                                    classes = Classes, sex = Sex, lev = Lev,
                                    choice = Choice, result = Result,
                                    time = date:unixtime()},
            Stats = statistic(Role, Result),
            case
                gen_fsm:sync_send_all_state_event(examination_final,
                                                  {answer,
                                                   Stats#{qid => QId},
                                                   A})
                of
                {ok, Score} ->
                    Role1 = reward(Role, Result, 3),
                    Msg = case Result of
                              1 ->
                                  notice:format(lang:get("回答~ts获得~ts分"),
                                                [{string_2, 1, lang:get("正确")},
                                                 {string_2, 1, Score}]);
                              _ ->
                                  notice:format(lang:get("回答~ts只获得~ts分"),
                                                [{string_2, 1, lang:get("错误")},
                                                 {string_2, 1, Score}])
                          end,
                    Role2 = role_trigger:fire([#evt_examination{type = 3},
                                               #evt_examination_answer{is_right
                                                                           =
                                                                           Result}],
                                              Role1),
                    push(Role2, 14516),
                    {ok, Msg, RightAnswer, Role2};
                Else -> Else
            end;
        Else -> Else
    end.

peek(Role = #role{}, QId) ->
    case check_certified(Role) of
        true ->
            A = to(taker, Role),
            case
                gen_fsm:sync_send_all_state_event(examination_final,
                                                  {peek, QId, A})
                of
                {ok, BePeeker} ->
                    push(Role, 14516),
                    {ok, BePeeker};
                Else -> Else
            end;
        Else -> Else
    end.

ease(Role = #role{}, QId) ->
    case check_certified(Role) of
        true ->
            A = to(taker, Role),
            RightAnswer = question_data:get_final_answer(QId),
            case
                gen_fsm:sync_send_all_state_event(examination_final,
                                                  {ease, QId, A})
                of
                ok ->
                    push(Role, 14516),
                    {ok, RightAnswer};
                Else -> Else
            end;
        Else -> Else
    end.

use_double(Role = #role{}, QId) ->
    case check_certified(Role) of
        true ->
            A = to(taker, Role),
            case
                gen_fsm:sync_send_all_state_event(examination_final,
                                                  {use_double, QId, A})
                of
                ok ->
                    push(Role, 14516),
                    ok;
                Else -> Else
            end;
        Else -> Else
    end.

push(#role{link = #link{conn_pid = ConnPid}, id = Id},
     Cmd = 14505) ->
    case ets:lookup(examination_taker, Id) of
        [R = #examination_taker{right_num = RightNum,
                                answered = Answered}] ->
            Data = {to(testee, R), RightNum, Answered, 25},
            sys_conn:pack_send(ConnPid, Cmd, Data);
        _ -> ok
    end;
push(Role = #role{link = #link{conn_pid = ConnPid}},
     Cmd = 14509) ->
    case check_certified(Role) of
        true ->
            Data =
                gen_fsm:sync_send_all_state_event(examination_final,
                                                  info_status),
            sys_conn:pack_send(ConnPid, Cmd, Data);
        _ -> ok
    end;
push(Role = #role{link = #link{conn_pid = ConnPid}},
     Cmd = 14510) ->
    case check_certified(Role) of
        true ->
            case get_info() of
                {ok,
                 #{id := QId, asked := Asked, asked_num := AskedNum,
                   answers := Answers}} ->
                    Data = {QId,
                            Asked,
                            Asked + 23000 div 1000,
                            AskedNum,
                            25,
                            Answers},
                    sys_conn:pack_send(ConnPid, Cmd, Data);
                _ -> ok
            end;
        _ -> ok
    end;
push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 14512) ->
    L = ets:tab2list(examination_final_rank),
    sys_conn:pack_send(ConnPid, Cmd, {L});
push(#role{link = #link{conn_pid = ConnPid}, id = Id},
     Cmd = 14516) ->
    Taker = case ets:lookup(examination_taker, Id) of
                [R = #examination_taker{}] -> R;
                _ -> #examination_taker{}
            end,
    MaxPeeking = 3,
    MaxEasing = 3,
    MaxDouble = 3,
    sys_conn:pack_send(ConnPid,
                       Cmd,
                       {Taker, MaxPeeking, MaxEasing, MaxDouble}).

gm(certified,
   #role{id = Id, name = Name, classes = Classes,
         sex = Sex, lev = Lev}) ->
    R = #examination_role{id = Id, name = Name,
                          classes = Classes, sex = Sex, lev = Lev,
                          certified = 1},
    ets:insert(examination_role, R),
    ok.

role_callback(Role = #role{}, notice_statistic) ->
    push(Role, 14505),
    ok;
role_callback(_Role, _Else) ->
    logger:debug("未知回调 ~w",
                 [_Else],
                 examination_final,
                 220),
    ok.

start_link() ->
    gen_fsm:start_link({local, examination_final},
                       examination_final,
                       [],
                       []).

init([]) ->
    logger:info("开始启动...", [], examination_final, 231),
    ets:new(examination_taker,
            [set,
             named_table,
             public,
             {keypos, #examination_taker.id}]),
    ets:new(examination_final_rank,
            [set,
             named_table,
             public,
             {keypos, #examination_taker.id}]),
    {StateName, Timeout} = get_state(),
    State = #state{ts = erlang:now(), timeout = Timeout},
    logger:info("启动完成 state_name: ~w, timeout: ~w",
                [StateName, Timeout],
                examination_final,
                239),
    {ok, StateName, State, Timeout}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(info_status, _From, StateName,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    St = case StateName of
             notice -> 1;
             active -> 2;
             _ -> 0
         end,
    Rest = util:time_left(Timeout, Ts),
    Reply = {St, Rest div 1000},
    continue(Reply, StateName, State);
handle_sync_event(get_info, _From, active,
                  State = #state{id = Id, asked = Asked,
                                 asked_num = AskedNum, answers = Answers}) ->
    Data = #{id => Id, asked => Asked,
             asked_num => AskedNum,
             answers => lists:sublist(Answers, 13)},
    Reply = {ok, Data},
    continue(Reply, active, State);
handle_sync_event(get_info, _From, StateName, State) ->
    Reply = false,
    continue(Reply, StateName, State);
handle_sync_event({answer,
                   Stats = #{qid := Qid},
                   A = #examination_answer{id = Rid, result = Result,
                                           time = Time}},
                  _From, active,
                  State = #state{id = Qid, answers = Answers,
                                 asked = Asked, double_users = DoubleUsers}) ->
    DoublRate = case lists:member(Rid, DoubleUsers) of
                    true -> 2;
                    _ -> 1
                end,
    Res = case lists:keyfind(Rid,
                             #examination_answer.id,
                             Answers)
              of
              #examination_answer{} -> {false, lang:get("你已经回答过该题目")};
              _ when Result =:= 1 ->
                  CalcScore0 = max(10, 23000 div 1000 - (Time - Asked)),
                  CalcScore = min(25, CalcScore0),
                  {ok, CalcScore * DoublRate};
              _ -> {ok, 0}
          end,
    {NewAnswers, Reply} = case Res of
                              {ok, AddScore} ->
                                  case ets:lookup(examination_taker, Rid) of
                                      [R = #examination_taker{score = OldScore,
                                                              right_num =
                                                                  OldRightNum,
                                                              answered =
                                                                  OldAnswered}] ->
                                          NewRightNum = case Result of
                                                            1 ->
                                                                OldRightNum + 1;
                                                            _ -> OldRightNum
                                                        end,
                                          R1 =
                                              update_taker(R#examination_taker{score
                                                                                   =
                                                                                   OldScore
                                                                                       +
                                                                                       AddScore,
                                                                               right_num
                                                                                   =
                                                                                   NewRightNum,
                                                                               answered
                                                                                   =
                                                                                   OldAnswered
                                                                                       +
                                                                                       1},
                                                           Stats),
                                          ets:insert(examination_taker, R1);
                                      _ ->
                                          NewRightNum = case Result of
                                                            1 -> 1;
                                                            _ -> 0
                                                        end,
                                          R = to(taker, A),
                                          R1 =
                                              update_taker(R#examination_taker{score
                                                                                   =
                                                                                   AddScore,
                                                                               right_num
                                                                                   =
                                                                                   NewRightNum,
                                                                               answered
                                                                                   =
                                                                                   1},
                                                           Stats),
                                          ets:insert(examination_taker, R1)
                                  end,
                                  broadcast(14514, {A}),
                                  {[A | Answers], {ok, AddScore}};
                              _ -> {Answers, Res}
                          end,
    continue(Reply,
             active,
             State#state{answers = NewAnswers});
handle_sync_event({answer, _, _}, _From, active,
                  State) ->
    Reply = {false, lang:get("你答得太慢了")},
    continue(Reply, active, State);
handle_sync_event({answer, _, _}, _From, StateName,
                  State) ->
    Reply = {false, lang:get("活动结束了")},
    continue(Reply, StateName, State);
handle_sync_event({peek,
                   Qid,
                   A = #examination_taker{id = Rid}},
                  _From, active,
                  State = #state{id = CQid, peekers = Peekers,
                                 answers = Answers}) ->
    Reply = case lists:member(Rid, Peekers) of
                true -> {false, lang:get("你已经偷看过答案了")};
                _ when Qid =/= CQid -> {false, lang:get("动作慢了，看看新题目")};
                _ ->
                    case lists:keyfind(Rid, #examination_answer.id, Answers)
                        of
                        #examination_answer{} ->
                            {false, lang:get("这道题你已经回答过了")};
                        _ ->
                            HasRightAnswer = lists:keyfind(1,
                                                           #examination_answer.result,
                                                           lists:sublist(Answers,
                                                                         10)),
                            case ets:lookup(examination_taker, Rid) of
                                _
                                    when erlang:is_record(HasRightAnswer,
                                                          examination_answer)
                                             =:= false ->
                                    {false, lang:get("当前没有小伙伴答对哦，无法偷看")};
                                [R = #examination_taker{peeked = Peeked}]
                                    when Peeked < 3 ->
                                    ets:insert(examination_taker,
                                               R#examination_taker{peeked =
                                                                       Peeked +
                                                                           1}),
                                    {ok, HasRightAnswer};
                                [] ->
                                    R = A,
                                    ets:insert(examination_taker,
                                               R#examination_taker{peeked = 1}),
                                    {ok, HasRightAnswer};
                                _ -> {false, lang:get("你今天的偷看次数用完了")}
                            end
                    end
            end,
    NewPeekers = case Reply of
                     {ok, _} -> [Rid | Peekers];
                     _ -> Peekers
                 end,
    continue(Reply,
             active,
             State#state{peekers = NewPeekers});
handle_sync_event({peek, _, _}, _From, StateName,
                  State) ->
    Reply = {false, lang:get("活动结束了")},
    continue(Reply, StateName, State);
handle_sync_event({ease,
                   Qid,
                   A = #examination_taker{id = Rid}},
                  _From, active,
                  State = #state{id = CQid, easers = Easers,
                                 answers = Answers}) ->
    Reply = case lists:member(Rid, Easers) of
                true -> {false, lang:get("你已经降低过这题难度了")};
                _ when Qid =/= CQid -> {false, lang:get("动作慢了，看看新题目")};
                _ ->
                    case lists:keyfind(Rid, #examination_answer.id, Answers)
                        of
                        #examination_answer{} ->
                            {false, lang:get("这道题你已经回答过了")};
                        _ ->
                            case ets:lookup(examination_taker, Rid) of
                                [R = #examination_taker{eased = Eased}]
                                    when Eased < 3 ->
                                    ets:insert(examination_taker,
                                               R#examination_taker{eased =
                                                                       Eased +
                                                                           1}),
                                    ok;
                                [] ->
                                    R = A,
                                    ets:insert(examination_taker,
                                               R#examination_taker{eased = 1}),
                                    ok;
                                _ -> {false, lang:get("你今天的降低难度次数用完了")}
                            end
                    end
            end,
    NewEasers = case Reply of
                    ok -> [Rid | Easers];
                    _ -> Easers
                end,
    continue(Reply,
             active,
             State#state{easers = NewEasers});
handle_sync_event({ease, _, _}, _From, StateName,
                  State) ->
    Reply = {false, lang:get("活动结束了")},
    continue(Reply, StateName, State);
handle_sync_event({use_double,
                   Qid,
                   A = #examination_taker{id = Rid}},
                  _From, active,
                  State = #state{id = CQid, double_users = DoubleUsers,
                                 answers = Answers}) ->
    Reply = case lists:member(Rid, DoubleUsers) of
                true -> {false, lang:get("本题已经使用双倍积分")};
                _ when Qid =/= CQid -> {false, lang:get("动作慢了，看看新题目")};
                _ ->
                    case lists:keyfind(Rid, #examination_answer.id, Answers)
                        of
                        #examination_answer{} ->
                            {false, lang:get("这道题你已经回答过了")};
                        _ ->
                            case ets:lookup(examination_taker, Rid) of
                                [R = #examination_taker{double_used =
                                                            DoubleUsed}]
                                    when DoubleUsed < 3 ->
                                    ets:insert(examination_taker,
                                               R#examination_taker{double_used =
                                                                       DoubleUsed
                                                                           +
                                                                           1}),
                                    ok;
                                [] ->
                                    R = A,
                                    ets:insert(examination_taker,
                                               R#examination_taker{double_used =
                                                                       1}),
                                    ok;
                                _ -> {false, lang:get("你今天的降低难度次数用完了")}
                            end
                    end
            end,
    NewDoubleUser = case Reply of
                        ok -> [Rid | DoubleUsers];
                        _ -> DoubleUsers
                    end,
    continue(Reply,
             active,
             State#state{double_users = NewDoubleUser});
handle_sync_event({use_double, _, _}, _From, StateName,
                  State) ->
    Reply = {false, lang:get("活动结束了")},
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = false,
    continue(Reply, StateName, State).

handle_info(ask, active,
            State = #state{asked_num = AskedNum})
    when AskedNum >= 25 ->
    active(timeout, State);
handle_info(ask, active,
            State = #state{past = Past, q_ref = OldRef,
                           asked_num = OldNum}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    update_rank(refresh),
    Id = util:rand_list(question_data:list_final() -- Past),
    NewRef = erlang:send_after(23000, self(), ask),
    NewState = State#state{q_ref = NewRef,
                           past = [Id | Past], id = Id, asked = date:unixtime(),
                           asked_num = OldNum + 1, answers = [], peekers = [],
                           easers = [], double_users = []},
    continue(active, NewState);
handle_info(ask, StateName, State) ->
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State) ->
    Msg =
        notice:format(lang:get("~ts即将在10分钟后开启，收到邀请的小伙伴记得准时参加喔！"),
                      [{string_2, 1, lang:get("智慧对决")}]),
    notice:cast(all, 5, Msg),
    Timeout = 600 * 1000,
    State1 = State#state{ts = now(), timeout = Timeout,
                         asked_num = 0},
    ets:delete_all_objects(examination_taker),
    broadcast(14509, {1, 600}),
    continue(notice, State1);
idle(_, State) -> continue(idle, State).

notice(timeout, State = #state{q_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    ets:delete_all_objects(examination_taker),
    Emsg =
        notice:format(lang:get("~ts正式开始，机智的小伙伴已经参加了，不要偷看他人的答案哟！"),
                      [{string_2, 1, lang:get("智慧对决")}]),
    notice:cast(all, 5, Emsg),
    NewRef = erlang:send_after(23000, self(), ask),
    Timeout = agenda:get_duration(2009) * 1000,
    broadcast(14509, {2, agenda:get_duration(2009)}),
    Id = util:rand_list(question_data:list_final()),
    NewState = State#state{ts = now(), timeout = Timeout,
                           q_ref = NewRef, past = [Id], id = Id,
                           asked = date:unixtime(), asked_num = 1, answers = [],
                           peekers = [], easers = [], double_users = []},
    logger:debug("下次开始时间 ~w",
                 [Timeout],
                 examination_final,
                 499),
    continue(active, NewState);
notice(_, State) -> continue(notice, State).

active(timeout, State) ->
    {_, Tt} = agenda:get_state_timeout(2009, 600),
    Timeout = Tt * 1000,
    State1 = State#state{ts = now(), timeout = Timeout},
    broadcast(14509, {0, Tt}),
    [role:apply(async,
                Rid,
                {examination_final, role_callback, [notice_statistic]})
     || [Rid] <- get_certified()],
    update_rank(final),
    continue(idle, State1);
active(_Info, State) -> continue(active, State).

get_state() ->
    {StateName, Timeout} = case
                               agenda:get_state_timeout(2009, 600)
                               of
                               {idle, Tt} -> {idle, Tt};
                               {notice, _} -> {notice, 600};
                               {active, _} ->
                                   {active, agenda:get_duration(2009)}
                           end,
    {StateName, Timeout * 1000}.

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

to(taker,
   #{id := Id, name := Name, classes := Classes,
     sex := Sex, lev := Lev}) ->
    #examination_taker{id = Id, name = Name,
                       classes = Classes, sex = Sex, lev = Lev};
to(taker,
   #role{id = Id, name = Name, classes = Classes,
         sex = Sex, lev = Lev}) ->
    #examination_taker{id = Id, name = Name,
                       classes = Classes, sex = Sex, lev = Lev};
to(taker,
   #examination_answer{id = Id, name = Name,
                       classes = Classes, sex = Sex, lev = Lev}) ->
    #examination_taker{id = Id, name = Name,
                       classes = Classes, sex = Sex, lev = Lev};
to(testee,
   #examination_taker{id = Id, name = Name,
                      classes = Classes, sex = Sex, lev = Lev, coin = OldCoin,
                      exp = OldExp, pet_exp = OldPetExp}) ->
    #examination_testee{id = Id, name = Name,
                        classes = Classes, sex = Sex, lev = Lev, coin = OldCoin,
                        exp = OldExp, pet_exp = OldPetExp}.

reward(Role = #role{lev = Lev, name = Name}, 1, Type) ->
    case examination_data:get_reward({Lev, Type}) of
        #{right_exp := Exp, right_coin := Coin} ->
            Gain1 = [{90010, Exp}, {90000, Coin}],
            ItemCfg =
                util:rand_list(examination_data:reward_item(3),
                               item_weight),
            Gain2 = case ItemCfg of
                        #{item_id := ItemId, item_num := ItemNum}
                            when ItemId > 0 andalso ItemNum > 0 ->
                            [{ItemId, 0, ItemNum} | Gain1];
                        _Item ->
                            logger:debug("物品 ~w",
                                         [_Item],
                                         examination_final,
                                         564),
                            Gain1
                    end,
            Gain3 = case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case examination_data:get_reward({PetLev, Type}) of
                                #{right_pet_exp := PExp} ->
                                    [{90005, PExp} | Gain2];
                                _ -> Gain2
                            end;
                        _ -> Gain2
                    end,
            Gain = format:val_to_gain(Gain3),
            case role_gain:do_notice(Gain, Role) of
                {ok, Role1} ->
                    announce_item(Name, ItemCfg),
                    Role1;
                _ -> Role
            end;
        _ -> Role
    end;
reward(Role = #role{lev = Lev}, _, Type) ->
    logger:debug("错了", [], examination_final, 586),
    case examination_data:get_reward({Lev, Type}) of
        #{wrong_exp := Exp, wrong_coin := Coin} ->
            Gain1 = [{90010, Exp}, {90000, Coin}],
            Gain2 = case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case examination_data:get_reward({PetLev, Type}) of
                                #{wrong_pet_exp := PExp} ->
                                    [{90005, PExp} | Gain1];
                                _ -> Gain1
                            end;
                        _ -> Gain1
                    end,
            Gain = format:val_to_gain([One
                                       || One = {_, V} <- Gain2, V > 0]),
            case role_gain:do_notice(Gain, Role) of
                {ok, Role1} -> Role1;
                _ -> Role
            end;
        _ -> Role
    end.

announce_item(Name,
              #{announce := 1, item_id := BaseId,
                item_num := ItemNum}) ->
    Fmt = case util:rand(1, 4) of
              1 -> lang:get("~ts参加智慧对决时，巧思如流，被路过文曲星看中，赠送了他一个~ts");
              2 -> lang:get("~ts参加智慧对决思考过于入迷，以至于考官都被感动，特赠送了他一个~ts");
              3 -> lang:get("~ts奔走在智慧对决的路上和人相撞，起身收拾背包时发现包里多出一个~ts");
              _ -> lang:get("~ts在智慧对决被难住，想摸出包里的小抄，不想却发现包里多出一个~ts")
          end,
    notice:cast(all,
                5,
                Fmt,
                [{role_2, Name}, {item_2, BaseId, ItemNum}]);
announce_item(_, _) -> ok.

get_certified() ->
    ets:match(examination_role,
              #examination_role{id = '$1', certified = 1, _ = '_'}).

broadcast(Cmd, Data) ->
    do_broadcast(get_certified(), Cmd, Data).

do_broadcast([], _, _) -> ok;
do_broadcast([[Id] | T], Cmd, Data) ->
    role:pack_send(Id, Cmd, Data),
    do_broadcast(T, Cmd, Data).

update_rank(Type) ->
    L = ets:tab2list(examination_taker),
    L1 = util:keys_sort([#examination_taker.score], L),
    L2 = case Type of
             refresh -> lists:sublist(L1, 20);
             _ -> lists:sublist(L1, 100)
         end,
    ets:delete_all_objects(examination_final_rank),
    ets:insert(examination_final_rank, L2),
    ending_reward(Type, L),
    reward_rank(Type, L2).

reward_rank(final, [H | T]) ->
    honor_mgr:clear(examination_final_rank),
    case [{Id, Name}
          || #examination_taker{id = Id, name = Name}
                 <- lists:sublist([H | T], 3)]
        of
        RoleList = [_ | _] ->
            Msg =
                notice:format(lang:get("~ts到此结束了，恭喜~ts获得前三名，获得了丰厚的奖励{face_0, "
                                       "18}"),
                              [{string_2, 1, lang:get("智慧对决")},
                               {role_1, RoleList}]),
            notice:cast(all, 5, Msg);
        _ ->
            Emsg = notice:format(lang:get("~ts到此结束了，感谢大家积极参与"),
                                 [{string_2, 1, lang:get("智慧对决")}]),
            notice:cast(all, 5, Emsg)
    end,
    do_reward_rank([H | T], 1);
reward_rank(_, _) -> ok.

do_reward_rank([], _) -> ok;
do_reward_rank([#examination_taker{id = Rid} | T],
               Rank) ->
    case examination_data:get_rank_reward(Rank) of
        Cfg = #{items := Items0} ->
            Items = [{item_type:special_id(I), 0, N}
                     || {I, N} <- Items0],
            MailInfo = #{items => Items,
                         title => lang:get("智慧对决奖励"),
                         content =>
                             notice:format(lang:get("恭喜你在智慧对决活动中获得第~ts名，表现优越，这是您的奖励，请查收."),
                                           [{string_2, 6, Rank}])},
            mail:send(Rid, MailInfo),
            case Cfg of
                #{honor_id := HonorId} when HonorId =/= 0 ->
                    honor_mgr:add(examination_final_rank,
                                  [{Rid, HonorId}],
                                  0);
                _ -> ok
            end;
        #{honor_id := HonorId} when HonorId =/= 0 ->
            honor_mgr:add(examination_final_rank,
                          [{Rid, HonorId}],
                          0);
        _ -> ok
    end,
    do_reward_rank(T, Rank + 1);
do_reward_rank(_, _) -> ok.

ending_reward(final, [H | T]) -> ending_reward([H | T]);
ending_reward(_, _) -> ok.

ending_reward([]) -> ok;
ending_reward([#examination_taker{id = Rid,
                                  score = Score, lev = Lev, name = Name}
               | T]) ->
    case examination_data:get_ending_reward(Score) of
        #{item_list := Items0, exp_rate := ExpRate} ->
            case util:rand_list(Items0, 4) of
                {ItemId0, Bind, Num, _, Announce} ->
                    Gain1 = case examination_data:get_reward({Lev, 3}) of
                                #{right_exp := Exp} ->
                                    [{90010, round(Exp * ExpRate)}];
                                _ -> []
                            end,
                    logger:debug("gain1 -----> ~w",
                                 [Gain1],
                                 examination_final,
                                 695),
                    ItemId = item_type:special_id(ItemId0),
                    Items = [{ItemId, Bind, Num} | Gain1],
                    case Announce of
                        1 ->
                            Annstr =
                                notice:format(lang:get("~ts在查看智慧对决的奖励邮件时，发现道具栏快亮瞎了，揉揉眼睛原来是~ts"),
                                              [{role_2, Name},
                                               {item_2, ItemId, Num}]),
                            notice:cast(all, 5, Annstr);
                        _ -> ok
                    end,
                    MailInfo = #{items => Items,
                                 title => lang:get("智慧对决奖励"),
                                 content =>
                                     notice:format(lang:get("恭喜你在智慧对决活动中获得~ts分，表现优越，这是您的奖励，请查收."),
                                                   [{string_2, 6, Score}])},
                    mail:send(Rid, MailInfo);
                _ -> ok
            end;
        _ -> ok
    end,
    ending_reward(T).

statistic(Role = #role{lev = Lev}, IsRight) ->
    PetExp = case pet:get_war_pet(Role) of
                 {ok, #pet{lev = PetLev}} ->
                     case examination_data:get_reward({PetLev, 3}) of
                         #{right_pet_exp := PExp} -> PExp;
                         _ -> 0
                     end;
                 _ -> 0
             end,
    case examination_data:get_reward({Lev, 3}) of
        #{right_exp := AddExp, right_coin := AddCoin}
            when IsRight =:= 1 ->
            #{coin => AddCoin, exp => AddExp, pet_exp => PetExp};
        #{wrong_exp := AddExp, wrong_coin := AddCoin} ->
            #{coin => AddCoin, exp => AddExp, pet_exp => PetExp};
        _ -> #{pet_exp => PetExp}
    end.

update_taker(R = #examination_taker{coin = OldCoin,
                                    exp = OldExp, pet_exp = OldPetExp},
             #{coin := AddCoin, exp := AddExp,
               pet_exp := AddPetExp}) ->
    R#examination_taker{coin = OldCoin + AddCoin,
                        exp = OldExp + AddExp, pet_exp = OldPetExp + AddPetExp};
update_taker(R, _) -> R.

check_certified(#role{lev = Lev}) when Lev < 30 ->
    {false,
     notice:format(lang:get("角色等级~ts级才能参与"),
                   [{string_2, 1, 30}])};
check_certified(#role{id = Id}) ->
    do_check_certified(Id).

do_check_certified(Id) ->
    case ets:lookup(examination_role, Id) of
        [#examination_role{certified = 1}] -> true;
        _ -> {false, lang:get("你没有参与智慧对决资格")}
    end.

