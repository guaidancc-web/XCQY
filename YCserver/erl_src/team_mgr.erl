-file("src/mod/team/team_mgr.erl", 1).

-module(team_mgr).

-behaviour(gen_server).

-export([start_link/0,
         create/1,
         create/2,
         join_apply/2,
         join/2,
         accept_recruitment/2,
         login/1,
         invite/2,
         reply_invite/3,
         info/1,
         update/1,
         stop_matching/1,
         stop_matching/2,
         stop_matching_push/2,
         sync/2,
         fetch/1,
         delete/1,
         match/2,
         apply_role/2,
         lookup/1,
         check/2,
         is_matching/1,
         lookup_recruit/1,
         lookup_recruit/2,
         lookup_members/1,
         accept_recruitment_join/3,
         update_match_mate/1,
         match_info/1,
         get_match/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/team/team_mgr.erl", 44).

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

-file("src/mod/team/team_mgr.erl", 45).

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

-file("src/mod/team/team_mgr.erl", 46).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/team/team_mgr.erl", 47).

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

-file("src/mod/team/team_mgr.erl", 48).

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

-file("src/mod/team/team_mgr.erl", 49).

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

-file("src/mod/team/team_mgr.erl", 50).

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

-file("src/mod/team/team_mgr.erl", 51).

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

-file("src/mod/team/team_mgr.erl", 52).

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

-file("src/mod/team/team_mgr.erl", 53).

-file("inc/help.hrl", 1).

-record(m_help,
        {ver = 1,
         next_id = 1,
         free_ids = [],
         send_msg = [],
         recv_msg = [],
         ext = []}).

-record(help_state,
        {next_record_id = 1, free_record_ids = []}).

-record(help_msg,
        {id = 0,
         help_rid,
         help_id = 0,
         record_id = 0,
         time = 0,
         digit_array = [],
         str_array = [],
         ext = []}).

-record(help_record, {record_id = 0, rid}).

-record(help_data,
        {id = 0 :: pos_integer(),
         title = "",
         fun_type = 0,
         type = 0,
         help_args :: undefined | term()}).

-file("src/mod/team/team_mgr.erl", 54).

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

-file("src/mod/team/team_mgr.erl", 55).

-file("inc/preparation.hrl", 1).

-record(m_preparation,
        {ver = 0,
         pid :: undefined | pid(),
         id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer()}).

-record(preparation_room,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid :: undefined | pid(),
         matching = [] :: list(),
         num = 1,
         matched = 0 :: non_neg_integer(),
         match_ref :: undefined | reference(),
         mode = 1,
         is_open = true :: boolean()}).

-record(preparation_team,
        {ids = [] :: list(),
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(preparation_role,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         s_ride = 0,
         preparation_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         team_id = [] :: list(),
         partner = [] :: list(),
         group = 1 :: non_neg_integer()}).

-record(preparation_show_role,
        {id = {0, "", 0},
         name = "",
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         group = 1 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         looks = [] :: list()}).

-file("src/mod/team/team_mgr.erl", 56).

-file("inc/gods_place.hrl", 1).

-record(gods_place_team_statue,
        {ver = 1,
         team_id = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         members = [],
         qualification = 0,
         serial_id = 0,
         team_leader = {0, "", 0}}).

-record(gods_place_team_mate_statue,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         break_times = 0,
         looks = []}).

-record(m_gods_place,
        {ver = 3,
         group_id = 0,
         zone_id = 0,
         zone_pid = 0,
         pick_chest = 0,
         worship_times = 0,
         total_num = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0,
         efficiency_flag = 0,
         pick_flag = 0}).

-file("src/mod/team/team_mgr.erl", 57).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/team/team_mgr.erl", 58).

-file("inc/canyon_summit.hrl", 1).

-record(canyon_summit_role,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         group_id = 0 :: non_neg_integer(),
         fight = 0 :: non_neg_integer(),
         movability = 1000 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         side = 1,
         pid :: undefined | reference(),
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         operating_unit = 0 :: 0 | tuple(),
         last_operated = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         cannon_attacked = 0 :: non_neg_integer(),
         cannon_used = 0 :: non_neg_integer(),
         guarding_unit = 0 :: non_neg_integer(),
         operating_num = 0 :: non_neg_integer()}).

-record(canyon_summit_side,
        {id = {0, 0, 0} :: {integer(), integer(), integer()},
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         map_id = 0 :: non_neg_integer(),
         match_pid = 0 :: pid(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         remain_unit = 3 :: non_neg_integer(),
         subsidize_buff = [] :: list(),
         all_fc = 0 :: non_neg_integer()}).

-record(canyon_summit_team,
        {ver = 1 :: pos_integer(),
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         team_side = 0,
         battle_id = 0,
         match_pid = undefined :: pid(),
         map_id = 0}).

-record(canyon_summit_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         battle_id = 0 :: non_neg_integer(),
         battle_pid = 0 :: pid(),
         win_side = 0,
         combat_time = 0,
         is_judge = false,
         cannon_ready = false,
         time = 0 :: non_neg_integer()}).

-record(canyon_summit_info,
        {id = {0, 0},
         group_id = 0,
         match_id = 0,
         map_id = 0,
         match_pid = 0,
         black_num = 0,
         red_num = 0,
         black_fc = 0,
         red_fc = 0,
         black_team_num = 0,
         red_team_num = 0}).

-record(canyon_summit_unit,
        {id = {0, 0, 0} :: tuple(),
         match_id = 0 :: non_neg_integer(),
         group_id = 0 :: non_neg_integer(),
         battle_id = 0 :: non_neg_integer(),
         side = 0,
         duration = 1000 :: non_neg_integer(),
         operators = [] :: list(),
         last_operated = 0 :: non_neg_integer()}).

-record(canyon_summit_operator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         side = 0,
         timeout = 0 :: non_neg_integer()}).

-record(canyon_summit_result,
        {id = {0, 0},
         red_fc = 0,
         red_team_num = 0,
         red_role_num = 0,
         black_fc = 0,
         black_team_num = 0,
         black_role_num = 0,
         red_acc_team = 0,
         black_acc_team = 0,
         red_acc_role = 0,
         black_acc_role = 0}).

-file("src/mod/team/team_mgr.erl", 59).

-record(state, {matching_ref}).

match_info(Info) -> team_mgr ! Info.

-spec create(Role :: #role{}) -> {ok,
                                  NewRole :: #role{}} |
                                 {false, Why :: string()}.

create(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("你已经在队伍中")};
create(Role = #role{pos = Pos, s_ride = IsFly,
                    s_event = Event, s_event_pid = EventPid, id = RoleId,
                    cross_type = CrossType}) ->
    case check([escort,
                wedding,
                create_event_combat,
                preparation],
               Role)
        of
        true ->
            {ok, Mate} = role_convert:to(team_mate, Role),
            Result = case CrossType of
                         1 ->
                             cross:call(team,
                                        start,
                                        [Mate#team_mate{status = 1},
                                         Pos,
                                         IsFly]);
                         2 ->
                             big_world:call(team,
                                            start,
                                            [Mate#team_mate{status = 1},
                                             Pos,
                                             IsFly]);
                         _ -> team:start(Mate#team_mate{status = 1}, Pos, IsFly)
                     end,
            case Result of
                {ok, Pid} ->
                    NewRole = Role#role{m_team =
                                            #m_team{pid = Pid, status = 1,
                                                    member_num = 1}},
                    map:role_update(NewRole),
                    team_util:notice_team_status(Event,
                                                 EventPid,
                                                 [Mate],
                                                 [{leader, RoleId}]),
                    NewRole2 = case Event of
                                   66 -> provocation_role:create_team(NewRole);
                                   _ -> NewRole
                               end,
                    {ok, NewRole2};
                {error, center_not_ready} ->
                    {false, lang:get("无法创建队伍,时空波动")};
                _ -> {false, lang:get("无法创建队伍")}
            end;
        Else -> Else
    end.

-spec create(Role :: #role{}, Args :: map()) -> {ok,
                                                 NewRole :: #role{}} |
                                                {false, Why :: string()}.

create(#role{m_team = #m_team{pid = Pid}}, _Args)
    when is_pid(Pid) ->
    {false, lang:get("你已经在队伍中")};
create(Role = #role{pos = Pos, s_ride = IsFly,
                    s_event = Event, s_event_pid = EventPid, id = RoleId,
                    cross_type = CrossType},
       Args = #team_start_args{}) ->
    case check([escort, wedding, event_combat, preparation],
               Role)
        of
        true ->
            {ok, Mate} = role_convert:to(team_mate, Role),
            NewStartArgs = Args#team_start_args{pos = Pos,
                                                is_fly = IsFly},
            Result = case CrossType of
                         1 ->
                             cross:call(team,
                                        start,
                                        [Mate#team_mate{status = 1},
                                         Pos,
                                         IsFly]);
                         2 ->
                             big_world:call(team,
                                            start,
                                            [Mate#team_mate{status = 1},
                                             Pos,
                                             IsFly]);
                         _ ->
                             team:start(Mate#team_mate{status = 1},
                                        NewStartArgs)
                     end,
            case Result of
                {ok, Pid} ->
                    NewRole = Role#role{m_team =
                                            #m_team{pid = Pid, status = 1,
                                                    member_num = 1}},
                    map:role_update(NewRole),
                    team_util:notice_team_status(Event,
                                                 EventPid,
                                                 [Mate],
                                                 [{leader, RoleId}]),
                    NewRole2 = case Event of
                                   66 -> provocation_role:create_team(NewRole);
                                   _ -> NewRole
                               end,
                    {ok, NewRole2};
                {error, center_not_ready} ->
                    {false, lang:get("无法创建队伍,时空波动")};
                _ -> {false, lang:get("无法创建队伍")}
            end;
        Else -> Else
    end;
