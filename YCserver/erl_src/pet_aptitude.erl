-file("src/mod/pet/pet_aptitude.erl", 1).

-module(pet_aptitude).

-export([add_max_apt/4,
         use_aptitude/3,
         add_growth/3,
         refining_get_aptitude/4,
         refining_add_aptitude/4,
         use_plue_pudding/4]).

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

-file("src/mod/pet/pet_aptitude.erl", 17).

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

-file("src/mod/pet/pet_aptitude.erl", 18).

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

-file("src/mod/pet/pet_aptitude.erl", 19).

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

-file("src/mod/pet/pet_aptitude.erl", 20).

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

-file("src/mod/pet/pet_aptitude.erl", 21).

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

-file("src/mod/pet/pet_aptitude.erl", 22).

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

-file("src/mod/pet/pet_aptitude.erl", 23).

add_max_apt(Role = #role{m_pet =
                             Mpet = #m_pet{pets = Pets}},
            PetId, BaseId, ItemId) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{genre = 6} -> {false, lang:get("宠物蛋不可提升资质上限")};
        Pet = #pet{} ->
            case item:attr(effect, BaseId) of
                [{18, AptType}] ->
                    Loss = [#loss{label = item_id, val = [{ItemId, 1}]}],
                    case role_gain:do(Loss, Role) of
                        {ok, Role1} ->
                            case check_add_max_apt(Role, Pet, AptType) of
                                {true, NewPet} ->
                                    NewPets = lists:keyreplace(PetId,
                                                               #pet.id,
                                                               Pets,
                                                               NewPet),
                                    NewMpet = Mpet#m_pet{pets = NewPets},
                                    NewRole = Role1#role{m_pet = NewMpet},
                                    pet:push_10503(NewRole, NewPet),
                                    log:pet(NewRole, "提升资质上限", Pet, NewPet),
                                    {ok, NewRole};
                                {false, Reason} -> {false, Reason}
                            end;
                        {false, _} -> {false, lang:get("道具不足, 无法操作")}
                    end;
                _ -> {false, lang:get("不可使用的天资丹")}
            end;
        _ -> {false, lang:get("找不到目标宠物")}
    end.

use_aptitude(PetId, Aptitude,
             Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{} ->
            Loss = [#loss{label = item_base_id_auto_buy,
                          val = [{20007, 1}], auto_scene = lang:get("使用资质丹")}],
            case role_gain:do_notice(Loss, Role) of
                {ok, Role1} ->
                    case check_use_aptitude(Role, Pet, Aptitude) of
                        {true, NewPet} ->
                            {ok, NewPet1, Role2} = pet_attr:calc(NewPet, Role1),
                            NewPets = lists:keyreplace(PetId,
                                                       #pet.id,
                                                       Pets,
                                                       NewPet1),
                            NewMpet = Mpet#m_pet{pets = NewPets},
                            NewRole = Role2#role{m_pet = NewMpet},
                            pet:push_10503(NewRole, NewPet1),
                            log:pet(NewRole, "提升资质", Pet, NewPet),
                            {ok, NewRole};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, _} -> {false, lang:get("道具不足, 无法操作")}
            end;
        _ -> {false, lang:get("找不到目标宠物")}
    end.

add_growth(Role = #role{m_pet =
                            Mpet = #m_pet{pets = Pets}},
           PetId, ItemId) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{genre = 6} -> {false, lang:get("宠物蛋不可提升资质")};
        #pet{use_growth = Use} when Use >= 10 ->
            {false, lang:get("当前宠物已经使用过10个成长丹，无法继续使用")};
        Pet = #pet{} ->
            Loss = [#loss{label = item_id, val = [{ItemId, 1}]}],
            case role_gain:do(Loss, Role) of
                {ok, Role1} ->
                    case check_add_growth(Pet) of
                        {true, NewPet, Msg} ->
                            {ok, NewPet1, Role2} = pet_attr:calc(NewPet, Role1),
                            NewPets = lists:keyreplace(PetId,
                                                       #pet.id,
                                                       Pets,
                                                       NewPet1),
                            NewMpet = Mpet#m_pet{pets = NewPets},
                            NewRole = Role2#role{m_pet = NewMpet},
                            pet:push_10503(NewRole, NewPet1),
                            log:pet(NewRole, "提升成长", Pet, NewPet1),
                            notice:send(NewRole, 3, Msg),
                            {ok, NewRole};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, _} -> {false, lang:get("道具不足, 无法操作")}
            end;
        _ -> {false, lang:get("找不到目标宠物")}
    end.

