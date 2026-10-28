-file("src/mod/teacher/teacher.erl", 1).

-module(teacher).

-export([init/0,
         login/1,
         zero_flush/2,
         apply_start/2,
         start/3,
         apply_agree/2,
         agree/3,
         apply_student/2,
         quit/3,
         apply_quit_student/2,
         apply_quit_teacher/3,
         teacher_in_team/1,
         get_daily/2,
         get_target/2,
         target_reward/3,
         target_reward_apply/4,
         encourage/2,
         encourage_apply/2,
         quit_reply/2,
         apply_quit_reply/5,
         evaluation/3,
         evaluation_apply/2,
         sign/2,
         push/1,
         push_sign/1,
         get_sign_list/3,
         get_sign_list2/1,
         logout/1,
         push_daily/2,
         push_target/2,
         push_teacher_info/1,
         apply_evt/2,
         teacher_update_name/3,
         set_name/1,
         update_fc/1,
         target_reward_teacher/3,
         target_reward_teacher_apply/2,
         gm/2,
         teacher_reward_target/3,
         get_teacher_min_lev/0,
         push_point_flag/1,
         teacher_check/1,
         get_exp/1,
         get_num/1,
         update_student_score/3,
         auto_quit_teacher/1,
         is_teacher_relation/2,
         get_student_sign_list/1,
         daily_goal_reward_apply/2,
         role_week_five/2,
         get_teacher_gain/2,
         push15824/1]).

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

-file("src/mod/teacher/teacher.erl", 64).

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

-file("src/mod/teacher/teacher.erl", 65).

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

-file("src/mod/teacher/teacher.erl", 66).

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

-file("src/mod/teacher/teacher.erl", 67).

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

-file("src/mod/teacher/teacher.erl", 68).

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

-file("src/mod/teacher/teacher.erl", 69).

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

-file("src/mod/teacher/teacher.erl", 70).

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

-file("src/mod/teacher/teacher.erl", 71).

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

-file("src/mod/teacher/teacher.erl", 72).

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

-file("src/mod/teacher/teacher.erl", 73).

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

-file("src/mod/teacher/teacher.erl", 74).

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

-file("src/mod/teacher/teacher.erl", 75).

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

-file("src/mod/teacher/teacher.erl", 76).

init() -> #m_teacher{}.

