-file("src/mod/gods_duel/gods_duel_rank.erl", 1).

-module(gods_duel_rank).

-export([sort_group/1,
         list/3,
         update_team_rank/0,
         update_rank/1,
         get_rank/2,
         repair/0]).

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

-file("src/mod/gods_duel/gods_duel_rank.erl", 18).

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

-file("src/mod/gods_duel/gods_duel_rank.erl", 19).

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

-file("src/mod/gods_duel/gods_duel_rank.erl", 20).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/gods_duel/gods_duel_rank.erl", 21).

-file("inc/robot.hrl", 1).

-record(robot_role,
        {ver = 4,
         id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         face = 0,
         ai_id = 0,
         skills = [],
         talents = [],
         pet,
         backup_pets = [],
         guard,
         slave = [],
         attr :: undefined | tuple(),
         looks = [],
         time = 0,
         m_formation,
         pet_fc = 0,
         all_fc = 0,
         cup = 1000,
         m_lev_break}).

-record(robot_role_index,
        {id = {0, "", 0} :: tuple(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         pet_fc = 0,
         cup = 1000,
         all_fc = 0,
         time = 0}).

-file("src/mod/gods_duel/gods_duel_rank.erl", 22).

sort_group(L) ->
    {L116s, L4} = lists:partition(fun
                                      (#gods_duel_profile{lev = Lev}) ->
                                          Lev >= 116
                                  end,
                                  L),
    {L106s, L1} = lists:partition(fun
                                      (#gods_duel_profile{lev = Lev}) ->
                                          Lev >= 106
                                  end,
                                  L4),
    {L101s, L2} = lists:partition(fun
                                      (#gods_duel_profile{lev = Lev}) ->
                                          Lev >= 101
                                  end,
                                  L1),
    {L90s, L80s} = lists:partition(fun
                                       (#gods_duel_profile{lev = Lev}) ->
                                           Lev >= 90
                                   end,
                                   L2),
    L116s1 =
        lists:reverse(lists:keysort(#gods_duel_profile.gods_duel_score,
                                    L116s)),
    L116s2 = lists:sublist(L116s1, 100),
    Last116 = case L116s2 of
                  [] -> false;
                  _ -> lists:last(L116s2)
              end,
    L106s1 =
        lists:reverse(lists:keysort(#gods_duel_profile.gods_duel_score,
                                    L106s)),
    L106s2 = lists:sublist(L106s1, 100),
    Last106 = case L106s2 of
                  [] -> false;
                  _ -> lists:last(L106s2)
              end,
    L101s1 =
        lists:reverse(lists:keysort(#gods_duel_profile.gods_duel_score,
                                    L101s)),
    L101s2 = lists:sublist(L101s1, 100),
    Last101 = case L101s2 of
                  [] -> false;
                  _ -> lists:last(L101s2)
              end,
    L90s1 =
        lists:reverse(lists:keysort(#gods_duel_profile.gods_duel_score,
                                    L90s)),
    L90s2 = lists:sublist(L90s1, 100),
    Last90 = case L90s2 of
                 [] -> false;
                 _ -> lists:last(L90s2)
             end,
    L80s1 =
        lists:reverse(lists:keysort(#gods_duel_profile.gods_duel_score,
                                    L80s)),
    L80s2 = lists:sublist(L80s1, 100),
    Last80 = case L80s2 of
                 [] -> false;
                 _ -> lists:last(L80s2)
             end,
    [{80, L80s2},
     {90, L90s2},
     {101, L101s2},
     {106, L106s2},
     {116, L116s2},
     {{80, last}, Last80},
     {{90, last}, Last90},
     {{101, last}, Last101},
     {{106, last}, Last106},
     {{116, last}, Last116}].

update_team_rank() ->
    case catch ets:lookup(gods_duel_team_rank,
                          gods_duel_team_rank)
        of
        [#gods_duel_team_rank{}] -> ok;
        _ ->
            case catch ets:lookup(gods_duel_season_data,
                                  gods_duel_season_data)
                of
                [#gods_duel_season_data{serial_id = Id,
                                        history_season_info = HisInfo}] ->
                    update_team_rank(Id, HisInfo);
                _ -> ok
            end
    end.

update_rank(HisInfo) ->
    case catch ets:lookup(gods_duel_season_data,
                          gods_duel_season_data)
        of
        [#gods_duel_season_data{serial_id = Id}] ->
            update_team_rank2(Id, HisInfo);
        _ -> ok
    end.

get_rank(Type, RoleId) ->
    NewType = Type - 66,
    case catch ets:lookup(gods_duel_team_rank,
                          gods_duel_team_rank)
        of
        [#gods_duel_team_rank{serial_id = Id,
                              history_season_info = HisInfo}] ->
            case lists:keyfind(Id, 1, HisInfo) of
                {_, TeamList} ->
                    case lists:keyfind(NewType, 1, TeamList) of
                        {_, TeamRankList} ->
                            case [{Rank, Qua}
                                  || #gods_duel_team_rank_data{members =
                                                                   Members,
                                                               qualification =
                                                                   Qua,
                                                               rank = Rank}
                                         <- TeamRankList,
                                     lists:keyfind(RoleId,
                                                   #gods_duel_team_rank_mate.id,
                                                   Members)
                                         =/= false]
                                of
                                [{Rk, Qualification}] ->
                                    {Type,
                                     Rk,
                                     qualification_map_rank_honor(Qualification)};
                                _ -> {Type, 0, 0}
                            end;
                        _ -> {Type, 0, 0}
                    end;
                _ -> {Type, 0, 0}
            end;
        _ -> {Type, 0, 0}
    end.

list(1, Key, _) ->
    case ets:lookup(gods_duel_rank, Key) of
        [{_, L}] -> L;
        _ -> []
    end;
list(2, _Key, _) ->
    case ets:tab2list(gods_duel_profile) of
        TempL when is_list(TempL) ->
            lists:reverse(lists:keysort(#gods_duel_profile.gods_duel_score,
                                        TempL));
        _ -> []
    end;
list(3, _, #role{id = Id}) ->
    Ids = friend:list_id(Id),
    TempL = list_profile(Ids ++ [Id]),
    lists:reverse(lists:keysort(#gods_duel_profile.gods_duel_score,
                                TempL)).

list_profile([]) -> [];
list_profile([Id | T]) ->
    case gods_duel_agent:get_profile(Id) of
        P = #gods_duel_profile{} -> [P | list_profile(T)];
        _ -> list_profile(T)
    end.

update_team_rank(Id, HisInfo) when Id > 0 ->
    case lists:keyfind(Id,
                       #gods_duel_season_info.id,
                       HisInfo)
        of
        #gods_duel_season_info{teams = Teams} ->
            update_team_rank2(Id, Teams);
        _ -> update_team_rank(Id - 1, HisInfo)
    end;
update_team_rank(_Id, _HisInfo) -> false.

update_team_rank2(Id, Teams) ->
    RankTeams = get_rank_team(Teams, []),
    RankTypeTeams = rank_type_team(RankTeams, []),
    {RankRcTeams, GroupTeams} = rank_rc_team(RankTypeTeams,
                                             [],
                                             []),
    update_team_info(Id, GroupTeams),
    group_team(RankRcTeams).

update_team_info(Id, GroupTeams) ->
    case env:get(is_big_world_center) of
        true ->
            case catch ets:lookup(gods_duel_team_rank,
                                  gods_duel_team_rank)
                of
                [#gods_duel_team_rank{serial_id = Id,
                                      history_season_info = HisInfo}] ->
                    NewGodsDuelTeamRank = #gods_duel_team_rank{serial_id =
                                                                   Id,
                                                               history_season_info
                                                                   =
                                                                   lists:keystore(Id,
                                                                                  1,
                                                                                  HisInfo,
                                                                                  {Id,
                                                                                   GroupTeams})},
                    ets:insert(gods_duel_team_rank, [NewGodsDuelTeamRank]),
                    big_world:cast(all,
                                   gods_duel_agent,
                                   info,
                                   [{update_team_rank, NewGodsDuelTeamRank}]);
                [#gods_duel_team_rank{history_season_info = HisInfo}] ->
                    NewGodsDuelTeamRank = #gods_duel_team_rank{serial_id =
                                                                   Id,
                                                               history_season_info
                                                                   =
                                                                   [{Id,
                                                                     GroupTeams}
                                                                    | HisInfo]},
                    ets:insert(gods_duel_team_rank, [NewGodsDuelTeamRank]),
                    big_world:cast(all,
                                   gods_duel_agent,
                                   info,
                                   [{update_team_rank, NewGodsDuelTeamRank}]);
                _ ->
                    NewGodsDuelTeamRank = #gods_duel_team_rank{serial_id =
                                                                   Id,
                                                               history_season_info
                                                                   =
                                                                   [{Id,
                                                                     GroupTeams}]},
                    ets:insert(gods_duel_team_rank, [NewGodsDuelTeamRank]),
                    big_world:cast(all,
                                   gods_duel_agent,
                                   info,
                                   [{update_team_rank, NewGodsDuelTeamRank}])
            end;
        _ ->
            case catch ets:lookup(gods_duel_team_rank,
                                  gods_duel_team_rank)
                of
                [#gods_duel_team_rank{serial_id = Id,
                                      history_season_info = HisInfo}] ->
                    NewGodsDuelTeamRank = #gods_duel_team_rank{serial_id =
                                                                   Id,
                                                               history_season_info
                                                                   =
                                                                   lists:keystore(Id,
                                                                                  1,
                                                                                  HisInfo,
                                                                                  {Id,
                                                                                   GroupTeams})},
                    ets:insert(gods_duel_team_rank, [NewGodsDuelTeamRank]);
                [#gods_duel_team_rank{history_season_info = HisInfo}] ->
                    NewGodsDuelTeamRank = #gods_duel_team_rank{serial_id =
                                                                   Id,
                                                               history_season_info
                                                                   =
                                                                   [{Id,
                                                                     GroupTeams}
                                                                    | HisInfo]},
                    ets:insert(gods_duel_team_rank, [NewGodsDuelTeamRank]);
                _ ->
                    NewGodsDuelTeamRank = #gods_duel_team_rank{serial_id =
                                                                   Id,
                                                               history_season_info
                                                                   =
                                                                   [{Id,
                                                                     GroupTeams}]},
                    ets:insert(gods_duel_team_rank, [NewGodsDuelTeamRank])
            end
    end.