check_add_growth(Pet = #pet{name = PetName,
                            base_id = PetBaseId, growth = Growth,
                            use_growth = UseGrowth}) ->
    case pet_data:get_base(PetBaseId) of
        #pet_base{growth_blue = GrowthBlue,
                  growth_purple = GrowthPurple,
                  growth_orange = GrowthOrange, growth_red = GrowthRed} ->
            AddVal = util:rand_list([1, 2, 2]),
            NewGrowth = Growth + AddVal,
            NewGrowthType = find_growth_type(GrowthBlue,
                                             GrowthPurple,
                                             GrowthOrange,
                                             GrowthRed,
                                             NewGrowth),
            NewPet = Pet#pet{growth = NewGrowth,
                             growth_type = NewGrowthType,
                             use_growth = UseGrowth + 1},
            Msg = case AddVal of
                      1 ->
                          notice:format(lang:get("[~ts]成长值增加了~ts"),
                                        [{string_2, 5, PetName},
                                         {string_2, 1, "0.002"}]);
                      _ ->
                          notice:format(lang:get("[~ts]成长值增加了~ts"),
                                        [{string_2, 5, PetName},
                                         {string_2, 1, "0.004"}])
                  end,
            {true, NewPet, Msg};
        _ -> {false, lang:get("找不到宠物的基础数据")}
    end.

find_growth_type(_Blue, _PurPle, _Orange, Red, Val)
    when Val >= Red ->
    5;
find_growth_type(_Blue, _PurPle, Orange, _Red, Val)
    when Val >= Orange ->
    4;
find_growth_type(_Blue, PurPle, _Orange, _Red, Val)
    when Val >= PurPle ->
    3;
find_growth_type(_Blue, _PurPle, _Orange, _Red, _Val) ->
    2.

check_use_aptitude(Role,
                   Pet = #pet{base_id = PetBaseId, genre = GenreType,
                              pet_attr =
                                  PetAttr = #pet_attr{hp_aptitude = HpApt,
                                                      phy_aptitude = PhyApt,
                                                      pdef_aptitude = PdefApt,
                                                      magic_aptitude = MagicApt,
                                                      aspd_aptitude = AspdApt,
                                                      max_hp_aptitude =
                                                          MaxHpApt,
                                                      max_phy_aptitude =
                                                          MaxPhyApt,
                                                      max_pdef_aptitude =
                                                          MaxPdefApt,
                                                      max_magic_aptitude =
                                                          MaxMagicApt,
                                                      max_aspd_aptitude =
                                                          MaxAspdApt}},
                   Type) ->
    case pet_data:get_base(PetBaseId) of
        #pet_base{hp_aptitude = BaseHpApt,
                  phy_aptitude = BasePhyApt, pdef_aptitude = BasePdefApt,
                  magic_aptitude = BaseMagicApt,
                  aspd_aptitude = BaseAspdApt} ->
            {Apt, MaxApt, BaseApt} = case Type of
                                         1 -> {HpApt, MaxHpApt, BaseHpApt};
                                         2 -> {PhyApt, MaxPhyApt, BasePhyApt};
                                         3 ->
                                             {PdefApt, MaxPdefApt, BasePdefApt};
                                         4 ->
                                             {MagicApt,
                                              MaxMagicApt,
                                              BaseMagicApt};
                                         5 -> {AspdApt, MaxAspdApt, BaseAspdApt}
                                     end,
            MinApt = round(BaseApt * 80 / 100 *
                               pet:genre_ratio(GenreType)),
            case Apt >= MinApt andalso
                     Apt < MaxApt andalso MaxApt > MinApt
                of
                false -> {false, lang:get("当前资质已达上限, 无法继续使用资质丹")};
                true ->
                    case calc_use_aptitude(Apt, MaxApt, MinApt, PetBaseId)
                        of
                        {true, AddApt} ->
                            PetAttr1 = update_use_apt(Role,
                                                      PetAttr,
                                                      Type,
                                                      AddApt),
                            Pet1 = Pet#pet{pet_attr = PetAttr1},
                            {true, Pet1};
                        {false, Reason} -> {false, Reason}
                    end
            end;
        _ -> {false, lang:get("找不到宠物的基础数据")}
    end.

calc_use_aptitude(Apt, MaxApt, MinApt, PetId) ->
    Ratio = (Apt - MinApt) / (MaxApt - MinApt) * 100,
    Ratio1 = round(util:check_range(Ratio, 0, 100)),
    case pet_data:get_add_apt({PetId, Ratio1}) of
        {AptRatio, AptBase} ->
            LastAdd = [{100, 350},
                       {110, 240},
                       {120, 160},
                       {130, 100},
                       {140, 80},
                       {150, 50},
                       {160, 20}],
            {Float, _} = util:rand_list(LastAdd, 2),
            BaseAdd = (MaxApt - MinApt) * AptRatio / 100 + AptBase,
            BaseAdd1 = round(BaseAdd * Float / 100),
            case BaseAdd1 > 0 of
                true -> {true, min(MaxApt - Apt, BaseAdd1)};
                false -> {false, lang:get("找不到资质数值")}
            end;
        _ -> {false, lang:get("当前宠物不能使用资质丸提升")}
    end.

