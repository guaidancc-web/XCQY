-file("src/mod/chat/chat.erl", 1).

-module(chat).

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

-file("src/mod/chat/chat.erl", 11).

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

-file("src/mod/chat/chat.erl", 12).

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

-file("src/mod/chat/chat.erl", 13).

-file("inc/chat.hrl", 1).

-record(chat_msg,
        {rid = {0, "", 0} :: non_neg_integer(),
         platform = "" :: binary(),
         zone_id = 0 :: non_neg_integer(),
         channel = 0 :: non_neg_integer(),
         name = "" :: binary(),
         sex = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         msg = "" :: binary(),
         guild_name = "",
         special = [] :: [tuple()]}).

-record(chat_voice,
        {role_id,
         voice = <<>>,
         text = "",
         time = 0,
         channel,
         group_id}).

-record(chat_offline, {id = {0, "", 0}, msgs = []}).

-file("src/mod/chat/chat.erl", 14).

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

-file("src/mod/chat/chat.erl", 15).

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

-file("src/mod/chat/chat.erl", 16).

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

-file("src/mod/chat/chat.erl", 17).

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

-file("src/mod/chat/chat.erl", 18).

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

-file("src/mod/chat/chat.erl", 19).

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

-file("src/mod/chat/chat.erl", 20).

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

-file("src/mod/chat/chat.erl", 21).

-file("inc/hero.hrl", 1).

-record(hero_ready_zone,
        {map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc}).

-record(hero_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         series = 0,
         flag = 0}).

-record(hero_group,
        {id = 0,
         score = 0,
         num = 0,
         offline_num = 0,
         all_num = 0,
         ave_fc = 0,
         sum_fc = 0}).

-record(hero_group_team,
        {group = 0, num = 0, fight = 0, match = 0}).

-record(hero_series,
        {group = 0,
         num = 0,
         ave_fc = 0,
         sum_fc = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         members = []}).

-record(hero_series_ready,
        {tiger = #hero_series{},
         dragon = #hero_series{},
         series = 0,
         ave_fc = 0,
         num = 0}).

-record(hero_series_data,
        {min = 0, max = 0, series = 0, name = ""}).

-record(hero_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         win = 0,
         win_streak = 0,
         times = 0,
         die = 4,
         rank_point = 0,
         score = 0,
         is_combat = 0,
         last_combat_over_time = 0,
         last_role_id,
         zone_id = 0,
         zone_pid,
         team_status = 0,
         team_lev = 40,
         team_len = 1,
         match = 0,
         exp = 0,
         has_enter = 0,
         looks = [],
         has_mail = 0,
         group = 1,
         box = 0,
         series = 0,
         fc = 0,
         m_time = 0}).

-record(hero_reward_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp_mode = 0,
         pet_exp_mode = 0}).

-record(hero_win_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp = 0,
         pet_exp = 0}).

-file("src/mod/chat/chat.erl", 22).

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

-file("src/mod/chat/chat.erl", 23).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/chat/chat.erl", 24).

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

-file("src/mod/chat/chat.erl", 25).

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

-file("src/mod/chat/chat.erl", 26).

-file("inc/adm.hrl", 1).

-record(m_adm, {last_feedback = 0}).

-record(adm_report_info,
        {id, time, classes, lev, name, report = []}).

-record(adm_report,
        {id,
         order,
         name,
         lev,
         time,
         type,
         reason,
         msg = [],
         flag = 0}).

-record(adm_device_info,
        {id, type = 1 :: non_neg_integer()}).

-record(auth_sfz_cfg,
        {plat_channel = {"", 0},
         platform = "",
         channel_reg = 0,
         name = "",
         can_charge = 1,
         is_nonage = 0,
         charge_limit = 5000,
         is_wallow = 0,
         down_sec = 10800,
         is_show_phone = 0,
         show_info = "gm.3k.com",
         is_mail = 0,
         is_mid_exp = 0,
         is_lev_60 = 0,
         is_need_check = 0}).

-record(role_charge_cfg, {id = {0, "", 0}, label = ""}).

-file("src/mod/chat/chat.erl", 27).

-type chat_msg() :: #chat_msg{}.

-export_type([chat_msg/0]).

-export([msg/3,
         voice_msg/5,
         sns_msg/3,
         sns_voice_msg/4,
         pet_msg/4,
         send_chat_msg/3,
         send_chat_voice/3,
         send_self_msg/3,
         send_obj_msg/4,
         send_sns_msg/2,
         check_send_cond/4,
         push_face/1,
         loss_energy/1,
         check_can_say/2,
         set_chat_bubble/2,
         rpc_send_screen_msg/2,
         get_combat_screen_mgr/2,
         do_silent_count/3,
         t/0]).

-spec msg(Channel :: non_neg_integer(), Msg :: binary(),
          Role :: #role{}) -> #chat_msg{}.

msg(Channel, TMsg,
    Role = #role{id = {Rid, Platform, ZoneId}, name = Name,
                 sex = Sex, lev = Lev, m_guild = MGuild}) ->
    Msg = special_face(TMsg),
    Special = msg_special_list(Role),
    GuildName = case MGuild of
                    #m_guild{name = GName} -> GName;
                    _ -> ""
                end,
    #chat_msg{rid = Rid, platform = Platform,
              zone_id = ZoneId, channel = Channel, name = Name,
              sex = Sex, msg = Msg, special = Special, lev = Lev,
              guild_name = GuildName}.

