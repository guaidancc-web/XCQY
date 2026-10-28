-file("src/lib/thrift/thrift_membuffer_transport.erl",
      1).

-module(thrift_membuffer_transport).

-behaviour(thrift_transport).

-export([new/0, new/1]).

-export([read/2,
         read_exact/2,
         write/2,
         flush/1,
         close/1]).

-record(t_membuffer, {buffer = []}).

-type state() :: #t_membuffer{}.

-spec new() -> thrift_transport:t_transport().

new() -> new([]).

-spec new(Buf ::
              iodata()) -> thrift_transport:t_transport().

new(Buf) when is_list(Buf) ->
    State = #t_membuffer{buffer = Buf},
    thrift_transport:new(thrift_membuffer_transport, State);
new(Buf) when is_binary(Buf) ->
    State = #t_membuffer{buffer = [Buf]},
    thrift_transport:new(thrift_membuffer_transport, State).

-file("inc/thrift_transport_behaviour.hrl", 1).

-spec write(state(), iolist() | binary()) -> {state(),
                                              ok | {error, _Reason}}.

-spec read(state(), non_neg_integer()) -> {state(),
                                           {ok, binary()} | {error, _Reason}}.

-spec flush(state()) -> {state(),
                         ok | {error, _Reason}}.

-spec close(state()) -> {state(),
                         ok | {error, _Reason}}.

-file("src/lib/thrift/thrift_membuffer_transport.erl",
      52).

read(State = #t_membuffer{buffer = Buf}, Len)
    when is_integer(Len), Len >= 0 ->
    Binary = iolist_to_binary(Buf),
    Give = min(iolist_size(Binary), Len),
    {Result, Remaining} = split_binary(Binary, Give),
    {State#t_membuffer{buffer = Remaining}, {ok, Result}}.

read_exact(State = #t_membuffer{buffer = Buf}, Len)
    when is_integer(Len), Len >= 0 ->
    Binary = iolist_to_binary(Buf),
    case iolist_size(Binary) of
        X when X >= Len ->
            {Result, Remaining} = split_binary(Binary, Len),
            {State#t_membuffer{buffer = Remaining}, {ok, Result}};
        _ -> {State, {error, eof}}
    end.

write(State = #t_membuffer{buffer = Buf}, Data)
    when is_list(Data); is_binary(Data) ->
    {State#t_membuffer{buffer = [Buf, Data]}, ok}.

flush(State) -> {State, ok}.

close(State) -> {State, ok}.

