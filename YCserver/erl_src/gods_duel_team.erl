-file("src/mod/gods_duel/gods_duel_team.erl", 1).

-module(gods_duel_team).

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

-file("src/mod/gods_duel/gods_duel_team.erl", 10).

-file("inc/gods_duel.hrl", 1).

-record(gods_duel_team,
        {ver = 1 :: pos_integer(),
         id = {0, "", 0},
         name = "",
         lev = 0,
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         applys = [],
         invite_info = [],
         declaration = "",
         win_times = 0,
         loss_times = 0,
         qualification = 0,
         team_group_256 = 0,
         team_group_64 = 0,
         team_group_8 = 0,
         team_group_4 = 0,
         team_seq = 0,
         team_index = 0}).

-record(gods_duel_team_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         position = 0,
         fight_capacity = 0,
         join_time = 0}).

-record(m_gods_duel,
        {ver = 2, team_id = {0, "", 0}, gods_score = 0}).

-record(gods_duel_season_data,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_season_info,
        {ver = 1,
         id = 0,
         status = 0,
         teams = [],
         group_order = 0,
         season_time_info = []}).

-record(invite_info,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         break_times = 0,
         classes = 0,
         sex = 0,
         total_fc = 0,
         online = 0}).

-record(gods_duel_join_team,
        {id = {0, "", 0},
         team_pid = undefined,
         team_data = undefined,
         fighters = [],
         is_ready = false}).

-record(gods_duel_match,
        {id = {0, 0},
         teams = [],
         combat_pid = undefined :: pid(),
         calc_args = [],
         combat_ref = undefined,
         is_over = 0,
         map_id = 0,
         map_pid = undefined,
         roles = []}).

-record(gods_duel_match_profile,
        {id = 0,
         ver = 1,
         season_id = 0,
         match_type = 0,
         match_round = 0,
         match_id = 0,
         group_id = 0,
         combat_type = 0,
         atk_name,
         dfd_name,
         combat_pid = undefined :: pid(),
         is_over = 0,
         platform = "",
         zone_id = 0,
         time = 0,
         fc_diff = 0,
         round = 0}).

-record(gods_duel_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(gods_duel_vote,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(gods_duel_vote_choice,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         match_zone = 0,
         is_right = 0 :: 0..2}).

-record(gods_duel_poll,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         voted_cnt = 0 :: non_neg_integer()}).

-record(gods_duel_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 1 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         gods_duel_score = 0 :: non_neg_integer()}).

-record(gods_challenge_info,
        {id, combat_pid, is_over = 0}).

-record(gods_duel_team_rank,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_team_rank_data,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         win_times = 0,
         qualification = 0,
         rank = 0}).

-record(gods_duel_team_rank_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 2,
         lev = 0,
         break_times = 0,
         position = 2,
         fight_capacity = 0,
         looks = []}).

-record(gods_challenge_team,
        {season_id = 0,
         team_name = "",
         member_num = 0,
         members = []}).

-record(gods_challenge_team_mate,
        {id = {0, "", 0}, name = ""}).

-file("src/mod/gods_duel/gods_duel_team.erl", 11).

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

-file("src/mod/gods_duel/gods_duel_team.erl", 12).

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

-file("src/mod/gods_duel/gods_duel_team.erl", 13).

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

-file("src/mod/gods_duel/gods_duel_team.erl", 14).

-file("inc/friend.hrl", 1).

-record(friendship,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         type = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_role,
        {id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         ver = 6,
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         signature = "" :: string(),
         city = "" :: string(),
         online = 0 :: 0 | 1,
         online_time = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         guild = "" :: string(),
         qualifying,
         arena,
         pet,
         guard,
         skill_prac = 0,
         achievement = 0,
         received_num = 0,
         given_num = 0,
         update_time = 0,
         looks = [] :: list(),
         offline_push = 0,
         glory_max_id = 0,
         glory_time = 0}).

-record(friend_request,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_present,
        {ver = 0,
         giver = {0, "", 0},
         recipient = {0, "", 0},
         time = 0 :: integer(),
         num = 0 :: integer()}).

-record(m_friend,
        {ver = 2,
         signature = "星辰奇缘真好玩！" :: string(),
         num = 0 :: non_neg_integer(),
         fans = 0 :: non_neg_integer(),
         log_next_id = 1 :: pos_integer(),
         flower = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         city = "" :: string(),
         set_num = 0 :: non_neg_integer(),
         cond_city = 1 :: 0..1,
         cond_sex = 1 :: 0..1,
         cond_fc = 1 :: 0..1,
         received_presents = [] :: [],
         given_presents = [] :: [],
         received_num = 0 :: non_neg_integer(),
         given_num = 0 :: non_neg_integer(),
         popularity_rewarded = [] :: list(),
         offline_push = 0}).

-record(friend_zone,
        {ver = 14 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         photo = [] :: non_neg_integer(),
         birth = "" :: non_neg_integer(),
         constellation = 0 :: non_neg_integer(),
         abo = 0 :: non_neg_integer(),
         signature = "" :: string(),
         spouse_id = {0, "", 0} :: tuple(),
         spouse_name = "" :: string(),
         region = "" :: string(),
         online_time = 0 :: non_neg_integer(),
         guild = "" :: string(),
         subscribed = [],
         fans = [],
         visitors = [],
         visited = 0 :: non_neg_integer(),
         tags = [],
         liked = 0 :: non_neg_integer(),
         likes = [],
         privacy = 0 :: 0 | 1,
         prize_num = 0 :: non_neg_integer(),
         own_trends = [] :: [non_neg_integer()],
         subscribed_trends = [] :: [non_neg_integer()],
         photo_auditing = 0 :: non_neg_integer(),
         photo_audited = 0 :: non_neg_integer(),
         present_num = 0 :: non_neg_integer(),
         name_used = "" :: string(),
         week_liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         theme = 401 :: non_neg_integer(),
         badges = [] :: list(),
         photo_frame = 0 :: non_neg_integer(),
         teacher_name = "" :: string(),
         own_trend_num = 0,
         city = "" :: string(),
         is_shared_region = 1 :: 0 | 1,
         sworn_name = "" :: string(),
         show_honor = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer(),
         privacy_zone = 0 :: 0 | 1,
         privacy_moments = 0 :: 0 | 1}).

-record(friend_trend,
        {ver = 0 :: non_neg_integer(),
         zone_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         photo = 1 :: pos_integer(),
         id = 0 :: non_neg_integer(),
         type = 0 :: 0 | 1,
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         presents = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_visitor,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(friend_subscription,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         cared = 0 :: non_neg_integer(),
         interacted = 0 :: non_neg_integer()}).

-record(friend_zone_rank,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_zone_rank_week,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_like,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         got_prize = 0 :: 0 | 1,
         time = 0 :: non_neg_integer()}).

-record(friend_zone_photo,
        {id = 1,
         ver = 0,
         uploaded = 0,
         auditing = 0,
         audited = 0,
         default = 0}).

-record(friend_circle,
        {ver = 3 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list(),
         subscriptions = [] :: list(),
         block = [] :: list(),
         unsubscribed = [] :: list(),
         notifications = [] :: list(),
         is_shared_region = 1 :: 0 | 1,
         unread_num = 0 :: non_neg_integer(),
         privacy_moments = 0 :: 0 | 1}).

-record(friend_moment,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         mentions = [],
         ctime = 0 :: non_neg_integer(),
         type = 1}).

-record(friend_comment,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0},
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         msg = "" :: string(),
         mentions = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_like,
        {ver = 0 :: non_neg_integer(),
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_photo,
        {id = 1,
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         ver = 0,
         uploaded = 0,
         auditing = 1,
         audited = 0}).

-record(friend_circle_report,
        {id = {{0, "", 0}, 0, 0},
         rid = {0, "", 0},
         moment_id = {0, "", 0},
         spec_id = 0,
         type = 0,
         name = "",
         lev = 1,
         time = 0,
         content = "",
         reporter_id = {0, "", 0},
         reporter_name = "",
         reporter_lev = 0}).

-record(friend_circle_region,
        {ver = 0 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list()}).

-record(friend_recall,
        {role_id = {0, "", 0},
         role_name = "",
         id = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         role_id_bind = {0, "", 0},
         role_name_bind = "",
         lists = [] :: list(),
         rewards = [] :: list(),
         lists_time = [] :: list(),
         time_return = 0 :: non_neg_integer()}).

-record(friend_recalled,
        {role_id = {0, "", 0},
         status = 0 :: non_neg_integer(),
         bind = 0 :: non_neg_integer(),
         time_return = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         rewards = [] :: list(),
         lists = [] :: list(),
         recall_list = [] :: list(),
         role_id_recall = {0, "", 0},
         role_name_recall = "" :: string(),
         login = 0 :: non_neg_integer(),
         activity_id = 0 :: non_neg_integer()}).

-record(friend_group,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         owner_lev = 1,
         owner_fc = 0,
         owner_face = 1,
         time = 0,
         members = [],
         trends = [],
         historys = [],
         invites = []}).

-record(friend_group_role,
        {ver = 1,
         id = {0, "", 0},
         groups = [],
         inviteds = [],
         create = 0,
         join = 0,
         unlock = 0,
         applys = []}).

-record(friend_group_trend,
        {type = 0, string1 = "", string2 = "", time = 0}).

-record(friend_group_chat,
        {role_id = 0, msgs = "", time = 0}).

-record(friend_group_data,
        {group_id = {0, "", 0},
         group_name = "",
         group_content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         time = 0}).

-record(friend_group_role_data,
        {role_id = {0, "", 0},
         role_name = "",
         role_classes = 0,
         role_lev = 0,
         role_sex = 0,
         online = 0,
         online_time = 0,
         post = 0,
         notice = 1,
         pid = undefined}).

-record(friend_moment_wish_audit,
        {ver = 1,
         moment_id = {0, "", 0},
         role_id = {0, "", 0},
         audit_time = 0,
         reward_title = 0,
         camp_id = 0}).

-file("src/mod/gods_duel/gods_duel_team.erl", 15).

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

-file("src/mod/gods_duel/gods_duel_team.erl", 16).

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

-file("src/mod/gods_duel/gods_duel_team.erl", 17).

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

-file("src/mod/gods_duel/gods_duel_team.erl", 18).

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

-file("src/mod/gods_duel/gods_duel_team.erl", 19).

-export([create_team/2,
         create_team/3,
         reply_create_team_success/1,
         dismiss_team/1,
         leave_team/1,
         leave_team/2,
         apply_join_team/2,
         approve_join_team/3,
         lookup/1,
         save_team_data/1,
         remove_team_data/1,
         apply_confirm_create_team/4,
         confirm_create_team/2,
         confirm_invite_team/2,
         update_team_info/1,
         send_mail/3,
         update_name_used/1,
         update_role_team_id/1,
         sync_approve_join_team/2,
         sync_leave_team/1,
         invite_team/2,
         invite_team/3,
         apply_confirm_invite_team/4,
         apply_invite_team/3,
         get_can_apply_list/1,
         kick_mate/2,
         agent_kick_mate/2,
         async_member/3,
         sync_kick_mate/1,
         get_invite_list/2,
         set_declaration/2,
         agent_set_declaration/2,
         modify_team_name/2,
         agent_modify_team_name/2,
         exchange_alternate/3,
         agent_exchange_alternate/3,
         remove_role_team_id/1,
         update_member_info/5,
         agent_team_sign/2,
         check_has_team/1,
         get_team_id/1,
         get_target_rank/2,
         get_target_team_id/1,
         update_team_ready_status/3,
         apply_sync_team_ready_status/2,
         update_match_combat/4,
         reward_qua64_team/1,
         repair_group_id/0,
         get_group_name/1,
         update_point/1,
         gm_reset_point/1]).

create_team(#role{m_team = #m_team{status = Status}}, _)
    when Status =/= 1 ->
    {false,
     notice:format(lang:get("需要~ts带队，至少~ts创建队伍{face_1,3}"),
                   [{string_2, 5, lang:get("队长")},
                    {string_2, 5, lang:get("2人")}])};
create_team(Role = #role{id = RoleId, name = LeaderName,
                         m_gods_duel = MGodsDuel},
            TeamName) ->
    case check_create_team([season_status,
                            lev,
                            team_name,
                            has_team,
                            team_member],
                           Role,
                           [{team_name, TeamName}])
        of
        {true, Args} ->
            {_, MatesNum} = lists:keyfind(member_num, 1, Args),
            MemberNum = MatesNum + 1,
            {ok, TeamMate} = role_convert:to(gods_duel_mate, Role),
            LeadInfo = TeamMate#gods_duel_team_mate{position = 1,
                                                    join_time =
                                                        date:unixtime()},
            case case catch gen_server:call(gods_duel_agent,
                                            {create_team,
                                             TeamName,
                                             MemberNum,
                                             LeadInfo},
                                            10000)
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                ok ->
                    logger:debug("广播给队员确认:~w",
                                 [{RoleId, LeaderName, TeamName}],
                                 gods_duel_team,
                                 90),
                    team_common:async_member(Role,
                                             2,
                                             {gods_duel_team,
                                              apply_confirm_create_team,
                                              [RoleId, LeaderName, TeamName]}),
                    NewRole = Role#role{m_gods_duel =
                                            MGodsDuel#m_gods_duel{team_id =
                                                                      RoleId}},
                    {ok, NewRole};
                _Else ->
                    logger:error("创建临时战队失败:~w",
                                 [_Else],
                                 gods_duel_team,
                                 96),
                    {false, lang:get("服务器繁忙，创建战队失败")}
            end;
        {false, Reason} -> {false, Reason}
    end.

