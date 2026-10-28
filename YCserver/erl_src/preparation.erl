-file("src/mod/preparation/preparation.erl", 1).

-module(preparation).

-behaviour(gen_server).

-export([start_link/1, reload/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/preparation/preparation.erl", 16).

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

-file("src/mod/preparation/preparation.erl", 17).

-record(state, {mode = 1}).

reload() -> preparation ! reload.

start_link(Type) ->
    gen_server:start_link({local, preparation},
                          preparation,
                          [Type],
                          []).

init([Type]) ->
    logger:info("开始启动...", [], preparation, 38),
    process_flag(trap_exit, true),
    Mode = case Type of
               big_world -> 1;
               _ -> 2
           end,
    preparation_room:open_all(Mode),
    preparation_role:init_cache(),
    preparation_team:init_cache(),
    State = #state{mode = Mode},
    logger:info("启动完成", [], preparation, 48),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(reload, State) -> {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