voice_msg({Channel = 9,
           {GroupId, GroupPlatform, GroupZondId}},
          VoiceId, VoiceTime, VoiceText,
          Role = #role{id = {Rid, Platform, ZoneId}, name = Name,
                       sex = Sex, classes = Classes, lev = Lev}) ->
    Special = msg_special_list(Role),
    {Channel,
     GroupId,
     GroupPlatform,
     GroupZondId,
     Rid,
     Platform,
     ZoneId,
     Name,
     Sex,
     Classes,
     Lev,
     Special,
     VoiceId,
     VoiceTime,
     VoiceText};
voice_msg(Channel, VoiceId, VoiceTime, VoiceText,
          Role = #role{id = {Rid, Platform, ZoneId}, name = Name,
                       sex = Sex, classes = Classes, lev = Lev}) ->
    Special = msg_special_list(Role),
    {Channel,
     Rid,
     Platform,
     ZoneId,
     Name,
     Sex,
     Classes,
     Lev,
     Special,
     VoiceId,
     VoiceTime,
     VoiceText}.

-spec sns_msg(#role{}, _,
              Msg :: bitstring()) -> tuple().

sns_msg(Role = #role{id = {Rid, P, Z}, name = Name,
                     sex = Sex, classes = Classes, face = Face, lev = Lev,
                     m_guild = MGuild},
        {TRid, TP, TZ}, TMsg) ->
    GuildName = case MGuild of
                    #m_guild{name = GName} -> GName;
                    _ -> ""
                end,
    Msg = special_face(TMsg),
    Special = msg_special_list(Role),
    logger:debug("=====生成一条完整的私聊信息  目标信息========= ~w",
                 [{TRid, TP, TZ}],
                 chat,
                 84),
    logger:debug("=====生成一条完整的私聊信息  发送者信息========= ~w",
                 [{Rid, P, Z}],
                 chat,
                 85),
    {TRid,
     TP,
     TZ,
     Rid,
     P,
     Z,
     Name,
     Face,
     Sex,
     Lev,
     Classes,
     GuildName,
     Msg,
     Special}.

sns_voice_msg(Role = #role{id = {Rid, P, Z},
                           lock_status = LooksStatus, name = Name, sex = Sex,
                           classes = Classes, face = Face, lev = Lev,
                           m_guild = MGuild},
              CacheId, VoiceTime, VoiceText) ->
    case LooksStatus of
        4 -> notice:send(Role, 1, lang:get("您已经被禁止私聊"));
        _ ->
            GuildName = case MGuild of
                            #m_guild{name = GName} -> GName;
                            _ -> ""
                        end,
            Special = msg_special_list(Role),
            {Rid,
             P,
             Z,
             Name,
             Face,
             Sex,
             Lev,
             Classes,
             GuildName,
             CacheId,
             VoiceTime,
             VoiceText,
             Special}
    end.

pet_msg(Channel, CacheId, #pet{base_id = BaseId},
        Role = #role{id = {Rid, Platform, ZoneId}, name = Name,
                     sex = Sex, classes = Classes, lev = Lev}) ->
    Special = msg_special_list(Role),
    {Channel,
     Rid,
     Platform,
     ZoneId,
     Name,
     Sex,
     Classes,
     Lev,
     Special,
     CacheId,
     2,
     BaseId}.

send_self_msg(Channel, TMsg,
              Role = #role{classes = Classes}) ->
    #chat_msg{rid = Rid, platform = Platform,
              zone_id = ZoneId, channel = Channel, name = Name,
              sex = Sex, msg = Msg, special = Special, lev = Lev,
              guild_name = GuildName} =
        msg(Channel, TMsg, Role),
    Data = {Channel,
            Rid,
            Platform,
            ZoneId,
            Name,
            Sex,
            Classes,
            Lev,
            Msg,
            GuildName,
            Special},
    role:link_send(Role, 10400, Data).

-spec send_chat_msg(Tag :: world | map, Msg :: binary(),
                    Role :: #role{}) -> ok | {error, term()}.

send_chat_msg(Label, Msg, Role) ->
    case is_binary(Msg) of
        true ->
            logger:info("未解析成字符串的二进制:~w", [Msg], chat, 115),
            ok;
        _ ->
            ChannelType = label_to_type(Label),
            case util:check_text(Msg, 100) of
                ok ->
                    case do_silent_count(Role, ChannelType, Msg) of
                        ok ->
                            role_trigger:async_fire(self(),
                                                    #evt_chat{channel =
                                                                  ChannelType,
                                                              content = Msg}),
                            catch log:chat(Role, Label, {0, "", 0}, Msg),
                            sys_conn:pack_send(10432, {1, ChannelType, 10400}),
                            do_send_chat_msg(Label, Msg, Role);
                        false ->
                            sys_conn:pack_send(10432, {1, ChannelType, 10400}),
                            send_self_msg(ChannelType, Msg, Role),
                            ok
                    end;
                {false, _} ->
                    clean_cd(Label),
                    notice:send(Role, 1, lang:get("发言中含有不恰当词语，请文明聊天")),
                    sys_conn:pack_send(10432, {0, ChannelType, 10400}),
                    ok
            end
    end.

do_send_chat_msg(world, TMsg,
                 Role = #role{classes = Classes}) ->
    #chat_msg{rid = Rid, platform = Platform,
              zone_id = ZoneId, channel = Channel, name = Name,
              sex = Sex, msg = Msg, special = Special, lev = Lev,
              guild_name = GuildName} =
        msg(1, TMsg, Role),
    Data = {Channel,
            Rid,
            Platform,
            ZoneId,
            Name,
            Sex,
            Classes,
            Lev,
            Msg,
            GuildName,
            Special},
    role_group:pack_send(world, 10400, Data),
    ok;