update_use_apt(Role,
               PetAttr = #pet_attr{hp_aptitude = HpApt,
                                   max_hp_aptitude = MaxHpApt},
               1, AddApt) ->
    RealAdd = max(5, AddApt),
    RealAdd1 = min(RealAdd, MaxHpApt - HpApt),
    NewHpApt = HpApt + RealAdd1,
    Msg = notice:format(lang:get("~ts提升了~ts点"),
                        [{string_1, apt_name(1)}, {string_2, 5, RealAdd1}]),
    notice:send(Role, 3, Msg),
    PetAttr#pet_attr{hp_aptitude = NewHpApt};
update_use_apt(Role,
               PetAttr = #pet_attr{phy_aptitude = PhyApt,
                                   max_phy_aptitude = MaxPhyApt},
               2, AddApt) ->
    RealAdd = max(5, AddApt),
    RealAdd1 = min(RealAdd, MaxPhyApt - PhyApt),
    NewPhyApt = PhyApt + RealAdd1,
    Msg = notice:format(lang:get("~ts提升了~ts点"),
                        [{string_1, apt_name(2)}, {string_2, 5, RealAdd1}]),
    notice:send(Role, 3, Msg),
    PetAttr#pet_attr{phy_aptitude = NewPhyApt};
update_use_apt(Role,
               PetAttr = #pet_attr{pdef_aptitude = PdefApt,
                                   max_pdef_aptitude = MaxPdefApt},
               3, AddApt) ->
    RealAdd = max(5, AddApt),
    RealAdd1 = min(RealAdd, MaxPdefApt - PdefApt),
    NewPdefApt = PdefApt + RealAdd1,
    Msg = notice:format(lang:get("~ts提升了~ts点"),
                        [{string_1, apt_name(3)}, {string_2, 5, RealAdd1}]),
    notice:send(Role, 3, Msg),
    PetAttr#pet_attr{pdef_aptitude = NewPdefApt};
update_use_apt(Role,
               PetAttr = #pet_attr{magic_aptitude = MagicApt,
                                   max_magic_aptitude = MaxMagicApt},
               4, AddApt) ->
    RealAdd = max(5, AddApt),
    RealAdd1 = min(RealAdd, MaxMagicApt - MagicApt),
    NewMagicApt = MagicApt + RealAdd1,
    Msg = notice:format(lang:get("~ts提升了~ts点"),
                        [{string_1, apt_name(4)}, {string_2, 5, RealAdd1}]),
    notice:send(Role, 3, Msg),
    PetAttr#pet_attr{magic_aptitude = NewMagicApt};
update_use_apt(Role,
               PetAttr = #pet_attr{aspd_aptitude = AspdApt,
                                   max_aspd_aptitude = MaxAspdApt},
               5, AddApt) ->
    RealAdd = max(5, AddApt),
    RealAdd1 = min(RealAdd, MaxAspdApt - AspdApt),
    NewAspdApt = AspdApt + RealAdd1,
    Msg = notice:format(lang:get("~ts提升了~ts点"),
                        [{string_1, apt_name(5)}, {string_2, 5, RealAdd1}]),
    notice:send(Role, 3, Msg),
    PetAttr#pet_attr{aspd_aptitude = NewAspdApt};
update_use_apt(_Role, PetAttr, _, _) -> PetAttr.

check_add_max_apt(Role,
                  Pet = #pet{base_id = PetBaseId,
                             pet_attr =
                                 PetAttr = #pet_attr{max_hp_apt_used =
                                                         MaxHpAptUsed,
                                                     max_phy_apt_used =
                                                         MaxPhyAptUsed,
                                                     max_pdef_apt_used =
                                                         MaxPdefAptUsed,
                                                     max_magic_apt_used =
                                                         MaxMagicAptUsed,
                                                     max_aspd_apt_used =
                                                         MaxAspdAptUsed,
                                                     max_hp_aptitude = MaxHpApt,
                                                     max_phy_aptitude =
                                                         MaxPhyApt,
                                                     max_pdef_aptitude =
                                                         MaxPdefApt,
                                                     max_magic_aptitude =
                                                         MaxMagicApt,
                                                     max_aspd_aptitude =
                                                         MaxAspdApt}},
                  AptType) ->
    case pet_data:get_base(PetBaseId) of
        #pet_base{hp_aptitude = BaseHpApt,
                  phy_aptitude = BasePhyApt, pdef_aptitude = BasePdefApt,
                  magic_aptitude = BaseMagicApt,
                  aspd_aptitude = BaseAspdApt} ->
            {MaxApt, BaseApt, Used} = case AptType of
                                          1 ->
                                              {MaxHpApt,
                                               BaseHpApt,
                                               MaxHpAptUsed};
                                          2 ->
                                              {MaxPhyApt,
                                               BasePhyApt,
                                               MaxPhyAptUsed};
                                          3 ->
                                              {MaxPdefApt,
                                               BasePdefApt,
                                               MaxPdefAptUsed};
                                          4 ->
                                              {MaxMagicApt,
                                               BaseMagicApt,
                                               MaxMagicAptUsed};
                                          5 ->
                                              {MaxAspdApt,
                                               BaseAspdApt,
                                               MaxAspdAptUsed}
                                      end,
            case Used >= 10 of
                true ->
                    Msg = notice:format(lang:get("当前宠物的~ts已提升过~ts次, 无法再提升"),
                                        [{string_1, apt_name(AptType)},
                                         {string_2, 5, 10}]),
                    {false, Msg};
                false ->
                    case calc_add_max_apt(MaxApt, BaseApt, PetBaseId) of
                        {true, AddApt} ->
                            PetAttr1 = update_max_apt(Role,
                                                      PetAttr,
                                                      AptType,
                                                      AddApt),
                            Pet1 = Pet#pet{pet_attr = PetAttr1},
                            {true, Pet1};
                        {false, Reason} -> {false, Reason}
                    end
            end;
        _ -> {false, lang:get("找不到宠物的基础数据")}
    end.

