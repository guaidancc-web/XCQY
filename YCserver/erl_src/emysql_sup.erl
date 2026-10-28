-file("src/lib/emysql/emysql_sup.erl", 1).

-module(emysql_sup).

-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({local, emysql_sup},
                          emysql_sup,
                          []).

init(_) ->
    {ok,
     {{one_for_one, 10, 10},
      [{emysql_statements,
        {emysql_statements, start_link, []},
        permanent,
        5000,
        worker,
        [emysql_statements]},
       {emysql_conn_mgr,
        {emysql_conn_mgr, start_link, []},
        permanent,
        5000,
        worker,
        [emysql_conn_mgr]}]}}.

