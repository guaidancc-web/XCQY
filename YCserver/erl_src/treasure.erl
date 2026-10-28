-file("src/mod/treasure/treasure.erl", 1).

-module(treasure).

-behaviour(gen_server).

-export([start_link/1,
         use/2,
         check_use/1,
         push_13600/1,
         init/0,
         get_reward/1,
         get_compass/1,
         login/1,
         timeout/1,
         rpc_get_reward/1,
         fuse/1,
         get_ghost_reward/4,
         kill_ghost_box/2,
         get_ghost_lev/1,
         check_combat_cond/3,
         callback_combat_cond_notice/2,
         notice_item/2,
         zero_flush/2,
         kill_unit/1,
         init_model/1]).

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

-file("src/mod/treasure/treasure.erl", 35).

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

-file("src/mod/treasure/treasure.erl", 36).

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

-file("src/mod/treasure/treasure.erl", 37).

-file("inc/treasure.hrl", 1).

-record(treasure_reward,
        {map_id = 0,
         use_id = 0,
         reward_id = 0,
         reward_time = 0,
         show = []}).

-record(treasure_compass,
        {compass_id = 0,
         use_id = 0,
         compass_endtime = 0,
         map_id = 0,
         x = 0,
         y = 0}).

-record(m_treasure,
        {status = 0,
         reward = #treasure_reward{},
         compass = #treasure_compass{},
         total_count = 0}).

-record(treasure, {id = 1, type = 1, val = 1, num = 1}).

-record(treasure_data,
        {type = 1,
         val = 1,
         num = 1,
         ratio = 0,
         show_ratio = 0,
         can_show = 1,
         sex = 0,
         lev_low = 0,
         lev_high = 0,
         classes = 0,
         break_times_min = 0,
         break_times_max = 0}).

-file("src/mod/treasure/treasure.erl", 38).

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

-file("src/mod/treasure/treasure.erl", 39).

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

-file("src/mod/treasure/treasure.erl", 40).

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

-file("src/mod/treasure/treasure.erl", 41).

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

-file("src/mod/treasure/treasure.erl", 42).

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

-file("src/mod/treasure/treasure.erl", 43).

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

-file("src/mod/treasure/treasure.erl", 44).

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

-file("src/mod/treasure/treasure.erl", 45).

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

-file("src/mod/treasure/treasure.erl", 46).

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

-file("src/mod/treasure/treasure.erl", 47).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/treasure/treasure.erl", 48).

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

-file("src/mod/treasure/treasure.erl", 49).

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

-file("src/mod/treasure/treasure.erl", 50).

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

-file("src/mod/treasure/treasure.erl", 51).

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

-file("src/mod/treasure/treasure.erl", 52).

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

-file("src/mod/treasure/treasure.erl", 53).

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

-file("src/mod/treasure/treasure.erl", 54).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/treasure/treasure.erl", 55).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/treasure/treasure.erl", 56).

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

-file("src/mod/treasure/treasure.erl", 57).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state,
        {ghost_list = [],
         lack_of = [],
         is_auto_inc = 0,
         ghost_box_timer,
         cross_type = 0,
         unit_list = []}).

-record(treasure_map_ghost, {map_base_id = 0, len = 0}).

-record(treasure_ghost_unit,
        {id = {0, 0}, lev = 0, map_base_id = 0}).

-export([gm_start_ghost_box/1,
         gm_lookup_units/1,
         gm_clean_ghost_box/0]).

gm_start_ghost_box(#role{pid = Pid, name = Name}) ->
    gen_server:cast(treasure, {ghost_box, Pid, Name}),
    "开启封妖".

gm_lookup_units(MapBaseId) ->
    Ms = [{#treasure_ghost_unit{map_base_id = '$1',
                                _ = '_'},
           [{'=:=', '$1', MapBaseId}],
           ['$_']}],
    case catch ets:select(treasure_ghost_unit, Ms) of
        List = [_ | _] ->
            util:flist("MapBaseId:~w 封妖单位数量为:~w",
                       [MapBaseId, length(List)]);
        _False -> util:flist("MapBaseId:~w 没有封妖单位", [MapBaseId])
    end.