do_send_chat_msg(center_world, TMsg,
                 Role = #role{classes = Classes}) ->
    #chat_msg{rid = Rid, platform = Platform,
              zone_id = ZoneId, channel = Channel, name = Name,
              sex = Sex, msg = Msg, special = Special, lev = Lev,
              guild_name = GuildName} =
        msg(8, TMsg, Role),
    Data = {Channel,
            Rid,
            Platform,
            ZoneId,
            Name,
            Sex,
            Classes,
            Lev,
            Msg,
            GuildName,
            Special},
    case cross:cast(role_group,
                    pack_send,
                    [center_world, 10400, Data])
        of
        {error, center_not_ready} ->
            notice:send(Role, 1, lang:get("时空波动，无法进行跨服世界聊天")),
            ok;
        _ -> ok
    end;
do_send_chat_msg(map, TMsg,
                 Role = #role{id = {_, RPlatform, RZoneId},
                              classes = Classes, s_event = 27,
                              s_event_pid = Pid})
    when is_pid(Pid) ->
    #chat_msg{rid = Rid, channel = Channel, name = Name,
              sex = Sex, msg = Msg, special = Special, lev = Lev,
              guild_name = GuildName} =
        msg(3, TMsg, Role),
    SMsg = {Channel,
            Rid,
            RPlatform,
            RZoneId,
            Name,
            Sex,
            Classes,
            Lev,
            Msg,
            GuildName,
            Special},
    elf:cast(Pid, {chat, SMsg});
do_send_chat_msg(map, TMsg,
                 Role = #role{id = {_, RPlatform, RZoneId},
                              classes = Classes, s_event = 49,
                              s_event_pid = Pid})
    when is_pid(Pid) ->
    #chat_msg{rid = Rid, channel = Channel, name = Name,
              sex = Sex, msg = Msg, special = Special, lev = Lev,
              guild_name = GuildName} =
        msg(3, TMsg, Role),
    SMsg = {Channel,
            Rid,
            RPlatform,
            RZoneId,
            Name,
            Sex,
            Classes,
            Lev,
            Msg,
            GuildName,
            Special},
    camp_animal_chess:cast(Pid, {chat, SMsg});
do_send_chat_msg(map, TMsg,
                 Role = #role{id = Id = {_, RPlatform, RZoneId},
                              classes = Classes, s_event = 25,
                              m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    #chat_msg{rid = Rid, channel = Channel, name = Name,
              sex = Sex, msg = Msg, special = Special, lev = Lev,
              guild_name = GuildName} =
        msg(3, TMsg, Role),
    combat:chat(Pid,
                {all,
                 Id,
                 {Channel,
                  Rid,
                  RPlatform,
                  RZoneId,
                  Name,
                  Sex,
                  Classes,
                  Lev,
                  Msg,
                  GuildName,
                  Special}});
do_send_chat_msg(map, TMsg,
                 Role = #role{id = Id = {_, RPlatform, RZoneId},
                              classes = Classes, s_event = 45,
                              m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    #chat_msg{rid = Rid, channel = Channel, name = Name,
              sex = Sex, msg = Msg, special = Special, lev = Lev,
              guild_name = GuildName} =
        msg(3, TMsg, Role),
    combat:chat(Pid,
                {all,
                 Id,
                 {Channel,
                  Rid,
                  RPlatform,
                  RZoneId,
                  Name,
                  Sex,
                  Classes,
                  Lev,
                  Msg,
                  GuildName,
                  Special}});
do_send_chat_msg(map, TMsg,
                 Role = #role{id = {_, RPlatform, RZoneId},
                              pos =
                                  #pos{map = MapId, platform = Platform,
                                       zone_id = ZoneId = 9999},
                              classes = Classes}) ->
    #chat_msg{rid = Rid, channel = Channel, name = Name,
              sex = Sex, msg = Msg, special = Special, lev = Lev,
              guild_name = GuildName} =
        msg(3, TMsg, Role),
    big_world:cast(Platform,
                   ZoneId,
                   map,
                   pack_send_to_all,
                   [MapId,
                    10400,
                    {Channel,
                     Rid,
                     RPlatform,
                     RZoneId,
                     Name,
                     Sex,
                     Classes,
                     Lev,
                     Msg,
                     GuildName,
                     Special}]);
do_send_chat_msg(map, TMsg,
                 Role = #role{id = {_, RPlatform, RZoneId},
                              pos =
                                  #pos{map = MapId, platform = Platform,
                                       zone_id = ZoneId},
                              classes = Classes}) ->
    #chat_msg{rid = Rid, channel = Channel, name = Name,
              sex = Sex, msg = Msg, special = Special, lev = Lev,
              guild_name = GuildName} =
        msg(3, TMsg, Role),
    cross:cast(Platform,
               ZoneId,
               map,
               pack_send_to_all,
               [MapId,
                10400,
                {Channel,
                 Rid,
                 RPlatform,
                 RZoneId,
                 Name,
                 Sex,
                 Classes,
                 Lev,
                 Msg,
                 GuildName,
                 Special}]);
do_send_chat_msg(pop, TMsg,
                 Role = #role{pos = #pos{map = MapId},
                              classes = Classes}) ->
    #chat_msg{rid = Rid, platform = Platform,
              zone_id = ZoneId, channel = Channel, name = Name,
              sex = Sex, msg = Msg, special = Special, lev = Lev,
              guild_name = GuildName} =
        msg(6, TMsg, Role),
    cross:cast(Platform,
               ZoneId,
               map,
               pack_send_to_all,
               [MapId,
                10400,
                {Channel,
                 Rid,
                 Platform,
                 ZoneId,
                 Name,
                 Sex,
                 Classes,
                 Lev,
                 Msg,
                 GuildName,
                 Special}]);
