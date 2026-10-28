-file("src/mod/guild/guild_spring.erl", 1).

-module(guild_spring).

-behaviour(gen_fsm).

-export([start_link/0,
         info/1,
         get_rank/0,
         get_best_guild/0,
         answer/2,
         get_pannel/1,
         cheat_off/2,
         apply_guild/2,
         apply_role/2,
         push/2]).

-export([idle/2,
         notice/2,
         active/2,
         question/2,
         finish/2]).

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

-file("src/mod/guild/guild_spring.erl", 27).

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

-file("src/mod/guild/guild_spring.erl", 28).

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

-file("src/mod/guild/guild_spring.erl", 29).

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

-file("src/mod/guild/guild_spring.erl", 30).

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

-file("src/mod/guild/guild_spring.erl", 31).

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

-file("src/mod/guild/guild_spring.erl", 32).

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

-file("src/mod/guild/guild_spring.erl", 33).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild_spring.erl", 34).

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

-file("src/mod/guild/guild_spring.erl", 35).

-record(state,
        {timeout = 0 :: non_neg_integer(),
         ts = 0 :: non_neg_integer(),
         exp_ref :: undefined | reference(),
         q_ref :: undefined | reference(),
         past = [],
         asked_num = 0 :: non_neg_integer()}).

info(_) ->
    gen_fsm:sync_send_all_state_event(guild_spring,
                                      info_status).

get_rank() ->
    case ets:lookup(guild_spring_rank_info, rank) of
        [{rank, L}] when is_list(L) -> L;
        _ -> []
    end.

get_best_guild() ->
    case ets:lookup(guild_spring_rank_info, best_guild_name)
        of
        [{_, L}] when is_list(L) -> L;
        _ -> ""
    end.

get_pannel(#role{id = Id}) ->
    Rank = case lists:keyfind(Id,
                              #guild_question_answer.id,
                              get_rank())
               of
               #guild_question_answer{rank = Order} -> Order;
               _ -> 0
           end,
    Score = case ets:lookup(guild_question_answer, Id) of
                [#guild_question_answer{score = S}] -> S;
                _ -> 0
            end,
    BestOne = case ets:lookup(guild_spring_rank_info,
                              best_answer)
                  of
                  [{best_answer, B = #guild_question_answer{}}] -> B;
                  _ -> #guild_question_answer{}
              end,
    {Score, Rank, BestOne}.

answer(Role = #role{m_guild = #m_guild{pid = GuildPid}},
       Option)
    when is_pid(GuildPid) ->
    do_answer(Role, Option).

cheat_off(Role = #role{m_guild = #m_guild{id = GuildId},
                       id = Id},
          AId) ->
    case guild_mgr:info(by_id, GuildId) of
        {ok,
         #guild{question =
                    #guild_question{cheat_nums = Cheats, cheat_off = Cheat,
                                    answers = Answers}}} ->
            case lists:member(Id, Cheat) of
                true -> {false, lang:get("你已经购买过该问题的答案")};
                _ ->
                    case lists:keyfind(AId,
                                       #guild_question_answer.id,
                                       Answers)
                        of
                        #guild_question_answer{result = 1} ->
                            do_cheat_off(Role, lists:keyfind(Id, 1, Cheats));
                        _ -> {false, lang:get("对方还没答对呢")}
                    end
            end;
        _ -> {false, lang:get("没有公会的吧？")}
    end.

do_cheat_off(Role = #role{m_guild =
                              #m_guild{pid = GuildPid},
                          id = Id},
             {_, CN}) ->
    Loss = format:val_to_loss([{90000, 10000 * CN}]),
    case role_gain:do(Loss, Role) of
        {ok, Role1} ->
            case guild:apply(sync,
                             GuildPid,
                             {guild_spring, apply_guild, [{cheat_off, Id}]})
                of
                ok -> {ok, lang:get("成功购买了答案"), Role1};
                Else -> Else
            end;
        {false, #loss{msg = Msg}} -> {false, Msg}
    end;
do_cheat_off(#role{m_guild = #m_guild{pid = GuildPid},
                   id = Id},
             _) ->
    case guild:apply(sync,
                     GuildPid,
                     {guild_spring, apply_guild, [{cheat_off, Id}]})
        of
        ok -> {ok, lang:get("第一次免费查看答案")};
        Else -> Else
    end.

