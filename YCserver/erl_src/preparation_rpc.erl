-file("src/mod/preparation/preparation_rpc.erl", 1).

-module(preparation_rpc).

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

-file("src/mod/preparation/preparation_rpc.erl", 13).

-file("inc/preparation.hrl", 1).

-record(m_preparation,
        {ver = 0,
         pid :: undefined | pid(),
         id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer()}).

-record(preparation_room,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid :: undefined | pid(),
         matching = [] :: list(),
         num = 1,
         matched = 0 :: non_neg_integer(),
         match_ref :: undefined | reference(),
         mode = 1,
         is_open = true :: boolean()}).

-record(preparation_team,
        {ids = [] :: list(),
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(preparation_role,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         s_ride = 0,
         preparation_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         team_id = [] :: list(),
         partner = [] :: list(),
         group = 1 :: non_neg_integer()}).

-record(preparation_show_role,
        {id = {0, "", 0},
         name = "",
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         group = 1 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         looks = [] :: list()}).

-file("src/mod/preparation/preparation_rpc.erl", 14).

handle(18300, {}, Role) ->
    preparation_role:push(Role, 18300),
    ok;
handle(18301, {RoomId}, Role) ->
    case preparation_role:join(Role, RoomId) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(18302, {}, Role) ->
    case preparation_role:leave(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(18303, {}, Role) ->
    case preparation_role:match(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("开始匹配")}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(18304, {}, Role) ->
    case preparation_role:unmatch(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("匹配已取消")}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(18306, {RoomId}, _Role) ->
    case catch
             (preparation_cfg:get_module(RoomId)):get_status()
        of
        {Status, Timeout} -> {reply, {Status, Timeout, RoomId}};
        _ -> ok
    end;
handle(18307, {RoomId}, Role) ->
    case catch
             (preparation_cfg:get_module(RoomId)):get_times(Role)
        of
        Times when is_integer(Times) ->
            {reply, {RoomId, Times}};
        _ -> ok
    end;
handle(_Cmd, _Data, _Role) ->
    logger:error("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [preparation_rpc, _Cmd, _Data],
                 preparation_rpc,
                 77),
    {error, unknow_command}.