do_send_chat_msg(guild, TMsg,
                 Role = #role{m_guild = #m_guild{pid = Pid},
                              classes = Classes}) ->
    case is_list(TMsg) of
        true ->
            #chat_msg{rid = Rid, platform = Platform,
                      zone_id = ZoneId, channel = Channel, name = Name,
                      sex = Sex, msg = Msg, special = Special, lev = Lev,
                      guild_name = GuildName} =
                msg(4, TMsg, Role),
            guild_role:update(Role, chat),
            role_trigger:async_fire(self(), #evt_chat_guild{}),
            guild:chat(Pid,
                       10400,
                       {Channel,
                        Rid,
                        Platform,
                        ZoneId,
                        Name,
                        Sex,
                        Classes,
                        Lev,
                        Msg,
                        GuildName,
                        Special});
        _ -> ok
    end;
do_send_chat_msg(guild_others, TMsg,
                 Role = #role{m_guild = #m_guild{pid = Pid},
                              classes = Classes}) ->
    case is_list(TMsg) of
        true ->
            #chat_msg{rid = Rid, platform = Platform,
                      zone_id = ZoneId, channel = Channel, name = Name,
                      sex = Sex, msg = Msg, special = Special, lev = Lev,
                      guild_name = GuildName} =
                msg(4, TMsg, Role),
            guild:chat_others(Pid,
                              Rid,
                              10400,
                              {Channel,
                               Rid,
                               Platform,
                               ZoneId,
                               Name,
                               Sex,
                               Classes,
                               Lev,
                               Msg,
                               GuildName,
                               Special});
        _ -> ok
    end;
do_send_chat_msg(team, TMsg,
                 Role = #role{s_event = 25, classes = Classes}) ->
    case is_list(TMsg) of
        true ->
            #chat_msg{rid = Rid, platform = Platform,
                      zone_id = ZoneId, channel = Channel, name = Name,
                      sex = Sex, msg = Msg, special = Special, lev = Lev,
                      guild_name = GuildName} =
                msg(2, TMsg, Role),
            tournament_role:chat(Role,
                                 10400,
                                 {Channel,
                                  Rid,
                                  Platform,
                                  ZoneId,
                                  Name,
                                  Sex,
                                  Classes,
                                  Lev,
                                  Msg,
                                  GuildName,
                                  Special});
        _ -> ok
    end;
do_send_chat_msg(team, TMsg,
                 Role = #role{s_event = 42, classes = Classes,
                              m_combat = #m_combat{pid = CombatPid}})
    when is_pid(CombatPid) ->
    case is_list(TMsg) of
        true ->
            #chat_msg{rid = Rid, platform = Platform,
                      zone_id = ZoneId, channel = Channel, name = Name,
                      sex = Sex, msg = Msg, special = Special, lev = Lev,
                      guild_name = GuildName} =
                msg(2, TMsg, Role),
            combat:chat(CombatPid,
                        {self,
                         {Rid, Platform, ZoneId},
                         {Channel,
                          Rid,
                          Platform,
                          ZoneId,
                          Name,
                          Sex,
                          Classes,
                          Lev,
                          Msg,
                          GuildName,
                          Special}});
        _ -> ok
    end;
do_send_chat_msg(team, TMsg,
                 Role = #role{s_event = 43, classes = Classes}) ->
    case is_list(TMsg) of
        true ->
            #chat_msg{rid = Rid, platform = Platform,
                      zone_id = ZoneId, channel = Channel, name = Name,
                      sex = Sex, msg = Msg, special = Special, lev = Lev,
                      guild_name = GuildName} =
                msg(2, TMsg, Role),
            dungeon_team:chat(Role,
                              10400,
                              {Channel,
                               Rid,
                               Platform,
                               ZoneId,
                               Name,
                               Sex,
                               Classes,
                               Lev,
                               Msg,
                               GuildName,
                               Special});
        _ -> ok
    end;
do_send_chat_msg(team, TMsg,
                 Role = #role{m_team = #m_team{pid = Pid},
                              classes = Classes}) ->
    case is_list(TMsg) of
        true ->
            #chat_msg{rid = Rid, platform = Platform,
                      zone_id = ZoneId, channel = Channel, name = Name,
                      sex = Sex, msg = Msg, special = Special, lev = Lev,
                      guild_name = GuildName} =
                msg(2, TMsg, Role),
            team:send(Pid,
                      10400,
                      {Channel,
                       Rid,
                       Platform,
                       ZoneId,
                       Name,
                       Sex,
                       Classes,
                       Lev,
                       Msg,
                       GuildName,
                       Special});
        _ -> ok
    end;
do_send_chat_msg(barrage, TMsg,
                 Role = #role{pos = #pos{map = MapId},
                              classes = Classes}) ->
    #chat_msg{rid = Rid, platform = Platform,
              zone_id = ZoneId, channel = Channel, name = Name,
              sex = Sex, msg = Msg, special = Special, lev = Lev,
              guild_name = GuildName} =
        msg(7, TMsg, Role),
    cross:cast(Platform,
               ZoneId,
               map,
               pack_send_to_all,
               [MapId,
                10400,
                {Channel,
                 Rid,
                 Platform,
                 ZoneId,
                 Name,
                 Sex,
                 Classes,
                 Lev,
                 Msg,
                 GuildName,
                 Special}]);
