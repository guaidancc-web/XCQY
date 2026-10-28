-file("src/mod/guild/guild_league_unit.erl", 1).

-module(guild_league_unit).

-export([init/1,
         clear/0,
         clear/1,
         attack/2,
         done_attack/1,
         combat_over/1,
         disturb/1,
         stop_guarding/1,
         guard/2,
         list_all/1,
         calc_duration_and_remain/2,
         get_base_id/1,
         update/1,
         reward_destroy/1,
         set_cd/2,
         get_remain/2,
         get_ratio/2]).

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

-file("src/mod/guild/guild_league_unit.erl", 29).

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

-file("src/mod/guild/guild_league_unit.erl", 30).

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

-file("src/mod/guild/guild_league_unit.erl", 31).

-file("inc/guild_league.hrl", 1).

-record(guild_league_role,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         to_war = 0,
         movability = 500 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         side = 1,
         pid :: undefined | reference(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         key = {{0, "", 0}, 0},
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         is_trump = 0,
         operating_unit = 0 :: 0 | tuple(),
         last_operated = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         cannon_attacked = 0 :: non_neg_integer(),
         cannon_used = 0 :: non_neg_integer(),
         guarding_unit = 0 :: non_neg_integer(),
         operating_num = 0 :: non_neg_integer()}).

-record(guild_league_guild,
        {id = {0, "", 0} :: tuple(),
         key = {{0, "", 0}, 0, 0},
         ver = 5,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         match_id = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         phase = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         order = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         strenth = 0 :: non_neg_integer(),
         members = [],
         trumps = [],
         attacked_unit = 0 :: non_neg_integer(),
         consecutive_win = 0 :: non_neg_integer(),
         season_consecutive_win = 0 :: non_neg_integer(),
         avg_lev = 0 :: non_neg_integer(),
         eliminated = 8 :: non_neg_integer()}).

-record(guild_league_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         battle_id = 0 :: non_neg_integer(),
         battle_pid = 0 :: pid(),
         win_side = 0,
         time = 0 :: non_neg_integer(),
         phase = 0,
         season = 0 :: non_neg_integer(),
         combat_time = 0,
         is_judge = false,
         can_join = false,
         cannon_ready = false,
         later_phase = 0 :: non_neg_integer(),
         grade = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer()}).

-record(guild_league_alliance,
        {id = {0, 0} :: {integer(), integer()},
         gids = [] :: list(),
         names = [],
         totems = [] :: list(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         match_id = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         remain_unit = 3 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         subsidize_buff = [] :: list()}).

-record(guild_league_trump,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         pos = 1 :: non_neg_integer()}).

-record(guild_league_unit,
        {id = {0, 0} :: tuple(),
         phase = 0,
         season = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         battle_id = 0 :: non_neg_integer(),
         side = 0,
         duration = 1000 :: non_neg_integer(),
         operators = [] :: list(),
         last_operated = 0 :: non_neg_integer()}).

-record(guild_league_operator,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         side = 0,
         timeout = 0 :: non_neg_integer()}).

-record(guild_league_summary,
        {id = {0, "", 0} :: tuple(),
         ver = 4,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         member_num = 0 :: non_neg_integer(),
         season_win = 0 :: non_neg_integer(),
         season_lost = 0 :: non_neg_integer(),
         season_draw = 0 :: non_neg_integer(),
         total_win = 0 :: non_neg_integer(),
         totem = 0 :: non_neg_integer(),
         season_score = 0 :: non_neg_integer(),
         total_score = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         rank = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         order = 0 :: non_neg_integer(),
         recent_matchs = [] :: list(),
         absence = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         last_result = 0 :: non_neg_integer(),
         strenth = 0 :: non_neg_integer(),
         consecutive_win = 0 :: non_neg_integer(),
         season_consecutive_win = 0 :: non_neg_integer(),
         eliminated = 8 :: non_neg_integer()}).

