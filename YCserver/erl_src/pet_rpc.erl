-file("src/mod/pet/pet_rpc.erl", 1).

-module(pet_rpc).

-export([handle/3]).

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

-file("src/mod/pet/pet_rpc.erl", 9).

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

-file("src/mod/pet/pet_rpc.erl", 10).

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

-file("src/mod/pet/pet_rpc.erl", 11).

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

-file("src/mod/pet/pet_rpc.erl", 12).

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

-file("src/mod/pet/pet_rpc.erl", 13).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/pet/pet_rpc.erl", 14).

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

-file("src/mod/pet/pet_rpc.erl", 15).

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

-file("src/mod/pet/pet_rpc.erl", 16).

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

-file("src/mod/pet/pet_rpc.erl", 17).

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

-file("src/mod/pet/pet_rpc.erl", 18).

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

-file("src/mod/pet/pet_rpc.erl", 19).

handle(10500, {}, Role = #role{}) ->
    pet_util:push_client_pets(Role),
    ok;
handle(10501, {Id, 1}, Role = #role{status = 0}) ->
    case pet:war(Role, Id) of
        {ok, NRole, Msg} -> {reply, {1, Msg}, NRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(10501, {Id, 0}, Role = #role{status = 0}) ->
    case pet:rest(Role, Id) of
        {ok, NRole} -> {reply, {1, ""}, NRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(10501, _, _) ->
    {reply, {0, lang:get("战斗中不能操作宠物")}};
handle(10505, {Id, ItemFlag}, Role) ->
    role:send_buff_begin(),
    case pet:rand_aptitude(Role, Id, ItemFlag) of
        {ok, NewRole, Genre, WashTime, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg, Id, Genre, WashTime}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason, Id, 0, 0}}
    end;
handle(10507, {PetId, 0, HoleId}, Role) ->
    role:send_buff_begin(),
    case pet_stone:remove_stone(PetId, HoleId, Role) of
        {false, Reason} ->
            role:send_buff_clean(),
            notice:return(Reason),
            {reply, {0, ""}};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("符石卸下成功")}, NewRole}
    end;
handle(10507, {PetId, ItemId, HoleId},
       Role = #role{p_bag = #package{items = Items}}) ->
    case lists:keyfind(ItemId, #item.id, Items) of
        Item = #item{base_id = BaseId} ->
            role:send_buff_begin(),
            case pet_stone:use_stone(Item, PetId, HoleId, Role) of
                {false, Reason} ->
                    role:send_buff_clean(),
                    notice:return(Reason),
                    {reply, {0, Reason}};
                {ok, Role1, Msg} ->
                    NewRole = role_trigger:fire([#evt_pet_use_item{base_id =
                                                                       BaseId},
                                                 #evt_pet_skill{},
                                                 #evt_pet{}],
                                                Role1),
                    role:send_buff_flush(),
                    {reply, {1, Msg}, NewRole}
            end;
        _ -> {reply, {0, lang:get("未找到可以使用的道具")}}
    end;
handle(10508, {PetId, ItemId},
       Role = #role{p_bag = #package{items = Items}}) ->
    case lists:keyfind(ItemId, #item.id, Items) of
        #item{type = 100, base_id = BaseId} ->
            case item:attr(effect, BaseId) of
                [{3, SkillId}] ->
                    role:send_buff_begin(),
                    case pet_skill:use_item({id, ItemId},
                                            SkillId,
                                            PetId,
                                            Role)
                        of
                        {ok, Role1} ->
                            NewRole = role_trigger:fire([#evt_pet_skill{},
                                                         #evt_pet_use_item{base_id
                                                                               =
                                                                               BaseId},
                                                         #evt_pet{}],
                                                        Role1),
                            role:send_buff_flush(),
                            {reply, {1, ""}, NewRole};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason}}
                    end;
                _ -> {reply, {0, lang:get("无法读取技能数据")}}
            end;
        #item{type = Type, base_id = BaseId, step = Step}
            when Type =:= 117 orelse BaseId =:= 21304 ->
            role:send_buff_begin(),
            case pet_effect:add_happy(Role, PetId, BaseId, Step) of
                {ok, Role1, Msg} ->
                    NewRole = role_trigger:fire([#evt_pet_use_item{base_id =
                                                                       BaseId},
                                                 #evt_pet{}],
                                                Role1),
                    role:send_buff_flush(),
                    {reply, {1, Msg}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        #item{type = 121, base_id = BaseId} ->
            role:send_buff_begin(),
            case pet_aptitude:add_max_apt(Role,
                                          PetId,
                                          BaseId,
                                          ItemId)
                of
                {ok, Role1} ->
                    NewRole = role_trigger:fire([#evt_pet_use_item{base_id =
                                                                       BaseId},
                                                 #evt_pet{}],
                                                Role1),
                    role:send_buff_flush(),
                    {reply, {1, ""}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        #item{type = 122, base_id = BaseId} ->
            role:send_buff_begin(),
            case pet_aptitude:add_growth(Role, PetId, ItemId) of
                {ok, Role1} ->
                    NewRole = role_trigger:fire([#evt_pet_use_item{base_id =
                                                                       BaseId},
                                                 #evt_pet{}],
                                                Role1),
                    role:send_buff_flush(),
                    {reply, {1, ""}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        #item{type = 123, base_id = 22202 = BaseId} ->
            role:send_buff_begin(),
            case pet_effect:book_add_exp(Role,
                                         PetId,
                                         ItemId,
                                         #{mode => fruit})
                of
                {ok, Role1} ->
                    NewRole = role_trigger:fire([#evt_pet_use_item{base_id =
                                                                       BaseId},
                                                 #evt_pet{}],
                                                Role1),
                    role:send_buff_flush(),
                    {reply, {1, ""}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        #item{type = 123, base_id = 29103 = BaseId} ->
            role:send_buff_begin(),
            case pet_effect:book_add_exp(Role,
                                         PetId,
                                         ItemId,
                                         #{mode => levup})
                of
                {ok, Role1} ->
                    NewRole = role_trigger:fire([#evt_pet_use_item{base_id =
                                                                       BaseId},
                                                 #evt_pet{}],
                                                Role1),
                    role:send_buff_flush(),
                    {reply, {1, ""}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        #item{type = 123, base_id = BaseId} ->
            case item:attr(effect, BaseId) of
                [{5, OldExp}] ->
                    role:send_buff_begin(),
                    case pet_effect:book_add_exp(Role,
                                                 PetId,
                                                 ItemId,
                                                 #{mode => {book, OldExp}})
                        of
                        {ok, Role1} ->
                            NewRole =
                                role_trigger:fire([#evt_pet_use_item{base_id =
                                                                         BaseId}],
                                                  Role1),
                            role:send_buff_flush(),
                            {reply, {1, ""}, NewRole};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason}}
                    end;
                _ -> {reply, {0, lang:get("无法读取经验数据")}}
            end;
        #item{type = 144, base_id = BaseId} ->
            case item:attr(effect, BaseId) of
                [{63, {_AptType, _Value}}] ->
                    role:send_buff_begin(),
                    case pet_aptitude:use_plue_pudding(Role,
                                                       PetId,
                                                       BaseId,
                                                       ItemId)
                        of
                        {ok, Role1} ->
                            NewRole =
                                role_trigger:fire([#evt_pet_use_item{base_id =
                                                                         BaseId}],
                                                  Role1),
                            role:send_buff_flush(),
                            {reply, {1, ""}, NewRole};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason}}
                    end;
                _ -> {reply, {0, lang:get("无法读取的数据")}}
            end;
        Item = #item{type = 155} ->
            role:send_buff_begin(),
            case pet:unreal(Role, PetId, Item) of
                {ok, NewRole} ->
                    role:send_buff_flush(),
                    {reply, {1, ""}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        #item{type = Type} ->
            logger:error("非宠物道具进行使用:~w", [Type], pet_rpc, 209),
            {reply, {0, lang:get("非宠物道具不可使用")}};
        _ -> {reply, {0, lang:get("未找到可以使用的道具")}}
    end;
handle(10509, {PetId}, Role) ->
    role:send_buff_begin(),
    case pet_stone:upgrade(PetId, Role) of
        {ok, NewRole, NewGrade} ->
            role:send_buff_flush(),
            {reply,
             {1, "", PetId, NewGrade},
             role_trigger:fire(#evt_pet{}, NewRole)};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason, PetId, 0}}
    end;
handle(10510, {PetId, AptType}, Role)
    when AptType >= 1 andalso AptType =< 5 ->
    role:send_buff_begin(),
    case pet_aptitude:use_aptitude(PetId, AptType, Role) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply,
             {1, lang:get("")},
             role_trigger:fire([#evt_pet{},
                                #evt_pet_use_item{base_id = 20007}],
                               NewRole)};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(10513, {_, 0, 0, 0, 0, 0}, _Role) -> ok;
handle(10513, {PetId, Str, Con, Mag, Agi, End}, Role)
    when Str >= 0 andalso
             Con >= 0 andalso
                 Mag >= 0 andalso Agi >= 0 andalso End >= 0 ->
    role:send_buff_begin(),
    case pet:addpoint(PetId,
                      {Str, Con, Mag, Agi, End},
                      Role)
        of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply,
             {1, ""},
             role_trigger:fire(#evt_pet{}, NewRole)};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(10517, {BaseId}, Role) ->
    role:send_buff_begin(),
    case pet_shop:purchs_pet(Role, BaseId) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {ok, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Reason),
            {reply, {0}};
        _ ->
            role:send_buff_clean(),
            notice:send(Role, 1, lang:get("购买宠物失败")),
            {reply, {0}}
    end;
handle(10519, {Id, Name}, Role) ->
    case util:check_name(Name) of
        ok ->
            case pet:rename_pet(Id, Name, Role) of
                {ok, Role1} ->
                    NewRole = role_trigger:fire(#evt_pet_rename{}, Role1),
                    {reply, {1, lang:get("改名成功"), Id, Name}, NewRole};
                {false, Reason} -> {reply, {0, Reason, Id, Name}}
            end;
        {false, Reason} -> {reply, {0, Reason, Id, Name}}
    end;
handle(10520, {PetId, Str, Con, Mag, Agi, End}, Role) ->
    case pet:setpoint(PetId,
                      {Str, Con, Mag, Agi, End},
                      Role)
        of
        {false, Reason} ->
            {reply, {PetId, 0, Reason, #pet_attr{}}};
        {ok, NewRole, NewPetAttr, Msg} ->
            {reply,
             {PetId, 1, Msg, NewPetAttr},
             role_trigger:fire(#evt_pet{}, NewRole)}
    end;
handle(10521, {PetId},
       #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{pet_attr = PetAttr} -> {reply, {PetId, PetAttr}};
        _ -> ok
    end;
handle(10522, {PetId}, Role) ->
    case pet:free(PetId, Role) of
        {ok, Role1} ->
            NewRole = role_trigger:fire(#evt_pet_free{}, Role1),
            {reply,
             {PetId, 1, lang:get("放生成功")},
             role_trigger:fire(#evt_pet{}, NewRole)};
        {false, Reason} -> {reply, {PetId, 0, Reason}}
    end;
handle(10523, {}, Role) ->
    case pet:add_pet_nums(Role) of
        {ok, PetNums, NewRole} ->
            {reply, {PetNums, 1, lang:get("开启宠物栏成功")}, NewRole};
        {false, PetNums, Reason} ->
            {reply, {PetNums, 0, Reason}}
    end;
handle(10524, {Genre}, Role) ->
    role:send_buff_begin(),
    case pet:exchange(Role, Genre) of
        {ok, NewRole, BaseId} ->
            role:send_buff_flush(),
            {reply, {BaseId, 1, lang:get("成功兑换")}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, 0, Reason}}
    end;
handle(10526, {ItemId}, Role = #role{p_bag = Pbag}) ->
    logger:debug("============ ~w", [ItemId], pet_rpc, 359),
    case package:find(by_id, ItemId, Pbag) of
        false -> {reply, {0, lang:get("符石不存在，无法重置")}};
        {ok, Stone = #item{type = 102}} ->
            role:send_buff_begin(),
            case pet_stone:reset_stone(Stone, Role) of
                {ok, NewRole} ->
                    role:send_buff_flush(),
                    {reply, {1, lang:get("重置成功")}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        {ok, Stone = #item{type = 104}} ->
            role:send_buff_begin(),
            case child_stone:reset_stone(Stone, Role) of
                {ok, NewRole} ->
                    role:send_buff_flush(),
                    {reply, {1, lang:get("重置成功")}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        _Err -> {reply, {0, lang:get("不可重置的道具")}}
    end;
handle(10527, {}, Role) ->
    case pet:get_fresh(Role) of
        {ok, NewRole, NewFreshId, Time} ->
            {reply, {1, "", NewFreshId, Time}, NewRole};
        {false, Reason} -> {reply, {0, Reason, 0, 0}}
    end;
handle(10528, {},
       #role{m_pet_store =
                 #m_pet_store{pet_nums = PetNums, pets = Pets}}) ->
    {reply, {PetNums, Pets}};
handle(10529, {PetId}, Role) ->
    MountRole = mount:free_pet(Role, PetId),
    case pet_store:put_store(MountRole, PetId) of
        {ok, NewRole, Msg} ->
            {reply,
             {1, Msg},
             role_trigger:fire(#evt_pet{}, NewRole)};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(10530, {PetId}, Role) ->
    case pet_store:get_store(Role, PetId) of
        {ok, NewRole, Msg} ->
            {reply,
             {1, Msg},
             role_trigger:fire(#evt_pet{}, NewRole)};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(10532, {PetId}, Role) ->
    case pet_store:free(PetId, Role) of
        {ok, NewRole} ->
            {reply, {PetId, 1, lang:get("放生成功")}, NewRole};
        {false, Reason} -> {reply, {PetId, 0, Reason}}
    end;
handle(10533, {}, Role) ->
    case pet_store:add_pet_nums(Role) of
        {ok, PetNums, NewRole} ->
            {reply, {PetNums, 1, lang:get("开启宠物栏成功")}, NewRole};
        {false, PetNums, Reason} ->
            {reply, {PetNums, 0, Reason}}
    end;
handle(10534, {PetId}, Role) ->
    case pet:reset_point(Role, PetId) of
        {ok, pay, NewRole} ->
            {reply, {PetId, 1, lang:get("洗点成功"), 1}, NewRole};
        {ok, _, NewRole} ->
            {reply, {PetId, 1, lang:get("洗点成功"), 0}, NewRole};
        {false, Reason} -> {reply, {PetId, 0, Reason, 0}}
    end;
handle(10535, {PetId},
       #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{combat_talk = CombatTalk} ->
            {reply, {PetId, CombatTalk}};
        _ -> ok
    end;
handle(10536, {PetId, Type, Msg},
       Role = #role{m_pet = #m_pet{pets = Pets}})
    when Type >= 1 andalso Type =< 7 ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{} ->
            case pet_effect:set_talk(Pet, Type, Msg, Role) of
                {ok, NewRole} ->
                    {reply,
                     {PetId, 1, lang:get("修改成功"), Type, Msg},
                     NewRole};
                {false, Reason} ->
                    {reply, {PetId, 0, Reason, Type, Msg}}
            end;
        _ ->
            {reply, {PetId, 0, lang:get("找不到宠物，无法设置"), Type, Msg}}
    end;
handle(10537, {PetId}, Role) ->
    case pet_lock:lock(PetId, Role) of
        {ok, NewRole} ->
            {reply, {1, PetId, lang:get("成功锁定宠物")}, NewRole};
        {false, Msg} -> {reply, {0, PetId, Msg}};
        _ -> {reply, {0, PetId, lang:get("无法锁定宠物")}}
    end;
handle(10538, {PetId}, Role) ->
    case pet_lock:unlock(PetId, Role) of
        {ok, NewRole} ->
            {reply, {1, PetId, lang:get("宠物解锁成功")}, NewRole};
        {false, Msg} -> {reply, {0, PetId, Msg}};
        _ -> {reply, {0, PetId, lang:get("宠物解锁失败")}}
    end;
handle(10539, {PetId, BaseId}, Role) ->
    role:send_buff_begin(),
    case pet:exchange(Role, PetId, BaseId) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {PetId, BaseId, 1, ""}, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            {reply, {0, PetId, BaseId, Msg}}
    end;
handle(10540, {BaseId}, Role) ->
    case lists:member(BaseId, [20141, 20140]) of
        true ->
            case var:get_var(Role, other, 2009, 0) of
                0 ->
                    Gains = [#gain{label = item_base_id,
                                   val = [{BaseId, 1, 1}]}],
                    case role_gain:do_notice(Gains, Role) of
                        {ok, GainRole} ->
                            VarRole = var:add_var(GainRole, other, 2009, 1),
                            FireRole =
                                role_trigger:fire(#evt_get_pet_item_skill_guide{},
                                                  VarRole),
                            NewRole = FireRole,
                            {ok, NewRole};
                        {false, #gain{msg = Msg}} -> {reply, {0, Msg}};
                        _ -> {reply, {0, lang:get("无法领取宠物技能书")}}
                    end;
                1 -> {reply, {0, lang:get("你已领取过该宠物技能书")}};
                _ -> {reply, {0, lang:get("无效的请求")}}
            end;
        false -> {reply, {0, lang:get("未知物品")}}
    end;
handle(10541, {PetId, ItemId}, Role) ->
    role:send_buff_begin(),
    case pet_stone:polish(Role, PetId, ItemId) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            notice:return(lang:get("洗练成功")),
            {reply, {1, PetId, ItemId}, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            notice:return(Msg),
            {reply, {0, PetId, ItemId}}
    end;
handle(10542, {PetId, ItemId}, Role) ->
    role:send_buff_begin(),
    case pet_stone:save_polish(Role, PetId, ItemId) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            notice:return(lang:get("保存成功")),
            {reply, {1, PetId, ItemId}, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            notice:return(Msg),
            {reply, {0, PetId, ItemId}}
    end;
handle(10543, {}, Role) ->
    pet:push_aptitude(Role),
    ok;
handle(10544, {PetId, StoneId, ItemId},
       Role = #role{p_bag = #package{items = Items}}) ->
    case lists:keyfind(ItemId, #item.id, Items) of
        Item = #item{type = 120, base_id = BaseId} ->
            case item:attr(effect, BaseId) of
                [{44, SkillId}] ->
                    role:send_buff_begin(),
                    case pet_stone:marking_stone(Role,
                                                 PetId,
                                                 StoneId,
                                                 Item,
                                                 SkillId)
                        of
                        {ok, NewRole, Msg} ->
                            role:send_buff_flush(),
                            {reply, {1, Msg}, NewRole};
                        {false, Msg} ->
                            role:send_buff_clean(),
                            {reply, {0, Msg}}
                    end;
                _ -> {reply, {0, lang:get("不可使用的宠物刻印石")}}
            end;
        _ -> {reply, {0, lang:get("没有找到可使用的宠物刻印石")}}
    end;
handle(10545, {BaseId}, Role) ->
    role:send_buff_begin(),
    case pet:exchange_spec(Role, BaseId) of
        {ok, NewRole, BaseId} ->
            role:send_buff_flush(),
            {reply, {BaseId, 1, lang:get("成功兑换")}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, 0, Reason}}
    end;
handle(10546, {PetId, ItemBaseId}, Role) ->
    case item:attr(effect, ItemBaseId) of
        [{3, 1}] -> {reply, {0, lang:get("真·天赋觉醒无法直接购买")}};
        [{3, SkillId}] ->
            role:send_buff_begin(),
            case pet_skill:use_item({base_id, ItemBaseId},
                                    SkillId,
                                    PetId,
                                    Role)
                of
                {ok, Role1} ->
                    NewRole = role_trigger:fire([#evt_pet_skill{},
                                                 #evt_pet_use_item{base_id =
                                                                       ItemBaseId},
                                                 #evt_pet{}],
                                                Role1),
                    role:send_buff_flush(),
                    {reply, {1, ""}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        _ -> {reply, {0, lang:get("无法读取技能数据")}}
    end;
handle(10548, {PetId, PetIdSub}, Role) ->
    case pet:refining(Role, PetId, PetIdSub) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Msg} ->
            notice:send(Role, 1, Msg),
            ok
    end;
handle(10549, {Id}, Role = #role{p_bag = Bag}) ->
    case package:find(by_id, Id, Bag) of
        {ok, #item{base_id = BaseId}} ->
            case pet_data:get_reset(BaseId) of
                #{tournament := TournamentList,
                  percent := PercentList} ->
                    role:send_buff_begin(),
                    {Tournament, _Odds} = util:rand_list(TournamentList, 2),
                    VarId = case BaseId of
                                20615 -> 211;
                                20616 -> 210;
                                20617 -> 209
                            end,
                    Val = var:get_var(Role, week, VarId),
                    {TimesVal, Percent} =
                        pet_util:get_smelt_percent(PercentList, Val + 1),
                    Loss = [#loss{label = item_id, val = [{Id, 1}]}],
                    Gain = format:val_to_gain([{90020,
                                                util:ceil(Tournament * Percent /
                                                              100)}]),
                    case role_gain:do(Loss ++ Gain, Role) of
                        {ok, Role1} ->
                            role:send_buff_flush(),
                            NewRole = var:add_var(Role1, week, VarId, 1),
                            Moon = var:get_var(NewRole, week, 210),
                            Sun = var:get_var(NewRole, week, 209),
                            Msg = case Percent =:= 100 of
                                      true ->
                                          notice:format(lang:get("获得~ts"),
                                                        [{assets_1,
                                                          90020,
                                                          Tournament}]);
                                      _ ->
                                          notice:format(lang:get("获得~ts（本周熔炼次数超过~ts个，衰减~ts%）"),
                                                        [{assets_1,
                                                          90020,
                                                          util:ceil(Tournament *
                                                                        Percent
                                                                        / 100)},
                                                         {string_2,
                                                          5,
                                                          TimesVal},
                                                         {string_2,
                                                          1,
                                                          100 - Percent}])
                                  end,
                            {reply, {1, Msg, Moon, Sun}, NewRole};
                        {false, #loss{msg = Msg}} ->
                            role:send_buff_clean(),
                            {reply, {0, Msg, 0, 0}}
                    end;
                _ -> {reply, {0, lang:get("该物品无法熔炼"), 0, 0}}
            end;
        _ -> {reply, {0, lang:get("该物品不存在,无法熔炼"), 0, 0}}
    end;
handle(10550, {PetId}, Role) ->
    role:send_buff_begin(),
    case pet_stone:lev_break(PetId, Role) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("突破成功"), PetId}, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            {reply, {0, Msg, PetId}}
    end;
handle(10551, {}, Role) ->
    Moon = var:get_var(Role, week, 210),
    Sun = var:get_var(Role, week, 209),
    {reply, {Moon, Sun}};
handle(10552, {},
       Role = #role{m_pet = #m_pet{pets = Pets},
                    m_pet_store = #m_pet_store{pets = Pets2},
                    m_campaign = #m_campaign{rewarded = Rewarded},
                    p_bag = #package{items = Items1},
                    p_store = #package{items = Items2},
                    p_family_store = #package{items = Items3}}) ->
    HasGet = var:get_var(Role, other, 2050, 0),
    Result = case HasGet =/= 0 of
                 true -> {false, lang:get("已经回购过，无法再次回购")};
                 false ->
                     case lists:keyfind(10000, #pet.base_id, Pets ++ Pets2)
                         of
                         false ->
                             case lists:keyfind(1, 1, Rewarded) of
                                 false -> {false, lang:get("首充奖励尚未领取过，无法购买")};
                                 _ ->
                                     case lists:keyfind(20097,
                                                        #item.base_id,
                                                        Items1 ++
                                                            Items2 ++ Items3)
                                         of
                                         false -> true;
                                         _ ->
                                             Msg =
                                                 notice:format(lang:get("~ts还在你背包，无法购买"),
                                                               [{item_2,
                                                                 20097}]),
                                             {false, Msg}
                                     end
                             end;
                         _ ->
                             Msg = notice:format(lang:get("~ts还在宠物栏，无法购买"),
                                                 [{pet_2, 10000}]),
                             {false, Msg}
                     end
             end,
    case Result of
        {false, Reason} -> {reply, {0, Reason}};
        true ->
            Loss = [#loss{label = gold_bind, val = 15000}],
            Gain = [#gain{label = item_base_id,
                          val = [{20097, 1, 1}]}],
            role:send_buff_begin(),
            case role_gain:do_notice(Loss, Role) of
                {false, #loss{msg = Reason}} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}};
                {ok, NewRole} ->
                    case role_gain:do_notice(Gain, NewRole) of
                        {false, #gain{msg = Reason}} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason}};
                        {ok, NewRole1} ->
                            role:send_buff_flush(),
                            NewRole2 = var:set_var(NewRole1, other, 2050, 1),
                            {reply, {1, lang:get("购买成功")}, NewRole2}
                    end
            end
    end;
handle(10553, {PetId, SkillId},
       Role = #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{} ->
            case pet_skill:lock_skill(Role, Pet, SkillId) of
                {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
                {false, Reason} -> {reply, {0, Reason}}
            end;
        _ -> {reply, {0, lang:get("找不到指定宠物")}}
    end;
handle(10554, {PetId}, Role) ->
    case pet:rpc_save_tmp_aptitude(Role, PetId) of
        {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(10555, {PetId}, Role) ->
    pet:push_10555(Role, PetId),
    ok;
handle(10556, {PetId, Num}, Role) ->
    role:send_buff_begin(),
    case pet_effect:auto_exp_book(Role, PetId, Num) of
        {ok, Role1} ->
            NewRole = role_trigger:fire([#evt_pet_use_item{base_id =
                                                               20004}],
                                        Role1),
            role:send_buff_flush(),
            {reply, {1, ""}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(10557, {PetId, SkinId},
       Role = #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{} ->
            role:send_buff_begin(),
            case pet_effect:add_color(Role, Pet, SkinId) of
                {ok, NewRole, Msg} ->
                    role:send_buff_flush(),
                    {reply, {1, Msg}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        _ -> {reply, {0, lang:get("找不到指定宠物")}}
    end;
handle(10558, {PetId, SkinId},
       Role = #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{} ->
            case pet_effect:change_color(Role, Pet, SkinId) of
                {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
                {false, Reason} -> {reply, {0, Reason}}
            end;
        _ -> {reply, {0, lang:get("找不到指定宠物")}}
    end;
handle(10560, {PetBaseId}, Role = #role{}) ->
    role:send_buff_begin(),
    case pet_util:exchange_lev_break_pet(Role, PetBaseId) of
        {true, Msg, NewRole} ->
            role:send_buff_flush(),
            {reply, {PetBaseId, 1, Msg}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {PetBaseId, 0, Reason}}
    end;
handle(10561, {PetId, SubId}, Role = #role{}) ->
    case pet_spirit:attach(Role, PetId, SubId) of
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(10562, {SubId}, Role = #role{}) ->
    case pet_spirit:unattach(Role, SubId) of
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(10563, {ItemId}, #role{p_bag = Pbag}) ->
    logger:debug("============ ~w", [ItemId], pet_rpc, 840),
    case package:find(by_id, ItemId, Pbag) of
        false -> {rpley, {ItemId, []}};
        {ok, #item{type = Type, data = Data}}
            when Type =:= 102 orelse Type =:= 104 ->
            AttrBase1 = case lists:keyfind(7, 1, Data) of
                            {_, AttrBase} -> AttrBase;
                            _ -> []
                        end,
            logger:debug("============ ~w",
                         [AttrBase1],
                         pet_rpc,
                         849),
            {reply, {ItemId, AttrBase1}};
        _ -> {reply, {ItemId, []}}
    end;
handle(10564, {ItemId}, Role = #role{p_bag = Pbag}) ->
    logger:debug("============ ~w", [ItemId], pet_rpc, 857),
    case package:find(by_id, ItemId, Pbag) of
        false -> {reply, {0, lang:get("找不到该物品")}};
        {ok, Stone = #item{type = Type}} when Type =:= 102 ->
            case pet_stone:save_stone(Stone, Role) of
                {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
                {false, Reason} -> {reply, {0, Reason}}
            end;
        {ok, Stone = #item{type = Type}} when Type =:= 104 ->
            case child_stone:save_stone(Stone, Role) of
                {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
                {false, Reason} -> {reply, {0, Reason}}
            end;
        _ -> {reply, {0, lang:get("不可重置的道具")}}
    end;
handle(10565, {PetId, ItemId}, Role) ->
    case pet:unreal_down(Role, PetId, ItemId) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(10566, {PetId, PetIdSub}, Role) ->
    pet:push_10566(Role, PetId, PetIdSub),
    ok;
handle(10567, {PetID}, Role) ->
    pet_attr:extra_attr(Role, PetID),
    ok;
handle(10568, {PetId, BaseID, HoleId}, Role) ->
    role:send_buff_begin(),
    case pet_stone:auto_use_stone(BaseID,
                                  PetId,
                                  HoleId,
                                  Role)
        of
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, Role1, Msg} ->
            NewRole = role_trigger:fire([#evt_pet_use_item{base_id =
                                                               BaseID},
                                         #evt_pet_skill{},
                                         #evt_pet{}],
                                        Role1),
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {false, Role1, Msg} ->
            role:send_buff_flush(),
            {reply, {0, Msg}, Role1}
    end;
handle(10569, {}, Role) ->
    {ok, Role2} = pet_egg:get_camp_pet_egg(Role),
    {ok, Role2};
handle(10570, {}, Role) ->
    case role_misc:check_cd(rpc_10570) of
        true ->
            {ok, Role2} = pet_egg:incubate_pet_egg(Role),
            {ok, Role2};
        _ ->
            notice:return(lang:get("您的操作太快了，稍后再试吧")),
            ok
    end;
handle(10571, {}, Role) ->
    {ok, Role2} = pet_egg:upgrade_pet_egg(Role),
    {ok, Role2};
handle(10572, {}, Role) ->
    pet:push_month_card_washing_times(Role),
    ok;
handle(10573, {PetId, SkillId}, Role) ->
    case pet_skill:rpc_choose_exchange_skill(Role,
                                             PetId,
                                             SkillId)
        of
        {ok, NewRole} ->
            SkillName = case skill_data:get_pet({SkillId, 1}) of
                            #pet_base_skill{name = _Name} -> _Name;
                            _ -> lang:get("未知技能")
                        end,
            Msg = notice:format(lang:get("成功学习:~ts"),
                                [{string_2, 1, SkillName}]),
            {reply, {1, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("未知错误")}}
    end;
handle(10574, {PetId, Flag}, Role) ->
    {ok, Role2} = pet:change_unreal_loooks(Role,
                                           PetId,
                                           Flag),
    {ok, Role2};
handle(10575, {PetId, RuneIndex, RuneId}, Role) ->
    case pet_rune:update_rune(Role,
                              PetId,
                              RuneIndex,
                              RuneId)
        of
        {ok, NewRole} ->
            RuneName = pet_rune:rune_name(RuneId),
            Msg = notice:format(lang:get("成功学习:~ts"),
                                [{string_2, 1, RuneName}]),
            {reply, {1, Msg, RuneIndex, RuneId}, NewRole};
        {false, Reason} ->
            {reply, {0, Reason, RuneIndex, RuneId}};
        _ -> {reply, {0, lang:get("未知错误"), RuneIndex, RuneId}}
    end;
handle(10576, {PetId, RuneIndex, Type}, Role) ->
    case pet_rune:rune_grasp(Role, PetId, RuneIndex, Type)
        of
        {ok, NewRole} ->
            {reply, {1, lang:get("领悟成功")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("未知错误")}}
    end;
handle(10577, {PetId, RuneIndex}, Role) ->
    case pet_rune:rune_unload(Role, PetId, RuneIndex) of
        {ok, NewRole} ->
            {reply, {1, lang:get("内丹已成功遗忘")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("未知错误")}}
    end;
handle(10578, {PetId, ResonanceIndex}, Role) ->
    case pet_rune:rune_resonance(Role,
                                 PetId,
                                 ResonanceIndex)
        of
        {ok, NewRole} ->
            {reply, {1, lang:get(""), ResonanceIndex}, NewRole};
        {false, Reason} -> {reply, {0, Reason, ResonanceIndex}};
        _ -> {reply, {0, lang:get("未知错误"), ResonanceIndex}}
    end;
handle(10579, {}, Role) ->
    pet_rune:push(Role),
    ok;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [pet_rpc, _Cmd, _Data],
                 pet_rpc,
                 1012),
    {error, unknow_command}.