calc_add_max_apt(MaxApt, BaseApt, PetId) ->
    Ratio = MaxApt / BaseApt * 100,
    Ratio1 = round(util:check_range(Ratio, 0, 100)),
    case pet_data:get_add_max_apt({PetId, Ratio1}) of
        AptBase when is_integer(AptBase) -> {true, AptBase};
        _ ->
            logger:error("~w:~w宠物找不到天资丸数据",
                         [PetId, Ratio1],
                         pet_aptitude,
                         280),
            {false, lang:get("当前宠物不能使用天资丸提升")}
    end.

update_max_apt(Role,
               PetAttr = #pet_attr{max_hp_apt_used = MaxHpAptUsed,
                                   max_hp_aptitude = MaxHpApt},
               1, AddApt) ->
    NewMaxHpApt = MaxHpApt + AddApt,
    Msg =
        notice:format(lang:get("~ts上限提升了~ts点, 已提升~ts/~ts次"),
                      [{string_1, apt_name(1)},
                       {string_2, 5, AddApt},
                       {string_2, 5, MaxHpAptUsed + 1},
                       {string_2, 5, 10}]),
    notice:send(Role, 3, Msg),
    PetAttr#pet_attr{max_hp_apt_used = MaxHpAptUsed + 1,
                     max_hp_aptitude = NewMaxHpApt};
update_max_apt(Role,
               PetAttr = #pet_attr{max_phy_apt_used = MaxPhyAptUsed,
                                   max_phy_aptitude = MaxPhyApt},
               2, AddApt) ->
    NewMaxPhyApt = MaxPhyApt + AddApt,
    Msg =
        notice:format(lang:get("~ts上限提升了~ts点, 已提升~ts/~ts次"),
                      [{string_1, apt_name(2)},
                       {string_2, 5, AddApt},
                       {string_2, 5, MaxPhyAptUsed + 1},
                       {string_2, 5, 10}]),
    notice:send(Role, 3, Msg),
    PetAttr#pet_attr{max_phy_apt_used = MaxPhyAptUsed + 1,
                     max_phy_aptitude = NewMaxPhyApt};
update_max_apt(Role,
               PetAttr = #pet_attr{max_pdef_apt_used = MaxPdefAptUsed,
                                   max_pdef_aptitude = MaxPdefApt},
               3, AddApt) ->
    NewMaxPdefApt = MaxPdefApt + AddApt,
    Msg =
        notice:format(lang:get("~ts上限提升了~ts点, 已提升~ts/~ts次"),
                      [{string_1, apt_name(3)},
                       {string_2, 5, AddApt},
                       {string_2, 5, MaxPdefAptUsed + 1},
                       {string_2, 5, 10}]),
    notice:send(Role, 3, Msg),
    PetAttr#pet_attr{max_pdef_apt_used = MaxPdefAptUsed + 1,
                     max_pdef_aptitude = NewMaxPdefApt};
update_max_apt(Role,
               PetAttr = #pet_attr{max_magic_apt_used =
                                       MaxMagicAptUsed,
                                   max_magic_aptitude = MaxMagicApt},
               4, AddApt) ->
    NewMaxMagicApt = MaxMagicApt + AddApt,
    Msg =
        notice:format(lang:get("~ts上限提升了~ts点, 已提升~ts/~ts次"),
                      [{string_1, apt_name(4)},
                       {string_2, 5, AddApt},
                       {string_2, 5, MaxMagicAptUsed + 1},
                       {string_2, 5, 10}]),
    notice:send(Role, 3, Msg),
    PetAttr#pet_attr{max_magic_apt_used =
                         MaxMagicAptUsed + 1,
                     max_magic_aptitude = NewMaxMagicApt};
