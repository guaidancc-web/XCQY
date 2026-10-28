-file("src/log/log_old.erl", 1).

-module(log_old).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         rpc/2,
         create/1,
         levup/1,
         mod/3,
         mod/4,
         mod/7,
         mod/9,
         login/5,
         pet/4,
         pet/5,
         eqm/4,
         eqm/5,
         alchemy/3,
         fuse/4,
         guard_eqm/4,
         guard_eqm/5,
         guard_astroid/4,
         gold/4,
         item_log/1,
         item_log2/1,
         child/4,
         child/5,
         assets/5,
         package/4,
         extension/8,
         drop/4,
         drop/5,
         camp/5,
         item/2,
         item_gain/3,
         item_loss/3,
         item_str/1,
         write/1,
         trans_begin/0,
         trans_flush/0,
         trans_clean/0,
         log/7,
         format/1,
         time_format/1,
         exp/4,
         market/5,
         market_gold_server/5,
         market_silver_server/5,
         skill_prac/4,
         photo/3,
         photo/6,
         activity/4,
         auto_buy/4,
         limit_return/3,
         treasure/5,
         achieve_shop/7,
         mail/2,
         mail/3,
         pet_create/4,
         wedding/2,
         give_present/4,
         family/3,
         add_furnishing/3,
         lottery/4,
         log_mount/3,
         camp_web/5,
         store/4,
         classes_modify/2,
         growth_fund/2,
         maze/3,
         talisman/2,
         talisman/3,
         talisman/4,
         agenda/2,
         agenda_stat/1,
         guild_auction/10,
         do_assets/6,
         do_score/6]).

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

-file("src/log/log_old.erl", 88).

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

-file("src/log/log_old.erl", 89).

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

-file("src/log/log_old.erl", 90).

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

-file("src/log/log_old.erl", 91).

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

-file("src/log/log_old.erl", 92).

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

-file("src/log/log_old.erl", 93).

-file("inc/log.hrl", 1).

-file("src/log/log_old.erl", 94).

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

-file("src/log/log_old.erl", 95).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/log/log_old.erl", 96).

-file("inc/unit.hrl", 1).

-record(unit_order,
        {order :: undefined | move | guard | attack | atom(),
         type = 0 :: 0..2,
         arg :: undefined | tuple() | [tuple()],
         data :: undefined | term(),
         condition = [] :: list(),
         over :: undefined | defense | stop | atom()}).

-record(unit_data,
        {id = 0 :: pos_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1 :: non_neg_integer(),
         desc = "",
         classes = 0,
         sex = 0,
         lev = 1,
         name = "" :: list(),
         activity = 0 :: 0..1,
         guide_lev = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: bitstring(),
         condition = [] :: [tuple()],
         speed = 120 :: pos_integer(),
         lock = 0 :: 0 | 1,
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         gain = [] :: list(),
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         talk = [] :: list(),
         looks = [] :: list(),
         data = [] :: list(),
         def_status = defense :: defense | patrol | loaf}).

-record(unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1,
         name = "" :: list(),
         pid = 0 :: non_neg_integer() | pid(),
         lev = 1,
         classes = 0,
         sex = 0,
         activity = 0 :: 0..1,
         dun_info :: undefined | {pid(), pos_integer()},
         combat_pid = 0 :: non_neg_integer() | pid(),
         status = 0 :: non_neg_integer(),
         guide_lev = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: list(),
         condition = [] :: [tuple()],
         speed = 180 :: pos_integer(),
         lock = 0 :: 0 | 1,
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         defxy = {0, 0, 0} :: tuple(),
         def_status = defense :: defense | patrol | loaf,
         talk = [] :: list(),
         pos :: undefined | tuple(),
         data :: undefined | term(),
         looks = [] :: [tuple()],
         evt = [] :: [atom()],
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         prop = [] :: [{non_neg_integer(), string()}],
         order = [] :: list(),
         path = [] :: list(),
         ts = {1, 1, 1} ::
             {pos_integer(), pos_integer(), pos_integer()},
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         ai_id = 0,
         ai = {[], []} :: {list(), list()},
         attr,
         role_id = {0, "", 0}}).

-record(map_unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: pos_integer(),
         activity = 0 :: 0..1,
         status = 0 :: non_neg_integer(),
         classes = 0,
         sex = 0,
         guide_lev = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         looks = [] :: [tuple()],
         prop = [] :: [tuple()]}).

-record(plot_unit,
        {id = 0 :: pos_integer(),
         name = "" :: bitstring(),
         base_id = 0 :: non_neg_integer(),
         type = 1,
         fun_type = 1,
         dun_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: non_neg_integer(),
         act_type = "" :: bitstring(),
         looks = [] :: [tuple()],
         status = 0 :: non_neg_integer(),
         quest_id = 0 :: non_neg_integer(),
         quest_prog_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(unit_statue,
        {type = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = []}).

-file("src/log/log_old.erl", 97).

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

-file("src/log/log_old.erl", 98).

-file("inc/mail.hrl", 1).

-record(mail,
        {sess ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         to ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         from ::
             undefined |
             {non_neg_integer(), bitstring(), non_neg_integer()},
         from_face = 0 :: non_neg_integer(),
         from_name = "" :: bitstring(),
         to_face = 0 :: non_neg_integer(),
         to_name = "" :: bitstring(),
         type = 0 :: 0..1,
         status = 0 :: 0..1,
         del_type = 0 :: 0..1,
         title = "" :: bitstring(),
         content = "" :: bitstring(),
         item_list = [] :: [tuple()],
         source = 0 :: pos_integer(),
         rev_ts = 0 :: pos_integer(),
         ts = 0 :: pos_integer(),
         read_ts = 0 :: non_neg_integer()}).

-file("src/log/log_old.erl", 99).

-file("inc/guild.hrl", 1).

-type guild_id() :: {non_neg_integer(),
                     list(),
                     non_neg_integer()}.

-record(guild_apply,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 1,
         time = 0,
         type = 0,
         looks = [],
         cup = 0 :: non_neg_integer(),
         donation = 0 :: non_neg_integer(),
         tag = 0 :: non_neg_integer(),
         msg = "" :: string()}).

-record(guild_envelop,
        {ver = 1,
         title = "" :: string(),
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list()}).

-record(guild_role,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..4,
         lev = 1 :: pos_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         fc = 1 :: pos_integer(),
         synth_fc = 1 :: pos_integer(),
         post = 0 :: 0..5,
         status = 0 :: 0 | 1,
         last_login = 1 :: pos_integer(),
         last_logout = 1 :: pos_integer(),
         enter_time = 0 :: non_neg_integer(),
         signature = "" :: list(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         cup = 0 :: non_neg_integer(),
         looks = [],
         envelope = #guild_envelop{},
         requirement = [],
         signed = 0 :: non_neg_integer(),
         last_signed = 0 :: non_neg_integer(),
         mails = [],
         active = 0,
         ability = 0,
         chat_num = 0,
         doing = 0,
         chat_num_list = [],
         doing_list = [],
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list()}).

-record(guild_leaver,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         guild_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         value = 0,
         total_value = 0 :: non_neg_integer(),
         time = 0 :: integer()}).

-record(guild_boss,
        {lev = 1 :: non_neg_integer(),
         step = 1 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         name = "",
         hp = 0 :: non_neg_integer(),
         hp_max = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         called = 0 :: integer(),
         log = [] :: list(),
         last_renamed = 0 :: non_neg_integer()}).

-record(guild_mercenary,
        {id = {0, "", 0},
         key :: undefined | tuple(),
         lev = 0 :: non_neg_integer(),
         name = "" :: string(),
         dispatched = 0 :: non_neg_integer(),
         recruited = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         gain = [],
         guard :: undefined | tuple()}).

-record(guild_totem,
        {ver = 0 :: non_neg_integer(),
         id = util:rand_list([101, 102, 103, 104, 105]) ::
             non_neg_integer(),
         changeable = 1 :: non_neg_integer(),
         last_changed = 0 :: non_neg_integer()}).

-record(guild_question_answer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         guild_name = "" :: string(),
         option = 0 :: 0..4,
         result = 0 :: 0 | 1,
         score = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         totem_id = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(guild_question,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: [#guild_question_answer{}],
         cheat_off = [],
         asked_num = 0 :: non_neg_integer(),
         cheat_nums = []}).

-record(guild_robber,
        {ver = 0 :: non_neg_integer(),
         id :: undefined | tuple(),
         today_generated = 0 :: non_neg_integer(),
         gen_hour = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         fighters = [],
         picker = []}).

-record(guild_treasure,
        {ver = 1 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         setting_chance = 0 :: non_neg_integer(),
         setting_time = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         generated = 0 :: non_neg_integer(),
         unit_num = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         can_open = 0 :: 0,
         fighters = [],
         picker = [],
         type = win}).

-record(guild_loot,
        {ver = 0, items = [], log = [], allocated = []}).

-record(guild_usurper,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_invitation,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 0,
         ctime = 0 :: integer(),
         guild_id :: undefined | tuple(),
         guild_name = "" :: string()}).

-record(guild_plant_irrigator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_plant,
        {ver = 0,
         pos = {0, 0},
         owner_rid = {0, "", 0},
         owner_name = "",
         irrigations = [],
         phase = 0,
         sowed = 0,
         matured = 0,
         fired = 0 :: 0 | 1,
         unit_id = {0, 0},
         unit_base_id = 0}).

-record(guild_union_apply,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         leader_id = {0, "", 0},
         leader_name = "" :: string(),
         ctime = 0 :: integer()}).

-record(guild_campaign,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list()}).

-record(guild_camp_web,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list()}).

-record(element_info,
        {ver = 1, build_type = 0, lev = 1, time = 0}).