create_team(TeamName,
            LeaderInfo = #gods_duel_team_mate{id = LeaderId},
            MemberNum) ->
    #gods_duel_team{id = LeaderId, name = TeamName,
                    member_num = MemberNum, members = [LeaderInfo]}.

reply_create_team_success(Role) ->
    Now = date:unixtime(),
    VarRole = var:set_var(Role, other, 20501, Now),
    ChatIconRole = gods_duel_role:remove_chat_icon(VarRole),
    {ok, ChatIconRole}.

apply_confirm_create_team(Role = #role{m_gods_duel =
                                           MGodsDuel},
                          TeamId, LeaderName, TeamName) ->
    logger:debug("发送请求确认框:~w",
                 [{1, LeaderName, TeamName}],
                 gods_duel_team,
                 116),
    role:link_send(Role, 17902, {1, LeaderName, TeamName}),
    NewRole = Role#role{m_gods_duel =
                            MGodsDuel#m_gods_duel{team_id = TeamId}},
    {ok, NewRole}.

confirm_create_team(#role{m_gods_duel =
                              #m_gods_duel{team_id = {0, "", 0}}},
                    _) ->
    {false, lang:get("未收到战队邀请，无法操作")};
confirm_create_team(Role = #role{id = RoleId,
                                 name = RoleName,
                                 m_gods_duel = #m_gods_duel{team_id = TeamId}},
                    Flag) ->
    case check_has_team(RoleId) of
        true -> {false, lang:get("您已经有战队了,不能加入战队")};
        _ ->
            {ok, TeamMate} = role_convert:to(gods_duel_mate, Role),
            Now = date:unixtime(),
            TeamMate1 = TeamMate#gods_duel_team_mate{position = 2,
                                                     join_time = Now},
            logger:debug("{apply_create_team, Flag, TeamId, TeamMate1}:~w",
                         [{apply_create_team, Flag, TeamId, TeamMate1}],
                         gods_duel_team,
                         132),
            case lookup(TeamId) of
                {ok,
                 #gods_duel_team{name = TeamName, members = Members,
                                 member_num = Num}}
                    when Num - 1 > length(Members) andalso Flag =:= 1 ->
                    NoticeMsg = notice:format(lang:get("~ts同意加入战队~ts"),
                                              [{role_2, RoleName},
                                               {string_2, 1, TeamName}]),
                    TeamMembers = team:get_members(Role),
                    lists:foreach(fun (#team_mate{id = MateId}) ->
                                          notice:send(MateId, 41, NoticeMsg)
                                  end,
                                  TeamMembers);
                {ok, #gods_duel_team{}} when Flag =:= 0 ->
                    NoticeMsg =
                        notice:format(lang:get("~ts拒绝了加入战队的邀请，请沟通后再进行创建吧"),
                                      [{role_2, RoleName}]),
                    TeamMembers = team:get_members(Role),
                    lists:foreach(fun (#team_mate{id = MateId}) ->
                                          notice:send(MateId, 41, NoticeMsg)
                                  end,
                                  TeamMembers);
                _ -> ok
            end,
            gods_duel_agent:info({apply_create_team,
                                  Flag,
                                  TeamId,
                                  TeamMate1}),
            ok
    end.

confirm_invite_team(#role{m_gods_duel =
                              #m_gods_duel{team_id = {0, "", 0}}},
                    _) ->
    {false, lang:get("未收到战队邀请，无法操作")};
confirm_invite_team(Role = #role{id = RoleId,
                                 m_gods_duel = #m_gods_duel{team_id = TeamId}},
                    Flag) ->
    case check_has_team(RoleId) of
        true -> {false, lang:get("您已经拥有战队了，不能加入其它战队")};
        false ->
            {ok, TeamMate} = role_convert:to(gods_duel_mate, Role),
            Now = date:unixtime(),
            TeamMate1 = TeamMate#gods_duel_team_mate{position = 2,
                                                     join_time = Now},
            case lookup(TeamId) of
                {ok, #gods_duel_team{member_num = Num, name = Name}}
                    when Num >= 7 ->
                    Msg = notice:format(lang:get("加入失败，战队~ts已经满员"),
                                        [{string_2, 1, Name}]),
                    {false, Msg};
                _ ->
                    case case catch gen_server:call(gods_duel_agent,
                                                    {apply_invite_team,
                                                     Flag,
                                                     TeamId,
                                                     TeamMate1},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        {ok, Msg} ->
                            NewRole = case Flag of
                                          1 ->
                                              gods_duel_role:remove_chat_icon(Role);
                                          0 -> Role
                                      end,
                            {ok, NewRole, Msg};
                        {false, Reason} -> {false, Reason};
                        _Else -> _Else
                    end
            end
    end.

apply_invite_team(TeamId,
                  TeamMate = #gods_duel_team_mate{id = InviteId,
                                                  name = InviteName},
                  Flag) ->
    case lookup(TeamId) of
        {ok, #gods_duel_team{member_num = Num, name = Name}}
            when Num >= 7 ->
            Msg = notice:format(lang:get("加入失败，战队~ts已经满员"),
                                [{string_2, 1, Name}]),
            {false, Msg};
        {ok,
         TeamInfo = #gods_duel_team{id = TeamId, name = TeamName,
                                    invite_info = InviteInfo, applys = Applys,
                                    lev = OldTeamLev, members = Members}} ->
            case lists:keymember(InviteId,
                                 #gods_duel_team_mate.id,
                                 Members)
                of
                true -> {false, lang:get("该玩家已经加入战队了")};
                _ ->
                    case check_has_team(InviteId) of
                        true -> {false, lang:get("您已经拥有战队了，不能加入其它战队")};
                        false ->
                            Now = date:unixtime(),
                            case lists:keyfind(InviteId, 1, InviteInfo) of
                                {_, Sender, InviteTime} ->
                                    case Now - InviteTime < 3600 of
                                        true ->
                                            case Flag of
                                                0 ->
                                                    NewInviteInfo =
                                                        lists:keydelete(InviteId,
                                                                        1,
                                                                        InviteInfo),
                                                    Msg =
                                                        notice:format(lang:get("~ts拒绝了您的邀请!"),
                                                                      [{role_2,
                                                                        InviteName}]),
                                                    notice:send(Sender, 1, Msg),
                                                    NewTeamInfo =
                                                        TeamInfo#gods_duel_team{invite_info
                                                                                    =
                                                                                    NewInviteInfo},
                                                    save_team_data(NewTeamInfo),
                                                    {ok, "您拒绝了邀请"};
                                                1 ->
                                                    case TeamId =:= Sender of
                                                        true ->
                                                            NewInviteInfo =
                                                                lists:keydelete(InviteId,
                                                                                1,
                                                                                InviteInfo),
                                                            TeamInfo1 =
                                                                TeamInfo#gods_duel_team{invite_info
                                                                                            =
                                                                                            NewInviteInfo},
                                                            mate_join_team(TeamInfo1,
                                                                           TeamMate),
                                                            NewTeamLev = case
                                                                             lookup(TeamId)
                                                                             of
                                                                             {ok,
                                                                              #gods_duel_team{lev
                                                                                                  =
                                                                                                  _NewTeamLev}} ->
                                                                                 _NewTeamLev;
                                                                             _ ->
                                                                                 80
                                                                         end,
                                                            case NewTeamLev =/=
                                                                     OldTeamLev
                                                                of
                                                                true ->
                                                                    GroupName =
                                                                        get_group_name(NewTeamLev),
                                                                    SeasonName =
                                                                        gods_duel_common:get_season_name(),
                                                                    send_mail(team_lev_up,
                                                                              Members,
                                                                              #{mate_name
                                                                                    =>
                                                                                    InviteName,
                                                                                mate_lev
                                                                                    =>
                                                                                    NewTeamLev,
                                                                                season_name
                                                                                    =>
                                                                                    SeasonName,
                                                                                team_name
                                                                                    =>
                                                                                    TeamName,
                                                                                gourp_name
                                                                                    =>
                                                                                    GroupName});
                                                                _ -> ok
                                                            end,
                                                            update_role_team_id({InviteId,
                                                                                 TeamId}),
                                                            async_member(TeamId,
                                                                         [1,
                                                                          2,
                                                                          3],
                                                                         {gods_duel_role,
                                                                          push_gods_duel_team,
                                                                          []}),
                                                            Msg =
                                                                notice:format(lang:get("恭喜您加入了战队~ts"),
                                                                              [{string_2,
                                                                                1,
                                                                                TeamName}]),
                                                            {ok, Msg};
                                                        false ->
                                                            NewInviteInfo =
                                                                lists:keydelete(InviteId,
                                                                                1,
                                                                                InviteInfo),
                                                            NewApplys =
                                                                lists:keystore(InviteId,
                                                                               #gods_duel_team_mate.id,
                                                                               Applys,
                                                                               TeamMate),
                                                            NewTeamInfo =
                                                                TeamInfo#gods_duel_team{applys
                                                                                            =
                                                                                            NewApplys,
                                                                                        invite_info
                                                                                            =
                                                                                            NewInviteInfo},
                                                            save_team_data(NewTeamInfo),
                                                            Msg =
                                                                notice:format(lang:get("您接受了战队~ts邀请，请等待战队队长批准"),
                                                                              [{string_2,
                                                                                1,
                                                                                TeamName}]),
                                                            role:apply(async,
                                                                       TeamId,
                                                                       {gods_duel_role,
                                                                        push_gods_duel_team,
                                                                        []}),
                                                            {ok, Msg}
                                                    end
                                            end;
                                        false -> {false, lang:get("邀请已经过期")}
                                    end;
                                _ -> {false, lang:get("邀请已经过期了")}
                            end
                    end
            end;
        _ -> {false, lang:get("战队已经解散，无法加入")}
    end.

get_can_apply_list(_Lev) ->
    Fun = fun (TeamInfo = #gods_duel_team{members = Members,
                                          member_num = MemberNum},
               Rtn) ->
                  case length(Members) =:= MemberNum of
                      true -> [TeamInfo | Rtn];
                      false -> Rtn
                  end
          end,
    ets:foldl(Fun, [], gods_duel_team_data).

kick_mate(#role{id = TeamId,
                m_gods_duel = #m_gods_duel{team_id = TeamId}},
          MateId) ->
    case is_team_status() of
        true ->
            case lookup(TeamId) of
                {ok, #gods_duel_team{members = Members}} ->
                    case lists:keyfind(MateId,
                                       #gods_duel_team_mate.id,
                                       Members)
                        of
                        #gods_duel_team_mate{} ->
                            gods_duel_agent:info({kick_mate, TeamId, MateId}),
                            ok;
                        _ -> {false, "该队员已经离开了"}
                    end;
                _ -> {false, lang:get("战队不存在，无法操作")}
            end;
        false ->
            Msg = notice:format(lang:get("只有在赛季~ts与~ts才能~ts"),
                                [{string_2, 5, lang:get("准备阶段")},
                                 {string_2, 5, lang:get("报名阶段")},
                                 {string_2, 5, lang:get("踢除战队成员")}]),
            {false, Msg}
    end;
kick_mate(_, _) -> {false, lang:get("您不是队长，无法操作")}.

agent_kick_mate(TeamId, MateId) ->
    case lookup(TeamId) of
        {ok, TeamInfo = #gods_duel_team{members = Members}} ->
            case lists:keyfind(MateId,
                               #gods_duel_team_mate.id,
                               Members)
                of
                #gods_duel_team_mate{name = BeKickName} ->
                    mate_leave_team(TeamInfo, MateId),
                    LeaderName = case lists:keyfind(TeamId,
                                                    #gods_duel_team_mate.id,
                                                    Members)
                                     of
                                     #gods_duel_team_mate{name = _LeaderName} ->
                                         _LeaderName;
                                     _ -> lang:get("")
                                 end,
                    MailMembers = lists:keydelete(MateId,
                                                  #gods_duel_team_mate.id,
                                                  Members),
                    send_mail(kick_mate,
                              MailMembers,
                              #{mate_name => BeKickName,
                                leader_name => LeaderName,
                                member_num => length(MailMembers)}),
                    async_member(TeamId,
                                 [1, 2, 3],
                                 {gods_duel_role, push_gods_duel_team, []}),
                    remove_role_team_id(MateId),
                    case role_query:pid(by_id, MateId) of
                        {ok, MatePid} ->
                            role:apply(async,
                                       MatePid,
                                       {gods_duel_team, sync_kick_mate, []}),
                            ok;
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

sync_kick_mate(Role = #role{m_gods_duel = MGodsDuel}) ->
    NewRole = Role#role{m_gods_duel =
                            MGodsDuel#m_gods_duel{team_id = {0, "", 0}}},
    gods_duel_role:push_gods_duel_team(NewRole),
    MailTile = lang:get("战队请离"),
    Content =
        lang:get("很遗憾，由于某些不可抗力，您被请离了战队，希望以后还有机会与我们并肩作战。"),
    mail:send(Role, MailTile, Content),
    {ok, NewRole}.

get_invite_list([], InviteList) -> InviteList;
get_invite_list([#friend_role{id = Fid, name = Name,
                              lev = Lev, break_times = BreakTimes,
                              classes = Classes, sex = Sex, total_fc = TotalFc,
                              online = IsOnline}
                 | Rest],
                InviteList)
    when Lev >= 80 ->
    case check_has_team(Fid) of
        false ->
            InviteInfo = #invite_info{id = Fid, name = Name,
                                      lev = Lev, break_times = BreakTimes,
                                      classes = Classes, sex = Sex,
                                      total_fc = TotalFc, online = IsOnline},
            get_invite_list(Rest, [InviteInfo | InviteList]);
        true -> get_invite_list(Rest, InviteList)
    end;
