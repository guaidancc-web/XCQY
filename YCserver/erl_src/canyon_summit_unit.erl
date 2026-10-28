-file("src/mod/canyon_summit/canyon_summit_unit.erl",
      1).

-module(canyon_summit_unit).

-export([init/1,
         clear/0,
         clear/1,
         attack/2,
         done_attack/1,
         combat_over/1,
         disturb/1,
         stop_guarding/1,
         guard/2,
         list_all/2,
         calc_duration_and_remain/3,
         get_base_id/1,
         update/1,
         reward_destroy/1,
         set_cd/2,
         get_remain/3,
         get_ratio/3,
         random_hit_one/3]).

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

-file("src/mod/canyon_summit/canyon_summit_unit.erl",
      30).

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

-file("src/mod/canyon_summit/canyon_summit_unit.erl",
      31).

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

-file("src/mod/canyon_summit/canyon_summit_unit.erl",
      32).

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

-file("src/mod/canyon_summit/canyon_summit_unit.erl",
      33).

init(Args) -> do_init(Args, 1).

clear() -> ets:delete_all_objects(canyon_summit_unit).

clear(MatchId) -> do_clear(MatchId, 1).

attack(R = #canyon_summit_role{id = Rid,
                               group_id = GroupId, side = Side,
                               match_id = MatchId, cannon_used = Last,
                               pid = Pid, last_killed = LastKilled,
                               last_win = LastWin},
       {_, Uid = 7}) ->
    Now = date:unixtime(),
    case lookup({GroupId, MatchId, 7}) of
        _ when Now - Last < 20 ->
            {false,
             notice:format(lang:get("炮塔处于冷却中，请~ts秒后再操作"),
                           [{string_2, 5, 20 - (Now - Last)}])};
        _ when Now - LastKilled < 90 ->
            {false,
             notice:format(lang:get("刚刚战败了，请稍后~ts秒"),
                           [{string_2, 5, 90 - (Now - LastKilled)}])};
        _ when Now - LastWin < 10 ->
            {false,
             notice:format(lang:get("刚刚胜利一场，请稍后~ts秒"),
                           [{string_2, 5, 10 - (Now - LastWin)}])};
        [#canyon_summit_unit{last_operated = LastOp}]
            when Now - LastOp < 5 ->
            {false,
             notice:format(lang:get("炮塔处于冷却中，请~ts秒后再操作"),
                           [{string_2, 5, 5 - (Now - LastOp)}])};
        [U = #canyon_summit_unit{operators = Operators,
                                 match_id = MatchId}] ->
            case lists:keyfind(Side,
                               #canyon_summit_operator.side,
                               Operators)
                of
                #canyon_summit_operator{name = OName, timeout = Timeout}
                    when Timeout + 5 >= Now ->
                    {false,
                     notice:format(lang:get("我方~ts带领的队伍正在操作炮塔，请稍后再试"),
                                   [{role_2, OName}])};
                _ ->
                    logger:debug("开始时间 ~w, ~w",
                                 [Now, U],
                                 canyon_summit_unit,
                                 65),
                    R1 = disturb(R),
                    Op1 = to(operator, R1),
                    Operators1 = lists:keydelete(Rid,
                                                 #canyon_summit_operator.id,
                                                 Operators),
                    case
                        lists:keytake(canyon_summit_util:get_opposite_side(Side),
                                      #canyon_summit_operator.side,
                                      Operators1)
                        of
                        {value, Rival, NewOperators} ->
                            update(U#canyon_summit_unit{operators =
                                                            NewOperators}),
                            {ok, Rival};
                        _ ->
                            NewOperators = [Op1],
                            update(U#canyon_summit_unit{operators =
                                                            NewOperators}),
                            role:apply(async,
                                       Pid,
                                       {canyon_summit_role,
                                        role_callback,
                                        [{unit_action, 1}]}),
                            {ok,
                             R1#canyon_summit_role{operating_unit = Uid,
                                                   cannon_used = Now}}
                    end
            end;
        _ -> {false, lang:get("找不到操作单位")}
    end;