group_team([]) -> ok;
group_team([{RankType, RankTeams} | Rest]) ->
    case env:get(is_big_world_center) of
        true ->
            logger:debug("~w",
                         [{RankType, RankTeams}],
                         gods_duel_rank,
                         207),
            big_world:cast(all,
                           rank_zone,
                           cast,
                           [RankType,
                            {replace, RankType, RankTeams, #{reward => 0}}]);
        _ ->
            rank_zone:cast(RankType,
                           {replace, RankType, RankTeams, #{reward => 0}})
    end,
    group_team(Rest).

get_rank_team([], RankTeams) -> RankTeams;
get_rank_team([{GroupId, Teams} | Rest], RankTeams) ->
    PreTeams16 = [Team
                  || Team = #gods_duel_team{qualification = Qualification}
                         <- Teams,
                     Qualification >= 5],
    get_rank_team(Rest,
                  [{GroupId, PreTeams16} | RankTeams]).

rank_type_team([], RankTypeTeams) -> RankTypeTeams;
rank_type_team([{GroupId, Teams} | Rest],
               RankTypeTeams) ->
    case group_map_rank_type(GroupId) of
        false ->
            logger:error("诸神错误的GroupId：~w",
                         [GroupId],
                         gods_duel_rank,
                         225),
            rank_type_team(Rest, RankTypeTeams);
        RankType ->
            rank_type_team(Rest,
                           [{GroupId, RankType, Teams} | RankTypeTeams])
    end.

rank_rc_team([], RankRcTeams, GroupTeams) ->
    {RankRcTeams, GroupTeams};
rank_rc_team([{GroupId, RankType, Teams} | Rest],
             RankTypeTeams, GroupTeams) ->
    {RankRc, RankTeams} = rank_sort(Teams),
    rank_rc_team(Rest,
                 [{RankType, RankRc} | RankTypeTeams],
                 [{GroupId, RankTeams} | GroupTeams]).

rank_sort(Teams) ->
    Sort = util:keys_sort([#gods_duel_team.fight_capacity,
                           #gods_duel_team.win_times,
                           #gods_duel_team.qualification],
                          Teams),
    rank_sort(Sort, 1, [], []).

rank_sort([], _Rank, RankRc, RankTeams) ->
    {lists:reverse(RankRc), lists:reverse(RankTeams)};
rank_sort([Team | Rest], Rank, RankRc, RankTeams) ->
    NewTeams = check_team_classes(Team),
    RankRcTeam = to_rank_rc(NewTeams, Rank),
    RankTeam = to_rank_team(NewTeams, Rank),
    rank_sort(Rest,
              Rank + 1,
              [RankRcTeam | RankRc],
              [RankTeam | RankTeams]).

check_team_classes(GodsDuelTeam =
                       #gods_duel_team{members = Members}) ->
    NewMembers = check_team_classes(Members, []),
    GodsDuelTeam#gods_duel_team{members = NewMembers}.

check_team_classes([], Members) ->
    lists:reverse(Members);
check_team_classes([GodsDuelTeamMate =
                        #gods_duel_team_mate{id = Id = {_, P, Z},
                                             classes = OldClasses}
                    | Rest],
                   Members) ->
    NewClasses = case big_world:call(P,
                                     Z,
                                     robot_mgr,
                                     get_role,
                                     [Id])
                     of
                     {ok, #robot_role{classes = Classes}} -> Classes;
                     _ -> OldClasses
                 end,
    check_team_classes(Rest,
                       [GodsDuelTeamMate#gods_duel_team_mate{classes =
                                                                 NewClasses}
                        | Members]).

to_rank_rc(#gods_duel_team{id =
                               TeamId = {Tid, Plat, ZoneId},
                           name = Name, members = Members, qualification = Qua},
           Rank) ->
    {Sex, Classes, Lev} = case [{Sex, Classes, Lev}
                                || #gods_duel_team_mate{classes = Classes,
                                                        sex = Sex, lev = Lev,
                                                        position = Position}
                                       <- Members,
                                   Position =:= 1]
                              of
                              [{LeaderSex, LeaderClasses, LeaderLev} | _] ->
                                  {LeaderSex, LeaderClasses, LeaderLev};
                              _ -> {2, 0, 0}
                          end,
    #rank_rc{id = TeamId, rank = Rank, role_id = Tid,
             platform = Plat, zone_id = ZoneId, name = Name,
             sex = Sex, classes = Classes, lev = Lev,
             val1 = qualification_map_rank_honor(Qua)}.

to_rank_team(#gods_duel_team{id = TeamId, name = Name,
                             leader = LeaderId, member_num = MembersNum,
                             members = Members, fight_capacity = FightCapacity,
                             win_times = WinTimes,
                             qualification = Qualification},
             Rank) ->
    NewMembers = to_rank_team_mate(Members, []),
    #gods_duel_team_rank_data{id = TeamId, name = Name,
                              leader = LeaderId, member_num = MembersNum,
                              members = NewMembers,
                              fight_capacity = FightCapacity,
                              win_times = WinTimes,
                              qualification = Qualification, rank = Rank}.

to_rank_team_mate([], RankTeamMates) -> RankTeamMates;
to_rank_team_mate([#gods_duel_team_mate{id =
                                            Id = {_, P, Z},
                                        name = Name, classes = Classes,
                                        sex = Sex, lev = Lev,
                                        break_times = BreakTimes,
                                        position = Position,
                                        fight_capacity = FightCapacity}
                   | Rest],
                  RankTeamMates) ->
    Looks = case big_world:call(P,
                                Z,
                                role,
                                apply,
                                [sync, Id, {looks, get_looks, []}])
                of
                RoleLooks when is_list(RoleLooks) -> RoleLooks;
                _ ->
                    case big_world:call(P, Z, robot_mgr, get_role, [Id]) of
                        {ok, #robot_role{looks = SLooks}} -> SLooks;
                        _ ->
                            logger:error("取不到角色外观信息:~w",
                                         [Id],
                                         gods_duel_rank,
                                         288),
                            []
                    end
            end,
    RankTeamMate = #gods_duel_team_rank_mate{id = Id,
                                             name = Name, classes = Classes,
                                             sex = Sex, lev = Lev,
                                             break_times = BreakTimes,
                                             position = Position,
                                             fight_capacity = FightCapacity,
                                             looks = Looks},
    to_rank_team_mate(Rest, [RankTeamMate | RankTeamMates]).