get_invite_list([#guild_role{id = Gid, name = Name,
                             lev = Lev, classes = Classes,
                             lev_break_times = BreakTimes, sex = Sex,
                             synth_fc = TotalFc, status = IsOnline}
                 | Rest],
                InviteList)
    when Lev >= 80 ->
    case check_has_team(Gid) of
        false ->
            InviteInfo = #invite_info{id = Gid, name = Name,
                                      lev = Lev, break_times = BreakTimes,
                                      classes = Classes, sex = Sex,
                                      total_fc = TotalFc, online = IsOnline},
            get_invite_list(Rest, [InviteInfo | InviteList]);
        true -> get_invite_list(Rest, InviteList)
    end;
get_invite_list([_ | Rest], InviteList) ->
    get_invite_list(Rest, InviteList).

set_declaration(#role{id = TeamId,
                      m_gods_duel = #m_gods_duel{team_id = TeamId}},
                Declaration) ->
    case lookup(TeamId) of
        {ok, #gods_duel_team{}} ->
            gods_duel_agent:info({set_declaration,
                                  TeamId,
                                  Declaration}),
            ok;
        _ -> {false, lang:get("您还没有创建战队呢")}
    end;
set_declaration(_, _) ->
    {false, lang:get("您不是队长，无法操作")}.

agent_set_declaration(TeamId, Declaration) ->
    case lookup(TeamId) of
        {ok, TeamInfo} ->
            NewTeamInfo = TeamInfo#gods_duel_team{declaration =
                                                      Declaration},
            save_team_data(NewTeamInfo),
            async_member(TeamId,
                         [1, 2, 3],
                         {gods_duel_role, push_gods_duel_team, []}),
            ok;
        _ -> ok
    end.

modify_team_name(#role{id = TeamId,
                       m_gods_duel = #m_gods_duel{team_id = TeamId}},
                 TeamName) ->
    case catch ets:lookup(gods_duel_team_names, TeamName) of
        [_] -> {false, lang:get("该战队名已经被其它战队使用了")};
        _ ->
            case util:check_name(TeamName) of
                ok ->
                    case lookup(TeamId) of
                        {ok, #gods_duel_team{name = OldName}} ->
                            case OldName =:= TeamName of
                                true -> {ok, ""};
                                false ->
                                    gods_duel_agent:info({modify_team_name,
                                                          TeamId,
                                                          TeamName}),
                                    {ok, ""}
                            end;
                        _ -> {false, lang:get("您还没有战队呢，赶快去创建战队吧")}
                    end;
                Else -> Else
            end
    end;
modify_team_name(_, _) ->
    {false, lang:get("您不是队长，无法操作")}.

agent_modify_team_name(TeamId, TeamName) ->
    case lookup(TeamId) of
        {ok, TeamInfo} ->
            NewTeamInfo = TeamInfo#gods_duel_team{name = TeamName},
            save_team_data(NewTeamInfo),
            async_member(TeamId,
                         [1, 2, 3],
                         {gods_duel_role, push_gods_duel_team, []}),
            ok;
        _ -> ok
    end.

exchange_alternate(#role{id = TeamId,
                         m_gods_duel = #m_gods_duel{team_id = TeamId}},
                   Id1, Id2) ->
    case lookup(TeamId) of
        {ok, #gods_duel_team{members = Members}} ->
            case lists:keyfind(Id1,
                               #gods_duel_team_mate.id,
                               Members)
                of
                #gods_duel_team_mate{position = 1} ->
                    {false, lang:get("队长不能进行交换")};
                #gods_duel_team_mate{position = Pos1} ->
                    case lists:keyfind(Id2,
                                       #gods_duel_team_mate.id,
                                       Members)
                        of
                        #gods_duel_team_mate{position = 1} ->
                            {false, lang:get("队长不能进行交换")};
                        #gods_duel_team_mate{position = Pos2} ->
                            case Pos1 =:= Pos2 of
                                true -> {false, lang:get("无需交换")};
                                false ->
                                    gods_duel_agent:info({exchange_alternate,
                                                          TeamId,
                                                          Id1,
                                                          Id2}),
                                    ok
                            end;
                        _ -> {false, lang:get("队员离开了战队，操作失败")}
                    end;
                _ -> {false, lang:get("队员离开了战队，操作失败")}
            end;
        _ -> {false, lang:get("您还未拥有战队呢，赶快去创建吧")}
    end;
exchange_alternate(_, _, _) ->
    {false, lang:get("您不是队长，无法操作")}.

agent_exchange_alternate(TeamId, Id1, Id2) ->
    case lookup(TeamId) of
        {ok, TeamInfo = #gods_duel_team{members = Members}} ->
            case lists:keyfind(Id1,
                               #gods_duel_team_mate.id,
                               Members)
                of
                Mate1 = #gods_duel_team_mate{position = Pos1} ->
                    case lists:keyfind(Id2,
                                       #gods_duel_team_mate.id,
                                       Members)
                        of
                        Mate2 = #gods_duel_team_mate{position = Pos2} ->
                            Members1 = lists:keystore(Id1,
                                                      #gods_duel_team_mate.id,
                                                      Members,
                                                      Mate1#gods_duel_team_mate{position
                                                                                    =
                                                                                    Pos2}),
                            Members2 = lists:keystore(Id2,
                                                      #gods_duel_team_mate.id,
                                                      Members1,
                                                      Mate2#gods_duel_team_mate{position
                                                                                    =
                                                                                    Pos1}),
                            NewTeamInfo = TeamInfo#gods_duel_team{members =
                                                                      Members2},
                            save_team_data(NewTeamInfo),
                            async_member(TeamId,
                                         [1, 2, 3],
                                         {gods_duel_role,
                                          push_gods_duel_team,
                                          []}),
                            ok;
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

dismiss_team(Role = #role{m_gods_duel =
                              MGodsDuel = #m_gods_duel{team_id = TeamId}}) ->
    case is_team_status() of
        true ->
            NewRole = Role#role{m_gods_duel =
                                    MGodsDuel#m_gods_duel{team_id =
                                                              {0, "", 0}}},
            gods_duel_agent:info({dismiss_team, TeamId}),
            {ok, NewRole, lang:get("您解散了战队")};
        false ->
            Msg = notice:format(lang:get("只有在赛季~ts与~ts才能~ts"),
                                [{string_2, 5, lang:get("准备阶段")},
                                 {string_2, 5, lang:get("报名阶段")},
                                 {string_2, 5, lang:get("解散战队")}]),
            {false, Msg}
    end;
dismiss_team(TeamId) ->
    case lookup(TeamId) of
        {ok,
         #gods_duel_team{id = TeamId, name = TeamName,
                         members = Members}} ->
            async_member(TeamId,
                         [1, 2, 3],
                         {gods_duel_team, sync_leave_team, []}),
            LeaderName = case lists:keyfind(TeamId,
                                            #gods_duel_team_mate.id,
                                            Members)
                             of
                             #gods_duel_team_mate{name = _LeaderName} ->
                                 _LeaderName;
                             _ -> lang:get("")
                         end,
            send_mail(dismiss_team,
                      Members,
                      #{team_name => TeamName, leader_name => LeaderName}),
            remove_team_data(TeamId),
            MemberIds = [MateId
                         || #gods_duel_team_mate{id = MateId} <- Members],
            lists:map(fun remove_role_team_id/1, MemberIds),
            remove_name_used(TeamName),
            case env:get(gods_season_status) of
                2 ->
                    logger:debug("解散战队:~w", [TeamId], gods_duel_team, 506),
                    big_world:cast(gods_duel_mgr,
                                   info,
                                   [{team_dismiss, TeamId}]),
                    ok;
                _ -> ok
            end,
            ok;
        _ -> {false, lang:get("不存在的队伍")}
    end.

leave_team(#role{m_gods_duel =
                     #m_gods_duel{team_id = {0, "", 0}}}) ->
    {false, lang:get("您还未加入任何战队呢")};
leave_team(Role = #role{id = RoleId,
                        m_gods_duel =
                            MGodsDuel = #m_gods_duel{team_id = TeamId}}) ->
    case is_team_status() of
        true ->
            logger:debug("角色离开战队:~w",
                         [RoleId],
                         gods_duel_team,
                         522),
            NewRole = Role#role{m_gods_duel =
                                    MGodsDuel#m_gods_duel{team_id =
                                                              {0, "", 0}}},
            gods_duel_agent:info({leave_team, RoleId, TeamId}),
            gods_duel_role:push_gods_duel_team(NewRole),
            {ok, NewRole, lang:get("您离开了战队")};
        false ->
            Msg = notice:format(lang:get("只有在赛季~ts与~ts才能~ts"),
                                [{string_2, 5, lang:get("准备阶段")},
                                 {string_2, 5, lang:get("报名阶段")},
                                 {string_2, 5, lang:get("离开战队")}]),
            {false, Msg}
    end.

leave_team(RoleId, TeamId) ->
    logger:debug("角色~w离开战队:~w",
                 [RoleId, TeamId],
                 gods_duel_team,
                 533),
    case lookup(TeamId) of
        {ok,
         TeamInfo = #gods_duel_team{name = TeamName,
                                    members = Members,
                                    qualification = Qualification,
                                    lev = OldTeamLev}} ->
            mate_leave_team(TeamInfo, RoleId),
            case lists:keyfind(RoleId,
                               #gods_duel_team_mate.id,
                               Members)
                of
                #gods_duel_team_mate{name = MateName} ->
                    NewMembers = lists:keydelete(RoleId,
                                                 #gods_duel_team_mate.id,
                                                 Members),
                    Flag1 = length(Members) =:= 5,
                    NewTeamLev = case lookup(TeamId) of
                                     {ok, #gods_duel_team{lev = _NewTeamLev}} ->
                                         _NewTeamLev;
                                     _ -> 80
                                 end,
                    Flag2 = OldTeamLev =/= NewTeamLev andalso
                                Qualification =:= 1,
                    Args = case Flag2 of
                               true ->
                                   GroupName = get_group_name(NewTeamLev),
                                   #{mate_name => MateName,
                                     team_name => TeamName,
                                     group_name => GroupName, flag1 => Flag1,
                                     flag2 => Flag2};
                               false ->
                                   #{mate_name => MateName, flag1 => Flag1,
                                     flag2 => Flag2}
                           end,
                    logger:debug("离开邮件参数:~w", [Args], gods_duel_team, 554),
                    send_mail(leave_team, NewMembers, Args),
                    remove_role_team_id(RoleId),
                    async_member(TeamId,
                                 [1, 2, 3],
                                 {gods_duel_role, push_gods_duel_team, []}),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end.