do_send_chat_msg({group, GroupId}, TMsg,
                 Role = #role{classes = Classes}) ->
    case is_list(TMsg) of
        true ->
            #chat_msg{rid = Rid, platform = Platform,
                      zone_id = ZoneId, channel = Channel, name = Name,
                      sex = Sex, msg = Msg, special = Special, lev = Lev,
                      guild_name = GuildName} =
                msg(9, TMsg, Role),
            friend_group:chat(GroupId,
                              10424,
                              {Channel,
                               GroupId,
                               Rid,
                               Platform,
                               ZoneId,
                               Name,
                               Sex,
                               Classes,
                               Lev,
                               Msg,
                               GuildName,
                               Special});
        _ -> ok
    end;
do_send_chat_msg(spirit_treasure, TMsg,
                 Role = #role{id = {_, RPlatform, RZoneId},
                              pos =
                                  #pos{map = MapId, platform = Platform,
                                       zone_id = ZoneId},
                              classes = Classes}) ->
    WorldTMsg = notice:format("龙王试炼招募:~ts",
                              [{string_1, TMsg}]),
    case spirit_treasure_role:cross_group_info() of
        {1, CrossGroup} ->
            #chat_msg{rid = Rid, channel = Channel, name = Name,
                      sex = Sex, msg = WorldMsg, special = Special, lev = Lev,
                      guild_name = GuildName} =
                msg(10, WorldTMsg, Role),
            WorldData = {1,
                         Rid,
                         RPlatform,
                         RZoneId,
                         Name,
                         Sex,
                         Classes,
                         Lev,
                         WorldMsg,
                         GuildName,
                         Special},
            cross:cast(spirit_treasure_mgr,
                       cast,
                       [{cast_chat_msg, CrossGroup, 10400, WorldData}]),
            #chat_msg{msg = Msg} = msg(10, TMsg, Role),
            Data = {Channel,
                    Rid,
                    RPlatform,
                    RZoneId,
                    Name,
                    Sex,
                    Classes,
                    Lev,
                    Msg,
                    GuildName,
                    Special},
            cross:cast(Platform,
                       ZoneId,
                       map,
                       pack_send_to_all,
                       [MapId, 10400, Data]);
        {0, _CrossGroup} ->
            #chat_msg{rid = Rid, channel = Channel, name = Name,
                      sex = Sex, msg = WorldMsg, special = Special, lev = Lev,
                      guild_name = GuildName} =
                msg(10, WorldTMsg, Role),
            WorldData = {1,
                         Rid,
                         RPlatform,
                         RZoneId,
                         Name,
                         Sex,
                         Classes,
                         Lev,
                         WorldMsg,
                         GuildName,
                         Special},
            role_group:pack_send(world, 10400, WorldData),
            #chat_msg{msg = Msg} = msg(10, TMsg, Role),
            Data = {Channel,
                    Rid,
                    RPlatform,
                    RZoneId,
                    Name,
                    Sex,
                    Classes,
                    Lev,
                    Msg,
                    GuildName,
                    Special},
            cross:cast(Platform,
                       ZoneId,
                       map,
                       pack_send_to_all,
                       [MapId, 10400, Data]);
        _ -> ok
    end;
do_send_chat_msg(oracle_treasure, TMsg,
                 Role = #role{id = {_, RPlatform, RZoneId},
                              pos =
                                  #pos{map = MapId, platform = Platform,
                                       zone_id = ZoneId},
                              classes = Classes}) ->
    WorldTMsg = notice:format("天启试炼招募:~ts",
                              [{string_1, TMsg}]),
    case oracle_treasure_role:cross_group_info() of
        {1, CrossGroup} ->
            #chat_msg{rid = Rid, channel = Channel, name = Name,
                      sex = Sex, msg = WorldMsg, special = Special, lev = Lev,
                      guild_name = GuildName} =
                msg(11, WorldTMsg, Role),
            WorldData = {1,
                         Rid,
                         RPlatform,
                         RZoneId,
                         Name,
                         Sex,
                         Classes,
                         Lev,
                         WorldMsg,
                         GuildName,
                         Special},
            cross:cast(oracle_treasure_mgr,
                       cast,
                       [{cast_chat_msg, CrossGroup, 10400, WorldData}]),
            #chat_msg{msg = Msg} = msg(11, TMsg, Role),
            Data = {Channel,
                    Rid,
                    RPlatform,
                    RZoneId,
                    Name,
                    Sex,
                    Classes,
                    Lev,
                    Msg,
                    GuildName,
                    Special},
            cross:cast(Platform,
                       ZoneId,
                       map,
                       pack_send_to_all,
                       [MapId, 10400, Data]);
        {0, _CrossGroup} ->
            #chat_msg{rid = Rid, channel = Channel, name = Name,
                      sex = Sex, msg = WorldMsg, special = Special, lev = Lev,
                      guild_name = GuildName} =
                msg(11, WorldTMsg, Role),
            WorldData = {1,
                         Rid,
                         RPlatform,
                         RZoneId,
                         Name,
                         Sex,
                         Classes,
                         Lev,
                         WorldMsg,
                         GuildName,
                         Special},
            role_group:pack_send(world, 10400, WorldData),
            #chat_msg{msg = Msg} = msg(11, TMsg, Role),
            Data = {Channel,
                    Rid,
                    RPlatform,
                    RZoneId,
                    Name,
                    Sex,
                    Classes,
                    Lev,
                    Msg,
                    GuildName,
                    Special},
            cross:cast(Platform,
                       ZoneId,
                       map,
                       pack_send_to_all,
                       [MapId, 10400, Data]);
        _ -> ok
    end;
