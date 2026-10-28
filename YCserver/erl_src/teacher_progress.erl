-file("src/mod/teacher/teacher_progress.erl", 1).

-module(teacher_progress).

-export([add_event/4,
         del_event/1,
         fetch/4,
         update/5,
         init_event/3,
         event/7,
         reverse/4,
         del_event/2]).

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

-file("src/mod/teacher/teacher_progress.erl", 20).

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

-file("src/mod/teacher/teacher_progress.erl", 21).

-file("inc/teacher.hrl", 1).

-record(m_teacher,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         status = 0,
         daily = [],
         daily_reward = 0,
         daily_time = 0,
         target = [],
         target_reward = [],
         target_rewarded = [],
         target_over = [],
         evaluation = [],
         study_lev = 0,
         mtime = 0,
         daily_goals = [],
         goals_times = 0}).

-record(teacher,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         msg = "",
         teacher_score = 0,
         teacher_score_offline = 0,
         login_time = 0,
         fc = 0,
         students = []}).

-record(student,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         status = 0,
         in_time = 0,
         out_time = 0,
         login_time = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         daily = [],
         daily_time = 0,
         daily_reward = 0,
         quest_student_reward = 0,
         quest_teacher_reward = 0,
         encourage_time = 0,
         target = [],
         teacher_score = 0,
         fc = 0,
         target_reward = [],
         target_rewarded = []}).

-record(teacher_daily,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_daily_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         reward = [],
         exp = 0}).

-record(teacher_target,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_target_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         student_reward = [],
         teacher_reward = [],
         student_exp = 0,
         teacher_exp = 0}).

-record(teacher_sign,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         online = 0,
         login_time = 0,
         logout_time = 0,
         online_time = 0,
         is_sign = 0,
         msg = ""}).

-record(teacher_quit_desc_data,
        {min = 0, max = 0, radio = 0, title = "", msg = ""}).

-record(teacher_student_sign_info,
        {id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         msg = ""}).

-file("src/mod/teacher/teacher_progress.erl", 22).

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

-file("src/mod/teacher/teacher_progress.erl", 23).

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

-file("src/mod/teacher/teacher_progress.erl", 24).

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

-file("src/mod/teacher/teacher_progress.erl", 25).

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

-file("src/mod/teacher/teacher_progress.erl", 26).

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

-file("src/mod/teacher/teacher_progress.erl", 27).

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

-file("src/mod/teacher/teacher_progress.erl", 28).

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

-file("src/mod/teacher/teacher_progress.erl", 29).

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

-file("src/mod/teacher/teacher_progress.erl", 30).

-file("inc/wing.hrl", 1).

-record(m_wing,
        {ver = 11 :: pos_integer(),
         grade = 0 :: non_neg_integer(),
         growth = 0,
         enhance_num = 0,
         wing_id = 0,
         plot_wing_id = 0,
         expiry = [],
         tmp_grade = 0 :: non_neg_integer(),
         tmp_growth = 0,
         tmp_wing_id = 0,
         star_lev = 1 :: non_neg_integer(),
         valid_plan = 1,
         plan_data = [] :: list(),
         change_times = 0,
         reset_times = 0,
         lev_break_skill = [],
         wing_ids = [],
         exp = 0,
         old_grade = 0,
         old_star = 0,
         appearance_list = [],
         speed = 1,
         wing_group_list = [],
         wing_power = 100}).

-record(wing_skill_plan,
        {index = 1,
         plan_name = [] :: list(),
         skills = [],
         tmp_skills = []}).

-record(wing_lev_break_skill,
        {ver = 1,
         skill_grade = 0,
         skill_id = 0,
         skill_lev = 0,
         skill_val = 0}).

-record(wing_skill,
        {ver = 1, key = {0, 0}, id = 0, lev = 0, is_lock = 0}).

-record(wing_lock_data,
        {grade = 0, max = 0, item_list = []}).

-record(wing_appearance,
        {id = 0,
         time = 0,
         timeout = 0,
         grade = 0,
         star_lev = 0}).

-record(wing_base_group,
        {group_id = 0,
         need_grade = 0,
         wing_ids = [],
         grades = [],
         loss_item = []}).

-record(wing_group,
        {ver = 1,
         group_id = 0,
         wing_ids = [],
         wing_times = 0,
         rewarded = 0}).

-file("src/mod/teacher/teacher_progress.erl", 31).

-file("inc/shipping.hrl", 1).

-record(m_shipping, {ver = 1, total_num = 0}).

-record(shipping,
        {rid = {1, "", 0},
         world_lev = 0,
         role_lev = 0,
         type = 1,
         status = 0,
         reset_time = 0,
         start_time = 0,
         help = 0,
         show_list = [],
         cells = []}).

-record(shipping_cell,
        {ver = 1,
         id = 0,
         type = 1,
         status = 1,
         help_type = 0,
         pack_type = 0,
         normal_rewards = [],
         rewards = [],
         item_base_id = 0,
         need_num = 0,
         help_friends = [],
         help_guild = {"", 0, ""},
         quest_id = 0}).

-record(shipping_cell_data,
        {id = 0,
         classify = 0,
         classes = 0,
         lev = 0,
         item_base_id = 0,
         need_num = 0,
         weight = 0,
         exp = 0,
         ratio = 0,
         quest_id = 0}).