invite_team(Role = #role{id = RoleId, name = Name,
                         m_gods_duel = #m_gods_duel{team_id = TeamId}},
            InviteId) ->
    case check_invite_team([season_status,
                            has_team,
                            tean_num,
                            invite],
                           Role,
                           [{invite_id, InviteId}])
        of
        {true, _} ->
            case lookup(TeamId) of
                {ok, #gods_duel_team{name = TeamName}} ->
                    case case catch gen_server:call(gods_duel_agent,
                                                    {invite_team,
                                                     RoleId,
                                                     InviteId,
                                                     TeamId},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        ok ->
                            case role_query:pid(by_id, InviteId) of
                                {ok, InvitePid} ->
                                    role:apply(async,
                                               InvitePid,
                                               {gods_duel_team,
                                                apply_confirm_invite_team,
                                                [TeamId, Name, TeamName]}),
                                    ok;
                                _ -> {false, lang:get("对方不在线，无法邀请")}
                            end;
                        _Else -> _Else
                    end;
                _ -> {false, lang:get("您还未拥有战队呢，赶快去创建吧")}
            end;
        {false, Reason} -> {false, Reason}
    end.

invite_team(RoleId, InviteId, TeamId) ->
    case lookup(TeamId) of
        {ok,
         TeamInfo = #gods_duel_team{invite_info = InviteInfo}} ->
            Now = date:unixtime(),
            NewInviteInfo = lists:keystore(InviteId,
                                           1,
                                           InviteInfo,
                                           {InviteId, RoleId, Now}),
            NewTeamInfo = TeamInfo#gods_duel_team{invite_info =
                                                      NewInviteInfo},
            save_team_data(NewTeamInfo),
            ok;
        _ -> {false, lang:get("战队已经解散了，无法进行邀请")}
    end.

apply_confirm_invite_team(#role{lev = Lev}, _, _, _)
    when Lev < 80 ->
    ok;
apply_confirm_invite_team(Role = #role{m_gods_duel =
                                           MGodsDuel},
                          TeamId, Name, TeamName) ->
    role:link_send(Role, 17902, {2, Name, TeamName}),
    NewRole = Role#role{m_gods_duel =
                            MGodsDuel#m_gods_duel{team_id = TeamId}},
    {ok, NewRole}.

apply_join_team(#role{lev = RoleLev}, _TeamId)
    when RoleLev < 80 ->
    Msg = notice:format(lang:get("您的等级不足~ts级，无法申请加入战队"),
                        [{string_2, 1, 80}]),
    {false, Msg};
apply_join_team(Role = #role{id = RoleId}, TeamId) ->
    case is_team_status() of
        true ->
            case check_has_team(RoleId) of
                true -> {false, lang:get("您已经拥有战队了，不能加入其它战队")};
                _ ->
                    case lookup(TeamId) of
                        {ok, #gods_duel_team{member_num = Num}} when Num >= 7 ->
                            Msg = lang:get("您申请加入的战队已经满员，请选择其他战队加入吧"),
                            {false, Msg};
                        {ok, #gods_duel_team{applys = Applys}} ->
                            case lists:keyfind(RoleId,
                                               #gods_duel_team_mate.id,
                                               Applys)
                                of
                                #gods_duel_team_mate{} ->
                                    {false, lang:get("您已经申请了该战队，请等待队长批准")};
                                _ ->
                                    case role_convert:to(gods_duel_mate, Role)
                                        of
                                        {ok, TeamMate} ->
                                            TeamMate1 =
                                                TeamMate#gods_duel_team_mate{join_time
                                                                                 =
                                                                                 date:unixtime()},
                                            gods_duel_agent:info({apply_join_team,
                                                                  TeamMate1,
                                                                  TeamId}),
                                            ok;
                                        _ -> {false, lang:get("加入战队失败")}
                                    end
                            end;
                        _ -> {false, lang:get("申请加入失败，战队已经解散了")}
                    end
            end;
        false ->
            Msg = notice:format(lang:get("只有在赛季~ts与~ts才能~ts"),
                                [{string_2, 5, lang:get("准备阶段")},
                                 {string_2, 5, lang:get("报名阶段")},
                                 {string_2, 5, lang:get("加入战队")}]),
            {false, Msg}
    end;
apply_join_team(TeamMate = #gods_duel_team_mate{id =
                                                    RoleId},
                TeamId) ->
    case lookup(TeamId) of
        {ok, TeamInfo = #gods_duel_team{applys = Applys}} ->
            NewApplys = lists:keystore(RoleId,
                                       #gods_duel_team_mate.id,
                                       Applys,
                                       TeamMate),
            NewTeamInfo = TeamInfo#gods_duel_team{applys =
                                                      NewApplys},
            save_team_data(NewTeamInfo),
            async_member(TeamId,
                         [1, 2, 3],
                         {gods_duel_role, push_gods_duel_team, []}),
            ok;
        _ -> ok
    end.

approve_join_team(#role{id = TeamId,
                        m_gods_duel = #m_gods_duel{team_id = TeamId}},
                  ApplyId, Flag) ->
    case is_team_status() of
        true ->
            case lookup(TeamId) of
                {ok, #gods_duel_team{member_num = Num}}
                    when Num >= 7 andalso Flag =:= 1 ->
                    {false, lang:get("战队已经满员了，无法再增加新成员了")};
                {ok, #gods_duel_team{applys = Applys}} ->
                    case lists:keyfind(ApplyId,
                                       #gods_duel_team_mate.id,
                                       Applys)
                        of
                        #gods_duel_team_mate{name = Name} ->
                            case case catch gen_server:call(gods_duel_agent,
                                                            {approve_join_team,
                                                             TeamId,
                                                             ApplyId,
                                                             Flag},
                                                            10000)
                                     of
                                     {'EXIT', {timeout, _}} -> {error, timeout};
                                     {'EXIT', {noproc, _}} -> {error, noproc};
                                     {'EXIT', {normal, _}} -> {error, exit};
                                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                                     _Call_Return -> _Call_Return
                                 end
                                of
                                ok ->
                                    Msg = case Flag of
                                              1 ->
                                                  notice:format("您同意了~ts的申请",
                                                                [{role_2,
                                                                  Name}]);
                                              0 ->
                                                  notice:format("您拒绝了~ts的申请",
                                                                [{role_2,
                                                                  Name}])
                                          end,
                                    {ok, Msg};
                                {false, Reason} ->
                                    logger:debug("==========:~w",
                                                 [Reason],
                                                 gods_duel_team,
                                                 684),
                                    {false, Reason}
                            end;
                        _ -> {false, lang:get("该申请无效，无需处理")}
                    end;
                _ -> {false, lang:get("您还没有战队呢")}
            end;
        false ->
            Msg = notice:format(lang:get("只有在赛季~ts与~ts才能~ts"),
                                [{string_2, 5, lang:get("准备阶段")},
                                 {string_2, 5, lang:get("报名阶段")},
                                 {string_2, 5, lang:get("加入队员")}]),
            {false, Msg}
    end;
approve_join_team(#role{}, _, _Flag) ->
    {false, lang:get("您不是队长，无法操作")};
approve_join_team(TeamId, ApplyId, Flag) ->
    case lookup(TeamId) of
        {ok, #gods_duel_team{member_num = Num}}
            when Num >= 7 andalso Flag =:= 1 ->
            {false, lang:get("战队已经满员了，无法再增加新成员了")};
        {ok,
         TeamInfo = #gods_duel_team{name = TeamName,
                                    applys = Applys, members = Members,
                                    qualification = Qualification,
                                    lev = OldTeamGroup}} ->
            case Flag of
                0 ->
                    NewApplys = lists:keydelete(ApplyId,
                                                #gods_duel_team_mate.id,
                                                Applys),
                    NewTeamInfo = TeamInfo#gods_duel_team{applys =
                                                              NewApplys},
                    save_team_data(NewTeamInfo),
                    async_member(TeamId,
                                 [1, 2, 3],
                                 {gods_duel_role, push_gods_duel_team, []}),
                    ok;
                1 ->
                    case lists:keymember(ApplyId,
                                         #gods_duel_team_mate.id,
                                         Members)
                        of
                        true -> {false, lang:get("ta已经加入战队了")};
                        _ ->
                            case check_has_team(ApplyId) of
                                true ->
                                    NewApplys = lists:keydelete(ApplyId,
                                                                #gods_duel_team_mate.id,
                                                                Applys),
                                    NewTeamInfo = TeamInfo#gods_duel_team{applys
                                                                              =
                                                                              NewApplys},
                                    save_team_data(NewTeamInfo),
                                    async_member(TeamId,
                                                 [1, 2, 3],
                                                 {gods_duel_role,
                                                  push_gods_duel_team,
                                                  []}),
                                    logger:debug("ta已经加入了其他战队",
                                                 [],
                                                 gods_duel_team,
                                                 723),
                                    {false, lang:get("ta已经加入了其他战队")};
                                false ->
                                    case lists:keyfind(ApplyId,
                                                       #gods_duel_team_mate.id,
                                                       Applys)
                                        of
                                        ApplyInfo = #gods_duel_team_mate{name =
                                                                             MateName,
                                                                         lev =
                                                                             MateLev} ->
                                            NewApplys = lists:keydelete(ApplyId,
                                                                        #gods_duel_team_mate.id,
                                                                        Applys),
                                            TeamInfo1 =
                                                TeamInfo#gods_duel_team{applys =
                                                                            NewApplys},
                                            mate_join_team(TeamInfo1,
                                                           ApplyInfo),
                                            NewTeamGroup = case lookup(TeamId)
                                                               of
                                                               {ok,
                                                                #gods_duel_team{lev
                                                                                    =
                                                                                    _NewTeamGroup}} ->
                                                                   _NewTeamGroup;
                                                               _ -> 80
                                                           end,
                                            case OldTeamGroup =/= NewTeamGroup
                                                     andalso Qualification =:= 1
                                                of
                                                true ->
                                                    SeasonName =
                                                        gods_duel_common:get_season_name(),
                                                    send_mail(team_lev_up,
                                                              Members,
                                                              #{mate_name =>
                                                                    MateName,
                                                                mate_lev =>
                                                                    MateLev,
                                                                season_name =>
                                                                    SeasonName,
                                                                team_name =>
                                                                    TeamName,
                                                                gourp_name =>
                                                                    NewTeamGroup});
                                                _ -> ok
                                            end,
                                            async_member(TeamId,
                                                         [1, 2, 3],
                                                         {gods_duel_role,
                                                          push_gods_duel_team,
                                                          []}),
                                            update_role_team_id({ApplyId,
                                                                 TeamId}),
                                            LeaderName = case
                                                             lists:keyfind(TeamId,
                                                                           #gods_duel_team_mate.id,
                                                                           Members)
                                                             of
                                                             #gods_duel_team_mate{name
                                                                                      =
                                                                                      _LeaderName} ->
                                                                 _LeaderName;
                                                             _ -> ""
                                                         end,
                                            Title = lang:get("加入战队"),
                                            Content =
                                                notice:format(lang:get("恭喜，~ts已通过了您加入战队~ts的申请，欢迎成为我们的战友"),
                                                              [{string_2,
                                                                1,
                                                                LeaderName},
                                                               {string_2,
                                                                1,
                                                                TeamName}]),
                                            mail:send(ApplyId, Title, Content),
                                            case role_query:pid(by_id, ApplyId)
                                                of
                                                {ok, RolePid} ->
                                                    role:apply(async,
                                                               RolePid,
                                                               {gods_duel_team,
                                                                sync_approve_join_team,
                                                                [TeamId]}),
                                                    ok;
                                                _ -> ok
                                            end,
                                            ok;
                                        _ -> {false, lang:get("该申请无效，无需处理")}
                                    end
                            end
                    end
            end;
        _ -> {false, lang:get("队伍信息不存在")}
    end.

agent_team_sign(TeamId, _) ->
    case lookup(TeamId) of
        {ok,
         TeamInfo = #gods_duel_team{members = Members,
                                    name = TeamName, lev = Lev}} ->
            NewTeamInfo = TeamInfo#gods_duel_team{qualification =
                                                      1},
            save_team_data(NewTeamInfo),
            async_member(TeamId,
                         [1, 2, 3],
                         {gods_duel_role, push_gods_duel_team, []}),
            SeasonName = gods_duel_common:get_season_name(),
            GroupName = get_group_name(Lev),
            send_mail(team_sign,
                      Members,
                      #{team_name => TeamName, season_name => SeasonName,
                        group_name => GroupName}),
            big_world:cast(gods_duel_mgr,
                           info,
                           [{team_sign, NewTeamInfo}]),
            ok;
        _ -> false
    end.

sync_approve_join_team(Role = #role{m_gods_duel =
                                        MGodsDuel},
                       TeamId) ->
    GodsDuelRole = Role#role{m_gods_duel =
                                 MGodsDuel#m_gods_duel{team_id = TeamId}},
    gods_duel_role:push_gods_duel_team(GodsDuelRole),
    ChatIconRole =
        gods_duel_role:remove_chat_icon(GodsDuelRole),
    {ok, ChatIconRole}.

sync_leave_team(Role = #role{m_gods_duel =
                                 MGodsDuel}) ->
    NewRole = Role#role{m_gods_duel =
                            MGodsDuel#m_gods_duel{team_id = {0, "", 0}}},
    gods_duel_role:push_gods_duel_team(NewRole),
    {ok, NewRole}.

update_member_info(info, TeamId, RoleId,
                   {Lev, Classes, Name, Sex}, _) ->
    case lookup(TeamId) of
        {ok, TeamInfo = #gods_duel_team{members = Members}} ->
            case lists:keyfind(RoleId,
                               #gods_duel_team_mate.id,
                               Members)
                of
                MateInfo = #gods_duel_team_mate{} ->
                    case is_member_changed(MateInfo,
                                           {Lev, Classes, Name, Sex})
                        of
                        true ->
                            NewMateInfo = MateInfo#gods_duel_team_mate{lev =
                                                                           Lev,
                                                                       classes =
                                                                           Classes,
                                                                       name =
                                                                           Name,
                                                                       sex =
                                                                           Sex},
                            NewMembers = lists:keystore(RoleId,
                                                        #gods_duel_team_mate.id,
                                                        Members,
                                                        NewMateInfo),
                            TeamInfo1 = TeamInfo#gods_duel_team{members =
                                                                    NewMembers},
                            NewTeamInfo = update_team_info(TeamInfo1),
                            save_team_data(NewTeamInfo),
                            big_world:cast(gods_duel_mgr,
                                           info,
                                           [{update_member_info,
                                             TeamId,
                                             RoleId,
                                             Lev,
                                             Classes,
                                             Name,
                                             Sex}]),
                            ok;
                        false -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end;
