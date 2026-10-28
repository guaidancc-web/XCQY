-file("src/mod/tournament/tournament_rpc.erl", 1).

-module(tournament_rpc).

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

-file("src/mod/tournament/tournament_rpc.erl", 11).

-file("inc/tournament.hrl", 1).

-record(m_tournament,
        {ver = 3 :: non_neg_integer(),
         triggers = [] :: list(),
         status = 0 :: non_neg_integer(),
         rewarded = [] :: list(),
         pk_type = 0,
         kingbadgenum = 0,
         starlev = 0,
         kingbadge = [] :: list(),
         showbadge = 0}).

-record(tournament_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 11 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         liked_other = 0 :: non_neg_integer(),
         last_matched = 0 :: non_neg_integer(),
         day_matched = 0 :: non_neg_integer(),
         day_win = 0 :: non_neg_integer(),
         day_win_sustained = 0 :: non_neg_integer(),
         season_rank_lev = 1 :: non_neg_integer(),
         season_rank_point = 0 :: non_neg_integer(),
         combat_count = 0 :: non_neg_integer(),
         win_count = 0 :: non_neg_integer(),
         win_sustained = 0 :: non_neg_integer(),
         season_kill = 0 :: non_neg_integer(),
         season_reverse = 0 :: non_neg_integer(),
         season_revive = 0 :: non_neg_integer(),
         season_dmg = 0 :: non_neg_integer(),
         season_bearing_dmg = 0 :: non_neg_integer(),
         season_zero_dmg = 0 :: non_neg_integer(),
         season_pet_revive = 0 :: non_neg_integer(),
         best_rank_point = 0 :: non_neg_integer(),
         best_rank_lev = 1 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer(),
         best_win_sustained = 0 :: non_neg_integer(),
         best_partner = [] :: list(),
         week_rank_lev = 1 :: non_neg_integer(),
         week_rank_point = 0 :: non_neg_integer(),
         awesome_kill = 0 :: non_neg_integer(),
         awesome_kill_num = 0 :: non_neg_integer(),
         awesome_dmg = 0 :: non_neg_integer(),
         awesome_heal = 0 :: non_neg_integer(),
         awesome_control = 0 :: non_neg_integer(),
         mvp = 0 :: non_neg_integer(),
         loss_mvp = 0 :: non_neg_integer(),
         season_awesome_kill = 0 :: non_neg_integer(),
         season_awesome_kill_num = 0 :: non_neg_integer(),
         season_awesome_dmg = 0 :: non_neg_integer(),
         season_awesome_heal = 0 :: non_neg_integer(),
         season_awesome_control = 0 :: non_neg_integer(),
         season_mvp = 0 :: non_neg_integer(),
         season_loss_mvp = 0 :: non_neg_integer(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         reported_other = 0 :: non_neg_integer(),
         reported_logs = [] :: list(),
         banned_date = 0 :: non_neg_integer(),
         reported_single_match = 0,
         is_auto_combat = 0,
         guards = [],
         historical_high = 0 :: non_neg_integer(),
         show_badge_id = 0 :: non_neg_integer(),
         promotion_win = 0 :: non_neg_integer(),
         upgrade_point = 0 :: non_neg_integer()}).

