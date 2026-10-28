-file("src/lib/emysql/emysql.erl", 1).

-module(emysql).

-export([start/0,
         stop/0,
         add_pool/9,
         remove_pool/1,
         increment_pool_size/2,
         decrement_pool_size/2,
         prepare/2,
         execute/2,
         execute/3,
         execute/4,
         execute/5,
         default_timeout/0,
         modules/0]).

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

-file("src/lib/emysql/emysql.erl", 108).

start() -> application:start(emysql).

stop() -> application:stop(emysql).

modules() -> emysql_app:modules().

default_timeout() -> emysql_app:default_timeout().

add_pool(PoolId, SizeMin, SizeMax, User, Password, Host,
         Port, Database, Encoding) ->
    Pool = #pool{pool_id = PoolId, user = User,
                 password = Password, host = Host, port = Port,
                 database = Database, encoding = Encoding,
                 max_conn_num = SizeMax, min_conn_num = SizeMin},
    Pool1 = emysql_conn:open_connections(Pool),
    emysql_conn_mgr:add_pool(Pool1).

remove_pool(PoolId) ->
    Pool = emysql_conn_mgr:remove_pool(PoolId),
    [emysql_conn:close_connection(Conn)
     || Conn
            <- lists:append(queue:to_list(Pool#pool.available),
                            gb_trees:values(Pool#pool.locked))],
    ok.

increment_pool_size(PoolId, Num) when is_integer(Num) ->
    Conns = emysql_conn:open_n_connections(PoolId, Num),
    emysql_conn_mgr:add_connections(PoolId, Conns).

decrement_pool_size(PoolId, Num) when is_integer(Num) ->
    Conns = emysql_conn_mgr:remove_connections(PoolId, Num),
    [emysql_conn:close_connection(Conn) || Conn <- Conns],
    ok.

prepare(StmtName, Statement)
    when is_atom(StmtName) andalso
             (is_list(Statement) orelse is_binary(Statement)) ->
    emysql_statements:add(StmtName, Statement).

execute(PoolId, Query)
    when is_list(Query) orelse is_binary(Query) ->
    execute(PoolId, Query, []);
execute(PoolId, StmtName) when is_atom(StmtName) ->
    execute(PoolId, StmtName, []).

execute(PoolId, Query, Args)
    when (is_list(Query) orelse is_binary(Query)) andalso
             is_list(Args) ->
    execute(PoolId, Query, Args, default_timeout());
execute(PoolId, StmtName, Args)
    when is_atom(StmtName), is_list(Args) ->
    execute(PoolId, StmtName, Args, default_timeout());
execute(PoolId, Query, Timeout)
    when (is_list(Query) orelse is_binary(Query)) andalso
             is_integer(Timeout) ->
    execute(PoolId, Query, [], Timeout);
execute(PoolId, StmtName, Timeout)
    when is_atom(StmtName), is_integer(Timeout) ->
    execute(PoolId, StmtName, [], Timeout).

execute(PoolId, Query, Args, Timeout)
    when (is_list(Query) orelse is_binary(Query)) andalso
             is_list(Args) andalso is_integer(Timeout) ->
    Connection =
        emysql_conn_mgr:wait_for_connection(PoolId),
    monitor_work(Connection,
                 Timeout,
                 {emysql_conn, execute, [Connection, Query, Args]});
execute(PoolId, StmtName, Args, Timeout)
    when is_atom(StmtName),
         is_list(Args) andalso is_integer(Timeout) ->
    Connection =
        emysql_conn_mgr:wait_for_connection(PoolId),
    monitor_work(Connection,
                 Timeout,
                 {emysql_conn, execute, [Connection, StmtName, Args]}).

execute(PoolId, Query, Args, Timeout, nonblocking)
    when (is_list(Query) orelse is_binary(Query)) andalso
             is_list(Args) andalso is_integer(Timeout) ->
    case emysql_conn_mgr:lock_connection(PoolId) of
        Connection
            when is_record(Connection, emysql_connection) ->
            monitor_work(Connection,
                         Timeout,
                         {emysql_conn, execute, [Connection, Query, Args]});
        Other -> Other
    end;
execute(PoolId, StmtName, Args, Timeout, nonblocking)
    when is_atom(StmtName),
         is_list(Args) andalso is_integer(Timeout) ->
    case emysql_conn_mgr:lock_connection(PoolId) of
        Connection
            when is_record(Connection, emysql_connection) ->
            monitor_work(Connection,
                         Timeout,
                         {emysql_conn, execute, [Connection, StmtName, Args]});
        Other -> Other
    end.

monitor_work(Connection, Timeout, {M, F, A})
    when is_record(Connection, emysql_connection) ->
    Parent = self(),
    Pid = spawn(fun () ->
                        receive start -> Parent ! {self(), apply(M, F, A)} end
                end),
    Mref = erlang:monitor(process, Pid),
    Pid ! start,
    receive
        {'DOWN', Mref, process, Pid, {_, closed}} ->
            case
                emysql_conn:reset_connection(emysql_conn_mgr:pools(),
                                             Connection,
                                             keep)
                of
                NewConnection
                    when is_record(NewConnection, emysql_connection) ->
                    [_OldConn | RestArgs] = A,
                    NewA = [NewConnection | RestArgs],
                    monitor_work(NewConnection, Timeout, {M, F, NewA});
                {error, FailedReset} ->
                    exit({connection_down,
                          {and_conn_reset_failed, FailedReset}})
            end;
        {'DOWN', Mref, process, Pid, Reason} ->
            case
                emysql_conn:reset_connection(emysql_conn_mgr:pools(),
                                             Connection,
                                             pass)
                of
                {error, FailedReset} ->
                    exit({Reason, {and_conn_reset_failed, FailedReset}});
                _ -> exit({Reason, {}})
            end;
        {Pid, Result} ->
            erlang:demonitor(Mref, [flush]),
            emysql_conn_mgr:pass_connection(Connection),
            Result
        after Timeout ->
                  erlang:demonitor(Mref),
                  case
                      emysql_conn:reset_connection(emysql_conn_mgr:pools(),
                                                   Connection,
                                                   pass)
                      of
                      {error, FailedReset} ->
                          exit({mysql_timeout,
                                Timeout,
                                {and_conn_reset_failed, FailedReset}});
                      _ -> exit({mysql_timeout, Timeout, {}})
                  end
    end.