-record(guild,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         ver = 21 :: non_neg_integer(),
         name = "" :: list(),
         assets = 5000000,
         max_assets = 5000000,
         upkeep = 0,
         pid :: undefined | pid(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         leader_sex = 0 :: 0 | 1,
         leader_classes = 0 :: 0..6,
         leader_lev = 0 :: non_neg_integer(),
         members = [] :: [#guild_role{}],
         mem_num = 0 :: non_neg_integer(),
         fresh_num = 0 :: non_neg_integer(),
         max_mem_num = 90,
         max_fresh_num = 100,
         board = "" :: list(),
         health = 100,
         join_type = 2,
         join_condition = [],
         apply_list = [],
         event_list = [],
         lev = 1 :: pos_integer(),
         lev_time = 0 :: non_neg_integer(),
         academy_lev = 0 :: non_neg_integer(),
         academy_time = 0 :: non_neg_integer(),
         store_lev = 0 :: non_neg_integer(),
         store_time = 0 :: non_neg_integer(),
         exchequer_lev = 0 :: non_neg_integer(),
         exchequer_time = 0 :: non_neg_integer(),
         lev_ref :: undefined | reference(),
         welfare_time = 0,
         welfare_list = [],
         store_tick_time = 0,
         store_list = [],
         create_time = 0,
         flag = 0,
         map_pid = 0,
         map_id = 0,
         boss = #guild_boss{},
         mercenarys = [] :: [#guild_mercenary{}],
         totem = #guild_totem{} :: #guild_totem{},
         question = #guild_question{},
         robber_num = 0 :: non_neg_integer(),
         robber_total_num = 0 :: non_neg_integer(),
         usurpers = [],
         activity = 0,
         plants = [],
         announcement = "" :: string(),
         union_applys = [] :: list(),
         union_applied = [] :: list(),
         today_used_medal = 0 :: integer(),
         last_medal_used = 0 :: integer(),
         today_upgraded_build = 0 :: integer(),
         last_build_upgraded = 0 :: integer(),
         today_destory_build = 0 :: integer(),
         last_build_destory = 0 :: integer(),
         treasure = #guild_treasure{},
         loot = #guild_loot{},
         week_assets = 0 :: integer(),
         formalizing_lev = 35 :: integer(),
         name_used = "" :: string(),
         create_id = {0, "", 0},
         create_name = "",
         guild_camp = #guild_campaign{},
         guild_camp_web = #guild_camp_web{},
         max_chat_num = 0,
         max_doing = 0,
         max_fc = 0,
         max_synth_fc = 0,
         element_info = [],
         uplev_element_times = 0,
         last_uplev_element = 0,
         upgrade_element_time = 0,
         mail_list = [],
         limit_mode = 0,
         is_lock_board = 0,
         board_id = {0, "", 0},
         announce_id = {0, "", 0}}).

-record(guild_element_attr,
        {ver = 1,
         effect_obj = 1,
         attr = [],
         attr_snd = [],
         add_skill_list = [],
         high_attr = [],
         end_time = 0}).

-record(m_guild,
        {ver = 3 :: pos_integer(),
         id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         pid :: undefined | pid(),
         enter_time = 0,
         guild_lev = 1,
         post = 0 :: non_neg_integer(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         signature = "" :: list(),
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list(),
         build_speed_num = 0 :: non_neg_integer()}).

-record(guild_emblem,
        {ver = 0, id = 0, type = 0, lev = 0}).

-record(m_guild_emblem,
        {ver = 0 :: non_neg_integer(),
         remain_point = 0 :: non_neg_integer(),
         total_point = 0 :: non_neg_integer(),
         emblems = []}).

-file("src/log/log_old.erl", 100).

-file("inc/skill.hrl", 1).

-record(m_skill,
        {ver = 6 :: pos_integer(),
         skills = [] :: [{non_neg_integer(), non_neg_integer()}],
         is_open_skl_prac = 0 :: 0 | 1,
         selected_skl_prac = 0 :: non_neg_integer(),
         skill_prac = [] :: list(),
         skill_couple = [] :: list(),
         skill_sworn = [] :: list(),
         speed = [] :: list(),
         skill_unique = [],
         skill_clsld_done = [],
         unique_coolddown_time = 0,
         skl_unique_point = 100,
         sq_double = 0,
         is_open_sq_double = 0,
         sq_exp_statistics = []}).

-record(role_base_skill,
        {id = 0,
         lev = 0,
         type :: undefined | non_neg_integer(),
         sub_type :: undefined | non_neg_integer(),
         max_lev = 0,
         name = "",
         way = 1,
         study_lev = 1,
         cost = [],
         attr = []}).

-record(skill,
        {id = 0,
         lev = 0,
         type = 0 :: non_neg_integer(),
         sub_type = 0 :: non_neg_integer(),
         speed = 1,
         name = "",
         acc_ratio = 1000,
         acc_low = 0,
         acc_high = 1000,
         attack_type = 0 :: non_neg_integer(),
         elem_type = 0 :: non_neg_integer(),
         target_type = 1 :: non_neg_integer(),
         attack_times = 1 :: non_neg_integer(),
         target_list = [],
         self_cond = [],
         self_loss = [],
         target_cond = [],
         dmg_addt = 0 :: non_neg_integer(),
         dmg_ratio = [1000] :: non_neg_integer(),
         pre_cooldown = 0,
         cooldown = 0 :: non_neg_integer(),
         cost_mp = 0 :: non_neg_integer(),
         cost_anger = 0,
         cost_other = [] :: [{atom(), non_neg_integer()}],
         buff_self = [] :: [tuple()],
         buff_target = [] :: [tuple()],
         script_id = 0 :: non_neg_integer(),
         script_args = [] :: [integer()],
         addt_scripts = [] ::
             [{non_neg_integer(), non_neg_integer(), list()}],
         play_time = 0 :: non_neg_integer()}).

-record(chief_classes,
        {leader_id = 0,
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         looks = []}).

-record(sq_exp_statistics,
        {combat_type = 0, times = 0, gain = 0, real_gain = 0}).

-file("src/log/log_old.erl", 101).

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

-file("src/log/log_old.erl", 102).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/log/log_old.erl", 103).

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

-file("src/log/log_old.erl", 104).

-file("inc/lottery.hrl", 1).

-record(lottery,
        {idx = 0 :: non_neg_integer(),
         ver = 2,
         idx_temp = 0 :: non_neg_integer(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         gold_type = 0 :: non_neg_integer(),
         gold_once = 1 :: non_neg_integer(),
         times_sum = 0 :: non_neg_integer(),
         times_now = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lucky_num = 0 :: non_neg_integer(),
         times_lottery = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         num_sum = 0 :: non_neg_integer(),
         hot = 0 :: non_neg_integer(),
         price = 0 :: non_neg_integer(),
         rare = 0 :: non_neg_integer(),
         sort = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         role_name = "" :: list(),
         history = [] :: list(),
         num_list = [] :: list(),
         id_data = 0 :: non_neg_integer(),
         left_list = [] :: list(),
         buy_list = [] :: list(),
         history_deal = [] :: list()}).

-record(lottery_history,
        {time = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         role_name = "" :: list(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         count = 0 :: non_neg_integer()}).

-record(lottery_mail,
        {idx = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         title = "" :: list(),
         content = "" :: list(),
         item_list = "" :: list(),
         time = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer()}).

-record(lottery_reward_log,
        {idx = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         role_name = "" :: list(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         times_buy = 0 :: non_neg_integer(),
         times_sum = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-file("src/log/log_old.erl", 105).

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

-file("src/log/log_old.erl", 106).

-file("inc/camp_web.hrl", 1).

-record(m_camp_web,
        {ver = 4 :: non_neg_integer(),
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list(),
         card_info = {0, 0, 0, []} :: tuple()}).

-record(camp_web_ico,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         title = "" :: bitstring(),
         ico = "" :: bitstring(),
         alert = "" :: bitstring(),
         gif = "" :: bitstring(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         login_open = 0 :: non_neg_integer(),
         is_show_time = 0 :: 0..1,
         menu_list = [] :: list()}).

-record(camp_web_menu,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_mod = 0 :: non_neg_integer(),
         mail_title = "" :: bitstring(),
         mail_content = "" :: bitstring(),
         title = "" :: bitstring(),
         title2 = "" :: bitstring(),
         ico = "" :: bitstring(),
         title_ico = "" :: bitstring(),
         type_ico = "" :: bitstring(),
         total_ico = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         sort_val = 0 :: non_neg_integer(),
         top_banner = "" :: bitstring(),
         rule_str = "" :: bitstring(),
         time_str = "" :: bitstring(),
         bottom_alert = "" :: bitstring(),
         reward_title = "" :: bitstring(),
         panel_type = "" :: bitstring(),
         cli_reward = "" :: bitstring(),
         button_text = "" :: bitstring(),
         is_button = 0 :: 0..1,
         notice_msg = "" :: bitstring(),
         camp_list = [] :: list(),
         is_tran = 0,
         tran_info = ""}).

-record(camp_web,
        {id = 0 :: non_neg_integer(),
         n = 1 :: pos_integer(),
         key = {0, 0} :: tuple(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         third_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_num = 1 :: non_neg_integer(),
         reward_can = 0 :: non_neg_integer(),
         value = 0 :: non_neg_integer(),
         tar_val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         status = 0 :: 0..2,
         cond_msg = "" :: bitstring(),
         loss_items = [] :: list(),
         items = [] :: list(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         str1 = "" :: bitstring(),
         str2 = "" :: bitstring(),
         str3 = "" :: bitstring(),
         str4 = "" :: bitstring(),
         extra = [],
         data :: undefined | any(),
         is_desc = 0 :: 0..1}).

-record(camp_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         total_camp :: undefined | #camp_web_ico{},
         menu :: undefined | #camp_web_menu{},
         camp :: undefined | #camp_web{},
         call_form = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         rpc_reward_num = 1 :: non_neg_integer(),
         push_cli = 0 :: 0..1,
         push_list = [] :: [tuple()],
         to_id,
         return_acc = 0}).

-file("src/log/log_old.erl", 107).

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

-file("src/log/log_old.erl", 108).

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

-file("src/log/log_old.erl", 109).

-record(state, {next_id = 1}).

format(L) ->
    {S, Args} = do_format(L, [], []),
    io_lib:format(S, Args).

do_format([], SL, Args) ->
    {string:join(lists:reverse(SL), "$$"),
     lists:reverse(Args)};
do_format([{Type = "~ts", A} | T], SL, Args) ->
    do_format(T, [Type | SL], [A | Args]);
do_format([{Type = "~w", A} | T], SL, Args) ->
    do_format(T, [Type | SL], [A | Args]);
do_format([{Type = "~p", A} | T], SL, Args) ->
    do_format(T, [Type | SL], [A | Args]);
do_format([{_Type = "~s", A} | T], SL, Args) ->
    do_format(T, ["~ts" | SL], [A | Args]);
do_format([{Type = "~tc", A} | T], SL, Args) ->
    do_format(T, [Type | SL], [A | Args]);
do_format([A | T], SL, Args) when is_binary(A) ->
    do_format(T, ["~ts" | SL], [A | Args]);
do_format([I | T], SL, Args) ->
    do_format(T, ["~w" | SL], [I | Args]).

-spec time_format(string()) -> string().

time_format("yyyyMMddhhmmss") ->
    {{Y, M, D}, {H, I, S}} = erlang:localtime(),
    lists:concat([Y, tf(M), tf(D), tf(H), tf(I), tf(S)]);
time_format("yyyy-MM-dd hh:mm:ss") ->
    {{Y, M, D}, {H, I, S}} = erlang:localtime(),
    lists:concat([Y,
                  "-",
                  tf(M),
                  "-",
                  tf(D),
                  " ",
                  tf(H),
                  ":",
                  tf(I),
                  ":",
                  tf(S)]).

tf(0) -> "00";
tf(1) -> "01";
tf(2) -> "02";
tf(3) -> "03";
tf(4) -> "04";
tf(5) -> "05";
tf(6) -> "06";
tf(7) -> "07";
tf(8) -> "08";
tf(9) -> "09";
tf(N) -> N.

-spec start_link() -> ignore |
                      {ok, pid()} |
                      {error, any()}.

start_link() ->
    gen_server:start_link({local, log_old},
                          log_old,
                          [],
                          []).

-spec rpc(#role{}, string() | bitstring()) -> ok.

rpc(#role{id = {Id, Platform, ZoneId}, name = Name,
          account = Account, lev = Lev, classes = Classes},
    Msg) ->
    T = date:unixtime(),
    Txt = format([get(rpc_code),
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Msg}]),
    write(Txt),
    ok.

-spec create(#role{}) -> ok.

create(_Role) -> ok.

-spec levup(#role{}) -> ok.

levup(Role = #role{id = {Id, Platform, ZoneId},
                   name = Name, account = Account,
                   channel_reg = ChannelReg, lev = Lev, classes = Classes,
                   assets = #assets{exp = Exp}}) ->
    T = date:unixtime(),
    Txt = format([levup,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  Exp]),
    write(Txt),
    do_levup(Role),
    ok.

do_levup(_Role) -> ok.

-spec mod(#role{}, atom(),
          non_neg_integer() | string() | bitstring()) -> ok.

mod(Role, Type, Title) when is_integer(Title) ->
    mod(Role, Type, integer_to_list(Title));
mod(#role{id = {Id, Platform, ZoneId}, name = Name,
          account = Account, channel_reg = ChannelReg, lev = Lev,
          classes = Classes},
    Type, Title) ->
    T = date:unixtime(),
    Txt = format([Type,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title}]),
    write(Txt),
    ok.

mod(#role{id = {Id, Platform, ZoneId}, name = Name,
          account = Account, channel_reg = ChannelReg, lev = Lev,
          classes = Classes},
    Type, Title, Msg) ->
    T = date:unixtime(),
    Txt = format([Type,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  {"~ts", Msg}]),
    write(Txt),
    ok.

mod(#role{id = {Id, Platform, ZoneId}, name = Name,
          account = Account, channel_reg = ChannelReg, lev = Lev,
          classes = Classes},
    Label, Title, Msg, LossMsg, OldR, NewR) ->
    T = date:unixtime(),
    Txt = format([mod,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  {"~ts", Msg},
                  {"~ts", loss_log(LossMsg, OldR, NewR)},
                  {"~ts", rec_log(Label, OldR)},
                  {"~ts", rec_log(Label, NewR)}]),
    write(Txt),
    ok.

mod(#role{id = {Id, Platform, ZoneId}, name = Name,
          account = Account, channel_reg = ChannelReg, lev = Lev,
          classes = Classes},
    Label, Title, Msg, LossMsg, OldR, NewR, OldData,
    NewData) ->
    T = date:unixtime(),
    Txt = format([mod,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  {"~ts", Msg},
                  {"~ts", loss_log(LossMsg, OldR, NewR)},
                  {"~ts", rec_log(Label, OldData)},
                  {"~ts", rec_log(Label, NewData)}]),
    write(Txt),
    ok.

loss_log(role_gain, OldR, NewR) ->
    do_loss_log([gold, gold_bind, coin, items],
                OldR,
                NewR,
                []);
loss_log(LossMsg, _OldR, _NewR) -> LossMsg.

do_loss_log([], _OldR, _NewR, L) -> string:join(L, "");
do_loss_log([Label | T], OldR, NewR, L) ->
    L1 = do_loss_log(Label, OldR, NewR),
    do_loss_log(T, OldR, NewR, L ++ L1).

do_loss_log(gold,
            #role{assets = #assets{gold = OldVal}},
            #role{assets = #assets{gold = NewVal}})
    when OldVal > NewVal ->
    [io_lib:format("[钻石:~w]", [OldVal - NewVal])];
do_loss_log(gold_bind,
            #role{assets = #assets{gold_bind = OldVal}},
            #role{assets = #assets{gold_bind = NewVal}})
    when OldVal > NewVal ->
    [io_lib:format("[金币:~w]", [OldVal - NewVal])];
do_loss_log(coin,
            #role{assets = #assets{coin = OldVal}},
            #role{assets = #assets{coin = NewVal}})
    when OldVal > NewVal ->
    [io_lib:format("[银币:~w]", [OldVal - NewVal])];
do_loss_log(guild,
            #role{assets = #assets{guild = OldVal}},
            #role{assets = #assets{guild = NewVal}})
    when OldVal > NewVal ->
    [io_lib:format("[公会贡献:~w]", [OldVal - NewVal])];
do_loss_log(items, _OldR, _NewR) ->
    case get(role_loss_items) of
        L = [_ | _] ->
            [io_lib:format("[~ts:~w,~w]",
                           [item:attr(name, BaseId), BaseId, Num])
             || {BaseId, Num} <- L];
        _ -> []
    end;
do_loss_log(_Label, _OldR, _NewR) -> [].

rec_log(_Label, Msg) when is_binary(Msg) -> Msg;
rec_log(_Label, _R) -> "".

login(#role{id = {Id, Platform, ZoneId},
            ip_last_login = {IP1, IP2, IP3, IP4}, account = Account,
            channel_reg = ChannelReg, classes = Classes, lev = Lev,
            name = Name},
      Type, LoginT, LogoutT, Msg) ->
    T = date:unixtime(),
    Txt = format([Type,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts",
                   util:flist("~w.~w.~w.~w", [IP1, IP2, IP3, IP4])},
                  LoginT,
                  LogoutT,
                  {"~ts", Msg}]),
    write(Txt),
    ok.

-spec pet(#role{}, Title :: string() | bitstring(),
          #pet{}, #pet{}) -> ok.

pet(Role, Title, OldPet, NewPet) ->
    pet(Role, Title, OldPet, NewPet, false).

pet(#role{id = {Id, Platform, ZoneId}, name = Name,
          account = Account, channel_reg = ChannelReg, lev = Lev,
          classes = Classes},
    Title, OldPet, NewPet, Flag) ->
    T = date:unixtime(),
    Txt = format([pet,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  {"~ts", pet_log(OldPet)},
                  {"~ts", pet_log(NewPet)},
                  do_record(pet, OldPet, Flag)]),
    write(Txt),
    ok.

child(#role{id = RoleId, name = Name, account = Account,
            lev = Lev, classes = Classes},
      Title, OldChild, NewChild) ->
    child(RoleId,
          Name,
          Account,
          Lev,
          Classes,
          Title,
          OldChild,
          NewChild);
child(_, _Title, _OldChild, _NewChild) ->
    logger:error("日志参数错误 [~w]", [_Title], log_old, 267),
    ok.

child(RoleId, #child{parents = Parents}, Title,
      OldChild, NewChild) ->
    case lists:keyfind(RoleId, #child_parent.id, Parents) of
        #child_parent{id = RoleId, account = Account,
                      name = Name, lev = Lev, classes = Classes} ->
            child(RoleId,
                  Name,
                  Account,
                  Lev,
                  Classes,
                  Title,
                  OldChild,
                  NewChild);
        _ -> ok
    end;
child(_, _, _Title, _OldChild, _NewChild) ->
    logger:error("日志参数错误 [~w]", [_Title], log_old, 277),
    ok.

child({Id, Platform, ZoneId}, Name, Account, Lev,
      Classes, Title, OldChild, NewChild) ->
    T = date:unixtime(),
    Txt = format([child,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  {"~ts", "0"},
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  {"~ts", child_log(OldChild)},
                  {"~ts", child_log(NewChild)}]),
    write(Txt),
    ok.

pet_create(NewR = #role{id = {Id, Platform, ZoneId},
                        name = Name, account = Account,
                        channel_reg = ChannelReg, lev = Lev, classes = Classes},
           OldR, Pet = #pet{genre = Genre}, #{from := From})
    when Genre == 2 orelse
             Genre == 4 orelse Genre == 5 orelse Genre == 6 ->
    T = date:unixtime(),
    Txt = format([pet_create,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", From},
                  {"~ts", pet_log(Pet)},
                  {"~ts", loss_log(role_gain, OldR, NewR)}]),
    write(Txt),
    ok;
pet_create(NewR = #role{id = {Id, Platform, ZoneId},
                        name = Name, account = Account,
                        channel_reg = ChannelReg, lev = Lev, classes = Classes},
           OldR, Pet = #pet{genre = Genre}, _)
    when Genre == 2 orelse
             Genre == 4 orelse Genre == 5 orelse Genre == 6 ->
    T = date:unixtime(),
    Txt = format([pet_create,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", "未知"},
                  {"~ts", pet_log(Pet)},
                  {"~ts", loss_log(role_gain, OldR, NewR)}]),
    write(Txt),
    ok;
pet_create(_NewR, _OldR, _Pet, _) -> ok.

wedding(#role{id = {Id, Platform, ZoneId}, name = Name,
              account = Account, channel_reg = ChannelReg, lev = Lev,
              classes = Classes},
        #{id := {RId, RPlatform, RZoneId}, name := RName,
          other_id := {ORId, ORPlatform, ORZoneId},
          other_name := ORName, handle := Handle,
          type := Type}) ->
    T = date:unixtime(),
    Txt = format([log_wedding,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  RId,
                  {"~ts", RPlatform},
                  RZoneId,
                  {"~ts", RName},
                  ORId,
                  {"~ts", ORPlatform},
                  ORZoneId,
                  {"~ts", ORName},
                  {"~ts", Handle},
                  Type]),
    write(Txt),
    ok.

package(#role{id = {Id, Platform, ZoneId}, name = Name,
              account = Account, channel_reg = ChannelReg, lev = Lev,
              classes = Classes},
        Title, SItem, TItem) ->
    T = date:unixtime(),
    Txt = format([package,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  {"~ts", item_log(SItem)},
                  {"~ts", item_log(TItem)}]),
    write(Txt),
    ok.

extension(_ApplyRoleId = {Aid, Aplat, Azone}, ApplyName,
          _RoleId = {Bid, Bplat, Bzone}, RoleName, RoleLev, Title,
          AddScore, AllScore) ->
    T = date:unixtime(),
    Txt = format([extension,
                  T,
                  Aid,
                  {"~ts", Aplat},
                  Azone,
                  {"~ts", "channel"},
                  {"~ts", ApplyName},
                  {"~ts", "account"},
                  0,
                  0,
                  Bid,
                  {"~ts", Bplat},
                  Bzone,
                  {"~ts", RoleName},
                  RoleLev,
                  {"~ts", Title},
                  AddScore,
                  AllScore]),
    write(Txt),
    ok.

eqm(Role, Title, OldEqm, NewEqm) ->
    eqm(Role, Title, OldEqm, NewEqm, null).

eqm(#role{id = {Id, Platform, ZoneId}, name = Name,
          account = Account, channel_reg = ChannelReg, lev = Lev,
          classes = Classes},
    Title, OldEqm, NewEqm, Ext) ->
    T = date:unixtime(),
    Txt = format([eqm,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  {"~ts", item_log(OldEqm)},
                  {"~ts", item_log(NewEqm)},
                  {"~ts", eqm_ext_log(Ext)}]),
    write(Txt),
    ok.

alchemy(#role{id = {Id, Platform, ZoneId}, name = Name,
              account = Account, channel_reg = ChannelReg, lev = Lev,
              classes = Classes},
        Title, Items) ->
    T = date:unixtime(),
    ItemLogs = [item_log2(I) || I <- Items],
    ItemLogs2 = string:join(ItemLogs, ","),
    Txt = format([alchemy,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  {"~ts", ItemLogs2}]),
    write(Txt),
    ok.

fuse(#role{id = {Id, Platform, ZoneId}, name = Name,
           account = Account, channel_reg = ChannelReg, lev = Lev,
           classes = Classes},
     Title, Items, NewItem) ->
    T = date:unixtime(),
    ItemLogs = [item_log2(I) || I <- Items],
    ItemLogs2 = string:join(ItemLogs, ","),
    Txt = format([fuse,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  {"~ts", ItemLogs2},
                  {"~ts", item_log2(NewItem)}]),
    write(Txt),
    ok.