-record(tournament_role,
        {id = {0, "", 0} :: tuple(),
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         times = 1 :: non_neg_integer(),
         point = 1 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         pid :: undefined | pid() | 0,
         is_online = 0 :: 0 | 1,
         match_id = 0 :: non_neg_integer(),
         side = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1,
         last_matched = 0 :: non_neg_integer(),
         team_id = [] :: list(),
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         partner = [] :: list(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         guards = [],
         show_badge_id = 0 :: non_neg_integer()}).

-record(tournament_team,
        {ids = [] :: list(),
         output_num = 0 :: non_neg_integer(),
         assist_num = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_point = 0 :: non_neg_integer(),
         max_point = 0 :: non_neg_integer(),
         min_point = 0 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         usurpers = [] :: list(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(tournament_match,
        {id = 0 :: non_neg_integer(),
         teams = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-record(tournament_usurper,
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

-record(tournament_celebrity,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer()}).

-record(tournament_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(tournament_season_role,
        {ver = 0,
         id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         reward_lev = 0 :: non_neg_integer(),
         rewarded = 0 :: non_neg_integer()}).

-record(tournament_result,
        {id = {0, "", 0},
         ver = 3,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0,
         rank_lev = 0}).

-record(tournament_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(king_badge,
        {id = 0,
         status = 0,
         active_effect_type = 3,
         active_attr = [],
         fc = 0}).

-record(tournament_match_report_info,
        {match_id, can_report = [], result}).

-file("src/mod/tournament/tournament_rpc.erl", 12).

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

-file("src/mod/tournament/tournament_rpc.erl", 13).

handle(16400, {}, Role) ->
    tournament_role:push(Role, 16400),
    ok;
handle(16401, {}, Role) ->
    case tournament_role:ready(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("网络不稳定")}}
    end;
handle(16402, {}, Role) ->
    case tournament_role:join(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("正在匹配队友，请耐心等待")}, NewRole};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("网络不稳定")}}
    end;
handle(16403, {}, Role) ->
    case tournament_role:quit(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("网络不稳定")}}
    end;
handle(16405, {R, P, Z},
       #role{name = Name, lev = Lev, classes = Classes,
             sex = Sex}) ->
    case tournament_agent:get_profile({R, P, Z}) of
        Profile = #tournament_profile{} -> {reply, {Profile}};
        _ ->
            {reply,
             {#tournament_profile{id = {R, P, Z}, name = Name,
                                  lev = Lev, classes = Classes, sex = Sex}}}
    end;
handle(16407, {}, Role) ->
    logger:debug("======", [], tournament_rpc, 67),
    tournament_role:push(Role, 16407),
    ok;
handle(16408, {}, Role) ->
    case tournament_role:quit(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("取消匹配成功")}, NewRole};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("网络不稳定")}}
    end;
handle(16409, {}, Role) ->
    case tournament_role:usurp(Role) of
        ok -> {reply, {1, lang:get("发起投票成功")}};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("网络不稳定")}}
    end;
handle(16410, {Decision}, Role) ->
    case tournament_role:vote_usurper(Role, Decision) of
        ok -> {reply, {1, lang:get("投票成功")}};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("网络不稳定")}}
    end;
handle(16412, {R, P, Z}, Role) ->
    case tournament_role:handover(Role, {R, P, Z}) of
        ok -> {reply, {1, lang:get("委任成功")}};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("网络不稳定")}}
    end;
handle(16414, {R1, P1, Z1, R2, P2, Z2}, Role) ->
    case tournament_role:change_order(Role,
                                      {R1, P1, Z1},
                                      {R2, P2, Z2})
        of
        ok -> {reply, {1, lang:get("调整站位成功")}};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("网络不稳定")}}
    end;
handle(16415, {FormationId}, Role) ->
    case tournament_role:change_form(Role, FormationId) of
        ok -> {reply, {1, lang:get("改变阵法成功")}};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("网络不稳定")}}
    end;
handle(16416, {Type, Group}, Role) ->
    L = tournament_rank:list(Type, Group, Role),
    {reply, {Type, Group, L}};
handle(16417, {}, Role) ->
    case tournament_role:get_advance_reward(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("成功领取奖励")}, NewRole};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("网络不稳定")}}
    end;
handle(16418, {Type, Range}, _Role) ->
    L = tournament_rank:list_celebrity(Type, Range),
    {reply, {Type, Range, L}};
handle(16419, {R, P, Z}, Role) ->
    case tournament_role:like(Role, {R, P, Z}) of
        ok -> {reply, {1, lang:get("点赞成功"), R, P, Z}};
        {false, Why} -> {reply, {0, Why, R, P, Z}};
        _ -> {reply, {0, lang:get("点赞失败"), R, P, Z}}
    end;
handle(16420, {}, Role) ->
    case tournament_role:rand_watch(Role) of
        ok -> {reply, {1, ""}};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("观战失败")}}
    end;
handle(16422, {}, Role) ->
    case tournament_season:reward(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("成功领取奖励")}, NewRole};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("网络不稳定")}}
    end;
handle(16423, {Msg, Mentions}, Role) ->
    case tournament_role:post_resut(Role, Msg, Mentions) of
        {ok, NewRole} ->
            {reply, {1, lang:get("成功分享到朋友圈")}, NewRole};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("网络不稳定")}}
    end;