create(_Role, _Args) -> {false, lang:get("无法创建队伍")}.

lookup(Id) ->
    role:apply(sync, Id, {team_mgr, apply_role, [lookup]}).

lookup_members(Id) ->
    role:apply(sync,
               Id,
               {team_mgr, apply_role, [lookup_members]}).

join(Role = #role{s_event = 63,
                  m_gods_place = #m_gods_place{zone_id = ZoneId}},
     LeaderId) ->
    case role_query:attr(by_id,
                         LeaderId,
                         [#role.m_gods_place])
        of
        {ok, [#m_gods_place{zone_id = ZoneId}]} ->
            case role_misc:is_local_role(LeaderId) of
                true -> join_apply(Role, LeaderId);
                _ ->
                    {false,
                     lang:get("<color='#00ff00'>诸神殿堂</color>无法对其他服玩家发起组队")}
            end;
        _ -> {false, lang:get("不在同一张活动地图中无法组队")}
    end;
join(Role = #role{s_event = 72, lev = Lev1,
                  m_lev_break = #m_lev_break{times = BKTimes1}},
     LeaderId) ->
    case role_query:attr(by_id,
                         LeaderId,
                         [#role.lev, #role.m_lev_break])
        of
        {ok, [Lev2, #m_lev_break{times = BKTimes2}]} ->
            case canyon_summit_data:get_group(Lev1, BKTimes1) =:=
                     canyon_summit_data:get_group(Lev2, BKTimes2)
                of
                true -> join_apply(Role, LeaderId);
                _ -> {false, lang:get("不在同一等级段，无法组队")}
            end;
        _ -> {false, lang:get("对方不在线")}
    end;
join(Role = #role{s_event = 73, id = RoleId},
     LeaderId) ->
    case cross:call(canyon_summit_mgr,
                    call,
                    [{query_role, LeaderId}])
        of
        #canyon_summit_role{group_id = GroupId,
                            match_id = MatchId, side = Side, pid = LeadPid}
            when is_pid(LeadPid) ->
            case cross:call(canyon_summit_mgr,
                            call,
                            [{query_role, RoleId}])
                of
                #canyon_summit_role{group_id = GroupId,
                                    match_id = MatchId, side = Side} ->
                    join_apply(Role, LeaderId);
                _ -> {false, lang:get("不在同一战场或阵营，无法组队")}
            end;
        _ -> {false, lang:get("对方不在峡谷之巅活动中或已下线，不能进队")}
    end;
join(Role = #role{cross_type = CrossType = 1},
     LeaderId) ->
    case role_query:attr(by_id,
                         LeaderId,
                         [#role.cross_type,
                          #role.name,
                          #role.lev,
                          #role.s_event])
        of
        {ok, [_, _, _, 1 | _]} -> {false, lang:get("对方正在副本中")};
        {ok, [_, _, _, 63 | _]} ->
            {false, lang:get("对方正在诸神殿堂中")};
        {ok, [CrossType | _]} -> join_apply(Role, LeaderId);
        {ok, [MateCrossType, MateName, MateLev | _]} ->
            case role_misc:is_local_role(LeaderId) of
                true ->
                    role:pack_send(Role,
                                   11738,
                                   {LeaderId,
                                    MateName,
                                    MateLev,
                                    MateCrossType}),
                    true;
                _ -> {false, lang:get("对方不是同一服的玩家")}
            end;
        _ -> {false, lang:get("对方不在线")}
    end;
join(Role = #role{cross_type = CrossType}, LeaderId) ->
    case role_misc:is_local_role(LeaderId) of
        true ->
            case role_query:attr(by_id,
                                 LeaderId,
                                 [#role.cross_type,
                                  #role.name,
                                  #role.lev,
                                  #role.s_event])
                of
                {ok, [_, _, _, 1 | _]} -> {false, lang:get("对方正在副本中")};
                {ok, [_, _, _, 63 | _]} ->
                    {false, lang:get("对方正在诸神殿堂中")};
                {ok, [CrossType | _]} -> join_apply(Role, LeaderId);
                {ok, [MateCrossType, MateName, MateLev | _]} ->
                    case role_misc:is_local_role(LeaderId) of
                        true ->
                            role:pack_send(Role,
                                           11738,
                                           {LeaderId,
                                            MateName,
                                            MateLev,
                                            MateCrossType}),
                            true;
                        _ -> {false, lang:get("对方不是同一服的玩家")}
                    end;
                _ -> {false, lang:get("对方不在线")}
            end;
        _ -> {false, lang:get("对方不是同一服的玩家")}
    end.

-spec join_apply(Role :: #role{},
                 LeaderId :: tuple()) -> {ok, NewRole :: #role{}} |
                                         {false, Why :: string()}.

join_apply(#role{m_team = #m_team{pid = Pid}},
           _LeaderId)
    when is_pid(Pid) ->
    {false, lang:get("你已经在队伍中")};
join_apply(Role = #role{cross_type = CrossType},
           LeaderId) ->
    case check([escort,
                wedding,
                warrior,
                tournament,
                preparation,
                dungeon_team,
                provocation],
               Role)
        of
        true ->
            case reply_invite(Role, LeaderId, 1) of
                {ok, NewRole} -> {ok, NewRole};
                _ ->
                    FetchResult = case CrossType of
                                      1 ->
                                          cross:call(team_mgr,
                                                     fetch,
                                                     [LeaderId]);
                                      2 ->
                                          big_world:call(team_mgr,
                                                         fetch,
                                                         [LeaderId]);
                                      _ -> fetch(LeaderId)
                                  end,
                    case FetchResult of
                        #team_mate{team_pid = Pid} when is_pid(Pid) ->
                            {ok, Mate} = role_convert:to(team_mate, Role),
                            TeamRecruitment = case CrossType of
                                                  1 ->
                                                      cross:call(ets,
                                                                 lookup,
                                                                 [team_recruitment,
                                                                  Pid]);
                                                  _ ->
                                                      ets:lookup(team_recruitment,
                                                                 Pid)
                                              end,
                            case do_match(Role,
                                          Mate#team_mate{expect_type = [0]},
                                          date:unixtime(),
                                          TeamRecruitment)
                                of
                                {ok, NewRole} -> {ok, NewRole};
                                _ ->
                                    case team:join_apply(Pid,
                                                         Mate,
                                                         #{cross_type =>
                                                               CrossType})
                                        of
                                        ok -> ok;
                                        Else -> Else
                                    end
                            end;
                        _ -> {false, lang:get("队伍不存在")}
                    end
            end;
        Else -> Else
    end.

accept_recruitment(_Role = #role{m_team =
                                     #m_team{pid = Pid}},
                   _LeaderId)
    when is_pid(Pid) ->
    {false, lang:get("你已经有队伍")};
accept_recruitment(Role = #role{cross_type = 1},
                   LeaderId) ->
    case check([escort, wedding, event_combat, preparation],
               Role)
        of
        true ->
            case role_query:attr(by_id, LeaderId, [#role.s_event])
                of
                {ok, [43]} -> dungeon_team:reply_invite(Role, LeaderId);
                _ ->
                    case cross:call(team_mgr, fetch, [LeaderId]) of
                        Mate = #team_mate{team_pid = Pid} when is_pid(Pid) ->
                            case cross:call(ets,
                                            lookup,
                                            [team_recruitment, Pid])
                                of
                                [Recruitment = #team_recruitment{}] ->
                                    accept_recruitment_join(Role,
                                                            Recruitment,
                                                            Mate);
                                _E -> {false, lang:get("招募已过期")}
                            end;
                        _ -> {false, lang:get("队伍不存在")}
                    end
            end;
        Else -> Else
    end;
accept_recruitment(Role, LeaderId) ->
    case check([escort, wedding, event_combat, preparation],
               Role)
        of
        true ->
            case role_query:attr(by_id, LeaderId, [#role.s_event])
                of
                {ok, [43]} -> dungeon_team:reply_invite(Role, LeaderId);
                _ ->
                    case fetch(LeaderId) of
                        Mate = #team_mate{team_pid = Pid} when is_pid(Pid) ->
                            case ets:lookup(team_recruitment, Pid) of
                                [Recruitment = #team_recruitment{}] ->
                                    accept_recruitment_join(Role,
                                                            Recruitment,
                                                            Mate);
                                _ -> {false, lang:get("招募已过期")}
                            end;
                        _ -> {false, lang:get("队伍不存在")}
                    end
            end;
        Else -> Else
    end.

accept_recruitment_join(Role,
                        #team_recruitment{type = Type},
                        #team_mate{team_pid = TeamPid}) ->
    {ok, Mate} = role_convert:to(team_mate, Role),
    case team:join(TeamPid,
                   Mate#team_mate{join_type = 2, join_sub_type = Type},
                   Role)
        of
        ok ->
            NewRole = Role#role{m_team = #m_team{pid = TeamPid}},
            role:pack_send(Role, 11720, {1, lang:get("")}),
            {ok, NewRole};
        {ok, NRole} ->
            NewRole = NRole#role{m_team = #m_team{pid = TeamPid}},
            role:pack_send(Role, 11720, {1, lang:get("")}),
            {ok, NewRole};
        {false, Why} -> {false, Why}
    end.

update_match_mate(Role) ->
    case is_matching(Role) of
        true ->
            {ok, Mate} = role_convert:to(team_mate, Role),
            team_mgr ! {add_match, Mate};
        _ -> ignore
    end,
    ok.

-spec login(#role{}) -> ok.

login(Role = #role{id = Id, cross_type = 1}) ->
    case cross:call(team_mgr, fetch, [Id]) of
        #team_mate{team_pid = Pid} when is_pid(Pid) ->
            {ok, Mate} = role_convert:to(team_mate, Role),
            team:login(Pid, Mate),
            team_recruit:reg(Role),
            ok;
        _ ->
            team_recruit:reg(Role),
            ok
    end;
login(Role = #role{id = Id, cross_type = 2}) ->
    case big_world:call(team_mgr, fetch, [Id]) of
        #team_mate{team_pid = Pid} when is_pid(Pid) ->
            {ok, Mate} = role_convert:to(team_mate, Role),
            team:login(Pid, Mate),
            team_recruit:reg(Role),
            ok;
        _ ->
            team_recruit:reg(Role),
            ok
    end;
login(Role = #role{id = Id}) ->
    case fetch(Id) of
        #team_mate{team_pid = Pid} when is_pid(Pid) ->
            {ok, Mate} = role_convert:to(team_mate, Role),
            team:login(Pid, Mate),
            team_recruit:reg(Role),
            ok;
        _ ->
            team_recruit:reg(Role),
            ok
    end.

-spec invite(#role{}, MateId :: tuple()) -> ok |
                                            {false, Why :: string()}.

invite(#role{id = MateId}, MateId) ->
    {false, lang:get("请邀请别人吧")};
invite(Role = #role{m_team = #m_team{pid = Pid},
                    s_event = 63,
                    m_gods_place = #m_gods_place{zone_id = ZoneId}},
       MateId)
    when is_pid(Pid) ->
    case role_misc:is_local_role(MateId) of
        true ->
            case role_query:attr(by_id,
                                 MateId,
                                 [#role.m_gods_place])
                of
                {ok, [#m_gods_place{zone_id = ZoneId}]} ->
                    case check([escort,
                                warrior,
                                tournament,
                                sworn,
                                preparation,
                                dungeon_team,
                                event_dungeon,
                                provocation],
                               Role)
                        of
                        true ->
                            case team:verify(Role, MateId, 1) of
                                ok -> ok;
                                _ -> do_invite(Role, MateId)
                            end;
                        Else -> Else
                    end;
                {ok, [#m_gods_place{zone_id = 0}]} ->
                    {false, lang:get("对方不在活动中，不能发起邀请")};
                _ -> {false, lang:get("不在同一张活动地图中无法邀请组队")}
            end;
        _ ->
            {false,
             lang:get("<color='#00ff00'>诸神殿堂</color>无法对其他服玩家发起组队")}
    end;
invite(Role = #role{m_team = #m_team{pid = undefined},
                    s_event = 63,
                    m_gods_place = #m_gods_place{zone_id = ZoneId}},
       MateId) ->
    case role_misc:is_local_role(MateId) of
        true ->
            case role_query:attr(by_id,
                                 MateId,
                                 [#role.m_gods_place])
                of
                {ok, [#m_gods_place{zone_id = ZoneId}]} ->
                    case check([escort,
                                warrior,
                                tournament,
                                sworn,
                                preparation,
                                dungeon_team,
                                event_dungeon,
                                provocation],
                               Role)
                        of
                        true ->
                            case fetch(MateId) of
                                #team_mate{team_pid = Pid} when is_pid(Pid) ->
                                    join_apply(Role, MateId);
                                _ ->
                                    case check([escort,
                                                warrior,
                                                tournament,
                                                sworn,
                                                preparation,
                                                dungeon_team,
                                                provocation],
                                               Role)
                                        of
                                        true -> do_invite(Role, MateId);
                                        Else -> Else
                                    end
                            end;
                        Else -> Else
                    end;
                {ok, [#m_gods_place{zone_id = 0}]} ->
                    {false, lang:get("对方不在活动中，不能发起邀请")};
                _ -> {false, lang:get("不在同一张活动地图中无法邀请组队")}
            end;
        false -> {false, lang:get("不是同一个服的不能组队")}
    end;
invite(Role = #role{m_team = #m_team{pid = Pid},
                    s_event = 72, lev = Lev1,
                    m_lev_break = #m_lev_break{times = BKTimes1}},
       MateId)
    when is_pid(Pid) ->
    case role_query:attr(by_id,
                         MateId,
                         [#role.lev, #role.m_lev_break])
        of
        {ok, [Lev2, #m_lev_break{times = BKTimes2}]} ->
            case canyon_summit_data:get_group(Lev1, BKTimes1) =:=
                     canyon_summit_data:get_group(Lev2, BKTimes2)
                of
                true ->
                    case check([escort,
                                warrior,
                                tournament,
                                sworn,
                                preparation,
                                dungeon_team,
                                event_dungeon,
                                provocation],
                               Role)
                        of
                        true ->
                            case team:verify(Role, MateId, 1) of
                                ok -> ok;
                                _ -> do_invite(Role, MateId)
                            end;
                        Else -> Else
                    end;
                _ ->
                    {false, lang:get("对方与你不属于同一战场分组，无法组队哦~{face_1,22}")}
            end;
        _ -> {false, lang:get("对方不在线，无法邀请")}
    end;
invite(Role = #role{m_team = #m_team{pid = undefined},
                    s_event = 72, lev = Lev1,
                    m_lev_break = #m_lev_break{times = BKTimes1}},
       MateId) ->
    case role_query:attr(by_id,
                         MateId,
                         [#role.lev, #role.m_lev_break])
        of
        {ok, [Lev2, #m_lev_break{times = BKTimes2}]} ->
            case canyon_summit_data:get_group(Lev1, BKTimes1) =:=
                     canyon_summit_data:get_group(Lev2, BKTimes2)
                of
                true ->
                    case check([escort,
                                warrior,
                                tournament,
                                sworn,
                                preparation,
                                dungeon_team,
                                event_dungeon,
                                provocation],
                               Role)
                        of
                        true ->
                            case cross:call(team_mgr, fetch, [MateId]) of
                                #team_mate{team_pid = Pid} when is_pid(Pid) ->
                                    join_apply(Role, MateId);
                                _ ->
                                    case check([escort,
                                                warrior,
                                                tournament,
                                                sworn,
                                                preparation,
                                                dungeon_team,
                                                provocation],
                                               Role)
                                        of
                                        true -> do_invite(Role, MateId);
                                        Else -> Else
                                    end
                            end;
                        Else -> Else
                    end;
                _ ->
                    {false, lang:get("对方与你不属于同一战场分组，无法组队哦~{face_1,22}")}
            end;
        _ -> {false, lang:get("对方不在线，无法邀请")}
    end;
invite(Role = #role{m_team = #m_team{pid = Pid},
                    id = RoleId, s_event = 73},
       MateId)
    when is_pid(Pid) ->
    case cross:call(canyon_summit_mgr,
                    call,
                    [{query_role, MateId}])
        of
        #canyon_summit_role{group_id = GroupId,
                            match_id = MatchId, side = Side, pid = MatePid}
            when is_pid(MatePid) ->
            case cross:call(canyon_summit_mgr,
                            call,
                            [{query_role, RoleId}])
                of
                #canyon_summit_role{group_id = GroupId,
                                    match_id = MatchId, side = Side} ->
                    case check([escort,
                                warrior,
                                tournament,
                                sworn,
                                preparation,
                                dungeon_team,
                                event_dungeon,
                                provocation],
                               Role)
                        of
                        true ->
                            case team:verify(Role, MateId, 1) of
                                ok -> ok;
                                _ -> do_invite(Role, MateId)
                            end;
                        Else -> Else
                    end;
                _ -> {false, lang:get("不在同一战场或阵营，无法组队")}
            end;
        _ -> {false, lang:get("对方不在峡谷之巅活动中或已下线，不能组队")}
    end;
invite(Role = #role{m_team = #m_team{pid = undefined},
                    id = RoleId, s_event = 73},
       MateId) ->
    case cross:call(canyon_summit_mgr,
                    call,
                    [{query_role, MateId}])
        of
        #canyon_summit_role{group_id = GroupId,
                            match_id = MatchId, side = Side, pid = MatePid}
            when is_pid(MatePid) ->
            case cross:call(canyon_summit_mgr,
                            call,
                            [{query_role, RoleId}])
                of
                #canyon_summit_role{group_id = GroupId,
                                    match_id = MatchId, side = Side} ->
                    case check([escort,
                                warrior,
                                tournament,
                                sworn,
                                preparation,
                                dungeon_team,
                                event_dungeon,
                                provocation],
                               Role)
                        of
                        true ->
                            case cross:call(team_mgr, fetch, [MateId]) of
                                #team_mate{team_pid = Pid} when is_pid(Pid) ->
                                    join_apply(Role, MateId);
                                _ ->
                                    case check([escort,
                                                warrior,
                                                tournament,
                                                sworn,
                                                preparation,
                                                dungeon_team,
                                                provocation],
                                               Role)
                                        of
                                        true -> do_invite(Role, MateId);
                                        Else -> Else
                                    end
                            end;
                        Else -> Else
                    end;
                _ -> {false, lang:get("不在同一战场或阵营，无法组队")}
            end;
        _ -> {false, lang:get("对方不在峡谷之巅活动中或已下线，不能组队")}
    end;
invite(Role = #role{m_team =
                        #m_team{pid = Pid, member_num = _MembersNum},
                    cross_type = 1},
       MateId)
    when is_pid(Pid) ->
    case role_misc:is_cross_role(MateId) of
        true ->
            case check([escort,
                        warrior,
                        tournament,
                        sworn,
                        preparation,
                        dungeon_team,
                        event_dungeon,
                        provocation,
                        canyon_summit],
                       Role)
                of
                true ->
                    case team:verify(Role, MateId, 1) of
                        ok -> ok;
                        _ -> do_invite(Role, MateId)
                    end;
                Else -> Else
            end;
        false -> {false, lang:get("无法邀请非同组跨服的玩家组队")}
    end;
invite(Role = #role{m_team =
                        #m_team{pid = Pid, member_num = _MembersNum},
                    cross_type = _CrossType},
       MateId)
    when is_pid(Pid) ->
    case role_misc:is_local_role(MateId) of
        true ->
            case check([escort,
                        warrior,
                        tournament,
                        sworn,
                        preparation,
                        event_dungeon,
                        provocation],
                       Role)
                of
                true ->
                    case team:verify(Role, MateId, 1) of
                        ok -> ok;
                        _ -> do_invite(Role, MateId)
                    end;
                Else -> Else
            end;
        _ -> {false, lang:get("不在跨服状态无法组跨服好友")}
    end;
invite(Role = #role{m_team = #m_team{pid = undefined},
                    cross_type = CrossType = 1},
       MateId) ->
    case role_misc:is_cross_role(MateId) of
        true ->
            case role_query:attr(by_id,
                                 MateId,
                                 [#role.cross_type,
                                  #role.name,
                                  #role.lev,
                                  #role.m_team,
                                  #role.s_event])
                of
                {ok, [_, _, _, _, 1 | _]} ->
                    {false, lang:get("对方正在副本中")};
                {ok, [_, _, _, _, 63 | _]} ->
                    {false, lang:get("对方正在诸神殿堂活动中")};
                {ok, [_, _, _, _, 72 | _]} ->
                    {false, lang:get("对方正在峡谷之巅活动中")};
                {ok, [CrossType | _]} ->
                    case cross:call(team_mgr, fetch, [MateId]) of
                        #team_mate{team_pid = Pid} when is_pid(Pid) ->
                            join_apply(Role, MateId);
                        _ ->
                            case check([escort,
                                        warrior,
                                        tournament,
                                        sworn,
                                        preparation,
                                        dungeon_team,
                                        event_dungeon,
                                        provocation],
                                       Role)
                                of
                                true -> do_invite(Role, MateId);
                                Else -> Else
                            end
                    end;
                {ok,
                 [MateCrossType,
                  MateName,
                  MateLev,
                  #m_team{pid = TeamPid}
                  | _]}
                    when is_pid(TeamPid) ->
                    role:pack_send(Role,
                                   11738,
                                   {MateId, MateName, MateLev, MateCrossType}),
                    true;
                {ok, [_ | _]} ->
                    case check([escort,
                                warrior,
                                tournament,
                                sworn,
                                preparation,
                                dungeon_team,
                                event_dungeon,
                                provocation],
                               Role)
                        of
                        true -> do_invite(Role, MateId);
                        Else -> Else
                    end;
                _ -> {false, lang:get("对方不在线")}
            end;
        false -> {false, lang:get("非同组跨服无法组队")}
    end;
invite(Role = #role{m_team = #m_team{pid = undefined},
                    cross_type = CrossType},
       MateId) ->
    case role_misc:is_local_role(MateId) of
        true ->
            case role_query:attr(by_id,
                                 MateId,
                                 [#role.cross_type,
                                  #role.name,
                                  #role.lev,
                                  #role.m_team,
                                  #role.s_event])
                of
                {ok, [_, _, _, _, 1 | _]} ->
                    {false, lang:get("对方正在副本中")};
                {ok, [_, _, _, _, 63 | _]} ->
                    {false, lang:get("对方正在诸神殿堂活动中")};
                {ok, [_, _, _, _, 72 | _]} ->
                    {false, lang:get("对方正在峡谷之巅活动中")};
                {ok, [CrossType | _]} ->
                    case fetch(MateId) of
                        #team_mate{team_pid = Pid} when is_pid(Pid) ->
                            join_apply(Role, MateId);
                        _ ->
                            case check([escort,
                                        warrior,
                                        tournament,
                                        sworn,
                                        preparation,
                                        dungeon_team,
                                        provocation],
                                       Role)
                                of
                                true -> do_invite(Role, MateId);
                                Else -> Else
                            end
                    end;
                {ok,
                 [MateCrossType,
                  MateName,
                  MateLev,
                  #m_team{pid = TeamPid}
                  | _]}
                    when is_pid(TeamPid) ->
                    role:pack_send(Role,
                                   11738,
                                   {MateId, MateName, MateLev, MateCrossType}),
                    true;
                {ok, [_ | _]} ->
                    case check([escort,
                                warrior,
                                tournament,
                                sworn,
                                preparation,
                                dungeon_team,
                                provocation],
                               Role)
                        of
                        true -> do_invite(Role, MateId);
                        Else -> Else
                    end;
                _ -> {false, lang:get("对方不在线")}
            end;
        _ -> {false, lang:get("不在跨服状态无法组跨服好友")}
    end;
invite(_, _) -> {false, lang:get("当前不能邀请其他玩家")}.

do_invite(#role{m_team =
                    #m_team{pid = Pid, member_num = MembersNum,
                            status = Status},
                cross_type = CrossType = 1, id = Id, name = Name,
                face = Faceid, sex = Sex, classes = Classes, lev = Lev},
          MateId) ->
    Recruit = case catch cross:call(ets,
                                    lookup,
                                    [team_recruitment, Pid])
                  of
                  [R0 = #team_recruitment{}] when Status =:= 1 ->
                      R0#team_recruitment{inviter_status = 1};
                  _ ->
                      NewStatus = case is_pid(Pid) of
                                      true -> Status;
                                      _ -> 0
                                  end,
                      NewPid = case is_pid(Pid) of
                                   true -> Pid;
                                   _ -> Id
                               end,
                      #team_recruitment{id = Id, name = Name,
                                        face_id = Faceid, sex = Sex,
                                        classes = Classes, lev = Lev,
                                        member_num = max(1, MembersNum),
                                        inviter_status = NewStatus,
                                        pid = NewPid, cross_type = CrossType}
              end,
    case role:apply(sync,
                    MateId,
                    {team_mgr, apply_role, [{invite, Recruit}]})
        of
        {true, Msg} -> {true, Msg};
        {false, Reason} -> {false, Reason};
        _E ->
            logger:debug("~w", [_E], team_mgr, 689),
            {false, lang:get("对方正忙，请稍后邀请")}
    end;
do_invite(#role{m_team =
                    #m_team{pid = Pid, member_num = MembersNum,
                            status = Status},
                cross_type = CrossType, id = Id, name = Name,
                face = Faceid, sex = Sex, classes = Classes, lev = Lev},
          MateId) ->
    Recruit = case catch ets:lookup(team_recruitment, Pid)
                  of
                  [R0 = #team_recruitment{}] when Status =:= 1 ->
                      R0#team_recruitment{inviter_status = 1};
                  _ ->
                      NewStatus = case is_pid(Pid) of
                                      true -> Status;
                                      _ -> 0
                                  end,
                      NewPid = case is_pid(Pid) of
                                   true -> Pid;
                                   _ -> Id
                               end,
                      #team_recruitment{id = Id, name = Name,
                                        face_id = Faceid, sex = Sex,
                                        classes = Classes, lev = Lev,
                                        member_num = max(1, MembersNum),
                                        inviter_status = NewStatus,
                                        pid = NewPid, cross_type = CrossType}
              end,
    case role:apply(sync,
                    MateId,
                    {team_mgr, apply_role, [{invite, Recruit}]})
        of
        {true, Msg} -> {true, Msg};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("对方正忙，请稍后邀请")}
    end.

-spec reply_invite(#role{}, _InviteId :: tuple(),
                   Type :: non_neg_integer()) -> {ok, NewRole :: #role{}} |
                                                 {false, Why :: string()}.

reply_invite(#role{m_team = #m_team{pid = Pid}},
             _InviteId, 1)
    when is_pid(Pid) ->
    {false, lang:get("你已在队伍中")};
reply_invite(#role{id = MateId}, MateId, _) ->
    {false, lang:get("同意自己的邀请？")};
reply_invite(Role = #role{m_team =
                              MT = #m_team{applys = Applys}},
             InviteId, Type) ->
    case check([escort,
                warrior,
                tournament,
                sworn,
                preparation,
                dungeon_team,
                provocation],
               Role)
        of
        true ->
            Now = date:unixtime(),
            case lists:keyfind(InviteId,
                               #team_recruitment.id,
                               Applys)
                of
                #team_recruitment{matched = Matched}
                    when Now - Matched < 180 ->
                    NewApplys = lists:keydelete(InviteId,
                                                #team_recruitment.id,
                                                Applys),
                    do_reply_invit(Role#role{m_team =
                                                 MT#m_team{applys = NewApplys}},
                                   InviteId,
                                   Type);
                #team_recruitment{} ->
                    NewApplys = lists:keydelete(InviteId,
                                                #team_recruitment.id,
                                                Applys),
                    {false,
                     lang:get("邀请已过期"),
                     Role#role{m_team = MT#m_team{applys = NewApplys}}};
                _R ->
                    case role_query:attr(by_id, InviteId, [#role.s_event])
                        of
                        {ok, [43]} -> dungeon_team:reply_invite(Role, InviteId);
                        _ ->
                            logger:debug("其他原因 ~w", [_R], team_mgr, 734),
                            {false, lang:get("邀请已过期")}
                    end
            end;
        Else -> Else
    end.

info(#role{lev = _Lev}) ->
    TeamNum = length([P
                      || #team_recruitment{pid = P}
                             <- ets:tab2list(team_recruitment)]),
    MateNum = length([P
                      || #team_mate{pid = P}
                             <- ets:tab2list(team_mate_matching)]),
    {TeamNum, MateNum}.

match(#role{m_team = #m_team{pid = Pid}}, _Type)
    when is_pid(Pid) ->
    {false, lang:get("你已经在队伍中")};
match(_, []) -> {false, lang:get("请选择匹配类型")};
match(#role{cross_type = 2}, _Type) ->
    {false, lang:get("当前状态不能匹配")};
match(Role = #role{cross_type = CrossType}, Type) ->
    case check([event_combat,
                wedding,
                escort,
                {hero_match, Type},
                preparation],
               Role)
        of
        true ->
            List = case CrossType of
                       1 -> cross:call(ets, tab2list, [team_recruitment]);
                       _ -> ets:tab2list(team_recruitment)
                   end,
            {ok, Mate} = role_convert:to(team_mate, Role),
            Now = date:unixtime(),
            Mate1 = Mate#team_mate{expect_type = Type},
            case erlang:get(team_matched) of
                MatchedL when is_list(MatchedL) ->
                    erlang:put(team_matched,
                               [O
                                || O = {_, Last} <- MatchedL,
                                   Now - Last < 180]);
                _ -> erlang:put(team_matched, [])
            end,
            erlang:put(team_center, false),
            case is_list(List) of
                true ->
                    case do_match(Role,
                                  Mate1#team_mate{expect_type = Type -- [0]},
                                  Now,
                                  List)
                        of
                        {ok, NewRole} when CrossType == 1 ->
                            cross:cast(team_mgr,
                                       match_info,
                                       [{new_match, Mate1}]),
                            {ok, NewRole};
                        {ok, NewRole} ->
                            team_mgr ! {new_match, Mate1},
                            {ok, NewRole};
                        ok ->
                            case lists:member(0, Type) of
                                true ->
                                    case do_match(Role,
                                                  Mate1#team_mate{expect_type =
                                                                      [0]},
                                                  Now,
                                                  List)
                                        of
                                        ok when CrossType == 1 ->
                                            cross:cast(team_mgr,
                                                       match_info,
                                                       [{new_match, Mate1}]),
                                            ok;
                                        ok ->
                                            team_mgr ! {new_match, Mate1},
                                            ok;
                                        {ok, NewRole} when CrossType == 1 ->
                                            cross:cast(team_mgr,
                                                       match_info,
                                                       [{new_match, Mate1}]),
                                            {ok, NewRole};
                                        {ok, NewRole} ->
                                            team_mgr ! {new_match, Mate1},
                                            {ok, NewRole};
                                        Else -> Else
                                    end;
                                _ when CrossType == 1 ->
                                    cross:cast(team_mgr,
                                               match_info,
                                               [{new_match, Mate1}]),
                                    ok;
                                _ ->
                                    team_mgr ! {new_match, Mate1},
                                    ok
                            end
                    end;
                _ -> {false, lang:get("没有找到队伍列表")}
            end;
        Else -> Else
    end.

-spec update(Mate :: #team_mate{}) -> ok.

update(Mate = #team_mate{id = Id}) ->
    stop_matching(Id),
    ets:insert(team_mate, Mate).

stop_matching(#role{id = Id, pid = Pid,
                    cross_type = 1}) ->
    case cross:call(team_mgr, is_matching, [Id]) of
        true ->
            cross:cast(team_mgr, stop_matching_push, [Id, Pid]),
            true;
        _ -> ok
    end;
stop_matching(#role{id = Id, pid = Pid}) ->
    case team_mgr:is_matching(Id) of
        true -> stop_matching_push(Id, Pid);
        _ -> ok
    end;
stop_matching(MateId) ->
    ets:delete(team_mate_matching, MateId).

stop_matching(#role{id = Id, pid = Pid, cross_type = 1},
              Types) ->
    case cross:call(team_mgr, stop_matching, [Id, Types]) of
        true -> role:pack_send(Pid, 11720, {1, lang:get("")});
        _ -> ok
    end;
stop_matching(#role{id = Id, pid = Pid}, Types) ->
    case stop_matching(Id, Types) of
        true -> role:pack_send(Pid, 11720, {1, lang:get("")});
        _ -> ok
    end;
stop_matching(MateId, Types) ->
    case ets:lookup(team_mate_matching, MateId) of
        [#team_mate{expect_type = ExpectType}] ->
            case ExpectType -- Types of
                [] -> ok;
                _ ->
                    ets:delete(team_mate_matching, MateId),
                    true
            end;
        _ -> ok
    end.

stop_matching_push(MateId, Pid) ->
    role:pack_send(Pid, 11720, {1, lang:get("")}),
    ets:delete(team_mate_matching, MateId).

is_matching(#role{id = Id, cross_type = 1}) ->
    cross:call(team_mgr, is_matching, [Id]);
is_matching(#role{id = Id}) -> is_matching(Id);
is_matching(Id) ->
    case ets:lookup(team_mate_matching, Id) of
        [#team_mate{}] -> true;
        _ -> false
    end.

lookup_recruit(Pid) ->
    case catch ets:lookup(team_recruitment, Pid) of
        [TeamRecruit = #team_recruitment{}] ->
            {ok, TeamRecruit};
        [] -> null;
        _Err ->
            logger:error("无法查询招募信息:~w", [_Err], team_mgr, 884),
            {false, lang:get("系统繁忙，请稍后尝试")}
    end.

lookup_recruit(Type, Lev) ->
    Cond = [{'andalso',
             {'=<', '$1', Lev},
             {'>=', '$2', Lev}}],
    Ms = [{#team_recruitment{lev_min = '$1', lev_max = '$2',
                             _ = '_'},
           Cond,
           ['$_']}],
    case catch ets:select(team_recruitment, Ms) of
        RecruitList = [_ | _] ->
            case Type of
                0 -> RecruitList;
                _ ->
                    [Recruit
                     || Recruit = #team_recruitment{type = RType}
                            <- RecruitList,
                        RType =:= Type]
            end;
        _ -> []
    end.

-spec sync(#team{}, #team{}) -> ok.

sync(OldTeam,
     Team = #team{pid = Pid, type = Type, status = 0,
                  members = Members, cross_type = CrossType}) ->
    ChatFlag = case team_recruit:check_chat_recruit(Type) of
                   {ok, _} -> true;
                   _ -> false
               end,
    Now = date:unixtime(),
    case ChatFlag of
        true ->
            case lookup_recruit(Pid) of
                {ok,
                 #team_recruitment{notice_list = NoticeList, id = Id}} ->
                    NewNoticeList = case Members of
                                        [] ->
                                            lists:keydelete(Id, 1, NoticeList);
                                        _ -> NoticeList
                                    end,
                    team_recruit:broadcast_pre_recruitment_info(NewNoticeList,
                                                                Now,
                                                                del,
                                                                Pid,
                                                                #{cross_type =>
                                                                      CrossType}),
                    team_recruit:broadcast_recruitment_info(NewNoticeList,
                                                            Now,
                                                            del,
                                                            Pid,
                                                            #{cross_type =>
                                                                  CrossType}),
                    ok;
                _ -> skip
            end;
        false -> skip
    end,
    team:cancel_recruit_timer(),
    ets:delete(team_recruitment, Pid),
    team_compare(OldTeam, Team),
    ok;
sync(OldTeam,
     Team = #team{pid = Pid, type = Type, members = Members,
                  cross_type = CrossType}) ->
    ChatFlag = case team_recruit:check_chat_recruit(Type) of
                   {ok, _} -> true;
                   _ -> false
               end,
    Len = length(Members),
    Now = date:unixtime(),
    MaxNum = case Type of
                 63 -> 2;
                 _ ->
                     case team_data:get(Type) of
                         #{type := 14} -> 2;
                         #{type := 13} -> 2;
                         _ -> 5
                     end
             end,
    case Len >= MaxNum of
        true ->
            case lookup_recruit(Pid) of
                {ok,
                 #team_recruitment{notice_list = NoticeList,
                                   precision_notice_list =
                                       PrecisionNoticeList}} ->
                    #team_mate{pid = LeaderPid} = lists:keyfind(1,
                                                                #team_mate.status,
                                                                Members),
                    Msg = case Type of _ -> lang:get("已停止招募") end,
                    role:pack_send(LeaderPid, 11719, {1, Msg}),
                    team_recruit:broadcast_pre_recruitment_info(PrecisionNoticeList,
                                                                Now,
                                                                del,
                                                                Pid,
                                                                #{cross_type =>
                                                                      CrossType}),
                    team_recruit:broadcast_recruitment_info(NoticeList,
                                                            Now,
                                                            del,
                                                            Pid,
                                                            #{cross_type =>
                                                                  CrossType}),
                    ok;
                _Err -> ok
            end,
            team:cancel_recruit_timer(),
            ets:delete(team_recruitment, Pid),
            ok;
        false ->
            case lookup_recruit(Pid) of
                {ok,
                 Recruit = #team_recruitment{member_num = OldNum,
                                             type = OldType}} ->
                    case make_recruit(Recruit, Team, Len) of
                        {true,
                         LeaderPid,
                         MakeRecruit = #team_recruitment{notice_list =
                                                             OldNoticeList}} ->
                            NewRecruit = case ChatFlag =:= true andalso
                                                  (OldNum =/= Len orelse
                                                       OldType =/= Type)
                                             of
                                             true ->
                                                 {IsDelOld, NRecruit} = case
                                                                            OldType
                                                                                =/=
                                                                                Type
                                                                            of
                                                                            true ->
                                                                                {true,
                                                                                 team_recruit:dispatch(Team,
                                                                                                       MakeRecruit,
                                                                                                       LeaderPid)};
                                                                            _ ->
                                                                                {false,
                                                                                 MakeRecruit}
                                                                        end,
                                                 #team_recruitment{notice_list =
                                                                       NoticeList,
                                                                   precision_notice_list
                                                                       =
                                                                       PrecisionNoticeList} =
                                                     NRecruit,
                                                 case IsDelOld of
                                                     true ->
                                                         {Del, New, Update} =
                                                             team_recruit:diff_notice_list(OldNoticeList,
                                                                                           OldNoticeList,
                                                                                           NoticeList,
                                                                                           []),
                                                         team_recruit:broadcast_recruitment_info(Del,
                                                                                                 Now,
                                                                                                 del,
                                                                                                 Pid,
                                                                                                 #{cross_type
                                                                                                       =>
                                                                                                       CrossType}),
                                                         team_recruit:broadcast_pre_recruitment_info(PrecisionNoticeList,
                                                                                                     Now,
                                                                                                     del,
                                                                                                     Pid,
                                                                                                     #{cross_type
                                                                                                           =>
                                                                                                           CrossType}),
                                                         team_recruit:broadcast_recruitment_info(Update,
                                                                                                 Now,
                                                                                                 update,
                                                                                                 NRecruit,
                                                                                                 #{cross_type
                                                                                                       =>
                                                                                                       CrossType}),
                                                         team_recruit:broadcast_recruitment_info(New,
                                                                                                 Now,
                                                                                                 new,
                                                                                                 NRecruit,
                                                                                                 #{cross_type
                                                                                                       =>
                                                                                                       CrossType}),
                                                         team_recruit:broadcast_pre_recruitment_info(PrecisionNoticeList,
                                                                                                     Now,
                                                                                                     update,
                                                                                                     NRecruit,
                                                                                                     #{cross_type
                                                                                                           =>
                                                                                                           CrossType});
                                                     _ ->
                                                         team_recruit:broadcast_recruitment_info(NoticeList,
                                                                                                 Now,
                                                                                                 update,
                                                                                                 NRecruit,
                                                                                                 #{cross_type
                                                                                                       =>
                                                                                                       CrossType}),
                                                         team_recruit:broadcast_pre_recruitment_info(PrecisionNoticeList,
                                                                                                     Now,
                                                                                                     update,
                                                                                                     NRecruit,
                                                                                                     #{cross_type
                                                                                                           =>
                                                                                                           CrossType})
                                                 end,
                                                 NRecruit;
                                             false -> MakeRecruit
                                         end,
                            ets:insert(team_recruitment, NewRecruit),
                            team_mgr ! matching,
                            ok;
                        _ -> skip
                    end;
                null ->
                    case make_recruit(#team_recruitment{}, Team, Len) of
                        {true, LeaderPid, Recruit1} ->
                            NewRecruit = case ChatFlag of
                                             true ->
                                                 Recruit2 =
                                                     team_recruit:dispatch(Team,
                                                                           Recruit1,
                                                                           LeaderPid),
                                                 #team_recruitment{notice_list =
                                                                       NoticeList,
                                                                   precision_notice_list
                                                                       =
                                                                       PrecisionNoticeList} =
                                                     Recruit2,
                                                 team_recruit:broadcast_recruitment_info(NoticeList,
                                                                                         Now,
                                                                                         new,
                                                                                         Recruit2,
                                                                                         #{cross_type
                                                                                               =>
                                                                                               CrossType}),
                                                 team_recruit:broadcast_pre_recruitment_info(PrecisionNoticeList,
                                                                                             Now,
                                                                                             new,
                                                                                             Recruit2,
                                                                                             #{cross_type
                                                                                                   =>
                                                                                                   CrossType}),
                                                 team:set_recruit_timer(),
                                                 Recruit2;
                                             false -> Recruit1
                                         end,
                            ets:insert(team_recruitment, NewRecruit),
                            team_mgr ! matching,
                            ok;
                        _ -> skip
                    end;
                _ -> false
            end
    end,
    team_compare(OldTeam, Team),
    ok.

get_match(#{id := RoleId, pid := Pid}) ->
    team_mgr ! {get_match, RoleId, Pid}.

make_recruit(Recruit = #team_recruitment{},
             #team{members = Members, pid = Pid, type = Type,
                   lev_min = LevMin, lev_max = LevMax, matched = Matched,
                   chat_recruit_info = ChatRecruitInfo,
                   cross_type = CrossType},
             Number) ->
    case lists:keyfind(1, #team_mate.status, Members) of
        #team_mate{id = RoleId, name = RoleName, lev = RoleLev,
                   face_id = FaceId, sex = Sex, classes = Classes,
                   pid = LeaderPid, constellation_lev = ConstellLev,
                   quest_couple_round = QuestCoupleRound,
                   lover_id = LoverId, lover_name = LoverName,
                   lover_status = LoverStatus} ->
            NewRecruit = Recruit#team_recruitment{id = RoleId,
                                                  lev = RoleLev,
                                                  member_num = Number,
                                                  name = RoleName,
                                                  face_id = FaceId, sex = Sex,
                                                  classes = Classes,
                                                  matched = Matched, pid = Pid,
                                                  type = Type, lev_min = LevMin,
                                                  lev_max = LevMax,
                                                  constellation_lev =
                                                      ConstellLev,
                                                  chat_recruit_info =
                                                      ChatRecruitInfo,
                                                  lover_id = LoverId,
                                                  lover_name = LoverName,
                                                  lover_status = LoverStatus,
                                                  quest_couple_round =
                                                      QuestCoupleRound,
                                                  cross_type = CrossType},
            {true, LeaderPid, NewRecruit};
        _ -> false
    end.

-spec fetch(MateId :: tuple()) -> #team_mate{} | none.

fetch(MateId) ->
    case ets:lookup(team_mate, MateId) of
        [Mate = #team_mate{}] -> Mate;
        _ -> none
    end.

-spec delete(Mate :: #team_mate{} | tuple()) -> ok.

delete(#team_mate{id = MateId}) -> delete(MateId);
delete(MateId) -> ets:delete(team_mate, MateId).

-spec apply_role(#role{}, Args :: term()) -> ok |
                                             {ok, NewRole :: #role{}}.

apply_role(#role{m_team = _MTeam = #m_team{pid = Pid}},
           {invite, _R})
    when is_pid(Pid) ->
    {ok, {false, lang:get("对方已有队伍")}};
apply_role(#role{s_event = 43}, {invite, _R}) ->
    {ok, {false, lang:get("对方在匹配中")}};
apply_role(Role = #role{name = RoleName,
                        m_team = MT = #m_team{applys = Applys}},
           {invite, R = #team_recruitment{pid = TeamPid}}) ->
    Now = date:unixtime(),
    case lists:keyfind(TeamPid,
                       #team_recruitment.pid,
                       Applys)
        of
        #team_recruitment{matched = Matched}
            when Now - Matched < 60 ->
            {ok, {false, lang:get("已经向对方发过邀请，请等待回复")}};
        _ ->
            R1 = R#team_recruitment{matched = Now},
            Applys1 = lists:keydelete(TeamPid,
                                      #team_recruitment.pid,
                                      Applys),
            NewApplys = lists:sublist([R1 | Applys1], 10),
            NewMT = MT#m_team{applys = NewApplys},
            role:link_send(Role, 11715, {R}),
            Msg = notice:format(lang:get("你向~ts发起组队邀请，请等待回复"),
                                [{role_2, RoleName}]),
            {ok, {true, Msg}, Role#role{m_team = NewMT}}
    end;
apply_role(Role = #role{m_team =
                            #m_team{pid = Pid, status = Status},
                        cross_type = CrossType},
           {reply_invite, ReplyId})
    when is_pid(Pid) ->
    Result = case CrossType of
                 0 ->
                     case role_misc:is_local_role(ReplyId) of
                         false -> {false, lang:get("不在同一服务器，无法加入队伍")};
                         _ -> true
                     end;
                 _ -> true
             end,
    Reply = case Result of
                true ->
                    case erlang:get(team_invited) of
                        L when is_list(L) ->
                            erlang:put(team_invited, lists:delete(ReplyId, L));
                        _ -> ok
                    end,
                    case invite_check_event(Role) of
                        true ->
                            case Status of
                                1 -> {ok, Pid};
                                _ -> {apply, Pid}
                            end;
                        Else -> Else
                    end;
                _Else -> _Else
            end,
    {ok, Reply};
apply_role(Role = #role{cross_type = CrossType},
           {reply_invite, ReplyId}) ->
    Result = case CrossType of
                 0 ->
                     case role_misc:is_local_role(ReplyId) of
                         false -> {false, lang:get("不在同一服务器，无法加入队伍")};
                         _ -> true
                     end;
                 _ -> true
             end,
    case Result of
        true ->
            case erlang:get(team_invited) of
                L when is_list(L) ->
                    erlang:put(team_invited, lists:delete(ReplyId, L));
                _ -> ok
            end,
            case create(Role) of
                {ok, NewRole = #role{m_team = #m_team{pid = Pid}}} ->
                    {ok, {ok, Pid}, NewRole};
                {false, Reason} -> {ok, {false, Reason}};
                _R ->
                    logger:debug("其他原因 ~w", [_R], team_mgr, 1152),
                    {ok, {false, lang:get("邀请已经过期")}}
            end;
        Else -> {ok, Else}
    end;
apply_role(#role{m_team = MTeam}, lookup) ->
    Reply = case MTeam of
                #m_team{pid = Pid, status = Status} when is_pid(Pid) ->
                    {ok, Status};
                _ -> {ok, 0}
            end,
    {ok, Reply};
apply_role(Role, lookup_members) ->
    {ok, Mate} = role_convert:to(team_mate, Role),
    Reply = case team:get_members(Role) of
                L when is_list(L) -> [Mate | L];
                _ -> [Mate]
            end,
    {ok, {ok, Reply}};
apply_role(#role{m_team = #m_team{pid = Pid}},
           {matching, _M, _MTime})
    when is_pid(Pid) ->
    ok;
apply_role(Role = #role{id = Id,
                        cross_type = CrossType},
           {matching,
            M = #team_mate{expect_type = ETypes},
            MTime}) ->
    Flag = var:get_var(Role, other, 2013, 1),
    case check([event, wedding, escort, preparation], Role)
        of
        true ->
            List = case CrossType of
                       1 -> cross:call(ets, tab2list, [team_recruitment]);
                       _ when MTime > 5 andalso Flag == 1 ->
                           CrossList = case cross:is_ready() =:= 1 andalso
                                                c_trip_mgr:check_enter(Role,
                                                                       [team,
                                                                        event,
                                                                        cross_type,
                                                                        world_lev])
                                           of
                                           true ->
                                               case ETypes of
                                                   [EType | _] ->
                                                       case team_data:get(EType)
                                                           of
                                                           #{cross_open_lev :=
                                                                 CrossOpenLev}
                                                               when CrossOpenLev
                                                                        > 0 ->
                                                               case
                                                                   get(team_center)
                                                                   of
                                                                   true ->
                                                                       ignore;
                                                                   _ ->
                                                                       put(team_center,
                                                                           true),
                                                                       notice:send(Role,
                                                                                   3,
                                                                                   notice:format(lang:get("开始进行~ts"),
                                                                                                 [{string_2,
                                                                                                   5,
                                                                                                   lang:get("跨服匹配")}]))
                                                               end,
                                                               cross:call(ets,
                                                                          tab2list,
                                                                          [team_recruitment]);
                                                           _ -> []
                                                       end;
                                                   _ -> []
                                               end;
                                           _ -> []
                                       end,
                           case CrossList of
                               [_ | _] ->
                                   ets:tab2list(team_recruitment) ++ CrossList;
                               _ -> ets:tab2list(team_recruitment)
                           end;
                       _ -> ets:tab2list(team_recruitment)
                   end,
            Now = date:unixtime(),
            case erlang:get(team_matched) of
                MatchedL when is_list(MatchedL) ->
                    erlang:put(team_matched,
                               [O
                                || O = {_, Last} <- MatchedL,
                                   Now - Last < 180]);
                _ -> erlang:put(team_matched, [])
            end,
            case List of
                [_ | _] ->
                    case do_match(Role,
                                  M#team_mate{expect_type = ETypes -- [0]},
                                  Now,
                                  List)
                        of
                        {ok, NewRole} -> {ok, NewRole};
                        ok ->
                            case lists:member(0, ETypes) of
                                true ->
                                    do_match(Role,
                                             M#team_mate{expect_type = [0]},
                                             Now,
                                             List);
                                _ -> ok
                            end
                    end;
                _ -> ok
            end;
        _ ->
            stop_matching(Id),
            ok
    end.

check([], _) -> true;
check([escort | T], Role) ->
    case escort:can_team(Role) of
        true -> check(T, Role);
        Else -> Else
    end;
check([warrior | T], Role) ->
    case warrior_mgr:can_team(Role) of
        true -> check(T, Role);
        Else -> Else
    end;
check([tournament | _], #role{s_event = 24}) ->
    {false, lang:get("正在参与武道会中")};
check([tournament | _], #role{s_event = 25}) ->
    {false, lang:get("正在参与武道会中")};
check([tournament | _], #role{s_event = 74}) ->
    {false, lang:get("正在参与武道会中")};
check([tournament | T], Role) -> check(T, Role);
check([wedding | _], #role{s_event = 12}) ->
    {false, lang:get("举办典礼中")};
check([wedding | _], #role{s_event = 13}) ->
    {false, lang:get("举办典礼中")};
check([wedding | _], #role{s_event = 14}) ->
    {false, lang:get("参加典礼中")};
check([wedding | _], #role{s_event = 15}) ->
    {false, lang:get("参加典礼中")};
check([sworn | _], #role{s_event = 40}) ->
    {false, lang:get("正在结拜中，非结拜成员不能入队")};
check([wedding | T], Role) -> check(T, Role);
check([event | T], Role) ->
    case role_misc:check_event(Role,
                               [6,
                                2,
                                5,
                                16,
                                17,
                                18,
                                19,
                                22,
                                20,
                                21,
                                32,
                                33,
                                41,
                                42,
                                43,
                                47,
                                56,
                                67,
                                66,
                                65,
                                63,
                                72,
                                73])
        of
        true -> check(T, Role);
        Else -> Else
    end;
check([event_combat | T],
      Role = #role{status = Status}) ->
    CheckStatus = case Status =:= 2 of
                      true -> 0;
                      _ -> Status
                  end,
    case role_misc:check_event(Role#role{status =
                                             CheckStatus},
                               [6,
                                2,
                                5,
                                16,
                                17,
                                18,
                                19,
                                22,
                                20,
                                21,
                                32,
                                33,
                                41,
                                42,
                                43,
                                47,
                                56,
                                67,
                                66,
                                65,
                                63,
                                72,
                                73])
        of
        true -> check(T, Role);
        Else -> Else
    end;
check([create_event_combat | T],
      Role = #role{status = Status,
                   cross_type = CrossType}) ->
    CheckStatus = case Status =:= 2 of
                      true -> 0;
                      _ -> Status
                  end,
    TeamEvents = case CrossType of
                     2 ->
                         [1,
                          6,
                          2,
                          5,
                          16,
                          17,
                          18,
                          19,
                          22,
                          20,
                          21,
                          32,
                          33,
                          41,
                          42,
                          43,
                          47,
                          56,
                          67,
                          66,
                          65,
                          63,
                          72,
                          73];
                     _ ->
                         [6,
                          2,
                          5,
                          16,
                          17,
                          18,
                          19,
                          22,
                          20,
                          21,
                          32,
                          33,
                          41,
                          42,
                          43,
                          47,
                          56,
                          67,
                          66,
                          65,
                          63,
                          72,
                          73]
                 end,
    case role_misc:check_event(Role#role{status =
                                             CheckStatus},
                               TeamEvents)
        of
        true -> check(T, Role);
        Else -> Else
    end;
check([{hero_match, Type} | T],
      Role = #role{s_event = 20})
    when Type == 16 orelse Type == 17 ->
    case hero_role:check_group(Role, Type) of
        true -> check(T, Role);
        false -> {false, lang:get("不是同阵营不能报名")}
    end;
check([{hero_match, Type} | T],
      Role = #role{s_event = 21})
    when Type == 16 orelse Type == 17 ->
    case hero_role:check_group(Role, Type) of
        true -> check(T, Role);
        false -> {false, lang:get("不是同阵营不能报名")}
    end;
check([{hero_match, Type} | _], _Role)
    when Type == 16 orelse Type == 17 ->
    {false, lang:get("不在荣耀战场中不能报名")};
check([{hero_match, _Type} | T], Role) ->
    check(T, Role);
check([preparation | _T],
      #role{s_event = 42,
            m_preparation = #m_preparation{status = Status}})
    when Status =/= 0 ->
    {false, lang:get("现在正在匹配中")};
check([preparation | T], Role) -> check(T, Role);
check([dungeon_team | _T], #role{s_event = 43}) ->
    {false, lang:get("现在正在匹配中")};
check([dungeon_team | T], Role) -> check(T, Role);
check([event_dungeon | _T], #role{s_event = 1}) ->
    {false, lang:get("现在正在副本中")};
check([event_dungeon | T], Role) -> check(T, Role);
check([provocation | _T], #role{s_event = 66}) ->
    {false, lang:get("现在正在跨服约战中")};
check([provocation | T], Role) -> check(T, Role);
check([canyon_summit | T],
      Role = #role{s_event = 72}) ->
    check(T, Role);
check([_ | T], Role) -> check(T, Role).

start_link() ->
    gen_server:start_link({local, team_mgr},
                          team_mgr,
                          [],
                          []).

init([]) ->
    logger:info("开始启动...", [], team_mgr, 1349),
    ets:new(team_mate,
            [set, named_table, public, {keypos, #team_mate.id}]),
    ets:new(team_recruitment,
            [set,
             named_table,
             public,
             {keypos, #team_recruitment.pid}]),
    ets:new(team_mate_matching,
            [set, named_table, public, {keypos, #team_mate.id}]),
    Ref = erlang:send_after(5000, self(), matching),
    State = #state{matching_ref = Ref},
    logger:info("启动完成", [], team_mgr, 1358),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(matching,
            State = #state{matching_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    check_expired(),
    L = ets:tab2list(team_mate_matching),
    Now = date:unixtime(),
    mate_to_match(L, Now),
    Ref = erlang:send_after(5000, self(), matching),
    {noreply, State#state{matching_ref = Ref}};
handle_info({get_match, RoleId, Pid}, State) ->
    case ets:lookup(team_mate_matching, RoleId) of
        [#team_mate{pid = Pid, expect_type = Types,
                    matched = Matched}] ->
            role:pack_send(Pid, 11714, {1, Types, "", Matched});
        _ -> ignore
    end,
    {noreply, State};
handle_info({new_match,
             Mate = #team_mate{pid = Pid, expect_type = Types,
                               matched = Matched}},
            State) ->
    ets:insert(team_mate_matching, Mate),
    role:pack_send(Pid,
                   11714,
                   {1, Types, lang:get("正在匹配中，请耐心等待!"), Matched}),
    {noreply, State};
handle_info({add_match, Mate}, State) ->
    ets:insert(team_mate_matching, Mate),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_reply_invit(Role, _InviteId, 0) -> {ok, Role};
do_reply_invit(Role = #role{id = Id,
                            cross_type = CrossType},
               InviteId, _) ->
    case role_query:attr(by_id,
                         InviteId,
                         [#role.s_event, #role.pid])
        of
        {ok, [43, _ToPid]} ->
            dungeon_team:reply_invite(Role, InviteId);
        {ok, [_, ToPid]} ->
            case role:apply(sync,
                            ToPid,
                            {team_mgr, apply_role, [{reply_invite, Id}]})
                of
                {ok, TeamPid} ->
                    {ok, Mate} = role_convert:to(team_mate, Role),
                    case team:join(TeamPid, Mate, Role) of
                        ok ->
                            NewRole = Role#role{m_team =
                                                    #m_team{pid = TeamPid}},
                            {ok, NewRole};
                        {ok, NRole} ->
                            NewRole = NRole#role{m_team =
                                                     #m_team{pid = TeamPid}},
                            {ok, NewRole};
                        {ok, Reason, NRole} -> {false, Reason, NRole};
                        {false, Why} -> {false, Why, Role}
                    end;
                {apply, TeamPid} ->
                    {ok, Mate} = role_convert:to(team_mate, Role),
                    TeamRecruitment = case CrossType of
                                          1 ->
                                              cross:call(ets,
                                                         lookup,
                                                         [team_recruitment,
                                                          TeamPid]);
                                          _ ->
                                              ets:lookup(team_recruitment,
                                                         TeamPid)
                                      end,
                    case is_list(TeamRecruitment) of
                        true ->
                            case do_match(Role,
                                          Mate#team_mate{expect_type = [0]},
                                          date:unixtime(),
                                          TeamRecruitment)
                                of
                                {ok, NewRole} -> {ok, NewRole};
                                _ ->
                                    case team:join_apply(TeamPid,
                                                         Mate,
                                                         #{cross_type =>
                                                               CrossType})
                                        of
                                        ok -> ok;
                                        Else -> Else
                                    end
                            end;
                        _ -> ok
                    end;
                {false, Why} -> {false, Why, Role};
                _Else -> {false, lang:get("对方正忙，请稍后再试"), Role}
            end;
        _ -> {false, lang:get("玩家不在线"), Role}
    end.

do_match(_Role, _Mate, _Now, []) -> ok;
do_match(Role = #role{pid = Pid, sex = Sex,
                      s_event = _Event,
                      m_wedding = #m_wedding{status = LoverStatus},
                      m_quest =
                          #m_quest{quest_couple =
                                       #quest_couple{round =
                                                         QuestCoupleRound}}},
         Mate = #team_mate{expect_type = ETypes, lev = MLev},
         Now,
         [#team_recruitment{pid = TeamPid, type = Type,
                            sex = LeaderSex, matched = Matched,
                            lev_min = LevMin, lev_max = LevMax}
          | T]) ->
    IsTypeMatched = lists:member(0, ETypes) orelse
                        lists:member(Type, ETypes),
    IsMatchLev = check_match_lev(MLev, LevMin, LevMax),
    MatchedL = case erlang:get(team_matched) of
                   ML when is_list(ML) -> ML;
                   _ -> []
               end,
    IsMacthed = case lists:keyfind(TeamPid, 1, MatchedL) of
                    {TeamPid, _} -> true;
                    _ -> false
                end,
    IsTypeCheck = case team_data:get(Type) of
                      #{type := 14}
                          when Sex =/= LeaderSex andalso
                                   LoverStatus == 0 andalso
                                       QuestCoupleRound == 0 ->
                          true;
                      #{type := 14} -> false;
                      #{type := Type = 16} ->
                          hero_role:check_group(Role, Type);
                      #{type := Type = 17} ->
                          hero_role:check_group(Role, Type);
                      _ -> true
                  end,
    CheckTime = check_time(Type, Matched, Now),
    case CheckTime =:= true andalso
             IsMacthed =:= false andalso
                 IsTypeMatched =:= true andalso
                     IsMatchLev =:= true andalso IsTypeCheck == true
        of
        true ->
            logger:debug("ttttttttttttttttttttttttt~w",
                         [Type],
                         team_mgr,
                         1501),
            case team:join(TeamPid,
                           Mate#team_mate{join_type = 2, join_sub_type = Type},
                           match,
                           Role)
                of
                ok ->
                    NewRole = Role#role{m_team = #m_team{pid = TeamPid}},
                    role:pack_send(Pid, 11720, {1, lang:get("")}),
                    erlang:put(team_matched, [{TeamPid, Now} | MatchedL]),
                    {ok, NewRole};
                {ok, NRole} ->
                    NewRole = NRole#role{m_team = #m_team{pid = TeamPid}},
                    role:pack_send(Pid, 11720, {1, lang:get("")}),
                    erlang:put(team_matched, [{TeamPid, Now} | MatchedL]),
                    {ok, NewRole};
                {ok, _, NRole} -> {ok, NRole};
                _ -> do_match(Role, Mate, Now, T)
            end;
        _ -> do_match(Role, Mate, Now, T)
    end.

check_time(Type, Matched, Now) ->
    case team_data:get(Type) of
        #{timeout := Timeout} -> Timeout > Now - Matched;
        _ -> false
    end.

check_match_lev(_MLev, 0, 0) -> true;
check_match_lev(MLev, LevMin, 0) when MLev >= LevMin ->
    true;
check_match_lev(MLev, 0, LevMax) when MLev =< LevMax ->
    true;
check_match_lev(MLev, LevMin, LevMax)
    when MLev >= LevMin andalso MLev =< LevMax ->
    true;
check_match_lev(_, _, _) -> false.

mate_to_match([], _Now) -> ok;
mate_to_match([M = #team_mate{pid = Pid,
                              matched = Matched}
               | T],
              Now)
    when Now - Matched < 3600 ->
    role:apply(async,
               Pid,
               {team_mgr, apply_role, [{matching, M, Now - Matched}]}),
    mate_to_match(T, Now);
mate_to_match([#team_mate{id = Id, pid = Pid} | T],
              Now) ->
    role:pack_send(Pid, 11720, {1, lang:get("匹配已停止")}),
    ets:delete(team_mate_matching, Id),
    mate_to_match(T, Now).

check_expired() ->
    Now = date:unixtime(),
    check_expired(ets:tab2list(team_recruitment), Now).

check_expired([], _Now) -> ok;
check_expired([#team_recruitment{type = 0, pid = Pid}
               | T],
              Now) ->
    team:stop_recruiting(Pid),
    check_expired(T, Now);
check_expired([#team_recruitment{type = Type,
                                 matched = Matched, pid = Pid}
               | T],
              Now) ->
    Tout = case team_data:get(Type) of
               #{timeout := Timeout} -> Timeout;
               _ -> 0
           end,
    case Now - Matched > Tout of
        true -> team:stop_recruiting(Pid);
        _ -> ok
    end,
    check_expired(T, Now);
check_expired([_ | T], Now) -> check_expired(T, Now).

team_compare(#team{type = 81, leader = Leader},
             #team{status = Status, leader = NewLeader}) ->
    IsDelHelp = case {Status =:= 0, Leader =/= NewLeader} of
                    {true, _} -> true;
                    {_, true} -> true;
                    _ -> false
                end,
    case IsDelHelp of
        true ->
            Args = [{del_help_info_by_fun_type, 1}],
            team:async_mfa_leader(Leader,
                                  {team_role, callback, Args});
        _ -> skip
    end,
    ok;
team_compare(#team{leader = Leader},
             #team{target = 1, leader = NewLeader,
                   member_num = MemberNum}) ->
    IsDelHelp = case {MemberNum =:= 5, Leader =/= NewLeader}
                    of
                    {true, _} -> true;
                    {_, true} -> true;
                    _False -> false
                end,
    case IsDelHelp of
        true ->
            Args = [{del_help_info_by_fun_type, 2}],
            team:async_mfa_leader(Leader,
                                  {team_role, callback, Args});
        _ -> skip
    end,
    ok;
team_compare(#team{target = 1, leader = Leader},
             #team{}) ->
    Args = [{del_help_info_by_fun_type, 2}],
    team:async_mfa_leader(Leader,
                          {team_role, callback, Args}),
    ok;
team_compare(_OldTeam, _NewTeam) -> ok.

invite_check_event(#role{s_event = 24}) ->
    {false, lang:get("对方在武道会中")};
invite_check_event(#role{s_event = 25}) ->
    {false, lang:get("对方在武道会中")};
invite_check_event(#role{s_event = 43}) ->
    {false, lang:get("对方在匹配中")};
invite_check_event(_) -> true.