-record(guild_league_guess,
        {id = {0, "", 0} :: tuple(),
         ver = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(guild_league_guess_choice,
        {gid = {0, "", 0} :: tuple(),
         phase = 0 :: non_neg_integer(),
         bingo = 0 :: 0..2}).

-record(guild_league_poll,
        {gid = {0, "", 0} :: tuple(),
         phase = 0 :: non_neg_integer(),
         voted = 0 :: non_neg_integer()}).

-record(guild_league_live,
        {id = 0 :: non_neg_integer(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         grade = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         names1 = [] :: string(),
         names2 = [] :: string(),
         logs = [] :: list()}).

-record(guild_league_champion,
        {season = 0 :: non_neg_integer(), top3 = []}).

-file("src/mod/guild/guild_league_unit.erl", 32).

init(Args) -> do_init(Args, 1).

clear() -> ets:delete_all_objects(guild_league_unit).

clear(MatchId) -> do_clear(MatchId, 1).

attack(R = #guild_league_role{id = Rid, side = Side,
                              match_id = MatchId, cannon_used = Last, pid = Pid,
                              last_killed = LastKilled, last_win = LastWin},
       {_, Uid = 7}) ->
    Now = date:unixtime(),
    case lookup({MatchId, 7}) of
        _ when Now - Last < 20 ->
            {false,
             notice:format(lang:get("炮塔处于冷却中，请~ts秒后再操作"),
                           [{string_2, 5, 20 - (Now - Last)}])};
        _ when Now - LastKilled < 90 ->
            {false,
             notice:format(lang:get("刚刚战败了，请稍后~ts秒"),
                           [{string_2, 5, 90 - (Now - LastKilled)}])};
        _ when Now - LastWin < 30 ->
            {false,
             notice:format(lang:get("刚刚胜利一场，请稍后~ts秒"),
                           [{string_2, 5, 30 - (Now - LastWin)}])};
        [#guild_league_unit{last_operated = LastOp}]
            when Now - LastOp < 180 ->
            {false,
             notice:format(lang:get("炮塔处于冷却中，请~ts秒后再操作"),
                           [{string_2, 5, 180 - (Now - LastOp)}])};
        [U = #guild_league_unit{operators = Operators,
                                match_id = MatchId}] ->
            case lists:keyfind(Side,
                               #guild_league_operator.side,
                               Operators)
                of
                #guild_league_operator{name = OName, timeout = Timeout}
                    when Timeout + 5 >= Now ->
                    {false,
                     notice:format(lang:get("我方~ts带领的队伍正在操作炮塔，请稍后再试"),
                                   [{role_2, OName}])};
                _ ->
                    logger:debug("开始时间 ~w, ~w",
                                 [Now, U],
                                 guild_league_unit,
                                 64),
                    R1 = disturb(R),
                    Op1 = to(operator, R1),
                    Operators1 = lists:keydelete(Rid,
                                                 #guild_league_operator.id,
                                                 Operators),
                    case
                        lists:keytake(guild_league_guild:get_opposite_side(Side),
                                      #guild_league_operator.side,
                                      Operators1)
                        of
                        {value, Rival, NewOperators} ->
                            update(U#guild_league_unit{operators =
                                                           NewOperators}),
                            {ok, Rival};
                        _ ->
                            NewOperators = [Op1],
                            update(U#guild_league_unit{operators =
                                                           NewOperators}),
                            role:apply(async,
                                       Pid,
                                       {guild_league_role,
                                        callback,
                                        [{unit_action, 1}]}),
                            {ok,
                             R1#guild_league_role{operating_unit = Uid,
                                                  cannon_used = Now}}
                    end
            end;
        _ -> {false, lang:get("找不到操作单位")}
    end;