update_max_apt(Role,
               PetAttr = #pet_attr{max_aspd_apt_used = MaxAspdAptUsed,
                                   max_aspd_aptitude = MaxAspdApt},
               5, AddApt) ->
    NewMaxAspdApt = MaxAspdApt + AddApt,
    Msg =
        notice:format(lang:get("~ts上限提升了~ts点, 已提升~ts/~ts次"),
                      [{string_1, apt_name(5)},
                       {string_2, 5, AddApt},
                       {string_2, 5, MaxAspdAptUsed + 1},
                       {string_2, 5, 10}]),
    notice:send(Role, 3, Msg),
    PetAttr#pet_attr{max_aspd_apt_used = MaxAspdAptUsed + 1,
                     max_aspd_aptitude = NewMaxAspdApt};
update_max_apt(_Role, PetAttr, _, _) -> PetAttr.

apt_name(1) -> lang:get("生命资质");
apt_name(2) -> lang:get("物攻资质");
apt_name(3) -> lang:get("物防资质");
apt_name(4) -> lang:get("法力资质");
apt_name(5) -> lang:get("速度资质").

refining_get_aptitude(_, _, [], List) -> {ok, List};
refining_get_aptitude(Role, Pet, [{_Type, Num} | Tail],
                      List)
    when Num =< 0 ->
    refining_get_aptitude(Role, Pet, Tail, List);
refining_get_aptitude(Role, Pet, [{Type, Num} | Tail],
                      ListAcc) ->
    Percent = case Num >= 1 of
                  true -> 1;
                  _ -> Num
              end,
    case refining_aptitude(Role, Pet, Type, Percent) of
        {true, Pet1, Add} ->
            OldAdd = case lists:keyfind(Type, 1, ListAcc) of
                         {_, Add0} -> Add0;
                         _ -> 0
                     end,
            refining_get_aptitude(Role,
                                  Pet1,
                                  [{Type, Num - 1} | Tail],
                                  lists:keystore(Type,
                                                 1,
                                                 ListAcc,
                                                 {Type, OldAdd + Add}));
        {false, _Reason} ->
            logger:error("宠物炼化出现错误~ts",
                         [_Reason],
                         pet_aptitude,
                         337),
            refining_get_aptitude(Role, Pet, Tail, ListAcc)
    end.

refining_add_aptitude(Role = #role{m_pet =
                                       MPet = #m_pet{pets = Pets}},
                      #pet{id = Id} = Pet, [], _Add) ->
    Pets1 = lists:keyreplace(Id, #pet.id, Pets, Pet),
    {ok, Role#role{m_pet = MPet#m_pet{pets = Pets1}}};
refining_add_aptitude(Role, Pet, [{Type, Num} | Tail],
                      Add)
    when Num =< 0 ->
    case Add > 0 of
        true ->
            Msg = notice:format(lang:get("~ts提升了~ts点"),
                                [{string_1, apt_name(Type)},
                                 {string_2, 5, Add}]),
            notice:send(Role, 7, Msg);
        _ -> skip
    end,
    refining_add_aptitude(Role, Pet, Tail, 0);
refining_add_aptitude(Role, Pet, [{Type, Num} | Tail],
                      AddAcc) ->
    Percent = case Num >= 1 of
                  true -> 1;
                  _ -> Num
              end,
    case refining_aptitude(Role, Pet, Type, Percent) of
        {true, Pet1, Add} ->
            refining_add_aptitude(Role,
                                  Pet1,
                                  [{Type, Num - 1} | Tail],
                                  AddAcc + Add);
        {false, _Reason} ->
            logger:error("宠物炼化出现错误~ts",
                         [_Reason],
                         pet_aptitude,
                         366),
            refining_add_aptitude(Role, Pet, Tail, 0)
    end.

refining_aptitude(Role,
                  Pet = #pet{base_id = PetBaseId, genre = GenreType,
                             pet_attr =
                                 PetAttr = #pet_attr{hp_aptitude = HpApt,
                                                     phy_aptitude = PhyApt,
                                                     pdef_aptitude = PdefApt,
                                                     magic_aptitude = MagicApt,
                                                     aspd_aptitude = AspdApt,
                                                     max_hp_aptitude = MaxHpApt,
                                                     max_phy_aptitude =
                                                         MaxPhyApt,
                                                     max_pdef_aptitude =
                                                         MaxPdefApt,
                                                     max_magic_aptitude =
                                                         MaxMagicApt,
                                                     max_aspd_aptitude =
                                                         MaxAspdApt}},
                  Type, Percent) ->
    case pet_data:get_base(PetBaseId) of
        #pet_base{hp_aptitude = BaseHpApt,
                  phy_aptitude = BasePhyApt, pdef_aptitude = BasePdefApt,
                  magic_aptitude = BaseMagicApt,
                  aspd_aptitude = BaseAspdApt} ->
            {Apt, MaxApt, BaseApt} = case Type of
                                         1 -> {HpApt, MaxHpApt, BaseHpApt};
                                         2 -> {PhyApt, MaxPhyApt, BasePhyApt};
                                         3 ->
                                             {PdefApt, MaxPdefApt, BasePdefApt};
                                         4 ->
                                             {MagicApt,
                                              MaxMagicApt,
                                              BaseMagicApt};
                                         5 -> {AspdApt, MaxAspdApt, BaseAspdApt}
                                     end,
            MinApt = round(BaseApt * 80 / 100 *
                               pet:genre_ratio(GenreType)),
            case Apt >= MinApt andalso
                     Apt < MaxApt andalso MaxApt > MinApt
                of
                false -> {true, Pet, 0};
                true ->
                    case calc_refining_aptitude(Apt,
                                                MaxApt,
                                                MinApt,
                                                PetBaseId)
                        of
                        {true, AddApt} ->
                            AddApt1 = round(AddApt * Percent),
                            {PetAttr1, Add} = update_refining_apt(Role,
                                                                  PetAttr,
                                                                  Type,
                                                                  AddApt1),
                            Pet1 = Pet#pet{pet_attr = PetAttr1},
                            {true, Pet1, Add};
                        {false, Reason} -> {false, Reason}
                    end
            end;
        _ -> {false, lang:get("找不到宠物的基础数据")}
    end.

