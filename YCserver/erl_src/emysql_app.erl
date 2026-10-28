-file("src/lib/emysql/emysql_app.erl", 1).

-module(emysql_app).

-behaviour(application).

-export([start/2,
         stop/1,
         modules/0,
         default_timeout/0,
         lock_timeout/0,
         pools/0]).

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

-file("src/lib/emysql/emysql_app.erl", 31).

start(_Type, _StartArgs) -> emysql_sup:start_link().

stop(_State) ->
    lists:foreach(fun (Pool) ->
                          lists:foreach(fun emysql_conn:close_connection/1,
                                        lists:append(queue:to_list(Pool#pool.available),
                                                     gb_trees:values(Pool#pool.locked)))
                  end,
                  emysql_conn_mgr:pools()),
    ok.

modules() ->
    {ok, Modules} = application_controller:get_key(emysql,
                                                   modules),
    Modules.

default_timeout() ->
    case application:get_env(emysql, default_timeout) of
        undefined -> 8000;
        {ok, Timeout} -> Timeout
    end.

lock_timeout() ->
    case application:get_env(emysql, lock_timeout) of
        undefined -> 5000;
        {ok, Timeout} -> Timeout
    end.

pools() ->
    case application:get_env(emysql, pools) of
        {ok, Pools} when is_list(Pools) -> Pools;
        _ -> []
    end.