attack(R = #guild_league_role{side = Side, id = Rid,
                              match_id = MatchId, last_operated = Last,
                              pid = Pid, last_killed = LastKilled,
                              last_win = LastWin},
       {_, Uid}) ->
    Now = date:unixtime(),
    case lookup({MatchId, Uid}) of
        _ when Now - Last < 20 * 2 ->
            {false,
             notice:format(lang:get("刚进攻过水晶塔，请先休息~ts秒再操作"),
                           [{string_2, 5, 20 * 2 - (Now - Last)}])};
        _ when Now - LastKilled < 90 ->
            {false,
             notice:format(lang:get("刚刚战败了，请稍后~ts秒"),
                           [{string_2, 5, 90 - (Now - LastKilled)}])};
        _ when Now - LastWin < 30 ->
            {false,
             notice:format(lang:get("刚刚胜利一场，请稍后~ts秒"),
                           [{string_2, 5, 30 - (Now - LastWin)}])};
        [#guild_league_unit{side = Side}] ->
            {false, lang:get("不能攻击自家的塔")};
        [#guild_league_unit{duration = 0}] ->
            {false, lang:get("这个塔已经没有耐久了")};
        [U = #guild_league_unit{operators = Operators,
                                match_id = MatchId}] ->
            case check_attack(MatchId, Side, Uid) of
                ok ->
                    R1 = disturb(R),
                    R2 = R1#guild_league_role{operating_unit = Uid,
                                              last_operated = Now},
                    Op1 = to(operator, R2),
                    Operators1 = lists:keydelete(Rid,
                                                 #guild_league_operator.id,
                                                 Operators),
                    case
                        lists:keytake(guild_league_guild:get_opposite_side(Side),
                                      #guild_league_operator.side,
                                      Operators1)
                        of
                        {value, Rival, NewOperators} ->
                            update(U#guild_league_unit{operators =
                                                           NewOperators}),
                            {ok, R2, Rival};
                        _ ->
                            role:apply(async,
                                       Pid,
                                       {guild_league_role,
                                        callback,
                                        [{unit_action, 1}]}),
                            NewOperators = lists:keystore(Rid,
                                                          #guild_league_operator.id,
                                                          Operators1,
                                                          Op1),
                            update(U#guild_league_unit{operators =
                                                           NewOperators}),
                            {ok, R2}
                    end;
                Else -> Else
            end;
        _ -> {false, lang:get("找不到操作单位")}
    end.

done_attack(#guild_league_role{operating_unit = 0}) ->
    {false, lang:get("当前不在操作中")};
done_attack(#guild_league_role{movability = 0}) ->
    {false, lang:get("行动力不足")};
done_attack(R = #guild_league_role{id = Rid,
                                   operating_unit = Uid = 7, match_id = MatchId,
                                   side = Side, movability = Mb,
                                   last_operated = Ready, pid = Pid,
                                   attacked_unit = Done,
                                   cannon_attacked = DoneCannon}) ->
    Now = date:unixtime(),
    case lookup({MatchId, Uid}) of
        _ when Now - Ready < 20 -> {false, lang:get("还没准备好")};
        [U = #guild_league_unit{operators = Operators,
                                match_id = MatchId}] ->
            NewOperators = lists:keydelete(Rid,
                                           #guild_league_operator.id,
                                           Operators),
            update(U#guild_league_unit{operators = NewOperators,
                                       last_operated = Now}),
            case random_hit_one(MatchId,
                                guild_league_guild:get_opposite_side(Side))
                of
                {ok,
                 TU = #guild_league_unit{duration = Duration,
                                         id = {_, TUid}}} ->
                    Dmg = get_dmg(300, MatchId, Side),
                    Msg =
                        notice:format(lang:get("开炮成功，敌方~ts-~ts耐久，消耗~ts点行动力"),
                                      [{unit_1, get_base_id(TUid)},
                                       {string_2, 1, Dmg},
                                       {string_2, 1, 50}]),
                    notice:send({pid, Pid}, 3, Msg),
                    NewTU = TU#guild_league_unit{duration =
                                                     max(0, Duration - Dmg),
                                                 last_operated = Now},
                    update(NewTU),
                    NewR = R#guild_league_role{operating_unit = 0,
                                               movability = max(1, Mb - 50),
                                               attacked_unit = Done + 1,
                                               cannon_attacked = DoneCannon + 1,
                                               operating_num = 0},
                    logger:debug("攻击时间 ~w, ~w",
                                 [Now, U],
                                 guild_league_unit,
                                 140),
                    {ok, NewR, NewTU, Dmg};
                _ -> {false, lang:get("对方单位都没耐久了")}
            end;
        _ -> {false, lang:get("找不到操作单位")}
    end;