use_plue_pudding(Role = #role{}, PetId, BaseId,
                 ItemId) ->
    case do_use_plue_pudding([pet_type,
                              use_max,
                              cost_item,
                              add_apt],
                             PetId,
                             BaseId,
                             ItemId,
                             Role,
                             #{})
        of
        {true, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("未知错误")}
    end.

do_use_plue_pudding([], _PetId, _BaseId, _ItemId, Role,
                    _Args) ->
    {true, Role};
do_use_plue_pudding([pet_type | Rest], PetId, BaseId,
                    ItemId, Role = #role{m_pet = #m_pet{pets = Pets}},
                    Args) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{genre = 6} -> {false, lang:get("宠物蛋不能食用汤圆")};
        #pet{genre = 3} -> {false, lang:get("野生宠物不能食用汤圆")};
        Pet = #pet{} ->
            NewArgs = Args#{pet => Pet},
            do_use_plue_pudding(Rest,
                                PetId,
                                BaseId,
                                ItemId,
                                Role,
                                NewArgs);
        _ -> {false, lang:get("宠物不存在")}
    end;
do_use_plue_pudding([use_max | Rest], PetId, BaseId,
                    ItemId, Role,
                    Args = #{pet := #pet{glue_pudding_used = Used}}) ->
    case Used >= 10 of
        true -> {false, lang:get("宠物已经食用了10个汤圆了，无法继续食用了")};
        _ ->
            do_use_plue_pudding(Rest,
                                PetId,
                                BaseId,
                                ItemId,
                                Role,
                                Args)
    end;
do_use_plue_pudding([cost_item | Rest], PetId, BaseId,
                    ItemId, Role, Args) ->
    Loss = [#loss{label = item_id, val = [{ItemId, 1}]}],
    case role_gain:do_notice(Loss, Role) of
        {ok, NewRole} ->
            do_use_plue_pudding(Rest,
                                PetId,
                                BaseId,
                                ItemId,
                                NewRole,
                                Args);
        {false, #loss{msg = Msg}} -> {false, Msg};
        _ -> {false, lang:get("道具不足")}
    end;
do_use_plue_pudding([add_apt | Rest], PetId, BaseId,
                    ItemId,
                    Role = #role{m_pet = MPet = #m_pet{pets = Pets}},
                    Args) ->
    case item:attr(effect, BaseId) of
        [{63, {AptType, _Value}}] ->
            case lists:keyfind(PetId, #pet.id, Pets) of
                Pet = #pet{base_id = PetBaseId,
                           pet_attr =
                               #pet_attr{max_hp_aptitude = MaxHpApt,
                                         max_phy_aptitude = MaxPhyApt,
                                         max_pdef_aptitude = MaxPdefApt,
                                         max_magic_aptitude = MaxMagicApt,
                                         max_aspd_aptitude = MaxAspdApt}} ->
                    case pet_data:get_base(PetBaseId) of
                        #pet_base{hp_aptitude = BaseHpApt,
                                  phy_aptitude = BasePhyApt,
                                  pdef_aptitude = BasePdefApt,
                                  magic_aptitude = BaseMagicApt,
                                  aspd_aptitude = BaseAspdApt} ->
                            {MaxApt, BaseApt} = case AptType of
                                                    1 -> {MaxHpApt, BaseHpApt};
                                                    2 ->
                                                        {MaxPhyApt, BasePhyApt};
                                                    3 ->
                                                        {MaxPdefApt,
                                                         BasePdefApt};
                                                    4 ->
                                                        {MaxMagicApt,
                                                         BaseMagicApt};
                                                    5 ->
                                                        {MaxAspdApt,
                                                         BaseAspdApt}
                                                end,
                            case calc_add_max_apt(MaxApt, BaseApt, PetBaseId) of
                                {true, AddApt} ->
                                    NewPet = update_apt_plue_pudding(Role,
                                                                     Pet,
                                                                     AptType,
                                                                     AddApt),
                                    NewPets = lists:keystore(PetId,
                                                             #pet.id,
                                                             Pets,
                                                             NewPet),
                                    NewRole = Role#role{m_pet =
                                                            MPet#m_pet{pets =
                                                                           NewPets}},
                                    pet:push_10503(NewRole, NewPet),
                                    do_use_plue_pudding(Rest,
                                                        PetId,
                                                        BaseId,
                                                        ItemId,
                                                        NewRole,
                                                        Args);
                                {false, Reason} -> {false, Reason}
                            end;
                        _ -> {false, lang:get("找不到宠物的基础数据")}
                    end;
                _ -> {false, lang:get("不存在的宠物")}
            end;
        _ -> {reply, {0, lang:get("错误的道具类型")}}
    end;
