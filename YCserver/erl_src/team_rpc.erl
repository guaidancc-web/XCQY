-file("src/mod/team/team_rpc.erl", 1).

-module(team_rpc).

-export([handle/3]).

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

-file("src/mod/team/team_rpc.erl", 13).

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

-file("src/mod/team/team_rpc.erl", 14).

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

-file("src/mod/team/team_rpc.erl", 15).

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

-file("src/mod/team/team_rpc.erl", 16).

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

-file("src/mod/team/team_rpc.erl", 17).

-file("inc/provocation.hrl", 1).

-record(m_provocation,
        {ver = 3,
         room_id = 0,
         book_id = 0,
         identity = 0,
         triggers = [],
         map_id = 0,
         room_check = 1,
         book_check = 0,
         video_check = 0,
         invited_list = [],
         published_list = [],
         pick_batch_list = [],
         pick_box_num = 0,
         pick_packet_num = 0}).

-record(provocation_room,
        {ver = 1,
         id = 0,
         pid = undefined :: pid(),
         name = [],
         room_lev_min = 0,
         min_lev_break = 0,
         room_lev_max = 200,
         max_lev_break = 1,
         master_fc = 0,
         mode = 1,
         password = [],
         status = 0,
         master_id = {0, "", 0},
         master_lev = 0,
         master_break = 0,
         master_name = [],
         master_sex = 0,
         master_class = 0,
         master_head = 0,
         customer_id = {0, "", 0},
         master_team_pid = undefined :: pid(),
         customer_team_pid = undefined :: pid(),
         last_vedio_id = {0, "", 0},
         provocation_type = 0,
         target_rival = {0, "", 0},
         target_name = [],
         make_horn_role = {0, "", 0},
         horn_name = [],
         horn_start_time = 0}).

-record(provocation_team,
        {ver = 1,
         team_formation = 0,
         team_formation_lev = 0,
         order = [],
         guards = [],
         team_mate = []}).

-record(provocation_fight_team,
        {leader_id = {0, "", 0}, fighters = []}).

-record(provocation_profile,
        {ver = 2,
         id = {0, "", 0},
         pid = undefined :: pid(),
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         head = 0,
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         guards = [],
         join_time = 0}).

-record(provocation_book,
        {ver = 1,
         id = 0,
         name = [],
         book_lev_min = 0,
         min_lev_break = 0,
         book_lev_max = 200,
         max_lev_break = 0,
         master_fc = 0,
         mode = 1,
         master_id = {0, "", 0},
         master_lev = 0,
         master_name = [],
         master_sex = 0,
         master_class = 0,
         master_head = 0,
         master_break = 0,
         live_status = 1,
         time_stamp = 0,
         provocation_type = 0}).

