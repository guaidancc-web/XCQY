-file("src/lib/emysql/emysql_conn_mgr.erl", 1).

-module(emysql_conn_mgr).

-behaviour(gen_server).

-export([start_link/0,
         init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2]).

-export([terminate/2, code_change/3]).

-export([pools/0,
         add_pool/1,
         remove_pool/1,
         add_connections/2,
         remove_connections/2,
         lock_connection/1,
         wait_for_connection/1,
         pass_connection/1,
         replace_connection_as_available/2,
         replace_connection_as_locked/2,
         find_pool/2]).

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

-file("src/lib/emysql/emysql_conn_mgr.erl", 43).

-record(state, {pools}).

start_link() ->
    gen_server:start_link({local, emysql_conn_mgr},
                          emysql_conn_mgr,
                          [],
                          []).

pools() ->
    gen_server:call(emysql_conn_mgr, pools, infinity).

add_pool(Pool) -> do_gen_call({add_pool, Pool}).

remove_pool(PoolId) ->
    do_gen_call({remove_pool, PoolId}).

add_connections(PoolId, Conns) when is_list(Conns) ->
    do_gen_call({add_connections, PoolId, Conns}).

remove_connections(PoolId, Num) when is_integer(Num) ->
    do_gen_call({remove_connections, PoolId, Num}).

lock_connection(PoolId) ->
    do_gen_call({lock_connection, PoolId}).

wait_for_connection(PoolId) ->
    case do_gen_call({lock_connection_or_wait, PoolId}) of
        unavailable ->
            receive
                {connection, Connection} -> Connection
                after lock_timeout() ->
                          case do_gen_call({end_wait, PoolId}) of
                              ok -> exit(connection_lock_timeout);
                              not_waiting -> receive_connection_not_waiting()
                          end
            end;
        Connection -> Connection
    end.

pass_connection(Connection) ->
    do_gen_call({pass_connection, Connection}).

replace_connection_as_available(OldConn, NewConn) ->
    do_gen_call({replace_connection_as_available,
                 OldConn,
                 NewConn}).

replace_connection_as_locked(OldConn, NewConn) ->
    do_gen_call({replace_connection_as_locked,
                 OldConn,
                 NewConn}).

do_gen_call(Msg) ->
    case gen_server:call(emysql_conn_mgr, Msg, infinity) of
        {error, Reason} -> exit(Reason);
        Result -> Result
    end.

