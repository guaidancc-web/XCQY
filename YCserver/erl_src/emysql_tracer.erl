-file("src/lib/emysql/emysql_tracer.erl", 1).

-module(emysql_tracer).

-export([trace_module/1]).

-compile(export_all).

trace_module(Fun) ->
    spawn(fun () -> trace_module1(Fun) end).

trace_module1(Fun) ->
    Modules = [emysql] ++
                  [emysql_auth] ++
                      [emysql_conn] ++
                          [emysql_conn_mgr] ++ [emysql_statements] ++ [],
    [erlang:trace_pattern({Mod, '_', '_'},
                          [{'_', [], [{return_trace}]}],
                          [local])
     || Mod <- Modules],
    S = self(),
    Pid = spawn(fun () -> do_trace(S, Fun) end),
    erlang:trace(all, true, [call, procs, exiting]),
    Pid ! {self(), start},
    trace_loop().

do_trace(Parent, Fun) ->
    receive {Parent, start} -> Fun() end.

trace_loop() ->
    receive
        _Other ->
            io:format("~p~n", [_Other]),
            trace_loop()
    end.

