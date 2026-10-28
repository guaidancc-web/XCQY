-file("src/mod/gods_duel/gods_duel_rpc.erl", 1).

-module(gods_duel_rpc).

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

-file("src/mod/gods_duel/gods_duel_rpc.erl", 16).

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

-file("src/mod/gods_duel/gods_duel_rpc.erl", 17).

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

-file("src/mod/gods_duel/gods_duel_rpc.erl", 18).

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

-file("src/mod/gods_duel/gods_duel_rpc.erl", 19).

handle(17900, {}, Role) ->
    gods_duel_role:push_gods_duel_team(Role),
    ok;
handle(17901, {TeamName}, Role) ->
    case gods_duel_role:rpc_create_team(Role, TeamName) of
        {ok, NewRole} ->
            {reply, {1, lang:get("已向您的队友发送战队邀请，请耐心等待")}, NewRole};
        {false, Reason} ->
            logger:debug("战队创建失败:~ts", [Reason], gods_duel_rpc, 30),
            {reply, {0, Reason}}
    end;
handle(17903, {Flag}, Role) ->
    case gods_duel_role:rpc_apply_create_team(Role, Flag) of
        ok -> {reply, {1, ""}};
        {false, Reason} -> {false, Reason}
    end;
handle(17904, {}, Role) ->
    case gods_duel_role:rpc_leave_team(Role) of
        {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17905, {InviteId, Plat, ZoneId}, Role) ->
    case gods_duel_role:rpc_invite_team(Role,
                                        {InviteId, Plat, ZoneId})
        of
        ok -> {reply, {1, lang:get("邀请成功，请等待队员确认")}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17906, {}, Role) ->
    gods_duel_role:push_can_apply_list(Role);
handle(17907, TeamId, Role) ->
    logger:debug("队伍id:~w", [TeamId], gods_duel_rpc, 66),
    case gods_duel_role:rpc_apply_join_team(Role, TeamId) of
        ok -> {reply, {1, lang:get("申请成功，请等待队长批准")}};
        {false, Reason} ->
            logger:debug("申请加入战队失败:~ts",
                         [Reason],
                         gods_duel_rpc,
                         71),
            {reply, {0, Reason}}
    end;
handle(17908, {Rid, Plat, ZoneId, Flag}, Role) ->
    logger:debug("批准队员【~w】加入",
                 [{Rid, Plat, ZoneId}],
                 gods_duel_rpc,
                 76),
    case gods_duel_role:rpc_approve_join_team(Role,
                                              {Rid, Plat, ZoneId},
                                              Flag)
        of
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} ->
            logger:debug("申请加入战队失败:~ts",
                         [Reason],
                         gods_duel_rpc,
                         81),
            {reply, {0, Reason}}
    end;
handle(17909, MateId, Role) ->
    case gods_duel_role:rpc_kick_mate(Role, MateId) of
        ok -> {reply, {1, ""}};
        {false, Reason} ->
            logger:debug("踢出战队成员失败：~w",
                         [Reason],
                         gods_duel_rpc,
                         91),
            {reply, {0, Reason}}
    end;
handle(17910, {Type}, Role) ->
    gods_duel_role:push_invite_list(Role, Type),
    ok;
handle(17911, {Flag}, Role) ->
    case gods_duel_role:rpc_apply_invite_team(Role, Flag) of
        {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} ->
            logger:debug("回复战队邀请:~ts",
                         [Reason],
                         gods_duel_rpc,
                         109),
            {reply, {0, Reason}}
    end;
handle(17912, {TeamName}, Role) ->
    case gods_duel_role:rpc_modify_team_name(Role, TeamName)
        of
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17913, {Decalration}, Role) ->
    case gods_duel_role:rpc_set_declaration(Role,
                                            Decalration)
        of
        ok -> {reply, {1, "修改成功"}};
        {false, Reason} ->
            logger:debug("回复战队邀请:~ts",
                         [Reason],
                         gods_duel_rpc,
                         127),
            {reply, {0, Reason}}
    end;
