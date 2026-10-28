-file("src/lib/thrift/thrift_base64_transport.erl", 1).

-module(thrift_base64_transport).

-behaviour(thrift_transport).

-export([new/1, new_transport_factory/1]).

-export([write/2, read/2, flush/1, close/1]).

-record(b64_transport, {wrapped}).

-type state() :: #b64_transport{}.

-file("inc/thrift_transport_behaviour.hrl", 1).

-spec write(state(), iolist() | binary()) -> {state(),
                                              ok | {error, _Reason}}.

-spec read(state(), non_neg_integer()) -> {state(),
                                           {ok, binary()} | {error, _Reason}}.

-spec flush(state()) -> {state(),
                         ok | {error, _Reason}}.

-spec close(state()) -> {state(),
                         ok | {error, _Reason}}.

-file("src/lib/thrift/thrift_base64_transport.erl", 34).

new(Wrapped) ->
    State = #b64_transport{wrapped = Wrapped},
    thrift_transport:new(thrift_base64_transport, State).

write(This = #b64_transport{wrapped = Wrapped}, Data) ->
    {NewWrapped, Result} = thrift_transport:write(Wrapped,
                                                  base64:encode(iolist_to_binary(Data))),
    {This#b64_transport{wrapped = NewWrapped}, Result}.

read(This = #b64_transport{}, _Data) ->
    {This, {error, no_reads_allowed}}.

flush(This = #b64_transport{wrapped = Wrapped0}) ->
    {Wrapped1, ok} = thrift_transport:write(Wrapped0,
                                            <<"\n">>),
    {Wrapped2, ok} = thrift_transport:flush(Wrapped1),
    {This#b64_transport{wrapped = Wrapped2}, ok}.

close(This0) ->
    {This1 = #b64_transport{wrapped = Wrapped}, ok} =
        flush(This0),
    {NewWrapped, ok} = thrift_transport:close(Wrapped),
    {This1#b64_transport{wrapped = NewWrapped}, ok}.

new_transport_factory(WrapFactory) ->
    F = fun () ->
                {ok, Wrapped} = WrapFactory(),
                new(Wrapped)
        end,
    {ok, F}.

