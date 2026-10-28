-file("src/mod/guild/guild_role.erl", 1).

-module(guild_role).

-export([set/2,
         get/2,
         get/1,
         alters/2,
         update/2,
         async_update/2,
         async_info/1,
         async_expel/2,
         online/1,
         online/2,
         login/1,
         logout/1,
         check_auth/4,
         check_fun/3,
         check_post/3,
         find_role/1,
         add_role/2,
         del_role/1,
         to_guild_role/1,
         count/1,
         check_conversion/2,
         update_last_guild/1,
         get_last_guild/1,
         post2honor/1,
         rename/2,
         async_apply_role/2,
         rpc_element_pray/4,
         push_element_info/1,
         rpc_save_pray/2,
         calc_attr/2,
         calc_pet/2,
         recalc_element_attr/2,
         apply_evt/2,
         gm_reset_element/1,
         push_11100/3]).

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

-file("src/mod/guild/guild_role.erl", 50).

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

-file("src/mod/guild/guild_role.erl", 51).

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

-file("src/mod/guild/guild_role.erl", 52).

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

-file("src/mod/guild/guild_role.erl", 53).

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

-file("src/mod/guild/guild_role.erl", 54).

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

-file("src/mod/guild/guild_role.erl", 55).

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

-file("src/mod/guild/guild_role.erl", 56).

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

-file("src/mod/guild/guild_role.erl", 57).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild_role.erl", 58).

-file("inc/arena.hrl", 1).

-record(m_arena,
        {ver = 1,
         cd_time = 0 :: non_neg_integer(),
         acc_num = 0 :: non_neg_integer(),
         cup = 1000 :: non_neg_integer(),
         roll_time = 0,
         roll_id = 0,
         roll_graph = []}).

-record(arena_role,
        {id = {0, "", 0} :: tuple(),
         ver = 6,
         name = "" :: bitstring(),
         win = 0 :: non_neg_integer(),
         acc_num = 0,
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         last_time = 0 :: non_neg_integer(),
         is_robot = 0 :: 0..1,
         cup = 0,
         next_log_id = 1,
         log = [],
         win_list = [],
         win_ratio = 0,
         day_time_flag = 0,
         enemy = [],
         day_win = 0,
         day_lost = 0,
         def_acc_num = 0,
         def_win = 0,
         max_cup = 1000,
         acc_sword_num = 0,
         acc_mage_num = 0,
         acc_archer_num = 0,
         acc_orc_num = 0,
         acc_devine_num = 0,
         acc_moon_num = 0,
         acc_templar_num = 0,
         win_sword = 0,
         win_mage = 0,
         win_archer = 0,
         win_orc = 0,
         win_devine = 0,
         win_moon = 0,
         win_templar = 0,
         init_def = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         last_win_role}).

-record(arena_enemy,
        {order = 0,
         role_id = {0, "", 0},
         is_robot = 0,
         classes = 0,
         lev = 0,
         sex = 0,
         cup = 0,
         soul = 1}).

-record(arena_log,
        {log_id = 1,
         s_role_id = {0, "", 0} :: tuple(),
         s_name = "" :: list(),
         result = 0 :: 0..1,
         t_role_id = {0, "", 0} :: tuple(),
         t_name = "" :: list(),
         time = 0 :: non_neg_integer(),
         s_cup = 0,
         t_cup = 0,
         s_cup_change = 0,
         t_cup_change = 0,
         feedback = 0}).

-record(arena_role_index,
        {id = {0, "", 0},
         lev = 0,
         cup = 0,
         time = 0,
         day_time_flag = 0,
         day_win = 0,
         day_lost = 0,
         win_list = [],
         win_ratio = 0}).

-record(arena_robot,
        {id = {0, "robot", 0},
         lev = 0,
         name = "",
         classes = 0,
         sex = 0,
         cup = 0}).

-record(arena_graph,
        {id = 1,
         base_id = 0,
         num = 0,
         status = 0,
         quality = 0}).

-record(arena_graph_base,
        {id = 1,
         base_id = 0,
         num = 0,
         quality = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev_low = 0,
         lev_high = 0,
         ratio = 0,
         times = 1,
         order_list = []}).

-file("src/mod/guild/guild_role.erl", 59).

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

-file("src/mod/guild/guild_role.erl", 60).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild_role.erl", 61).

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

-file("src/mod/guild/guild_role.erl", 62).

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

-file("src/mod/guild/guild_role.erl", 63).

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

-file("src/mod/guild/guild_role.erl", 64).

-file("inc/skill_prac.hrl", 1).

-record(skl_prac_meta_data,
        {id :: undefined | pos_integer(),
         name :: undefined | string(),
         obj :: undefined | pos_integer(),
         day_max_times :: undefined | pos_integer()}).

-record(skill_prac_data,
        {id :: undefined | pos_integer(),
         role_lev :: undefined | non_neg_integer(),
         skill_lev :: undefined | non_neg_integer(),
         top_lev :: undefined | non_neg_integer(),
         exp :: undefined | non_neg_integer(),
         attrs :: undefined | list(),
         lev_break_times :: undefined | non_neg_integer()}).

-record(skl_prac,
        {id = 0 :: pos_integer(),
         obj = 0 :: pos_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         enhance = [] :: list()}).

-record(skl_prac_enhance,
        {source = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer()}).

-record(skill_prac_box,
        {id :: undefined | tuple(), exps = []}).

-file("src/mod/guild/guild_role.erl", 65).

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

-file("src/mod/guild/guild_role.erl", 66).

to_guild_role(Role = #role{id = RoleId, name = Name,
                           pid = Pid, sex = Sex, classes = Classes, lev = Lev,
                           s_looks = Looks, m_arena = #m_arena{cup = Cup},
                           attr = #attr{fc = RFc},
                           assets = #assets{guild = Donation},
                           m_lev_break = #m_lev_break{times = BreakTimes}})
    when Lev >= 35 ->
    Fc = attr:get_war_fc(Role),
    SynthFc = RFc + pet_attr:calc_fc(Role),
    {ok,
     #guild_role{id = RoleId, pid = Pid, fc = Fc,
                 synth_fc = SynthFc, name = Name, sex = Sex,
                 classes = Classes, lev = Lev, looks = Looks, post = 10,
                 cup = Cup, total_value = Donation,
                 lev_break_times = BreakTimes}};
to_guild_role(Role = #role{id = RoleId, name = Name,
                           pid = Pid, sex = Sex, classes = Classes,
                           s_looks = Looks, lev = Lev,
                           m_arena = #m_arena{cup = Cup},
                           attr = #attr{fc = RFc},
                           assets = #assets{guild = Donation},
                           m_lev_break = #m_lev_break{times = BreakTimes}}) ->
    Fc = attr:get_war_fc(Role),
    SynthFc = RFc + pet_attr:calc_fc(Role),
    {ok,
     #guild_role{id = RoleId, pid = Pid, fc = Fc,
                 synth_fc = SynthFc, name = Name, sex = Sex,
                 classes = Classes, lev = Lev, looks = Looks, post = 0,
                 cup = Cup, total_value = Donation,
                 lev_break_times = BreakTimes}};