attack(R = #canyon_summit_role{side = Side, id = Rid,
                               group_id = GroupId, match_id = MatchId,
                               last_operated = Last, pid = Pid,
                               last_killed = LastKilled, last_win = LastWin},
       {_, Uid}) ->
    Now = date:unixtime(),
    case lookup({GroupId, MatchId, Uid}) of
        _ when Now - Last < 55 ->
            {false,
             notice:format(lang:get("刚进攻过水晶塔，请先休息~ts秒再操作"),
                           [{string_2, 5, 55 - (Now - Last)}])};
        _ when Now - LastKilled < 90 ->
            {false,
             notice:format(lang:get("刚刚战败了，请稍后~ts秒"),
                           [{string_2, 5, 90 - (Now - LastKilled)}])};
        _ when Now - LastWin < 10 ->
            {false,
             notice:format(lang:get("刚刚胜利一场，请稍后~ts秒"),
                           [{string_2, 5, 10 - (Now - LastWin)}])};
        [#canyon_summit_unit{side = Side}] ->
            {false, lang:get("不能攻击自家的塔")};
        [#canyon_summit_unit{duration = 0}] ->
            {false,
             lang:get("这座水晶塔已经没有生命值了，向<color='#ffff00'>下一座水晶塔</color"
                      ">进攻吧！{face_1,7}")};
        [U = #canyon_summit_unit{operators = Operators,
                                 group_id = GroupId, match_id = MatchId}] ->
            case check_attack(GroupId, MatchId, Side, Uid) of
                ok ->
                    R1 = disturb(R),
                    R2 = R1#canyon_summit_role{operating_unit = Uid,
                                               last_operated = Now},
                    Op1 = to(operator, R2),
                    Operators1 = lists:keydelete(Rid,
                                                 #canyon_summit_operator.id,
                                                 Operators),
                    case
                        lists:keytake(canyon_summit_util:get_opposite_side(Side),
                                      #canyon_summit_operator.side,
                                      Operators1)
                        of
                        {value, Rival, NewOperators} ->
                            update(U#canyon_summit_unit{operators =
                                                            NewOperators}),
                            RematchFlag = 0,
                            {ok, R2, Rival, RematchFlag};
                        _ ->
                            logger:debug("进行二次匹配", [], canyon_summit_unit, 109),
                            case rematch(GroupId,
                                         MatchId,
                                         canyon_summit_util:get_opposite_side(Side),
                                         Side)
                                of
                                {ok, NewRival} ->
                                    RematchFlag = 1,
                                    {ok, R2, NewRival, RematchFlag};
                                {_, Reason} ->
                                    logger:debug("二次匹配失败：~w",
                                                 [Reason],
                                                 canyon_summit_unit,
                                                 115),
                                    NewOperators = lists:keystore(Rid,
                                                                  #canyon_summit_operator.id,
                                                                  Operators1,
                                                                  Op1),
                                    update(U#canyon_summit_unit{operators =
                                                                    NewOperators}),
                                    role:apply(async,
                                               Pid,
                                               {canyon_summit_role,
                                                role_callback,
                                                [{unit_action, 1}]}),
                                    {ok, R2}
                            end
                    end;
                Else -> Else
            end;
        _ -> {false, lang:get("找不到操作单位")}
    end.

