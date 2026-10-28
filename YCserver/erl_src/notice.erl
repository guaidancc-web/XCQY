-file("src/mod/notice/notice.erl", 1).

-module(notice).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/notice/notice.erl", 11).

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

-file("src/mod/notice/notice.erl", 12).

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

-file("src/mod/notice/notice.erl", 13).

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

-file("src/mod/notice/notice.erl", 14).

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

-file("src/mod/notice/notice.erl", 15).

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

-file("src/mod/notice/notice.erl", 16).

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

-file("src/mod/notice/notice.erl", 17).

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

-file("src/mod/notice/notice.erl", 18).

-file("inc/protocol.hrl", 1).

-record(module,
        {code :: undefined | pos_integer(),
         type :: undefined | game_server | monitor | tester,
         need_auth = true :: boolean(),
         caller = connector :: connector | object,
         module :: undefined | atom(),
         desc = "" :: string()}).

-record(rpc,
        {code = 0 :: non_neg_integer(),
         disable = false :: boolean(),
         autolog = false :: boolean(),
         autozip = false :: boolean(),
         condition = [] :: [tuple()],
         log_title :: undefined | string(),
         req_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         req = [] :: {atom(), [tuple()]} | [tuple()],
         reply_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         reply = [] :: {atom(), [tuple()]} | [tuple()],
         parser :: undefined | atom(),
         mod :: undefined | atom(),
         can_cache = true :: boolean()}).

-file("src/mod/notice/notice.erl", 19).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/notice/notice.erl", 20).

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

-file("src/mod/notice/notice.erl", 21).

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

-file("src/mod/notice/notice.erl", 22).

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

-file("src/mod/notice/notice.erl", 23).

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

-file("src/mod/notice/notice.erl", 24).

-export([format/2,
         gl/2,
         gl/3,
         gl/4,
         make_item/1,
         make_item_base/1,
         make_item_base/2,
         quality_name/1,
         quality_color/1,
         color_name/1,
         craft_name/1,
         growth_name/1,
         send/3,
         send/4,
         return/1,
         to_color/1,
         cast/3,
         cast/4,
         cast/5,
         gain_item/2,
         gain_item/3,
         attr/2,
         attr_all/4,
         item_color/1,
         to_attr_msg/2,
         to_attr_type/1,
         effect/2,
         effect/6,
         show/2,
         show/3,
         show/4,
         pop/3,
         npc_talk/3,
         replace_role/2,
         replace_msg/2,
         replace_msg2/2,
         send_campaign_msg/2]).

-compile({inline,
          [{to_color, 1}, {quality_color, 1}, {cast_msg, 4}]}).

-spec to_color(Color :: integer() |
                        string()) -> string().

to_color(0) -> "#FFFFFF";
to_color(1) -> "#13FC60";
to_color(2) -> "#23F0F7";
to_color(3) -> "#AE22DA";
to_color(4) -> "#FFA500";
to_color(5) -> "#F5F70E";
to_color(6) -> "#FE2A00";
to_color(7) -> "#808080";
to_color(20) -> "#FE2A00";
to_color(Color = [$# | _]) -> Color;
to_color(_Type) -> "#000000".

item_color(3) -> "#AE22DA";
item_color(4) -> "#FFA500";
item_color(Q) -> to_color(Q).

-spec quality_name(0..4) -> bitstring().

quality_name(1) -> lang:get("绿");
quality_name(2) -> lang:get("蓝");
quality_name(3) -> lang:get("紫");
quality_name(4) -> lang:get("橙");
quality_name(_) -> lang:get("白").

-spec color_name(0..5) -> bitstring().

color_name(1) -> lang:get("绿");
color_name(2) -> lang:get("蓝");
color_name(3) -> lang:get("紫");
color_name(4) -> lang:get("橙");
color_name(6) -> lang:get("红");
color_name(_) -> lang:get("白").

growth_name(2) -> lang:get("蓝");
growth_name(3) -> lang:get("紫");
growth_name(4) -> lang:get("橙");
growth_name(5) -> lang:get("红");
growth_name(_) -> lang:get("白").

-spec quality_color(0..4) -> integer().

quality_color(1) -> 1;
quality_color(2) -> 2;
quality_color(3) -> 3;
quality_color(4) -> 4;
quality_color(_) -> 0.

craft_name(1) -> lang:get("精良");
craft_name(2) -> lang:get("优秀");
craft_name(3) -> lang:get("完美");
craft_name(4) -> lang:get("逆天");
craft_name(_) -> lang:get("普通").

to_attr_msg(1, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("生命"), Val]);
to_attr_msg(2, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("魔法"), Val]);
to_attr_msg(3, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("攻速"), Val]);
to_attr_msg(4, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("物攻"), Val]);
to_attr_msg(5, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("魔攻"), Val]);
to_attr_msg(6, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("物防"), Val]);
to_attr_msg(7, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("魔防"), Val]);
to_attr_msg(8, Val) ->
    util:flist(lang:get("~ts+~w%"),
               [lang:get("暴击"), Val / 10]);