gm_clean_ghost_box() ->
    List = ets:tab2list(treasure_ghost_unit),
    [unit:stop(UnitId)
     || #treasure_ghost_unit{id = UnitId} <- List],
    ets:delete_all_objects(treasure_ghost_unit),
    gen_server:cast(treasure, clean_ghost_box),
    "清除封妖成功".

add_map_pet(_UnitBaseId, RoleName, RoleLev) ->
    gen_server:cast(treasure,
                    {add_map_pet, RoleName, RoleLev}),
    ok.

kill_unit(UnitId) ->
    gen_server:cast(treasure, {kill_unit, UnitId}),
    ok.

init_model(BaseId) ->
    case treasure_data:get_model(BaseId) of
        ModelId when is_integer(ModelId) -> ModelId;
        _ -> 0
    end.

start_link(Mod) ->
    gen_server:start_link({local, treasure},
                          treasure,
                          [Mod],
                          []).

init([Mod]) ->
    logger:info("正在启动:[~w]", [treasure], treasure, 150),
    process_flag(trap_exit, true),
    ets:new(treasure_ghost_unit,
            [set,
             public,
             {keypos, #treasure_ghost_unit.id},
             named_table]),
    Ref = erlang:send_after(40 * 1000,
                            self(),
                            timer_ghost_box),
    CrossType = case Mod of
                    center -> 1;
                    _ -> 0
                end,
    logger:info("启动完成:[~w]", [treasure], treasure, 158),
    {ok,
     #state{ghost_box_timer = Ref, cross_type = CrossType}}.

handle_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.

handle_cast({ghost_box, Pid, Name}, State) ->
    NewState = ghost_box(State, Pid, Name, treasure),
    {noreply, NewState};
handle_cast({ghost_box_maze, Pid, Name}, State) ->
    NewState = ghost_box(State, Pid, Name, maze),
    {noreply, NewState};
handle_cast({kill_ghost_box, MapBaseId, UnitId},
            State = #state{ghost_list = GhostList}) ->
    NewState = case lists:keytake(MapBaseId,
                                  #treasure_map_ghost.map_base_id,
                                  GhostList)
                   of
                   {value,
                    MapGhost = #treasure_map_ghost{len = Len},
                    RestGhostList} ->
                       ets:delete(treasure_ghost_unit, UnitId),
                       NewMapGhost = MapGhost#treasure_map_ghost{len =
                                                                     Len - 1},
                       State#state{ghost_list = [NewMapGhost | RestGhostList]};
                   _False -> State
               end,
    {noreply, NewState};
handle_cast(clean_ghost_box, State) ->
    logger:debug("清除封妖成功", [], treasure, 184),
    Ref = erlang:send_after(40 * 1000,
                            self(),
                            timer_ghost_box),
    {noreply,
     State#state{ghost_list = [], ghost_box_timer = Ref}};
handle_cast({kill_unit, UnitId},
            State = #state{unit_list = UnitList}) ->
    NewUnitList = lists:keydelete(UnitId,
                                  #unit.id,
                                  UnitList),
    {noreply, State#state{unit_list = NewUnitList}};
handle_cast({add_map_pet, RoleName, RoleLev},
            State = #state{unit_list = OldUnitList}) ->
    [unit_mgr:remove(Unit) || Unit <- OldUnitList],
    Zero = date:unixtime(zero),
    CalcLev = case get(treasure_avg_lev) of
                  {Zero, AvgLev} -> AvgLev;
                  _ ->
                      case rank:list_show(1) of
                          L = [_ | _] ->
                              L1 = lists:sublist(L, 50),
                              AllLev = lists:sum([Lev
                                                  || #rank_rc{val1 = Lev}
                                                         <- L1]),
                              L2 = length(L1),
                              AvgLev = round(AllLev / L2),
                              put(treasure_avg_lev, {Zero, AvgLev}),
                              AvgLev;
                          _ ->
                              case world_lev:get_world_lev() of
                                  {WorldLev, _} -> WorldLev;
                                  _ -> RoleLev
                              end
                      end
              end,
    case treasure_data:get_map_pet(CalcLev) of
        {Num, PetIdList, MapList} ->
            case util:rand_list(MapList) of
                MapId when is_integer(MapId) ->
                    case unit_mgr:fetch_ids(Num) of
                        {ok, Ids} ->
                            UnitList = do_add_map_pet(MapId,
                                                      Ids,
                                                      PetIdList,
                                                      []),
                            MapName = case map_data:get(MapId) of
                                          {ok, #map_data{name = TName}} ->
                                              TName;
                                          _ -> ""
                                      end,
                            Msg =
                                notice:format(lang:get("~ts挖塌了宠物商店，一群可爱又可怜的宝宝走失在~ts，大家快去抱养回家{face_1,7}"),
                                              [{role_2, RoleName},
                                               {string_2, 1, MapName}]),
                            notice:cast(all, 5, Msg),
                            {noreply, State#state{unit_list = UnitList}};
                        _ -> {noreply, State}
                    end;
                _ -> {noreply, State}
            end;
        _ -> {noreply, State}
    end;
handle_cast(Msg, State) ->
    logger:error("[~w]收到错误的消息:[~w]",
                 [treasure, Msg],
                 treasure,
                 240),
    {noreply, State}.

handle_info(timer_ghost_box, State) ->
    NewState = timer_gen_ghost_box(State),
    {noreply, NewState};
handle_info({'EXIT', _Pid, normal}, State) ->
    {noreply, State};
handle_info(Info, State) ->
    logger:error("[~w]收到错误的消息:[~w]",
                 [treasure, Info],
                 treasure,
                 249),
    {noreply, State}.

terminate(Reason, #state{ghost_box_timer = TRef}) ->
    catch erlang:cancel_timer(TRef),
    case Reason of
        normal ->
            logger:info("上古妖魔正常关闭:[~w]", [treasure], treasure, 256);
        shutdown ->
            logger:error("由Supervisor主动shutdown上古妖魔进程",
                         [],
                         treasure,
                         258);
        _Unknow ->
            logger:error("[~w]关闭异常:[Reason:~w]",
                         [treasure, _Unknow],
                         treasure,
                         260)
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_add_map_pet(_MapId, [], _PetIdList, UnitList) ->
    UnitList;
do_add_map_pet(MapId, [Id | T], PetIdList, UnitList) ->
    case util:rand_list(PetIdList, 2) of
        {PetBaseId, _} ->
            {GetM, GetX, GetY} = case map:rand_pos(MapId) of
                                     {X, Y} -> {MapId, X, Y};
                                     _ ->
                                         util:rand_list([{10001, 306, 3507},
                                                         {10001, 2583, 3848},
                                                         {10001, 4957, 3680},
                                                         {10001, 445, 2565},
                                                         {10001, 4646, 704},
                                                         {10001, 841, 1033},
                                                         {10001, 2098, 1834},
                                                         {10001, 3617, 1816}])
                                 end,
            case unit_mgr:create({42, Id},
                                 PetBaseId,
                                 {GetM, GetX, GetY})
                of
                {ok, Unit} ->
                    do_add_map_pet(MapId, T, PetIdList, [Unit | UnitList]);
                _False -> do_add_map_pet(MapId, T, PetIdList, UnitList)
            end;
        _ -> do_add_map_pet(MapId, T, PetIdList, UnitList)
    end.

init() -> #m_treasure{}.

login(Role = #role{m_treasure =
                       #m_treasure{status = 2,
                                   compass =
                                       #treasure_compass{compass_endtime =
                                                             EndTime}}}) ->
    Now = date:unixtime(),
    case Now >= EndTime of
        true ->
            Role1 = reset_compass(Role),
            {ok, Role1};
        false ->
            Timeout = EndTime - Now,
            NewRole = set_compass_timer(Role, Timeout),
            {ok, NewRole}
    end;
login(_Role) -> ok.

zero_flush(Role, _) ->
    push_13600(Role),
    ok.

push_13600(Role = #role{m_treasure =
                            #m_treasure{status = Status,
                                        reward =
                                            #treasure_reward{reward_id =
                                                                 RewardId,
                                                             reward_time =
                                                                 RewardTime,
                                                             show = ShowList},
                                        compass =
                                            #treasure_compass{compass_id =
                                                                  CompassId,
                                                              compass_endtime =
                                                                  CompassEndTime,
                                                              map_id = MapId,
                                                              x = Mapx,
                                                              y = Mapy}}}) ->
    GainNum = max(0,
                  10 - var:get_var(Role, day_five, 106, 0)),
    role:link_send(Role,
                   13600,
                   {Status,
                    GainNum,
                    RewardId,
                    RewardTime,
                    ShowList,
                    CompassId,
                    CompassEndTime,
                    MapId,
                    Mapx,
                    Mapy}),
    ok.

fuse(Role) ->
    Loss = [#loss{label = item_base_id_auto_buy,
                  val = [{20054, 1}, {20055, 1}, {20056, 1}, {20057, 1}],
                  msg = lang:get("材料不足, 无法兑换"),
                  auto_scene = lang:get("兑换高级宝图")}],
    case role_gain:do_notice(Loss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, Role1} ->
            Gain = [#gain{label = item_base_id,
                          val = [{20053, 1, 1}]}],
            case role_gain:do_notice(Gain, Role1) of
                {false, _} -> {false, lang:get("道具不存在, 无法兑换")};
                {ok, NewRole} -> {ok, NewRole}
            end
    end.

use(#role{m_treasure = #m_treasure{status = 1}}, _) ->
    {false, lang:get("当前还有宝图奖励未领取,请勿再次使用")};
use(#role{m_treasure = #m_treasure{status = 2}}, _) ->
    {false, lang:get("当前正在进行指南针任务中,请勿再次使用")};
use(_, #item{quantity = Quantity}) when Quantity < 1 ->
    {false, lang:get("藏宝图数量不足，无法使用")};
use(Role = #role{m_treasure =
                     Mtreasure = #m_treasure{status = 0,
                                             total_count = Total}},
    Item = #item{base_id = BaseId, extra = Extra}) ->
    case check_pos(Role, Extra, BaseId) of
        {false, Reason} -> {false, Reason};
        {true, MapId, NewExtra} ->
            case loss_treasure(Item#item{extra = NewExtra}, Role) of
                {false, Reason} -> {false, Reason};
                {ok, NewRole} ->
                    case get_list(NewRole, BaseId) of
                        {true, RewardNum, AllList} ->
                            Reward = #treasure_reward{map_id = MapId,
                                                      use_id = BaseId,
                                                      reward_id = RewardNum,
                                                      reward_time =
                                                          date:unixtime() + 10,
                                                      show = AllList},
                            NewMtreasure = Mtreasure#m_treasure{status = 1,
                                                                reward = Reward,
                                                                total_count =
                                                                    Total + 1},
                            NewRole1 = NewRole#role{m_treasure = NewMtreasure},
                            NewRole2 = set_reward_timer(NewRole1),
                            push_13600(NewRole2),
                            NewRole3 = role_trigger:fire(#evt_treasure{base_id =
                                                                           BaseId},
                                                         NewRole2),
                            {ok, NewRole3};
                        {false, Reason} -> {false, Reason}
                    end
            end
    end.

check_use(Role) ->
    case role_misc:check_event(Role) of
        {false, Reason} -> {false, Reason};
        true ->
            Result = case team:get_status(Role) of
                         {true, 1} -> true;
                         {true, 3} -> true;
                         false -> true;
                         _ -> false
                     end,
            case Result of
                false -> {false, lang:get("在队伍中不能进行挖宝")};
                true -> true
            end
    end.

set_reward_timer(Role) ->
    Timer = #timer{id = treasure_reward,
                   timeout = 15 * 1000, times = 1, m = treasure,
                   f = rpc_get_reward, a = []},
    role_timer:set(Timer, Role).

del_reward_timer(Role) ->
    role_timer:del(treasure_reward, Role).

