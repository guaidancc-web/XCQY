-file("src/log/log_sup.erl", 1).

-module(log_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

start_link() ->
    supervisor:start_link({local, log_sup}, log_sup, []).

init(_Arg) -> {ok, {{one_for_one, 50, 1}, []}}.