to_attr_msg(35, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("物理暴击"), Val]);
to_attr_msg(36, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("魔法暴击"), Val]);
to_attr_msg(9, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("坚韧"), Val]);
to_attr_msg(37, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("物理坚韧"), Val]);
to_attr_msg(38, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("魔法坚韧"), Val]);
to_attr_msg(10, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("命中"), Val]);
to_attr_msg(39, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("物理命中"), Val]);
to_attr_msg(40, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("魔法命中"), Val]);
to_attr_msg(30, Val) ->
    util:flist(lang:get("~ts+~w%"),
               [lang:get("物理减免"), Val / 10]);
to_attr_msg(31, Val) ->
    util:flist(lang:get("~ts+~w%"),
               [lang:get("魔法减免"), Val / 10]);
to_attr_msg(11, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("闪避"), Val]);
to_attr_msg(41, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("物理闪避"), Val]);
to_attr_msg(42, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("魔法闪避"), Val]);
to_attr_msg(12, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("移速"), Val]);
to_attr_msg(21, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("神圣伤害"), Val]);
to_attr_msg(22, Val) ->
    util:flist(lang:get("~ts+~w%"),
               [lang:get("暴击伤害"), Val / 10]);
to_attr_msg(25, Val) ->
    util:flist(lang:get("~ts+~w%"),
               [lang:get("控制加强"), Val / 10]);
to_attr_msg(26, Val) ->
    util:flist(lang:get("~ts+~w%"),
               [lang:get("控制抵抗"), Val / 10]);
to_attr_msg(43, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("治疗加强"), Val]);
to_attr_msg(33, Val) ->
    util:flist(lang:get("~ts+~w%"),
               [lang:get("治疗效果"), Val / 10]);
to_attr_msg(51, Val) ->
    util:flist(lang:get("~ts+~w%"),
               [lang:get("生命"), Val / 10]);
to_attr_msg(52, Val) ->
    util:flist(lang:get("~ts+~w"),
               [lang:get("魔法"), round(Val / 10)]);
to_attr_msg(53, Val) ->
    util:flist(lang:get("~ts+~w"),
               [lang:get("攻速"), round(Val / 10)]);
to_attr_msg(54, Val) ->
    util:flist(lang:get("~ts+~w%"),
               [lang:get("物攻"), Val / 10]);
to_attr_msg(55, Val) ->
    util:flist(lang:get("~ts+~w%"),
               [lang:get("魔攻"), Val / 10]);
to_attr_msg(56, Val) ->
    util:flist(lang:get("~ts+~w"),
               [lang:get("物防"), round(Val / 10)]);
to_attr_msg(57, Val) ->
    util:flist(lang:get("~ts+~w"),
               [lang:get("魔防"), round(Val / 10)]);
to_attr_msg(58, Val) ->
    util:flist(lang:get("~ts+~w"),
               [lang:get("暴击"), round(Val / 10)]);
to_attr_msg(59, Val) ->
    util:flist(lang:get("~ts+~w"),
               [lang:get("坚韧"), round(Val / 10)]);
to_attr_msg(60, Val) ->
    util:flist(lang:get("~ts+~w"),
               [lang:get("命中"), round(Val / 10)]);
to_attr_msg(61, Val) ->
    util:flist(lang:get("~ts+~w"),
               [lang:get("闪避"), round(Val / 10)]);
to_attr_msg(62, Val) ->
    util:flist(lang:get("~ts+~w"),
               [lang:get("移动速度"), round(Val / 10)]);
to_attr_msg(101, Val) ->
    util:flist(lang:get("~ts+~w点"), [lang:get("力量"), Val]);
to_attr_msg(102, Val) ->
    util:flist(lang:get("~ts+~w点"), [lang:get("体质"), Val]);
to_attr_msg(103, Val) ->
    util:flist(lang:get("~ts+~w点"), [lang:get("智力"), Val]);
to_attr_msg(104, Val) ->
    util:flist(lang:get("~ts+~w点"), [lang:get("敏捷"), Val]);
to_attr_msg(105, Val) ->
    util:flist(lang:get("~ts+~w点"), [lang:get("耐力"), Val]);
to_attr_msg(100, Val) ->
    util:flist(lang:get("~ts[~w]"), [lang:get("技能"), Val]);
to_attr_msg(150, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("强化"), Val]);
to_attr_msg(151, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("宝石强化"), Val]);
to_attr_msg(110, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("孔1"), Val]);
to_attr_msg(111, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("孔2"), Val]);
to_attr_msg(112, Val) ->
    util:flist(lang:get("~ts+~w"), [lang:get("孔3"), Val]);
to_attr_msg(0, _) -> lang:get("无");
to_attr_msg(_Name, _Val) -> "".