handle(16424, {Id, P, Z}, _Role) ->
    case tournament_agent:get_result({Id, P, Z}) of
        Result = #tournament_result{} -> {reply, {Result}};
        _ -> {reply, {#tournament_result{}}}
    end;
handle(16425, {R, P, Z, RecId}, Role) ->
    case tournament_role:report(Role, {R, P, Z}, RecId) of
        ok -> {reply, {1, lang:get("举报成功"), R, P, Z}};
        {false, Why} -> {reply, {0, Why, R, P, Z}};
        _ -> {reply, {0, lang:get("点赞失败"), R, P, Z}}
    end;
handle(16426, {Id, P, Z}, Role) ->
    case tournament_role:replay_result(Role, {Id, P, Z}) of
        ok -> ok;
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("录像已过期")}}
    end;
handle(16427, {R, P, Z},
       #role{name = Name, lev = Lev, classes = Classes,
             sex = Sex}) ->
    case tournament_agent:get_profile({R, P, Z}) of
        Profile = #tournament_profile{} -> {reply, {Profile}};
        _ ->
            {reply,
             {#tournament_profile{id = {R, P, Z}, name = Name,
                                  lev = Lev, classes = Classes, sex = Sex}}}
    end;
handle(16428, {R, P, Z}, _Role) ->
    case tournament_role:get_result_role({R, P, Z}) of
        Result = #tournament_result_role{} -> {reply, {Result}};
        _ -> {reply, {#tournament_result_role{id = {R, P, Z}}}}
    end;
handle(16429, {Id, Order}, Role) ->
    case tournament_role:guard_open(Role, Id, Order) of
        ok -> ok;
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("服务器超时")}}
    end;
handle(16430, {R, P, Z}, _Role) ->
    case tournament_agent:get_profile({R, P, Z}) of
        #tournament_profile{historical_high = HistoricalHigh} ->
            logger:debug("===~w",
                         [HistoricalHigh],
                         tournament_rpc,
                         252),
            {reply, {HistoricalHigh}};
        _ ->
            logger:debug("======", [], tournament_rpc, 255),
            {reply, {0}}
    end;
handle(16431, {}, Role) ->
    case tournament_role:get_badgeinfo(Role) of
        {false, Reason} ->
            logger:error("获取王者徽章信息出错:~w",
                         [Reason],
                         tournament_rpc,
                         263),
            {reply, {false, Reason}};
        {ok, Badgeinfo} -> {reply, Badgeinfo}
    end;
handle(16432, {Type}, Role) ->
    role:send_buff_begin(),
    case tournament_role:promote(Type, Role) of
        {ok, NRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NRole};
        {false, Why} ->
            role:send_buff_clean(),
            {reply, {0, Why}};
        {error, Err} ->
            role:send_buff_clean(),
            logger:error("使用徽章印记失败：~w", [Err], tournament_rpc, 280),
            ok
    end;
handle(16434, {Id}, Role) ->
    case tournament_role:use_badge(Role, Id) of
        {false, Reason} ->
            logger:error("穿戴王者徽章出错:~w",
                         [Reason],
                         tournament_rpc,
                         288);
        {ok, NRole} ->
            role:link_send(Role, 16437, {Id}),
            case Id =:= 0 of
                true -> {reply, {1, ""}, NRole};
                false -> {reply, {1, "戴上王者徽章，真是英姿飒爽{face_1,54}"}, NRole}
            end
    end;
handle(16435, {},
       #role{m_tournament =
                 #m_tournament{showbadge = Showbadge,
                               kingbadge = BadgeList}}) ->
    HoldList = [BadgeId
                || #king_badge{id = BadgeId, status = Status}
                       <- BadgeList,
                   Status =:= 1],
    case HoldList of
        [] -> ActiveSetList = [];
        _ ->
            ActiveSetList = tournament_attr:get_activeset(BadgeList)
    end,
    {reply, {Showbadge, HoldList, ActiveSetList}};
handle(16437, {},
       #role{m_tournament =
                 #m_tournament{showbadge = Showbadge}}) ->
    {reply, {Showbadge}};
handle(16438, {R, P, Z, O}, _Role) ->
    case role_query:attr(by_id,
                         R,
                         P,
                         Z,
                         [#role.m_tournament, #role.classes])
        of
        {ok, [#m_tournament{showbadge = BadgeId}, Classes]} ->
            logger:debug("16438发送的数据~w",
                         [{BadgeId, Classes, O}],
                         tournament_rpc,
                         327),
            {reply, {BadgeId, Classes, O}};
        _ ->
            logger:info("角色不在线或查找不到角色", [], tournament_rpc, 330),
            ok
    end;
handle(_Cmd, _Data, _Role) ->
    logger:error("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [tournament_rpc, _Cmd, _Data],
                 tournament_rpc,
                 337),
    {error, unknow_command}.