done_attack(R = #guild_league_role{id = Rid,
                                   operating_unit = Uid, match_id = MatchId,
                                   movability = Mb, pid = Pid,
                                   last_operated = Ready, attacked_unit = Done,
                                   side = Side, operating_num = OpNum}) ->
    Now = date:unixtime(),
    case lookup({MatchId, Uid}) of
        _ when Now - Ready < 20 -> {false, lang:get("还没准备好")};
        [#guild_league_unit{duration = 0}] ->
            {false, lang:get("这个塔已经没有耐久了")};
        [U = #guild_league_unit{operators = Operators,
                                match_id = MatchId, duration = Duration}] ->
            NewOperators = lists:keydelete(Rid,
                                           #guild_league_operator.id,
                                           Operators),
            Dmg1 = get_dmg(40, MatchId, Side),
            Dmg = round(Dmg1 * get_operating_factor(OpNum)),
            NewU = U#guild_league_unit{operators = NewOperators,
                                       duration = max(0, Duration - Dmg)},
            update(NewU),
            Msg =
                notice:format(lang:get("进攻成功，~ts-~ts耐久，消耗~ts点行动力"),
                              [{unit_1, get_base_id(Uid)},
                               {string_2, 1, Dmg},
                               {string_2, 1, 30}]),
            notice:send({pid, Pid}, 3, Msg),
            {ok,
             R#guild_league_role{operating_unit = 0,
                                 movability = max(1, Mb - 30),
                                 attacked_unit = Done + 1, operating_num = 0},
             NewU,
             Dmg};
        _ -> {false, lang:get("找不到操作单位")}
    end.

combat_over(#guild_league_role{operating_unit = 0}) ->
    ok;
combat_over(R = #guild_league_role{operating_unit =
                                       7}) ->
    {ok, R#guild_league_role{operating_unit = 0}};
combat_over(R = #guild_league_role{id = Rid,
                                   operating_unit = Uid, match_id = MatchId,
                                   movability = Mb, pid = Pid, side = Side,
                                   operating_num = OpNum}) ->
    case lookup({MatchId, Uid}) of
        [#guild_league_unit{duration = 0}] ->
            {false, lang:get("这个塔已经没有耐久了")};
        [U = #guild_league_unit{operators = Operators,
                                match_id = MatchId, duration = Duration}] ->
            NewOperators = lists:keydelete(Rid,
                                           #guild_league_operator.id,
                                           Operators),
            Dmg1 = get_dmg(60, MatchId, Side),
            Dmg = round(Dmg1 * get_operating_factor(OpNum)),
            NewU = U#guild_league_unit{operators = NewOperators,
                                       duration = max(0, Duration - Dmg)},
            update(NewU),
            Msg =
                notice:format(lang:get("进攻成功，~ts-~ts耐久，消耗~ts点行动力"),
                              [{unit_1, get_base_id(Uid)},
                               {string_2, 1, Dmg},
                               {string_2, 1, 30}]),
            notice:send({pid, Pid}, 3, Msg),
            {ok,
             R#guild_league_role{operating_unit = 0,
                                 movability = max(1, Mb - 30)},
             NewU,
             Dmg};
        _ -> {false, lang:get("找不到操作单位")}
    end.

disturb(R = #guild_league_role{operating_unit = 0}) ->
    stop_guarding(R);
disturb(R = #guild_league_role{id = Rid,
                               operating_unit = Uid, match_id = MatchId,
                               pid = Pid}) ->
    case lookup({MatchId, Uid}) of
        [U = #guild_league_unit{operators = Operators}] ->
            NewOperators = lists:keydelete(Rid,
                                           #guild_league_operator.id,
                                           Operators),
            update(U#guild_league_unit{operators = NewOperators}),
            role:apply(async,
                       Pid,
                       {guild_league_role, callback, [{unit_action, 0}]}),
            case Uid of
                7 ->
                    stop_guarding(R#guild_league_role{operating_unit = 0,
                                                      cannon_used = 0});
                _ ->
                    stop_guarding(R#guild_league_role{operating_unit = 0,
                                                      last_operated = 0})
            end;
        _ -> stop_guarding(R)
    end.

stop_guarding(R = #guild_league_role{guarding_unit =
                                         0}) ->
    R;