push(Role = #role{m_guild = #m_guild{id = GuildId},
                  id = Id, link = #link{conn_pid = ConnPid}},
     Cmd = 11147) ->
    case guild_mgr:info(by_id, GuildId) of
        {ok,
         #guild{question =
                    Q = #guild_question{cheat_off = Cheat,
                                        cheat_nums = Cheats}}} ->
            TodayRight = var:get_var(Role,
                                     day,
                                     guild_question_answer_right,
                                     0),
            IsCheat = case lists:member(Id, Cheat) of
                          true -> 1;
                          _ -> 0
                      end,
            CheatNum = case lists:keyfind(Id, 1, Cheats) of
                           {_, CN} -> CN;
                           _Else -> 0
                       end,
            sys_conn:pack_send(ConnPid,
                               Cmd,
                               {Q, IsCheat, CheatNum, TodayRight, 20})
    end;
push(#role{m_guild = #m_guild{id = GuildId},
           link = #link{conn_pid = ConnPid}},
     Cmd = 11150) ->
    case guild_mgr:info(by_id, GuildId) of
        {ok,
         #guild{question = #guild_question{answer = Answer}}} ->
            sys_conn:pack_send(ConnPid, Cmd, {Answer})
    end;
push(_, _) -> ok.

apply_guild(G = #guild{members = Members,
                       map_id = MapId},
            {notice, Status, Timeout}) ->
    lists:foreach(fun (#guild_role{pid = Pid})
                          when is_pid(Pid) ->
                          role:pack_send(Pid,
                                         11146,
                                         {Status, Timeout div 1000});
                      (_) -> ok
                  end,
                  Members),
    GuildBattleId = get(guild_battle_id),
    case Status of
        2 ->
            {X, Y} = {2546, 1101},
            unit_mgr:create({GuildBattleId, 12024},
                            12024,
                            {MapId, X, Y}),
            ok;
        0 ->
            unit_mgr:remove({GuildBattleId, 12024}),
            ok;
        3 -> apply_guild(G, clear_question);
        _ -> ok
    end;
apply_guild(#guild{members = Members}, add_exp) ->
    lists:foreach(fun (#guild_role{pid = Pid})
                          when is_pid(Pid) ->
                          role:apply(async,
                                     Pid,
                                     {guild_spring, apply_role, [add_exp]});
                      (_) -> ok
                  end,
                  Members),
    ok;
apply_guild(G = #guild{question = Q = #guild_question{},
                       members = Members},
            {gen_question, Id, AskedNum}) ->
    Now = date:unixtime(),
    case AskedNum > 20 of
        true -> ok;
        _ ->
            NewQ = Q#guild_question{id = Id, answer = 0,
                                    answers = [], asked = Now,
                                    asked_num = AskedNum, cheat_off = []},
            NewG = G#guild{question = NewQ},
            lists:foreach(fun (#guild_role{pid = Pid})
                                  when is_pid(Pid) ->
                                  role:apply(async,
                                             Pid,
                                             {guild_spring,
                                              apply_role,
                                              [show_question]});
                              (_) -> ok
                          end,
                          Members),
            {ok, NewG}
    end;
apply_guild(G = #guild{question =
                           Q = #guild_question{}},
            clear_question) ->
    NewG = G#guild{question =
                       Q#guild_question{id = 0, answer = 0, answers = [],
                                        asked = 0, asked_num = 0,
                                        cheat_nums = [], cheat_off = []}},
    {ok, NewG};
apply_guild(G = #guild{members = Members},
            {notice_finish, Status, Timeout}) ->
    lists:foreach(fun (#guild_role{pid = Pid})
                          when is_pid(Pid) ->
                          role:pack_send(Pid,
                                         11146,
                                         {Status, Timeout div 1000});
                      (_) -> ok
                  end,
                  Members),
    apply_guild(G, clear_question);
apply_guild(#guild{question = #guild_question{id = 0}},
            show_answer) ->
    ok;
apply_guild(G = #guild{question =
                           Q = #guild_question{id = Id},
                       members = Members},
            show_answer) ->
    A = question_data:get_answer(Id),
    NewG = G#guild{question = Q#guild_question{answer = A}},
    guild:cast(Members, 11150, {A}),
    {ok, NewG};