login(Role = #role{id = TRoleId, pid = Pid,
                   name = TName, lev = Lev, classes = Classes,
                   m_teacher =
                       MTeacher = #m_teacher{id = TeacherRoleId,
                                             target = Target,
                                             status = Status = 3}}) ->
    Now = date:unixtime(),
    case teacher_mgr:lookup(TRoleId) of
        #teacher{teacher_score = TeacherScore,
                 students = Students,
                 teacher_score_offline = TeacherScoreOffline} ->
            Length = length([1
                             || #student{status = 2} <- Students]),
            role_trigger:async_fire(self(),
                                    [#evt_teacher_student{num = Length}]),
            Gain = format:val_to_gain([{90019,
                                        TeacherScoreOffline}]),
            {TRole, NewTarget} = teacher_progress:add_event(Role,
                                                            target,
                                                            Target,
                                                            []),
            NewMTeacher = MTeacher#m_teacher{target = NewTarget},
            TRole2 = TRole#role{m_teacher = NewMTeacher},
            teacher_mgr:cast({update_student,
                              TeacherRoleId,
                              TRoleId,
                              [{#student.target, NewTarget}]}),
            NRole1 = case role_gain:do(Gain, TRole2) of
                         {ok, NRole} -> NRole;
                         _ -> Role
                     end,
            Honor = teacher_data:get_teacher_honor(TeacherScore),
            case honor:has_honor(Role, Honor) of
                true -> ignore;
                _ -> honor:add_and_use(Pid, Honor, push)
            end,
            teacher_mgr:cast({login,
                              #{id => TRoleId, name => TName,
                                classes => Classes, lev => Lev,
                                status => Status, now => Now}}),
            teacher_mgr:cast({update_teacher,
                              TRoleId,
                              [{#teacher.teacher_score_offline, 0},
                               {#teacher.login_time, Now},
                               {#teacher.name, TName},
                               {#teacher.classes, Classes},
                               {#teacher.lev, Lev}]}),
            levup_update_sign(NRole1),
            login2(NRole1);
        _ ->
            Honors = teacher_data:teacher_honors(),
            {ok, NRole} = honor:del(Role, Honors, push),
            NewMTeacher = MTeacher#m_teacher{status = 0},
            NewRole = NRole#role{m_teacher = NewMTeacher},
            push(NewRole),
            teacher_mgr:cast({login,
                              #{id => TRoleId, status => Status, now => Now}}),
            levup_update_sign(NewRole),
            login2(NewRole)
    end;
login(Role = #role{id = SRoleId, name = TName,
                   lev = Lev,
                   m_teacher =
                       MTeacher = #m_teacher{id = TRoleId, daily = OldDaily,
                                             target = TTarget,
                                             daily_time = DailyTime,
                                             status = Status = 1}}) ->
    Now = date:unixtime(),
    case teacher_mgr:lookup(TRoleId) of
        #teacher{name = NewTName, students = Students} ->
            case lists:keyfind(SRoleId, #student.id, Students) of
                #student{daily_reward = DailyReward} ->
                    TTarget1 = teacher_progress:reverse(Role,
                                                        target,
                                                        TTarget,
                                                        []),
                    logger:debug("目标信息列表:~w", [TTarget1], teacher, 128),
                    Target = teacher_progress:init_event(Role,
                                                         TTarget1,
                                                         []),
                    logger:debug("目标信息列表:~w", [Target], teacher, 130),
                    case date:is_same_day(Now, DailyTime) of
                        true ->
                            OldDaily2 = teacher_progress:reverse(Role,
                                                                 daily,
                                                                 OldDaily,
                                                                 []),
                            TRole = teacher_progress:del_event(Role),
                            {NRole1, NewDaily} =
                                teacher_progress:add_event(TRole,
                                                           daily,
                                                           OldDaily2,
                                                           []),
                            {NRole2, NewTarget} =
                                teacher_progress:add_event(NRole1,
                                                           target,
                                                           Target,
                                                           []),
                            logger:debug("目标信息列表:~w",
                                         [NewTarget],
                                         teacher,
                                         137),
                            NewMTeacher = MTeacher#m_teacher{name = NewTName,
                                                             daily = NewDaily,
                                                             daily_time = Now,
                                                             target = NewTarget,
                                                             daily_reward =
                                                                 DailyReward},
                            NewRole = NRole2#role{m_teacher = NewMTeacher},
                            push(NewRole),
                            teacher_mgr:cast({update_student,
                                              TRoleId,
                                              SRoleId,
                                              [{#student.login_time, Now}]}),
                            teacher_mgr:cast({login,
                                              #{id => SRoleId,
                                                teacher_id => TRoleId,
                                                status => Status, now => Now}}),
                            login2(NewRole);
                        _ ->
                            TRole = teacher_progress:del_event(Role),
                            Daily = get_daily(TRole),
                            DailyGoals = get_daily_goal(TRole),
                            {NRole1, NewDaily} =
                                teacher_progress:add_event(TRole,
                                                           daily,
                                                           Daily ++ DailyGoals,
                                                           []),
                            {NRole2, NewTarget} =
                                teacher_progress:add_event(NRole1,
                                                           target,
                                                           Target,
                                                           []),
                            NewMTeacher = MTeacher#m_teacher{name = NewTName,
                                                             daily = NewDaily,
                                                             daily_reward = 0,
                                                             daily_time = Now,
                                                             target =
                                                                 NewTarget},
                            NewRole = NRole2#role{m_teacher = NewMTeacher},
                            push(NewRole),
                            teacher_mgr:cast({update_student,
                                              TRoleId,
                                              SRoleId,
                                              [{#student.login_time, Now},
                                               {#student.name, TName},
                                               {#student.daily, NewDaily},
                                               {#student.daily_time, Now},
                                               {#student.target, NewTarget},
                                               {#student.daily_reward, 0}]}),
                            teacher_mgr:cast({login,
                                              #{id => SRoleId,
                                                teacher_id => TRoleId,
                                                status => Status, now => Now}}),
                            case [1
                                  || #teacher_daily{id = Id, finish = 0}
                                         <- OldDaily,
                                     Id =/= 11]
                                of
                                [] when DailyReward == 0 ->
                                    case teacher_data:get_daily_reward({1,
                                                                        Lev,
                                                                        3})
                                        of
                                        {StudentRewards, ExpRate} ->
                                            AddExp = teacher:get_exp(#{mode =>
                                                                           3306,
                                                                       lev =>
                                                                           Lev,
                                                                       rate =>
                                                                           ExpRate}),
                                            mail:send(SRoleId,
                                                      lang:get("日常功课"),
                                                      lang:get("由于师傅没有及时对你的日常作业进行验收，只能获得基础奖励{face_1,21}"),
                                                      StudentRewards ++ AddExp);
                                        _ -> ignore
                                    end;
                                _ -> ignore
                            end,
                            login2(NewRole)
                    end;
                _ ->
                    {ok, NRole} = honor:del(Role, 11080, push),
                    NRole1 = teacher_progress:del_event(NRole),
                    NewMTeacher = MTeacher#m_teacher{id = {0, "", 0},
                                                     name = "", status = 0,
                                                     daily = [], daily_time = 0,
                                                     target = [],
                                                     study_lev = 0},
                    NewRole = NRole1#role{m_teacher = NewMTeacher},
                    push(NewRole),
                    friend_zone:update(NewRole, teacher, ""),
                    login2(NewRole)
            end;
        _ ->
            {ok, NRole} = honor:del(Role, 11080, push),
            NRole1 = teacher_progress:del_event(NRole),
            NewMTeacher = MTeacher#m_teacher{id = {0, "", 0},
                                             name = "", status = 0, daily = [],
                                             daily_time = 0, target = [],
                                             study_lev = 0},
            NewRole = NRole1#role{m_teacher = NewMTeacher},
            push(NewRole),
            friend_zone:update(NewRole, teacher, ""),
            login2(NewRole)
    end;
login(Role = #role{id = RoleId, name = TName, sex = Sex,
                   lev = Lev, classes = Classes,
                   m_teacher = #m_teacher{status = Status}}) ->
    case teacher_mgr:lookup(teacher_sign, RoleId) of
        #teacher_sign{} ->
            Now = date:unixtime(),
            teacher_mgr:cast({login,
                              #{id => RoleId, status => Status, now => Now}});
        _ -> levup_update_sign(Role)
    end,
    case check_student_sign(Role) of
        true ->
            Msg = get_studen_sign_msg(Classes),
            teacher_mgr:cast({student_signin,
                              #{id => RoleId, name => TName, sex => Sex,
                                lev => Lev, classes => Classes, msg => Msg}});
        false -> ignore
    end,
    login2(Role).

login2(Role) ->
    L = [#trigger{label = evt_levup, a = [], m = teacher,
                  f = apply_evt}],
    {_, NRole} = role_trigger:add(L, Role),
    {ok, NRole}.

logout(#role{id = RoleId}) ->
    case teacher_mgr:lookup(teacher_sign, RoleId) of
        #teacher_sign{} ->
            Now = date:unixtime(),
            teacher_mgr:cast({logout, #{id => RoleId, now => Now}});
        _ -> ignore
    end,
    ok.

role_week_five(Role = #role{m_teacher =
                                MTeacher = #m_teacher{}},
               _) ->
    NMTeacher = MTeacher#m_teacher{goals_times = 0},
    NRole = Role#role{m_teacher = NMTeacher},
    {ok, NRole};
role_week_five(_Role, _) -> {ok, _Role}.

is_teacher_relation(#role{m_teacher =
                              #m_teacher{id = RoleId, status = 3}},
                    RoleId) ->
    {true, teacher};
is_teacher_relation(#role{m_teacher =
                              #m_teacher{id = RoleId, status = 1}},
                    RoleId) ->
    {true, teacher};
is_teacher_relation(#role{m_teacher =
                              #m_teacher{id = RoleId, status = 2}},
                    RoleId) ->
    false;
is_teacher_relation(#role{id = TRoleId,
                          m_teacher = #m_teacher{status = 3}},
                    RoleId) ->
    case teacher_mgr:lookup(TRoleId) of
        #teacher{students = Students} ->
            case lists:keyfind(RoleId, #student.id, Students) of
                #student{status = 1} -> {true, student};
                #student{status = 3} -> {true, student};
                #student{status = _Status} ->
                    logger:debug("the status is :~w",
                                 [_Status],
                                 teacher,
                                 262),
                    false;
                _ -> false
            end;
        _ -> false
    end;
is_teacher_relation(_, _) -> false.

is_hava_student_sutudy(#role{id = TRoleId,
                             m_teacher = #m_teacher{status = 3}}) ->
    case teacher_mgr:lookup(TRoleId) of
        #teacher{students = Students} ->
            case [false
                  || #student{status = Status} <- Students, Status =:= 1]
                of
                [] -> false;
                _ -> true
            end;
        _ -> false
    end;
is_hava_student_sutudy(_Role) -> false.

apply_evt(#evt_levup{},
          Role = #role{id = RoleId, lev = Lev,
                       m_teacher = #m_teacher{id = TRoleId, status = 1}}) ->
    teacher_mgr:cast({update_student,
                      TRoleId,
                      RoleId,
                      [{#student.lev, Lev}]}),
    case get_auto_quit_lev(Role) =< Lev of
        true ->
            role:apply(async,
                       self(),
                       {teacher, auto_quit_teacher, []}),
            levup_update_sign(Role);
        _ ->
            case get_student_end_lev(Role) of
                Lev ->
                    mail:send(RoleId,
                              lang:get("出师提醒"),
                              notice:format(lang:get("恭喜您的升级已经达到~ts级，可以出师了。和您的师傅组队前往<color='#00ff00"
                                                     "'>导师德林</color>处，由师傅选择带徒出师即可。出师后师徒双方都可以获得丰厚的出师"
                                                     "奖励"),
                                            [{string_2, 1, Lev}])),
                    mail:send(TRoleId,
                              lang:get("出师提醒"),
                              notice:format(lang:get("您的弟子~ts已经达到~ts级，可以出师了。和他组队前往<color='#00ff00'>"
                                                     "导师德林</color>处选择带徒出师即可。出师后师徒双方都可以获得丰厚的出师奖励"),
                                            [{role_2, Role},
                                             {string_2, 1, Lev}]));
                _ -> ok
            end,
            case get_auto_quit_lev(Role) - 1 of
                Lev ->
                    mail:send(RoleId,
                              lang:get("自动出师提醒"),
                              notice:format(lang:get("恭喜您的升级已经达到~ts级，当您的等级达到~ts级时，将自动出师。自动出师您将获得正常的"
                                                     "出师奖励，而师傅只能获得基础奖励，赶紧联系您的师傅组队前往<color='#00ff00'"
                                                     ">导师德林</color>处，进行出师吧"),
                                            [{string_2, 1, Lev},
                                             {string_2, 1, Lev + 1}])),
                    mail:send(TRoleId,
                              lang:get("自动出师提醒"),
                              notice:format(lang:get("您的弟子~ts已经达到~ts级，当弟子等级达到~ts级时，弟子将自动出师。自动出师时，师傅"
                                                     "只能获得基础出师奖励哦。赶紧和他组队前往<color='#00ff00'>导师德林</co"
                                                     "lor>处进行出师吧"),
                                            [{role_2, Role},
                                             {string_2, 1, Lev},
                                             {string_2, 1, Lev + 1}]));
                _ -> ignore
            end
    end,
    ok;
apply_evt(#evt_levup{},
          #role{id = RoleId, lev = Lev,
                m_teacher = #m_teacher{id = TRoleId, status = 2}}) ->
    teacher_mgr:cast({update_student,
                      TRoleId,
                      RoleId,
                      [{#student.lev, Lev}]}),
    ok;
apply_evt(#evt_levup{},
          Role = #role{id = RoleId, lev = Lev,
                       m_teacher = #m_teacher{id = TRoleId, status = 3}}) ->
    teacher_mgr:cast({update_teacher,
                      RoleId,
                      [{#teacher.lev, Lev}]}),
    case TRoleId of
        {0, _, _} -> ignore;
        _ ->
            teacher_mgr:cast({update_student,
                              TRoleId,
                              RoleId,
                              [{#student.lev, Lev}]})
    end,
    levup_update_sign(Role),
    ok;
apply_evt(#evt_levup{},
          Role = #role{id = RoleId, name = TName, sex = Sex,
                       lev = Lev, classes = Classes,
                       m_teacher = #m_teacher{status = 0}}) ->
    case check_student_sign(Role) of
        true ->
            Msg = get_studen_sign_msg(Classes),
            teacher_mgr:cast({student_signin,
                              #{id => RoleId, name => TName, sex => Sex,
                                lev => Lev, classes => Classes, msg => Msg}});
        false ->
            teacher_mgr:cast({student_signout, #{id => RoleId}})
    end,
    ok;
apply_evt(#evt_levup{}, Role) ->
    levup_update_sign(Role),
    ok;
apply_evt(_, _Role) -> ok.

teacher_update_name(Role = #role{m_teacher =
                                     MTeacher = #m_teacher{id = TRoleId,
                                                           status = 1}},
                    TRoleId, Name) ->
    NewMTeacher = MTeacher#m_teacher{name = Name},
    Role1 = Role#role{m_teacher = NewMTeacher},
    NewRole = looks:calc(Role1),
    map:role_update(NewRole),
    push(NewRole),
    {ok, NewRole};
teacher_update_name(_, _, _) -> ok.

update_fc(#role{attr = #attr{fc = Fc}, id = RoleId,
                m_teacher = #m_teacher{id = TRoleId, status = 1}}) ->
    teacher_mgr:cast({update_student,
                      TRoleId,
                      RoleId,
                      [{#student.fc, Fc}]}),
    ok;
update_fc(#role{id = RoleId, attr = #attr{fc = Fc},
                m_teacher = #m_teacher{status = 3}}) ->
    teacher_mgr:cast({update_teacher,
                      RoleId,
                      [{#teacher.fc, Fc}]}),
    ok;
update_fc(#role{id = RoleId, lev = Lev}) ->
    teacher_mgr:cast({update_sign,
                      RoleId,
                      [{#teacher_sign.lev, Lev}]}),
    ok.

gm(Role = #role{id = RoleId,
                m_teacher =
                    MTeacher = #m_teacher{id = TRoleId, daily = Daily}},
   finish_daily) ->
    NewDaily = [D#teacher_daily{finish = 1} || D <- Daily],
    teacher_mgr:cast({update_student,
                      TRoleId,
                      RoleId,
                      [{#student.daily, NewDaily}]}),
    NewMTeacher = MTeacher#m_teacher{daily = NewDaily},
    NewRole = Role#role{m_teacher = NewMTeacher},
    push(NewRole),
    push_daily(NewRole, RoleId),
    {ok, NewRole};
gm(Role = #role{id = RoleId,
                m_teacher =
                    MTeacher = #m_teacher{id = TRoleId,
                                          daily_time = DailyTime}},
   daily_before) ->
    NewDailyTime = DailyTime - 86400,
    teacher_mgr:cast({update_student,
                      TRoleId,
                      RoleId,
                      [{#student.daily_time, NewDailyTime}]}),
    NewMTeacher = MTeacher#m_teacher{daily_time =
                                         NewDailyTime},
    NewRole = Role#role{m_teacher = NewMTeacher},
    push(NewRole),
    push_daily(NewRole, RoleId),
    {ok, NewRole};
gm(Role = #role{id = RoleId,
                m_teacher = #m_teacher{id = TRoleId}},
   {student_score, Score}) ->
    teacher_mgr:cast({update_student,
                      TRoleId,
                      RoleId,
                      add_score,
                      Score}),
    {ok, Role};
gm(Role, _Label) -> {ok, Role}.

-spec set_name(#role{}) -> ok.

set_name(#role{id = RoleId, name = Name,
               m_teacher = #m_teacher{id = TRoleId, status = 2}}) ->
    teacher_mgr:cast({update_student,
                      TRoleId,
                      RoleId,
                      [{#student.name, Name}]}),
    ok;
set_name(#role{id = RoleId, name = Name,
               m_teacher = #m_teacher{id = TRoleId, status = 1}}) ->
    teacher_mgr:cast({update_student,
                      TRoleId,
                      RoleId,
                      [{#student.name, Name}]}),
    ok;
set_name(#role{id = RoleId, name = Name,
               m_teacher = #m_teacher{id = TRoleId, status = 3}}) ->
    teacher_mgr:cast({update_teacher,
                      RoleId,
                      [{#teacher.name, Name}]}),
    teacher_mgr:cast({update_sign,
                      RoleId,
                      [{#teacher_sign.name, Name}]}),
    teacher_mgr:cast({update_student,
                      TRoleId,
                      RoleId,
                      [{#student.name, Name}]}),
    ok;
set_name(#role{id = RoleId, name = Name}) ->
    teacher_mgr:cast({update_sign,
                      RoleId,
                      [{#teacher_sign.name, Name}]}),
    ok.

zero_flush(Role = #role{id = SRoleId, lev = Lev,
                        m_teacher =
                            MTeacher = #m_teacher{id = TRoleId,
                                                  daily = OldDaily,
                                                  daily_reward = DailyReward,
                                                  target = TTarget,
                                                  status = Status = 1}},
           _) ->
    case [1
          || #teacher_daily{id = Id, finish = 0} <- OldDaily,
             Id =/= 11]
        of
        [] when DailyReward == 0 ->
            case teacher_data:get_daily_reward({1, Lev, 3}) of
                {StudentRewards, ExpRate} ->
                    AddExp = teacher:get_exp(#{mode => 3306, lev => Lev,
                                               rate => ExpRate}),
                    mail:send(SRoleId,
                              lang:get("日常功课"),
                              lang:get("由于师傅没有及时对你的日常作业进行验收，只能获得基础奖励{face_1,21}"),
                              StudentRewards ++ AddExp);
                _ -> ignore
            end;
        _ -> ignore
    end,
    Now = date:unixtime(),
    NRole = teacher_progress:del_event(Role),
    Daily = get_daily(Role),
    DailyGoals = get_daily_goal(Role),
    Target = teacher_progress:reverse(Role,
                                      target,
                                      TTarget,
                                      []),
    {NRole1, NewDaily} = teacher_progress:add_event(NRole,
                                                    daily,
                                                    Daily ++ DailyGoals,
                                                    []),
    {NRole2, NewTarget} = teacher_progress:add_event(NRole1,
                                                     target,
                                                     Target,
                                                     []),
    NewMTeacher = MTeacher#m_teacher{daily = NewDaily,
                                     daily_reward = 0, daily_time = Now,
                                     target = NewTarget},
    NewRole = NRole2#role{m_teacher = NewMTeacher},
    push(NewRole),
    push_daily(NewRole, SRoleId),
    push_target(NewRole, SRoleId),
    teacher_mgr:cast({update_student,
                      TRoleId,
                      SRoleId,
                      [{#student.login_time, Now},
                       {#student.daily, NewDaily},
                       {#student.daily_time, Now},
                       {#student.target, NewTarget},
                       {#student.daily_reward, 0}]}),
    teacher_mgr:cast({login,
                      #{id => SRoleId, teacher_id => TRoleId,
                        status => Status, now => Now}}),
    {ok, NewRole};
zero_flush(Role = #role{id = SRoleId,
                        m_teacher =
                            MTeacher = #m_teacher{id = TRoleId,
                                                  target = TTarget,
                                                  status = 2}},
           _) ->
    Now = date:unixtime(),
    NRole = teacher_progress:del_event(Role),
    DailyGoals = get_daily_goal(Role),
    Target = teacher_progress:reverse(Role,
                                      target,
                                      TTarget,
                                      []),
    {NRole1, NewDaily} = teacher_progress:add_event(NRole,
                                                    daily,
                                                    DailyGoals,
                                                    []),
    {NRole2, NewTarget} = teacher_progress:add_event(NRole1,
                                                     target,
                                                     Target,
                                                     []),
    NewMTeacher = MTeacher#m_teacher{daily = NewDaily,
                                     daily_reward = 0, daily_time = Now,
                                     target = NewTarget},
    NewRole = NRole2#role{m_teacher = NewMTeacher},
    push(NewRole),
    push_daily(NewRole, SRoleId),
    push_target(NewRole, SRoleId),
    teacher_mgr:cast({update_student,
                      TRoleId,
                      SRoleId,
                      [{#student.login_time, Now},
                       {#student.daily, NewDaily},
                       {#student.daily_time, Now},
                       {#student.target, NewTarget},
                       {#student.daily_reward, 0}]}),
    {ok, NewRole};
zero_flush(Role = #role{id = SRoleId,
                        m_teacher = #m_teacher{status = Status = 3}},
           _) ->
    Now = date:unixtime(),
    teacher_mgr:cast({login,
                      #{id => SRoleId, status => Status, now => Now}}),
    {ok, Role};
zero_flush(Role, _) -> {ok, Role}.

push(#role{m_teacher =
               #m_teacher{id = Id, name = Name, status = Status,
                          evaluation = Evaluation, study_lev = StudyLev,
                          mtime = MTime}}) ->
    sys_conn:pack_send(15804,
                       {Id, Name, Status, Evaluation, StudyLev, MTime}),
    ok.

push_sign(#role{id = RoleId}) ->
    case teacher_mgr:lookup(teacher_sign, RoleId) of
        #teacher_sign{is_sign = 1} ->
            sys_conn:pack_send(15815, {1});
        _ -> sys_conn:pack_send(15815, {0})
    end,
    ok.

push_daily(#role{id = RoleId,
                 m_teacher =
                     #m_teacher{id = TRoleId, status = Status, daily = Daily,
                                daily_reward = DailyReward},
                 attr = #attr{fc = _Fc}, name = _Name, sex = _Sex,
                 classes = _Classes, lev = _Lev},
           RoleId)
    when Status =:= 1 orelse Status =:= 2 ->
    case teacher_mgr:lookup(TRoleId) of
        #teacher{name = TName, sex = TSex, classes = TClasses,
                 lev = TLev, fc = TFc} ->
            push_daily(#{id => TRoleId, target_id => RoleId,
                         name => TName, sex => TSex, classes => TClasses,
                         lev => TLev, fc => TFc, daily => Daily,
                         daily_reward => DailyReward},
                       conn);
        _ -> notice:return(lang:get("没有找到师傅"))
    end,
    ok;
push_daily(#role{id = RoleId, pid = Pid,
                 m_teacher = #m_teacher{status = 3}},
           OtherRoleId) ->
    teacher_mgr:cast({push_daily,
                      #{pid => Pid, teacher_id => RoleId, role_id => RoleId,
                        target_id => OtherRoleId}}),
    ok;
push_daily(#role{pid = Pid, id = RoleId,
                 m_teacher = #m_teacher{id = TRoleId, status = Status}},
           OtherRoleId)
    when Status > 0 ->
    teacher_mgr:cast({push_daily,
                      #{pid => Pid, teacher_id => TRoleId, role_id => RoleId,
                        target_id => OtherRoleId}}),
    ok;
push_daily(#{id := RoleId, name := Name, sex := Sex,
             classes := Classes, lev := Lev, fc := Fc,
             daily := Daily, daily_reward := DailyReward,
             target_id := TargetId},
           conn) ->
    logger:debug("~w",
                 [{TargetId,
                   RoleId,
                   Name,
                   Sex,
                   Classes,
                   Lev,
                   Fc,
                   Daily,
                   DailyReward}],
                 teacher,
                 487),
    sys_conn:pack_send(15805,
                       {TargetId,
                        RoleId,
                        Name,
                        Sex,
                        Classes,
                        Lev,
                        Fc,
                        Daily,
                        DailyReward});
push_daily(#{id := RoleId, name := Name, sex := Sex,
             classes := Classes, lev := Lev, fc := Fc,
             daily := Daily, daily_reward := DailyReward,
             target_id := TargetId},
           Pid) ->
    logger:debug("~w",
                 [{Pid,
                   TargetId,
                   RoleId,
                   Name,
                   Sex,
                   Classes,
                   Lev,
                   Fc,
                   Daily,
                   DailyReward}],
                 teacher,
                 490),
    role:pack_send(Pid,
                   15805,
                   {TargetId,
                    RoleId,
                    Name,
                    Sex,
                    Classes,
                    Lev,
                    Fc,
                    Daily,
                    DailyReward});
push_daily(_, _OtherRoleId) -> ok.

push_target(#role{id = RoleId,
                  m_teacher =
                      #m_teacher{status = Status, target = Target,
                                 target_reward = TargetReward,
                                 target_rewarded = TargetRewarded,
                                 id = TRoleId},
                  attr = #attr{fc = _Fc}, name = _Name, sex = _Sex,
                  classes = _Classes, lev = _Lev},
            RoleId)
    when Status == 1 orelse
             Status == 2 orelse Status == 3 ->
    case teacher_mgr:lookup(TRoleId) of
        #teacher{name = TName, sex = TSex, classes = TClasses,
                 lev = TLev, fc = TFc} ->
            push_target(#{id => TRoleId, name => TName, sex => TSex,
                          classes => TClasses, lev => TLev, fc => TFc,
                          target => Target, target_reward => TargetReward,
                          target_rewarded => TargetRewarded,
                          target_id => RoleId},
                        conn);
        _ -> ignore
    end,
    ok;
push_target(#role{id = RoleId, pid = Pid,
                  m_teacher = #m_teacher{status = 3}},
            OtherRoleId) ->
    logger:debug("============================================="
                 "=========",
                 [],
                 teacher,
                 506),
    teacher_mgr:cast({push_target,
                      #{pid => Pid, teacher_id => RoleId, role_id => RoleId,
                        target_id => OtherRoleId}}),
    ok;
push_target(#role{pid = Pid, id = RoleId,
                  m_teacher = #m_teacher{id = TRoleId, status = Status}},
            OtherRoleId)
    when Status > 0 ->
    logger:debug("============================================="
                 "=========",
                 [],
                 teacher,
                 510),
    teacher_mgr:cast({push_target,
                      #{pid => Pid, teacher_id => TRoleId, role_id => RoleId,
                        target_id => OtherRoleId}}),
    ok;
push_target(#{id := RoleId, name := Name, sex := Sex,
              classes := Classes, lev := Lev, fc := Fc,
              target := Target, target_reward := TargetReward,
              target_rewarded := TargetRewarded,
              target_id := TargetId},
            conn) ->
    logger:debug("============================================="
                 "=========",
                 [],
                 teacher,
                 514),
    sys_conn:pack_send(15806,
                       {TargetId,
                        RoleId,
                        Name,
                        Sex,
                        Classes,
                        Lev,
                        Fc,
                        Target,
                        TargetReward,
                        TargetRewarded});
push_target(#{id := RoleId, name := Name, sex := Sex,
              classes := Classes, lev := Lev, fc := Fc,
              target := Target, target_reward := TargetReward,
              target_rewarded := TargetRewarded,
              target_id := TargetId},
            Pid) ->
    logger:debug("============================================="
                 "=========",
                 [],
                 teacher,
                 517),
    role:pack_send(Pid,
                   15806,
                   {TargetId,
                    RoleId,
                    Name,
                    Sex,
                    Classes,
                    Lev,
                    Fc,
                    Target,
                    TargetReward,
                    TargetRewarded});
push_target(_, _OtherRoleId) ->
    logger:debug("============================================="
                 "=========",
                 [],
                 teacher,
                 520),
    ok.

push_teacher_info(#role{id = RoleId, pid = Pid,
                        m_teacher = #m_teacher{status = 3}}) ->
    teacher_mgr:cast({push_teacher_info,
                      #{teacher_id => RoleId, pid => Pid}}),
    ok;
push_teacher_info(#role{id = __RoleId, pid = Pid,
                        m_teacher = #m_teacher{id = TRoleId, status = 2}}) ->
    teacher_mgr:cast({push_teacher_info,
                      #{teacher_id => TRoleId, pid => Pid}}),
    ok;
push_teacher_info(#role{pid = Pid,
                        m_teacher = #m_teacher{id = TRoleId, status = 1}}) ->
    teacher_mgr:cast({push_teacher_info,
                      #{teacher_id => TRoleId, pid => Pid}}),
    ok;
push_teacher_info(_) -> ok.

get_num(_) -> 0.

push_point_flag(#role{id = RoleId,
                      m_teacher =
                          #m_teacher{status = Status, daily = Daily,
                                     daily_time = DailyTime, target = Target}})
    when Status == 1 orelse Status == 2 ->
    Now = date:unixtime(),
    NewDaily = case date:is_same_day(Now, DailyTime) of
                   true -> Daily;
                   _ -> []
               end,
    Flag1 = case get_point_flag(NewDaily ++ Target) of
                true -> [{RoleId, 1}];
                _ -> []
            end,
    sys_conn:pack_send(15820, {Flag1});
push_point_flag(_Role = #role{id = RoleId,
                              m_teacher =
                                  #m_teacher{status = 3, target = Target}}) ->
    Now = date:unixtime(),
    Flag1 = case get_point_flag(Target) of
                true -> [{RoleId, 1}];
                _ -> []
            end,
    Flag2 = case teacher_mgr:lookup(RoleId) of
                #teacher{students = Students} ->
                    get_student_point_flag(Students, Now, []);
                _ -> []
            end,
    sys_conn:pack_send(15820, {Flag1 ++ Flag2});
push_point_flag(#role{}) ->
    sys_conn:pack_send(15820, {[]}).

start(#role{id = OtherRoleId}, OtherRoleId, _) ->
    {false, lang:get("自己能收自己做徒弟")};
start(#role{m_wedding =
                #m_wedding{lover_id = OtherRoleId}},
      OtherRoleId, _) ->
    {false, lang:get("对方是你的伴侣不能拜师")};
start(Role = #role{id = RoleId, pid = RPid, name = Name,
                   sex = Sex, classes = Classes, lev = Lev, face = Face,
                   attr = #attr{fc = Fc}},
      OtherRoleId, Str) ->
    case teacher_check(Role) of
        {false, Reason} -> {false, Reason};
        ok ->
            case role_misc:is_local_role(OtherRoleId) of
                true ->
                    Now = date:unixtime(),
                    ReqFlag = case get(teacher_req) of
                                  {OtherRoleId, ReqTime}
                                      when ReqTime + 20 =< Now ->
                                      true;
                                  {OtherRoleId, _ReqTime} -> false;
                                  _ -> true
                              end,
                    case role_query:local_pid(by_id, OtherRoleId) of
                        _ when ReqFlag == false ->
                            {false, lang:get("你刚对对方进行收徒，请等待对方回应")};
                        {ok, Pid} ->
                            role:apply(async,
                                       Pid,
                                       {teacher,
                                        apply_start,
                                        [#{id => RoleId, pid => RPid,
                                           face => Face, str => Str,
                                           name => Name, sex => Sex,
                                           classes => Classes, lev => Lev,
                                           fc => Fc}]}),
                            put(teacher_req, {OtherRoleId, Now}),
                            ok;
                        _ -> {false, lang:get("对方不在线")}
                    end;
                _ -> {false, lang:get("暂时不能收非本服的玩家为徒")}
            end
    end.

apply_start(#role{lev = Lev},
            #{pid := TPid, lev := TLev})
    when TLev - Lev < 5 ->
    Reason = notice:format(lang:get("两人等级相差不足~ts级，不能拜师"),
                           [{string_2, 5, 5}]),
    notice:return(notice:format("~ts ~ts",
                                [{string_1, lang:get("你")},
                                 {string_1, Reason}])),
    notice:send({pid, TPid},
                1,
                notice:format("~ts ~ts",
                              [{string_1, lang:get("对方")}, {string_1, Reason}]),
                []),
    ok;
apply_start(Role,
            #{id := TRoleId, pid := TPid, name := TName,
              sex := TSex, classes := TClasses, face := TFace,
              lev := TLev, fc := TFc, str := TStr}) ->
    case student_check(Role) of
        ok ->
            sys_conn:pack_send(15801,
                               {1,
                                TRoleId,
                                TClasses,
                                TSex,
                                TLev,
                                TFace,
                                TFc,
                                TName,
                                TStr}),
            notice:send({pid, TPid}, 1, lang:get("等待对方确认"), []),
            ok;
        {false, Reason} ->
            notice:return(notice:format("~ts ~ts",
                                        [{string_1, lang:get("你")},
                                         {string_1, Reason}])),
            notice:send({pid, TPid},
                        1,
                        notice:format("~ts ~ts",
                                      [{string_1, lang:get("对方")},
                                       {string_1, Reason}]),
                        []),
            ok
    end.

agree(Role = #role{pid = Pid}, OtherId, Type) ->
    case role_query:local_pid(by_id, OtherId) of
        {ok, TPid} ->
            case student_check(Role) of
                {false, Reason} ->
                    notice:return(notice:format("~ts ~ts",
                                                [{string_1, lang:get("你")},
                                                 {string_1, Reason}]));
                ok ->
                    {ok, Student} = conver(student, Role),
                    role:apply(async,
                               TPid,
                               {teacher,
                                apply_agree,
                                [#{student => Student, type => Type,
                                   pid => Pid}]}),
                    ok
            end;
        _ -> notice:return(lang:get("对方不在线了"))
    end.

apply_agree(_Role, #{type := 0, pid := TPid}) ->
    notice:return(lang:get("对方拒绝了")),
    notice:send({pid, TPid}, 1, lang:get("拒绝成功"), []),
    sys_conn:pack_send(15801,
                       {3, {0, "", 0}, 0, 0, 0, 0, 0, "", ""}),
    ok;
apply_agree(Role,
            Args = #{pid := SPid,
                     student := #student{id = SRoleId}}) ->
    case teacher_check(Role) of
        {false, Reason} ->
            notice:return(notice:format("~ts ~ts",
                                        [{string_1,
                                          lang:get("你"),
                                          {string_1, Reason}}])),
            notice:send({pid, SPid},
                        1,
                        notice:format("~ts ~ts",
                                      [{string_1,
                                        lang:get("对方"),
                                        {string_1, Reason}}]),
                        []),
            ok;
        ok ->
            case erase(teacher_req) of
                {SRoleId, _Time} -> do_agree(Role, Args);
                _ ->
                    notice:send({pid, SPid}, 1, lang:get("操作过期"), []),
                    ok
            end
    end.

apply_student(Role = #role{pid = SPid, id = SRoleId,
                           lev = Lev, m_teacher = MTeacher},
              #teacher{id = TRoleId, name = TName}) ->
    Now = date:unixtime(),
    TRole = teacher_progress:del_event(Role),
    TmpDaily = get_daily(Role),
    TmpDailyGoals = get_daily_goal(Role),
    TemTarget = get_target(Role),
    Target = teacher_progress:init_event(TRole,
                                         TemTarget,
                                         []),
    Daily = teacher_progress:init_event(TRole,
                                        TmpDaily ++ TmpDailyGoals,
                                        []),
    {NRole1, NewDaily} = teacher_progress:add_event(Role,
                                                    daily,
                                                    Daily,
                                                    []),
    {NRole2, NewTarget} = teacher_progress:add_event(NRole1,
                                                     target,
                                                     Target,
                                                     []),
    TargetOver = [Id
                  || #teacher_target{id = Id, finish = 3} <- NewTarget],
    NewTarget1 = [_T
                  || _T = #teacher_target{finish = Finish} <- NewTarget,
                     Finish =/= 3],
    NewMTeacher = MTeacher#m_teacher{id = TRoleId,
                                     name = TName, status = 1, daily = NewDaily,
                                     daily_time = Now, evaluation = [],
                                     target = NewTarget1,
                                     target_over = TargetOver, study_lev = Lev},
    NewRole = NRole2#role{m_teacher = NewMTeacher},
    honor:add_and_use(SPid, 11080, push),
    teacher_mgr:cast({update_student,
                      TRoleId,
                      SRoleId,
                      [{#student.daily, NewDaily},
                       {#student.target, NewTarget1},
                       {#student.daily_time, Now},
                       {#student.daily_reward, 0}]}),
    teacher_mgr:cast({student_signout, #{id => SRoleId}}),
    notice:return(notice:format(lang:get("恭喜你成为~ts的徒弟"),
                                [{role_2, TName}])),
    push(NewRole),
    friend_zone:update(NewRole, teacher, TName),
    {ok,
     role_trigger:fire(#evt_teacher_to_sudent{id = TRoleId},
                       NewRole)}.

quit(#role{cross_type = 1}, _TargetId, _Type) ->
    {false, lang:get("跨服状态不能执行此操作")};
quit(Role = #role{id = TRoleId, name = TName,
                  m_teacher = MTeacher = #m_teacher{status = 3}},
     TargetId, _Type = 1) ->
    case teacher_mgr:lookup(TRoleId) of
        #teacher{students = Students, lev = Lev} ->
            case lists:keyfind(TargetId, #student.id, Students) of
                #student{login_time = LoginTime, name = SName,
                         teacher_score = Score, lev = SLev} ->
                    QuitTimes = var:get_var(Role, day, 156, 0),
                    case QuitTimes >= 3 of
                        false ->
                            Now = date:unixtime(),
                            DiffDay = Now - LoginTime,
                            case teacher_mgr:call({quit_student,
                                                   TRoleId,
                                                   TargetId})
                                of
                                {ok, teacher} ->
                                    MountLength = length([1
                                                          || #student{status =
                                                                          2,
                                                                      out_time =
                                                                          OutTime}
                                                                 <- Students,
                                                             teacher_mgr:is_same_mount(Now,
                                                                                       OutTime)]),
                                    DescRadio = case
                                                    teacher_data:get_quit_desc(MountLength)
                                                    of
                                                    #teacher_quit_desc_data{radio
                                                                                =
                                                                                TDescRadio} ->
                                                        TDescRadio;
                                                    _ -> 1000
                                                end,
                                    case DiffDay >= 24 * 60 * 60 of
                                        true ->
                                            Rate = case SLev > 60 of
                                                       true ->
                                                           6.99999999999999955591e-1;
                                                       _ -> 4.0e-1
                                                   end,
                                            AddExp = get_exp(#{mode => 3305,
                                                               lev => Lev,
                                                               rate =>
                                                                   Score / 350 *
                                                                       45
                                                                       *
                                                                       DescRadio
                                                                       / 1000
                                                                       *
                                                                       (SLev /
                                                                            65)
                                                                       * Rate}),
                                            case AddExp of
                                                [{90010, 0, 0}] -> [];
                                                _ ->
                                                    mail:send(TRoleId,
                                                              lang:get("提前出师"),
                                                              notice:format(lang:get("由于你的徒弟~ts已经超过一天未登录，提前出师获得以下奖励"),
                                                                            [{role_2,
                                                                              SName}]),
                                                              AddExp)
                                            end;
                                        _ -> ignore
                                    end,
                                    NewMTeacher = MTeacher#m_teacher{mtime = 0},
                                    NRole1 = var:set_var(Role,
                                                         day,
                                                         156,
                                                         QuitTimes + 1),
                                    NewRole1 = NRole1#role{m_teacher =
                                                               NewMTeacher},
                                    push(NewRole1),
                                    mail:send(TargetId,
                                              lang:get("被师傅开除"),
                                              notice:format(lang:get("你的师傅~ts对于你的学习态度和状态很不满意，将你逐出师门了"),
                                                            [{role_2, TName}]),
                                              []),
                                    role:apply(async,
                                               TargetId,
                                               {teacher,
                                                apply_quit_student,
                                                [#{label => quit,
                                                   msg => lang:get("被师傅开除"),
                                                   length => 0}]}),
                                    notice:return(lang:get("解除关系成功")),
                                    {ok, NewRole1};
                                {ok, none} ->
                                    Honors = teacher_data:teacher_honors(),
                                    {ok, NRole1} = honor:del(Role,
                                                             Honors,
                                                             push),
                                    notice:return(lang:get("开除徒弟成功")),
                                    NewMTeacher = MTeacher#m_teacher{status = 0,
                                                                     mtime = 0},
                                    NRole2 = var:set_var(NRole1,
                                                         day,
                                                         156,
                                                         QuitTimes + 1),
                                    NewRole = NRole2#role{m_teacher =
                                                              NewMTeacher},
                                    push(NewRole),
                                    mail:send(TargetId,
                                              lang:get("被师傅开除"),
                                              notice:format(lang:get("你的师傅~ts对于你的学习态度和状态很不满意，将你逐出师门了"),
                                                            [{role_2, TName}]),
                                              []),
                                    role:apply(async,
                                               TargetId,
                                               {teacher,
                                                apply_quit_student,
                                                [#{label => quit,
                                                   msg => lang:get("被师傅开除"),
                                                   length => 0}]}),
                                    {ok, NewRole};
                                {false, Reason} -> {false, Reason};
                                _ -> {false, lang:get("系统繁忙")}
                            end;
                        _ -> {false, lang:get("每天最多解除师徒关系3次")}
                    end;
                _ -> {false, lang:get("对方不是你的徒弟")}
            end;
        _ -> {false, lang:get("居然不是师傅")}
    end;
quit(_Role, _TargetId, _Type = 1) ->
    {false, lang:get("还没有徒弟，开除谁啊")};
quit(Role = #role{id = SRoleId, name = SName,
                  m_teacher =
                      MTeacher = #m_teacher{id = TRoleId, status = 1}},
     _, _Type = 2) ->
    case teacher_mgr:lookup(TRoleId) of
        #teacher{students = Students,
                 login_time = TLoginTime} ->
            case lists:keyfind(SRoleId, #student.id, Students) of
                #student{} ->
                    Now = date:unixtime(),
                    DiffDay = Now - TLoginTime,
                    Loss = case DiffDay >= 24 * 3600 of
                               true -> [];
                               _ -> []
                           end,
                    case role_gain:do_notice(Loss, Role, lang:get("退出师门"))
                        of
                        {ok, NRole} ->
                            case teacher_mgr:call({quit_teacher,
                                                   TRoleId,
                                                   SRoleId})
                                of
                                {ok, Label} ->
                                    {ok, NTRole} = honor:del(NRole,
                                                             11080,
                                                             push),
                                    MTime = case DiffDay >= 24 * 3600 of
                                                true ->
                                                    notice:return(lang:get("解除关系成功，由于您的师傅长时间不上线，你可以马上进行拜师")),
                                                    0;
                                                _ ->
                                                    notice:return(notice:format(lang:get("强制解除关系成功，强制解除关系后，~ts小时内无法再进行拜师"),
                                                                                [{string_2,
                                                                                  5,
                                                                                  util:ceil(6
                                                                                                *
                                                                                                3600
                                                                                                /
                                                                                                3600)}])),
                                                    Now
                                            end,
                                    NRole1 = teacher_progress:del_event(NTRole),
                                    NewMTeacher = MTeacher#m_teacher{mtime =
                                                                         MTime,
                                                                     id =
                                                                         {0,
                                                                          "",
                                                                          0},
                                                                     name = "",
                                                                     status = 0,
                                                                     daily = [],
                                                                     daily_time
                                                                         = 0,
                                                                     target =
                                                                         [],
                                                                     study_lev =
                                                                         0},
                                    NewRole = NRole1#role{m_teacher =
                                                              NewMTeacher},
                                    push(NewRole),
                                    mail:send(TRoleId,
                                              lang:get("退出师门"),
                                              notice:format(lang:get("~ts对于您的教学方式颇为不满，毅然决定独自离开"),
                                                            [{role_2, SName}]),
                                              []),
                                    role:apply(async,
                                               TRoleId,
                                               {teacher,
                                                apply_quit_teacher,
                                                [Label,
                                                 notice:format(lang:get("~ts退出师门"),
                                                               [{role_2,
                                                                 Role}])]}),
                                    {ok, NewRole};
                                {false, Reason} -> {false, Reason};
                                _ -> {false, lang:get("系统繁忙")}
                            end;
                        {false, #loss{label = coin}} ->
                            {false, lang:get("银币不足")};
                        _ -> {false, lang:get("活力值不足")}
                    end;
                _ -> {false, lang:get("对方不是你的徒弟")}
            end;
        _ -> {false, lang:get("居然不是师傅")}
    end;
quit(#role{}, _, _Type = 2) ->
    {false, lang:get("你没有拜师不能退出师门")};
quit(#role{m_teacher = #m_teacher{status = 0}}, _,
     _Type) ->
    {false, lang:get("没有徒弟，不能出师")};
quit(#role{m_teacher = #m_teacher{status = 1}}, _,
     _Type) ->
    {false, lang:get("徒弟不能执行此操作")};
quit(Role = #role{id = TRoleId, name = TName,
                  m_teacher = #m_teacher{status = 3}},
     SRoleId, _Type) ->
    case role_query:pid(by_id, SRoleId) of
        {ok, SPid} ->
            case teacher_mgr:lookup(TRoleId) of
                #teacher{students = Students} ->
                    EndLev = get_student_end_lev(Role),
                    case lists:keyfind(SRoleId, #student.id, Students) of
                        #student{status = 2} -> {false, lang:get("对方已经出师了")};
                        #student{lev = SLev} when SLev < EndLev ->
                            {false,
                             notice:format(lang:get("徒弟要~ts级，才能出师"),
                                           [{string_2, 5, EndLev}])};
                        #student{} ->
                            case team:get_members(Role) of
                                [_, _ | _] ->
                                    {false, lang:get("队伍中存在第三者，被打扰了")};
                                [#team_mate{id = SRoleId, status = 2}] ->
                                    Now = date:unixtime(),
                                    put(teacher_quit_req, Now),
                                    notice:return(lang:get("等待对方确认")),
                                    role:pack_send(SPid,
                                                   15812,
                                                   {1, 0, "", TRoleId, TName}),
                                    ok;
                                [#team_mate{id = SRoleId}] ->
                                    {false, lang:get("让对方归队才能出师")};
                                _ -> {false, lang:get("你的徒弟不在队伍中，不能出师")}
                            end;
                        _ -> {false, lang:get("对方不是你徒弟")}
                    end;
                _ -> {false, lang:get("对方不是你徒弟")}
            end;
        _ -> {false, lang:get("对方不在线")}
    end.

quit_reply(#role{m_teacher = #m_teacher{status = 0}},
           _Type) ->
    {false, lang:get("你还没有拜师")};
quit_reply(#role{m_teacher = #m_teacher{status = 3}},
           _Type) ->
    {false, lang:get("你现在是师傅，不用出师了")};
quit_reply(Role = #role{id = SRoleId, pid = SRolePid,
                        name = SName, lev = Lev,
                        m_teacher = #m_teacher{status = 1, id = TRoleId}},
           Type) ->
    EndLev = get_student_end_lev(Role),
    case Lev >= EndLev of
        true ->
            case role_query:pid(by_id, TRoleId) of
                {ok, Pid} ->
                    case teacher_mgr:lookup(TRoleId) of
                        #teacher{students = Students} ->
                            case lists:keyfind(SRoleId, #student.id, Students)
                                of
                                #student{} ->
                                    role:apply(async,
                                               Pid,
                                               {teacher,
                                                apply_quit_reply,
                                                [SRoleId,
                                                 SName,
                                                 SRolePid,
                                                 Type]}),
                                    ok;
                                _ -> {false, lang:get("怎么回事，对方不认做徒弟了")}
                            end;
                        _ -> {false, lang:get("师傅信息没有找到")}
                    end;
                _ -> {false, lang:get("对方已下线")}
            end;
        _ ->
            {false,
             notice:format(lang:get("等级不足~ts级，不能出师"),
                           [{string_2, 5, EndLev}])}
    end;
quit_reply(_Role, _) -> {false, lang:get("出什么错了！")}.

apply_quit_reply(_Role = #role{}, _, _, RolePid,
                 _Type = 0) ->
    erase(teacher_quit_req),
    notice:send({pid, RolePid}, 1, lang:get("拒绝成功"), []),
    notice:return(lang:get("对方拒绝出师，你们再商量一下")),
    ok;
apply_quit_reply(Role = #role{id = TRoleId, pid = TPid,
                              lev = Lev,
                              m_teacher = MTeacher = #m_teacher{status = 3},
                              pos =
                                  #pos{map = MapId, map_base_id = MapBaseId,
                                       x = X, y = Y}},
                 SRoleId, SName, RolePid, _Type) ->
    Now = date:unixtime(),
    case erase(teacher_quit_req) of
        T
            when is_integer(T) andalso Now - T > 600 orelse
                     T =:= undefined ->
            notice:send({pid, RolePid}, 1, lang:get("操作超时"), []),
            notice:return(lang:get("对方操作超时")),
            ok;
        T when is_integer(T) ->
            case teacher_mgr:lookup(TRoleId) of
                #teacher{} ->
                    case teacher_mgr:call({quit_agree, TRoleId, SRoleId}) of
                        {ok,
                         #{score := Score, length := Length,
                           mount_length := MountLength}} ->
                            DescRadio = case
                                            teacher_data:get_quit_desc(MountLength)
                                            of
                                            #teacher_quit_desc_data{radio =
                                                                        TDescRadio,
                                                                    title =
                                                                        DTitle,
                                                                    msg =
                                                                        DMsg} ->
                                                notice:send(Role, 3, DMsg),
                                                mail:send(TRoleId,
                                                          DTitle,
                                                          DMsg),
                                                TDescRadio;
                                            _ -> 1000
                                        end,
                            {TReward, Msg} = teacher_data:get_quit({2, Score}),
                            TeacherReward = case MountLength > 4 of
                                                true ->
                                                    [TI
                                                     || TI = {20002, _, _}
                                                            <- TReward];
                                                _ -> TReward
                                            end,
                            AddExp = get_exp(#{mode => 3305, lev => Lev,
                                               rate =>
                                                   Score / 350 * 45 * DescRadio
                                                       / 1000}),
                            NewTeacherReward = TeacherReward ++ AddExp,
                            Gain = format:val_to_gain(NewTeacherReward),
                            update_student_score(TRoleId,
                                                 SRoleId,
                                                 TeacherReward),
                            NRole1 = case role_gain:do_notice(Gain,
                                                              Role,
                                                              lang:get("徒弟出师"))
                                         of
                                         {ok, NRole} -> NRole;
                                         _ ->
                                             mail:send(TRoleId,
                                                       lang:get("背包已满"),
                                                       notice:format(lang:get("你的徒弟~ts出师，你获得以下奖励"),
                                                                     [{role_2,
                                                                       SName}]),
                                                       NewTeacherReward),
                                             Role
                                     end,
                            notice:return(notice:format(lang:get("~ts ~ts ~ts"),
                                                        [{string_1,
                                                          lang:get("你的徒弟")},
                                                         {role_2, SName},
                                                         {string_1, Msg}])),
                            NewMTeacher = MTeacher#m_teacher{},
                            NewRole = NRole1#role{m_teacher = NewMTeacher},
                            push(NewRole),
                            role:apply(async,
                                       RolePid,
                                       {teacher,
                                        apply_quit_student,
                                        [#{label => agree, msg => "",
                                           length => Length}]}),
                            notice:cast(all,
                                        4,
                                        notice:format(lang:get("恭喜~ts求学多日，顺利出师了，希望他继续努力，不要辜负~ts的辛勤教导"),
                                                      [{role_2, SName},
                                                       {role_2, Role}])),
                            notice:return(lang:get("出师成功")),
                            sys_conn:pack_send(15821,
                                               {1,
                                                SRoleId,
                                                SName,
                                                Score,
                                                NewTeacherReward}),
                            notice:effect({map, MapId},
                                          30074,
                                          2,
                                          MapBaseId,
                                          X,
                                          Y),
                            notice:effect({role_pid, TPid}, 30075),
                            notice:effect({role_pid, RolePid}, 30075),
                            {ok, NewRole};
                        {false, Reason} ->
                            notice:return(Reason),
                            ok
                    end;
                _ ->
                    notice:return(lang:get("没有找到拜师信息")),
                    ok
            end;
        _ ->
            notice:send({pid, RolePid},
                        1,
                        lang:get("对方没有发起过出师"),
                        []),
            notice:return(lang:get("没有发起过出师")),
            ok
    end;
apply_quit_reply(_Role, _, _, _RolePid, _Reply) ->
    notice:return(lang:get("你还没有收徒哦！")),
    ok.

apply_quit_student(Role = #role{id = SRoleId, lev = Lev,
                                m_teacher =
                                    MTeacher = #m_teacher{id = TRoleId,
                                                          name = TName}},
                   #{label := Label, msg := Msg, length := Length}) ->
    {ok, NRole} = honor:del(Role, 11080, push),
    NewRole = #role{m_teacher =
                        #m_teacher{status = NewStatues, daily = NewDaily,
                                   daily_time = NewDailyTime,
                                   daily_reward = NewDailyReward,
                                   target = NewTarget}} =
                  case Label of
                      quit ->
                          notice:return(Msg),
                          TNRole = teacher_progress:del_event(NRole),
                          NewMTeacher = MTeacher#m_teacher{id = {0, "", 0},
                                                           name = "",
                                                           status = 0,
                                                           daily = [],
                                                           daily_time = 0,
                                                           daily_reward = 0,
                                                           evaluation = [],
                                                           study_lev = 0,
                                                           target = []},
                          TNRole#role{m_teacher = NewMTeacher};
                      _ ->
                          QuitHonor = get_quit_honor(Length),
                          honor:add_and_use(self(), QuitHonor, push),
                          {SReward, SMsg} = teacher_data:get_quit({1, Lev}),
                          AddExp = get_exp(#{mode => 3306, lev => Lev,
                                             rate => 60}),
                          NewSReward = SReward ++ AddExp,
                          Gain = format:val_to_gain(NewSReward),
                          notice:return(SMsg),
                          NewMTeacher = MTeacher#m_teacher{status = 2,
                                                           daily = [],
                                                           daily_time = 0,
                                                           daily_reward = 0,
                                                           evaluation = [],
                                                           study_lev = 0},
                          TNRole = teacher_progress:del_event(NRole, daily),
                          sys_conn:pack_send(15821,
                                             {0,
                                              TRoleId,
                                              TName,
                                              0,
                                              NewSReward}),
                          case role_gain:do_notice(Gain,
                                                   TNRole,
                                                   lang:get("学成出师"))
                              of
                              {ok, NRole1} ->
                                  NRole1#role{m_teacher = NewMTeacher};
                              _ ->
                                  mail:send(Role,
                                            lang:get("背包已满"),
                                            lang:get("学成出师，你获得以下奖励"),
                                            NewSReward),
                                  TNRole#role{m_teacher = NewMTeacher}
                          end
                  end,
    teacher_mgr:cast({update_student,
                      TRoleId,
                      SRoleId,
                      [{#student.status, NewStatues},
                       {#student.daily, NewDaily},
                       {#student.daily_time, NewDailyTime},
                       {#student.daily_reward, NewDailyReward},
                       {#student.target, NewTarget}]}),
    push(NewRole),
    friend_zone:update(NewRole, teacher, ""),
    {ok, NewRole}.

apply_quit_teacher(Role = #role{m_teacher =
                                    MTeacher = #m_teacher{status = Status}},
                   Label, Msg) ->
    {NRole1, NewStatues} = case Label of
                               none ->
                                   Honors = teacher_data:teacher_honors(),
                                   {ok, NRole} = honor:del(Role, Honors, push),
                                   {NRole, 0};
                               _ -> {Role, Status}
                           end,
    notice:return(Msg),
    NewMTeacher = MTeacher#m_teacher{status = NewStatues},
    NewRole = NRole1#role{m_teacher = NewMTeacher},
    push(NewRole),
    {ok, NewRole}.

auto_quit_teacher(Role = #role{id = SRoleId,
                               name = SName, lev = Lev,
                               m_teacher =
                                   MTeacher = #m_teacher{id = TRoleId,
                                                         name = TName,
                                                         status = 1}}) ->
    case teacher_mgr:call({quit_agree, TRoleId, SRoleId}) of
        {ok,
         #{length := Length, lev := TLev,
           mount_length := MountLength}} ->
            DescRadio = case teacher_data:get_quit_desc(MountLength)
                            of
                            #teacher_quit_desc_data{radio = TDescRadio,
                                                    title = DTitle,
                                                    msg = DMsg} ->
                                mail:send(TRoleId, DTitle, DMsg),
                                TDescRadio;
                            _ -> 1000
                        end,
            Score = 199,
            {TReward, _Msg} = teacher_data:get_quit({2, 199}),
            TeacherReward = case MountLength > 4 of
                                true -> [TI || TI = {20002, _, _} <- TReward];
                                _ -> TReward
                            end,
            AddExp = get_exp(#{mode => 3305, lev => TLev,
                               rate => Score / 350 * 45 * DescRadio / 1000}),
            NewTeacherReward = TeacherReward ++ AddExp,
            update_student_score(TRoleId, SRoleId, TeacherReward),
            mail:send(TRoleId,
                      lang:get("徒弟自动出师"),
                      notice:format(lang:get("你的徒弟~ts到达~ts级自动出师，你获得以下奖励"),
                                    [{role_2, SName}, {string_2, 5, Lev}]),
                      NewTeacherReward),
            QuitHonor = get_quit_honor(Length),
            honor:add_and_use(self(), QuitHonor, push),
            {SReward, SMsg} = teacher_data:get_quit({1, Lev}),
            SAddExp = get_exp(#{mode => 3306, lev => Lev,
                                rate => 60}),
            NewSReward = SReward ++ SAddExp,
            Gain = format:val_to_gain(NewSReward),
            notice:return(SMsg),
            NewMTeacher = MTeacher#m_teacher{status = 2, daily = [],
                                             daily_time = 0, daily_reward = 0,
                                             evaluation = [], study_lev = 0},
            {ok, NRole} = honor:del(Role, 11080, push),
            TNRole = teacher_progress:del_event(NRole, daily),
            sys_conn:pack_send(15821,
                               {0, TRoleId, TName, 0, NewSReward}),
            NewRole = #role{m_teacher =
                                #m_teacher{status = NewStatues,
                                           daily = NewDaily,
                                           daily_time = NewDailyTime,
                                           daily_reward = NewDailyReward,
                                           target = NewTarget}} =
                          case role_gain:do_notice(Gain,
                                                   TNRole,
                                                   lang:get("学成出师"))
                              of
                              {ok, NRole1} ->
                                  NRole1#role{m_teacher = NewMTeacher};
                              _ ->
                                  mail:send(TNRole,
                                            lang:get("背包已满"),
                                            lang:get("学成出师，你获得以下奖励"),
                                            SReward),
                                  TNRole#role{m_teacher = NewMTeacher}
                          end,
            teacher_mgr:cast({update_student,
                              TRoleId,
                              SRoleId,
                              [{#student.status, NewStatues},
                               {#student.daily, NewDaily},
                               {#student.daily_time, NewDailyTime},
                               {#student.daily_reward, NewDailyReward},
                               {#student.target, NewTarget}]}),
            push(NewRole),
            notice:cast(all,
                        4,
                        notice:format(lang:get("恭喜~ts求学多日，顺利出师了，希望他继续努力，不要辜负~ts的辛勤教导"),
                                      [{role_2, SName}, {role_2, TName}])),
            role:pack_send(TRoleId,
                           15821,
                           {1, SRoleId, SName, Score, NewTeacherReward}),
            {ok, NewRole};
        {false, _Reason} -> ok
    end;
auto_quit_teacher(_) -> ok.

teacher_in_team(Role = #role{m_teacher =
                                 #m_teacher{id = TRoleId, status = 1}}) ->
    MateList = case team:get_members(Role) of
                   List = [_ | _] -> List;
                   _ -> []
               end,
    case lists:keyfind(TRoleId, #team_mate.id, MateList) of
        #team_mate{status = 2} -> true;
        #team_mate{status = 1} -> true;
        _ -> false
    end;
teacher_in_team(_) -> false.

target_reward(Role = #role{id = SRoleId, name = _SName,
                           lev = Lev,
                           m_teacher =
                               MTeacher = #m_teacher{id = TRoleId,
                                                     target = TargetList,
                                                     target_reward =
                                                         TargetReward,
                                                     target_rewarded =
                                                         TargetRewarded,
                                                     status = Status}},
              _Type = 1, Id)
    when Status == 1 orelse
             Status == 2 orelse Status == 3 ->
    case lists:member(Id, TargetRewarded) of
        false ->
            case lists:member(Id, TargetReward) of
                true ->
                    case teacher_data:get_target(Id) of
                        #teacher_target_data{student_reward = StudentRewards,
                                             student_exp = Exp,
                                             teacher_reward = _TeacherReward} ->
                            AddExp = get_exp(#{mode => 3306, lev => Lev,
                                               rate => Exp / 1000}),
                            Gains = format:val_to_gain(StudentRewards ++
                                                           AddExp),
                            case role_gain:do_notice(Gains,
                                                     Role,
                                                     lang:get("师徒目标奖励"))
                                of
                                {ok, NRole} ->
                                    NewTargetList = lists:keydelete(Id,
                                                                    #teacher_target.id,
                                                                    TargetList),
                                    NewTargetReward = TargetReward -- [Id],
                                    NewTargetRewarded = [Id | TargetRewarded],
                                    teacher_mgr:cast({update_student,
                                                      TRoleId,
                                                      SRoleId,
                                                      [{#student.target,
                                                        NewTargetList}]}),
                                    NewMTeacher = MTeacher#m_teacher{target =
                                                                         NewTargetList,
                                                                     target_reward
                                                                         =
                                                                         NewTargetReward,
                                                                     target_rewarded
                                                                         =
                                                                         NewTargetRewarded},
                                    NewRole = NRole#role{m_teacher =
                                                             NewMTeacher},
                                    push_target(NewRole, SRoleId),
                                    {ok, NewRole};
                                _ -> {false, lang:get("背包空间列表")}
                            end;
                        _ -> {false, lang:get("没有找到目标")}
                    end;
                _ -> {false, lang:get("目标未完成，无法领取奖励")}
            end;
        _ -> {false, lang:get("该目标奖励已经被领取过")}
    end;
target_reward(_Role, _Type = 1, _Id) ->
    {false, lang:get("不是徒弟不能领取目标")};
target_reward(_Role = #role{m_teacher =
                                #m_teacher{daily_reward = 1, status = 1}},
              _Type = 2, _Id) ->
    {false, lang:get("你已经领取过师徒日常的奖励")};
target_reward(_Role = #role{id = SRoleId, lev = _Lev,
                            name = SName,
                            m_teacher =
                                _MTeacher = #m_teacher{id = TRoleId,
                                                       daily = Daily,
                                                       status = 1}},
              _Type = 2, _Id) ->
    case [1
          || #teacher_daily{id = Id, finish = 0} <- Daily,
             Id =/= 11]
        of
        [] ->
            case role_query:pid(by_id, TRoleId) of
                {ok, TPid} ->
                    role:pack_send(TPid, 15817, {1, 1, 1, SRoleId, SName});
                _ ->
                    mail:send(TRoleId,
                              lang:get("日常教学验收"),
                              notice:format(lang:get("您的徒弟~ts已经完成了今天的教学功课，请您尽快进行验收"),
                                            [{role_2, SName}])),
                    todo
            end,
            ok;
        _ -> {false, lang:get("还没有目标未完成")}
    end;
target_reward(_Role, _Type, _Id) ->
    {false, lang:get("不是徒弟不能领取日常奖励")}.

target_reward_teacher(Role = #role{id = TRoleId,
                                   lev = Lev,
                                   m_teacher =
                                       _MTeacher = #m_teacher{status = 3}},
                      TargetId, Type)
    when Type == 1 orelse Type == 2 ->
    case teacher_mgr:lookup(TRoleId) of
        #teacher{students = Students} ->
            case lists:keyfind(TargetId, #student.id, Students) of
                #student{status = 2} -> {false, lang:get("徒弟已出师")};
                #student{daily_reward = 1} ->
                    {false, lang:get("已经验收了")};
                #student{daily_time = DailyTime, daily = Daily,
                         name = SName} ->
                    Now = date:unixtime(),
                    case date:is_same_day(Now, DailyTime) of
                        true ->
                            case [1
                                  || #teacher_daily{id = Id, finish = 0}
                                         <- Daily,
                                     Id =/= 11]
                                of
                                [] ->
                                    Loss = case Type of
                                               2 ->
                                                   format:val_to_loss([{90006,
                                                                        50}]);
                                               _ -> []
                                           end,
                                    case role_gain:do_notice(Loss,
                                                             Role,
                                                             lang:get("验收师徒日常"))
                                        of
                                        {ok, NRole} ->
                                            case
                                                teacher_mgr:call({target_reward_teacher,
                                                                  TRoleId,
                                                                  TargetId,
                                                                  Type})
                                                of
                                                ok ->
                                                    sys_conn:pack_send(15817,
                                                                       {3,
                                                                        Type,
                                                                        1,
                                                                        TargetId,
                                                                        SName}),
                                                    push_daily(Role, TargetId),
                                                    role:apply(async,
                                                               TargetId,
                                                               {teacher,
                                                                push_daily,
                                                                [TargetId]}),
                                                    case
                                                        teacher_data:get_daily_reward({2,
                                                                                       Lev,
                                                                                       Type})
                                                        of
                                                        false -> {ok, Role};
                                                        {TeacherRewards,
                                                         ExpRate} ->
                                                            AddExp =
                                                                get_exp(#{mode
                                                                              =>
                                                                              3305,
                                                                          lev =>
                                                                              Lev,
                                                                          rate
                                                                              =>
                                                                              ExpRate}),
                                                            Gains =
                                                                format:val_to_gain(TeacherRewards
                                                                                       ++
                                                                                       AddExp),
                                                            update_student_score(TRoleId,
                                                                                 TargetId,
                                                                                 TeacherRewards),
                                                            case
                                                                role_gain:do_notice(Gains,
                                                                                    NRole,
                                                                                    lang:get("验收师徒日常"))
                                                                of
                                                                {ok, NRole2} ->
                                                                    {ok,
                                                                     NRole2};
                                                                _Err ->
                                                                    notice:return(lang:get("验收成功，请到邮件中查看奖励")),
                                                                    mail:send(TRoleId,
                                                                              lang:get("师徒完成日常"),
                                                                              notice:format(lang:get("您和您的徒弟~ts完成了今日的<color='#ffff00'>师徒日常</color>活"
                                                                                                     "动，特发放奖励如下"),
                                                                                            [{role_2,
                                                                                              SName}]),
                                                                              TeacherRewards
                                                                                  ++
                                                                                  AddExp),
                                                                    {ok, Role}
                                                            end
                                                    end;
                                                {false, Reason} ->
                                                    {false, Reason};
                                                _ -> {false, lang:get("系统繁忙")}
                                            end;
                                        _ -> {false, lang:get("活力值不足")}
                                    end;
                                _ -> {false, lang:get("该徒弟今天还有未完成日常呢")}
                            end;
                        _ -> {false, lang:get("该徒弟今天还没有领取日常呢")}
                    end;
                _ -> {false, lang:get("没有找到目标徒弟")}
            end;
        _ -> {false, lang:get("没有找到师门数据")}
    end;
target_reward_teacher(_Role, _TargetId, _Type) ->
    {false, lang:get("你不是师傅不能验收")}.

target_reward_teacher_apply(Role = #role{id = RoleId,
                                         m_teacher =
                                             MTeacher = #m_teacher{id = TRoleId,
                                                                   name = TName,
                                                                   status = 1}},
                            Type) ->
    NewMTeacher = MTeacher#m_teacher{daily_reward = 1},
    NewRole = Role#role{m_teacher = NewMTeacher},
    push_daily(NewRole, RoleId),
    sys_conn:pack_send(15817, {2, Type, 1, TRoleId, TName}),
    notice:return(lang:get("师傅验收通过")),
    {ok, NewRole};
target_reward_teacher_apply(_, _) -> ok.

teacher_reward_target(Role = #role{id = TRoleId,
                                   lev = Lev,
                                   m_teacher = #m_teacher{status = 3}},
                      SRoleId, Id) ->
    case teacher_mgr:call({teacher_reward_target,
                           TRoleId,
                           SRoleId,
                           Id})
        of
        {ok,
         #{item_list := ItemList, exp := Exp, name := SName,
           target_name := TargetName}} ->
            AddExp = get_exp(#{mode => 3305, lev => Lev,
                               rate => Exp / 1000}),
            Gains = format:val_to_gain(ItemList ++ AddExp),
            push_target(Role, SRoleId),
            push_target(Role, TRoleId),
            update_student_score(TRoleId, SRoleId, ItemList),
            case role_gain:do_notice(Gains,
                                     Role,
                                     lang:get("领取师徒目标"))
                of
                {ok, NRole} -> {ok, NRole};
                _ ->
                    notice:return(lang:get("领取师徒目标，请到邮件中查看奖励")),
                    mail:send(TRoleId,
                              lang:get("领取师徒目标"),
                              notice:format(lang:get("您和您的徒弟~ts完成了~ts，特发放奖励如下"),
                                            [{role_2, SName},
                                             {string_1, TargetName}]),
                              ItemList ++ AddExp),
                    {ok, Role}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙")}
    end;
teacher_reward_target(_Role, _SRoleId, _Id) ->
    {false, lang:get("不是师傅不能领取该奖励")}.

target_reward_apply(_Role = #role{id = RoleId,
                                  lev = Lev,
                                  m_teacher = #m_teacher{status = 3}},
                    _Label = dailys, _SRoleId, SName) ->
    case teacher_data:get_daily_reward({2, Lev}) of
        [] -> ok;
        TeacherRewards = [_ | _] ->
            mail:send(RoleId,
                      lang:get("师徒完成日常"),
                      notice:format(lang:get("您和您的徒弟~ts完成了今日的<color='#ffff00'>师徒日常</color>活"
                                             "动，特发放奖励如下"),
                                    [{role_2, SName}]),
                      TeacherRewards),
            ok
    end;
target_reward_apply(_Role, _Label, _SRoleId, _SName) ->
    ok.

encourage(Role = #role{id = TRoleId, lev = TLev,
                       name = TName, m_teacher = #m_teacher{status = 3}},
          SRoleId) ->
    case teacher_mgr:lookup(TRoleId) of
        #teacher{students = Students} ->
            case lists:keyfind(SRoleId, #student.id, Students) of
                #student{encourage_time = EncourageTime, lev = SLev} ->
                    Now = date:unixtime(),
                    case date:is_same_day(Now, EncourageTime) of
                        true -> {false, lang:get("今天已经鼓励过，明天再给ta一些鼓励吧")};
                        _ ->
                            StudentRewards = teacher_data:get_encourage({1,
                                                                         SLev}),
                            TeacherRewards = teacher_data:get_encourage({2,
                                                                         TLev}),
                            Loss = format:val_to_loss([{90006, 100}]),
                            Gain = format:val_to_loss(TeacherRewards),
                            case role_gain:do_notice(Loss ++ Gain,
                                                     Role,
                                                     lang:get("你发放了一份良师的鼓励"))
                                of
                                {ok, NRole} ->
                                    teacher_mgr:cast({update_student,
                                                      TRoleId,
                                                      SRoleId,
                                                      [{#student.encourage_time,
                                                        Now}]}),
                                    mail:send(SRoleId,
                                              lang:get("良师鼓励"),
                                              notice:format(lang:get("师傅为了让你更快的成长，为你制造了一份良师的鼓励，使用后可获得一定的储备经验，完成所有任务"
                                                                     "时均能得到加倍奖励"),
                                                            []),
                                              StudentRewards),
                                    role:apply(async,
                                               SRoleId,
                                               {teacher,
                                                encourage_apply,
                                                [#{now => Now,
                                                   name => TName}]}),
                                    {ok, Now, NRole};
                                {false, #loss{}} -> {false, lang:get("活力值不足")};
                                _ -> {false, lang:get("背包空降不足")}
                            end
                    end;
                _ -> {false, lang:get("对方不是的徒弟")}
            end;
        _ -> {false, lang:get("没有找到数据")}
    end;
encourage(_Role, _TargetRoleId) ->
    {false, lang:get("你还不是师傅，不能鼓励")}.

evaluation(_Role = #role{lev = Lev}, TargetLev, _Type)
    when TargetLev > Lev ->
    {false,
     notice:format(lang:get("最多只能评价到~ts级"),
                   [{string_2, 5, Lev}])};
evaluation(_Role = #role{m_teacher =
                             #m_teacher{study_lev = StudyLev}},
           TargetLev, _Type)
    when TargetLev =< StudyLev ->
    {false, lang:get("该等级你还没有拜师")};
evaluation(Role = #role{id = RoleId, name = Name,
                        lev = Lev,
                        m_teacher =
                            MTeacher = #m_teacher{id = TRoleId, status = 1,
                                                  evaluation = Evaluation}},
           TargetLev, Type) ->
    Levs = teacher_data:levs(),
    LevFlag = lists:member(TargetLev, Levs),
    case lists:member(TargetLev, Evaluation) of
        true -> {false, lang:get("该等级你已经评价过了")};
        _ when LevFlag == false -> {false, lang:get("该等级不能评价")};
        _ ->
            {Score, _Msg} = case Type of
                                3 -> {5, lang:get("")};
                                2 -> {3, lang:get("")};
                                _ -> {1, lang:get("")}
                            end,
            NewEvaluation = [TargetLev | Evaluation],
            Add = case role_query:pid(by_id, TRoleId) of
                      {ok, TPid} ->
                          role:pack_send(TPid,
                                         15810,
                                         {RoleId, Name, TargetLev, Type, 2}),
                          [];
                      _ -> []
                  end,
            Rewards = [{90019, Score}],
            mail:send(TRoleId,
                      lang:get("徒弟评价"),
                      notice:format(lang:get("您的徒弟 ~ts 经过一番努力，提升到了升级到 ~ts 级，并对您最近的教学指导进行了评价"
                                             "，您获得以下奖励。"),
                                    [{role_2, Role}, {string_2, 5, TargetLev}]),
                      Rewards),
            update_student_score(TRoleId, RoleId, Rewards),
            teacher_mgr:cast({update_teacher, TRoleId, Add}),
            NewMTeacher = MTeacher#m_teacher{evaluation =
                                                 NewEvaluation},
            NRole = Role#role{m_teacher = NewMTeacher},
            notice:return(notice:format(lang:get("评价成功，师傅获得了~ts点师道值"),
                                        [{string_2, 5, Score}])),
            AddExp = get_exp(#{mode => 3306, lev => Lev,
                               rate => 8.0e-1}),
            NewRole = case
                          role_gain:do_notice(format:val_to_gain(AddExp),
                                              NRole,
                                              lang:get("评价师傅"))
                          of
                          {ok, NRole1} -> NRole1;
                          _ -> NRole
                      end,
            push(NewRole),
            {ok, NewRole}
    end;
evaluation(_, _, _) -> {false, lang:get("不是徒弟不能评价")}.

evaluation_apply(Role = #role{id = TRoleId},
                 #{score := Score, msg := Msg, role_id := SRoleId,
                   name := SName, lev := SLev, type := SType}) ->
    Rewards = [{90019, Score}],
    Gains = format:val_to_gain(Rewards),
    update_student_score(TRoleId, SRoleId, Rewards),
    sys_conn:pack_send(15810,
                       {SRoleId, SName, SLev, SType, 2}),
    case role_gain:do_notice(Gains, Role, Msg) of
        {ok, NRole} -> {ok, NRole};
        _ -> ok
    end.

encourage_apply(Role = #role{m_teacher =
                                 MTeacher = #m_teacher{id = TRoleId}},
                #{now := Now, name := TName}) ->
    sys_conn:pack_send(15808, {TRoleId, TName, 2, Now}),
    NewMTeacher = MTeacher#m_teacher{name = TName},
    {ok, Role#role{m_teacher = NewMTeacher}}.

daily_goal_reward_apply(Role = #role{id = TRoleId,
                                     m_teacher =
                                         MTeacher = #m_teacher{goals_times =
                                                                   Times}},
                        #{max_times := MaxTimes, teacher_val := TeacherVal,
                          teacher_reward := TeacherReward,
                          teacher_title := TeacherTitle,
                          teacher_msg := TeacherMsg, srole_id := SRoleId}) ->
    case Times >= MaxTimes of
        true ->
            Rewards = [{90019, TeacherVal}],
            Gains = format:val_to_gain(Rewards),
            update_student_score(TRoleId, SRoleId, Rewards),
            Msg = lang:get("您本周的师徒日常奖励已达上限，将自动转化成师道值"),
            case role_gain:do_notice(Gains, Role, Msg) of
                {ok, NRole} ->
                    push15824(NRole),
                    {ok, NRole};
                _ ->
                    push15824(Role),
                    ok
            end;
        _ ->
            mail:send(TRoleId,
                      #{title => TeacherTitle, content => TeacherMsg,
                        items => TeacherReward}),
            NMTeacher = MTeacher#m_teacher{goals_times = Times + 1},
            NRole = Role#role{m_teacher = NMTeacher},
            push15824(NRole),
            {ok, NRole}
    end.

push15824(Role = #role{m_teacher =
                           #m_teacher{goals_times = Times}}) ->
    MaxNum = case teacher_data:get_daily_goals(50,
                                               date:day_of_the_week(date:unixtime())
                                                   rem 2)
                 of
                 false -> 0;
                 {_, _, _, _, MaxTimes, _, _, _, _, _} -> MaxTimes
             end,
    role:pack_send(Role, 15824, {Times, MaxNum}).

sign(Role = #role{id = RoleId}, Msg) ->
    case teacher_mgr:lookup(teacher_sign, RoleId) of
        TeacherSign = #teacher_sign{is_sign = 1} ->
            teacher_mgr:update_data(teacher_sign,
                                    TeacherSign#teacher_sign{is_sign = 0}),
            push_sign(Role),
            notice:return(lang:get("取消报名成功")),
            ok;
        _ ->
            case teacher_check(Role) of
                ok ->
                    case teacher_mgr:lookup(RoleId) of
                        #teacher{students = Students} ->
                            StudentStudyNum = length([1
                                                      || #student{status = 1}
                                                             <- Students]),
                            StudentNum = length(Students),
                            case StudentStudyNum >= 2 of
                                true ->
                                    {false,
                                     notice:format(lang:get("授业中的徒弟不能超过~ts人，无法再进行收徒"),
                                                   [{string_2, 5, 2}])};
                                _ when StudentNum >= 1000000000 ->
                                    {false,
                                     notice:format(lang:get("徒弟多于~ts个，不能再操作了"),
                                                   [{string_2,
                                                     5,
                                                     1000000000}])};
                                _ ->
                                    {ok, TeacherSign} = conver(teacher_sign,
                                                               Role),
                                    teacher_mgr:update_data(teacher_sign,
                                                            TeacherSign#teacher_sign{is_sign
                                                                                         =
                                                                                         1,
                                                                                     msg
                                                                                         =
                                                                                         Msg}),
                                    push_sign(Role),
                                    notice:return(lang:get("您已成功报名师傅，新人玩家前来拜师时，将会优先推荐你")),
                                    ok
                            end;
                        _ ->
                            {ok, TeacherSign} = conver(teacher_sign, Role),
                            teacher_mgr:update_data(teacher_sign,
                                                    TeacherSign#teacher_sign{is_sign
                                                                                 =
                                                                                 1,
                                                                             msg
                                                                                 =
                                                                                 Msg}),
                            push_sign(Role),
                            notice:return(lang:get("您已成功报名师傅，新人玩家前来拜师时，将会优先推荐你")),
                            ok
                    end;
                {false, Reason} -> notice:return(Reason)
            end
    end.

get_sign_list(_Role = #role{m_teacher =
                                #m_teacher{status = 3}},
              _TSex, _TClasses) ->
    {false, lang:get("你已经是师傅，不用在寻找师傅了")};
get_sign_list(_Role = #role{m_teacher =
                                #m_teacher{status = 1}},
              _TSex, _TClasses) ->
    {false, lang:get("你已经是有师傅，不用在寻找师傅了")};
get_sign_list(_Role = #role{lev = Lev}, _TSex,
              _TClasses)
    when Lev < 20 ->
    {false,
     notice:format(lang:get("你的等级已经低于~ts级，不能在寻找师傅"),
                   [{string_2, 5, 20}])};
get_sign_list(Role = #role{id = RoleId, pid = Pid,
                           lev = Lev},
              TSex, TClasses) ->
    MaxLev = get_student_max_lev(Role),
    case Lev > MaxLev of
        true ->
            {false,
             notice:format(lang:get("你的等级已经高于~ts级，不用在寻找师傅了"),
                           [{string_2, 5, MaxLev}])};
        _ ->
            case student_check(Role) of
                {false, Reason} -> {false, Reason};
                ok ->
                    teacher_mgr:cast({get_sign_list,
                                      #{id => RoleId, pid => Pid, sex => TSex,
                                        classes => TClasses, lev => Lev}})
            end
    end.

get_sign_list2(_Role = #role{m_teacher =
                                 #m_teacher{status = 3}}) ->
    {false, lang:get("你已经是师傅，不用在寻找师傅了")};
get_sign_list2(_Role = #role{m_teacher =
                                 #m_teacher{status = 1}}) ->
    {false, lang:get("你已经是有师傅，不用在寻找师傅了")};
get_sign_list2(_Role = #role{lev = Lev})
    when Lev < 20 ->
    {false,
     notice:format(lang:get("你的等级已经低于~ts级，不能在寻找师傅"),
                   [{string_2, 5, 20}])};
get_sign_list2(Role = #role{pid = Pid, lev = Lev}) ->
    MaxLev = get_student_max_lev(Role),
    case Lev > MaxLev of
        true ->
            {false,
             notice:format(lang:get("你的等级已经高于~ts级，不用在寻找师傅了"),
                           [{string_2, 5, MaxLev}])};
        _ ->
            case student_check(Role) of
                {false, Reason} -> {false, Reason};
                ok ->
                    teacher_mgr:cast({get_sign_list2,
                                      #{pid => Pid, lev => Lev}})
            end
    end.

get_student_sign_list(Role = #role{pid = Pid}) ->
    case teacher_check(Role) of
        ok ->
            teacher_mgr:cast({get_studen_sign_list, #{pid => Pid}});
        {false, Reason} -> {false, Reason}
    end.

get_daily(#role{lev = Lev}) ->
    Dailys = teacher_data:dailys(Lev),
    Must = [Id || {Id, 0} <- Dailys],
    WeightList = [I
                  || I = {_, Weight} <- Dailys, Weight > 0],
    RandIds = get_daily_weigth(WeightList, 4, []),
    get_daily(Must ++ RandIds, []).

get_daily([], List) -> List;
get_daily([Id | T], List) ->
    case teacher_data:get_daily(Id) of
        #teacher_daily_data{progress = Progress} ->
            get_daily(T,
                      [#teacher_daily{id = Id, progress = Progress} | List]);
        _ -> get_daily(T, List)
    end.

get_daily_weigth([], _, List) -> List;
get_daily_weigth(_, 0, List) -> List;
get_daily_weigth(WeightList, Num, List) ->
    I = {RandId, _} = util:rand_list(WeightList, 2),
    get_daily_weigth(WeightList -- [I],
                     Num - 1,
                     [RandId | List]).

get_daily_goal(#role{lev = Lev}) ->
    case teacher_data:get_daily_goals(Lev,
                                      date:day_of_the_week(date:unixtime()) rem
                                          2)
        of
        false -> [];
        {_Name,
         Progress,
         _TeacherReward,
         _StudentReward,
         _MaxTimes,
         _TeacherVal,
         _TeacherTitle,
         _TeacherMsg,
         _StudentTitle,
         _StudentMsg} ->
            [#teacher_daily{id = 11, progress = Progress}]
    end.

get_target(_Role) ->
    Ids = teacher_data:targets(),
    get_target(Ids, []).

get_target([], List) -> List;
get_target([Id | T], List) ->
    case teacher_data:get_target(Id) of
        #teacher_target_data{progress = Progress} ->
            get_target(T,
                       [#teacher_target{id = Id, progress = Progress} | List]);
        _ -> get_target(T, List)
    end.

do_agree(Role = #role{id = TRoleId, classes = TClasses,
                      sex = TSex, lev = TLev, pid = TPid, name = TName,
                      m_teacher = MTeacher = #m_teacher{},
                      pos =
                          #pos{map = MapId, map_base_id = MapBaseId, x = X,
                               y = Y}},
         #{student :=
               Student = #student{id = SRoleId, classes = SClasses,
                                  sex = SSex, lev = SLev, name = SName},
           pid := SPid}) ->
    role:send_buff_begin(),
    {ok, Teacher} = conver(teacher, Role),
    case teacher_mgr:call({student, Teacher, Student}) of
        {false, Reason} ->
            role:send_buff_clean(),
            notice:return(Reason),
            notice:send({pid, SPid}, 1, Reason, []),
            ok;
        {ok, #{teacher_score := TeacherScore, num := Num}} ->
            NewMTeacher = MTeacher#m_teacher{status = 3},
            TeacherRole = Role#role{m_teacher = NewMTeacher},
            VarRole = var:add_var(TeacherRole, day, 158, 1),
            NewRole = VarRole,
            Honor = teacher_data:get_teacher_honor(TeacherScore),
            case honor:has_honor(Role, Honor) of
                true -> ignore;
                _ -> honor:add_and_use(TPid, Honor, push)
            end,
            push(NewRole),
            friend:make_friend(TRoleId, SRoleId),
            sys_conn:pack_send(15801,
                               {2,
                                SRoleId,
                                SClasses,
                                SSex,
                                SLev,
                                0,
                                0,
                                SName,
                                ""}),
            role:pack_send(SPid,
                           15801,
                           {4, TRoleId, TClasses, TSex, TLev, 0, 0, TName, ""}),
            role:apply(async,
                       SPid,
                       {teacher, apply_student, [Teacher]}),
            notice:return(notice:format(lang:get("恭喜你收~ts的为徒弟"),
                                        [{role_2, SName}])),
            notice:effect({map, MapId}, 30074, 2, MapBaseId, X, Y),
            notice:effect({role_pid, TPid}, 30075),
            notice:effect({role_pid, SPid}, 30075),
            notice:cast(all,
                        4,
                        notice:format(lang:get("~ts拜入名师~ts的门下，相信不久将来又会出现一名旭日新星{face_1,36}"),
                                      [{role_2, SName}, {role_2, TName}])),
            mail:send(SRoleId,
                      lang:get("拜师成功"),
                      notice:format(lang:get("你已成功拜~ts为师！遇到什么不懂的问题，多多向师傅请教吧！\n每天可打开<color='"
                                             "#ffff00'>师徒面板</color>查看<color='#ffff00'>师徒日常<"
                                             "/color>，完成后请师傅验收能得到丰厚的奖励\n当<color='#ffff00'>等"
                                             "级达到出师等级</color>后，可与师傅组队前往导师德林处<color='#ffff00"
                                             "'>举行出师仪式</color>，出师后师徒双方都能获得丰厚的<color='#ffff0"
                                             "0'>出师大礼包</color>！"),
                                    [{role_2, Role}])),
            role:send_buff_flush(),
            {ok,
             role_trigger:fire(#evt_teacher{num = Num}, NewRole)};
        _ ->
            role:send_buff_clean(),
            notice:return(lang:get("系统繁忙")),
            notice:send({pid, SPid}, 1, lang:get("系统繁忙"), []),
            ok
    end.

student_check(#role{lev = Lev}) when Lev < 20 ->
    {false,
     notice:format(lang:get("等级高于~ts级，才能拜师"),
                   [{string_2, 5, 20}])};
student_check(#role{m_teacher =
                        #m_teacher{status = 2}}) ->
    {false, lang:get("已经出师了，不用再拜师了")};
student_check(#role{m_teacher =
                        #m_teacher{status = 3}}) ->
    {false, lang:get("已经是别人的师傅了，不能拜师了")};
student_check(#role{m_teacher =
                        #m_teacher{status = 1}}) ->
    {false, lang:get("还是徒弟呢，不用再拜师了")};
student_check(Role = #role{lev = Lev,
                           m_teacher = #m_teacher{mtime = MTime}}) ->
    MaxLev = get_student_max_lev(Role),
    case Lev > MaxLev of
        true ->
            {false,
             notice:format(lang:get("等级高于~ts级，不能拜师"),
                           [{string_2, 5, MaxLev}])};
        _ ->
            Now = date:unixtime(),
            DiffDay = Now - MTime,
            case DiffDay < 6 * 3600 of
                true ->
                    {false,
                     notice:format(lang:get("~ts小时以后才能再拜师"),
                                   [{string_2,
                                     5,
                                     util:ceil((6 * 3600 - DiffDay) / 3600)}])};
                _ -> ok
            end
    end.

teacher_check(Role = #role{id = RoleId, lev = Lev,
                           m_teacher = MTeacher}) ->
    Times = var:get_var(Role, day, 158, 0),
    case Times >= 2 of
        false ->
            MinLev = get_teacher_min_lev(Role),
            teacher_check(#{id => RoleId, lev => Lev,
                            m_teacher => MTeacher, min_lev => MinLev});
        _ -> {false, lang:get("您今天收徒数量超过2名,无法继续进行收徒了")}
    end;
teacher_check(#{m_teacher :=
                    #m_teacher{status = Status}})
    when Status == 1 ->
    {false, lang:get("没有出师，不能收徒")};
teacher_check(#{id := RoleId, lev := Lev,
                m_teacher := #m_teacher{mtime = MTime},
                min_lev := MinLev}) ->
    case Lev >= MinLev of
        true ->
            Now = date:unixtime(),
            DiffDay = Now - MTime,
            NewStudents = case teacher_mgr:lookup(RoleId) of
                              #teacher{students = Students} -> Students;
                              _ -> []
                          end,
            StudentStudyNum = length([1
                                      || #student{status = 1} <- NewStudents]),
            StudentNum = length(NewStudents),
            case StudentStudyNum >= 2 of
                true ->
                    {false,
                     notice:format(lang:get("在学徒弟多于~ts个，不能再收徒"),
                                   [{string_2, 5, 2}])};
                _ when StudentNum >= 1000000000 ->
                    {false,
                     notice:format(lang:get("徒弟多于~ts个，不能再收徒"),
                                   [{string_2, 5, 1000000000}])};
                _ when DiffDay < 0 * 3600 ->
                    {false,
                     notice:format(lang:get("~ts小时以后才能再收徒"),
                                   [{string_2,
                                     5,
                                     util:ceil((0 * 3600 - DiffDay) / 3600)}])};
                _ -> ok
            end;
        _ ->
            {false,
             notice:format(lang:get("等级低于~ts级，不能收徒"),
                           [{string_2, 5, MinLev}])}
    end.

update_student_score(TRoleId, SRoleId, List) ->
    case lists:keyfind(90019, 1, List) of
        {_, Score} ->
            teacher_mgr:cast({update_student,
                              TRoleId,
                              SRoleId,
                              add_score,
                              Score});
        {_, _, Score} ->
            teacher_mgr:cast({update_student,
                              TRoleId,
                              SRoleId,
                              add_score,
                              Score});
        _ -> ignore
    end.

get_teacher_min_lev(Role) ->
    {WorldLev, _} = world_lev:get_world_lev(Role),
    logger:debug("==================================:~w",
                 [WorldLev],
                 teacher,
                 1663),
    case teacher_data:get_condition(WorldLev) of
        {_BoundaryLev,
         _GraduateLev,
         NeedLev,
         _AutoGraduateLev} ->
            NeedLev;
        _ -> 50
    end.

get_teacher_min_lev() ->
    {WorldLev, _} = world_lev:get_world_lev(),
    logger:debug("==================================:~w",
                 [WorldLev],
                 teacher,
                 1672),
    case teacher_data:get_condition(WorldLev) of
        {_BoundaryLev,
         _GraduateLev,
         NeedLev,
         _AutoGraduateLev} ->
            NeedLev;
        _ -> 50
    end.

get_student_max_lev(Role) ->
    {WorldLev, _} = world_lev:get_world_lev(Role),
    logger:debug("==================================:~w",
                 [WorldLev],
                 teacher,
                 1683),
    case teacher_data:get_condition(WorldLev) of
        {BoundaryLev,
         _GraduateLev,
         _NeedLev,
         _AutoGraduateLev} ->
            BoundaryLev;
        _ -> 50
    end.

get_student_end_lev(Role) ->
    {WorldLev, _} = world_lev:get_world_lev(Role),
    logger:debug("==================================:~w",
                 [WorldLev],
                 teacher,
                 1695),
    case teacher_data:get_condition(WorldLev) of
        {_BoundaryLev,
         GraduateLev,
         _NeedLev,
         _AutoGraduateLev} ->
            GraduateLev;
        _ -> 65
    end.

get_auto_quit_lev(Role) ->
    {WorldLev, _} = world_lev:get_world_lev(Role),
    logger:debug("==================================:~w",
                 [WorldLev],
                 teacher,
                 1706),
    case teacher_data:get_condition(WorldLev) of
        {_BoundaryLev,
         _GraduateLev,
         _NeedLev,
         AutoGraduateLev} ->
            AutoGraduateLev;
        _ -> 70
    end.

check_student_sign(Role = #role{lev = Lev,
                                m_teacher = #m_teacher{status = Status}}) ->
    {WorldLev, _} = world_lev:get_world_lev(Role),
    case Lev > 20 andalso
             Status =:= 0 andalso
                 Lev =< get_student_max_lev(Role) andalso
                     WorldLev - Lev >= 5
        of
        true -> true;
        _ -> false
    end.

get_point_flag([]) -> false;
get_point_flag([#teacher_daily{finish = 1} | _]) ->
    true;
get_point_flag([#teacher_target{finish = 1} | _]) ->
    true;
get_point_flag([#teacher_target{} | T]) ->
    get_point_flag(T);
get_point_flag([#teacher_daily{} | T]) ->
    get_point_flag(T).

get_point_flag([], _, _) -> false;
get_point_flag([#teacher_target{finish = 1,
                                id = TargetId}
                | T],
               TargetReward, TargetRewarded) ->
    case lists:member(TargetId, TargetRewarded) of
        true -> get_point_flag(T, TargetReward, TargetRewarded);
        _ ->
            case lists:member(TargetId, TargetReward) of
                true -> true;
                _ -> get_point_flag(T, TargetReward, TargetRewarded)
            end
    end;
get_point_flag([#teacher_target{} | T], TeacherReward,
               TargetRewarded) ->
    get_point_flag(T, TeacherReward, TargetRewarded).

get_student_point_flag([], _Now, List) -> List;
get_student_point_flag([#student{id = RoleId,
                                 daily = Daily, daily_time = DailyTime,
                                 target = Target,
                                 target_rewarded = TargetRewarded,
                                 daily_reward = DailyReward,
                                 target_reward = TargetReward}
                        | T],
                       Now, List) ->
    NewDaily = case date:is_same_day(Now, DailyTime) of
                   true -> Daily;
                   _ -> []
               end,
    Flag1 = case NewDaily of
                [] ->
                    case get_point_flag(Target,
                                        TargetReward,
                                        TargetRewarded)
                        of
                        true -> [{RoleId, 1}];
                        _ -> []
                    end;
                _ ->
                    case [1
                          || #teacher_daily{id = Id, finish = 0} <- NewDaily,
                             Id =/= 11]
                        of
                        [] when DailyReward == 0 -> [{RoleId, 1}];
                        _ ->
                            case get_point_flag(Target,
                                                TargetReward,
                                                TargetRewarded)
                                of
                                true -> [{RoleId, 1}];
                                _ -> []
                            end
                    end
            end,
    get_student_point_flag(T, Now, Flag1 ++ List).

levup_update_sign(Role = #role{id = RoleId,
                               lev = Lev}) ->
    case teacher_mgr:lookup(teacher_sign, RoleId) of
        #teacher_sign{} ->
            teacher_mgr:cast({update_sign,
                              RoleId,
                              [{#teacher_sign.lev, Lev}]});
        _ ->
            case teacher_check(Role) of
                ok ->
                    {ok, TeacherSign} = conver(teacher_sign, Role),
                    teacher_mgr:update_data(teacher_sign, TeacherSign);
                _ -> ignore
            end
    end.

get_exp(#{rate := 0}) -> [];
get_exp(#{mode := Mode, lev := Lev, rate := Rate}) ->
    case levup_data:get_exp({Mode, Lev}) of
        #{exp := ExpVal} ->
            Exp = util:ceil(ExpVal * Rate),
            [{90010, 0, Exp}];
        _ -> []
    end.

conver(teacher,
       #role{id = Id, name = Name, sex = Sex, lev = Lev,
             classes = Classes, attr = #attr{fc = Fc},
             m_guild = MGuard}) ->
    {GId, GName} = case MGuard of
                       #m_guild{id = TGid, name = TGName} -> {TGid, TGName};
                       _ -> {{0, "", 0}, ""}
                   end,
    Now = date:unixtime(),
    {ok,
     #teacher{id = Id, name = Name, sex = Sex,
              classes = Classes, lev = Lev, guild_id = GId,
              guild_name = GName, login_time = Now, fc = Fc}};
conver(student,
       #role{id = Id, name = Name, sex = Sex, lev = Lev,
             classes = Classes, m_guild = MGuard}) ->
    {GId, GName} = case MGuard of
                       #m_guild{id = TGid, name = TGName} -> {TGid, TGName};
                       _ -> {{0, "", 0}, ""}
                   end,
    Now = date:unixtime(),
    {ok,
     #student{id = Id, name = Name, sex = Sex, lev = Lev,
              classes = Classes, guild_id = GId, guild_name = GName,
              in_time = Now, login_time = Now, status = 1}};
conver(teacher_sign,
       #role{id = Id, name = Name, sex = Sex, lev = Lev,
             classes = Classes}) ->
    Now = date:unixtime(),
    {ok,
     #teacher_sign{id = Id, name = Name, sex = Sex,
                   classes = Classes, lev = Lev, online = 1,
                   login_time = Now, msg = ""}};
conver(_, _) -> false.

get_quit_honor(1) -> 11081;
get_quit_honor(2) -> 11082;
get_quit_honor(3) -> 11083;
get_quit_honor(_) -> 11084.

get_studen_sign_msg(1) -> lang:get("新人小狂剑找个好师傅收留");
get_studen_sign_msg(2) -> lang:get("有没有师傅愿意收留小魔导啊");
get_studen_sign_msg(3) -> lang:get("小战弓找师傅啦，求收留啊");
get_studen_sign_msg(4) -> lang:get("小兽灵想找个对我好的师傅");
get_studen_sign_msg(5) -> lang:get("萌新秘言找个师傅教我");
get_studen_sign_msg(6) -> lang:get("萌新月魂求师傅带带我");
get_studen_sign_msg(7) -> lang:get("小圣骑找个带我玩的师傅");
get_studen_sign_msg(_) -> lang:get("萌新的我求师傅带带我").

get_teacher_gain(Role = #role{m_teacher =
                                  #m_teacher{status = Status}},
                 Type) ->
    logger:debug("===========", [], teacher, 1852),
    case var:get_var(Role, day, 627, 0) of
        _Val when _Val >= 2 -> Role;
        Val ->
            logger:debug("~w", [Val], teacher, 1856),
            case Status of
                3 ->
                    case is_hava_student_sutudy(Role) of
                        true ->
                            logger:debug("===========", [], teacher, 1861),
                            case teacher_data:get_drop_reward(Type) of
                                {_, Item, Ratio, _, _} ->
                                    logger:debug("===========",
                                                 [],
                                                 teacher,
                                                 1863),
                                    case util:rand(0, 1000) < Ratio of
                                        true ->
                                            make_teacher_gain(Role, Item, Val);
                                        false -> Role
                                    end;
                                _ -> Role
                            end;
                        _ -> Role
                    end;
                1 ->
                    logger:debug("===========", [], teacher, 1869),
                    case teacher_data:get_drop_reward(Type) of
                        {_, _, _, Item, Ratio} ->
                            logger:debug("===========", [], teacher, 1871),
                            case util:rand(0, 1000) < Ratio of
                                true -> make_teacher_gain(Role, Item, Val);
                                false -> Role
                            end;
                        _ -> Role
                    end;
                _ -> Role
            end
    end.

make_teacher_gain(Role, Item, Val) ->
    Gain = format:val_to_gain(Item),
    case role_gain:do_notice(Gain, Role) of
        {ok, Role2} ->
            logger:debug("~w", [Item], teacher, 1881),
            var:set_var(Role2, day, 627, Val + 1);
        {false, #gain{reason = bag_full}} ->
            logger:debug("~w", [Item], teacher, 1884),
            mail:send(Role,
                      lang:get("师徒道具奖励"),
                      lang:get("由于您的背包已满，奖励通过邮件发放，请查收"),
                      Item),
            var:set_var(Role, day, 627, Val + 1);
        _Err ->
            logger:error("天空之塔师徒奖励领取失败，:~w", [_Err], teacher, 1888),
            Role
    end.