handle(17914,
       {Id1, Plat1, ZoneId1, Id2, Plat2, ZoneId2}, Role) ->
    case gods_duel_role:rpc_exchange_alternate(Role,
                                               {Id1, Plat1, ZoneId1},
                                               {Id2, Plat2, ZoneId2})
        of
        ok -> {reply, {1, ""}};
        {false, Reason} ->
            logger:debug("替补更换失败:~ts",
                         [Reason],
                         gods_duel_rpc,
                         137),
            {reply, {0, Reason}}
    end;
handle(17915, {}, _Role) ->
    RtStatus = case env:get(gods_season_status) of
                   undefined -> 0;
                   Status -> Status
               end,
    RtSeasonId = case gods_duel_common:get_season_id() of
                     undefined -> 0;
                     SeasonId -> SeasonId
                 end,
    logger:debug("赛季状态:~w",
                 [{RtStatus, RtSeasonId}],
                 gods_duel_rpc,
                 151),
    {reply, {RtStatus, RtSeasonId}};
handle(17916, {}, Role) ->
    case gods_duel_role:rpc_sign(Role) of
        ok -> {reply, {1, "报名成功"}};
        {false, Reason} ->
            logger:debug("报名失败:~ts", [Reason], gods_duel_rpc, 159),
            {reply, {0, Reason}}
    end;
handle(17917, {ZoneId, Indnex}, Role) ->
    gods_duel_role:push_team_group(Role, ZoneId, Indnex),
    ok;
handle(17918, {}, Role) ->
    gods_duel_role:push_enemy_team(Role),
    ok;
handle(17919, {}, Role) ->
    case gods_duel_role:rpc_enter_match(Role) of
        ok -> ok;
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("进入诸神赛场失败:~w",
                         [Reason],
                         gods_duel_rpc,
                         177),
            {reply, {0, Reason}}
    end;
handle(17920, {}, Role) ->
    case gods_duel_role:rpc_leave_match(Role) of
        ok -> ok;
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("进入诸神赛场失败:~w",
                         [Reason],
                         gods_duel_rpc,
                         188),
            {reply, {0, Reason}}
    end;
handle(17921, {}, Role) ->
    case role_misc:check_cd(rpc_17921) of
        false -> {false, lang:get("您刚准备就绪，请稍后再进行准备")};
        true ->
            case gods_duel_role:rpc_match_ready(Role) of
                ok -> {reply, {1, lang:get("您完成了准备，请等待对手完成准备")}};
                {false, Reason} ->
                    logger:debug("进入诸神赛场失败:~w",
                                 [Reason],
                                 gods_duel_rpc,
                                 202),
                    {reply, {0, Reason}}
            end
    end;
handle(17922, {},
       #role{s_event = Event,
             m_gods_duel = #m_gods_duel{team_id = TeamId}}) ->
    case Event of
        41 ->
            big_world:cast(gods_duel_match,
                           info,
                           [{query_team_status, TeamId}]),
            ok;
        _ ->
            logger:info("状态错误，无需请求", [], gods_duel_rpc, 213),
            ok
    end;
handle(17923, {}, _Role) ->
    case env:get(match_status) of
        #{match_state := MatchState,
          season_status := SeasonStatus,
          start_time := StartTime} ->
            {reply, {MatchState, SeasonStatus, StartTime}};
        _ -> {reply, {0, 0, 0}}
    end;
handle(17925, {ZoneId}, Role) ->
    gods_duel_role:push_team_group_64(Role, ZoneId, 0),
    ok;
handle(17927, {}, Role) ->
    case gods_duel_role:rpc_match_cancel_ready(Role) of
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} -> {reply, {0, Reason}};
        ok -> ok
    end;
handle(17928, {SeasonId, GroupId, WatchType}, Role) ->
    gods_duel_role:push_match_profile_list(Role,
                                           SeasonId,
                                           GroupId,
                                           WatchType),
    ok;
handle(17929, {CombatRecordId}, Role) ->
    case gods_duel_role:rpc_watch_combat(Role,
                                         CombatRecordId)
        of
        ok -> ok;
        {false, Reason} -> {reply, {0, Reason}};
        _ -> ok
    end;