do_send_chat_msg(canyon_side, TMsg,
                 Role = #role{id = Id = {_, RPlatform, RZoneId},
                              pos =
                                  #pos{map = _MapId, platform = _Platform,
                                       zone_id = _ZoneId},
                              classes = Classes}) ->
    #chat_msg{rid = Rid, name = Name, sex = Sex,
              msg = WorldMsg, special = Special, lev = Lev,
              guild_name = GuildName} =
        msg(12, TMsg, Role),
    WorldData = {12,
                 Rid,
                 RPlatform,
                 RZoneId,
                 Name,
                 Sex,
                 Classes,
                 Lev,
                 WorldMsg,
                 GuildName,
                 Special},
    cross:cast(canyon_summit_mgr,
               cast,
               [{cast_chat_msg, Id, 10400, WorldData}]);
do_send_chat_msg(_, _, _) -> false.

send_chat_voice(1, PackData, _Role) ->
    role_group:pack_send(world, 10403, PackData),
    {true, undefined};
send_chat_voice(8, PackData, Role) ->
    case cross:cast(role_group,
                    pack_send,
                    [center_world, 10403, PackData])
        of
        {error, center_not_ready} ->
            notice:send(Role, 1, lang:get("时空波动，无法进行跨服世界语音")),
            false;
        _ -> {true, undefined}
    end;
send_chat_voice(4, PackData,
                #role{m_guild = #m_guild{pid = Pid}})
    when is_pid(Pid) ->
    guild:chat(Pid, 10403, PackData),
    {true, Pid};
send_chat_voice(2, PackData,
                Role = #role{s_event = 25}) ->
    tournament_role:chat(Role, 10403, PackData),
    {true, undefined};
send_chat_voice(2, PackData,
                #role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    team:send(Pid, 10403, PackData),
    {true, Pid};
send_chat_voice(3, PackData,
                #role{pos =
                          #pos{platform = Platform, zone_id = ZoneId,
                               map = MapId, map_pid = MapPid}}) ->
    big_world:cast(Platform,
                   ZoneId,
                   map,
                   pack_send_to_all,
                   [MapId, 10403, PackData]),
    {true, MapPid};
send_chat_voice({9, GroupId}, PackData, _Role) ->
    friend_group:chat(GroupId, 10425, PackData),
    {true, GroupId};
send_chat_voice(10, PackData,
                _Role = #role{pos =
                                  #pos{platform = Platform, zone_id = ZoneId,
                                       map = MapId},
                              s_event = 56}) ->
    logger:debug("==========:~w", [PackData], chat, 322),
    WorldPackData = sptu_voice_msg_2_world(PackData),
    logger:debug("==========:~w",
                 [WorldPackData],
                 chat,
                 324),
    case spirit_treasure_role:cross_group_info() of
        {1, CrossGroup} ->
            cross:cast(spirit_treasure_mgr,
                       cast,
                       [{cast_chat_msg, CrossGroup, 10403, WorldPackData}]),
            cross:cast(Platform,
                       ZoneId,
                       map,
                       pack_send_to_all,
                       [MapId, 10403, PackData]);
        {0, _CrossGroup} ->
            role_group:pack_send(world, 10403, WorldPackData),
            big_world:cast(Platform,
                           ZoneId,
                           map,
                           pack_send_to_all,
                           [MapId, 10403, PackData]);
        _ -> ok
    end,
    {true, undefined};
send_chat_voice(_, _, _) ->
    logger:error("未知频道", [], chat, 337),
    false.

send_obj_msg(1, Code, Data, _Role) ->
    role_group:pack_send(world, Code, Data);