group_map_rank_type(1) -> 67;
group_map_rank_type(2) -> 68;
group_map_rank_type(3) -> 69;
group_map_rank_type(4) -> 70;
group_map_rank_type(5) -> 71;
group_map_rank_type(_) -> false.

qualification_map_rank_honor(13) -> 1;
qualification_map_rank_honor(12) -> 2;
qualification_map_rank_honor(11) -> 2;
qualification_map_rank_honor(10) -> 3;
qualification_map_rank_honor(9) -> 4;
qualification_map_rank_honor(8) -> 4;
qualification_map_rank_honor(6) -> 5;
qualification_map_rank_honor(5) -> 6;
qualification_map_rank_honor(_) -> 6.

repair() ->
    case catch ets:lookup(gods_duel_team_rank,
                          gods_duel_team_rank)
        of
        [GodsDuelTeamRank = #gods_duel_team_rank{serial_id = Id,
                                                 history_season_info =
                                                     HisInfo}] ->
            case lists:keyfind(Id, 1, HisInfo) of
                {_, TeamList} ->
                    NewTeamList = repair(TeamList, []),
                    NewHisInfo = lists:keystore(Id,
                                                1,
                                                HisInfo,
                                                {Id, NewTeamList}),
                    NewGodsDuelTeamRank =
                        GodsDuelTeamRank#gods_duel_team_rank{history_season_info
                                                                 = NewHisInfo},
                    ets:insert(gods_duel_team_rank, [NewGodsDuelTeamRank]),
                    big_world:cast(all,
                                   gods_duel_agent,
                                   info,
                                   [{update_team_rank, NewGodsDuelTeamRank}]);
                _ ->
                    logger:error("没有数据", [], gods_duel_rank, 323),
                    ok
            end;
        _ ->
            logger:error("没有数据", [], gods_duel_rank, 327),
            ok
    end.

