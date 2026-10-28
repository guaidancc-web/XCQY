-file("src/lib/thrift/thrift_buffered_transport.erl",
      1).

-module(thrift_buffered_transport).

-behaviour(thrift_transport).

-export([new/1]).

-export([read/2,
         read_exact/2,
         write/2,
         flush/1,
         close/1]).

-export([new_transport_factory/1]).

-record(t_buffered, {wrapped, write_buffer}).

-type state() :: #t_buffered{}.

-spec new(Transport ::
              thrift_transport:t_transport()) -> thrift_transport:t_transport().

new(Wrapped) ->
    State = #t_buffered{wrapped = Wrapped,
                        write_buffer = []},
    thrift_transport:new(thrift_buffered_transport, State).

-file("inc/thrift_transport_behaviour.hrl", 1).

-spec write(state(), iolist() | binary()) -> {state(),
                                              ok | {error, _Reason}}.

-spec read(state(), non_neg_integer()) -> {state(),
                                           {ok, binary()} | {error, _Reason}}.

-spec flush(state()) -> {state(),
                         ok | {error, _Reason}}.

-spec close(state()) -> {state(),
                         ok | {error, _Reason}}.

-file("src/lib/thrift/thrift_buffered_transport.erl",
      52).

read(State = #t_buffered{wrapped = Wrapped}, Len)
    when is_integer(Len), Len >= 0 ->
    {NewState, Response} = thrift_transport:read(Wrapped,
                                                 Len),
    {State#t_buffered{wrapped = NewState}, Response}.

read_exact(State = #t_buffered{wrapped = Wrapped}, Len)
    when is_integer(Len), Len >= 0 ->
    {NewState, Response} =
        thrift_transport:read_exact(Wrapped, Len),
    {State#t_buffered{wrapped = NewState}, Response}.

write(State = #t_buffered{write_buffer = Buffer},
      Data) ->
    {State#t_buffered{write_buffer = [Buffer, Data]}, ok}.

flush(State = #t_buffered{wrapped = Wrapped,
                          write_buffer = Buffer}) ->
    case iolist_size(Buffer) of
        0 -> {State, ok};
        _ ->
            {Written, Response} = thrift_transport:write(Wrapped,
                                                         Buffer),
            {Flushed, ok} = thrift_transport:flush(Written),
            {State#t_buffered{wrapped = Flushed, write_buffer = []},
             Response}
    end.

close(State = #t_buffered{wrapped = Wrapped}) ->
    {Closed, Result} = thrift_transport:close(Wrapped),
    {State#t_buffered{wrapped = Closed}, Result}.

new_transport_factory(WrapFactory) ->
    F = fun () ->
                {ok, Wrapped} = WrapFactory(),
                new(Wrapped)
        end,
    {ok, F}.