guard_eqm(Role, Title, OldEqm, NewEqm) ->
    guard_eqm(Role, Title, OldEqm, NewEqm, null).

guard_eqm(#role{id = {Id, Platform, ZoneId},
                name = Name, account = Account,
                channel_reg = ChannelReg, lev = Lev, classes = Classes},
          Title, OldEqm, NewEqm, Ext) ->
    T = date:unixtime(),
    Txt = format([eqm,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  {"~ts", guard_eqm_log(OldEqm)},
                  {"~ts", guard_eqm_log(NewEqm)},
                  {"~ts", eqm_ext_log(Ext)}]),
    write(Txt),
    ok.

guard_astroid(#role{id = {Id, Platform, ZoneId},
                    name = Name, account = Account,
                    channel_reg = ChannelReg, lev = Lev, classes = Classes},
              Title, OldA,
              #guard{base_id = BaseId, quality = Q,
                     astroid = NewA}) ->
    T = date:unixtime(),
    Txt = format([guard_astroid,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  BaseId,
                  Q,
                  {"~ts", guard_astroid_log(OldA)},
                  {"~ts", guard_astroid_log(NewA)}]),
    write(Txt),
    ok.

photo(#role{id = {Id, Platform, ZoneId}, name = Name,
            account = Account, channel_reg = ChannelReg,
            classes = Classes, lev = Lev},
      Title, N) ->
    T = date:unixtime(),
    Txt = format([photo,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  N]),
    write(Txt),
    ok.