rpc_get_reward(Role) ->
    role:rpc(Role#role.pid, 13601, {}),
    ok.

get_reward(Role = #role{m_treasure =
                            #m_treasure{status = 1, reward = Reward}}) ->
    case do_get_reward(Role, Reward) of
        {ok, NewRole} ->
            push_13600(NewRole),
            NewRole1 = del_reward_timer(NewRole),
            {ok, NewRole1};
        {false, Reason} -> {false, Reason}
    end;
get_reward(_) -> ok.

do_get_reward(Role,
              Reward = #treasure_reward{reward_id = GainId,
                                        show = GainList}) ->
    case lists:keyfind(GainId, #treasure.id, GainList) of
        #treasure{type = Type, val = Val, num = Num} ->
            calc_get_reward(Role, Reward, Type, Val, Num);
        _ ->
            Role1 = reset_reward(Role),
            {ok, Role1}
    end.

calc_get_reward(Role = #role{name = Name},
                #treasure_reward{use_id = UseId}, 1, Val, Num) ->
    Result = case UseId of
                 20052 ->
                     case Val < 90000 of
                         true ->
                             case buff:get_info_by_special_effect(Role, 14) of
                                 {true, BuffId, BuffName} ->
                                     case
                                         buff:is_special_effect_exists_two_param(Role,
                                                                                 14)
                                         of
                                         {true, Ratio, Value} ->
                                             case util:rand(0, 1000) < Ratio of
                                                 true ->
                                                     case
                                                         buff:get_ext_param(Role,
                                                                            BuffId,
                                                                            1)
                                                         of
                                                         {true, Count} ->
                                                             case Count < Value
                                                                 of
                                                                 true ->
                                                                     {true,
                                                                      BuffId,
                                                                      BuffName,
                                                                      Value -
                                                                          Count
                                                                          - 1};
                                                                 false -> false
                                                             end;
                                                         false ->
                                                             {true,
                                                              BuffId,
                                                              BuffName,
                                                              Value - 1}
                                                     end;
                                                 false -> false
                                             end;
                                         false -> false
                                     end;
                                 _ -> false
                             end;
                         false -> false
                     end;
                 _ -> false
             end,
    {Num1, Role4} = case Result of
                        {true, BuffId1, BuffName1, LeftCount} ->
                            logger:debug("存在运势buff,触发了双倍效果", [], treasure, 468),
                            case buff:add_ext_param(Role, BuffId1, 1, 1) of
                                {ok, Role3} ->
                                    {MsgRole, TreasureDoubleMsg} = case
                                                                       LeftCount
                                                                       of
                                                                       0 ->
                                                                           NoticeMsg1 =
                                                                               notice:format(lang:get("在~ts作用下, 获得了额外奖励, 祝福效果消失了"),
                                                                                             [{string_2,
                                                                                               5,
                                                                                               util:flist("[~ts]",
                                                                                                          [BuffName1])}]),
                                                                           case
                                                                               buff:del(Role3,
                                                                                        [BuffId1])
                                                                               of
                                                                               {ok,
                                                                                DelBuffRole} ->
                                                                                   {DelBuffRole,
                                                                                    NoticeMsg1};
                                                                               _ ->
                                                                                   {Role3,
                                                                                    NoticeMsg1}
                                                                           end;
                                                                       _ ->
                                                                           {Role3,
                                                                            notice:format(lang:get("在~ts作用下, 获得了额外奖励, 剩余~ts次"),
                                                                                          [{string_2,
                                                                                            5,
                                                                                            util:flist("[~ts]",
                                                                                                       [BuffName1])},
                                                                                           {string_2,
                                                                                            5,
                                                                                            LeftCount}])}
                                                                   end,
                                    notice:send(MsgRole, 3, TreasureDoubleMsg),
                                    {Num * 2, MsgRole};
                                _ -> {Num, Role}
                            end;
                        false -> {Num, Role}
                    end,
    Gain = format:val_to_gain([{Val, 0, Num1}]),
    case role_gain:do_notice(Gain, Role4) of
        {ok, Role1} ->
            case format:gain_to_val(Gain) of
                [{NewVal, NewNum}] ->
                    log:treasure(Role1,
                                 lang:get("道具"),
                                 UseId,
                                 NewVal,
                                 NewNum),
                    case treasure_data:is_cast(Val) of
                        1 ->
                            case UseId of
                                20053 ->
                                    Content =
                                        notice:format(lang:get("风雷际会！~ts在挖~ts的时候获得了一个~ts！"),
                                                      [{role_2, Name},
                                                       {item_2, UseId},
                                                       {item_2,
                                                        NewVal,
                                                        NewNum}]),
                                    notice:cast(all, 5, Content);
                                _ ->
                                    Content =
                                        notice:format(lang:get("~ts在挖宝的过程中被绊了一下， 回头一看发现是~ts！"),
                                                      [{role_2, Name},
                                                       {item_2,
                                                        NewVal,
                                                        NewNum}]),
                                    notice:cast(all, 5, Content)
                            end;
                        _ -> ok
                    end;
                _ -> ok
            end,
            Role2 = reset_reward(Role1),
            {ok, Role2};
        {false, #gain{msg = Msg}} -> {false, Msg}
    end;
calc_get_reward(Role = #role{m_treasure = Mtreasure,
                             pid = RolePid},
                #treasure_reward{map_id = MapId, use_id = UseId}, 2,
                Val, _Num) ->
    {GetM, GetX, GetY} = case map:rand_pos(MapId) of
                             {X, Y} -> {MapId, X, Y};
                             _ ->
                                 util:rand_list([{10001, 306, 3507},
                                                 {10001, 2583, 3848},
                                                 {10001, 4957, 3680},
                                                 {10001, 445, 2565},
                                                 {10001, 4646, 704},
                                                 {10001, 841, 1033},
                                                 {10001, 2098, 1834},
                                                 {10001, 3617, 1816}])
                         end,
    GetTime = case treasure_data:get_compass(Val) of
                  {{Time}, _} -> Time;
                  _ -> 1200
              end,
    Compass = #treasure_compass{compass_id = Val,
                                use_id = UseId,
                                compass_endtime = GetTime + date:unixtime(),
                                map_id = GetM, x = GetX, y = GetY},
    NewMtreasure = Mtreasure#m_treasure{compass = Compass},
    Role1 = Role#role{m_treasure = NewMtreasure},
    Role2 = reset_reward(Role1, 2),
    Role3 = set_compass_timer(Role2, GetTime),
    notice:send({pid, RolePid},
                1,
                lang:get("挖到一个指南针, 似乎在指引着什么宝藏")),
    {ok, role_trigger:fire(#evt_treasure_compass{}, Role3)};
calc_get_reward(Role = #role{pid = RolePid},
                #treasure_reward{use_id = UseId}, 3, Val, _Num) ->
    case unit_data:get(Val) of
        UnitData = #unit_data{} ->
            notice:send({pid, RolePid},
                        1,
                        lang:get("你挖塌了妖怪的老家, 妖怪要和你决一死战")),
            combat_mgr:kill_npc(Role, [Role], UnitData);
        _ -> skip
    end,
    Role1 = reset_reward(Role),
    log:treasure(Role1, lang:get("战斗"), UseId, 0, 0),
    {ok, Role1};
calc_get_reward(Role = #role{pid = RolePid,
                             name = RoleName, lev = RoleLev},
                #treasure_reward{use_id = UseId}, 5, Val, _Num) ->
    case unit_data:get(Val) of
        UnitData = #unit_data{id = UnitBaseId,
                              name = UnitName} ->
            add_map_pet(UnitBaseId, RoleName, RoleLev),
            Msg = notice:format(lang:get("你偶遇了一只~ts，赶紧抓住它！"),
                                [{string_2, 1, UnitName}]),
            notice:pop({pid, RolePid}, 0, Msg),
            CombatArgs = #combat_start_args{},
            combat_mgr:kill_npc(Role,
                                [Role],
                                UnitData,
                                44,
                                CombatArgs);
        _ -> skip
    end,
    Role1 = reset_reward(Role),
    log:treasure(Role1, lang:get("宠物战斗"), UseId, 0, 0),
    {ok, Role1};
calc_get_reward(Role = #role{pid = Pid, name = Name},
                #treasure_reward{use_id = UseId}, 4, _Val, _Num) ->
    gen_server:cast(treasure, {ghost_box, Pid, Name}),
    Role1 = reset_reward(Role),
    log:treasure(Role1, lang:get("放妖"), UseId, 0, 0),
    {ok, Role1};
calc_get_reward(Role, _Reward, _Type, _Val, _Num) ->
    Role1 = reset_reward(Role),
    {ok, Role1}.

reset_reward(Role = #role{m_treasure = Mtreasure}) ->
    NewMtreasure = Mtreasure#m_treasure{status = 0,
                                        reward = #treasure_reward{}},
    Role#role{m_treasure = NewMtreasure}.

reset_reward(Role = #role{m_treasure = Mtreasure},
             Status) ->
    NewMtreasure = Mtreasure#m_treasure{status = Status,
                                        reward = #treasure_reward{}},
    Role#role{m_treasure = NewMtreasure}.

get_compass(Role = #role{pid = RolePid,
                         m_treasure =
                             #m_treasure{status = 2,
                                         compass =
                                             Compass = #treasure_compass{use_id
                                                                             =
                                                                             UseId}},
                         name = Name}) ->
    Now = date:unixtime(),
    case check_compass(Role, Compass, Now) of
        timeout ->
            Role1 = reset_compass(Role),
            Role2 = del_compass_timer(Role1),
            push_13600(Role2),
            {ok, Role2};
        {false, Reason} -> {false, Reason};
        {true, Gain = [_ | _]} ->
            case role_gain:do_notice(Gain, Role) of
                {ok, Role1} ->
                    notice:gain_item(RolePid, 1, Gain),
                    Role2 = reset_compass(Role1),
                    Role3 = del_compass_timer(Role2),
                    push_13600(Role3),
                    case format:gain_to_val(Gain) of
                        [{ItemId, Num}] ->
                            log:treasure(Role3,
                                         lang:get("指南针"),
                                         UseId,
                                         ItemId,
                                         Num),
                            case treasure_data:is_cast(ItemId) of
                                1 ->
                                    Content =
                                        notice:format(lang:get("~ts使用~ts挖宝后，获得了神奇的指南针，几经波折挖到了~ts！"),
                                                      [{role_2, Name},
                                                       {item_2, UseId},
                                                       {item_2, ItemId, Num}]),
                                    notice:cast(all, 5, Content);
                                _ -> ok
                            end;
                        _ -> ok
                    end,
                    {ok, Role3};
                {false, #gain{msg = Msg}} -> {false, Msg}
            end;
        _ ->
            Role1 = reset_compass(Role),
            Role2 = del_compass_timer(Role1),
            push_13600(Role2),
            {ok, Role2}
    end;
get_compass(_) -> {false, lang:get("当前没有可领取的指南针任务")}.

check_compass(_Role,
              #treasure_compass{compass_endtime = EndTime}, Now)
    when Now > EndTime ->
    timeout;
check_compass(Role = #role{pos =
                               #pos{map = MapId, x = Rx, y = Ry}},
              #treasure_compass{compass_id = CompassId,
                                map_id = MapId, x = X, y = Y},
              _Now) ->
    case abs(Rx - X) =< 250 andalso abs(Ry - Y) =< 250 of
        true ->
            case treasure_data:get_compass(CompassId) of
                {_, GainList} ->
                    NewGainList = check_role_cond(Role, GainList),
                    case rand_compass(NewGainList) of
                        {true, ItemId, Num} ->
                            Gain = format:val_to_gain([{ItemId, 0, Num}]),
                            {true, Gain};
                        false ->
                            logger:error("找不到指南针:~w的奖励数据",
                                         [CompassId],
                                         treasure,
                                         646),
                            error
                    end;
                _ ->
                    logger:error("找不到指南针:~w的奖励数据",
                                 [CompassId],
                                 treasure,
                                 650),
                    error
            end;
        false -> {false, lang:get("距离宝藏地点过远")}
    end;
check_compass(_, _, _) -> {false, lang:get("距离宝藏地点过远")}.

rand_compass([]) -> false;
rand_compass(GainList) ->
    Sum = lists:sum([Ratio
                     || #{ratio := Ratio} <- GainList]),
    Rand = util:rand(1, Sum),
    do_rand_compass(GainList, Rand).

do_rand_compass([#{ratio := Ratio, val := Val,
                   num := Num}
                 | _T],
                Rand)
    when Rand =< Ratio ->
    {true, Val, Num};
do_rand_compass([#{ratio := Ratio} | T], Rand) ->
    do_rand_compass(T, Rand - Ratio).

reset_compass(Role = #role{m_treasure = Mtreasure}) ->
    NewMtreasure = Mtreasure#m_treasure{status = 0,
                                        compass = #treasure_compass{}},
    Role#role{m_treasure = NewMtreasure}.

timeout(Role = #role{m_treasure =
                         #m_treasure{status = 2,
                                     compass =
                                         #treasure_compass{compass_endtime =
                                                               EndTime}}}) ->
    Now = date:unixtime(),
    case Now >= EndTime of
        true ->
            Role1 = reset_compass(Role),
            push_13600(Role1),
            {ok, Role1};
        false ->
            Timeout = EndTime - Now,
            NewRole = set_compass_timer(Role, Timeout),
            {ok, NewRole}
    end;
timeout(Role) ->
    Role1 = del_compass_timer(Role),
    {ok, Role1}.

set_compass_timer(Role, Timeout) ->
    Timer = #timer{id = treasure_compass,
                   timeout = Timeout * 1000, times = 1, m = treasure,
                   f = timeout, a = []},
    role_timer:set(Timer, Role).

del_compass_timer(Role) ->
    role_timer:del(treasure_compass, Role).

get_list(Role, BaseId) ->
    case treasure_data:get_list(BaseId) of
        {{LenNum, _MapList}, List} ->
            NewList = check_role_cond(Role, List),
            case util:rand_list(NewList, #treasure_data.ratio) of
                undefined -> {false, lang:get("无法读取宝图数据")};
                H = #treasure_data{} ->
                    ShowList = make_show(NewList, LenNum - 1),
                    SeqList = lists:seq(1, LenNum),
                    Hnum = util:rand_list(SeqList),
                    NewSeqList = SeqList -- [Hnum],
                    NewShowList = merge_seq(ShowList, NewSeqList),
                    {true, Hnum, [to_treasure(H, Hnum) | NewShowList]}
            end;
        _ -> {false, lang:get("不可使用的藏宝图")}
    end.

to_treasure(#treasure_data{type = Type, val = Val,
                           num = Num},
            Seq) ->
    #treasure{id = Seq, type = Type, val = Val, num = Num}.

loss_treasure(Item = #item{quantity = Quantity,
                           id = ItemId, pos = Pos, base_id = BaseId},
              Role = #role{p_bag =
                               Pbag = #package{items = Items,
                                               free_cell = FreeCell}}) ->
    NewQuantity = Quantity - 1,
    NewItem = Item#item{quantity = NewQuantity},
    {NewItems, NewFreeCell} = case NewQuantity >= 1 of
                                  true ->
                                      package:push_item_info(update,
                                                             Role,
                                                             [{1, NewItem}]),
                                      {lists:keystore(ItemId,
                                                      #item.id,
                                                      Items,
                                                      NewItem),
                                       FreeCell};
                                  false ->
                                      package:push_item_info(del,
                                                             Role,
                                                             [{1, NewItem}]),
                                      {lists:keydelete(ItemId, #item.id, Items),
                                       [Pos | FreeCell]}
                              end,
    NewPbag = Pbag#package{items = NewItems,
                           free_cell = lists:sort(NewFreeCell)},
    NewRole = Role#role{p_bag = NewPbag, is_gain = true},
    Evt = [#evt_del_item{base_id = BaseId, num = 1}],
    NewRole1 = role_trigger:fire(Evt, NewRole),
    {ok, NewRole1}.

check_pos(#role{pos = #pos{map = Rmap, x = Rx, y = Ry}},
          Extra, BaseId) ->
    {MapId1, X1, Y1} = case lists:keyfind(4, 1, Extra) of
                           {_, MapId, _} ->
                               case lists:keyfind(5, 1, Extra) of
                                   {_, X, _} ->
                                       case lists:keyfind(6, 1, Extra) of
                                           {_, Y, _} -> {MapId, X, Y};
                                           _ ->
                                               util:rand_list([{10001,
                                                                306,
                                                                3507},
                                                               {10001,
                                                                2583,
                                                                3848},
                                                               {10001,
                                                                4957,
                                                                3680},
                                                               {10001,
                                                                445,
                                                                2565},
                                                               {10001,
                                                                4646,
                                                                704},
                                                               {10001,
                                                                841,
                                                                1033},
                                                               {10001,
                                                                2098,
                                                                1834},
                                                               {10001,
                                                                3617,
                                                                1816}])
                                       end;
                                   _ ->
                                       util:rand_list([{10001, 306, 3507},
                                                       {10001, 2583, 3848},
                                                       {10001, 4957, 3680},
                                                       {10001, 445, 2565},
                                                       {10001, 4646, 704},
                                                       {10001, 841, 1033},
                                                       {10001, 2098, 1834},
                                                       {10001, 3617, 1816}])
                               end;
                           _ ->
                               util:rand_list([{10001, 306, 3507},
                                               {10001, 2583, 3848},
                                               {10001, 4957, 3680},
                                               {10001, 445, 2565},
                                               {10001, 4646, 704},
                                               {10001, 841, 1033},
                                               {10001, 2098, 1834},
                                               {10001, 3617, 1816}])
                       end,
    case MapId1 =:= Rmap andalso
             abs(Rx - X1) =< 300 andalso abs(Ry - Y1) =< 300
        of
        false -> {false, lang:get("离宝藏点还很远, 请靠近再使用")};
        true ->
            {GetM, GetX, GetY} = case treasure_data:get_list(BaseId)
                                     of
                                     {{_, MapList}, _} ->
                                         {MapId2, _} = util:rand_list(MapList,
                                                                      2),
                                         case map:rand_pos(MapId2) of
                                             {X2, Y2} -> {MapId2, X2, Y2};
                                             _ ->
                                                 util:rand_list([{10001,
                                                                  306,
                                                                  3507},
                                                                 {10001,
                                                                  2583,
                                                                  3848},
                                                                 {10001,
                                                                  4957,
                                                                  3680},
                                                                 {10001,
                                                                  445,
                                                                  2565},
                                                                 {10001,
                                                                  4646,
                                                                  704},
                                                                 {10001,
                                                                  841,
                                                                  1033},
                                                                 {10001,
                                                                  2098,
                                                                  1834},
                                                                 {10001,
                                                                  3617,
                                                                  1816}])
                                         end;
                                     false ->
                                         logger:error("无法找到宝图:~w的坐标",
                                                      [BaseId],
                                                      treasure,
                                                      774),
                                         util:rand_list([{10001, 306, 3507},
                                                         {10001, 2583, 3848},
                                                         {10001, 4957, 3680},
                                                         {10001, 445, 2565},
                                                         {10001, 4646, 704},
                                                         {10001, 841, 1033},
                                                         {10001, 2098, 1834},
                                                         {10001, 3617, 1816}])
                                 end,
            Extra1 = lists:keystore(4, 1, Extra, {4, GetM, ""}),
            Extra2 = lists:keystore(5, 1, Extra1, {5, GetX, ""}),
            Extra3 = lists:keystore(6, 1, Extra2, {6, GetY, ""}),
            {true, MapId1, Extra3}
    end.

check_role_cond(Role = #role{sex = Sex, lev = Lev,
                             classes = Classes,
                             m_lev_break = #m_lev_break{times = BreakTimes},
                             m_pet = #m_pet{pets = Pets, pet_nums = PetNums}},
                List) ->
    CheckLev = case world_lev:get_world_lev(Role) of
                   {WorldLev, _} -> WorldLev + 5;
                   _ -> Lev
               end,
    CanCatchPet = case length(Pets) >= PetNums of
                      true -> 0;
                      _ -> 1
                  end,
    check_role_cond(#{lev => Lev, sex => Sex,
                      world_lev => CheckLev, classes => Classes,
                      break_times => BreakTimes, can_catch => CanCatchPet},
                    List,
                    []).

check_role_cond(_Args, [], List) -> List;
check_role_cond(Args = #{sex := Sex, lev := Lev,
                         classes := Classes, break_times := BreakTimes,
                         can_catch := 1},
                [H = #treasure_data{sex = Sex1, lev_low = LevLow,
                                    lev_high = LevHigh, classes = Classes1,
                                    type = 5, break_times_min = MinBreakTimes,
                                    break_times_max = MaxBreakTimes}
                 | T],
                List)
    when (Sex1 =:= Sex orelse Sex1 =:= 2) andalso
             (Classes1 =:= Classes orelse Classes1 =:= 0) andalso
                 (BreakTimes >= MinBreakTimes andalso
                      BreakTimes =< MaxBreakTimes)
                     andalso
                     (LevLow =:= 0 andalso LevHigh =:= 0 orelse
                          LevLow =:= 0 andalso Lev =< LevHigh orelse
                              Lev >= LevLow andalso LevHigh =:= 0 orelse
                                  Lev >= LevLow andalso Lev =< LevHigh) ->
    check_role_cond(Args, T, [H | List]);