do_use_plue_pudding(_Check, _PetId, _BaseId, _ItemId,
                    _Role, _Args) ->
    logger:error("未处理的汤圆使用:~w",
                 [{_Check, _PetId, _BaseId, _ItemId}],
                 pet_aptitude,
                 478),
    false.

calc_refining_aptitude(Apt, MaxApt, MinApt, PetId) ->
    Ratio = (Apt - MinApt) / (MaxApt - MinApt) * 100,
    Ratio1 = round(util:check_range(Ratio, 0, 100)),
    case pet_data:get_add_apt({PetId, Ratio1}) of
        {AptRatio, AptBase} ->
            BaseAdd = round((MaxApt - MinApt) * AptRatio / 100 +
                                AptBase),
            logger:debug("计算资质 ~w",
                         [{BaseAdd,
                           min(MaxApt - Apt, BaseAdd),
                           MaxApt,
                           MinApt,
                           AptRatio,
                           AptBase}],
                         pet_aptitude,
                         489),
            case BaseAdd > 0 of
                true -> {true, min(MaxApt - Apt, BaseAdd)};
                false -> {false, lang:get("找不到资质数值")}
            end;
        _ -> {false, lang:get("当前宠物不能炼化")}
    end.

update_refining_apt(_Role,
                    PetAttr = #pet_attr{hp_aptitude = HpApt,
                                        max_hp_aptitude = MaxHpApt},
                    1, AddApt) ->
    RealAdd = max(5, AddApt),
    RealAdd1 = min(RealAdd, MaxHpApt - HpApt),
    NewHpApt = HpApt + RealAdd1,
    {PetAttr#pet_attr{hp_aptitude = NewHpApt}, RealAdd1};
update_refining_apt(_Role,
                    PetAttr = #pet_attr{phy_aptitude = PhyApt,
                                        max_phy_aptitude = MaxPhyApt},
                    2, AddApt) ->
    RealAdd = max(5, AddApt),
    RealAdd1 = min(RealAdd, MaxPhyApt - PhyApt),
    NewPhyApt = PhyApt + RealAdd1,
    {PetAttr#pet_attr{phy_aptitude = NewPhyApt}, RealAdd1};
update_refining_apt(_Role,
                    PetAttr = #pet_attr{pdef_aptitude = PdefApt,
                                        max_pdef_aptitude = MaxPdefApt},
                    3, AddApt) ->
    RealAdd = max(5, AddApt),
    RealAdd1 = min(RealAdd, MaxPdefApt - PdefApt),
    NewPdefApt = PdefApt + RealAdd1,
    {PetAttr#pet_attr{pdef_aptitude = NewPdefApt},
     RealAdd1};
update_refining_apt(_Role,
                    PetAttr = #pet_attr{magic_aptitude = MagicApt,
                                        max_magic_aptitude = MaxMagicApt},
                    4, AddApt) ->
    RealAdd = max(5, AddApt),
    RealAdd1 = min(RealAdd, MaxMagicApt - MagicApt),
    NewMagicApt = MagicApt + RealAdd1,
    {PetAttr#pet_attr{magic_aptitude = NewMagicApt},
     RealAdd1};
update_refining_apt(_Role,
                    PetAttr = #pet_attr{aspd_aptitude = AspdApt,
                                        max_aspd_aptitude = MaxAspdApt},
                    5, AddApt) ->
    RealAdd = max(5, AddApt),
    RealAdd1 = min(RealAdd, MaxAspdApt - AspdApt),
    NewAspdApt = AspdApt + RealAdd1,
    {PetAttr#pet_attr{aspd_aptitude = NewAspdApt},
     RealAdd1};