photo({Id, Platform, ZoneId}, Name, Classes, Lev, Title,
      N) ->
    T = date:unixtime(),
    Txt = format([photo,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  0,
                  {"~ts", Name},
                  {"~ts", "account"},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  N]),
    write(Txt),
    ok.

activity(#role{id = {Id, Platform, ZoneId}, name = Name,
               account = Account, channel_reg = ChannelReg,
               classes = Classes, lev = Lev},
         Title, OldVal, NewVal) ->
    TitleStr = case Title of
                   [_ | _] -> Title;
                   #{name := ActName} -> ActName;
                   _ -> "参与"
               end,
    T = date:unixtime(),
    Txt = format([activity,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", TitleStr},
                  OldVal,
                  NewVal]),
    write(Txt),
    ok.

agenda(#role{id = {Id, Platform, ZoneId}, name = Name,
             account = Account, channel_reg = ChannelReg,
             classes = Classes, lev = Lev},
       #{name := Title, id := AgendaId, open_leve := OpenLev,
         max_try := Max}) ->
    T = date:unixtime(),
    Txt = format([agenda,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  AgendaId,
                  OpenLev,
                  Max]),
    write(Txt),
    ok;
agenda(_, _Cfg) ->
    logger:error("日程日志配置错误:[cfg:~w]", [_Cfg], log_old, 401),
    ok.

agenda_stat(#{name := Title, id := AgendaId,
              open_leve := OpenLev, lev := Lev,
              lev_joined := LevJoined, lev_finish := LevFinish,
              lev_total := LevTotal}) ->
    T = date:unixtime(),
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    Txt = format([agenda_stat,
                  T,
                  0,
                  {"~ts", Platform},
                  ZoneId,
                  0,
                  0,
                  0,
                  0,
                  0,
                  {"~ts", Title},
                  AgendaId,
                  OpenLev,
                  Lev,
                  LevJoined,
                  LevFinish,
                  LevTotal]),
    write(Txt),
    ok;
agenda_stat(_Cfg) ->
    logger:error("日程日志配置错误:[cfg:~w]", [_Cfg], log_old, 413),
    ok.

market(Label = log_market_silver,
       Role = #role{assets = #assets{coin = OldVal}},
       #role{assets = #assets{coin = NewVal}}, Title, Msg) ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
market(Label = log_market_gold,
       Role = #role{assets = #assets{gold_bind = OldVal}},
       #role{assets = #assets{gold_bind = NewVal}}, Title,
       Msg) ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
market(Label, _OldRole, _NRole, _Title, _Msg) ->
    logger:error("市场日志标签错误:[Label:~w]",
                 [Label],
                 log_old,
                 422),
    ok.

market_gold_server(Label, Platform, ZoneId, Title,
                   Msg) ->
    T = date:unixtime(),
    Txt = format([Label,
                  T,
                  0,
                  {"~ts", Platform},
                  ZoneId,
                  0,
                  {"~ts", "xxx"},
                  {"~ts", "xxx"},
                  0,
                  0,
                  {"~ts", Title},
                  {"~ts", Msg}]),
    write(Txt),
    ok.

market_silver_server(Label, Platform, ZoneId, Title,
                     Msg) ->
    T = date:unixtime(),
    Txt = format([Label,
                  T,
                  0,
                  {"~ts", Platform},
                  ZoneId,
                  0,
                  {"~ts", "xxx"},
                  {"~ts", "xxx"},
                  0,
                  0,
                  {"~ts", Title},
                  {"~ts", Msg}]),
    write(Txt),
    ok.

auto_buy(#role{id = {Id, Platform, ZoneId}, name = Name,
               account = Account, channel_reg = ChannelReg,
               classes = Classes, lev = Lev},
         Title, Gain, Loss) ->
    Label = log_market_convenient,
    T = date:unixtime(),
    Msg = util:flist("~ts$$~ts", [Gain, Loss]),
    Fmt = [Label,
           T,
           Id,
           {"~ts", Platform},
           ZoneId,
           ChannelReg,
           {"~ts", Name},
           {"~ts", Account},
           Lev,
           Classes,
           {"~ts", Title},
           {"~ts", Msg}],
    Txt = format(Fmt),
    write(Txt),
    ok.

skill_prac(NewR = #role{id = {Id, Platform, ZoneId},
                        name = Name, account = Account,
                        channel_reg = ChannelReg, lev = Lev, classes = Classes},
           Title, Msg, OldR) ->
    T = date:unixtime(),
    Txt = format([skill_prac,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  {"~ts",
                   do_loss_log([coin, guild, items], OldR, NewR, [])},
                  {"~ts", Msg}]),
    write(Txt),
    ok.

limit_return(#role{id = {Id, Platform, ZoneId},
                   name = Name, account = Account,
                   channel_reg = ChannelReg, lev = Lev, classes = Classes},
             Sn, Gold) ->
    T = date:unixtime(),
    Txt = format([limit_return,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Sn},
                  Gold]),
    write(Txt),
    ok.

treasure(#role{id = {Id, Platform, ZoneId}, name = Name,
               account = Account, channel_reg = ChannelReg, lev = Lev,
               classes = Classes},
         TypeName, UseId, ItemId, Val) ->
    T = date:unixtime(),
    Txt = format([treasure,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", TypeName},
                  UseId,
                  ItemId,
                  Val]),
    write(Txt),
    ok.

achieve_shop(#role{id = {Id, Platform, ZoneId},
                   name = Name, account = Account,
                   channel_reg = ChannelReg, lev = Lev, classes = Classes},
             Operate, BeforeScore, Score, GoodsId, GoodsName,
             ShopType) ->
    T = date:unixtime(),
    AfterScore = case Operate of
                     1 -> BeforeScore + Score;
                     0 -> BeforeScore - Score
                 end,
    Txt = format([achieve_shop,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  Operate,
                  BeforeScore,
                  Score,
                  AfterScore,
                  GoodsId,
                  {"~ts", GoodsName},
                  ShopType]),
    write(Txt),
    ok.

give_present(_Giver = #role{id =
                                {GId, GPlatform, GZoneId},
                            name = GName, account = GAccount,
                            channel_reg = GChannelReg, lev = Lev,
                            classes = Classes},
             {RID, RPlatform, RZoneId}, ReceiverName, ItemInfo) ->
    T = date:unixtime(),
    Txt = format([give_present,
                  T,
                  GId,
                  {"~ts", GPlatform},
                  GZoneId,
                  GChannelReg,
                  {"~ts", GName},
                  {"~ts", GAccount},
                  Lev,
                  Classes,
                  RID,
                  {"~ts", RPlatform},
                  RZoneId,
                  {"~ts", ReceiverName},
                  {"~ts", ItemInfo}]),
    write(Txt),
    ok.

family(#role{id = {Id, Platform, ZoneId}, name = Name,
             account = Account, channel_reg = ChannelReg, lev = Lev,
             classes = Classes},
       Operate, {FamilyId, _, _}) ->
    T = date:unixtime(),
    Txt = format([family,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Operate},
                  FamilyId]),
    write(Txt),
    ok.

add_furnishing(#role{id = {Id, Platform, ZoneId},
                     name = Name, account = Account,
                     channel_reg = ChannelReg, lev = Lev, classes = Classes},
               {FamilyId, _, _}, FurBaseId) ->
    T = date:unixtime(),
    Txt = format([add_furnishing,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  FamilyId,
                  FurBaseId]),
    write(Txt),
    ok.

lottery(#role{id = {Id, Platform, ZoneId}, name = Name,
              account = Account, channel_reg = ChannelReg, lev = Lev,
              classes = Classes},
        #lottery{idx = Idx, item_idx = ItemIdx,
                 item_id = ItemId, item_count = ItemCount,
                 gold_type = GoldType, gold_once = GoldOnce},
        Count, Flag) ->
    T = date:unixtime(),
    Txt = format([lottery,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Idx},
                  ItemIdx,
                  ItemId,
                  ItemCount,
                  GoldType,
                  GoldOnce * Count,
                  Flag]),
    write(Txt),
    ok;
lottery(#{id := {Id, Platform, ZoneId}, name := Name,
          account := Account, channel_reg := ChannelReg,
          lev := Lev, classes := Classes},
        #lottery{idx = Idx, item_idx = ItemIdx,
                 item_id = ItemId, item_count = ItemCount,
                 gold_type = GoldType, gold_once = GoldOnce},
        Count, Flag) ->
    T = date:unixtime(),
    Txt = format([lottery,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Idx},
                  ItemIdx,
                  ItemId,
                  ItemCount,
                  GoldType,
                  GoldOnce * Count,
                  Flag]),
    write(Txt),
    ok.

log_mount(_Role = #role{id = {Id, Platform, ZoneId},
                        name = Name, account = Account,
                        channel_reg = ChannelReg, lev = Lev, classes = Classes,
                        m_mount = #m_mount{mounts = Mounts}},
          Opt, Index) ->
    logger:debug("坐骑日志:~w", [{Index, Opt}], log_old, 517),
    T = date:unixtime(),
    case lists:keyfind(Index, #mount.index, Mounts) of
        #mount{lev = MountLev, skill_list = SkillList,
               decorate_list = DecorateList, upgrade_lev = UpgradeLev,
               live_status = Status, skill_point = SkillPoint,
               spirit = Spirit, fight_times = FightTimes,
               score = Score} ->
            SklFun = fun (#mount_skill{skill_id = SID,
                                       skill_lev = SLEV},
                          SklInfo) ->
                             SklInfo ++ util:flist("~w:~w;", [SID, SLEV]);
                         (_, SklInfo) -> SklInfo
                     end,
            SkillInfo = lists:foldl(SklFun, [], SkillList),
            DcoFun = fun (#mount_decorate{decorate_index = DcoId,
                                          decorate_base_id = DcoBaseId},
                          DcoInfo) ->
                             DcoInfo ++
                                 util:flist("~w:~w;", [DcoId, DcoBaseId]);
                         (_, DcoInfo) -> DcoInfo
                     end,
            DecorateInfo = lists:foldl(DcoFun, [], DecorateList),
            Txt = format([mount,
                          T,
                          Id,
                          {"~ts", Platform},
                          ZoneId,
                          ChannelReg,
                          {"~ts", Name},
                          {"~ts", Account},
                          Lev,
                          Classes,
                          {"~ts", Opt},
                          Index,
                          Status,
                          MountLev,
                          UpgradeLev,
                          SkillPoint,
                          {"~ts", SkillInfo},
                          {"~ts", DecorateInfo},
                          Spirit,
                          Score,
                          FightTimes]),
            write(Txt),
            ok;
        _ ->
            logger:debug("==============", [], log_old, 536),
            skip
    end.

classes_modify(#role{id = {Id, Platform, ZoneId},
                     name = Name, account = Account,
                     channel_reg = ChannelReg, lev = Lev, classes = Classes},
               TargetClasses) ->
    T = date:unixtime(),
    Txt = format([classes_modify,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  TargetClasses]),
    write(Txt),
    ok.

growth_fund(#role{id = {Id, Platform, ZoneId},
                  name = Name, account = Account,
                  channel_reg = ChannelReg, lev = Lev, classes = Classes},
            BuyLev) ->
    T = date:unixtime(),
    Txt = format([growth_fund,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  BuyLev]),
    write(Txt),
    ok.