send_obj_msg(3, Code, Data,
             #role{id = {_Id, Platform, ZoneId},
                   pos = #pos{map = MapId}}) ->
    cross:cast(Platform,
               ZoneId,
               map,
               pack_send_to_all,
               [MapId, Code, Data]);
send_obj_msg(4, Code, Data,
             #role{m_guild = #m_guild{pid = Pid}}) ->
    guild:chat(Pid, Code, Data);
send_obj_msg(2, Code, Data,
             Role = #role{s_event = 25}) ->
    tournament_role:chat(Role, Code, Data);
send_obj_msg(2, Code, Data,
             #role{m_team = #m_team{pid = Pid}}) ->
    team:send(Pid, Code, Data);
send_obj_msg(_Unknow, _Code, _Data, _Role) ->
    logger:error("未知频道", [], chat, 352),
    false.

send_sns_msg(Role = #role{}, Msg) ->
    role:link_send(Role, 10402, Msg).

-spec check_send_cond(Channel, ChatType, Msg,
                      Role) -> {ok, #role{}} | false when Channel ::
                                                              non_neg_integer(),
                                                          ChatType ::
                                                              non_neg_integer(),
                                                          Msg :: binary(),
                                                          Role :: #role{}.

check_send_cond(1, _ChatType, _Msg,
                #role{label = Label})
    when Label =:= 1 orelse Label =:= 2 ->
    ok;
check_send_cond(8, _ChatType, _Msg,
                #role{label = Label})
    when Label =:= 1 orelse Label =:= 2 ->
    ok;
check_send_cond(1, _ChatType, _Msg, Role) ->
    case role_misc:check_cd(rpc_10400_world) of
        true -> ok;
        false ->
            Cd = role_misc:get_cd(rpc_10400_world),
            CdMs = case get(rpc_10400_world) of
                       Last when is_integer(Last) ->
                           Now = date:unixtime(ms),
                           erlang:max(Cd - (Now - Last), 0);
                       _False -> Cd
                   end,
            RestCd = erlang:round(CdMs / 1000),
            Msg = notice:format(lang:get("您说的太快了，休息一下吧！剩余~ts秒"),
                                [{string_2, 5, RestCd}]),
            notice:send(Role, 1, Msg),
            false
    end;
check_send_cond(8, _ChatType, _Msg, Role) ->
    case role_misc:check_cd(rpc_10400_center_world) of
        true -> ok;
        false ->
            Cd = role_misc:get_cd(rpc_10400_center_world),
            CdMs = case get(rpc_10400_center_world) of
                       Last when is_integer(Last) ->
                           Now = date:unixtime(ms),
                           erlang:max(Cd - (Now - Last), 0);
                       _False -> Cd
                   end,
            RestCd = erlang:round(CdMs / 1000),
            Msg = notice:format(lang:get("您说的太快了，休息一下吧！剩余~ts秒"),
                                [{string_2, 5, RestCd}]),
            notice:send(Role, 1, Msg),
            false
    end;
check_send_cond(_Channel, _MsgType, _Msg, _Role) ->
    false.

loss_energy(Role) ->
    Val = 5,
    case role_gain:do([#loss{label = energy, val = Val}],
                      Role)
        of
        {ok, LossRole} ->
            Msg = notice:format(lang:get("世界频道发言成功，扣除~ts"),
                                [{assets_1, 90006, Val}]),
            notice:send(LossRole, 3, Msg),
            logger:debug("世界聊天扣除活力值", [], chat, 419),
            {ok, LossRole};
        {false, _} ->
            logger:debug("世界聊天扣除活力值", [], chat, 422),
            Msg = notice:format(lang:get("活力不足~ts点，不能发言"),
                                [{string_2, 5, Val}]),
            notice:send(Role, 1, Msg),
            false
    end.

push_face(Role) ->
    case privilege:get_val(Role, 103) of
        0 -> sys_conn:pack_send(10414, {[]});
        Val -> sys_conn:pack_send(10414, {[Val]})
    end.

check_can_say(RoleLev, _Msg) when RoleLev >= 28 -> true;
check_can_say(RoleLev, Msg = [_ | _]) ->
    check_can_say(RoleLev, Msg, [ad]);
check_can_say(_, _) -> skip.

check_can_say(_RoleLev, _Msg, []) -> true;
check_can_say(RoleLev, Msg, [H | T]) ->
    case do_check_can_say(H, RoleLev, Msg) of
        true -> check_can_say(RoleLev, Msg, T);
        false -> false
    end.

do_check_can_say(ad, _RoleLev, Msg) ->
    case util:utf8_len(Msg) =< 15 of
        true -> true;
        false ->
            case check_ad_repeat(Msg) of
                true -> false;
                _ -> true
            end
    end.

set_chat_bubble(Role, Bubble) ->
    logger:debug("进行设置聊天气泡:~w", [Bubble], chat, 463),
    achieve_shop:set_chat_bubble(Role, Bubble).

msg_special_list(Role = #role{label = Label,
                              m_lev_break = #m_lev_break{times = Times},
                              m_achieve_shop =
                                  #m_achieve_shop{prefix = Prefix}}) ->
    ChatBox = [{2, achieve_shop:get_chat_bubble(Role)}],
    HasPhoto = [{1, friend_zone:has_photo(Role)}],
    GetLabel = case Label of
                   1 -> [{3, 1}];
                   2 -> [{3, 2}];
                   _ -> []
               end,
    IconFrame = case tournament_season:get_icon_frame(Role)
                    of
                    0 -> [];
                    FrameId -> [{4, FrameId}]
                end,
    PrefixList = case Prefix of
                     0 -> [];
                     _ -> [{9, Prefix}]
                 end,
    ChatBox ++
        HasPhoto ++
            GetLabel ++ IconFrame ++ PrefixList ++ [{7, Times}];
msg_special_list(_) -> [].

check_ad_repeat(Msg) ->
    case get(chat_compile) of
        {5, Compile1, Compile2}
            when is_list(Compile1) andalso is_list(Compile2) ->
            banned_check_by_type(Compile2, Msg, match_any) orelse
                banned_check_by_type(Compile1, Msg, match_three);
        _ ->
            {Ver, Compile1, Compile2} = make_compile(),
            put(chat_compile, {Ver, Compile1, Compile2}),
            banned_check_by_type(Compile2, Msg, match_any) orelse
                banned_check_by_type(Compile1, Msg, match_three)
    end.

banned_check_by_type(Compile, Msg, match_three) ->
    banned_check(Compile, Msg);
banned_check_by_type(Compile, Msg, match_any) ->
    banned_check_any(Compile, Msg).

banned_check(Compile, Msg) ->
    banned_check(Compile, Msg, 0).

banned_check([_ | _T], _Msg, Num) when Num >= 3 -> true;
banned_check([], _Msg, Num) ->
    case Num >= 3 of
        true -> true;
        false -> false
    end;
banned_check([{ok, Re} | T], Msg, Num) ->
    case re:run(Msg, Re, [{capture, none}]) of
        match -> banned_check(T, Msg, Num + 1);
        _ -> banned_check(T, Msg, Num)
    end;
banned_check([_ | T], Msg, Num) ->
    banned_check(T, Msg, Num).

banned_check_any([], _Msg) -> false;
banned_check_any([{ok, Re} | T], Msg) ->
    case re:run(Msg, Re, [{capture, none}]) of
        match -> true;
        _ -> banned_check_any(T, Msg)
    end;
banned_check_any([_Bad | T], Msg) ->
    banned_check_any(T, Msg).

make_compile() ->
    {5,
     [re:compile(H, [unicode, ungreedy])
      || H <- keyword_list_threed()],
     [re:compile(Word, [unicode, ungreedy])
      || Word <- keyword_list_any()]}.

keyword_list_threed() ->
    ["金.*币",
     "神.*兽",
     "加.*Q",
     "先.*货",
     "先.*钻",
     "交.*易",
     "金.*幣",
     "神.*獸",
     "先.*貨",
     "先.*鑽"].

keyword_list_any() ->
    ["W金",
     "w金",
     "W钻",
     "w钻",
     "W鉆",
     "w鉆",
     "万.*砖",
     "萬.*砖",
     "万.*钻",
     "萬.*钻",
     "萬.*鉆",
     "万.*鉆",
     "萬.*鑽",
     "万.*金",
     "萬.*金",
     "淘.*手.*游"].

special_face(Msg) ->
    List = [{1000, 3}, {1001, 6}],
    special_face(Msg, List).

special_face(Msg, []) -> Msg;
special_face(Msg, [{Id, Max} | T]) ->
    Re = util:flist(lang:get("{face_2,~w,0}"), [Id]),
    MsgList = re:split(Msg, Re, [{return, list}, unicode]),
    NewMsg = special_face2(MsgList, Id, Max, []),
    special_face(NewMsg, T).

special_face2([], _Id, _Max, List) ->
    NewList = lists:reverse(List),
    lists:append(NewList);
special_face2([I], _Id, _Max, List) ->
    NewList = lists:reverse([I | List]),
    lists:append(NewList);
special_face2([I | T], Id, Max, List) ->
    Val = util:rand(1, 10000) rem Max + 1,
    Add = util:flist(lang:get("{face_2,~w,~w}"), [Id, Val]),
    special_face2(T, Id, Max, [Add, I | List]).

t() -> [].

rpc_send_screen_msg(Role = #role{s_event = Event,
                                 m_combat =
                                     #m_combat{observe_pid = ObservePid}},
                    Msg) ->
    logger:debug("发送战斗观战弹幕:~w", [Msg], chat, 592),
    case is_pid(ObservePid) of
        true ->
            case util:check_text(Msg, 40) of
                ok ->
                    ScreenMsg = get_combat_screen_mgr(Role, Msg),
                    ObservePid ! {send_screen_msg, ScreenMsg},
                    case Event =:= 63 orelse Event =:= 71 of
                        true ->
                            send_chat_msg(map, Msg, Role),
                            ok;
                        _ -> ok
                    end;
                {false, Reason} -> {false, Reason};
                _ -> {false, lang:get("存在不和谐词汇，换个试试吧")}
            end;
        false -> {false, lang:get("您没有观战，无法发送弹幕")}
    end.

get_combat_screen_mgr(Role = #role{id = Id, name = Name,
                                   classes = Classes, sex = Sex, lev = Lev},
                      Msg) ->
    BreakTimes = lev_break:get_times(Role),
    #combat_record_chat_mgr{id = Id, name = Name,
                            classes = Classes, sex = Sex, lev = Lev,
                            break_times = BreakTimes, msg = Msg}.

sptu_voice_msg_2_world({10,
                        Rid,
                        Platform,
                        ZoneId,
                        Name,
                        Sex,
                        Classes,
                        Lev,
                        Special,
                        VoiceId,
                        VoiceTime,
                        VoiceText}) ->
    {1,
     Rid,
     Platform,
     ZoneId,
     Name,
     Sex,
     Classes,
     Lev,
     Special,
     VoiceId,
     VoiceTime,
     VoiceText};
sptu_voice_msg_2_world(PackData) -> PackData.

label_to_type(world) -> 1;
label_to_type(map) -> 3;
label_to_type(guild) -> 4;
label_to_type(team) -> 2;
label_to_type(center_world) -> 8;
label_to_type(_) -> 1.

do_silent_count(#role{id = RoleId, lev = Lev,
                      charge = Charge, lock_status = LockStatus},
                ChannelType, Msg)
    when LockStatus =/= 4 ->
    case chat_mgr:check_silence(Lev, Charge, ChannelType) of
        true ->
            case role_misc:check_cd({check_silence, ChannelType}) of
                true ->
                    case chat_mgr:get_silence_cache(RoleId, ChannelType) of
                        {true, SayTime} ->
                            logger:debug("===========", [], chat, 639),
                            spawn(fun () ->
                                          adm:advert([RoleId],
                                                     SayTime,
                                                     1,
                                                     lang:get("自动禁言"),
                                                     "admin")
                                  end),
                            false;
                        _ ->
                            chat_mgr:add_silence_cache(RoleId,
                                                       ChannelType,
                                                       Msg),
                            ok
                    end;
                _ ->
                    chat_mgr:add_silence_cache(RoleId, ChannelType, Msg),
                    ok
            end;
        _ -> ok
    end;
do_silent_count(_Role, _, _) -> ok.

clean_cd(world) -> erase(rpc_10400_world);
clean_cd(map) -> erase(rpc_10400_map);
clean_cd(guild) -> erase(rpc_10400_guild);
clean_cd(canyon_side) -> erase(rpc_10400_canyon);
clean_cd(center_world) -> erase(rpc_10400_center_world);
clean_cd(_) -> ok.

