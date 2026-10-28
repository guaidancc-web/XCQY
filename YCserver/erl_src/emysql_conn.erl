-file("src/lib/emysql/emysql_conn.erl", 1).

-module(emysql_conn).

-export([set_database/2,
         set_encoding/2,
         execute/3,
         prepare/3,
         unprepare/2,
         open_connections/1,
         open_connection/1,
         reset_connection/3,
         close_connection/1,
         open_n_connections/2,
         hstate/1]).

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

-file("src/lib/emysql/emysql_conn.erl", 37).

set_database(_, undefined) -> ok;
set_database(_, Empty)
    when Empty == ""; Empty == <<>> ->
    ok;
set_database(Connection, Database) ->
    Packet = <<3, "use `",
               (iolist_to_binary(Database))/binary, "`">>,
    emysql_tcp:send_and_recv_packet(Connection#emysql_connection.socket,
                                    Packet,
                                    0).

set_encoding(Connection, Encoding) ->
    Packet = <<3, "set names '",
               (erlang:atom_to_binary(Encoding, utf8))/binary, "'">>,
    emysql_tcp:send_and_recv_packet(Connection#emysql_connection.socket,
                                    Packet,
                                    0).

execute(Connection, Query, []) when is_list(Query) ->
    Packet = <<3,
               (emysql_util:to_binary(Query,
                                      Connection#emysql_connection.encoding))/binary>>,
    emysql_tcp:send_and_recv_packet(Connection#emysql_connection.socket,
                                    Packet,
                                    0);
execute(Connection, Query, []) when is_binary(Query) ->
    Packet = <<3, Query/binary>>,
    emysql_tcp:send_and_recv_packet(Connection#emysql_connection.socket,
                                    Packet,
                                    0);
execute(Connection, StmtName, [])
    when is_atom(StmtName) ->
    prepare_statement(Connection, StmtName),
    StmtNameBin = atom_to_binary(StmtName, utf8),
    Packet = <<3, "EXECUTE ", StmtNameBin/binary>>,
    emysql_tcp:send_and_recv_packet(Connection#emysql_connection.socket,
                                    Packet,
                                    0);
execute(Connection, Query, Args)
    when (is_list(Query) orelse is_binary(Query)) andalso
             is_list(Args) ->
    StmtName = "stmt_" ++
                   integer_to_list(erlang:phash2(Query)),
    ok = prepare(Connection, StmtName, Query),
    Ret = case set_params(Connection, 1, Args, undefined) of
              OK when is_record(OK, ok_packet) ->
                  ParamNamesBin = list_to_binary(string:join([[$@
                                                               | integer_to_list(I)]
                                                              || I
                                                                     <- lists:seq(1,
                                                                                  length(Args))],
                                                             ", ")),
                  Packet = <<3, "EXECUTE ",
                             (list_to_binary(StmtName))/binary, " USING ",
                             ParamNamesBin/binary>>,
                  emysql_tcp:send_and_recv_packet(Connection#emysql_connection.socket,
                                                  Packet,
                                                  0);
              Error -> Error
          end,
    unprepare(Connection, StmtName),
    Ret;
execute(Connection, StmtName, Args)
    when is_atom(StmtName), is_list(Args) ->
    prepare_statement(Connection, StmtName),
    case set_params(Connection, 1, Args, undefined) of
        OK when is_record(OK, ok_packet) ->
            ParamNamesBin = list_to_binary(string:join([[$@
                                                         | integer_to_list(I)]
                                                        || I
                                                               <- lists:seq(1,
                                                                            length(Args))],
                                                       ", ")),
            StmtNameBin = atom_to_binary(StmtName, utf8),
            Packet = <<3, "EXECUTE ", StmtNameBin/binary, " USING ",
                       ParamNamesBin/binary>>,
            emysql_tcp:send_and_recv_packet(Connection#emysql_connection.socket,
                                            Packet,
                                            0);
        Error -> Error
    end.

prepare(Connection, Name, Statement)
    when is_atom(Name) ->
    prepare(Connection, atom_to_list(Name), Statement);
prepare(Connection, Name, Statement) ->
    StatementBin = emysql_util:encode(Statement,
                                      binary,
                                      Connection#emysql_connection.encoding),
    Packet = <<3, "PREPARE ", (list_to_binary(Name))/binary,
               " FROM ", StatementBin/binary>>,
    case
        emysql_tcp:send_and_recv_packet(Connection#emysql_connection.socket,
                                        Packet,
                                        0)
        of
        OK when is_record(OK, ok_packet) -> ok;
        Err when is_record(Err, error_packet) ->
            exit({failed_to_prepare_statement,
                  Err#error_packet.msg})
    end.

unprepare(Connection, Name) when is_atom(Name) ->
    unprepare(Connection, atom_to_list(Name));
unprepare(Connection, Name) ->
    Packet = <<3, "DEALLOCATE PREPARE ",
               (list_to_binary(Name))/binary>>,
    emysql_tcp:send_and_recv_packet(Connection#emysql_connection.socket,
                                    Packet,
                                    0).

open_n_connections(PoolId, N) ->
    case emysql_conn_mgr:find_pool(PoolId,
                                   emysql_conn_mgr:pools())
        of
        {Pool, _} ->
            lists:foldl(fun (_, Connections) ->
                                case catch open_connection(Pool) of
                                    #emysql_connection{} = Connection ->
                                        [Connection | Connections];
                                    _ -> Connections
                                end
                        end,
                        [],
                        lists:seq(1, N));
        _ -> exit(pool_not_found)
    end.

open_connections(Pool) ->
    case queue:len(Pool#pool.available) +
             gb_trees:size(Pool#pool.locked)
             < Pool#pool.min_conn_num
        of
        true ->
            Conn = emysql_conn:open_connection(Pool),
            open_connections(Pool#pool{available =
                                           queue:in(Conn,
                                                    Pool#pool.available)});
        false -> Pool
    end.

open_connection(#pool{pool_id = PoolId, host = Host,
                      port = Port, user = User, password = Password,
                      database = Database, encoding = Encoding}) ->
    case gen_tcp:connect(Host,
                         Port,
                         [binary, {packet, raw}, {active, false}])
        of
        {ok, Sock} ->
            Mgr = whereis(emysql_conn_mgr),
            Mgr /= undefined orelse
                exit({failed_to_find_conn_mgr,
                      "Failed to find conn mgr when opening "
                      "connection. Make sure crypto is started "
                      "and emysql.app is in the Erlang path."}),
            gen_tcp:controlling_process(Sock, Mgr),
            Greeting = emysql_auth:do_handshake(Sock,
                                                User,
                                                Password),
            Connection = #emysql_connection{id =
                                                erlang:port_to_list(Sock),
                                            pool_id = PoolId,
                                            encoding = Encoding, socket = Sock,
                                            version =
                                                Greeting#greeting.server_version,
                                            thread_id =
                                                Greeting#greeting.thread_id,
                                            caps = Greeting#greeting.caps,
                                            language =
                                                Greeting#greeting.language},
            case emysql_conn:set_database(Connection, Database) of
                ok -> ok;
                OK1 when is_record(OK1, ok_packet) -> ok;
                Err1 when is_record(Err1, error_packet) ->
                    catch gen_tcp:close(Sock),
                    exit({failed_to_set_database, Err1#error_packet.msg})
            end,
            case emysql_conn:set_encoding(Connection, Encoding) of
                OK2 when is_record(OK2, ok_packet) -> ok;
                Err2 when is_record(Err2, error_packet) ->
                    catch gen_tcp:close(Sock),
                    exit({failed_to_set_encoding, Err2#error_packet.msg})
            end,
            Connection;
        {error, Reason} ->
            exit({failed_to_connect_to_database, Reason});
        What -> exit({unknown_fail, What})
    end.

reset_connection(Pools, Conn, StayLocked) ->
    spawn(fun () -> close_connection(Conn) end),
    case
        emysql_conn_mgr:find_pool(Conn#emysql_connection.pool_id,
                                  Pools)
        of
        {Pool, _} ->
            case catch open_connection(Pool) of
                NewConn when is_record(NewConn, emysql_connection) ->
                    case StayLocked of
                        pass ->
                            emysql_conn_mgr:replace_connection_as_available(Conn,
                                                                            NewConn);
                        keep ->
                            emysql_conn_mgr:replace_connection_as_locked(Conn,
                                                                         NewConn)
                    end,
                    NewConn;
                Error ->
                    DeadConn = Conn#emysql_connection{alive = false},
                    emysql_conn_mgr:replace_connection_as_available(Conn,
                                                                    DeadConn),
                    {error, {cannot_reopen_in_reset, Error}}
            end;
        undefined -> exit(pool_not_found)
    end.

close_connection(Conn) ->
    [catch unprepare(Conn, Name)
     || Name
            <- emysql_statements:remove(Conn#emysql_connection.id)],
    gen_tcp:close(Conn#emysql_connection.socket),
    ok.

set_params(_, _, [], Result) -> Result;
set_params(_, _, _, Error)
    when is_record(Error, error_packet) ->
    Error;
set_params(Connection, Num, Values, _) ->
    Packet = set_params_packet(Num,
                               Values,
                               Connection#emysql_connection.encoding),
    emysql_tcp:send_and_recv_packet(Connection#emysql_connection.socket,
                                    Packet,
                                    0).

set_params_packet(NumStart, Values, Encoding) ->
    BinValues = [emysql_util:encode(Val, binary, Encoding)
                 || Val <- Values],
    BinNums = [emysql_util:encode(Num, binary, Encoding)
               || Num
                      <- lists:seq(NumStart, NumStart + length(Values) - 1)],
    BinPairs = lists:zip(BinNums, BinValues),
    Parts = [<<"@", NumBin/binary, "=", ValBin/binary>>
             || {NumBin, ValBin} <- BinPairs],
    Sets = list_to_binary(join(Parts, <<",">>)),
    <<3, "SET ", Sets/binary>>.

join([], _Sep) -> [];
join(L, Sep) -> join(L, Sep, []).

join([H], _Sep, Acc) -> lists:reverse([H | Acc]);
join([H | T], Sep, Acc) -> join(T, Sep, [Sep, H | Acc]).

prepare_statement(Connection, StmtName) ->
    case emysql_statements:fetch(StmtName) of
        undefined -> exit(statement_has_not_been_prepared);
        {Version, Statement} ->
            case
                emysql_statements:version(Connection#emysql_connection.id,
                                          StmtName)
                of
                Version -> ok;
                _ ->
                    ok = prepare(Connection, StmtName, Statement),
                    emysql_statements:prepare(Connection#emysql_connection.id,
                                              StmtName,
                                              Version)
            end
    end.

hstate(State) ->
    case State band 2 of
        0 -> "";
        _ -> "AUTOCOMMIT "
    end
        ++
        case State band 8 of
            0 -> "";
            _ -> "MORE_RESULTS_EXIST "
        end
            ++
            case State band 32 of
                0 -> "";
                _ -> "NO_INDEX_USED "
            end.

