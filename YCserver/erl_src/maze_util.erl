-file("src/mod/maze/maze_util.erl", 1).

-module(maze_util).

-export([make_map/2,
         make_data/2,
         make_empty/1,
         make_line/0,
         make_piece_other/3,
         get_empty/1,
         get_remain_pos/2,
         get_remain_pos_event/2,
         get_item_date/2,
         get_next_pos/4,
         get_remain_data/1,
         check_empty/2,
         select_data/3,
         select_data/1]).

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

-file("src/mod/maze/maze_util.erl", 29).

-file("inc/maze.hrl", 1).

-record(m_maze,
        {ver = 4,
         status = 0,
         dungeon = 0,
         double = 0,
         emptys = [],
         opens = [],
         datas = [],
         times = 0,
         piece = [],
         time = 0,
         others = [],
         pass = [],
         piece_other = [],
         events = []}).

-record(maze_open,
        {pos = {0, 0},
         ver = 1,
         x = 0,
         y = 0,
         unique = 0,
         type = 0,
         id = 0,
         hard = 0,
         times = 0,
         flag = 0,
         special_id = 0,
         reward = [],
         show = 0}).

-record(maze_event,
        {e_pos = {0, 0},
         e_x = 0,
         e_y = 0,
         e_id = 0,
         e_type = 0,
         e_unique = 0,
         e_reward = [],
         e_flag = 0,
         e_list = []}).

-file("src/mod/maze/maze_util.erl", 30).

make_map(Num, HoleNum) -> make_map(Num, HoleNum, []).

make_map(Num, _HoleNum, Data) when Num < 0 ->
    write(Data),
    ok;
make_map(Num, HoleNum, Data) ->
    AllList = [{X, Y}
               || X <- lists:seq(1, 5), Y <- lists:seq(1, 5)],
    AllList1 = AllList -- [{1, 1}, {5, 5}],
    Empty = make_empty(HoleNum),
    List = AllList1 -- Empty,
    List1 = [{{X, Y}, 1} || {X, Y} <- List],
    Empty1 = [{{X, Y}, 0} || {X, Y} <- Empty],
    Data1 = case check_dead_road(List,
                                 List1 ++ Empty1,
                                 {1, 1})
                of
                ok ->
                    case check_dead_road(List, List1 ++ Empty1, {5, 5}) of
                        ok -> [Empty | Data];
                        _ -> Data
                    end;
                _ -> Data
            end,
    make_map(Num - 1, HoleNum, Data1).

check_dead_road([], _List, _Pos) -> ok;
check_dead_road([StartPos | T], List, EndPos) ->
    case check_dead_road2([StartPos], EndPos, List, []) of
        ok -> check_dead_road(T, List, EndPos);
        _ -> false
    end.

check_dead_road2([], _EndPos, _List, _Checked) -> false;
check_dead_road2([{X, Y} = StartPos | T], EndPos, List,
                 Checked) ->
    case lists:keyfind(StartPos, 1, List) of
        {StartPos, 1} ->
            Around = [{X - 1, Y},
                      {X + 1, Y},
                      {X, Y - 1},
                      {X, Y + 1}],
            case lists:member(EndPos, Around) of
                true -> ok;
                _ ->
                    Around1 = Around -- [{1, 1}, {5, 5}],
                    Around2 = [{X1, Y1}
                               || {X1, Y1} <- Around1,
                                  X1 > 0 andalso
                                      Y1 > 0 andalso X1 =< 5 andalso Y =< 5],
                    Around3 = Around2 -- Checked,
                    check_dead_road2(T ++ Around3,
                                     EndPos,
                                     List,
                                     [StartPos | Checked])
            end;
        _ ->
            check_dead_road2(T, EndPos, List, [StartPos | Checked])
    end.

make_data(Args, Dungeon) ->
    NewData = select_data(Args,
                          maze_data:get_data(Dungeon),
                          []),
    Datas = make_data(30, NewData, []),
    select_data(Datas).

make_data(Count, _Data, List) when Count =< 0 -> List;
make_data(Count, Data, List) ->
    {Unique, Type, Id, Num, Odds, HardList, Max} =
        util:rand_list(Data, 5),
    {Hard, _Odds} = util:rand_list(HardList, 2),
    NewData = case Max - 1 > 0 of
                  true ->
                      [{Unique, Type, Id, Num, Odds, HardList, Max - 1}
                       | lists:keydelete(Unique, 1, Data)];
                  _ -> lists:keydelete(Unique, 1, Data)
              end,
    make_data(Count - 1,
              NewData,
              [{Unique, Type, Id, Num, Hard} | List]).

select_data(_Args, [], NewData) -> NewData;
select_data(Args = #{lev := Lev,
                     break_times := BreakTimes, world_lev := WorldLev},
            [{Unique,
              Type,
              Id,
              Num,
              Odds,
              Hard,
              Max,
              LevLow,
              LevHigh,
              MinBreakTimes,
              MaxBreakTimes}
             | Data],
            NewData)
    when (BreakTimes >= MinBreakTimes andalso
              BreakTimes =< MaxBreakTimes)
             andalso
             (LevLow =:= 0 andalso LevHigh =:= 0 orelse
                  LevLow =:= 0 andalso Lev =< LevHigh orelse
                      WorldLev >= LevLow andalso LevHigh =:= 0 orelse
                          WorldLev >= LevLow andalso Lev =< LevHigh) ->
    select_data(Args,
                Data,
                [{Unique, Type, Id, Num, Odds, Hard, Max} | NewData]);