maze(#role{id = {Id, Platform, ZoneId}, name = Name,
           account = Account, channel_reg = ChannelReg, lev = Lev,
           classes = Classes},
     Items, Des) ->
    T = date:unixtime(),
    Txt = format([maze,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", item_str(Items)},
                  {"~ts", Des}]),
    write(Txt),
    ok.

guild_auction({Id, Platform, ZoneId}, Name, Classes,
              AuName, AuQuality, IsUnsold, IsMax, Price, GuideName,
              Lev) ->
    T = date:unixtime(),
    Txt = format([guild_auction,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  0,
                  {"~ts", Name},
                  "",
                  Lev,
                  Classes,
                  {"~ts", AuName},
                  AuQuality,
                  IsUnsold,
                  IsMax,
                  Price,
                  {"~ts", GuideName}]),
    write(Txt),
    ok.

log(#role{id = {Id, Platform, ZoneId}, name = Name,
          account = Account, channel_reg = ChannelReg, lev = Lev,
          classes = Classes},
    Label, Title, Msg, LossMsg, OldR, NewR) ->
    T = date:unixtime(),
    Txt = format([Label,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  {"~ts", Msg},
                  {"~ts", loss_log(LossMsg, OldR, NewR)},
                  {"~ts", rec_log(Label, OldR)},
                  {"~ts", rec_log(Label, NewR)}]),
    write(Txt),
    ok.

-spec gold(#role{}, #role{},
           Title :: bitstring() | string(),
           Msg :: bitstring() | string()) -> ok.

gold(Role, NRole, Title, Msg) ->
    assets([gold, gold_bind], Role, NRole, Title, Msg).

-spec assets(Label :: atom(), #role{}, #role{},
             Title :: bitstring() | string(),
             Msg :: bitstring() | string()) -> ok.

assets(Label = shop,
       Role = #role{assets = #assets{gold = OldVal}},
       #role{assets = #assets{gold = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = shop,
       Role = #role{assets = #assets{gold_bind = OldVal}},
       #role{assets = #assets{gold_bind = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = shop,
       Role = #role{assets = #assets{stars_score = OldVal}},
       #role{assets = #assets{stars_score = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = shop,
       Role = #role{assets = #assets{character = OldVal}},
       #role{assets = #assets{character = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = shop,
       Role = #role{assets = #assets{egg = OldVal}},
       #role{assets = #assets{egg = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = shop,
       Role = #role{assets = #assets{father = OldVal}},
       #role{assets = #assets{father = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = shop,
       Role = #role{assets = #assets{turn = OldVal}},
       #role{assets = #assets{turn = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = log_market_gold,
       Role = #role{assets = #assets{gold_bind = OldVal}},
       #role{assets = #assets{gold_bind = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = log_market_gold,
       Role = #role{assets = #assets{gold = OldVal}},
       #role{assets = #assets{gold = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = gold,
       Role = #role{assets = #assets{gold = OldVal}},
       #role{assets = #assets{gold = NewVal}}, Title = "充值",
       Msg)
    when OldVal == NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = gold,
       Role = #role{assets = #assets{gold = OldVal}},
       #role{assets = #assets{gold = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = gold_bind,
       Role = #role{assets = #assets{gold_bind = OldVal}},
       #role{assets = #assets{gold_bind = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = coin,
       Role = #role{assets = #assets{coin = OldVal}},
       #role{assets = #assets{coin = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = log_npc_shop,
       Role = #role{assets = #assets{coin = OldVal}},
       #role{assets = #assets{coin = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = 90010,
       Role = #role{assets = #assets{exp = OldVal}},
       #role{assets = #assets{exp = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(ValType = 90011,
       Role = #role{assets = #assets{guild = OldVal}},
       #role{assets = #assets{guild = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90012,
       Role = #role{assets = #assets{stars_score = OldVal}},
       #role{assets = #assets{stars_score = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90007,
       Role = #role{assets = #assets{character = OldVal}},
       #role{assets = #assets{character = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90014,
       Role = #role{assets = #assets{satiety = OldVal}},
       #role{assets = #assets{satiety = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90004,
       Role = #role{assets = #assets{intelligs = OldVal}},
       #role{assets = #assets{intelligs = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90017,
       Role = #role{assets = #assets{alchemy = OldVal}},
       #role{assets = #assets{alchemy = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90006,
       Role = #role{assets = #assets{energy = OldVal}},
       #role{assets = #assets{energy = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90018,
       Role = #role{assets = #assets{love = OldVal}},
       #role{assets = #assets{love = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90036,
       Role = #role{assets = #assets{brother = OldVal}},
       #role{assets = #assets{brother = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90019,
       Role = #role{assets = #assets{teacher_score = OldVal}},
       #role{assets = #assets{teacher_score = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90020,
       Role = #role{assets = #assets{tournament = OldVal}},
       #role{assets = #assets{tournament = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90024,
       Role = #role{assets = #assets{handbook_point = OldVal}},
       #role{assets = #assets{handbook_point = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90026,
       Role = #role{assets = #assets{star_gold = OldVal}},
       #role{assets = #assets{star_gold = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90025,
       Role = #role{assets = #assets{autumn_score = OldVal}},
       #role{assets = #assets{autumn_score = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90029,
       Role = #role{assets = #assets{new_year = OldVal}},
       #role{assets = #assets{new_year = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90022,
       Role = #role{assets = #assets{lottery_luck = OldVal}},
       #role{assets = #assets{lottery_luck = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90033,
       Role = #role{assets = #assets{firecracker = OldVal}},
       #role{assets = #assets{firecracker = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90035,
       Role = #role{assets = #assets{crystal = OldVal}},
       #role{assets = #assets{crystal = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90037,
       Role = #role{assets = #assets{ticket = OldVal}},
       #role{assets = #assets{ticket = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90038,
       Role = #role{assets = #assets{egg = OldVal}},
       #role{assets = #assets{egg = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90041,
       Role = #role{assets = #assets{father = OldVal}},
       #role{assets = #assets{father = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90040,
       Role = #role{assets = #assets{turn = OldVal}},
       #role{assets = #assets{turn = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90039,
       Role = #role{assets = #assets{exchange = OldVal}},
       #role{assets = #assets{exchange = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90042,
       Role = #role{assets = #assets{exchange = OldVal}},
       #role{assets = #assets{exchange = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90044,
       Role = #role{assets = #assets{dollar = OldVal}},
       #role{assets = #assets{dollar = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90045,
       Role = #role{assets = #assets{naughty = OldVal}},
       #role{assets = #assets{naughty = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90046,
       Role = #role{assets = #assets{concentric = OldVal}},
       #role{assets = #assets{concentric = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90047,
       Role = #role{assets = #assets{qixiIntegral = OldVal}},
       #role{assets = #assets{qixiIntegral = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90055,
       Role = #role{assets = #assets{skl_unique_exp = OldVal}},
       #role{assets = #assets{skl_unique_exp = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90061,
       Role = #role{assets = #assets{slot_machine = OldVal}},
       #role{assets = #assets{slot_machine = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets([Label | T], Role, NRole, Title, Msg) ->
    assets(Label, Role, NRole, Title, Msg),
    assets(T, Role, NRole, Title, Msg);
assets(_Label, _Role, _NRole, _Title, _Msg) -> ok.

do_assets(Label,
          #role{id = {Id, Platform, ZoneId}, name = Name,
                channel_reg = ChannelReg, account = Account, lev = Lev,
                classes = Classes},
          Title, Msg, OldVal, NewVal) ->
    Val = NewVal - OldVal,
    T = date:unixtime(),
    Txt = format([Label,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  OldVal,
                  NewVal,
                  Val,
                  {"~ts", Title},
                  {"~ts", Msg}]),
    write(Txt),
    ok.

store(Role = #role{id = {Id, Platform, ZoneId},
                   name = Name, account = Account,
                   channel_reg = ChannelReg, lev = Lev, classes = Classes},
      NRole, Gain, Title) ->
    Loss = {"~ts", loss_log(role_gain, Role, NRole)},
    T = date:unixtime(),
    ItemMsg = item_str(Gain),
    Txt = format([log_store,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  Loss,
                  {"~ts", ItemMsg},
                  {"~ts", Title}]),
    write(Txt),
    ok.

do_score(#role{id = {Id, Platform, ZoneId}, name = Name,
               account = Account, channel_reg = ChannelReg, lev = Lev,
               classes = Classes},
         Title, Msg, ValType, OldVal, NewVal) ->
    Val = NewVal - OldVal,
    T = date:unixtime(),
    Txt = format([score,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  ValType,
                  OldVal,
                  NewVal,
                  Val,
                  {"~ts", Title},
                  {"~ts", Msg}]),
    write(Txt),
    ok.

camp(#role{id = {Id, Platform, ZoneId}, name = Name,
           account = Account, channel_reg = ChannelReg, lev = Lev,
           classes = Classes},
     _Role, LossItems, GainItems,
     #campaign_handle{camp =
                          #camp_cfg{id = CampId, name = CampName}}) ->
    case {LossItems, GainItems} of
        {[], []} -> ok;
        _ ->
            T = date:unixtime(),
            Txt = format([camp,
                          T,
                          Id,
                          {"~ts", Platform},
                          ZoneId,
                          ChannelReg,
                          {"~ts", Name},
                          {"~ts", Account},
                          Lev,
                          Classes,
                          {"~ts", item_str(LossItems)},
                          {"~ts", item_str(GainItems)},
                          CampId,
                          {"~ts", CampName}]),
            write(Txt),
            ok
    end.