to_attr_type(0) -> lang:get("普通");
to_attr_type(1) -> lang:get("强化");
to_attr_type(2) -> lang:get("附加");
to_attr_type(3) -> lang:get("宝石");
to_attr_type(4) -> lang:get("特效");
to_attr_type(5) -> lang:get("神器");
to_attr_type(6) -> lang:get("神器未保存");
to_attr_type(7) -> lang:get("法宝基础");
to_attr_type(9) -> lang:get("法宝特殊");
to_attr_type(10) -> lang:get("特技");
to_attr_type(_) -> lang:get("未知").

cast(Channel, Type, Msg) ->
    cast_msg(Channel, Type, Msg, []),
    ok.

cast(Channel, Type, F, A) ->
    Msg = format(F, A),
    cast_msg(Channel, Type, Msg, []),
    ok.

cast(Channel, Type, F, A, Limit) ->
    Msg = format(F, A),
    cast_msg(Channel, Type, Msg, Limit),
    ok.

cast_msg(all, Type, Msg, Limit) ->
    role_group:pack_send(world, 9902, {Type, Msg, Limit});
cast_msg({map, MapId}, Type, Msg, Limit) ->
    map:pack_send_to_all(MapId, 9902, {Type, Msg, Limit});
cast_msg(_Channel, _Type, _Msg, _Limit) ->
    logger:error("未知类型:~w", [_Channel], notice, 286),
    ok.

return(Msg) -> send(conn_pid, 1, Msg).

