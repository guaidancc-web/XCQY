-file("src/mod/maze/maze_ver.erl", 1).

-module(maze_ver).

-export([do/1]).

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

-file("src/mod/maze/maze_ver.erl", 13).

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

-file("src/mod/maze/maze_ver.erl", 14).

do({m_maze,
    Ver = 1,
    Status,
    Dungeon,
    Double,
    Emptys,
    Opens,
    Datas,
    Times,
    _Piece,
    Time,
    Others}) ->
    Piece = [],
    do({m_maze,
        Ver + 1,
        Status,
        Dungeon,
        Double,
        Emptys,
        Opens,
        Datas,
        Times,
        Piece,
        Time,
        Others});
do({m_maze,
    Ver,
    Status,
    Dungeon,
    Double,
    Emptys,
    Opens,
    Datas,
    Times,
    Piece,
    Time,
    Others}) ->
    Pass = [],
    do({m_maze,
        Ver + 1,
        Status,
        Dungeon,
        Double,
        Emptys,
        Opens,
        Datas,
        Times,
        Piece,
        Time,
        Others,
        Pass});
do({m_maze,
    Ver,
    Status,
    Dungeon,
    Double,
    Emptys,
    Opens,
    Datas,
    Times,
    Piece,
    Time,
    Others,
    Pass}) ->
    PieceOther = [],
    Events = [],
    do({m_maze,
        Ver + 1,
        Status,
        Dungeon,
        Double,
        Emptys,
        Opens,
        Datas,
        Times,
        Piece,
        Time,
        Others,
        Pass,
        PieceOther,
        Events});
do(Data = #m_maze{ver = 4, opens = Opens}) ->
    case do_sub(Opens, []) of
        {ok, NewOpens} -> {ok, Data#m_maze{opens = NewOpens}};
        _ -> {false, lang:get("珍宝石板转换失败")}
    end;
do(_) -> {false, lang:get("珍宝石板转换失败")}.

do_sub([], Datas) -> {ok, Datas};
do_sub([H | T], Datas) ->
    case do_sub(H) of
        {ok, Data} -> do_sub(T, [Data | Datas]);
        Else -> Else
    end.

do_sub({maze_open,
        Pos,
        X,
        Y,
        Unique,
        Type,
        Id,
        Hard,
        Times,
        Flag,
        SpecialId,
        Reward}) ->
    Show = 0,
    Ver = 1,
    do_sub({maze_open,
            Pos,
            Ver,
            X,
            Y,
            Unique,
            Type,
            Id,
            Hard,
            Times,
            Flag,
            SpecialId,
            Reward,
            Show});
do_sub(Data = #maze_open{ver = 1}) -> {ok, Data};
do_sub(_) -> {false, lang:get("藏宝迷宫opens字段转换失败")}.