done_attack(#canyon_summit_role{operating_unit = 0}) ->
    {false, lang:get("当前不在操作中")};
done_attack(#canyon_summit_role{movability = 0}) ->
    {false, lang:get("行动力不足")};
done_attack(R = #canyon_summit_role{id = Rid,
                                    operating_unit = Uid = 7,
                                    match_id = MatchId, side = Side,
                                    movability = Mb, last_operated = Ready,
                                    pid = Pid, attacked_unit = Done,
                                    cannon_attacked = DoneCannon,
                                    group_id = GroupId, score = OldScore}) ->
    Now = date:unixtime(),
    case lookup({GroupId, MatchId, Uid}) of
        _ when Now - Ready < 20 -> {false, lang:get("还没准备好")};
        [U = #canyon_summit_unit{operators = Operators,
                                 match_id = MatchId}] ->
            NewOperators = lists:keydelete(Rid,
                                           #canyon_summit_operator.id,
                                           Operators),
            update(U#canyon_summit_unit{operators = NewOperators,
                                        last_operated = Now}),
            case random_hit_one(GroupId,
                                MatchId,
                                canyon_summit_util:get_opposite_side(Side))
                of
                {ok,
                 TU = #canyon_summit_unit{duration = Duration,
                                          id = {_, _, TUid}}} ->
                    Dmg = get_dmg(300, GroupId, MatchId, Side),
                    Msg =
                        notice:format(lang:get("开炮成功，敌方~ts-~ts耐久，消耗~ts点行动力，获得个人积分~ts"),
                                      [{unit_1, get_base_id(TUid)},
                                       {string_2, 1, Dmg},
                                       {string_2, 1, 20},
                                       {string_2, 1, 10}]),
                    notice:send({pid, Pid}, 3, Msg),
                    NewTU = TU#canyon_summit_unit{duration =
                                                      max(0, Duration - Dmg),
                                                  last_operated = Now},
                    update(NewTU),
                    NewR = R#canyon_summit_role{operating_unit = 0,
                                                movability = max(1, Mb - 20),
                                                attacked_unit = Done + 1,
                                                cannon_attacked =
                                                    DoneCannon + 1,
                                                operating_num = 0,
                                                score = OldScore + 25},
                    logger:debug("攻击时间 ~w, ~w",
                                 [Now, U],
                                 canyon_summit_unit,
                                 150),
                    {ok, NewR, NewTU, Dmg};
                _Err -> {false, lang:get("对方单位都没耐久了")}
            end;
        _ -> {false, lang:get("找不到操作单位")}
    end;
done_attack(R = #canyon_summit_role{id = Rid,
                                    operating_unit = Uid, match_id = MatchId,
                                    movability = Mb, pid = Pid,
                                    last_operated = Ready, attacked_unit = Done,
                                    side = Side, operating_num = OpNum,
                                    group_id = GroupId, score = OldScore}) ->
    Now = date:unixtime(),
    case lookup({GroupId, MatchId, Uid}) of
        _ when Now - Ready < 20 -> {false, lang:get("还没准备好")};
        [#canyon_summit_unit{duration = 0}] ->
            {false,
             lang:get("这座水晶塔已经没有生命值了，向<color='#ffff00'>下一座水晶塔</color"
                      ">进攻吧！{face_1,7}")};
        [U = #canyon_summit_unit{operators = Operators,
                                 match_id = MatchId, duration = Duration}] ->
            NewOperators = lists:keydelete(Rid,
                                           #canyon_summit_operator.id,
                                           Operators),
            Dmg1 = get_dmg(40, GroupId, MatchId, Side),
            Dmg = round(Dmg1 * get_operating_factor(OpNum)),
            NewU = U#canyon_summit_unit{operators = NewOperators,
                                        duration = max(0, Duration - Dmg)},
            update(NewU),
            Msg =
                notice:format(lang:get("进攻成功，~ts-~ts耐久，消耗~ts点行动力，获得个人积分~ts"),
                              [{unit_1, get_base_id(Uid)},
                               {string_2, 1, Dmg},
                               {string_2, 1, 10},
                               {string_2, 1, 10}]),
            notice:send({pid, Pid}, 3, Msg),
            {ok,
             R#canyon_summit_role{operating_unit = 0,
                                  movability = max(1, Mb - 10),
                                  attacked_unit = Done + 1, operating_num = 0,
                                  score = OldScore + 10},
             NewU,
             Dmg};
        _ -> {false, lang:get("找不到操作单位")}
    end.