update_member_info(lev, TeamId, RoleId, Lev, _) ->
    case lookup(TeamId) of
        {ok,
         TeamInfo = #gods_duel_team{name = TeamName,
                                    members = Members, lev = OldTeamGroup,
                                    qualification = Qualification}} ->
            case lists:keyfind(RoleId,
                               #gods_duel_team_mate.id,
                               Members)
                of
                MateInfo = #gods_duel_team_mate{name = MateName} ->
                    NewMateInfo = MateInfo#gods_duel_team_mate{lev = Lev},
                    NewMembers = lists:keystore(RoleId,
                                                #gods_duel_team_mate.id,
                                                Members,
                                                NewMateInfo),
                    TeamInfo1 = TeamInfo#gods_duel_team{members =
                                                            NewMembers},
                    NewTeamInfo = #gods_duel_team{lev = NewTeamGroup} =
                                      update_team_info(TeamInfo1),
                    logger:debug("更新战队信息", [], gods_duel_team, 840),
                    case OldTeamGroup =/= NewTeamGroup andalso
                             Qualification =:= 1
                        of
                        true ->
                            GroupName = get_group_name(NewTeamGroup),
                            SeasonName = gods_duel_common:get_season_name(),
                            send_mail(team_lev_up,
                                      Members,
                                      #{mate_name => MateName, mate_lev => Lev,
                                        season_name => SeasonName,
                                        team_name => TeamName,
                                        gourp_name => GroupName});
                        _ -> ok
                    end,
                    save_team_data(NewTeamInfo),
                    async_member(TeamId,
                                 [1, 2, 3],
                                 {gods_duel_role, push_gods_duel_team, []}),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end;
update_member_info(break_times, TeamId, RoleId,
                   BreakTimes, #{lev := Lev}) ->
    case lookup(TeamId) of
        {ok,
         TeamInfo = #gods_duel_team{name = _TeamName,
                                    members = Members}} ->
            case lists:keyfind(RoleId,
                               #gods_duel_team_mate.id,
                               Members)
                of
                MateInfo = #gods_duel_team_mate{name = _MateName} ->
                    NewMateInfo = MateInfo#gods_duel_team_mate{lev = Lev,
                                                               break_times =
                                                                   BreakTimes},
                    NewMembers = lists:keystore(RoleId,
                                                #gods_duel_team_mate.id,
                                                Members,
                                                NewMateInfo),
                    TeamInfo1 = TeamInfo#gods_duel_team{members =
                                                            NewMembers},
                    NewTeamInfo = update_team_info(TeamInfo1),
                    logger:debug("更新战队信息", [], gods_duel_team, 865),
                    save_team_data(NewTeamInfo),
                    async_member(TeamId,
                                 [1, 2, 3],
                                 {gods_duel_role, push_gods_duel_team, []}),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end;
update_member_info(fc, TeamId, RoleId, TotalFc, _) ->
    case lookup(TeamId) of
        {ok, TeamInfo = #gods_duel_team{members = Members}} ->
            case lists:keyfind(RoleId,
                               #gods_duel_team_mate.id,
                               Members)
                of
                MateInfo = #gods_duel_team_mate{} ->
                    NewMateInfo =
                        MateInfo#gods_duel_team_mate{fight_capacity = TotalFc},
                    NewMembers = lists:keystore(RoleId,
                                                #gods_duel_team_mate.id,
                                                Members,
                                                NewMateInfo),
                    TeamInfo1 = TeamInfo#gods_duel_team{members =
                                                            NewMembers},
                    NewTeamInfo = update_team_info(TeamInfo1),
                    save_team_data(NewTeamInfo),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end;
update_member_info(_, _, _, _, _) -> ok.

update_team_info(TeamInfo = #gods_duel_team{members =
                                                Members}) ->
    LevFun = fun (#gods_duel_team_mate{lev = Lev,
                                       break_times = BreakTimes},
                  {RtLev, RtnBreakTimes}) ->
                     case BreakTimes > RtnBreakTimes of
                         true -> {Lev, BreakTimes};
                         false when BreakTimes =:= RtnBreakTimes ->
                             {max(Lev, RtLev), BreakTimes};
                         _ -> {RtLev, RtnBreakTimes}
                     end;
                 (_, Rtn) -> Rtn
             end,
    {TeamMaxLev, TeamMaxBreakTimes} = lists:foldr(LevFun,
                                                  {0, 0},
                                                  Members),
    GroupId = gods_duel_data:get_group_num(TeamMaxLev,
                                           TeamMaxBreakTimes),
    FcRankList =
        lists:sublist(util:keys_sort([#gods_duel_team_mate.fight_capacity],
                                     Members),
                      5),
    FcFun = fun (#gods_duel_team_mate{fight_capacity =
                                          MateFc},
                 RtFc) ->
                    MateFc + RtFc;
                (_, RtFc) -> RtFc
            end,
    TotalFc = lists:foldl(FcFun, 0, FcRankList),
    Flag = case gods_duel_common:get_season_status() of
               1 -> true;
               2 -> true;
               _ -> false
           end,
    case Flag of
        true ->
            TeamInfo#gods_duel_team{lev = GroupId,
                                    fight_capacity = TotalFc};
        _ -> TeamInfo#gods_duel_team{fight_capacity = TotalFc}
    end.

async_member(TeamId, PL, {M, F, A}) ->
    case lookup(TeamId) of
        {ok, #gods_duel_team{members = Members}} ->
            lists:foreach(fun (#gods_duel_team_mate{id = MateId,
                                                    position = Position}) ->
                                  case lists:member(Position, PL) of
                                      true ->
                                          case role_query:pid(by_id, MateId) of
                                              {ok, MatePid} ->
                                                  role:apply(async,
                                                             MatePid,
                                                             {M, F, A});
                                              _ -> ok
                                          end;
                                      false -> ok
                                  end;
                              (_Else) -> ok
                          end,
                          Members);
        _ -> ok
    end.

lookup(TeamId) ->
    case catch ets:lookup(gods_duel_team_data, TeamId) of
        [TeamInfo = #gods_duel_team{}] -> {ok, TeamInfo};
        _ -> false
    end.

save_team_data(TeamInfo) ->
    ets:insert(gods_duel_team_data, TeamInfo),
    dets:insert(gods_duel_team_data, TeamInfo),
    ok.

remove_team_data(TeamId) ->
    ets:delete(gods_duel_team_data, TeamId),
    dets:delete(gods_duel_team_data, TeamId),
    ok.

update_role_team_id({RoleId, TeamId}) ->
    ets:insert(gods_duel_team_role_ids, {RoleId, TeamId}),
    dets:insert(gods_duel_team_role_ids, {RoleId, TeamId}),
    ok.

remove_role_team_id(RoleId) ->
    ets:delete(gods_duel_team_role_ids, RoleId),
    dets:delete(gods_duel_team_role_ids, RoleId),
    ok.

update_name_used(#gods_duel_team{id = Id,
                                 name = Name}) ->
    ets:insert(gods_duel_team_names, {Name, Id}),
    ok.

remove_name_used(TeamName) ->
    ets:delete(gods_duel_team_names, TeamName),
    ok.

check_create_team([], _Role, Args) -> {true, Args};
check_create_team([Type | Rest], Role, Args) ->
    case check_create_team(Type, Role, Args) of
        true -> check_create_team(Rest, Role, Args);
        {true, NewArgs} ->
            check_create_team(Rest, Role, NewArgs);
        {false, Reason} -> {false, Reason}
    end;