repair([], TeamList) -> lists:reverse(TeamList);
repair([{GroupId, Teams} | Rest], TeamList) ->
    NewTeams = repair_team(Teams, []),
    repair(Rest, [{GroupId, NewTeams} | TeamList]).

repair_team([], Teams) -> lists:reverse(Teams);
repair_team([GodsDuelTeamRankData =
                 #gods_duel_team_rank_data{members = Members}
             | Rest],
            Teams) ->
    NewMembers = repair_team_mate(Members, []),
    NewGodsDuelTeamRankData =
        GodsDuelTeamRankData#gods_duel_team_rank_data{members =
                                                          NewMembers},
    repair_team(Rest, [NewGodsDuelTeamRankData | Teams]).

repair_team_mate([], Members) -> lists:reverse(Members);
repair_team_mate([GodsDuelTeamRankMate =
                      #gods_duel_team_rank_mate{id = Id = {_, P, Z},
                                                classes = OldClasses}
                  | Rest],
                 Members) ->
    NewClasses = case big_world:call(P,
                                     Z,
                                     robot_mgr,
                                     get_role,
                                     [Id])
                     of
                     {ok, #robot_role{classes = Classes}} -> Classes;
                     _ ->
                         logger:error("取不到角色信息:~w", [Id], gods_duel_rank, 352),
                         OldClasses
                 end,
    NewGodsDuelTeamRankMate =
        GodsDuelTeamRankMate#gods_duel_team_rank_mate{classes =
                                                          NewClasses},
    repair_team_mate(Rest,
                     [NewGodsDuelTeamRankMate | Members]).