-spec camp_web(#role{}, #role{}, list(), list(),
               #camp_handle{}) -> ok.

camp_web(#role{id = {Id, Platform, ZoneId}, name = Name,
               account = Account, lev = Lev, classes = Classes,
               assets = #assets{gold = OldGold}},
         #role{assets = #assets{gold = NewGold}}, LossItems,
         GainItems,
         #camp_handle{menu = #camp_web_menu{title = Title},
                      camp = #camp_web{str1 = Str}}) ->
    case LossItems of
        [] when NewGold =:= OldGold -> ok;
        _ ->
            Gold = NewGold - OldGold,
            T = date:unixtime(),
            Txt = format([camp_web,
                          T,
                          Id,
                          Platform,
                          ZoneId,
                          Name,
                          Account,
                          Lev,
                          Classes,
                          OldGold,
                          NewGold,
                          Gold,
                          {"~ts", item_str(LossItems)},
                          {"~ts", item_str(GainItems)},
                          {"~ts", Title},
                          {"~ts", Str}]),
            write(Txt),
            ok
    end.

drop(Role, GL, Title, Msg) ->
    drop(drop,
         Role,
         [G || G = #gain{ext = {drop, _}} <- GL],
         Title,
         Msg).

drop(Label,
     #role{id = {Id, Platform, ZoneId}, name = Name,
           account = Account, channel_reg = ChannelReg, lev = Lev,
           classes = Classes, attr = #attr{fc = Fc},
           pos = #pos{map_base_id = MapBaseId}},
     GL = [_ | _], Title, Msg) ->
    case item_str(GL) of
        "" -> ok;
        ItemMsg ->
            T = date:unixtime(),
            Txt = format([Label,
                          T,
                          Id,
                          {"~ts", Platform},
                          ZoneId,
                          ChannelReg,
                          {"~ts", Name},
                          {"~ts", Account},
                          Lev,
                          Classes,
                          Fc,
                          MapBaseId,
                          {"~ts", info(map_name, MapBaseId)},
                          {"~ts", Title},
                          {"~ts", Msg},
                          {"~ts", ItemMsg}]),
            write(Txt),
            ok
    end;
drop(_Label, _Role, _GL, _Title, _Msg) -> ok.

mail(new,
     #mail{sess = {SessId, SessP, SessZ},
           to = {ToId, ToP, ToZ}, from = {FromId, FromP, FromZ},
           from_name = FromName, to_name = ToName, type = Type,
           title = Title, content = Content, source = Source,
           ts = Ts, item_list = Items}) ->
    T = date:unixtime(),
    ContentList = re:split(Content,
                           lang:get("\n"),
                           [{return, list}, unicode]),
    ContentList2 = [I ++ ["[换行]"] || I <- ContentList],
    NewContent = lists:append(ContentList2),
    Txt = format([mail_new,
                  T,
                  ToId,
                  {"~ts", ToP},
                  ToZ,
                  0,
                  {"~ts", "xxx"},
                  {"~ts", "xxx"},
                  0,
                  0,
                  SessId,
                  {"~ts", SessP},
                  SessZ,
                  ToId,
                  {"~ts", ToP},
                  ToZ,
                  {"~ts", ToName},
                  FromId,
                  {"~ts", FromP},
                  FromZ,
                  {"~ts", FromName},
                  Type,
                  {"~ts", Title},
                  {"~ts", NewContent},
                  {"~ts", item_str(Items)},
                  Source,
                  Ts,
                  0,
                  0]),
    write(Txt).

mail(mark,
     #role{name = ToName, channel_reg = ChannelReg},
     #mail{sess = {SessId, SessP, SessZ},
           to = {ToId, ToP, ToZ}, from = {FromId, FromP, FromZ},
           from_name = FromName, type = Type, title = Title,
           content = Content, source = Source, ts = Ts,
           item_list = Items}) ->
    T = date:unixtime(),
    ContentList = re:split(Content,
                           lang:get("\n"),
                           [{return, list}, unicode]),
    ContentList2 = [I ++ ["[换行]"] || I <- ContentList],
    NewContent = lists:append(ContentList2),
    Txt = format([mail_new,
                  T,
                  ToId,
                  {"~ts", ToP},
                  ToZ,
                  ChannelReg,
                  {"~ts", "xxx"},
                  {"~ts", "xxx"},
                  0,
                  0,
                  SessId,
                  {"~ts", SessP},
                  SessZ,
                  ToId,
                  {"~ts", ToP},
                  ToZ,
                  {"~ts", ToName},
                  FromId,
                  {"~ts", FromP},
                  FromZ,
                  {"~ts", FromName},
                  Type,
                  {"~ts", Title},
                  {"~ts", NewContent},
                  {"~ts", item_str(Items)},
                  Source,
                  Ts,
                  T,
                  0]),
    write(Txt);
mail(guild_mail,
     #role{name = ToName, channel_reg = ChannelReg},
     #mail{sess = {SessId, SessP, SessZ}, to = undefined,
           from = {FromId, FromP, FromZ}, from_name = FromName,
           type = Type, title = Title, content = Content,
           source = Source, ts = Ts, item_list = Items}) ->
    T = date:unixtime(),
    ContentList = re:split(Content,
                           lang:get("\n"),
                           [{return, list}, unicode]),
    ContentList2 = [I ++ ["[换行]"] || I <- ContentList],
    NewContent = lists:append(ContentList2),
    Txt = format([mail_new,
                  T,
                  0,
                  {"~ts", "xxx"},
                  0,
                  ChannelReg,
                  {"~ts", "xxx"},
                  {"~ts", "xxx"},
                  0,
                  0,
                  SessId,
                  {"~ts", SessP},
                  SessZ,
                  0,
                  {"~ts", "xxx"},
                  0,
                  {"~ts", ToName},
                  FromId,
                  {"~ts", FromP},
                  FromZ,
                  {"~ts", FromName},
                  Type,
                  {"~ts", Title},
                  {"~ts", NewContent},
                  {"~ts", item_str(Items)},
                  Source,
                  Ts,
                  T,
                  0]),
    write(Txt);
mail(recv_rewards,
     #role{name = ToName, channel_reg = ChannelReg},
     #mail{sess = {SessId, SessP, SessZ},
           to = {ToId, ToP, ToZ}, from = {FromId, FromP, FromZ},
           from_name = FromName, type = Type, title = Title,
           content = Content, source = Source, ts = Ts,
           item_list = Items, read_ts = ReadTs}) ->
    T = date:unixtime(),
    ContentList = re:split(Content,
                           "\n",
                           [{return, list}, unicode]),
    ContentList2 = [I ++ ["[换行]"] || I <- ContentList],
    NewContent = lists:append(ContentList2),
    Txt = format([mail_new,
                  T,
                  ToId,
                  {"~ts", ToP},
                  ToZ,
                  ChannelReg,
                  {"~ts", "xxx"},
                  {"~ts", "xxx"},
                  0,
                  0,
                  SessId,
                  {"~ts", SessP},
                  SessZ,
                  ToId,
                  {"~ts", ToP},
                  ToZ,
                  {"~ts", ToName},
                  FromId,
                  {"~ts", FromP},
                  FromZ,
                  {"~ts", FromName},
                  Type,
                  {"~ts", Title},
                  {"~ts", NewContent},
                  {"~ts", item_str(Items)},
                  Source,
                  Ts,
                  ReadTs,
                  1]),
    write(Txt).

item(Role, Title) ->
    Items = [{BaseId, Num}
             || {shop_item, BaseId, Num, _Price, _BuyType, _Tab}
                    <- get(shop_auto_buy_items)],
    GainItems = get(role_gain_items) ++ Items,
    LossItems = get(role_loss_items) ++
                    get(role_loss_auto_buy_items),
    item_gain(Role, GainItems, Title),
    item_loss(Role, LossItems, Title).

talisman(#role{id = {Id, Platform, ZoneId}, name = Name,
               account = Account, channel_reg = ChannelReg, lev = Lev,
               classes = Classes,
               m_talisman =
                   #m_talisman{fusion_lev = FuSionLev,
                               fusion_val = FusionVal}},
         Title) ->
    GainTalismans = get(role_gain_talisman),
    case GainTalismans of
        [_ | _] ->
            T = date:unixtime(),
            TalismanStr = talisman_str(GainTalismans),
            Txt = format([talisman,
                          T,
                          Id,
                          {"~ts", Platform},
                          ZoneId,
                          ChannelReg,
                          {"~ts", Name},
                          {"~ts", Account},
                          Lev,
                          Classes,
                          {"~ts", Title},
                          FuSionLev,
                          FusionVal,
                          {"~ts", TalismanStr},
                          null]),
            write(Txt);
        _ -> ok
    end.

talisman(#role{id = {Id, Platform, ZoneId}, name = Name,
               account = Account, channel_reg = ChannelReg, lev = Lev,
               classes = Classes,
               m_talisman =
                   #m_talisman{fusion_lev = FuSionLev,
                               fusion_val = FusionVal}},
         Title, Talisman) ->
    T = date:unixtime(),
    TalismanStr1 = talisman_str(Talisman),
    Txt = format([talisman,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  {"~ts", Title},
                  FuSionLev,
                  FusionVal,
                  {"~ts", TalismanStr1}]),
    write(Txt).

talisman(#role{id = {Id, Platform, ZoneId}, name = Name,
               account = Account, channel_reg = ChannelReg, lev = Lev,
               classes = Classes,
               m_talisman =
                   #m_talisman{fusion_lev = FuSionLev,
                               fusion_val = FusionVal}},
         Title, Talisman1, Talisman2) ->
    T = date:unixtime(),
    TalismanStr1 = talisman_str(Talisman1),
    TalismanStr2 = talisman_str(Talisman2),
    Txt = case Title of
              "重塑" ->
                  format([talisman,
                          T,
                          Id,
                          {"~ts", Platform},
                          ZoneId,
                          ChannelReg,
                          {"~ts", Name},
                          {"~ts", Account},
                          Lev,
                          Classes,
                          {"~ts", Title},
                          FuSionLev,
                          FusionVal,
                          {"~ts", TalismanStr2}]);
              _ ->
                  format([talisman,
                          T,
                          Id,
                          {"~ts", Platform},
                          ZoneId,
                          ChannelReg,
                          {"~ts", Name},
                          {"~ts", Account},
                          Lev,
                          Classes,
                          {"~ts", Title},
                          FuSionLev,
                          FusionVal,
                          {"~ts", TalismanStr1},
                          {"~ts", TalismanStr2}])
          end,
    write(Txt);
talisman(_, _, _, _) -> ok.

item_gain(#role{id = {Id, Platform, ZoneId},
                name = Name, account = Account,
                channel_reg = ChannelReg, lev = Lev, classes = Classes},
          Items = [_ | _], Title) ->
    T = date:unixtime(),
    ItemMsg = item_str(Items),
    Txt = format([item_gain_loss,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  1,
                  {"~ts", ItemMsg},
                  {"~ts", Title}]),
    write(Txt);
item_gain(_Role, _Items, _Title) -> ok.

item_loss(#role{id = {Id, Platform, ZoneId},
                name = Name, account = Account,
                channel_reg = ChannelReg, lev = Lev, classes = Classes},
          Items = [_ | _], Title) ->
    T = date:unixtime(),
    ItemMsg = item_str(Items),
    Txt = format([item_gain_loss,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  Lev,
                  Classes,
                  0,
                  {"~ts", ItemMsg},
                  {"~ts", Title}]),
    write(Txt),
    ok;
item_loss(_Role, _Items, _Title) -> ok.

exp(#role{lev = Lev, assets = #assets{exp = Exp}},
    #role{id = {Id, Platform, ZoneId}, name = Name,
          account = Account, channel_reg = ChannelReg,
          classes = Classes, lev = NewLev,
          assets = #assets{exp = NewExp}},
    Title, Msg)
    when NewLev >= 40 andalso
             (NewLev > Lev orelse NewExp - Exp > 10000) ->
    T = date:unixtime(),
    AddExp = calc_get_exp(Lev, NewLev, Exp, NewExp, 0),
    Txt = format([exp,
                  T,
                  Id,
                  {"~ts", Platform},
                  ZoneId,
                  ChannelReg,
                  {"~ts", Name},
                  {"~ts", Account},
                  NewLev,
                  Classes,
                  AddExp,
                  {"~ts", Title},
                  {"~ts", Msg}]),
    write(Txt),
    ok;
exp(_Role, _NewRole, _Title, _Msg) -> ok.

calc_get_exp(Lev, Lev, Exp, NewExp, AddExp) ->
    NewExp - Exp + AddExp;
calc_get_exp(Lev, NewLev, Exp, NewExp, AddExp)
    when NewLev > Lev ->
    calc_get_exp(Lev,
                 NewLev - 1,
                 Exp,
                 levup_data:get(NewLev - 1),
                 AddExp + NewExp);
calc_get_exp(_Lev, _NewLev, _Exp, _NewExp, AddExp) ->
    AddExp.

write(Msg) ->
    case get(log_transaction) of
        undefined -> gen_server:cast(log_old, {write, Msg});
        [] -> gen_server:cast(log_old, {write, Msg});
        [H] -> put(log_transaction, [[Msg | H]]);
        [H | T] -> put(log_transaction, [[Msg | H] | T])
    end.

trans_begin() ->
    case get(is_role_process) of
        true ->
            put(log_transaction, [[] | get(log_transaction)]);
        _ ->
            logger:error("不能在非角色进程内使用日志缓冲区", [], log_old, 860),
            ignore
    end,
    ok.