combat_over(#canyon_summit_role{operating_unit = 0}) ->
    ok;
combat_over(R = #canyon_summit_role{operating_unit =
                                        7}) ->
    {ok, R#canyon_summit_role{operating_unit = 0}};
combat_over(R = #canyon_summit_role{id = Rid,
                                    operating_unit = Uid, score = OldScore,
                                    match_id = MatchId, movability = Mb,
                                    pid = Pid, side = Side,
                                    operating_num = OpNum,
                                    group_id = GroupId}) ->
    case lookup({GroupId, MatchId, Uid}) of
        [#canyon_summit_unit{duration = 0}] ->
            {false,
             lang:get("这座水晶塔已经没有生命值了，向<color='#ffff00'>下一座水晶塔</color"
                      ">进攻吧！{face_1,7}")};
        [U = #canyon_summit_unit{operators = Operators,
                                 match_id = MatchId, duration = Duration}] ->
            NewOperators = lists:keydelete(Rid,
                                           #canyon_summit_operator.id,
                                           Operators),
            Dmg1 = get_dmg(60, GroupId, MatchId, Side),
            Dmg = round(Dmg1 * get_operating_factor(OpNum)),
            EndDuration = max(0, Duration - Dmg),
            ExtScore = case EndDuration of
                           0 -> 10;
                           _ -> 0
                       end,
            NewU = U#canyon_summit_unit{operators = NewOperators,
                                        duration = max(0, Duration - Dmg)},
            update(NewU),
            Msg =
                notice:format(lang:get("进攻成功，~ts-~ts耐久，消耗~ts点行动力"),
                              [{unit_1, get_base_id(Uid)},
                               {string_2, 1, Dmg},
                               {string_2, 1, 10}]),
            notice:send({pid, Pid}, 3, Msg),
            {ok,
             R#canyon_summit_role{operating_unit = 0,
                                  score = OldScore + ExtScore,
                                  movability = max(1, Mb - 10)},
             NewU,
             Dmg};
        _ -> {false, lang:get("找不到操作单位")}
    end.

disturb(R = #canyon_summit_role{operating_unit = 0}) ->
    stop_guarding(R);
disturb(R = #canyon_summit_role{id = Rid,
                                operating_unit = Uid, match_id = MatchId,
                                pid = Pid, group_id = GroupId}) ->
    case lookup({GroupId, MatchId, Uid}) of
        [U = #canyon_summit_unit{operators = Operators}] ->
            NewOperators = lists:keydelete(Rid,
                                           #canyon_summit_operator.id,
                                           Operators),
            update(U#canyon_summit_unit{operators = NewOperators}),
            role:apply(async,
                       Pid,
                       {canyon_summit_role,
                        role_callback,
                        [{unit_action, 0}]}),
            case Uid of
                7 ->
                    stop_guarding(R#canyon_summit_role{operating_unit = 0,
                                                       cannon_used = 0});
                _ ->
                    stop_guarding(R#canyon_summit_role{operating_unit = 0,
                                                       last_operated = 0})
            end;
        _ -> stop_guarding(R)
    end.

stop_guarding(R = #canyon_summit_role{guarding_unit =
                                          0}) ->
    R;
