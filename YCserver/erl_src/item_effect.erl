-file("src/mod/item/item_effect.erl", 1).

-module(item_effect).

-export([do/3, msg/3]).

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

-file("src/mod/item/item_effect.erl", 15).

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

-file("src/mod/item/item_effect.erl", 16).

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

-file("src/mod/item/item_effect.erl", 17).

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

-file("src/mod/item/item_effect.erl", 18).

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

-file("src/mod/item/item_effect.erl", 19).

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

-file("src/mod/item/item_effect.erl", 20).

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

-file("src/mod/item/item_effect.erl", 21).

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

-file("src/mod/item/item_effect.erl", 22).

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

-file("src/mod/item/item_effect.erl", 23).

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

-file("src/mod/item/item_effect.erl", 24).

-file("inc/wedding.hrl", 1).

-record(m_wedding,
        {ver = 1,
         lover_id = {0, "", 0},
         lover_name = "",
         status = 0,
         honor_ids = [],
         reward = [],
         mail = []}).

-record(lover,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         lover_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         lover_name = "" :: bitstring(),
         type = 1 :: 1..2,
         status = 1 :: 0..2,
         ring_lev = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         order_index = 0 :: non_neg_integer(),
         order_time = 0 :: non_neg_integer(),
         atmosp = 0 :: non_neg_integer(),
         index = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lover_sex = 2 :: 0..2,
         lover_classes = 0,
         lover_lev = 0,
         lover_fc = 0,
         lover_pet_fc = 0,
         lover_face = 0}).

-record(guest,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid = 0 :: 0 | pid(),
         act_list = [],
         unit_list = [],
         classes = 0,
         sex = 0,
         lev = 0,
         face = 0}).

-record(wedding_atmosp_data,
        {type = 0 :: non_neg_integer(),
         min_val = 0 :: non_neg_integer(),
         max_val = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         scene_reward = [] :: list(),
         scene_msg = "" :: string(),
         male_reward = [] :: list(),
         famale_reward = [] :: list(),
         title = "" :: string(),
         content = "" :: string()}).

-record(wedding_act_data,
        {id = 0,
         type = 0,
         target = 1,
         free_num = 0,
         max_num = 0,
         cost = [],
         msg = "",
         log_msg = "",
         atmosp = 0,
         gain = [],
         main_gain = [],
         effect_type = 0,
         effect_id = 1,
         effect_num = 1,
         cd = 0}).

-record(wedding_rank, {type = 0, list = []}).

