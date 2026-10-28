-file("src/mod/pet/pet_egg.erl", 1).

-module(pet_egg).

-author("Lith").

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

-file("src/mod/pet/pet_egg.erl", 13).

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

-file("src/mod/pet/pet_egg.erl", 14).

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

-file("src/mod/pet/pet_egg.erl", 15).

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

-file("src/mod/pet/pet_egg.erl", 16).

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

-file("src/mod/pet/pet_egg.erl", 17).

-file("inc/time.hrl", 1).

-author("Lith").

-file("src/mod/pet/pet_egg.erl", 18).

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

-file("src/mod/pet/pet_egg.erl", 19).

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

-file("src/mod/pet/pet_egg.erl", 20).

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

-file("src/mod/pet/pet_egg.erl", 21).

-file("inc/camp_pet_egg.hrl", 1).

-author("Lith").

-file("src/mod/pet/pet_egg.erl", 22).

-export([get_camp_pet_egg/1,
         incubate_pet_egg/1,
         upgrade_pet_egg/1,
         hook_lv_up/2,
         hook_grade_up/2]).

-export([update_camp_log/4,
         broadcast/3,
         gm_reset_limit/0,
         gm_set_incubate_num/1,
         apply_repair_multi_grade/1,
         repair_multi_grade/0]).

-compile(export_all).

get_camp_pet_egg(Role) ->
    case check_get_camp_pet_egg([camp_start,
                                 pet_full,
                                 already_get_today,
                                 already_have],
                                Role)
        of
        ok -> do_get_camp_pet_egg(Role);
        {error, Msg} -> do_get_camp_pet_egg_error(Role, Msg)
    end.

incubate_pet_egg(Role) ->
    case check_incubate_pet_egg([camp_start,
                                 bag_full,
                                 lv_limit,
                                 evolve],
                                Role)
        of
        ok -> do_incubate_pet_egg(Role);
        {error, Msg} -> do_incubate_pet_egg_error(Role, Msg)
    end.

upgrade_pet_egg(Role) ->
    case check_upgrade_pet_egg([is_grade, lv_limit], Role)
        of
        ok -> do_upgrade_pet_egg(Role);
        {error, Msg} -> do_upgrade_pet_egg_error(Role, Msg)
    end.

hook_lv_up(Role, #pet{base_id = 20013, lev = Lv}) ->
    [#{incubate_lv := IncubateLv, mail_title := MailTitle,
       mail_content := Content}] =
        camp_pet_egg_data:get_extra_cfg(),
    case Lv >= IncubateLv of
        true ->
            mail:send(Role,
                      #{title => lang:get(MailTitle),
                        content => lang:get(Content), items => []}),
            notice:send(Role,
                        3,
                        lang:get("您的鸿福兔纸已经达到30级可以进化了，快去看看吧~{face_1,38}"));
        _ -> {ok, Role}
    end;
hook_lv_up(Role, _Pet) -> {ok, Role}.

hook_grade_up(Role,
              #pet{base_id = 20013, grade = Grade})
    when Grade >= 1 ->
    [#{mail_title2 := MailTitle,
       mail_content2 := Content}] =
        camp_pet_egg_data:get_extra_cfg(),
    mail:send(Role,
              #{title => lang:get(MailTitle),
                content => lang:get(Content), items => []}),
    notice:send(Role,
                3,
                lang:get("您的鸿福兔纸可以开启了，快去看看吧~{face_1,38}")),
    {ok, Role};
hook_grade_up(Role, _) -> {ok, Role}.