check_role_cond(Args = #{sex := Sex, world_lev := Lev,
                         classes := Classes, break_times := BreakTimes},
                [H = #treasure_data{sex = Sex1, lev_low = LevLow,
                                    lev_high = LevHigh, classes = Classes1,
                                    type = Type,
                                    break_times_min = MinBreakTimes,
                                    break_times_max = MaxBreakTimes}
                 | T],
                List)
    when (Sex1 =:= Sex orelse Sex1 =:= 2) andalso
             Type =/= 5 andalso
                 (Classes1 =:= Classes orelse Classes1 =:= 0) andalso
                     (BreakTimes >= MinBreakTimes andalso
                          BreakTimes =< MaxBreakTimes)
                         andalso
                         (LevLow =:= 0 andalso LevHigh =:= 0 orelse
                              LevLow =:= 0 andalso Lev =< LevHigh orelse
                                  Lev >= LevLow andalso LevHigh =:= 0 orelse
                                      Lev >= LevLow andalso Lev =< LevHigh) ->
    check_role_cond(Args, T, [H | List]);
check_role_cond(Args = #{sex := Sex, lev := Lev,
                         classes := Classes, break_times := BreakTimes},
                [H = #{sex := Sex1, lev_low := LevLow,
                       lev_high := LevHigh, classes := Classes1,
                       break_times_min := MinBreakTimes,
                       break_times_max := MaxBreakTimes}
                 | T],
                List)
    when (Sex1 =:= Sex orelse Sex1 =:= 2) andalso
             (Classes1 =:= Classes orelse Classes1 =:= 0) andalso
                 (BreakTimes >= MinBreakTimes andalso
                      BreakTimes =< MaxBreakTimes)
                     andalso
                     (LevLow =:= 0 andalso LevHigh =:= 0 orelse
                          LevLow =:= 0 andalso Lev =< LevHigh orelse
                              Lev >= LevLow andalso LevHigh =:= 0 orelse
                                  Lev >= LevLow andalso Lev =< LevHigh) ->
    check_role_cond(Args, T, [H | List]);