select_data(Args = #{lev := Lev,
                     break_times := BreakTimes, world_lev := WorldLev},
            [{Odds,
              LevLow,
              LevHigh,
              MinBreakTimes,
              MaxBreakTimes,
              Reward,
              Cast}
             | Data],
            NewData)
    when (BreakTimes >= MinBreakTimes andalso
              BreakTimes =< MaxBreakTimes)
             andalso
             (LevLow =:= 0 andalso LevHigh =:= 0 orelse
                  LevLow =:= 0 andalso Lev =< LevHigh orelse
                      WorldLev >= LevLow andalso LevHigh =:= 0 orelse
                          WorldLev >= LevLow andalso Lev =< LevHigh) ->
    select_data(Args,
                Data,
                [{Odds, Reward, Cast} | NewData]);
select_data(Args, [_ | Data], NewData) ->
    select_data(Args, Data, NewData).

select_data(Datas) ->
    Events = [{Unique, Type, Id, Num, Hard}
              || {Unique, Type, Id, Num, Hard} <- Datas,
                 Type =:= 2 andalso
                     (Id =:= 7 orelse Id =:= 8 orelse Id =:= 10)],
    case Events of
        [] -> Datas;
        _ ->
            Event = util:rand_list(Events),
            [Event | Datas -- Events]
    end.

next_pos({X, Y}) when X < 5 andalso Y < 5 ->
    [{X + 1, Y}, {X, Y + 1}];
next_pos({X, Y}) when Y < 5 -> [{X, Y + 1}];
next_pos({X, Y}) when X < 5 -> [{X + 1, Y}];
next_pos(_Pos) -> [].

make_empty(HoleNum) ->
    LineList = make_line(),
    Empty = [{2, 2}, {3, 3}, {4, 4}],
    Empty1 = Empty -- LineList,
    case Empty1 of
        [] -> make_empty(HoleNum);
        _ ->
            Pos1 = util:rand_list(Empty1),
            List = [{X, Y}
                    || X <- lists:seq(2, 4), Y <- lists:seq(2, 4)],
            List1 = List -- [Pos1 | LineList],
            Pos2 = util:rand_list(List1),
            AllList = [{X, Y}
                       || X <- lists:seq(1, 5), Y <- lists:seq(1, 5)],
            AllList1 = AllList -- LineList,
            AllList2 = AllList1 -- [Pos1, Pos2, {1, 1}, {5, 5}],
            List3 = util:rand_list_n(AllList2, HoleNum - 2),
            EmptyList = [Pos1, Pos2 | List3],
            logger:debug("空位置 ~w", [EmptyList], maze_util, 162),
            case check_empty(EmptyList, EmptyList) of
                ok -> EmptyList;
                _ ->
                    logger:debug("不符合要求的五个空格 ~w",
                                 [EmptyList],
                                 maze_util,
                                 166),
                    make_empty(HoleNum)
            end
    end.

make_line() ->
    StartPos = {1, 1},
    make_line(StartPos, [StartPos]).

make_line(Pos, List) ->
    case next_pos(Pos) of
        [] -> List;
        PosList ->
            NewPos = util:rand_list(PosList),
            make_line(NewPos, [NewPos | List])
    end.

make_piece_other([], _PosList, Data) -> Data;
make_piece_other([Piece | T], PosList, Data) ->
    case util:rand_list(PosList) of
        Pos = {_X, _Y} ->
            make_piece_other(T,
                             lists:delete(Pos, PosList),
                             [{Pos, Piece} | Data]);
        _ -> make_piece_other(T, PosList, Data)
    end.

check_empty([], _List) -> ok;
check_empty([{X, Y} | T], List) ->
    Around = [{X - 1, Y},
              {X + 1, Y},
              {X, Y - 1},
              {X, Y + 1}],
    Around1 = [{X1, Y1}
               || {X1, Y1} <- Around,
                  X1 > 0 andalso Y1 > 0 andalso X1 =< 5 andalso Y1 =< 5],
    Around2 = Around1 -- [{1, 1}, {5, 5}],
    case do_check_empty(Around2, List) of
        ok -> check_empty(T, List);
        _ -> false
    end.

do_check_empty([], _List) -> false;
do_check_empty([Pos | T], List) ->
    case lists:member(Pos, List) of
        true -> do_check_empty(T, List);
        _ -> ok
    end.

get_item_date(Args, Dungeon) ->
    Data = select_data(Args,
                       maze_data:get_data(Dungeon),
                       []),
    NewData = [{Unique, Type, Id, Num, Odds, HardList, Max}
               || {Unique, Type, Id, Num, Odds, HardList, Max} <- Data,
                  Type =:= 1],
    {Unique1, Type1, Id1, Num1, _Odds1, HardList1, _Max1} =
        util:rand_list(NewData, 5),
    {Hard1, _Odds} = util:rand_list(HardList1, 2),
    {{0, 0}, Unique1, Type1, Id1, Num1, Hard1}.