trans_flush() ->
    case get(log_transaction) of
        [] ->
            logger:error("写入日志数据时发生异常:缓冲区为空: ~w",
                         [util:get_stacktrace()],
                         log_old,
                         868);
        [[]] -> put(log_transaction, []);
        [H] ->
            put(log_transaction, []),
            [write(Msg) || Msg <- H];
        [H, H1 | T] ->
            put(log_transaction,
                [lists:concat([lists:reverse(H), H1]) | T]);
        [H | T] ->
            put(log_transaction,
                [lists:concat([lists:reverse(H), T])])
    end,
    ok.

trans_clean() ->
    case get(log_transaction) of
        [] ->
            logger:error("日志事务数据时发生异常:缓冲区为空", [], log_old, 884);
        [_H] -> put(log_transaction, []);
        [_H | T] -> put(log_transaction, T)
    end,
    ok.

do_record(Label, Rec, Flag = true)
    when not is_list(Rec) ->
    do_record(Label, [Rec], Flag);
do_record(pet, Pets, true) ->
    [Pet#pet{attr = undefined, pet_attr = undefined}
     || Pet <- Pets];
do_record(_, _, _Flag) -> "".

child_log(Childs) when is_list(Childs) ->
    string:join([util:to_list(child_log(Child))
                 || Child <- Childs],
                "");
child_log(#child{id = {Id, P, Z}, name = Name,
                 base_id = BaseId, sex = Sex, classes = Classes,
                 embryo = Embryo, pregnant_time = PregnantTime,
                 birth_time = BirthTime, stage = 3,
                 ext_growth = ExtGrowth, growth_type = GrowthType,
                 skills = Skills, talent_skills = TalentSkills,
                 add_point = AddPoint, grade_attr = GradeAttr,
                 grade = Grade, stones = Stones, use_growth = UseGrowth,
                 talent = Talent,
                 child_attr =
                     #child_attr{max_hp_apt_used = HpUsed,
                                 max_phy_apt_used = PhyUsed,
                                 max_pdef_apt_used = PdefUsed,
                                 max_magic_apt_used = MagicUsed,
                                 max_aspd_apt_used = AspdUsed,
                                 hp_aptitude = HpApt, phy_aptitude = PhyApt,
                                 pdef_aptitude = PdefApt,
                                 magic_aptitude = MagicApt,
                                 aspd_aptitude = AspdApt,
                                 max_hp_aptitude = MaxHpApt,
                                 max_phy_aptitude = MaxPhyApt,
                                 max_pdef_aptitude = MaxPdefApt,
                                 max_magic_aptitude = MaxMagicApt,
                                 max_aspd_aptitude = MaxAspdApt}}) ->
    SkillStr = string:join([io_lib:format("[技能:~ts,~w,~w]",
                                          [child_skill:skill_name(SId),
                                           SId,
                                           Source])
                            || #child_skill{id = SId, source = Source}
                                   <- Skills],
                           ""),
    SkillStr2 =
        string:join([io_lib:format("[天赋技能:~ts,~w,~w,~w]",
                                   [child_talent:skill_name(SId),
                                    SId,
                                    Lev,
                                    Exp])
                     || #child_talent_skill{id = SId, lev = Lev, exp = Exp}
                            <- TalentSkills],
                    ""),
    StoneStr = string:join([io_lib:format("[装备:~ts,~w,~ts]",
                                          [item:attr(name, ItemBaseId),
                                           ItemBaseId,
                                           attr_log(StoneAttr)])
                            || #child_stone{base_id = ItemBaseId,
                                            attr = StoneAttr}
                                   <- Stones],
                           ""),
    util:flist("[~ts][成年期:~w][~w:~ts:~w][性别:~w][职业:~w][孕育方式:~"
               "w][受孕时间:~w][出生时间:~w][天资:~w][额外成长:~w][成长类型:~w]"
               "[额外属性点:~w][阶数:~w][成长丹:~w][已用资质:~w,~w,~w,~w,~w"
               "][当前资质:~w,~w,~w,~w,~w][资质上限:~w,~w,~w,~w,~w][进"
               "阶属性:~ts][技能:~ts][天赋技能:~ts][装备:~ts]",
               [Name,
                BaseId,
                Id,
                P,
                Z,
                Sex,
                Classes,
                Embryo,
                PregnantTime,
                BirthTime,
                Talent,
                ExtGrowth,
                GrowthType,
                AddPoint,
                Grade,
                UseGrowth,
                HpUsed,
                PhyUsed,
                PdefUsed,
                MagicUsed,
                AspdUsed,
                HpApt,
                PhyApt,
                PdefApt,
                MagicApt,
                AspdApt,
                MaxHpApt,
                MaxPhyApt,
                MaxPdefApt,
                MaxMagicApt,
                MaxAspdApt,
                attr_log(GradeAttr),
                SkillStr,
                SkillStr2,
                StoneStr]);
child_log(#child{id = {Id, P, Z}, name = Name,
                 base_id = BaseId, sex = Sex, classes = Classes,
                 embryo = Embryo, pregnant_time = PregnantTime,
                 birth_time = BirthTime, stage = 2, maturity = Maturity,
                 study_easy = StudyEasy, study_hard = StudyHard,
                 day_easy = DayEasy, day_hard = DayHard,
                 study_easy_time = StudyEasyTime,
                 study_hard_time = StudyHardTime,
                 child_attr =
                     #child_attr{study_str = StudyStr, study_con = StudyCon,
                                 study_mag = StudyMag, study_agi = StudyAgi,
                                 study_end = StudyEnd}}) ->
    util:flist("[~ts][幼儿期:~w][~w:~ts:~w][性别:~w][职业:~w][孕育方式:~"
               "w][受孕时间:~w][出生时间:~w][发育值:~w][课程次数:~w,~w][今日次数"
               ":~w,~w][上次时间:~w,~w][课程:~w,~w,~w,~w,~w]",
               [Name,
                BaseId,
                Id,
                P,
                Z,
                Sex,
                Classes,
                Embryo,
                PregnantTime,
                BirthTime,
                Maturity,
                StudyEasy,
                StudyHard,
                DayEasy,
                DayHard,
                StudyEasyTime,
                StudyHardTime,
                StudyStr,
                StudyCon,
                StudyMag,
                StudyAgi,
                StudyEnd]);
child_log(#child{id = {Id, P, Z}, name = Name,
                 base_id = BaseId, sex = Sex, classes = Classes,
                 embryo = Embryo, pregnant_time = PregnantTime,
                 birth_time = BirthTime, stage = 1,
                 maturity = Maturity}) ->
    util:flist("[~ts][幼儿期~w][~w:~ts:~w][性别:~w][职业:~w][孕育方式:~w"
               "][受孕时间:~w][出生时间:~w][发育值:~w]",
               [Name,
                BaseId,
                Id,
                P,
                Z,
                Sex,
                Classes,
                Embryo,
                PregnantTime,
                BirthTime,
                Maturity]);
child_log(_) -> not_child_record.

pet_log(Pets) when is_list(Pets) ->
    string:join([util:to_list(pet_log(Pet)) || Pet <- Pets],
                "");
pet_log(#pet{id = Id, name = Name, base_id = BaseId,
             lev = Lev, exp = Exp, talent = Talent, growth = Growth,
             feed_point = FeedPoint, genre = Genre,
             pet_attr =
                 #pet_attr{max_hp_apt_used = HpUsed,
                           max_phy_apt_used = PhyUsed,
                           max_pdef_apt_used = PdefUsed,
                           max_magic_apt_used = MagicUsed,
                           max_aspd_apt_used = AspdUsed, hp_aptitude = HpApt,
                           phy_aptitude = PhyApt, pdef_aptitude = PdefApt,
                           magic_aptitude = MagicApt, aspd_aptitude = AspdApt,
                           max_hp_aptitude = MaxHpApt,
                           max_phy_aptitude = MaxPhyApt,
                           max_pdef_aptitude = MaxPdefApt,
                           max_magic_aptitude = MaxMagicApt,
                           max_aspd_aptitude = MaxAspdApt},
             skills = Skills, grade = Grade, grade_attr = GradeAttr,
             stones = Stones, pet_rune = Runes}) ->
    SkillStr = string:join([io_lib:format("[技能:~ts,~w,~w]",
                                          [pet_skill:skill_name(SId),
                                           SId,
                                           Source])
                            || #pet_skill{id = SId, source = Source} <- Skills],
                           ""),
    StoneStr = string:join([io_lib:format("[符石:~ts,~w]",
                                          [item:attr(name, ItemBaseId),
                                           ItemBaseId])
                            || #item{base_id = ItemBaseId} <- Stones],
                           ""),
    RuneStr1 =
        string:join([io_lib:format("[普通内丹:~ts,等级:~w,状态:~ts]",
                                   [pet_rune:rune_name(RuneId),
                                    RuneLev,
                                    convert_rune(RuneStatus, Resonance)])
                     || #pet_rune{rune_id = RuneId, rune_status = RuneStatus,
                                  rune_lev = RuneLev, is_resonance = Resonance,
                                  rune_type = 1}
                            <- Runes],
                    ""),
    RuneStr2 =
        string:join([io_lib:format("[高级内丹:~ts,等级:~w,状态:~ts,共鸣技能:~ts]",
                                   [pet_rune:rune_name(RuneId),
                                    RuneLev,
                                    convert_rune(RuneStatus),
                                    convert_resonance(Resonances)])
                     || #pet_rune{rune_id = RuneId, rune_status = RuneStatus,
                                  rune_lev = RuneLev, resonances = Resonances,
                                  rune_type = 2}
                            <- Runes],
                    ""),
    util:flist("[~ts:~w:~w][等级:~w][经验:~w][天资:~w][成长:~w][类型:~w"
               "][进阶次数:~w][进阶属性:~ts][使用兽王丹:~w][已使用资质丹:~w,~w,~"
               "w,~w,~w][当前资质:~w,~w,~w,~w,~w][资质上限:~w,~w,~w,~"
               "w,~w]~ts~ts~ts~ts",
               [Name,
                Id,
                BaseId,
                Lev,
                Exp,
                Talent,
                Growth,
                Genre,
                Grade,
                attr_log(GradeAttr),
                FeedPoint,
                HpUsed,
                PhyUsed,
                PdefUsed,
                MagicUsed,
                AspdUsed,
                HpApt,
                PhyApt,
                PdefApt,
                MagicApt,
                AspdApt,
                MaxHpApt,
                MaxPhyApt,
                MaxPdefApt,
                MaxMagicApt,
                MaxAspdApt,
                StoneStr,
                SkillStr,
                RuneStr1,
                RuneStr2]);
pet_log(_Pet) -> not_pet_record.

item_log(#item{base_id = BaseId, craft = Craft,
               enchant = Enchant, quantity = Quantity,
               reset_attr = BackUpAttr, quality = Quality, attr = Attr,
               growth_lev = GrowthLev, growth_val = GrowthVal,
               extra = Extra}) ->
    Name = item:attr(name, BaseId),
    util:flist("[~ts:~w:~w][品质:~ts][前缀:~ts][强化:~w][成长等级:~w][成"
               "长值:~w][属性:~ts][备份属性:~ts][额外属性:~w]",
               [Name,
                BaseId,
                Quantity,
                notice:quality_name(Quality),
                notice:craft_name(Craft),
                Enchant,
                GrowthLev,
                GrowthVal,
                attr_log(Attr),
                attr_log(BackUpAttr),
                Extra]);
item_log(_Item) -> not_item_record.

item_log2(#item{base_id = BaseId,
                reset_attr = BackUpAttr, quantity = Quantity,
                attr = Attr, extra = Extra}) ->
    Name = item:attr(name, BaseId),
    util:flist("{[~ts:~w:~w][属性:~ts][备份属性:~ts][额外属性:~w]}",
               [Name,
                BaseId,
                Quantity,
                attr_log(Attr),
                attr_log(BackUpAttr),
                Extra]);
