-file("src/lib/emysql/emysql_statements.erl", 1).

-module(emysql_statements).

-behaviour(gen_server).

-export([start_link/0,
         init/1,
         handle_call/3,
         handle_cast/2]).

-export([handle_info/2, terminate/2, code_change/3]).

-export([all/0,
         fetch/1,
         add/2,
         version/2,
         prepare/3,
         remove/1]).

-file("inc/emysql.hrl", 1).

-record(pool,
        {pool_id,
         user,
         password,
         host,
         port,
         database,
         encoding,
         available = queue:new(),
         locked = gb_trees:empty(),
         waiting = queue:new(),
         max_conn_num = 0,
         min_conn_num = 0}).

-record(emysql_connection,
        {id,
         pool_id,
         encoding,
         socket,
         version,
         thread_id,
         caps,
         language,
         prepared = gb_trees:empty(),
         locked_at,
         alive = true}).

-record(greeting,
        {protocol_version,
         server_version,
         thread_id,
         salt1,
         salt2,
         caps,
         caps_high,
         language,
         status,
         seq_num,
         plugin}).

-record(field,
        {seq_num,
         catalog,
         db,
         table,
         org_table,
         name,
         org_name,
         type,
         default,
         charset_nr,
         length,
         flags,
         decimals}).

-record(packet, {size, seq_num, data}).

-record(ok_packet,
        {seq_num,
         affected_rows,
         insert_id,
         status,
         warning_count,
         msg}).

-record(error_packet, {seq_num, code, status, msg}).

-record(eof_packet, {seq_num, status, warning_count}).

-record(result_packet,
        {seq_num, field_list, rows, extra}).

-file("src/lib/emysql/emysql_statements.erl", 34).

-record(state,
        {statements = gb_trees:empty(),
         prepared = gb_trees:empty()}).

start_link() ->
    gen_server:start_link({local, emysql_statements},
                          emysql_statements,
                          [],
                          []).

all() ->
    State = gen_server:call(emysql_statements,
                            all,
                            infinity),
    [{statements,
      [StmtName
       || {StmtName, _}
              <- gb_trees:to_list(State#state.statements)]},
     {prepared, gb_trees:to_list(State#state.prepared)}].

fetch(StmtName) ->
    gen_server:call(emysql_statements,
                    {fetch, StmtName},
                    infinity).

add(StmtName, Statement) ->
    gen_server:call(emysql_statements,
                    {add, StmtName, Statement},
                    infinity).

version(ConnId, StmtName) ->
    gen_server:call(emysql_statements,
                    {version, ConnId, StmtName},
                    infinity).

prepare(ConnId, StmtName, Version) ->
    gen_server:call(emysql_statements,
                    {prepare, ConnId, StmtName, Version},
                    infinity).

remove(ConnId) ->
    gen_server:call(emysql_statements,
                    {remove, ConnId},
                    infinity).

init([]) -> {ok, #state{}}.

handle_call(all, _From, State) -> {reply, State, State};
handle_call({fetch, StmtName}, _From, State) ->
    {reply,
     lookup(StmtName, State#state.statements),
     State};
handle_call({add, StmtName, Statement}, _From, State) ->
    State1 = case lookup(StmtName, State#state.statements)
                 of
                 undefined ->
                     State#state{statements =
                                     gb_trees:enter(StmtName,
                                                    {1, Statement},
                                                    State#state.statements)};
                 {_, Statement} -> State;
                 {Version, _} ->
                     State#state{statements =
                                     gb_trees:enter(StmtName,
                                                    {Version + 1, Statement},
                                                    State#state.statements)}
             end,
    {reply, ok, State1};
handle_call({version, ConnId, StmtName}, _From,
            State) ->
    Version = case lookup(ConnId, State#state.prepared) of
                  undefined -> undefined;
                  Versions -> lookup(StmtName, Versions)
              end,
    {reply, Version, State};
handle_call({prepare, ConnId, StmtName, Version}, _From,
            State) ->
    Versions = case lookup(ConnId, State#state.prepared) of
                   undefined ->
                       gb_trees:enter(StmtName, Version, gb_trees:empty());
                   Versions1 ->
                       gb_trees:enter(StmtName, Version, Versions1)
               end,
    Prepared = gb_trees:enter(ConnId,
                              Versions,
                              State#state.prepared),
    {reply, ok, State#state{prepared = Prepared}};
handle_call({remove, ConnId}, _From, State) ->
    StmtNames = case lookup(ConnId, State#state.prepared) of
                    undefined -> [];
                    Versions -> gb_trees:keys(Versions)
                end,
    Prepared = gb_trees:delete_any(ConnId,
                                   State#state.prepared),
    {reply, StmtNames, State#state{prepared = Prepared}};
handle_call(_, _From, State) ->
    {reply, {error, invalid_call}, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

lookup(Key, Tree) ->
    case gb_trees:lookup(Key, Tree) of
        {value, Val} -> Val;
        none -> undefined
    end.