handle(17930, {}, Role) ->
    gods_duel_role:push_vote_info(Role),
    ok;
handle(17931, {ZoneId, TeamIds}, Role) ->
    role:send_buff_begin(),
    case gods_duel_role:rpc_vote_team(Role, ZoneId, TeamIds)
        of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("投票成功")}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            logger:debug("投票错误：~ts", [Reason], gods_duel_rpc, 261),
            {reply, {0, Reason}}
    end;
handle(17932, {ZoneId, SeasonId}, Role) ->
    gods_duel_role:push_team_group_64(Role,
                                      ZoneId,
                                      SeasonId),
    ok;
handle(17933, {SeasonID}, Role) ->
    NewSeasonID = case SeasonID =< 0 of
                      true -> gods_duel_common:get_season_id();
                      _ -> SeasonID
                  end,
    gods_duel_role:push_gods_duel_time(Role, NewSeasonID),
    ok;
handle(17934, {}, Role) ->
    gods_duel_role:push_gods_lev_info(Role),
    ok;
handle(17935, {R, P, Z}, #role{}) ->
    case gods_duel_agent:get_profile({R, P, Z}) of
        Profile = #gods_duel_profile{} -> {reply, {Profile}};
        _ -> {reply, {#gods_duel_profile{id = {R, P, Z}}}}
    end;
handle(17936, {}, #role{id = Id}) ->
    case gods_duel_agent:get_profile(Id) of
        Profile = #gods_duel_profile{} -> {reply, {Profile}};
        _ -> {reply, {#gods_duel_profile{}}}
    end;
handle(17937, {Type, Group}, Role) ->
    L = gods_duel_rank:list(Type, Group, Role),
    logger:debug("~w", [L], gods_duel_rpc, 306),
    {reply, {Type, Group, L}};
handle(17938, {}, _Role) ->
    case gods_place_agent:call({get_status}) of
        {error, _Reason} ->
            logger:debug("~ts", [_Reason], gods_duel_rpc, 313),
            {reply, {0, 0}};
        Data = {_, _} ->
            logger:debug("~w", [Data], gods_duel_rpc, 316),
            {reply, Data}
    end;
handle(17939, {}, Role) ->
    case gods_place_role:rpc_join(Role) of
        ok -> ok;
        true -> ok;
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("进入殿堂失败:~ts",
                         [Reason],
                         gods_duel_rpc,
                         330),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("进入殿堂失败")}}
    end;
handle(17940, {}, Role) ->
    case gods_place_role:rpc_exit(Role) of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("退出殿堂失败:~ts",
                         [Reason],
                         gods_duel_rpc,
                         342),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("退出殿堂失败")}}
    end;
handle(17941, {}, Role) ->
    case gods_place_role:rpc_champion(Role) of
        {ok, Team} -> {reply, {Team}};
        true -> ok;
        {false, _Reason} ->
            logger:debug("请求冠军队伍失败:~ts",
                         [_Reason],
                         gods_duel_rpc,
                         356),
            {reply, {[#gods_place_team_statue{}]}};
        _ -> {reply, {[#gods_place_team_statue{}]}}
    end;
handle(17942, {}, Role) ->
    case gods_place_role:rpc_worship(Role) of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("膜拜队伍失败:~ts",
                         [Reason],
                         gods_duel_rpc,
                         368),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("")}}
    end;
handle(17943, {Type, Value}, Role) ->
    case gods_place_role:rpc_set_barrage(Role, Type, Value)
        of
        {ok, NewRole} ->
            {reply, {Type, Value, 1, lang:get("")}, NewRole};
        {false, Reason} -> {reply, {Type, Value, 0, Reason}};
        _ERR ->
            logger:error("设置弹幕错误~w", [_ERR], gods_duel_rpc, 382),
            {reply, {Type, Value, 0, lang:get("设置弹幕错误")}}
    end;
handle(17944, {Msg}, Role) ->
    case gods_place_role:rpc_send_barrage(Role, Msg) of
        ok -> {reply, {1, lang:get("")}};
        true -> {reply, {1, lang:get("")}};
        {false, Reason} -> {reply, {0, Reason}};
        _ERR ->
            logger:error("发送弹幕错误~w", [_ERR], gods_duel_rpc, 396),
            {reply, {0, lang:get("发送弹幕错误")}}
    end;
handle(17945, {}, _Role) ->
    case gods_place_role:rpc_worship_msg() of
        {ok, List} -> {reply, {1, List}};
        {false, _Reason} ->
            logger:debug("请求失败:~ts", [_Reason], gods_duel_rpc, 406),
            {reply, {0, []}};
        _ -> {reply, {0, []}}
    end;
handle(17946, {}, Role) ->
    gods_place_role:rpc_drop_box_time(Role),
    ok;
handle(17947, {}, Role) ->
    {reply, {gods_place_role:rpc_query_worship_info(Role)}};
handle(17948, {}, Role) ->
    {reply,
     {gods_place_role:rpc_query_efficiency_info(Role)}};
handle(17949, {}, Role) ->
    case gods_place_role:rpc_set_efficiency(Role) of
        {ok, NewRole} -> {reply, {}, NewRole};
        {false, _Reason} ->
            logger:debug("~ts", [_Reason], gods_duel_rpc, 431),
            {reply, {}};
        _ERR ->
            logger:error("设置玩家观看过仪式特效错误~w",
                         [_ERR],
                         gods_duel_rpc,
                         434),
            {reply, {}}
    end;
handle(17950, {}, Role) ->
    gods_place_role:rpc_get_marvelous(Role),
    ok;
handle(17951, {}, Role) ->
    gods_place_role:rpc_get_champion_video(Role),
    ok;
handle(17952, {}, _Role) ->
    {reply, {gods_place_agent:call(get_end_time)}};
handle(17953, {}, _Role) ->
    {reply, {gods_place_agent:call(ceremony_flag)}};
handle(17954, {}, _Role) ->
    case gods_duel_data:get_season_second({1, 34}) of
        {[StartTime], _} ->
            Zero = date:unixtime(zero),
            FirstTime = Zero + calendar:time_to_seconds(StartTime) +
                            15 * 60,
            ManualTime = Zero +
                             calendar:time_to_seconds({21, 25, 0}),
            {reply, {FirstTime, ManualTime}};
        _ -> ok
    end;
handle(17956, {}, _Role) ->
    {reply, gods_challenge_role:rpc_get_challenge_status()};
handle(17957, {SeasonId}, _Role) ->
    {reply,
     gods_challenge_role:rpc_get_watch_info(SeasonId)};
handle(17959, {CombatRecordId},
       Role = #role{s_event = _Event}) ->
    case CombatRecordId =:= 0 of
        true ->
            case gods_challenge_agent:call(challenge_watch_info) of
                {0, _, _, _} ->
                    {reply, {0, lang:get("活动暂未开启，请等待活动开始")}};
                _ -> {reply, {0, lang:get("战斗已结束")}}
            end;
        _ ->
            gods_challenge_role:handle_rpc_watch_challenge(Role,
                                                           CombatRecordId)
    end;
handle(17963, {Choice}, Role) ->
    case gods_challenge_role:add_support(Choice, Role) of
        {ok, NewRole} ->
            Msg = case Choice of
                      0 -> lang:get("你已选择\"能\"，感谢你的参与{face_1,2}");
                      1 -> lang:get("你已选择\"不能\"，感谢你的参与{face_1,2}");
                      _ -> lang:get("你已选择\"不知道\"，感谢你的参与{face_1,2}")
                  end,
            {reply, {1, Msg}, NewRole};
        {false, Reason, NewRole} ->
            {reply, {1, Reason}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17965, {}, Role) ->
    gods_place_role:rpc_champion_drop_box_time(Role),
    ok;
handle(17966, {}, Role) ->
    logger:debug("收到协议17966", [], gods_duel_rpc, 543),
    gods_duel_role:rpc_push_17966(Role),
    ok;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [gods_duel_rpc, _Cmd, _Data],
                 gods_duel_rpc,
                 549),
    {error, unknow_command}.