-record(shipping_classify_data,
        {classify = 0,
         min_num = 0,
         max_num = 0,
         is_show = 0,
         weight = 0}).

-record(shipping_cell_quset_data,
        {id = 0,
         classify = 0,
         quest_id = 0,
         item_base_id = 0,
         ratio = 0,
         week_min = 0,
         week_max = 0}).

-record(quest_shipping_data,
        {id = 0,
         type = 0,
         ring = 0,
         max_ring = 0,
         next_id = 0,
         rewards = [],
         leader_exp_mode = 0,
         leader_ratio = 0,
         exp_mode = 0,
         ratio = 0}).

-record(quest_shipping_reward_data,
        {id = 0,
         min = 0,
         max = 0,
         ratio = 0,
         rewards = [],
         need_num = 0,
         exp_mode = 0,
         mate_rewards = [],
         mate_exp_mode = 0}).

-file("src/mod/teacher/teacher_progress.erl", 32).

-file("inc/trial.hrl", 1).

-record(trial_unit,
        {battle_id = 0,
         unit_id = 0,
         unit_baseid = 0,
         unit_name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         dir = 0,
         looks = [],
         map_id = 0,
         x = 0,
         y = 0}).

-record(m_trial,
        {ver = 3,
         mode = 0,
         order = 0,
         fighter,
         unit = #trial_unit{},
         direct_order = 0,
         clear_normal = 0,
         round = 0,
         times = 2,
         coin = 0,
         reset = 2,
         max_order_easy = 0,
         max_order_hard = 0,
         has_match = [],
         is_helped = "",
         gain_items = []}).

-record(trial_help,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         unit_id = 0,
         battle_id = 0,
         unit_name = "",
         time = 0}).

-file("src/mod/teacher/teacher_progress.erl", 33).

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

-file("src/mod/teacher/teacher_progress.erl", 34).

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

-file("src/mod/teacher/teacher_progress.erl", 35).

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

-file("src/mod/teacher/teacher_progress.erl", 36).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/teacher/teacher_progress.erl", 37).

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

-file("src/mod/teacher/teacher_progress.erl", 38).