apply_guild(#guild{question =
                       #guild_question{answer = Answer}},
            {answer, _A})
    when Answer =/= 0 ->
    {ok, {false, lang:get("已经过了答题时间了")}};
apply_guild(#guild{question = #guild_question{id = 0}},
            {answer, _A}) ->
    {ok, {false, lang:get("现在还没有问题")}};
apply_guild(G = #guild{question =
                           Q = #guild_question{id = QId, answers = Answers,
                                               asked = Asked},
                       members = Members},
            {answer,
             A = #guild_question_answer{id = Id,
                                        option = Option}}) ->
    Now = date:unixtime(),
    case lists:keyfind(Id,
                       #guild_question_answer.id,
                       Answers)
        of
        #guild_question_answer{} ->
            {ok, {false, lang:get("你已经回答过这道题了")}};
        _ when Now - Asked < 3 ->
            {ok, {false, lang:get("再等等")}};
        _ when Now - Asked >= 23000 div 1000 ->
            {ok, {false, lang:get("已经过了答题时间了")}};
        _ ->
            {NewA, Reply} = case question_data:get_answer(QId) of
                                Option ->
                                    {A#guild_question_answer{result = 1},
                                     {ok, Now - Asked}};
                                _ -> {A, wrong}
                            end,
            guild:cast(Members, 11151, {NewA}),
            NewG = G#guild{question =
                               Q#guild_question{answers = [NewA | Answers]}},
            {ok, Reply, NewG}
    end;
apply_guild(#guild{question =
                       #guild_question{answer = Answer}},
            {cheat_off, _A})
    when Answer =/= 0 ->
    {ok, {false, lang:get("已经过了答题时间了")}};
apply_guild(#guild{question = #guild_question{id = 0}},
            {cheat_off, _A}) ->
    {ok, {false, lang:get("现在还没有问题")}};
apply_guild(G = #guild{question =
                           Q = #guild_question{cheat_nums = CheatNum,
                                               cheat_off = Cheats}},
            {cheat_off, Id}) ->
    case lists:member(Id, Cheats) of
        true -> {ok, {false, lang:get("你已经购买过该答案了")}};
        _ ->
            NewCheatNums = case lists:keyfind(Id, 1, CheatNum) of
                               {_, Num} ->
                                   lists:keyreplace(Id,
                                                    1,
                                                    CheatNum,
                                                    {Id, Num + 1});
                               _ -> [{Id, 1} | CheatNum]
                           end,
            NewG = G#guild{question =
                               Q#guild_question{cheat_nums = NewCheatNums,
                                                cheat_off = [Id | Cheats]}},
            {ok, ok, NewG}
    end;
apply_guild(_, _Args) ->
    logger:debug("未知回调 ~w", [_Args], guild_spring, 326),
    ok.