stop_guarding(R = #guild_league_role{id = Rid,
                                     guarding_unit = Uid, match_id = MatchId,
                                     pid = Pid}) ->
    case lookup({MatchId, Uid}) of
        [U = #guild_league_unit{operators = Operators}] ->
            NewOperators = lists:keydelete(Rid,
                                           #guild_league_operator.id,
                                           Operators),
            update(U#guild_league_unit{operators = NewOperators}),
            role:apply(async,
                       Pid,
                       {guild_league_role, callback, [{unit_action, 0}]}),
            R#guild_league_role{guarding_unit = 0};
        _ -> R#guild_league_role{guarding_unit = 0}
    end.

guard(R = #guild_league_role{id = Rid, side = Side,
                             match_id = MatchId, pid = Pid},
      {_, Uid}) ->
    case lookup({MatchId, Uid}) of
        [#guild_league_unit{side = USide}]
            when USide =/= Side ->
            {false, lang:get("这不是自家的塔")};
        [U = #guild_league_unit{operators = Operators,
                                match_id = MatchId}] ->
            case check_guard(MatchId, Side, Uid) of
                ok ->
                    R1 = disturb(R),
                    Op1 = to(operator, R1),
                    Operators1 = lists:keydelete(Rid,
                                                 #guild_league_operator.id,
                                                 Operators),
                    case
                        lists:keytake(guild_league_guild:get_opposite_side(Side),
                                      #guild_league_operator.side,
                                      Operators1)
                        of
                        {value, Rival, NewOperators} ->
                            update(U#guild_league_unit{operators =
                                                           NewOperators}),
                            {ok, Rival};
                        _ ->
                            NewOperators = lists:keystore(Rid,
                                                          #guild_league_operator.id,
                                                          Operators1,
                                                          Op1),
                            update(U#guild_league_unit{operators =
                                                           NewOperators}),
                            role:apply(async,
                                       Pid,
                                       {guild_league_role,
                                        callback,
                                        [{unit_action, 2}]}),
                            {ok, R1#guild_league_role{guarding_unit = Uid}}
                    end;
                Else -> Else
            end;
        _ -> {false, lang:get("找不到操作单位")}
    end.

list_all(MatchId) ->
    do_list_towers(lists:seq(1, 6), MatchId).

calc_duration_and_remain(Side, MatchId) ->
    Units = list_towers(Side, MatchId),
    Duration = lists:sum([D
                          || #guild_league_unit{duration = D} <- Units]),
    Num = erlang:length([D
                         || #guild_league_unit{duration = D} <- Units, D > 0]),
    {Duration, Num}.

lookup(Id) -> ets:lookup(guild_league_unit, Id).

update(U = #guild_league_unit{grade = Grade,
                              phase = Phase}) ->
    ets:insert(guild_league_unit, U),
    case Grade of
        1 when Phase > 4 -> dets:insert(guild_league_unit, U);
        _ -> ok
    end.

reward_destroy(#guild_league_unit{id = {_, Uid},
                                  duration = 0, side = Side,
                                  match_id = MatchId}) ->
    case ets:lookup(guild_league_alliance,
                    {MatchId, guild_league_guild:get_opposite_side(Side)})
        of
        [#guild_league_alliance{members = Mems}] ->
            do_reward_destroy(Mems, get_base_id(Uid));
        _ -> ok
    end;
reward_destroy(_) -> ok.

set_cd(MateIds, Uid) ->
    set_cd(MateIds, Uid, date:unixtime()).

set_cd([], _, _) -> ok;
set_cd([Id | T], Uid, Now) ->
    case ets:lookup(guild_league_role, Id) of
        [R = #guild_league_role{}] when Uid =:= 7 ->
            R1 = R#guild_league_role{cannon_used = Now},
            guild_league_guild:update(R1),
            guild_league_guild:sync_data(R1);
        [R = #guild_league_role{}] ->
            R1 = R#guild_league_role{last_operated = Now},
            guild_league_guild:update(R1),
            guild_league_guild:sync_data(R1);
        _ -> ok
    end,
    set_cd(T, Uid, Now).

get_remain(MatchId, Side) ->
    case ets:lookup(guild_league_alliance, {MatchId, Side})
        of
        [#guild_league_alliance{remain_unit = U1}] -> U1;
        _ -> 0
    end.

get_ratio(MatchId, Side) ->
    US = case ets:lookup(guild_league_alliance,
                         {MatchId, Side})
             of
             [#guild_league_alliance{remain_unit = U1}] -> U1;
             _ -> 0
         end,
    UT = case ets:lookup(guild_league_alliance,
                         {MatchId, guild_league_guild:get_opposite_side(Side)})
             of
             [#guild_league_alliance{remain_unit = U2}] -> U2;
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
do_init(#{battle_id := BattleId, match_id := MatchId},
        Id = 7) ->
    U = #guild_league_unit{id = {MatchId, Id}, side = 0,
                           match_id = MatchId, battle_id = BattleId},
    update(U),
    ok;
do_init(Args = #{battle_id := BattleId,
                 match_id := MatchId, grade := Grade, phase := Phase,
                 season := Season},
        Id) ->
    Side = case lists:member(Id, [1, 2, 3]) of
               true -> 1;
               _ -> 2
           end,
    Duration = guild_league_data:get_unit_duration(Id),
    U = #guild_league_unit{id = {MatchId, Id}, side = Side,
                           match_id = MatchId, battle_id = BattleId,
                           duration = Duration, grade = Grade, phase = Phase,
                           season = Season},
    update(U),
    do_init(Args, Id + 1).

do_clear(_, Id) when Id > 7 -> ok;
do_clear(MatchId, Id) ->
    ets:delete(guild_league_unit, {MatchId, Id}),
    do_clear(MatchId, Id + 1).

to(operator,
   #guild_league_role{id = Id, name = Name,
                      classes = Classes, sex = Sex, side = Side, lev = Lev,
                      gid = Gid}) ->
    #guild_league_operator{id = Id, name = Name,
                           classes = Classes, sex = Sex, side = Side, lev = Lev,
                           gid = Gid, timeout = date:unixtime() + 20}.

random_hit_one(MatchId, Side) ->
    case [U
          || U = #guild_league_unit{duration = D}
                 <- list_towers(Side, MatchId),
             D > 0]
        of
        [U = #guild_league_unit{} | _] -> {ok, U};
        _ -> {false, lang:get("找不到随机单位")}
    end.

list_towers(1, MatchId) ->
    do_list_towers([1, 2, 3], MatchId);
list_towers(_, MatchId) ->
    do_list_towers([4, 5, 6], MatchId).

do_list_towers([], _MatchId) -> [];
do_list_towers([Id | T], MatchId) ->
    case lookup({MatchId, Id}) of
        [U = #guild_league_unit{}] ->
            [U | do_list_towers(T, MatchId)];
        _ -> do_list_towers(T, MatchId)
    end.

do_reward_destroy([], _BaseId) -> ok;
do_reward_destroy([Id | T], BaseId) ->
    case ets:lookup(guild_league_role, Id) of
        [#guild_league_role{pid = Pid}] when is_pid(Pid) ->
            role:apply(async,
                       Pid,
                       {guild_league_role,
                        callback,
                        [{reward_destroy, BaseId}]});
        _ -> ok
    end,
    do_reward_destroy(T, BaseId).

check_attack(MatchId, Side, Uid) ->
    Ids = case guild_league_guild:get_opposite_side(Side) of
              1 -> [1, 2, 3];
              _ -> [4, 5, 6]
          end,
    do_check_attack(Ids, MatchId, Uid).

do_check_attack([], _, _) -> ok;
do_check_attack([Uid | _], _, Uid) -> ok;
do_check_attack([Id | T], MatchId, Uid) ->
    case lookup({MatchId, Id}) of
        [#guild_league_unit{duration = D}] when D > 0 ->
            {false,
             notice:format(lang:get("请先摧毁敌方~ts"),
                           [{unit_1, get_base_id(Id)}])};
        _ -> do_check_attack(T, MatchId, Uid)
    end.

check_guard(MatchId, Side, Uid) ->
    Ids = case Side of
              1 -> [1, 2, 3];
              _ -> [4, 5, 6]
          end,
    do_check_guard(Ids, MatchId, Uid).

do_check_guard([], _, _) -> ok;
do_check_guard([Uid | _], _, Uid) -> ok;
do_check_guard([Id | T], MatchId, Uid) ->
    case lookup({MatchId, Id}) of
        [#guild_league_unit{duration = D}] when D > 0 ->
            {false,
             notice:format(lang:get("该水晶塔无需防御，请先前往~ts增援"),
                           [{unit_1, get_base_id(Id)}])};
        _ -> do_check_guard(T, MatchId, Uid)
    end.

get_dmg(Dmg, MatchId, Side) ->
    {US, UT} = get_ratio(MatchId, Side),
    round(Dmg * get_dmg_rate(US - UT)).

get_dmg_rate(1) -> 8.49999999999999977796e-1;
get_dmg_rate(2) -> 6.99999999999999955591e-1;
get_dmg_rate(_) -> 1.

get_operating_factor(5) -> 1;
get_operating_factor(4) -> 8.0e-1;
get_operating_factor(_) -> 5.99999999999999977796e-1.