del_event(Role = #role{m_teacher =
                           #m_teacher{daily = Daily, target = Target}}) ->
    DList = get_event(daily, Daily, []),
    TList = get_event(target, Target, []),
    NRole = role_trigger:del(DList ++ TList, Role),
    NRole.

del_event(Role = #role{m_teacher =
                           #m_teacher{daily = Daily}},
          daily) ->
    DList = get_event(daily, Daily, []),
    NRole = role_trigger:del(DList, Role),
    NRole;
del_event(Role = #role{m_teacher =
                           #m_teacher{target = Target}},
          target) ->
    TList = get_event(target, Target, []),
    NRole = role_trigger:del(TList, Role),
    NRole.

get_event(_, [], List) -> List;
get_event(Label = daily,
          [#teacher_daily{progress = Progress} | T], List) ->
    Add = get_pro_id(Progress, []),
    get_event(Label, T, List ++ Add);
get_event(Label = target,
          [#teacher_target{progress = Progress} | T], List) ->
    Add = get_pro_id(Progress, []),
    get_event(Label, T, List ++ Add).

get_pro_id([], List) -> List;
get_pro_id([#quest_progress{trigger = Trigger = {_, _}}
            | T],
           List) ->
    get_pro_id(T, [Trigger | List]);
get_pro_id([#quest_progress{} | T], List) ->
    get_pro_id(T, List).

add_event(Role, _Label, [], List) -> {Role, List};
add_event(Role, Label,
          [I = #teacher_daily{finish = 2} | T], List) ->
    add_event(Role, Label, T, [I | List]);
add_event(Role, Label,
          [I = #teacher_daily{finish = 1} | T], List) ->
    add_event(Role, Label, T, [I | List]);
add_event(Role, Label,
          [I = #teacher_daily{id = Id, progress = Progress} | T],
          List) ->
    {NRole, NewProgress} = add_prog(Role,
                                    Label,
                                    Progress,
                                    Id,
                                    1,
                                    []),
    NI = I#teacher_daily{progress = NewProgress},
    add_event(NRole, Label, T, [NI | List]);
add_event(Role, Label,
          [I = #teacher_target{finish = 3} | T], List) ->
    add_event(Role, Label, T, [I | List]);
add_event(Role, Label,
          [I = #teacher_target{finish = 2} | T], List) ->
    add_event(Role, Label, T, [I | List]);
add_event(Role, Label,
          [I = #teacher_target{finish = 1} | T], List) ->
    add_event(Role, Label, T, [I | List]);
add_event(Role, Label,
          [I = #teacher_target{id = Id, progress = Progress} | T],
          List) ->
    {NRole, NewProgress} = add_prog(Role,
                                    Label,
                                    Progress,
                                    Id,
                                    1,
                                    []),
    NI = I#teacher_target{progress = NewProgress},
    add_event(NRole, Label, T, [NI | List]).

add_prog(Role, _TypeLabel, [], _QId, _Id, List) ->
    {Role, List};
add_prog(Role, TypeLabel,
         [I = #quest_progress{finish = 1} | T], QId, Id, List) ->
    add_prog(Role,
             TypeLabel,
             T,
             QId,
             Id + 1,
             [I#quest_progress{id = Id} | List]);
add_prog(Role, TypeLabel,
         [I = #quest_progress{id = PId, label = Label,
                              target = Target, param = Param}
          | T],
         QId, Id, List) ->
    Trigger = #trigger{label = Label,
                       a = [TypeLabel, QId, Id, Target, Param],
                       m = teacher_progress, f = event},
    {TriggerId, NRole} = role_trigger:add(Trigger, Role),
    NewPId = case PId of
                 0 -> Id;
                 _ -> PId
             end,
    add_prog(NRole,
             TypeLabel,
             T,
             QId,
             Id + 1,
             [I#quest_progress{id = NewPId, trigger = TriggerId}
              | List]).

init_event(_Role, [], List) -> List;
init_event(Role, [I = #teacher_target{finish = 3} | T],
           List) ->
    init_event(Role, T, [I | List]);
init_event(Role, [I = #teacher_target{finish = 2} | T],
           List) ->
    init_event(Role, T, [I | List]);
init_event(Role, [I = #teacher_daily{finish = 2} | T],
           List) ->
    init_event(Role, T, [I | List]);
init_event(Role, [I = #teacher_target{finish = 1} | T],
           List) ->
    init_event(Role, T, [I | List]);
init_event(Role, [I = #teacher_daily{finish = 1} | T],
           List) ->
    init_event(Role, T, [I | List]);
init_event(Role,
           [I = #teacher_target{progress = Progress} | T], List) ->
    NewProgress = init_pro(Role, Progress, []),
    case [1 || #quest_progress{finish = 0} <- NewProgress]
        of
        [] ->
            init_event(Role,
                       T,
                       [I#teacher_target{finish = 3} | List]);
        _ ->
            init_event(Role,
                       T,
                       [I#teacher_target{progress = NewProgress} | List])
    end;
init_event(Role,
           [I = #teacher_daily{progress = Progress} | T], List) ->
    NewProgress = init_pro(Role, Progress, []),
    case [1 || #quest_progress{finish = 0} <- NewProgress]
        of
        [] ->
            init_event(Role,
                       T,
                       [I#teacher_daily{finish = 1, progress = NewProgress}
                        | List]);
        _ ->
            init_event(Role,
                       T,
                       [I#teacher_daily{progress = NewProgress} | List])
    end.

init_pro(_Role, [], List) -> List;
init_pro(Role, [I | T], List) ->
    NI = do_init_pro(Role, I),
    init_pro(Role, T, [NI | List]).

do_init_pro(#role{lev = Lev},
            I = #quest_progress{label = evt_levup,
                                target_val = Target})
    when Lev >= Target ->
    I#quest_progress{value = Lev, finish = 1};
do_init_pro(#role{lev = Lev},
            I = #quest_progress{label = evt_levup,
                                target_val = _Target}) ->
    I#quest_progress{value = Lev};
do_init_pro(#role{m_wing = #m_wing{grade = Grade}},
            I = #quest_progress{label = evt_wing,
                                target_val = Target, param = []})
    when Grade >= Target ->
    I#quest_progress{value = Grade, finish = 1};
do_init_pro(#role{m_wing =
                      #m_wing{grade = Grade, growth = Growth}},
            I = #quest_progress{label = evt_wing, target = Target,
                                param = [{growth, NeedGrowth}]}) ->
    case Growth >= NeedGrowth of
        true when Grade >= Target ->
            I#quest_progress{value = Grade, finish = 1};
        true -> I#quest_progress{value = Grade};
        _ -> I
    end;
do_init_pro(#role{m_wing = #m_wing{grade = Grade}},
            I = #quest_progress{label = evt_wing_lev,
                                target = Target, param = []})
    when Grade >= Target ->
    I#quest_progress{value = 1, finish = 1};
do_init_pro(#role{m_wing =
                      #m_wing{grade = Grade, star_lev = StarLev}},
            I = #quest_progress{label = evt_wing_lev,
                                target = Target,
                                param = [{star_lev, NeedLev}]}) ->
    case StarLev >= NeedLev of
        true when Grade =:= Target ->
            I#quest_progress{value = 1, finish = 1};
        _ when Grade > Target ->
            I#quest_progress{value = 1, finish = 1};
        _ -> I
    end;
do_init_pro(#role{p_eqm = #package{items = Eqms}},
            I = #quest_progress{label = evt_eqm,
                                param = [{eqm_lev, Conds}]}) ->
    case lists:keytake(lev, 1, Conds) of
        {value, {lev, RequireLev}, [{num, RequireNum}]} ->
            RequireEqms = [1
                           || #item{lev = Lev} <- Eqms, Lev >= RequireLev],
            Length = length(RequireEqms),
            case Length >= RequireNum of
                true -> I#quest_progress{value = Length, finish = 1};
                false -> I
            end;
        _ -> I
    end;
do_init_pro(#role{p_eqm = #package{items = Eqms}},
            I = #quest_progress{label = evt_eqm,
                                target_val = Target,
                                param = [{eqm_lev_num, RequireLev}]}) ->
    RequireEqms = [1
                   || #item{lev = Lev} <- Eqms, Lev >= RequireLev],
    Num = length(RequireEqms),
    case Num >= Target of
        true ->
            I#quest_progress{value = length(RequireEqms),
                             finish = 1};
        _ -> I
    end;
do_init_pro(#role{name = _Name,
                  p_eqm = #package{items = Items}},
            I = #quest_progress{label = evt_enchant,
                                target_val = TargetVal, target = Target}) ->
    Count = erlang:length([1
                           || #item{enchant = Enchant} <- Items,
                              Enchant >= Target]),
    case Count >= TargetVal of
        true -> I#quest_progress{value = TargetVal, finish = 1};
        _ -> I#quest_progress{value = Count}
    end;
do_init_pro(Role = #role{name = _Name},
            I = #quest_progress{label = evt_commit_quest,
                                param = [{sec_type, 4}],
                                target_val = TargetVal}) ->
    Val = var:get_var(Role, day, 14, 0),
    case Val >= TargetVal of
        true -> I#quest_progress{value = TargetVal, finish = 1};
        _ -> I#quest_progress{value = Val}
    end;
do_init_pro(Role = #role{name = _Name},
            I = #quest_progress{label = evt_quest_treasure,
                                target_val = TargetVal}) ->
    Val = var:get_var(Role, day_five, 106, 0),
    case Val >= TargetVal of
        true -> I#quest_progress{value = TargetVal, finish = 1};
        _ -> I#quest_progress{value = Val}
    end;
do_init_pro(#role{name = _Name,
                  m_shipping = #m_shipping{total_num = Val}},
            I = #quest_progress{label = evt_shipping_sail,
                                target_val = TargetVal}) ->
    case Val >= TargetVal of
        true -> I#quest_progress{value = TargetVal, finish = 1};
        _ -> I#quest_progress{value = Val}
    end;
do_init_pro(Role = #role{name = _Name},
            I = #quest_progress{label = evt_arena_fight,
                                target_val = TargetVal}) ->
    Val = var:get_var(Role, day_five, 102, 0),
    case Val >= TargetVal of
        true -> I#quest_progress{value = TargetVal, finish = 1};
        _ -> I#quest_progress{value = Val}
    end;
do_init_pro(_Role, I) -> I.

reverse(_Role = #role{m_teacher =
                          #m_teacher{target_reward = Reward,
                                     target_rewarded = Rewarded,
                                     target_over = Over}},
        _Label = target, [], List) ->
    HasDone = Reward ++ Rewarded ++ Over,
    Ids = [Id || #teacher_target{id = Id} <- List] ++
              HasDone,
    AddIds = teacher_data:targets() -- Ids,
    Add = teacher:get_target(AddIds, []),
    NewList = [T
               || T = #teacher_target{id = Id} <- List,
                  not lists:member(Id, HasDone)],
    NewList ++ Add;
reverse(_Role, _Label, [], List) -> List;
reverse(Role, Label = daily,
        [I = #teacher_daily{finish = 1} | T], List) ->
    reverse(Role, Label, T, [I | List]);
reverse(Role, Label = daily,
        [I = #teacher_daily{finish = 2} | T], List) ->
    reverse(Role, Label, T, [I | List]);
reverse(Role, Label = daily,
        [I = #teacher_daily{id = Id, progress = Progress} | T],
        List) ->
    case teacher_data:get_daily(Id) of
        #teacher_daily_data{id = Id, progress = Progress0} ->
            case reverse_pro(lists:keysort(#quest_progress.id,
                                           Progress),
                             Progress0)
                of
                true -> reverse(Role, Label, T, [I | List]);
                _ ->
                    Add = teacher:get_daily([Id], []),
                    reverse(Role, Label, T, List ++ Add)
            end;
        _ when Id =:= 11 -> reverse(Role, Label, T, [I | List]);
        _ -> reverse(Role, Label, T, List)
    end;
reverse(Role, Label = target,
        [I = #teacher_target{finish = 3} | T], List) ->
    reverse(Role, Label, T, [I | List]);
reverse(Role, Label = target,
        [I = #teacher_target{finish = 2} | T], List) ->
    reverse(Role, Label, T, [I | List]);
reverse(Role, Label = target,
        [I = #teacher_target{finish = 1} | T], List) ->
    reverse(Role, Label, T, [I | List]);
reverse(Role, Label = target,
        [I = #teacher_target{id = Id, progress = Progress} | T],
        List) ->
    case teacher_data:get_target(Id) of
        #teacher_target_data{id = Id, progress = Progress0} ->
            case reverse_pro(lists:keysort(#quest_progress.id,
                                           Progress),
                             Progress0)
                of
                true -> reverse(Role, Label, T, [I | List]);
                _ ->
                    Add = teacher:get_target([Id], []),
                    reverse(Role, Label, T, List ++ Add)
            end;
        _ -> reverse(Role, Label, T, List)
    end.

reverse_pro([], []) -> true;
reverse_pro([#quest_progress{label = Label,
                             target = Target, target_val = TarVal,
                             param = Param}
             | T1],
            [#quest_progress{label = Label, target = Target,
                             target_val = TarVal, param = Param}
             | T2]) ->
    reverse_pro(T1, T2);
reverse_pro(_, _) -> false.

fetch(#role{name = Name,
            m_teacher = #m_teacher{daily = Daily}},
      _Label = daily, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #teacher_daily.id, Daily) of
        false ->
            logger:error("角色[~s]未接受编号为[~w]的师徒日常",
                         [Name, QuestId],
                         teacher_progress,
                         353),
            {false, quest_not_found};
        Q = #teacher_daily{progress = Progress} ->
            case lists:keyfind(ProgressId,
                               #quest_progress.id,
                               Progress)
                of
                false ->
                    logger:error("师徒日常[~w]中不存在编号为[~w]的进度",
                                 [QuestId, ProgressId],
                                 teacher_progress,
                                 358),
                    {false, progress_not_found};
                P -> {ok, Q, P}
            end
    end;
fetch(_Role = #role{name = Name,
                    m_teacher = #m_teacher{target = Target}},
      _Label, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #teacher_target.id, Target)
        of
        false ->
            logger:error("角色[~s]未接受编号为[~w]的师徒目标",
                         [Name, QuestId],
                         teacher_progress,
                         366),
            {false, quest_not_found};
        Q = #teacher_target{progress = Progress} ->
            case lists:keyfind(ProgressId,
                               #quest_progress.id,
                               Progress)
                of
                false ->
                    logger:error("师徒目标[~w]中不存在编号为[~w]的进度",
                                 [QuestId, ProgressId],
                                 teacher_progress,
                                 371),
                    {false, progress_not_found};
                P -> {ok, Q, P}
            end
    end.

update(Role = #role{id = SRoleId, lev = Lev,
                    name = _SName,
                    m_teacher =
                        MTeacher = #m_teacher{id = TRoleId, daily = Daily}},
       daily,
       Q = #teacher_daily{id = QuestId, progress = Progress,
                          finish = FinishFlag},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId,
                            #quest_progress.id,
                            Progress,
                            P),
    case [false || #quest_progress{finish = 0} <- NewP] of
        [] ->
            Finish = max(1, FinishFlag),
            NewQ = Q#teacher_daily{progress = NewP,
                                   finish = Finish},
            NewQuests = lists:keyreplace(QuestId,
                                         #teacher_daily.id,
                                         Daily,
                                         NewQ),
            NRole = Role#role{m_teacher =
                                  MTeacher#m_teacher{daily = NewQuests}},
            teacher_mgr:cast({update_student,
                              TRoleId,
                              SRoleId,
                              [{#student.daily, NewQuests}]}),
            teacher:push_daily(NRole, SRoleId),
            case QuestId of
                11 ->
                    case teacher_data:get_daily_goals(Lev,
                                                      date:day_of_the_week(date:unixtime())
                                                          rem 2)
                        of
                        false -> NRole;
                        {_,
                         _,
                         TeacherReward,
                         StudentReward,
                         MaxTimes,
                         TeacherVal,
                         TeacherTitle,
                         TeacherMsg,
                         StudentTitle,
                         StudentMsg} ->
                            mail:send(SRoleId,
                                      #{title => StudentTitle,
                                        content => StudentMsg,
                                        items => StudentReward}),
                            role:apply(async,
                                       TRoleId,
                                       {teacher,
                                        daily_goal_reward_apply,
                                        [#{max_times => MaxTimes,
                                           teacher_val => TeacherVal,
                                           teacher_reward => TeacherReward,
                                           teacher_title => TeacherTitle,
                                           teacher_msg => TeacherMsg,
                                           srole_id => SRoleId}]}),
                            NRole
                    end;
                _ ->
                    case teacher_data:get_daily(QuestId) of
                        #teacher_daily_data{reward = Rewards, exp = ExpRate} ->
                            AddExp = teacher:get_exp(#{mode => 3306, lev => Lev,
                                                       rate => ExpRate}),
                            Gains = format:val_to_gain(Rewards ++ AddExp),
                            case role_gain:do_notice(Gains,
                                                     NRole,
                                                     lang:get("师徒日常"))
                                of
                                {ok, NewRole} -> NewRole;
                                _ -> NRole
                            end;
                        _ -> NRole
                    end
            end;
        _ ->
            NewQ = Q#teacher_daily{progress = NewP,
                                   finish = max(0, FinishFlag)},
            NewQuests = lists:keyreplace(QuestId,
                                         #teacher_daily.id,
                                         Daily,
                                         NewQ),
            NewRole = Role#role{m_teacher =
                                    MTeacher#m_teacher{daily = NewQuests}},
            teacher_mgr:cast({update_student,
                              TRoleId,
                              SRoleId,
                              [{#student.daily, NewQuests}]}),
            teacher:push_daily(NewRole, SRoleId),
            NewRole
    end;
update(Role = #role{id = SRoleId,
                    m_teacher =
                        MTeacher = #m_teacher{id = TRoleId, target = Target,
                                              target_reward = TargetReward}},
       target,
       Q = #teacher_target{id = QuestId, finish = FinishFlag,
                           progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId,
                            #quest_progress.id,
                            Progress,
                            P),
    case [false || #quest_progress{finish = 0} <- NewP] of
        [] ->
            NewQuests = lists:keydelete(QuestId,
                                        #teacher_target.id,
                                        Target),
            NewTargetReward = [QuestId | TargetReward],
            NewRole = Role#role{m_teacher =
                                    MTeacher#m_teacher{target = NewQuests,
                                                       target_reward =
                                                           NewTargetReward}},
            teacher_mgr:cast({update_student,
                              TRoleId,
                              SRoleId,
                              [{#student.target, NewQuests}]}),
            teacher_mgr:cast({update_student_target_reward,
                              TRoleId,
                              SRoleId,
                              QuestId}),
            teacher:push_target(NewRole, SRoleId),
            NewRole;
        _ ->
            NewQ = Q#teacher_target{progress = NewP,
                                    finish = max(0, FinishFlag)},
            NewQuests = lists:keyreplace(QuestId,
                                         #teacher_target.id,
                                         Target,
                                         NewQ),
            NewRole = Role#role{m_teacher =
                                    MTeacher#m_teacher{target = NewQuests}},
            UpdateTarget = [T
                            || T = #teacher_target{finish = Finish}
                                   <- NewQuests,
                               not lists:member(Finish, [1, 2])],
            teacher_mgr:cast({update_student,
                              TRoleId,
                              SRoleId,
                              [{#student.target, UpdateTarget}]}),
            teacher:push_target(NewRole, SRoleId),
            NewRole
    end.

event(#evt_commit_quest{id = Target},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_commit_quest{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, [{type, Type}]) ->
    case quest_data:get(Id) of
        #quest_data{type = Type} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                ok -> ok;
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value}}
                    when Value + 1 >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, [{sec_type, Type}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = Type} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                ok -> ok;
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value}}
                    when Value + 1 >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id},
      Role = #role{m_quest =
                       #m_quest{quest_prac =
                                    #quest_prac{part = CurPart,
                                                chapter = CurChapter}}},
      Label, QuestId, ProgressId, _Target,
      [{quest_prac, Part, Chapter}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = SecType}
            when SecType =:= 5 orelse SecType =:= 6 ->
            case CurPart >= Part of
                true ->
                    case CurChapter > Chapter of
                        true ->
                            case fetch(Role, Label, QuestId, ProgressId) of
                                ok -> ok;
                                {false, _} -> remove;
                                {ok, _Quest, #quest_progress{finish = Finish}}
                                    when Finish =/= 0 ->
                                    remove;
                                {ok,
                                 Quest,
                                 P = #quest_progress{target_val = TargetVal,
                                                     value = Value}}
                                    when Value + 1 >= TargetVal ->
                                    NewP = P#quest_progress{finish = 1,
                                                            value = TargetVal,
                                                            trigger =
                                                                undefined},
                                    {remove,
                                     update(Role,
                                            Label,
                                            Quest,
                                            ProgressId,
                                            NewP)};
                                {ok,
                                 Quest,
                                 P = #quest_progress{value = Value}} ->
                                    NewP = P#quest_progress{finish = 0,
                                                            value = Value + 1},
                                    {ok,
                                     update(Role,
                                            Label,
                                            Quest,
                                            ProgressId,
                                            NewP)}
                            end;
                        false -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, [{quest_kill, Num}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 10} ->
            Count = quest_kill:get_total_num(Role),
            case Count >= Num of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        ok -> ok;
                        {false, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value}}
                            when Value + 1 >= TargetVal ->
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id},
      Role = #role{m_quest =
                       #m_quest{quest_guild = #quest_guild{round = CurRound}}},
      Label, QuestId, ProgressId, _Target,
      [{quest_guild, Round}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 12} ->
            case CurRound >= Round of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {false, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
                            when 1 >= TargetVal ->
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = OldVal}}
                            when 1 > OldVal ->
                            NewP = P#quest_progress{finish = 0, value = 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)};
                        _ -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id},
      Role = #role{m_quest =
                       #m_quest{quest_treasure =
                                    #quest_treasure{round = CurRound}}},
      Label, QuestId, ProgressId, _Target,
      [{quest_treasure, Round}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 11} ->
            case CurRound >= Round of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {false, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
                            when 1 >= TargetVal ->
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = OldVal}}
                            when 1 > OldVal ->
                            NewP = P#quest_progress{finish = 0, value = 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)};
                        _ -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id},
      Role = #role{m_quest =
                       #m_quest{quest_classes =
                                    #quest_classes{round = CurRound}}},
      Label, QuestId, ProgressId, _Target,
      [{quest_classes, Round}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 4} ->
            case CurRound >= Round of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {false, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
                            when 1 >= TargetVal ->
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = OldVal}}
                            when 1 > OldVal ->
                            NewP = P#quest_progress{finish = 0, value = 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)};
                        _ -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id},
      Role = #role{m_quest =
                       #m_quest{quest_pursue =
                                    #quest_pursue{round = CurRound}}},
      Label, QuestId, ProgressId, _Target,
      [{quest_pursue, Round}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 21} ->
            case CurRound >= Round of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {false, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
                            when 1 >= TargetVal ->
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = OldVal}}
                            when 1 > OldVal ->
                            NewP = P#quest_progress{finish = 0, value = 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)};
                        _ -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{sec_type = Target}, Role, Label,
      QuestId, ProgressId, Target, [sec_type]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_commit_quest{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case lists:member(Id, Param) of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                ok -> ok;
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value}}
                    when Value + 1 >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_kill_npc{base_id = BaseId}, Role,
      Label = quest_classes, QuestId, ProgressId, _Target,
      [{type, patrol}]) ->
    case unit_data:get(BaseId) of
        #unit_data{fun_type = 2} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                ok -> ok;
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value}}
                    when Value + 1 >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_kill_npc{base_id = BaseId},
      Role = #role{pos = #pos{map_base_id = MapBaseId}},
      Label = quest_guild, QuestId, ProgressId, _Target,
      [{type, patrol}]) ->
    case quest_guild_data:get_patrol(QuestId) of
        [] -> ok;
        L ->
            L1 = [UnitList
                  || #{map_base_id := MBaseId, unit_list := UnitList}
                         <- L,
                     MBaseId =:= MapBaseId],
            case lists:keyfind(BaseId, 1, lists:flatten(L1)) of
                {BaseId, _} ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        ok -> ok;
                        {false, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value}}
                            when Value + 1 >= TargetVal ->
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                _ -> ok
            end
    end;
event(#evt_kill_npc{base_id = BaseId},
      Role = #role{pos = #pos{map_base_id = MapBaseId}},
      Label = quest_pursue, QuestId, ProgressId, _Target,
      [{type, patrol}]) ->
    case quest_pursue_data:get_patrol(QuestId) of
        [] -> ok;
        L ->
            L1 = [UnitList
                  || #{map_base_id := MBaseId, unit_list := UnitList}
                         <- L,
                     MBaseId =:= MapBaseId],
            case lists:keyfind(BaseId, 1, lists:flatten(L1)) of
                {BaseId, _} ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        ok -> ok;
                        {false, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value}}
                            when Value + 1 >= TargetVal ->
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                _ -> ok
            end
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, Target, [])
    when BaseId =:= Target orelse Target =:= 0 ->
    case quest_data:get(QuestId) of
        #quest_data{sec_type = 14} ->
            case quest_chain:check_fight_finish(Role) of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        ok -> ok;
                        {false, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value}}
                            when Value + Num >= TargetVal ->
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + Num},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                false -> ok
            end;
        _False ->
            case fetch(Role, Label, QuestId, ProgressId) of
                ok -> ok;
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value}}
                    when Value + Num >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num,
                    ratio_val = RatioVal},
      Role, Label, QuestId, ProgressId, Target,
      [{quest_kill, lev, KillLev}])
    when BaseId =:= Target orelse Target =:= 0 ->
    case RatioVal >= KillLev of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                ok -> ok;
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value}}
                    when Value + Num >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        false -> ok
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num,
                    ratio_val = RatioVal},
      Role = #role{lev = Lev}, Label, QuestId, ProgressId,
      Target, [{quest_kill, diff_lev, DiffLev}])
    when BaseId =:= Target orelse Target =:= 0 ->
    case RatioVal >= Lev - DiffLev of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                ok -> ok;
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value}}
                    when Value + Num >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        false -> ok
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target, [{type, Type}]) ->
    case unit_data:get(BaseId) of
        #unit_data{type = Type} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                ok -> ok;
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value}}
                    when Value + Num >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, Target, _Param)
    when BaseId =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + Num >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_kill_npc{base_id = BaseId}, Role,
      Label = quest_offer, QuestId, ProgressId, _Target,
      [{fun_type, FunType}]) ->
    case unit_data:get(BaseId) of
        #unit_data{fun_type = FunType} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok, Quest, P = #quest_progress{target_val = TargetVal}}
                    when 1 >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ -> ok
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target,
      [{fun_type, FunType}]) ->
    case unit_data:get(BaseId) of
        #unit_data{fun_type = FunType} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                ok -> ok;
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value}}
                    when Value + Num >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target, Param = [_ | _]) ->
    case lists:member(BaseId, Param) of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                ok -> ok;
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value}}
                    when Value + Num >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_kill_npc{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_levup{lev = Lev}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when Lev >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_wing{grade = Grade, growth = Growth}, Role,
      Label, QuestId, ProgressId, _Target,
      [{growth, NeedGrowth}]) ->
    case Growth >= NeedGrowth of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok, Quest, P = #quest_progress{target_val = TargetVal}}
                    when Grade >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when Grade > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = Grade},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ -> ok
    end;
