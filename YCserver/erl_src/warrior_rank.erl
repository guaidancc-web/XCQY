-file("src/mod/warrior/warrior_rank.erl", 1).

-module(warrior_rank).

-export([test/0, lookup_rank_test/0]).

-export([init/0,
         update/4,
         lookup_rank/3,
         first/1,
         get_rank/1,
         get_rank/2,
         group_rank/1,
         group_rank_rc/0,
         rank_notice_msg/1,
         rank_reward/1]).

-type tree() :: gb_trees:tree().

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

-file("src/mod/warrior/warrior_rank.erl", 34).

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

-file("src/mod/warrior/warrior_rank.erl", 35).

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

-file("src/mod/warrior/warrior_rank.erl", 36).

-file("inc/honor.hrl", 1).

-record(m_honor,
        {ver = 3,
         use_id = 0,
         last_id = 0,
         r_list = [] :: list(),
         pre_id = 0,
         r_pre_list = [] :: list(),
         pre_reward_list = [] :: list()}).

-record(honor,
        {id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(pre_honor,
        {pre_id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_info,
        {key :: undefined | atom(),
         list = [] :: list(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         mode_type = 0 :: non_neg_integer(),
         show_type = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         is_cast = 0,
         sex = 2 :: non_neg_integer(),
         attr_list = [] :: list(),
         is_can_pre = 0 :: non_neg_integer(),
         collect_val = 0 :: non_neg_integer(),
         color = 12 :: non_neg_integer()}).

-record(pre_honor_base,
        {pre_id = 0 :: non_neg_integer(),
         pre_name = "" :: list(),
         is_cast = 0,
         items = [] :: list(),
         loss_items = [] :: list()}).

-file("src/mod/warrior/warrior_rank.erl", 37).

-file("inc/warrior.hrl", 1).

-record(warrior_ready_zone,
        {cross_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_zone = 0,
         map_plat = "",
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc,
         combat_mode = 1,
         init_combat_mode = 0}).

-record(warrior_zone,
        {cross_id = 0,
         id = 0,
         key,
         group_id = 0 :: pos_integer(),
         seq_id = 0,
         pid,
         is_close = 0}).

-record(warrior_field,
        {id = 0 :: non_neg_integer(),
         key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         seq_id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         map_id = 0,
         map_pid,
         map_plat = "",
         map_zone = 0,
         green_num = 0,
         green_score = 0,
         white_num = 0,
         white_score = 0,
         phase = 0,
         combat_mode = 1}).

-record(warrior_zone_role,
        {id,
         pid,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         field_id = 0,
         camp = 0,
         revive = 0,
         status = 0,
         is_combat = 0,
         combat_pid,
         last_combat_over_time = 0,
         last_role_id,
         win_count = 0,
         combat_count = 0,
         score = 0,
         cross_id = 0}).

-record(warrior,
        {id ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: pid() | undefined,
         name = "" :: string(),
         sex = 0,
         classes = 0,
         face_id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         kill = 0 :: non_neg_integer(),
         multi_kill = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         rank = 0 :: pos_integer(),
         revive = 0 :: non_neg_integer(),
         death = 0 :: non_neg_integer(),
         multi_death = 0 :: non_neg_integer(),
         dead_time = 0 :: non_neg_integer(),
         camp = 0,
         ready_map_id = 0 :: non_neg_integer(),
         ready_map_pid :: pid() | undefined,
         ready_map_plat = "",
         ready_map_zone = 0,
         seq_id = 0 :: non_neg_integer(),
         field_id = 0 :: non_neg_integer(),
         field_map_id = 0 :: non_neg_integer(),
         field_map_plat = "",
         field_map_zone = 0,
         field_pid :: pid() | undefined,
         field_time = 0,
         magic_buff = [] :: list(),
         status = 0,
         looks = [],
         cross_id = 0,
         combat_mode = 1}).

-record(warrior_group_data,
        {id = 0, name = "", order = 0, members = []}).

-record(warrior_win_item_data,
        {base_id = 0,
         weight = 0,
         max = 0,
         is_notice = 0,
         num = 0}).

-record(warrior_drop_item_data,
        {base_id = 0,
         weight = 0,
         result = 0,
         is_notice = 0,
         num = 0}).

-record(warrior_scene_unit,
        {battle_id = 0,
         type = 0,
         sub_type = 0,
         buff_id = 0,
         spec_id = 0,
         item_base_id = 0,
         unit_base_id = 0,
         field_id = 0}).

-record(warrior_buff_data,
        {buff_id = 0, type = 0, unit_base_id = 0, name = ""}).

-record(warrior_magic_buff,
        {buff_id = 0,
         name = "",
         status = 0,
         type = 0,
         x = 0,
         y = 0,
         time = 0,
         owner_id,
         owner_name = "",
         next_owner_id,
         next_owner_pid,
         camp = 0}).

-record(warrior_combat, {pid, field_id = 0, field_key}).

-record(warrior_timer_data,
        {id = 0,
         phase = 0,
         type = 0,
         spec_id = 0,
         buff_id = 0,
         start = 0,
         interval = 0,
         finished = 0,
         num = 0,
         max = 0}).

-record(warrior_combat_result,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         round = 0}).

-record(warrior_combat_win,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         score = 0,
         round = 0,
         id,
         name,
         camp = 0,
         wish_buff = 0}).

-record(warrior_combat_lose,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         score = 0,
         round = 0,
         id,
         name,
         camp = 0,
         revive = 0}).

-record(warrior_embattle,
        {role_id = {0, "", 0}, pets = [], guards = []}).

-record(warrior_rank_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         items = [],
         title = "",
         content = ""}).