check_create_team(lev, #role{lev = Lev}, _Args)
    when Lev < 80 ->
    Msg = notice:format(lang:get("您的等级不足~ts级，不能创建战队"),
                        [{string_2, 1, 80}]),
    {false, Msg};
check_create_team(season_status, #role{}, _Args) ->
    case is_team_status() of
        true -> true;
        false ->
            Msg = notice:format(lang:get("只有在赛季~ts与~ts才能~ts"),
                                [{string_2, 5, lang:get("准备阶段")},
                                 {string_2, 5, lang:get("报名阶段")},
                                 {string_2, 5, lang:get("创建战队")}]),
            {false, Msg}
    end;
check_create_team(create_cd, Role, _Args) ->
    Now = date:unixtime(),
    LastCreateTime = var:get_var(Role, other, 20501, 0),
    case Now - LastCreateTime > 3600 of
        true -> true;
        false -> {false, lang:get("由于您刚刚解散战队，1小时之后才能创建战队")}
    end;
check_create_team(team_name, #role{}, Args) ->
    {_, TeamName} = lists:keyfind(team_name, 1, Args),
    case catch ets:lookup(gods_duel_team_names, TeamName) of
        [_] -> {false, lang:get("该战队名已经被其它战队使用了")};
        _ ->
            case util:check_name(TeamName) of
                ok -> true;
                Else -> Else
            end
    end;
check_create_team(has_team, #role{id = RoleId},
                  _Args) ->
    case check_has_team(RoleId) of
        true -> {false, lang:get("您已经拥有战队了，无需继续创建")};
        false -> true
    end;
check_create_team(team_member, Role, Args) ->
    case team:get_members(Role) of
        Mates when length(Mates) < 1 ->
            {false,
             notice:format(lang:get("需要~ts带队，至少~ts创建队伍{face_1,3}"),
                           [{string_2, 5, lang:get("队长")},
                            {string_2, 5, lang:get("2人")}])};
        Mates ->
            CehckFun = fun (_A = #team_mate{id = MateId,
                                            name = Name, lev = Lev,
                                            status = Status}) ->
                               logger:debug("检查队员信息:~w",
                                            [_A],
                                            gods_duel_team,
                                            1037),
                               case Lev < 80 of
                                   true ->
                                       Msg =
                                           notice:format(lang:get("您队伍中的队员~ts等级不足~ts，不能加入战队"),
                                                         [{role_2, Name},
                                                          {string_2, 1, 80}]),
                                       {false, Msg};
                                   _ ->
                                       case Status =/= 2 andalso Status =/= 1 of
                                           true ->
                                               Msg =
                                                   notice:format(lang:get("您队伍中的队员~ts未归队，不能创建战队"),
                                                                 [{role_2,
                                                                   Name}]),
                                               {false, Msg};
                                           false ->
                                               case check_has_team(MateId) of
                                                   true ->
                                                       Msg =
                                                           notice:format(lang:get("您队伍中的队员~ts已经有战队了"),
                                                                         [{role_2,
                                                                           Name}]),
                                                       {false, Msg};
                                                   false -> true
                                               end
                                       end
                               end
                       end,
            CheckResult = lists:map(CehckFun, Mates),
            case lists:keyfind(false, 1, CheckResult) of
                {false, Reason} -> {false, Reason};
                _ ->
                    NewArgs = [{member_num, length(Mates)} | Args],
                    {true, NewArgs}
            end
    end;
check_create_team(_Type, _Role, _Args) -> true.

check_invite_team([], _Role, Args) -> {true, Args};
check_invite_team([Type | Rest], Role, Args) ->
    case check_invite_team(Type, Role, Args) of
        true -> check_invite_team(Rest, Role, Args);
        {true, NewArgs} ->
            check_invite_team(Rest, Role, NewArgs);
        {false, Reason} -> {false, Reason}
    end;
check_invite_team(season_status, #role{}, _Args) ->
    case is_team_status() of
        true -> true;
        false ->
            Msg = notice:format(lang:get("只有在赛季~ts与~ts才能~ts"),
                                [{string_2, 5, lang:get("准备阶段")},
                                 {string_2, 5, lang:get("报名阶段")},
                                 {string_2, 5, lang:get("邀请成员")}]),
            {false, Msg}
    end;
check_invite_team(has_team, #role{id = RoleId},
                  _Args) ->
    case check_has_team(RoleId) of
        true -> true;
        false -> {false, lang:get("您还没有战队呢，赶快去创建战队吧")}
    end;
check_invite_team(tean_num,
                  #role{m_gods_duel = #m_gods_duel{team_id = TeamId}},
                  _Args) ->
    case lookup(TeamId) of
        {ok, #gods_duel_team{member_num = Num}} when Num >= 7 ->
            {false, lang:get("您的战队已经满员了")};
        _ -> true
    end;
check_invite_team(invite, _Role, Args) ->
    case lists:keyfind(invite_id, 1, Args) of
        {_, InviteId} ->
            case check_has_team(InviteId) of
                true ->
                    Msg = lang:get("对方已经有战队了"),
                    {false, Msg};
                false -> true
            end;
        _ -> true
    end;
check_invite_team(_Type, _Role, _Args) -> true.

send_mail(_, [], _) -> ok;
send_mail(create_team,
          [#gods_duel_team_mate{id = Id, position = 1} | Rest],
          Args = #{team_name := TeamName, team_num := Num}) ->
    Title = lang:get("战队创建"),
    Content = case Num >= 5 of
                  true ->
                      notice:format(lang:get("恭喜您建立战队~ts，当前战队人数已达五人，将在整点自动报名参与诸神之战，加油！"),
                                    [{string_2, 1, TeamName}]);
                  _ ->
                      notice:format(lang:get("恭喜您建立战队~ts，您当前战队人数不足~ts，报名截止后将无法入围，请尽快补充队员。"),
                                    [{string_2, 1, TeamName},
                                     {string_2, 1, lang:get("五人")}])
              end,
    mail:send(Id, Title, Content),
    send_mail(create_team, Rest, Args);
send_mail(create_team,
          [#gods_duel_team_mate{id = Id} | Rest],
          Args = #{team_name := TeamName}) ->
    Title = lang:get("战队创建"),
    Content =
        notice:format(lang:get("欢迎加入战队~ts，请好好准备，迎接诸界强队的挑战吧。"),
                      [{string_2, 1, TeamName}]),
    mail:send(Id, Title, Content),
    send_mail(create_team, Rest, Args);
send_mail(leave_team,
          [#gods_duel_team_mate{id = Id} | Rest],
          Args = #{mate_name := MateName, flag1 := Flag1,
                   flag2 := Flag2}) ->
    Title = lang:get("战队队员离队"),
    Content1 =
        notice:format(lang:get("天下无不散之筵席，很遗憾，~ts离开了战队, 希望以后有机会能够再次并肩作战。"),
                      [{role_2, MateName}]),
    Content2 = case Flag2 of
                   true ->
                       case Args of
                           #{team_name := TeamName, group_name := GroupName} ->
                               AddMsg =
                                   notice:format(lang:get("\n由于~ts的离开, 您所属的战队~ts被分配至~ts。"),
                                                 [{role_2, MateName},
                                                  {string_2, 1, TeamName},
                                                  {string_2, 1, GroupName}]),
                               util:flist(Content1 ++ AddMsg);
                           _ -> Content1
                       end;
                   false -> Content1
               end,
    Content3 = case Flag1 of
                   true ->
                       AddMsg2 = notice:format(lang:get("~ts"),
                                               [{string_2,
                                                 5,
                                                 lang:get("\n您当前战队成员不足5人，报名截止后将无法入围，请尽快补充队员")}]),
                       Content2 ++ AddMsg2;
                   false -> Content2
               end,
    mail:send(Id, Title, Content3),
    send_mail(leave_team, Rest, Args);
send_mail(dismiss_team,
          [#gods_duel_team_mate{id = Id, position = Position}
           | Rest],
          Args = #{team_name := TeamName,
                   leader_name := LeaderName})
    when Position =/= 1 ->
    Title = lang:get("战队解散"),
    Content =
        notice:format(lang:get("天下无不散之筵席，很遗憾，队长~ts解散了战队~ts，希望以后有机会能够再次并肩作战"),
                      [{role_2, LeaderName}, {string_2, 1, TeamName}]),
    mail:send(Id, Title, Content),
    send_mail(dismiss_team, Rest, Args);
send_mail(kick_mate,
          [#gods_duel_team_mate{id = Id, position = Position}
           | Rest],
          Args = #{mate_name := MateName,
                   member_num := MemberNum})
    when Position =:= 1 andalso MemberNum =< 5 ->
    Title = lang:get("队员变更"),
    Content =
        notice:format(lang:get("天下无不散之筵席，您将~ts请离了战队，希望以后有机会能够再次并肩作战。~ts"),
                      [{role_2, MateName},
                       {string_2,
                        5,
                        lang:get("\n您当前战队成员不足5人，报名截止后将无法入围，请尽快补充队员")}]),
    mail:send(Id, Title, Content),
    send_mail(kick_mate, Rest, Args);
send_mail(kick_mate,
          [#gods_duel_team_mate{id = Id, position = Position}
           | Rest],
          Args = #{mate_name := MateName,
                   leader_name := LeaderName})
    when Position =/= 1 ->
    Title = lang:get("队员变更"),
    Content =
        notice:format(lang:get("天下无不散之筵席，很遗憾，队长~ts将~ts请离了战队，希望以后有机会能够再次并肩作战"),
                      [{role_2, LeaderName}, {role_2, MateName}]),
    mail:send(Id, Title, Content),
    send_mail(kick_mate, Rest, Args);
send_mail(team_sign,
          [#gods_duel_team_mate{id = Id} | Rest],
          Args = #{team_name := TeamName,
                   season_name := SeasonName, group_name := GroupName}) ->
    Title = lang:get("战队报名"),
    Content =
        notice:format(lang:get("恭喜，你所属的战队~ts成功报名~ts赛季，根据您所属战队成员最高等级被分配至~ts组。\n"
                               "报名截止后，将按照队伍中综合战力~ts成员的~ts判定参赛资格。详情可前往活动界面神战法则"
                               "查看，\n~ts"),
                      [{string_2, 1, TeamName},
                       {string_2, 1, SeasonName},
                       {string_2, 5, GroupName},
                       {string_2, 1, lang:get("前五名")},
                       {string_2, 1, lang:get("综合战力之和")},
                       {string_2,
                        5,
                        lang:get("注意：报名期间，若有成员等级超过分组等级上限，战队将按照成员最高等级重新分组。")}]),
    mail:send(Id, Title, Content),
    send_mail(team_sign, Rest, Args);
send_mail(qualification_256,
          [#gods_duel_team_mate{id = Id} | Rest],
          Args = #{team_name := TeamName, team_lev := TeamLev,
                   zone_name := ZoneName, index := Index}) ->
    Title = lang:get("晋级小组赛"),
    GroupName = get_group_name(TeamLev),
    Content =
        notice:format(lang:get("恭喜，您所在的战队~ts成功获得诸神之战小组赛资格，被分配至~ts的~ts战区第~ts小组"
                               "，可前往诸神之战界面中查看赛程安排，祝君旗开得胜，出师大捷！\n~ts"),
                      [{string_2, 1, TeamName},
                       {string_2, 1, GroupName},
                       {string_2, 1, ZoneName},
                       {string_2, 1, Index},
                       {string_2,
                        5,
                        lang:get("注意：若比赛期间个人等级超出组别上限，将失去参赛资格，若战队人数不足4人将不能继续参赛，敬请留意")}]),
    mail:send(Id, Title, Content),
    send_mail(qualification_256, Rest, Args);
send_mail(loss_group,
          [#gods_duel_team_mate{id = Id} | Rest], TeamName) ->
    Title = lang:get("晋级失败"),
    Content =
        notice:format(lang:get("很遗憾，您所在的战队~ts未获得诸神之战小组赛资格，别气馁哦，以后还有机会，请继续加油，期"
                               "待下次比赛。"),
                      [{string_2, 1, TeamName}]),
    mail:send(Id, Title, Content),
    send_mail(loss_group, Rest, TeamName);
send_mail(team_lev_up,
          [#gods_duel_team_mate{id = Id} | Rest],
          Args = #{mate_name := MateName, mate_lev := MateLev,
                   season_name := SeasonName, team_name := TeamName,
                   gourp_name := GroupName}) ->
    Title = lang:get("战队分组晋升"),
    Content =
        notice:format(lang:get("由于~ts等级达到~ts级，您所属的~ts赛季战队~ts被分配至~ts。"),
                      [{role_2, MateName},
                       {string_2, 1, MateLev},
                       {string_2, 1, SeasonName},
                       {string_2, 1, TeamName},
                       {string_2, 5, GroupName}]),
    mail:send(Id, Title, Content),
    send_mail(team_lev_up, Rest, Args);
send_mail(qualification,
          [#gods_duel_team_mate{id = Id, name = RoleName,
                                lev = Lev}
           | Rest],
          Args = #{team_name := TeamName, group_name := GroupName,
                   qualification := Qua}) ->
    case get_qua_name(Qua) of
        false -> ok;
        QuaName ->
            Title = lang:get("诸神晋级"),
            Content =
                notice:format(lang:get("亲爱的~ts:\n恭喜您与您所在的战队~ts在诸神之战~ts中成为~ts，泛位面诸神之战组"
                                       "委会特奖励您丰厚大礼一份，请继续加油！"),
                              [{role_2, RoleName},
                               {string_2, 1, TeamName},
                               {string_2, 1, GroupName},
                               {string_2, 1, QuaName}]),
            ItemReward = case gods_duel_data:get_combat_reward(Qua)
                             of
                             {ExpMod, DropId} ->
                                 calc_rewards(ExpMod,
                                              DropId,
                                              null,
                                              Lev,
                                              RoleName,
                                              true);
                             _ -> []
                         end,
            mail:send(Id,
                      #{title => Title, content => Content,
                        items => ItemReward}),
            send_mail(qualification, Rest, Args)
    end;
send_mail(combat,
          [#gods_duel_team_mate{id = Id, name = Name,
                                classes = Classes, sex = Sex, lev = Lev,
                                break_times = BKTimes, position = Position}
           | Rest],
          Args = #{qualification := Qua, team_name := TeamName,
                   win_or_loss := WinOrLoss, add_score := AddScore}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Title = lang:get("诸神之战奖励"),
    SeasonStatus = gods_duel_common:get_season_status(),
    Content = case
                  gods_duel_common:get_match_index(SeasonStatus - 1)
                  of
                  {1, MatchIndex} ->
                      GroupMatchContent = case WinOrLoss of
                                              win ->
                                                  LossTeamName = case Args of
                                                                     #{loss_team_name
                                                                           :=
                                                                           _Name} ->
                                                                         _Name;
                                                                     _ ->
                                                                         lang:get("")
                                                                 end,
                                                  notice:format(lang:get("恭喜您的战队~ts在诸神之战小组赛第~ts轮战胜对手~ts，获得以下奖励\n小组赛第~ts"
                                                                         "轮已经结束，请自行离场哦。"),
                                                                [{string_2,
                                                                  1,
                                                                  TeamName},
                                                                 {string_2,
                                                                  1,
                                                                  MatchIndex},
                                                                 {string_2,
                                                                  1,
                                                                  LossTeamName},
                                                                 {string_2,
                                                                  1,
                                                                  MatchIndex}]);
                                              loss ->
                                                  notice:format(lang:get("由于您在小组赛第~ts轮中表现优异，虽败犹荣，获得以下奖励。"),
                                                                [{string_2,
                                                                  1,
                                                                  MatchIndex}]);
                                              idle ->
                                                  notice:format(lang:get("恭喜您在小组赛第~ts轮比赛中轮空，自动获得胜利，获得以下奖励"),
                                                                [{string_2,
                                                                  1,
                                                                  MatchIndex}]);
                                              auto_win ->
                                                  notice:format(lang:get("由于您在小组赛第~ts轮比赛中对手弃权，自动获得胜利，获得以下奖励"),
                                                                [{string_2,
                                                                  1,
                                                                  MatchIndex}]);
                                              auto_loss ->
                                                  notice:format(lang:get("~ts赛季小组赛第~ts轮比赛中，由于比赛开始后，您战队的出战队伍中归队成员少于~ts人，"
                                                                         "视为弃权，仅获得以下奖励"),
                                                                [{string_2,
                                                                  1,
                                                                  SeasonName},
                                                                 {string_2,
                                                                  1,
                                                                  MatchIndex},
                                                                 {string_2,
                                                                  1,
                                                                  4}]);
                                              _ ->
                                                  notice:format(lang:get("由于您在小组赛第~ts轮中表现优异，虽败犹荣，获得以下奖励。。"),
                                                                [{string_2,
                                                                  1,
                                                                  MatchIndex}])
                                          end,
                      case MatchIndex < 3 of
                          true ->
                              case Args of
                                  #{next_match_time := {StartTime, EndTime}} ->
                                      {{_, M, D}, {SH, SM, _}} =
                                          date:seconds_to_datetime(StartTime),
                                      {_, {EH, EM, _}} =
                                          date:seconds_to_datetime(EndTime),
                                      AddContent =
                                          notice:format("\n下一场比赛将于~ts进行，加油！{face_1, 16}",
                                                        [{string_2,
                                                          5,
                                                          util:flist("~w月~w日~2.10.0w:~2.10.0w-~2.10.0w:~2.10.0w",
                                                                     [M,
                                                                      D,
                                                                      SH,
                                                                      SM,
                                                                      EH,
                                                                      EM])}]),
                                      GroupMatchContent ++ AddContent;
                                  _ -> GroupMatchContent
                              end;
                          _ -> GroupMatchContent
                      end;
                  {2, MatchIndex} ->
                      FinalMatchName =
                          gods_duel_common:get_final_match_name(MatchIndex),
                      GroupMatchContent = case WinOrLoss of
                                              win ->
                                                  LossTeamName = case Args of
                                                                     #{loss_team_name
                                                                           :=
                                                                           _Name} ->
                                                                         _Name;
                                                                     _ ->
                                                                         lang:get("")
                                                                 end,
                                                  QuaName = get_qua_name(Qua),
                                                  notice:format(lang:get("恭喜您的战队~ts在诸神之战淘汰赛~ts战胜对手~ts，成功晋级~ts，\n淘汰赛~ts已"
                                                                         "经结束，请自行离场哦。"),
                                                                [{string_2,
                                                                  1,
                                                                  TeamName},
                                                                 {string_2,
                                                                  1,
                                                                  FinalMatchName},
                                                                 {string_2,
                                                                  1,
                                                                  LossTeamName},
                                                                 {string_2,
                                                                  1,
                                                                  QuaName},
                                                                 {string_2,
                                                                  1,
                                                                  FinalMatchName}]);
                                              loss ->
                                                  WinTeamName = case Args of
                                                                    #{wins_team_name
                                                                          :=
                                                                          _Name} ->
                                                                        _Name;
                                                                    _ ->
                                                                        lang:get("")
                                                                end,
                                                  case MatchIndex of
                                                      5 ->
                                                          notice:format(lang:get("很遗憾，由于您在淘汰赛~ts中败于对手~ts，您将无法参与之后的决赛。"),
                                                                        [{string_2,
                                                                          1,
                                                                          FinalMatchName},
                                                                         {string_2,
                                                                          1,
                                                                          WinTeamName}]);
                                                      _ ->
                                                          notice:format(lang:get("很遗憾，由于您在淘汰赛~ts中败于对手~ts，您将无法继续参与之后的赛程，祝愿您的战队下赛"
                                                                                 "季获得更好的成绩。"),
                                                                        [{string_2,
                                                                          1,
                                                                          FinalMatchName},
                                                                         {string_2,
                                                                          1,
                                                                          WinTeamName}])
                                                  end;
                                              idle ->
                                                  notice:format(lang:get("恭喜您在淘汰赛~ts比赛中轮空，自动获得胜利，获得以下奖励"),
                                                                [{string_2,
                                                                  1,
                                                                  FinalMatchName}]);
                                              auto_win ->
                                                  notice:format(lang:get("由于您在淘汰赛~ts比赛中对手弃权，自动获得胜利，获得以下奖励"),
                                                                [{string_2,
                                                                  1,
                                                                  FinalMatchName}]);
                                              auto_loss ->
                                                  notice:format(lang:get("~ts赛季淘汰赛~ts比赛中，由于比赛开始后，您战队的出战队伍中归队成员少于~ts人，视为"
                                                                         "弃权，仅获得以下奖励"),
                                                                [{string_2,
                                                                  1,
                                                                  SeasonName},
                                                                 {string_2,
                                                                  1,
                                                                  FinalMatchName},
                                                                 {string_2,
                                                                  1,
                                                                  4}]);
                                              _ ->
                                                  notice:format(lang:get("由于您在淘汰赛~ts失败，虽败犹荣，获得以下奖励。"),
                                                                [{string_2,
                                                                  1,
                                                                  FinalMatchName}])
                                          end,
                      AddContent = case MatchIndex < 6 of
                                       true ->
                                           NextMatchName = case MatchIndex =:= 5
                                                               of
                                                               true
                                                                   when Qua =:=
                                                                            11 ->
                                                                   gods_duel_common:get_final_match_name(7);
                                                               _ ->
                                                                   gods_duel_common:get_final_match_name(MatchIndex
                                                                                                             +
                                                                                                             1)
                                                           end,
                                           case Args of
                                               #{next_match_time :=
                                                     {StartTime, EndTime}} ->
                                                   {{_, M, D}, {SH, SM, _}} =
                                                       date:seconds_to_datetime(StartTime),
                                                   {_, {EH, EM, _}} =
                                                       date:seconds_to_datetime(EndTime),
                                                   notice:format("\n~ts~ts~ts~ts~ts{face_1, 16}",
                                                                 [{string_2,
                                                                   5,
                                                                   lang:get("下一场比赛")},
                                                                  {string_2,
                                                                   1,
                                                                   NextMatchName},
                                                                  {string_2,
                                                                   5,
                                                                   lang:get("将于")},
                                                                  {string_2,
                                                                   1,
                                                                   util:flist("~w月~w日~2.10.0w:~2.10.0w-~2.10.0w:~2.10.0w",
                                                                              [M,
                                                                               D,
                                                                               SH,
                                                                               SM,
                                                                               EH,
                                                                               EM])},
                                                                  {string_2,
                                                                   5,
                                                                   lang:get("进行，请按时入场，祝君力克强敌")}]);
                                               _ -> lang:get("")
                                           end;
                                       _ -> lang:get("")
                                   end,
                      case WinOrLoss of
                          win -> GroupMatchContent ++ AddContent;
                          idle -> GroupMatchContent ++ AddContent;
                          auto_win -> GroupMatchContent ++ AddContent;
                          loss when Qua =:= 8 ->
                              GroupMatchContent ++ AddContent;
                          loss -> GroupMatchContent;
                          auto_loss when Qua =:= 8 ->
                              GroupMatchContent ++ AddContent;
                          auto_loss -> GroupMatchContent;
                          _ -> GroupMatchContent
                      end;
                  _ -> lang:get("恭喜战斗胜利，获得如下奖励")
              end,
    Rewards1 = case
                   gods_duel_common:get_match_index(SeasonStatus - 1)
                   of
                   {1, _} ->
                       case gods_duel_data:get_combat_reward(2) of
                           {ExpMod, DropId} ->
                               calc_rewards(ExpMod,
                                            DropId,
                                            WinOrLoss,
                                            Lev,
                                            Name,
                                            true);
                           _ -> []
                       end;
                   {2, MatchRound} ->
                       {RewardQua, IsLossHasReward} = case MatchRound of
                                                          1 -> {4, false};
                                                          2 -> {5, false};
                                                          3 -> {6, false};
                                                          4 -> {7, false};
                                                          5 -> {8, false};
                                                          6 -> {10, false};
                                                          7 -> {Qua, true};
                                                          _ -> {Qua, true}
                                                      end,
                       case gods_duel_data:get_combat_reward(RewardQua) of
                           {ExpMod, DropId} ->
                               calc_rewards(ExpMod,
                                            DropId,
                                            WinOrLoss,
                                            Lev,
                                            Name,
                                            IsLossHasReward);
                           _ -> []
                       end;
                   _ ->
                       case gods_duel_data:get_combat_reward(Qua) of
                           {ExpMod, DropId} ->
                               calc_rewards(ExpMod,
                                            DropId,
                                            WinOrLoss,
                                            Lev,
                                            Name,
                                            true);
                           _ -> []
                       end
               end,
    IsWin = case WinOrLoss of
                auto_win -> 1;
                auto_loss -> 0;
                idle -> 1;
                win -> 1;
                loss -> 0;
                _ -> 0
            end,
    Rewards2 = case
                   gods_duel_common:get_match_index(SeasonStatus - 1)
                   of
                   {1, _} ->
                       case gods_duel_data:get_score_reward({8, IsWin}) of
                           {_, _, 0} -> [];
                           {AssetsType, _, Number} -> [{AssetsType, 0, Number}];
                           _ ->
                               logger:debug("===", [], gods_duel_team, 1358),
                               []
                       end;
                   {2, _MatchRound} ->
                       case gods_duel_data:get_score_reward({_MatchRound,
                                                             IsWin})
                           of
                           {_, _, 0} -> [];
                           {AssetsType, _, Number} -> [{AssetsType, 0, Number}];
                           _ ->
                               logger:debug("===", [], gods_duel_team, 1368),
                               []
                       end;
                   _Err ->
                       logger:debug("诸神积分奖励出错~ts",
                                    [_Err],
                                    gods_duel_team,
                                    1372),
                       []
               end,
    ExtRewards = case Qua of
                     6
                         when WinOrLoss =:= win orelse
                                  WinOrLoss =:= auto_win orelse
                                      WinOrLoss =:= idle ->
                         case Position of
                             1 -> [{21720, 0, 20}];
                             _ -> [{21720, 0, 10}]
                         end;
                     _ -> []
                 end,
    ItemRewards = Rewards1 ++ ExtRewards ++ Rewards2,
    logger:debug("~w", [ItemRewards], gods_duel_team, 1388),
    mail:send(Id,
              #{title => Title, content => Content,
                items => ItemRewards}),
    update_point(#{id => Id, name => Name,
                   classes => Classes, sex => Sex, lev => Lev,
                   break_times => BKTimes, add_score => AddScore}),
    send_mail(combat, Rest, Args);