npc_talk(Role = #role{}, BaseId, Msg) ->
    role:link_send(Role, 9910, {BaseId, Msg}),
    ok;
npc_talk({conn_pid, ConnPid}, BaseId, Msg) ->
    sys_conn:pack_send(ConnPid, 9910, {BaseId, Msg}),
    ok;
npc_talk({pid, Pid}, BaseId, Msg) ->
    role:pack_send(Pid, 9910, {BaseId, Msg}),
    ok;
npc_talk(_, _, _) -> ok.

send(To, Style, {F, A}) ->
    send(To, Style, format(F, A), []);
send(To, Style, Msg) when is_list(Msg) ->
    send(To, Style, Msg, []).

send(_To, _Style, "", _Limit) -> ok;
send(Role = #role{}, Style, Msg, Limit) ->
    role:link_send(Role, 9902, {Style, Msg, Limit}),
    ok;
send(RoleId = {_, _, _}, Style, Msg, Limit) ->
    role:pack_send(RoleId, 9902, {Style, Msg, Limit}),
    ok;
send({conn_pid, ConnPid}, Style, Msg, Limit) ->
    sys_conn:pack_send(ConnPid, 9902, {Style, Msg, Limit}),
    ok;
send(conn_pid, Style, Msg, Limit) ->
    case get(conn_pid) of
        ConnPid when is_pid(ConnPid) ->
            sys_conn:pack_send(ConnPid, 9902, {Style, Msg, Limit}),
            ok;
        _ -> ok
    end;
send({pid, Pid}, Style, Msg, Limit) when is_pid(Pid) ->
    role:pack_send(Pid, 9902, {Style, Msg, Limit}),
    ok;
send([H | Rest], Style, Msg, Limit) ->
    send(H, Style, Msg, Limit),
    send(Rest, Style, Msg, Limit);
send(_, _, _, _) -> ok.

-spec gl([#gain{} | #loss{}], #role{}) -> ok.

gl(L, Role) -> gl(L, Role, "").

gl([], #role{}, _Title) -> ok;
gl(L, Role = #role{}, Title) ->
    MergeL = format:merge_gl(L),
    NewL = [[GL] || GL <- MergeL],
    NewList = lists:reverse(NewL),
    do_gl(NewList, Role, Title);
gl(L, Type, Role) -> gl(L, Type, Role, "").

gl(L, Type, Role, Title) ->
    MergeL = format:merge_gl(L),
    NewL = [[GL] || GL <- MergeL],
    NewList = lists:reverse(NewL),
    do_gl(NewList, Type, Role, Title).

do_gl([], _Role, _) -> ok;
do_gl([L | T], Role, Title) ->
    one_gl(L, Role, Title),
    do_gl(T, Role, Title).

do_gl([], _Type, _Role, _) -> ok;
do_gl([L | T], Type, Role, Title) ->
    one_gl(L, Type, Role, Title),
    do_gl(T, Type, Role, Title).

one_gl([], _Role, _Title) -> skip;
one_gl(L, Role, Title) ->
    case format:gain_text(L, Role) of
        "" -> skip;
        Msg when Title =:= "" -> send(Role, 3, Msg);
        Msg when is_list(Title) ->
            send(Role, 3, util:flist("~ts~ts", [Title, Msg]))
    end.

one_gl(L, Type, Role, Title) ->
    case format:gain_text(L, Role) of
        [] -> skip;
        Msg when Title =:= "" -> send(Role, Type, Msg);
        Msg ->
            send(Role, Type, util:flist("~ts~ts", [Title, Msg]))
    end.

attr([], _Role) -> ok;
attr([#attr_base{name = Name, val = Val} | T], Role)
    when Val > 0 ->
    case format:to_attr_msg(Name, Val) of
        "" -> attr(T, Role);
        Msg ->
            send(Role, 3, Msg),
            attr(T, Role)
    end;
attr([{Name, Val} | T], Role) when Val > 0 ->
    case format:to_attr_msg(Name, Val) of
        "" -> attr(T, Role);
        Msg ->
            send(Role, 3, Msg),
            attr(T, Role)
    end;
attr([_ | T], Role) -> attr(T, Role).

attr_all(_Role, _Head, _Tail, []) -> ok;
attr_all(Role, Head, Tail, Attr) ->
    attr_all(Role, Head, Tail, Attr, []).

attr_all(Role, Head, Tail, [], Body) ->
    Msg = util:flist("~ts~ts~ts",
                     [Head, string:join(Body, "，"), Tail]),
    send(Role, 3, Msg),
    ok;
attr_all(Role, Head, Tail,
         [#attr_base{name = Name, val = Val} | T], Body)
    when Val > 0 ->
    case format:to_attr_msg(Name, Val) of
        "" -> attr_all(Role, Head, Tail, T, Body);
        B -> attr_all(Role, Head, Tail, T, [B | Body])
    end;
attr_all(Role, Head, Tail, [{Name, Val} | T], Body)
    when Val > 0 ->
    case format:to_attr_msg(Name, Val) of
        "" -> attr_all(Role, Head, Tail, T, Body);
        B -> attr_all(Role, Head, Tail, T, [B | Body])
    end;
attr_all(Role, Head, Tail, [_ | T], Body) ->
    attr_all(Role, Head, Tail, T, Body).

pop(conn_pid, Type, Msg) ->
    case get(conn_pid) of
        ConnPid when is_pid(ConnPid) ->
            sys_conn:pack_send(ConnPid, 9903, {Type, Msg}),
            ok;
        _ -> ok
    end;
pop({map, MapId}, Type, Msg) ->
    map:pack_send_to_all(MapId, 9903, {Type, Msg}),
    ok;
pop({pid, Pid}, Type, Msg) when is_pid(Pid) ->
    role:pack_send(Pid, 9903, {Type, Msg}),
    ok;
pop({conn_pid, ConnPid}, Type, Msg)
    when is_pid(ConnPid) ->
    sys_conn:pack_send(ConnPid, 9903, {Type, Msg}),
    ok;
pop(Role = #role{}, Type, Msg) ->
    role:link_send(Role, 9903, {Type, Msg}),
    ok;
pop(_, _, _) -> ok.

-spec replace_role(bitstring(),
                   list() | bitstring()) -> bitstring().

replace_role(Msg, RoleInfo) ->
    replace_msg([{"#role#", RoleInfo}], Msg).

replace_msg([], Msg) -> Msg;
replace_msg([{ReStr, L = [_ | _]} | T], Msg) ->
    Str = notice:format("~ts", L),
    NewMsg = re:replace(Msg,
                        ReStr,
                        Str,
                        [{return, list}, unicode]),
    replace_msg(T, NewMsg);
replace_msg([{ReStr, Str} | T], Msg) ->
    NewMsg = re:replace(Msg,
                        ReStr,
                        Str,
                        [{return, list}, unicode]),
    replace_msg(T, NewMsg).

replace_msg2([], Msg) -> Msg;
replace_msg2([{ReStr, L = [_ | _]} | T], Msg) ->
    Str = util:flist("~ts", L),
    NewMsg = re:replace(Msg,
                        ReStr,
                        Str,
                        [{return, list}, unicode]),
    replace_msg2(T, NewMsg);
replace_msg2([{ReStr, Str} | T], Msg) ->
    NewMsg = re:replace(Msg,
                        ReStr,
                        Str,
                        [{return, list}, unicode]),
    replace_msg2(T, NewMsg).

format(Format, Args) ->
    util:flist(Format, do_format(Args, [])).

do_format([], Rtn) -> lists:reverse(Rtn);
do_format([Val | T], Rtn) when is_integer(Val) ->
    do_format(T, [Val | Rtn]);
do_format([{color_1, Color} | T], Rtn) ->
    R = io_lib:format("{color_1, ~ts}", [to_color(Color)]),
    do_format(T, [R | Rtn]);
do_format([{string_1, Str} | T], Rtn)
    when is_integer(Str) ->
    R = io_lib:format("~w", [Str]),
    do_format(T, [R | Rtn]);
do_format([{string_1, Str} | T], Rtn) ->
    R = io_lib:format("~ts", [Str]),
    do_format(T, [R | Rtn]);
do_format([{string_2, Color, Str} | T], Rtn) ->
    R = io_lib:format("{string_2, ~ts, ~ts}",
                      [to_color(Color), util:to_list(Str)]),
    do_format(T, [R | Rtn]);
do_format([{link_1, Link} | T], Rtn) ->
    R = io_lib:format("{link_1, ~ts}", [Link]),
    do_format(T, [R | Rtn]);
do_format([{link_2, Link, Str} | T], Rtn) ->
    R = io_lib:format("{link_2, ~ts, ~ts}", [Link, Str]),
    do_format(T, [R | Rtn]);
do_format([{panel_1, PanelId} | T], Rtn) ->
    R = io_lib:format("{panel_1, ~w}", [PanelId]),
    do_format(T, [R | Rtn]);
do_format([{panel_2, PanelId, Color, Str} | T], Rtn) ->
    R = io_lib:format("{panel_2, ~w, ~ts, ~ts}",
                      [PanelId, to_color(Color), Str]),
    do_format(T, [R | Rtn]);
do_format([{panel_3, PanelId, Color, Str} | T], Rtn) ->
    R = io_lib:format("{panel_3, ~w, ~ts, ~ts}",
                      [PanelId, to_color(Color), Str]),
    do_format(T, [R | Rtn]);
do_format([{role_1,
            #role{id = {Rid, Platform, ZoneId}, name = Name}}
           | T],
          Rtn) ->
    R = io_lib:format("{role_1, ~w, ~ts, ~w, ~ts}",
                      [Rid, Platform, ZoneId, Name]),
    do_format(T, [R | Rtn]);
do_format([{role_1, {Rid, Platform, ZoneId}, Name} | T],
          Rtn) ->
    R = io_lib:format("{role_1, ~w, ~ts, ~w, ~ts}",
                      [Rid, Platform, ZoneId, Name]),
    do_format(T, [R | Rtn]);
do_format([{role_1, {{Rid, Platform, ZoneId}, Name}}
           | T],
          Rtn) ->
    R = io_lib:format("{role_1, ~w, ~ts, ~w, ~ts}",
                      [Rid, Platform, ZoneId, Name]),
    do_format(T, [R | Rtn]);
do_format([{role_1, RoleList} | T], Rtn) ->
    NewT = [do_format([{role_1, R}], []) || R <- RoleList],
    Str = string:join(NewT, ","),
    do_format(T, [Str | Rtn]);
do_format([{role_2, RoleName} | T], Rtn)
    when is_list(RoleName) ->
    R = io_lib:format("{role_2, ~ts}", [RoleName]),
    do_format(T, [R | Rtn]);
do_format([{role_2, #role{name = RoleName}} | T], Rtn)
    when is_list(RoleName) ->
    R = io_lib:format("{role_2, ~ts}", [RoleName]),
    do_format(T, [R | Rtn]);
do_format([{role_3,
            {Rid, Platform, ZoneId},
            Name,
            RoleLev}
           | T],
          Rtn) ->
    R = io_lib:format("{role_3, ~w, ~ts, ~w, ~ts, ~w}",
                      [Rid, Platform, ZoneId, Name, RoleLev]),
    do_format(T, [R | Rtn]);
do_format([{face_1, FaceId} | T], Rtn) ->
    R = io_lib:format("{face_1, ~w}", [FaceId]),
    do_format(T, [R | Rtn]);
do_format([{quest_1, QuestId} | T], Rtn) ->
    R = io_lib:format("{quest_1, ~w}", [QuestId]),
    do_format(T, [R | Rtn]);
do_format([{envelop_1, {Rid, Platform, ZoneId}, Name}
           | T],
          Rtn) ->
    R = io_lib:format("{envelop_1, ~w, ~ts, ~w, ~ts}",
                      [Rid, Platform, ZoneId, Name]),
    do_format(T, [R | Rtn]);
do_format([{pet_1, Pet = #pet{}} | T], Rtn) ->
    case make_pet(Pet) of
        false -> do_format(T, Rtn);
        {ok, R} -> do_format(T, [R | Rtn])
    end;
do_format([{pet_2, PetBaseId} | T], Rtn) ->
    R = io_lib:format("{pet_2, ~w}", [PetBaseId]),
    do_format(T, [R | Rtn]);
do_format([{unit_1, UnitId} | T], Rtn)
    when is_integer(UnitId) ->
    R = io_lib:format("{unit_1, ~w, ~ts}",
                      [UnitId, unit:name(UnitId)]),
    do_format(T, [R | Rtn]);
do_format([{unit_1, UnitId, UnitName} | T], Rtn)
    when is_integer(UnitId) ->
    R = io_lib:format("{unit_1, ~w, ~ts}",
                      [UnitId, UnitName]),
    do_format(T, [R | Rtn]);
do_format([{unit_2,
            {BattleId, UnitId},
            UnitBaseId,
            UnitName}
           | T],
          Rtn) ->
    R = io_lib:format("{unit_2, ~w, ~w, ~w, ~ts}",
                      [BattleId, UnitId, UnitBaseId, UnitName]),
    do_format(T, [R | Rtn]);
do_format([{unit_3, UnitId} | T], Rtn)
    when is_integer(UnitId) ->
    R = io_lib:format("{unit_3, ~ts}", [unit:name(UnitId)]),
    do_format(T, [R | Rtn]);
do_format([{unit_4, {BattleId, UnitId}, UnitBaseId}
           | T],
          Rtn) ->
    R = io_lib:format("{unit_4, ~w, ~w, ~w}",
                      [BattleId, UnitId, UnitBaseId]),
    do_format(T, [R | Rtn]);
do_format([{guard_1, Guard = #guard{}, Lev} | T],
          Rtn) ->
    case make_guard(Guard, Lev) of
        false -> do_format(T, Rtn);
        {ok, R} -> do_format(T, [R | Rtn])
    end;
do_format([{guard_2, GuardBaseId} | T], Rtn) ->
    R = io_lib:format("{guard_2, ~w}", [GuardBaseId]),
    do_format(T, [R | Rtn]);
do_format([{map_1, MapId} | T], Rtn) ->
    MapName = case map_data:get(MapId) of
                  {ok, #map_data{name = TName}} -> TName;
                  _ -> ""
              end,
    R = io_lib:format("{map_1, ~w, ~ts}", [MapId, MapName]),
    do_format(T, [R | Rtn]);
do_format([{map_2, MapId, X, Y} | T], Rtn) ->
    MapName = case map_data:get(MapId) of
                  {ok, #map_data{name = TName}} -> TName;
                  _ -> ""
              end,
    R = io_lib:format("{map_2, ~w, ~ts, ~w, ~w}",
                      [MapId, MapName, X, Y]),
    do_format(T, [R | Rtn]);
do_format([{assets_1, AssetsId, Val} | T], Rtn) ->
    R = io_lib:format("{assets_1, ~w, ~w}",
                      [AssetsId, Val]),
    do_format(T, [R | Rtn]);
do_format([{assets_2, AssetsId} | T], Rtn) ->
    R = io_lib:format("{assets_2, ~w}", [AssetsId]),
    do_format(T, [R | Rtn]);
do_format([{ship_1,
            {Rid, Platform, ZoneId},
            RoleName,
            CellId}
           | T],
          Rtn) ->
    R = io_lib:format("{ship_1, ~w, ~ts, ~w, ~ts, ~w}",
                      [Rid, Platform, ZoneId, RoleName, CellId]),
    do_format(T, [R | Rtn]);
do_format([{honor_1, HonorId} | T], Rtn) ->
    R = io_lib:format("{honor_1, ~w}", [HonorId]),
    do_format(T, [R | Rtn]);
do_format([{item_1, Item = #item{}} | T], Rtn) ->
    case make_item(Item) of
        false -> do_format(T, Rtn);
        {ok, R} -> do_format(T, [R | Rtn])
    end;
do_format([{item_1, Items = [#item{} | _]} | T], Rtn) ->
    case make_item(Items) of
        false -> do_format(T, Rtn);
        {ok, R} -> do_format(T, [R | Rtn])
    end;
do_format([{item_2, Items = [_ | _]} | T], Rtn) ->
    case make_item_base(Items) of
        false -> do_format(T, Rtn);
        {ok, R} -> do_format(T, [R | Rtn])
    end;
do_format([{item_2, BaseId} | T], Rtn) ->
    case make_item_base([{BaseId, 1, 1}]) of
        false -> do_format(T, Rtn);
        {ok, R} -> do_format(T, [R | Rtn])
    end;
do_format([{item_2, BaseId, Num} | T], Rtn) ->
    case make_item_base([{BaseId, 1, Num}]) of
        false -> do_format(T, Rtn);
        {ok, R} -> do_format(T, [R | Rtn])
    end;
do_format([{item_2, BaseId, Bind, Num} | T], Rtn) ->
    case make_item_base([{BaseId, Bind, Num}]) of
        false -> do_format(T, Rtn);
        {ok, R} -> do_format(T, [R | Rtn])
    end;
do_format([{team_1, Id, Plat, ZoneId, Title} | T],
          Rtn) ->
    R = io_lib:format("{team_1, ~w, ~ts, ~w, ~ts}",
                      [Id, Plat, ZoneId, Title]),
    do_format(T, [R | Rtn]);
do_format([{match_1, {Id, Plat, ZoneId}, Name, MatchId}
           | T],
          Rtn) ->
    R = io_lib:format("{match_1, ~ts, ~w, ~ts, ~w, ~w}",
                      [Name, Id, Plat, ZoneId, MatchId]),
    do_format(T, [R | Rtn]);
do_format([{guildpray_1, PanelId, Color, Str} | T],
          Rtn) ->
    R = io_lib:format("{guildpray_1, ~w, ~w, ~ts}",
                      [PanelId, Color, Str]),
    do_format(T, [R | Rtn]);
do_format([{action_1, ActionName, Color, Val} | T],
          Rtn) ->
    R = io_lib:format("{action_1, ~ts, ~ts, ~w}",
                      [ActionName, to_color(Color), Val]),
    do_format(T, [R | Rtn]);
do_format([H | T], Rtn) ->
    logger:error("对消息内容进行格式化处理时，发现无法识别的格式: ~w From:~w",
                 [H, util:get_stacktrace()],
                 notice,
                 690),
    do_format(T, ["  " | Rtn]).

gain_item(Role, L) -> gain_item(Role, 1, L).

gain_item(_, _Package, _L) -> skip.

show(Label, Type) -> show(Label, Type, 0, "").

show(Label, Type, Val) -> show(Label, Type, Val, "").

show(all, Type, Val, Str) ->
    role_group:pack_send(world, 9911, {Type, Val, Str});
show({pid, Pid}, Type, Val, Str) ->
    role:pack_send(Pid, 9911, {Type, Val, Str});
show(#role{link = #link{conn_pid = ConnPid}}, Type, Val,
     Str) ->
    sys_conn:pack_send(ConnPid, 9911, {Type, Val, Str});
show(Label, Type, Val, Str) ->
    logger:error("无法识别的展示[~w][~w][~w][~w]",
                 [Label, Type, Val, Str],
                 notice,
                 722),
    ok.

-spec effect(all |
             #role{} |
             pid() |
             {role, pid()} |
             {map, pos_integer()} |
             [term()],
             Id :: non_neg_integer()) -> ok.

effect(Label = all, Id) ->
    effect(Label, Id, 0, 0, 0, 0);
effect(Label = {map, _MapId}, Id) ->
    effect(Label, Id, 0, 0, 0, 0);
effect(Label = ConnPid, Id) when is_pid(ConnPid) ->
    effect(Label, Id, 0, 0, 0, 0);
effect(Label = {role_pid, Pid}, Id) when is_pid(Pid) ->
    effect(Label, Id, 0, 0, 0, 0);
effect(Role = #role{}, Id) ->
    effect(Role, Id, 0, 0, 0, 0);
effect([I | T], Id) ->
    effect(I, Id),
    effect(T, Id);
effect(_Group, _Id) ->
    logger:error("播放特殊时错误：~w ~w",
                 [_Group, _Id],
                 notice,
                 742),
    ok.

effect(all, Id, Type, MapId, X, Y) ->
    role_group:pack_send(world,
                         9907,
                         {Id, Type, MapId, X, Y});
effect({map, MapId}, Id, Type, MapBaseId, X, Y) ->
    map:pack_send_to_all(MapId,
                         9907,
                         {Id, Type, MapBaseId, X, Y});
effect({role_pid, Pid}, Id, Type, MapId, X, Y)
    when is_pid(Pid) ->
    role:pack_send(Pid, 9907, {Id, Type, MapId, X, Y});
effect(#role{link = #link{conn_pid = ConnPid}}, Id,
       Type, MapId, X, Y) ->
    sys_conn:pack_send(ConnPid,
                       9907,
                       {Id, Type, MapId, X, Y});
effect([I | T], Id, Type, MapId, X, Y) ->
    effect(I, Id, Type, MapId, X, Y),
    effect(T, Id, Type, MapId, X, Y);
effect(_Group, _Id, _Type, _MapId, _X, _Y) ->
    logger:error("播放特殊时错误：~w ~w",
                 [_Group, {_Id, _Type, _MapId, _X, _Y}],
                 notice,
                 757),
    ok.

get_server_info() ->
    case env:get(platform) of
        undefined -> false;
        Platform ->
            case env:get(zone_id) of
                undefined -> false;
                ZoneId -> {Platform, ZoneId}
            end
    end.

make_item(Item = #item{}) -> make_item([Item]);
make_item([]) -> false;
make_item(Items) when is_list(Items) ->
    case get_server_info() of
        false ->
            logger:error("获取不到服务器信息，无法添加物品缓存", [], notice, 780),
            false;
        {Platform, ZoneId} ->
            make_item(Platform, ZoneId, Items, [])
    end.

make_item(_Platform, _ZoneId, [], []) -> false;
make_item(_Platform, _ZoneId, [], Rs) ->
    {ok, string:join(lists:reverse(Rs), ", ")};
make_item(Platform, ZoneId,
          [Item = #item{base_id = BaseId, quantity = Quantity}
           | T],
          Rs) ->
    case chat_mgr:add_item_cache(Platform, ZoneId, Item) of
        {ok, {_Platform, _ZoneId, CaCheId}} ->
            R = io_lib:format("{item_1, ~ts, ~w, ~w, ~w, ~w}",
                              [Platform, ZoneId, CaCheId, BaseId, Quantity]),
            make_item(Platform, ZoneId, T, [R | Rs]);
        _Err ->
            logger:error("添加物品缓存失败[~w]", [_Err], notice, 796),
            make_item(Platform, ZoneId, T, Rs)
    end.

make_pet(Pet = #pet{base_id = BaseId}) ->
    case get_server_info() of
        false ->
            logger:error("获取不到服务器信息，无法添加宠物缓存", [], notice, 804),
            false;
        {Platform, ZoneId} ->
            case chat_mgr:add_pet_cache(Platform, ZoneId, Pet) of
                {ok, {_, _, CaCheId}} ->
                    R = io_lib:format("{pet_1, ~ts, ~w, ~w, ~w}",
                                      [Platform, ZoneId, CaCheId, BaseId]),
                    {ok, R};
                _Err ->
                    logger:error("添加宠物缓存失败[~w]", [_Err], notice, 812),
                    false
            end
    end.

make_guard(Guard = #guard{base_id = BaseId}, Lev) ->
    case get_server_info() of
        false ->
            logger:error("获取不到服务器信息，无法添加守护缓存", [], notice, 821),
            false;
        {Platform, ZoneId} ->
            case chat_mgr:add_guard_cache(Platform, ZoneId, Guard)
                of
                {ok, {_, _, CaCheId}} ->
                    R = io_lib:format("{guard_1, ~ts, ~w, ~w, ~w, ~w}",
                                      [Platform, ZoneId, CaCheId, BaseId, Lev]),
                    {ok, R};
                _Err ->
                    logger:error("添加守护缓存失败[~w]", [_Err], notice, 829),
                    false
            end
    end.

make_item_base([]) -> [];
make_item_base({BaseId, Quantity})
    when BaseId >= 90000 ->
    io_lib:format("{assets_1, ~w, ~w}", [BaseId, Quantity]);
make_item_base(#{base_id := BaseId,
                 quantity := Quantity})
    when BaseId >= 90000 ->
    io_lib:format("{assets_1, ~w, ~w}", [BaseId, Quantity]);
make_item_base({BaseId, _, Quantity})
    when BaseId >= 90000 ->
    io_lib:format("{assets_1, ~w, ~w}", [BaseId, Quantity]);
make_item_base({BaseId, Quantity}) ->
    make_item_base({BaseId, 1, Quantity});
make_item_base(#{base_id := BaseId,
                 quantity := Quantity}) ->
    make_item_base({BaseId, 1, Quantity});
make_item_base(#item{base_id = BaseId,
                     quantity = Quantity, bind = Bind}) ->
    io_lib:format("{item_2, ~w, ~w, ~w}",
                  [BaseId, Bind, Quantity]);
make_item_base({BaseId, Bind, Quantity}) ->
    case item_data:get(BaseId) of
        #item_base{type = Type, name = Name} ->
            case lists:member(Type, [147, 148, 149, 150]) of
                true ->
                    io_lib:format("{item_2, ~w, ~w, ~w}",
                                  [BaseId, Bind, Quantity]);
                _ ->
                    case lists:member(BaseId,
                                      [29814,
                                       29698,
                                       29800,
                                       29803,
                                       29806,
                                       29809,
                                       29812,
                                       29813])
                        of
                        true -> notice:format("~ts", [{string_2, 3, Name}]);
                        _ ->
                            case item:make(BaseId, Bind, Quantity) of
                                {ok, _} ->
                                    io_lib:format("{item_2, ~w, ~w, ~w}",
                                                  [BaseId, Bind, Quantity]);
                                _ ->
                                    logger:error("生成物品失败[~w]",
                                                 [BaseId],
                                                 notice,
                                                 864),
                                    false
                            end
                    end
            end;
        _ ->
            logger:error("生成物品失败[~w]", [BaseId], notice, 870),
            false
    end;
make_item_base(Base = #{base_id := BaseId, bind := Bind,
                        quantity := Quantity}) ->
    case item_data:get(BaseId) of
        #item_base{type = Type} ->
            case lists:member(Type, [147, 148, 149, 150]) of
                true ->
                    io_lib:format("{item_2, ~w, ~w, ~w}",
                                  [BaseId, Bind, Quantity]);
                _ ->
                    case item:make(Base) of
                        {ok, _} ->
                            io_lib:format("{item_2, ~w, ~w, ~w}",
                                          [BaseId, Bind, Quantity]);
                        _ ->
                            logger:error("生成物品失败[~w]", [BaseId], notice, 883),
                            false
                    end
            end;
        _ ->
            logger:error("生成物品失败[~w]", [BaseId], notice, 888),
            false
    end;
make_item_base(Items) when is_list(Items) ->
    make_item_base(Items, []);
make_item_base(_Unkown) ->
    logger:error("未知格式物品：~w", [_Unkown], notice, 894),
    false.

make_item_base([], Items) ->
    {ok, string:join(lists:reverse(Items), "，")};
make_item_base([Item | T], Items) ->
    case make_item_base(Item) of
        R when is_list(R) -> make_item_base(T, [R | Items]);
        _ -> make_item_base(T, Items)
    end.

send_campaign_msg(Role,
                  #campaign_notice{title = Title, content = Content,
                                   process = Process,
                                   extern_content = ExtContent,
                                   rewards = Rewards}) ->
    role:link_send(Role,
                   9928,
                   {Title, Content, Process, ExtContent, Rewards}),
    ok.