-file("src/mod/warrior/warrior_rank.erl", 38).

-file("/usr/local/lib/erlang/lib/eunit-2.2.7/include"
      "/eunit.hrl",
      1).

-file("src/mod/warrior/warrior_rank.erl", 40).

-spec init() -> tree().

init() -> gb_trees:empty().

-spec update(Rid, OldScore, Score,
             Rank) -> tree() when Rid :: {pos_integer(),
                                          string(),
                                          pos_integer()},
                                  Score :: pos_integer(),
                                  OldScore :: pos_integer(), Rank :: tree().

update(Rid, OldScore, Score, Rank) ->
    DelRank = del_old_rank(Rid, OldScore, Rank),
    case gb_trees:lookup(Score, DelRank) of
        {value, List} ->
            DelList = lists:delete(Rid, List),
            NewList = [Rid | DelList],
            gb_trees:update(Score, NewList, DelRank);
        _ -> gb_trees:insert(Score, [Rid], DelRank)
    end.

-spec lookup_rank(Rid, Score,
                  Rank) -> pos_integer() when Rid :: {pos_integer(),
                                                      string(),
                                                      pos_integer()},
                                              Score :: pos_integer(),
                                              Rank :: tree().

lookup_rank(Rid, Score, Rank) ->
    InitRank = 1,
    List = gb_trees:to_list(Rank),
    Reverse = lists:reverse(List),
    lookup_rank(Reverse, Score, Rid, InitRank).

lookup_rank([], _Score, _Rid, _InitRank) -> 1;
lookup_rank([{Score, Value} | _Rest], Score, Rid,
            Seq) ->
    case lists:member(Rid, Value) of
        true -> Seq;
        false ->
            logger:error("[~w]的排名数据错误", [Rid], warrior_rank, 85),
            1
    end;
lookup_rank([{_Key, Value} | Rest], Score, Rid, Seq) ->
    Len = length(Value),
    lookup_rank(Rest, Score, Rid, Seq + Len).

first(Rank) ->
    case gb_trees:is_empty(Rank) of
        false ->
            case gb_trees:largest(Rank) of
                {_, [Rid | _]} -> {ok, Rid};
                _ -> false
            end;
        _ -> false
    end.