check_role_cond(Args, [_ | T], List) ->
    check_role_cond(Args, T, List).

merge_seq(ShowList, SeqList) ->
    merge_seq(ShowList, SeqList, []).

merge_seq([], _, ShowList) -> ShowList;
merge_seq([H | T], [I | L], ShowList) ->
    H1 = to_treasure(H, I),
    merge_seq(T, L, [H1 | ShowList]);
merge_seq([_ | T], [], ShowList) ->
    merge_seq(T, [], ShowList).

make_show(List, Num) ->
    AllRatio = lists:sum([Ratio
                          || #treasure_data{show_ratio = Ratio} <- List]),
    make_show(List, AllRatio, Num, []).

make_show(_List, _Rate, Num, GetList) when Num =< 0 ->
    GetList;
make_show([], _Rate, _Num, GetList) -> GetList;
make_show(List, Rate, Num, GetList) ->
    Seed = util:rand(1, Rate),
    case do_make_show(List, Seed, Rate) of
        {NewL, GetL, NewRate} ->
            make_show(NewL, NewRate, Num - 1, [GetL | GetList]);
        {false, Reason} ->
            logger:error("宝图随机发生错误，内容为:~w",
                         [Reason],
                         treasure,
                         853),
            make_show(List, Rate, Num - 1, GetList)
    end.

do_make_show(List, Seed, Rate) ->
    do_make_show(List, Seed, Rate, 0, []).

do_make_show([], _Seed, _Rate, _Range, _Back) ->
    {false, util:flist("~w", [_Back])};
do_make_show([L = #treasure_data{show_ratio = Ratio,
                                 can_show = CanShow}
              | T],
             Seed, Rate, Range, Back) ->
    case Seed =< Ratio + Range of
        true ->
            NewCanShow = CanShow - 1,
            NewL = L#treasure_data{can_show = NewCanShow},
            case NewCanShow >= 1 of
                true -> {T ++ [NewL | Back], L, Rate};
                false -> {T ++ Back, L, Rate - Ratio}
            end;
        false ->
            do_make_show(T, Seed, Rate, Range + Ratio, [L | Back])
    end.

ghost_box(State, Pid, Name, Args) ->
    RandNum = util:rand(4, 5),
    case world_lev:get_world_lev() of
        {WorldLev, _NextTime} ->
            WorldLevSet = treasure_data:get_world_lev_set(),
            Maps = get_maps(WorldLevSet, WorldLev),
            FilterMaps = filter_map(Maps, WorldLev, State, []),
            case util:rand_list(FilterMaps) of
                Map = {_MapBaseId, _RestNum} ->
                    UnitList = ghost_map([Map], RandNum, WorldLev, []),
                    logger:debug("封妖列表:~w", [UnitList], treasure, 881),
                    Num = length(UnitList),
                    {ok, Ids} = unit_mgr:fetch_ids(Num),
                    make_ghost_notice(UnitList, Pid, Name, Args),
                    make_ghost(UnitList, Ids, State);
                _False ->
                    case util:rand_list(Maps) of
                        {MapId, _} ->
                            make_ghost_notice([{MapId, 0, 0}], Pid, Name, Args),
                            State;
                        _False -> State
                    end
            end;
        _False -> State
    end.

get_ghost_lev(Id) ->
    case ets:lookup(treasure_ghost_unit, Id) of
        [#treasure_ghost_unit{lev = Lev}] -> Lev;
        _False -> 0
    end.

make_ghost_notice(UnitList, Pid, Name, treasure) ->
    MapIds = util:remove_duplicate([Id
                                    || {Id, _, _} <- UnitList]),
    MapName = make_ghost_map_name(1, MapIds, []),
    SelfFmt = lang:get("您在挖宝时一不小心挖塌~ts，逃出的妖怪正在~ts寻滋闹事！"),
    SelfArgs = [{string_2, 5, lang:get("妖魔的洞穴")},
                {string_2, 5, MapName}],
    role:apply(async,
               Pid,
               {notice, send, [1, {SelfFmt, SelfArgs}]}),
    Args = [{role_2, Name},
            {string_2, 1, lang:get("妖魔的洞穴")},
            {string_2, 4, MapName}],
    Content =
        notice:format(lang:get("~ts在挖宝时一不小心挖塌~ts，逃出的妖怪正在~ts寻滋闹事，各路英雄们快快来剿灭他们吧！"),
                      Args),
    notice:cast(all, 6, Content);
make_ghost_notice(UnitList, _Pid, Name, maze) ->
    MapIds = util:remove_duplicate([Id
                                    || {Id, _, _} <- UnitList]),
    MapName = make_ghost_map_name(1, MapIds, []),
    Args = [{role_2, Name},
            {string_2, 1, lang:get("藏宝迷宫")},
            {string_2, 1, lang:get("妖怪巢穴")},
            {string_2, 4, MapName}],
    Content =
        notice:format(lang:get("~ts在~ts里一锤子下去，竟挖塌~ts，大量妖魂往~ts而去{face_1, "
                               "46}"),
                      Args),
    notice:cast(all, 5, Content).

make_ghost_map_name(0, _, Acc) -> string:join(Acc, ",");
make_ghost_map_name(_, [], Acc) ->
    string:join(Acc, ",");
make_ghost_map_name(Num, [MapBaseId | Rest], Acc) ->
    case map_data:get(MapBaseId) of
        {ok, #map_data{name = Name}} ->
            make_ghost_map_name(Num - 1, Rest, [Name | Acc]);
        _False -> make_ghost_map_name(Num, Rest, Acc)
    end.

make_ghost([], _Ids, State) -> State;
make_ghost([{10009, _UnitBaseId, _Lev} | Rest],
           [_Id | RestIds], State = #state{cross_type = 1}) ->
    make_ghost(Rest, RestIds, State);
make_ghost([{MapBaseId, UnitBaseId, Lev} | Rest],
           [Id | RestIds],
           State = #state{ghost_list = GhostList}) ->
    case rand_ghost_pos(MapBaseId) of
        {X, Y} ->
            case make_ghost_unit(Id, MapBaseId, UnitBaseId, X, Y) of
                {ok, #unit{id = UnitId}} ->
                    case lists:keytake(MapBaseId,
                                       #treasure_map_ghost.map_base_id,
                                       GhostList)
                        of
                        {value,
                         MapGhost = #treasure_map_ghost{len = Len},
                         RestGhostList} ->
                            NewMapGhost = MapGhost#treasure_map_ghost{len =
                                                                          Len +
                                                                              1},
                            ets:insert(treasure_ghost_unit,
                                       #treasure_ghost_unit{id = UnitId,
                                                            lev = Lev,
                                                            map_base_id =
                                                                MapBaseId}),
                            make_ghost(Rest,
                                       RestIds,
                                       State#state{ghost_list =
                                                       [NewMapGhost
                                                        | RestGhostList]});
                        _False ->
                            ets:insert(treasure_ghost_unit,
                                       #treasure_ghost_unit{id = UnitId,
                                                            lev = Lev,
                                                            map_base_id =
                                                                MapBaseId}),
                            NewMapGhost = #treasure_map_ghost{map_base_id =
                                                                  MapBaseId,
                                                              len = 1},
                            make_ghost(Rest,
                                       RestIds,
                                       State#state{ghost_list =
                                                       [NewMapGhost
                                                        | GhostList]})
                    end;
                _False -> make_ghost(Rest, RestIds, State)
            end;
        _False -> make_ghost(Rest, RestIds, State)
    end.