-record(wedding_rank_rc,
        {id = {{0, "", 0}, {0, "", 0}},
         male_id = {0, "", 0},
         male_name = "",
         rank = 1,
         time = 0 :: non_neg_integer(),
         male_sex = 0 :: 0..2,
         male_classes = 0 :: 0..4,
         male_lev = 0 :: non_neg_integer(),
         female_id = {0, "", 0},
         female_name = "",
         female_sex = 0 :: 0..2,
         female_classes = 0 :: 0..4,
         female_lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(wedding_rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys =
             [#wedding_rank_rc.val3,
              #wedding_rank_rc.val2,
              #wedding_rank_rc.val1]
             :: [pos_integer()],
         min_val = 1 :: pos_integer()}).

-record(wedding_unit_data,
        {id = 0, target = 0, rand = [], limit = 0}).

-record(wedding_rank_honor_data,
        {type = 0,
         rank = 0,
         male_honor = 0,
         female_honor = 0,
         reward = [],
         title = "",
         content = ""}).

-record(wedding_rank_honor_type_data,
        {type = 0, day = day}).

-file("src/mod/item/item_effect.erl", 25).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/mod/item/item_effect.erl", 26).

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

-file("src/mod/item/item_effect.erl", 27).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/item/item_effect.erl", 28).

-file("inc/privilege.hrl", 1).

-record(m_privilege,
        {ver = 2,
         lev = 0,
         list = [],
         new_list = [],
         new_prilist = []}).

-record(privilege_data,
        {lev = 0,
         min = 0,
         max = 0,
         title = "",
         content = "",
         item = []}).

-record(privilege_type_data,
        {lev = 0, type = 0, val = 0, args = [], old_item = []}).

-record(privilege_role,
        {id = {0, "", 0},
         ver = 2,
         lev = 0,
         privilege_lev = 0,
         buy_list = [],
         pri_list = []}).

-record(privilege_item,
        {id = 0,
         item_id = 0,
         is_self = 0,
         bind = 0,
         num = 0,
         weigth = 0,
         is_cast = 0}).

-record(privilege_gift,
        {id = 0,
         need_val = 0,
         reward = [],
         privileges = [],
         title = "",
         content = "",
         client_show = [],
         mail_title = "",
         mail_content = ""}).

-file("src/mod/item/item_effect.erl", 29).

-file("inc/family.hrl", 1).

-record(beans_reward,
        {id = 0,
         giver_id = {0, "", 0},
         giver_name = "",
         belong_id = {0, "", 0},
         pos = {0, 0},
         give_time = 0}).

-record(magic_beans,
        {ver = 2,
         growth = 0 :: non_neg_integer(),
         flower_num = 0 :: non_neg_integer(),
         wake_time = 0 :: non_neg_integer(),
         event_record = [],
         fosters = [],
         inviters = [],
         beans_rewards = [],
         next_beanrw_id = 0}).

-record(family_info,
        {ver = 5 :: pos_integer(),
         id = {0, "", 0},
         master_id = {0, "", 0},
         master_name = "",
         master_classes = 0 :: pos_integer(),
         master_lev = 1 :: pos_integer(),
         master_sex = 0 :: 0..2,
         lover_id = {0, "", 0},
         lover_name = "",
         pid :: undefined | pid(),
         house_info = undefined,
         yard_info = undefined,
         visitor = [],
         last_visit_time = 0,
         visit_lock = 1,
         last_rf_time = 0,
         magic_beans = #magic_beans{},
         battle_id}).

-record(furnishing,
        {id = 0 :: non_neg_integer(),
         base_id = 0,
         num = 1,
         status = 1,
         belong = {0, "", 0},
         pos = {1, 1, 1, 1} :: tuple(),
         dir = 0 :: 0..1}).

-record(house_info,
        {ver = 3 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         env_val = 0,
         lev = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer(),
         bdg_info = [] :: list(),
         furishing_max_lev_info = [] :: list(),
         next_fur_id = 1,
         cleanness = 100,
         last_clean_time = 0,
         housekeeper_action_times = 0,
         is_upgrade_bdg = []}).

-record(building_info, {type = 1, lev = 0, exp = 0}).

-record(yard_info,
        {ver = 1 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         levl = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer()}).

-record(family_store,
        {ver = 1,
         next_time = 0 :: non_neg_integer(),
         goods_list = []}).

-record(m_family,
        {ver = 1,
         cur_id = {0, "", 0},
         pid :: undefined | pid(),
         idle_family = {0, "", 0},
         family_store = #family_store{},
         family_effect = [],
         effect_use_info = []}).

-record(family_pet_train_info,
        {id = 1, pet_id = 0, end_time = 0}).

-record(fshop_item,
        {id = 0,
         store_type = 1,
         base_id = 0,
         type = 90000,
         val = 0,
         count = 1}).

-record(family_child,
        {id = {0, "", 0},
         name = "",
         classes = 0 :: pos_integer(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         stage = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         unit_id = {0, 0},
         unit_base_id = 0}).

-file("src/mod/item/item_effect.erl", 30).

-file("inc/battle.hrl", 1).

-record(battle_base,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         global = [] :: list(),
         map = [] :: list(),
         unit = [] :: list(),
         point = [] :: list(),
         trigger = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(battle,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         map = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         ext = [],
         role_id = {0, "", 0}}).

-record(battle_context,
        {grade = 1 :: pos_integer(),
         score = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         hurt = 0 :: non_neg_integer(),
         ratio_val = 0,
         die_num = 0}).

-record(battle_role,
        {id,
         status = 1,
         pid,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         is_kill_boss = 0 :: 0..1,
         sub_id = 0 :: non_neg_integer(),
         flip_cards = [] :: [],
         has_reward_floor = [],
         context = #battle_context{}}).

-record(battle_combat_info,
        {sub_id = 0, sub_type = 0, gains = []}).

-record(battle_trigger,
        {name :: undefined | bitstring(),
         status = open :: open | close,
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         condition = [] :: [tuple()],
         action = [] :: list()}).

-record(tri_timer,
        {mode :: undefined | cycle | count,
         times = 0 :: integer(),
         timeout = 1000 :: pos_integer()}).

-record(cfg_act,
        {tpl :: undefined | atom(), cfg = [] :: list()}).

-record(tpl_act,
        {name = "" :: string(),
         type :: undefined | atom(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_cond,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_cond,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_evt,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_evt,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_val,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_val,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_unit,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_unit,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(point,
        {map = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(tpl_fun,
        {name :: undefined | atom(),
         return :: undefined | unit | point,
         args = [] :: [atom()],
         code = "" :: string(),
         mfa_code = "" :: string(),
         label = "" :: string(),
         desc = "" :: string()}).

-file("src/mod/item/item_effect.erl", 31).

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

-file("src/mod/item/item_effect.erl", 32).

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

-file("src/mod/item/item_effect.erl", 33).

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

-file("src/mod/item/item_effect.erl", 34).

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

-file("src/mod/item/item_effect.erl", 35).

-file("inc/achieve_shop.hrl", 1).

-record(m_achieve_shop,
        {ver = 5 :: pos_integer(),
         shops = [] :: list(),
         zone_theme = 0 :: non_neg_integer(),
         team_mark = 401 :: non_neg_integer(),
         chat_bubble = 301 :: non_neg_integer(),
         photo_frame = 0 :: non_neg_integer(),
         badges = [] :: list(),
         prefix = 0,
         honor = 0,
         footmark = 0 :: non_neg_integer()}).

-record(ashop_goods_info,
        {ver = 1 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         expire = 0 :: non_neg_integer()}).

-file("src/mod/item/item_effect.erl", 36).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/item/item_effect.erl", 37).

msg(_ItemBase = #item_base{effect = [{33, Val}]}, Num,
    _Role) ->
    notice:return(notice:format(lang:get("开启成功，角色背包格子数增加 ~ts 个"),
                                [{string_2, 5, Num * Val}])),
    ok;
msg(_ItemBase = #item_base{effect = [{50, _}]}, _Num,
    _Role) ->
    notice:return(notice:format(lang:get("成功激活~ts聊天标志"),
                                [{string_2, 1, lang:get("好声音")}])),
    ok;
msg(_ItemBase = #item_base{effect = [{47, Val}]}, Num,
    _Role) ->
    notice:return(notice:format(lang:get("使用成功，本服好友上限增加 ~ts 个"),
                                [{string_2, 5, Num * Val}])),
    ok;
msg(_ItemBase = #item_base{effect = [{34, Val}]}, Num,
    _Role) ->
    Msg = notice:format(lang:get("增加~ts点双倍点"),
                        [{string_2, 5, Num * Val}]),
    notice:send(conn_pid, 3, Msg),
    ok;
msg(_ItemBase = #item_base{id = 29151}, _Num, _Role) ->
    Msg = lang:get(" 你使用了奇异果实外形得到变化，持续30分钟"),
    notice:send(conn_pid, 3, Msg),
    ok;
msg(_ItemBase = #item_base{id = 29152}, Num, _Role) ->
    Msg = notice:format(lang:get("你燃放了~ts个步步生莲烟花"),
                        [{string_2, 5, Num}]),
    notice:send(conn_pid, 3, Msg),
    ok;
msg(_ItemBase = #item_base{id = 29052}, _Num, _Role) ->
    Msg =
        notice:format(lang:get("吃了一块蛋糕，~ts吃满了，并且获得了童心未泯的效果"),
                      [{string_2, 5, lang:get("饱食度")}]),
    notice:send(conn_pid, 3, Msg),
    ok;
msg(_ItemBase, _Msg, _Role) -> ok.

-spec do(list(), #item_base{}, #role{}) -> {ok,
                                            #role{}} |
                                           {false, bitstring()}.

do([], _ItemBase, Role) -> {ok, Role};
do([H | T], ItemBase, Role) ->
    case do(H, ItemBase, Role) of
        {ok, Nr} -> do(T, ItemBase, Nr);
        {false, Reason} -> {false, Reason}
    end;
do({1, Value}, _ItemBase, Role) ->
    case role_gain:do_notice([#gain{label = coin,
                                    val = Value}],
                             Role)
        of
        {ok, NewRole} -> {ok, NewRole};
        _Err ->
            logger:debug("使用银币卡失败:~w", [_Err], item_effect, 83),
            {false, lang:get("使用银币卡失败")}
    end;
do({6, Value}, _ItemBase, Role) ->
    case role_gain:do_notice([#gain{label = gold_bind,
                                    val = Value}],
                             Role)
        of
        {ok, NewRole} -> {ok, NewRole};
        _Err ->
            logger:debug("使用金币卡失败:~w", [_Err], item_effect, 93),
            {false, lang:get("使用钻石卡失败")}
    end;
do({57, {90031, Val}},
   _ItemBase = #item_base{id = BaseId},
   Role = #role{m_wedding =
                    #m_wedding{lover_id = LoverId, status = 3},
                sex = 1}) ->
    case team:get_members(Role) of
        [#team_mate{id = LoverId, status = 2}] ->
            Role1 = quest_child:auto_commit(Role),
            Fun = fun (R) ->
                          case var:get_var(R, day_five, 146, 0) of
                              0 ->
                                  Gain = format:val_to_gain([{90031, Val}]),
                                  case role_gain:do_notice(Gain, R) of
                                      {ok, NR} ->
                                          {ok, var:acc_var(NR, day_five, 146)};
                                      _Err ->
                                          logger:debug("使用失败:~w",
                                                       [_Err],
                                                       item_effect,
                                                       109),
                                          ok
                                  end;
                              _ -> ok
                          end
                  end,
            role:apply(async, LoverId, {Fun}),
            notice:send(Role1,
                        3,
                        notice:format(lang:get("服用~ts之后，顿觉神清气爽，整个人焕然一新"),
                                      [{item_2, BaseId}])),
            {ok, Role1};
        _ ->
            {false,
             notice:format(lang:get("夫妻组队完成孕育任务时，服用~ts才有效果喔{face_1,34}"),
                           [{item_2, BaseId}])}
    end;
do({57, {ItemId = 90031, Val}},
   _ItemBase = #item_base{id = BaseId},
   Role = #role{m_wedding =
                    #m_wedding{status = 3, lover_id = LoverId}}) ->
    case team:get_members(Role) of
        [#team_mate{id = LoverId, status = 2}] ->
            Role1 = quest_child:auto_commit(Role),
            case var:get_var(Role1, day_five, 146, 0) of
                0 ->
                    Gain = format:val_to_gain([{ItemId, Val}]),
                    case role_gain:do_notice(Gain, Role1) of
                        {ok, NewRole} ->
                            notice:send(Role,
                                        3,
                                        notice:format(lang:get("服用~ts之后，顿觉神清气爽，整个人焕然一新"),
                                                      [{item_2, BaseId}])),
                            {ok, var:acc_var(NewRole, day_five, 146)};
                        _Err ->
                            logger:debug("使用失败:~w", [_Err], item_effect, 133),
                            {false, lang:get("使用积分卡失败")}
                    end;
                _ -> {ok, Role1}
            end;
        _ ->
            {false,
             notice:format(lang:get("夫妻组队完成孕育任务时，服用~ts才有效果喔{face_1,34}"),
                           [{item_2, BaseId}])}
    end;
do({57, {90031, _Val}},
   _ItemBase = #item_base{id = BaseId}, _Role) ->
    {false,
     notice:format(lang:get("夫妻组队完成孕育任务时，服用~ts才有效果喔{face_1,34}"),
                   [{item_2, BaseId}])};
do({57, {90032, Val}},
   _ItemBase = #item_base{id = BaseId}, Role) ->
    case child:fetus_grow(Role, Val, {item, BaseId}) of
        {ok, NewRole} ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("服用~ts之后，天地灵气向胎儿聚拢，孕育值增加~ts点"),
                                      [{item_2, BaseId}, {string_2, 5, Val}])),
            {ok, NewRole};
        {false, Why} -> {false, Why}
    end;
do({57, {ItemId, Val}}, _ItemBase, Role)
    when ItemId >= 90000 ->
    Gain = format:val_to_gain([{ItemId, Val}]),
    case role_gain:do_notice(Gain, Role) of
        {ok, NewRole} -> {ok, NewRole};
        _Err ->
            logger:debug("使用失败:~w", [_Err], item_effect, 158),
            {false, lang:get("使用积分卡失败")}
    end;
do({57, _E}, _ItemBase, _Role) ->
    logger:error("积分道具配置错了:~w", [_E], item_effect, 162),
    {false, lang:get("积分道具配置错了")};
do({33, Value}, _ItemBase,
   Role = #role{p_bag =
                    PBag = #package{volume = Volume,
                                    free_cell = FreeCell}}) ->
    NewVolume = Volume + Value,
    case NewVolume > 175 of
        false ->
            NewPbag = PBag#package{volume = NewVolume,
                                   free_cell =
                                       FreeCell ++
                                           lists:seq(Volume + 1, NewVolume)},
            Time = var:get_var(Role, other, 2026, 0),
            sys_conn:pack_send(10323, {1, NewVolume, Time, ""}),
            {ok, Role#role{p_bag = NewPbag}};
        _ -> {false, lang:get("超过背包最大容量, 无法扩充")}
    end;
do({68, _Ratio}, _ItemBase = #item_base{id = ItemId},
   Role = #role{m_new_expression =
                    MExpression = #m_new_expression{s_expression = SE,
                                                    b_expression = _BE}}) ->
    case ItemId of
        22455 ->
            SE2 = [122 | SE],
            NMEExpression =
                MExpression#m_new_expression{s_expression = SE2},
            NRole = Role#role{m_new_expression = NMEExpression},
            chat_expression:push_new_expression(NRole),
            notice:send(Role,
                        3,
                        notice:format(lang:get("恭喜解锁特典表情{face_1, 122}"), [])),
            logger:debug("新表情：~w", ["特典表情"], item_effect, 188),
            role:link_send(10429, {122, 1, 0, 0}),
            notice:cast(all,
                        4,
                        notice:format(lang:get("~ts在收集<color='#ffff00'>萌宠表情</color>时精诚所至，获得了梦"
                                               "寐以求的<color='#ffff00'>特典小表情</color>{face_1, "
                                               "122}"),
                                      [{role_2, NRole}])),
            {ok, NRole};
        _ ->
            logger:error("配置错误，非新表情生成物品", [], item_effect, 193),
            {ok, Role}
    end;
do({47, Val}, _ItemBase, Role = #role{id = RoleId}) ->
    var:update_role_var_list(RoleId,
                             [{acc, forever, 3000, 0, Val, 30}]),
    util:sleep(500),
    friend:push(Role, 11800, ok),
    {ok, Role};
do({2, Value}, _ItemBase, Role) ->
    case role_gain:do_notice([#gain{label = gold,
                                    val = Value}],
                             Role)
        of
        {ok, NewRole} -> {ok, NewRole};
        _Err ->
            logger:debug("使用钻石卡失败:~w", [_Err], item_effect, 210),
            {false, lang:get("使用钻石卡失败")}
    end;
do({7, [Value, Min, Max]}, _ItemBase, Role) ->
    Radio = util:rand(Min, Max),
    G = #gain{label = prac_exp,
              val = util:ceil(Value * Radio / 1000)},
    case skill_prac:add_cycle_exp(Role, 1, G) of
        {ok, NRole} -> {ok, NRole};
        Rtn = {false, _Msg} -> Rtn;
        _ -> {false, lang:get("使用物品增加修炼技能经验失败")}
    end;
do({7, Value}, _ItemBase, Role) ->
    G = #gain{label = prac_exp, val = Value},
    case skill_prac:add_cycle_exp(Role, 1, G) of
        {ok, NRole} -> {ok, NRole};
        Rtn = {false, _Msg} -> Rtn;
        _ -> {false, lang:get("使用物品增加修炼技能经验失败")}
    end;
do({53, Val}, _ItemBase, Role = #role{lev = Lev}) ->
    Exp = util:ceil(round(243 * Lev + 7200) * 3),
    Gain = [#gain{label = exp, val = Exp},
            #gain{label = autumn_score, val = Val}],
    case role_gain:do(Gain, Role, #{}) of
        {ok, NewRole, #{new_gl := NewGL}} ->
            Msg = case NewGL of
                      [#gain{label = exp, val = Exp1},
                       #gain{label = autumn_score, val = Val1}] ->
                          notice:format(lang:get("获得~ts，~ts"),
                                        [{assets_1, 90010, Exp1},
                                         {assets_1, 90025, Val1}]);
                      _ ->
                          notice:format(lang:get("获得~ts，~ts"),
                                        [{assets_1, 90010, Exp},
                                         {assets_1, 90025, Val}])
                  end,
            notice:send(NewRole, 3, Msg),
            {ok, NewRole};
        _Err ->
            logger:debug("使用中秋积分失败:~w", [_Err], item_effect, 255),
            {false, lang:get("使用中秋积分失败")}
    end;
do({54, {SkillVal, AutumnVal}}, _ItemBase, Role) ->
    G1 = #gain{label = prac_exp, val = SkillVal},
    case skill_prac:add_cycle_exp(Role, 1, G1) of
        {ok, NRole} ->
            G2 = [#gain{label = autumn_score, val = AutumnVal}],
            case role_gain:do_notice(G2, NRole) of
                {ok, NRole1} -> {ok, NRole1};
                _Err ->
                    logger:debug("使用中秋积分失败:~w", [_Err], item_effect, 269),
                    {false, lang:get("使用中秋积分失败")}
            end;
        {false, Msg} -> {false, Msg};
        _Err ->
            logger:debug("使用中秋积分失败:~w", [_Err], item_effect, 275),
            {false, lang:get("使用中秋积分失败")}
    end;
do({55, Val}, _ItemBase, Role = #role{lev = Lev}) ->
    Exp = util:ceil(round(243 * Lev + 7200) * 3),
    Gain = [#gain{label = exp, val = Exp},
            #gain{label = tournament, val = Val}],
    case role_gain:do(Gain, Role, #{}) of
        {ok, NewRole, #{new_gl := NewGL}} ->
            Msg = case NewGL of
                      [#gain{label = exp, val = Exp1},
                       #gain{label = tournament, val = Val1}] ->
                          notice:format(lang:get("获得~ts，~ts"),
                                        [{assets_1, 90010, Exp1},
                                         {assets_1, 90020, Val1}]);
                      _ ->
                          notice:format(lang:get("获得~ts，~ts"),
                                        [{assets_1, 90010, Exp},
                                         {assets_1, 90020, Val}])
                  end,
            notice:send(NewRole, 3, Msg),
            {ok, NewRole};
        _Err ->
            logger:debug("使用王者积分失败:~w", [_Err], item_effect, 294),
            {false, lang:get("使用王者积分失败")}
    end;
do({56, {SkillVal, Tournament}}, _ItemBase, Role) ->
    G1 = #gain{label = prac_exp, val = SkillVal},
    case skill_prac:add_cycle_exp(Role, 1, G1) of
        {ok, NRole} ->
            G2 = [#gain{label = tournament, val = Tournament}],
            case role_gain:do_notice(G2, NRole) of
                {ok, NRole1} -> {ok, NRole1};
                _Err ->
                    logger:debug("使用王者积分失败:~w", [_Err], item_effect, 308),
                    {false, lang:get("使用王者积分失败")}
            end;
        {false, Msg} -> {false, Msg};
        _Err ->
            logger:debug("使用王者积分失败:~w", [_Err], item_effect, 314),
            {false, lang:get("使用王者积分失败")}
    end;
do({15, []}, _ItemBase = #item_base{id = _BaseId},
   Role = #role{lev = Lev}) ->
    case role_gain:do_notice([#gain{label = exp,
                                    val = 5000 * Lev + 100000, source = 13}],
                             Role)
        of
        {ok, NewRole} -> {ok, NewRole};
        _Err ->
            logger:debug("使用经验心得失败:~w", [_Err], item_effect, 324),
            {false, lang:get("使用经验心得失败")}
    end;
do({15, [0]}, _ItemBase = #item_base{id = _BaseId},
   Role = #role{lev = Lev}) ->
    case levup_data:get(Lev) of
        false -> {false, lang:get("当前等级不能使用")};
        Exp ->
            case role_gain:do_notice([#gain{label = exp, val = Exp,
                                            source = 13}],
                                     Role)
                of
                {ok, NewRole} -> {ok, NewRole};
                _Err ->
                    logger:debug("使用经验心得失败:~w", [_Err], item_effect, 338),
                    {false, lang:get("使用经验心得失败")}
            end
    end;
do({15, [OldExp, Min, Max]},
   _ItemBase = #item_base{id = _BaseId},
   Role = #role{lev = Lev}) ->
    Radio = util:rand(Min, Max),
    Exp = case OldExp of
              0 -> util:ceil(round(243 * Lev + 7200) * Radio / 1000);
              _ -> OldExp
          end,
    case role_gain:do([#gain{label = exp, val = Exp}],
                      Role,
                      #{})
        of
        {ok, NewRole, #{new_gl := NewGL}} ->
            Msg1 = case NewGL of
                       [#gain{label = exp, val = Exp1}] ->
                           notice:format(lang:get("获得~ts经验"),
                                         [{string_2, 5, Exp1}]);
                       [#gain{label = coin, val = Coin1}] ->
                           notice:format(lang:get("获得~ts银币"),
                                         [{string_2, 5, Coin1}]);
                       _ ->
                           notice:format(lang:get("获得~ts经验"),
                                         [{string_2, 5, Exp}])
                   end,
            Msg2 = notice:format(lang:get("~ts"),
                                 [{string_1, Msg1}]),
            notice:send(NewRole, 3, Msg2),
            {ok, NewRole};
        _Err ->
            logger:debug("使用经验心得失败:~w", [_Err], item_effect, 363),
            {false, lang:get("使用经验心得失败")}
    end;
do({15, OldExp}, _ItemBase = #item_base{id = BaseId},
   Role = #role{lev = Lev}) ->
    Exp = case OldExp of
              0 -> round(512 * Lev + 7200);
              _ -> OldExp
          end,
    Max = 20,
    PrivilegeVal = privilege:get_val(Role, {109, BaseId}),
    DayCount = var:get_var(Role, day, 24, 0),
    case DayCount >= Max + PrivilegeVal of
        true ->
            {false,
             notice:format(lang:get("今日已使用~ts 本经验书，无法继续使用"),
                           [{string_2, 5, Max + PrivilegeVal}])};
        false ->
            case role_gain:do([#gain{label = exp, val = Exp}],
                              Role,
                              #{})
                of
                {ok, NewRole, #{new_gl := NewGL}} ->
                    Msg1 = case NewGL of
                               [#gain{label = exp, val = Exp1}] ->
                                   notice:format(lang:get("获得~ts经验"),
                                                 [{string_2, 5, Exp1}]);
                               [#gain{label = coin, val = Coin1}] ->
                                   notice:format(lang:get("获得~ts银币"),
                                                 [{string_2, 5, Coin1}]);
                               _ ->
                                   notice:format(lang:get("获得~ts经验"),
                                                 [{string_2, 5, Exp}])
                           end,
                    NewRole1 = var:set_var(NewRole, day, 24, DayCount + 1),
                    CanUse = max(Max + PrivilegeVal - (DayCount + 1), 0),
                    Msg2 = notice:format(lang:get("~ts（今天还能使用~ts本）"),
                                         [{string_1, Msg1},
                                          {string_2, 5, CanUse}]),
                    notice:send(NewRole1, 3, Msg2),
                    {ok, NewRole1};
                _Err ->
                    logger:debug("使用经验心得失败:~w", [_Err], item_effect, 394),
                    {false, lang:get("使用经验心得失败")}
            end
    end;
do({72, Val}, _ItemBase, Role = #role{}) ->
    case skill_unique:add_sq_double(Role, Val) of
        {ok, NewRole, TimeOut} ->
            Msg = notice:format(lang:get("您开启了~ts分钟历练加成, 当前剩余~ts"),
                                [{string_2, 1, Val div 60},
                                 {string_2,
                                  1,
                                  date:seconds_to_str(TimeOut div 1000)}]),
            notice:return(Msg),
            {ok, NewRole};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("无法使用该道具")}
    end;
do({73, Val}, _ItemBase, Role = #role{}) ->
    case skill_unique:add_sq_point(Role, Val) of
        {ok, NewRole} ->
            Msg = notice:format(lang:get("增加了~ts绝招灵气"),
                                [{string_2, 1, Val}]),
            notice:return(Msg),
            {ok, NewRole};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("无法使用该道具")}
    end;
do({43, [1, ExpMod]}, _ItemBase = #item_base{},
   Role = #role{lev = Lev,
                assets = Assets = #assets{reserve_exp = ReserveExp}}) ->
    case levup_data:get_exp({ExpMod, Lev}) of
        #{exp := Exp} ->
            NewRole = Role#role{assets =
                                    Assets#assets{reserve_exp =
                                                      ReserveExp + Exp}},
            Msg = notice:format(lang:get("增加了~ts储备经验"),
                                [{string_2, 5, Exp}]),
            notice:send(Role, 3, Msg),
            role_gain:push_exp(NewRole),
            {ok, NewRole};
        _ -> {ok, Role}
    end;
do({43, Exp}, _ItemBase = #item_base{},
   Role = #role{assets =
                    Assets = #assets{reserve_exp = ReserveExp}}) ->
    NewRole = Role#role{assets =
                            Assets#assets{reserve_exp = ReserveExp + Exp}},
    Msg = notice:format(lang:get("增加了~ts储备经验"),
                        [{string_2, 5, Exp}]),
    notice:send(Role, 3, Msg),
    role_gain:push_exp(NewRole),
    {ok, NewRole};
do({8, WingId}, _ItemBase, Role) ->
    case wing:use_wing(WingId, Role) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> {false, lang:get("无法使用的翅膀")}
    end;
do({45, [BaseId, Radio, Min, Max, TMapList]},
   _ItemBase = #item_base{id = ItemBaseId},
   Role = #role{name = Name, id = RoleId}) ->
    MapList = tuple_to_list(TMapList),
    {ok, RList} = role_group:members(world),
    Length = length(RList),
    Num = util:ceil(Length * Radio / 1000),
    NewNum = util:check_range(Num, Min, Max),
    case unit_mgr:fetch_ids(NewNum + 1) of
        {ok, [Id | T]} ->
            List = unit_list(T,
                             MapList,
                             #{base_id => BaseId, group => Id,
                               map_list => MapList, name => Name, id => RoleId},
                             []),
            unit_mgr:async_create_unit(List),
            Msg =
                notice:format(lang:get("~ts获得了~ts的祝福，在5个主场景洒下一片百花宝箱，大家赶快去拾取吧{face_1,22}"),
                              [{role_2, Role}, {item_2, ItemBaseId}]),
            notice:cast(all, 10, Msg),
            notice:cast(all, 11, Msg),
            notice:pop(Role,
                       0,
                       lang:get("你向<color='#00ff00'>圣心城、月痕海岸、精灵之森、飞瀑村、极北之域</co"
                                "lor>洒下了一片宝箱，快去拾取吧{face_1,22}")),
            {ok, Role};
        _ -> {false, lang:get("生成Id出错了")}
    end;
do({9, {HonorId, Time}}, _ItemBase, Role) ->
    EndTime = date:unixtime() + Time * 3600,
    case honor:add_and_use(Role, {HonorId, EndTime}, push)
        of
        Rtn = {ok, _} -> Rtn;
        _ -> {false, lang:get("称号卡使用失败")}
    end;
do({9, {HonorId, 0, Val}}, _ItemBase, Role) ->
    case honor:check_repeat(Role, HonorId) of
        true ->
            case role_gain:do_notice([#gain{label = gold_bind,
                                            val = Val}],
                                     Role)
                of
                {ok, NewRole} ->
                    Msg = notice:format(lang:get("已经拥有该称号，自动转换为~ts金币"),
                                        [{string_2, 5, Val}]),
                    notice:send(Role, 3, Msg),
                    {ok, NewRole};
                _Err ->
                    logger:debug("重复的称号卡转换为金币失败:~w",
                                 [_Err],
                                 item_effect,
                                 492),
                    {false, lang:get("使用重复的称号卡失败")}
            end;
        _ ->
            case honor:add_and_use(Role, HonorId, push) of
                Rtn = {ok, _} -> Rtn;
                _ -> {false, lang:get("称号卡使用失败")}
            end
    end;
do({9, HonorId}, _ItemBase, Role) ->
    case honor:add_and_use(Role, HonorId, push) of
        Rtn = {ok, _} -> Rtn;
        _ -> {false, lang:get("称号卡使用失败")}
    end;
do({69, {PreHonorId, Time}}, _ItemBase, Role) ->
    EndTime = date:unixtime() + Time * 3600,
    case honor:add_pre_honor(Role,
                             {PreHonorId, EndTime},
                             push)
        of
        Rtn = {ok, _} -> Rtn;
        _ERR ->
            logger:debug("称号前缀卡使用失败~w", [_ERR], item_effect, 520),
            {false, lang:get("称号前缀卡使用失败")}
    end;
do({69, PreHonorId}, _ItemBase, Role) ->
    case honor:add_pre_honor(Role, PreHonorId, push) of
        Rtn = {ok, _} -> Rtn;
        _ERR ->
            logger:debug("称号前缀卡使用失败~w", [_ERR], item_effect, 529),
            {false, lang:get("称号前缀卡使用失败")}
    end;
do({70, Power}, _ItemBase, Role) ->
    case wing:add_wing_power(Role, Power) of
        Rtn = {ok, _} -> Rtn;
        {false, Reason} -> {false, Reason};
        _ERR ->
            logger:debug("翅膀能量晶石使用失败~ts", [_ERR], item_effect, 540),
            {false, lang:get("翅膀能量晶石使用失败")}
    end;
do({19, EggId}, _ItemBase, Role) ->
    case pet_effect:use_egg(Role, EggId) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
do({10, BuffId}, _ItemBase = #item_base{id = BaseId},
   Role)
    when BaseId == 29142 orelse BaseId == 29141 ->
    case buff:add(Role, BuffId) of
        {ok, Role1} ->
            Role2 = attr:calc_and_push(Role1),
            NewRole = looks:calc(Role2),
            map:role_update(NewRole),
            BuffName = case buff_data:get(BuffId) of
                           #buff_base{name = TBuffName} -> TBuffName;
                           _ -> ""
                       end,
            Msg = notice:format(lang:get("你获得了~ts状态"),
                                [{string_2, 1, BuffName}]),
            notice:send(NewRole, 3, Msg),
            {ok, NewRole};
        {false, _Reason} ->
            Msg =
                notice:format(lang:get("24小时内最多使用~ts个，快将~ts送给~ts一起分享吧"),
                              [{string_2, 1, 1},
                               {item_2, BaseId},
                               {string_2, 5, lang:get("其他好友")}]),
            {false, Msg}
    end;
do({10, BuffId}, _ItemBase, Role) ->
    case buff:add(Role, BuffId) of
        {ok, Role1} ->
            Role2 = attr:calc_and_push(Role1),
            NewRole = looks:calc(Role2),
            map:role_update(NewRole),
            case BuffId of
                10091 ->
                    Msg = notice:format(lang:get("使用成功，在挂机地图~ts内将不会遇敌"),
                                        [{string_2, 5, lang:get("30分钟")}]),
                    notice:send(NewRole, 3, Msg);
                _ -> ok
            end,
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
do({20, GroupId}, _ItemBase,
   Role = #role{classes = Classes}) ->
    RandIds = case buff_data:rand_ids(GroupId) of
                  L1 = [{_, _, _} | _] ->
                      [{I, R}
                       || {I, R, C} <- L1, C =:= 0 orelse C =:= Classes];
                  L1 -> L1
              end,
    case util:rand_list(RandIds, 2) of
        {BuffId, _} ->
            case buff:add(Role, BuffId) of
                {ok, Role1} ->
                    Role2 = attr:calc_and_push(Role1),
                    NewRole = looks:calc(Role2),
                    map:role_update(NewRole),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        _Else ->
            logger:debug("无效随机buff ~w, ~w",
                         [_Else, GroupId],
                         item_effect,
                         608),
            {false, lang:get("找不到buff")}
    end;
do({13, BuffId}, _ItemBase = #item_base{id = BaseId},
   Role = #role{id = RoleId, name = RoleName,
                pos = #pos{map_base_id = MapBase}}) ->
    case map:async_apply(Role,
                         {buff, add_and_calc, [BuffId]})
        of
        ok ->
            Msg = case buff_data:get(BuffId) of
                      #buff_base{desc = Desc = [_ | _]} ->
                          notice:format(lang:get("~ts豪气冲天，使用了~ts，~ts的小伙伴获得了~ts！"),
                                        [{role_1, RoleId, RoleName},
                                         {item_2, BaseId},
                                         {string_2, 4, map:name(MapBase)},
                                         {string_2, 5, Desc}]);
                      _ ->
                          notice:format(lang:get("~ts豪气冲天，使用了~ts，~ts的小伙伴都得到了祝福！"),
                                        [{role_1, RoleId, RoleName},
                                         {item_2, BaseId},
                                         {string_2, 4, map:name(MapBase)}])
                  end,
            notice:cast(all, 5, Msg),
            {ok, Role};
        {false, Reason} -> {false, Reason}
    end;
do({65, BuffId}, _ItemBase = #item_base{id = BaseId},
   Role = #role{id = RoleId, name = RoleName}) ->
    role_group:apply(world, {buff, add_and_calc, [BuffId]}),
    case BaseId of
        29227 ->
            Msg =
                notice:format(lang:get("~ts使用了~ts，洒下了一片绚丽的烟花，真是太帅气了{face_1, "
                                       "29}全服的小伙伴获得了一小时经验加成！"),
                              [{role_1, RoleId, RoleName}, {item_2, BaseId}]),
            notice:cast(all, 11, Msg),
            notice:cast(all, 5, Msg);
        26026 ->
            Msg =
                notice:format(lang:get("~ts使用了~ts，星辰世界沐浴在圣灵的光辉下，全服的小伙伴都获得了一小时经验及银币加成！"
                                       "{face_1,29}"),
                              [{role_1, RoleId, RoleName}, {item_2, BaseId}]),
            notice:cast(all, 5, Msg);
        _ -> ok
    end,
    {ok, Role};
do({12, Val}, _ItemBase, Role) ->
    Gain = format:val_to_gain([{90014, Val}]),
    case role_gain:do(Gain, Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
do({30, Val}, _ItemBase = #item_base{id = BaseId},
   Role = #role{name = Name}) ->
    role_group:apply(world, {satiety, add, [Val]}),
    case BaseId of
        29121 ->
            ValStr = util:flist(lang:get("~w饱食度"), [Val]),
            Msg =
                notice:format(lang:get("~ts燃放了豪华烟花，祝大家节日快乐！全服的小伙伴增加~ts"),
                              [{role_2, Name}, {string_2, 5, ValStr}]),
            notice:cast(all, 5, Msg);
        _ -> ok
    end,
    {ok, Role};
do({26, Val}, _ItemBase, Role) ->
    Gain = format:val_to_gain([{90006, Val}]),
    case role_gain:do_notice(Gain, Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
do({16, _Val}, _ItemBase = #item_base{name = ItemName},
   #role{m_guild = undefined}) ->
    {false,
     util:flist(lang:get("加入公会后才能使用<color='#ffff00'>~ts</color>"),
                [ItemName])};
do({16, Val}, _ItemBase, Role) ->
    Gain = [#gain{label = guild, val = Val}],
    case role_gain:do(Gain, Role) of
        {ok, NewRole} ->
            Msg = notice:format(lang:get("使用成功，增加~ts点公会贡献"),
                                [{string_2, 5, Val}]),
            notice:return(Msg),
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
do({17, _Val}, _ItemBase = #item_base{name = ItemName},
   #role{m_guild = undefined}) ->
    {false,
     util:flist(lang:get("加入公会后才能使用<color='#ffff00'>~ts</color>"),
                [ItemName])};
do({17, Val}, _ItemBase = #item_base{id = BaseId},
   Role = #role{m_guild = #m_guild{pid = GuildPid},
                name = RoleName}) ->
    case guild_common:add_assets(Val, Role) of
        ok ->
            PMsg = notice:format(lang:get("使用成功，增加~ts点公会资金"),
                                 [{string_2, 5, Val}]),
            notice:send(conn_pid, 1, PMsg),
            Msg = notice:format(lang:get("~ts使用~ts公会增加~ts资金"),
                                [{role_2, RoleName},
                                 {item_2, BaseId},
                                 {string_2, 5, Val}]),
            guild:notice(GuildPid, Msg),
            {ok, Role};
        {false, Reason} -> {false, Reason}
    end;
do({21, _}, _ItemBase, Role) ->
    case fairyland:use_item(Role, random_floor) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
do({22, _}, _ItemBase, Role) ->
    case fairyland:use_item(Role, add_enemy) of
        ok -> {ok, Role};
        {false, Reason} -> {false, Reason}
    end;
do({24, _}, _ItemBase, Role) ->
    case fairyland:use_item(Role, add_box) of
        ok -> {ok, Role};
        {false, Reason} -> {false, Reason}
    end;
do({23, _}, _ItemBase, Role) ->
    case fairyland:use_item(Role, find_forward) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
do({34, Val}, _ItemBase, Role) ->
    case agenda:add_double(Role, Val) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
do({35, Val}, _ItemBase, Role) when is_list(Val) ->
    ResultVal = case util:rand_list(Val, 2) of
                    {Count, _Ratio} -> Count;
                    _ -> 1
                end,
    case arena:add_soul(Role, ResultVal) of
        {ok, NewRole} ->
            Msg = notice:format(lang:get("增加~ts点战魂之心"),
                                [{string_2, 5, ResultVal}]),
            notice:send(conn_pid, 3, Msg),
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
do({51, {BaseId, 0}}, _ItemBase, Role)
    when is_integer(BaseId) ->
    case pet_data:get_stone_skill(BaseId) of
        {_, List1, List2} ->
            {FList, SList} = case util:rand(1, 10) =< 5 of
                                 true -> {List1, List2};
                                 false -> {List2, List1}
                             end,
            {SkillId1, _} = util:rand_list(FList, 2),
            SList1 = lists:keydelete(SkillId1, 1, SList),
            {SkillId2, _} = util:rand_list(SList1, 2),
            Skills = [SkillId1, SkillId2],
            case item_type:effect_skill_stone(BaseId, Skills) of
                {true, AddItem = #item{}} ->
                    Gain = [#gain{label = items, val = [AddItem]}],
                    case role_gain:do_notice(Gain, Role) of
                        {ok, NewRole} -> {ok, NewRole};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("配置错误")}
            end;
        _ -> {false, lang:get("配置错误")}
    end;
do({51, {BaseId, SkillId}}, _ItemBase, Role) ->
    case item_data:get_pet_effect_stone_skill(SkillId) of
        Skills = [_ | _] ->
            case item_type:effect_skill_stone(BaseId, Skills) of
                {true, AddItem = #item{}} ->
                    Gain = [#gain{label = items, val = [AddItem]}],
                    case role_gain:do_notice(Gain, Role) of
                        {ok, NewRole} -> {ok, NewRole};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("配置错误")}
            end;
        _ -> {false, lang:get("配置错误")}
    end;
do({32, List}, _ItemBase = #item_base{id = BaseId},
   Role) ->
    case util:rand_list(List, 4) of
        {0, _, _, _} -> {ok, Role};
        {ItemId, Bind, Num, _, IsCast} ->
            Gain = format:val_to_gain([{ItemId, Bind, Num}]),
            case role_gain:do_notice(Gain, Role) of
                {ok, NewRole} ->
                    case IsCast of
                        1 ->
                            CastMsg =
                                notice:format(lang:get("喜从天降， ~ts 在使用 ~ts 的时候惊喜的获得一个 ~ts {face_1,3}"),
                                              [{role_2, Role},
                                               {item_2, BaseId},
                                               {item_2,
                                                [{ItemId, Bind, Num}]}]),
                            notice:cast(all, 4, CastMsg);
                        _ -> ignore
                    end,
                    {ok, NewRole};
                _ -> {false, lang:get("背包空间不足")}
            end;
        _ -> {false, lang:get("配置出错")}
    end;
do({25, {BaseId, TimeId}}, _ItemBase, Role) ->
    case fashion:wear_batch([{BaseId, TimeId}], Role) of
        {ok, NewRole} ->
            case fashion:get_need_wear_list([{BaseId, TimeId}],
                                            Role)
                of
                WearList = [_ | _] ->
                    case fashion:put_on_fashion(WearList, NewRole) of
                        {ok, _Update, PutOnRole} ->
                            looks:update_looks(Role, PutOnRole),
                            fashion:push(PutOnRole),
                            {ok, PutOnRole};
                        _Reply -> _Reply
                    end;
                _ -> {ok, NewRole}
            end;
        {false, Reason} -> {false, Reason};
        _False -> {false, lang:get("无法使用此物品")}
    end;
do({25, FashionList}, _ItemBase, Role)
    when is_list(FashionList) ->
    case fashion:wear_batch(FashionList, Role) of
        {ok, NewRole} ->
            case fashion:get_need_wear_list(FashionList, Role) of
                WearList = [_ | _] ->
                    case fashion:put_on_fashion(WearList, NewRole) of
                        {ok, _Update, PutOnRole} ->
                            looks:update_looks(Role, PutOnRole),
                            fashion:push(PutOnRole),
                            {ok, PutOnRole};
                        _Reply -> _Reply
                    end;
                _ -> {ok, NewRole}
            end;
        {false, Reason} -> {false, Reason};
        _False -> {false, lang:get("无法使用此物品")}
    end;
do({28, Val}, _ItemBase = #item_base{id = BaseId},
   Role = #role{lev = Lev,
                m_lev_break = #m_lev_break{times = Times},
                m_attr_point =
                    MattrPoint = #m_attr_point{ext_point = ExtPoint}})
    when BaseId =:= 22617 ->
    Max = if Times > 0 -> 50;
             Times == 0 andalso Lev >= 90 andalso Lev =< 100 -> 40;
             true -> 30
          end,
    Flag = case BaseId of
               22617 ->
                   case var:get_var(Role, other, 2014, 0) of
                       Num when Num >= Max ->
                           {false,
                            notice:format(lang:get("已经使用~ts次，不能再使用了"),
                                          [{string_2, 5, Max}])};
                       Num -> {true, {normal, Num}}
                   end;
               23594 ->
                   {Year, _, _} = erlang:date(),
                   case var:get_var(Role, other, 2042, undefined) of
                       {Year, OldNum} when OldNum >= Max ->
                           {false,
                            notice:format(lang:get("已经使用~ts次，不能再使用了"),
                                          [{string_2, 5, Max}])};
                       {Year, OldNum} -> {true, {Year, OldNum}};
                       _ -> {true, {Year, 0}}
                   end
           end,
    case Flag of
        {false, Reason} -> {false, Reason};
        {true, Data} ->
            ItemPoint = case lists:keyfind(2, 1, ExtPoint) of
                            {_, TItemPoint} -> TItemPoint;
                            _ -> 0
                        end,
            NewExtPoint = lists:keystore(2,
                                         1,
                                         ExtPoint,
                                         {2, ItemPoint + Val}),
            NewMattrPoint = MattrPoint#m_attr_point{ext_point =
                                                        NewExtPoint},
            NRole = Role#role{m_attr_point = NewMattrPoint},
            {NewRole, LastUse} = case Data of
                                     {normal, HasUse} ->
                                         NRole1 = var:set_var(NRole,
                                                              other,
                                                              2014,
                                                              HasUse + 1),
                                         {NRole1, Max - HasUse - 1};
                                     {UseYear, HasUse} ->
                                         NRole1 = var:set_var(NRole,
                                                              other,
                                                              2042,
                                                              {UseYear,
                                                               HasUse + 1}),
                                         {NRole1, Max - HasUse - 1}
                                 end,
            Msg = notice:format(lang:get("获得~ts属性点，当前等级还可使用~ts次"),
                                [{string_2, 5, Val}, {string_2, 5, LastUse}]),
            notice:send(conn_pid, 3, Msg),
            attr:push_10023(Role),
            attr:push_10007(NewRole),
            {ok, NewRole}
    end;
do({28, Val}, _ItemBase = #item_base{id = BaseId},
   Role = #role{m_attr_point =
                    MattrPoint = #m_attr_point{ext_point = ExtPoint}})
    when BaseId =:= 23594 ->
    Max = 20,
    Flag = case BaseId of
               22617 ->
                   case var:get_var(Role, other, 2014, 0) of
                       Num when Num >= Max ->
                           {false,
                            notice:format(lang:get("已经使用~ts次，不能再使用了"),
                                          [{string_2, 5, Max}])};
                       Num -> {true, {normal, Num}}
                   end;
               23594 ->
                   {Year, _, _} = erlang:date(),
                   case var:get_var(Role, other, 2042, undefined) of
                       {Year, OldNum} when OldNum >= Max ->
                           {false,
                            notice:format(lang:get("已经使用~ts次，不能再使用了"),
                                          [{string_2, 5, Max}])};
                       {Year, OldNum} -> {true, {Year, OldNum}};
                       _ -> {true, {Year, 0}}
                   end
           end,
    case Flag of
        {false, Reason} -> {false, Reason};
        {true, Data} ->
            ItemPoint = case lists:keyfind(2, 1, ExtPoint) of
                            {_, TItemPoint} -> TItemPoint;
                            _ -> 0
                        end,
            NewExtPoint = lists:keystore(2,
                                         1,
                                         ExtPoint,
                                         {2, ItemPoint + Val}),
            NewMattrPoint = MattrPoint#m_attr_point{ext_point =
                                                        NewExtPoint},
            NRole = Role#role{m_attr_point = NewMattrPoint},
            {NewRole, LastUse} = case Data of
                                     {normal, HasUse} ->
                                         NRole1 = var:set_var(NRole,
                                                              other,
                                                              2014,
                                                              HasUse + 1),
                                         {NRole1, Max - HasUse - 1};
                                     {UseYear, HasUse} ->
                                         NRole1 = var:set_var(NRole,
                                                              other,
                                                              2042,
                                                              {UseYear,
                                                               HasUse + 1}),
                                         {NRole1, Max - HasUse - 1}
                                 end,
            Msg =
                notice:format(lang:get("获得~ts属性点，建议前往加点，还可以使用~ts次"),
                              [{string_2, 5, Val}, {string_2, 5, LastUse}]),
            notice:send(conn_pid, 3, Msg),
            attr:push_10023(Role),
            attr:push_10007(NewRole),
            {ok, NewRole}
    end;
do({28, Val}, _ItemBase = #item_base{id = BaseId},
   Role = #role{m_attr_point =
                    MattrPoint = #m_attr_point{ext_point = ExtPoint}})
    when BaseId =:= 70362 ->
    Max = 20,
    Flag = case BaseId of
               70362 ->
                   {Year, _, _} = erlang:date(),
                   case var:get_var(Role, other, 2130, undefined) of
                       {Year, OldNum} when OldNum >= Max ->
                           {false,
                            notice:format(lang:get("已经使用~ts次，不能再使用了"),
                                          [{string_2, 5, Max}])};
                       {Year, OldNum} -> {true, {Year, OldNum}};
                       _ -> {true, {Year, 0}}
                   end
           end,
    case Flag of
        {false, Reason} -> {false, Reason};
        {true, Data} ->
            ItemPoint = case lists:keyfind(2, 1, ExtPoint) of
                            {_, TItemPoint} -> TItemPoint;
                            _ -> 0
                        end,
            NewExtPoint = lists:keystore(2,
                                         1,
                                         ExtPoint,
                                         {2, ItemPoint + Val}),
            NewMattrPoint = MattrPoint#m_attr_point{ext_point =
                                                        NewExtPoint},
            NRole = Role#role{m_attr_point = NewMattrPoint},
            {NewRole, LastUse} = case Data of
                                     {UseYear, HasUse} ->
                                         NRole1 = var:set_var(NRole,
                                                              other,
                                                              2130,
                                                              {UseYear,
                                                               HasUse + 1}),
                                         {NRole1, Max - HasUse - 1}
                                 end,
            Msg =
                notice:format(lang:get("获得~ts属性点，建议前往加点，还可以使用~ts次"),
                              [{string_2, 5, Val}, {string_2, 5, LastUse}]),
            notice:send(conn_pid, 3, Msg),
            attr:push_10023(Role),
            attr:push_10007(NewRole),
            {ok, NewRole}
    end;
do({28, Val}, _ItemBase,
   Role = #role{m_attr_point =
                    MattrPoint = #m_attr_point{ext_point = ExtPoint}}) ->
    ItemPoint = case lists:keyfind(2, 1, ExtPoint) of
                    {_, TItemPoint} -> TItemPoint;
                    _ -> 0
                end,
    NewExtPoint = lists:keystore(2,
                                 1,
                                 ExtPoint,
                                 {2, ItemPoint + Val}),
    NewMattrPoint = MattrPoint#m_attr_point{ext_point =
                                                NewExtPoint},
    NewRole = Role#role{m_attr_point = NewMattrPoint},
    Msg = notice:format(lang:get("已获得~ts属性点,建议前往加点"),
                        [{string_2, 5, Val}]),
    notice:return(Msg),
    attr:push_10023(NewRole),
    attr:push_10007(NewRole),
    {ok, NewRole};
do({29, {pos, Id}}, _ItemBase,
   Role = #role{pos =
                    #pos{map_base_id = MapBaseId, x = X, y = Y}}) ->
    notice:effect(all, Id, 1, MapBaseId, X, Y),
    {ok, Role};
do({29, {use_times, Times, Id}},
   _ItemBase = #item_base{id = BaseId}, Role) ->
    UseTimesInfo = var:get_var(Role, other, 2083, []),
    NewUseTimesInfo = case lists:keyfind(BaseId,
                                         1,
                                         UseTimesInfo)
                          of
                          {_, UseTimes} ->
                              case (UseTimes + 1) rem Times =:= 0 of
                                  true -> notice:effect(all, Id);
                                  false -> ok
                              end,
                              lists:keystore(BaseId,
                                             1,
                                             UseTimesInfo,
                                             {BaseId, UseTimes + 1});
                          _ -> [{BaseId, 1} | UseTimesInfo]
                      end,
    NewRole = var:set_var(Role,
                          other,
                          2083,
                          NewUseTimesInfo),
    {ok, NewRole};
do({29, IdList}, _ItemBase, Role)
    when is_tuple(IdList) ->
    {Id, _} = util:rand_list(tuple_to_list(IdList), 2),
    notice:effect(all, Id),
    {ok, Role};
do({29, Id}, _ItemBase, Role) ->
    notice:effect(all, Id),
    {ok, Role};
do({48, {pos, Id}}, _ItemBase,
   Role = #role{pos =
                    #pos{map_base_id = MapBaseId, x = X, y = Y}}) ->
    notice:effect(Role, Id, 1, MapBaseId, X, Y),
    {ok, Role};
do({48, [Id, Num]}, _ItemBase = #item_base{id = BaseId},
   Role) ->
    Val = case env:get({role_effect, BaseId}) of
              Env when is_integer(Env) -> Env;
              _ -> 0
          end,
    Acc = Val + 1,
    case Acc rem Num of
        0 -> notice:effect(all, Id);
        _ -> notice:effect(Role, Id)
    end,
    env:save({role_effect, BaseId}, Acc),
    {ok, Role};
do({48, Id}, _ItemBase, Role) ->
    notice:effect(Role, Id),
    {ok, Role};
do({36, _}, _ItemBase, Role) ->
    blacksmith:set_shoes_zero_speed(Role);
do({52, _}, _ItemBase, _Role = #role{s_event = Event})
    when Event =:= 26 orelse Event =:= 27 ->
    {false, lang:get("精灵幻境中不能使用")};
do({52, _}, _ItemBase, _Role = #role{s_event = Event})
    when Event =:= 51 ->
    {false, lang:get("小猪快跳活动中不能使用")};
do({52, {BookId, SkillLev}},
   _ItemBase = #item_base{id = BaseId}, Role) ->
    case skill_life:check_skill_level(Role, SkillLev) of
        true ->
            case handbook:use_item(BookId, Role) of
                {false, Reason} -> {false, Reason};
                {ok, Role2} ->
                    NewRole = role_trigger:fire(#evt_use_fruit_limit{base_id
                                                                         =
                                                                         BaseId,
                                                                     lev =
                                                                         SkillLev},
                                                Role2),
                    {ok, NewRole}
            end;
        false ->
            Msg = notice:format(lang:get("幻化之术等级不足~ts级，无法使用"),
                                [{string_2, 1, SkillLev}]),
            {false, Msg}
    end;
do({37, _Val}, _ItemBase,
   _Role = #role{s_event = Event})
    when Event == 26 orelse Event == 27 ->
    {false, lang:get("精灵幻境中不能使用")};
do({37, Val}, _ItemBase = #item_base{id = BaseId},
   Role) ->
    case Val of
        {BuffId, SkillLvl} ->
            case skill_life:check_skill_level(Role, SkillLvl) of
                true ->
                    case buff_data:get(BuffId) of
                        BuffBase = #buff_base{duration = Duration} ->
                            Slv = skill_life:get_look_skill_lev(Role),
                            FurnishingAdd = case Role of
                                                #role{m_family =
                                                          #m_family{family_effect
                                                                        =
                                                                        EffectInfo}} ->
                                                    case lists:keyfind(9,
                                                                       1,
                                                                       EffectInfo)
                                                        of
                                                        {_, AddSenond} ->
                                                            AddSenond;
                                                        _ -> 0
                                                    end;
                                                _ -> 0
                                            end,
                            NewDuration = Duration + Slv * 900 +
                                              FurnishingAdd * 60,
                            NewBuff = BuffBase#buff_base{duration =
                                                             NewDuration},
                            case buff:add(Role, NewBuff) of
                                {ok, Role1} ->
                                    Role2 = attr:calc_and_push(Role1),
                                    Role3 = looks:calc(Role2),
                                    NewRole =
                                        role_trigger:fire(#evt_use_fruit_limit{base_id
                                                                                   =
                                                                                   BaseId,
                                                                               lev
                                                                                   =
                                                                                   SkillLvl},
                                                          Role3),
                                    map:role_update(NewRole),
                                    {ok, NewRole};
                                {false, _Reason} -> {false, _Reason}
                            end;
                        false -> {false, lang:get("无效的变身果实")}
                    end;
                false ->
                    Msg = notice:format(lang:get("幻化之术等级不足~ts级，无法使用"),
                                        [{string_2, 1, SkillLvl}]),
                    {false, Msg}
            end;
        EffectBuffId when is_integer(EffectBuffId) ->
            case buff:add(Role, EffectBuffId) of
                {ok, Role1} ->
                    Role2 = attr:calc_and_push(Role1),
                    NewRole = looks:calc(Role2),
                    map:role_update(NewRole),
                    {ok, NewRole};
                {false, _Reason} -> {false, _Reason}
            end;
        _ -> {false, lang:get("无效的变身果实")}
    end;
do({42, [GoodsId, Expire]}, _ItemBase, Role) ->
    case achieve_shop_data:get(GoodsId) of
        #{name := Name, goods_type := GoodsType,
          destination := Destination} ->
            case achieve_shop:gain_achieve_goods2(Role,
                                                  GoodsId,
                                                  Expire)
                of
                {ok, Role1} ->
                    Msg = case util:floor(Expire / 86400) < 1 of
                              true ->
                                  notice:format(lang:get("获得~ts,可在~ts查看，持续时间~ts小时"),
                                                [{string_2, 5, Name},
                                                 {string_2, 1, Destination},
                                                 {string_2,
                                                  5,
                                                  util:ceil(Expire / 3600)}]);
                              _ ->
                                  notice:format(lang:get("获得~ts,可在~ts查看，持续时间~ts天"),
                                                [{string_2, 5, Name},
                                                 {string_2, 1, Destination},
                                                 {string_2,
                                                  5,
                                                  util:ceil(Expire / 86400)}])
                          end,
                    notice:send(Role, 3, Msg),
                    case achieve_shop:set_goods_use(Role1,
                                                    GoodsType,
                                                    GoodsId)
                        of
                        {ok, NewRole} ->
                            achieve_shop:push_use(NewRole, GoodsType),
                            {ok, NewRole};
                        _ -> {ok, Role1}
                    end;
                _ ->
                    {false,
                     notice:format(lang:get("你已经拥有了~ts"),
                                   [{string_2, 5, Name}])}
            end;
        _ -> {false, lang:get("不能使用")}
    end;
do({61, {_Rank, Time}}, _ItemBase, Role) ->
    GoodsId = 502,
    case achieve_shop_data:get(GoodsId) of
        #{name := Name, goods_type := GoodsType} ->
            case achieve_shop:gain_achieve_goods2(Role,
                                                  GoodsId,
                                                  Time * 86400)
                of
                {ok, Role1} ->
                    Msg =
                        notice:format(lang:get("恭喜，您获得了~ts的~ts，您在诸神之战中的战绩将随之闪耀诸界{face_1,3}"),
                                      [{string_2, 4, lang:get("诸神之巅")},
                                       {string_2, 1, lang:get("聊天前缀")}]),
                    notice:send(Role, 3, Msg),
                    case achieve_shop:set_goods_use(Role1,
                                                    GoodsType,
                                                    GoodsId)
                        of
                        {ok, NewRole} ->
                            achieve_shop:push_use(NewRole, GoodsType),
                            {ok, NewRole};
                        _ -> {ok, Role1}
                    end;
                _ ->
                    {false,
                     notice:format(lang:get("你已经拥有了~ts"),
                                   [{string_2, 5, Name}])}
            end;
        _ -> {false, lang:get("不能使用")}
    end;
do({50, {_Rank, Time}}, _ItemBase, Role) ->
    GoodsId = 501,
    case achieve_shop_data:get(GoodsId) of
        #{name := Name, goods_type := GoodsType} ->
            case achieve_shop:gain_achieve_goods2(Role,
                                                  GoodsId,
                                                  Time)
                of
                {ok, Role1} ->
                    Msg = notice:format(lang:get("获得~ts,可在~ts查看，持续时间~ts天"),
                                        [{string_2, 5, Name},
                                         {string_2, 1, lang:get("[成就-兑换商店]")},
                                         {string_2,
                                          5,
                                          util:ceil(Time / 86400)}]),
                    notice:send(Role, 3, Msg),
                    case achieve_shop:set_goods_use(Role1,
                                                    GoodsType,
                                                    GoodsId)
                        of
                        {ok, NewRole} ->
                            achieve_shop:push_use(NewRole, GoodsType),
                            {ok, NewRole};
                        _ -> {ok, Role1}
                    end;
                _ ->
                    {false,
                     notice:format(lang:get("你已经拥有了~ts"),
                                   [{string_2, 5, Name}])}
            end;
        _ -> {false, lang:get("不能使用")}
    end;
do({42, GoodsId}, _ItemBase, Role) ->
    case achieve_shop_data:get(GoodsId) of
        #{name := Name, goods_type := GoodsType} ->
            case achieve_shop:gain_achieve_goods(Role, GoodsId) of
                {ok, Role1} ->
                    Msg = notice:format(lang:get("获得~ts"),
                                        [{string_2, 5, Name}]),
                    notice:return(Msg),
                    case achieve_shop:set_goods_use(Role1,
                                                    GoodsType,
                                                    GoodsId)
                        of
                        {ok, NewRole} ->
                            achieve_shop:push_use(NewRole, GoodsType),
                            {ok, NewRole};
                        _ -> {ok, Role1}
                    end;
                _ ->
                    {false,
                     notice:format(lang:get("你已经拥有了~ts"),
                                   [{string_2, 5, Name}])}
            end;
        _ -> {false, lang:get("不能使用")}
    end;
do({38, Val}, _ItemBas,
   Role = #role{m_mount =
                    #m_mount{ride_mount = RideMount, mounts = Mounts}}) ->
    case RideMount =/= 0 of
        true ->
            case lists:keyfind(RideMount, #mount.index, Mounts) of
                #mount{spirit = Spirit} when Spirit > 450 ->
                    {false, lang:get("主人，我已经吃饱了，再吃就跑不动了{face_1,21}")};
                _ ->
                    case mount:add_mount_spirit(Role, RideMount, Val) of
                        {ok, NewRole} -> {ok, NewRole};
                        _Else -> _Else
                    end
            end;
        false -> {false, lang:get("您未骑乘坐骑，不能使用")}
    end;
do({41, {Val, ExpireTime}}, _ItemBase, Role) ->
    AppearanceName = case mount_data:get(Val) of
                         #{name := _Name} -> _Name;
                         _ -> lang:get("无名坐骑")
                     end,
    NoticeMsg =
        notice:format(lang:get("获得~ts坐骑幻化，属性提升了{face_1,38}"),
                      [{string_2, 5, AppearanceName}]),
    notice:return(NoticeMsg),
    case mount:add_mount_appearance(Role, Val, ExpireTime)
        of
        {ok,
         NewRole = #role{m_mount =
                             #m_mount{appearance_list = AppLilst}}} ->
            case lists:keyfind(Val, 1, AppLilst) of
                {AppearanceId, Expire} ->
                    logger:debug("发送协议:17021:~w",
                                 [{AppearanceId, Expire}],
                                 item_effect,
                                 1285),
                    role:link_send(Role, 17021, {AppearanceId, Expire}),
                    ok;
                _ -> ok
            end,
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
do({49, Val}, _ItemBase,
   Role = #role{m_mount = #m_mount{mounts = Mounts}}) ->
    case lists:keymember(1, #mount.live_status, Mounts) of
        true -> mount:check_active_mount(Role, Val);
        false -> {false, lang:get("使用失败，您没有坐骑蛋需要进行孵化")}
    end;
do({66,
    {EqmLev,
     EqmType,
     BaseAttrLev,
     PointAttr,
     {SkillType, SkillId},
     ExchangeGain}},
   _ItemBase = #item_base{}, Role = #role{}) ->
    case eqm:make_perfect_eqm(Role,
                              {EqmLev,
                               EqmType,
                               BaseAttrLev,
                               PointAttr,
                               {SkillType, SkillId},
                               ExchangeGain})
        of
        {false, Reason} ->
            logger:debug("使用道具出错:~ts", [Reason], item_effect, 1306),
            {false, Reason};
        {ok, NewRole} -> {ok, NewRole}
    end;
do({67, WingId, ExpireTime},
   _ItemBase = #item_base{id = BaseId}, Role = #role{}) ->
    case wing:use_wing_appearance(BaseId,
                                  WingId,
                                  ExpireTime,
                                  Role)
        of
        {false, Reason} ->
            logger:debug("使用道具出错:~ts", [Reason], item_effect, 1314),
            {false, Reason};
        {ok, NewRole} -> {ok, NewRole}
    end;
do({71, {BaseId, TimeId}}, _ItemBase, Role) ->
    case head:wear_head_frame({BaseId, TimeId}, Role) of
        {ok, NewRole, Msg} ->
            notice:return(Msg),
            {ok, NewRole};
        {false, Reason} -> {false, Reason};
        _False -> {false, lang:get("无法使用此物品")}
    end;
do({74, 0}, _ItemBase, Role) ->
    case quest_exp_bottle:rpc_accept(Role) of
        {ok, NewRole} ->
            notice:return("开启经验瓶任务"),
            {ok, NewRole};
        {false, Reason} -> {false, Reason};
        _False -> {false, lang:get("无法使用此物品")}
    end;
do({75, Flag}, _ItemBase, Role = #role{lev = Lev}) ->
    Role1 = case Flag of
                0 ->
                    G = #gain{label = prac_exp, val = 300},
                    case skill_prac:add_cycle_exp(Role, 1, G) of
                        {ok, NRole} -> NRole;
                        _Err1 ->
                            logger:error("增加冒险经验失败~w",
                                         [_Err1],
                                         item_effect,
                                         1352),
                            Role
                    end;
                1 ->
                    case role_gain:do_notice([#gain{label = coin,
                                                    val = 300000}],
                                             Role)
                        of
                        {ok, NewRole} -> NewRole;
                        _Err2 ->
                            logger:error("增加银币失败:~w",
                                         [_Err2],
                                         item_effect,
                                         1359),
                            Role
                    end;
                _ -> Role
            end,
    Exp = (243 * Lev + 7200) * 3,
    case role_gain:do([#gain{label = exp, val = Exp}],
                      Role1,
                      #{})
        of
        {ok, Role2, #{new_gl := NewGL}} ->
            Msg1 = case NewGL of
                       [#gain{label = exp, val = Exp1}] ->
                           notice:format(lang:get("获得~ts经验"),
                                         [{string_2, 5, Exp1}]);
                       [#gain{label = coin, val = Coin1}] ->
                           notice:format(lang:get("获得~ts银币"),
                                         [{string_2, 5, Coin1}]);
                       _ ->
                           notice:format(lang:get("获得~ts经验"),
                                         [{string_2, 5, Exp}])
                   end,
            Msg2 = notice:format(lang:get("~ts"),
                                 [{string_1, Msg1}]),
            notice:send(Role2, 3, Msg2),
            {ok, Role2};
        _Err3 ->
            logger:debug("使用师徒道具失败:~w", [_Err3], item_effect, 1379),
            {false, lang:get("使用师徒道具失败")}
    end;
do({76, {MemNum, GainGold}}, _ItemBase,
   Role = #role{m_guild = MGuild}) ->
    case MGuild of
        #m_guild{id = GuildId} ->
            case guild_mgr:info(by_id, GuildId) of
                {ok, #guild{mem_num = Num}} when Num < MemNum ->
                    NoticeMsg = notice:format(lang:get("公会人数不足~ts"),
                                              [{string_2, 5, MemNum}]),
                    {false, NoticeMsg};
                {ok, _Guild} ->
                    Gain = format:val_to_gain([{90026, GainGold}]),
                    case role_gain:do_notice(Gain, Role) of
                        {ok, GainRole} -> {ok, GainRole};
                        _ -> {false, lang:get("使用物品失败")}
                    end;
                _ -> {false, lang:get("您没有加入公会, 无法使用此物品")}
            end;
        _ -> {false, lang:get("您没有加入公会, 无法使用此物品")}
    end;
do({77, Model}, _ItemBase, Role = #role{lev = Lev}) ->
    case item_data:get_model({Model, Lev}) of
        #{base_id := BaseId, num := Num} ->
            Gain = format:val_to_gain([{BaseId, Num}]),
            case role_gain:do_notice(Gain, Role) of
                {ok, GainRole} -> {ok, GainRole};
                _ -> {false, lang:get("使用道具失败")}
            end;
        _ ->
            logger:error("道具数据模型取不到配置：~w",
                         [{Model, Lev}],
                         item_effect,
                         1418),
            {false, lang:get("使用物品失败")}
    end;
do(Effect, _ItemBase, Role)
    when is_tuple(Effect), tuple_size(Effect) >= 2,
         element(1, Effect) =:= 3 ->
    SkillIds = [element(I, Effect)
                || I <- lists:seq(2, tuple_size(Effect))],
    pet_skill:learn_book(SkillIds, Role);
do({78, Money}, _ItemBase,
   Role = #role{id = {Rid, P, Z}, channel_reg = ChannelReg,
                account = Account, name = Name, lev = Lev,
                classes = Classes}) ->
    Gold = Money * 10,
    Sn = lists:concat([p, date:unixtime(ms) * 100000000, Rid]),
    case db:exec("insert into charge(sn, type, status, gold, "
                 "charge_type, money, account, rid, platform, "
                 "zone_id, channel_reg, name, classes, lev, is_test, "
                 "ts) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                 "?, ?, ?)",
                 [Sn,
                  1,
                  0,
                  Gold,
                  0,
                  Gold,
                  Account,
                  Rid,
                  P,
                  Z,
                  ChannelReg,
                  Name,
                  Classes,
                  Lev,
                  1,
                  date:unixtime()])
        of
        ok ->
            charge:notice(Rid, P, Z, Sn),
            {ok, Role};
        _ -> {false, lang:get("使用物品失败")}
    end;
do(_Eff, _ItemBase, _Role) ->
    logger:error("错误的物品使用效果:~w", [_Eff], item_effect, 1424),
    {false, lang:get("使用物品失败")}.

unit_list([], _, _, List) -> List;
unit_list(Ids, [], Args = #{map_list := MapList},
          List) ->
    unit_list(Ids, MapList, Args, List);
unit_list([Id | T], [MapId | MT],
          Args = #{base_id := BaseId, group := Group,
                   name := Name, id := RoleId},
          List) ->
    NewList = case map:rand_pos(MapId) of
                  {PosX, PosY} ->
                      case unit_data:get(BaseId) of
                          {error, _Reason} -> List;
                          UnitBase = #unit_data{name = UnitName} ->
                              {ok, Unit} = unit_convert:to({unit,
                                                            {MapId, PosX, PosY},
                                                            [],
                                                            ""},
                                                           UnitBase),
                              Add = {{33, Id},
                                     Unit#unit{data =
                                                   [{group, Group},
                                                    {role_id, RoleId},
                                                    {name, Name}],
                                               name =
                                                   util:flist(lang:get("~ts的~ts"),
                                                              [Name,
                                                               UnitName])}},
                              [Add | List]
                      end;
                  _ -> List
              end,
    unit_list(T, MT, Args, NewList).