-record(provocation_fighter,
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

-record(provocation_result,
        {id = {0, "", 0},
         ver = 1,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0}).

-record(provocation_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(provocation_slices,
        {key = {0, 0}, role_list = []}).

-record(provocation_publish,
        {help_id = 0,
         msg_id = 0,
         record_id = 0,
         channel = 0,
         map_id = 0}).

-record(provocation_box,
        {map_id = 0,
         type = 0,
         batch_id = 0,
         time_stamp = 0,
         boxlist = []}).

-file("src/mod/team/team_rpc.erl", 18).

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

-file("src/mod/team/team_rpc.erl", 19).

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

-file("src/mod/team/team_rpc.erl", 20).

handle(11700, {}, Role = #role{name = RoleName}) ->
    case team:info(Role) of
        {ok, Info} -> {reply, Info};
        {false, NewRole = #role{}} -> {ok, NewRole};
        false ->
            logger:error("~ts请求队伍进程时, 无法获取队伍状态",
                         [RoleName],
                         team_rpc,
                         29),
            ok
    end;
handle(11701, {}, Role = #role{}) ->
    case team_mgr:create(Role) of
        {ok, NewRole = #role{}} ->
            NewRole1 = formation:update_team_form(NewRole),
            {reply, {1, lang:get("创建队伍成功，请招募队员")}, NewRole1};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11702, {Rid, Plat, ZoneId},
       Role = #role{s_event = 72}) ->
    case canyon_summit_agent:call(get_status) of
        {3, _} ->
            {reply, {0, lang:get("战场启动中，请稍候再调整队伍{face_1,3}")}};
        {4, _} ->
            {reply, {0, lang:get("战场已开启，请进入战场后再调整队伍吧{face_1,3}")}};
        _ ->
            case team_mgr:invite(Role, {Rid, Plat, ZoneId}) of
                ok -> {reply, {1, lang:get("邀请已经发过去")}};
                {ok, NewRole} ->
                    {reply, {1, lang:get("邀请已经发过去")}, NewRole};
                {true, Msg} -> {reply, {1, Msg}};
                true -> ok;
                {false, Why, NewRole} -> {reply, {0, Why}, NewRole};
                {false, Why} -> {reply, {0, Why}}
            end
    end;
handle(11702, {Rid, Plat, ZoneId}, Role) ->
    case team_mgr:invite(Role, {Rid, Plat, ZoneId}) of
        ok -> {reply, {1, lang:get("邀请已经发过去")}};
        {ok, NewRole} ->
            {reply, {1, lang:get("邀请已经发过去")}, NewRole};
        {true, Msg} -> {reply, {1, Msg}};
        true -> ok;
        {false, Why, NewRole} -> {reply, {0, Why}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11703, {Rid, Plat, ZoneId, Type},
       Role = #role{s_event = 72}) ->
    case canyon_summit_agent:call(get_status) of
        {3, _} ->
            {reply, {0, lang:get("战场启动中，请稍候再调整队伍{face_1,3}")}};
        {4, _} ->
            {reply, {0, lang:get("战场已开启，请进入战场后再调整队伍吧{face_1,3}")}};
        _ ->
            case team_mgr:reply_invite(Role,
                                       {Rid, Plat, ZoneId},
                                       Type)
                of
                ok -> ok;
                {ok, NewRole} -> {ok, NewRole};
                {false, Why, NewRole} -> {reply, {0, Why}, NewRole};
                {false, Why} -> {reply, {0, Why}}
            end
    end;
handle(11703, {_Rid, _Plat, _ZoneId, _Type},
       #role{s_event = 74}) ->
    {reply, {0, lang:get("武道会匹配中，不能进入队伍，请退出武道会匹配再试")}};
handle(11703, {Rid, Plat, ZoneId, Type}, Role) ->
    case team_mgr:reply_invite(Role,
                               {Rid, Plat, ZoneId},
                               Type)
        of
        ok -> ok;
        {ok, NewRole} -> {ok, NewRole};
        {false, Why, NewRole} -> {reply, {0, Why}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11704, {Rid, Plat, ZoneId},
       Role = #role{s_event = 72}) ->
    case canyon_summit_agent:call(get_status) of
        {3, _} ->
            {reply, {0, lang:get("战场启动中，请稍候再调整队伍{face_1,3}")}};
        {4, _} ->
            {reply, {0, lang:get("战场已开启，请进入战场后再调整队伍吧{face_1,3}")}};
        _ ->
            case team_mgr:join(Role, {Rid, Plat, ZoneId}) of
                true -> ok;
                ok -> ok;
                {ok, NewRole} -> {ok, NewRole};
                {false, Why, NewRole} -> {reply, {0, Why}, NewRole};
                {false, Why} -> {reply, {0, Why}}
            end
    end;
handle(11704, {Rid, Plat, ZoneId}, Role) ->
    case team_mgr:join(Role, {Rid, Plat, ZoneId}) of
        true -> ok;
        ok -> ok;
        {ok, NewRole} -> {ok, NewRole};
        {false, Why, NewRole} -> {reply, {0, Why}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11705, {_Rid, _Plat, _ZoneId},
       #role{s_event = 74}) ->
    {reply, {0, lang:get("武道会匹配中，不能变更队伍，请退出武道会匹配再试")}};
handle(11705, {Rid, Plat, ZoneId}, Role) ->
    case team:handover(Role, {Rid, Plat, ZoneId}) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11706, {}, #role{s_event = 74}) ->
    {reply, {0, lang:get("武道会匹配中，不能暂离队伍，请退出武道会匹配再暂离")}};
handle(11706, {}, Role) ->
    case team:away(Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> ok
    end;
handle(11707, {}, Role) ->
    logger:debug("请求归队", [], team_rpc, 164),
    team:follow(Role),
    ok;
handle(11708, {}, #role{s_event = 43}) ->
    {reply, {0, lang:get("副本匹配中，不能退出队伍")}};
handle(11708, {}, #role{s_event = 74}) ->
    {reply, {0, lang:get("武道会匹配中，不能退出队伍，请退出武道会匹配再退出")}};
handle(11708, {}, Role = #role{s_event = 72}) ->
    canyon_summit_role:check_leave(Role);
handle(11708, {}, Role) ->
    case team:leave(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("你已脱离队伍")}, NewRole};
        {none, Why} -> {reply, {1, Why}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11709, {Rid, Plat, ZoneId}, Role) ->
    case team:recall(Role, {Rid, Plat, ZoneId}) of
        ok -> ok;
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11710, {_Rid, _Plat, _ZoneId},
       #role{s_event = 74}) ->
    {reply, {0, lang:get("武道会匹配中，不能变更队伍，请退出武道会匹配再操作")}};
handle(11710, {Rid, Plat, ZoneId}, Role) ->
    case team:kickout(Role, {Rid, Plat, ZoneId}) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11711, {_Type, _Lev}, #role{s_event = 72}) ->
    {reply, {0, lang:get("在峡谷之巅中，不能进行招募")}};
handle(11711, {_Type, _Lev}, #role{s_event = 74}) ->
    {reply, {0, lang:get("在武道会中，不能进行招募")}};
handle(11711, {Type, Lev}, Role) ->
    case role_misc:check_cd(rpc_11711) of
        true ->
            case team:recruit(Role, Type, Lev) of
                true -> {reply, {1, lang:get("成功发布世界招募，请耐心等待")}};
                {false, Why} -> {reply, {0, Why}}
            end;
        _ -> {reply, {0, lang:get("匹配太过频繁，请5s后重试")}}
    end;
handle(11712, {}, Role) ->
    Data = team_mgr:info(Role),
    {reply, Data};
handle(11713, {},
       #role{m_team = #m_team{applys = Applys}}) ->
    {reply, {Applys}};
handle(11714, {_}, Role = #role{s_event = 72}) ->
    notice:send(Role,
                1,
                lang:get("在峡谷之巅中，不能匹配哦~{face_1,22}")),
    ok;
handle(11714, {_}, Role = #role{s_event = 74}) ->
    notice:send(Role,
                1,
                lang:get("在武道会中，不能匹配哦~{face_1,22}")),
    ok;
handle(11714, {[]},
       #role{id = RoleId, pid = Pid, cross_type = 1}) ->
    cross:cast(team_mgr,
               get_match,
               [#{id => RoleId, pid => Pid}]),
    ok;
handle(11714, {[]}, #role{id = RoleId, pid = Pid}) ->
    team_mgr:get_match(#{id => RoleId, pid => Pid}),
    ok;
handle(11714, {Type}, Role) ->
    case team_mgr:match(Role, [T || {T} <- Type]) of
        ok -> ok;
        {ok, NewRole} -> {ok, NewRole};
        {false, Why} -> {reply, {0, [], Why, 0}}
    end;
handle(11716, {}, Role) ->
    L = team:get_applys(Role),
    {reply, {L}};
handle(11718, {Rid, Plat, ZoneId, Type},
       Role = #role{s_event = 72}) ->
    case canyon_summit_agent:call(get_status) of
        {3, _} ->
            {reply, {0, lang:get("战场启动中，请稍候再调整队伍{face_1,3}")}};
        {4, _} ->
            {reply, {0, lang:get("战场已开启，请进入战场后再调整队伍吧{face_1,3}")}};
        _ ->
            case team:verify(Role, {Rid, Plat, ZoneId}, Type) of
                ok -> ok;
                {false, Why} -> {reply, {0, Why}};
                _R ->
                    logger:debug("审核异常返回 ~w", [_R], team_rpc, 269),
                    {reply, {0, lang:get("审核失败")}}
            end
    end;
handle(11718, {Rid, Plat, ZoneId, Type}, Role) ->
    case team:verify(Role, {Rid, Plat, ZoneId}, Type) of
        ok -> ok;
        {false, Why} -> {reply, {0, Why}};
        _R ->
            logger:debug("审核异常返回 ~w", [_R], team_rpc, 279),
            {reply, {0, lang:get("审核失败")}}
    end;
handle(11719, {}, Role) ->
    case team:stop_recruiting(Role) of
        ok -> {reply, {1, ""}};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("停不了的招募")}}
    end;
handle(11720, {}, Role) ->
    case team_mgr:stop_matching(Role) of
        true -> ok;
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {1, ""}}
    end;
handle(11722, Id, #role{id = Id, m_team = MTeam}) ->
    Status = case MTeam of
                 #m_team{pid = Pid, status = St} when is_pid(Pid) -> St;
                 _ -> 0
             end,
    {reply, {1, "", Status}};
handle(11722, {Rid, Plat, ZoneId}, _Role) ->
    case team_mgr:lookup({Rid, Plat, ZoneId}) of
        {ok, Status} -> {reply, {1, "", Status}};
        {false, Why} -> {reply, {0, Why, 0}};
        _R ->
            logger:debug("获取别人玩家异常返回 ~w", [_R], team_rpc, 316),
            {reply, {0, lang:get("不能获取"), 0}}
    end;
handle(11724, _Args, #role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {reply, {0, lang:get("您已在队伍中")}};
handle(11724, {Rid, Plat, ZoneId},
       #role{id = {Rid, Plat, ZoneId}}) ->
    {reply, {0, lang:get("您已在队伍中")}};
handle(11724, {Rid, Plat, ZoneId}, Role) ->
    logger:debug("加入", [], team_rpc, 326),
    case team_mgr:accept_recruitment(Role,
                                     {Rid, Plat, ZoneId})
        of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Why} -> {reply, {0, Why}};
        _R ->
            logger:debug("应聘队伍异常 ~w", [_R], team_rpc, 332),
            {reply, {0, lang:get("不能加入")}}
    end;
handle(11728, {Type}, Role) ->
    case team_recruit:get_recruit(Type, Role) of
        {ok, RecruitList} -> {reply, {RecruitList}};
        _ -> {reply, {[]}}
    end;
handle(11730, {}, Role = #role{s_event = 72}) ->
    Now = date:unixtime2(),
    case canyon_summit_agent:call(get_status) of
        {3, _} ->
            {reply, {0, lang:get("战场启动中，请稍候再调整队伍{face_1,3}")}};
        {4, _} ->
            {reply, {0, lang:get("战场已开启，请进入战场后再调整队伍吧{face_1,3}")}};
        {2, EndTime} when Now + 40 >= EndTime ->
            {reply, {0, lang:get("战场启动中，请稍候再调整队伍{face_1,3}")}};
        _ ->
            case team_common:usurp(Role) of
                ok -> {reply, {1, lang:get("投票发起成功")}};
                {false, Why} -> {reply, {0, Why}};
                _ -> ok
            end
    end;
handle(11730, {}, Role = #role{s_event = 74}) ->
    notice:send(Role,
                1,
                lang:get("在武道会中，不能切换队长哦~{face_1,22}")),
    ok;
handle(11730, {}, Role) ->
    case team_common:usurp(Role) of
        ok -> {reply, {1, lang:get("投票发起成功")}};
        {false, Why} -> {reply, {0, Why}};
        _ -> ok
    end;
handle(11731, {Decision}, Role) ->
    case team_common:vote_usurper(Role, Decision) of
        ok -> {reply, {1, lang:get("投票成功")}};
        {false, Why} -> {reply, {0, Why}};
        _ -> ok
    end;
handle(11734, {TeamMark}, Role) ->
    role:send_buff_begin(),
    case achieve_shop:set_team_mark(Role, TeamMark) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            map:role_update(NewRole),
            achieve_shop:push_teammark(NewRole),
            {reply,
             {1, lang:get("使用成功, 创建队伍后可见{face_1, 36}")},
             NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            logger:debug("设置队标失败:~w", [Reason], team_rpc, 397),
            {reply, {0, Reason}}
    end;
handle(11735, {},
       #role{m_achieve_shop =
                 #m_achieve_shop{team_mark = TeamMark}}) ->
    {reply, {TeamMark}};
handle(11736, Id, Role = #role{id = Id}) ->
    {ok, Mate} = role_convert:to(team_mate, Role),
    Reply = case team:get_members(Role) of
                L when is_list(L) -> [Mate | L];
                _ -> [Mate]
            end,
    {reply, {Reply}};
handle(11736, {Rid, Plat, ZoneId}, _Role) ->
    case team_mgr:lookup_members({Rid, Plat, ZoneId}) of
        {ok, L} -> {reply, {L}};
        _R -> ok
    end;
handle(11737, {2}, Role) ->
    Flag = var:get_var(Role, other, 2013, 1),
    {reply, {Flag}};
handle(11737, {Flag}, Role) ->
    NRole = var:set_var(Role, other, 2013, Flag),
    {reply, {Flag}, NRole};
handle(11739, {}, Role = #role{name = _Name}) ->
    team:to_leader_pos(Role),
    ok;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [team_rpc, _Cmd, _Data],
                 team_rpc,
                 436),
    {error, unknow_command}.