make_ghost_unit(Id, MapBaseId, UnitBaseId, X, Y) ->
    case unit_convert:to({unit, {MapBaseId, X, Y}, [], ""},
                         UnitBaseId)
        of
        {ok, ConvtUnit} ->
            case unit:create({8, Id}, ConvtUnit) of
                {ok, Unit} -> {ok, Unit};
                _False -> false
            end;
        _False -> false
    end.

rand_ghost_pos(MapBaseId) ->
    case map:rand_pos(MapBaseId) of
        {PosX, PosY} -> {PosX, PosY};
        _ -> false
    end.

ghost_map([], _Num, _WorldLev, Acc) -> Acc;
ghost_map([{MapBaseId, RestNum} | Rest], Num, WorldLev,
          Acc) ->
    GenNum = case RestNum > Num of
                 true -> Num;
                 false -> RestNum
             end,
    NewAcc = rand_ghost(GenNum, MapBaseId, WorldLev, Acc),
    ghost_map(Rest, Num, WorldLev, NewAcc);
ghost_map([_ | Rest], Num, WorldLev, Acc) ->
    ghost_map(Rest, Num, WorldLev, Acc).

rand_ghost(0, _MapBaseId, _WorldLev, Acc) -> Acc;
rand_ghost(Num, MapBaseId, WorldLev, Acc) ->
    NewAcc = rand_ghost(MapBaseId, WorldLev, Acc),
    rand_ghost(Num - 1, MapBaseId, WorldLev, NewAcc).

rand_ghost(MapBaseId, WorldLev, Acc) ->
    UnitList = get_unit_list(MapBaseId, WorldLev),
    case util:rand_list(UnitList, 2) of
        {UnitBaseId, _Weight, Lev} ->
            [{MapBaseId, UnitBaseId, Lev} | Acc];
        _False ->
            logger:error("随机抽取封妖单位错误:~w",
                         [{MapBaseId, WorldLev, _False}],
                         treasure,
                         1018),
            Acc
    end.