init([]) ->
    Pools = initialize_pools(),
    Pools1 = [emysql_conn:open_connections(Pool)
              || Pool <- Pools],
    erlang:send_after(30000, self(), check_pool),
    {ok, #state{pools = Pools1}}.

handle_call(pools, _From, State) ->
    {reply, State#state.pools, State};
handle_call({add_pool, Pool}, _From, State) ->
    case find_pool(Pool#pool.pool_id, State#state.pools) of
        {_, _} -> {reply, {error, pool_already_exists}, State};
        undefined ->
            {reply,
             ok,
             State#state{pools = [Pool | State#state.pools]}}
    end;
handle_call({remove_pool, PoolId}, _From, State) ->
    case find_pool(PoolId, State#state.pools) of
        {Pool, OtherPools} ->
            {reply, Pool, State#state{pools = OtherPools}};
        undefined -> {reply, {error, pool_not_found}, State}
    end;
handle_call({add_connections, PoolId, Conns}, _From,
            State) ->
    case find_pool(PoolId, State#state.pools) of
        {Pool, OtherPools} ->
            OtherConns = Pool#pool.available,
            State1 = State#state{pools =
                                     [Pool#pool{available =
                                                    queue:join(queue:from_list(Conns),
                                                               OtherConns)}
                                      | OtherPools]},
            {reply, ok, State1};
        undefined -> {reply, {error, pool_not_found}, State}
    end;
handle_call({remove_connections, PoolId, Num}, _From,
            State) ->
    case find_pool(PoolId, State#state.pools) of
        {Pool, OtherPools} ->
            case Num > queue:len(Pool#pool.available) of
                true ->
                    State1 = State#state{pools =
                                             [Pool#pool{available =
                                                            queue:new()}]},
                    {reply, queue:to_list(Pool#pool.available), State1};
                false ->
                    {Conns, OtherConns} = queue:split(Num,
                                                      Pool#pool.available),
                    State1 = State#state{pools =
                                             [Pool#pool{available = OtherConns}
                                              | OtherPools]},
                    {reply, queue:to_list(Conns), State1}
            end;
        undefined -> {reply, {error, pool_not_found}, State}
    end;
handle_call({lock_connection_or_wait, PoolId},
            {From, _Mref}, State) ->
    case find_pool(PoolId, State#state.pools) of
        {Pool, OtherPools} ->
            case lock_next_connection(State, Pool, OtherPools) of
                {ok, NewConn, State1} -> {reply, NewConn, State1};
                unavailable ->
                    PoolNow = Pool#pool{waiting =
                                            queue:in(From, Pool#pool.waiting)},
                    {reply,
                     unavailable,
                     State#state{pools = [PoolNow | OtherPools]}}
            end;
        undefined -> {reply, {error, pool_not_found}, State}
    end;
handle_call({end_wait, PoolId}, {From, _Mref}, State) ->
    case find_pool(PoolId, State#state.pools) of
        {Pool, OtherPools} ->
            QueueNow = queue:filter(fun (Pid) -> Pid =/= From end,
                                    Pool#pool.waiting),
            PoolNow = Pool#pool{waiting = QueueNow},
            OldLen = queue:len(Pool#pool.waiting),
            NewLen = queue:len(QueueNow),
            Reply = case OldLen =:= NewLen of
                        true -> not_waiting;
                        false -> ok
                    end,
            {reply,
             Reply,
             State#state{pools = [PoolNow | OtherPools]}};
        undefined -> {reply, {error, pool_not_found}, State}
    end;
handle_call({lock_connection, PoolId}, _From, State) ->
    case find_pool(PoolId, State#state.pools) of
        {Pool, OtherPools} ->
            case lock_next_connection(State, Pool, OtherPools) of
                {ok, NewConn, State1} -> {reply, NewConn, State1};
                Other -> {reply, Other, State}
            end;
        undefined -> {reply, {error, pool_not_found}, State}
    end;
handle_call({pass_connection, Connection}, _From,
            State) ->
    {Result, State1} = pass_on_or_queue_as_available(State,
                                                     Connection),
    {reply, Result, State1};
handle_call({replace_connection_as_available,
             OldConn,
             NewConn},
            _From, State) ->
    case find_pool(OldConn#emysql_connection.pool_id,
                   State#state.pools)
        of
        {Pool, OtherPools} ->
            Pool1 = Pool#pool{available =
                                  queue:in(NewConn, Pool#pool.available),
                              locked =
                                  gb_trees:delete_any(OldConn#emysql_connection.id,
                                                      Pool#pool.locked)},
            {reply, ok, State#state{pools = [Pool1 | OtherPools]}};
        undefined -> {reply, {error, pool_not_found}, State}
    end;
handle_call({replace_connection_as_locked,
             OldConn,
             NewConn},
            _From, State) ->
    case find_pool(OldConn#emysql_connection.pool_id,
                   State#state.pools)
        of
        {Pool, OtherPools} ->
            LockedStripped =
                gb_trees:delete_any(OldConn#emysql_connection.id,
                                    Pool#pool.locked),
            LockedAdded =
                gb_trees:enter(NewConn#emysql_connection.id,
                               NewConn,
                               LockedStripped),
            Pool1 = Pool#pool{locked = LockedAdded},
            {reply, ok, State#state{pools = [Pool1 | OtherPools]}};
        undefined -> {reply, {error, pool_not_found}, State}
    end;
handle_call(_, _From, State) ->
    {reply, {error, invalid_call}, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(check_pool,
            State = #state{pools = Pools}) ->
    Pools1 = check_pools(Pools),
    erlang:send_after(30000, self(), check_pool),
    {noreply, State#state{pools = Pools1}};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

initialize_pools() ->
    [#pool{pool_id = PoolId,
           min_conn_num =
               proplists:get_value(min_conn_num, Props, 1),
           max_conn_num =
               proplists:get_value(max_conn_num, Props, 1),
           user = proplists:get_value(user, Props),
           password = proplists:get_value(password, Props),
           host = proplists:get_value(host, Props),
           port = proplists:get_value(port, Props),
           database = proplists:get_value(database, Props),
           encoding = proplists:get_value(encoding, Props)}
     || {PoolId, Props} <- emysql_app:pools()].

find_pool(PoolId, Pools) ->
    find_pool(PoolId, Pools, []).

find_pool(_, [], _) -> undefined;
find_pool(PoolId,
          [#pool{pool_id = PoolId} = Pool | Tail], OtherPools) ->
    {Pool, lists:append(OtherPools, Tail)};
find_pool(PoolId, [Pool | Tail], OtherPools) ->
    find_pool(PoolId, Tail, [Pool | OtherPools]).

lock_next_connection(State, Pool, OtherPools) ->
    case queue:out(Pool#pool.available) of
        {{value, Conn}, OtherConns} ->
            NewConn = Conn#emysql_connection{locked_at =
                                                 lists:nth(2,
                                                           tuple_to_list(now()))},
            Locked = gb_trees:enter(NewConn#emysql_connection.id,
                                    NewConn,
                                    Pool#pool.locked),
            State1 = State#state{pools =
                                     [Pool#pool{available = OtherConns,
                                                locked = Locked}
                                      | OtherPools]},
            {ok, Conn, State1};
        {empty, _} ->
            CurSize = queue:len(Pool#pool.available) +
                          gb_trees:size(Pool#pool.locked),
            MaxSize = Pool#pool.max_conn_num,
            case CurSize < MaxSize of
                true ->
                    statistics(wall_clock),
                    case catch emysql_conn:open_connection(Pool) of
                        NewConn when is_record(NewConn, emysql_connection) ->
                            NewConn1 = NewConn#emysql_connection{locked_at =
                                                                     lists:nth(2,
                                                                               tuple_to_list(now()))},
                            Locked =
                                gb_trees:enter(NewConn1#emysql_connection.id,
                                               NewConn1,
                                               Pool#pool.locked),
                            State1 = State#state{pools =
                                                     [Pool#pool{locked = Locked}
                                                      | OtherPools]},
                            {_, Time1} = statistics(wall_clock),
                            io:format("Open a new db conn, cost:~wms, total:~w~n",
                                      [Time1, CurSize + 1]),
                            {ok, NewConn, State1};
                        _ -> unavailable
                    end;
                false -> unavailable
            end
    end.

pass_on_or_queue_as_available(State, Connection) ->
    case find_pool(Connection#emysql_connection.pool_id,
                   State#state.pools)
        of
        {Pool, OtherPools} ->
            Waiting = Pool#pool.waiting,
            case queue:is_empty(Waiting) of
                true ->
                    case gb_trees:lookup(Connection#emysql_connection.id,
                                         Pool#pool.locked)
                        of
                        {value, Conn} ->
                            Pool1 = Pool#pool{available =
                                                  queue:in(Conn#emysql_connection{locked_at
                                                                                      =
                                                                                      undefined},
                                                           Pool#pool.available),
                                              locked =
                                                  gb_trees:delete_any(Connection#emysql_connection.id,
                                                                      Pool#pool.locked)},
                            {ok, State#state{pools = [Pool1 | OtherPools]}};
                        none -> {{error, connection_not_found}, State}
                    end;
                false ->
                    {{value, Pid}, OtherWaiting} = queue:out(Waiting),
                    PoolNow = Pool#pool{waiting = OtherWaiting},
                    StateNow = State#state{pools = [PoolNow | OtherPools]},
                    erlang:send(Pid, {connection, Connection}),
                    {ok, StateNow}
            end;
        undefined -> {{error, pool_not_found}, State}
    end.

lock_timeout() -> emysql_app:lock_timeout().

receive_connection_not_waiting() ->
    receive
        {connection, Connection} -> Connection
        after lock_timeout() ->
                  exit(connection_lock_second_timeout)
    end.

check_pools(Pools) -> check_pools(Pools, []).

check_pools([], NewPools) -> NewPools;
check_pools([Pool = #pool{pool_id = _Id,
                          min_conn_num = Min, available = Available,
                          locked = Locked, waiting = Waiting}
             | T],
            NewPools) ->
    case queue:len(Waiting) > 0 of
        true -> check_pools(T, [Pool | NewPools]);
        false ->
            UsingNum = gb_trees:size(Locked),
            AvailableNum = queue:len(Available),
            RetrieveNum = AvailableNum - Min,
            case UsingNum < Min andalso RetrieveNum > 0 of
                true ->
                    {NewQueue, RetrievedQueue} = queue:split(Min,
                                                             Available),
                    NewPool = Pool#pool{available = NewQueue},
                    release_conns(queue:to_list(RetrievedQueue)),
                    io:format("retrieve db pool[ID=~w] conn:~w~n",
                              [_Id, RetrieveNum]),
                    check_pools(T, [NewPool | NewPools]);
                false -> check_pools(T, [Pool | NewPools])
            end
    end.

release_conns([]) -> ok;
release_conns([Conn | T]) ->
    emysql_conn:close_connection(Conn),
    release_conns(T).

