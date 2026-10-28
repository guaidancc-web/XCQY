-file("src/mod/guild/guild_league_role.erl", 1).

-module(guild_league_role).

-export([login/1,
         logout/1,
         join/1,
         leave/1,
         fight/2,
         attack_unit/2,
         done_attack_unit/1,
         guard_unit/2,
         disturb_unit/1,
         set_trump/3,
         combat_over/1,
         live_record/2,
         check_gain/2,
         check_pick/2,
         pick_gain/2,
         cast_enemy/3,
         guild_combat_cast/2,
         get_side/1,
         guess/2,
         worship_statue/1,
         callback/2,
         callback/4,
         apply_evt/2,
         push/2]).

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

-file("src/mod/guild/guild_league_role.erl", 36).

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

-file("src/mod/guild/guild_league_role.erl", 37).

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

-file("src/mod/guild/guild_league_role.erl", 38).

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

-file("src/mod/guild/guild_league_role.erl", 39).

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

-file("src/mod/guild/guild_league_role.erl", 40).

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

-file("src/mod/guild/guild_league_role.erl", 41).

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

-file("src/mod/guild/guild_league_role.erl", 42).

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

-file("src/mod/guild/guild_league_role.erl", 43).

-file("inc/looks.hrl", 1).

-file("src/mod/guild/guild_league_role.erl", 44).

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

-file("src/mod/guild/guild_league_role.erl", 45).

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

-file("src/mod/guild/guild_league_role.erl", 46).

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

-file("src/mod/guild/guild_league_role.erl", 47).

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

-file("src/mod/guild/guild_league_role.erl", 48).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild_league_role.erl", 49).

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

-file("src/mod/guild/guild_league_role.erl", 50).

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

-file("src/mod/guild/guild_league_role.erl", 51).

-file("inc/agenda.hrl", 1).

-record(m_agenda,
        {ver = 1 :: non_neg_integer(),
         progress = [],
         activity = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer(),
         rewarded = [] :: [non_neg_integer()],
         last_rewarded = 0 :: non_neg_integer(),
         recommends = [] :: list(),
         last_recommended = 0 :: non_neg_integer()}).

-record(agenda_prog,
        {ver = 1,
         id = 0 :: non_neg_integer(),
         joined = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer()}).

-record(agenda_stat,
        {id = 0 :: non_neg_integer(), joined = 0, finised = 0}).

-record(agenda_stat_role,
        {id = {0, "", 0},
         lev = 0,
         date = {0, 0, 0},
         logs = []}).

-record(m_agenda_week,
        {ver = 1,
         id = 0,
         week_activity = 0 :: non_neg_integer(),
         rewards = [],
         last_add_activity_time = 0}).

-file("src/mod/guild/guild_league_role.erl", 52).

-file("inc/guild_league.hrl", 1).

-record(guild_league_role,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         to_war = 0,
         movability = 500 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         side = 1,
         pid :: undefined | reference(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         key = {{0, "", 0}, 0},
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         is_trump = 0,
         operating_unit = 0 :: 0 | tuple(),
         last_operated = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         cannon_attacked = 0 :: non_neg_integer(),
         cannon_used = 0 :: non_neg_integer(),
         guarding_unit = 0 :: non_neg_integer(),
         operating_num = 0 :: non_neg_integer()}).

-record(guild_league_guild,
        {id = {0, "", 0} :: tuple(),
         key = {{0, "", 0}, 0, 0},
         ver = 5,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         match_id = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         phase = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         order = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         strenth = 0 :: non_neg_integer(),
         members = [],
         trumps = [],
         attacked_unit = 0 :: non_neg_integer(),
         consecutive_win = 0 :: non_neg_integer(),
         season_consecutive_win = 0 :: non_neg_integer(),
         avg_lev = 0 :: non_neg_integer(),
         eliminated = 8 :: non_neg_integer()}).

-record(guild_league_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         battle_id = 0 :: non_neg_integer(),
         battle_pid = 0 :: pid(),
         win_side = 0,
         time = 0 :: non_neg_integer(),
         phase = 0,
         season = 0 :: non_neg_integer(),
         combat_time = 0,
         is_judge = false,
         can_join = false,
         cannon_ready = false,
         later_phase = 0 :: non_neg_integer(),
         grade = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer()}).

-record(guild_league_alliance,
        {id = {0, 0} :: {integer(), integer()},
         gids = [] :: list(),
         names = [],
         totems = [] :: list(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         match_id = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         remain_unit = 3 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         subsidize_buff = [] :: list()}).

-record(guild_league_trump,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         pos = 1 :: non_neg_integer()}).

-record(guild_league_unit,
        {id = {0, 0} :: tuple(),
         phase = 0,
         season = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         battle_id = 0 :: non_neg_integer(),
         side = 0,
         duration = 1000 :: non_neg_integer(),
         operators = [] :: list(),
         last_operated = 0 :: non_neg_integer()}).

-record(guild_league_operator,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         side = 0,
         timeout = 0 :: non_neg_integer()}).

-record(guild_league_summary,
        {id = {0, "", 0} :: tuple(),
         ver = 4,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         member_num = 0 :: non_neg_integer(),
         season_win = 0 :: non_neg_integer(),
         season_lost = 0 :: non_neg_integer(),
         season_draw = 0 :: non_neg_integer(),
         total_win = 0 :: non_neg_integer(),
         totem = 0 :: non_neg_integer(),
         season_score = 0 :: non_neg_integer(),
         total_score = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         rank = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         order = 0 :: non_neg_integer(),
         recent_matchs = [] :: list(),
         absence = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         last_result = 0 :: non_neg_integer(),
         strenth = 0 :: non_neg_integer(),
         consecutive_win = 0 :: non_neg_integer(),
         season_consecutive_win = 0 :: non_neg_integer(),
         eliminated = 8 :: non_neg_integer()}).