do_get_camp_pet_egg(Role) ->
    BaseID = 20013,
    case pet:create(Role,
                    #{base_id => BaseID, from => "鸿福兔纸活动"})
        of
        {ok, Role2} ->
            Role3 = var:set_var(Role2, day, 624, 1),
            camp_pet_egg:pet_egg_state(Role3),
            role:pack_send(Role3, 10569, {1, ""}),
            {ok, Role3};
        {false, _Msg} ->
            do_get_camp_pet_egg_error(Role, lang:get(_Msg))
    end.

do_get_camp_pet_egg_error(Role, ErrMsg) ->
    role:pack_send(Role, 10569, {0, ErrMsg}),
    {ok, Role}.

do_upgrade_pet_egg(#role{m_pet =
                             #m_pet{pets = Pets} = MPet} =
                       Role) ->
    {ok, #pet{grade = Grade, id = ID} = Pet} =
        pet:find_pet_by_base_id(20013, Role),
    #pet_base{name = Name2} = pet_data:get_base(20014),
    NewPet = Pet#pet{grade = Grade + 1, name = Name2},
    NewPets = lists:keystore(ID, #pet.id, Pets, NewPet),
    Role1 = Role#role{m_pet = MPet#m_pet{pets = NewPets}},
    hook_grade_up(Role1, NewPet),
    pet:push_10502(Role1, NewPet),
    pet:push_10503(Role1, NewPet),
    pet:push_10511(Role1, NewPet),
    pet:push_10512(Role1, NewPet),
    role:pack_send(Role1, 10571, {1, ""}),
    {ok, Role1}.

do_upgrade_pet_egg_error(Role, ErrMsg) ->
    role:pack_send(Role, 10571, {0, ErrMsg}),
    {ok, Role}.

do_incubate_pet_egg(Role) ->
    case pet:find_pet_by_base_id(20013, Role) of
        {ok, #pet{id = ID}} ->
            RoleT = case pet:rest(Role, ID) of
                        {ok, RoleT2} -> RoleT2;
                        _ -> Role
                    end,
            case pet:del_pet(by_id, ID, RoleT) of
                {ok, Role2} ->
                    case random_reward(Role2) of
                        {false, Reason} ->
                            do_incubate_pet_egg_error(Role, Reason);
                        {RewardType, ItemID, Bind, Num, BC, LimitGroup, Rank} ->
                            logger:debug("奖励 :~w",
                                         [{RewardType,
                                           ItemID,
                                           Bind,
                                           Num,
                                           BC,
                                           LimitGroup,
                                           Rank}],
                                         pet_egg,
                                         156),
                            {Role3, FinalPetID, LogItemID, FinalRewardList} =
                                send_reward(RewardType,
                                            ItemID,
                                            Bind,
                                            Num,
                                            BC,
                                            Role2),
                            update_limit_group(LimitGroup),
                            update_camp_log(Role3, LogItemID, Num, Rank),
                            camp_pet_egg:pet_egg_state(Role3),
                            role:pack_send(Role3,
                                           10570,
                                           {1,
                                            "",
                                            FinalPetID,
                                            FinalRewardList}),
                            {ok, Role3};
                        _ ->
                            Msg =
                                notice:format(lang:get("正在开启的人数太多，~ts秒后再来尝试吧{face_1,3}"),
                                              [{string_2, 5, 5}]),
                            do_incubate_pet_egg_error(Role, Msg)
                    end;
                {false, Reason} ->
                    do_incubate_pet_egg_error(Role, Reason)
            end;
        {false, Reason} ->
            do_incubate_pet_egg_error(Role, Reason)
    end.

do_incubate_pet_egg_error(Role, Msg) ->
    role:pack_send(Role, 10570, {0, Msg, 0, []}),
    pet_util:push_client_pets(Role),
    {ok, Role}.

random_reward(Role) ->
    case filter_reward(Role) of
        {false, Reason} -> {false, Reason};
        Reward ->
            {_Weight,
             RewardType,
             _ID,
             ItemID,
             Bind,
             Num,
             BC,
             LimitGroup,
             Rank} =
                util:rand_list(Reward, 1),
            {RewardType, ItemID, Bind, Num, BC, LimitGroup, Rank}
    end.

broadcast(#role{name = Name} = _Role, Gain, 1) ->
    Content =
        "运气爆棚！<color='#13FC60'>~ts</color>在开启瑞兔送福时获得了~"
        "ts大家纷纷投来羡慕的眼光{face_1,36}",
    Content2 = util:flist(lang:get(Content), [Name, "~ts"]),
    Content3 = notice:format(Content2, [{item_2, Gain}]),
    notice:cast(all, 5, lang:get(Content3));
broadcast(#role{id = ID, name = Name} = _Role, ItemID,
          2) ->
    Content =
        "好运降临，<color='#13FC60'>~ts</color>服的<color='#f"
        "fff00'>~ts</color>开启瑞兔送福时获得了~ts！大家一起来祝贺他吧{fac"
        "e_1,18}",
    Content2 = util:flist(lang:get(Content),
                          [get_server_name(ID), Name, "~ts"]),
    Content3 = notice:format(Content2, [{item_2, ItemID}]),
    big_world:cast(all, notice, effect, [all, 30249]),
    big_world:cast(all,
                   notice,
                   cast,
                   [all, 10, lang:get(Content3)]),
    big_world:cast(all,
                   notice,
                   cast,
                   [all, 11, lang:get(Content3)]);
broadcast(_, _, _) -> ok.

update_limit_group(Group) ->
    update_counter({camp_pet_egg:get_camp_id(),
                    camp_pet_egg:get_camp_day(),
                    limit_num,
                    Group},
                   1),
    LimitList = camp_pet_egg_data:get_limit_num(),
    [update_counter({camp_pet_egg:get_camp_id(),
                     camp_pet_egg:get_camp_day(),
                     limit_num,
                     GroupT},
                    -1)
     || {GroupT, _} <- LimitList].

update_camp_log(#role{name = Name,
                      id = {RoleID, PF, ZoneID} = ID, sex = Sex,
                      classes = Classes} =
                    _Role,
                ItemID, Num, Rank) ->
    case camp_pet_egg_data:get_extra_cfg() of
        [#{lucky_item := LuckyItem}] ->
            case lists:member(ItemID, LuckyItem) of
                true ->
                    LogInfo = {Name,
                               get_server_name(ID),
                               RoleID,
                               PF,
                               ZoneID,
                               Sex,
                               Classes,
                               date:unixtime2(),
                               ItemID,
                               Num,
                               Rank},
                    big_world:cast(c_camp_pet_egg,
                                   info,
                                   [{{log, camp_pet_egg:get_camp_id()},
                                     LogInfo}]);
                false -> ok
            end;
        _ -> ok
    end.

send_reward(RewardType, ItemID, Bind, Num, BC, Role) ->
    case RewardType of
        1 ->
            GainList = [{ItemID, Bind, Num}],
            GainList2 = format:val_to_gain(GainList),
            ItemID2 = case GainList2 of
                          [#gain{val = [{ItemIDT, _, _}]}] -> ItemIDT;
                          _ -> ItemID
                      end,
            GainList3 = [{ItemID2, Bind, Num}],
            broadcast(Role, GainList3, BC),
            case role_gain:do_notice(GainList2, Role) of
                {ok, Role2} -> {Role2, 0, ItemID2, GainList3};
                _Err ->
                    mail:send(Role,
                              #{title => lang:get("鸿福兔纸活动"), items => GainList,
                                content =>
                                    lang:get("由于您的背包已满，奖励通过邮件下发给您，请查收")}),
                    {Role, 0, ItemID2, GainList3}
            end;
        _ ->
            {ok, Role2} = pet:create(Role,
                                     #{base_id => ItemID, from => "鸿福兔纸活动"}),
            {Role2, ItemID, ItemID, []}
    end.

filter_reward(Role = #role{lev = Lev}) when Lev < 80 ->
    logger:debug("小雨80级=======", [], pet_egg, 257),
    case update_counter({camp_pet_egg:get_camp_id(),
                         camp_pet_egg:get_camp_day(),
                         incubate_num},
                        1)
        of
        IncubateNum when is_integer(IncubateNum) ->
            logger:debug("技术=======:~w",
                         [IncubateNum],
                         pet_egg,
                         260),
            LimitList = camp_pet_egg_data:get_limit_num(),
            case need_filter_list_by_limit(LimitList, []) of
                {false, Reason} -> {false, Reason};
                FlooredGroup ->
                    logger:debug("=======:=:~w",
                                 [FlooredGroup],
                                 pet_egg,
                                 265),
                    AllGroup = camp_pet_egg_data:get_all_group(),
                    IDList = filter_reward2(IncubateNum, AllGroup),
                    FilterGroup = [GroupId
                                   || {GroupId, DoneCount, MaxCount}
                                          <- FlooredGroup,
                                      DoneCount > MaxCount],
                    filter_reward3(Role, IDList, FilterGroup, [])
            end;
        _ ->
            Msg =
                notice:format(lang:get("正在开启的人数太多，~ts秒后再来尝试吧{face_1,3}"),
                              [{string_2, 5, 5}]),
            {false, Msg}
    end;
filter_reward(Role) ->
    case update_counter({camp_pet_egg:get_camp_id(),
                         camp_pet_egg:get_camp_day(),
                         incubate_num},
                        1)
        of
        IncubateNum when is_integer(IncubateNum) ->
            [#{floored := Floored}] =
                camp_pet_egg_data:get_extra_cfg(),
            LimitList = camp_pet_egg_data:get_limit_num(),
            case need_filter_list_by_limit(LimitList, []) of
                {false, Reason} -> {false, Reason};
                FlooredGroup ->
                    case check_floored_is_limit(IncubateNum,
                                                Floored,
                                                FlooredGroup)
                        of
                        true ->
                            AllGroup = camp_pet_egg_data:get_all_group(),
                            IDList = filter_reward2(IncubateNum, AllGroup),
                            FilterGroup = [GroupId
                                           || {GroupId, DoneCount, MaxCount}
                                                  <- FlooredGroup,
                                              DoneCount > MaxCount],
                            filter_reward3(Role, IDList, FilterGroup, []);
                        {false, ID} ->
                            #{weight := Weight, reward_type := RewardType,
                              item_id := ItemID, bind := Bind, num := Num,
                              broad_cast := BC, rank := Rank,
                              limit_group := LimitGroup} =
                                camp_pet_egg_data:get_reward_by_id(ID),
                            [{Weight,
                              RewardType,
                              ID,
                              ItemID,
                              Bind,
                              Num,
                              BC,
                              LimitGroup,
                              Rank}]
                    end
            end;
        _ ->
            Msg =
                notice:format(lang:get("正在开启的人数太多，~ts秒后再来尝试吧{face_1,3}"),
                              [{string_2, 5, 5}]),
            {false, Msg}
    end.

filter_reward2(IncubateNum,
               [{_, MinNum, MaxNum, IDList} | _])
    when IncubateNum >= MinNum andalso
             IncubateNum =< MaxNum ->
    IDList;
filter_reward2(IncubateNum, [_ | Rest]) ->
    filter_reward2(IncubateNum, Rest).

filter_reward3(_Role, [], _FilterGroup, Result) ->
    Result;
filter_reward3(#role{lev = Lv, sex = Sex,
                     classes = Classes} =
                   Role,
               [ID | Rest], FilterGroup, Result) ->
    case camp_pet_egg_data:get_reward_by_id(ID) of
        #{limit_group := LimitGroup, min_lv := MinLv,
          max_lv := MaxLv, sex := SexT, classes := ClassesT,
          min_break := MinBreak, max_break := MaxBreak} =
            Reward ->
            BreakTimes = lev_break:get_times(Role),
            case (Lv >= MinLv andalso Lv =< MaxLv orelse
                      MinLv =:= 0 andalso MaxLv =:= 0)
                     andalso
                     (BreakTimes >= MinBreak andalso BreakTimes =< MaxBreak)
                         andalso
                         (Sex =:= SexT orelse SexT =:= 2) andalso
                             (ClassesT =:= Classes orelse ClassesT =:= 0)
                                 andalso
                                 not lists:member(LimitGroup, FilterGroup)
                of
                true ->
                    #{weight := Weight, reward_type := RewardType,
                      item_id := ItemID, bind := Bind, num := Num,
                      rank := Rank, broad_cast := BC} =
                        Reward,
                    filter_reward3(Role,
                                   Rest,
                                   FilterGroup,
                                   [{Weight,
                                     RewardType,
                                     ID,
                                     ItemID,
                                     Bind,
                                     Num,
                                     BC,
                                     LimitGroup,
                                     Rank}
                                    | Result]);
                _ -> filter_reward3(Role, Rest, FilterGroup, Result)
            end;
        _ -> filter_reward3(Role, Rest, FilterGroup, Result)
    end.

need_filter_list_by_limit([], Result) -> Result;
need_filter_list_by_limit([{GroupID, LimitNum} | Rest],
                          Result) ->
    case update_counter({camp_pet_egg:get_camp_id(),
                         camp_pet_egg:get_camp_day(),
                         limit_num,
                         GroupID},
                        1)
        of
        LimitNumT when is_integer(LimitNumT) ->
            need_filter_list_by_limit(Rest,
                                      [{GroupID, LimitNumT, LimitNum}
                                       | Result]);
        _ ->
            Msg =
                notice:format(lang:get("正在开启的人数太多，~ts秒后再来尝试吧{face_1,3}"),
                              [{string_2, 5, 5}]),
            {false, Msg}
    end.

get_server_name({_Id, Platform, ZoneId}) ->
    case server_list_data:get_server_name({Platform,
                                           ZoneId})
        of
        false -> lang:get("神秘大陆");
        ServerName -> ServerName
    end.

check_floored_is_limit(_IncubateNum, [],
                       _FilterGroup) ->
    true;
check_floored_is_limit(IncubateNum,
                       [{LimitNum, ID} | Rest], FilterGroup)
    when IncubateNum >= LimitNum ->
    case camp_pet_egg_data:get_reward_by_id(ID) of
        #{limit_group := LimitGroup} ->
            case lists:keyfind(LimitGroup, 1, FilterGroup) of
                {_, DoneCount, MaxCount} when DoneCount > 1 ->
                    NewFilterGroup = lists:keystore(LimitGroup,
                                                    1,
                                                    FilterGroup,
                                                    {LimitGroup,
                                                     DoneCount - 1,
                                                     MaxCount - 1}),
                    check_floored_is_limit(IncubateNum,
                                           Rest,
                                           NewFilterGroup);
                {_, DoneCount, MaxCount}
                    when DoneCount =:= 1 andalso MaxCount >= 1 ->
                    {false, ID};
                _ -> true
            end;
        _ -> {false, ID}
    end;
check_floored_is_limit(_IncubateNum, [_ | _Rest],
                       _FilterGroup) ->
    true.

check_upgrade_pet_egg([], _Role) -> ok;
check_upgrade_pet_egg([is_grade | Rest], Role) ->
    case pet:find_pet_by_base_id(20013, Role) of
        {ok, #pet{grade = Grade}} when Grade >= 1 ->
            {error, lang:get("您已经进化了鸿福兔纸，请等待开启吧")};
        {ok, #pet{}} -> check_upgrade_pet_egg(Rest, Role);
        _ -> {error, lang:get("请先领养鸿福兔纸")}
    end;
check_upgrade_pet_egg([lv_limit | Rest], Role) ->
    case pet:find_pet_by_base_id(20013, Role) of
        {ok, #pet{lev = Lv}} ->
            [#{incubate_lv := IncubateLv}] =
                camp_pet_egg_data:get_extra_cfg(),
            case Lv >= IncubateLv of
                true -> check_upgrade_pet_egg(Rest, Role);
                _ -> {error, lang:get("等级不足，无法进化")}
            end;
        _ -> {error, lang:get("请先领养鸿福兔纸")}
    end.

check_incubate_pet_egg([], _Role) -> ok;
check_incubate_pet_egg([bag_full | Rest], Role) ->
    case package:check_is_full(bag, Role) of
        true -> {error, lang:get("背包已满，请整理后再打开哟~{face_1,9}")};
        _ -> check_incubate_pet_egg(Rest, Role)
    end;
check_incubate_pet_egg([evolve | Rest], Role) ->
    case pet:find_pet_by_base_id(20013, Role) of
        {ok, #pet{grade = Grade}} when Grade >= 1 ->
            check_get_camp_pet_egg(Rest, Role);
        _ -> {error, lang:get("请先进化后再次领取")}
    end;
check_incubate_pet_egg([camp_start | Rest], Role) ->
    case camp_pet_egg:check_camp_start(86400) of
        true -> check_incubate_pet_egg(Rest, Role);
        _Msg -> _Msg
    end;
check_incubate_pet_egg([incubate_time | Rest], Role) ->
    [#{time := [{H, M, S, H2, M2, S2}]}] =
        camp_pet_egg_data:get_extra_cfg(),
    Date = erlang:date(),
    Time = {Date, {H, M, S}},
    Time2 = {Date, {H2, M2, S2}},
    Now = date:unixtime2(),
    case Now >= date:datetime_to_seconds(Time) andalso
             Now =< date:datetime_to_seconds(Time2)
        of
        true -> check_incubate_pet_egg(Rest, Role);
        _ ->
            {error,
             lang:get("在活动期间，每日<color='#ffff00'>21：00-23：00</color>方"
                      "可前往进行开启")}
    end;
check_incubate_pet_egg([lv_limit | Rest], Role) ->
    [#{incubate_lv := IncubateLv}] =
        camp_pet_egg_data:get_extra_cfg(),
    case pet:find_pet_by_base_id(20013, Role) of
        {ok, #pet{lev = Lv}} ->
            case Lv >= IncubateLv of
                true -> check_incubate_pet_egg(Rest, Role);
                false -> {error, lang:get("当前鸿福兔纸等级还不足30级，尚未可以打开")}
            end;
        _ -> {error, lang:get("请先领养鸿福兔纸")}
    end.

check_get_camp_pet_egg([], _Role) -> ok;
check_get_camp_pet_egg([camp_start | Rest], Role) ->
    case camp_pet_egg:check_camp_start(0) of
        true -> check_get_camp_pet_egg(Rest, Role);
        _Msg -> _Msg
    end;
check_get_camp_pet_egg([pet_full | Rest], Role) ->
    case pet:check_nums(Role) of
        true -> check_get_camp_pet_egg(Rest, Role);
        _ -> {error, lang:get("当前宠物栏已满，请整理后再进行领取")}
    end;
check_get_camp_pet_egg([already_get_today | Rest],
                       Role) ->
    case var:get_var(Role, day, 624, 0) of
        0 -> check_get_camp_pet_egg(Rest, Role);
        _ -> {error, lang:get("每日只可领取一个")}
    end;
check_get_camp_pet_egg([already_have | Rest], Role) ->
    case pet:find_pet_by_base_id(20013, Role) of
        {ok, _Pet} -> {error, lang:get("请先开启携带的鸿福兔纸后再来领取")};
        _ -> check_get_camp_pet_egg(Rest, Role)
    end.

update_counter(Key, Add) ->
    case big_world:call(c_camp_pet_egg,
                        call,
                        [{update_counter, Key, Add}])
        of
        Int when is_integer(Int) -> Int;
        _Err ->
            logger:error("请求央服计数器时失败:~w: {Key:~w, Val:~w}",
                         [_Err, Key, Add],
                         pet_egg,
                         499),
            _Err
    end.

set_counter(Key, Num) ->
    big_world:call(c_camp_pet_egg,
                   call,
                   [{set_counter, Key, Num}]).

gm_reset_limit() ->
    LimitList = camp_pet_egg_data:get_limit_num(),
    [set_counter({camp_pet_egg:get_camp_id(),
                  camp_pet_egg:get_camp_day(),
                  limit_num,
                  GroupT},
                 0)
     || {GroupT, _} <- LimitList].

gm_set_incubate_num(Num) ->
    set_counter({camp_pet_egg:get_camp_id(),
                 camp_pet_egg:get_camp_day(),
                 incubate_num},
                Num).

repair_multi_grade() ->
    role_group:apply(world,
                     {pet_egg, apply_repair_multi_grade, []}).

apply_repair_multi_grade(Role = #role{m_pet =
                                          MPet = #m_pet{pets = Pets}}) ->
    case pet:find_pet_by_base_id(20013, Role) of
        {ok, Pet = #pet{id = PetId, grade = Grade}}
            when Grade > 1 ->
            NewPet = Pet#pet{grade = 1},
            NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
            NewRole = Role#role{m_pet = MPet#m_pet{pets = NewPets}},
            pet:push_10512(NewRole, NewPet),
            {ok, NewRole};
        _ -> ok
    end.