event(#evt_wing{grade = Grade}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when Grade >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Grade > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Grade},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_wing{}, _Role, _Label, _QuestId, _ProgressId,
      _Target, _) ->
    ok;
event(#evt_wing_lev{grade = Grade, star_lev = StarLev},
      Role, Label, QuestId, ProgressId, Target,
      [{star_lev, NeedLev}]) ->
    case StarLev >= NeedLev of
        true when Grade =:= Target ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok, Quest, P = #quest_progress{target_val = TargetVal}}
                    when 1 >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ when Grade > Target ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {false, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok, Quest, P = #quest_progress{target_val = TargetVal}}
                    when 1 >= TargetVal ->
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ -> ok
    end;
event(#evt_wing_lev{grade = Grade}, Role, Label,
      QuestId, ProgressId, Target, [])
    when Grade >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_wing_lev{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _) ->
    ok;
event(#evt_wing_reset{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dungeon_pass{}, Role = #role{}, Label,
      QuestId, ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dungeon_pass{id = DunId}, Role = #role{},
      Label, QuestId, ProgressId, DunId, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dungeon_pass{}, _Role, _Label, _QuestId,
      _ProgressId, _DunId, _Param) ->
    ok;
event(#evt_shipping_sail{type = Target},
      Role = #role{m_shipping =
                       #m_shipping{total_num = Count}},
      Label, QuestId, ProgressId, Target, _Param) ->
    logger:debug("远航[~ts]~w",
                 [Role#role.name, Count],
                 teacher_progress,
                 670),
    case fetch(Role, Label, QuestId, ProgressId) of
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when Count >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_shipping_sail{},
      Role = #role{m_shipping =
                       #m_shipping{total_num = Count}},
      Label, QuestId, ProgressId, _Target, _Param) ->
    logger:debug("远航[~ts]~w",
                 [Role#role.name, Count],
                 teacher_progress,
                 673),
    case fetch(Role, Label, QuestId, ProgressId) of
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when Count >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_trial{}, Role = #role{}, Label, QuestId,
      ProgressId, 0, [count]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_trial{mode = Target},
      Role = #role{m_trial = #m_trial{order = Order}}, Label,
      QuestId, ProgressId, Target, _Param) ->
    logger:debug("试炼[~ts]~w",
                 [Role#role.name, Order],
                 teacher_progress,
                 681),
    case fetch(Role, Label, QuestId, ProgressId) of
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when Order div 2 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Order div 2 > OldVal ->
            NewP = P#quest_progress{finish = 0,
                                    value = Order div 2},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_trial{},
      Role = #role{m_trial = #m_trial{order = Order}}, Label,
      QuestId, ProgressId, 0, _Param) ->
    logger:debug("试炼[~ts]~w",
                 [Role#role.name, Order],
                 teacher_progress,
                 684),
    case fetch(Role, Label, QuestId, ProgressId) of
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when Order div 2 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Order div 2 > OldVal ->
            NewP = P#quest_progress{finish = 0,
                                    value = Order div 2},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_trial{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_treasure{},
      Role = #role{name = _Name,
                   m_treasure = #m_treasure{total_count = Count}},
      Label, QuestId, ProgressId, 0, _Param) ->
    logger:debug("挖宝任务[~ts]~w",
                 [_Name, Count],
                 teacher_progress,
                 690),
    case fetch(Role, Label, QuestId, ProgressId) of
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when Count >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_treasure{base_id = Target},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      Target, _Param) ->
    logger:debug("=============================================",
                 [],
                 teacher_progress,
                 694),
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_treasure{}, Role, Label, QuestId, ProgressId,
      _Target, _Param) ->
    logger:debug("=============================================",
                 [],
                 teacher_progress,
                 697),
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_tower{}, Role = #role{}, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_tower_floor{floor = Floor}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when Floor >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Floor > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Floor},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_arena_fight{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_eqm{},
      Role = #role{p_eqm = #package{items = Eqms}}, Label,
      QuestId, ProgressId, _, [{eqm_lev, Conds}]) ->
    case lists:keytake(lev, 1, Conds) of
        {value, {lev, RequireLev}, [{num, RequireNum}]} ->
            RequireEqms = [1
                           || #item{lev = Lev} <- Eqms, Lev >= RequireLev],
            case length(RequireEqms) >= RequireNum of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {false, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
                            when 1 >= TargetVal ->
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = OldVal}}
                            when 1 > OldVal ->
                            NewP = P#quest_progress{finish = 0, value = 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)};
                        _ -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_eqm{},
      Role = #role{p_eqm = #package{items = Eqms}}, Label,
      QuestId, ProgressId, _, [{eqm_lev_num, RequireLev}]) ->
    RequireEqms = [1
                   || #item{lev = Lev} <- Eqms, Lev >= RequireLev],
    Num = length(RequireEqms),
    case fetch(Role, Label, QuestId, ProgressId) of
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when Num >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_eqm{}, _Role, _Label, _QuestId, _ProgressId,
      _, _Param) ->
    ok;
event(#evt_kill_treasure_ghost{}, Role, Label, QuestId,
      ProgressId, _, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_quest_treasure{}, Role, Label, QuestId,
      ProgressId, _, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enchant{}, Role = #role{name = _Name}, Label,
      QuestId, ProgressId, 0, _Param) ->
    logger:debug("强化任务[~ts]~w",
                 [_Name, {1111}],
                 teacher_progress,
                 744),
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enchant{},
      Role = #role{name = _Name,
                   p_eqm = #package{items = Items}},
      Label, QuestId, ProgressId, Target, _Param) ->
    Count = erlang:length([1
                           || #item{enchant = Enchant} <- Items,
                              Enchant >= Target]),
    logger:debug("强化任务[~ts]~w",
                 [_Name, {Count, Target}],
                 teacher_progress,
                 748),
    case fetch(Role, Label, QuestId, ProgressId) of
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when Count >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_enchant{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_quest_offer_teacher{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_boss_teacher{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_constellation_kill{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_tower_teacher{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        ok -> ok;
        {false, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value}}
            when Value + 1 >= TargetVal ->
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(_, _Role, _Label, _QuestId, _ProgressId, _, _) ->
    logger:debug("=============================================",
                 [],
                 teacher_progress,
                 766),
    remove.

