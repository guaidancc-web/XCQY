-file("src/merge/merge_srv.erl", 1).

-module(merge_srv).

-behaviour(gen_server).

-export([start_link/1, start_merge/1]).

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

-file("src/merge/merge_srv.erl", 19).

-file("inc/merge.hrl", 1).

-record(merge_table,
        {name = <<>>,
         table = <<>>,
         dao,
         server,
         next_key = 0,
         process = merge_main_proc,
         state,
         new_srv_id,
         old_srv_id}).

-record(merge_server,
        {platform = "",
         zone_id = 1,
         data_source,
         schema,
         target_schema,
         index = 0,
         size = 0}).

-record(merge_role_name,
        {key = {0, <<>>, 0},
         name = <<>>,
         lev = 0,
         exp = 0,
         data_source}).

-file("src/merge/merge_srv.erl", 20).

-record(state, {process = ""}).

start_link(SrvName) ->
    gen_server:start_link({global, SrvName},
                          merge_srv,
                          [SrvName],
                          []).

start_merge(SrvName) ->
    gen_server:cast({global, SrvName}, start_merge).

init([SrvName]) ->
    logger:info("[~w] 正在启动...", [SrvName], merge_srv, 41),
    State = #state{process = SrvName},
    logger:info("[~w] 启动完成", [SrvName], merge_srv, 43),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(start_merge,
            State = #state{process = Process}) ->
    tables_merge(Process),
    merge_context:merge_finish(Process),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

tables_merge(Process) ->
    {ok, List} = merge_data:tables(),
    TabList = [Table
               || Table = #merge_table{process = TProcess} <- List,
                  TProcess =:= Process],
    SrvList = merge_util:all_server(),
    tables_merge_srv(TabList, SrvList),
    ok.

tables_merge_srv(_, []) -> ok;
tables_merge_srv(TabList, [Server | T]) ->
    tables_merge(TabList, Server),
    tables_merge_srv(TabList, T).

tables_merge([], _) -> ok;
tables_merge([Table = #merge_table{table = TableName}
              | T],
             Server = #merge_server{platform = Platform,
                                    zone_id = ZoneId}) ->
    logger:info("正在处理[~ts:~w]库表~-20ts",
                [Platform, ZoneId, TableName],
                merge_srv,
                84),
    S = date:unixtime(),
    merge_dao_behaviour:merge(Table#merge_table{server =
                                                    Server}),
    E = date:unixtime(),
    {H, M, SS} = calendar:seconds_to_time(E - S),
    Time = util:flist("~w:~w:~w", [H, M, SS]),
    logger:info("完成处理[~ts:~w]库表~-20ts [~ts]",
                [Platform, ZoneId, TableName, Time],
                merge_srv,
                90),
    tables_merge(T, Server).