stop_guarding(R = #canyon_summit_role{id = Rid,
                                      guarding_unit = Uid, match_id = MatchId,
                                      pid = Pid, group_id = GroupId}) ->
    case lookup({GroupId, MatchId, Uid}) of
        [U = #canyon_summit_unit{operators = Operators}] ->
            NewOperators = lists:keydelete(Rid,
                                           #canyon_summit_operator.id,
                                           Operators),
            update(U#canyon_summit_unit{operators = NewOperators}),
            role:apply(async,
                       Pid,
                       {canyon_summit_role,
                        role_callback,
                        [{unit_action, 0}]}),
            R#canyon_summit_role{guarding_unit = 0};
        _ -> R#canyon_summit_role{guarding_unit = 0}
    end.

guard(R = #canyon_summit_role{id = Rid, side = Side,
                              match_id = MatchId, pid = Pid,
                              group_id = GroupId},
      {_, Uid}) ->
    case lookup({GroupId, MatchId, Uid}) of
        [#canyon_summit_unit{side = USide}]
            when USide =/= Side ->
            {false, lang:get("这不是自家的塔")};
        [U = #canyon_summit_unit{operators = Operators,
                                 group_id = GroupId, match_id = MatchId}] ->
            case check_guard(GroupId, MatchId, Side, Uid) of
                ok ->
                    R1 = disturb(R),
                    Op1 = to(operator, R1),
                    Operators1 = lists:keydelete(Rid,
                                                 #canyon_summit_operator.id,
                                                 Operators),
                    case
                        lists:keytake(canyon_summit_util:get_opposite_side(Side),
                                      #canyon_summit_operator.side,
                                      Operators1)
                        of
                        {value, Rival, NewOperators} ->
                            update(U#canyon_summit_unit{operators =
                                                            NewOperators}),
                            RematchFlag = 0,
                            {ok, Rival, RematchFlag};
                        _ ->
                            logger:debug("进行二次匹配", [], canyon_summit_unit, 253),
                            case rematch(GroupId, MatchId, Side, Side) of
                                {ok, NewRival} ->
                                    RematchFlag = 1,
                                    {ok, NewRival, RematchFlag};
                                {_, Reason} ->
                                    logger:debug("二次匹配失败：~w",
                                                 [Reason],
                                                 canyon_summit_unit,
                                                 259),
                                    NewOperators = lists:keystore(Rid,
                                                                  #canyon_summit_operator.id,
                                                                  Operators1,
                                                                  Op1),
                                    update(U#canyon_summit_unit{operators =
                                                                    NewOperators}),
                                    role:apply(async,
                                               Pid,
                                               {canyon_summit_role,
                                                role_callback,
                                                [{unit_action, 2}]}),
                                    {ok,
                                     R1#canyon_summit_role{guarding_unit = Uid}}
                            end
                    end;
                Else -> Else
            end;
        _ -> {false, lang:get("找不到操作单位")}
    end.

list_all(GroupId, MatchId) ->
    do_list_towers(lists:seq(1, 6), GroupId, MatchId).

calc_duration_and_remain(Side, GroupId, MatchId) ->
    Units = list_towers(Side, GroupId, MatchId),
    Duration = lists:sum([D
                          || #canyon_summit_unit{duration = D} <- Units]),
    Num = erlang:length([D
                         || #canyon_summit_unit{duration = D} <- Units, D > 0]),
    {Duration, Num}.

lookup(Id) -> ets:lookup(canyon_summit_unit, Id).

update(U = #canyon_summit_unit{}) ->
    ets:insert(canyon_summit_unit, U),
    ok.

reward_destroy(#canyon_summit_unit{id = {_, _, Uid},
                                   group_id = GroupId, duration = 0,
                                   side = Side, match_id = MatchId}) ->
    case ets:lookup(canyon_summit_side,
                    {GroupId,
                     MatchId,
                     canyon_summit_util:get_opposite_side(Side)})
        of
        [#canyon_summit_side{members = Mems}] ->
            do_reward_destroy(Mems, get_base_id(Uid));
        _ -> ok
    end;
reward_destroy(_) -> ok.

set_cd(MateIds, Uid) ->
    set_cd(MateIds, Uid, date:unixtime()).

set_cd([], _, _) -> ok;
set_cd([Id = {_, P, Z} | T], Uid, Now) ->
    case ets:lookup(canyon_summit_role, Id) of
        [R = #canyon_summit_role{}] when Uid =:= 7 ->
            R1 = R#canyon_summit_role{cannon_used = Now},
            canyon_summit_mgr:update(canyon_summit_role, R1),
            cross:cast(P,
                       Z,
                       canyon_summit_agent,
                       sync_update,
                       [canyon_summit_role, R1]);
        [R = #canyon_summit_role{}] ->
            R1 = R#canyon_summit_role{last_operated = Now},
            canyon_summit_mgr:update(canyon_summit_role, R1),
            cross:cast(P,
                       Z,
                       canyon_summit_agent,
                       sync_update,
                       [canyon_summit_role, R1]);
        _ -> ok
    end,
    set_cd(T, Uid, Now).

get_remain(GroupId, MatchId, Side) ->
    case ets:lookup(canyon_summit_side,
                    {GroupId, MatchId, Side})
        of
        [#canyon_summit_side{remain_unit = U1}] -> U1;
        _ -> 0
    end.

get_ratio(GroupId, MatchId, Side) ->
    US = case ets:lookup(canyon_summit_side,
                         {GroupId, MatchId, Side})
             of
             [#canyon_summit_side{remain_unit = U1}] -> U1;
             _ -> 0
         end,
    UT = case ets:lookup(canyon_summit_side,
                         {GroupId,
                          MatchId,
                          canyon_summit_util:get_opposite_side(Side)})
             of
             [#canyon_summit_side{remain_unit = U2}] -> U2;
             _ -> 0
         end,
    {US, UT}.

get_base_id(1) -> 79571;
get_base_id(2) -> 79572;
get_base_id(3) -> 79573;
get_base_id(4) -> 79574;
get_base_id(5) -> 79575;
get_base_id(6) -> 79576;
get_base_id(7) -> 79579.

do_init(_Args, Id) when Id > 7 -> ok;
do_init(#{battle_id := BattleId, match_id := MatchId,
          group_id := GroupId},
        Id = 7) ->
    U = #canyon_summit_unit{id = {GroupId, MatchId, Id},
                            side = 0, match_id = MatchId, group_id = GroupId,
                            battle_id = BattleId},
    update(U),
    ok;
do_init(Args = #{battle_id := BattleId,
                 match_id := MatchId, group_id := GroupId},
        Id) ->
    Side = case lists:member(Id, [1, 2, 3]) of
               true -> 1;
               _ -> 2
           end,
    Duration = canyon_summit_data:get_unit_duration(Id),
    U = #canyon_summit_unit{id = {GroupId, MatchId, Id},
                            side = Side, match_id = MatchId, group_id = GroupId,
                            battle_id = BattleId, duration = Duration},
    update(U),
    do_init(Args, Id + 1).

do_clear(_, Id) when Id > 7 -> ok;
do_clear(MatchId, Id) ->
    ets:delete(canyon_summit_unit, {MatchId, Id}),
    do_clear(MatchId, Id + 1).

to(operator,
   #canyon_summit_role{id = Id, name = Name,
                       classes = Classes, sex = Sex, side = Side,
                       lev = Lev}) ->
    #canyon_summit_operator{id = Id, name = Name,
                            classes = Classes, sex = Sex, side = Side,
                            lev = Lev, timeout = date:unixtime() + 20}.

random_hit_one(GroupId, MatchId, Side) ->
    case [U
          || U = #canyon_summit_unit{duration = D}
                 <- list_towers(Side, GroupId, MatchId),
             D > 0]
        of
        [U = #canyon_summit_unit{} | _] -> {ok, U};
        _ -> {false, lang:get("找不到随机单位")}
    end.

list_towers(1, GroupId, MatchId) ->
    do_list_towers([1, 2, 3], GroupId, MatchId);
list_towers(_, GroupId, MatchId) ->
    do_list_towers([4, 5, 6], GroupId, MatchId).

do_list_towers([], _GroupId, _MatchId) -> [];
do_list_towers([Id | T], GroupId, MatchId) ->
    case lookup({GroupId, MatchId, Id}) of
        [U = #canyon_summit_unit{}] ->
            [U | do_list_towers(T, GroupId, MatchId)];
        _ -> do_list_towers(T, GroupId, MatchId)
    end.

do_reward_destroy([], _BaseId) -> ok;
do_reward_destroy([Id | T], BaseId) ->
    case ets:lookup(canyon_summit_role, Id) of
        [#canyon_summit_role{pid = Pid}] when is_pid(Pid) ->
            role:apply(async,
                       Pid,
                       {canyon_summit_role,
                        role_callback,
                        [{reward_destroy, BaseId}]});
        _ -> ok
    end,
    do_reward_destroy(T, BaseId).

rematch(GroupId, MatchId, Side, TargetSide) ->
    case get_attack_unit(GroupId, MatchId, Side) of
        TargetUid when TargetUid =/= 0 ->
            case lookup({GroupId, MatchId, TargetUid}) of
                [U = #canyon_summit_unit{operators = Operators,
                                         group_id = GroupId,
                                         match_id = MatchId}] ->
                    case
                        lists:keytake(canyon_summit_util:get_opposite_side(TargetSide),
                                      #canyon_summit_operator.side,
                                      Operators)
                        of
                        {value, Rival, NewOperators} ->
                            logger:debug("获取到可进攻角色：~w",
                                         [Rival],
                                         canyon_summit_unit,
                                         430),
                            update(U#canyon_summit_unit{operators =
                                                            NewOperators}),
                            {ok, Rival};
                        _ -> {false, lang:get("对方没有可进攻队伍")}
                    end;
                _ -> {false, lang:get("找不到操作单位")}
            end;
        _ -> {false, lang:get("获取目标塔出错")}
    end.

get_attack_unit(GroupId, MatchId, Side) ->
    Ids = case canyon_summit_util:get_opposite_side(Side) of
              1 -> [1, 2, 3];
              _ -> [4, 5, 6]
          end,
    TargetUnit = 0,
    do_get_attack_unit(lists:reverse(Ids),
                       GroupId,
                       MatchId,
                       TargetUnit).

do_get_attack_unit([], _, _, TargetUnit) -> TargetUnit;
do_get_attack_unit([Id | T], GroupId, MatchId,
                   TargetUnit) ->
    case lookup({GroupId, MatchId, Id}) of
        [#canyon_summit_unit{duration = D}] when D > 0 ->
            do_get_attack_unit(T, GroupId, MatchId, Id);
        _ -> do_get_attack_unit(T, GroupId, MatchId, TargetUnit)
    end.

check_attack(GroupId, MatchId, Side, Uid) ->
    Ids = case canyon_summit_util:get_opposite_side(Side) of
              1 -> [1, 2, 3];
              _ -> [4, 5, 6]
          end,
    do_check_attack(Ids, GroupId, MatchId, Uid).

do_check_attack([], _, _, _) -> ok;
do_check_attack([Uid | _], _, _, Uid) -> ok;
do_check_attack([Id | T], GroupId, MatchId, Uid) ->
    case lookup({GroupId, MatchId, Id}) of
        [#canyon_summit_unit{duration = D}] when D > 0 ->
            {false,
             notice:format(lang:get("请先摧毁敌方~ts"),
                           [{unit_1, get_base_id(Id)}])};
        _ -> do_check_attack(T, GroupId, MatchId, Uid)
    end.

check_guard(GroupId, MatchId, Side, Uid) ->
    Ids = case Side of
              1 -> [1, 2, 3];
              _ -> [4, 5, 6]
          end,
    do_check_guard(Ids, GroupId, MatchId, Uid).

do_check_guard([], _, _, _) -> ok;
do_check_guard([Uid | _], _, _, Uid) -> ok;
do_check_guard([Id | T], GroupId, MatchId, Uid) ->
    case lookup({GroupId, MatchId, Id}) of
        [#canyon_summit_unit{duration = D}] when D > 0 ->
            {false,
             notice:format(lang:get("该水晶塔无需防御，请先前往~ts增援"),
                           [{unit_1, get_base_id(Id)}])};
        _ -> do_check_guard(T, GroupId, MatchId, Uid)
    end.

get_dmg(Dmg, GroupId, MatchId, Side) ->
    {US, UT} = get_ratio(GroupId, MatchId, Side),
    round(Dmg * get_dmg_rate(US - UT)).

get_dmg_rate(1) -> 8.49999999999999977796e-1;
get_dmg_rate(2) -> 6.99999999999999955591e-1;
get_dmg_rate(_) -> 1.

get_operating_factor(5) -> 1;
get_operating_factor(4) -> 8.0e-1;
get_operating_factor(_) -> 5.99999999999999977796e-1.