to_guild_role(#guild_apply{id = RoleId, name = Name,
                           classes = Classes, sex = Sex, looks = Looks,
                           lev = Lev, cup = Cup, time = Time,
                           donation = Donation})
    when Lev >= 35 ->
    {ok,
     #guild_role{id = RoleId, name = Name, sex = Sex,
                 lev = Lev, classes = Classes, looks = Looks, post = 10,
                 cup = Cup, last_login = Time, total_value = Donation}};
to_guild_role(#guild_apply{id = RoleId, name = Name,
                           classes = Classes, sex = Sex, looks = Looks,
                           lev = Lev, cup = Cup, time = Time,
                           donation = Donation}) ->
    {ok,
     #guild_role{id = RoleId, name = Name, sex = Sex,
                 lev = Lev, classes = Classes, looks = Looks, post = 0,
                 cup = Cup, last_login = Time, total_value = Donation}};
to_guild_role(_) -> false.

count(Members) -> count(Members, 0, 0).

count([], MemNum, FreshNum) -> {MemNum, FreshNum};
count([#guild_role{post = 0} | T], MemNum, FreshNum) ->
    count(T, MemNum, FreshNum + 1);
count([_ | T], MemNum, FreshNum) ->
    count(T, MemNum + 1, FreshNum).

login(Role0) ->
    L = [#trigger{label = evt_guild_hero, a = [],
                  m = guild_role, f = apply_evt},
         #trigger{label = evt_guild_siege_combat, a = [],
                  m = guild_role, f = apply_evt},
         #trigger{label = evt_guild_war, a = [], m = guild_role,
                  f = apply_evt}],
    {_, Role} = role_trigger:add(L, Role0),
    Result = case sync_info(Role) of
                 {ok,
                  Role1 = #role{m_guild = undefined, s_event = 2,
                                pos = Pos},
                  _Ext} ->
                     Role2 = quest_guild:sync(Role1),
                     {LMapId, Lx, Ly} = util:rand_list([{10001, 306, 3507},
                                                        {10001, 2583, 3848},
                                                        {10001, 4957, 3680},
                                                        {10001, 445, 2565},
                                                        {10001, 4646, 704},
                                                        {10001, 841, 1033},
                                                        {10001, 2098, 1834},
                                                        {10001, 3617, 1816}]),
                     NewPos = Pos#pos{map = LMapId, x = Lx, y = Ly},
                     {ok, Role2#role{s_event = 0, pos = NewPos}};
                 {ok,
                  Role1 = #role{s_event = 2, pos = Pos},
                  #{map_id := MapId}} ->
                     Role2 = quest_guild:sync(Role1),
                     NewPos = Pos#pos{map = MapId},
                     {ok, Role2#role{pos = NewPos}};
                 {ok, Role1, _Ext} ->
                     NewRole = quest_guild:sync(Role1),
                     {ok, NewRole};
                 skip -> ok
             end,
    case Result of
        ok -> {ok, Role};
        {ok, GuildRole} ->
            TimerRole = calc_element_timer(GuildRole),
            {ok, TimerRole}
    end.

logout(#role{id = RoleId,
             m_guild = #m_guild{pid = GuildPid}})
    when is_pid(GuildPid) ->
    GuildPid ! {offline, RoleId},
    ok;
logout(_) -> ok.

online(GuildPid, Role = #role{})
    when is_pid(GuildPid) ->
    {ok, GuildRole} = to_guild_role(Role),
    GuildPid ! {online, GuildRole},
    ok;
online(_, _) -> ok.

online(Role = #role{m_guild =
                        #m_guild{id = GuildId}}) ->
    case guild_mgr:pid(GuildId) of
        {ok, GuildPid} ->
            {ok, GuildRole} = to_guild_role(Role),
            GuildPid ! {online, GuildRole};
        _ -> ok
    end,
    ok.

apply_evt(#evt_guild_hero{},
          #role{id = RoleId, m_guild = #m_guild{id = GuildId}}) ->
    logger:debug("公会英雄战", [], guild_role, 150),
    guild_mgr:join(GuildId, RoleId),
    ok;
apply_evt(#evt_guild_war{},
          #role{id = RoleId, m_guild = #m_guild{id = GuildId}}) ->
    logger:debug("公会公会战", [], guild_role, 159),
    guild_mgr:join(GuildId, RoleId),
    ok;
apply_evt(_, _Role) -> ok.

get_auth(Type) ->
    case guild_data:get_auth(Type) of
        false -> 60;
        Post -> Post
    end.

check_auth(RoleId, Members, Op, Post) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        Gr = #guild_role{post = Lpost} ->
            Flag = case Op of
                       eq -> Lpost =:= Post;
                       ge -> Lpost >= Post;
                       le -> Lpost =< Post;
                       ue -> Lpost =/= Post;
                       _ -> false
                   end,
            case Flag of
                true -> {true, Gr};
                false -> false
            end;
        false -> false
    end.

check_fun(RoleId, Members, Fun) ->
    NeedPost = get_auth(Fun),
    case check_auth(RoleId, Members, ge, NeedPost) of
        false -> false;
        {true, Gr} -> {true, Gr}
    end.

check_conversion(Gr = #guild_role{post = 0, lev = Lev},
                 #guild{mem_num = MemNum, max_mem_num = MaxMemNum0,
                        exchequer_lev = ExchequerLev,
                        formalizing_lev = FormalizingLev})
    when Lev >= FormalizingLev ->
    MaxMemNum = case guild_data:exchequer(ExchequerLev) of
                    #{mem := MMemNum} -> MMemNum;
                    _ -> MaxMemNum0
                end,
    case MaxMemNum > MemNum of
        true ->
            NewGr = Gr#guild_role{post = 10},
            async_info(NewGr),
            {true, NewGr};
        _ -> false
    end;
check_conversion(_, _) -> false.

update_last_guild(#role{id = Id, name = Name,
                        m_guild =
                            #m_guild{id = GuildId, value = Value,
                                     total_value = TotalValue}}) ->
    update_last_guild(#guild_leaver{id = Id, name = Name,
                                    guild_id = GuildId, value = Value,
                                    total_value = TotalValue});
update_last_guild({#guild_role{id = Id, name = Name,
                               value = Value, total_value = TotalValue},
                   GuildId}) ->
    update_last_guild(#guild_leaver{id = Id, name = Name,
                                    guild_id = GuildId, value = Value,
                                    total_value = TotalValue});
update_last_guild(Role = #guild_leaver{}) ->
    Role1 = Role#guild_leaver{time = date:unixtime()},
    ets:insert(guild_leaver, Role1),
    dets:insert(guild_leaver, Role1).

get_last_guild(RoleId) ->
    case ets:lookup(guild_leaver, RoleId) of
        [R = #guild_leaver{}] -> {ok, R};
        _ -> none
    end.

check_post(_, #guild_role{post = Post}, Post) ->
    {false, lang:get("改成员已经是这个职位，不用设置")};
check_post(#guild{mem_num = MemNum,
                  max_mem_num = MaxMemNum0, exchequer_lev = ExchequerLev},
           #guild_role{post = 0}, 10) ->
    MaxMemNum = case guild_data:exchequer(ExchequerLev) of
                    #{mem := MMemNum} -> MMemNum;
                    _ -> MaxMemNum0
                end,
    case MemNum >= MaxMemNum of
        true -> {false, lang:get("成员人数已满, 无法设置")};
        false -> true
    end;
check_post(#guild{mem_num = MemNum,
                  max_mem_num = MaxMemNum0, members = Members,
                  exchequer_lev = ExchequerLev},
           #guild_role{post = 0}, Post) ->
    MaxMemNum = case guild_data:exchequer(ExchequerLev) of
                    #{mem := MMemNum} -> MMemNum;
                    _ -> MaxMemNum0
                end,
    case MemNum >= MaxMemNum of
        true -> {false, lang:get("成员人数已满, 无法设置")};
        false ->
            List = [R
                    || R = #guild_role{post = P} <- Members, P =:= Post],
            Len = length(List),
            Num = case Post of
                      25 -> max(0, 6 - Len);
                      30 -> max(0, 6 - Len);
                      20 -> max(0, 12 - Len);
                      40 -> max(0, 4 - Len);
                      50 -> max(0, 2 - Len);
                      60 -> max(0, 1 - Len);
                      _ -> 0
                  end,
            case Num > 0 of
                true -> true;
                false -> {false, lang:get("对应职位人数已满, 无法设置")}
            end
    end;
check_post(#guild{}, #guild_role{}, 10) -> true;
check_post(#guild{members = Members,
                  max_fresh_num = MaxFreshNum0,
                  exchequer_lev = ExchequerLev},
           #guild_role{}, Post) ->
    MaxFreshNum = case guild_data:exchequer(ExchequerLev) of
                      #{fresh := MFreshNum} -> MFreshNum;
                      _ -> MaxFreshNum0
                  end,
    List = [R
            || R = #guild_role{post = P} <- Members, P =:= Post],
    Len = length(List),
    Num = case Post of
              25 -> max(0, 6 - Len);
              30 -> max(0, 6 - Len);
              20 -> max(0, 12 - Len);
              40 -> max(0, 4 - Len);
              50 -> max(0, 2 - Len);
              60 -> max(0, 1 - Len);
              0 -> max(0, MaxFreshNum - Len);
              _ -> 0
          end,
    case Num > 0 of
        true -> true;
        false -> {false, lang:get("对应职位人数已满, 无法设置")}
    end.

async_info(#guild_role{id = {Id, P, Z}, post = Post}) ->
    case role_query:pid(by_id, Id, P, Z) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {guild_role, set, [{post, Post}]});
        _ -> skip
    end.

async_expel(#guild_role{id = {Id, P, Z}}, GuildName) ->
    case role_query:pid(by_id, Id, P, Z) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {guild_role, set, [{expel, GuildName}]});
        _ -> skip
    end.

-spec find_role(RoleId :: role_id()) -> {ok,
                                         GuildId :: guild_id()} |
                                        false |
                                        {error, term()}.

find_role(RoleId) ->
    case catch ets:lookup(guild_role_idx, RoleId) of
        [{_, GuildId}] -> {ok, GuildId};
        [] -> false;
        _Err ->
            logger:debug("查询角色公会记录出错: ~w", [_Err], guild_role, 320),
            {error, guild_data_not_running}
    end.

-spec del_role(RoleId :: role_id()) -> ok.

del_role(RoleId) ->
    ets:delete(guild_role_idx, RoleId),
    ok.

-spec add_role(GuildId :: guild_id(),
               RoleId :: role_id()) -> ok.

add_role(GuildId, RoleId) ->
    ets:insert(guild_role_idx, {RoleId, GuildId}),
    ok.

pack_11100(State, #m_guild{post = Post}) ->
    {State, Post};
pack_11100(State, #guild_role{post = Post}) ->
    {State, Post};
pack_11100(_, _) -> false.

push_11100(Pid, State, GuildRole) when is_pid(Pid) ->
    case pack_11100(State, GuildRole) of
        Data = {_, _} -> role:pack_send(Pid, 11100, Data);
        false -> ok
    end,
    ok;
push_11100(_, _, _) -> ok.

sync_info(Role = #role{id = RoleId, m_guild = _OldMg,
                       pid = Pid}) ->
    case find_role(RoleId) of
        false ->
            Role1 = Role#role{m_guild = undefined},
            NewRole = case honor:del(Role1,
                                     [30109, 30110 | lists:seq(11010, 11017)],
                                     no_push)
                          of
                          {ok, Role2} -> Role2;
                          _ -> Role1
                      end,
            {ok, NewRole, no_guild};
        {ok, GuildId} ->
            case guild_mgr:info(by_id, GuildId) of
                {ok,
                 #guild{lev = GuildLev, pid = GuildPid, name = GuildName,
                        members = Members, map_id = MapId}} ->
                    case lists:keyfind(RoleId, #guild_role.id, Members) of
                        false ->
                            logger:debug("异步处理产生的偏差，在对应公会查找不到玩家,玩家已经被踢",
                                         [],
                                         guild_role,
                                         371),
                            {ok, Role#role{m_guild = undefined}, no_guild};
                        #guild_role{post = Post, enter_time = EnterTime,
                                    value = Value, total_value = TotalValue,
                                    signature = Signature,
                                    element_attr = ElementAttr,
                                    tmp_element_attr = TmpElementAttr} ->
                            NewMg = #m_guild{post = Post, id = GuildId,
                                             pid = GuildPid, name = GuildName,
                                             enter_time = EnterTime,
                                             guild_lev = GuildLev,
                                             value = Value,
                                             total_value = TotalValue,
                                             signature = Signature,
                                             element_attr = ElementAttr,
                                             tmp_element_attr = TmpElementAttr},
                            Role1 = Role#role{m_guild = NewMg},
                            NewRole = case honor:add_and_use(Role1,
                                                             post2honor(Post),
                                                             no_push)
                                          of
                                          {ok, Role2} -> Role2;
                                          _ -> Role1
                                      end,
                            role:apply(async, Pid, {fun online_sync/1}),
                            {ok, NewRole, #{map_id => MapId}}
                    end;
                {error, guild_not_exists} ->
                    logger:error("公会数据与角色公会数据不匹配", [], guild_role, 388),
                    {ok, Role#role{m_guild = undefined}, no_guild};
                _Err ->
                    logger:error("无法查询公会数据：~w", [_Err], guild_role, 391),
                    skip
            end;
        _Err ->
            logger:error("无法查询角色数据：~w", [_Err], guild_role, 395),
            skip
    end.

online_sync(Role = #role{m_guild =
                             #m_guild{pid = GuildPid, post = Post}}) ->
    online(GuildPid, Role),
    Role1 = role_trigger:fire([#evt_guild{},
                               #evt_guild_post{post = Post}],
                              Role),
    {ok, Role1};
online_sync(_Role) -> ok.

set(Role, []) -> {ok, Role};
set(Role, [Flag | T]) ->
    case set(Role, Flag) of
        {ok, NewRole} -> set(NewRole, T);
        _ -> set(Role, T)
    end;
set(Role, {guild_restart, GuildPid}) ->
    update(Role, restart),
    {ok, alters([{pid, GuildPid}], Role)};
set(Role = #role{s_event = 2}, {expel, GuildName}) ->
    case map:role_enter(util:rand_list([{10001, 306, 3507},
                                        {10001, 2583, 3848},
                                        {10001, 4957, 3680},
                                        {10001, 445, 2565},
                                        {10001, 4646, 704},
                                        {10001, 841, 1033},
                                        {10001, 2098, 1834},
                                        {10001, 3617, 1816}]),
                        Role#role{s_event = 0})
        of
        {ok, NewRole} ->
            {ok, alters([{expel, GuildName}], NewRole)};
        _Err ->
            logger:error("移除公会时,角色进入主城时失败:~w",
                         [_Err],
                         guild_role,
                         428),
            {ok, alters([{expel, GuildName}], Role)}
    end;
set(Role, {expel, GuildName}) ->
    {ok, alters([{expel, GuildName}], Role)};
set(Role,
    {create,
     GuildId,
     GuildLev,
     GuildPid,
     GuildName,
     #guild_role{post = Post, enter_time = EnterTime,
                 signature = Signature}}) ->
    NewMg = #m_guild{post = Post, id = GuildId,
                     pid = GuildPid, name = GuildName,
                     enter_time = EnterTime, guild_lev = GuildLev,
                     signature = Signature},
    NewRole = alters([{m_guild, NewMg}], Role),
    {ok, NewRole};
set(Role, {post, Post}) ->
    Role1 = alters([{post, Post}], Role),
    NewRole = role_trigger:fire(#evt_guild_post{post =
                                                    Post},
                                Role1),
    {ok, NewRole};
set(Role = #role{}, {signature, Signature, Post}) ->
    Role1 = alters([{signature, {Signature, Post}}], Role),
    {ok, Role1};
set(Role = #role{}, {name, GName}) ->
    Role1 = alters([{name, GName}], Role),
    {ok, Role1};
set(Role, {guild_lev, GuildLev}) ->
    NewRole = alters([{guild_lev, GuildLev}], Role),
    {ok, role_trigger:fire(#evt_guild_lev{}, NewRole)}.

alters([], Role) -> Role;
alters([{Type, Val} | T], Role) ->
    NewRole = do_alter(Type, Val, Role),
    alters(T, NewRole).

do_alter(pid, Pid,
         Role = #role{m_guild = Mg = #m_guild{}}) ->
    Role#role{m_guild = Mg#m_guild{pid = Pid}};
do_alter(post, Post,
         Role = #role{m_guild = Mg = #m_guild{}}) ->
    Role1 = Role#role{m_guild = Mg#m_guild{post = Post}},
    NewRole = case honor:add_and_use(Role1,
                                     post2honor(Post),
                                     push)
                  of
                  {ok, Role2} -> Role2;
                  _ -> Role1
              end,
    role:link_send(Role, 11107, {Post}),
    map:role_update(NewRole),
    NewRole;
do_alter(m_guild, Mg = #m_guild{post = Post},
         Role = #role{}) ->
    Role1 = Role#role{m_guild = Mg},
    NewRole = case honor:add_and_use(Role1,
                                     post2honor(Post),
                                     push)
                  of
                  {ok, Role2} -> Role2;
                  _ -> Role1
              end,
    HonorRole = honor_mgr:update(NewRole),
    {ok, BuffRole} = guild_war:handle_buff(HonorRole),
    FireRole = role_trigger:fire([#evt_guild{},
                                  #evt_guild_post{post = Post}],
                                 BuffRole),
    honor:push(FireRole, push),
    map:role_update(FireRole),
    FireRole;
do_alter(expel, GuildName, Role) ->
    role:link_send(Role,
                   11105,
                   {1, util:flist(lang:get("您被移出~ts公会"), [GuildName])}),
    Role1 = Role#role{m_guild = undefined},
    Role3 = case honor:del(Role1,
                           [30109, 30110 | lists:seq(11010, 11017)],
                           push)
                of
                {ok, Role2} -> Role2;
                _ -> Role1
            end,
    Role5 = case quest_guild:giveup(Role3) of
                {ok, Role4 = #role{}} -> Role4;
                _ -> Role3
            end,
    Role7 = case team:away(Role5) of
                {ok, Role6} -> Role6;
                _ -> Role5
            end,
    Role8 = role_trigger:fire(#evt_guild_leave{}, Role7),
    {ok, NewRole} = guild_war:handle_buff(Role8),
    buff:pack_list(NewRole),
    NewRole;
do_alter(guild_lev, GuildLev,
         Role = #role{m_guild = Mg = #m_guild{}}) ->
    Role#role{m_guild = Mg#m_guild{guild_lev = GuildLev}};
do_alter(signature, {Signature, Post},
         Role = #role{pid = RolePid,
                      m_guild = Mg = #m_guild{post = MyPost}}) ->
    NewRole = Role#role{m_guild =
                            Mg#m_guild{signature = Signature}},
    case Post =/= MyPost of
        true ->
            PostName = guild_util:post_to_name(Post),
            notice:send({pid, RolePid},
                        1,
                        util:flist(lang:get("【~ts】把你的个性称号设置成【~ts】"),
                                   [PostName, Signature]));
        _ -> ok
    end,
    map:role_update(NewRole),
    NewRole;
do_alter(name, GName, Role = #role{m_guild = Mg}) ->
    NewRole = Role#role{m_guild = Mg#m_guild{name = GName}},
    map:role_update(NewRole),
    NewRole;
do_alter(_Type, _, Role) ->
    logger:error("无法修改角色公会属性，未知类型:~w",
                 [_Type],
                 guild_role,
                 544),
    Role.

-spec update(#role{}, atom()) -> ok.

update(#role{m_guild = undefined}, _) -> ok;
update(#role{pid = Pid, id = RoleId,
             m_guild = #m_guild{id = GuildId}},
       restart) ->
    guild_mgr:apply(async,
                    GuildId,
                    {guild_role, async_update, [{restart, Pid, RoleId}]}),
    ok;
update(#role{id = RoleId, lev = Lev,
             m_guild = #m_guild{id = GuildId}},
       lev) ->
    guild_mgr:apply(async,
                    GuildId,
                    {guild_role, async_update, [{lev, Lev, RoleId}]}),
    ok;
update(#role{id = RoleId, classes = Classes,
             m_guild = #m_guild{id = GuildId}},
       classes) ->
    guild_mgr:apply(async,
                    GuildId,
                    {guild_role,
                     async_update,
                     [{classes, Classes, RoleId}]}),
    ok;
update(Role = #role{m_guild = #m_guild{id = GuildId}},
       sync) ->
    {ok, GuildRole} = to_guild_role(Role),
    guild_mgr:apply(async,
                    GuildId,
                    {guild_role, async_update, [{sync, GuildRole}]}),
    ok;
update(_Role = #role{id = RoleId,
                     m_guild = #m_guild{id = GuildId}},
       chat) ->
    guild_mgr:apply(async,
                    GuildId,
                    {guild_role, async_update, [{chat, RoleId}]}),
    ok;
update(_Role = #role{id = RoleId,
                     m_guild = #m_guild{id = GuildId}},
       doing) ->
    guild_mgr:apply(async,
                    GuildId,
                    {guild_role, async_update, [{doing, RoleId}]}),
    ok;
update(_Role = #role{id = RoleId,
                     m_guild = #m_guild{id = GuildId}},
       {gm_active, Val}) ->
    guild_mgr:apply(async,
                    GuildId,
                    {guild_role, async_update, [{gm_active, RoleId, Val}]}),
    ok;
update(_Data, _Cmd) ->
    logger:error("未知角色命令[~w]", [_Cmd], guild_role, 589),
    ok.

rename(#role{m_guild = #m_guild{pid = GuildPid},
             id = Id, name = Name},
       _OldName) ->
    guild_mgr:apply(async,
                    GuildPid,
                    {guild_role, async_update, [{rename, Id, Name}]}),
    ok;
rename(_, _) -> ok.

get(#role{m_guild = undefined}, _) -> false;
get(#role{m_guild = #m_guild{id = GuildId},
          name = Rname},
    Mid) ->
    case guild_mgr:members(GuildId) of
        {ok, Members} ->
            case lists:keyfind(Mid, #guild_role.id, Members) of
                R = #guild_role{} -> R;
                _ -> false
            end;
        {error, guild_not_exists} -> false;
        {error, Err} ->
            logger:error("无法查询[~ts]所属的公会信息: ~w",
                         [Rname, Err],
                         guild_role,
                         609),
            false
    end.

get(Mid) ->
    case find_role(Mid) of
        {ok, Gid} ->
            case guild_mgr:members(Gid) of
                {ok, Members} ->
                    case lists:keyfind(Mid, #guild_role.id, Members) of
                        R = #guild_role{} -> R;
                        _ -> false
                    end;
                {error, Err} ->
                    logger:error("无法查询id为[~w]的公会信息: ~w",
                                 [Gid, Err],
                                 guild_role,
                                 623),
                    false
            end;
        _ -> {error, no_guild}
    end.

async_update(State = #guild{members = Members},
             {sync,
              #guild_role{name = Name, sex = Sex, classes = Classes,
                          lev = Lev, fc = Fc, id = RoleId, looks = Looks,
                          cup = Cup}}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> ok;
        #guild_role{name = Name, sex = Sex, classes = Classes,
                    lev = Lev, fc = Fc, looks = Looks, cup = Cup} ->
            ok;
        M = #guild_role{} ->
            M1 = M#guild_role{name = Name, sex = Sex,
                              classes = Classes, lev = Lev, fc = Fc,
                              looks = Looks, cup = Cup},
            {Flag, NewM} = case check_conversion(M1, State) of
                               false -> {false, M1};
                               {true, M2} -> {true, M2}
                           end,
            NewMembers = lists:keyreplace(RoleId,
                                          #guild_role.id,
                                          Members,
                                          NewM),
            NewState = case Flag of
                           true ->
                               {NewMemNum, NewFreshNum} =
                                   guild_role:count(NewMembers),
                               State#guild{members = NewMembers,
                                           fresh_num = NewFreshNum,
                                           mem_num = NewMemNum};
                           false -> State#guild{members = NewMembers}
                       end,
            {ok, NewState}
    end;
async_update(State = #guild{members = Members},
             {restart, Pid, RoleId}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> ok;
        M = #guild_role{} ->
            NewM = M#guild_role{pid = Pid, status = 1},
            NewMembers = lists:keyreplace(RoleId,
                                          #guild_role.id,
                                          Members,
                                          NewM),
            NewState = State#guild{members = NewMembers},
            {ok, NewState}
    end;
async_update(State = #guild{members = Members},
             {lev, Lev, RoleId}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> ok;
        M = #guild_role{} ->
            NewM = M#guild_role{lev = Lev},
            NewMembers = lists:keystore(RoleId,
                                        #guild_role.id,
                                        Members,
                                        NewM),
            NewState = State#guild{flag = 1, members = NewMembers},
            guild:sync_cache(NewState),
            {ok, NewState}
    end;
async_update(State = #guild{members = Members},
             {classes, Classes, RoleId}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> ok;
        M = #guild_role{} ->
            NewM = M#guild_role{classes = Classes},
            NewMembers = lists:keystore(RoleId,
                                        #guild_role.id,
                                        Members,
                                        NewM),
            NewState = State#guild{flag = 1, members = NewMembers},
            guild:sync_cache(NewState),
            {ok, NewState}
    end;
async_update(State = #guild{members = Members,
                            leader_id = LeaderId},
             {rename, RoleId, Name}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> ok;
        M = #guild_role{} ->
            NewM = M#guild_role{name = Name},
            NewMembers = lists:keystore(RoleId,
                                        #guild_role.id,
                                        Members,
                                        NewM),
            guild:cast(NewMembers, 11110, {1, NewM}),
            NewState = case LeaderId of
                           RoleId ->
                               State#guild{flag = 1, members = NewMembers,
                                           leader_name = Name};
                           _ -> State#guild{flag = 1, members = NewMembers}
                       end,
            guild:sync_cache(NewState),
            {ok, NewState}
    end;
async_update(State = #guild{members = Members},
             {chat, RoleId}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> ok;
        M = #guild_role{chat_num_list = List} ->
            Zero = date:unixtime(zero),
            NewNum = case lists:keyfind(Zero, 1, List) of
                         {_, Num} -> Num + 1;
                         _ -> 1
                     end,
            NewList = lists:keystore(Zero, 1, List, {Zero, NewNum}),
            NewM = M#guild_role{chat_num_list = NewList},
            NewMembers = lists:keystore(RoleId,
                                        #guild_role.id,
                                        Members,
                                        NewM),
            guild:cast(NewMembers, 11110, {1, NewM}),
            NewState = State#guild{flag = 1, members = NewMembers},
            guild:sync_cache(NewState),
            {ok, NewState}
    end;
async_update(State = #guild{members = Members},
             {doing, RoleId}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> ok;
        M = #guild_role{doing_list = List} ->
            Zero = date:unixtime(zero),
            NewNum = case lists:keyfind(Zero, 1, List) of
                         {_, Num} -> Num + 1;
                         _ -> 1
                     end,
            NewList = lists:keystore(Zero, 1, List, {Zero, NewNum}),
            NewM = M#guild_role{doing_list = NewList},
            NewMembers = lists:keystore(RoleId,
                                        #guild_role.id,
                                        Members,
                                        NewM),
            guild:cast(NewMembers, 11110, {1, NewM}),
            NewState = State#guild{flag = 1, members = NewMembers},
            guild:sync_cache(NewState),
            {ok, NewState}
    end;
async_update(State = #guild{members = Members},
             {element_attr, RoleId, ElementAttr}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> ok;
        M = #guild_role{} ->
            NewM = M#guild_role{element_attr = ElementAttr},
            NewMembers = lists:keystore(RoleId,
                                        #guild_role.id,
                                        Members,
                                        NewM),
            guild:cast(NewMembers, 11110, {1, NewM}),
            NewState = State#guild{flag = 1, members = NewMembers},
            guild:sync_cache(NewState),
            {ok, NewState}
    end;
async_update(State = #guild{members = Members},
             {tmp_element_attr, RoleId, TmpElementAttr}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> ok;
        M = #guild_role{} ->
            NewM = M#guild_role{tmp_element_attr = TmpElementAttr},
            NewMembers = lists:keystore(RoleId,
                                        #guild_role.id,
                                        Members,
                                        NewM),
            guild:cast(NewMembers, 11110, {1, NewM}),
            NewState = State#guild{flag = 1, members = NewMembers},
            guild:sync_cache(NewState),
            {ok, NewState}
    end;
async_update(State = #guild{members = Members},
             {gm_active, RoleId, Val}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> ok;
        M = #guild_role{doing_list = List,
                        chat_num_list = List2} ->
            NewList = [{Time - Val * 86400, Num}
                       || {Time, Num} <- List],
            NewList2 = [{Time - Val * 86400, Num}
                        || {Time, Num} <- List2],
            NewM = M#guild_role{doing_list = NewList,
                                chat_num_list = NewList2},
            NewMembers = lists:keystore(RoleId,
                                        #guild_role.id,
                                        Members,
                                        NewM),
            guild:cast(NewMembers, 11110, {1, NewM}),
            NewState = State#guild{flag = 1, members = NewMembers},
            guild:sync_cache(NewState),
            {ok, NewState}
    end;
async_update(_State = #guild{name = Name}, _Data) ->
    logger:error("公会[~ts]收到未知更新角色信息[~w]",
                 [Name, _Data],
                 guild_role,
                 788),
    ok.

post2honor(60) -> 11010;
post2honor(50) -> 11011;
post2honor(40) -> 11012;
post2honor(30) -> 11016;
post2honor(20) -> 11013;
post2honor(25) -> 11017;
post2honor(10) -> 11014;
post2honor(0) -> 11015;
post2honor(_) -> 0.

async_apply_role(#guild{members = Members}, MFA) ->
    async_apply_role(Members, MFA);
async_apply_role([], _MFA) -> ok;
async_apply_role([#guild_role{pid = Pid} | Rest], MFA)
    when is_pid(Pid) ->
    role:apply(async, Pid, MFA),
    async_apply_role(Rest, MFA);
async_apply_role([_H | Rest], MFA) ->
    async_apply_role(Rest, MFA);
async_apply_role(_, _MFA) -> ok.

rpc_element_pray(Role, Type, UseType, CostType) ->
    case pray_element([check, cost, add_effect],
                      Role,
                      #{type => Type, use_type => UseType,
                        cost_type => CostType})
        of
        {ok, PrayRole} ->
            NewRole = role_trigger:fire(#evt_guild_pray{},
                                        PrayRole),
            {ok, NewRole};
        {false, Reason} ->
            logger:debug("进行元素祈福失败:~ts", [Reason], guild_role, 821),
            {false, Reason}
    end.

pray_element([], NewRole, _Args) -> {ok, NewRole};
pray_element([check | Rest],
             Role = #role{m_guild = MGuild},
             Args = #{type := Type}) ->
    case MGuild of
        #m_guild{id = GuildId, pid = GuildPid} ->
            case lookup_guild_element_pray(GuildId) of
                {ok, []} -> {false, lang:get("工会元素祭坛还未进行解锁，不能进行祈福")};
                {ok, ElementInfo} ->
                    case Type of
                        2 ->
                            case [true
                                  || #element_info{lev = Lev} <- ElementInfo,
                                     Lev >= 20]
                                of
                                [] ->
                                    Msg =
                                        notice:format(lang:get("元素祭坛没有达到~ts级以上的元素，不能进行宠物祈福"),
                                                      [{string_2, 1, 20}]),
                                    {false, Msg};
                                _ ->
                                    pray_element(Rest,
                                                 Role,
                                                 Args#{element_info =>
                                                           ElementInfo,
                                                       guild_pid => GuildPid})
                            end;
                        _ ->
                            pray_element(Rest,
                                         Role,
                                         Args#{element_info => ElementInfo,
                                               guild_pid => GuildPid})
                    end;
                _ -> {false, lang:get("您没有工会，不能进行祈福")}
            end;
        _ -> {false, lang:get("您没有工会，不能进行祈福")}
    end;
pray_element([cost | Rest], Role,
             Args = #{cost_type := CostType, use_type := UseType,
                      element_info := ElementInfo}) ->
    UseElementInfo = case UseType of
                         1 -> ElementInfo;
                         2 -> guild_build:get_max_element()
                     end,
    TotalLev = lists:foldl(fun (#element_info{lev = EmtLev},
                                Rtn) ->
                                   EmtLev + Rtn
                           end,
                           0,
                           UseElementInfo),
    SelfTotalLev = lists:foldl(fun (#element_info{lev =
                                                      EmtLev},
                                    Rtn) ->
                                       EmtLev + Rtn
                               end,
                               0,
                               ElementInfo),
    Flag = SelfTotalLev < TotalLev,
    logger:debug("元素祭坛等级:~w, 本会:~w",
                 [TotalLev, SelfTotalLev],
                 guild_role,
                 866),
    case get_element_cost_pray(Role,
                               max(TotalLev, SelfTotalLev),
                               UseType,
                               CostType,
                               Flag)
        of
        Cost = [_ | _] ->
            logger:debug("祈福消耗:~w", [Cost], guild_role, 869),
            Loss = format:val_to_loss(Cost),
            case role_gain:do_notice(Loss, Role) of
                {ok, NewRole} ->
                    case Flag =:= false andalso UseType =:= 2 of
                        true ->
                            Msg = lang:get("由于您公会的元素祭坛是最强的，极限祈福没有增加元素的消耗"),
                            notice:return(Msg);
                        _ -> ok
                    end,
                    pray_element(Rest, NewRole, Args);
                {false, #loss{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("资源不足，不能进行公会祈福")}
            end;
        _ -> {false, lang:get("暂时不能进行公会祈福，配置错误")}
    end;
pray_element([add_effect | Rest],
             Role = #role{id = RoleId,
                          m_guild =
                              MGuild = #m_guild{tmp_element_attr =
                                                    TmpElementAttr,
                                                element_attr = ElementAttr},
                          m_pet = #m_pet{pets = Pets}},
             Args = #{use_type := UseType, type := EffectObj,
                      guild_pid := GuildPid, element_info := ElementInfo}) ->
    RandElementAttr = rand_element_attr(UseType,
                                        EffectObj,
                                        ElementInfo),
    logger:debug("随机到的属性：~w",
                 [RandElementAttr],
                 guild_role,
                 889),
    Now = date:unixtime(),
    NewRole = case lists:keyfind(EffectObj,
                                 #guild_element_attr.effect_obj,
                                 ElementAttr)
                  of
                  #guild_element_attr{end_time = EndTime}
                      when Now < EndTime ->
                      NewTmpElementAttr = lists:keystore(EffectObj,
                                                         #guild_element_attr.effect_obj,
                                                         TmpElementAttr,
                                                         RandElementAttr#guild_element_attr{end_time
                                                                                                =
                                                                                                Now
                                                                                                    +
                                                                                                    30}),
                      guild_mgr:apply(async,
                                      GuildPid,
                                      {guild_role,
                                       async_update,
                                       [{tmp_element_attr,
                                         RoleId,
                                         NewTmpElementAttr}]}),
                      Role#role{m_guild =
                                    MGuild#m_guild{tmp_element_attr =
                                                       NewTmpElementAttr}};
                  _ ->
                      logger:debug("直接进行保存:", [], guild_role, 900),
                      NewRandElementAttr =
                          RandElementAttr#guild_element_attr{end_time =
                                                                 Now + 60},
                      NewElementAttr = lists:keystore(EffectObj,
                                                      #guild_element_attr.effect_obj,
                                                      ElementAttr,
                                                      NewRandElementAttr),
                      guild_mgr:apply(async,
                                      GuildPid,
                                      {guild_role,
                                       async_update,
                                       [{element_attr,
                                         RoleId,
                                         NewElementAttr}]}),
                      EmtRole = Role#role{m_guild =
                                              MGuild#m_guild{element_attr =
                                                                 NewElementAttr}},
                      AttrRole = case EffectObj of
                                     1 -> attr:calc_and_push(EmtRole);
                                     2 ->
                                         PetRole = pet_attr:batch_calc(Pets,
                                                                       EmtRole),
                                         pet_util:push_client_pets(PetRole),
                                         ChildRole =
                                             child_attr:batch_calc(PetRole),
                                         child_attr:push_client_childs(ChildRole),
                                         ChildRole;
                                     _ -> EmtRole
                                 end,
                      calc_element_timer(AttrRole)
              end,
    pray_element(Rest, NewRole, Args).

rand_element_attr(UseType, EffectObj, ElementInfo) ->
    RandElementInfo = case UseType of
                          1 -> ElementInfo;
                          _ -> guild_build:get_max_element()
                      end,
    RandList = guild_data:get_rand_element(EffectObj),
    Count = case util:rand_list(RandList, 2) of
                {_Count, _} -> _Count;
                _ -> 1
            end,
    TypeList = lists:foldl(fun (EmtType, Rtn) ->
                                   case lists:keyfind(EmtType,
                                                      #element_info.build_type,
                                                      RandElementInfo)
                                       of
                                       #element_info{lev = Lev} ->
                                           case guild_data:get_element({Lev,
                                                                        EmtType})
                                               of
                                               #{pray_ratio := PrayRatio} ->
                                                   case EffectObj of
                                                       1 ->
                                                           [{EmtType,
                                                             Lev,
                                                             PrayRatio}
                                                            | Rtn];
                                                       2 when Lev >= 20 ->
                                                           [{EmtType,
                                                             Lev,
                                                             PrayRatio}
                                                            | Rtn];
                                                       _ -> Rtn
                                                   end;
                                               _ -> Rtn
                                           end;
                                       _ -> Rtn
                                   end
                           end,
                           [],
                           [5, 6, 7, 8, 9, 10]),
    BuildTypeList = util:rand_list_n(TypeList, 3, Count),
    rand_element_attr(BuildTypeList,
                      #guild_element_attr{effect_obj = EffectObj}).

rand_element_attr([],
                  ElementAttr = #guild_element_attr{attr = BaseAttr}) ->
    NewBaseAttr = lists:foldl(fun ({EffectType,
                                    EffectValue},
                                   Rtn) ->
                                      case
                                          guild_data:get_element_attr_ratio(EffectType)
                                          of
                                          RandList = [_ | _] ->
                                              case util:rand_list(RandList, 2)
                                                  of
                                                  {Ratio, _} ->
                                                      NewVal = round(EffectValue
                                                                         * Ratio
                                                                         / 100),
                                                      [{EffectType, NewVal}
                                                       | Rtn];
                                                  _ ->
                                                      [{EffectType, EffectValue}
                                                       | Rtn]
                                              end;
                                          _ -> [{EffectType, EffectValue} | Rtn]
                                      end
                              end,
                              [],
                              BaseAttr),
    ElementAttr#guild_element_attr{attr = NewBaseAttr};
rand_element_attr([{EmtType, EmtLev, _} | Rest],
                  ElementAttr = #guild_element_attr{attr = BaseAttr,
                                                    effect_obj = EffectObj}) ->
    case guild_data:get_element({EmtLev, EmtType}) of
        #{buff_attr := Attr, pet_buff_attr := PetAttr,
          up_ratio := UpRatio, skill_prac := SkillPrac,
          up_attr := UpAttr, pet_up_attr := PetUpAttr} ->
            {AddSkillPrac, AddUpAttr} = case util:rand(0, 1000) <
                                                 UpRatio
                                            of
                                            true ->
                                                case EffectObj of
                                                    1 -> {SkillPrac, UpAttr};
                                                    _ -> {[], PetUpAttr}
                                                end;
                                            _ -> {[], []}
                                        end,
            Now = date:unixtime(),
            NewElementAttr = case EffectObj of
                                 1 ->
                                     ElementAttr#guild_element_attr{attr =
                                                                        BaseAttr
                                                                            ++
                                                                            Attr,
                                                                    add_skill_list
                                                                        =
                                                                        AddSkillPrac,
                                                                    high_attr =
                                                                        AddUpAttr,
                                                                    end_time =
                                                                        Now +
                                                                            60};
                                 2 ->
                                     ElementAttr#guild_element_attr{attr =
                                                                        BaseAttr
                                                                            ++
                                                                            PetAttr,
                                                                    add_skill_list
                                                                        =
                                                                        AddSkillPrac,
                                                                    high_attr =
                                                                        AddUpAttr,
                                                                    end_time =
                                                                        Now +
                                                                            60};
                                 _ -> ElementAttr
                             end,
            rand_element_attr(Rest, NewElementAttr);
        _ -> rand_element_attr(Rest, ElementAttr)
    end.

push_element_info(Role = #role{m_guild = MGuild}) ->
    case MGuild of
        #m_guild{element_attr = ElementAttr,
                 tmp_element_attr = TmpElementAttr} ->
            logger:debug(lang:get("属性推送:~w, ~w"),
                         [ElementAttr, TmpElementAttr],
                         guild_role,
                         1004),
            role:link_send(Role,
                           11192,
                           {ElementAttr, TmpElementAttr});
        _ -> role:link_send(Role, 11192, {[], []})
    end.

rpc_save_pray(Role = #role{id = RoleId,
                           m_guild = MGuild, m_pet = #m_pet{pets = Pets}},
              Type) ->
    case MGuild of
        #m_guild{pid = GuildPid,
                 tmp_element_attr = TmpElementAttr,
                 element_attr = EmtAttr} ->
            case lists:keyfind(Type,
                               #guild_element_attr.effect_obj,
                               TmpElementAttr)
                of
                Attr = #guild_element_attr{add_skill_list =
                                               AddSkillPrac} ->
                    Now = date:unixtime(),
                    NewAttr = Attr#guild_element_attr{end_time = Now + 60},
                    NewEmtAttr = lists:keystore(Type,
                                                #guild_element_attr.effect_obj,
                                                EmtAttr,
                                                NewAttr),
                    NewTmpElementAttr = lists:keydelete(Type,
                                                        #guild_element_attr.effect_obj,
                                                        TmpElementAttr),
                    guild_mgr:apply(async,
                                    GuildPid,
                                    {guild_role,
                                     async_update,
                                     [{tmp_element_attr,
                                       RoleId,
                                       NewTmpElementAttr}]}),
                    guild_mgr:apply(async,
                                    GuildPid,
                                    {guild_role,
                                     async_update,
                                     [{element_attr, RoleId, NewEmtAttr}]}),
                    NewMGuild = MGuild#m_guild{element_attr = NewEmtAttr,
                                               tmp_element_attr =
                                                   NewTmpElementAttr},
                    GuildRole = Role#role{m_guild = NewMGuild},
                    AttrRole = case Type of
                                   1 -> attr:calc_and_push(GuildRole);
                                   2 ->
                                       PetRole = pet_attr:batch_calc(Pets,
                                                                     GuildRole),
                                       pet_util:push_client_pets(PetRole),
                                       ChildRole =
                                           child_attr:batch_calc(PetRole),
                                       child_attr:push_client_childs(ChildRole),
                                       ChildRole;
                                   _ -> GuildRole
                               end,
                    SkillRole = skill_prac:upgrade(AttrRole,
                                                   4,
                                                   AddSkillPrac,
                                                   1),
                    TimerRole = calc_element_timer(SkillRole),
                    NewRole = TimerRole,
                    {ok, NewRole};
                _ -> {false, lang:get("您没有需要保存的属性")}
            end;
        _ -> {false, lang:get("你没有公会，无需进行保存祈福")}
    end.

calc_attr(Ac = #attr_calc{}, #role{m_guild = MGuild}) ->
    Now = date:unixtime(),
    case MGuild of
        #m_guild{element_attr = ElementAttr} ->
            case lists:keyfind(1,
                               #guild_element_attr.effect_obj,
                               ElementAttr)
                of
                #guild_element_attr{attr = BaseAttr,
                                    high_attr = HighAttr, end_time = EndTime}
                    when Now < EndTime ->
                    AttrL = BaseAttr ++ HighAttr,
                    logger:debug("增加的属性列表:~w", [AttrL], guild_role, 1061),
                    NewAttrL = attr_type:to_attr(fixed, AttrL),
                    case attr_type:do_attr(NewAttrL, Ac) of
                        {false, Reason} ->
                            logger:error("元素祈福属性计算出错[~w]:[~w]",
                                         [AttrL, Reason],
                                         guild_role,
                                         1066),
                            Ac;
                        {ok, NewAc} -> NewAc
                    end;
                _ -> Ac
            end;
        _ -> Ac
    end.

calc_pet(Ac = #attr_calc{}, #role{m_guild = MGuild}) ->
    Now = date:unixtime(),
    case MGuild of
        #m_guild{element_attr = ElementAttr} ->
            case lists:keyfind(2,
                               #guild_element_attr.effect_obj,
                               ElementAttr)
                of
                #guild_element_attr{attr = BaseAttr,
                                    high_attr = HighAttr, end_time = EndTime}
                    when Now < EndTime ->
                    AttrL = BaseAttr ++ HighAttr,
                    logger:debug("增加的属性列表:~w", [AttrL], guild_role, 1085),
                    NewAttrL = attr_type:to_attr(fixed, AttrL),
                    case attr_type:do_attr(NewAttrL, Ac) of
                        {false, Reason} ->
                            logger:error("元素祈福属性计算出错[~w]:[~w]",
                                         [AttrL, Reason],
                                         guild_role,
                                         1090),
                            Ac;
                        {ok, NewAc} -> NewAc
                    end;
                _ -> Ac
            end;
        _ -> Ac
    end;
calc_pet(Ac, _) -> Ac.

gm_reset_element(Role = #role{m_guild = MGuild}) ->
    case MGuild of
        #m_guild{} ->
            Role#role{m_guild = MGuild#m_guild{element_attr = []}};
        _ -> Role
    end.

calc_element_timer(Role = #role{m_guild = MGuild}) ->
    logger:debug("公会祈福定时检查:", [], guild_role, 1113),
    case MGuild of
        #m_guild{element_attr = ElementAttr} ->
            Now = date:unixtime(),
            Fun = fun (#guild_element_attr{effect_obj = EffectObj,
                                           end_time = EndTime},
                       RtnRole)
                          when Now < EndTime ->
                          TimerId = case EffectObj of
                                        1 -> element_role_end_time;
                                        _ -> element_pet_end_time
                                    end,
                          TimerRole = role_timer:del(TimerId, RtnRole),
                          Timer = #timer{id = TimerId,
                                         timeout = (EndTime - Now) * 1000,
                                         times = 1, m = guild_role,
                                         f = recalc_element_attr,
                                         a = [EffectObj]},
                          role_timer:set(Timer, TimerRole);
                      (_, RtnRole) -> RtnRole
                  end,
            lists:foldl(Fun, Role, ElementAttr);
        _ -> Role
    end.

recalc_element_attr(Role = #role{m_pet =
                                     #m_pet{pets = Pets}},
                    EffectObj) ->
    logger:debug("recalc_element_attr:计时结束，重新计算属性",
                 [],
                 guild_role,
                 1133),
    AttrRole = case EffectObj of
                   1 ->
                       Content =
                           notice:format(lang:get("亲爱的玩家，你的公会祈福效果(角色)~ts（若祈福效果中含有~ts，过期后评分会有小幅度波"
                                                  "动）。你可以前往公会元素祭坛处继续祈福哦"),
                                         [{string_2, 5, lang:get("已过期")},
                                          {string_2, 1, lang:get("冒险技能+1")}]),
                       mail:send(Role, "祈福效果过期提醒", Content),
                       attr:calc_and_push(Role);
                   2 ->
                       Content =
                           notice:format(lang:get("亲爱的玩家，你的公会祈福效果(宠物)~ts（若祈福效果中含有~ts，过期后评分会有小幅度波"
                                                  "动）。你可以前往公会元素祭坛处继续祈福哦"),
                                         [{string_2, 5, lang:get("已过期")},
                                          {string_2, 1, lang:get("冒险技能+1")}]),
                       mail:send(Role, "祈福效果过期提醒", Content),
                       PetRole = pet_attr:batch_calc(Pets, Role),
                       pet_util:push_client_pets(Role),
                       PetRole;
                   _ -> Role
               end,
    push_element_info(AttrRole),
    {ok, AttrRole}.

get_element_cost_pray(_Role, TotalLev, UseType,
                      CostType, Flag) ->
    Ratio = case UseType of
                1 -> 1000;
                2 when Flag =:= true -> 1300;
                _ -> 1000
            end,
    logger:debug("祈福消耗参数:~w", [Ratio], guild_role, 1159),
    case guild_data:get_element_cost(TotalLev) of
        {CoinCost, ContributionCost} ->
            Cost = case CostType of
                       1 -> ContributionCost;
                       2 -> CoinCost
                   end,
            [{Assets, round(Val * Ratio / 1000)}
             || {Assets, Val} <- Cost];
        _ -> false
    end.

lookup_guild_element_pray(GuildId) ->
    case catch ets:lookup_element(guild_list,
                                  GuildId,
                                  #guild.element_info)
        of
        ElementInfo when is_list(ElementInfo) ->
            {ok, ElementInfo};
        _ -> false
    end.