get_rank(#role{id = Rid, pid = RolePid}) ->
    case catch ets:lookup(warriors, Rid) of
        [#warrior{field_pid = FieldPid}]
            when is_pid(FieldPid) ->
            warrior:cast(FieldPid, {get_rank, RolePid}),
            ok;
        _ -> false
    end.

get_rank(Num, Rank) ->
    Acc = get_rank(Num, 0, Rank, []),
    Fun = fun (Rid, AccOut) ->
                  case catch ets:lookup(warriors, Rid) of
                      [Warrior = #warrior{}] -> [Warrior | AccOut];
                      _ -> AccOut
                  end
          end,
    lists:foldl(Fun, [], Acc).

get_rank(Num, Seq, _Rank, Acc) when Seq >= Num -> Acc;
get_rank(Num, Seq, Rank, Acc) ->
    case gb_trees:is_empty(Rank) of
        false ->
            case gb_trees:take_largest(Rank) of
                {_, List = [_ | _], RestRank} ->
                    Len = length(List),
                    RestN = Num - Seq,
                    if Len =:= RestN -> List ++ Acc;
                       Len < RestN ->
                           get_rank(Num, Seq + Len, RestRank, List ++ Acc);
                       true ->
                           SubList = lists:sublist(List, 1, RestN),
                           get_rank(Num, Seq + RestN, RestRank, SubList ++ Acc)
                    end;
                {_, [], RestRank} -> get_rank(Num, Seq, RestRank, Acc);
                _Err -> Acc
            end;
        _ -> Acc
    end.

group_rank([]) -> ok;
group_rank([{{{P, Z}, _GroupId}, RankType, RankRc}
            | Rest]) ->
    cross:cast(P,
               Z,
               rank_zone,
               cast,
               [RankType,
                {replace, RankType, RankRc, #{reward => 1}}]),
    group_rank(Rest);
group_rank([H | _Rest]) ->
    logger:error("勇士战场排行榜更新错误[Err:~w]",
                 [H],
                 warrior_rank,
                 158),
    false.

group_rank_rc() ->
    Groups = group_warrior(),
    GroupWarrios = group_rank_type(Groups, []),
    group_rank_rc(GroupWarrios, []).

group_rank_rc([], Acc) -> Acc;
group_rank_rc([{{Dest, GroupId}, RankType, Warriors}
               | Rest],
              Acc) ->
    Sort = rank_sort(Warriors),
    RankRc = to_rank_rc(Sort, []),
    group_rank_rc(Rest,
                  [{{Dest, GroupId}, RankType, RankRc} | Acc]).

rank_notice_msg(GroupRankRc) ->
    rank_notice_msg(GroupRankRc, []).

rank_notice_msg([], Acc) -> lists:reverse(Acc);
rank_notice_msg([{{Dest, GroupId}, RankType, RankRc}
                 | T],
                Acc) ->
    case rank_data:get_honor({RankType, 2}) of
        {_, [#{honor_id := HonorId}]} ->
            case honor_data:get(HonorId) of
                #honor_base{name = HonorName} ->
                    L = lists:sublist(RankRc, 1, 3),
                    NameList = [notice:format("~ts", [{role_2, Name}])
                                || #rank_rc{name = Name} <- L],
                    NameStr = string:join(NameList, "，"),
                    GroupName = warrior_data:group_name(GroupId),
                    Fmt = lang:get("~ts~ts已结束，~ts等10名玩家表现出色，获得称号~ts"),
                    Args = [{string_2, 1, lang:get("勇士战场")},
                            {string_1, GroupName},
                            {string_1, NameStr},
                            {string_2, 1, HonorName}],
                    Msg = notice:format(Fmt, Args),
                    rank_notice_msg(T, [{Dest, Msg} | Acc]);
                _ -> rank_notice_msg(T, Acc)
            end;
        _ -> rank_notice_msg(T, Acc)
    end;
rank_notice_msg([H | T], Acc) ->
    logger:error("无法解析的排行榜格式:~w", [H], warrior_rank, 201),
    rank_notice_msg(T, Acc).

rank_reward([]) -> ok;
rank_reward([{{_Dest, GroupId}, _RankType, RankRc}
             | T]) ->
    rank_reward(GroupId, RankRc, 1),
    rank_reward(T).

rank_reward(_GroupId, [], _) -> ignore;
rank_reward(GroupId, [#rank_rc{id = Id} | T], Rank) ->
    logger:debug("~w",
                 [{GroupId, Rank}],
                 warrior_rank,
                 212),
    case warrior_data:get_rank({GroupId, Rank}) of
        #warrior_rank_reward_data{items = Items, title = Title,
                                  content = Content} ->
            logger:debug("勇士排行奖励: ~w, ~ts, ~ts, ~w",
                         [Id, Title, Content, Items],
                         warrior_rank,
                         215),
            mail:send(Id, Title, Content, Items);
        _ -> ignore
    end,
    rank_reward(GroupId, T, Rank + 1).

group_warrior() ->
    Fun = fun (Warrior = #warrior{group_id = GroupId,
                                  id = {_, P, Z}},
               Acc) ->
                  RealDest = c_mirror:get_zone_mapping(P, Z),
                  case lists:keyfind({RealDest, GroupId}, 1, Acc) of
                      {_, Warriors} ->
                          NewWarriors = [Warrior | Warriors],
                          Classify = {{RealDest, GroupId}, NewWarriors},
                          lists:keystore({RealDest, GroupId}, 1, Acc, Classify);
                      _ -> [{{RealDest, GroupId}, [Warrior]} | Acc]
                  end;
              (_, Acc) -> Acc
          end,
    ets:foldl(Fun, [], warriors).

rank_sort(Warriors) ->
    Sort = util:keys_sort([#warrior.kill, #warrior.score],
                          Warriors),
    rank_sort(Sort, 1, 100, []).

rank_sort([], _Min, _Max, Acc) -> Acc;
rank_sort(_, Max, Max, Acc) -> Acc;
rank_sort([Warrior | T], Min, Max, Acc) ->
    NewWarrior = Warrior#warrior{rank = Min},
    rank_sort(T, Min + 1, Max, [NewWarrior | Acc]).

to_rank_rc([], Acc) -> Acc;
to_rank_rc([Warrior | Rest], Acc) ->
    #warrior{id = Id = {RId, Plat, ZoneId}, rank = Rank,
             name = Name, sex = Sex, classes = Classes, lev = Lev,
             score = Score} =
        Warrior,
    RankRc = #rank_rc{id = Id, rank = Rank, role_id = RId,
                      platform = Plat, zone_id = ZoneId, name = Name,
                      sex = Sex, classes = Classes, lev = Lev, val1 = Score},
    to_rank_rc(Rest, [RankRc | Acc]).

group_rank_type([], Acc) -> Acc;
group_rank_type([{{Dest, GroupId}, Warriors} | T],
                Acc) ->
    case warrior_data:rank_type(GroupId) of
        {RankType, 1} ->
            group_rank_type(T,
                            [{{Dest, GroupId}, RankType, Warriors} | Acc]);
        _ -> group_rank_type(T, Acc)
    end.

del_old_rank(Rid, Score, Rank) ->
    case gb_trees:lookup(Score, Rank) of
        {value, List} ->
            DelList = lists:delete(Rid, List),
            case DelList of
                [_ | _] -> gb_trees:update(Score, DelList, Rank);
                _ -> gb_trees:delete(Score, Rank)
            end;
        _ -> Rank
    end.

lookup_rank_test() ->
    T = init(),
    T1 = update({1, "local", 1}, 0, 100, T),
    T2 = update({2, "local", 1}, 0, 50, T1),
    T3 = update({3, "local", 1}, 0, 500, T2),
    {295,
     fun () ->
             begin
                 fun () ->
                         case lookup_rank(50, {2, "local", 1}, T3) =:= 3 of
                             true -> ok;
                             __V ->
                                 erlang:error({assertion_failed,
                                               [{module, warrior_rank},
                                                {line, 295},
                                                {expression,
                                                 "lookup_rank ( 50 , { 2 , \"local\" , "
                                                 "1 } , T3 ) =:= 3"},
                                                {expected, true},
                                                {value,
                                                 case __V of
                                                     false -> __V;
                                                     _ -> {not_a_boolean, __V}
                                                 end}]})
                         end
                 end()
             end
     end}.


test() -> eunit:test(warrior_rank).