apply_role(R = #role{lev = Lev, s_event = 2,
                     link = #link{conn_pid = ConnPid}},
           add_exp) ->
    case guild_data:get_spring_exp(Lev) of
        {Exp, _} ->
            Ratio = case var:get_var(R,
                                     day,
                                     guild_spring_added_exp,
                                     0)
                             >= 2
                        of
                        true -> 2;
                        _ -> 1
                    end,
            Gain0 = format:val_to_gain([{90010, Exp * Ratio}]),
            {Gain, PetExp} = case pet:get_war_pet(R) of
                                 {ok, #pet{lev = PetLev}} ->
                                     case guild_data:get_spring_exp(PetLev) of
                                         {_, PExp} ->
                                             {format:val_to_gain([{90005,
                                                                   PExp *
                                                                       Ratio}])
                                                  ++ Gain0,
                                              PExp};
                                         _ -> {Gain0, 0}
                                     end;
                                 _ -> {Gain0, 0}
                             end,
            R1 = var:add_var(R,
                             day,
                             guild_spring_gain_exp,
                             Exp * Ratio),
            case role_gain:do(Gain,
                              var:acc_var(R1, day, guild_spring_added_exp))
                of
                {ok, NewRole} ->
                    sys_conn:pack_send(ConnPid,
                                       11153,
                                       {var:get_var(NewRole,
                                                    day,
                                                    guild_spring_gain_exp,
                                                    0)}),
                    notice:send({conn_pid, ConnPid},
                                1,
                                {lang:get("公会泉获得奖励经验~w"),
                                 [{string_2, 5, round(Exp * Ratio)}]}),
                    case PetExp of
                        0 -> ok;
                        _ ->
                            notice:send({conn_pid, ConnPid},
                                        1,
                                        {lang:get("公会泉获得奖励宠物经验~w"),
                                         [{string_2,
                                           5,
                                           round(PetExp * Ratio)}]})
                    end,
                    {ok, NewRole};
                _ -> ok
            end;
        _ ->
            logger:error("温泉经验未配置 lev :~w",
                         [Lev],
                         guild_spring,
                         364),
            ok
    end;
apply_role(_, add_exp) -> ok;
apply_role(Role, show_question) ->
    push(Role, 11147),
    ok;
apply_role(_, _Args) ->
    logger:debug("未知回调 ~w", [_Args], guild_spring, 373),
    ok.

start_link() ->
    gen_fsm:start_link({local, guild_spring},
                       guild_spring,
                       [],
                       []).

init([]) ->
    logger:info("开始启动...", [], guild_spring, 383),
    ets:new(guild_question_answer,
            [set,
             named_table,
             public,
             {keypos, #guild_question_answer.id}]),
    ets:new(guild_spring_rank_info,
            [set, named_table, public, {keypos, 1}]),
    init_rank_info(),
    {StateName, Timeout} = get_state(),
    State = init_question(StateName,
                          #state{ts = now(), timeout = Timeout}),
    logger:info("启动完成 state_name: ~w, timeout: ~w",
                [StateName, Timeout],
                guild_spring,
                392),
    {ok, StateName, State, Timeout}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(info_status, _From, StateName,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    St = state_name_int(StateName),
    Rest = util:time_left(Timeout, Ts),
    Reply = {St, Rest div 1000},
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(Reply, StateName, State).

handle_info({answer,
             A = #guild_question_answer{id = Id, score = Add}},
            StateName, State) ->
    NewA = case ets:lookup(guild_question_answer, Id) of
               [#guild_question_answer{score = Score}] ->
                   A#guild_question_answer{score = Add + Score};
               _ -> A
           end,
    ets:insert(guild_question_answer, NewA),
    continue(StateName, State);
handle_info(add_exp, StateName,
            State = #state{exp_ref = OldRef})
    when StateName =:= active orelse
             StateName =:= question orelse StateName =:= finish ->
    {ok, L} = guild_mgr:list(),
    apply_all(L, {guild_spring, apply_guild, [add_exp]}),
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewRef = erlang:send_after(60000, self(), add_exp),
    State1 = State#state{exp_ref = NewRef},
    continue(StateName, State1);
handle_info(add_exp, StateName, State) ->
    continue(StateName, State);
handle_info(gen_question, question,
            State = #state{q_ref = OldRef, past = Past,
                           asked_num = AskedNum}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewAskedNum = AskedNum + 1,
    case NewAskedNum > 20 of
        true ->
            NewRef = erlang:send_after(23000,
                                       self(),
                                       notice_finish),
            State1 = State#state{q_ref = NewRef,
                                 asked_num = NewAskedNum},
            continue(finish, State1);
        _ ->
            Id = util:rand_list(question_data:list() -- Past),
            apply_all({guild_spring,
                       apply_guild,
                       [{gen_question, Id, NewAskedNum}]}),
            NewRef = erlang:send_after(23000, self(), gen_question),
            State1 = State#state{q_ref = NewRef, past = [Id | Past],
                                 asked_num = NewAskedNum},
            update_rank(question),
            continue(question, State1)
    end;
handle_info(gen_question, StateName, State) ->
    apply_all({guild_spring,
               apply_guild,
               [clear_question]}),
    continue(StateName, State);
handle_info(notice_finish, finish,
            State = #state{timeout = Timeout, ts = Ts}) ->
    St = state_name_int(finish),
    Rest = util:time_left(Timeout, Ts),
    update_rank(question),
    case get_rank() of
        [#guild_question_answer{id = Champion, name = RWName}
         | _] ->
            MailInfo = #{items => [], title => lang:get("公会答题奖励"),
                         content =>
                             lang:get("你在本次答题活动中荣获第1名，得到【最强大脑】称号，有效期至下次答题活动。")},
            mail:send(Champion, MailInfo),
            honor_mgr:replace(guild_spring_answer_champion,
                              [{Champion, 11000}],
                              0),
            case get_best_guild() of
                GWName = [_ | _] ->
                    Notice =
                        notice:format(lang:get("公会答题已结束，~ts为本届王者公会，~ts个人成绩第一，当之无愧的最强大脑！"),
                                      [{string_2, 2, GWName},
                                       {role_2, RWName}]),
                    notice:cast(all, 5, Notice);
                _ -> ok
            end;
        _ -> ok
    end,
    apply_all({guild_spring,
               apply_guild,
               [{notice_finish, St, Rest}]}),
    continue(finish, State);
handle_info(notice_in_5, notice, State) ->
    case erlang:get(guild_spring_notice_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Msg =
        notice:format(lang:get("~ts即将在5分钟后开启，公会的小伙伴记得准时参加喔！"),
                      [{string_2, 1, lang:get("公会温泉")}]),
    notice:cast(all, 5, Msg),
    continue(notice, State);
handle_info(_Info, StateName, State) ->
    logger:debug("未知消息 ~w, state_name ~w",
                 [_Info, StateName],
                 guild_spring,
                 501),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State) ->
    Msg =
        notice:format(lang:get("~ts即将在10分钟后开启，公会的小伙伴记得准时参加喔！"),
                      [{string_2, 1, lang:get("公会温泉")}]),
    notice:cast(all, 5, Msg),
    State1 = State#state{ts = now(), timeout = 900000},
    apply_all({guild_spring,
               apply_guild,
               [{notice, state_name_int(notice), 900000}]}),
    case erlang:get(guild_spring_notice_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Ref = erlang:send_after(300000, self(), notice_in_5),
    erlang:put(guild_spring_notice_ref, Ref),
    continue(notice, State1);
idle(_, State) -> continue(idle, State).

notice(timeout,
       State = #state{exp_ref = OldRef, q_ref = OldQRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case erlang:is_reference(OldQRef) of
        true -> erlang:cancel_timer(OldQRef);
        _ -> ok
    end,
    Emsg =
        notice:format(lang:get("~ts活动已经开始，~ts即将在3分钟后开始，快回到公会"),
                      [{string_2, 1, lang:get("公会温泉")},
                       {string_2, 1, lang:get("公会答题")}]),
    notice:cast(all, 5, Emsg),
    NewRef = erlang:send_after(60000, self(), add_exp),
    State1 = State#state{ts = now(), timeout = 180000,
                         exp_ref = NewRef},
    apply_all({guild_spring,
               apply_guild,
               [{notice, state_name_int(active), 180000}]}),
    continue(active, State1);
notice(_, State) -> continue(notice, State).

active(timeout, State = #state{q_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Emsg =
        notice:format(lang:get("~ts正式开始，机智的小伙伴已经参加了，不要偷看他人的答案哟！"),
                      [{string_2, 1, lang:get("公会答题")}]),
    notice:cast(all, 5, Emsg),
    NewRef = erlang:send_after(23000, self(), gen_question),
    Timeout = 17 * 60 * 1000,
    Id = util:rand_list(question_data:list()),
    NewState = State#state{ts = now(), timeout = Timeout,
                           q_ref = NewRef, past = [Id], asked_num = 1},
    ets:delete_all_objects(guild_question_answer),
    init_rank_info(),
    apply_all({guild_spring,
               apply_guild,
               [{notice, state_name_int(question), Timeout}]}),
    apply_all({guild_spring,
               apply_guild,
               [{gen_question, Id, 1}]}),
    logger:debug("下次开始时间 ~w", [Timeout], guild_spring, 586),
    continue(question, NewState);
active(_, State) -> continue(active, State).

question(timeout, State) ->
    Notice = date:datetime_to_seconds({date(),
                                       {19, 50, 0}}),
    Timeout = (date:now_diff(tomorrow, time()) +
                   (Notice - date:unixtime()))
                  * 1000,
    NewState = State#state{ts = now(), timeout = Timeout},
    update_rank(question),
    apply_all({guild_spring,
               apply_guild,
               [{notice, state_name_int(idle), Timeout}]}),
    logger:debug("下次开始时间 ~w", [Timeout], guild_spring, 602),
    continue(idle, NewState);
question(_, State) -> continue(question, State).

finish(timeout, State) ->
    Emsg =
        notice:format(lang:get("~ts活动结束，各位小伙伴看上去都容光焕发了呢！"),
                      [{string_2, 1, lang:get("公会温泉")}]),
    notice:cast(all, 5, Emsg),
    Notice = date:datetime_to_seconds({date(),
                                       {19, 50, 0}}),
    Timeout = (date:now_diff(tomorrow, time()) +
                   (Notice - date:unixtime()))
                  * 1000,
    NewState = State#state{ts = now(), timeout = Timeout},
    update_rank(question),
    apply_all({guild_spring,
               apply_guild,
               [{notice, state_name_int(idle), Timeout}]}),
    logger:debug("下次开始时间 ~w", [Timeout], guild_spring, 622),
    continue(idle, NewState);
finish(_, State) -> continue(finish, State).

do_answer(Role = #role{m_guild =
                           #m_guild{pid = GuildPid},
                       lev = Lev},
          Option) ->
    {ok, Answer} = to(answer, {Role, Option}),
    case guild_data:get_question_exp(Lev) of
        {RightExp, WrongExp, _} ->
            case guild:apply(sync,
                             GuildPid,
                             {guild_spring, apply_guild, [{answer, Answer}]})
                of
                {ok, Time} ->
                    Gain0 = [{90010, RightExp}, {90012, 1}],
                    Gain1 = case pet:get_war_pet(Role) of
                                {ok, #pet{lev = PetLev}} ->
                                    case guild_data:get_question_exp(PetLev) of
                                        {_, _, PExp} -> [{90005, PExp} | Gain0];
                                        _ -> Gain0
                                    end;
                                _ -> Gain0
                            end,
                    Gain2 = case util:rand_list([{20006, 3, 30},
                                                 {20000, 1, 30},
                                                 {20510, 2, 30},
                                                 {20034, 1, 30},
                                                 {20045, 1, 30},
                                                 {0, 0, 850}],
                                                3)
                                of
                                {0, _, _} -> Gain1;
                                {ItemId, Num, _} -> [{ItemId, Num} | Gain1]
                            end,
                    Gain = format:val_to_gain(Gain2),
                    case role_gain:do_notice(Gain,
                                             var:acc_var(Role,
                                                         day,
                                                         guild_question_answer_right))
                        of
                        {ok, Role1} ->
                            Score = calc_score(Time),
                            NewAnswer = Answer#guild_question_answer{score =
                                                                         Score},
                            Role2 = var:add_var(Role1,
                                                week,
                                                guild_spring_answer_score,
                                                Score),
                            NewRole = role_trigger:fire(#evt_guild_answer{},
                                                        Role2),
                            guild_spring ! {answer, NewAnswer},
                            {ok, "", NewRole};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                wrong ->
                    Gain0 = [{90010, WrongExp}],
                    Gain1 = case pet:get_war_pet(Role) of
                                {ok, #pet{lev = PetLev}} ->
                                    case guild_data:get_question_exp(PetLev) of
                                        {_, _, PExp} ->
                                            [{90005, round(PExp / 2)} | Gain0];
                                        _ -> Gain0
                                    end;
                                _ -> Gain0
                            end,
                    Gain = format:val_to_gain(Gain1),
                    case role_gain:do_notice(Gain, Role) of
                        {ok, NewRole} -> {wrong, "", NewRole};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                Else -> Else
            end;
        _ -> {false, lang:get("找不到奖励")}
    end;
do_answer(_, _) -> ok.

calc_score(Time) when Time =< 8 -> 10;
calc_score(Time) when Time =< 10 -> 8;
calc_score(Time) when Time =< 15 -> 7;
calc_score(Time) when Time =< 16 -> 6;
calc_score(Time) when Time =< 17 -> 5;
calc_score(Time) when Time =< 18 -> 4;
calc_score(Time) when Time =< 19 -> 3;
calc_score(Time) when Time =< 20 -> 2;
calc_score(_) -> 1.

to(answer,
   {#role{id = Id, name = Name,
          m_guild = #m_guild{name = GuildName, id = GuildId},
          sex = Sex, classes = Classes},
    Option}) ->
    TotemId = case guild_mgr:info(by_id, GuildId) of
                  {ok, #guild{totem = #guild_totem{id = TId}}} -> TId;
                  _ -> 0
              end,
    {ok,
     #guild_question_answer{id = Id, name = Name,
                            guild_name = GuildName, option = Option, sex = Sex,
                            classes = Classes, totem_id = TotemId}}.

init_question(question,
              State = #state{exp_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewRef = erlang:send_after(60000, self(), add_exp),
    State1 = State#state{exp_ref = NewRef},
    Now = date:unixtime(),
    Qtime = 23000,
    case Qtime - Now of
        N when N =< 0 ->
            self() ! gen_question,
            State1;
        N ->
            Ref = erlang:send_after(N * 1000, self(), gen_question),
            State1#state{q_ref = Ref}
    end;
init_question(active,
              State = #state{exp_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewRef = erlang:send_after(60000, self(), add_exp),
    State#state{exp_ref = NewRef};
init_question(_, State) -> State.

apply_all(MFA) ->
    {ok, L} = guild_mgr:list(),
    apply_all(L, MFA).

apply_all([], _) -> ok;
apply_all([#guild{pid = Pid} | T], MFA) ->
    guild:apply(async, Pid, MFA),
    apply_all(T, MFA).

get_state() ->
    Now = date:unixtime(),
    Notice = date:datetime_to_seconds({date(),
                                       {19, 50, 0}}),
    Start = date:datetime_to_seconds({date(), {20, 0, 0}}),
    Question = date:datetime_to_seconds({date(),
                                         {20, 3, 0}}),
    End = date:datetime_to_seconds({date(), {20, 20, 0}}),
    {StateName, Timeout} = case Now >= Question andalso
                                    Now =< End
                               of
                               true -> {question, 17 * 60 * 1000};
                               _ when Now >= Start andalso Now < Question ->
                                   {active, Question - Now};
                               _ when Now >= Notice andalso Now < Start ->
                                   {notice, Start - Now};
                               _ when Now < Notice -> {idle, Notice - Now};
                               _ ->
                                   {idle,
                                    date:now_diff(tomorrow, time()) +
                                        (Notice - Now)}
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

state_name_int(notice) -> 1;
state_name_int(active) -> 2;
state_name_int(question) -> 3;
state_name_int(finish) -> 4;
state_name_int(_) -> 0.

init_rank_info() ->
    ets:insert(guild_spring_rank_info, {rank, []}),
    ets:insert(guild_spring_rank_info,
               {best_guild_name, ""}).

update_rank(question) ->
    case ets:tab2list(guild_question_answer) of
        [] -> ok;
        L ->
            Fun = fun (#guild_question_answer{score = S1},
                       #guild_question_answer{score = S2}) ->
                          S1 > S2
                  end,
            L1 = lists:sublist(lists:sort(Fun, L), 100),
            L2 = lists:foldl(fun (#guild_question_answer{guild_name
                                                             = Name,
                                                         score = Score},
                                  L0) ->
                                     case lists:keyfind(Name, 1, L0) of
                                         {Name, Num, ScoreA} ->
                                             lists:keyreplace(Name,
                                                              1,
                                                              L0,
                                                              {Name,
                                                               Num + 1,
                                                               Score + ScoreA});
                                         _ -> [{Name, 1, Score} | L0]
                                     end
                             end,
                             [],
                             lists:sublist(L1, 10)),
            [{FirstName, _, _} | _] = lists:sort(fun ({_, N1, S1},
                                                      {_, N2, S2}) ->
                                                         if N1 > N2 -> true;
                                                            N1 =:= N2 andalso
                                                                S1 > S2 ->
                                                                true;
                                                            true -> false
                                                         end
                                                 end,
                                                 L2),
            [BestOne | _] = L1,
            ets:insert(guild_spring_rank_info,
                       {rank, add_rank_order(L1, 1)}),
            ets:insert(guild_spring_rank_info,
                       {best_answer, BestOne}),
            ets:insert(guild_spring_rank_info,
                       {best_guild_name, FirstName})
    end;
update_rank(_) -> ok.

add_rank_order([], _) -> [];
add_rank_order([R | T], Order) ->
    [R#guild_question_answer{rank = Order}
     | add_rank_order(T, Order + 1)].