-record(guild_league_guess,
        {id = {0, "", 0} :: tuple(),
         ver = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(guild_league_guess_choice,
        {gid = {0, "", 0} :: tuple(),
         phase = 0 :: non_neg_integer(),
         bingo = 0 :: 0..2}).

-record(guild_league_poll,
        {gid = {0, "", 0} :: tuple(),
         phase = 0 :: non_neg_integer(),
         voted = 0 :: non_neg_integer()}).

-record(guild_league_live,
        {id = 0 :: non_neg_integer(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         grade = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         names1 = [] :: string(),
         names2 = [] :: string(),
         logs = [] :: list()}).

-record(guild_league_champion,
        {season = 0 :: non_neg_integer(), top3 = []}).

-file("src/mod/guild/guild_league_role.erl", 53).

login(Role = #role{s_event = Event, id = _Id,
                   pos = Pos = #pos{map_base_id = MapBaseId}})
    when Event =:= 32 orelse Event =:= 33 ->
    {_, Role1} = role_trigger:add([#trigger{label =
                                                evt_activity,
                                            a = [], m = guild_league_role,
                                            f = apply_evt}],
                                  Role),
    case MapBaseId =:= 52002 orelse MapBaseId =:= 52001 of
        true ->
            {LMapId, Lx, Ly} = util:rand_list([{10001, 306, 3507},
                                               {10001, 2583, 3848},
                                               {10001, 4957, 3680},
                                               {10001, 445, 2565},
                                               {10001, 4646, 704},
                                               {10001, 841, 1033},
                                               {10001, 2098, 1834},
                                               {10001, 3617, 1816}]),
            NewPos = Pos#pos{map = LMapId, x = Lx, y = Ly},
            {ok, Role1#role{pos = NewPos, s_event = 0}};
        _ -> {ok, Role1#role{s_event = 0}}
    end;
login(Role) ->
    {_, Role1} = role_trigger:add([#trigger{label =
                                                evt_activity,
                                            a = [], m = guild_league_role,
                                            f = apply_evt}],
                                  Role),
    {ok, Role1}.

logout(#role{s_event = Event, id = Id,
             s_event_pid = Pid})
    when Event =:= 32 orelse Event =:= 33 ->
    big_world:cast(guild_league_match, logout, [Pid, Id]),
    ok;
logout(_) -> ok.

join(#role{cross_type = 1}) ->
    {false, lang:get("跨服状态不能参与")};
join(#role{s_event = 32}) ->
    {false, lang:get("已经在活动中")};
join(#role{m_team = #m_team{pid = Pid, status = 2}})
    when is_pid(Pid) ->
    {false, lang:get("你跟随队伍中")};
join(Role) ->
    case check_join([lev, world_lev, event, guild, misc],
                    Role,
                    #{time => date:unixtime()})
        of
        {ok, Args} -> do_join(Role, Args);
        Else -> Else
    end.

leave(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("在队伍中，请先退出队伍")};
leave(Role = #role{s_event = Event, id = Id,
                   name = Name, s_event_pid = MatchPid})
    when Event =:= 32 orelse Event =:= 33 ->
    big_world:cast(guild_league_match,
                   leave,
                   [MatchPid, Id]),
    PreRole1 = looks:del([64, 69], Role),
    PreRole = looks:add({64, 0, 0, ""}, PreRole1, replace),
    Role1 = looks:calc(PreRole#role{s_event = 0,
                                    s_event_pid = undefined}),
    ToPos = util:rand_list([{10001, 306, 3507},
                            {10001, 2583, 3848},
                            {10001, 4957, 3680},
                            {10001, 445, 2565},
                            {10001, 4646, 704},
                            {10001, 841, 1033},
                            {10001, 2098, 1834},
                            {10001, 3617, 1816}]),
    case map:role_enter(ToPos, guild_league, Role1) of
        {error, Reason} ->
            logger:error("[~ts]进入冠军联赛场失败:~w",
                         [Name, Reason],
                         guild_league_role,
                         126),
            {false, lang:get("进入冠军联赛场失败")};
        {ok, NewRole} -> {ok, NewRole}
    end;
leave(_) -> {false, lang:get("不在冠军联赛中")}.

fight(#role{m_team = #m_team{pid = Pid, status = 2}},
      _TargetId)
    when is_pid(Pid) ->
    {false, lang:get("跟随队伍中，不能操作")};
fight(Role = #role{s_event = 32, id = Id}, TargetId) ->
    case big_world:call(guild_league_match,
                        check_fight,
                        [Id, TargetId])
        of
        {ok, Args} -> combat_check(Role, TargetId, Args);
        Else -> Else
    end;
fight(_, _) -> {false, lang:get("不在冠军联赛中")}.

attack_unit(#role{m_combat = #m_combat{pid = Pid}}, _)
    when is_pid(Pid) ->
    {false, lang:get("战斗中，不能操作")};
attack_unit(#role{m_team =
                      #m_team{pid = Pid, status = 2}},
            _TargetId)
    when is_pid(Pid) ->
    {false, lang:get("跟随队伍中，不能操作")};
attack_unit(Role = #role{s_event = 32, id = Id,
                         s_event_pid = MatchPid},
            UnitId = {_, Uid}) ->
    case team:get_fighters(Role) of
        {ok, AtkList} when length(AtkList) >= 3 ->
            MateIds = [MateId
                       || #team_mate{id = MateId} <- AtkList],
            case big_world:call(guild_league_match,
                                attack_unit,
                                [[Id | MateIds], UnitId, MatchPid])
                of
                {ok,
                 #guild_league_operator{id = TargetId, side = DfdSide},
                 MatchId,
                 Args}
                    when Uid =:= 7 ->
                    combat_check(Role,
                                 TargetId,
                                 Args#{atk_side =>
                                           guild_league_guild:get_opposite_side(DfdSide),
                                       dfd_side => DfdSide, match_id => MatchId,
                                       match_pid => MatchPid,
                                       is_attacking_unit => false});
                {ok,
                 #guild_league_operator{id = TargetId, side = DfdSide},
                 MatchId,
                 Args} ->
                    combat_check(Role,
                                 TargetId,
                                 Args#{atk_side =>
                                           guild_league_guild:get_opposite_side(DfdSide),
                                       dfd_side => DfdSide, match_id => MatchId,
                                       match_pid => MatchPid,
                                       is_attacking_unit => true});
                ok ->
                    Timer = #timer{id = guild_league_attack_unit,
                                   timeout = 20 * 1000, times = 1,
                                   m = guild_league_role, f = callback,
                                   a = [done_attack_unit]},
                    {ok, role_timer:set(Timer, Role)};
                Else -> Else
            end;
        _ ->
            {false,
             notice:format(lang:get("需要组队人数≥~ts人才能操作哦"),
                           [{string_2, 5, 3}])}
    end;
attack_unit(_, _) -> {false, lang:get("不在冠军联赛中")}.

guard_unit(#role{m_combat = #m_combat{pid = Pid}}, _)
    when is_pid(Pid) ->
    {false, lang:get("战斗中，不能操作")};
guard_unit(#role{m_team =
                     #m_team{pid = Pid, status = 2}},
           _TargetId)
    when is_pid(Pid) ->
    {false, lang:get("跟随队伍中，不能操作")};
guard_unit(#role{s_event = 33}, _UnitId) ->
    {false, lang:get("比赛尚未开始，无需守塔")};
guard_unit(Role = #role{s_event = 32, id = Id,
                        s_event_pid = MatchPid},
           UnitId) ->
    case big_world:call(guild_league_match,
                        guard_unit,
                        [Id, UnitId, MatchPid])
        of
        {ok,
         #guild_league_operator{id = TargetId, side = DfdSide},
         MatchId,
         Args} ->
            combat_check(Role,
                         TargetId,
                         Args#{atk_side =>
                                   guild_league_guild:get_opposite_side(DfdSide),
                               dfd_side => DfdSide, match_id => MatchId,
                               match_pid => MatchPid,
                               is_guarding_unit => true});
        ok ->
            {ok,
             notice:format(lang:get("成功进入~ts，若有敌方攻塔将直接开始战斗"),
                           [{string_2, 5, lang:get("守塔状态")}])};
        Else -> Else
    end;
guard_unit(_, _) -> {false, lang:get("不在冠军联赛中")}.

done_attack_unit(#role{m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("战斗中，不能操作")};
done_attack_unit(#role{m_team =
                           #m_team{pid = Pid, status = 2}})
    when is_pid(Pid) ->
    {false, lang:get("跟随队伍中，不能操作")};
done_attack_unit(#role{s_event = 32, id = Id,
                       s_event_pid = MatchPid}) ->
    big_world:call(guild_league_match,
                   done_attack_unit,
                   [Id, MatchPid]);
done_attack_unit(_) -> {false, lang:get("不在冠军联赛中")}.

disturb_unit(#role{m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("战斗中，不能操作")};
disturb_unit(#role{m_team =
                       #m_team{pid = Pid, status = 2}})
    when is_pid(Pid) ->
    {false, lang:get("跟随队伍中，不能操作")};
disturb_unit(Role = #role{s_event = 32, id = Id,
                          s_event_pid = MatchPid}) ->
    MateIds = [MateId
               || #team_mate{id = MateId, status = 2}
                      <- team:get_members(Role)],
    big_world:cast(guild_league_match,
                   disturb_unit,
                   [[Id | MateIds], MatchPid]),
    ok;
disturb_unit(_) -> {false, lang:get("不在冠军联赛中")}.

set_trump(_, _Id, Pos) when Pos < 1 orelse Pos > 3 ->
    {false, lang:get("无效的队伍安排")};
set_trump(Role = #role{m_guild = #m_guild{post = Post}},
          Id, Pos)
    when Post >= 40 ->
    Now = date:unixtime(),
    case guild_role:get(Role, Id) of
        #guild_role{name = Name, lev = Lev} when Lev < 70 ->
            {false,
             notice:format(lang:get("~ts等级不足~ts级，不能被任命为领队"),
                           [{role_2, Name}, {string_2, 5, 70}])};
        #guild_role{name = Name, enter_time = Entered}
            when Now - Entered < 86400 * 8 ->
            {false,
             notice:format(lang:get("~ts入会不足~ts天，不能被任命为领队"),
                           [{role_2, Name},
                            {string_2, 5, 86400 * 8 div 86400}])};
        R = #guild_role{} -> do_set_trump(Role, Pos, R);
        _ -> {false, lang:get("找不到指定成员")}
    end;
set_trump(_, _, _) ->
    {false, lang:get("只有会长、副会长和长老可以安排队伍")}.

combat_over(#combat{winner = Winner, loser = Loser,
                    start_args =
                        #combat_start_args{common_referee = MatchPid}}) ->
    WinnerF = [#{id => Rid, is_leader => IsLeader,
                 pid => Pid, name => Name}
               || #fighter{origin_id = Rid, is_leader = IsLeader,
                           pid = Pid, name = Name, type = 1}
                      <- Winner],
    LoserF = [#{id => Rid, is_leader => IsLeader,
                pid => Pid, name => Name}
              || #fighter{origin_id = Rid, is_leader = IsLeader,
                          pid = Pid, name = Name, type = 1}
                     <- Loser],
    combat_cast(WinnerF, LoserF),
    big_world:cast(guild_league_match,
                   combat_over,
                   [MatchPid, WinnerF, LoserF]).

check_gain(Role = #role{id = Id, lev = Lev,
                        name = Name},
           WinOrLost) ->
    Gain1 = case levup_data:get_exp({3300, Lev}) of
                #{exp := Exp} ->
                    G1 = [{90010, Exp}],
                    case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case levup_data:get_exp({3300, PetLev}) of
                                #{pet_exp := PetExp} -> [{90005, PetExp} | G1];
                                _ -> G1
                            end;
                        _ -> G1
                    end;
                _R ->
                    logger:debug("找不到经验模型 ~w ~w",
                                 [Lev, _R],
                                 guild_league_role,
                                 250),
                    []
            end,
    WarRole = ets:lookup(guild_league_role, Id),
    Gain2 = case WarRole of
                [#guild_league_role{win = Win, lost = Lost}]
                    when Lost + Win > 3 ->
                    [{90011, 5} | [{Type, round(Val * 2.0e-1)}
                                   || {Type, Val} <- Gain1]];
                _ ->
                    [{90020, 5} | [{Type,
                                    round(Val * 5.99999999999999977796e-1)}
                                   || {Type, Val} <- Gain1]]
            end,
    Gain3 = case WarRole of
                [#guild_league_role{win = Win1, lost = Lost1}]
                    when Lost1 + Win1 < 6 ->
                    case util:rand(1, 100) =< 30 of
                        true ->
                            ResType = case WinOrLost of
                                          win -> 1;
                                          _ -> 2
                                      end,
                            case guild_league_data:get_combat_reward(ResType) of
                                L = [_ | _] ->
                                    case util:rand_list(L, item_weight) of
                                        #{item_id := ItemId,
                                          item_num := ItemNum,
                                          announce := Announce} ->
                                            ItemId0 =
                                                item_type:special_id(ItemId),
                                            case Announce of
                                                1 ->
                                                    AnStr = case WinOrLost of
                                                                win ->
                                                                    notice:format(lang:get("~ts在冠军联赛中高歌猛进，淘汰对手之后竟在地上发现一件~ts{face_1, "
                                                                                           "20}"),
                                                                                  [{role_2,
                                                                                    Name},
                                                                                   {item_2,
                                                                                    ItemId0,
                                                                                    ItemNum}]);
                                                                _ ->
                                                                    notice:format(lang:get("~ts在冠军联赛中被冲散，寻找队友的过程中竟发现了一件~ts{face_1, "
                                                                                           "29}"),
                                                                                  [{role_2,
                                                                                    Name},
                                                                                   {item_2,
                                                                                    ItemId0,
                                                                                    ItemNum}])
                                                            end,
                                                    notice:cast(all, 5, AnStr);
                                                _ -> ok
                                            end,
                                            [{ItemId0, 0, ItemNum} | Gain2];
                                        _ -> Gain2
                                    end;
                                _ -> Gain2
                            end;
                        _ -> Gain2
                    end;
                _ -> Gain2
            end,
    logger:debug("奖励 ~w", [Gain3], guild_league_role, 293),
    Gain4 = format:val_to_gain(Gain3),
    NRole = case role_gain:do_notice(Gain4, Role) of
                {ok, Role1} -> Role1;
                _ -> Role
            end,
    {NRole, []}.

check_pick(#role{id = _Id, name = Name},
           PickArgs = #{base_id := BaseId}) ->
    Gain = case guild_league_data:get_box_reward(BaseId) of
               L = [_ | _] ->
                   case util:rand_list(L, item_weight) of
                       #{item_id := ItemId, item_num := ItemNum,
                         announce := Announce} ->
                           ItemId0 = item_type:special_id(ItemId),
                           case Announce of
                               1 ->
                                   AnStr =
                                       notice:format(lang:get("~ts以胜利者的姿态打开了冠军联赛~ts，高高兴兴把~ts捧回家！{face_1, "
                                                              "10}"),
                                                     [{role_2, Name},
                                                      {string_2,
                                                       5,
                                                       lang:get("胜利宝箱")},
                                                      {item_2,
                                                       ItemId0,
                                                       ItemNum}]),
                                   notice:cast(all, 5, AnStr);
                               _ -> ok
                           end,
                           [{ItemId0, 0, ItemNum}];
                       _ -> []
                   end;
               _ -> []
           end,
    {true, PickArgs#{gain => Gain}};
check_pick(_, _PickArgs) -> {false, lang:get("不在公会中")}.

pick_gain(Role = #role{pid = _Pid}, Gain) ->
    Gain1 = format:val_to_gain(Gain),
    case role_gain:do_notice(Gain1, Role) of
        {ok, Role1} ->
            Role2 = case team:sync_away(Role1) of
                        {ok, ARole = #role{}} -> ARole;
                        _ -> Role1
                    end,
            async_leave(Role2, "", false);
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("冠军联赛奖励"),
            Content = lang:get("背包已满，奖励通过邮件发送，请查收。"),
            mail:send(Role,
                      #{title => Title, content => Content, items => Gain}),
            async_leave(Role, "", false);
        {false, #gain{msg = Msg}} ->
            notice:return(Msg),
            ok;
        _R ->
            logger:debug("未知返回 ~w", [_R], guild_league_role, 343),
            ok
    end.

cast_enemy(AtkList, DfdList, ExtArgs) ->
    #fighter{name = AName, origin_id = AtkId} =
        lists:keyfind(1, #fighter.is_leader, AtkList),
    #fighter{name = DName, origin_id = DfdId} =
        lists:keyfind(1, #fighter.is_leader, DfdList),
    Msg2 = notice:format(lang:get("你遭遇了~ts的队伍！"),
                         [{role_2, AName}]),
    DIds = encounter_notice(DfdList, Msg2),
    DNum = erlang:length(DIds),
    case lists:keyfind(match_pid, 1, ExtArgs) of
        {_, operating, MatchPid} ->
            logger:debug("取消攻塔", [], guild_league_role, 356),
            Msg = notice:format(lang:get("~ts带领的队伍正在攻塔，准备防守反击！"),
                                [{role_2, DName}]),
            Ids = encounter_notice(AtkList, Msg),
            ANum = erlang:length(Ids),
            live_log(#{match_pid => MatchPid, atk_id => AtkId,
                       dfd_id => DfdId, atk_num => ANum, dfd_num => DNum,
                       atk_name => AName, dfd_name => DName, type => guarding,
                       ext_args => ExtArgs}),
            big_world:cast(guild_league_match,
                           disturb_unit,
                           [Ids, MatchPid]);
        {_, attacking, MatchPid} ->
            logger:debug("取消攻塔", [], guild_league_role, 363),
            Msg = notice:format(lang:get("向~ts带领的守塔队伍发起攻击！"),
                                [{role_2, DName}]),
            Ids = encounter_notice(AtkList, Msg),
            ANum = erlang:length(Ids),
            live_log(#{match_pid => MatchPid, atk_id => AtkId,
                       dfd_id => DfdId, atk_num => ANum, dfd_num => DNum,
                       atk_name => AName, dfd_name => DName, type => attacking,
                       ext_args => ExtArgs}),
            big_world:cast(guild_league_match,
                           stop_guarding,
                           [MatchPid, Ids]);
        {_, MatchPid} ->
            Msg = notice:format(lang:get("向~ts带领的队伍主动发起攻击！"),
                                [{role_2, DName}]),
            Ids = encounter_notice(AtkList, Msg),
            ANum = erlang:length(Ids),
            live_log(#{match_pid => MatchPid, atk_id => AtkId,
                       dfd_id => DfdId, atk_num => ANum, dfd_num => DNum,
                       atk_name => AName, dfd_name => DName, type => fighting,
                       ext_args => ExtArgs}),
            Msg3 = notice:format(lang:get("消耗行动力~ts"),
                                 [{string_2, 1, 70}]),
            encounter_notice(AtkList, Msg3),
            big_world:cast(guild_league_match,
                           combat_start,
                           [MatchPid, Ids]),
            big_world:cast(guild_league_match,
                           stop_guarding,
                           [MatchPid, DIds]);
        _ -> ok
    end.

live_record(#combat_record{id = RecId,
                           combat_type = 108, atk_name = AName,
                           dfd_name = DName, fighters = Fighters},
            #combat_start_args{ext_args = ExtArgs}) ->
    AtkList = [F
               || F = #combat_record_fighter{group = 0} <- Fighters],
    DfdList = [F
               || F = #combat_record_fighter{group = 1} <- Fighters],
    ANum = erlang:length(AtkList),
    DNum = erlang:length(DfdList),
    case {lists:keyfind(AName,
                        #combat_record_fighter.name,
                        AtkList),
          lists:keyfind(DName,
                        #combat_record_fighter.name,
                        DfdList),
          lists:keyfind(match_pid, 1, ExtArgs)}
        of
        {#combat_record_fighter{id = AtkId},
         #combat_record_fighter{id = DfdId},
         {_, operating, MatchPid}} ->
            live_log(#{match_pid => MatchPid, atk_id => AtkId,
                       dfd_id => DfdId, atk_num => ANum, dfd_num => DNum,
                       atk_name => AName, dfd_name => DName, type => guarding,
                       ext_args => ExtArgs, rec_id => RecId});
        {#combat_record_fighter{id = AtkId},
         #combat_record_fighter{id = DfdId},
         {_, attacking, MatchPid}} ->
            live_log(#{match_pid => MatchPid, atk_id => AtkId,
                       dfd_id => DfdId, atk_num => ANum, dfd_num => DNum,
                       atk_name => AName, dfd_name => DName, type => attacking,
                       ext_args => ExtArgs, rec_id => RecId});
        {#combat_record_fighter{id = AtkId},
         #combat_record_fighter{id = DfdId},
         {_, MatchPid}} ->
            live_log(#{match_pid => MatchPid, atk_id => AtkId,
                       dfd_id => DfdId, atk_num => ANum, dfd_num => DNum,
                       atk_name => AName, dfd_name => DName, type => fighting,
                       ext_args => ExtArgs, rec_id => RecId});
        _ -> ok
    end;
live_record(_, _) -> ok.

guild_combat_cast(Oid, Msg) ->
    case guild_role:find_role(Oid) of
        {ok, Gid} -> guild:notice(Gid, Msg);
        _ ->
            logger:error("~w找不到参赛公会", [Oid], guild_league_role, 404)
    end.

get_side(#role{id = RoleId, s_event = 32}) ->
    get_side(RoleId);
get_side({Rid, Plat, Zone}) ->
    case ets:lookup(guild_league_role, {Rid, Plat, Zone}) of
        [#guild_league_role{match_id = MatchId, side = Side}] ->
            {true, MatchId, Side};
        _ -> {false, lang:get("未查询到对方冠军联赛参战信息")}
    end;
get_side(_) -> {false, lang:get("未查询到对方冠军联赛参战信息")}.

guess(Role = #role{id = Id, lev = Lev, sex = Sex,
                   classes = Classes, name = Name, m_guild = #m_guild{}},
      Gids) ->
    Loss = format:val_to_loss([{21704, 1}]),
    case role_gain:do_notice(Loss, Role) of
        {ok, Role1} ->
            case guild_league_agent:guess(#{id => Id, lev => Lev,
                                            sex => Sex, classes => Classes,
                                            name => Name, gids => Gids})
                of
                ok ->
                    push(Role1, 17625),
                    {ok, Role1};
                Else -> Else
            end;
        {false, #loss{msg = Msg}} -> {false, Msg}
    end;
guess(_, _) -> {false, lang:get("不在公会中不能竞猜")}.

worship_statue(#role{lev = Lev}) when Lev < 30 ->
    {false,
     notice:format(lang:get("等级~ts级以上才可以膜拜奖杯哦"),
                   [{string_2, 5, 30}])};
worship_statue(Role = #role{m_guild =
                                #m_guild{id = Gid, enter_time = Entered},
                            lev = Lev, name = Name}) ->
    Now = date:unixtime(),
    case env:get(guild_league_champion) of
        _ when Now - Entered < 86400 * 7 ->
            {false,
             notice:format(lang:get("入会不足~ts天，不能膜拜"),
                           [{string_2, 5, 86400 * 7 div 86400}])};
        Gid ->
            case var:get_var(Role, day, 86, 0) of
                0 ->
                    Role1 = var:acc_var(Role, day, 86),
                    Gain1 = case levup_data:get_exp({3351, Lev}) of
                                #{exp := Exp, coin := Coin} ->
                                    G1 = [{90010, Exp}, {90000, Coin}],
                                    case pet:get_war_pet(Role) of
                                        {ok, #pet{lev = PetLev}} ->
                                            case levup_data:get_exp({3351,
                                                                     PetLev})
                                                of
                                                #{pet_exp := PetExp} ->
                                                    [{90005, PetExp} | G1];
                                                _ -> G1
                                            end;
                                        _ -> G1
                                    end;
                                _R ->
                                    logger:debug("找不到经验模型 ~w ~w",
                                                 [Lev, _R],
                                                 guild_league_role,
                                                 459),
                                    []
                            end,
                    Gain2 = case
                                util:rand_list(guild_league_data:get_worship_reward(),
                                               item_weight)
                                of
                                #{item_id := 0} -> Gain1;
                                #{item_id := ItemId0, item_num := Num,
                                  announce := Announce} ->
                                    ItemId = item_type:special_id(ItemId0),
                                    case Announce of
                                        1 ->
                                            AnStr =
                                                notice:format(lang:get("~ts怀着万分敬意摸了下冠军联赛奖杯，手上居然多了一个~ts{face_1,21}"),
                                                              [{role_2, Name},
                                                               {item_2,
                                                                ItemId}]),
                                            notice:cast(all, 5, AnStr);
                                        _ -> ok
                                    end,
                                    [{ItemId, 0, Num} | Gain1];
                                _ -> Gain1
                            end,
                    Gain3 = format:val_to_gain(Gain2),
                    Prefix = lang:get("你膜拜了冠军奖杯，获得奖杯的祝福"),
                    case role_gain:do_notice(Gain3, Role1, Prefix) of
                        {ok, NRole} ->
                            push(NRole, 17631),
                            {ok, NRole};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("今天已经膜拜过了")}
            end;
        _ -> {false, lang:get("只有冠军公会才能膜拜")}
    end;
worship_statue(_) -> {false, lang:get("不在公会中不能膜拜")}.

callback(Role = #role{s_event = Event}, leave)
    when Event =:= 32 orelse Event =:= 33 ->
    Role2 = case team:sync_away(Role) of
                {ok, ARole = #role{}} -> ARole;
                _ -> Role
            end,
    async_leave(Role2, lang:get("冠军联赛活动结束了"), false);
callback(_, leave) -> ok;
callback(Role = #role{s_event = Event,
                      s_event_pid = Pid, id = Id},
         team_mark_trump)
    when Event =:= 32 orelse Event =:= 33 ->
    big_world:cast(guild_league_match,
                   mark_trump,
                   [Pid, Id]),
    team:async_teammate(Role,
                        {guild_league_role, callback, [mark_trump]}),
    Msg =
        notice:format(lang:get("你是~ts成员本次比赛中拥有~ts，为公会荣耀而战吧{face_1,18}"),
                      [{string_2, 5, lang:get("王牌队")},
                       {string_2, 5, lang:get("双倍行动力")}]),
    notice:pop(Role, 2, Msg),
    Msg2 =
        notice:format(lang:get("本队为~ts, 将拥有~ts，为公会荣耀而战吧{face_1,18}"),
                      [{string_2, 5, lang:get("王牌队")},
                       {string_2, 5, lang:get("双倍行动力")}]),
    team:notice(Role, Msg2),
    Look2 = {69, 0, 1, ""},
    NRole = looks:add(Look2, Role, replace),
    map:role_update(NRole),
    {ok, NRole};
callback(_, team_mark_trump) -> ok;
callback(Role = #role{s_event = Event,
                      s_event_pid = Pid, id = Id},
         mark_trump)
    when Event =:= 32 orelse Event =:= 33 ->
    big_world:cast(guild_league_match,
                   mark_trump,
                   [Pid, Id]),
    Msg =
        notice:format(lang:get("~ts成员本次比赛中拥有~ts，为公会荣耀而战吧{face_1,18}"),
                      [{string_2, 5, lang:get("王牌队")},
                       {string_2, 5, lang:get("双倍行动力")}]),
    notice:pop(Role, 2, Msg),
    Look2 = {69, 0, 1, ""},
    NRole = looks:add(Look2, Role, replace),
    map:role_update(NRole),
    {ok, NRole};
callback(_, mark_trump) -> ok;
callback(Role = #role{s_event = Event},
         {notice, Type, Msg})
    when Event =:= 32 orelse Event =:= 33 ->
    notice:send(Role, Type, Msg),
    ok;
callback(_, {notice, _, _}) -> ok;
callback(Role, leave_by_movability) ->
    NRole = do_reward_role(Role, 2),
    push(NRole, 17605),
    set_delay_out(NRole, lang:get("行动力耗尽"), async_leave);
callback(Role = #role{s_event = Event}, {reward, lost})
    when Event =:= 33 orelse Event =:= 32 ->
    NRole = do_reward_role(Role, 2),
    push(NRole, 17605),
    set_delay_out(NRole, lang:get("活动结束"), async_leave);
callback(Role = #role{s_event = Event}, {reward, win})
    when Event =:= 33 orelse Event =:= 32 ->
    Msg =
        notice:format(lang:get("恭喜获得冠军联赛胜利！请等待~ts，拾取属于~ts的奖励"),
                      [{string_2, 5, lang:get("一分钟")},
                       {string_2, 5, lang:get("胜利者")}]),
    notice:pop(Role, 2, Msg),
    Msg2 = lang:get("比赛胜利！你的勇气为公会赢得了无上荣耀。{sound_1, 571} "),
    notice:send(Role, 11, Msg2),
    NRole = do_reward_role(Role, 1),
    push(NRole, 17605),
    push(NRole, 17601),
    push(NRole, 17609),
    {ok, NRole};
callback(Role = #role{s_event = 32, lev = Lev},
         {reward_destroy, BaseId}) ->
    Msg = notice:format(lang:get("击毁敌方~ts"),
                        [{unit_1, BaseId}]),
    Gain1 = case levup_data:get_exp({3300, Lev}) of
                #{exp := Exp} ->
                    G1 = [{90010, Exp}],
                    case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case levup_data:get_exp({3300, PetLev}) of
                                #{pet_exp := PetExp} -> [{90005, PetExp} | G1];
                                _ -> G1
                            end;
                        _ -> G1
                    end;
                _R ->
                    logger:debug("找不到经验模型 ~w ~w",
                                 [Lev, _R],
                                 guild_league_role,
                                 571),
                    []
            end,
    Gain2 = case
                util:rand_list(guild_league_data:get_unit_reward(),
                               item_weight)
                of
                #{item_id := ItemId0, item_num := Num} ->
                    ItemId = item_type:special_id(ItemId0),
                    [{ItemId, 0, Num}, {90020, 3} | [{Type,
                                                      round(Val *
                                                                5.99999999999999977796e-1)}
                                                     || {Type, Val} <- Gain1]];
                _ ->
                    [{90020, 3} | [{Type,
                                    round(Val * 5.99999999999999977796e-1)}
                                   || {Type, Val} <- Gain1]]
            end,
    Gain3 = format:val_to_gain(Gain2),
    case role_gain:do_notice(Gain3, Role, Msg) of
        {ok, NRole} -> {ok, NRole};
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("冠军联赛奖励"),
            Content =
                notice:format(lang:get("背包已满，~ts奖励通过邮件发送，请查收。"),
                              [{string_1, Msg}]),
            mail:send(Role,
                      #{title => Title, content => Content, items => Gain2}),
            ok;
        _ -> ok
    end;
callback(Role = #role{s_event = 32, lev = Lev, id = Rid,
                      s_event_pid = MatchPid},
         {reward_attack_unit,
          #{operating_unit := Uid, base_id := BaseId,
            unit_dmg := UDmg}}) ->
    Msg = notice:format(lang:get("成功攻击敌方~ts"),
                        [{unit_1, BaseId}]),
    Gain1 = case levup_data:get_exp({3300, Lev}) of
                #{exp := Exp} ->
                    G1 = [{90010, Exp}],
                    case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case levup_data:get_exp({3300, PetLev}) of
                                #{pet_exp := PetExp} -> [{90005, PetExp} | G1];
                                _ -> G1
                            end;
                        _ -> G1
                    end;
                _R ->
                    logger:debug("找不到经验模型 ~w ~w",
                                 [Lev, _R],
                                 guild_league_role,
                                 608),
                    []
            end,
    Gain2 = case
                util:rand_list(guild_league_data:get_unit_reward(),
                               item_weight)
                of
                #{item_id := ItemId0, item_num := Num} ->
                    ItemId = item_type:special_id(ItemId0),
                    [{ItemId, 0, Num}, {90011, 5} | [{Type,
                                                      round(Val * 2.0e-1)}
                                                     || {Type, Val} <- Gain1]];
                _ ->
                    [{90011, 5} | [{Type, round(Val * 2.0e-1)}
                                   || {Type, Val} <- Gain1]]
            end,
    Gain3 = format:val_to_gain(Gain2),
    case team:get_status(Role) of
        {true, 1} -> ok;
        false -> ok;
        _ ->
            CostMovability = case Uid of
                                 7 -> 50;
                                 _ -> 30
                             end,
            UnitWear = UDmg,
            big_world:cast(guild_league_match,
                           cost_movability,
                           [MatchPid, Rid, CostMovability]),
            Msg2 = case Uid of
                       7 ->
                           notice:format(lang:get("开炮成功，敌方~ts-~ts耐久，消耗~ts点行动力"),
                                         [{unit_1, BaseId},
                                          {string_2, 1, UnitWear},
                                          {string_2, 1, CostMovability}]);
                       _ ->
                           notice:format(lang:get("进攻成功，敌方~ts-~ts耐久，消耗~ts点行动力"),
                                         [{unit_1, BaseId},
                                          {string_2, 1, UnitWear},
                                          {string_2, 1, CostMovability}])
                   end,
            notice:send(Role, 3, Msg2)
    end,
    Role1 = case Uid of
                7 ->
                    role_trigger:fire(#evt_guild_league_cannon{}, Role);
                _ -> Role
            end,
    case role_gain:do_notice(Gain3, Role1) of
        {ok, NRole} -> {ok, NRole};
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("冠军联赛奖励"),
            Content =
                notice:format(lang:get("背包已满，~ts奖励通过邮件发送，请查收。"),
                              [{string_1, Msg}]),
            mail:send(Role,
                      #{title => Title, content => Content, items => Gain2}),
            {ok, Role1};
        _ -> ok
    end;
callback(Role = #role{s_event = 32},
         {team_unit_reward, Args}) ->
    case team:get_status(Role) of
        {true, 1} ->
            team:leader_async(Role,
                              {guild_league_role,
                               callback,
                               [{reward_attack_unit, Args}]});
        _ -> ok
    end,
    callback(Role, {reward_attack_unit, Args});
callback(Role = #role{s_event = 32},
         {team_push, Cmd}) ->
    push(Role, Cmd),
    case team:get_status(Role) of
        {true, 1} ->
            team:leader_async(Role,
                              {guild_league_role, callback, [{push, Cmd}]});
        _ -> ok
    end,
    ok;
callback(Role = #role{s_event = 33, id = Id,
                      s_event_pid = MatchPid, name = _Name},
         to_war) ->
    big_world:cast(guild_league_match,
                   follow_to_war,
                   [MatchPid, Id]),
    Role1 = role_trigger:fire(#evt_guild_league_join{},
                              Role#role{s_event = 32}),
    guild_role:update(Role1, doing),
    push(Role1, 10102),
    map:role_update(Role1),
    logger:debug("进入开战 ~ts",
                 [_Name],
                 guild_league_role,
                 680),
    {ok, Role1};
callback(#role{}, to_war) -> ok;
callback(Role = #role{s_event = 33, name = _Name},
         ready) ->
    logger:debug("~ts 设定进入倒计时",
                 [_Name],
                 guild_league_role,
                 686),
    Timer = #timer{id = guild_league_to_war,
                   timeout = 120 * 1000, times = 1, m = guild_league_role,
                   f = callback, a = [to_war]},
    {ok, role_timer:set(Timer, Role)};
callback(#role{}, ready) -> ok;
callback(Role, {lost, 0, _}) ->
    NRole = Role,
    push(NRole, 17605),
    set_delay_out(NRole, lang:get("行动力耗尽"), reward_leave);
callback(Role = #role{pos = #pos{map_base_id = 52001}},
         {lost, _, CostMovability}) ->
    push(Role, 17605),
    Role1 = case team:away(Role) of
                {ok, ARole} -> ARole;
                _ -> Role
            end,
    Notice1 = case team:get_status(Role) of
                  {true, _} -> lang:get("战斗失败，队员被冲散在战场四周！");
                  _ -> lang:get("战斗失败")
              end,
    notice:send(Role, 3, Notice1),
    Notice2 = notice:format(lang:get("扣除行动力~ts"),
                            [{string_2, 1, CostMovability}]),
    notice:send(Role, 3, Notice2),
    Timer = #timer{id = guild_league_split, timeout = 1000,
                   times = 1, m = guild_league_role, f = callback,
                   a = [split]},
    {ok, role_timer:set(Timer, Role1)};
callback(Role, {push, Cmd}) ->
    push(Role, Cmd),
    ok;
callback(Role = #role{s_event = 32, id = Id},
         {unit_action, Status}) ->
    map:async_apply(Role,
                    {guild_league_role,
                     callback,
                     [{push, {17618, {Id, Status}}}]}),
    ok;
callback(_, {unit_action, _}) -> ok;
callback(Role = #role{s_event = 32},
         done_attack_unit) ->
    case done_attack_unit(Role) of
        {ok, UnitId} -> push(Role, {17612, {1, "", UnitId}});
        _ -> push(Role, {17612, {0, "", 0}})
    end,
    ok;
callback(_, done_attack_unit) -> ok;
callback(Role = #role{s_event = 32,
                      m_combat = #m_combat{pid = CombatPid}},
         stop_fighting)
    when is_pid(CombatPid) ->
    case team:get_status(Role) of
        {true, 2} -> ok;
        _ ->
            CombatPid ! stop,
            ok
    end;
callback(_, stop_fighting) -> ok;
callback(Role = #role{s_event = Event}, async_leave)
    when Event =:= 33 orelse Event =:= 32 ->
    push(Role, 17601),
    push(Role, 17609),
    async_leave(Role, "");
callback(Role = #role{s_event = Event}, reward_leave)
    when Event =:= 33 orelse Event =:= 32 ->
    Role1 = do_reward_role(Role, 2),
    push(Role1, 17601),
    async_leave(Role1, "");
callback(Role = #role{s_event = Event, id = Id}, split)
    when Event =:= 33 orelse Event =:= 32 ->
    {X, Y} = case ets:lookup(guild_league_role, Id) of
                 [#guild_league_role{side = 1}] ->
                     util:rand_list([{308, 2100},
                                     {690, 2320},
                                     {1090, 2520}]);
                 _ ->
                     util:rand_list([{3530, 400}, {3920, 600}, {4320, 825}])
             end,
    case map:role_transmit(4, 0, X, Y, Role) of
        Role3 = #role{} -> {ok, Role3};
        _Err ->
            logger:error("归队传送时, 地图内传送出错:~w",
                         [_Err],
                         guild_league_role,
                         763),
            {ok, Role}
    end;
callback(_, _Info) ->
    logger:debug("未知消息 ~w",
                 [_Info],
                 guild_league_role,
                 767),
    ok.

callback(_, Role = #role{name = _Name}, _,
         {follow_join, Side, MatchId, Event, MatchPid}) ->
    logger:debug("~ts 跟随进入",
                 [_Name],
                 guild_league_role,
                 771),
    Role2 = do_side_looks(Side,
                          Role#role{s_event = Event, s_event_pid = MatchPid}),
    Role3 = case Event of
                32 ->
                    guild_role:update(Role2, doing),
                    role_trigger:fire(#evt_guild_league_join{}, Role2);
                _ -> Role2
            end,
    map:role_update(Role3),
    Role4 = var:set_var(Role3, day, 74, 0),
    R = to(Side, Role4, MatchId),
    big_world:cast(guild_league_match,
                   follow_join,
                   [MatchPid, R]),
    {ok, Role4};
callback(_,
         Role = #role{id = Id, s_event_pid = MatchPid}, _,
         follow_to_war) ->
    big_world:cast(guild_league_match,
                   follow_to_war,
                   [MatchPid, Id]),
    {ok, Role};
callback(_,
         Role = #role{id = Id, s_event_pid = MatchPid}, _,
         follow_leave) ->
    big_world:cast(guild_league_match,
                   leave,
                   [MatchPid, Id]),
    PreRole1 = looks:del([64, 69], Role),
    PreRole = looks:add({64, 0, 0, ""}, PreRole1, replace),
    Role1 = looks:calc(PreRole#role{s_event = 0,
                                    s_event_pid = undefined}),
    map:role_update(Role1),
    {ok, Role1}.

apply_evt(#evt_activity{},
          Role = #role{m_guild = #m_guild{},
                       m_agenda = #m_agenda{activity = Activity}, lev = Lev})
    when Lev >= 70 andalso Activity >= 75 ->
    case world_lev:get_world_lev() of
        {Wlv, _} when Wlv < 80 -> ok;
        _ ->
            case env:get(guild_league_phase) of
                Phase
                    when is_integer(Phase) andalso
                             Phase > 4 andalso Phase < 8 ->
                    Season = env:get(guild_league_season),
                    Now = date:unixtime(),
                    case var:get_var(Role, other, 2052, 0) of
                        {Season, Phase, _} -> ok;
                        _ ->
                            Role1 = var:set_var(Role,
                                                other,
                                                2052,
                                                {Season, Phase, Now}),
                            Title = lang:get("冠军联赛竞猜券"),
                            Content =
                                notice:format(lang:get("恭喜你达成本轮冠军竞猜券领取资格，使用竞猜券可以在~ts界面竞猜下轮的获胜公会。冠军联赛8"
                                                       "强之后每周任意一天活跃度达到~ts点领取活跃度奖励时，即可获得本轮的~ts"),
                                              [{panel_2,
                                                17602,
                                                2,
                                                lang:get("冠军联赛-竞猜")},
                                               {string_2, 5, 75},
                                               {item_2, [{21704, 1}]}]),
                            mail:send(Role,
                                      #{title => Title, content => Content,
                                        items => [{21704, 1}]}),
                            {ok, Role1}
                    end;
                _ -> ok
            end
    end;
apply_evt(_, _Role) -> ok.

push(#role{pid = Pid, lev = Lev, m_guild = #m_guild{}},
     Cmd = 17600)
    when Lev >= 35 ->
    big_world:cast(guild_league, push, [Pid, Cmd]),
    ok;
push(#role{link = #link{conn_pid = ConnPid},
           m_guild = #m_guild{id = Gid}},
     Cmd = 17601) ->
    Data = case ets:lookup(guild_league_guild, Gid) of
               [#guild_league_guild{match_id = Mid}] ->
                   case ets:lookup(guild_league_alliance, {Mid, 1}) of
                       [A1 = #guild_league_alliance{}] ->
                           {[A1 | ets:lookup(guild_league_alliance, {Mid, 2})]};
                       _ -> {ets:lookup(guild_league_alliance, {Mid, 2})}
                   end;
               _ -> {[]}
           end,
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid}, id = Id},
     Cmd = 17605) ->
    WR = case ets:lookup(guild_league_role, Id) of
             [R = #guild_league_role{}] -> R;
             _ -> #guild_league_role{}
         end,
    Data = {WR},
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid},
           m_guild = #m_guild{id = Gid}},
     Cmd = 17607) ->
    L = get_member_results(Gid),
    Data = {L},
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 17609) ->
    Type = 0,
    Data = {Type},
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid}, id = Id},
     Cmd = 17614) ->
    Units = case ets:lookup(guild_league_role, Id) of
                [#guild_league_role{match_id = MatchId}] ->
                    guild_league_unit:list_all(MatchId);
                _ -> []
            end,
    Data = {Units},
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid},
           m_guild = #m_guild{id = Gid}},
     Cmd = 17615) ->
    Data = case ets:lookup(guild_league_guild, Gid) of
               [#guild_league_guild{trumps = Trumps}] -> {Trumps};
               _ -> {[]}
           end,
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid},
           m_guild = #m_guild{id = Gid}},
     Cmd = 17619) ->
    Data = guild_league_agent:get_proto17619(Gid),
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid}},
     {Cmd, Data}) ->
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{pid = Pid, s_event = 32,
           s_event_pid = MatchPid},
     Cmd = 17622) ->
    big_world:cast(guild_league_match,
                   push,
                   [MatchPid, Pid, Cmd]),
    ok;
push(#role{link = #link{conn_pid = ConnPid}, id = Id},
     Cmd = 17625) ->
    Data = guild_league_agent:get_guessed(Id),
    sys_conn:pack_send(ConnPid, Cmd, Data),
    ok;
push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 17627) ->
    L = guild_league_live:list(),
    Data = {L},
    sys_conn:pack_send(ConnPid, Cmd, Data),
    ok;
push(Role = #role{link = #link{conn_pid = ConnPid},
                  m_guild = #m_guild{id = Gid}},
     Cmd = 17631) ->
    case env:get(guild_league_champion) of
        Gid ->
            Done = var:get_var(Role, day, 86, 0),
            Data = {max(0, 1 - Done)},
            sys_conn:pack_send(ConnPid, Cmd, Data);
        _ -> sys_conn:pack_send(ConnPid, Cmd, {0})
    end,
    ok;
push(_, _Cmd) ->
    logger:debug("无法推送 ~w", [_Cmd], guild_league_role, 893),
    ok.

check_join([], _, Args) -> {ok, Args};
check_join([lev | _T], #role{lev = Lev}, _)
    when Lev < 70 ->
    {false,
     notice:format(lang:get("角色等级达到~ts才可以参与冠军联赛"),
                   [{string_2, 5, 70}])};
check_join([lev | T], Role, Args) ->
    check_join(T, Role, Args);
check_join([world_lev | T], Role, Args) ->
    Lev = lev_break:lev(Role),
    {WorldLev, _} = world_lev:get_world_lev(Role),
    case abs(Lev - WorldLev) < 25 of
        true -> check_join(T, Role, Args);
        _ ->
            {false,
             notice:format(lang:get("角色等级低于世界等级~ts级，不能参加"),
                           [{string_2, 5, 25}])}
    end;
check_join([guild | _T],
           #role{m_guild = #m_guild{enter_time = Entered}},
           #{time := Now})
    when Now - Entered < 86400 * 8 ->
    {false,
     notice:format(lang:get("进入公会~ts天以上的成员才能参与冠军联赛"),
                   [{string_2, 5, 86400 * 8 div 86400}])};
check_join([guild | T],
           Role = #role{m_guild = #m_guild{}}, Args) ->
    check_join(T, Role, Args);
check_join([guild | _], _Role, _) ->
    {false, lang:get("不在公会中不能参与")};
check_join([misc | T],
           Role = #role{m_guild = #m_guild{id = Gid}, id = Id},
           Args) ->
    case big_world:call(guild_league_match,
                        check_join,
                        [[guild, to_war, movability],
                         Args#{rid => Id, gid => Gid}])
        of
        {ok, NewArgs} -> check_join(T, Role, NewArgs);
        Else -> Else
    end;
check_join([event | T], Role, Args) ->
    case role_misc:check_event(Role, [0, 2]) of
        true -> check_join(T, Role, Args);
        Else -> Else
    end.

do_join(Role = #role{name = Name},
        Args = #{side := Side, match_id := MatchId,
                 match_pid := MatchPid, ready_map_id := _ReadyMapId}) ->
    logger:debug("~ts 进入准备区",
                 [Name],
                 guild_league_role,
                 936),
    WR = to(Side, Role, MatchId),
    case big_world:call(guild_league_match,
                        join,
                        [MatchPid, WR])
        of
        {ok, StateName} ->
            ToPos = get_pos(Args),
            Role1 = case StateName of
                        ready ->
                            Role#role{s_event = 33, s_event_pid = MatchPid};
                        _ -> Role#role{s_event = 32, s_event_pid = MatchPid}
                    end,
            Role2 = do_side_looks(Side, Role1),
            Role3 = var:set_var(Role2, day, 74, 0),
            TeamEvt = make_team_event(Role3, Side, MatchId),
            case map:role_enter(ToPos, TeamEvt, Role3) of
                {error, Reason} ->
                    logger:error("[~ts]进入冠军联赛场失败:~w",
                                 [Name, Reason],
                                 guild_league_role,
                                 951),
                    {false, lang:get("进入冠军联赛场失败")};
                {ok, NewRole} ->
                    team:stop_recruiting(NewRole),
                    case StateName of
                        ready ->
                            notice:send(NewRole,
                                        11,
                                        lang:get("请提前做好战略部署，摧毁敌方3座水晶塔即可取得胜利！{sound_1, "
                                                 "566}")),
                            {ok, NewRole};
                        _ ->
                            guild_role:update(NewRole, doing),
                            notice:send(NewRole,
                                        11,
                                        lang:get("比赛正式开始！{sound_1, 567} ")),
                            {ok,
                             role_trigger:fire(#evt_guild_league_join{},
                                               NewRole)}
                    end
            end;
        Else -> Else
    end.

get_pos(#{platform := P, zone_id := Z, map_id := MapId,
          side := Side}) ->
    {X, Y} = case Side of
                 1 ->
                     util:rand_list([{308, 2100},
                                     {690, 2320},
                                     {1090, 2520}]);
                 _ ->
                     util:rand_list([{3530, 400}, {3920, 600}, {4320, 825}])
             end,
    {P, Z, MapId, X, Y};
get_pos(#{ready_map_id := MapId, platform := P,
          zone_id := Z}) ->
    {X, Y} = map:rand_pos(52002),
    {P, Z, MapId, X, Y}.

do_side_looks(Side,
              Role = #role{m_guild = #m_guild{post = Post}}) ->
    HonorId = guild_role:post2honor(Post),
    NRole = case honor:use(replace, Role, HonorId, push) of
                {ok, Role1} -> Role1;
                _ -> Role
            end,
    Look2 = {64, 0, Side, ""},
    looks:add(Look2, NRole, replace).

make_team_event(Role = #role{s_event = Event,
                             s_event_pid = MatchPid},
                Side, NextId) ->
    case check_team(Role) of
        [] -> self;
        MateIds when Event =:= 33 ->
            #{label => enter_event, event => Event,
              role_ids => MateIds,
              mfa =>
                  {guild_league_role,
                   callback,
                   [{follow_join, Side, NextId, Event, MatchPid}]}};
        MateIds when Event =:= 32 ->
            #{label => enter_event, event => Event,
              role_ids => MateIds,
              mfa =>
                  {guild_league_role,
                   callback,
                   [{follow_join, Side, NextId, Event, MatchPid}]}};
        MateIds ->
            #{label => exit_event, event => Event,
              role_ids => MateIds,
              mfa => {guild_league_role, callback, [follow_leave]}}
    end.

check_team(Role = #role{m_team =
                            #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    Now = date:unixtime(),
    case team:get_members(Role) of
        TeamList = [_ | _] ->
            [Id
             || Mate = #team_mate{id = Id, status = 2} <- TeamList,
                can_team_join(Role, Mate, Now)];
        _ -> []
    end;
check_team(_) -> [].

can_team_join(Role, Mate, Now) ->
    do_can_team_join([lev, world_lev, enter_time, misc],
                     Role,
                     Mate,
                     Now).

do_can_team_join([], _, _, _) -> true;
do_can_team_join([lev | T], Role,
                 Mate = #team_mate{lev = Lev, name = Name, pid = Pid},
                 Now) ->
    case Lev >= 70 of
        true -> do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg = notice:format(lang:get("队员~ts等级不足~ts级，自动离开了队伍"),
                                [{role_2, Name}, {string_2, 5, 70}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end;
do_can_team_join([world_lev | T], Role,
                 Mate = #team_mate{name = Name, pid = Pid}, Now) ->
    Lev = lev_break:lev(Mate),
    {WorldLev, _} = world_lev:get_world_lev(Role),
    case abs(Lev - WorldLev) < 25 of
        true -> do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg =
                notice:format(lang:get("队员~ts等级低于世界等级~ts级，自动离开了队伍"),
                              [{role_2, Name}, {string_2, 5, 25}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end;
do_can_team_join([misc | T],
                 Role = #role{id = LeaderId,
                              m_guild = #m_guild{id = Gid}},
                 Mate = #team_mate{id = Id, name = Name, pid = Pid},
                 Now) ->
    MateGid = case guild_role:find_role(Id) of
                  {ok, Gid2} -> Gid2;
                  _ -> false
              end,
    case big_world:call(guild_league_match,
                        check_team_join,
                        [[guild, movability, to_war],
                         #{leader_id => LeaderId, leader_gid => Gid,
                           mate_id => Id, mate_gid => MateGid}])
        of
        true -> do_can_team_join(T, Role, Mate, Now);
        {false, Msg} ->
            Msg2 = notice:format(lang:get("队员~ts~ts，自动离开了队伍"),
                                 [{role_2, Name}, {string_1, Msg}]),
            team:notice(Role, Msg2),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end;
do_can_team_join([enter_time | T], Role,
                 Mate = #team_mate{id = Id, name = Name, pid = Pid},
                 Now) ->
    case guild_role:get(Id) of
        #guild_role{enter_time = Entered}
            when Now - Entered >= 86400 * 8 ->
            do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg = notice:format(lang:get("队员~ts入会时间不足3天，自动离开了队伍"),
                                [{role_2, Name}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end.

to(trump,
   #guild_role{id = Id, name = Name, lev = Lev, sex = Sex,
               classes = Classes},
   #{pos := Pos, gid := Gid}) ->
    #guild_league_trump{id = Id, name = Name, lev = Lev,
                        gid = Gid, sex = Sex, classes = Classes, pos = Pos};
to(Side,
   Role = #role{id = Id, name = Name, lev = Lev, pid = Pid,
                m_guild = #m_guild{id = Gid}, sex = Sex,
                classes = Classes},
   MatchId) ->
    #guild_league_role{id = Id, name = Name, lev = Lev,
                       side = Side, match_id = MatchId, pid = Pid, gid = Gid,
                       sex = Sex, classes = Classes,
                       movability = get_movability(Role)}.

do_reward_role(Role, Result) ->
    case var:get_var(Role, day, 74, 0) of
        0 ->
            do_reward_role(var:set_var(Role, day, 74, 1),
                           Result,
                           true);
        _ -> do_reward_role(Role, Result, false)
    end.

do_reward_role(Role, _Result, false) -> Role;
do_reward_role(Role = #role{lev = Lev, name = Name,
                            id = Id},
               Result, _) ->
    Gain1 = case levup_data:get_exp({3300, Lev}) of
                #{exp := Exp} ->
                    G1 = [{90010, round(Exp * 8)}],
                    case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case levup_data:get_exp({3300, PetLev}) of
                                #{pet_exp := PetExp} ->
                                    [{90005, round(PetExp * 5)} | G1];
                                _ -> G1
                            end;
                        _ -> G1
                    end;
                _R ->
                    logger:debug("找不到经验模型 ~w ~w",
                                 [Lev, _R],
                                 guild_league_role,
                                 1111),
                    []
            end,
    Gain2 = case guild_league_data:get_result_reward(Result)
                of
                Items0 = [_ | _] ->
                    Items = [Oi
                             || Oi = #{item_id := OId} <- Items0,
                                lists:member(OId, [29010, 29011]) =:= false],
                    case util:rand_list(Items, item_weight) of
                        #{item_id := ItemId, item_num := ItemNum,
                          announce := Announce} ->
                            ItemId0 = item_type:special_id(ItemId),
                            case Announce of
                                1 when Result =:= 1 ->
                                    AnStr =
                                        notice:format(lang:get("~ts大杀四方，帮助公会取得冠军联赛胜利的同时，还从对手身上摸了一件~ts{face_1, "
                                                               "44}"),
                                                      [{role_2, Name},
                                                       {item_2,
                                                        ItemId0,
                                                        ItemNum}]),
                                    case lists:member(ItemId, [29010, 29011]) of
                                        true -> notice:cast(all, 10, AnStr);
                                        false -> notice:cast(all, 5, AnStr)
                                    end;
                                1 ->
                                    AnStr =
                                        notice:format(lang:get("~ts从战场败退，正垂头丧气，猛见脚下躺着一件~ts{face_1, 42}"),
                                                      [{role_2, Name},
                                                       {item_2,
                                                        ItemId0,
                                                        ItemNum}]),
                                    case lists:member(ItemId, [29010, 29011]) of
                                        true -> notice:cast(all, 10, AnStr);
                                        false -> notice:cast(all, 5, AnStr)
                                    end;
                                _ -> ok
                            end,
                            [{ItemId0, 0, ItemNum} | Gain1];
                        _Err ->
                            logger:error("找不到奖励 ~w",
                                         [_Err],
                                         guild_league_role,
                                         1141),
                            Gain1
                    end;
                _Err1 ->
                    logger:error("找不到奖励 ~w",
                                 [_Err1],
                                 guild_league_role,
                                 1145),
                    Gain1
            end,
    Gain3 = case Result of
                1 -> [{90020, 10} | Gain2];
                _ -> [{90020, 5} | Gain2]
            end,
    Content = case Result of
                  1 ->
                      lang:get("恭喜您获得冠军联赛的胜利，您出色的表现帮助公会赢得荣誉与利益，这是您的战利品！");
                  _ ->
                      lang:get("感谢您参与冠军联赛，虽然不幸出局，但您的努力一定能帮助公会朝胜利迈进，这是您的荣誉奖励！")
              end,
    MailInfo = #{items => Gain3,
                 title => lang:get("冠军联赛奖励"), content => Content},
    mail:send(Id, MailInfo),
    Role.

async_leave(Role, Msg) -> async_leave(Role, Msg, true).

async_leave(Role = #role{name = Name}, Msg, NeedAway) ->
    PreRole1 = looks:del([64, 69], Role),
    PreRole = looks:add({64, 0, 0, ""}, PreRole1, replace),
    Role1 = looks:calc(PreRole#role{s_event = 0,
                                    s_event_pid = undefined}),
    Role2 = case NeedAway of
                true -> team_leave_away(Role1);
                _ -> Role1
            end,
    ToPos = util:rand_list([{10001, 306, 3507},
                            {10001, 2583, 3848},
                            {10001, 4957, 3680},
                            {10001, 445, 2565},
                            {10001, 4646, 704},
                            {10001, 841, 1033},
                            {10001, 2098, 1834},
                            {10001, 3617, 1816}]),
    case map:role_enter(ToPos, self, Role2) of
        {error, Reason} ->
            logger:error("[~ts]退出冠军联赛场失败:~w",
                         [Name, Reason],
                         guild_league_role,
                         1181),
            {ok, Role2};
        {ok, NewRole} ->
            case Msg of
                "" -> ok;
                _ -> notice:send(Role, 3, Msg)
            end,
            {ok, NewRole}
    end.

team_leave_away(Role) ->
    case team:get_status(Role) of
        {true, 2} ->
            case team:away(Role) of
                {ok, ARole} -> ARole;
                _ -> Role
            end;
        {true, 1} ->
            case team:async_leave(Role) of
                {ok, ARole} -> ARole;
                _ -> Role
            end;
        _ -> Role
    end.

set_delay_out(Role, Msg, reward_leave) ->
    Role2 = team_leave_away(Role),
    Timer = #timer{id = guild_league_reward_leave,
                   timeout = 5 * 1000, times = 1, m = guild_league_role,
                   f = callback, a = [reward_leave]},
    case Msg of
        "" -> ok;
        _ ->
            Msg2 = notice:format(lang:get("~ts, ~ts秒后将自动离开战场"),
                                 [{string_1, Msg}, {string_2, 1, 5}]),
            notice:send(Role, 3, Msg2)
    end,
    {ok, role_timer:set(Timer, Role2)};
set_delay_out(Role, Msg, Type) ->
    Role2 = team_leave_away(Role),
    Timer = #timer{id = guild_league_leave,
                   timeout = 5 * 1000, times = 1, m = guild_league_role,
                   f = callback, a = [Type]},
    case Msg of
        "" -> ok;
        _ ->
            Msg2 = notice:format(lang:get("~ts, ~ts秒后将自动离开战场"),
                                 [{string_1, Msg}, {string_2, 1, 5}]),
            notice:send(Role, 3, Msg2)
    end,
    {ok, role_timer:set(Timer, Role2)}.

