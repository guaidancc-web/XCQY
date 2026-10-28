-file("src/mod/review/review.erl", 1).

-module(review).

-behaviour(gen_server).

-export([post/2,
         fetch/1,
         upvote/2,
         downvote/2,
         list/4,
         update_index/1,
         update_pros/1,
         report/2,
         local_report/1,
         handle_report/5,
         adm_delete/3,
         adm_upvote/4,
         adm_downvote/4,
         remove_expire/3,
         view_pet/2,
         view_guard/1,
         push/2]).

-export([start_link/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/review/review.erl", 32).

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

-file("src/mod/review/review.erl", 33).

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

-file("src/mod/review/review.erl", 34).

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

-file("src/mod/review/review.erl", 35).

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

-file("src/mod/review/review.erl", 36).

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

-file("src/mod/review/review.erl", 37).

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

-file("src/mod/review/review.erl", 38).

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

-file("src/mod/review/review.erl", 39).

-file("inc/review.hrl", 1).

-record(review,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         type = 1 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         content = "" :: string(),
         pro = 0 :: non_neg_integer(),
         con = 0 :: non_neg_integer(),
         ctime = 0 :: non_neg_integer(),
         pets = [],
         guards = []}).

-record(review_index,
        {key = {0, 0} :: tuple(),
         ids = [] :: list(),
         hots = [] :: list()}).

-record(review_report,
        {id = {0, "", 0},
         rid = {0, "", 0},
         type = 0,
         base_id = 0,
         name = "",
         lev = 1,
         time = 0,
         content = "",
         reporter_id = {0, "", 0},
         reporter_name = "",
         reporter_lev = 0}).

-file("src/mod/review/review.erl", 40).

-record(state,
        {mode = 1,
         keys = [] :: list(),
         pros = [] :: list(),
         sync_ref :: undefined | reference(),
         report_ref :: undefined | reference()}).

post(Role, Args) ->
    case check_post([lev, type, share, limit, content],
                    Role,
                    Args)
        of
        {ok, NewArgs} -> do_post(Role, NewArgs);
        Else -> Else
    end.

upvote(#role{lev = Lev}, _) when Lev < 35 ->
    {false,
     notice:format(lang:get("~ts级后才能点赞哦，努力升级吧{face_1,9}"),
                   [{string_2, 5, 35}])};
upvote(Role = #role{id = _RoleId},
       Id = {_, Platform, ZoneId}) ->
    L = var:get_var(Role, day, 96, []),
    case lists:keyfind(Id, 1, L) of
        {_, _} -> {false, lang:get("今天已经投票过该评论了")};
        _ when length(L) >= 20 ->
            {false,
             notice:format(lang:get("每天最多只能投票~ts次哦"),
                           [{string_2, 5, 20}])};
        _ ->
            case big_world:call(Platform,
                                ZoneId,
                                gen_server,
                                call,
                                [review, {upvote, Id}])
                of
                {ok, Pro} ->
                    {ok, Pro, var:set_var(Role, day, 96, [{Id, 1} | L])};
                Else -> Else
            end
    end.

downvote(#role{lev = Lev}, _) when Lev < 35 ->
    {false,
     notice:format(lang:get("~ts级后才能点踩哦，努力升级吧{face_1,9}"),
                   [{string_2, 5, 35}])};
downvote(Role = #role{id = _RoleId},
         Id = {_, Platform, ZoneId}) ->
    L = var:get_var(Role, day, 96, []),
    case lists:keyfind(Id, 1, L) of
        {_, _} -> {false, lang:get("今天已经投票过该评论了")};
        _ when length(L) >= 20 ->
            {false,
             notice:format(lang:get("每天最多只能投票~ts次哦"),
                           [{string_2, 5, 20}])};
        _ ->
            case big_world:call(Platform,
                                ZoneId,
                                gen_server,
                                call,
                                [review, {downvote, Id}])
                of
                {ok, Con} ->
                    {ok, Con, var:set_var(Role, day, 96, [{Id, 2} | L])};
                Else -> Else
            end
    end.

list(#role{}, Type, BaseId, 1) ->
    Key = {review, Type, BaseId},
    case erlang:get(Key) of
        [H | T] -> do_list([H | T], Key, 1);
        _ -> []
    end;
list(#role{}, Type, BaseId, _) ->
    Key = {review, Type, BaseId},
    case ets:lookup(review_index, {Type, BaseId}) of
        [#review_index{ids = Ids, hots = Hots}] ->
            List = simplify(lists:reverse(Hots), Ids),
            do_list(List, Key, 1);
        _ -> []
    end.

update_index(Idx) -> review ! {update_index, Idx}.

update_pros(Idx) -> review ! {update_pros, Idx}.

fetch(Id = {_, P, Z}) ->
    big_world:call(P, Z, ets, lookup, [review, Id]).

report(#role{lev = Lev}, _) when Lev < 55 ->
    {false,
     notice:format(lang:get("~ts级后才能举报喔，努力升级吧{face_1,9}"),
                   [{string_2, 5, 55}])};
report(Role = #role{id = RoleId, name = RoleName,
                    lev = RoleLev},
       Id = {_, Platform, ZoneId}) ->
    Now = date:unixtime(),
    Report = #review_report{reporter_id = RoleId,
                            reporter_name = RoleName, reporter_lev = RoleLev,
                            id = Id, time = Now},
    Loss = format:val_to_loss([{90006, 10}]),
    Times = var:get_var(Role, day, 97, 0),
    case Times > 10 of
        true -> {reply, {0, lang:get("今日举报次数已满10次，无法再次提交")}};
        _ ->
            NewTimes = Times + 1,
            Role1 = var:set_var(Role, day, 97, NewTimes),
            case role_gain:do_notice(Loss,
                                     Role1,
                                     lang:get("感谢您，提交举报"))
                of
                {ok, NewRole} ->
                    case big_world:call(Platform,
                                        ZoneId,
                                        review,
                                        local_report,
                                        [Report])
                        of
                        ok ->
                            Msg =
                                lang:get("感谢您的反馈，客服人员将在第一时间核查被举报人的不当行为。核查结果将会邮件通知您!"),
                            {ok, Msg, NewRole};
                        {false, FailReason} -> {false, FailReason};
                        {error, center_not_ready} ->
                            {false, lang:get("还未与跨服时空连接，请稍后尝试")};
                        _ -> {false, lang:get("系统繁忙，请稍后尝试")}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end
    end.

local_report(Report) ->
    case make_report(Report) of
        #review_report{rid = Rid, reporter_id = Rid} ->
            {false, lang:get("不要举报自己了")};
        NewReport = #review_report{id = Id} ->
            case ets:lookup(review_report, Id) of
                [#review_report{}] ->
                    {false, lang:get("已经有人举报过，不用再举报了哦")};
                _ -> gen_server:call(review, {report, NewReport})
            end;
        Else -> Else
    end.

handle_report(Mid, Plat, Zone, HandleState, Items)
    when is_integer(Mid) andalso
             is_list(Plat) andalso
                 is_integer(Zone) andalso
                     HandleState >= 1 andalso HandleState =< 2 ->
    case check_item(Items) of
        {true, NewItems} ->
            logger:info("后台处理举报HandleState:~w, Items:~w, NewItems:~w",
                        [HandleState, Items, NewItems],
                        review,
                        203),
            review !
                {handle_report,
                 {Mid, Plat, Zone},
                 HandleState,
                 NewItems},
            ok;
        false ->
            logger:error("后台举报道具错误:~w", [Items], review, 207),
            false
    end;
handle_report(Mid, Plat, Zone, HandleState, Items) ->
    logger:error("后台举报发放错误参数:~w,~w,~w",
                 [{Mid, Plat, Zone}, HandleState, Items],
                 review,
                 212),
    false.

adm_delete(Mid, Plat, ZoneId) ->
    logger:info("后台删除评论 {~w, ~ts ~w}",
                [Mid, Plat, ZoneId],
                review,
                217),
    review ! {adm_delete, {Mid, Plat, ZoneId}},
    ok.

adm_upvote(Mid, Plat, ZoneId, Pro) ->
    logger:info("后台评论设赞 {~w, ~ts ~w} ~w",
                [Mid, Plat, ZoneId, Pro],
                review,
                222),
    review ! {adm_upvote, {Mid, Plat, ZoneId}, Pro},
    ok.

adm_downvote(Mid, Plat, ZoneId, Con) ->
    logger:info("后台评论设踩 {~w, ~ts ~w} ~w",
                [Mid, Plat, ZoneId, Con],
                review,
                227),
    review ! {adm_downvote, {Mid, Plat, ZoneId}, Con},
    ok.

remove_expire(Type, BaseId, Id) ->
    review ! {remove_expire, Type, BaseId, Id}.

view_guard(Id) ->
    case fetch(Id) of
        [#review{type = 2, guards = [Guard = #guard{} | _]}] ->
            {ok, Guard};
        _ -> false
    end.

view_pet(Id, PetId) ->
    case fetch(Id) of
        [#review{type = 1, pets = Pets}] ->
            case lists:keyfind(PetId, #pet.id, Pets) of
                Pet = #pet{} -> {ok, Pet};
                _ -> false
            end;
        _ -> false
    end.

push(Role, Cmd = 19405) ->
    Posted = [O
              || O = {_, _} <- var:get_var(Role, day, 95, [])],
    Voted = [V
             || V = {_, _} <- var:get_var(Role, day, 96, [])],
    sys_conn:pack_send(Cmd, {Voted, Posted}).

start_link(Type) ->
    gen_server:start_link({local, review},
                          review,
                          [Type],
                          []).

init([Type]) ->
    logger:info("开始启动...", [], review, 269),
    case env:get(review_id) of
        RecId when is_integer(RecId) -> ok;
        _ -> env:set(review_id, 1)
    end,
    ets:new(review,
            [set, named_table, public, {keypos, #review.id}]),
    dets:open_file(review,
                   [{file, "./dets/review.dets"}, {keypos, #review.id}]),
    ets:new(review_index,
            [set,
             named_table,
             public,
             {keypos, #review_index.key}]),
    dets:open_file(review_index,
                   [{file, "./dets/review_index.dets"},
                    {keypos, #review_index.key}]),
    ets:new(review_report,
            [set,
             named_table,
             public,
             {keypos, #review_report.id}]),
    load_data(),
    erlang:send_after(10000, self(), loop),
    SyncRef = erlang:send_after(util:rand(5000, 10000),
                                self(),
                                sync_data),
    Mode = case Type of
               big_world -> 1;
               _ -> 2
           end,
    ReportRef = erlang:send_after(util:rand(4000, 10000),
                                  self(),
                                  load_report),
    State = #state{sync_ref = SyncRef, mode = Mode,
                   report_ref = ReportRef},
    logger:info("启动完成", [], review, 289),
    {ok, State}.

handle_call({post,
             #review{id = Id, base_id = BaseId, type = Type,
                     ctime = Time}},
            _From, State = #state{keys = Keys}) ->
    case ets:lookup(review_index, {Type, BaseId}) of
        [Idx = #review_index{ids = Ids}] ->
            save(Idx#review_index{ids =
                                      lists:sublist([{Id, Time} | Ids], 2000)});
        _ ->
            save(#review_index{key = {Type, BaseId},
                               ids = [{Id, Time}]})
    end,
    NewKeys = case lists:member({Type, BaseId}, Keys) of
                  true -> Keys;
                  _ -> [{Type, BaseId} | Keys]
              end,
    {reply, ok, State#state{keys = NewKeys}};
handle_call({upvote, Id}, _From,
            State = #state{pros = Pros}) ->
    {NewPro, NewPros} = case fetch(Id) of
                            [R = #review{pro = Pro, type = Type,
                                         base_id = BaseId}] ->
                                save(R#review{pro = Pro + 1}),
                                Rpro = {Id, Pro + 1},
                                List = case lists:keyfind({Type, BaseId},
                                                          1,
                                                          Pros)
                                           of
                                           {_, L} ->
                                               lists:keyreplace({Type, BaseId},
                                                                1,
                                                                Pros,
                                                                {{Type, BaseId},
                                                                 lists:keystore(Id,
                                                                                1,
                                                                                L,
                                                                                Rpro)});
                                           _ ->
                                               [{{Type, BaseId}, [Rpro]} | Pros]
                                       end,
                                {Pro + 1, List};
                            _ -> {0, Pros}
                        end,
    {reply, {ok, NewPro}, State#state{pros = NewPros}};
handle_call({downvote, Id}, _From, State = #state{}) ->
    NewCon = case fetch(Id) of
                 [R = #review{con = Con, pro = Pro, type = Type,
                              base_id = BaseId}] ->
                     case Con div max(1, Pro) of
                         M when M >= 3 ->
                             delete(Id),
                             log({delete, Id}),
                             big_world:cast(review,
                                            remove_expire,
                                            [Type, BaseId, Id]);
                         _ -> save(R#review{con = Con + 1})
                     end,
                     Con + 1;
                 _ -> 0
             end,
    {reply, {ok, NewCon}, State};
handle_call({report, Report = #review_report{}}, _From,
            State) ->
    Reply = case make_report(Report) of
                NewReport = #review_report{id = Id} ->
                    case ets:lookup(review_report, Id) of
                        [#review_report{}] ->
                            {false, lang:get("已经有人举报过，不用再举报了哦")};
                        _ ->
                            save_report(NewReport),
                            update_cache(NewReport),
                            ok
                    end;
                Else -> Else
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(sync_data,
            State = #state{mode = 1, keys = Keys,
                           sync_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case Keys of
        [] -> ok;
        _ ->
            Data = get_index(Keys),
            big_world:cast(all, review, update_index, [Data])
    end,
    Ref = erlang:send_after(util:rand(5000, 10000),
                            self(),
                            sync_data),
    {noreply, State#state{sync_ref = Ref, keys = []}};
handle_info(sync_data,
            State = #state{pros = Pros, sync_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case Pros of
        [] -> ok;
        _ ->
            log_pros(Pros),
            big_world:cast(review, update_pros, [Pros])
    end,
    Ref = erlang:send_after(util:rand(5000, 10000),
                            self(),
                            sync_data),
    {noreply, State#state{sync_ref = Ref, pros = []}};
handle_info({update_index, Idx}, State) ->
    do_update_index(Idx),
    {noreply, State};
handle_info({update_pros, Idx},
            State = #state{keys = Keys}) ->
    NewKeys = do_update_pros(Idx, Keys),
    {noreply, State#state{keys = NewKeys}};
handle_info({remove_expire, Type, BaseId, Id},
            State = #state{keys = Keys}) ->
    NewKeys = case ets:lookup(review_index, {Type, BaseId})
                  of
                  [Idx = #review_index{hots = Hots, ids = Ids}] ->
                      save(Idx#review_index{hots =
                                                lists:keydelete(Id, 1, Hots),
                                            ids = lists:keydelete(Id, 1, Ids)}),
                      case lists:member({Type, BaseId}, Keys) of
                          true -> Keys;
                          _ -> [{Type, BaseId} | Keys]
                      end;
                  _ -> Keys
              end,
    {noreply, State#state{keys = NewKeys}};
handle_info(load_report,
            State = #state{report_ref = OldRef, mode = 1}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    {noreply, State};
handle_info(load_report,
            State = #state{report_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Sql = "select id, platform, zone_id, time, "
          "lev, name, role_id, role_platform, role_zone_"
          "id, content, reporter_id, reporter_platform, "
          "reporter_zone_id, reporter_name, reporter_lev"
          ", report_type, base_id from review_report "
          "where state = ?",
    case db:get_all(Sql, [0]) of
        {ok, L} -> do_load_report(L);
        {error, _Err} ->
            logger:error("加载举报数时发生错误:~w", [_Err], review, 434)
    end,
    {noreply, State};
handle_info({handle_report, Id, HandleState, Items},
            State) ->
    case ets:lookup(review_report, Id) of
        [Report = #review_report{}] ->
            case do_handle_report(Report, HandleState) of
                ok ->
                    mark_report(Id, HandleState, Items),
                    delete_report(Report),
                    reward_report(Report, HandleState, Items),
                    ok;
                {false, Reason} ->
                    logger:error("处理举报操作时出错:~w", [Reason], review, 452),
                    ok
            end,
            {noreply, State};
        _ ->
            mark_report(Id, HandleState, []),
            {noreply, State}
    end;
handle_info({adm_delete, Id}, State) ->
    case fetch(Id) of
        [#review{type = Type, base_id = BaseId}] ->
            delete(Id),
            log({delete, Id}),
            big_world:cast(review,
                           remove_expire,
                           [Type, BaseId, Id]);
        _ -> ok
    end,
    {noreply, State};
handle_info({adm_upvote, Id, Pro},
            State = #state{pros = Pros}) ->
    NewPros = case fetch(Id) of
                  [R = #review{type = Type, base_id = BaseId}] ->
                      save(R#review{pro = Pro}),
                      Rpro = {Id, Pro},
                      case lists:keyfind({Type, BaseId}, 1, Pros) of
                          {_, L} ->
                              lists:keyreplace({Type, BaseId},
                                               1,
                                               Pros,
                                               {{Type, BaseId},
                                                lists:keystore(Id,
                                                               1,
                                                               L,
                                                               Rpro)});
                          _ -> [{{Type, BaseId}, [Rpro]} | Pros]
                      end;
                  _ -> Pros
              end,
    {noreply, State#state{pros = NewPros}};
handle_info({adm_downvote, Id, Con}, State) ->
    case fetch(Id) of
        [R = #review{}] -> save(R#review{con = Con});
        _ -> ok
    end,
    {noreply, State};
handle_info(loop, State) ->
    env:save_counter(review_id, 0),
    erlang:send_after(10000, self(), loop),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_data() ->
    case dets:first(review) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], review, 519),
            [];
        _ ->
            dets:traverse(review,
                          fun (R) ->
                                  case review_ver:do(R) of
                                      {ok, NR = #review{}} ->
                                          update_cache(NR),
                                          continue;
                                      _Else ->
                                          logger:error("评论数据转换失败:~w",
                                                       [_Else],
                                                       review,
                                                       529),
                                          {done, false}
                                  end
                          end)
    end,
    case dets:first(review_index) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], review, 538),
            [];
        _ ->
            dets:traverse(review_index,
                          fun (Idx) ->
                                  update_cache(Idx),
                                  continue
                          end)
    end.

update_cache(R = #review{}) -> ets:insert(review, R);
update_cache(R = #review_report{}) ->
    ets:insert(review_report, R);
update_cache(R = #review_index{}) ->
    ets:insert(review_index, R).

save(R = #review{}) ->
    update_cache(R),
    dets:insert(review, R);
save(R = #review_index{}) ->
    update_cache(R),
    dets:insert(review_index, R).

do_list(Rest, Key, Num) when Num > 8 ->
    erlang:put(Key, Rest),
    [];
do_list([], Key, _) ->
    erlang:put(Key, []),
    [];
do_list([{Id, _} | T], Key, Num) ->
    case fetch(Id) of
        [R = #review{}] -> [R | do_list(T, Key, Num + 1)];
        _ -> do_list(T, Key, Num)
    end.

check_post([], _, Args) -> {ok, Args};
check_post([lev | T], Role = #role{lev = Lev}, Args) ->
    case Lev < 55 of
        true ->
            {false,
             notice:format(lang:get("等级达到~ts才可以评论"),
                           [{string_2, 5, 55}])};
        _ -> check_post(T, Role, Args)
    end;
check_post([type | T],
           Role = #role{m_pet = #m_pet{pets = Pets}},
           Args = #{base_id := BaseId, type := 1}) ->
    case lists:keyfind(BaseId, #pet.base_id, Pets) of
        #pet{} -> check_post(T, Role, Args);
        _ -> {false, lang:get("你没有这个宠物哦")}
    end;
check_post([type | T],
           Role = #role{m_guard = #m_guard{guards = Guards}},
           Args = #{base_id := BaseId, type := 2}) ->
    case lists:keyfind(BaseId, #guard.base_id, Guards) of
        #guard{} -> check_post(T, Role, Args);
        _ -> {false, lang:get("你没有这个守护哦")}
    end;
check_post([share | T], Role, Args = #{ids := []}) ->
    check_post(T, Role, Args);
check_post([share | T],
           Role = #role{m_pet = #m_pet{pets = Pets}},
           Args = #{ids := Ids, base_id := BaseId, type := 1}) ->
    Ids1 = lists:usort(Ids),
    case check_share_pet(Ids1, BaseId, Pets, []) of
        {ok, Shared} ->
            check_post(T, Role, Args#{shared => Shared});
        Else -> Else
    end;
check_post([share | T],
           Role = #role{m_guard = #m_guard{guards = Guards}},
           Args = #{base_id := BaseId, type := 2}) ->
    case lists:keyfind(BaseId, #guard.base_id, Guards) of
        Guard = #guard{} ->
            check_post(T, Role, Args#{shared => Guard});
        _ -> {false, lang:get("你没有这个守护哦")}
    end;
check_post([limit | T], Role,
           Args = #{type := Type, base_id := BaseId}) ->
    L = var:get_var(Role, day, 95, []),
    case lists:member({Type, BaseId}, L) of
        true when Type =:= 1 ->
            {false, lang:get("今天已经评论过这个宠物了")};
        true -> {false, lang:get("今天已经评论过这个守护了")};
        _ -> check_post(T, Role, Args)
    end;
check_post([content | T], Role,
           Args = #{content := Content}) ->
    case util:check_text(Content, 150, lang:get("内容")) of
        {false, Reason} -> {false, Reason};
        _ -> check_post(T, Role, Args)
    end.

check_share_pet([], _, _, Shared) -> {ok, Shared};
check_share_pet([{Id} | T], BaseId, Pets, Shared) ->
    case lists:keyfind(Id, #pet.id, Pets) of
        Pet = #pet{base_id = BaseId} ->
            check_share_pet(T, BaseId, Pets, [Pet | Shared]);
        _ -> {false, lang:get("你指定的宠物好像不对")}
    end.

do_post(Role = #role{id = Id = {_, Platform, ZoneId},
                     sex = Sex, classes = Classes, name = Name},
        Args = #{type := Type, content := Content,
                 base_id := BaseId}) ->
    Mid = {env:update_counter(review_id, 1),
           Platform,
           ZoneId},
    Now = date:unixtime(),
    {Pets, Guards} = case Args of
                         #{type := 1, shared := Ps = [#pet{} | _]} -> {Ps, []};
                         #{type := 2, shared := Guard = #guard{}} ->
                             {[], [Guard]};
                         _ -> {[], []}
                     end,
    Review = #review{id = Mid, type = Type,
                     base_id = BaseId, name = Name, content = Content,
                     rid = Id, sex = Sex, classes = Classes, pets = Pets,
                     guards = Guards, ctime = Now},
    case big_world:call(gen_server,
                        call,
                        [review, {post, Review}])
        of
        ok ->
            L = var:get_var(Role, day, 95, []),
            save(Review),
            log(Review),
            {ok,
             Mid,
             var:set_var(Role, day, 95, [{Type, BaseId} | L])};
        _Else ->
            logger:debug("发布评论失败 ~w", [_Else], review, 681),
            {false, lang:get("当前服务器未连接跨服，无法评论")}
    end.

get_index([]) -> [];
get_index([H | T]) ->
    case ets:lookup(review_index, H) of
        [R = #review_index{}] -> [R | get_index(T)];
        _ -> get_index(T)
    end.

do_update_pros([], Keys) -> Keys;
do_update_pros([{Key, Pros} | T], Keys) ->
    case ets:lookup(review_index, Key) of
        [Idx = #review_index{hots = Hots}] ->
            L = do_replaces(Pros, Hots),
            L1 = util:keys_sort([2], L),
            L2 = lists:sublist(L1, 2),
            save(Idx#review_index{hots = L2}),
            case lists:member(Key, Keys) of
                true -> do_update_pros(T, Keys);
                _ -> do_update_pros(T, [Key | Keys])
            end;
        _ -> do_update_pros(T, Keys)
    end.

do_replaces([], L) -> L;
do_replaces([H = {K, _} | T], L) ->
    do_replaces(T, lists:keystore(K, 1, L, H)).

do_update_index([]) -> ok;
do_update_index([H = #review_index{key = Key,
                                   hots = Hots, ids = Ids}
                 | T]) ->
    case ets:lookup(review_index, Key) of
        [#review_index{ids = OldIds}] ->
            expire(OldIds, Hots ++ Ids),
            save(H);
        _ -> save(H)
    end,
    do_update_index(T).

expire([], _) -> ok;
expire([{Id, _} | T], L) ->
    case lists:keyfind(Id, 1, L) of
        false ->
            case role_misc:is_local_role(Id) of
                true ->
                    ets:delete(review, Id),
                    dets:delete(review, Id),
                    log({delete, Id});
                _ -> ok
            end;
        _ -> ok
    end,
    expire(T, L).

make_report(Report = #review_report{id = Id}) ->
    case fetch(Id) of
        [#review{content = Content, rid = Rid, name = Name,
                 type = Type, base_id = BaseId}] ->
            Report#review_report{content = Content, name = Name,
                                 rid = Rid, type = Type, base_id = BaseId};
        [] -> {false, lang:get("评论已不存在")};
        _ -> {false, lang:get("系统繁忙")}
    end.

save_report(#review_report{rid = {Rid, Rp, Rz},
                           id = {Mid, Mp, Mz}, name = Name, lev = Lev,
                           time = Time, content = Content, type = Type,
                           base_id = BaseId,
                           reporter_id =
                               {ReporterId, ReporerPlatform, ReporterZoneId},
                           reporter_name = ReporterName,
                           reporter_lev = ReporterLev}) ->
    Sql = "replace into review_report(id, platform, "
          "zone_id, time, lev, name, role_id, role_platf"
          "orm, role_zone_id,  content, reporter_id, "
          "reporter_platform, reporter_zone_id, "
          "reporter_name, reporter_lev, report_type, "
          "base_id) values(?, ?, ?, ?, ?, ?, ?, "
          "?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
    db:exec(Sql,
            [Mid,
             Mp,
             Mz,
             Time,
             Lev,
             Name,
             Rid,
             Rp,
             Rz,
             Content,
             ReporterId,
             ReporerPlatform,
             ReporterZoneId,
             ReporterName,
             ReporterLev,
             Type,
             BaseId]),
    ok.

do_load_report([]) -> ok;
do_load_report([[Mid,
                 Mp,
                 Mz,
                 Time,
                 Lev,
                 Name,
                 Rid,
                 Rp,
                 Rz,
                 Content,
                 ReporterId,
                 ReporerPlatform,
                 ReporterZoneId,
                 ReporterName,
                 ReporterLev,
                 Type,
                 BaseId]
                | T]) ->
    MomentId = {Mid, Mp, Mz},
    Report = #review_report{id = MomentId, type = Type,
                            base_id = BaseId, rid = {Rid, Rp, Rz}, name = Name,
                            lev = Lev, time = Time, content = Content,
                            reporter_id =
                                {ReporterId, ReporerPlatform, ReporterZoneId},
                            reporter_name = ReporterName,
                            reporter_lev = ReporterLev},
    update_cache(Report),
    do_load_report(T).

check_item(Items) -> check_item(Items, []).

check_item([], Items) -> {true, Items};
check_item([{ItemId, Bind, Num} | T], Items)
    when Num > 0 ->
    case item_data:get(ItemId) of
        #item_base{} ->
            check_item(T, [{ItemId, Bind, Num} | Items]);
        _ ->
            logger:error("举报发放不存在的奖励:~w", [ItemId], review, 792),
            check_item(T, Items)
    end;
check_item([_Err | _T], _Items) -> false.

do_handle_report(_Report, 2) -> ok;
do_handle_report(#review_report{rid = Rid,
                                id = MomentId, type = Type, base_id = BaseId},
                 1) ->
    Title = lang:get("评论违规"),
    Content =
        lang:get("您的评论被举报，已核实删除。和谐的游戏氛围需要大家共同创建，请勿发表不良内容{face_1"
                 ",25}。"),
    mail:send(Rid,
              #{title => Title, content => Content, items => []}),
    delete(MomentId),
    big_world:cast(review,
                   remove_expire,
                   [Type, BaseId, MomentId]).

delete(Id) ->
    ets:delete(review, Id),
    dets:delete(review, Id).

delete_report(#review_report{id = Id}) ->
    ets:delete(review_report, Id).

mark_report({Mid, Plat, ZoneId}, State, Items) ->
    Sql = "update review_report set state = ?, "
          "items = ? where id = ? and platform "
          "= ? and zone_id = ?",
    ItemStr = do_item_string(Items, ""),
    case db:exec(Sql, [State, ItemStr, Mid, Plat, ZoneId])
        of
        ok -> ok;
        {error, Reason} ->
            logger:error("更新举报数据库时失败~w", [Reason], review, 825),
            {false, Reason}
    end.

do_item_string([], Str) -> Str;
do_item_string([{ItemId, Bind, Num} | T], Str) ->
    NewStr = util:flist("{~w,~w,~w},~ts",
                        [ItemId, Bind, Num, Str]),
    do_item_string(T, NewStr);
do_item_string([_ | T], Str) -> do_item_string(T, Str).

reward_report(#review_report{reporter_id = RoleId,
                             name = Name},
              2, _Items) ->
    Title = lang:get("举报无效"),
    Content =
        notice:format(lang:get("您举报的~ts朋友圈内容/图片无效，恶意举报会伤害他人喔。{face_1,21}"),
                      [{role_2, Name}]),
    mail:send(RoleId,
              #{title => Title, content => Content, items => []}),
    ok;
reward_report(#review_report{name = Name,
                             reporter_id = RoleId, type = ReportType},
              _State, Items) ->
    Title = lang:get("举报成功"),
    Content = case ReportType of
                  1 ->
                      notice:format(lang:get("您举报的~ts的宠物评论，审核属实。良好的游戏氛围需要大家共同创建，这是您的奖励{face"
                                             "_1,9}。"),
                                    [{role_2, Name}]);
                  _ ->
                      notice:format(lang:get("您举报的~ts的守护评论，审核属实。良好的游戏氛围需要大家共同创建，这是您的奖励{face"
                                             "_1,9}。"),
                                    [{role_2, Name}])
              end,
    mail:send(RoleId,
              #{title => Title, content => Content, items => Items}),
    ok;
reward_report(_, _, _Items) -> ok.

simplify([], L) -> L;
simplify([H = {Id, _} | T], L) ->
    simplify(T, [H | lists:keydelete(Id, 1, L)]).

log(#review{rid = {Rid, Rp, Rz}, id = {Mid, Mp, Mz},
            name = Name, ctime = Time, content = Content,
            type = Type, base_id = BaseId}) ->
    BaseName = case Type of
                   1 ->
                       case pet_data:get_base(BaseId) of
                           #pet_base{name = Pn} -> Pn;
                           _ -> ""
                       end;
                   _ ->
                       case guard_data:get_guard_cfg(BaseId) of
                           #guard_data{alias = Gn} -> Gn;
                           _ -> ""
                       end
               end,
    Sql = "replace into review_log(id, platform, "
          "zone_id, time, name, role_id, role_platform, "
          "role_zone_id,  content, log_type, base_id, "
          "base_name) values(?, ?, ?, ?, ?, ?, "
          "?, ?, ?, ?, ?, ?)",
    db:exec(Sql,
            [Mid,
             Mp,
             Mz,
             Time,
             Name,
             Rid,
             Rp,
             Rz,
             Content,
             Type,
             BaseId,
             BaseName]),
    ok;
log({delete, {Mid, Mp, Mz}}) ->
    Sql = "update review_log set state = 2 where "
          "id =? and platform = ? and zone_id = "
          "?",
    db:exec(Sql, [Mid, Mp, Mz]),
    ok.

log_pros([]) -> ok;
log_pros([{_Key, Pros} | T]) ->
    do_log_pros(Pros),
    log_pros(T).

do_log_pros([]) -> ok;
do_log_pros([{{Mid, Mp, Mz}, Pro} | T]) ->
    Sql = "update review_log set pro = ? where "
          "id =? and platform = ? and zone_id = ?",
    db:exec(Sql, [Pro, Mid, Mp, Mz]),
    do_log_pros(T);
do_log_pros([_ | T]) -> do_log_pros(T).