item_log2(_Item) -> "not_item_record".

guard_eqm_log(#guard_eqm{base_id = BaseId,
                         eqm_attrs = EqmAttrs, reset_attrs = BackUpAttrs,
                         gem = Gem}) ->
    Name = item:attr(name, BaseId),
    util:flist("[~ts:~w][属性:~ts][备份属性:~ts][宝石:~ts]",
               [Name,
                BaseId,
                attr_log(EqmAttrs),
                attr_log(BackUpAttrs),
                guard_gem_log(Gem)]);
guard_eqm_log(_Item) -> not_item_record.

guard_astroid_log(#guard_astroid{growth = Growth,
                                 active = Active, skills = Skills,
                                 aroused = Aroused}) ->
    util:flist("[成长:~w][激活:~w][技能:~w][充能:~ts]",
               [Growth, Active, Skills, guard_astroid_star(Aroused)]);
guard_astroid_log(_Item) -> not_item_record.

guard_astroid_star(Stars) ->
    string:join([io_lib:format("[ID:~w,等级:~w,经验:~w]",
                               [Id, Lev, Exp])
                 || #guard_astroid_star{id = Id, lev = Lev, exp = Exp}
                        <- Stars],
                "").

eqm_ext_log({enchant, Ratio, IsProtect}) ->
    util:flist("[成功率:~w][保护符:~w]", [Ratio, IsProtect]);
eqm_ext_log({stone_skill, Attr}) -> attr_log(Attr);
eqm_ext_log(_) -> "".

guard_gem_log(Gem) ->
    string:join([io_lib:format("[ID:~w,类型:~w,等级:~w]",
                               [BaseId, Type, Lev])
                 || #guard_eqm_gem{base_id = BaseId, type = Type,
                                   lev = Lev}
                        <- Gem],
                "").

attr_log(Attr) ->
    string:join([io_lib:format("[类:~ts,标识:~w,值:~ts]",
                               [notice:to_attr_type(Type),
                                Flag,
                                notice:to_attr_msg(Name, Val)])
                 || #attr_base{type = Type, name = Name, flag = Flag,
                               val = Val}
                        <- Attr],
                "").

talisman_str("") -> "null";
talisman_str(Talismans) when is_list(Talismans) ->
    Fun = fun (Talisman, L1) ->
                  case talisman_str(Talisman) of
                      "" -> L1;
                      S -> [S | L1]
                  end
          end,
    L = lists:foldl(Fun, [], Talismans),
    string:join(L, ",");
talisman_str(#talisman{base_id = BaseId, type = Type,
                       quality = Quality, attr = Attr}) ->
    util:flist("[~w:~w:~w][属性:~ts]",
               [BaseId, Type, Quality, attr_log(Attr)]);
talisman_str(_Talisman) -> not_talisman_record.

-spec item_str([Item] | Item) -> string() when Item ::
                                                   #item{} |
                                                   {BaseId :: pos_integer(),
                                                    Num :: pos_integer()} |
                                                   {BaseId :: pos_integer(),
                                                    Bind :: pos_integer(),
                                                    Num :: pos_integer()}.

item_str(Items) when is_list(Items) ->
    Fun = fun (Item, L1) ->
                  case item_str(Item) of
                      "" -> L1;
                      S -> [S | L1]
                  end
          end,
    L = lists:foldl(Fun, [], Items),
    string:join(L, ",");
item_str(#gain{label = item_base_id,
               val = [{BaseId, _Bind, Num}], ext = {drop, UnitId}}) ->
    io_lib:format("{~w,~ts,~w,~w,~ts}",
                  [BaseId,
                   item:attr(name, BaseId),
                   Num,
                   UnitId,
                   info(unit_name, UnitId)]);
item_str(#gain{label = item_base_id, val = Val}) ->
    item_str(Val);
item_str(#gain{label = items, val = Val}) ->
    item_str(Val);
item_str(#loss{label = item_base_id, val = Val}) ->
    item_str(Val);
item_str(#loss{label = items, val = Val}) ->
    item_str(Val);
item_str(#loss{label = Label, val = Val}) ->
    item_str({label_to_baseid(Label), Val});
item_str(#gain{label = Label, val = Val,
               ext = {drop, UnitId}})
    when is_integer(Val) ->
    case label_to_baseid(Label) of
        0 -> "";
        BaseId ->
            io_lib:format("{~w,~ts,~w,~w,~ts}",
                          [BaseId,
                           item:attr(name, BaseId),
                           Val,
                           UnitId,
                           info(unit_name, UnitId)])
    end;
item_str(#gain{label = Label, val = Val}) ->
    item_str({label_to_baseid(Label), Val});
item_str(#item{base_id = BaseId, quantity = Num}) ->
    item_str({BaseId, Num});
item_str({BaseId, _Bind, Num}) ->
    item_str({BaseId, Num});
item_str({BaseId, Num}) when BaseId >= 90000 ->
    io_lib:format("{~w,~ts,~w}",
                  [BaseId, item:attr(name, BaseId), Num]);
item_str({BaseId, Num}) when BaseId > 0 ->
    io_lib:format("{~w,~ts,~w}",
                  [BaseId, item:attr(name, BaseId), Num]);
item_str(BaseId) when is_integer(BaseId) ->
    item_str({BaseId, 1});
item_str(Map = #{base_id := BaseId}) ->
    KVs = maps:to_list(Map),
    TupleList = item_str([quantity, step],
                         KVs,
                         BaseId,
                         [{"~ts", item:attr(name, BaseId)}, {"~w", BaseId}]),
    Fun = fun ({S, Val}, {[], []}) -> {[S], [Val]};
              ({S, Val}, {SAcc, VAcc}) ->
                  {[S, "," | SAcc], [Val | VAcc]};
              (_, Acc) -> Acc
          end,
    {StrAcc, ValAcc} = lists:foldl(Fun,
                                   {[], []},
                                   TupleList),
    NewStrAcc = lists:flatten(["{", StrAcc, "}"]),
    io_lib:format(NewStrAcc, ValAcc);
item_str(_) -> "".

item_str(_Lables, [], _BaseId, Str) -> Str;
item_str([], _KVs, _BaseId, Str) -> Str;
item_str([Key | Rest], KVs, BaseId, Str) ->
    case lists:keyfind(Key, 1, KVs) of
        {Key, Val} ->
            item_str(Rest, KVs, BaseId, [{"~w", Val} | Str]);
        _ -> item_str(Rest, KVs, BaseId, Str)
    end.

label_to_baseid(coin) -> 90000;
label_to_baseid(gold) -> 90002;
label_to_baseid(gold_bind) -> 90003;
label_to_baseid(energy) -> 90006;
label_to_baseid(alchemy) -> 90017;
label_to_baseid(exp) -> 90010;
label_to_baseid(pet_exp) -> 90005;
label_to_baseid(guild) -> 90011;
label_to_baseid(stars_score) -> 90012;
label_to_baseid(character) -> 90007;
label_to_baseid(love) -> 90018;
label_to_baseid(brother) -> 90036;
label_to_baseid(teacher_score) -> 90019;
label_to_baseid(tournament) -> 90020;
label_to_baseid(lottery_luck) -> 90022;
label_to_baseid(handbook_point) -> 90024;
label_to_baseid(star_gold) -> 90026;
label_to_baseid(autumn_score) -> 90025;
label_to_baseid(new_year) -> 90029;
label_to_baseid(firecracker) -> 90033;
label_to_baseid(egg) -> 90038;
label_to_baseid(turn) -> 90040;
label_to_baseid(lucky_ticket) -> 90042;
label_to_baseid(dollar) -> 90044;
label_to_baseid(naughty) -> 90045;
label_to_baseid(concentric) -> 90046;
label_to_baseid(qixiIntegral) -> 90047;
label_to_baseid(sunshine) -> 90048;
label_to_baseid(cut_price) -> 90049;
label_to_baseid(panda_score) -> 90051;
label_to_baseid(joyful_egg) -> 90052;
label_to_baseid(godswar) -> 90056;
label_to_baseid(_) -> 0.

info(unit_name, UnitId) ->
    case unit_data:get(UnitId) of
        #unit_data{name = Name} -> Name;
        _ -> ""
    end;
info(map_name, MapId) ->
    case map_data:get(MapId) of
        {ok, #map_data{name = Name}} -> Name;
        _ -> ""
    end;
info(_Label, _Data) -> "".

init([]) ->
    logger:info("[~w] 正在启动...", [log_old], log_old, 1100),
    process_flag(trap_exit, true),
    start_proc(10),
    start_db_proc(2),
    start_web_proc(3),
    log_file:start_num(),
    put(next_web_id, 1),
    BootTimes = env:get(sys_boot_times),
    case env:get(log_next_id) of
        undefined when BootTimes =:= 0 ->
            env:save(log_next_id, 1);
        undefined ->
            logger:error("警告!环境变量中不存在log_next_id值，可能系统出现过故障，请恢复log_next"
                         "_id的值再使用系统，否则可能会出现日志丢失!",
                         [],
                         log_old,
                         1112);
        _ -> ignore
    end,
    case env:get(log_next_id) of
        NextId when is_integer(NextId) ->
            self() ! loop,
            State = #state{next_id = NextId},
            logger:info("[~w] 启动完成", [log_old], log_old, 1119),
            {ok, State};
        _ -> {stop, normal}
    end.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({write, Content},
            State = #state{next_id = Id}) ->
    Pid = get(Id rem 10 + 1),
    Pid ! {write, Id, Content},
    NextId = Id + 1,
    {noreply, State#state{next_id = NextId}};
handle_cast({web, Content}, State = #state{}) ->
    Pid = get({web, get(next_web_id) rem 3 + 1}),
    Pid ! {web, Content},
    put(next_web_id, get(next_web_id) + 1),
    {noreply, State#state{}};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(loop, State = #state{next_id = NextId}) ->
    env:save(log_next_id, NextId),
    erlang:send_after(5000, self(), loop),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, #state{next_id = NextId}) ->
    logger:info("[~w] 正在关闭...", [log_old], log_old, 1154),
    env:save(log_next_id, NextId),
    logger:info("[~w] 关闭完成", [log_old], log_old, 1156),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

start_proc(0) -> ok;
start_proc(N) ->
    {ok, Pid} =
        log_proc_old:start_link(lists:concat(["log_", N + 10])),
    put(N, Pid),
    start_proc(N - 1).

start_db_proc(0) -> ok;
start_db_proc(N) ->
    {ok, Pid} = log_db:start_link(N + 10),
    put({db, N}, Pid),
    start_db_proc(N - 1).

start_web_proc(0) -> ok;
start_web_proc(N) ->
    {ok, Pid} = log_web:start_link(N + 10),
    put({web, N}, Pid),
    start_web_proc(N - 1).

convert_rune(Status, Resonance) ->
    case Status of
        0 -> lang:get("未学习");
        1 -> lang:get("未领悟");
        2 -> lang:get("已领悟");
        3 when Resonance == 1 -> lang:get("共鸣");
        3 -> lang:get("满级")
    end.

convert_rune(Status) ->
    case Status of
        0 -> lang:get("未学习");
        1 -> lang:get("未领悟");
        2 -> lang:get("已领悟");
        3 -> lang:get("满级")
    end.

convert_resonance(Resonances) ->
    NameL = [pet_rune:rune_name(Id)
             || #pet_resonance{resonance_id = Id} <- Resonances],
    string:join(NameL, ",").