combat_check(Role = #role{}, TargetId = {_, P, Z},
             Args = #{atk_side := TmpAtkSide, dfd_side := DfdSide,
                      match_id := MatchId, match_pid := MatchPid,
                      subsidize_buff := SubsidizeBuff, log_id := LogId}) ->
    case big_world:call(P,
                        Z,
                        role_query,
                        rec,
                        [by_id, TargetId, fighter_wrap])
        of
        {ok, #fighter_wrap{status = 2}} ->
            {false, lang:get("对方在战斗中")};
        {ok, Target = #fighter_wrap{s_event = 32}} ->
            {Flag1, AtkList} = team:get_fighters(Role),
            {Flag2, DfdList} = team:get_fighters(Target),
            case Flag1 =:= ok andalso Flag2 =:= ok of
                true ->
                    case check_team_mate(AtkList) of
                        ok ->
                            AtkGroup = {MatchId, TmpAtkSide},
                            ObserverArgs = {observer_args,
                                            [{0, AtkGroup},
                                             {1, {MatchId, DfdSide}}]},
                            ExtArgs1 = [ObserverArgs,
                                        {subsidize_buff, SubsidizeBuff},
                                        {log_id, LogId}],
                            ExtArgs = case Args of
                                          #{is_guarding_unit := true} ->
                                              CBuff = get_combat_buff(MatchId,
                                                                      TmpAtkSide),
                                              [{match_pid, operating, MatchPid},
                                               {buff, CBuff}
                                               | ExtArgs1];
                                          #{is_attacking_unit := true} ->
                                              CBuff = get_combat_buff(MatchId,
                                                                      DfdSide),
                                              [{match_pid, attacking, MatchPid},
                                               {buff, CBuff}
                                               | ExtArgs1];
                                          _ ->
                                              [{match_pid, MatchPid} | ExtArgs1]
                                      end,
                            StartArgs = #combat_start_args{ext_args = ExtArgs,
                                                           common_referee =
                                                               MatchPid},
                            case combat_mgr:start_combat(108,
                                                         AtkList,
                                                         DfdList,
                                                         StartArgs)
                                of
                                {ok, _Pid} -> ok;
                                _ -> {false, lang:get("对方正忙，无法发起战斗")}
                            end;
                        Else -> Else
                    end;
                false -> {false, lang:get("无法发起战斗")}
            end;
        {ok, #fighter_wrap{s_event = 33}} ->
            role:apply(async,
                       TargetId,
                       {guild_league_role, callback, [to_war]}),
            {false, lang:get("对方还没准备好")};
        _ -> {false, lang:get("对方不在冠军联赛中")}
    end.

check_team_mate([]) -> ok;
check_team_mate([#team_mate{id = Id, name = Name}
                 | T]) ->
    case big_world:call(guild_league_match,
                        check_fight_movability,
                        [Id])
        of
        false ->
            {false,
             notice:format(lang:get("你队伍中的~ts行动不足以发起挑战"),
                           [{role_2, Name}])};
        _ -> check_team_mate(T)
    end;
check_team_mate([_ | T]) -> check_team_mate(T).

combat_cast(Winner, Loser) ->
    do_combat_cast(win, Winner, Loser),
    do_combat_cast(lost, Loser, Winner).

do_combat_cast(_Type, _Ours, []) -> ok;
do_combat_cast(Type,
               Ours = [#{id := Oid = {_, P, Z}} | _], Theirs) ->
    [LeadName | _] = [LName
                      || #{is_leader := 1, name := LName} <- Theirs],
    Roles = [{Id, Name}
             || #{id := Id, name := Name} <- Ours],
    Msg = case Type of
              win ->
                  notice:format(lang:get("~ts战胜了~ts带领的~ts人队伍，我方气势大涨{face_1,18}"),
                                [{role_1, Roles},
                                 {role_2, LeadName},
                                 {string_2, 5, length(Theirs)}]);
              _ ->
                  notice:format(lang:get("~ts惜败于~ts带领的~ts人队伍，再继续努力{face_1,21}"),
                                [{role_1, Roles},
                                 {role_2, LeadName},
                                 {string_2, 5, length(Theirs)}])
          end,
    big_world:cast(P,
                   Z,
                   guild_league_role,
                   guild_combat_cast,
                   [Oid, Msg]);
do_combat_cast(_, _, _) -> ok.

encounter_notice([], _) -> [];
encounter_notice([{leader, #role{id = Id, pid = Pid}, _}
                  | T],
                 Msg) ->
    notice:send({pid, Pid}, 3, Msg),
    [Id | encounter_notice(T, Msg)];
encounter_notice([{leader,
                   #fighter_wrap{fighter =
                                     #fighter{origin_id = Id, pid = Pid}},
                   _}
                  | T],
                 Msg) ->
    notice:send({pid, Pid}, 3, Msg),
    [Id | encounter_notice(T, Msg)];
encounter_notice([#team_mate{id = Id, pid = Pid} | T],
                 Msg) ->
    notice:send({pid, Pid}, 3, Msg),
    [Id | encounter_notice(T, Msg)];
encounter_notice([#fighter{origin_id = Id, pid = Pid,
                           type = 1}
                  | T],
                 Msg) ->
    notice:send({pid, Pid}, 3, Msg),
    [Id | encounter_notice(T, Msg)];
encounter_notice([_ | T], Msg) ->
    encounter_notice(T, Msg).

do_set_trump(Role = #role{m_guild =
                              #m_guild{id = Gid, pid = Gpid},
                          name = Name1},
             Pos, R = #guild_role{name = Name2}) ->
    Trump = to(trump, R, #{gid => Gid, pos => Pos}),
    case big_world:call(guild_league_match,
                        set_trump,
                        [Trump])
        of
        {ok, Trumps} ->
            Msg = notice:format(lang:get("~ts被~ts委任为~ts号王牌领队"),
                                [{role_2, Name2},
                                 {role_2, Name1},
                                 {string_2, 5, Pos}]),
            guild:notice(Gpid, Msg),
            Msg1 = notice:format(lang:get("成功委任~ts为~ts号领队"),
                                 [{role_2, Name2}, {string_2, 5, Pos}]),
            push(Role, {17615, {Trumps}}),
            {ok, Msg1};
        Else -> Else
    end.

get_member_results(#role{m_guild =
                             #m_guild{id = Id}}) ->
    get_member_results(Id);
get_member_results(Id) ->
    ets:match_object(guild_league_role,
                     #guild_league_role{gid = Id, _ = '_'}).

get_combat_buff(MatchId, Side) ->
    {Us, UT} = guild_league_unit:get_ratio(MatchId, Side),
    get_combat_buff(Us - UT).

get_combat_buff(-1) ->
    [{90215, 1000, 0, 0, [80]}, {90217, 1000, 0, 0, [50]}];
get_combat_buff(-2) ->
    [{90216, 1000, 0, 0, [150]}, {90217, 1000, 0, 0, [80]}];
get_combat_buff(_) -> [].

live_log(Args = #{match_pid := MatchPid}) ->
    case guild_league_live:format(Args) of
        {ok, LogId, Msg} ->
            big_world:cast(guild_league_match,
                           live_log,
                           [MatchPid, {LogId, Msg}]);
        _ -> ok
    end;
live_log(_) -> ok.

get_movability(Role) ->
    Lev = lev_break:lev(Role),
    {WorldLev, _} = world_lev:get_world_lev(Role),
    case WorldLev - Lev of
        Val when Val >= 20 -> 50;
        Val when Val >= 15 -> 150;
        Val when Val >= 10 -> 200;
        Val when Val >= 5 -> 300;
        _ -> 500
    end.