get_next_pos({X, Y}, Opens, Events, DigPos) ->
    Around = [{X - 1, Y},
              {X + 1, Y},
              {X, Y - 1},
              {X, Y + 1}],
    Around1 = [{X1, Y1}
               || {X1, Y1} <- Around,
                  X1 > 0 andalso Y1 > 0 andalso X1 =< 5 andalso Y1 =< 5],
    PosList = [{X1, Y1}
               || #maze_open{x = X1, y = Y1, times = Times,
                             hard = Hard}
                      <- Opens,
                  Hard =:= Times],
    PosList1 = [{X1, Y1}
                || #maze_event{e_x = X1, e_y = Y1, e_type = Etype,
                               e_id = Eid}
                       <- Events,
                   Etype =:= 2, Eid =:= 9],
    PosList2 = PosList1 ++ [DigPos | PosList],
    Around2 = Around1 -- PosList2,
    logger:debug("============== ~w",
                 [{PosList, PosList1, PosList2, Around2}],
                 maze_util,
                 228),
    case Around2 of
        [] -> false;
        _ -> util:rand_list(Around2)
    end.

get_remain_pos(#m_maze{opens = Opens}, Pos0) ->
    get_remain_pos(Opens, Pos0);
get_remain_pos(Opens, Pos0) ->
    AllList = [{X, Y}
               || X <- lists:seq(1, 5), Y <- lists:seq(1, 5)],
    AllList1 = AllList -- [{1, 1}, {5, 5}, Pos0],
    PosList = [Pos
               || #maze_open{pos = Pos, times = Times, hard = Hard,
                             id = Id}
                      <- Opens,
                  Times =:= Hard orelse Id =:= 9],
    AllList1 -- PosList.

