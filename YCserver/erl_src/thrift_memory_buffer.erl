-file("src/lib/thrift/thrift_memory_buffer.erl", 1).

-module(thrift_memory_buffer).

-behaviour(thrift_transport).

-export([new/0, new/1]).

-export([read/2, write/2, flush/1, close/1]).

-export([new_transport_factory/0]).

new() -> thrift_membuffer_transport:new().

new(State) -> thrift_membuffer_transport:new(State).

new_transport_factory() -> {ok, fun () -> new() end}.

write(State, Data) ->
    thrift_membuffer_transport:write(State, Data).

read(State, Data) ->
    thrift_membuffer_transport:read(State, Data).

flush(State) -> thrift_membuffer_transport:flush(State).

close(State) -> thrift_membuffer_transport:close(State).