send_mail(teammate_levup,
          [#gods_duel_team_mate{id = Id} | Rest],
          Args = #{team_name := _TeamName,
                   group_name := GroupName, role_name := RoleName}) ->
    Title = lang:get("诸神之战等级提醒"),
    Content =
        notice:format(lang:get("您的~ts队友~ts，由于在参赛期间，等级超出~ts组上限。为了确保比赛公平公正，Ta将不"
                               "能继续参战，敬请谅解。"),
                      [{string_2, 1, lang:get("诸神之战")},
                       {role_2, RoleName},
                       {string_2, 1, GroupName}]),
    mail:send(Id, Title, Content),
    send_mail(teammate_levup, Rest, Args);
send_mail(Type, [_ | Rest], Args) ->
    logger:error("发送邮件匹配失败: 类型:~w, 参数:~w",
                 [Type, Args],
                 gods_duel_team,
                 1403),
    send_mail(Type, Rest, Args).

check_has_team(RoleId) ->
    case catch ets:lookup(gods_duel_team_role_ids, RoleId)
        of
        [_] -> true;
        _ -> false
    end.

mate_join_team(TeamInfo = #gods_duel_team{applys =
                                              Applys,
                                          members = Members},
               MateInfo) ->
    Position = 2,
    NewTeamMate = MateInfo#gods_duel_team_mate{position =
                                                   Position},
    NewMembers = lists:keystore(Applys,
                                #gods_duel_team_mate.id,
                                Members,
                                NewTeamMate),
    TeamInfo1 = TeamInfo#gods_duel_team{member_num =
                                            length(NewMembers),
                                        members = NewMembers},
    NewTeamInfo = update_team_info(TeamInfo1),
    save_team_data(NewTeamInfo),
    ok.

mate_leave_team(TeamInfo = #gods_duel_team{members =
                                               Members},
                MateId) ->
    NewMembers = lists:keydelete(MateId,
                                 #gods_duel_team_mate.id,
                                 Members),
    TeamInfo1 = TeamInfo#gods_duel_team{member_num =
                                            length(NewMembers),
                                        members = NewMembers},
    NewTeamInfo = update_team_info(TeamInfo1),
    save_team_data(NewTeamInfo),
    ok.

is_team_status() ->
    case env:get(gods_season_status) of
        1 -> true;
        2 -> true;
        _ -> false
    end.

get_group_name(GroupId) ->
    case gods_duel_data:get_group_name(GroupId) of
        {GroupId, Name, _SimpleName} -> Name;
        _ -> lang:get("新星组1(80-89级)")
    end.

get_team_id(RoleId) ->
    case catch ets:lookup(gods_duel_team_role_ids, RoleId)
        of
        [{_, TeamId}] -> {true, TeamId};
        _ -> false
    end.

get_target_rank(SeasonStatus, SelfRank) ->
    case gods_duel_common:get_match_index(SeasonStatus) of
        {1, MatchRound} ->
            SelfIndex = (SelfRank - 1) div 32 + 1,
            GroupNum = (SelfRank - 1) rem 32 + 1,
            case lists:keyfind(MatchRound,
                               1,
                               [{1, [{1, 2}, {2, 1}, {3, 4}, {4, 3}]},
                                {2, [{1, 3}, {3, 1}, {2, 4}, {4, 2}]},
                                {3, [{1, 4}, {4, 1}, {2, 3}, {3, 2}]}])
                of
                {_, MatchTable} ->
                    case lists:keyfind(SelfIndex, 1, MatchTable) of
                        {_, TargetIndex} -> (TargetIndex - 1) * 32 + GroupNum;
                        _ -> false
                    end;
                _ -> false
            end;
        {2, _MatchRound} -> false;
        _ ->
            logger:error("获取赛季对战轮次出错", [], gods_duel_team, 1474),
            0
    end.

get_target_team_id(GodsTeamId) ->
    SeasonStatus = gods_duel_common:get_season_status(),
    case lookup(GodsTeamId) of
        {ok,
         #gods_duel_team{team_group_256 = SelfRank,
                         lev = ZoneId}} ->
            TargetRank = get_target_rank(SeasonStatus, SelfRank),
            case catch ets:lookup(gods_duel_group_team, ZoneId) of
                [{_, GroupTeamList}] ->
                    case lists:keyfind(TargetRank,
                                       #gods_duel_team.team_group_256,
                                       GroupTeamList)
                        of
                        #gods_duel_team{id = TargetTeamId} ->
                            {true, TargetTeamId};
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

update_team_ready_status(TeamId, UpType, Status) ->
    case lookup(TeamId) of
        {ok, #gods_duel_team{name = TeamName}} ->
            async_member(TeamId,
                         [1, 2, 3],
                         {gods_duel_team,
                          apply_sync_team_ready_status,
                          [{UpType, TeamId, TeamName, Status}]});
        _ -> ok
    end.

apply_sync_team_ready_status(Role = #role{s_event = 41},
                             {UpType, TeamId, TeamName, Status}) ->
    logger:debug("完成准备:~w",
                 [{UpType, TeamId, TeamName, Status}],
                 gods_duel_team,
                 1507),
    role:link_send(Role,
                   17922,
                   {UpType, TeamId, TeamName, Status}),
    ok;
apply_sync_team_ready_status(_, _) -> ok.

update_match_combat(by_id, TeamId, WinOrLoss,
                    Args = #{match_zone := MatchZoneId}) ->
    CombatResult = case WinOrLoss of
                       auto_win -> win;
                       auto_loss -> loss;
                       idle -> win;
                       win -> win;
                       loss -> loss;
                       _ -> loss
                   end,
    AddScore = caculate_score(CombatResult),
    update_group_team_info(CombatResult,
                           TeamId,
                           MatchZoneId),
    case lookup(TeamId) of
        {ok, TeamInfo = #gods_duel_team{}} ->
            NewTeamInfo = #gods_duel_team{qualification = Qua,
                                          members = Members, name = TeamName} =
                              update_match_combat(by_team,
                                                  TeamInfo,
                                                  CombatResult),
            save_team_data(NewTeamInfo),
            async_member(TeamId,
                         [1, 2, 3],
                         {gods_duel_role, push_gods_duel_team, []}),
            send_mail(combat,
                      Members,
                      Args#{qualification => Qua, win_or_loss => WinOrLoss,
                            team_name => TeamName, add_score => AddScore});
        _ -> ok
    end.

caculate_score(WinOrLoss) ->
    Result = case WinOrLoss of
                 win -> 1;
                 loss -> 0
             end,
    SeasonStatus = gods_duel_common:get_season_status(),
    AddScore = case
                   gods_duel_common:get_match_index(SeasonStatus - 1)
                   of
                   {1, _} ->
                       case gods_duel_data:get_score_reward({8, Result}) of
                           {_, _, Number} -> Number;
                           _ -> 0
                       end;
                   {2, MatchRound} ->
                       case gods_duel_data:get_score_reward({MatchRound,
                                                             Result})
                           of
                           {_, _, Number} -> Number;
                           _ -> 0
                       end;
                   _Err ->
                       logger:debug("诸神积分奖励出错~ts",
                                    [_Err],
                                    gods_duel_team,
                                    1561),
                       0
               end,
    logger:debug("====================~w",
                 [AddScore],
                 gods_duel_team,
                 1564),
    AddScore.

update_match_combat(by_team,
                    TeamInfo = #gods_duel_team{qualification = Qua,
                                               win_times = WinTimes,
                                               loss_times = LossTimes},
                    WinOrLoss)
    when Qua =:= 1 orelse Qua =:= 2 ->
    TeamInfo1 = TeamInfo#gods_duel_team{qualification = 2},
    case WinOrLoss of
        win ->
            TeamInfo1#gods_duel_team{win_times = WinTimes + 1};
        loss ->
            TeamInfo1#gods_duel_team{loss_times = LossTimes + 1};
        _ -> TeamInfo1
    end;