get_remain_pos_event(#m_maze{opens = Opens,
                             events = Events},
                     Pos0) ->
    AllList = [{X, Y}
               || X <- lists:seq(1, 5), Y <- lists:seq(1, 5)],
    EventList = [Epos
                 || #maze_event{e_pos = Epos} <- Events],
    PosList = [Pos
               || #maze_open{pos = Pos, times = Times, hard = Hard}
                      <- Opens,
                  Times =:= Hard],
    AllList1 = AllList -- [{1, 1}, {5, 5}, Pos0],
    AllList2 = AllList1 -- PosList,
    AllList2 -- EventList.

get_remain_data(Datas) ->
    Datas1 = [{Pos1, Unique1, Type1, Id1, Num1, Hard1}
              || {Pos1, Unique1, Type1, Id1, Num1, Hard1} <- Datas,
                 Pos1 =:= {0, 0}, Type1 =:= 1],
    {Pos2, Unique2, Type2, Id2, Num2, Hard2} =
        util:rand_list(Datas1),
    Datas2 = Datas --
                 [{Pos2, Unique2, Type2, Id2, Num2, Hard2}],
    {{Pos2, Unique2, Type2, Id2, Num2, Hard2}, Datas2}.

write(Content) ->
    FileAbsolutePath = lists:append([get_local_path(),
                                     "/",
                                     "a.txt"]),
    {ok, IoDevice} = file:open(FileAbsolutePath, [append]),
    io:format(IoDevice, "~p", [Content]),
    file:close(IoDevice),
    ok.

get_local_path() ->
    filename:dirname(code:which(maze_util)).

get_empty(HoleNm) when HoleNm =:= 6 ->
    Datas = [[{3, 3},
              {4, 2},
              {2, 5},
              {1, 3},
              {1, 2},
              {4, 3}],
             [{3, 3}, {2, 3}, {3, 4}, {1, 4}, {1, 3}, {2, 4}],
             [{3, 3}, {3, 4}, {1, 5}, {2, 4}, {5, 1}, {2, 5}],
             [{2, 2}, {3, 2}, {2, 5}, {5, 3}, {1, 5}, {2, 1}],
             [{3, 3}, {4, 4}, {4, 3}, {3, 1}, {2, 1}, {5, 1}],
             [{3, 3}, {3, 2}, {4, 2}, {1, 2}, {1, 5}, {4, 5}],
             [{2, 2}, {2, 4}, {5, 3}, {1, 2}, {1, 4}, {1, 5}],
             [{2, 2}, {2, 4}, {5, 1}, {2, 5}, {1, 5}, {3, 4}],
             [{4, 4}, {2, 4}, {3, 1}, {1, 3}, {5, 2}, {2, 1}],
             [{4, 4}, {3, 2}, {4, 5}, {5, 1}, {4, 1}, {1, 2}],
             [{3, 3}, {4, 3}, {5, 4}, {1, 4}, {1, 3}, {2, 1}],
             [{3, 3}, {4, 3}, {4, 2}, {5, 2}, {3, 4}, {5, 3}],
             [{2, 2}, {3, 4}, {3, 3}, {5, 4}, {1, 5}, {2, 3}],
             [{3, 3}, {2, 3}, {2, 5}, {1, 2}, {3, 5}, {4, 1}],
             [{4, 4}, {4, 2}, {5, 1}, {1, 2}, {1, 3}, {1, 4}],
             [{4, 4}, {4, 3}, {1, 2}, {3, 2}, {3, 3}, {2, 5}],
             [{3, 3}, {4, 4}, {4, 1}, {3, 1}, {1, 3}, {5, 4}],
             [{2, 2}, {3, 2}, {2, 1}, {5, 3}, {1, 5}, {5, 1}],
             [{4, 4}, {4, 3}, {5, 1}, {2, 1}, {2, 2}, {1, 4}],
             [{3, 3}, {2, 2}, {4, 4}, {2, 4}, {2, 3}, {3, 4}],
             [{2, 2}, {3, 2}, {5, 2}, {1, 5}, {1, 4}, {2, 1}],
             [{4, 4}, {3, 3}, {2, 2}, {5, 1}, {4, 3}, {1, 5}],
             [{2, 2}, {4, 3}, {2, 1}, {2, 3}, {3, 3}, {4, 2}],
             [{2, 2}, {2, 4}, {5, 2}, {1, 2}, {5, 4}, {4, 2}],
             [{4, 4}, {4, 2}, {2, 5}, {3, 1}, {1, 2}, {1, 5}],
             [{3, 3}, {4, 4}, {5, 1}, {5, 2}, {2, 1}, {1, 4}],
             [{3, 3}, {4, 2}, {2, 1}, {3, 2}, {3, 5}, {1, 3}],
             [{4, 4}, {3, 3}, {5, 1}, {1, 4}, {3, 1}, {1, 5}],
             [{3, 3}, {3, 4}, {2, 5}, {5, 3}, {4, 1}, {2, 3}],
             [{4, 4}, {4, 2}, {1, 4}, {3, 3}, {4, 3}, {3, 4}],
             [{3, 3}, {4, 2}, {3, 2}, {1, 3}, {5, 4}, {3, 5}],
             [{3, 3}, {2, 4}, {2, 1}, {1, 3}, {4, 5}, {5, 1}],
             [{4, 4}, {2, 3}, {1, 3}, {4, 2}, {5, 1}, {2, 5}],
             [{4, 4}, {4, 2}, {1, 5}, {2, 4}, {5, 2}, {2, 5}],
             [{3, 3}, {2, 3}, {3, 1}, {4, 1}, {1, 3}, {3, 4}],
             [{4, 4}, {3, 2}, {1, 5}, {2, 4}, {2, 1}, {5, 4}],
             [{4, 4}, {2, 3}, {4, 2}, {5, 2}, {5, 1}, {1, 4}],
             [{4, 4}, {3, 4}, {1, 3}, {1, 5}, {5, 4}, {3, 2}],
             [{2, 2}, {4, 4}, {4, 1}, {3, 3}, {1, 4}, {5, 1}],
             [{4, 4}, {2, 4}, {2, 3}, {3, 4}, {4, 5}, {5, 1}],
             [{2, 2}, {3, 2}, {3, 3}, {5, 3}, {1, 5}, {5, 1}],
             [{3, 3}, {2, 2}, {3, 2}, {5, 1}, {2, 3}, {3, 5}],
             [{3, 3}, {4, 3}, {1, 4}, {5, 4}, {1, 3}, {1, 2}],
             [{3, 3}, {4, 4}, {1, 2}, {5, 1}, {5, 2}, {2, 5}],
             [{3, 3}, {4, 4}, {5, 1}, {4, 1}, {1, 5}, {3, 1}],
             [{2, 2}, {4, 2}, {3, 5}, {5, 1}, {3, 4}, {2, 1}],
             [{4, 4}, {4, 2}, {1, 2}, {2, 4}, {4, 1}, {4, 5}],
             [{3, 3}, {3, 4}, {2, 1}, {5, 4}, {1, 5}, {5, 3}]],
    util:rand_list(Datas);
get_empty(_HoleNum) ->
    Datas = [[{4, 4}, {2, 4}, {4, 5}, {4, 1}, {2, 1}],
             [{2, 2}, {4, 3}, {2, 3}, {4, 1}, {3, 5}],
             [{4, 4}, {2, 3}, {3, 1}, {1, 5}, {1, 2}],
             [{3, 3}, {4, 2}, {1, 4}, {5, 3}, {5, 2}],
             [{2, 2}, {4, 3}, {5, 2}, {3, 5}, {2, 5}],
             [{2, 2}, {3, 2}, {2, 4}, {1, 2}, {4, 5}],
             [{2, 2}, {4, 2}, {3, 4}, {1, 2}, {2, 4}],
             [{3, 3}, {3, 2}, {1, 3}, {5, 1}, {2, 5}],
             [{3, 3}, {4, 3}, {1, 5}, {5, 4}, {5, 3}],
             [{3, 3}, {2, 4}, {3, 2}, {2, 2}, {5, 2}],
             [{3, 3}, {4, 4}, {2, 3}, {4, 5}, {5, 1}],
             [{2, 2}, {3, 3}, {2, 4}, {4, 4}, {3, 4}],
             [{4, 4}, {2, 3}, {3, 2}, {2, 5}, {4, 5}],
             [{3, 3}, {3, 2}, {5, 4}, {4, 3}, {5, 3}],
             [{2, 2}, {3, 3}, {2, 1}, {4, 3}, {4, 1}],
             [{4, 4}, {3, 2}, {4, 3}, {2, 4}, {3, 3}],
             [{3, 3}, {2, 3}, {2, 5}, {3, 5}, {2, 4}],
             [{4, 4}, {4, 2}, {4, 3}, {2, 4}, {3, 4}],
             [{3, 3}, {3, 4}, {2, 3}, {1, 3}, {4, 3}],
             [{2, 2}, {4, 3}, {5, 3}, {1, 2}, {2, 5}],
             [{2, 2}, {4, 3}, {4, 1}, {3, 3}, {1, 5}],
             [{2, 2}, {4, 2}, {5, 2}, {4, 5}, {2, 5}],
             [{3, 3}, {2, 2}, {5, 4}, {4, 2}, {3, 2}],
             [{3, 3}, {2, 4}, {1, 3}, {1, 2}, {5, 3}],
             [{4, 4}, {4, 2}, {2, 4}, {4, 5}, {3, 4}],
             [{3, 3}, {3, 4}, {5, 4}, {2, 1}, {3, 2}],
             [{3, 3}, {4, 2}, {5, 3}, {4, 3}, {2, 1}],
             [{3, 3}, {2, 2}, {3, 5}, {1, 5}, {4, 3}],
             [{3, 3}, {3, 4}, {2, 4}, {5, 3}, {2, 3}],
             [{4, 4}, {2, 3}, {4, 3}, {1, 2}, {2, 2}],
             [{4, 4}, {3, 2}, {1, 5}, {1, 3}, {2, 3}],
             [{2, 2}, {4, 3}, {5, 1}, {5, 2}, {2, 4}],
             [{2, 2}, {4, 3}, {4, 5}, {2, 4}, {2, 1}],
             [{4, 4}, {2, 2}, {2, 1}, {1, 4}, {1, 5}],
             [{4, 4}, {2, 3}, {4, 1}, {2, 5}, {2, 4}],
             [{2, 2}, {2, 4}, {4, 2}, {4, 1}, {4, 3}],
             [{2, 2}, {2, 3}, {1, 2}, {4, 2}, {2, 4}],
             [{3, 3}, {3, 2}, {2, 5}, {1, 5}, {5, 3}],
             [{4, 4}, {4, 3}, {5, 1}, {4, 5}, {1, 5}],
             [{3, 3}, {3, 4}, {3, 1}, {5, 1}, {5, 2}],
             [{3, 3}, {2, 4}, {4, 1}, {1, 2}, {5, 3}],
             [{2, 2}, {2, 3}, {5, 3}, {4, 3}, {1, 5}],
             [{4, 4}, {2, 2}, {5, 1}, {2, 3}, {5, 4}],
             [{2, 2}, {2, 4}, {5, 1}, {4, 3}, {1, 2}],
             [{3, 3}, {2, 2}, {1, 2}, {2, 4}, {5, 2}],
             [{4, 4}, {2, 4}, {2, 3}, {3, 4}, {4, 5}],
             [{3, 3}, {2, 3}, {2, 4}, {4, 1}, {3, 1}],
             [{4, 4}, {3, 4}, {5, 4}, {3, 2}, {5, 2}],
             [{4, 4}, {3, 2}, {3, 4}, {3, 3}, {5, 1}],
             [{4, 4}, {4, 3}, {4, 1}, {1, 5}, {2, 4}],
             [{3, 3}, {2, 3}, {1, 4}, {4, 1}, {2, 1}],
             [{3, 3}, {2, 4}, {2, 5}, {1, 5}, {5, 2}],
             [{2, 2}, {2, 3}, {1, 2}, {4, 1}, {5, 1}],
             [{4, 4}, {4, 2}, {3, 3}, {4, 3}, {2, 5}],
             [{2, 2}, {3, 2}, {3, 3}, {5, 2}, {3, 4}],
             [{3, 3}, {4, 3}, {2, 1}, {2, 3}, {2, 4}],
             [{3, 3}, {4, 3}, {4, 2}, {5, 1}, {1, 5}],
             [{4, 4}, {4, 3}, {4, 1}, {1, 5}, {1, 3}],
             [{3, 3}, {4, 3}, {1, 4}, {3, 4}, {2, 4}],
             [{3, 3}, {2, 4}, {5, 4}, {1, 5}, {3, 1}],
             [{3, 3}, {2, 3}, {3, 1}, {1, 5}, {5, 1}],
             [{4, 4}, {3, 2}, {5, 1}, {1, 2}, {4, 1}],
             [{4, 4}, {2, 4}, {4, 1}, {3, 4}, {4, 5}],
             [{2, 2}, {2, 4}, {3, 3}, {1, 2}, {4, 5}],
             [{4, 4}, {2, 2}, {4, 2}, {5, 1}, {2, 5}],
             [{4, 4}, {4, 3}, {2, 5}, {4, 1}, {5, 1}],
             [{4, 4}, {2, 2}, {4, 2}, {5, 1}, {5, 4}],
             [{3, 3}, {2, 3}, {5, 2}, {3, 4}, {2, 1}],
             [{4, 4}, {2, 3}, {3, 2}, {3, 4}, {4, 2}],
             [{3, 3}, {4, 4}, {1, 3}, {2, 1}, {3, 1}],
             [{3, 3}, {3, 4}, {2, 3}, {5, 3}, {4, 5}],
             [{3, 3}, {4, 3}, {4, 1}, {2, 5}, {5, 1}],
             [{3, 3}, {3, 2}, {3, 5}, {5, 2}, {1, 2}],
             [{4, 4}, {4, 3}, {4, 5}, {2, 5}, {1, 2}],
             [{4, 4}, {2, 4}, {5, 2}, {1, 3}, {1, 2}],
             [{3, 3}, {4, 3}, {1, 5}, {1, 3}, {1, 4}],
             [{3, 3}, {3, 2}, {5, 4}, {2, 4}, {4, 2}],
             [{3, 3}, {4, 2}, {2, 1}, {5, 4}, {5, 1}],
             [{3, 3}, {3, 2}, {4, 3}, {1, 2}, {1, 3}],
             [{4, 4}, {3, 2}, {5, 4}, {4, 1}, {2, 5}],
             [{4, 4}, {3, 2}, {2, 3}, {2, 4}, {4, 2}],
             [{3, 3}, {3, 4}, {4, 1}, {2, 5}, {4, 3}],
             [{2, 2}, {2, 4}, {3, 5}, {2, 5}, {3, 4}],
             [{2, 2}, {4, 3}, {1, 4}, {1, 2}, {4, 5}],
             [{3, 3}, {2, 3}, {4, 5}, {4, 1}, {3, 5}],
             [{2, 2}, {2, 3}, {5, 3}, {1, 2}, {1, 5}],
             [{3, 3}, {2, 2}, {3, 5}, {5, 1}, {2, 3}],
             [{3, 3}, {3, 4}, {5, 4}, {3, 2}, {1, 4}],
             [{2, 2}, {3, 4}, {4, 5}, {5, 1}, {1, 5}],
             [{4, 4}, {4, 3}, {4, 1}, {4, 5}, {1, 3}],
             [{3, 3}, {4, 2}, {4, 3}, {1, 5}, {5, 4}],
             [{2, 2}, {4, 3}, {4, 5}, {1, 4}, {1, 5}],
             [{4, 4}, {4, 2}, {4, 1}, {1, 2}, {1, 5}],
             [{2, 2}, {2, 4}, {4, 4}, {3, 4}, {4, 5}],
             [{4, 4}, {4, 2}, {4, 3}, {5, 4}, {1, 5}],
             [{2, 2}, {3, 2}, {2, 1}, {3, 4}, {2, 4}],
             [{2, 2}, {3, 3}, {3, 5}, {1, 5}, {2, 3}],
             [{4, 4}, {3, 3}, {5, 1}, {1, 5}, {1, 4}],
             [{3, 3}, {2, 4}, {1, 4}, {3, 4}, {5, 2}],
             [{3, 3}, {3, 2}, {4, 3}, {5, 3}, {1, 5}],
             [{2, 2}, {2, 4}, {1, 2}, {4, 3}, {5, 2}],
             [{3, 3}, {3, 2}, {5, 2}, {2, 4}, {3, 4}],
             [{4, 4}, {4, 3}, {1, 4}, {4, 2}, {5, 4}],
             [{4, 4}, {4, 3}, {3, 3}, {2, 2}, {5, 1}],
             [{3, 3}, {3, 2}, {1, 2}, {5, 2}, {4, 2}],
             [{4, 4}, {3, 3}, {5, 1}, {1, 5}, {5, 2}],
             [{4, 4}, {2, 2}, {5, 4}, {4, 2}, {1, 2}],
             [{2, 2}, {3, 4}, {3, 3}, {4, 1}, {5, 1}],
             [{3, 3}, {3, 4}, {5, 3}, {5, 1}, {3, 1}],
             [{2, 2}, {2, 4}, {5, 4}, {1, 4}, {5, 1}],
             [{4, 4}, {2, 3}, {1, 3}, {4, 5}, {1, 4}],
             [{2, 2}, {4, 4}, {4, 1}, {4, 5}, {2, 3}],
             [{2, 2}, {3, 4}, {1, 4}, {5, 3}, {2, 1}],
             [{2, 2}, {2, 4}, {5, 3}, {3, 4}, {5, 1}],
             [{4, 4}, {2, 4}, {3, 2}, {5, 4}, {4, 2}],
             [{3, 3}, {2, 3}, {4, 1}, {1, 4}, {5, 4}],
             [{3, 3}, {4, 3}, {3, 2}, {4, 2}, {3, 1}],
             [{2, 2}, {4, 3}, {1, 5}, {3, 4}, {4, 5}],
             [{3, 3}, {2, 3}, {1, 5}, {5, 3}, {5, 2}],
             [{4, 4}, {3, 2}, {1, 4}, {1, 3}, {2, 1}],
             [{3, 3}, {4, 3}, {5, 2}, {4, 5}, {2, 1}],
             [{3, 3}, {3, 2}, {4, 4}, {5, 4}, {2, 4}],
             [{4, 4}, {3, 3}, {2, 5}, {2, 2}, {5, 1}],
             [{3, 3}, {2, 2}, {3, 2}, {4, 2}, {3, 4}],
             [{3, 3}, {2, 2}, {3, 4}, {1, 5}, {2, 3}],
             [{3, 3}, {2, 4}, {1, 2}, {4, 5}, {4, 3}],
             [{3, 3}, {2, 3}, {1, 2}, {1, 3}, {3, 2}],
             [{3, 3}, {2, 4}, {1, 2}, {3, 1}, {3, 4}],
             [{3, 3}, {2, 3}, {4, 3}, {3, 5}, {2, 1}],
             [{3, 3}, {3, 4}, {1, 5}, {2, 1}, {4, 2}],
             [{2, 2}, {4, 3}, {5, 1}, {1, 5}, {1, 4}],
             [{2, 2}, {4, 3}, {2, 5}, {2, 4}, {5, 1}],
             [{2, 2}, {2, 3}, {3, 3}, {2, 4}, {4, 1}],
             [{3, 3}, {2, 3}, {5, 1}, {5, 3}, {2, 1}],
             [{3, 3}, {4, 3}, {1, 3}, {5, 3}, {4, 2}],
             [{2, 2}, {3, 2}, {5, 1}, {2, 1}, {1, 4}],
             [{4, 4}, {2, 4}, {4, 1}, {5, 1}, {2, 2}],
             [{4, 4}, {3, 4}, {1, 3}, {2, 1}, {3, 2}],
             [{4, 4}, {3, 4}, {2, 2}, {5, 1}, {5, 2}],
             [{3, 3}, {3, 4}, {5, 4}, {4, 4}, {2, 3}],
             [{4, 4}, {2, 4}, {5, 1}, {5, 2}, {4, 2}],
             [{3, 3}, {3, 4}, {5, 1}, {1, 3}, {1, 5}],
             [{3, 3}, {3, 2}, {5, 2}, {4, 2}, {3, 5}],
             [{3, 3}, {4, 3}, {2, 2}, {2, 1}, {4, 2}],
             [{4, 4}, {2, 4}, {1, 4}, {2, 1}, {3, 1}],
             [{3, 3}, {3, 2}, {3, 1}, {1, 5}, {5, 3}],
             [{2, 2}, {2, 4}, {3, 2}, {4, 3}, {3, 4}],
             [{4, 4}, {3, 2}, {1, 2}, {5, 1}, {5, 2}],
             [{3, 3}, {2, 2}, {4, 4}, {5, 1}, {2, 4}],
             [{3, 3}, {3, 2}, {1, 5}, {1, 3}, {3, 1}],
             [{4, 4}, {2, 4}, {5, 2}, {2, 5}, {5, 4}],
             [{2, 2}, {2, 4}, {2, 1}, {1, 4}, {3, 2}],
             [{3, 3}, {3, 2}, {4, 5}, {1, 4}, {5, 2}],
             [{4, 4}, {2, 3}, {2, 2}, {3, 2}, {2, 1}],
             [{4, 4}, {2, 4}, {1, 4}, {4, 5}, {2, 3}],
             [{4, 4}, {2, 3}, {2, 5}, {1, 5}, {3, 1}],
             [{3, 3}, {4, 2}, {2, 5}, {2, 1}, {3, 5}],
             [{3, 3}, {3, 2}, {5, 1}, {4, 2}, {4, 1}],
             [{2, 2}, {2, 4}, {4, 2}, {3, 2}, {2, 5}],
             [{4, 4}, {3, 4}, {3, 1}, {4, 5}, {2, 1}],
             [{2, 2}, {3, 2}, {5, 1}, {5, 2}, {3, 4}],
             [{3, 3}, {3, 4}, {1, 3}, {1, 4}, {4, 4}],
             [{3, 3}, {2, 4}, {4, 1}, {5, 1}, {2, 2}],
             [{3, 3}, {4, 4}, {3, 4}, {4, 3}, {3, 1}],
             [{4, 4}, {4, 3}, {2, 1}, {1, 3}, {3, 3}],
             [{4, 4}, {3, 4}, {4, 5}, {1, 4}, {1, 5}],
             [{4, 4}, {3, 2}, {5, 4}, {3, 1}, {4, 1}],
             [{3, 3}, {2, 3}, {1, 3}, {5, 2}, {3, 1}],
             [{2, 2}, {3, 2}, {1, 5}, {2, 4}, {5, 1}],
             [{4, 4}, {2, 4}, {4, 1}, {5, 4}, {4, 3}],
             [{3, 3}, {2, 3}, {4, 5}, {5, 1}, {1, 5}],
             [{4, 4}, {3, 4}, {4, 2}, {4, 5}, {2, 3}],
             [{4, 4}, {3, 4}, {5, 2}, {3, 1}, {1, 5}],
             [{4, 4}, {2, 3}, {5, 2}, {2, 5}, {3, 1}],
             [{3, 3}, {3, 4}, {4, 5}, {4, 1}, {1, 3}],
             [{4, 4}, {3, 2}, {5, 1}, {2, 2}, {3, 3}],
             [{2, 2}, {4, 3}, {1, 5}, {3, 2}, {2, 3}],
             [{3, 3}, {3, 4}, {4, 4}, {5, 4}, {4, 2}],
             [{4, 4}, {3, 3}, {2, 3}, {2, 4}, {3, 4}],
             [{3, 3}, {4, 3}, {5, 3}, {3, 1}, {4, 5}],
             [{2, 2}, {3, 4}, {4, 1}, {5, 1}, {2, 1}],
             [{3, 3}, {4, 2}, {5, 3}, {5, 2}, {4, 3}],
             [{2, 2}, {2, 3}, {3, 3}, {2, 1}, {4, 1}],
             [{4, 4}, {2, 4}, {1, 3}, {4, 1}, {5, 4}],
             [{3, 3}, {4, 2}, {5, 1}, {4, 3}, {1, 4}],
             [{3, 3}, {4, 3}, {3, 2}, {5, 1}, {2, 3}],
             [{4, 4}, {4, 3}, {3, 2}, {1, 4}, {1, 3}],
             [{2, 2}, {2, 3}, {5, 1}, {1, 5}, {1, 2}],
             [{3, 3}, {4, 4}, {5, 1}, {1, 5}, {4, 1}],
             [{4, 4}, {3, 4}, {2, 3}, {3, 3}, {5, 2}],
             [{3, 3}, {4, 3}, {2, 1}, {3, 1}, {5, 4}],
             [{3, 3}, {2, 2}, {2, 3}, {3, 4}, {5, 2}],
             [{3, 3}, {4, 3}, {1, 5}, {3, 2}, {1, 3}],
             [{3, 3}, {4, 3}, {2, 5}, {3, 5}, {5, 4}],
             [{3, 3}, {3, 4}, {2, 3}, {4, 4}, {4, 3}],
             [{3, 3}, {4, 3}, {3, 2}, {5, 3}, {5, 4}],
             [{3, 3}, {4, 3}, {4, 1}, {2, 1}, {1, 5}],
             [{4, 4}, {2, 4}, {3, 2}, {4, 5}, {4, 1}],
             [{3, 3}, {2, 4}, {4, 5}, {2, 3}, {1, 4}],
             [{2, 2}, {4, 2}, {3, 5}, {5, 3}, {1, 2}],
             [{2, 2}, {3, 2}, {2, 1}, {4, 2}, {3, 5}],
             [{3, 3}, {4, 3}, {5, 1}, {1, 2}, {2, 5}],
             [{3, 3}, {2, 4}, {3, 4}, {4, 1}, {2, 3}],
             [{3, 3}, {4, 3}, {2, 1}, {2, 2}, {4, 1}],
             [{4, 4}, {3, 4}, {3, 2}, {4, 2}, {1, 3}],
             [{3, 3}, {3, 2}, {2, 5}, {5, 3}, {5, 2}],
             [{2, 2}, {2, 3}, {5, 3}, {3, 5}, {5, 2}],
             [{3, 3}, {4, 3}, {3, 2}, {3, 5}, {1, 5}],
             [{4, 4}, {2, 4}, {3, 1}, {4, 5}, {1, 3}],
             [{2, 2}, {4, 2}, {3, 5}, {5, 3}, {2, 4}],
             [{4, 4}, {4, 2}, {4, 5}, {2, 1}, {3, 4}],
             [{4, 4}, {2, 3}, {2, 1}, {4, 3}, {3, 3}],
             [{4, 4}, {2, 4}, {2, 3}, {3, 3}, {4, 5}],
             [{2, 2}, {2, 4}, {4, 1}, {3, 4}, {2, 1}],
             [{3, 3}, {3, 4}, {3, 2}, {4, 5}, {1, 4}],
             [{4, 4}, {3, 3}, {1, 2}, {4, 3}, {5, 1}],
             [{4, 4}, {4, 3}, {5, 4}, {1, 5}, {2, 4}],
             [{3, 3}, {4, 2}, {5, 2}, {3, 2}, {5, 4}],
             [{2, 2}, {3, 2}, {5, 1}, {4, 4}, {3, 4}],
             [{2, 2}, {4, 2}, {2, 5}, {5, 1}, {4, 1}],
             [{4, 4}, {2, 4}, {1, 3}, {4, 2}, {2, 3}],
             [{4, 4}, {2, 2}, {4, 3}, {2, 3}, {4, 1}],
             [{3, 3}, {3, 2}, {1, 5}, {5, 2}, {1, 3}],
             [{3, 3}, {3, 4}, {1, 3}, {2, 1}, {5, 2}],
             [{2, 2}, {3, 2}, {1, 2}, {4, 5}, {1, 5}],
             [{3, 3}, {2, 2}, {4, 2}, {1, 2}, {1, 4}],
             [{4, 4}, {2, 4}, {4, 5}, {4, 2}, {5, 2}],
             [{4, 4}, {2, 2}, {3, 4}, {2, 3}, {4, 1}],
             [{3, 3}, {2, 2}, {2, 5}, {4, 2}, {3, 2}],
             [{3, 3}, {3, 4}, {5, 4}, {2, 3}, {4, 1}],
             [{3, 3}, {4, 2}, {5, 4}, {1, 5}, {5, 3}],
             [{3, 3}, {3, 2}, {4, 2}, {5, 4}, {4, 4}],
             [{3, 3}, {4, 2}, {3, 2}, {3, 4}, {5, 3}],
             [{4, 4}, {4, 2}, {3, 4}, {2, 3}, {1, 5}],
             [{4, 4}, {3, 4}, {4, 3}, {3, 1}, {5, 4}],
             [{4, 4}, {2, 2}, {4, 2}, {4, 1}, {2, 3}],
             [{4, 4}, {2, 2}, {1, 5}, {3, 3}, {4, 1}],
             [{4, 4}, {3, 4}, {2, 3}, {1, 5}, {3, 3}],
             [{3, 3}, {2, 2}, {2, 1}, {4, 2}, {3, 5}],
             [{4, 4}, {3, 4}, {3, 1}, {4, 3}, {1, 2}],
             [{3, 3}, {2, 3}, {1, 5}, {2, 1}, {3, 4}],
             [{2, 2}, {2, 4}, {2, 3}, {3, 3}, {3, 4}],
             [{3, 3}, {4, 2}, {1, 5}, {3, 4}, {4, 3}],
             [{2, 2}, {3, 2}, {5, 1}, {1, 5}, {5, 2}],
             [{4, 4}, {3, 2}, {2, 5}, {3, 3}, {1, 3}],
             [{2, 2}, {2, 4}, {4, 4}, {5, 4}, {3, 2}],
             [{2, 2}, {4, 3}, {2, 1}, {4, 2}, {4, 4}],
             [{4, 4}, {4, 3}, {1, 3}, {2, 3}, {4, 1}]],
    util:rand_list(Datas).