update_refining_apt(_Role, PetAttr, _, _) ->
    {PetAttr, 0}.

update_apt_plue_pudding(Role,
                        Pet = #pet{glue_pudding_used = GluePuddingUsed,
                                   pet_attr =
                                       PetAttr = #pet_attr{max_hp_aptitude =
                                                               MaxHpApt}},
                        1, AddApt) ->
    NewMaxHpApt = MaxHpApt + AddApt,
    Msg =
        notice:format(lang:get("~ts上限提升了~ts点, 已经食用~ts/~ts个汤圆"),
                      [{string_1, apt_name(1)},
                       {string_2, 5, AddApt},
                       {string_2, 5, GluePuddingUsed + 1},
                       {string_2, 5, 10}]),
    notice:send(Role, 3, Msg),
    Pet#pet{glue_pudding_used = GluePuddingUsed + 1,
            pet_attr =
                PetAttr#pet_attr{max_hp_aptitude = NewMaxHpApt}};
update_apt_plue_pudding(Role,
                        Pet = #pet{glue_pudding_used = GluePuddingUsed,
                                   pet_attr =
                                       PetAttr = #pet_attr{max_phy_aptitude =
                                                               MaxPhyApt}},
                        2, AddApt) ->
    NewMaxPhyApt = MaxPhyApt + AddApt,
    Msg =
        notice:format(lang:get("~ts上限提升了~ts点, 已经食用~ts/~ts个汤圆"),
                      [{string_1, apt_name(2)},
                       {string_2, 5, AddApt},
                       {string_2, 5, GluePuddingUsed + 1},
                       {string_2, 5, 10}]),
    notice:send(Role, 3, Msg),
    Pet#pet{glue_pudding_used = GluePuddingUsed + 1,
            pet_attr =
                PetAttr#pet_attr{max_phy_aptitude = NewMaxPhyApt}};
update_apt_plue_pudding(Role,
                        Pet = #pet{glue_pudding_used = GluePuddingUsed,
                                   pet_attr =
                                       PetAttr = #pet_attr{max_pdef_aptitude =
                                                               MaxPdefApt}},
                        3, AddApt) ->
    NewMaxPdefApt = MaxPdefApt + AddApt,
    Msg =
        notice:format(lang:get("~ts上限提升了~ts点, 已经食用~ts/~ts个汤圆"),
                      [{string_1, apt_name(3)},
                       {string_2, 5, AddApt},
                       {string_2, 5, GluePuddingUsed + 1},
                       {string_2, 5, 10}]),
    notice:send(Role, 3, Msg),
    Pet#pet{glue_pudding_used = GluePuddingUsed + 1,
            pet_attr =
                PetAttr#pet_attr{max_pdef_aptitude = NewMaxPdefApt}};
update_apt_plue_pudding(Role,
                        Pet = #pet{glue_pudding_used = GluePuddingUsed,
                                   pet_attr =
                                       PetAttr = #pet_attr{max_magic_aptitude =
                                                               MaxMagicApt}},
                        4, AddApt) ->
    NewMaxMagicApt = MaxMagicApt + AddApt,
    Msg =
        notice:format(lang:get("~ts上限提升了~ts点, 已经食用~ts/~ts个汤圆"),
                      [{string_1, apt_name(4)},
                       {string_2, 5, AddApt},
                       {string_2, 5, GluePuddingUsed + 1},
                       {string_2, 5, 10}]),
    notice:send(Role, 3, Msg),
    Pet#pet{glue_pudding_used = GluePuddingUsed + 1,
            pet_attr =
                PetAttr#pet_attr{max_magic_aptitude = NewMaxMagicApt}};
update_apt_plue_pudding(Role,
                        Pet = #pet{glue_pudding_used = GluePuddingUsed,
                                   pet_attr =
                                       PetAttr = #pet_attr{max_aspd_aptitude =
                                                               MaxAspdApt}},
                        5, AddApt) ->
    NewMaxAspdApt = MaxAspdApt + AddApt,
    Msg =
        notice:format(lang:get("~ts上限提升了~ts点, 已经食用~ts/~ts个汤圆"),
                      [{string_1, apt_name(5)},
                       {string_2, 5, AddApt},
                       {string_2, 5, GluePuddingUsed + 1},
                       {string_2, 5, 10}]),
    notice:send(Role, 3, Msg),
    Pet#pet{glue_pudding_used = GluePuddingUsed + 1,
            pet_attr =
                PetAttr#pet_attr{max_aspd_aptitude = NewMaxAspdApt}};
update_apt_plue_pudding(_Role, Pet, _, _) -> Pet.