filter_map([], _WorldLev, _State, Acc) -> Acc;
filter_map([{MapBaseId, MaxNum} | Rest], WorldLev,
           State = #state{ghost_list = List}, Acc) ->
    case lists:keyfind(MapBaseId,
                       #treasure_map_ghost.map_base_id,
                       List)
        of
        #treasure_map_ghost{len = Len} when Len >= MaxNum ->
            filter_map(Rest, WorldLev, State, Acc);
        #treasure_map_ghost{len = Len} ->
            filter_map(Rest,
                       WorldLev,
                       State,
                       [{MapBaseId, MaxNum - Len} | Acc]);
        _False ->
            filter_map(Rest,
                       WorldLev,
                       State,
                       [{MapBaseId, MaxNum} | Acc])
    end.

get_maps(WorldLevSet, WorldLev) ->
    Set = util:remove_duplicate(WorldLevSet),
    get_maps(Set, WorldLev, []).

get_maps([], _WorldLev, Acc) -> Acc;
get_maps([WorldLev | Rest], CurWorldLev, Acc)
    when CurWorldLev >= WorldLev ->
    Maps = treasure_data:get_maps(WorldLev),
    get_maps(Rest, CurWorldLev, lists:flatten([Maps, Acc]));
get_maps([_WorldLev | Rest], CurWorldLev, Acc) ->
    get_maps(Rest, CurWorldLev, Acc).

get_unit_list(MapBaseId, CurWorldLev) ->
    List = treasure_data:get_unit_list(MapBaseId),
    [{UnitId, Weight, Lev}
     || {UnitId, WorldLev, Weight, Lev} <- List,
        WorldLev =< CurWorldLev].

get_ghost_reward(win, Rewards, ExtArgs,
                 TRole = #role{pid = Pid}) ->
    CampList = camp_assets:get(TRole, 5, 0),
    Role = camp_assets:acc(TRole, 5),
    CampGain = format:val_to_gain(CampList),
    PetExpReward = case pet:get_war_pet(Role) of
                       {ok, #pet{lev = PetLev}} ->
                           case levup_data:get_exp({1002, PetLev}) of
                               #{pet_exp := PetExp} when PetExp > 0 ->
                                   [#gain{label = pet_exp, val = PetExp}];
                               _ -> []
                           end;
                       _ -> []
                   end,
    AllExpRewards = PetExpReward ++ Rewards ++ CampGain,
    DayCount = var:get_var(Role, day_five, 110, 0),
    if DayCount < 10 ->
           List = treasure_data:get_rewards(),
           RatioVal = case lists:keyfind(treasure_ratio,
                                         1,
                                         ExtArgs)
                          of
                          {treasure_ratio, RVal} -> RVal;
                          _Unknow -> 0
                      end,
           BreakTimes = lev_break:get_times(Role),
           FilterList = filter_ghost_reward(List,
                                            RatioVal,
                                            BreakTimes),
           Rewards1 = case DayCount >= 5 of
                          true ->
                              Msg =
                                  notice:format(lang:get("今天击杀的妖怪超过~ts只，获得角色经验奖励下降了"),
                                                [{string_2, 5, 5}]),
                              notice:send(Role, 3, Msg),
                              desc_exp(AllExpRewards, [], 5.0e-1);
                          false -> AllExpRewards
                      end,
           Result = case buff:get_info_by_special_effect(Role, 31)
                        of
                        {true, BuffId, BuffName} ->
                            case buff:is_special_effect_exists_two_param(Role,
                                                                         31)
                                of
                                {true, _Rate, MaxCount} ->
                                    case buff:get_ext_param(Role, BuffId, 6) of
                                        {true, Count} ->
                                            case Count < MaxCount of
                                                true ->
                                                    {true,
                                                     BuffId,
                                                     BuffName,
                                                     MaxCount - Count - 1};
                                                false -> false
                                            end;
                                        false ->
                                            {true,
                                             BuffId,
                                             BuffName,
                                             MaxCount - 1}
                                    end;
                                false -> false
                            end;
                        _ -> false
                    end,
           {Role2, FilterList1} = case Result of
                                      {true,
                                       RwBuffId,
                                       _RwBuffName,
                                       _LeftCount} ->
                                          Role1 = case buff:add_ext_param(Role,
                                                                          RwBuffId,
                                                                          6,
                                                                          1)
                                                      of
                                                      {ok, _Role1} -> _Role1;
                                                      _ -> Role
                                                  end,
                                          ExtFilterList = lists:filter(fun
                                                                           (#{base_id
                                                                                  :=
                                                                                  DropBaseId}) ->
                                                                               DropBaseId
                                                                                   =/=
                                                                                   0
                                                                       end,
                                                                       FilterList),
                                          {Role1, ExtFilterList};
                                      false -> {Role, FilterList}
                                  end,
           Rewards3 = case util:rand_list(FilterList1, weight) of
                          #{base_id := BaseId} when BaseId =/= 0 ->
                              NewBaseId = item_type:special_id(BaseId),
                              case Result of
                                  {true, _RwBuffId, RwBuffName, LeftCount} ->
                                      ExtMsg =
                                          notice:format(lang:get("喜迎回归！在~ts作用下，你获得了~ts, 剩余~ts次"),
                                                        [{string_2,
                                                          1,
                                                          RwBuffName},
                                                         {item_2,
                                                          [{BaseId, 0, 1}]},
                                                         {string_2,
                                                          1,
                                                          LeftCount}]),
                                      notice:return(ExtMsg),
                                      ok;
                                  _ -> ok
                              end,
                              case treasure_data:is_cast(NewBaseId) of
                                  1 ->
                                      role:apply(async,
                                                 Pid,
                                                 {treasure,
                                                  notice_item,
                                                  [NewBaseId]}),
                                      ok;
                                  _OtherQuality -> ok
                              end,
                              [#gain{label = item_base_id,
                                     val = [{NewBaseId, 0, 1}]}
                               | Rewards1];
                          _False -> Rewards1
                      end,
           NewRewards = calc_pray_buff_reward(Role2, Rewards3),
           NewRewards1 = lev_break:filter_gain(NewRewards),
           logger:debug("封妖任务奖励:~w",
                        [{RatioVal, NewRewards1}],
                        treasure,
                        1151),
           VarRole = var:add_var(Role2, day_five, 110, 1),
           FireRole = role_trigger:fire(#evt_kill_treasure_ghost{},
                                        VarRole),
           TeacherRole = teacher:get_teacher_gain(FireRole, 13),
           {TeacherRole, NewRewards1};
       true ->
           Rewards1 = desc_exp(AllExpRewards, [], 1.0e-1),
           NewRewards = calc_pray_buff_reward(Role, Rewards1),
           NewRewards1 = lev_break:filter_gain(NewRewards),
           Msg =
               notice:format(lang:get("今天击杀的妖怪超过~ts只，只能获得基础经验奖励"),
                             [{string_2, 5, 10}]),
           notice:send(Role, 3, Msg),
           FireRole = role_trigger:fire(#evt_kill_treasure_ghost{},
                                        Role),
           logger:debug("封妖任务奖励，超过最大限制次数，经验只有10%，无道具奖励:~w",
                        [NewRewards1],
                        treasure,
                        1165),
           {FireRole, NewRewards1}
    end;
get_ghost_reward(_Lose, Rewards, _Loser, Role) ->
    {Role, Rewards}.

check_combat_cond(TeamMates, UnitLev, Role) ->
    check_combat_cond(TeamMates, UnitLev, Role, TeamMates).

check_combat_cond([], _UnitLev, _Role, TeamMates) ->
    Ids = [Id || #team_mate{id = Id} <- TeamMates],
    {ok, Ids};
check_combat_cond([#team_mate{lev = Lev, name = Name,
                              id = Id}
                   | Rest],
                  UnitLev, Role, TeamMates) ->
    case UnitLev - 5 > Lev of
        false ->
            check_combat_cond(Rest, UnitLev, Role, TeamMates);
        true ->
            check_combat_cond_notice(Role,
                                     {Id, Name, UnitLev},
                                     TeamMates),
            false
    end.

callback_combat_cond_notice(#role{id = Rid,
                                  name = _Name},
                            {MateId, Name, UnitLev}) ->
    NumStr = {string_2, 5, erlang:max(UnitLev - 5, 0)},
    case Rid =:= MateId of
        true ->
            Msg = notice:format(lang:get("您的等级不足~ts级，不能发起战斗"),
                                [NumStr]),
            notice:return(Msg);
        false ->
            Msg = notice:format(lang:get("队伍中的~ts等级不足~ts级，不能发起战斗"),
                                [{role_2, Name}, NumStr]),
            notice:return(Msg)
    end,
    ok.

check_combat_cond_notice(Role, Args, Teammates) ->
    callback_combat_cond_notice(Role, Args),
    [role:apply(async,
                Pid,
                {treasure, callback_combat_cond_notice, [Args]})
     || #team_mate{pid = Pid} <- Teammates,
        is_pid(Pid) =:= true],
    ok.

desc_exp([], Acc, _Desc_param) -> Acc;
desc_exp([G = #gain{label = exp, val = Val} | Rest],
         Acc, Desc_param) ->
    NewVal = util:floor(Val * Desc_param),
    desc_exp(Rest,
             [G#gain{val = NewVal} | Acc],
             Desc_param);
desc_exp([Gain | Rest], Acc, Desc_param) ->
    desc_exp(Rest, [Gain | Acc], Desc_param).

filter_ghost_reward(L, Lev, Times) ->
    [O
     || O = #{min_lev := LevMin, max_lev := LevMax,
              break_times_min := BreakMin,
              break_times_max := BreakMax}
            <- L,
        LevMin =< Lev andalso
            (LevMax =:= 0 orelse LevMax >= Lev) andalso
                BreakMin =< Times andalso BreakMax >= Times].

kill_ghost_box(MapBaseId, UnitId) ->
    gen_server:cast(treasure,
                    {kill_ghost_box, MapBaseId, UnitId}),
    ok.

timer_gen_ghost_box(State = #state{ghost_list = [],
                                   cross_type = 1}) ->
    RandNum = util:rand(4, 5),
    WorldLev = 100,
    WorldLevSet = treasure_data:get_world_lev_set(),
    Maps = get_maps(WorldLevSet, WorldLev),
    FilterMaps = filter_map(Maps, WorldLev, State, []),
    NewState = case ghost_map(FilterMaps,
                              RandNum,
                              WorldLev,
                              [])
                   of
                   [] -> State;
                   UnitList ->
                       logger:debug("补充封妖列表:~w", [UnitList], treasure, 1234),
                       Num = length(UnitList),
                       {ok, Ids} = unit_mgr:fetch_ids(Num),
                       make_ghost(UnitList, Ids, State)
               end,
    Ref = erlang:send_after(40 * 1000,
                            self(),
                            timer_ghost_box),
    NewState#state{ghost_box_timer = Ref};
timer_gen_ghost_box(State = #state{ghost_list =
                                       GhostList,
                                   cross_type = 1}) ->
    LackOfList = get_lack_of_list(GhostList, []),
    WorldLev = 100,
    NewState = gen_ghost_box(LackOfList, WorldLev, State),
    Ref = erlang:send_after(40 * 1000,
                            self(),
                            timer_ghost_box),
    NewState#state{ghost_box_timer = Ref};