update_match_combat(by_team,
                    TeamInfo = #gods_duel_team{qualification = Qua},
                    WinOrLoss)
    when Qua =:= 3 orelse
             Qua =:= 4 orelse Qua =:= 5 orelse Qua =:= 6 ->
    case WinOrLoss of
        win -> TeamInfo#gods_duel_team{qualification = Qua + 1};
        loss -> TeamInfo
    end;
update_match_combat(by_team,
                    TeamInfo = #gods_duel_team{qualification = 7},
                    WinOrLoss) ->
    case WinOrLoss of
        win -> TeamInfo#gods_duel_team{qualification = 11};
        loss -> TeamInfo#gods_duel_team{qualification = 8}
    end;
update_match_combat(by_team,
                    TeamInfo = #gods_duel_team{qualification = 8},
                    WinOrLoss) ->
    case WinOrLoss of
        win -> TeamInfo#gods_duel_team{qualification = 10};
        loss -> TeamInfo#gods_duel_team{qualification = 9}
    end;
update_match_combat(by_team,
                    TeamInfo = #gods_duel_team{qualification = 11},
                    WinOrLoss) ->
    case WinOrLoss of
        win -> TeamInfo#gods_duel_team{qualification = 13};
        loss -> TeamInfo#gods_duel_team{qualification = 12}
    end;
update_match_combat(by_team, TeamInfo, _) -> TeamInfo.

reward_qua64_team([]) -> ok;
reward_qua64_team([{_ZoneId, Qua64Teams} | Rest]) ->
    reward_update_qua64_team(Qua64Teams),
    reward_qua64_team(Rest);
reward_qua64_team([_ | Rest]) ->
    reward_qua64_team(Rest).

reward_update_qua64_team([]) -> ok;
reward_update_qua64_team([#gods_duel_team{id = Id,
                                          qualification = Qua,
                                          team_group_64 = Rank64}
                          | Rest]) ->
    case lookup(Id) of
        {ok,
         Team = #gods_duel_team{lev = TeamLev, members = Members,
                                name = TeamName}} ->
            NewTeam = Team#gods_duel_team{qualification = Qua,
                                          team_group_64 = Rank64},
            GroupName = get_group_name(TeamLev),
            send_mail(qualification,
                      Members,
                      #{team_name => TeamName, group_name => GroupName,
                        qualification => Qua}),
            save_team_data(NewTeam),
            async_member(Id,
                         [1, 2, 3],
                         {gods_duel_role, push_gods_duel_team, []}),
            reward_update_qua64_team(Rest);
        _ -> reward_update_qua64_team(Rest)
    end;
reward_update_qua64_team([_ | Rest]) ->
    reward_update_qua64_team(Rest).

get_qua_name(Qua) ->
    case Qua of
        3 -> lang:get("64强");
        4 -> lang:get("32强");
        5 -> lang:get("16强");
        6 -> lang:get("8强");
        7 -> lang:get("4强");
        10 -> lang:get("季军");
        12 -> lang:get("亚军");
        13 -> lang:get("冠军");
        _ -> lang:get("")
    end.

calc_rewards(ExpMod, DropId, WinOrLoss, RoleLev,
             RoleName, IsLossHasReward) ->
    ExpReward = case ExpMod =:= 0 of
                    true -> [];
                    false ->
                        case levup_data:get_exp({ExpMod, RoleLev}) of
                            #{exp := Exp} ->
                                ExpAdd = case WinOrLoss of
                                             _
                                                 when WinOrLoss =:= win orelse
                                                          WinOrLoss =:= idle
                                                              orelse
                                                              WinOrLoss =:=
                                                                  auto_win ->
                                                 Exp;
                                             _ when WinOrLoss =:= auto_loss ->
                                                 round(Exp * 4.0e-1);
                                             _ -> round(Exp * 8.0e-1)
                                         end,
                                [{90010, ExpAdd}];
                            _ -> []
                        end
                end,
    TournamentSc = case WinOrLoss of
                       _
                           when WinOrLoss =:= win orelse
                                    WinOrLoss =:= idle orelse
                                        WinOrLoss =:= auto_win ->
                           [{90020, 8}];
                       _ when WinOrLoss =:= loss -> [{90020, 4}];
                       _ when WinOrLoss =:= auto_loss -> [{90020, 2}];
                       _ -> []
                   end,
    IsItemDrop = case WinOrLoss of
                     win -> true;
                     auto_win -> true;
                     idle -> true;
                     loss -> IsLossHasReward;
                     auto_loss -> IsLossHasReward;
                     null -> true;
                     _ -> false
                 end,
    ItemReward = case DropId =:= 0 of
                     true -> [];
                     false ->
                         case IsItemDrop of
                             true ->
                                 case drop:produce(DropId) of
                                     {true, _RuleType, SuperGain, NormalGain} ->
                                         Gain = SuperGain ++ NormalGain,
                                         Fun = fun (#gain{val = Val,
                                                          notice = 1},
                                                    Rtn) ->
                                                       format:merge_val(Val,
                                                                        Rtn);
                                                   (_, Rtn) -> Rtn
                                               end,
                                         logger:debug("掉落:~w, 传闻内容:~w",
                                                      [SuperGain,
                                                       lists:foldl(Fun,
                                                                   [],
                                                                   SuperGain)],
                                                      gods_duel_team,
                                                      1703),
                                         case lists:foldl(Fun, [], SuperGain) of
                                             HearsayItems = [_ | _] ->
                                                 HearsayMsg =
                                                     notice:format(lang:get("~ts在~ts中惊喜的获得了~ts{face_1,38}"),
                                                                   [{role_2,
                                                                     RoleName},
                                                                    {string_2,
                                                                     1,
                                                                     lang:get("[诸神之战]")},
                                                                    {item_2,
                                                                     HearsayItems}]),
                                                 notice:cast(all,
                                                             5,
                                                             HearsayMsg);
                                             _ -> ok
                                         end,
                                         DropData = format:gain_to_val(Gain),
                                         [{AssetsType, 0, Val}
                                          || {AssetsType, Val} <- DropData];
                                     null -> [];
                                     {false, Reason} ->
                                         logger:error("诸神生成奖励~w失败:~w",
                                                      [DropId, Reason],
                                                      gods_duel_team,
                                                      1714),
                                         []
                                 end;
                             false -> []
                         end
                 end,
    ExpReward ++ TournamentSc ++ ItemReward.

update_group_team_info(WinOrLoss, TeamId, ZoneId) ->
    case catch ets:lookup(gods_duel_group_team, ZoneId) of
        [{_, GroupTeamList}] ->
            case lists:keyfind(TeamId,
                               #gods_duel_team.id,
                               GroupTeamList)
                of
                TeamInfo = #gods_duel_team{} ->
                    NewTeamInfo = update_group_match_combat(TeamInfo,
                                                            WinOrLoss),
                    NewGroupTeamList = lists:keystore(TeamId,
                                                      #gods_duel_team.id,
                                                      GroupTeamList,
                                                      NewTeamInfo),
                    gods_duel_mgr:save_team_group([{ZoneId,
                                                    NewGroupTeamList}]);
                _ -> ok
            end;
        _ -> ok
    end.

update_group_match_combat(TeamInfo =
                              #gods_duel_team{qualification = Qua,
                                              win_times = WinTimes,
                                              loss_times = LossTimes},
                          WinOrLoss)
    when Qua =:= 1 orelse Qua =:= 2 ->
    TeamInfo1 = TeamInfo#gods_duel_team{qualification = 2},
    case WinOrLoss of
        win ->
            TeamInfo1#gods_duel_team{win_times = WinTimes + 1};
        loss ->
            TeamInfo1#gods_duel_team{loss_times = LossTimes + 1};
        _ -> TeamInfo1
    end;
update_group_match_combat(TeamInfo =
                              #gods_duel_team{qualification = Qua},
                          WinOrLoss)
    when Qua =:= 3 orelse
             Qua =:= 4 orelse Qua =:= 5 orelse Qua =:= 6 ->
    case WinOrLoss of
        win -> TeamInfo#gods_duel_team{qualification = Qua + 1};
        loss -> TeamInfo
    end;
update_group_match_combat(TeamInfo =
                              #gods_duel_team{qualification = 7},
                          WinOrLoss) ->
    case WinOrLoss of
        win -> TeamInfo#gods_duel_team{qualification = 11};
        loss -> TeamInfo#gods_duel_team{qualification = 8}
    end;
update_group_match_combat(TeamInfo =
                              #gods_duel_team{qualification = 8},
                          WinOrLoss) ->
    case WinOrLoss of
        win -> TeamInfo#gods_duel_team{qualification = 10};
        loss -> TeamInfo#gods_duel_team{qualification = 9}
    end;
update_group_match_combat(TeamInfo =
                              #gods_duel_team{qualification = 11},
                          WinOrLoss) ->
    case WinOrLoss of
        win -> TeamInfo#gods_duel_team{qualification = 13};
        loss -> TeamInfo#gods_duel_team{qualification = 12}
    end;
update_group_match_combat(TeamInfo, _) -> TeamInfo.

is_member_changed(#gods_duel_team_mate{lev = Lev,
                                       classes = Classes, name = Name,
                                       sex = Sex},
                  {Lev, Classes, Name, Sex}) ->
    false;
is_member_changed(_, _) -> true.

repair_group_id() ->
    GroupList = ets:tab2list(gods_duel_team_data),
    lists:foreach(fun (TeamInfo = #gods_duel_team{lev =
                                                      Lev}) ->
                          NewTeamInfo = case Lev =:= 6 of
                                            true ->
                                                TeamInfo#gods_duel_team{lev =
                                                                            5};
                                            _ -> TeamInfo
                                        end,
                          save_team_data(NewTeamInfo)
                  end,
                  GroupList).

update_point(#{id := Id, name := Name,
               classes := Classes, sex := Sex, lev := Lev,
               break_times := BKTimes, add_score := AddScore}) ->
    {P, RankLev, GodsScore} = case
                                  ets:lookup(gods_duel_profile, Id)
                                  of
                                  [_P = #gods_duel_profile{rank_lev = _RankLev,
                                                           gods_duel_score =
                                                               _GodsScore}] ->
                                      logger:debug("参赛者old ~w",
                                                   [Id],
                                                   gods_duel_team,
                                                   1808),
                                      {_P, _RankLev, _GodsScore};
                                  _ ->
                                      logger:debug("参赛者new ~w, ~ts",
                                                   [Id, Name],
                                                   gods_duel_team,
                                                   1811),
                                      {#gods_duel_profile{id = Id, name = Name,
                                                          classes = Classes,
                                                          sex = Sex,
                                                          lev =
                                                              Lev +
                                                                  BKTimes * 6},
                                       1,
                                       0}
                              end,
    NewScore = GodsScore + AddScore,
    NP = case gods_duel_data:get_gods_lev(RankLev + 1) of
             #{need_score := NeedScore} when NewScore >= NeedScore ->
                 P#gods_duel_profile{lev = Lev + BKTimes * 6,
                                     name = Name, classes = Classes,
                                     rank_lev = RankLev + 1,
                                     gods_duel_score = NewScore};
             _ ->
                 P#gods_duel_profile{lev = Lev + BKTimes * 6,
                                     name = Name, classes = Classes,
                                     gods_duel_score = NewScore}
         end,
    logger:info("[~ts] 增加诸神分 ~w 原诸神分 ~w, 原段位 ~w，新诸神分 ~w",
                [Name, AddScore, GodsScore, RankLev, NewScore],
                gods_duel_team,
                1821),
    gods_duel_agent:info({update_profile, NP}).

gm_reset_point(#{id := Id, name := Name,
                 classes := Classes, sex := Sex, lev := Lev,
                 break_times := BKTimes}) ->
    NP = case ets:lookup(gods_duel_profile, Id) of
             [P] ->
                 P#gods_duel_profile{rank_lev = 1, gods_duel_score = 0};
             _ ->
                 #gods_duel_profile{id = Id, name = Name,
                                    classes = Classes, sex = Sex,
                                    lev = Lev + BKTimes * 6}
         end,
    gods_duel_agent:info({update_profile, NP}).