timer_gen_ghost_box(State = #state{ghost_list = []}) ->
    RandNum = util:rand(4, 5),
    NewState = case world_lev:get_world_lev() of
                   {WorldLev, _NextTime} ->
                       WorldLevSet = treasure_data:get_world_lev_set(),
                       Maps = get_maps(WorldLevSet, WorldLev),
                       FilterMaps = filter_map(Maps, WorldLev, State, []),
                       case ghost_map(FilterMaps, RandNum, WorldLev, []) of
                           [] -> State;
                           UnitList ->
                               logger:debug("补充封妖列表:~w",
                                            [UnitList],
                                            treasure,
                                            1259),
                               Num = length(UnitList),
                               {ok, Ids} = unit_mgr:fetch_ids(Num),
                               make_ghost(UnitList, Ids, State)
                       end;
                   _False -> State
               end,
    Ref = erlang:send_after(40 * 1000,
                            self(),
                            timer_ghost_box),
    NewState#state{ghost_box_timer = Ref};
timer_gen_ghost_box(State = #state{ghost_list =
                                       GhostList}) ->
    LackOfList = get_lack_of_list(GhostList, []),
    {WorldLev, _NextTime} = world_lev:get_world_lev(),
    NewState = gen_ghost_box(LackOfList, WorldLev, State),
    Ref = erlang:send_after(40 * 1000,
                            self(),
                            timer_ghost_box),
    NewState#state{ghost_box_timer = Ref}.

get_lack_of_list([], Acc) -> Acc;
get_lack_of_list([#treasure_map_ghost{map_base_id =
                                          MapBaseId,
                                      len = Len}
                  | Rest],
                 Acc)
    when Len < 3 ->
    get_lack_of_list(Rest, [{MapBaseId, Len} | Acc]);
get_lack_of_list([_ | Rest], Acc) ->
    get_lack_of_list(Rest, Acc).

gen_ghost_box([], _WorldLev, State) -> State;
gen_ghost_box([{MapBaseId, Len} | Rest], WorldLev,
              State) ->
    Num = 8 - Len,
    MaxNum = treasure_data:get_ghost_max(MapBaseId),
    logger:debug("封妖地图:~w, 数量:~w",
                 [MapBaseId, Num],
                 treasure,
                 1290),
    case Len >= MaxNum of
        false ->
            case ghost_map([{MapBaseId, MaxNum - Len}],
                           Num,
                           WorldLev,
                           [])
                of
                [] -> gen_ghost_box(Rest, WorldLev, State);
                UnitList ->
                    logger:debug("封妖列表:~w", [UnitList], treasure, 1297),
                    TrueNum = length(UnitList),
                    {ok, Ids} = unit_mgr:fetch_ids(TrueNum),
                    NewState = make_ghost(UnitList, Ids, State),
                    gen_ghost_box(Rest, WorldLev, NewState)
            end;
        true -> gen_ghost_box(Rest, WorldLev, State)
    end.

notice_item(#role{name = Name}, BaseId) ->
    Fmt =
        lang:get("~ts大展神威，击败上古妖魔还当地一片安宁，附近村民特地奉上~ts以示感谢{face_1,22}"),
    Msg = notice:format(Fmt,
                        [{role_2, Name}, {item_2, BaseId}]),
    notice:cast(all, 5, Msg),
    ok.

calc_pray_buff_reward(Role, Rewards) ->
    calc_pray_buff_reward(Role, Rewards, []).

calc_pray_buff_reward(_Role, [], NewRewards) ->
    NewRewards;
calc_pray_buff_reward(Role,
                      [G = #gain{label = exp, val = Val} | Rest],
                      NewRewards) ->
    BuffPrecent = case
                      buff:is_special_effect_exists_one_param(Role, 18)
                      of
                      {true, ValueAdd} -> ValueAdd;
                      _ -> 0
                  end,
    NewVal = util:ceil(Val * (1000 + BuffPrecent) / 1000),
    logger:debug("在运势buff作用下,上古妖魔的经验增加了~w%,增加前:~w,增加后~w",
                 [BuffPrecent div 10, Val, NewVal],
                 treasure,
                 1326),
    BuffPrecent2 = case
                       buff:is_special_effect_exists_one_param(Role, 36)
                       of
                       {true, ValueAdd2} -> ValueAdd2;
                       _ -> 0
                   end,
    NewVal2 = util:ceil(NewVal * (1000 + BuffPrecent2) /
                            1000),
    logger:debug("在圣瓶buff作用下,上古妖魔的经验增加了~w%,增加前:~w,增加后~w",
                 [BuffPrecent div 10, NewVal, NewVal2],
                 treasure,
                 1333),
    calc_pray_buff_reward(Role,
                          Rest,
                          [G#gain{label = exp, val = NewVal2} | NewRewards]);
calc_pray_buff_reward(Role,
                      [G = #gain{label = coin, val = Val} | Rest],
                      NewRewards) ->
    BuffPrecent = case
                      buff:is_special_effect_exists_one_param(Role, 37)
                      of
                      {true, ValueAdd} -> ValueAdd;
                      _ -> 0
                  end,
    NewVal = util:ceil(Val * (1000 + BuffPrecent) / 1000),
    logger:debug("在圣瓶buff作用下,上古妖魔的银币增加了~w%,增加前:~w,增加后~w",
                 [BuffPrecent div 10, Val, NewVal],
                 treasure,
                 1343),
    calc_pray_buff_reward(Role,
                          Rest,
                          [G#gain{label = coin, val = NewVal} | NewRewards]);
calc_pray_buff_reward(Role, [Rw | Rest], NewRewards) ->
    calc_pray_buff_reward(Role, Rest, [Rw | NewRewards]).

